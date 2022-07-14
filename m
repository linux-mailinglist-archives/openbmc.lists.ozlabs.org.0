Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153D574ECD
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 15:15:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkFNT2Mj9z3c5G
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 23:15:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JX1n/jFG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JX1n/jFG;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkFN60Ffpz3bZB
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 23:15:17 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-31c8bb90d09so16386797b3.8
        for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 06:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MRwG+zlBQ+kmeFEt4Mjc7sgEiz7bh2APqSKI/QbwyJk=;
        b=JX1n/jFGRiKmk8qdje4WBbxBW3K6poXkLNK7oNx7J1BajqurACE5r7MuoikJsrHlyq
         WHslv+Mhg2/b5ZawLhmhZvZzeegJpH7HlUck0TRMdu7acvWoIq+gPAOuzTUsRCYiTHNh
         051n6kX1f+IRKf2Q8q9/ZOzaF1pclqMdiV/6Yhiq7enWeEqBAon6e353IAhXYMcSAV1m
         QPVdC0p0S8ZN/pChTDD8AqdgwNcSuU33NCm69+6aFXoZ4xJ5eJnp9w13uKcluXfzIY8X
         qu0pJzKokIFX0SjPraAq0RRCAy3dfnqJkxkTlLkji9XSwut6G5rk4PGB2pHVEC58OEqT
         JAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MRwG+zlBQ+kmeFEt4Mjc7sgEiz7bh2APqSKI/QbwyJk=;
        b=1BWl9BfaO3nd6rYlak8Kl4JW8JoteijDMgDmkXwm5UBLwXLOiwXzwoShntjJNa5FcH
         ooAu1Xy2NaCHoBX5WoR/4APjt81sVZnjsbAeLtNChN1Lb8qYvLL+e24WC5RJjR1Ixhn7
         5fr8V87/MYMgVBlK9q4C+AJlFSzX09lgcsriMVnFmwJ275ioqsCBeMIuFDYne9bCFy2G
         YpX9r1AkrVEUVjEprgImTB9osWe7ex6y15M6zESo/fIzaqcKS7ozZsW3vOTAhAe50xaU
         B6uvAoBZ566MUd8MSiS6NSVJiWMrrgN3DTTdQrmn1VEWFx38xYKuLNeXaQ8J2ZDfvjGA
         VTNQ==
X-Gm-Message-State: AJIora9NOpzCzTRPCGe5ei1fw4IdMvJ7vJ3cUAlJCvTCXUwF5djpGXvU
	ocM/5R8AJWt/1/7NN3qlzC5cv+Ae8R4/6Jn26b8=
X-Google-Smtp-Source: AGRyM1tOHS3ptK/ixYVOdGAyBC75qeMAA3UC+i5MULVUHqOlJ3vMz2IdKDCCsZw93xwst9jve/G/9SCD6kW4WehLyT4=
X-Received: by 2002:a81:4986:0:b0:31d:388b:d08d with SMTP id
 w128-20020a814986000000b0031d388bd08dmr9458913ywa.185.1657804513550; Thu, 14
 Jul 2022 06:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220714122322.63663-1-tmaimon77@gmail.com> <20220714122322.63663-3-tmaimon77@gmail.com>
 <b6a0abb7-f31f-0c8a-f65e-8d61b9e72f48@linaro.org>
In-Reply-To: <b6a0abb7-f31f-0c8a-f65e-8d61b9e72f48@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Jul 2022 15:14:37 +0200
Message-ID: <CAHp75VepYwx9FCf0-7_MO9r7WNqxiTR7MAQcwSL4oNcdgt8qEA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 2:29 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 14/07/2022 14:23, Tomer Maimon wrote:

...

> > +static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
> > +{

Temporary variable, i.e.

  struct device *dev = &pdev->dev;

> > +     struct npcm8xx_pinctrl *pctrl;
> > +     int ret;
> > +
> > +     pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> > +     if (!pctrl)
> > +             return -ENOMEM;
> > +
> > +     pctrl->dev = &pdev->dev;
> > +     dev_set_drvdata(&pdev->dev, pctrl);
> > +
> > +     pctrl->gcr_regmap =
> > +             syscon_regmap_lookup_by_phandle(pctrl->dev->of_node, "nuvoton,sysgcr");
> > +     if (IS_ERR(pctrl->gcr_regmap))
> > +             return dev_err_probe(pctrl->dev, PTR_ERR(pctrl->gcr_regmap), "Failed to find nuvoton,sysgcr property\n");

Will help to shorten the above line(s).

> Please wrap your code according to Linux coding style - @80.

-- 
With Best Regards,
Andy Shevchenko
