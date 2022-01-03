Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C07483107
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 13:31:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSFV56dmlz2yxx
	for <lists+openbmc@lfdr.de>; Mon,  3 Jan 2022 23:31:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=jG4vGs+q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=jG4vGs+q; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSFTf5Z0rz2xBF
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jan 2022 23:31:02 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1B44B46D65;
 Mon,  3 Jan 2022 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1641213057; x=1643027458; bh=Dsc8T2XeSSPepYd0R0wUQe85A
 /+sM4Ur8DIRcHJZ24g=; b=jG4vGs+qcn8sphRgUNPKPXsSJtYytwmIciYE1XeqW
 9TMCt8RnQXkJMm+eaYxmosKusLkRP3qnV437gvz4Kyq4jcSj9NishTLyKqTlIunv
 Wj63F+rUOWRlxG3VZOvdyoC6v/lxJsIXPGU42ApsD5a7kNIAmQzvOvqOoY9/g0UH
 wQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dTX0iBUiQT52; Mon,  3 Jan 2022 15:30:57 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8BB3A46E99;
 Mon,  3 Jan 2022 15:30:57 +0300 (MSK)
Received: from [172.17.4.172] (172.17.4.172) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 3 Jan
 2022 15:30:56 +0300
Message-ID: <bd8a1dec629cc9dd69c44578122a178d7af6eb7e.camel@yadro.com>
Subject: Re: [ERROR: Nothing RPROVIDES 'u-boot-default-env']
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Nikhil V <nikhil.vu@zohocorp.com>
Date: Mon, 3 Jan 2022 15:30:56 +0300
In-Reply-To: <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
References: <17e1f659f9b.c8f061fb4115.9212316766481010802@zohocorp.com>
 <ff7a3d7fc5ed91ab62b935421f779a6407e817fc.camel@yadro.com>
 <17e1fba2bcf.ce6abdb85070.1975040279944804325@zohocorp.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Well, as I say, they don't use u-boot.inc an they don't implement u-
boot-default-env. I can't give you an universal hint on how to solve
this, but I advice you to build upstream Yocto for your platform first
(I mean, generic yocto, instead of OpenBMC). Once you succeeded with
upstream Yocto, integrating into OpenBMC would be less painful.

What you trying to do is not a typical usecase for OpenBMC, generally
we don't do like this. What are your expectations and final goal?

On Mon, 2022-01-03 at 17:06 +0530, Nikhil V wrote:
> Hello kartashev,
>                        Thanks for your quick response, I will provide
> some background on what i am trying to achieve.
>                        I am using openbmc, downloaded from following
> location, steps are as follow,
>                        
>                         1)  git clone
> https://github.com/openbmc/openbmc.git -b dunfell
>                         2)  git clone
> git://github.com/linux4sam/meta-atmel.git -b dunfell
>                         3)  . openbmc-env build-sama5d27
>                         4)  then add following layers
>                               bitbake-layers add-layer ../meta-atmel
> ../meta-security ../meta-openembedded/meta-perl ../meta-
> openembedded/meta-initramfs
>                         5)   Edit in local.conf
>                               MACHINE="sama5d27-som1-ek-sd" 
>                         6)   bitbake obmc-phosphor-image
> 
> "Since there is no such platform as "at91" in OpenBMC, we don't know
> what recipe do you use for u-boot."
> Here I am using meta-atmel layer provided by microchip. It has its
> own u-boot under meta-atmel/recipe-bsp.
> you will find it once you downloaded it from step 2.
> 
> when i do bitbake obmc-phosphor-image i am getting error. ERROR:
> Nothing RPROVIDES 'u-boot-default-env'
> 
> hope i have described my problem correctly.
> 
> For any query feel free to contact.
> 
> Thanks & Regards,
> Nikhil Muley
> 
> 
> ---- On Mon, 03 Jan 2022 16:40:09 +0530 Andrei Kartashev
> <a.kartashev@yadro.com> wrote ----
> 
> > Hello, 
> >  
> > It's hard to say what's wrong without knowing of what are you
> > exactly 
> > doing. Since there is no such platform as "at91" in OpenBMC, we
> > don't 
> > know what recipe do you use for u-boot. 
> > Generally, u-boot recipe should include u-boot.inc: 
> >  
> > > require recipes-bsp/u-boot/u-boot.inc 
> >  
> > This include file provide u-boot-default-env recipe 
> > https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-bsp/u-boot/u-boot.inc#L215
> >  
> > On Mon, 2022-01-03 at 15:34 +0530, Nikhil V wrote: 
> > > Hi, 
> > >      I am trying to build image for openbmc on SAMA5D27-som1-ek1 
> > > development board made by microchip(atmel). SAMA5D27 board has
> > > yocto 
> > > support. 
> > >      I have added meta-atmel layer to openbmc, while
> > > building/compiling 
> > > using " bitbake obmc-phosphor-image ", I am facing following
> > > error, 
> > >      
> > >       [ERROR: Nothing RPROVIDES 'u-boot-default-env'] 
> > > 
> > >       I have tried by updating with following content but didnt
> > > get any 
> > > result. 
> > >                 PREFERRED_PROVIDER_u-boot = "u-boot-at91" 
> > >                 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-
> > > at91" 
> > > 
> > >       Can you help me to find a solution. 
> > > 
> > >   
> > > Thanks & Regards, 
> > > Nikhil Muley 
> > > 
> > > 
> > > 
> >  

-- 
Best regards,
Andrei Kartashev


