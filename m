Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF9543D45
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 22:05:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJB03SwVz3bqR
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 06:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z7YFKWil;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z7YFKWil;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJ8R0Ct0z3bvZ
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:04:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 056B4CE2AA9;
	Wed,  8 Jun 2022 20:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64005C34116;
	Wed,  8 Jun 2022 20:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654718643;
	bh=iEDtaw+UD7JzNvI4iPQwfWlhzPxIqIbseSeOPF4qN8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7YFKWilbACVLrz3oTq8C2wj6mXmEEBKQT2GY0+0j6yO81B/ZPe+/o2FcTN53QxyH
	 MkNfXV/eI7FPT0Fftpqg+xF7qiuAApBdLfPOEBsHD7npaJ3qOIs/dpyyPGjnLW31IL
	 JzLl+uZ4xOl8CSwO9lANxR2DnGVswsDdfU1sUuVYy6pgvb5dk06QWmsjwLnfcBOq4T
	 sK8nqUMBKVffCOJSzT96UcY1J+xqSgSMbwYCwdXuvTemT/d/YeEkjl4LPZMbfaEdj3
	 Tm+VhYWA10WjMhnO34EKvCHtqSi5Ygp3x9fYpBc5hPfarr0jI0Vv/ehpgTjja0tGKf
	 /nKZO/PEC3Hng==
Date: Wed, 8 Jun 2022 22:03:59 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 5/5] i2c: npcm: Capitalize the one-line comment
Message-ID: <YqEArxDJoUoPeiGY@kunai>
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
 <20220525032341.3182-6-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mdk8kH3E0NmNboo9"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-6-warp5tw@gmail.com>
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


--Mdk8kH3E0NmNboo9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:41AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Make the one-line comments capital in the driver to get the comment style
> consistent.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Applied to for-next, thanks!


--Mdk8kH3E0NmNboo9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAK8ACgkQFA3kzBSg
KbZktBAAg4+RgB7rQfxMq+y8HenPl+BlvnnQCMGtUyisQ4K+bRaegHOAByUmSUam
tdW7sicRzHSPpv1SjkAqhCu/U6OGiM8m2hmYGXH1DJmNoKG1l0OHaZhbxJP6FPS9
fIx9j6Nv8UqK/cEoid28k49Yyl7ZaxtsWTbhKk1PNh3yaOkSHQ5NMq87gaUhbqn9
1MAexC7g6Y1nfwCZTEvLAos6mZ/IhISS4Vp5GTb9KROAd2wClDzim3f1igqvOOdr
iJ9taWl1HlCEzPP/HKuS50ZFRCWZQOsieSTzqAuXVImXEX379t5t0bklqVf/xw83
f2i6cx0GSszch21T7XgnkjjXcavx672ZnZ/BmpRmiNXvgvGRt5CZACPPkJZphmJh
Sm2PUqUMID4vJJQW+Rc08IlXry28TYbTacIQs9QdWjHVyL+VhSQ/d7DAz2NkQX2G
RVO14tkAhPdk4cWS5wLjhSsy2ZzWmlO0kkR1hEyHwj/hYgx3xQdssT5z3+3JY4ls
AAz8ftBFEwNoSPjoclGc7Oalby+9gQ9i+xqSTfyJAlfkD4XjQc60o7R3iuXARrUm
QwXMYhvI7/iU1nt6sPHnV2OXGibbE6WzoI88sYKJfeRvTPOShYUdVEsh6Fo1QPBM
bJ+Fq+AYOyT6VHOsq6HYSB/2uk3bZ9iS+iJBoBg5SQ2Hkx224sc=
=RPDX
-----END PGP SIGNATURE-----

--Mdk8kH3E0NmNboo9--
