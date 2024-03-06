Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944A875B02
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 00:18:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FfXyc619;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrQGd6KZ8z3dXW
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 10:18:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FfXyc619;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqPs75VtQz3vY4
	for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2024 18:56:43 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36540b9885cso1454465ab.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2024 23:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709711799; x=1710316599; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPhPQT45kHdyzdhpdUe+DVL+6CjOwhe9gLeuSsNNlCQ=;
        b=FfXyc619OYzFBUr/MNItogz0JzacD7ZUIhikxqJZtKWMDJSK2cLdI5vg8PVoHwIVGI
         AZroc8Ak0xROoPUP5nR80QZVEIhRZmYIZAKh/AUv3r2oC6BqyFAMq0ugcKmjSGgD/uCr
         lBfmSsrZagReg8y2rXvaQuqkOiaxJzVRJ69ZinlAGtSaGrGUMXa7AlMLJC8zKsH4hYmY
         K/1YgN61xcR2+hT5FUvIScTcXw08fplMXmWOTn9whucD6OOvjQ8Xaz9yBT5libGxwriJ
         q7Rj5Ps4ZF9W+Ui0zzo+Ob+4TAzCxRN+6+ipPPFWDAjxZ/CpJSY1484wAz3cYzWs/4gs
         J40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709711799; x=1710316599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPhPQT45kHdyzdhpdUe+DVL+6CjOwhe9gLeuSsNNlCQ=;
        b=sJsULr4eZH/dW/sRGzF7Pb8B9Wn7UV/I4cjZJkulaw2FQRstqLlh8w9D7PIe5fLO3O
         ffYpXJ6W6vVcQAiC1ssB1oyF2xQJlT+TSeYv5IvLA6pKqM+9Na5GzHO7E6lYUZ7gYsNr
         u3ZsNlgsGTw8V1cL1JdAwCRFD3lrDJbsf5KeF6YXo3L2HhGTvYTDMg+sFW3psJD9VcCG
         rHFTqFU7xLhb+QfSI6U0nrKsYHDXMFJX7Xi17nGWD0jSdytXvyAgJ0OA/URCNqDfI8RQ
         TpIe8jh/HJ7xUxddM4IXTwoAxryoQ25z1nG8184KSKUOuZd7hwj01OJuxv+HecL2nqBg
         OMew==
X-Forwarded-Encrypted: i=1; AJvYcCUyCkaXKfgTVK6tEqDDxXkdPxl+X4kiyUQi/bd7K3FwHypx6jLUW52h98gDaMglhpzSYTBqsJxxUEPQoB+Y+VxuF3rEGAYNQnA=
X-Gm-Message-State: AOJu0YzHXlo+1V67DWN/qulpkLTPhmeNqHKwPkSd50qlQK+D3iW8m1R/
	x9AL1UNYVCn4a68Gbpomp0LKIYgWDqGPYz0/aek6VCZp/tjllwXWrtxxCq808Dsn8OKmMqE52wt
	HvT6ph1PDTEc0Y7pBpzBUCmeoAQw=
X-Google-Smtp-Source: AGHT+IE58vRHwDBTTuXKHgQFQ/UJSqdO7pnSZOi6XVe91c0PQI282+bUYNvb4IHteGaUW+HdSI/Vt7sBb1zhbo8GFCs=
X-Received: by 2002:a05:6e02:12ce:b0:365:102a:ee10 with SMTP id
 i14-20020a056e0212ce00b00365102aee10mr4294177ilm.6.1709711799054; Tue, 05 Mar
 2024 23:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-3-kcfeng0@nuvoton.com>
 <93d67381-34fc-423c-868a-565378c63e09@molgen.mpg.de>
In-Reply-To: <93d67381-34fc-423c-868a-565378c63e09@molgen.mpg.de>
From: Ban Feng <baneric926@gmail.com>
Date: Wed, 6 Mar 2024 15:56:28 +0800
Message-ID: <CALz278YF8FGz=JM83Q=6PeoQmGOJ4dfB8QTu1qbu9p4eSBHi8Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: hwmon: Add NCT7363Y documentation
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Mar 2024 10:18:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

On Wed, Feb 28, 2024 at 3:30=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> Dear Ban,
>
>
> Thank you for your patch.
>
>
> Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
> > From: Ban Feng <kcfeng0@nuvoton.com>
> >
> > Adding bindings for the Nuvoton NCT7363Y Fan Controller
>
> s/Adding/Add/ or even Document bindings =E2=80=A6

ok, fix in v5

>
> Do you have an URL to the datasheet?

I'll add "Datasheet: Available from Nuvoton upon request" per Guenter
suggested in v5.

>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> > ---
> >   .../bindings/hwmon/nuvoton,nct7363.yaml       | 63 ++++++++++++++++++=
+
> >   MAINTAINERS                                   |  6 ++
> >   2 files changed, 69 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nc=
t7363.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.ya=
ml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> > new file mode 100644
> > index 000000000000..1a9d9a5d614e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton NCT7363Y Hardware Monitoring IC
> > +
> > +maintainers:
> > +  - Ban Feng <kcfeng0@nuvoton.com>
> > +
> > +description: |
> > +  The NCT7363Y is a Fan controller which provides up to 16 independent
>
> lowecase: fan controller?

ok, fix in v5

>
> > +  FAN input monitors, and up to 16 independent PWM output with SMBus i=
nterface.
>
> output*s*?

ok, fix in v5

Thanks,
Ban

>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,nct7363
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 2
> > +
> > +patternProperties:
> > +  "^fan-[0-9]+$":
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +    required:
> > +      - pwms
> > +      - tach-ch
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#pwm-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        hwmon: hwmon@22 {
> > +            compatible =3D "nuvoton,nct7363";
> > +            reg =3D <0x22>;
> > +            #pwm-cells =3D <2>;
> > +
> > +            fan-0 {
> > +                pwms =3D <&hwmon 0 50000>;
> > +                tach-ch =3D /bits/ 8 <0x00>;
> > +            };
> > +            fan-1 {
> > +                pwms =3D <&hwmon 1 50000>;
> > +                tach-ch =3D /bits/ 8 <0x01>;
> > +            };
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2ecaaec6a6bf..7b1efefed7c4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15084,6 +15084,12 @@ S:   Maintained
> >   F:  Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> >   F:  drivers/hwmon/nct6775-i2c.c
> >
> > +NCT7363 HARDWARE MONITOR DRIVER
> > +M:   Ban Feng <kcfeng0@nuvoton.com>
> > +L:   linux-hwmon@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
> > +
> >   NETDEVSIM
> >   M:  Jakub Kicinski <kuba@kernel.org>
> >   S:  Maintained
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul
