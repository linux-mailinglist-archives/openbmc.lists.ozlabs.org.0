Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD8E57378B
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 15:36:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ljdtx4WQsz3c3S
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 23:36:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h9bIngDN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h9bIngDN;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjdtW4GbQz3000
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 23:36:02 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id r9so11099651lfp.10
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 06:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYKoXtQBi+UHHvlNJzsiB51zZLZoDshebAIvkG4Ze80=;
        b=h9bIngDNE7y+/fKX/oHw7+azOdfnTz2i7MgBHs5a3O0NBQRb9Jhkr8NN2D43RoxyaQ
         JfUUqNxRf2r2xyx2nr4o8UNpakeH0ch8O8dWrBQI6SYIqEOWBlqDbVQ3TBs4GPXW6srI
         p5ZXpOypyN4OimKhc5jlB186gygVDd4N0/Qii6mfN6TSSuKSh/11YEtz9bf/yameG/xy
         iC6f3xvZ8U3eAj68RJBuEiLDxNrnb0yGrSf/Qbvq9YIypvHGX/XJ+oApN9+olMdZ0pQA
         sSJA4NHPhXzcg87Q+SzqCMW0+e0mS4OdDvc7z5y6nJuyk6I2OyYTaAh7tLbCfJJadw7b
         srWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYKoXtQBi+UHHvlNJzsiB51zZLZoDshebAIvkG4Ze80=;
        b=yPez5psEc2OpHvq/GHF0WhzWsTRif9YNCNyef1/ADuvDiSjSOB0veQktoQNsCNemfp
         OdZAXMW3mI2M4jm4CfOWEG3BZuw8Uxe34COCmAdZ1NUZXGLO8yK3rylFXFsjYyvGTM9/
         4mMiD4pdMVIJWZlZncBQoUdXYg6dq4o8U+ufwTeH28kLh3PRUoZ3iOj9bYIXLgjOjRMt
         gnbUn+LnxDFp3Mz3Ysn4fZ45gegaHUcaJCTO+7zCSPar0Uwt4kgIOWz1V3IYeTA4WN9B
         2kC5b3RxQNOU9xE8MhfbWi9UNLasjLuPRMW4RlU8gLpdjJRMt5zIA2XXutVETUnZGjy4
         8Udg==
X-Gm-Message-State: AJIora8hcS5NqwNom3P6o9YCzCXKxZyb+e3TUzIzrJO9l9MCtcJ2WC0Y
	EZ/7lxbhP+JGN4R2Hfgg/brlQUpxZlvbnUd245k=
X-Google-Smtp-Source: AGRyM1vZwX/9j0zxDeNWK/kUwAPgULFU7qG8J/00nPnrZg/qF45PRYUI3V3dq8xEhcBmSYrsRfjR+Ysv5M0gTCzqdeo=
X-Received: by 2002:a05:6512:2382:b0:48a:24d:51cc with SMTP id
 c2-20020a056512238200b0048a024d51ccmr1936006lfv.108.1657719355396; Wed, 13
 Jul 2022 06:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220710102110.39748-1-tmaimon77@gmail.com> <20220710102110.39748-3-tmaimon77@gmail.com>
 <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org>
In-Reply-To: <95d12b72-be9d-5503-c4ea-801303bb7776@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 13 Jul 2022 16:35:43 +0300
Message-ID: <CAP6Zq1geFJsKrdQEN5Vqjw6e8bsiArDe1tzJ-jkQm-2XT-0KyQ@mail.gmail.com>
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

Hi Krzysztof,

Thanks for your comments.

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
You suggest to use phandle property like nuvoton,sysgcr even that the
NPCM8XX pin controller driver is used only NPCM8XX SoC, so the only
GCR node in the NPCM8XX SoC is nuvoton,npcm845-gcr?
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
