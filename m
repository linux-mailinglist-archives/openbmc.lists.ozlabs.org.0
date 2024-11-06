Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAF9BF915
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2024 23:18:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkKMH0641z3cTF
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 09:17:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730882979;
	cv=none; b=j7jGi4bssqJDItboLjxUiIafm/rq75qQMMjTUJfYYUPjBe3tVdqlS+bpS8d1aTgOrn2AjbIKuqc7nlpOz9t5a0bwHJrvNl3tsxhoxNuDUJUPXkosf1VtY1BH8LlE5mlhYeF7uWBe6tsHFML3h8kLeduToQS5VO+4U1BTYRmGW1dpazwq02nB9d6gNxOPLPVr/PO3YYsrAJvv6wxk5/R+wWRiszWc3npiu7QWw49Cx9BivWWyiExHtmMZeY9+XHpgUGKk33/uzfS3z+b3rf4ttzgMn47gQl+LXTrqnB15nJQ/oiY6ynImiKPH42Vh0dP767obStpwPYSIgc1xJlI5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730882979; c=relaxed/relaxed;
	bh=xXDuhpWtohzJy2pjYUrIEJrg/gOXf/NKzKgfTz1X41Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yynr/XN5NGLL1OExVwgSfd3rGU/3xS1zdGpexPQrjaw8Em/kASFglijo1hjOTlfpFdOc7mXBqESPr53S73rmtuudNdfnsnXIub4kMDaVxbEr+8zJpQN017b9RlpgxS/eN/5CMUjQcG5drbsF4wvvvJempqVBMVBoCqD8TBV73cWQcwDXAuzHK1S5BHaaUBR49M/Y3b5ptVNNHKWw5nEPB3Qi78s+ikaTn9MZpEwuTODrTIUDoq8jXMuaQzmKZKJID+Edo/Is0mPQaCpfNt3rYq0sEoyhS+fOOU5QnWqQfxMuwdkpjdMXIFl/RkSn/lIqNDIj7b6me1U1GW4588KNpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CX4tv8H+; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CX4tv8H+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=j2anfernee@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjzR461wjz2yVM
	for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2024 19:49:35 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so93668981fa.0
        for <openbmc@lists.ozlabs.org>; Wed, 06 Nov 2024 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730882966; x=1731487766; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xXDuhpWtohzJy2pjYUrIEJrg/gOXf/NKzKgfTz1X41Y=;
        b=CX4tv8H+dPDHGDJzD39RqqtLMnoR8ho8Gj7MukxSqE7ztu6CGo05GnufipCLGhM0qh
         vZ92zv42P8xjTmLwqKeDAW0eFy5008NP8nkh7g5rd2oSG79Wj3RY5AjdN/Lem6Gnkh2N
         WTEDYuJgTrywvbm+pBayGOjSyF1pGrOMnZPSgAy7upKQWvEF4OoSMpMnurAeomOe8W56
         MTzAmS9XDham5QKZpoxYY/fBcCiRD78wsXcgmJhfLBkt9Gvbaoa3P6fa9I1xR5fY1jVr
         0g1gsy49AkRMzeJtn0apaFNi30sfatoKTUQncRJ7AdB9E4lmnswNAe3ctLm/qrQp/4iH
         ePLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882966; x=1731487766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXDuhpWtohzJy2pjYUrIEJrg/gOXf/NKzKgfTz1X41Y=;
        b=NQZPYiwaQHC4Owhdfxvv3ZxilAYeNZmIx8ndk73l4XwEoKUl0YHvZkSrK/uinYBl6d
         YNlEFZ9cFdew1DlXhCKmQEh7JkhWrhFT2+mgAFyJLyVN667tX9oS1kdfZ9Tbh0o5zI9Z
         4eBPAcwEotUNYc0MYrOZN0eX/laW45a5fBIDsH09Dd7tsF1d/g24QQsvEoF7TW818stf
         PHpG2kRCjWFbWp2ywcHhEujBArtw6BpIqNJmVHj5SwiDqPa43kpr8Wb50ya2Jb64L7I2
         KUDSQhuuVf9cH/TmbW9UKRDTNOjpTxDiBvT/6ogRcYfNn8ClZ5+0GJbDZP8NeTz8L1no
         QtqA==
X-Forwarded-Encrypted: i=1; AJvYcCW4D6iSaTo85RJPfiJTwE8WxoifqwkVaC5prhYgi1XmNWc1niaNGciWSa6wYbq66coukiKVGj1G@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqDw2uW+kXRMMCSkLXq+z2L1uFnlk1ffB91n79WArp/R6Ic3C8
	k23DvBNOlisMrVkzNi09ZHuK5aupRwOOtDv4VIntlS8e8c1bSg9P8esdgsDHgq+1RCvIgy6npwQ
	BtEq0ADVkjf+FdOYv7Mq0WrapgBA=
X-Google-Smtp-Source: AGHT+IE95BVYcCvONVPSXXk0GjZTGze160Tdl5EYVX9dmKSsYRIgQaQI2/6Hl+MAWqFOgqMg8moxMpqatb6Hnr4+6OM=
X-Received: by 2002:a05:651c:2123:b0:2fa:c0c2:d311 with SMTP id
 38308e7fff4ca-2fedb794b2dmr156902571fa.5.1730882965236; Wed, 06 Nov 2024
 00:49:25 -0800 (PST)
MIME-Version: 1.0
References: <20241106023916.440767-1-j2anfernee@gmail.com> <20241106023916.440767-2-j2anfernee@gmail.com>
 <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
In-Reply-To: <6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
From: Yu-Hsian Yang <j2anfernee@gmail.com>
Date: Wed, 6 Nov 2024 16:48:48 +0800
Message-ID: <CA+4Vgc+79HoH4ACxS+1RedQr2Q7Ua73ynG+yNF3jSUQ=gun-ow@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Content-Type: multipart/alternative; boundary="0000000000004a733c06263a98c8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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

--0000000000004a733c06263a98c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
> >   create mode 100644
Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> >
> > diff --git
a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
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
>
https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bind=
ings
> , but it seems this property hasn't been used on other devices.
>
> If it is vendor property, then I think it should include a vendor
> prefix. For examples:
>
>
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/adi%2Cad7780.yaml#L50
>
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/fsl%2Cvf610-adc.yaml#L42
>
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/st%2Cstmpe-adc.yaml#L22

I would add a vendor prefix for it.

>
>
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
>
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetr=
ee-basics.html#generic-names-recommendation
>
>
> For some examples that were merged before
>
>
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/adi%2Cad7091r5.yaml#L102
>
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/maxim%2Cmax1238.yaml#L73
>
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/ti%2Cadc081c.yaml#L49
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
> > @@ -2746,6 +2746,7 @@ L:      openbmc@lists.ozlabs.org (moderated for
non-subscribers)
> >   S:  Supported
> >   F:  Documentation/devicetree/bindings/*/*/*npcm*
> >   F:  Documentation/devicetree/bindings/*/*npcm*
> > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> >   F:  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> >   F:  arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> >   F:  arch/arm/mach-npcm/
>

--0000000000004a733c06263a98c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear Chanh Nguyen,<br><br>Thank you for your response.<br>=
<br>Chanh Nguyen &lt;<a href=3D"mailto:chanh@amperemail.onmicrosoft.com">ch=
anh@amperemail.onmicrosoft.com</a>&gt; =E6=96=BC 2024=E5=B9=B411=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:58=E5=AF=AB=E9=81=93=EF=
=BC=9A<br>&gt;<br>&gt;<br>&gt;<br>&gt; On 06/11/2024 09:39, Eason Yang wrot=
e:<br>&gt; &gt; This adds a binding specification for the Nuvoton NCT7201/N=
CT7202<br>&gt; &gt; family of ADCs.<br>&gt; &gt;<br>&gt; &gt; Signed-off-by=
: Eason Yang &lt;<a href=3D"mailto:j2anfernee@gmail.com">j2anfernee@gmail.c=
om</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0 .../bindings/iio/adc/nuvoto=
n,nct720x.yaml =C2=A0 =C2=A0 | 47 +++++++++++++++++++<br>&gt; &gt; =C2=A0 M=
AINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 +<br>&gt;=
 &gt; =C2=A0 2 files changed, 48 insertions(+)<br>&gt; &gt; =C2=A0 create m=
ode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml<b=
r>&gt; &gt;<br>&gt; &gt; diff --git a/Documentation/devicetree/bindings/iio=
/adc/nuvoton,nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvot=
on,nct720x.yaml<br>&gt; &gt; new file mode 100644<br>&gt; &gt; index 000000=
000000..3052039af10e<br>&gt; &gt; --- /dev/null<br>&gt; &gt; +++ b/Document=
ation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml<br>&gt; &gt; @@ -0,0=
 +1,47 @@<br>&gt; &gt; +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause=
)<br>&gt; &gt; +%YAML 1.2<br>&gt; &gt; +---<br>&gt; &gt; +$id: <a href=3D"h=
ttp://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#">http://devicetr=
ee.org/schemas/iio/adc/nuvoton,nct720x.yaml#</a><br>&gt; &gt; +$schema: <a =
href=3D"http://devicetree.org/meta-schemas/core.yaml#">http://devicetree.or=
g/meta-schemas/core.yaml#</a><br>&gt; &gt; +<br>&gt; &gt; +title: Nuvoton n=
ct7202 and similar ADCs<br>&gt; &gt; +<br>&gt; &gt; +maintainers:<br>&gt; &=
gt; + =C2=A0- Eason Yang &lt;<a href=3D"mailto:yhyang2@nuvoton.com">yhyang2=
@nuvoton.com</a>&gt;<br>&gt; &gt; +<br>&gt; &gt; +description: |<br>&gt; &g=
t; + =C2=A0 Family of ADCs with i2c interface.<br>&gt; &gt; +<br>&gt; &gt; =
+properties:<br>&gt; &gt; + =C2=A0compatible:<br>&gt; &gt; + =C2=A0 =C2=A0e=
num:<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0- nuvoton,nct7201<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0- nuvoton,nct7202<br>&gt; &gt; +<br>&gt; &gt; + =C2=A0r=
eg:<br>&gt; &gt; + =C2=A0 =C2=A0maxItems: 1<br>&gt; &gt; +<br>&gt; &gt; + =
=C2=A0read-vin-data-size:<br>&gt;<br>&gt; Is it generic property or vendor =
property? I tried to find in the<br>&gt; <a href=3D"https://github.com/torv=
alds/linux/tree/master/Documentation/devicetree/bindings">https://github.co=
m/torvalds/linux/tree/master/Documentation/devicetree/bindings</a><br>&gt; =
, but it seems this property hasn&#39;t been used on other devices.<br>&gt;=
<br>&gt; If it is vendor property, then I think it should include a vendor<=
br>&gt; prefix. For examples:<br>&gt;<br>&gt; <a href=3D"https://github.com=
/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/adi%2=
Cad7780.yaml#L50">https://github.com/torvalds/linux/blob/master/Documentati=
on/devicetree/bindings/iio/adc/adi%2Cad7780.yaml#L50</a><br>&gt; <a href=3D=
"https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bin=
dings/iio/adc/fsl%2Cvf610-adc.yaml#L42">https://github.com/torvalds/linux/b=
lob/master/Documentation/devicetree/bindings/iio/adc/fsl%2Cvf610-adc.yaml#L=
42</a><br>&gt; <a href=3D"https://github.com/torvalds/linux/blob/master/Doc=
umentation/devicetree/bindings/iio/adc/st%2Cstmpe-adc.yaml#L22">https://git=
hub.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/ad=
c/st%2Cstmpe-adc.yaml#L22</a><br><br>I would add a vendor prefix for it.<br=
><br>&gt;<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0description: number of data b=
its per read vin<br>&gt; &gt; + =C2=A0 =C2=A0$ref: /schemas/types.yaml#/def=
initions/uint32<br>&gt; &gt; + =C2=A0 =C2=A0enum: [8, 16]<br>&gt; &gt; +<br=
>&gt; &gt; +required:<br>&gt; &gt; + =C2=A0- compatible<br>&gt; &gt; + =C2=
=A0- reg<br>&gt; &gt; + =C2=A0- read-vin-data-size<br>&gt; &gt; +<br>&gt; &=
gt; +additionalProperties: false<br>&gt; &gt; +<br>&gt; &gt; +examples:<br>=
&gt; &gt; + =C2=A0- |<br>&gt; &gt; + =C2=A0 =C2=A0i2c {<br>&gt; &gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;1&gt;;<br>&gt; &gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;0&gt;;<br>&gt; &gt; +<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0nct7202@1d {<br>&gt;<br>&gt; I think the Node=
 name should follow<br>&gt; <a href=3D"https://devicetree-specification.rea=
dthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recomme=
ndation">https://devicetree-specification.readthedocs.io/en/latest/chapter2=
-devicetree-basics.html#generic-names-recommendation</a><br>&gt;<br>&gt;<br=
>&gt; For some examples that were merged before<br>&gt;<br>&gt; <a href=3D"=
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bind=
ings/iio/adc/adi%2Cad7091r5.yaml#L102">https://github.com/torvalds/linux/bl=
ob/master/Documentation/devicetree/bindings/iio/adc/adi%2Cad7091r5.yaml#L10=
2</a><br>&gt; <a href=3D"https://github.com/torvalds/linux/blob/master/Docu=
mentation/devicetree/bindings/iio/adc/maxim%2Cmax1238.yaml#L73">https://git=
hub.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/iio/ad=
c/maxim%2Cmax1238.yaml#L73</a><br>&gt; <a href=3D"https://github.com/torval=
ds/linux/blob/master/Documentation/devicetree/bindings/iio/adc/ti%2Cadc081c=
.yaml#L49">https://github.com/torvalds/linux/blob/master/Documentation/devi=
cetree/bindings/iio/adc/ti%2Cadc081c.yaml#L49</a><br>&gt;<br><br>I would ch=
ange it for the node naming.<br><br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,nct7202&quot;;<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x1d&gt;;<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read-vin-data-size =3D &lt;8&gt=
;;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>&gt; &gt; + =C2=A0 =C2=
=A0};<br>&gt; &gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>&gt; &gt; inde=
x 91d0609db61b..68570c58e7aa 100644<br>&gt; &gt; --- a/MAINTAINERS<br>&gt; =
&gt; +++ b/MAINTAINERS<br>&gt; &gt; @@ -2746,6 +2746,7 @@ L: =C2=A0 =C2=A0 =
=C2=A0<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org<=
/a> (moderated for non-subscribers)<br>&gt; &gt; =C2=A0 S: =C2=A0Supported<=
br>&gt; &gt; =C2=A0 F: =C2=A0Documentation/devicetree/bindings/*/*/*npcm*<b=
r>&gt; &gt; =C2=A0 F: =C2=A0Documentation/devicetree/bindings/*/*npcm*<br>&=
gt; &gt; +F: =C2=A0 Documentation/devicetree/bindings/iio/adc/nuvoton,nct72=
0x.yaml<br>&gt; &gt; =C2=A0 F: =C2=A0Documentation/devicetree/bindings/rtc/=
nuvoton,nct3018y.yaml<br>&gt; &gt; =C2=A0 F: =C2=A0arch/arm/boot/dts/nuvoto=
n/nuvoton-npcm*<br>&gt; &gt; =C2=A0 F: =C2=A0arch/arm/mach-npcm/<br>&gt;</d=
iv>

--0000000000004a733c06263a98c8--
