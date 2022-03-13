Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5A4D7830
	for <lists+openbmc@lfdr.de>; Sun, 13 Mar 2022 21:22:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGrhJ1YFZz30Ph
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 07:22:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mcqLMkH9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mcqLMkH9; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGrgv2NN3z3096
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 07:22:34 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id h14so23750944lfk.11
 for <openbmc@lists.ozlabs.org>; Sun, 13 Mar 2022 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9y+xQerG7o8f0xpkTQNL0kHWd//IRK7WsRPUjIKkRY=;
 b=mcqLMkH9PsDkMfugEJIKsysEpBRkET8V2q9fT6Xb+C4iqUZTceNDngLFzMArtKycoh
 CNzZIdYYLAAZsq7yPv1l5e6SX7hHLg7L0FfUo+pi4WZ6152TWqQkSI5O851RRpjCS0sd
 Hir2QKaoRnszVL/JtyndIXQJTXCUq7k8QVvgDau6WmzTZxZ981gN7fX0PwJ99hNFFp1a
 Ryz1IS4fLtrrR5y3SlH63wBNcWvVIcZRDkb0HyhM4UCq/jXUA+f3VjmVeBmvFO/G62BO
 6iT/V12g/PdhhSno1o7muIFmxYSLSpwpDbSce/7KvIxkB90WMUe9S3mwgXbpT8FN4lLq
 7f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9y+xQerG7o8f0xpkTQNL0kHWd//IRK7WsRPUjIKkRY=;
 b=wTCZ9jO19Dp1SNq4ZclOeQYKFO7Y02jBdaVxQ1PlWNhhgu4wH6SX4qlnPrmvHjkXvP
 U/ZHt5GzwmWsNochHSIMBkY2qD6IFtUcNY88SFYwbbLilxQmPiN+xuqdvbEEjPBG1B6E
 yvwiqphaWiXrctN9QHJiacxA+3ZOXX4u05z70xagYF8NECigQXSipeIu2iFaRt7O9Oan
 527u8dmqJa6kecpM0BZu+oOy6qtdWeIaBWaiL2GUE8SJVtz1d6P8gabVQ1lVvqCJx9kZ
 qm6b8ZtEkRdvtPVyUwqAidgCy7bLimqU1U0MzvZUo7oi9HiNupjCBODdaEN2uMkb/lA6
 QmXA==
X-Gm-Message-State: AOAM532i8BlqdmxC5j9kGaEGl4Y66z0T8FnZYLWoR1yPOSoK4DQ3sAb0
 Tmay8v+9USvp5psQlGLbQ/whQaUDce5E7QPhBw==
X-Google-Smtp-Source: ABdhPJxhZHoUdofDUetTejGKDGs97K7es5I2NpHzVQXbOgFXN4QeOorOIohQEZKVBrZTuQ3Kjjkl2YDcxUYjICHnppM=
X-Received: by 2002:a05:6512:2243:b0:448:6830:ee82 with SMTP id
 i3-20020a056512224300b004486830ee82mr9663503lfu.262.1647202948325; Sun, 13
 Mar 2022 13:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
 <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
In-Reply-To: <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 13 Mar 2022 22:22:17 +0200
Message-ID: <CAKKbWA7Pr8Gi-rU5_BZ32y5aiLV0tSM19WkRe+zF8spWdk5zMg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING@nuvoton.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, Medad CChien <medadyoung@gmail.com>,
 Borislav Petkov <bp@alien8.de>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 11, 2022 at 11:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 11/03/2022 02:42, Medad CChien wrote:
> > Add support for Nuvoton NPCM SoC.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > ---
> >  drivers/edac/Kconfig     |   9 +
> >  drivers/edac/Makefile    |   1 +
> >  drivers/edac/npcm_edac.c | 714 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 724 insertions(+)
> >  create mode 100644 drivers/edac/npcm_edac.c
> >
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index 58ab63642e72..757e1d160640 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -539,4 +539,13 @@ config EDAC_DMC520
> >         Support for error detection and correction on the
> >         SoCs with ARM DMC-520 DRAM controller.
> >
> > +config EDAC_NPCM
> > +     tristate "Nuvoton NPCM DDR Memory Controller"
> > +     depends on ARCH_NPCM
>
> || COMPILE_TEST
> (and test if it compiles)
>
> (...)
>
> > +
> > +MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
> > +
> > +static int npcm_edac_mc_probe(struct platform_device *pdev)
> > +{
> > +     const struct npcm_edac_platform_data *npcm_chip;
> > +     struct device *dev = &pdev->dev;
> > +     struct edac_mc_layer layers[1];
> > +     const struct of_device_id *id;
> > +     struct priv_data *priv_data;
> > +     struct mem_ctl_info *mci;
> > +     struct resource *res;
> > +     void __iomem *reg;
> > +     int ret = -ENODEV;
> > +     int irq;
> > +
> > +     id = of_match_device(npcm_edac_of_match, &pdev->dev);
> > +     if (!id)
> > +             return -ENODEV;
>
> Why do you need it? How such case is even possible?
>
> > +
> > +     npcm_chip = of_device_get_match_data(&pdev->dev);
> > +     if (!npcm_chip)
> > +             return -ENODEV;
>
> I wonder, how is it possible to have here NULL?
>
Both of_match_device() and of_device_get_match_data() can return NULL,
are we missing something?

> Best regards,
> Krzysztof

-- 
Regards,
Avi
