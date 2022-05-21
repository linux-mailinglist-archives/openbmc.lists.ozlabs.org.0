Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9152F913
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:54:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4t8c2H9Lz3bn4
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:54:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bgncoWYv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bgncoWYv; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4t7Y07XLz3blY
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 15:53:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 61A55B82E17;
 Sat, 21 May 2022 05:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FA0C385A5;
 Sat, 21 May 2022 05:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112421;
 bh=dpbIpqoujbScv7RvmvWip90jnfnepY2P/FAJKsXF4cQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bgncoWYvFLcFeTXPFtlMs/6ibTWl4YfV7+6xasUSIRzZpR4Dvqnu1672UtZ5XMdyR
 SDAL8/RVqmbuNbkiayONTWP7rRTw3MQO4hZSdFGtTFVA1NORQrhb4JPY5AvzC7AmsA
 TIJb16WJBBzuw0DpvcDbCIfPFpnN7DIHNNdzEnwI8VkBVzqFEp8H3/r3x5/E9MBFSi
 k/8GN6wlVE/J1YwVSjFJzS+wzsDEou/pkfuKOAHgPZRKCYHjBrpigUhr/Eq4Oj+ZUe
 PDQR7f94W8ERCOLTWxmdugsx2pZ2EU3pni4O5w8LiWL1nKpjs5gwdMla9u+Rp05Xed
 UhOuSS7EPsl7Q==
Date: Sat, 21 May 2022 07:53:37 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 07/10] i2c: npcm: Handle spurious interrupts
Message-ID: <Yoh+YZestxT7oG8B@shikoro>
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
 <20220517101142.28421-8-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XIXrVdc2uJ0FLF/V"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-8-warp5tw@gmail.com>
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


--XIXrVdc2uJ0FLF/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:39PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> On some platforms in rare cases (1 to 100,000 transactions),
> the i2c gets a spurious interrupt which means that we enter an interrupt
> but in the interrupt handler we don't find any status bit that points to
> the reason we got this interrupt.
>=20
> This may be a case of a rare HW issue or signal integrity issue that is
> still under investigation.
>=20
> In order to overcome this we are doing the following:
> 1. Disable incoming interrupts in master mode only when slave mode is not
>    enabled.
> 2. Clear end of busy (EOB) after every interrupt.
> 3. Clear other status bits (just in case since we found them cleared)
> 4. Return correct status during the interrupt that will finish the
>    transaction.
>=20
> On next xmit transaction if the bus is still busy the master will issue a
> recovery process before issuing the new transaction.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Applied to for-next, thanks!


--XIXrVdc2uJ0FLF/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfmAACgkQFA3kzBSg
KbZAaRAAmwZ/2/JCqfwS5lmeCmxd5j8Pht4lV2IIbFRdTYuTh5eYLNUhYTRO6705
UC/qiIIdVog7nVhwYB0vR1vgISyQRItiCm3lfxhaYNd6FBSksfpF29Dh8RIKMUjg
tu7TsWwI1nAxLcagFv8e6l/E2vKJHqwJfO1H8U1hj9KrLUR+wcunFfLWBichH/my
hQmR9y29/Tjx2ENCTMjJkKMoYnN5g4H5tsylqD1aG002sje5WUWyo0zXBdiYe85R
nRpP/yYmv+/MWYSZb0vcxM8Qbpo6I6p8HFwYDrcupKT6eoWUUwAfBDB0y89gleJZ
z8SpspncmsIwlNvVW0CWz3EYw8XQOxJcVoUHmCNRH36LvxocGaYpLhDdRY9l4RCJ
oqfiq2hg+dX7TIBMk01d2NR/rPuT7z+NhfmV/foMf3/z421dNmYdsXJhZ6nPYAN3
LnVg8u8mVJF20iGSzFsuXd42dbvAOHwB16980UbPAHiybE9W4FTWsl1VaP9JS8Vx
1OW4K59h6HYN64MrptiIciW27C00fqZXWiGZk1z0gjOuV+eToXVOc5u5OoP6YuMx
xRZHeWcSAf110OaOwSOueq4+V8SZteeBHg3HKioE7VZ7ty0t7tkttHW5Gw+CcMyn
5F0kpziefNUkQKIJSZ/9LaZz3qcs09DtiRkbICBgZ/vlx91iyVU=
=XB3r
-----END PGP SIGNATURE-----

--XIXrVdc2uJ0FLF/V--
