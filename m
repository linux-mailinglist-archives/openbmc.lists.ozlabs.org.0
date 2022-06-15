Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC754D2A1
	for <lists+openbmc@lfdr.de>; Wed, 15 Jun 2022 22:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNcSx5zNFz3brx
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 06:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TaEB3qqt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TaEB3qqt;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNcSW4GGcz3bm5;
	Thu, 16 Jun 2022 06:32:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46FF8616BE;
	Wed, 15 Jun 2022 20:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E81C3411A;
	Wed, 15 Jun 2022 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655325175;
	bh=xweyU4/oqSOwHkI/hoomOugSz3ECvQLAuoo5JQYmEfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaEB3qqtKQ7sFL15nSzdXBJU4cC65s35LLseLFBizPWZY6R0fkh1UNU118TVUYK1o
	 +RgR2Kb7+JUTTRc6tXQLDV5Yr04FvNjjexnZN+hnW90VBWcBBSmrbQ/DXQNlArTmrO
	 88eeDrMzneYDF4mE5yZwMpYmHLHbGZJzvBkYY1WhFONh3L/S7j8pbx+i3oaleJ/16y
	 srDQGXS6Uj5dnKWP+vtWmZ2wEE+3fMfy6S0WYzEs60VGbb09bKpzasdEvB9av9Kcsp
	 1a9AufleimVC0Yf7ajnDauhN/ir1rOjEJDExZ/LCrCN22uG968pCcUBS8atRmknu0U
	 syD3CL+ZAGM4Q==
Date: Wed, 15 Jun 2022 22:32:48 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <YqpB8A2uBi+4epHM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
 <Yn+9QBoPdH8fMm/m@shikoro>
 <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ic1hM2GHeE5Hfcvc"
Content-Disposition: inline
In-Reply-To: <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ic1hM2GHeE5Hfcvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quan,

> When tested with ast2500, it is observed that there's always a
> I2C_SLAVE_WRITE_REQUESTED comes first then other I2C_SLAVE_WRITE_RECEIVED=
's
> follow for all transactions.

Yes, that's the design of the interface :)

> In case slave is busy, the NAK will be asserted on the first occurrence of
> I2C_SLAVE_WRITE_REQUESTED make host to stop the current transaction (host
> later will retry with other transaction) until slave ready.
>=20
> This behavior is expected as we want host to drop all transactions while
> slave is busy on working on the response. That is why we choose to assert
> NAK on the first I2C_SLAVE_WRITE_REQUESTED of the transaction instead of
> I2C_SLAVE_WRITE_RECEIVED.

=46rom Documentation/i2c/slave-interface.rst:

=3D=3D=3D

About ACK/NACK
--------------

It is good behaviour to always ACK the address phase, so the master knows i=
f a
device is basically present or if it mysteriously disappeared. Using NACK to
state being busy is troublesome. SMBus demands to always ACK the address ph=
ase,
while the I2C specification is more loose on that. Most I2C controllers also
automatically ACK when detecting their slave addresses, so there is no opti=
on
to NACK them. For those reasons, this API does not support NACK in the addr=
ess
phase.

=3D=3D=3D

So, the proper design is to NACK on the first received byte. All EEPROMs
do it this way when they are busy because of erasing a page.

All the best,

   Wolfram


--ic1hM2GHeE5Hfcvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKqQewACgkQFA3kzBSg
KbaRvBAAhGHBikwxwBVjvxYQ3WkD53anNZCb8H7DLS+EBHUqZUhE3sB1E0xjhLw9
/D56GGMOC0z26eO0epBcCjharkSDE5kolGFghi/5ymiKkHoS/wGCHuTr6nJVt0xO
CXf1YVkIb4I3bHHxgiAPrOc+N6jw5e+Ujao7nOXjpaTuJ84RNT4hHPNKUcJIqZNR
ciM/xRqC0CslNEW4RH2fapeCw97/HksITYb/1Ix3DabxRnLj6obVmAtuokUr7Tmd
Aro8RsCKMzkJmknyhX4A/cbVuRKXGiWLthW3srmUKPCgu9dndoBsIoTty+E3vJXY
QZO0uNLBRydxJOBXT/+skne0wB3xo4RNuAzYXov/RMVkTGO2r3n3Q99wjSyHv7Zh
BWIy/QnYni2FguU4NtjgBXurWfvqguvLr37+5QMcruMLFsRKkeifb1zfOlVV9RVU
whpoeJrrFrxE3wI/L4Ol3eBokDneI4Ldo4dUvFv+CQ2GNQgj1qLfZcUnqE/SKNKj
JhcvsMNszDV7QXk8jIbzdkWbL5zxijQ4y+q+vOou/b3BZTVJ+d+wXXH72LeIxxPY
JqQD9F2vzrULR55rbXw+ZBU0jESxcBrx3aC54ksz1vIPM7gsuOldNICk00eBI8tD
HmatAjq9W/yS0VpX7XlTsBwk8w8MXJc2/VXzlJaO4M8yLddwLW0=
=SfIi
-----END PGP SIGNATURE-----

--ic1hM2GHeE5Hfcvc--
