Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE063680C
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 19:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHTVk1Nm6z3bjk
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 05:02:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eKoPx+sU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eKoPx+sU;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHTV53tq8z3bP1
	for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 05:02:04 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id s8so29269696lfc.8
        for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FPfaV9JQYEEBlTl/fS8GFESyDnIDzd+AMUhHZbg9V84=;
        b=eKoPx+sUx3lamSLIjdVGDSUuRs8FkZJfekAEedrz6LWYH+KepBzDOYuMOK7f3c1PVg
         luWOSccwRgUvlTuOpv/BFryCTO4d9+4CUF4CM1NUQ7JYfE64n+7Wh8Mr3zO2z7YwVAb/
         Nr8ooCjfFBf1+bu9YqcQdNk5rXRt4QCZp+K6ItYpidbv8a2lrONEm/12drOxtxgS8qu9
         Yrg9BcvR8VisogZ4SVqo2cXzKshwrPh7yH/k95Pq5vPwAB2nODViU6YYHcR9eTGvLJ9K
         +E0pk5rb8PdiuZMjYT9aASnOFUf6k33s4WlcBK6pgQHXZsx075i5A6qQA7wh80CjfaRc
         2Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPfaV9JQYEEBlTl/fS8GFESyDnIDzd+AMUhHZbg9V84=;
        b=ATnMvSsiBcOgvibDs7WRjDbZ81eLARkAlYdYeVcZLq3vSR6Ps9Z9cN78T5Rx2cA/vr
         6NmPdXReKygvsZH5zBeS7vyssFBNCjAy5QHoIOi7R5TEL0jZX+jNfi/UxjfHZSj0bXzk
         0D8/TzHfek/9yK4A/wkKHOqqQVNuKaRUutjAbg0cmuNLx3GVr5hVjhVLt7AUoPjdVnoQ
         ju7NX3PWN/TnWHRc46XTanWlUq4SDpq+axsVOg1a6gFXWwDQOiYMo14nt0Yr9GqEj1dk
         ny+RqWDWiJhynb3zAH0Nqu8uFSQN1ZDiUHkJQf6Lsy4sSp7FZIkqL8RUlINLkqXlnyxP
         dDxg==
X-Gm-Message-State: ANoB5pmOPBkLpXgLdE5RTCG+9d1AK0MtKXk3d9hluVdUzORs97dfhWsc
	dcmZDoConnihanxboJBryWT4rLESGw7yMiy8FJo=
X-Google-Smtp-Source: AA0mqf56v42d6nqEg/RKf0j6CF9PHx1Xu9ou1xq63pazvzimGl4nOGI1Oy3Opva0Ihc+dfH0ZmsKONw/5UJJdmCLf8A=
X-Received: by 2002:ac2:4e14:0:b0:4af:f5a0:8786 with SMTP id
 e20-20020ac24e14000000b004aff5a08786mr9144435lfr.265.1669226520087; Wed, 23
 Nov 2022 10:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20221122201232.107065-1-tmaimon77@gmail.com> <20221122201232.107065-3-tmaimon77@gmail.com>
 <577e273d-ff9b-4d8d-b797-d7275ab8374f@app.fastmail.com>
In-Reply-To: <577e273d-ff9b-4d8d-b797-d7275ab8374f@app.fastmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 23 Nov 2022 20:01:48 +0200
Message-ID: <CAP6Zq1ikqtKOGUZX-VAdyhs+nsvy7ah4gqRrbXVA8Gp9L46hXQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, benjaminfair@google.com, Sven Peter <sven@svenpeter.dev>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, tali.perry1@gmail.com, "Conor.Dooley" <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Arnd,

Thanks for your email

On Wed, 23 Nov 2022 at 12:58, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Nov 22, 2022, at 21:12, Tomer Maimon wrote:
> > Add Nuvoton BMC NPCM LPC BIOS post code (BPC) driver.
> >
> > The NPCM BPC monitoring two configurable I/O address written by the host
> > on the Low Pin Count (LPC) bus.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/soc/Kconfig                |   1 +
> >  drivers/soc/Makefile               |   1 +
> >  drivers/soc/nuvoton/Kconfig        |  24 ++
> >  drivers/soc/nuvoton/Makefile       |   3 +
> >  drivers/soc/nuvoton/npcm-lpc-bpc.c | 396 +++++++++++++++++++++++++++++
>
> In general, I try to keep drivers/soc/ for drivers that are
> used purely inside of the kernel and don't provide their
> own user space ABI, those should normally be part of
> some subsystem grouped by functionality.
>
> It appears that we have similar drivers for aspeed already,
> so there is some precedent, but I would still like to ask
> you and Joel to try to make sure the two are compatible,
> or ideally share the code for the user-facing part of the
> LPC driver.
Nuvoton and Aspeed use the same user-facing code to manage the host snooping.
https://github.com/openbmc/phosphor-host-postd
>
> > +config NPCM_PCI_MBOX
> > +     tristate "NPCM PCI Mailbox Controller"
> > +     depends on (ARCH_NPCM || COMPILE_TEST) && REGMAP && MFD_SYSCON
> > +     help
> > +       Expose the NPCM BMC PCI MBOX registers found on Nuvoton SOCs
> > +       to userspace.
>
> This looks unrelated to the LPC driver, so this should
> probably be a separate patch. The same comment about user
> space presumably applies here, but I have not seen the driver.
You are right, it was added by mistake.
will drop off in the next patch
>
> The implementation of npcm-lpc-bpc looks fine otherwise, I only
> noticed one minor detail that I would change:
>
> > +     np = pdev->dev.parent->of_node;
> > +     if (!of_device_is_compatible(np, "nuvoton,npcm750-lpc") &&
> > +         !of_device_is_compatible(np, "nuvoton,npcm845-lpc")) {
> > +             dev_err(dev, "unsupported LPC device binding\n");
> > +             return -ENODEV;
> > +     }
>
> This check doesn't seem to make sense here, since those are
> the only two types you support.
About the LPC, I like to double check with our architectures on it
because the BPC should working on eSPI as well.
Maybe I should remove the LPC part.
>
>       Arnd

Best regards,

Tomer
