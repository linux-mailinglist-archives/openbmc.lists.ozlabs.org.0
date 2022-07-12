Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97435718AB
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 13:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhzFt5SRVz3c4N
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 21:35:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qSZV1HIT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qSZV1HIT;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhzFS2S14z3bl6
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 21:35:08 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id bp17so5596036lfb.3
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CAogKIT73o6WsGNfWbcRAMtgA4sSrigPm6Y2Wj+ZIcw=;
        b=qSZV1HITDQyra3oc8/Oct9IzQ3sM8J+s9EtxXRlZ/MQIe5FVJxIrUL14RFtKJwwhqH
         M+oPvCc14LE/E+dTXMIe5VNJUrWornG2dgBWYqkTgZrlC0/RPnGYJJLxEpdoMfx1Og8/
         YBmVAp9iRPVjrqWSHnQxw6klk70DohWWLKOxd72zv9XfYobIbk7wmVMC2qQCqPeDFg1R
         hVJLMG6PEO4Ksd626xiB1Gs2GZ9SeFienidPedvCIj/y3ldJPkI04wQ6duxbwvgKjHFt
         dXPcMHCWi9reAIB141hZFIkaYYovI9Y8ycx4lLB/eJVp/x02Njt2O8TbMivWRn/x2Dwc
         NRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CAogKIT73o6WsGNfWbcRAMtgA4sSrigPm6Y2Wj+ZIcw=;
        b=BmMsOCx+jeq86dV66ND9ZycNpVC+bmivpLBpYxunMvJTrGzxBYuEgkwhhb1QxZEen+
         6XdnwGHedvbmyo9NfJI1XO6/7nYBiML3nRYdTASr/lPPQmqjcDk0vBSIVzuxwETsBTtO
         KUUIcqZXt7v9cXnRett8dkQ+9S2/nBdLx1/6KPvawypMRT0jDsH0GdYxIMPMc+w3rEON
         IQuqyJxH9vHNjxmsNJIHDNA8a9GQ2Sq8uYbT/i1lcfGLVZWvti9rPO9F9NiPuQ3lcYlS
         A3xBJuJHlSpnhrrCdyEwLzHyNegMWNkA8jDvQ3R/hC0jYJcymgq7hB+2h0qEiAs++c6S
         S5Cw==
X-Gm-Message-State: AJIora8QgtNti5PMm1cvcMZcU+wiFCrENVy8xYmWUFnbunZCP+hfTrP1
	hsO9i8lGRWI0VoWO9NkFKOkGJgWgWUCrz5dp8WI=
X-Google-Smtp-Source: AGRyM1u25zmSsKgmzNKlKp3f5zvdI6W3e74UTp2OHlKEAXvvMqdmUpMqS1A3mQZX0T2H0c71x9pVprhZe5mBHdElQZg=
X-Received: by 2002:a05:6512:3f84:b0:489:3345:c459 with SMTP id
 x4-20020a0565123f8400b004893345c459mr14908703lfa.576.1657625704786; Tue, 12
 Jul 2022 04:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-3-tmaimon77@gmail.com>
 <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org>
In-Reply-To: <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 12 Jul 2022 14:34:53 +0300
Message-ID: <CAP6Zq1h=JjODnmPjwwEbrThGU8kQOX08Z1NipaJx_Gcwg1s1FQ@mail.gmail.com>
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

HI Krzysztof,

Thanks for your comment, they will be addressed next version,

On Tue, 12 Jul 2022 at 12:50, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/07/2022 12:21, Tomer Maimon wrote:
> > Add pinctrl and GPIO controller driver support to Arbel BMC NPCM8XX SoC.
> >
> > Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
> > pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
> > period time.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> (...)
>
> > +
> > +static int npcm8xx_pinctrl_probe(struct platform_device *pdev)
> > +{
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
> > +             syscon_regmap_lookup_by_compatible("nuvoton,npcm845-gcr");
>
> No. Use property. By this patchset, I would expect that you learnt from
> previous mistakes around this. Why repeating the same trouble second time?
>
> > +     if (IS_ERR(pctrl->gcr_regmap)) {
> > +             dev_err(pctrl->dev, "didn't find nuvoton,npcm845-gcr\n");
> > +             return PTR_ERR(pctrl->gcr_regmap);
> > +     }
> > +
> > +     ret = npcm8xx_gpio_of(pctrl);
> > +     if (ret < 0) {
> > +             dev_err(pctrl->dev, "Failed to gpio dt-binding %u\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     pctrl->pctldev = devm_pinctrl_register(&pdev->dev,
> > +                                            &npcm8xx_pinctrl_desc, pctrl);
> > +     if (IS_ERR(pctrl->pctldev)) {
> > +             dev_err(&pdev->dev, "Failed to register pinctrl device\n");
> > +             return PTR_ERR(pctrl->pctldev);
> > +     }
> > +
> > +     ret = npcm8xx_gpio_register(pctrl);
> > +     if (ret < 0) {
> > +             dev_err(pctrl->dev, "Failed to register gpio %u\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     pr_info("npcm8xx Pinctrl driver probed\n");
>
>
> No pr_ in devices. No success debug messages.
>
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id npcm8xx_pinctrl_match[] = {
> > +     { .compatible = "nuvoton,npcm845-pinctrl" },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, npcm8xx_pinctrl_match);
> > +
> > +static struct platform_driver npcm8xx_pinctrl_driver = {
> > +     .probe = npcm8xx_pinctrl_probe,
> > +     .driver = {
> > +             .name = "npcm8xx-pinctrl",
> > +             .of_match_table = npcm8xx_pinctrl_match,
> > +             .suppress_bind_attrs = true,
> > +     },
> > +};
> > +
> > +static int __init npcm8xx_pinctrl_register(void)
> > +{
> > +     return platform_driver_register(&npcm8xx_pinctrl_driver);
> > +}
> > +arch_initcall(npcm8xx_pinctrl_register);
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_AUTHOR("tomer.maimon@nuvoton.com");
> > +MODULE_DESCRIPTION("Nuvoton NPCM8XX Pinctrl and GPIO driver");
>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
