Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C56CDB46
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 15:56:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmp4Y2z2Jz3f5m
	for <lists+openbmc@lfdr.de>; Thu, 30 Mar 2023 00:56:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mg5DvpPy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fercerpav@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Mg5DvpPy;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmp3z1yN2z3c73
	for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2023 00:55:58 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id a21so9036906ljq.10
        for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680098152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGxPvzTZh1LKWA92DnIchZUbEWFajh9Ix2oktjT7o9s=;
        b=Mg5DvpPyXIbWa9IJ7hyj63iCa0kJfswn1z66/722Lpa5CPRZQ1nc7LbcFWX7UmxVVY
         TV/RrEsXtXJoWx1UOtiocPqH9rd3uano1QTbPf6x2jUBso+MYU1KHwhBMmmXf/q54lBW
         O/P5+L2YD2Xsj4LRHi0uH3KwpCouxGvvOGrdGV/RxkwDJJt5oxew4oFhq5TMKUUEMkhC
         ypn6VrqTbxnz/LsBpJzjMySH/7yDTz73+iB8kMXNZ/xQiwrau62jl9a86i95CEf8swMX
         CvmZoQBHI3m2mBuAaqFu7QK3s/LO/6NnlKvG6Cnip83dnJV1sv8ji/E9hhXyuMBP1RKG
         UbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680098152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGxPvzTZh1LKWA92DnIchZUbEWFajh9Ix2oktjT7o9s=;
        b=YOyT4iGwaontSSMPjTZAFfRQMF5SKbdcDztzVyEKZSK1RFqDYLCR+yi/lNHn+fGjg7
         hzPVb1e+/sJqTJq5jr2RkGUW0pZe8Fy9rCwJbApyfancPuExVFpt4hIjoNx3vEDQxUvQ
         RdU/LjXykWit04eBendaVGIVuaP8vGn0UJm1d1zFvFXdwdyrd2AGw/hREytuCLr3Ys6t
         choCfEdzIBOupC2H2knJv2TOUyF4EGNFGy37H1nuBuTbNJKZ54ArTJVfF22DaWHzvIPb
         zRe1BmlzGSeJaOxqZcHiHlnRY7ZNK6hSrzHNJfJdH9kPREonka+LrOmUK1pCdgpebw7d
         qb1w==
X-Gm-Message-State: AAQBX9fi6ykY+VHdlfmlUq4R/FBESYV94vOPJMv/ZUSeuLyzSGjCvywp
	VXqW5yAvzuwFmlssywn0mYo=
X-Google-Smtp-Source: AKy350aWo9LYGS3Lg0JvTfxDt4Nikq5J6mixNP/fXrvlk4kerbB+gfZ9HsEEjnOy8au2GChfsHe9fg==
X-Received: by 2002:a2e:9589:0:b0:298:a7bd:5c56 with SMTP id w9-20020a2e9589000000b00298a7bd5c56mr5864639ljh.53.1680098152343;
        Wed, 29 Mar 2023 06:55:52 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id c2-20020a2e9d82000000b002a6007383a0sm739986ljj.135.2023.03.29.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:55:52 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 32TDtki5027543;
	Wed, 29 Mar 2023 16:55:47 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 32TDtkPM027542;
	Wed, 29 Mar 2023 16:55:46 +0300
Date: Wed, 29 Mar 2023 16:55:45 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: Plans regarding PECI sensors and PCIe inventory with upstream
 Linux
Message-ID: <ZCRDYVwnGekY8e7z@home.paul.comp>
References: <ZBr/QC4P32yoZyzs@home.paul.comp>
 <31613359fc3690a04a62da282c3e2fd494fd1f30.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31613359fc3690a04a62da282c3e2fd494fd1f30.camel@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Weiss, Zev" <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Iwona,

On Fri, Mar 24, 2023 at 09:38:04PM +0000, Winiarska, Iwona wrote:
> On Wed, 2023-03-22 at 16:14 +0300, Paul Fertser wrote:
> > Recently OpenBMC switched to newer Linux version which got upstream
> > support for the PECI bus, with CPU and DIMM modules temperature
> > sensors reported via it. I assume this is essential for all
> > Intel-based server motherboards as monitoring CPU temperature and
> > spinning fans accordingly is one of the core BMC functionalities.
> 
> Yes, it's currently not compatible with upstream PECI.
> 
> In January there was a thread related to dbus-sensors present and future:
> https://lore.kernel.org/openbmc/Y79U52toP0+Y4edh@hatter.bewilderbeest.net/
> where Zev mentioned that he started to work on dbus-sensors replacement, which
> does support (among other things) upstream PECI:
> 
> https://github.com/zevweiss/omnisensor/blob/master/src/peci.rs

It's a rather cool project, but I do not see it having become part of
OpenBMC mainstream just yet. Probably not many have tried even just
testing it, as I only see commits from Zev himself. I hope this will
change in the future.

For now I figured a simple change seems to be enough to allow
IntelCPUSensor from dbus-sensors to continue working on current
OpenBMC:

https://gerrit.openbmc.org/c/openbmc/dbus-sensors/+/62025

> Regarding peci-pcie, the plan would be to, instead of using pecidev, implement a
> PECI driver on the kernel side, which exposes the necessary information over
> sysfs (abstracting away the PECI commands used internally) and use that in peci-
> pcie.

When I was asking about plans I meant something with specific dates,
not just the general outline :) You can see as it currently stands
OpenBMC upstream lost the very essential feature (fan control
depending on CPU temperature) for most (all?) Intel-based servers, so
I'm surprised there's no particular migration path ready in
advance.

That said, thank you for the upstreaming work, I see it was attempted
before for years and you're the one who finally managed to do the
right (from Linux maintainers PoV) thing. Congratulations!

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
