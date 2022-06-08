Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3059543D2C
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 22:03:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJ7L3Nblz3bn5
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 06:03:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KpDtqJLF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KpDtqJLF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJ6y3NgDz2xgX
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:02:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4C5961C27;
	Wed,  8 Jun 2022 20:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896EBC34116;
	Wed,  8 Jun 2022 20:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654718567;
	bh=fOeilYXwytop+oGSxZ1LqPitweKw68M3Rw2KIU8vzW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KpDtqJLFoIYj0hsVC8Ekj5EWaFS0g5ZLwt8d2tznwf1HudmIsPXYf8ZtLbxnoTSJj
	 s9C7zzlEG/fxaeF/PtJtrlI8InnG2wAU9cQ7+dsH0h7+/xGuVlH2T4RPo4IffqgV1a
	 OG8vwUe5pXdMRJmEZuZdUt2B4Cal8S+obznxqDwaIMx7r/Ltwy+qtrwxvQxbS8EZJv
	 vY4PilVsyphA7hyGUxisisQITnOa0geUFOO3HGCIQB0k/vRrfxgLje0jGKf9S+w7js
	 fUcqCz6j+au7l+yVXVO+26HYC25c3siZ9YvKsAL4klx+bkcdpN+1UQrLf65G8/IeFP
	 ooT6J0ruZLnEQ==
Date: Wed, 8 Jun 2022 22:02:43 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: i2c: npcm: support NPCM845
Message-ID: <YqEAY2jUQC8itp6h@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
	semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
	arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
	kfting@nuvoton.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220525032341.3182-1-warp5tw@gmail.com>
 <20220525032341.3182-2-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eOEfobvHUxMla7mI"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-2-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com, jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eOEfobvHUxMla7mI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:37AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--eOEfobvHUxMla7mI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAGMACgkQFA3kzBSg
KbbPwA//TUBjvk1YsaJncMxAWQA5U+8iQHievylO34AceXllsye/+zAPEOTWm2mb
N4kNNtvmOVHDiQrJF/tUJJCbp1PlxH5Lu5PA7sntMTiDb6l51IFtWe42eUDBbQcN
cgc4vx9DLG+0qFV0cXcQ4F/V1AkhZFvoAmbLKr4vbjLSHjtkhTcOBWHBuClfZg++
/B+9knOKF7+HbEv9aqK4huU6BoAf3j9eCHwqTu2OlrxQQ/oC3/ttDC6EOENpJf/I
S43JXxY33G1nknOnWJBT74v64uCuuumjTHREqBUkmCF0v72Pfp9qW02AZ3t5ArJF
Re2hPKn9Mq1NZECeD02D8hvFyFv0llD1vSSs8M6Y3L2y1PmWYxaHNyUqzzYP5voO
sS9XyUWTjOTjHHSl0V7eORM84HGPXpunY3AM6qhM8ut8cgTw85Yz4zBfGliyeG21
iX5iArRTy4rr0Aw+AntRSPgTk3BnZFHvPZUDtnQPeD18lT+MZlMcFYy4f3WzUfCQ
RzlxhCAxegRNgrxQoEhYtONLMkRrgxfNvXv2GNKb8zXPc9B6N3ZhcW90JdkYZ4nS
8YANTox5TOwJSfHu2VkW3IYS+ISFrvVXeeKLg9Fd6YmYoUUR1WFoPW380WurxnxF
ABt/X1CT8zmP65TZk83v75V3m56QRF0VFkaTRZO0Wl0SPNU6iJ8=
=r/Nu
-----END PGP SIGNATURE-----

--eOEfobvHUxMla7mI--
