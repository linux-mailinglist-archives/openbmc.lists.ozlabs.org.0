Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE59474B9
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 07:38:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FjbAd+c4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WclbW2B7mz3cfB
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 15:38:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FjbAd+c4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=stanley.chuys@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WclZx6vSZz3cCb
	for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2024 15:38:00 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-39b37637977so430055ab.1
        for <openbmc@lists.ozlabs.org>; Sun, 04 Aug 2024 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722836276; x=1723441076; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6LPkoKlOEYKUBrjkr4bO02YY4lDC/XqBltvUaObBqU=;
        b=FjbAd+c4E75BgPPHkOwFCgIhsMB+KLoGvOj6wmypfulK5q8QwsCeBapCIhb3UdBio/
         nKyi6F/lbKUiXMwL99QTsbae1YhOwEf7e5xxfFn9/R0iegB1XVQZeXFwYcm8H/QGlF0+
         Zpl6+HMHjLb6qsSTuftnQ7nZ7G9P2jtiHunaSQ9vPuIcJ5lVe+HhmCa4cm9XrOoC7/2L
         Nv9FV4XhFjxOhNh+ATQtODs8/y5WLaU3dLa/SBVqK+Yp4c6ZZx5266lBU/pp9osn1LK+
         RtnaamrRrBdqsqCAq83aGM6krvAHiCxPZHCRkmLolU98xuDAsVRGIAd7+S/a0jaFnyDo
         0jVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722836276; x=1723441076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6LPkoKlOEYKUBrjkr4bO02YY4lDC/XqBltvUaObBqU=;
        b=NNjtHG83XkQwq0DC+D4YxaG4PbUJ1ICjzmzSJ6npUtXj66P4xEhbKQeJWvTjYZ1Hik
         r4pitvIa1DsKGlIldQX8Cejtg+ipYsC5VZbYUjr8Z3Jgi/chCAaQtbOnAActd3iDt8zq
         H9nZoeIACrqiWBhYb+kbDq9ckQGoWsKaoU/UvB3wWWXW2sF6sMwoPkQy0voTCuthK5Kr
         s6eAost24bGkftD6r18azBIFmK+na6GAgRNUadnPRYvnJdz9jrqcNEeURpspX/kwOzu0
         IRQQJ0ZJF869BCQGmpL9lwm4E1DtBij+rVSXZRYpI0uyrlQmb7XvZRoz1A4R9T2qRiQQ
         73yg==
X-Forwarded-Encrypted: i=1; AJvYcCX+P1nzT8kdZWLrT6RP5LYrVhV3kcRDvFMxsEARgT8sDJ18dKQQnoklxZNkMQR0X5LLkFj1sxnX@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywd13r9fayWACLveLdWgCq9oKF3GPQuWwZ+PfsGWz/ZCkO6kGZH
	QlAgGFf5LvSP3b3Hpu9MUW00a2Kfk/iCGMudxJaH/vA0SXBVzYEu9UWICdmJlSGaku3f+ahE+09
	DwhsX6GnCyqdD4kJpk3U9HGdgjm4=
X-Google-Smtp-Source: AGHT+IF198sb+5kT2eiO9NKzgM6Ilhavu7WvWLEWhaEmOkSuz261ZvEEAdm5+8XB9cazevhD1uwMxwhdqfWbhBsPuZY=
X-Received: by 2002:a05:6e02:1a49:b0:383:17f9:6223 with SMTP id
 e9e14a558f8ab-39b1fb79763mr67942385ab.2.1722836276215; Sun, 04 Aug 2024
 22:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240801071946.43266-1-yschu@nuvoton.com> <20240801071946.43266-2-yschu@nuvoton.com>
 <c3ee7783-6891-4917-9935-21d46d8ac9a7@kernel.org> <202408012306316257ee23@mail.local>
In-Reply-To: <202408012306316257ee23@mail.local>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Mon, 5 Aug 2024 13:37:45 +0800
Message-ID: <CAPwEoQP=++bopg2V2_fqogvM0J1oXX9179CTLA=ZHf3Paegu0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i3c: Add NPCM845 i3c controller
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Cc: robh@kernel.org, yschu@nuvoton.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, kwliu@nuvoton.com, cpchiang1@nuvoton.com, krzk+dt@kernel.org, linux-i3c@lists.infradead.org, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2024=E5=B9=B48=
=E6=9C=882=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=887:07=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On 01/08/2024 16:53:52+0200, Krzysztof Kozlowski wrote:
> > On 01/08/2024 09:19, Stanley Chu wrote:
> > > The npcm845 i3c devicetree binding follows the basic i3c bindings
> > > and add the properties for allowing to adjust the SDA/SCL timing
> > > to meet different requirements.
> > >
> > > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> > > Signed-off-by: James Chiang <cpchiang1@nuvoton.com>
> > > ---
> > >  .../bindings/i3c/nuvoton,i3c-master.yaml      | 123 ++++++++++++++++=
++
> >
> > Use compatible as filename. Anyway word "master" was dropped.
> >
> > >  1 file changed, 123 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/i3c/nuvoton,i3c=
-master.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master=
.yaml b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > > new file mode 100644
> > > index 000000000000..a40b37b16872
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i3c/nuvoton,i3c-master.yaml
> > > @@ -0,0 +1,123 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/i3c/nuvoton,i3c-master.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Nuvoton NPCM845 I3C master
> >
> > Use new terminology. Since 2021 there was a change... three years ago.
> >
> > > +
> > > +maintainers:
> > > +  - Stanley Chu <yschu@nuvoton.com>
> > > +  - James Chiang <cpchiang1@nuvoton.com>
> > > +
> > > +allOf:
> > > +  - $ref: i3c.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: nuvoton,npcm845-i3c
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: I3C registers
> > > +      - description: GDMA registers
> > > +      - description: GDMA request control register
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: i3c
> > > +      - const: dma
> > > +      - const: dma_ctl
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: system clock
> > > +      - description: bus clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pclk
> > > +      - const: fast_clk
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  i3c-pp-scl-hi-period-ns:
> > > +    description: |
> >
> > Do not need '|' unless you need to preserve formatting.
> >
> > > +      If need to configure SCL with required duty cycle, specify the=
 clock high/low period directly.
> > > +      i3c-pp-scl-hi-perios-ns specifies the high period ns of the SC=
L clock cycle in push pull mode
> > > +      When i3c-pp-scl-hi-period-ns and i3c-pp-scl-lo-period-ns are s=
pecified, the i3c pp frequency is
> > > +      decided by these two properties.
> >
> > Wrap according to Linux Coding Style (and read coding style to figure
> > the proper wrapping...).
> >
> > > +
> > > +  i3c-pp-scl-lo-period-ns:
> > > +    description: |
> > > +      The low period ns of the SCL clock cycle in push pull mode. i3=
c-pp-scl-lo-period-ns should not
> > > +      be less than i3c-pp-scl-hi-period-ns and the maximal value is =
i3c-pp-scl-hi-period-ns + 150.
> >
> > Everywhere: defaults, constraints.
> >
> > > +
> > > +  i3c-pp-sda-rd-skew:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      The number of MCLK clock periods to delay the SDA transition f=
rom the SCL clock edge at push
> > > +      pull operation when transfers i3c private read.
> > > +    maximum: 7
> > > +    default: 0
> > > +
> > > +  i3c-pp-sda-wr-skew:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      The number of MCLK clock periods to delay the SDA transition f=
rom the SCL clock edge at push
> > > +      pull operation when transfers i3c private write.
> > > +    maximum: 7
> > > +    default: 0
> > > +
> > > +  i3c-od-scl-hi-period-ns:
> > > +    description: |
> > > +      The i3c open drain frequency is 1MHz by default.
> > > +      If need to use different frequency, specify the clock high/low=
 period directly.
> > > +      i3c-od-scl-hi-perios-ns specifies the high period ns of the SC=
L clock cycle in open drain mode.
> > > +      When i3c-od-scl-hi-period-ns and i3c-od-scl-lo-period-ns are s=
pecified, the i3c od frequency is
> > > +      decided by these two properties.
> > > +      i3c-od-scl-hi-period-ns should be equal to i3c-pp-scl-hi-perio=
d-ns or i3c-od-scl-lo-period-ns.
> > > +
> > > +  i3c-od-scl-lo-period-ns:
> > > +    description: |
> > > +      The low period ns of the SCL clock cycle in open drain mode. i=
3c-od-scl-lo-period-ns should be
> > > +      multiple of i3c-pp-scl-hi-period-ns.
> > > +
> > > +  enable-hj:
> > > +    type: boolean
> > > +    description: |
> > > +      Enable SLVSTART interrupt for receiving hot-join request.
> >
> > You described the desired Linux feature or behavior, not the actual
> > hardware. The bindings are about the latter, so instead you need to
> > rephrase the property and its description to match actual hardware
> > capabilities/features/configuration etc.
> >
>
> This has to be runtime configurable, see hotjoin in
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-i3c
>
Hi Alexandre,
Thanks for the review.
I will remove this property and follow the sysfs method.

>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
