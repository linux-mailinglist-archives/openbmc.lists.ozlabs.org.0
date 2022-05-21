Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA87352F928
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 08:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4tLq5rRDz3086
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 16:03:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U7SBCDI3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U7SBCDI3; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4tLS127yz2xbY
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 16:03:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 811B1B82DC1;
 Sat, 21 May 2022 06:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33142C385A9;
 Sat, 21 May 2022 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112988;
 bh=EokiGj4oo5cfXHMFY6g6UZL0cexAYA6NAPqf10lZg3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U7SBCDI3pPxHpZa6gSvWN729HWAZEQ0jslaI8mYXPYuHujUOWbKWdNsOKvj6DaomJ
 h6BD58SCAhLNlZWg0KqJ+bz9hVoKn6Pu/TE+FdQHiItfs1Nq0DNZSTLw9FhZ6cWSJ4
 58KRwdIjdeqGv4vfp30DplP5O+vtzlrVktoSDr1s8PeH16C9kba862YZUYoJZWjeVc
 gjMmOBv0x+/91UP8ITgUUj2zm7UVGN09mbyDD1HU1AqpvcVoB/REhj7ymcyTfQ+vfG
 oKI3GF2n5ebv0Ercz1gDPYif7vTneI4IBsOxPSBtNJnCOkZjZ1vOSWPzKvFeAC/vt8
 8VPvbzfjjYjxQ==
Date: Sat, 21 May 2022 08:03:04 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 10/10] i2c: npcm: Capitalize the one-line comment
Message-ID: <YoiAmI2wZz2Bkcm1@shikoro>
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
 <20220517101142.28421-11-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZbK8rDGXnQ6VwGHV"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-11-warp5tw@gmail.com>
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


--ZbK8rDGXnQ6VwGHV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:42PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Make the one-line comments capital in the driver to get the comment style
> consistent.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Needs to wait until comments to patches 8+9 are addressed.


--ZbK8rDGXnQ6VwGHV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIgJgACgkQFA3kzBSg
KbbzXw//QR+IeaTHDI01/DT8AinuZr2I4HR4/3zK48HStcy+B6/IArWJ5O0A3Xip
WAXWqbJOvZX1JxEJMcWfQiX4plJ2Xy6eXbxXLoVGS61nqPEGTO1qpefTMb483M6I
QWkkIqJUh6RKaU2QJN7hoTjrKVQpn8hF48PmRFm3/V4TsJ4WVUeiXAt/V41DjQgm
Q/147ZD2zfhLL7PQbuRfnuorrUucRTUCQZATVR/4mLDvCOvz8T0MDKfpjUpp07Gd
F4oellcuNv4o1oaPSMbc724BVXoSe/0k6CfCDAuXi3EaVfxr4EqiqvsrUIsnXg19
UephlIYzPVK5rTGNPFG5l4UJp7QfNN4GZo37jBpoGEYz9tBtUZlBOAPAeLdi2sSk
8vePWEiP3798XdnYKdNb0egNy91OkvHmaAMsFrdfQV1mlrPNQLJmZhtHlAVzW6G/
yHYl2E2+eQUjpR5GFw3bVkZsJNdyaTX25yfFvta4MOzr7AA7i0GmaSZoJGHR4j1w
AZQ8fm90+50XP/anG5RV+MVCjMGCJ2j2s64cT8vWoBFH6iPFGVOJWY+B9Ya8xbKc
Bz8R/McJhOpxu6TkmkOtVA6uqLBgknE3g/uk7m5R42mxaZgJHQLa9Vas6RueQjQx
UJAtljTQh0XRBPYMUqO4k57yfBvzVV052fGwrLsNQpzqSxC0bYg=
=PckP
-----END PGP SIGNATURE-----

--ZbK8rDGXnQ6VwGHV--
