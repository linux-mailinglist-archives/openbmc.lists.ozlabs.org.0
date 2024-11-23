Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D89D78F5
	for <lists+openbmc@lfdr.de>; Sun, 24 Nov 2024 23:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxPGB3ZGkz3bpJ
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2024 09:51:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732373287;
	cv=none; b=hLvayXfcEEegaIciIgcqaxdgnMxRYB3n+ZmYmr0QAzX0QGCn7HXSGcswHAAA3PLGRdDUlJOJhTAoLlONF25pW+Z5Hac5nvq1ArrqsIRHmd7H5PR16SCKzyFgO0SsEydfFmiR9d+YxEULXJEeD3GJhVZ4GmDXiWDJyJmJrMp4n6SRfikShOF680EXsx7G4MySz4/PGzXv/AwXXvMaa+CYG5h3g3rorCxUXGhFBjrPWQcPyafIpVXnXex6iAjwwrFnNY50rZIt7gz/c78EVEn4EFpTuJBGbCs+7c/WipnfTr9iUNHIAIu73YY7mTFknQq21f6yvNo/+CIO4XaPWcySIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732373287; c=relaxed/relaxed;
	bh=lWqZoZid86ZN3mFYlgQBFvCnJicNPSCK3//JAxZY2T4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SWCk4KxKjWwSY0e4JJt4p0/gsrbm3JMko77TRNOIHOQHkLRd483iO3PPMg0My4qU78lOzk/Jlz2qnVfBVGQu/9qFc0+aEH7YGasLEeFEwlMkkMBQUs6rya3ceUzzR9nJx3mZB6T1RCRVXwxAaZEqvx9OK461A9uH7LWgOAAJfs0aHbd9bEPRaGB4V0UQjJedDuCASWscGhtsNNJE3Q1vCgWfS6mTx0cN98qtg3Cx+NsZgWAVhZJFUHwh3lIp11gvYcJekIM6N7GgbYYqkg3Ld8Hx3ZaWon0asdFog/HuShDf02EHf4dsEc8o2AdsknKUp4GV4dOPAtNanSENf9O2hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jVmMe+aY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jVmMe+aY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XwZZt0tknz2xjJ
	for <openbmc@lists.ozlabs.org>; Sun, 24 Nov 2024 01:48:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D77DA40192;
	Sat, 23 Nov 2024 14:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D960C4CECD;
	Sat, 23 Nov 2024 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732373281;
	bh=GX7YvZaT3/KO8mANa0y6U65yYYqqMMUzkhuc/FPkcKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jVmMe+aYyAsPsljF2ajajb8lm7vuDc8/WySMMqeaCpAoEV2gxHm2N1VrCAeEKqaN6
	 8ZwuUwTdlte5vhLxHoChScNC4IV0ijAHGUKzlqEpigM3nPOmnJNBkLWbTdS/Ah9CXe
	 IHOFtNFtHQ70k1h0l4SXVjnUFpR/h8Or/ALQPTdKmRnE5x3IUGks/mJ3Vi3ZtA2ipo
	 flub/uuPnrblen6kvqp/qFLdms8rNvfz/t4cWudleSvcyfdTYqslLJT/856Q8B/xT7
	 FvVvAw25AQeUUa0zeHzV7jD7kmVxNgzrNkrVFY/oRDqKnO0eghKVp5KvproUacD8RP
	 Co/DVWyv+bA6g==
Date: Sat, 23 Nov 2024 14:47:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Hsian Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: iio: adc: Add binding for Nuvoton
 NCT720x ADCs
Message-ID: <20241123144750.43eaa1c5@jic23-huawei>
In-Reply-To: <CA+4VgcJ=8wDWWnmgEt-UkEUfnfD8kGtHe44G5+dcRYt=KdwNfw@mail.gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
	<20241106023916.440767-2-j2anfernee@gmail.com>
	<6c20875c-4145-4c91-b3b5-8f70ecb126f0@amperemail.onmicrosoft.com>
	<CA+4VgcJD74ar9zQCj38M2w8FzGWpq+u5Z7ip9M7a1Lu7u8rojw@mail.gmail.com>
	<20241109134228.4359d803@jic23-huawei>
	<20241109142943.3d960742@jic23-huawei>
	<CA+4VgcJ=8wDWWnmgEt-UkEUfnfD8kGtHe44G5+dcRYt=KdwNfw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 25 Nov 2024 09:51:27 +1100
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

On Mon, 11 Nov 2024 15:45:03 +0800
Yu-Hsian Yang <j2anfernee@gmail.com> wrote:

> Dear Jonathan Cameron,
>=20
> For property read-vin-data-size, we have a internal discussion.
>=20
> For Nuvoton NCT7201/NCT7202 chip,
> Take an example as to Vin1:
> The VIN reading supports Byte read (One Byte) and Word read (Two Byte)
>=20
> For Byte read:
> First read Index 00h to get VIN1 MSB, then read Index 0Fh Bit 3~7 to
> get VIN1 LSB.
> Index 0Fh is a shared LSB for all VINs.
>=20
> For Word read:
> Read Index 00h and get 2 Byte (VIN1 MSB and VIN1 LSB).
>=20
> We would refer your suggestion,
> we  declare a property named "nvuoton,read-vin-data-size" with default va=
lue 16
> for user to use.

Thanks for the info.  If the i2c controller allows word read
then the right thing is to always use it.

Just check for I2C_FUNC_SMBUS_READ_WORD_DATA with
i2c_check_functionality()

If it's supported use i2c_smbus_read_word_swapped()
if not, do the i2c_smbus_read_byte() approach.

We don't need to want this in DT as it is a property of the smbus
controller, not this device.

Jonathan




>=20
> Jonathan Cameron <jic23@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=889=
=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On Sat, 9 Nov 2024 13:42:28 +0000
> > Jonathan Cameron <jic23@kernel.org> wrote:
> > =20
> > > On Wed, 6 Nov 2024 17:22:35 +0800
> > > Yu-Hsian Yang <j2anfernee@gmail.com> wrote:
> > > =20
> > > > Dear Chanh Nguyen,
> > > >
> > > > Thank you for your response.
> > > >
> > > > Chanh Nguyen <chanh@amperemail.onmicrosoft.com> =E6=96=BC 2024=E5=
=B9=B411=E6=9C=886=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8812:58=E5=
=AF=AB=E9=81=93=EF=BC=9A =20
> > > > >
> > > > >
> > > > >
> > > > > On 06/11/2024 09:39, Eason Yang wrote: =20
> > > > > > This adds a binding specification for the Nuvoton NCT7201/NCT72=
02
> > > > > > family of ADCs.
> > > > > >
> > > > > > Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> > > > > > ---
> > > > > >   .../bindings/iio/adc/nuvoton,nct720x.yaml     | 47 ++++++++++=
+++++++++
> > > > > >   MAINTAINERS                                   |  1 +
> > > > > >   2 files changed, 48 insertions(+)
> > > > > >   create mode 100644 Documentation/devicetree/bindings/iio/adc/=
nuvoton,nct720x.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,=
nct720x.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x.ya=
ml
> > > > > > new file mode 100644
> > > > > > index 000000000000..3052039af10e
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x=
.yaml
> > > > > > @@ -0,0 +1,47 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/iio/adc/nuvoton,nct720x.yam=
l#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Nuvoton nct7202 and similar ADCs
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Eason Yang <yhyang2@nuvoton.com>
> > > > > > +
> > > > > > +description: |
> > > > > > +   Family of ADCs with i2c interface.
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - nuvoton,nct7201
> > > > > > +      - nuvoton,nct7202
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  read-vin-data-size: =20
> > > > >
> > > > > Is it generic property or vendor property? I tried to find in the
> > > > > https://github.com/torvalds/linux/tree/master/Documentation/devic=
etree/bindings
> > > > > , but it seems this property hasn't been used on other devices.
> > > > >
> > > > > If it is vendor property, then I think it should include a vendor
> > > > > prefix. For examples:
> > > > >
> > > > > https://github.com/torvalds/linux/blob/master/Documentation/devic=
etree/bindings/iio/adc/adi%2Cad7780.yaml#L50
> > > > > https://github.com/torvalds/linux/blob/master/Documentation/devic=
etree/bindings/iio/adc/fsl%2Cvf610-adc.yaml#L42
> > > > > https://github.com/torvalds/linux/blob/master/Documentation/devic=
etree/bindings/iio/adc/st%2Cstmpe-adc.yaml#L22
> > > > >
> > > > > =20
> > > >
> > > > I would add a vendor prefix for it. =20
> > >
> > > Why do we want this at all?  Is this device sufficiently high
> > > performance that Linux will ever want to trade of resolution against
> > > sampling speed?
> > >
> > > If so that seems like a policy control that belongs in userspace. Note
> > > that to support that in IIO I would want a strong justification for w=
hy we dno't
> > > just set it to 16 always. We just go for maximum resolution in the va=
st majority
> > > of drivers that support control of this. =20
> > I'd misunderstood what this is. It's a control no what the i2c word siz=
e is.
> > Do we actually care about supporting rubbish i2c controllers?  How many
> > can't do a word access?
> >
> > If you do it should be detected from the controller rather than in DT.
> > =20
> > >
> > > =20
> > > > =20
> > > > > > +    description: number of data bits per read vin
> > > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > > +    enum: [8, 16]
> > > > > > +
> > > > > > +required:
> > > > > > +  - compatible
> > > > > > +  - reg
> > > > > > +  - read-vin-data-size
> > > > > > +
> > > > > > +additionalProperties: false
> > > > > > +
> > > > > > +examples:
> > > > > > +  - |
> > > > > > +    i2c {
> > > > > > +        #address-cells =3D <1>;
> > > > > > +        #size-cells =3D <0>;
> > > > > > +
> > > > > > +        nct7202@1d { =20
> > > > >
> > > > > I think the Node name should follow
> > > > > https://devicetree-specification.readthedocs.io/en/latest/chapter=
2-devicetree-basics.html#generic-names-recommendation
> > > > >
> > > > >
> > > > > For some examples that were merged before
> > > > >
> > > > > https://github.com/torvalds/linux/blob/master/Documentation/devic=
etree/bindings/iio/adc/adi%2Cad7091r5.yaml#L102
> > > > > https://github.com/torvalds/linux/blob/master/Documentation/devic=
etree/bindings/iio/adc/maxim%2Cmax1238.yaml#L73
> > > > > https://github.com/torvalds/linux/blob/master/Documentation/devic=
etree/bindings/iio/adc/ti%2Cadc081c.yaml#L49
> > > > > =20
> > > >
> > > > I would change it for the node naming.
> > > > =20
> > > > > > +            compatible =3D "nuvoton,nct7202";
> > > > > > +            reg =3D <0x1d>;
> > > > > > +            read-vin-data-size =3D <8>;
> > > > > > +        };
> > > > > > +    };
> > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > index 91d0609db61b..68570c58e7aa 100644
> > > > > > --- a/MAINTAINERS
> > > > > > +++ b/MAINTAINERS
> > > > > > @@ -2746,6 +2746,7 @@ L:      openbmc@lists.ozlabs.org (moderat=
ed for non-subscribers)
> > > > > >   S:  Supported
> > > > > >   F:  Documentation/devicetree/bindings/*/*/*npcm*
> > > > > >   F:  Documentation/devicetree/bindings/*/*npcm*
> > > > > > +F:   Documentation/devicetree/bindings/iio/adc/nuvoton,nct720x=
.yaml
> > > > > >   F:  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.ya=
ml
> > > > > >   F:  arch/arm/boot/dts/nuvoton/nuvoton-npcm*
> > > > > >   F:  arch/arm/mach-npcm/ =20
> > > > > =20
> > >
> > > =20
> > =20

