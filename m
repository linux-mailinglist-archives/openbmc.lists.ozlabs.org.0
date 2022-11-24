Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BBB637D1E
	for <lists+openbmc@lfdr.de>; Thu, 24 Nov 2022 16:39:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJ2HK0QS5z3cct
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 02:39:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pAd5o1mD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pAd5o1mD;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJ2GS3RDsz3f2q
	for <openbmc@lists.ozlabs.org>; Fri, 25 Nov 2022 02:38:55 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id s8so3047820lfc.8
        for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2022 07:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D+oPkZf+GhfgQrKgiZPW3MBbJ+ctJWRY4GDqWnQ3KJw=;
        b=pAd5o1mDKoJlLHYuEBrsAdp97sFCOalRl7ZCuIjJ5TJeysxEpSt0XnQTZQNpAWfRxD
         l+OwBw38RqoTdZqummg3ixL4VK2aGhoUF05LvfvJ6IH0w2vMk1mCMdBUKYq3JjVl5ZGX
         63X/lcyXIwwW7NS+XsC37pKsONBwJsH7JqCJlxe5nE2OCh/Tu5gzxvFMxZ2M0RiPRZZ+
         hxoXQEbOdd5FT/5+JZUX9qYhUS0n+1QLIyCo0vm0SCIyGwC2m0jb9PPuqSxybCJCL/8S
         7Hk6RiLMSznbCDMmqjusKWoFoMQTzBiyp8YbkNpxd+b0Ql7etJWE3YTB+XiKf+Fx1xY7
         G/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+oPkZf+GhfgQrKgiZPW3MBbJ+ctJWRY4GDqWnQ3KJw=;
        b=zQG1VOXfvuTBOjOL3LnRJzj8ALRaJBq9UKbh8ruuGUqmx10DuL/vmkIdfkm/gaa2aF
         /8lyxpu5ikRLdIwQMDpSAOZzRwyOpKfULQNpaQtaf+1uJR3RlnnY31tbJ6jdd4yR2Y/M
         gq7PhkI+FFFsnmTt5Dr92s4Fabpfup6EAKKFfbfnv6wV/bZedeSViO9Rau6QCtW+UckR
         Ean9FRV6+JajEszYaszMcdl9qZ7BhuleaAP0ennVXFSGxabG7SO0vtlRKVtSVkpWt/zp
         4q/Wz8mZg3NgfRFJzIFIbcWs6LS+vQvrIzSMYU3EtcPS432FwffVWCF4Mb08w3nqUkQ7
         XaPQ==
X-Gm-Message-State: ANoB5pnRhWaN9aQqzGIpk4Z196VQmLgQu72iMpW8bQlqNV0MJkZMbVTC
	fq6bGnuqQ0PUOdiqlYyf1wPUNX33tLkBGiY2K9E=
X-Google-Smtp-Source: AA0mqf6HsXQhF0DuR+7Wf3ySK3+lEUJMnOoMStylksqgUclTIEYHWGoDP2vvobF8sQuaz0QLvF326DqzQon/i2S9fnw=
X-Received: by 2002:a05:6512:2116:b0:4b4:b904:a310 with SMTP id
 q22-20020a056512211600b004b4b904a310mr10492674lfr.576.1669304329613; Thu, 24
 Nov 2022 07:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122201232.107065-1-tmaimon77@gmail.com> <20221122201232.107065-2-tmaimon77@gmail.com>
 <cedc0013-f0c0-3180-6995-477b77b919f8@linaro.org>
In-Reply-To: <cedc0013-f0c0-3180-6995-477b77b919f8@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 24 Nov 2022 17:38:38 +0200
Message-ID: <CAP6Zq1iGwqOVOnhmF0ijYw=KoTRJj5CUpFv6WDouZmjVxXhQ-g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
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
Cc: hasegawa-hitomi@fujitsu.com, devicetree@vger.kernel.org, briannorris@chromium.org, benjaminfair@google.com, arnd@arndb.de, sven@svenpeter.dev, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, marcan@marcan.st, nicolas.ferre@microchip.com, tali.perry1@gmail.com, conor.dooley@microchip.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, heiko@sntech.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks a lot for your comments.

On Wed, 23 Nov 2022 at 12:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/11/2022 21:12, Tomer Maimon wrote:
>
> 1. Subject: drop second, redundant "documentation" (dt-bindings are
> documentation).
O.K.
>
> 2. Use subject prefixes matching the subsystem (git log --oneline -- ...).
this is what I did dt-binding: soc: nuvoton... do you mean dt-binding: nuvoton.
>
> > Added device tree binding documentation for Nuvoton BMC NPCM BIOS Post
> > Code (BPC).
> >
> > The NPCM BPC monitoring two configurable I/O addresses written by the
> > host on Low Pin Count (LPC) bus.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/soc/nuvoton/npcm-lpc-bpc.yaml    | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml b/Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
> > new file mode 100644
> > index 000000000000..2c8e66546891
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
>
> Filename should match compatibles, at least in the "vendor,device"
> style, so for example: nuvoton,lpc.yaml
>
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/nuvoton/npcm-lpc-bpc.yaml#
>
> LPC is a generic bus, so this should not be in "soc" directory. Where?
> Depends what is this... Generic bus bindings could be in "bus" directory
> or dedicated "lpc", if we have more of these.
The BPC can run also on the eSPI bus therefore I think it better to
remove the LPC and describe only the BPC module it self.
>
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton Low Pin Count (LPC) Bus Controller
> > +
> > +maintainers:
> > +  - Tomer Maimon <tmaimon77@gmail.com>
> > +
> > +description:
> > +  The Low Pin Count (LPC) is a low bandwidth bus that is used to connect
> > +  peripherals around the CPU and to replace the Industry Standard Architecture
> > +  (ISA) bus.
>
> You need to decide whether you describe here bus, bus controller or
> device on the bus.
>
> > +
> > +  The Nuvoton NPCM LPC bus is a bridge of host CPU to a several of peripheral
> > +  devices.
>
> LPC bus is a bridge? It's either incorrect or so generic that every bus
> is a "bridge"?
>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - nuvoton,npcm750-lpc
> > +          - nuvoton,npcm845-lpc
> > +      - const: simple-mfd
> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
> > +
> > +patternProperties:
> > +  "^lpc_bpc@[0-9a-f]+$":
>
> No underscores in node names. Generic node names, so maybe "bpc"
>
> This also does not match your example at all.
>
>
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    description:
> > +      Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable I/O
> > +      addresses written by the host on the Low Pin Count (LPC) bus, the capure
>
> typo: capture
>
> > +      data stored in 128-word FIFO.
> > +
> > +      NPCM BPC supports capture double words, when using capture
> > +      double word only I/O address 1 is monitored.
>
> This sentence is not grammatically correct. BPC supports capturing
> double words when using double word capturing? Aren't these two sentences?
>
> > +
> > +    properties:
> > +      compatible:
> > +        items:
>
> No items here.
>
> > +          - enum:
> > +              - nuvoton,npcm750-lpc-bpc
> > +              - nuvoton,npcm845-lpc-bpc
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      interrupts:
> > +        maxItems: 1
> > +
> > +      nuvoton,monitor-ports:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Contain monitor I/O addresses, at least one monitor I/O address
>
> Contains
>
> But you need to explain what are these... I/O addresses on the bus?
>
> > +          required.
> > +
> > +      nuvoton,bpc-en-dwcapture:
> > +        description: If present, Enable capture double words support.
>
> Is it the same as reg-io-width?
>
> > +        type: boolean
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - interrupts
> > +      - nuvoton,monitor-ports
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - ranges
> > +
> > +additionalProperties:
> > +  type: object
>
> No, only bus schemas could have it. Here additionalProperties: false.
>
> It seems there are already few LPC controllers and all are put in
> different places:
> Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
> Documentation/devicetree/bindings/arm/hisilicon/low-pin-count.yaml
>
> Maybe Rob why this was made not really as two bindings - for bus
> controller and devices?
As mention above, next patch I will describe only the BPC device.
>
> Best regards,
> Krzysztof
>

In general, I waiting for Arnd approval for adding the NPCM BPC driver to SoC.
After Arnd approval, I will send a new patch revision.

Best regards,

Tomer
