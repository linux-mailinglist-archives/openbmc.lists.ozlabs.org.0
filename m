Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F478AB0B
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 12:27:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jlBsnOB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ6FX0r64z30hj
	for <lists+openbmc@lfdr.de>; Mon, 28 Aug 2023 20:27:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jlBsnOB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ6Dt6sqPz2ygx
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 20:27:09 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso44166031fa.0
        for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693218420; x=1693823220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MOacA8ojmJi7uydWsnw+vyq5eodj37noaLcY/uneysk=;
        b=jlBsnOB6z4KU50q4rbP0U8Xgd9MChxqe63qS2usMkMX5pgr7oaxFCeNxLuFSo2Av8k
         PCySUWpQ937RovneZq+SX1nMrMVatMzTLxiIYnLmJpCodgmVGhjsqkH357J0G35KJ5jP
         GXboBpyrUqqhYvYl3tPdSsr5V3CkFLA3dfDMZTO8bpURSqPv0rNtCie9Dr2fSPyWRnoE
         jNItO1llflucm0hAjxBnhzPox7A4B1rw6fJeiwu6aQZTg6mrxotAnkUE8ULhDNFhcK0U
         /ONtY6G2VU09s8hzDoJNVNa9CCkKQfIV9dRLsR/1UGzmiLoEIohme9D4XH68n4OcJqbx
         g+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693218420; x=1693823220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOacA8ojmJi7uydWsnw+vyq5eodj37noaLcY/uneysk=;
        b=cEQxA6jA+Z15xEXwC0uiuuuKyFP1IPkv2WGz/QaWdZrWbAwvPGBh44tLFAaWfCazhf
         n7x4vyce6as58teDAbpNFgRnHaVNpJcTWMMLDU8HbUeT/GHAdl7NoAREuvpBsHtnpdzv
         ZSGDnXRWiwBzdnPXMk1MSeGpyt7lslfCK0s+8KPG5I0Yrjk7q0acVf7fy76prqhbc0OY
         TSZXd55P4eV8RqjRBarh/CrLKIDd3s01SUR3F/ijnaF1RIypEe/yIrtWD9Y5XPsTVQ97
         tibnF6zgcOEpfWiQHEcJVSUlbjsYa83EYppR4y9QHYyRASXfimDlr8j7nzb0aDyQLc10
         UY1w==
X-Gm-Message-State: AOJu0YyxMNvt/NF88Q3njVMMxaKKcNL3vmlifLX3BKweDIRpHKhRJD0E
	vKq8ndWWSe1/lNjjLC2Lq3Ze9iunUinsNn2gVB4=
X-Google-Smtp-Source: AGHT+IEDrPgEGY0GfDpk0pi8fMwuKJQ0qRtUXLd2M5JPp+MzHCQHn6IogguYmjIzPCiFOBH7gY1VEIc+bFzB4alMpBQ=
X-Received: by 2002:a2e:9210:0:b0:2b7:7c:d5a1 with SMTP id k16-20020a2e9210000000b002b7007cd5a1mr18047149ljg.23.1693218419966;
 Mon, 28 Aug 2023 03:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230827203612.173562-1-tmaimon77@gmail.com> <20230827203612.173562-2-tmaimon77@gmail.com>
 <eccc6a7a-b30f-8c77-77cb-5deef47a1954@linaro.org>
In-Reply-To: <eccc6a7a-b30f-8c77-77cb-5deef47a1954@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 28 Aug 2023 13:26:48 +0300
Message-ID: <CAP6Zq1jj0WDbtL1zhr=tVyh2GPRy6-=oHjVURmJzNRm3n0HBNg@mail.gmail.com>
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

Thanks for your comments

On Mon, 28 Aug 2023 at 10:10, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/08/2023 22:36, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton Arbel BMC NPCM8XX
> > pinmux and GPIO controller.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
>
>
> > +  '^pin':
> > +    $ref: pincfg-node.yaml#
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          A list of pins to configure in certain ways, such as enabling
> > +          debouncing
>
> What pin names are allowed?
Do you mean to describe all the allowed pin items?
for example:
      items:
        pattern:
'GPIO0/IOX1_DI/SMB6C_SDA/SMB18_SDA|GPIO1/IOX1_LD/SMB6C_SCL/SMB18_SCL'
or
      items:
        pattern: '^GPIO([0-9]|[0-9][0-9]|[1-2][0-4][0-9]|25[0-6])$'

is good enough?
>
> > +
> > +      bias-disable: true
> > +
> > +      bias-pull-up: true
> > +
> > +      bias-pull-down: true
> > +
> > +      input-enable: true
> > +
> > +      output-low: true
> > +
> > +      output-high: true
> > +
> > +      drive-push-pull: true
> > +
> > +      drive-open-drain: true
> > +
> > +      input-debounce:
> > +        description:
> > +          Debouncing periods in microseconds, one period per interrupt
> > +          bank found in the controller
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 4
> > +
> > +      slew-rate:
> > +        description: |
> > +          0: Low rate
> > +          1: High rate
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1]
> > +
> > +      drive-strength:
> > +        enum: [ 0, 1, 2, 4, 8, 12 ]
> > +
> > +    additionalProperties: false
> > +
> > +allOf:
> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - ranges
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - nuvoton,sysgcr
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      pinctrl: pinctrl@f0800260 {
>
> Nothing improved here. Test your DTS. This is being reported - I checked.
what do you suggest since the pinctrl doesn't have a reg parameter,
maybe pinctrl: pinctrl@0?
BTW, I have run both dt_binding_check and W=1 dtbs_check, and didn't
see an issue related to the pinctrl: pinctrl@f0800260, do I need to
add another flag to see the issue?
>
> > +        compatible = "nuvoton,npcm845-pinctrl";
> > +        ranges = <0x0 0x0 0xf0010000 0x8000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        nuvoton,sysgcr = <&gcr>;
> > +
> > +        gpio0: gpio@0 {
> > +          gpio-controller;
> > +          #gpio-cells = <2>;
> > +          reg = <0x0 0xB0>;
>
> Keep lowercase hex.
will be done in V7
>
>
> Best regards,
> Krzysztof
>

Best regards,

Tomer
