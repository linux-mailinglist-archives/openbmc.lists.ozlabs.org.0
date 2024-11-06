Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 782DA9BF916
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:18:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKML4Cf5z3g9H
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730884999;
	cv=none; b=NbES9vorXNSE0ZnayqbX+bJaRMgFDO9TSSQSgU7RzlbnCPzKOomBIxB98JdhPN/0snrv/MKgnnxxhzojmzKKGi8d6r4yLBJWmNmjIA1+r/jhEYgBLyrUL98/YMQ4b3dBD7/C9/h7agS9cBTVLNJicaWp/RJaCdYaZBhYM8VmBoLBZMoAepxbH8CSuVP/FbrsU7iF5qraTN6X4ZWaCEZGALWqqK8ecZezINCLOVeQAVdYVbM9cSGLDfyL8fwRuUg9kxo2GOaeuWUg9aWcHbaroGW6t04PZufQooDuzVVZXB37g7TCL0q+V1kFCghBr3rxqRYNAu+yLMm3PhICIhO2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730884999; c=relaxed/relaxed;
	bh=uRkks3dSyRy/clHnQcnjYlOdhUaiujCRFslbnDY6mJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vg3DRpo1zCt4moudF1L5LBKknxYJ9/rf0VwsR+/Lm8E8NVuBZa67Inav0MnV7R+LFLDztudKUiA6xEaFIIRHwOSDgKREuaxJJYHMzzZiihA8ehfU5vA1JaYX8Wd7/+dvqrld679zPAJ1cjWUbR2I0ON/ZK1dJk6STvVMuval9s4UAMnlyPO2WSBf1WZaWMKCheNo33Vx9gMbz3XWh8XTWU4IRMcfjPC05GBJbumPvqvbyD+D23zdReOKRC7jG0X/h0jHX/8IehSNiduv/iDWfNzsNaG1Ya0FZQnosDhRtaxoFr7zLJv9feGbBO3dDS2hGpmnMtGoNULdeoTGxPCeyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BXmR9X7K; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BXmR9X7K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk09x367nz2xnS
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 20:23:16 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5cec7cde922so6402661a12.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2024 01:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730884992; x=1731489792; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRkks3dSyRy/clHnQcnjYlOdhUaiujCRFslbnDY6mJA=;
        b=BXmR9X7KOWzD4JuEvtOHS2MW3MoFo9o5y3PFfJAMDjWBYTDqydhMyGH1AptgyGlKYN
         5lNS6wGS6PQDvqNuNmQXPD1p7R2OCAewESDU8GkAzezR218981sQPSAq5oVCcUCH72Dh
         W1Cy6dXWA20y0UrWyXAtzqWDKXIG11wRVtNtNA4ooZmeLw62sDwXlwG1MNLehT9ugrCC
         ssHLi2yVFNa8LKHCBW1hqjpo9PoFNdM2VZSh+9bJCeXxlwzVlTQe7n4WwCOkVf6U3R1d
         fFYI7TdmzqGVDDTUX1BybxUDGgklzk2ZA7elFxxn+Rpt5MjB7w/ACrlxl36r7nVVqide
         WIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730884993; x=1731489793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRkks3dSyRy/clHnQcnjYlOdhUaiujCRFslbnDY6mJA=;
        b=WJyJspNdwUKvmoAuQigU7D/fz2Sdq7If0CGeEllGGVXOQqp1HsPXQj1WWn0dTONa9c
         GQKL6g2hdLTl1Bo8M90Rz5H/ojVzFTG+KJZdQGPySIZ7grRfrtJtcbzD4R9y3uRQNdHj
         dHahRIBBloJ3gdGwingsqMnOw/eKKCASWluGK6NWoEAaVYQdD4PqujHkrFjFi1LrgQ8j
         QwRU0rlb11VVgSirNlzd5iYwxVQoL96zJpnP+TGBQk/lGfkn7VtTngGYesYT5r0B58qy
         sOp8q6P7zMqNoUYh7+ASmXqAQidPUtuMgkUWVCcOpjLESyqdjJ1q2NBYfBnlJSBhthWT
         jf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3Qh2r92EyrlAZzMmcfPFNw8muUlrdBMbWQ5MyeC4o14DWMl7Oi+FU9iEz1XKMZ/UMfB2JF2Cu@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOsMLiQm5T29zv4YRBkL8NA5y5+Sbky5kX6T2oj1lSTOjOqSNc
	EbuZUC+w8frbMahvIvasw9SpnwHbZSG8/6XjTXOd60sinkMIRxp4/8IES/eGhVGJGGGctfsNBCI
	b/GGErM8G9qo3+bRLV6V+UMim/rs=
X-Google-Smtp-Source: AGHT+IFv6NXCj0PoJ3/9MebXG7UMEvSLe5/XYsXv7IOXWlLpbZrwz5OF5MmA5IiWVO83xU2p+sYbWhvM35oxrlZEs5c=
X-Received: by 2002:a17:906:f34a:b0:a9e:c696:8f78 with SMTP id
 a640c23a62f3a-a9ec6969260mr153549166b.51.1730884992222; Wed, 06 Nov 2024
 01:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
In-Reply-To: <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 6 Nov 2024 17:22:35 +0800
Message-ID: <CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 07 Nov 2024 09:17:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Chanh Nguyen,

Thank you for your response.

Chanh Nguyen <chanh@amperemail.onmicrosoft.com> =E6=96=BC 2024=E5=B9=B411=
=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:58=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
>
>
> On 06/11/2024 09:39, Eason Yang wrote:
> > This adds a binding specification for the Nuvoton NCT7201/NCT7202
> > family of ADCs.
> >
> > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > ---
> >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 ++++++++++++++++++=
+
> >   MAINTAINERS                                   |  1 +
> >   2 files changed, 48 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,=
nct720x.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.=
yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > new file mode 100644
> > index 000000000000..3052039af10e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nuvoton nct7202 and similar ADCs
> > +
> > +maintainers:
> > +  - Eason Yang <yhyang2@nuvoton.com>
> > +
> > +description: |
> > +   Family of ADCs with i2c interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nuvoton,nct7201
> > +      - nuvoton,nct7202
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  read-vin-data-size:
>
> Is it generic property or vendor property? I tried to find in the
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bi=
ndings
> , but it seems this property hasn't been used on other devices.
>
> If it is vendor property, then I think it should include a vendor
> prefix. For examples:
>
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/adi%2Cad7780.yaml#L50
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/st%2Cstmpe-adc.yaml#L22
>
>

I would add a vendor prefix for it.

> > +    description: number of data bits per read vin
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [8, 16]
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - read-vin-data-size
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        nct7202@1d {
>
> I think the Node name should follow
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>
>
> For some examples that were merged before
>
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/adi%2Cad7091r5.yaml#L102
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/maxim%2Cmax1238.yaml#L73
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/iio/adc/ti%2Cadc081c.yaml#L49
>

I would change it for the node naming.

> > +            compatible =3D "nuvoton,nct7202";
> > +            reg =3D <0x1d>;
> > +            read-vin-data-size =3D <8>;
> > +        };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 91d0609db61b..68570c58e7aa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2746,6 +2746,7 @@ L:      openbmc@lists.ozlabs.org (moderated for n=
on-subscribers)
> >   S:  Supported
> >   F:  Documentation/devicetree/bindings/*/*/*npcm*
> >   F:  Documentation/devicetree/bindings/*/*npcm*
> > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> >   F:  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> >   F:  arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> >   F:  arch/arm/mach-npcm/
>
