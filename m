Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B631657393B
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 16:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjgYp4DyNz3c4H
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 00:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jQh6xeqT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jQh6xeqT;
	dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjgYP3DXXz3bYd
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 00:51:19 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id w2so13763142ljj.7
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 07:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mkvXwyXw/bzhYex6cozMZMYvSmlbOw/F0RDr0JxPoCw=;
        b=jQh6xeqT+Y6Ki5J436a0Th5YoFQnrEIqTMpRHU8Kce5a+/UIO2lYW5/lFa1+vKHif/
         +vgiXsnypYDq5rqLWPkKY/H2s9pEAvvq+k2Nn9858TvGTxNKoSfgB/2+BmmKtyjlYAE/
         elSX7mcb7soaQVXRiTDheQ+tqwHwksc7vU+uxBH4X4sn9qQ6MtzRMq92WcyTeStczoqx
         fSM5n34/SmQWOTOfxBRkJUMuoEc60KRSxHhSXA93RCJxJU32V6xwFYWBqo0XLCcUVYLu
         lycQEFzMu8MjsuhwNY45beIZaDWKEDh5ZisnCcGU7iakt09piKZmBvTjXdzJdxp3Dajq
         C18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mkvXwyXw/bzhYex6cozMZMYvSmlbOw/F0RDr0JxPoCw=;
        b=gcyhZI+YfT1h1zFCSeh7B06zThAcXmXfJr5+fxhQy5VGZNNYSQP0BU4FLzHJrN+G1o
         u2bO1FUxkIspbPDpY7Nv1yBB1VTJnFF5o69ajEk6d374sHTKvc4HifbLrEl+fqY70d6K
         dM/Da3WbBS5pNASeQ27jViMd4d7FrZq7aLL5TPnPSbYeY6FlSjUvBOnvBqH2UX7CbYaT
         1pKlnGU1yDm1y3zcr+Kuo8kzlK5srZIbbhHuT/RZv9GLJw4iOrMv603dtdemUe2QSvo7
         ArrN+a5zsFw7eHXOceRilS8d7flt2WssXhznJeVdlVIKHTK5sB5grJIwkXmtk/h8fjcl
         bbJw==
X-Gm-Message-State: AJIora9w+TMVyc9RnSv/dww5XgILyfR9EXp7dTKIRUNxvRTTEEKY4hD0
	AfIdt3TqvnhcqHspWCnZZ6dx/hh+3nl3PilTII4=
X-Google-Smtp-Source: AGRyM1vh21YnVuz6etYVlI+CNEjVeXDQ4+b9pRjJCkzY5B8/snbbD68747zNPcfRkAZQlSnUw6MrDr+/TqSgoMhCsaw=
X-Received: by 2002:a2e:9b0b:0:b0:25d:866b:5de7 with SMTP id
 u11-20020a2e9b0b000000b0025d866b5de7mr1941252lji.50.1657723872657; Wed, 13
 Jul 2022 07:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-3-tmaimon77@gmail.com>
 <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org> <CAP6Zq1geFJsKrdQEN5Vqjw6e8bsiArDe1tzJ-jkQm-2XT-0KyQ@mail.gmail.com>
 <d8bc7a14-a9c5-4d34-997a-48a8d27c5edd@linaro.org>
In-Reply-To: <d8bc7a14-a9c5-4d34-997a-48a8d27c5edd@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 13 Jul 2022 17:51:01 +0300
Message-ID: <CAP6Zq1iAPmV9KVrBVqmRix8sTq0zLsw3T1vPo-t1Q+2RgO4qsA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jul 2022 at 17:29, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/07/2022 15:35, Tomer Maimon wrote:
>
> >>> +static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
> >>> +{
> >>> +     struct npcm8xx_pinctrl *pctrl;
> >>> +     int ret;
> >>> +
> >>> +     pctrl = devm_kzalloc(&pdev->dev, sizeof(*pctrl), GFP_KERNEL);
> >>> +     if (!pctrl)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     pctrl->dev = &pdev->dev;
> >>> +     dev_set_drvdata(&pdev->dev, pctrl);
> >>> +
> >>> +     pctrl->gcr_regmap =
> >>> +             syscon_regmap_lookup_by_compatible("nuvoton,npcm845-gcr");
> >>
> >> No. Use property. By this patchset, I would expect that you learnt from
> >> previous mistakes around this. Why repeating the same trouble second time?
> > You suggest to use phandle property like nuvoton,sysgcr even that the
> > NPCM8XX pin controller driver is used only NPCM8XX SoC, so the only
> > GCR node in the NPCM8XX SoC is nuvoton,npcm845-gcr?
>
> Yes. The previous case (reset driver, AFAIR) was also about driver used
> only in one SoC, wasn't it?
Actually not, the NPCM reset driver serves NPCM7XX and NPCM8XX and
probably other future BMC SoC's
Still, you suggest using the phandle property in the driver even if
the driver serves one SoC?
>
> Best regards,
> Krzysztof

Best regards,

Tomer
