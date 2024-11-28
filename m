Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B49499DBD70
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 23:13:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzrD13jvyz3bTR
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2024 09:13:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732760097;
	cv=none; b=AnLI40Wmq0gGTq1gndb9r4ZEX8XDcrUCkbVzJUd03I2Q+TVvvkvMIAqoZSRxecKQDCf9lGPF+Al/n76mY/L1lkRPJ7GEBjsP99HWgTK+gOhJ820Xp6LIPeEc9A5eV0NPqj1fWZyTUV9yHsj1rO45ihoiWuj4VZmRAwF4Ey6McwD5RA0e8SjSvA2fiVIsDproP4yd5haJdXw5EoYlxHE9IQqplIIJL+XlfYGu4lIQiJMPTeWV0dYLDwWc72F3arORQq7tjyDf+AxOWokMhZwZalQT4SPv5PIdzCOa8S7fEP5qpm12dezjwGnB8OaZzE2EX3IMD2vpoV0D3uFrddvDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732760097; c=relaxed/relaxed;
	bh=RwS2jBVSzXTYuNe3+UBBZ+0Uj62YFOtE1/FiTJBmwPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHH09co8hXhJboaxIfgNanZiNy2yxGNAbALMOD59Cvf1GFhl4VkYUagQGpOhiuwVfkuvCXFvVBZsdmIJC1iCctEApkGpDK1KzFrJSZajSQDgEp1D2egvjhwGN/BDI+fglVvpChNOAp4Ape5OlR4QejPMgtJ5TEEGiiXJd2pw4fdYd1KHGnkWlXD1DfusHgxKib/cEThGm9ubEEjb/cyl8dyP6cW5SnUpNq5QUmY82xzbBdD0LWxNf9i9la/Zu5CkADoqEQwPkW9tyJQcjmjsx1XgseB93WChlWmKHJ0RZs/bWqWId03HfmOG5qa99wMQOQoBTVa2/cpj4L3QrHPR6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eaoTPuTL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eaoTPuTL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzKdW1CZRz2xrC
	for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2024 13:14:53 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa578d10d50so45320366b.1
        for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 18:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732760087; x=1733364887; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwS2jBVSzXTYuNe3+UBBZ+0Uj62YFOtE1/FiTJBmwPY=;
        b=eaoTPuTLbjV6fPb/pTNlr3Gg6NFgspX8hIe1AydC34h8h68NmJWxr+5RWgaFvznkFK
         iwELc9ORbFAeR8lcSLej3WpUu8gPCs7ZB6CvAI2e40G9au6mfFZPHbHcPBOg22X5PW4l
         wtyz9EdhIQ8kGmlKY10AlhDLrE/rcemqfIwp8UXSVcbS0UJ3GnKMTZz4NHXBLLUfqXfo
         JeNKTDLiHMOhdXqT2PP+MQCVr9xLnDIiPADKb86CFE9R8bnZhFSqZhkDMMWM10MnTbmw
         W/SfN08CQ6pSWqzCDdTVgHb8A1/I58DHZqTHy1awR/7DIzemE1QAmS6BtB+CJD5z3c4W
         ua+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732760087; x=1733364887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwS2jBVSzXTYuNe3+UBBZ+0Uj62YFOtE1/FiTJBmwPY=;
        b=WgdzzrimBjxjYfjLbR0s/5e0WEDD/52MGJMTp+4N0wKfv77bdG6usp9nwa4vyvm5Ek
         Wk/PbE2logdz/Ft/D0Vr3vL043wAxEXlPMlutZJBmtigmVokbZDZGXjWYNcDhQN8c4VL
         wh+bfknmt3iKG0xkeXYBWjGqynUopS9Vi5WscVqH7we1JbcOy4Cx7MpmX14rVh9+VD5M
         7AZdPhtYgj+1qTdDKCLOYM1OPT5s5reqi07ScQoRoLJ0pnay3ofRkR2MTekzCw/J1U37
         v2ktnExi5y9cYv3RrKuFE/HOtC2Uurz3lzb6k44CzmIzL3FKRe2KfVP9HTJomj62QHTt
         C7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvqUL2IwlDGAYkU7JOfkSo6F8sNcHurgtK22qTD7bUEjk1Qhtt3lNgAZvgfuVx7QQZS0iRVm0e@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzuZAmB6+lvGqvbbDtqRRgNRlp9ytVE3FoA1YUaRZuWq0uA9+3I
	F+ye/CcrupdGvDnoWtfmujZuCyQbTseKo+dWMN9+izMUx7+z1PJD/ntlOsFLL6lKMPsnHfqc+KQ
	j9JdkJkLMa1NeAqLwwVvL/o4h9b4=
X-Gm-Gg: ASbGnctt4H94J680o7CSrkg70mutJqFlGXPIm7MRW6fZARWavZ32FWrI6MoMiIQrrkM
	/FSWjmLE9mIDzMWfOuYfcRM1+1UOzWQM=
X-Google-Smtp-Source: AGHT+IECqtEuypmzVzh5m3cSewtJm2cpzImTdgNCpfYYp6unJMDltC+JYpo5NvQqw++o54ZmQD/SObo2UGlhbvs4t3M=
X-Received: by 2002:a17:906:18b1:b0:a99:89e9:a43d with SMTP id
 a640c23a62f3a-aa58103ddcbmr462588866b.39.1732760087280; Wed, 27 Nov 2024
 18:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
 <CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
 <20241109134228.4359d803@jic23-huawei> <20241109142943.3d960742@jic23-huawei>
 <CA+4VgcJ=8wDWWnmgEt-UkEUfnfD8kGtHe44G5+dcRYt=KdwNfw@mail.gmail.com> <20241123144750.43eaa1c5@jic23-huawei>
In-Reply-To: <20241123144750.43eaa1c5@jic23-huawei>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Thu, 28 Nov 2024 10:14:10 +0800
Message-ID: <CA+4Vgc+rqnxne6saUgUO_kR6chX9+HZcb40_9dpO6p6KuskSAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 29 Nov 2024 09:13:02 +1100
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

Thank you for your advice.

I would remove the "nvuoton,read-vin-data-size" property.

Read VIN info can use word read or byte read, and other registers
should use byte read.
If I use word read for VIN info and byte read for other registers,
I encounter an issue when I use regmap instead of i2c smbus API.

I need two regmap configs with val_bits 8/16.
After I call devm_regmap_init_i2c these two configs,
the error message:
"debugfs: Directory '5-001d' with parent 'regmap' already present!"

Do you have any suggestions?

Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=8823=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:48=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On Mon, 11 Nov 2024 15:45:03 +0800
> Yu-Hsian Yang <j2anfernee@gmail.com> wrote:
>
> > Dear Jonathan Cameron,
> >
> > For property read-vin-data-size, we have a internal discussion.
> >
> > For Nuvoton NCT7201/NCT7202 chip,
> > Take an example as to Vin1:
> > The VIN reading supports Byte read (One Byte) and Word read (Two Byte)
> >
> > For Byte read:
> > First read Index 00h to get VIN1 MSB, then read Index 0Fh Bit 3~7 to
> > get VIN1 LSB.
> > Index 0Fh is a shared LSB for all VINs.
> >
> > For Word read:
> > Read Index 00h and get 2 Byte (VIN1 MSB and VIN1 LSB).
> >
> > We would refer your suggestion,
> > we  declare a property named "nvuoton,read-vin-data-size" with default =
value 16
> > for user to use.
>
> Thanks for the info.  If the i2c controller allows word read
> then the right thing is to always use it.
>
> Just check for I2C_FUNC_SMBUS_READ_WORD_DATA with
> i2c_check_functionality()
>
> If it's supported use i2c_smbus_read_word_swapped()
> if not, do the i2c_smbus_read_byte() approach.
>
> We don't need to want this in DT as it is a property of the smbus
> controller, not this device.
>
> Jonathan
>
>
>
>
> >
> > Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=889=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Sat, 9 Nov 2024 13:42:28 +0000
> > > Jonathan Cameron <jic23@kernel.org> wrote:
> > >
> > > > On Wed, 6 Nov 2024 17:22:35 +0800
> > > > Yu-Hsian Yang <j2anfernee@gmail.com> wrote:
> > > >
> > > > > Dear Chanh Nguyen,
> > > > >
> > > > > Thank you for your response.
> > > > >
> > > > > Chanh Nguyen <chanh@amperemail.onmicrosoft.com> =E6=96=BC 2024=E5=
=B9=B411=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:58=E5=
=AF=AB=E9=81=93=EF=BC=9A
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 06/11/2024 09:39, Eason Yang wrote:
> > > > > > > This adds a binding specification for the Nuvoton NCT7201/NCT=
7202
> > > > > > > family of ADCs.
> > > > > > >
> > > > > > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > > > > > > ---
> > > > > > >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 ++++++++=
+++++++++++
> > > > > > >   MAINTAINERS                                   |  1 +
> > > > > > >   2 files changed, 48 insertions(+)
> > > > > > >   create mode 100644 Documentation/devicetree/bindings/iio/ad=
c/nuvoton,nct720x.yaml
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoto=
n,nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.=
yaml
> > > > > > > new file mode 100644
> > > > > > > index 000000000000..3052039af10e
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct72=
0x.yaml
> > > > > > > @@ -0,0 +1,47 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.y=
aml#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: Nuvoton nct7202 and similar ADCs
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Eason Yang <yhyang2@nuvoton.com>
> > > > > > > +
> > > > > > > +description: |
> > > > > > > +   Family of ADCs with i2c interface.
> > > > > > > +
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    enum:
> > > > > > > +      - nuvoton,nct7201
> > > > > > > +      - nuvoton,nct7202
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  read-vin-data-size:
> > > > > >
> > > > > > Is it generic property or vendor property? I tried to find in t=
he
> > > > > > https://github.com/torvalds/linux/tree/master/Documentation/dev=
icetree/bindings
> > > > > > , but it seems this property hasn't been used on other devices.
> > > > > >
> > > > > > If it is vendor property, then I think it should include a vend=
or
> > > > > > prefix. For examples:
> > > > > >
> > > > > > https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/iio/adc/adi%2Cad7780.yaml#L50
> > > > > > https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> > > > > > https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/iio/adc/st%2Cstmpe-adc.yaml#L22
> > > > > >
> > > > > >
> > > > >
> > > > > I would add a vendor prefix for it.
> > > >
> > > > Why do we want this at all?  Is this device sufficiently high
> > > > performance that Linux will ever want to trade of resolution agains=
t
> > > > sampling speed?
> > > >
> > > > If so that seems like a policy control that belongs in userspace. N=
ote
> > > > that to support that in IIO I would want a strong justification for=
 why we dno't
> > > > just set it to 16 always. We just go for maximum resolution in the =
vast majority
> > > > of drivers that support control of this.
> > > I'd misunderstood what this is. It's a control no what the i2c word s=
ize is.
> > > Do we actually care about supporting rubbish i2c controllers?  How ma=
ny
> > > can't do a word access?
> > >
> > > If you do it should be detected from the controller rather than in DT=
.
> > >
> > > >
> > > >
> > > > >
> > > > > > > +    description: number of data bits per read vin
> > > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > > +    enum: [8, 16]
> > > > > > > +
> > > > > > > +required:
> > > > > > > +  - compatible
> > > > > > > +  - reg
> > > > > > > +  - read-vin-data-size
> > > > > > > +
> > > > > > > +additionalProperties: false
> > > > > > > +
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    i2c {
> > > > > > > +        #address-cells =3D <1>;
> > > > > > > +        #size-cells =3D <0>;
> > > > > > > +
> > > > > > > +        nct7202@1d {
> > > > > >
> > > > > > I think the Node name should follow
> > > > > > https://devicetree-specification.readthedocs.io/en/latest/chapt=
er2-devicetree-basics.html#generic-names-recommendation
> > > > > >
> > > > > >
> > > > > > For some examples that were merged before
> > > > > >
> > > > > > https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/iio/adc/adi%2Cad7091r5.yaml#L102
> > > > > > https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/iio/adc/maxim%2Cmax1238.yaml#L73
> > > > > > https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/iio/adc/ti%2Cadc081c.yaml#L49
> > > > > >
> > > > >
> > > > > I would change it for the node naming.
> > > > >
> > > > > > > +            compatible =3D "nuvoton,nct7202";
> > > > > > > +            reg =3D <0x1d>;
> > > > > > > +            read-vin-data-size =3D <8>;
> > > > > > > +        };
> > > > > > > +    };
> > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > index 91d0609db61b..68570c58e7aa 100644
> > > > > > > --- a/MAINTAINERS
> > > > > > > +++ b/MAINTAINERS
> > > > > > > @@ -2746,6 +2746,7 @@ L:      openbmc@lists.ozlabs.org (moder=
ated for non-subscribers)
> > > > > > >   S:  Supported
> > > > > > >   F:  Documentation/devicetree/bindings/*/*/*npcm*
> > > > > > >   F:  Documentation/devicetree/bindings/*/*npcm*
> > > > > > > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct72=
0x.yaml
> > > > > > >   F:  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.=
yaml
> > > > > > >   F:  arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> > > > > > >   F:  arch/arm/mach-npcm/
> > > > > >
> > > >
> > > >
> > >
>
