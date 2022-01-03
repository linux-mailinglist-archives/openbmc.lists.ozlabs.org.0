Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D14483037
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 12:10:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSChv2xJzz2yp9
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 22:10:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=AcCeAjJS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=AcCeAjJS; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSChV0L8bz2y7P
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 22:10:17 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 550B146E47;
 Mon,  3 Jan 2022 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1641208211; x=1643022612; bh=YTVqHpD3V+dSVbeMY597QTIiF
 uPqqEUXLsQ0bJrvx1w=; b=AcCeAjJS9vFJckCOK4OVmez/PIWbcqBXsov1fC6Ul
 Kkf6W2kHyDF1W+1VnuQqw+CE6LkGNS8f/uwTm+4o3xhFUpRTy4yKxXXMQrErwDIi
 p4sfJadIFtnii9/ds/VujiYUbExMrGOvaknrMf5gj9SH/2fFzm94tpDqyG9AT2VG
 d4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-esVlIiTUT1; Mon,  3 Jan 2022 14:10:11 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A37FB46D6D;
 Mon,  3 Jan 2022 14:10:10 +0300 (MSK)
Received: from [172.17.4.172] (172.17.4.172) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 3 Jan
 2022 14:10:09 +0300
Message-ID: <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Nikhil V <nikhil.vu@zohocorp.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Mon, 3 Jan 2022 14:10:09 +0300
In-Reply-To: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.17.4.172]
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

Hello, 

It's hard to say what's wrong without knowing of what are you exactly
doing. Since there is no such platform as "at91" in OpenBMC, we don't
know what recipe do you use for u-boot.
Generally, u-boot recipe should include u-boot.inc: 

> require recipes-bsp/u-boot/u-boot.inc

This include file provide u-boot-default-env recipe
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-boot/u-boot.inc#L215

On Mon, 2022-01-03 at 15:34 +0530, Nikhil V wrote:
> Hi,
>      I am trying to build image for openbmc on SAMA5D27-som1-ek1
> development board made by microchip(atmel). SAMA5D27 board has yocto
> support.
>      I have added meta-atmel layer to openbmc, while building/compiling
> using " bitbake obmc-phosphor-image ", I am facing following error,
>      
>       [ERROR: Nothing RPROVIDES 'u-boot-default-env']
> 
>       I have tried by updating with following content but didnt get any
> result.
>                 PREFERRED_PROVIDER_u-boot = "u-boot-at91"
>                 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-at91"
> 
>       Can you help me to find a solution.
> 
>   
> Thanks & Regards,
> Nikhil Muley
> 
> 
> 

-- 
Best regards,
Andrei Kartashev


