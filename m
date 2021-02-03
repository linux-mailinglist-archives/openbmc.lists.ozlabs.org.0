Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7130D49C
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 09:05:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVvPb1PXszDws0
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 19:05:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=tali.perry1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qn0LWq7a; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVvNb2NldzDqRJ
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 19:04:42 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id ew18so11249391qvb.4
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 00:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2Hto7ZXL4ShhckRFS/H2L6BfVw229Jhi1sui7ny/TE=;
 b=Qn0LWq7aQqMWjmUmvGdQcCPJkjGaVg/XlJ471ClPd57zCFKwRoUuamHLjClac0+cjU
 F7PlqV7q5HhQIMY/7ov5tP8Yyvi9avttrxtmeQ64V4wAwY2Y+d6FnvfSPsW+Peye2a9n
 n2EWqNvGUdcdcqdd+9e8Iqwefq/K3d6AnnKSehuSKHaweHsOHLE3UXISxxjF7tF3fs+J
 TBj6JMfSqTrKx+N4KX8FsVS5S1Cs9RQKwsUK7cT2Sspk/LG6PwbZfXH//07fS++7AcsL
 HFVsfS1kqN/B4sq2NAEusR+c6lh/WtgEPufeEAt+nfO2KQPb4gzjORMJvU2OsJi4iBcI
 vCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2Hto7ZXL4ShhckRFS/H2L6BfVw229Jhi1sui7ny/TE=;
 b=MBZp/RVJpnCN7+M7uwunUeZxfesAwfP/4qKxyZHfXCogQW99Vt5SdvqThXejOrZCt6
 U2UMm5lWwFM3ru7WIFVQ4ulLkDOwZSANNGnX9iNWA+kV5GmIae195I9uAUYwl7lVtlCx
 ECRpknAF/xyKOcOe45rM5XcKtrKeAN/4Fm5XR42eHBN4rnFJ3qvckuZjKgo5UTHIl+Z5
 2cZW7/pM5hEQBmYLILliG0rm3pX3sVn/IY4loubG2v7empQcHvogNkH2J37hmHktHgv6
 boIuqWlNx1EX9oFvN3D9NI+UJVC0ozp56q1jlIVa84ZiMT/lmKzz2oL8XLss5sIFBS+3
 ITmg==
X-Gm-Message-State: AOAM53013xaW0ZRERHU/AyXVd4C13EaEb7M6yCG56Gy/+7BzezTtXSXs
 8PZOVFmzVD9SApX8WWINS+jBbnWixT6fcCfe/A8=
X-Google-Smtp-Source: ABdhPJyq6WRZgXdbtWpyEqjoRjeLcnNJnqg5gV0N9Lkyci8DUh89xDIfUHg+b0b5RaLpStVKNf2xcVrOGRllEJDPwJg=
X-Received: by 2002:a0c:d60a:: with SMTP id c10mr1779304qvj.21.1612339477534; 
 Wed, 03 Feb 2021 00:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-16-lee.jones@linaro.org>
In-Reply-To: <20210126124540.3320214-16-lee.jones@linaro.org>
From: Tali Perry <tali.perry1@gmail.com>
Date: Wed, 3 Feb 2021 10:08:02 +0200
Message-ID: <CAHb3i=tVE+hJ46tPp-WYoAXRmWnempbSPtww+9v+B4rS2Y2VFA@mail.gmail.com>
Subject: Re: [PATCH 15/21] clk: clk-npcm7xx: Remove unused static const tables
 'npcm7xx_gates' and 'npcm7xx_divs_fx'
To: Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d0d9af05ba6a09a7"
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, Nuvoton Technologies <tali.perry@nuvoton.com>,
 Stephen Boyd <sboyd@kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d0d9af05ba6a09a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

Thanks for the fix !

On Tue, Jan 26, 2021 at 2:46 PM Lee Jones <lee.jones@linaro.org> wrote:

> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/clk/clk-npcm7xx.c:438:43: warning: =E2=80=98npcm7xx_gates=E2=80=
=99 defined but
> not used [-Wunused-const-variable=3D]
>  drivers/clk/clk-npcm7xx.c:365:48: warning: =E2=80=98npcm7xx_divs_fx=E2=
=80=99 defined but
> not used [-Wunused-const-variable=3D]
>
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Nuvoton Technologies <tali.perry@nuvoton.com>
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/clk-npcm7xx.c | 108 --------------------------------------
>  1 file changed, 108 deletions(-)
>
> diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
> index 27a86b7a34dbf..e677bb5a784b9 100644
> --- a/drivers/clk/clk-npcm7xx.c
> +++ b/drivers/clk/clk-npcm7xx.c
> @@ -361,13 +361,6 @@ static const struct npcm7xx_clk_mux_data
> npcm7xx_muxes[] __initconst =3D {
>         dvcssel_mux_parents, ARRAY_SIZE(dvcssel_mux_parents), 0, -1},
>  };
>
> -/* fixed ratio dividers (no register): */
> -static const struct npcm7xx_clk_div_fixed_data npcm7xx_divs_fx[]
> __initconst =3D {
> -       { 1, 2, NPCM7XX_CLK_S_MC, NPCM7XX_CLK_S_MC_MUX, 0, NPCM7XX_CLK_MC=
},
> -       { 1, 2, NPCM7XX_CLK_S_PLL1_DIV2, NPCM7XX_CLK_S_PLL1, 0, -1},
> -       { 1, 2, NPCM7XX_CLK_S_PLL2_DIV2, NPCM7XX_CLK_S_PLL2, 0, -1},
> -};
> -
>  /* configurable dividers: */
>  static const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst =3D =
{
>         {NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC,
> @@ -435,107 +428,6 @@ static const struct npcm7xx_clk_div_data
> npcm7xx_divs[] __initconst =3D {
>
>  };
>
> -static const struct npcm7xx_clk_gate_data npcm7xx_gates[] __initconst =
=3D {
> -       {NPCM7XX_CLKEN1, 31, "smb1-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 30, "smb0-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 29, "smb7-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 28, "smb6-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 27, "adc-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN1, 26, "wdt-gate", NPCM7XX_CLK_S_TIMER, 0},
> -       {NPCM7XX_CLKEN1, 25, "usbdev3-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 24, "usbdev6-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 23, "usbdev5-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 22, "usbdev4-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 21, "emc2-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 20, "timer5_9-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN1, 19, "timer0_4-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN1, 18, "pwmm0-gate", NPCM7XX_CLK_S_APB3, 0},
> -       {NPCM7XX_CLKEN1, 17, "huart-gate", NPCM7XX_CLK_S_UART, 0},
> -       {NPCM7XX_CLKEN1, 16, "smb5-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 15, "smb4-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 14, "smb3-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 13, "smb2-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN1, 12, "mc-gate", NPCM7XX_CLK_S_MC, 0},
> -       {NPCM7XX_CLKEN1, 11, "uart01-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN1, 10, "aes-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 9, "peci-gate", NPCM7XX_CLK_S_APB3, 0},
> -       {NPCM7XX_CLKEN1, 8, "usbdev2-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 7, "uart23-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN1, 6, "emc1-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 5, "usbdev1-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 4, "shm-gate", NPCM7XX_CLK_S_AHB, 0},
> -       /* bit 3 is reserved */
> -       {NPCM7XX_CLKEN1, 2, "kcs-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN1, 1, "spi3-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN1, 0, "spi0-gate", NPCM7XX_CLK_S_AHB, 0},
> -
> -       {NPCM7XX_CLKEN2, 31, "cp-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 30, "tock-gate", NPCM7XX_CLK_S_TOCK, 0},
> -       /* bit 29 is reserved */
> -       {NPCM7XX_CLKEN2, 28, "gmac1-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 27, "usbif-gate", NPCM7XX_CLK_S_USBIF, 0},
> -       {NPCM7XX_CLKEN2, 26, "usbhost-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 25, "gmac2-gate", NPCM7XX_CLK_S_AHB, 0},
> -       /* bit 24 is reserved */
> -       {NPCM7XX_CLKEN2, 23, "pspi2-gate", NPCM7XX_CLK_S_APB5, 0},
> -       {NPCM7XX_CLKEN2, 22, "pspi1-gate", NPCM7XX_CLK_S_APB5, 0},
> -       {NPCM7XX_CLKEN2, 21, "3des-gate", NPCM7XX_CLK_S_AHB, 0},
> -       /* bit 20 is reserved */
> -       {NPCM7XX_CLKEN2, 19, "siox2-gate", NPCM7XX_CLK_S_APB3, 0},
> -       {NPCM7XX_CLKEN2, 18, "siox1-gate", NPCM7XX_CLK_S_APB3, 0},
> -       /* bit 17 is reserved */
> -       {NPCM7XX_CLKEN2, 16, "fuse-gate", NPCM7XX_CLK_S_APB4, 0},
> -       /*  bit 15 is reserved */
> -       {NPCM7XX_CLKEN2, 14, "vcd-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 13, "ece-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 12, "vdma-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 11, "ahbpcibrg-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 10, "gfxsys-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN2, 9, "sdhc-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 8, "mmc-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN2, 7, "mft7-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 6, "mft6-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 5, "mft5-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 4, "mft4-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 3, "mft3-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 2, "mft2-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 1, "mft1-gate", NPCM7XX_CLK_S_APB4, 0},
> -       {NPCM7XX_CLKEN2, 0, "mft0-gate", NPCM7XX_CLK_S_APB4, 0},
> -
> -       {NPCM7XX_CLKEN3, 31, "gpiom7-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 30, "gpiom6-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 29, "gpiom5-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 28, "gpiom4-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 27, "gpiom3-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 26, "gpiom2-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 25, "gpiom1-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 24, "gpiom0-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 23, "espi-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 22, "smb11-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 21, "smb10-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 20, "smb9-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 19, "smb8-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 18, "smb15-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 17, "rng-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 16, "timer10_14-gate", NPCM7XX_CLK_S_APB1, 0},
> -       {NPCM7XX_CLKEN3, 15, "pcirc-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 14, "sececc-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 13, "sha-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 12, "smb14-gate", NPCM7XX_CLK_S_APB2, 0},
> -       /* bit 11 is reserved */
> -       /* bit 10 is reserved */
> -       {NPCM7XX_CLKEN3, 9, "pcimbx-gate", NPCM7XX_CLK_S_AHB, 0},
> -       /* bit 8 is reserved */
> -       {NPCM7XX_CLKEN3, 7, "usbdev9-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 6, "usbdev8-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 5, "usbdev7-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 4, "usbdev0-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 3, "smb13-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 2, "spix-gate", NPCM7XX_CLK_S_AHB, 0},
> -       {NPCM7XX_CLKEN3, 1, "smb12-gate", NPCM7XX_CLK_S_APB2, 0},
> -       {NPCM7XX_CLKEN3, 0, "pwmm1-gate", NPCM7XX_CLK_S_APB3, 0},
> -};
> -
>  static DEFINE_SPINLOCK(npcm7xx_clk_lock);
>
>  static void __init npcm7xx_clk_init(struct device_node *clk_np)
> --
> 2.25.1
>
>

--000000000000d0d9af05ba6a09a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace">Reviewed-by: Tali Perry &lt;<a href=3D"mailto=
:tali.perry1@gmail.com">tali.perry1@gmail.com</a>&gt;</div><div class=3D"gm=
ail_default" style=3D"font-family:monospace,monospace"><br></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">Thanks for the=
 fix !</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Jan 26, 2021 at 2:46 PM Lee Jones &lt;<a href=3D"mailto=
:lee.jones@linaro.org">lee.jones@linaro.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Fixes the following W=3D1 kernel=
 build warning(s):<br>
<br>
=C2=A0drivers/clk/clk-npcm7xx.c:438:43: warning: =E2=80=98npcm7xx_gates=E2=
=80=99 defined but not used [-Wunused-const-variable=3D]<br>
=C2=A0drivers/clk/clk-npcm7xx.c:365:48: warning: =E2=80=98npcm7xx_divs_fx=
=E2=80=99 defined but not used [-Wunused-const-variable=3D]<br>
<br>
Cc: Avi Fishman &lt;<a href=3D"mailto:avifishman70@gmail.com" target=3D"_bl=
ank">avifishman70@gmail.com</a>&gt;<br>
Cc: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blan=
k">tmaimon77@gmail.com</a>&gt;<br>
Cc: Tali Perry &lt;<a href=3D"mailto:tali.perry1@gmail.com" target=3D"_blan=
k">tali.perry1@gmail.com</a>&gt;<br>
Cc: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=3D"_bl=
ank">venture@google.com</a>&gt;<br>
Cc: Nancy Yuen &lt;<a href=3D"mailto:yuenn@google.com" target=3D"_blank">yu=
enn@google.com</a>&gt;<br>
Cc: Benjamin Fair &lt;<a href=3D"mailto:benjaminfair@google.com" target=3D"=
_blank">benjaminfair@google.com</a>&gt;<br>
Cc: Michael Turquette &lt;<a href=3D"mailto:mturquette@baylibre.com" target=
=3D"_blank">mturquette@baylibre.com</a>&gt;<br>
Cc: Stephen Boyd &lt;<a href=3D"mailto:sboyd@kernel.org" target=3D"_blank">=
sboyd@kernel.org</a>&gt;<br>
Cc: Nuvoton Technologies &lt;<a href=3D"mailto:tali.perry@nuvoton.com" targ=
et=3D"_blank">tali.perry@nuvoton.com</a>&gt;<br>
Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@l=
ists.ozlabs.org</a><br>
Cc: <a href=3D"mailto:linux-clk@vger.kernel.org" target=3D"_blank">linux-cl=
k@vger.kernel.org</a><br>
Signed-off-by: Lee Jones &lt;<a href=3D"mailto:lee.jones@linaro.org" target=
=3D"_blank">lee.jones@linaro.org</a>&gt;<br>
---<br>
=C2=A0drivers/clk/clk-npcm7xx.c | 108 -------------------------------------=
-<br>
=C2=A01 file changed, 108 deletions(-)<br>
<br>
diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c<br>
index 27a86b7a34dbf..e677bb5a784b9 100644<br>
--- a/drivers/clk/clk-npcm7xx.c<br>
+++ b/drivers/clk/clk-npcm7xx.c<br>
@@ -361,13 +361,6 @@ static const struct npcm7xx_clk_mux_data npcm7xx_muxes=
[] __initconst =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dvcssel_mux_parents, ARRAY_SIZE(dvcssel_mux_par=
ents), 0, -1},<br>
=C2=A0};<br>
<br>
-/* fixed ratio dividers (no register): */<br>
-static const struct npcm7xx_clk_div_fixed_data npcm7xx_divs_fx[] __initcon=
st =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_MC, NPCM7XX_CLK_S_MC_MUX,=
 0, NPCM7XX_CLK_MC},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_PLL1_DIV2, NPCM7XX_CLK_S_=
PLL1, 0, -1},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 1, 2, NPCM7XX_CLK_S_PLL2_DIV2, NPCM7XX_CLK_S_=
PLL2, 0, -1},<br>
-};<br>
-<br>
=C2=A0/* configurable dividers: */<br>
=C2=A0static const struct npcm7xx_clk_div_data npcm7xx_divs[] __initconst =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {NPCM7XX_CLKDIV1, 28, 3, NPCM7XX_CLK_S_ADC,<br>
@@ -435,107 +428,6 @@ static const struct npcm7xx_clk_div_data npcm7xx_divs=
[] __initconst =3D {<br>
<br>
=C2=A0};<br>
<br>
-static const struct npcm7xx_clk_gate_data npcm7xx_gates[] __initconst =3D =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 31, &quot;smb1-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 30, &quot;smb0-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 29, &quot;smb7-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 28, &quot;smb6-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 27, &quot;adc-gate&quot;, NPCM=
7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 26, &quot;wdt-gate&quot;, NPCM=
7XX_CLK_S_TIMER, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 25, &quot;usbdev3-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 24, &quot;usbdev6-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 23, &quot;usbdev5-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 22, &quot;usbdev4-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 21, &quot;emc2-gate&quot;, NPC=
M7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 20, &quot;timer5_9-gate&quot;,=
 NPCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 19, &quot;timer0_4-gate&quot;,=
 NPCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 18, &quot;pwmm0-gate&quot;, NP=
CM7XX_CLK_S_APB3, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 17, &quot;huart-gate&quot;, NP=
CM7XX_CLK_S_UART, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 16, &quot;smb5-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 15, &quot;smb4-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 14, &quot;smb3-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 13, &quot;smb2-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 12, &quot;mc-gate&quot;, NPCM7=
XX_CLK_S_MC, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 11, &quot;uart01-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 10, &quot;aes-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 9, &quot;peci-gate&quot;, NPCM=
7XX_CLK_S_APB3, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 8, &quot;usbdev2-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 7, &quot;uart23-gate&quot;, NP=
CM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 6, &quot;emc1-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 5, &quot;usbdev1-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 4, &quot;shm-gate&quot;, NPCM7=
XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 3 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 2, &quot;kcs-gate&quot;, NPCM7=
XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 1, &quot;spi3-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN1, 0, &quot;spi0-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 31, &quot;cp-gate&quot;, NPCM7=
XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 30, &quot;tock-gate&quot;, NPC=
M7XX_CLK_S_TOCK, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 29 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 28, &quot;gmac1-gate&quot;, NP=
CM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 27, &quot;usbif-gate&quot;, NP=
CM7XX_CLK_S_USBIF, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 26, &quot;usbhost-gate&quot;, =
NPCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 25, &quot;gmac2-gate&quot;, NP=
CM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 24 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 23, &quot;pspi2-gate&quot;, NP=
CM7XX_CLK_S_APB5, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 22, &quot;pspi1-gate&quot;, NP=
CM7XX_CLK_S_APB5, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 21, &quot;3des-gate&quot;, NPC=
M7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 20 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 19, &quot;siox2-gate&quot;, NP=
CM7XX_CLK_S_APB3, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 18, &quot;siox1-gate&quot;, NP=
CM7XX_CLK_S_APB3, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 17 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 16, &quot;fuse-gate&quot;, NPC=
M7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 bit 15 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 14, &quot;vcd-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 13, &quot;ece-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 12, &quot;vdma-gate&quot;, NPC=
M7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 11, &quot;ahbpcibrg-gate&quot;=
, NPCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 10, &quot;gfxsys-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 9, &quot;sdhc-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 8, &quot;mmc-gate&quot;, NPCM7=
XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 7, &quot;mft7-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 6, &quot;mft6-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 5, &quot;mft5-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 4, &quot;mft4-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 3, &quot;mft3-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 2, &quot;mft2-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 1, &quot;mft1-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN2, 0, &quot;mft0-gate&quot;, NPCM=
7XX_CLK_S_APB4, 0},<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 31, &quot;gpiom7-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 30, &quot;gpiom6-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 29, &quot;gpiom5-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 28, &quot;gpiom4-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 27, &quot;gpiom3-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 26, &quot;gpiom2-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 25, &quot;gpiom1-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 24, &quot;gpiom0-gate&quot;, N=
PCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 23, &quot;espi-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 22, &quot;smb11-gate&quot;, NP=
CM7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 21, &quot;smb10-gate&quot;, NP=
CM7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 20, &quot;smb9-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 19, &quot;smb8-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 18, &quot;smb15-gate&quot;, NP=
CM7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 17, &quot;rng-gate&quot;, NPCM=
7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 16, &quot;timer10_14-gate&quot=
;, NPCM7XX_CLK_S_APB1, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 15, &quot;pcirc-gate&quot;, NP=
CM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 14, &quot;sececc-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 13, &quot;sha-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 12, &quot;smb14-gate&quot;, NP=
CM7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 11 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 10 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 9, &quot;pcimbx-gate&quot;, NP=
CM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* bit 8 is reserved */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 7, &quot;usbdev9-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 6, &quot;usbdev8-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 5, &quot;usbdev7-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 4, &quot;usbdev0-gate&quot;, N=
PCM7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 3, &quot;smb13-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 2, &quot;spix-gate&quot;, NPCM=
7XX_CLK_S_AHB, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 1, &quot;smb12-gate&quot;, NPC=
M7XX_CLK_S_APB2, 0},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{NPCM7XX_CLKEN3, 0, &quot;pwmm1-gate&quot;, NPC=
M7XX_CLK_S_APB3, 0},<br>
-};<br>
-<br>
=C2=A0static DEFINE_SPINLOCK(npcm7xx_clk_lock);<br>
<br>
=C2=A0static void __init npcm7xx_clk_init(struct device_node *clk_np)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000d0d9af05ba6a09a7--
