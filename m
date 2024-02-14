Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ADD855221
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 19:31:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O3AHXwqS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZmxV5v1Nz3dW7
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 05:31:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O3AHXwqS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZmwv0Q07z3cGD;
	Thu, 15 Feb 2024 05:31:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A90D5CE2382;
	Wed, 14 Feb 2024 18:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE62C43390;
	Wed, 14 Feb 2024 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707935467;
	bh=DqQ+n4sMmsCgeic4jR8u6aoCgKS/praQFMsaqy5xqsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3AHXwqSkO5POA0F9lBb4ChwP/ZSNILgVv96DwvQU+n4Vdq084zSQI/LKhzzz/3HE
	 qj7UkFxJxqMPgXNxwiY3O+IL1e7TxuXkVEtWjS4oeo3E3gL2yiqzfok+5jVUr3H+nT
	 V0QQPtPfDLjDdP0W0oyAPz45O2kftqMz6OQSiX4Aw3vxspviPc7OOo6GwN7DclWYqh
	 audeqpj4t38pplAZIyGSaGoWTgthXRngGCWOBsaGEBzT0SdS10fwSfaio0Upkinn7n
	 TsWx267Grb4nlbKbjw0jLxhGP+ofuhinSSmbxxf5gk9Sl3enCdypaoryVWRw08oiuC
	 p4LjRvMwCfr0g==
Date: Wed, 14 Feb 2024 18:31:01 +0000
From: Conor Dooley <conor@kernel.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH] Add eSPI device
 driver (flash channel)
Message-ID: <20240214-yoyo-platinum-dcd0e7e16a22@spud>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
 <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DN7xbo+G2YJV9a8X"
Content-Disposition: inline
In-Reply-To: <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
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


--DN7xbo+G2YJV9a8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 11:34:31AM +0000, ChiaWei Wang wrote:
> We appreciate that you are willing to help on the open source contributio=
n.=20
> However, please co-work with Aspeed before submitting drivers of Aspeed H=
W.
> Otherwise, a misleading driver on the community are going to bring tons o=
f customer issues to Aspeed.

It may not apply in this particular case as Aspeed did write the
original driver and it is polite to work with previous authors
when respinning a patchset, but in general there is no need to work
with a hardware vendor before writing drivers for their hardware.

Blocking a driver because that company might receive more support
requests is not the kernel's problem.

Cheers,
Conor.


--DN7xbo+G2YJV9a8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc0G5QAKCRB4tDGHoIJi
0jh4AQDULTHpmdpjBuvc/RMvcJk7Fsv+M5FEZdXcxYYbDBlSKAEA7XX/zOdWdqxP
wKZsM8bYsV8j1gJqXlEScsdOOOgxJQU=
=GWXb
-----END PGP SIGNATURE-----

--DN7xbo+G2YJV9a8X--
