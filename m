Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D2947509
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 08:05:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aWsRkHwS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcmBt4ygDz3cft
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 16:05:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aWsRkHwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcmBM6cKmz3c2K
	for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2024 16:05:14 +1000 (AEST)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-81f8add99b6so39288639f.2
        for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2024 23:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722837911; x=1723442711; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCOiHWZGaBYKEYIV5AXaKQnaZb+4wbF/Gdd5+BsrrYY=;
        b=aWsRkHwS6aCKihm9UribyAPkjkj9UFg9d09bEIjwHiyAOEC07Td4SwFAoBgR1cApfv
         OYbBFmHgk/dxR+dd5VG7o/jvkJj7vnfDU4B1vj+bx1C5MM3kcWTjRUlkHhiO3C1x1W+W
         xAm3y8X+ZduPz0Ssx46+FaQ0qu8dLXROUlxDATEchCCdingtg9/vFJApkxDWAFbOjjWI
         g5emMVoS3RHlnkEbwhkiaKenuSkSbYlWmXm4uyo8vmwdwXzZXzRkNLm08eukZ7tlrAkZ
         /36AvM8Hw8Vtkg/oBuAoyuctovNVE09nBF6ejrJ1emVKqqhIllybufm3lUepdOH50v9p
         plug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722837911; x=1723442711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCOiHWZGaBYKEYIV5AXaKQnaZb+4wbF/Gdd5+BsrrYY=;
        b=g0H3sFwwBvWi5eS+dxOCFmOH7gzlxW2aWdbaLsnGGuFIbsSRuXCzCZFO/62JNo2iX1
         sRGm2WYBaqDU07qlvFsmH4JAnFaetYm7s49konsEXdY5lvURgAkeEfAXK7p0mbEJvnnz
         oNRGHelRjzKq3nTu0rEBmiVsq4ts9NBiQtkiwrI1pOvOaqdIHKExutYNHBnhqyewzb4j
         99a8SEZwKa6X8u8YnQrj8yLIzMo7JgiA8XfSJD2mHHv19THBuRwVywAfxzMo0AJf8VWG
         oI0P5DNIYNZry+FE5QEzuCVoTR80thDp2iwyHrWcCLCgTB9RhS/yVJgiU6rG7nHpO5Gu
         gXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB2Pzngbq/BFJ2rd4a/cKU+bWX8RrSFl/7Etp59pRX5y8rTe31NHHmTM143wBg/1fjfsvHT5ZK@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzvmuG6dbqwnUpjoiCSjxJvDoWlIuJZ9yPxtcXBmncE6REKEdnv
	udVrCEN4lnz1lhLH25/A3ibCrK0T8IkJVzQoNcAUsM9CEi4/g/aqVW7/sa1t81GddKsWqdM1aZH
	2qG7ceFaTA8VQdc2Ct2OgnWp0ZFIPiusRiIQ=
X-Google-Smtp-Source: AGHT+IEvB+oJugvBIutbGfuLyBjvlxjtlFSMweNO8CJuOYGPFKoKfHINvEaiH0X+jIsoGFK0sfrFHX3i+otIJAv9g2E=
X-Received: by 2002:a05:6e02:1c21:b0:383:297a:bdfb with SMTP id
 e9e14a558f8ab-39b1fb736eemr80408035ab.2.1722837911347; Sun, 04 Aug 2024
 23:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240801071946.43266-1-yschu@nuvoton.com> <20240801071946.43266-2-yschu@nuvoton.com>
 <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org>
In-Reply-To: <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 5 Aug 2024 14:04:59 +0800
Message-ID: <CAPwEoQMyUMn0Fp9G68Axk3guYB_+DT9f3AkPJiBCXVin=Dck=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: robh@kernel.org, alexandre.belloni@bootlin.com, yschu@nuvoton.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kwliu@nuvoton.com, cpchiang1@nuvoton.com, krzk+dt@kernel.org, linux-i3c@lists.infradead.org, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=881=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:53=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 01/08/2024 09:19, Stanley Chu wrote:
> > The npcm845 i3c devicetree binding follows the basic i3c bindings
> > and add the properties for allowing to adjust the SDA/SCL timing
> > to meet different requirements.
> >
> > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> > ---
> >  .../bindings/i3c/nuvoton,i3c-master.yaml      | 123 ++++++++++++++++++
>
> Use compatible as filename. Anyway word "master" was dropped.
>
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c-m=
aster.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.y=
aml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > new file mode 100644
> > index 000000000000..a40b37b16872
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i3c/nuvoton,i3c-master.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NPCM845 I3C master
>
> Use new terminology. Since 2021 there was a change... three years ago.
>

Hi Krzysztof,
Thanks for the review.
I will fix it in v2.

> > +
> > +maintainers:
> > +  - Stanley Chu <yschu@nuvoton.com>
> > +  - James Chiang <cpchiang1@nuvoton.com>
> > +
> > +allOf:
> > +  - $ref: i3c.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: nuvoton,npcm845-i3c
> > +
> > +  reg:
> > +    items:
> > +      - description: I3C registers
> > +      - description: GDMA registers
> > +      - description: GDMA request control register
> > +
> > +  reg-names:
> > +    items:
> > +      - const: i3c
> > +      - const: dma
> > +      - const: dma_ctl
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: system clock
> > +      - description: bus clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pclk
> > +      - const: fast_clk
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  i3c-pp-scl-hi-period-ns:
> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.
>
> > +      If need to configure SCL with required duty cycle, specify the c=
lock high/low period directly.
> > +      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SCL =
clock cycle in push pull mode
> > +      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are spe=
cified, the i3c pp frequency is
> > +      decided by these two properties.
>
> Wrap according to Linux Coding Style (and read coding style to figure
> the proper wrapping...).
>

I wiill revise the description and properties in v2.

> > +
> > +  i3c-pp-scl-lo-period-ns:
> > +    description: |
> > +      The low period ns of the SCL clock cycle in push pull mode. i3c-=
pp-scl-lo-period-ns should not
> > +      be less than i3c-pp-scl-hi-period-ns and the maximal value is i3=
c-pp-scl-hi-period-ns + 150.
>
> Everywhere: defaults, constraints.
>
> > +
> > +  i3c-pp-sda-rd-skew:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The number of MCLK clock periods to delay the SDA transition fro=
m the SCL clock edge at push
> > +      pull operation when transfers i3c private read.
> > +    maximum: 7
> > +    default: 0
> > +
> > +  i3c-pp-sda-wr-skew:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      The number of MCLK clock periods to delay the SDA transition fro=
m the SCL clock edge at push
> > +      pull operation when transfers i3c private write.
> > +    maximum: 7
> > +    default: 0
> > +
> > +  i3c-od-scl-hi-period-ns:
> > +    description: |
> > +      The i3c open drain frequency is 1MHz by default.
> > +      If need to use different frequency, specify the clock high/low p=
eriod directly.
> > +      i3c-od-scl-hi-perios-ns specifies the high period ns of the SCL =
clock cycle in open drain mode.
> > +      When i3c-od-scl-hi-period-ns and i3c-od-scl-lo-period-ns are spe=
cified, the i3c od frequency is
> > +      decided by these two properties.
> > +      i3c-od-scl-hi-period-ns should be equal to i3c-pp-scl-hi-period-=
ns or i3c-od-scl-lo-period-ns.
> > +
> > +  i3c-od-scl-lo-period-ns:
> > +    description: |
> > +      The low period ns of the SCL clock cycle in open drain mode. i3c=
-od-scl-lo-period-ns should be
> > +      multiple of i3c-pp-scl-hi-period-ns.
> > +
> > +  enable-hj:
> > +    type: boolean
> > +    description: |
> > +      Enable SLVSTART interrupt for receiving hot-join request.
>
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
>
> > +
> > +  use-dma:
> > +    type: boolean
> > +    description: |
> > +      Enable the i3c private transfers using DMA.
>
> Why wouldn't you enable it always? Where are dma properties for this?
>

I plan to implement a separate dma driver later, this property will be remo=
ved.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clock-names
> > +  - clocks
> > +
> > +additionalProperties: true
>
> Nope, it cannot be true. Look how other bindings are doing this. Why
> implementing something entirely different?
>
> > +
> > +examples:
> > +  - |
> > +    i3c@fff10000 {
> > +        compatible =3D "nuvoton,npcm845-i3c";
> > +        clocks =3D <&clk 4>, <&clk 26>;
> > +        clock-names =3D "pclk", "fast_clk";
> > +        interrupts =3D <0 224 4>;
> > +        reg =3D <0xfff10000 0x1000>,
> > +              <0xf0850000 0x1000>,
> > +              <0xf0800300 0x4>;
>
> Order properties as in DTS coding style.
>
> > +        reg-names =3D "i3c", "dma", "dma_ctl";
> > +        resets =3D <&rstc 0x74 8>;
> > +        #address-cells =3D <3>;
> > +        #size-cells =3D <0>;
>
> Make your bindings complete - you skipped many properties. Why defining
> them if you are not using them and they do not have defaults?
>

Will fix it in v2.

> > +    };
>
> Best regards,
> Krzysztof
>
