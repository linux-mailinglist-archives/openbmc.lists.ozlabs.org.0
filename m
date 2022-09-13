Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6746F5B7B54
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 21:35:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRtw443kfz3bc3
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 05:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=J6yyXrRU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=J6yyXrRU;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRtvd31Wkz2y2F
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 05:34:37 +1000 (AEST)
Received: from [192.168.87.140] (unknown [50.35.69.86])
	by linux.microsoft.com (Postfix) with ESMTPSA id 07E50204A5AA;
	Tue, 13 Sep 2022 12:34:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 07E50204A5AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1663097644;
	bh=fKjZnUSneqt9YETGvTCVYkz60NMw85shEJVCFMxyArw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J6yyXrRUnJ6IXnDfU2qZTVJnZfBjnMW36nKihKYYo7HdPMd//kLWA/qmUXTHNzaTO
	 nHif48UM10Ug14UyTyrrUGkBW1OfL8sIK2gBlvdw6mfhEvLa18y1pgJrI1BtZ1vWFD
	 YarLBDrH7+EwBVF2iN2chLoSpkE8I09Y7oLn0eAw=
Message-ID: <03ad3fe7-af48-05ce-6846-be0e92735030@linux.microsoft.com>
Date: Tue, 13 Sep 2022 12:34:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: OpenBMC Boot time improvements
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <edtanous@google.com>
References: <CAH2-KxCPOjWm8KeLFJTa7ZdTD-yZ5Bit_Ua3Hb=0X+O+89t3+w@mail.gmail.com>
 <Yx+rDhB4v8qDkGrU@heinlein.stwcx.org.github.beta.tailscale.net>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <Yx+rDhB4v8qDkGrU@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/12/2022 2:56 PM, Patrick Williams wrote:
 > On Mon, Sep 12, 2022 at 01:32:19PM -0700, Ed Tanous wrote:
 >
 >> Decompressing the dtb, initramfs, and kernel images is seconds 5-14.  If
 >> there's a way to optimize that better that u-bmc has implemented 
ahead of
 >> us, that seems like an area for improvement that we could pull in.
 >
 > I switched some systems to use zstd instead of xz.  I'm not sure if that
 > was done as a default or not, but it is significantly faster for
 > decompression.

 > Kernel starts at ~20 seconds, then 3.5 seconds of dead air... not sure
 > what's going on there.

Uhh, no. There's no decompression in u-boot, and kernel doesn't even
start until 19s. Much of the time is spent by u-boot in loading FIT
from flash.

-- 
[5.043504 0.000782]      Type:         Kernel Image
[5.044270 0.000766]      Compression:  uncompressed

[11.636475 0.000980]      Type:         RAMDisk Image
[11.637248 0.000773]      Compression:  uncompressed

[19.914196 0.000063] Starting kernel ...
-- 

While enabling compression in FIT image can reduce flash read time, 
based on my experimentation arm32 doesn't do well with decompression so 
that time is somewhat compensated.

Further,

(1) Don't know what u-boot code you're running, but if you have
following patch series included, I hoped spi-mem might work better
by using spi-mem, where Aspeed's SPI controller's command mode
implicitly generates command and address based and CPU accesses,
instead of driver.

https://lore.kernel.org/u-boot/20220819090115.1854805-1-chin-ting_kuo@aspeedtech.com/


---
[13.909357 2.254427] ## Loading fdt from FIT Image at 20080000 ...
---

(2) I found that libfdt in u-boot (loading FIT) and crypto lib don't
perform well while booting directly from flash. I've a proposal which
I'll send patch for is to do read out FIT image into RAM and then
run bootm on mem address.

In fact, there's infra in upstream u-boot [see
cmd/disk.c:common_diskboot()] that reads FIT header to determine total
size and reads that to memory.

 > First serial line printed to u-boot "hit any key" startup init is 3
 > seconds
 > 3 seconds of countdown for "hit any key to stop autoboot".  I'm sure
 > u-boot has a way to disable that, so there's 3 seconds right there.

Default should be to allow shell for debug, while prod builds can turn
it off just like gbmc already does?

meta-google/conf/distro/gbmc.conf,
- meta-phosphor/recipes-bsp/u-boot/u-boot-obmc.inc
   - meta-phosphor/recipes-bsp/u-boot/files/disable-u-boot-shell.cfg
     -> CONFIG_BOOTDELAY=-2


I've some more thoughts on boot optimization, will post some changes.

Regards,
Dhananjay
