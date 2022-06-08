Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA2543D7A
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 22:17:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJS02RFnz3brt
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 06:17:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPio/qZ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPio/qZ9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJRd2sLZz3bmC
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:17:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6208D618F9;
	Wed,  8 Jun 2022 20:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C972C3411C;
	Wed,  8 Jun 2022 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654719434;
	bh=EquiZEmGpaGk9Hi66098V9Sqwcoq46fARusu9O2QJ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPio/qZ9D16pdwZJMpNek54aMJ+Dfem3MsatJLwYrtKgUdW/4gGd46VOeEXsAwTrH
	 RqINva74s4v7sDjhdDqJQ4+nM/Dq6EWQD54OTvFkRid315TgGteGTUABv7APtTXjiR
	 l1eMxUOfco9nj5ABFbOpi2rUS1ZWLZ6QVp1StXjp3a0O/WidERGkAT8YaVyYmuTcrf
	 Pz9otFdc8uyOPrrip5m1zGEmrq9ITogvNfs+ghyCIBBmv2+tuLH4VI+s8wRRpWp2dC
	 8FLhWW8C2gdQLqXLnl97/JBkDBhEbhCY1+vLHyr7u7X/cm/APwtNO6wxW3Ogl5SgYT
	 eEjkwRS5XoBqA==
Date: Wed, 8 Jun 2022 22:17:11 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] i2c: npcm7xx: barco-p50-gpio: Add check for
 platform_driver_register
Message-ID: <YqEDx3S9z1y12mfS@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220526094100.1494193-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ssq14js36jhNveXs"
Content-Disposition: inline
In-Reply-To: <20220526094100.1494193-1-jiasheng@iscas.ac.cn>
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ssq14js36jhNveXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022 at 05:41:00PM +0800, Jiasheng Jiang wrote:
> As platform_driver_register() could fail, it should be better
> to deal with the return value in order to maintain the code
> consisitency.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Applied to for-current, thanks! But what is with the "barco-p50-gpio:"
in the $subject?


--ssq14js36jhNveXs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhA8MACgkQFA3kzBSg
KbYR8Q/+Kk7ypQngwMr+zLMeL4dcpbFw/Lwkywizw+7PgPtQNucwWQnhHz5Yc6gp
8ukBBDb/Zfvu5BxQvrAnLxlJOvfUGg6sQbcexRfsDR16CEfVKTYBaM9WCp2KggHH
xiO4vgHK656o5B6d84N3R0T/CXM3OmNQ0Cy60oNSczPC1xf8PwUWqXovX/Sl5USd
0I6mUeYO6cGg+k56ECDLD+QdEK/neGPUKVU6WHmlaj4u7BXtE+TzLV1P3yNJB+lz
aHILnAicIB8UuTeY7D9UCvMhCXKW4T7VoHW0lE5FhBK/uOGnJD/vbUXcsQM6r7zQ
o7JyDbjliUqo/EkSBHwEACzWWAqH5Vjg/VSu2jM1B0GWetGuWhnUr/bQ4lwKITlu
6lo4GqxPQwnFUerVtbuhQC9QPs/gr5WK8b1EB9FlXCDo6VfJDnA6TmH0T8aSl3vz
c1Pe9Ut+6fbjiwcCME7GebC3gYh4EB2uGWA4jgn5v8leEkXBZZ6byaAPpRR/xDIo
3SocXQBDdWFzXu4UdQYDq63y6x6CIswj08ZKHwW/AlQy/XY18pBnF7Y6cXi6Tb7E
LdLsGhTW2vrC7dBcHgdfM5hXWDCX0twBwU/f2givvpWPehoYTUN/k8HQ8vZu6x/0
RimrFe1hNRBCU4cv+DzJVb/EcssE4i+V51w3Oe0KKx3XO3w03+M=
=ENlH
-----END PGP SIGNATURE-----

--ssq14js36jhNveXs--
