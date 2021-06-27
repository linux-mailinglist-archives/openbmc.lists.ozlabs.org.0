Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FFA3B54AE
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 20:45:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCfnQ2PtNz300b
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 04:45:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=mBDYFroM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=mBDYFroM; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCfn60rmbz2yjD
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 04:45:13 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C06A3412E5;
 Sun, 27 Jun 2021 18:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1624819509; x=1626633910; bh=s1n
 BjTU6IQdx+X0Qcg+a8fZSA0vXXcbUE9kIMpIMJZ4=; b=mBDYFroMmHMUmujyIJv
 E/DSisAVZlwp7c5V0Wr9atttQmnubJITPLF5oBCRTwT76WWAQGU3zqYu3b9Lm2Q/
 q8iygjIquEb82sIjKELAYWa5wpJfys4HC1L891eoRsc+PJ/ei1GIEiH6E/DSlo9D
 n0WOF0wts9ex9ebf11+Hb9O4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2syrLECS6wT; Sun, 27 Jun 2021 21:45:09 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B2AB841273;
 Sun, 27 Jun 2021 21:45:08 +0300 (MSK)
Received: from [10.199.0.27] (10.199.0.27) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 21:45:08 +0300
Subject: Re: [PATCH 3/6] fms: Add TOC/PMA/ATIP DVD-ROM capabilities
To: Alan Stern <stern@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-4-i.kononenko@yadro.com>
 <20210627142952.GE624763@rowland.harvard.edu>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <3f9c6e4a-18b7-db11-8b23-f0473a649d06@yadro.com>
Date: Sun, 27 Jun 2021 21:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627142952.GE624763@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.27]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 27.06.2021 17:29, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 12:18:16AM +0300, Igor Kononenko wrote:
>> The DVD-ROM required the SCSI 6.25 READ TOC/PMA/ATIP Command formats:
>>  * Response Format 0000b: Formatted TOC
>>  * Response Format 0001b: Multi-session Information
>> (MMC-6 Specification).
>>
>> This patch adds an implementation of that described above formats.
> 
> I will sum up the last four patches of this series by saying that they
> add features for emulating DVD-ROM and BD devices.  Doing so increases
> the size of the f_mass_storage driver by a considerable amount and
> also adds a large amount of new material to Jens Axboe's
> include/uapi/linux/cdrom.h.

The `include/uapi/linux/cdrom.h` already includes the definition of the
MMC-(2/3) SCSI data structures, and I believe this uses in many cdrom-api
consumers. The current patchset extends this declaration with additional
structures set and clarifies each. Besides, the described above 
SCSI structures are used to implement a mass_storage SCSI-command handler 
to make implementation clearer and avoid the use of magic constants.

> 
> Is any of this really needed?  What usage scenarios require
> f_mass_storage to emulate a DVD-ROM that couldn't use f_tcm instead?

I can't see any impediments to supplement the already existing 
implementation of MMC-(2/3) specification of multimedia devices to 
represent the DVD/BD features. If the kernel presents the CD-ROM SCSI 
commands, why the mass_storage:usb-gadget-function still doesn't include
that for DVD/BD?

Many modern embedded systems (e.g., BMC, OpenBMC) implements their 
required features, e.g., Virtual Media Device, which is based on the 
usb:gadget:mass-storage. 
The purpose of that features is extensive, and their use the mass-storage
not only as a cdrom-device.

The required features of such systems might expect image back-end files
that size is significant than 2.1Gb, but such medium is not the CD-ROM 
device. USB-gadget consumers can incorrectly interpret such device by 
loading the wrong driver. I believe that should be the DVD-medium device,
at least. 

Additionally, please note the current patch also fixes the incorrect 
implementation of retrieving TOC/PMA/ATIP data, which is required for the 
CD-ROM. One system might correct works with retrieving first with the 
last session together, but for some systems, e.g., OS ESXi, OS Windows, 
should retrieving first and last border sessions in separate SCSI-request. 

> 
> Alan Stern
> 

-- 
Best regards,

Igor Kononenko
