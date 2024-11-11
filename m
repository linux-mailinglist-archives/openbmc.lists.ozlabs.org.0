Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1B9C4952
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 23:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnPrY6myvz3bkg
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 09:50:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731311149;
	cv=none; b=JWvtTcYK1nO4cMG2fjIQ4uRdOfd0wm1kweunO11Wgsxot1X0o1BlG+hMM22ksmH4KL3w12Ybk6hXM05nVogE6FGaM8HIYuKk37qcdKUtSGdkVH3IrdMl4hdIZvHaNlhGIIPkPAIkbj+BtYTGOeXsP53N46nHvbHfIlZ/nTQc7Cm4yesr4czfoFO8sGLDjzPFyr7hM5eiA/bOsRRSg6MAFutcoKY6dWu5C4fN1a5X/g3hdxpL0mqnxP8qr7pGAo+at44B/rU07y6uekfaWYrqyOdqh6WRRP4s6cfHgM/65nk0IWkYb+pLPi8Oh9yXFhekTWPoLhAxMlFfMPwET48X2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731311149; c=relaxed/relaxed;
	bh=tlYEoLWgXvf50waTFfyvkqu6l2VBpvmR0XQbzw8Cmd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Je5Q9Da/4hqRTtEN6QPKlLw8Ou1zheZDtUgMyU9WHloCnYVofkh+HKLwsHC517Qe3eqxYFMWlZ/7ITCxy0fuCk2/0At3ebae1SasJKqo6KP+vjuzIt1YeuEihvUUCBqZcCf9+tCpEBcevtfr/49HQeyMn6CjOVhsUI02jde36xNvXGIF7LZWTnYVSRhEd//FFviCM2bCw0NDIiLvEgAvljcVnPES4x1cQJ82V0iKqLRhlJU2abbfCraggwQ3QVbTcPfuvBkixcsySKm8hsA0bZeQijYHHejjqxhqYQCF9W0t9cSyP+kKsrALdV1HuzN153z4hSALHw0ImmAqB+0ukg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SXYzzdqx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SXYzzdqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xn1n74y1Xz2yVZ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 18:45:46 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9a4031f69fso711432166b.0
        for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2024 23:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731311140; x=1731915940; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlYEoLWgXvf50waTFfyvkqu6l2VBpvmR0XQbzw8Cmd8=;
        b=SXYzzdqxKA4cUj0Fg+maJaGnvXBzOkTeHJk4esJb7ruFl3D2T+GM6FidV0bCPZdDg1
         GPgu2xf8yGCVMKomzV1/yVUHsLfdheEsn9V90Mjx0U5jec9d6tpuN1/ITrAokvueR4+W
         ZqtFLHiP/z4Ull6TtzYLXHg/PggYS1j5HkpF8zUu/JEyT4tL6KUGBXJJbt5mFwuER3n+
         +VXBtIqGb4vMjguFix2cBVvtZ3wd9AuVBBtHv+aelSmaTmE0OlfgeylAavwj4prDdHEd
         aAn8W20F1qBVOJu7Zyd9lzZPKb6s29ftIVISeTfZXEtg3hRuvnBDMbvjRmGFb7V7Y9cO
         MWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311140; x=1731915940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlYEoLWgXvf50waTFfyvkqu6l2VBpvmR0XQbzw8Cmd8=;
        b=SXLqt/jcJDDMIFiizg4EsibwwcEUL1Di01odz+FnUFcmRRz+dcqd1FFm4kxBxx/8TH
         Ollq3W1KTVPFJ0ungRUFRkuCwB7ENjMkrM9espbFxCLbHvmGcvDSyxGZNz9uVli9YfM/
         BVWiWnRlEqCr9qWy8TZmUFht4AutqUIlvSTgon5VlTQv3UFG/ec3mKSaKeHCNK5L+XpI
         nm08Au6IkGfFYqBSANpjYN64MOP5HE2ruruSO3YokuYnNaJbV+JrwXC3DCpxplOloIw3
         z+JIukK51yMdN7+04DRO2XtYaCPYbKq4lVSPmJcINTEjuVqXZeQeru6ixiWyjSVSChBJ
         Tn0A==
X-Forwarded-Encrypted: i=1; AJvYcCWxq7pkogdxp3ibHs3SJfEo0v50pjr/Ni+NTmIh+LJTS+U/SuZveWzchJGKJBa8lEetIvXI2maE@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyc7+yVOJbUxABZR/AL9YeromclXgnVxfWOx0SX8d7CC8gNAhCM
	E9TzgmqQSCVEAG/DngYyAXHZ7XTG2Yr7wWZTq0ESaC67pIeWc+Nb/u7ajVIum51PxbGiGO9uXFw
	XnvR8rWFtIgcvR4EMA0YsxaMshTk=
X-Google-Smtp-Source: AGHT+IH0KLR+0s7nW02uC0eKWTUgxxMYz1DzkxED3149OYbLx/SStp/Kw6ce/5yR+YmhbYjwOTnDum2ZPJHSCyvFgkY=
X-Received: by 2002:a17:907:25c2:b0:a99:ecaf:4543 with SMTP id
 a640c23a62f3a-a9eeff41732mr1209496866b.25.1731311140145; Sun, 10 Nov 2024
 23:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
 <CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
 <20241109134228.4359d803@jic23-huawei> <20241109142943.3d960742@jic23-huawei>
In-Reply-To: <20241109142943.3d960742@jic23-huawei>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Mon, 11 Nov 2024 15:45:03 +0800
Message-ID: <CA+4VgcJ=8wDWWnmgEt-UkEUfnfD8kGtHe44G5+dcRYt=KdwNfw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 12 Nov 2024 09:50:02 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jonathan Cameron,

For property read-vin-data-size, we have a internal discussion.

For Nuvoton NCT7201/NCT7202 chip,
Take an example as to Vin1:
The VIN reading supports Byte read (One Byte) and Word read (Two Byte)

For Byte read:
First read Index 00h to get VIN1 MSB, then read Index 0Fh Bit 3~7 to
get VIN1 LSB.
Index 0Fh is a shared LSB for all VINs.

For Word read:
Read Index 00h and get 2 Byte (VIN1 MSB and VIN1 LSB).

We would refer your suggestion,
we  declare a property named "nvuoton,read-vin-data-size" with default valu=
e 16
for user to use.

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=889=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Sat, 9 Nov 2024 13:42:28 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
>
> > On Wed, 6 Nov 2024 17:22:35 +0800
> > Yu-Hsian Yang <j2anfernee@gmail.com> wrote:
> >
> > > Dear Chanh Nguyen,
> > >
> > > Thank you for your response.
> > >
> > > Chanh Nguyen <chanh@amperemail.onmicrosoft.com> =E6=96=BC 2024=E5=B9=
=B411=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:58=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > > >
> > > >
> > > >
> > > > On 06/11/2024 09:39, Eason Yang wrote:
> > > > > This adds a binding specification for the Nuvoton NCT7201/NCT7202
> > > > > family of ADCs.
> > > > >
> > > > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > > > > ---
> > > > >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 ++++++++++++=
+++++++
> > > > >   MAINTAINERS                                   |  1 +
> > > > >   2 files changed, 48 insertions(+)
> > > > >   create mode 100644 Documentation/devicetree/bindings/iio/adc/nu=
voton,nct720x.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nc=
t720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..3052039af10e
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.y=
aml
> > > > > @@ -0,0 +1,47 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Nuvoton nct7202 and similar ADCs
> > > > > +
> > > > > +maintainers:
> > > > > +  - Eason Yang <yhyang2@nuvoton.com>
> > > > > +
> > > > > +description: |
> > > > > +   Family of ADCs with i2c interface.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - nuvoton,nct7201
> > > > > +      - nuvoton,nct7202
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  read-vin-data-size:
> > > >
> > > > Is it generic property or vendor property? I tried to find in the
> > > > https://github.com/torvalds/linux/tree/master/Documentation/devicet=
ree/bindings
> > > > , but it seems this property hasn't been used on other devices.
> > > >
> > > > If it is vendor property, then I think it should include a vendor
> > > > prefix. For examples:
> > > >
> > > > https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/iio/adc/adi%2Cad7780.yaml#L50
> > > > https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> > > > https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/iio/adc/st%2Cstmpe-adc.yaml#L22
> > > >
> > > >
> > >
> > > I would add a vendor prefix for it.
> >
> > Why do we want this at all?  Is this device sufficiently high
> > performance that Linux will ever want to trade of resolution against
> > sampling speed?
> >
> > If so that seems like a policy control that belongs in userspace. Note
> > that to support that in IIO I would want a strong justification for why=
 we dno't
> > just set it to 16 always. We just go for maximum resolution in the vast=
 majority
> > of drivers that support control of this.
> I'd misunderstood what this is. It's a control no what the i2c word size =
is.
> Do we actually care about supporting rubbish i2c controllers?  How many
> can't do a word access?
>
> If you do it should be detected from the controller rather than in DT.
>
> >
> >
> > >
> > > > > +    description: number of data bits per read vin
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    enum: [8, 16]
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - read-vin-data-size
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    i2c {
> > > > > +        #address-cells =3D <1>;
> > > > > +        #size-cells =3D <0>;
> > > > > +
> > > > > +        nct7202@1d {
> > > >
> > > > I think the Node name should follow
> > > > https://devicetree-specification.readthedocs.io/en/latest/chapter2-=
devicetree-basics.html#generic-names-recommendation
> > > >
> > > >
> > > > For some examples that were merged before
> > > >
> > > > https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/iio/adc/adi%2Cad7091r5.yaml#L102
> > > > https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/iio/adc/maxim%2Cmax1238.yaml#L73
> > > > https://github.com/torvalds/linux/blob/master/Documentation/devicet=
ree/bindings/iio/adc/ti%2Cadc081c.yaml#L49
> > > >
> > >
> > > I would change it for the node naming.
> > >
> > > > > +            compatible =3D "nuvoton,nct7202";
> > > > > +            reg =3D <0x1d>;
> > > > > +            read-vin-data-size =3D <8>;
> > > > > +        };
> > > > > +    };
> > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > index 91d0609db61b..68570c58e7aa 100644
> > > > > --- a/MAINTAINERS
> > > > > +++ b/MAINTAINERS
> > > > > @@ -2746,6 +2746,7 @@ L:      openbmc@lists.ozlabs.org (moderated=
 for non-subscribers)
> > > > >   S:  Supported
> > > > >   F:  Documentation/devicetree/bindings/*/*/*npcm*
> > > > >   F:  Documentation/devicetree/bindings/*/*npcm*
> > > > > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.y=
aml
> > > > >   F:  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > > >   F:  arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> > > > >   F:  arch/arm/mach-npcm/
> > > >
> >
> >
>
