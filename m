Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7E69370F
	for <lists+openbmc@lfdr.de>; Sun, 12 Feb 2023 12:46:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PF5KR0R0kz3bqw
	for <lists+openbmc@lfdr.de>; Sun, 12 Feb 2023 22:46:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.54; helo=mail-qv1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PF5K51rY9z3bgr
	for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2023 22:46:17 +1100 (AEDT)
Received: by mail-qv1-f54.google.com with SMTP id j9so6773182qvt.0
        for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2023 03:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ8uLz/nfTk+HTCBxSvta+7e8bSEcCJROyslrJUxvpU=;
        b=Cd6SNF6B18hhU76AIuF0LCtlhT16x9kabTCn+QKXlmcMvUwtGy3XdEEt/vG5d7gwXT
         m7VDEDN4YVy47nlIzf+q51IP3lCyjBw3l+0vH+LZiNoAvIEJYeMXMcUD3mdfi/KyJrRs
         HLgerB217EBDGBls47L98I19ghS1Lffr7WKZUeDtSzZ8MrMNJ9QJlWrymVIU3muLeg/S
         9KPMt/6l9eEBYDhFFQctHjZLYHbGxkM9L/xw9hTMEjppgHwdjs7M93hz+ADGSddoLXei
         PnnzXSnjsTup7v+W1UGm5vJQj4LaC/nfvq9dz1bdI1HYl1meKheWCz8wmizgIiZgo0ec
         4zIg==
X-Gm-Message-State: AO0yUKXCvd+CzJs968Pi1+AyJ7BRWDWOhTHZEQtwIVOE63Wk3akP9jh0
	NU/u7K2KovaWLkKoF0ixXzXe1OVsMr3w3A==
X-Google-Smtp-Source: AK7set/5FwAj1Ve9ke7+FEhk7Jtx3Vx07qvea4fCUt54A/dP6d+pMPW0IFGzI69TdOdI+HswburnPg==
X-Received: by 2002:a05:6214:628:b0:568:d153:823a with SMTP id a8-20020a056214062800b00568d153823amr34237683qvx.15.1676202372146;
        Sun, 12 Feb 2023 03:46:12 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id z13-20020a37650d000000b006fef61300fesm7492661qkb.16.2023.02.12.03.46.11
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 03:46:11 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id l201so10323222ybf.10
        for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2023 03:46:11 -0800 (PST)
X-Received: by 2002:a25:f202:0:b0:880:3ca9:736b with SMTP id
 i2-20020a25f202000000b008803ca9736bmr2654780ybe.464.1676202371498; Sun, 12
 Feb 2023 03:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20230212113111.1720685-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230212113111.1720685-1-j.neuschaefer@gmx.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Feb 2023 12:46:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU6=qTHEGM6U2o7JOuEGxRmRaOnUkVhepoYKLy71XDNJg@mail.gmail.com>
Message-ID: <CAMuHMdU6=qTHEGM6U2o7JOuEGxRmRaOnUkVhepoYKLy71XDNJg@mail.gmail.com>
Subject: Re: [PATCH] soc: nuvoton: Fix Kconfig
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

On Sun, Feb 12, 2023 at 12:31 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Unfortunately, version 5 of the Nuvoton WPCM450 SoC driver was applied
> to bmc.git, which misses a few fixes that were in version 6.
>
> This patch adds the missing fixes:

Thanks for your patch!

>  - Add a menu "Nuvoton SoC drivers" to make it easier to add other
>    Nuvoton SoC drivers later on

... and to prevent asking about the Nuvoton WPCM450 SoC driver when
configuring a kernel without support for Nuvoton SoCs.

>  - select CONFIG_REGMAP from CONFIG_WPCM450_SOC

Please include why this is needed.

>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 77b8c67b5637 ("soc: nuvoton: Add SoC info driver for WPCM450")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  drivers/soc/nuvoton/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
> index df46182088ec2..2167d3d739d84 100644
> --- a/drivers/soc/nuvoton/Kconfig
> +++ b/drivers/soc/nuvoton/Kconfig
> @@ -1,11 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> -menuconfig WPCM450_SOC
> +menu "Nuvoton SoC drivers"
> +       depends on ARCH_NPCM || COMPILE_TEST
> +
> +config WPCM450_SOC
>         tristate "Nuvoton WPCM450 SoC driver"
>         default y if ARCH_WPCM450
>         select SOC_BUS
> +       select REGMAP
>         help
>           Say Y here to compile the SoC information driver for Nuvoton
>           WPCM450 SoCs.
>
>           This driver provides information such as the SoC model and
>           revision.
> +

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
