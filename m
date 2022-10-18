Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AC26029DD
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 13:10:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsB3V0BPvz3c4N
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 22:10:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=FuVEngEE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=FuVEngEE;
	dkim-atps=neutral
X-Greylist: delayed 398 seconds by postgrey-1.36 at boromir; Tue, 18 Oct 2022 22:09:42 AEDT
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsB2t3Db7z2xKN
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 22:09:42 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 573F44124A;
	Tue, 18 Oct 2022 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:references:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received
	:received:received; s=mta-01; t=1666090975; x=1667905376; bh=3Mu
	5lr+v0w6mdsCKAOxnGwrovlzokF9mrPGL/3Tcbec=; b=FuVEngEE8UNrgBCgKjX
	ReKhuJYAjk+9f2orEhHOd2sFAtGBARdhrS86o8y/seT8chAYYZLWGCRF3E7Jk3u3
	jW5zN/VmPoCwxMIpqvHEXmOWi6w6xDb0tJ3jrpcdoOhyG9VS38OkSHtM5rMl1GkO
	ZZC3vFDk5puJuo/r8fPc/AkM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Ofx-753maCW; Tue, 18 Oct 2022 14:02:55 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 75AD4412D1;
	Tue, 18 Oct 2022 14:01:28 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 18 Oct 2022 14:01:28 +0300
Received: from [10.199.18.154] (10.199.18.154) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Tue, 18 Oct
 2022 14:01:27 +0300
Message-ID: <0cc47677-3bbb-b34d-a5b6-157f525dd76e@yadro.com>
Date: Tue, 18 Oct 2022 14:01:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
Content-Language: en-US
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <9921666089829@mail.yandex-team.ru>
From: i.kononenko <i.kononenko@yadro.com>
In-Reply-To: <9921666089829@mail.yandex-team.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.18.154]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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



On 18.10.2022 13:44, Konstantin Klubnichkin wrote:
> «Внимание! Данное письмо от внешнего адресата!»
> 
> Hello, Igor!
> Did you succeed to include this pachset into upstream?
> Thank you!

Hello Konstantin!

Unfortunately, I've suspended work with publishing patches into upstream
of the usb-gadget fmc.  The community point is the big rework of  the   
usb-gadget:fmc subsystem is not required, and moreover we should avoid  
that, because there is  a user-space gadget driver that may provide     
a wider number of features and could be more agile.

My opinion at this point is that the OpenBMC VirtualMedia implementation
could be based on the GadgetFS driver with ConfigFS feature. I was plan to      
prepare a design-doc proposal with PoC, but today I have too wide list 
of critical tasks.

> 03.08.2021, 15:53, "i.kononenko" <i.kononenko@yadro.com>:
> 
>     Hello Konstantin,
> 
>     I have several patches [1] to solves mounting DVD-based ISOs through Virtual
>     Media.
>     The published changes is WIP until had approved by the Linux Foundation
>     community,
>     but in the YADRO, we use these changes to support installing the OS Windows via
>     Virtual Media.
> 
> 
>     I hope your will found it helpful that information to support installing
>     Windows-based OS.
> 
>     Links:
>     [1] - https://patchwork.kernel.org/project/linux-usb/list/?series=507583
>     <https://patchwork.kernel.org/project/linux-usb/list/?series=507583>
> 
>     --
>     Best regards,
> 
>     Igor Kononenko
> 
> -- 
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33

-- 
Best regards,

Igor Kononenko
