Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0BA4324D
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 02:12:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z201z6Jv3z3cNs
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 12:12:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740378877;
	cv=none; b=Wa7Aj5HTNm03O9lXsWhF8NdilnEVZoBlQ+kviPIY0vCroWav2r5bz/y7kBIbt6jLFfFFwJMXX5OoJu/6M/lHvxaADmRytmhFSAkvIAz6NNdivIkL7IpnWfl71zpiBkR/lmECDYIFSIHMVhuKwzTHaGjtEamn/9cEtX50bVCmfykyCA7S+hLqqo51T5eSkBLci2peS8hhYvOXsoltOPaA6GDkGQHlkmwBV5/ylCCucfigAmKuE9wLdqpT6TWa8csTlrwJudan9Qs2xhlOM8jG6pkEoW/MHHF+NS2aP63Viq4Mu2E1mngSVbHlpMmFBtCeyP2SH/NOpXk3fm1K3exZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740378877; c=relaxed/relaxed;
	bh=UDmIbBVBrmOqaPqtm3OIVdTs+1YkPggGmmD9ociAVJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RilUBdWsjzRssdLXlPZ3x3tcNXp5VwlcHff+nLyiJd/WEjr9D20KsmHDNsUS3ov6q5tI6FARyQ46a8M1wtc7iqIW0otrI2v6mECjRqW2kZ3VNEf0GreLM5Z8I+UQE8pRkn7IJBXihPxoeZaQv6ae+omJXJVJT6BJiGTc4l7iDUzXGW1RaCLPK8TPhPXevtgR4SZSw+2MSrchqltW/fhNziujGtUOIA1PvCnz7WlEde9S6AXa3UnI/NmLJ3+3J/imqAHr/MyG5VDJAAmEgt9EZtFZQpCYUzgkFpPWRp+/4TaXBRM/5ZJU+bRnGMt43+7VApewn3WhIESdaY/0P2tSYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bVql4ssR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bVql4ssR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1WDW6W83z2yVV
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 17:34:34 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30a69c1a8d3so12198841fa.3
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 22:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740378869; x=1740983669; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDmIbBVBrmOqaPqtm3OIVdTs+1YkPggGmmD9ociAVJQ=;
        b=bVql4ssRGDNa8jCHtLCpHCZhZcaekMqAqA45V7OR89Lruo1a2BlL9/DjGszOuim4yp
         NlXJUWP0Ks1N806RGlBQ3GJna8OyQ/OXSXEoMEW8pwHAcalwEbeMyY2m2Pch7e8hv6Bn
         Q9Dxy/tgtXPhbFQpazanxs4h6crKv3U9KZb9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740378869; x=1740983669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDmIbBVBrmOqaPqtm3OIVdTs+1YkPggGmmD9ociAVJQ=;
        b=Y/KNwVTdIbI5hMpFDPRjy/GMZwLozdwgfGun+Kg3via2+6NipwjvYJUkgvr1ZTJA5v
         v/rpk+tLUnxH24wKO/M68+PX9rIP2j9DQJkgaYuL16qR5VuLcajdPxLq9KaQWBg17vtO
         EPcwnm0HevZRnFBjIracAv3N0Ai4+PMehw6J3uloZrxc88odlUDEELnDyu0h//1hQcWx
         wD6pQlQnaBAH2N9HgkD9/E0O0wKZOodhDYz9HtXZ7aid4AJS9kfdZFfUor51r0/mzfD6
         xKUIYDC/O/Yb1oimm+4saN5vlj5TBoerY1aUltO+khKGvcgC5gT9/rV2UfWh/9hQaqg5
         ROxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdD7tBurmKUy7aQ+HdKfg+hhwhk6yQVxfHJJCM3sVrMzawWa2HQjED/6YgfgH8/nu3g+2vsVyU@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwFmYHw/+jxy0+2U4deBJpWfKl++ZU2496MmmLKTZ6lwtaFypJ
	jQCwKT5yGxMxBRsf5q6Bn+hbOFoTsN6SR4RsuSSszYz0q/QfWJQaVi7hwVyKrZuhXqgRgug8hAP
	WOQ==
X-Gm-Gg: ASbGncvBaXkhK8qXOvTvE2KuEAVkEHB8UY6ni3+AY3F/Ta/aIgTocOBYXQaRgcFUarh
	tFcdwyuzdQYr++8xhwrVfLrAR/7L4ViGO4KoXTBdp3TINwkVzK5HPcyvHjVDdND9p3Zb1Ald+z3
	iFQw0TOJB+Z0xcfsgAMWspr5NfhGeDjO3ch+TkcAlStzBMI2jw1tQ2tUCpccfRitGCexFu7+GcK
	fMl6UGprdt4096TIqoq8c+8+U2sIsSZVGLc9ebY9Ep9xEAeNLIJeN516jDZp/hvK91OGWqu0f8k
	LsP4tLD0d3Y1gTVMZodW0x/Hz2KfGwOd0UXwDqgGItoP0Js4i1vnUvItQr8slsdh
X-Google-Smtp-Source: AGHT+IFTQ4dgUhV+CeG2vdb0CeWSGX7M3YMlUH2KlJF52KWJ4MMabmOuayhUt2LsgOs0IyXSvbju1A==
X-Received: by 2002:a05:6512:2354:b0:544:ee5:87b0 with SMTP id 2adb3069b0e04-54838edda59mr5561120e87.3.1740378869161;
        Sun, 23 Feb 2025 22:34:29 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452e5932cdsm2896338e87.124.2025.02.23.22.34.22
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 22:34:22 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-547bcef2f96so4006133e87.1
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 22:34:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8VD17HmXVSf/qkE5raEyc/pUpGNzT3fU1mprLBAxTNx321/XpQ8OVb9gNJ1pfwOVQY+797Lz7@lists.ozlabs.org
X-Received: by 2002:a05:6512:3ca5:b0:545:2ee6:84a8 with SMTP id
 2adb3069b0e04-54838ee76c0mr4652920e87.14.1740378861858; Sun, 23 Feb 2025
 22:34:21 -0800 (PST)
MIME-Version: 1.0
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org> <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
 <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl> <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
 <2025022426-lilly-next-72e0@gregkh>
In-Reply-To: <2025022426-lilly-next-72e0@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 07:34:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCvr5Fz2CE7Vx5gk_r=JFHwpT-w=7GGgZ-MN8FkjQyp+yA@mail.gmail.com>
X-Gm-Features: AWEUYZneujeUqRzowTHsCuBd_481VOXalvBfDTLy1Zv-JKeySU-2ECz97LHUiDc
Message-ID: <CANiDSCvr5Fz2CE7Vx5gk_r=JFHwpT-w=7GGgZ-MN8FkjQyp+yA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLACK,URIBL_SBL_A autolearn=disabled
	version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Feb 2025 12:12:04 +1100
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
Cc: Joseph Liu <kwliu@nuvoton.com>, sashal@kernel.or, Marvin Lin <milkfafa@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 Feb 2025 at 06:52, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Feb 23, 2025 at 07:34:30PM +0100, Ricardo Ribalda wrote:
> > On Fri, 21 Feb 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >
> > > On 21/02/2025 10:04, Hans Verkuil wrote:
> > > > Hi Ricardo,
> > > >
> > > > On 21/01/2025 22:14, Ricardo Ribalda wrote:
> > > >> When we obtain a reference to of a platform_device, we need to release
> > > >> it via put_device.
> > > >>
> > > >> Found by cocci:
> > > >> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > > >
> > > > This driver uses this construct:
> > > >
> > > >                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> > > >
> > > > to automatically call put_device. So this patch would 'put' the device twice.
> > > >
> > > > Does cocci understand constructs like this? If I hadn't looked closely at the
> > > > code first, I would just have merged it.
> > >
> > > Oh wait, now that I am reading the following patches I see that it was those later
> > > patches that add the __free code.
> > >
> > > This is far too confusing. Please post a v2 that just combines the 'fix references'
> > > and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
> > > approach.
> >
> > I believe this is discouraged.
> >
> > cleanup.h macros does not exist in old kernel versions, so makes it
> > impossible to backport the fix to them.
>
> That's not a problem, fix things properly in the main tree and let the
> stable/lts kernels work it out on their own.
>
> > This is an example of other series following this policy:
> > https://lore.kernel.org/lkml/173608125422.1253657.3732758016133408588.stgit@devnote2/
> >
> > They also mention the same here:
> > https://hackerbikepacker.com/kernel-auto-cleanup-1 .... I am pretty
> > sure that I read the policy in a more official location... but I
> > cannot find it right now :)
>
> No, it is NOT official policy at all.  Otherwise you would be saying
> that no one could use these new functions for 6 years just because of
> really old kernels still living around somewhere.  That's not how kernel
> development works, thankfully.

No, I am not saying that we cannot use cleanup.h for 6 years.

What I am saying is that first we fix the errors without it, and then
we move to cleanup.h. All in the same series:
1/2 Fix reference handling (cc: stable)
2/2 Use cleanup.h

That way the fix (1/2) can be applied without changes to all the
stable trees, and 2/2 can be ignored by them.

The alternative is a patch that cannot be applied to stable and either
you, the author or the maintainer have to backport to stable
(basically implementing 1/2).  So no, we do not save work by just
posting a cleanup.h version of the fix to the mailing list.

The even better alternative is that cleanup.h is backported to all the
stable trees.


Anyway, it is up to you and Sasha to decide. I will repost the series
only using cleanup.h

Best regards!


>
> thanks,
>
> greg k-h



-- 
Ricardo Ribalda
