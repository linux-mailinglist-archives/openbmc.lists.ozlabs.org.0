Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8737A4AC4E0
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:04:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsrZ71kr1z3bTr
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 03:04:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KBABG4X2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KBABG4X2; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsrYm0M8Pz2xBl
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 03:04:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D095161365;
 Mon,  7 Feb 2022 16:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969C3C004E1;
 Mon,  7 Feb 2022 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644249865;
 bh=0a6KWgDIwGsQreOTuboCpj+OcoV5SAHNcNpoKtW53vU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KBABG4X2nJFzGiunA/MeinaIyX+jf1x9+Lj/ewXDqgCgBzmmWGC4tXpjTRaK4dIrT
 kKMMn93eUoDRqoEiO5Lk51OZBYijZRCkcbVKsdjo4H9/ET/K8bq5A8HBpnPdlhqntc
 +vfU2c+xspZiCfSEg4k5CW1O16lG60UhkSvb9aHqpPiTXB4tQ6XIf256W5LloiJ8DP
 BC3dHh/dCyw/FGF8atG9NZrftqKaR/y1dDrVz1iJeaISaUg1JsQoLBZG+Hem3NdssH
 cQ0djSP2o+I1Cv0ae26rz+NkvD/gsz/NGHYORm+GmOw9j51QFcpoOlkPna4nU7MvIF
 TR9wHc8HHRVHg==
Date: Mon, 7 Feb 2022 17:04:22 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] i2c: npcm7xx: Fix typos
Message-ID: <YgFDBjNNcdZTxq2m@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-i2c@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+x8olvK+iClJ7JRj"
Content-Disposition: inline
In-Reply-To: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--+x8olvK+iClJ7JRj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 29, 2022 at 10:39:07AM +0100, Jonathan Neusch=C3=A4fer wrote:
> The comments in this driver have a few typos. Let's fix them.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!


--+x8olvK+iClJ7JRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBQwUACgkQFA3kzBSg
KbYPSBAAgW7246nTpjLJ3sAaS/G0HlCLxjizARTo6bM6o0ScAmbPP29jr05YRwCx
cH7JuhDuaoGy5QIb6TD4AqtclHp0kDSZFkFNnkt8Y1R1SEWcNIIl2JyEQPe6HrQY
9l2jjj/LDc0NVtkbt/6iJ9V66qEWBvGFjgs1GSQgI/K47vWI3eeThjYfNINQFVIe
MsSAD8xOx65lxg9saxDGSqyKEwkohpo1qx2Z0DcR9Qt0uKSIuTPogJcPYCPO2AY5
VdMSTqHrlQ36DDUqlw1VXO+WuG4WKhI60DrRxzPko2gMGtYMq0HuHdnYQtriP03L
ofrJot6gE/PgcmYiAenAiQSJi1IgkgFTGRG/9frpkH0CAb6hkSOn/QGtQlmPJbwv
QJuEBP6iOPbsDjcD8kU5793CMlh+FwnRX9XMhCTKJrv76b56qJnBi8N78I3dOPvK
L0w4DTQyKe37dGJT5lfdMZYKRXxGv0v058+UZSpQSR1J9qdsAwTYHRpaPVwzkEyA
su2W8eqATI+Yn3hMYtTq7qtZFVGXJcdHQfV2nArpJQmnIVFprR/7znO0x3TVPVC6
ivkiTue/kcp2OJmOmN5OKxs0cccGuXaDy6ZmOgHQw6V+/ps9UB9bL05WLUMQEnK+
YN1dObLNkYVe/Qx+yZvzGKXU/NXgRcmHCvkuawo7C0r8o5zE+3Y=
=J/MV
-----END PGP SIGNATURE-----

--+x8olvK+iClJ7JRj--
