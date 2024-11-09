Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8209C34F1
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 23:04:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmmsM5pRWz3fSC
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 09:03:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731159769;
	cv=none; b=Wp85RXYdcbSHWQwJSJxkSdGccSvFLK+w5zvBWPf4OK5jyzPlTnELqmlmNM9njPu7DxbJtUAQtO5AitwUtaEE3GGUKwI6p1b5gti+BrA/Bk8lug5pVdpNFI/Ze0ZObkMhdj04e5ytxyrK3oG2MTB9EnWTmrLJzWHnWEyBfzzfdQ+P+WeHBEkPI4NNlZdt1nTBK1lBT6ALkjDI7rSUr1xc57ugiiuLy9bwQLVEDXlcvYtYLOp/7WJzX1++4TlWwlMMWegVlSMnnx2NgImlnzFM9cIhOHVCQhAFLgNEY+GsaFUhSqL4MuUTSXRQkRngPyKu1nzC4HRCrHacozHQQ0RL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731159769; c=relaxed/relaxed;
	bh=uNr2u+AqEa0Bn7g0+qzMJquMoNgXqTPsr6eU4Zc+y5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dz3OvMMR9TQj6IGB9Pg/O5oKto7TgAJE3hvLwvOPhi1bfi0gznSosYh2/+tpfS+aws0Y5c9YmyVusosbN1W5Nogq+Hbu9eKbfQbf1aMW18TfdMOPYL1scPWpHt6lqQNcBD8MwUQ1AYG0AizyPezb1Sh1yHY+WxVYxl7Dhd0cpNKHWH/u4a5CbfxksY/PoLLzbz4L4zgefgD0hN/468eGGZwJ81bb61OP8NttAKZ4HupZqJrHtFHYrQ182FNESGPhI55Eb/qeE195od4u0kRyrtzcUMz/Q0dOVNpY9nuktIMokJVZ74owFd9sGWYynVkdUR1+ahIOuOMM6aF4gbldLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sgfdn+OL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sgfdn+OL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xlxp008tRz2xxt
	for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2024 00:42:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6BBC5C0299;
	Sat,  9 Nov 2024 13:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26118C4CECE;
	Sat,  9 Nov 2024 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731159761;
	bh=t3t+ysfKKtXS17fLmXkD4LYR/AhPzUkC7huhFUxrLeY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sgfdn+OLEx56qBN0CAsq6HQH0f+cpAppZT7lpAXOQ77nFEvYjVOMXXM4mLx0oAjG7
	 TNsIT/VFr5+hCUAuSunaNFD7cllDJS+a0uSWnQWd5I99A+FmruUaZfnql834zNpLGR
	 +awEbbDHSqWlLFHp/N6O3JQvV+4RcZ7wtKt7XATwSXC74jbWAFV8d3ksfStgGmId55
	 xLNxLw5luJurTUpk3u145dqgqF02K5UYM/D2J3ifHeD3Y2uY+mJtOOab/4R7ZHKbfi
	 f1FOCie9XDCypmAkzm7Z8xiCTsmCRgt+tEX4F121qp2rg47S9dsfhCKRZXWU6hneK7
	 AP2LJM0o9DGbw==
Date: Sat, 9 Nov 2024 13:42:28 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Hsian Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
Message-ID: <20241109134228.4359d803@jic23-huawei>
In-Reply-To: <CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
	<20241106023916.440767-2-j2anfernee@gmail.com>
	<6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
	<CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 11 Nov 2024 09:03:25 +1100
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

On Wed, 6 Nov 2024 17:22:35 +0800
Yu-Hsian Yang <j2anfernee@gmail.com> wrote:

> Dear Chanh Nguyen,
>=20
> Thank you for your response.
>=20
> Chanh Nguyen <chanh@amperemail.onmicrosoft.com> =E6=96=BC 2024=E5=B9=B411=
=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:58=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >
> >
> >
> > On 06/11/2024 09:39, Eason Yang wrote: =20
> > > This adds a binding specification for the Nuvoton NCT7201/NCT7202
> > > family of ADCs.
> > >
> > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > > ---
> > >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 ++++++++++++++++=
+++
> > >   MAINTAINERS                                   |  1 +
> > >   2 files changed, 48 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoto=
n,nct720x.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720=
x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > > new file mode 100644
> > > index 000000000000..3052039af10e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > > @@ -0,0 +1,47 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Nuvoton nct7202 and similar ADCs
> > > +
> > > +maintainers:
> > > +  - Eason Yang <yhyang2@nuvoton.com>
> > > +
> > > +description: |
> > > +   Family of ADCs with i2c interface.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - nuvoton,nct7201
> > > +      - nuvoton,nct7202
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  read-vin-data-size: =20
> >
> > Is it generic property or vendor property? I tried to find in the
> > https://github.com/torvalds/linux/tree/master/Documentation/devicetree/=
bindings
> > , but it seems this property hasn't been used on other devices.
> >
> > If it is vendor property, then I think it should include a vendor
> > prefix. For examples:
> >
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/adi%2Cad7780.yaml#L50
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/st%2Cstmpe-adc.yaml#L22
> >
> > =20
>=20
> I would add a vendor prefix for it.

Why do we want this at all?  Is this device sufficiently high
performance that Linux will ever want to trade of resolution against
sampling speed?

If so that seems like a policy control that belongs in userspace. Note
that to support that in IIO I would want a strong justification for why we =
dno't
just set it to 16 always. We just go for maximum resolution in the vast maj=
ority
of drivers that support control of this.


>=20
> > > +    description: number of data bits per read vin
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [8, 16]
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - read-vin-data-size
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells =3D <1>;
> > > +        #size-cells =3D <0>;
> > > +
> > > +        nct7202@1d { =20
> >
> > I think the Node name should follow
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devi=
cetree-basics.html#generic-names-recommendation
> >
> >
> > For some examples that were merged before
> >
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/adi%2Cad7091r5.yaml#L102
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/maxim%2Cmax1238.yaml#L73
> > https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/iio/adc/ti%2Cadc081c.yaml#L49
> > =20
>=20
> I would change it for the node naming.
>=20
> > > +            compatible =3D "nuvoton,nct7202";
> > > +            reg =3D <0x1d>;
> > > +            read-vin-data-size =3D <8>;
> > > +        };
> > > +    };
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 91d0609db61b..68570c58e7aa 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -2746,6 +2746,7 @@ L:      openbmc@lists.ozlabs.org (moderated for=
 non-subscribers)
> > >   S:  Supported
> > >   F:  Documentation/devicetree/bindings/*/*/*npcm*
> > >   F:  Documentation/devicetree/bindings/*/*npcm*
> > > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.yaml
> > >   F:  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > >   F:  arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> > >   F:  arch/arm/mach-npcm/ =20
> > =20

