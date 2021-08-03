Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC33DEF5F
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 15:53:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfGYD3J6Vz30B2
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 23:53:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=FcV+S4qI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=FcV+S4qI; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfGXy72dFz2ykR
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 23:53:06 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 372EE412D1
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1627998780; x=1629813181; bh=wNi
 lu3Uyc0VCy/AFWnvCrvJuMMbBMryIugS4P8c0DKY=; b=FcV+S4qI3yvKz9ODp4L
 yzBQ9jg2MmMhFRnQg5kKwXCSwdjDTlusPExs0m4g01U/274J16gE9xHE3qBtOqpt
 w/sst79DScQh2CzUttYHPhlVxwe3YZlpc349+/9wztLyaHu92xJ6i+TIzqgP4rCD
 eonT96XwUioNJqVSZD6+1qaA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZ03M3OBO8u1 for <openbmc@lists.ozlabs.org>;
 Tue,  3 Aug 2021 16:53:00 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9E129412C6
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 16:53:00 +0300 (MSK)
Received: from [10.199.0.39] (10.199.0.39) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 3 Aug
 2021 16:53:00 +0300
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
To: <openbmc@lists.ozlabs.org>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
Date: Tue, 3 Aug 2021 16:52:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <34751627996896@mail.yandex-team.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.39]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Hello Konstantin,

I have several patches [1] to solves mounting DVD-based ISOs through Virtual Media.
The published changes is WIP until had approved by the Linux Foundation community,
but in the YADRO, we use these changes to support installing the OS Windows via
Virtual Media.


I hope your will found it helpful that information to support installing Windows-based OS.

Links:
[1] - https://patchwork.kernel.org/project/linux-usb/list/?series=507583

On 03.08.2021 16:26, Konstantin Klubnichkin wrote:
> Hello Maciej,
> I've got a question regarding the instruction.
> It's about Option 2 (preparing image on Linux).
> The sequence in the instruction is:
> 1. Create empty image using dd;
> 2. Create partition table on it with FAT32 partition;
> 3. Format image to FAT32 filesystem;
> 4. Prepare files from Windows DVD;
> 5. Mount image to some directory;
> 6. Copy files to that directory;
> 7. Unmount image.
> I can't get why to create partition table on the image(step 2) if the next step 
> (formatting image with mkfs.vfat, step 3) destroys it?
> Could you please clarify this point?
> Thank you!
> 22.10.2020, 14:39, "Maciej Lawniczak" <maciej.lawniczak@linux.intel.com>:
> 
>     Mounting DVD-based ISOs in Intel-BMC Virtual Media is not supported by
>     underlying USB Mass Storage gadget. To mount such iso files they need to be
>     converted to MBR/FAT32 image. Attached instruction shows two ways of
>     preparing such image.
> 
>     On 10/21/2020 9:32 AM, Thaj wrote:
> 
>         Hi Alexander, I am also facing the same issue. Did you find any
>         workaround for this ?
>         On Mon, May 25, 2020 at 4:04 PM Alexander Amelkin <a.amelkin@yadro.com
>         <mailto:a.amelkin@yadro.com>> wrote:
> 
>             Hi all!
> 
>             We're trying to install Windows Server 2019 from an ISO image mounted as
>             remote media via OpenBMC WebUI.
> 
>             The Windows installer boots, but then says that a media driver is
>             missing.
> 
>             Are there any hints on how to accomplish the task?
> 
>             Attached is the screenshot of the message we get with Windows Server
>             2019.
> 
>             With best regards,
>             Alexander.
> 
>             P.S. We're using Intel-BMC version of OpenBMC for the task, but it looks
>             like the remote media part is more or less the same.
> 
> -- 
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
> 

-- 
Best regards,

Igor Kononenko
