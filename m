Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 327BF52F900
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4t5t10dlz3bmQ
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RIB+ANSn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RIB+ANSn; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4t4y6Gtfz3bmk
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 15:51:30 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB75860B4E;
 Sat, 21 May 2022 05:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7C8C385A9;
 Sat, 21 May 2022 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112288;
 bh=K2MHfb/cUJpXURo3lPofD9f0y9SQuR2AtarJHMSKeNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RIB+ANSnROxwABAR0zcIRNR0crLoYKxOOqGsOAYfOq4y3RPeDJcDdFhQte80rCg45
 IieQb+mG9G0ucWb4kqkZfO36mKO9+ndJnyA/L/iVneQOLKfdh8aEWk/lOXPMJMRkXT
 +uBtJk9E1mwFuypAhts6PEF4jxxc3XC/iKm11yuV+t+2SQvFV7Jja9SG6tDDJ0fQii
 lQ3O1x1zerTrf5Rod59HEHSnyotz9cqBh46X22PYB7Za3vKnnISa+LgQduE2XSyXng
 rS8s6Yi9xPIb1LI3UPaLjkRcOxmcFc1uRkAis70vkAuikCYKJGNvYETnFOOSqQ+E2L
 F/B1Lx7hXAXhw==
Date: Sat, 21 May 2022 07:51:23 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 03/10] i2c: npcm: Remove unused variable clk_regmap
Message-ID: <Yoh9208mogGeWPYe@shikoro>
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
 <20220517101142.28421-4-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IH57joRUMFEhmIfc"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-4-warp5tw@gmail.com>
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


--IH57joRUMFEhmIfc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:35PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> Remove unused variable clk_regmap.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!

I dropped the Fixes tag, doesn't look like a bugfix to me.


--IH57joRUMFEhmIfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfdsACgkQFA3kzBSg
KbYV0g/+J6kw0YqKXl6ogOJ0Z9VJBIyF1Qdn2ujna4rpXeo8oN3dHcujBsksG1tG
CdHOMTJFfdmV+7qXNBBI3LuzhCky3uV+MmulTUXuFZugS3ik+VUtYP3AHKEpXfKo
rZiF6leA0oO9hAq2mm042B0WxjETC3Co0MoU7YjYT1PLRgjJMAOechSr6YqY9bI5
zBy6q6aNYHs1hosyT+Ryhc2iBZJ6aHBzQnQkrK+cbwT7VbSQzoT+ENw7VWlonFSC
v46gPpHdFsiZgRkl4dL+QIxoiklCcfDNqwJJ1FzzlEhHBgx5d5G8ss46CCK8PNfB
les+Qj9bd7oJk6MmeG3e2HugD8cpC1euw21s20O2jYL51/f1P0pKFlVgz+KX/Mle
Rbkk6+0DEHi8Nf2NmWdR5CNx8yCoXKZmnLvtf3g+5uv8Y3OVvPwIEZjIvC4aywtK
crkJNKQhCdsR2XL5ktDk8RmUyKnCUynWmFjMZXAFpQ5plB6cf1TOvNiUyTFPC2/O
HPrl0zzX3BFD0LX3hJUGxrtZvXlDc4PPfc/36u2Ks8TsiZL4SQKRI1s4gajAgZAh
2f54h+2JUPLj4F6rjGBY9P2/jQ/AA4mAgOl7oHtc0Yj5FokFYBqUej36nIScrI4R
IYvF8JJuIfQG0EgtzGhJ5je6MOXirO74AGqQsfT1ei+y1hA6rIE=
=xb4T
-----END PGP SIGNATURE-----

--IH57joRUMFEhmIfc--
