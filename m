Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0880E66E
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 09:42:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bfNZnSGy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqBv339V3z3bsP
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 19:42:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bfNZnSGy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqBtS1QQ6z30YP
	for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 19:41:50 +1100 (AEDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50c02628291so5668858e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 00:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702370504; x=1702975304; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPld8vpr14XTiVIBO9OqUWjltLKOYMI1v6JQhvMLahY=;
        b=bfNZnSGysBnJgN4gx+b6qvTbYLJgx7HksE+rP8P6mJkXm0yPzubOXST+J9L23y56qo
         3NzI+YlT5GU0JiY9AzEb4h/jAgV0LTG9R/LrqOITI69XXlXBNV3903RIMyBQr53XyvHG
         /mMTCgzhwH6dooOduVSFue+oHQm0ibmzW4Tbm4yLlZLXADN66O7EUR5wMa6ff1U3gZST
         pTgTZ/V/MiTDMu25XLx5QeNvjQzG3NKV2tAFK/tftXoTLYi9Nj6uaUE80tKi2wAhzirP
         RD7JJdoyv+at0GZcnpb2JKNMgs1/ZrbZwBuE6cSbBcTj02YDRhlZnBlhavM/++wMoQzy
         TIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370504; x=1702975304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPld8vpr14XTiVIBO9OqUWjltLKOYMI1v6JQhvMLahY=;
        b=FC9sWWe8AWl+JwYQqKLe39VWTpI1xi0H0DXICwlUMg0Y6cixyKaSMHyoj+QYA2JtEr
         kWqCFYhzoig2KtgiCfr5bqe6Osg9j4/HQX/PZf4Ybw4351gmRe86j+Q+jJnNKW9Qd8Vv
         k9WOrHh+CG9upjU1GRi943drzaje6P7PYI9kLVb5qszEpgqg6Qt8msxZdYc4eHClxIau
         DnLWwxWL7tbk1GYbpgdrDznVmlYeBit32kqp5fsfPouRpaVVMQuTtKKJC8IuOs3WhF2/
         /R6JYb0bNPIisefm7Bc+wYibjrqfLRyFVZJzcxh2wo65CV5gbnaoHAwYprIZ/y+H4NYQ
         oXgQ==
X-Gm-Message-State: AOJu0YxzHtwjrZytMk/U0jWTqNWX00QkcnM933T4oxCx7YZxCNErwSUx
	oUQ+8jguMaCZvKfkUsg7rEGLkPrhYq7keQrNPhMdexmdkPiu3w==
X-Google-Smtp-Source: AGHT+IEnmLpJcpamygkwP+7KOsXkqETOpVob6/2P22G2CYhFSXy52IIq0Hg6V/NCKv/PygX9xNpkXY0DHWV/woCamb0=
X-Received: by 2002:a05:6512:2019:b0:50b:d764:8046 with SMTP id
 a25-20020a056512201900b0050bd7648046mr2243403lfb.121.1702370503834; Tue, 12
 Dec 2023 00:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20231212065147.3475413-1-jim.t90615@gmail.com>
 <20231212065147.3475413-2-jim.t90615@gmail.com> <72fe6f18-e3d7-4c74-9734-01a33dc8e100@molgen.mpg.de>
In-Reply-To: <72fe6f18-e3d7-4c74-9734-01a33dc8e100@molgen.mpg.de>
From: Jim Liu <jim.t90615@gmail.com>
Date: Tue, 12 Dec 2023 16:41:32 +0800
Message-ID: <CAKUZ0+Ekx=-G0V1OXXdQCraL+sAXvmZffT65iLsGJ2QHs=1cAg@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: andy@kernel.org, KWLIU@nuvoton.com, conor+dt@kernel.org, Rob Herring <robh@kernel.org>, linus.walleij@linaro.org, Jim Liu <JJLIU0@nuvoton.com>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul

Thanks for your review.
I will modify it in the next version.

Best regards,
Jim

On Tue, Dec 12, 2023 at 3:00=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Jim,
>
>
> Thank you for your patch.
>
> Am 12.12.23 um 07:51 schrieb Jim Liu:
> > Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver
> >
> > Signed-off-by: Jim Liu <jim.t90615@gmail.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> As you seem to be employed by Nuvoton, should your company/work email be
> listed somehow, and even be used for the author address?
>
> > ---
> > Changes for v9:
> >     - no changed
> > Changes for v8:
> >     - no changed
> > Changes for v7:
> >     - no changed
> > ---
> >   .../bindings/gpio/nuvoton,sgpio.yaml          | 86 ++++++++++++++++++=
+
> >   1 file changed, 86 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgp=
io.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml =
b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> > new file mode 100644
> > index 000000000000..84e0dbcb066c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
> > @@ -0,0 +1,86 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/nuvoton,sgpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton SGPIO controller
> > +
> > +maintainers:
> > +  - Jim LIU <JJLIU0@nuvoton.com>
> > +
> > +description: |
> > +  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
> > +  Nuvoton NPCM7xx SGPIO module is combine serial to parallel IC (HC595=
)
>
> s/is combine/combines a/
>
> > +  and parallel to serial IC (HC165), and use APB3 clock to control it.
>
> use*s*
>
> > +  This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
>
> Only one space before the (.
>
> > +  NPCM7xx/NPCM8xx have two sgpio module each module can support up
>
> =E2=80=A6 modules. Each module =E2=80=A6
>
> > +  to 64 output pins,and up to 64 input pin, the pin is only for gpi or=
 gpo.
>
> 1.  Space after the comma.
> 2.  64 input pin*s
>
> > +  GPIO pins have sequential, First half is gpo and second half is gpi.
>
> have sequential ?.
>
> > +  GPIO pins can be programmed to support the following options
> > +  - Support interrupt option for each input port and various interrupt
> > +    sensitivity option (level-high, level-low, edge-high, edge-low)
>
> option*s*
>
> > +  - ngpios is number of nuvoton,input-ngpios GPIO lines and nuvoton,ou=
tput-ngpios GPIO lines.
> > +    nuvoton,input-ngpios GPIO lines is only for gpi.
>
> s/is/are/
>
> > +    nuvoton,output-ngpios GPIO lines is only for gpo.
>
> s/is/are/
>
> It=E2=80=99d be great if you mentioned the datasheet name and revision in=
 the
> description.
>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,npcm750-sgpio
> > +      - nuvoton,npcm845-sgpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  nuvoton,input-ngpios:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The numbers of GPIO's exposed. GPIO lines is only for gpi.
>
> s/is/are/
>
> > +    minimum: 0
> > +    maximum: 64
> > +
> > +  nuvoton,output-ngpios:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The numbers of GPIO's exposed. GPIO lines is only for gpo.
>
> s/is/are/
>
> > +    minimum: 0
> > +    maximum: 64
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - interrupts
> > +  - nuvoton,input-ngpios
> > +  - nuvoton,output-ngpios
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    gpio8: gpio@101000 {
> > +        compatible =3D "nuvoton,npcm750-sgpio";
> > +        reg =3D <0x101000 0x200>;
> > +        clocks =3D <&clk NPCM7XX_CLK_APB3>;
> > +        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
> > +        nuvoton,input-ngpios =3D <64>;
> > +        nuvoton,output-ngpios =3D <64>;
> > +    };
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul Menzel
