Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DA856AA8
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 18:13:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TRi71hB4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbM8t3rpCz3h05
	for <lists+openbmc@lfdr.de>; Fri, 16 Feb 2024 04:13:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TRi71hB4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbM8F5TXKz3cT2;
	Fri, 16 Feb 2024 04:13:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3694BCE27B2;
	Thu, 15 Feb 2024 17:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9E1C433F1;
	Thu, 15 Feb 2024 17:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708017176;
	bh=pk5Mt+RImQXUgBvMKAZepH41L3RMj9FKexYkzEU54nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TRi71hB4J37HDQh3t1ZfohcSCokTMBTIWFlXk8unUCZGAcnbgcFAYuiLZDhQSHFXj
	 hxT+sMSSa2T7IKUkyx7sMVbr5h3zjN/ggkblR69V4kg7xZzVEX0XWnHoIpww+EM64f
	 A/IKw8J0A4lekCriXehJQD7MMFAJLD5unYXKPBQw7v1i5jMUSFLktChLwDH/olDmr6
	 CSUZZqPuqBvJ7A4Wk6rpL/Vmhtlp2D1ikj2A+r1ja3TPU7uhZn0ER6svRLkWUeWRSX
	 tp1lzO4k5PRCYHeyCQPLN1SV82Rn1Ywh92tYhNObqXrzSMmHq0Ei9DTSfRNleeWcss
	 5jDYkHp02pV+Q==
Date: Thu, 15 Feb 2024 17:12:50 +0000
From: Conor Dooley <conor@kernel.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH] Add eSPI device
 driver (flash channel)
Message-ID: <20240215-probable-gimmick-83d5dcbc4729@spud>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
 <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
 <20240214-yoyo-platinum-dcd0e7e16a22@spud>
 <TYZPR06MB6640F82C539F0B17BCDCC55E914D2@TYZPR06MB6640.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jYXpxHj7B0OPYCKZ"
Content-Disposition: inline
In-Reply-To: <TYZPR06MB6640F82C539F0B17BCDCC55E914D2@TYZPR06MB6640.apcprd06.prod.outlook.com>
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
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "zev@bewilderbeest.net" <zev@bewilderbeest.net>, Ryan Chen <ryan_chen@aspeedtech.com>, Vignesh Raghavendra <vigneshr@ti.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Richard Weinberger <richard@nod.at>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>, Patrick Rudolph <patrick.rudolph@9elements.com>, Manojkiran Eda <manojkiran.eda@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jYXpxHj7B0OPYCKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 01:56:00AM +0000, ChiaWei Wang wrote:
> >=20
> > On Wed, Feb 14, 2024 at 11:34:31AM +0000, ChiaWei Wang wrote:
> > > We appreciate that you are willing to help on the open source contrib=
ution.
> > > However, please co-work with Aspeed before submitting drivers of Aspe=
ed
> > HW.
> > > Otherwise, a misleading driver on the community are going to bring to=
ns of
> > customer issues to Aspeed.
> >=20
> > It may not apply in this particular case as Aspeed did write the origin=
al driver
> > and it is polite to work with previous authors when respinning a patchs=
et, but in
> > general there is no need to work with a hardware vendor before writing =
drivers
> > for their hardware.
> >=20
> > Blocking a driver because that company might receive more support reque=
sts
> > is not the kernel's problem.
>=20
> I agree with that and Aspeed will not refuse to support.
>=20
> However, in this case, the authors, IBM, and Aspeed already have discussi=
on (at least 4 times) before and foresee "issues" on practical eSPI SAFS us=
e.
> If there is already a known issue of the driver, why ignoring the previou=
s discussion and push it?
> A compromise is to ask for driver renaming to espi-mafs to avoid confusio=
n.
> Otherwise we need to explain, again, why the driver does not fulfill the =
SAFS expectation.

To be clear, in case you misunderstood, I was making a general point and
not about this particular patchset.

--jYXpxHj7B0OPYCKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc5GEgAKCRB4tDGHoIJi
0q6qAQCwK7ClX6/ipMYZ/2VmkvC0xZdaAiUrt57wlJ0DcnoxoAD+OADevy96or/y
yayrHHRwjY2W37V1/RxOp8h0jhl17QU=
=71+s
-----END PGP SIGNATURE-----

--jYXpxHj7B0OPYCKZ--
