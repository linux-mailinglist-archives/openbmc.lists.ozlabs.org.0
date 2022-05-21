Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5410A52F8FE
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:51:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4t5B24fZz3bl8
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:51:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fKlxLsCp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fKlxLsCp; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4t4l2jwTz3bWg
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 15:51:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0825960B4E;
 Sat, 21 May 2022 05:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5025BC385A9;
 Sat, 21 May 2022 05:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112274;
 bh=syXKG/z57TefV3dMopN2xDPnPMufkfCpN2UdITig8I8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKlxLsCpPFrgL+hGnGSsFBVl6YxGuipv50DqYFBNrKLSbzlSE4Rh+D3haMIj43RNB
 7mLisnbdjcJawdwSQYsxeF3ig4WA9k9jWAJ6TCnmpUnCuGT2LppvV2QsTn1sRc6+Do
 eVkjt21acwZfOKnv4nYU2w7wG8ZLobzKGob8a5BuLO3uqkf3pM1R/0xxVF7c+fRmIt
 cOSnWbePAS15odZCJwnhApyNinTX//gLa2+TNJBMTl/Y78Zu+7uwNsQi52tZcawiEc
 FrTt8HLCjrW5UF8VMRzQXtYdGgnBjbMWmnlpBwX6Qc2qHtUhBKkqC9C7KzXyRykzoh
 YJropIMthyqGg==
Date: Sat, 21 May 2022 07:51:04 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 02/10] i2c: npcm: Change the way of getting GCR regmap
Message-ID: <Yoh9yL1FO7aXme69@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-3-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bU2gdkY5QlUi4qSW"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-3-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, rafal@milecki.pl,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com,
 jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bU2gdkY5QlUi4qSW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:34PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Change the way of getting NPCM system manager reigster (GCR)
> and still maintain the old mechanism as a fallback if getting
> nuvoton,sys-mgr fails while working with the legacy devicetree
> file.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!

I dropped the Fixes tag, doesn't look like a bugfix to me.


--bU2gdkY5QlUi4qSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfcQACgkQFA3kzBSg
KbbwHg//aibCgLXqkGBT2Upx69gKMShfagM3lEA6Sff27ZwpXdP7ztW+j45lPo7y
TNMXqItjUhFfuSRObT6t481Cx+Oy3ZvNb8g8TjKhWA0lmB+F9CnFPzXczUXAfkXU
fXC00Hq3uumu9cPn7EeeY+ppolW5FR8d1tcOA4e7O3mI2a8ILUcn4ssQFvG0BPQi
2/j7bs88QvaKW+3+UGZuw2CGyiusvlFW9o9LWQJnHtF7QxQM0DjHQC49qOaBjMiC
fB+d7Z3iK0+QEZbPjnvQlD7DPKlwe+LJiCSpCHMaWLHZoQI68GRMQf6VsheYuJ/J
KHTQWHpeyxyIsJJ2fHXv/Vge4SKBuP6jNmMDr8e7opxeqC4/co8Vade9sKSuePLN
z0CceGU07ByyGVMNudf0sFmxOWZYVBHqbi7r/oFYCxVN9q4avwuGwKGCp1HJcLwn
/jF63EKhvjI/Z9BUid4BYYpX2MorRXZvMO8gchW4P1RhlFOsqs4vLLtx7OAo+ug+
LpJr/GvmIP5Vj7cRbx+Mr61APABNvK9XjPD+itP+pVhtNaGft+hjUgXIkSLt88BN
Yqaq6d++odaSZz1oGMshaokD51PUYME+BKQB78E6SgoQC7PYmSxqU/JrvZIbghFY
Ilqav4BK6V504QMSH4l0ssChktkXjTHQn8cOEMzRHy9UtAbWX+c=
=wrpy
-----END PGP SIGNATURE-----

--bU2gdkY5QlUi4qSW--
