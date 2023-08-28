Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE178AF34
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 13:44:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y/QXfuGK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ7xv69hKz3bWH
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 21:44:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Y/QXfuGK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ7xL4dD8z2yTx
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 21:43:48 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b962c226ceso46465811fa.3
        for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693223021; x=1693827821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BWMkAnkHARKLrLjYo9K/Jkbh5vwqG4k4wgjjUmMU++Q=;
        b=Y/QXfuGKbQURsu2bBEZ7L18vFnui7V4NALcTfSZrJPtVzP54KWpHaTG2yejj0aitCx
         kSw/9xYbmHog+NTVIadcV/cZmCfVFThJuf4sLp9GM4Ky2osHhV7pNkk68yFLKrS8vraq
         4k4SAevob7WPTvLOZllSrnpH9lM3/gkgEDaS2SLGXquGPloNBj+yRNQuTD7P+GY/SyHe
         QcbNXcnSwWFs9FE+oDMLiWap8dn+hT2tnKt6A0KHx7LCLgLVOn7X8Sp2A9SIT3bSQSli
         IsbjSznCFR6baMKzEaDunlMutdnpouhp42KtAhUIwgiv2Q2Jm4Ivf/lYsXhqlTFm08Vr
         tX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693223021; x=1693827821;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWMkAnkHARKLrLjYo9K/Jkbh5vwqG4k4wgjjUmMU++Q=;
        b=kS1l41e/O9ZQr36fHjvonJvfqKGlmOQ8Oq3/U9t3spR13b4D6RcdaZFJEHfJC80D9w
         OsNa/n/eq6ChAXuOh/UM0Z4ein6Fh9h5EiXntcOVEIdRrZl6pxlJ6BBtbcyiVo2ixfBu
         sy3GT/ZZNg1P3mTE23kBVb3uEifWXkQFwVMd7oCa8BlEpkzsz1C2wAztoBFEX1denzZ0
         rTcuQ02cJEG6JVxledC1MEHwpQkd+ZdPethT/HI6jpVsoDd3CLSYBFX/loMwkTwIh5eQ
         d1CA6G3Ks+niXEk2pK54a8Zstkbwwv8fjggeN3+7WZJ3moS9vKOX3SqMyub1M9F3Ei9z
         JBhQ==
X-Gm-Message-State: AOJu0Yz51YNQ78cgFR+lU8ugcjKh4uSTqx2oJgqj3lyIAr0uvXCHRTpa
	3/DmkjPFd/UlkL1+MJjz6aawUI4KiejNh25NEvQ=
X-Google-Smtp-Source: AGHT+IE7+CAh/eklu6NimyMouFYr6FZluNvPOerDm87ZpPYcTVn0J+ppxwEiPDLA2cln0598N1XEnU/Cl9yQBHR05fw=
X-Received: by 2002:a05:651c:10b5:b0:2bd:d34:d98a with SMTP id
 k21-20020a05651c10b500b002bd0d34d98amr1901847ljn.44.1693223020896; Mon, 28
 Aug 2023 04:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230827203612.173562-1-tmaimon77@gmail.com> <20230827203612.173562-2-tmaimon77@gmail.com>
 <eccc6a7a-b30f-8c77-77cb-5deef47a1954@linaro.org> <CAP6Zq1jj0WDbtL1zhr=tVyh2GPRy6-=oHjVURmJzNRm3n0HBNg@mail.gmail.com>
 <c984d558-11b5-d5ea-9819-7641129de584@linaro.org> <5c0d985a-0492-778c-46b9-80899e52134c@linaro.org>
In-Reply-To: <5c0d985a-0492-778c-46b9-80899e52134c@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 28 Aug 2023 14:43:29 +0300
Message-ID: <CAP6Zq1iX4Rqob0SM-F2SuRYa3QxE4KC8wPzTNQVpTN8JBUPFkA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, conor+dt@kernel.org, benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your clarifications

On Mon, 28 Aug 2023 at 13:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/08/2023 12:36, Krzysztof Kozlowski wrote:
> > On 28/08/2023 12:26, Tomer Maimon wrote:
> >> Hi Krzysztof,
> >>
> >> Thanks for your comments
> >>
> >> On Mon, 28 Aug 2023 at 10:10, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@linaro.org> wrote:
> >>>
> >>> On 27/08/2023 22:36, Tomer Maimon wrote:
> >>>> Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
> >>>> pinmux and GPIO controller.
> >>>>
> >>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> >>>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>>> ---
> >>>
> >>>
> >>>> +  '^pin':
> >>>> +    $ref: pincfg-node.yaml#
> >>>> +
> >>>> +    properties:
> >>>> +      pins:
> >>>> +        description:
> >>>> +          A list of pins to configure in certain ways, such as enabling
> >>>> +          debouncing
> >>>
> >>> What pin names are allowed?
> >> Do you mean to describe all the allowed pin items?
> >> for example:
> >>       items:
> >>         pattern:
> >> 'GPIO0/IOX1_DI/SMB6C_SDA/SMB18_SDA|GPIO1/IOX1_LD/SMB6C_SCL/SMB18_SCL'
> >> or
> >>       items:
> >>         pattern: '^GPIO([0-9]|[0-9][0-9]|[1-2][0-4][0-9]|25[0-6])$'
> >>
> >> is good enough?
> >
> > Something like this. Whichever is correct.
> >
> >>>
> >>>> +
> >>>> +      bias-disable: true
> >>>> +
> >
> >>>> +additionalProperties: false
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>> +    #include <dt-bindings/gpio/gpio.h>
> >>>> +
> >>>> +    soc {
> >>>> +      #address-cells = <2>;
> >>>> +      #size-cells = <2>;
> >>>> +
> >>>> +      pinctrl: pinctrl@f0800260 {
> >>>
> >>> Nothing improved here. Test your DTS. This is being reported - I checked.
> >> what do you suggest since the pinctrl doesn't have a reg parameter,
> >> maybe pinctrl: pinctrl@0?
> >
> > It has ranges, so yes @0 looks correct here.
>
> Wait, your address according to ranges is 0xf0010000, not 0x0, not
> 0xf0800260...
I will modify it to pinctrl: pinctrl@f0010000
>
>
> > Which leds to second
> > question - how pinctrl could have @0? It's already taken by SoC! So your
> > DTS here - unit address and ranges - are clearly wrong.
> >
> >
> >> BTW, I have run both dt_binding_check and W=1 dtbs_check, and didn't
> >> see an issue related to the pinctrl: pinctrl@f0800260, do I need to
> >> add another flag to see the issue?
> >
> > Did you read my message last time? I said - it's about DTS, not the binding.
yes, understood doesn't the dtbs_check check the DTS?
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
