Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D7813299
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 15:10:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7MdOPbU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrZ4Q497cz3cXD
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 01:10:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F7MdOPbU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrZ3r16rxz3cS5
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 01:09:43 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3ba2e03e21cso849826b6e.0
        for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702562980; x=1703167780; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnDoJ6wVmo9VoXzzMiE8cFoyXSZgzadjzCBeRZFN5gs=;
        b=F7MdOPbUt4J+R29U+mmBIixqhlBw17iHV4ldisITKjtzFEBFxCOOYWpIjG1oGqfroY
         kyFMXilKVgwdL4YjPWP70KEnJ0g68CN4XUhu8U5Eo+lgmB8RWMZiSiYvR7ercX0w6CKx
         kvxEZ6qVBcsQNKZftooc7M3G3/SLtSdZ9I9nUybTZeGsYiwrSgTfKQ16ZusxFKKEaGoL
         A6jlTr0XoDiNsZRRBmlBetyBmKasr4AqsZNFIondpKgPk4LADwV6+g2ckZr6HhwjqN73
         jMp7aXWtmGp0DX98Z3HhU5YxbSPtzGMTTGdRPJhqGpOwHBuWlfQth6OfLf74A/djJGAn
         qf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562980; x=1703167780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnDoJ6wVmo9VoXzzMiE8cFoyXSZgzadjzCBeRZFN5gs=;
        b=cxXOBiBOlkuc9pdGuTIK+qzsplMcMrJRoHreTCgMiqXXwg2IogdkJ3d0XTpm+HGBcQ
         +dxGGk4MhSV/69qNz6gKDpLk/LPh/bLuITbb4MCfYMtZ3ctXxAiK4uA7cpz7ozCwKy5v
         7DObgyJFbmkYaeSbCYjJ7EJXqYyhMYXVJMjqIbp1zlR1vAKD38xqZSmBgL/cJE4E0bSN
         R46KgYGJ3R4MAbINWuJ8bjJXdPOzzfaiPe01y8fq0un0RKPUsULiICnMHdaSTSHkzUSE
         S5p8l7x7dhqk/iCQjm/3Mf55WatzkePqH0GVdkQnKZq1bLHYx7z//hhdRVn/60XOMAyF
         Bq2Q==
X-Gm-Message-State: AOJu0Yy5oXkVp0nZH+sriYgtQFnkcL7ygt50prxQ4LndY1eDeYvM8zPe
	5D817cercijHN0+FR8F6G6KVxPcOhyJjbRFLNuk=
X-Google-Smtp-Source: AGHT+IGPp77OIeq0HPwK1G1mRuXPVT/TNiXRQRsdPVwq0HzCh+/6goRnf27mZqKmRhoHC4FS1baWhsKabTH7NXn1ZHo=
X-Received: by 2002:a05:6808:f91:b0:3b9:e654:9010 with SMTP id
 o17-20020a0568080f9100b003b9e6549010mr10465714oiw.34.1702562980290; Thu, 14
 Dec 2023 06:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20231213190528.3751583-1-tmaimon77@gmail.com> <20231213190528.3751583-4-tmaimon77@gmail.com>
 <cf3ce945-2f1c-4dae-86b8-349dae3d962b@app.fastmail.com>
In-Reply-To: <cf3ce945-2f1c-4dae-86b8-349dae3d962b@app.fastmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 14 Dec 2023 16:09:29 +0200
Message-ID: <CAP6Zq1inLOMHORqO8=RbP6NfwJ63kLaH0G3+TKBhfn0p2CE53w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] soc: nuvoton: add NPCM BPC driver
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: pmenzel@molgen.mpg.de, Conor Dooley <conor+dt@kernel.org>, benjaminfair@google.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, tali.perry1@gmail.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Thanks for your comments.

On Thu, 14 Dec 2023 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Dec 13, 2023, at 20:05, Tomer Maimon wrote:
> > Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
> >
> > The NPCM BPC monitoring two configurable I/O address written by the host
> > on the bus.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/soc/nuvoton/Kconfig    |   9 +
> >  drivers/soc/nuvoton/Makefile   |   1 +
> >  drivers/soc/nuvoton/npcm-bpc.c | 387 +++++++++++++++++++++++++++++++++
> >  3 files changed, 397 insertions(+)
> >  create mode 100644 drivers/soc/nuvoton/npcm-bpc.c
>
> I try hard to avoid having user interfaces in drivers/soc/, that
> subsystem should primarily be used for things that don't have an
> existing subsystem in the kernel and are used by other in-kernel
> drivers but don't export hteir own misc device.
>
> > diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
> > index d5102f5f0c28..ebd162633942 100644
> > --- a/drivers/soc/nuvoton/Kconfig
> > +++ b/drivers/soc/nuvoton/Kconfig
> > @@ -2,6 +2,15 @@
> >
> >  menu "NUVOTON SoC drivers"
> >
> > +config NPCM_BPC
> > +     tristate "NPCM BIOS Post Code support"
> > +     depends on (ARCH_NPCM || COMPILE_TEST)
> > +     help
> > +       Provides NPCM driver to control the BIOS Post Code
> > +       interface which allows the BMC to monitor and save
> > +       the data written by the host to an arbitrary I/O port,
> > +       the BPC is connected to the host thourgh LPC or eSPI bus.
> > +
>
> This one in particular looks like this might be implemented
> by more than one BMC type, it's a fairly generic functionality.
>
> Have you talked to the other maintainers of SoCs used in
> OpenBMC about coming up with a common interface?
Yes, Both Nuvoton and Aspeed use the same user-facing code to manage
the host snooping.
https://github.com/openbmc/phosphor-host-postd
>
> > +#define DEVICE_NAME  "npcm-bpc"
Will do.
>
> [nitpicking] No need for macros like this one, open-coding the
> string is usually more readable.
>
>     Arnd

Thanks,

Tomer
