Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C37A9C34F5
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 23:04:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XmmsX1BsLz3g26
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 09:03:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731159958;
	cv=none; b=EB+QxyT2BQu+Ni7xCEZ1pYmQKTfeMYT9uXoQrXpM6Qzr7WdI8chmNMwJ7bzen5MVL+KQQRC6ZbE0X+XYWMpHfjr6irAODzIe67+kXOpGoXCER1bKkTkdBs865i9OibQN9kqvHITaKtNDjiOx1MjrRR1EoEEPGsu08lIse/v3bVgqjYdieQaO5MNvaDsXAJ5dJFz3nWw2VYmnFZCVZvfxa4qKt2zKTurCHZi24ot5d2kfc2e3M52kXXV/aB/nzcbR+5c98mMDMSx1YoVp1tJNdMIzOWm3hhyWXMO8JxmmerYC1uAgKwzunL4D6wLK+at+t1IOj7AbVwzq9Rs8rGaVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731159958; c=relaxed/relaxed;
	bh=LVkFOZSd96PN3x7e9Bp7WhnaD8SMe5KCsz3gc8XapHw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahLs9A+OeRgxkBsIZmTWB+LrPzMHDM459f98fJeocOAX4Ns0V7Zpw/EKkmG2yzJfwsmqeL6wpo4pxc8+64Y2L/u43/uN5x3nlpkRFpw8hFYOKLUWst2jfbziRl3apUOJMmQNhMrwpTL1AE42pn/DsY4RqD6d37UfT4m0pYdzSbsHlSPgPow9mcojSf6cwtPPESJAya5e2qvHw9BviK635ceJyTXsNUwaYbBsXeyvklRZxcl2SLNse7IBdA8FEeIL5Y5cJTf6q+jPRmBNqsRqKnAVLr32iXrtipjazdy07HX9H76yF/UAv7HIGi5MCsNgQbM3OMs11FqXuyXzC9/6Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A4f8JEUA; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A4f8JEUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xlxsd00d6z2xjv
	for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2024 00:45:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F32DE5C4758;
	Sat,  9 Nov 2024 13:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E92C4CECF;
	Sat,  9 Nov 2024 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731159954;
	bh=51VVdfREui1qZUQyEwq/t/lqxD5LBRLs9fVrDJvafrM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A4f8JEUAeWuSU71MmsGZYkT/3933uq2uKn1TRDxyhUW6KhJiwPQES6RY5KYb8VHUn
	 HI0nYoJPIIh0GZZLiKJ6J5fnBP1MjhEzXW5qBVOIvg+OYQcaDph7KY9qDFa70zt2jC
	 tizdMjMh8W1XtiSPIlVNSKqzf1toqI314YAi0d6PxWqMU3HtCs2b+tZj+8rNnPXihb
	 AOkTx5h76aJr1DIgdZpNYTdse4R1rkS5/eCbtT72KPA6I9mO1qL11xdMMLszG8RYAa
	 y+8+P2Aa5b9p6vBPqn/68Cx0eSF+upb88IwoaMhUu/qBA8bRrBN/cYYiao5Ob0hWdd
	 aMm+LpslldYzA==
Date: Sat, 9 Nov 2024 13:45:38 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Yu-Hsian Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <20241109134538.6f09971d@jic23-huawei>
In-Reply-To: <CA+4VgcJSt-LUNtH6TMpk7om+PbO1aQvmt1WHi-cYMxa8p+Um5A@mail.gmail.com>
References: <20241106023916.440767-1-j2anfernee@gmail.com>
	<20241106023916.440767-3-j2anfernee@gmail.com>
	<fd4db31d-4e55-4f0e-a96d-d193c28fd784@kernel.org>
	<CA+4VgcJSt-LUNtH6TMpk7om+PbO1aQvmt1WHi-cYMxa8p+Um5A@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, marius.cristea@microchip.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>, olivier.moysan@foss.st.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, joao.goncalves@toradex.com, nuno.sa@analog.com, matteomartelli3@gmail.com, chanh@os.amperecomputing.com, andy@kernel.org, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 7 Nov 2024 08:41:21 +0800
Yu-Hsian Yang <j2anfernee@gmail.com> wrote:

> Dear Krzysztof Kozlowski,
>=20
> Thank you for your response.
>=20
> Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:41=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On 06/11/2024 03:39, Eason Yang wrote: =20
> > > Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> > >
> > > NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and u=
p to
> > > 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins =
for
> > > independent alarm signals, and the all threshold values could be set =
for
> > > system protection without any timing delay. It also supports reset in=
put
> > > RSTIN# to recover system from a fault condition.
> > >
> > > Currently, only single-edge mode conversion and threshold events supp=
ort.
> > >
> > > Signed-off-by: Eason Yang <j2anfernee@gmail.com> =20
> >
> > ...
> > =20
> > > +
> > > +static int nct720x_probe(struct i2c_client *client)
> > > +{
> > > +     const struct i2c_device_id *id =3D i2c_client_get_device_id(cli=
ent);
> > > +     struct nct720x_chip_info *chip;
> > > +     struct iio_dev *indio_dev;
> > > +     int ret;
> > > +     u32 tmp;
> > > +
> > > +     indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*chip)=
);
> > > +     if (!indio_dev)
> > > +             return -ENOMEM;
> > > +     chip =3D iio_priv(indio_dev);
> > > +
> > > +     if (client->dev.of_node)
> > > +             chip->type =3D (enum nct720x_chips)device_get_match_dat=
a(&client->dev);
> > > +     else
> > > +             chip->type =3D i2c_match_id(nct720x_id, client)->driver=
_data; =20
> >
> > I believe there is a I2C wrapper for above.
> > =20
>=20
> Got it.

Don't pass an enum value as data.  Pass a pointer to a structure that descr=
ibes the particular
variant.  The 0 value which tends to end up in enums is an error for device=
_get_match_data.

>=20
> > > +
> > > +     chip->vin_max =3D (chip->type =3D=3D nct7201) ? NCT7201_VIN_MAX=
 : NCT7202_VIN_MAX;
> > > +
> > > +     ret =3D of_property_read_u32(client->dev.of_node, "read-vin-dat=
a-size", &tmp);
> > > +     if (ret < 0) {
> > > +             pr_err("read-vin-data-size property not found\n"); =20
> >
> > Please use dev_xxx in your driver code. =20
>=20
> Got it.
>=20
> >
> >
> > Best regards,
> > Krzysztof
> > =20

