Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39166685ED0
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 06:18:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P69Ds099yz3cdG
	for <lists+openbmc@lfdr.de>; Wed,  1 Feb 2023 16:18:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VvZYpSIg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VvZYpSIg;
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P69DF2yB5z3bM7
	for <openbmc@lists.ozlabs.org>; Wed,  1 Feb 2023 16:18:04 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id dr8so26420955ejc.12
        for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2023 21:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQzkVS8kfSVfXjueCcII9oQ2E2FRyG2mNoKI4xIksC0=;
        b=VvZYpSIgaZNjZGyngc8Btx/IDu2MhrcgPUykaW0GDud3gQzBy0xJ0djkypZrX/KZyq
         SFJ8T1oELNRICA7tU8CIl3kWaDrt7qqfSLEOVvjWAQIAsQf6dsP0csZD9YsbUVgFzRim
         v9TpL2FP7qkzFKktXMc5i/eYVidlWR2lb1jq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQzkVS8kfSVfXjueCcII9oQ2E2FRyG2mNoKI4xIksC0=;
        b=yBxUaiQoK54SRJ3IceBk1bun5ZIYLFQWjszzJbzjBeP1BSNe0KlVA3u9nrpzE7UFrg
         27QJyzkCj6rco6Jpno+pLlBb9H9qIY+mzydJY/y9v76X/5y3DU6Ow7gMB0cl/70NGByU
         d/AbT4gBu+WHnQURuBfvmPF8KsWfMHdm+zP/Jhzqi8dobrqtExYSIvJMQj+TsRZ02b8O
         9WjdUBCej2HDseLIQ6CBW6dT+T73hmZW6R+xs3/XcDBt1jTAvWACKDcpsf7tQfFzzDqV
         VNGREaRvC7Er0X5X6t7EDZp8Eqa9XEjHdiqqVw27dXR3kTASVIx4eGQdgmLdPdG90086
         xkng==
X-Gm-Message-State: AO0yUKVCL83MMELd7q7lQaKDV4REy4hTZMoEzW7h5tBHc+arezCdaQgO
	YY1MW3/rdg8BfryRX4wNj7a4ewxYcZDTn7QMB+g=
X-Google-Smtp-Source: AK7set/uvP0kUEIv8M0caEy5i61/i+TWjGDyUJIZ8jECU5n2CpCvUo5xep6UREzjsirKLh3Icw1thUvpqc5kNAiW4oc=
X-Received: by 2002:a17:906:1653:b0:88a:7cf5:5d33 with SMTP id
 n19-20020a170906165300b0088a7cf55d33mr326339ejd.100.1675228680433; Tue, 31
 Jan 2023 21:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20230129041547.942335-1-j.neuschaefer@gmx.net> <Y9X2Ur6oHTsFtCmW@probook>
In-Reply-To: <Y9X2Ur6oHTsFtCmW@probook>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:17:47 +0000
Message-ID: <CACPK8XfGq++R6Rroi4ZRBKj6QgTJx5kzOeO3wK5Uk8VHzUe35g@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: Add wpcm450_defconfig for Nuvoton WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 29 Jan 2023 at 04:36, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
>
> On Sun, Jan 29, 2023 at 05:15:46AM +0100, Jonathan Neusch=C3=A4fer wrote:
> > This defconfig aims to offer a reasonable set of defaults for all
> > systems running on a Nuvoton WPCM450 chip.
> >
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
>
> Sorry, I hadn't noticed that v3 already made it into linux-next.
>
> @Joel: I'll leave it up to you to decide whether you keep v3 or replace
> it with v4 (although given the upcoming merge window, I guess keeping v3
> is safer).

I sent v4 to the soc maintainers.

Cheers,

Joel

>
>
> Best regards,
> Jonathan
>
> > v4:
> > - Add Joel's R-b
> > - Disable CPU_FREQ
> > - Update for Linux 6.2: Enable CONFIG_SPI_WPCM_FIU, disable
> >   CONFIG_LEGACY_TIOCSTI
> > - Disable CONFIG_KEXEC, which isn't generally useful for the BMC usecas=
e
> >
> > v3:
> > - https://lore.kernel.org/lkml/20221101112134.673869-1-j.neuschaefer@gm=
x.net/
> > - Regenerate for 6.1-rc1 and enable a few Nuvoton-specific options as
> >   well as the PECI subsystem
> >
> > v2:
> > - Regenerate for 5.19-rc1
> > ---
> >  MAINTAINERS                        |   1 +
> >  arch/arm/configs/wpcm450_defconfig | 211 +++++++++++++++++++++++++++++
> >  2 files changed, 212 insertions(+)
> >  create mode 100644 arch/arm/configs/wpcm450_defconfig
> [...]
