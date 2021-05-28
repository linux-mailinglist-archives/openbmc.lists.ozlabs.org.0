Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4510E394911
	for <lists+openbmc@lfdr.de>; Sat, 29 May 2021 01:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsL7q5rY1z3002
	for <lists+openbmc@lfdr.de>; Sat, 29 May 2021 09:12:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=TA1sOkt+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=TA1sOkt+; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FsL7W53m3z2xZS
 for <openbmc@lists.ozlabs.org>; Sat, 29 May 2021 09:12:39 +1000 (AEST)
Received: by linux.microsoft.com (Postfix, from userid 1046)
 id 45B1820B7188; Fri, 28 May 2021 16:12:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 45B1820B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1622243556;
 bh=QpTKu1QAeXrFLPTcCUYkWE/7BF6xObw+a3VvTQDlRy4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TA1sOkt+vu4rgeRFHYcmr54rMMMmLNyeuPKzNbvGK79xfz04URA29By2fPtvhOzyJ
 0tEN8jhLMdP8/9rIpy0N0NroZVrxCbf/j95NW8FEnCIC9afwBcqep1S7AVbEZKAXvG
 eLr1gVNhtzBidIwZlPmJM5gmkR6pSyVVoj15ETtM=
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: Andrew Jeffery <andrew@aj.id.au>, sainath grandhi <saiallforums@gmail.com>,
 openbmc@lists.ozlabs.org
Subject: Re: Using VFIO vs. developing a kernel module
Date: Fri, 28 May 2021 16:12:36 -0700
Message-Id: <1622243556-26190-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <95b58f69-d706-4388-8056-7d8b058ace06@www.fastmail.com>
References: <95b58f69-d706-4388-8056-7d8b058ace06@www.fastmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 28 May 2021, Andrew Jeffery wrote:
>
> On Thu, 27 May 2021, at 22:53, sainath grandhi wrote:
>> Hello,
>> Our project has an FPGA connected to BMC as a PCIe endpoint. This
>> endpoint provides a set of registers via MMIO and an interrupt for
>> notifying completion of work. This endpoint also implements AER
>> capability.
>>
>> We have two options to enable this endpoint.
>> 1) Write a new kernel module with a character device interface for
>> user-space interaction.
>> 2) Use VFIO infrastructure provided by Linux and write an user-space
>> application.
>>
>> I am reaching out to the community to check if there is any
>> recommended option, using VFIO vs. implementing a new kernel module,
>> or any previous experiences weighing in one option over the other.
>
> I don't have any experience with VFIO, so take this with a grain of salt.
>
> Generally you should write an in-kernel driver for it. The reason you
> might not want to do so is if the device's register interface changes
> frequently, as it's more pain to update the kernel than some userspace
> application, which slows iteration. But handling DMAs and interrupts
> make userspace more painful, so unless VFIO helps there (I assume it
> does), then that would push the implementation back towards the kernel.

VFIO requires IOMMU to protect kernel memory corruption by device DMA,
which is programmed by (untrusted) userspace app. Unless the BMC SoC
implements IOMMU (SMMU) for I/O virtualization (I/O page tables), it
would not be possible/safe to use VFIO for DMA/interrupts.

See https://www.kernel.org/doc/Documentation/vfio.txt

If you just want to program MMIO registers, you could mmap() PCIe sysfs
resource files that represent MMIO bars and let application write and
read registers, including polling for completion.

See https://www.kernel.org/doc/Documentation/PCI/sysfs-pci.rst

If none of these options are viable, then a custom kernel driver would
be necessary.

Regards,
Dhananjay
