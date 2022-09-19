Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0D5BCEEB
	for <lists+openbmc@lfdr.de>; Mon, 19 Sep 2022 16:32:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRwP6ZrQz3bl3
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 00:32:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCY3SQQ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCY3SQQ0;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRw13kKxz30R7
	for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 00:32:16 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id w8so47247379lft.12
        for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2022 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fbOtVx32xD0An1BP4gF5wsbpUuDHf0RuAIKgzeGlyw8=;
        b=oCY3SQQ06GI1T0nc3vcegfw92SJwkc8GhNmDuFea6YzJroQA1iJ/C0VGdrJSgUz9jx
         mApqMR+9XBUm/uurHE2l+5JQHn2ITXWeQV9bcFU0CNL9s/AsShY84T7chTNmXJLWe4wu
         WCP+4EKr9Nr34D7du1LtLHoiWh7Br/ERUuvDz1gBnykah2JOscL2r/aUjHsOHwb9ltbJ
         la5S4xmdhcWePibJaIj099rNjvZPOikrYSFMzzIMFFgI8RfwnlpHlXHB52MRUmJUBjs+
         SdqxwySj5lN9Am7atnFcJv1SQm1DdpFDiYichNtnI6qxbj8CBO8UxKyxH1InjVj1eEj4
         8Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fbOtVx32xD0An1BP4gF5wsbpUuDHf0RuAIKgzeGlyw8=;
        b=0lxr3fStjxGZ6WyOA8PuzS5BMxMV3qRuYEu0EaCUo4CCrTF62oheuLclPUaRwzG7bF
         /l+CpE9D6iJ6g9O7ZBNAxHVRjFeSbSfUKrdJspa9Re3BfWBEkbLigsxyLidovKNCqHpE
         f/BxI8Ozzbp6iMc6YFdqTLlkOp0Zm15RQP3OYRbp95376v4uwfla2J/UE1MNtoSVA8dQ
         yeamFyoZxKEDv/+N9DM+I7wKs6CRlleZDRcYLRfcnHWubKiggYmoqet+h/eieUU5p/aP
         KQ/HZMnvOik+wZiWMDV/d+csqgtjG9TRlX+JhjB1EQChVyVfjBq8bYY//tukz6LJaXxL
         kCDg==
X-Gm-Message-State: ACrzQf34qL0xxo8cO9jRvlWB+wkWvwH6/SIFWI15tXOV3pXuIu51n4vn
	TAMLXpd2+IbmCxK4nNedWTdkk+rT4qzpQHJ9Gu0=
X-Google-Smtp-Source: AMsMyM4TvhQ+C6HD/ZV0YS/n8Apo8lVG6faXAtccFQUMj9KOsAXpl4UCFWGvBlxtGV9MQYWcekd+O4B2UpHaNWuzNlw=
X-Received: by 2002:a05:6512:eaa:b0:497:a1ed:6fa5 with SMTP id
 bi42-20020a0565120eaa00b00497a1ed6fa5mr6073634lfb.108.1663597928023; Mon, 19
 Sep 2022 07:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220714122322.63663-1-tmaimon77@gmail.com> <20220714122322.63663-2-tmaimon77@gmail.com>
 <20220718211046.GA3547663-robh@kernel.org> <CAP6Zq1hQ5m2kkQOKaYsKhPQhCW+vdsdyPRxxb_yRGMB=gJCPdw@mail.gmail.com>
 <3981e6e8-d4bb-b13d-7aaa-7aea83ffaad9@linaro.org>
In-Reply-To: <3981e6e8-d4bb-b13d-7aaa-7aea83ffaad9@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 19 Sep 2022 17:31:56 +0300
Message-ID: <CAP6Zq1gp1ph1wixgb6nL+2R8We2YJ2HQM2iC05itq_XWd2Cwig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
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
Cc: Rob Herring <robh@kernel.org>, Benjamin Fair <benjaminfair@google.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, devicetree <devicetree@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Sorry but I didn't understand,

On Mon, 19 Sept 2022 at 09:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/09/2022 20:28, Tomer Maimon wrote:
> > Hi Rob,
> >
> > Thanks for your comment and sorry for the late reply.
>
> Two months... we are out of the context and this will not help your
> patchset.
>
> >
> > On Tue, 19 Jul 2022 at 00:10, Rob Herring <robh@kernel.org> wrote:
> >>
>
> (...)
>
> >>> +examples:
> >>> +  - |
> >>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +    #include <dt-bindings/gpio/gpio.h>
> >>> +
> >>> +    soc {
> >>> +      #address-cells = <2>;
> >>> +      #size-cells = <2>;
> >>> +
> >>> +      pinctrl: pinctrl@f0800000 {
> >>> +        compatible = "nuvoton,npcm845-pinctrl";
> >>> +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> >>> +        #address-cells = <1>;
> >>> +        #size-cells = <1>;
> >>> +        nuvoton,sysgcr = <&gcr>;
> >>> +
> >>> +        gpio0: gpio@f0010000 {
> >>
> >> gpio@0
> >>
> >> Is this really a child block of the pinctrl? Doesn't really look like it
> >> based on addressess. Where are the pinctrl registers? In the sysgcr? If
> >> so, then pinctrl should be a child of it. But that doesn't really work
> >> too well with gpio child nodes...
> > the pin controller mux is handled by sysgcr this is why the sysgcr in
> > the mother node,
> > and the pin configuration are handled by the GPIO registers.  each
> > GPIO bank (child) contains 32 GPIO.
> > this is why the GPIO is the child node.
>
> Then maybe pinctrl should be the sysgcr and expose regmap for other devices?
The pin controller using the sysgcr to handle the pinmux, this is why
the sysgcr is in the mother node, is it problematic?

>
>
> Best regards,
> Krzysztof

Best regards,

Tomer
