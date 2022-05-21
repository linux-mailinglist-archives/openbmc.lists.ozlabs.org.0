Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4FB52F90E
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:53:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4t7D4fV0z3bmk
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:53:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XZ/ex17V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XZ/ex17V; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4t6T3lMKz3blZ
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 15:52:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 31F4FCE2D44;
 Sat, 21 May 2022 05:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4AEC385A5;
 Sat, 21 May 2022 05:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112365;
 bh=jZcZhL3X9mmvJFsPPiWmyujX/hOqhXLpZSIvlMicpR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XZ/ex17VIVkQg3cSltZ7rBQnLNhUzy6aqZirn3yu4bvw0z2B61FStySUfiHR8hhic
 cB2nEqXw2DDqxDZgyB5s+INMrotYYoVCT+a1mPMRISWNA8cCp7jmxSBD1ZT0h++wu1
 GDL4MvDEBSOJqFPvLylvccKLBtLfyM16fXi6NyVz/QgVqJ6tWI2Iv40328XgU8zHOP
 FSD+cJOQgSkOVynjf65SZ771M9uprxU2InhljyHLkt6QXGD5z1ClU7C0YnUiBwb0eZ
 bE5NLGkWqp6LhIA57rwA1PllZtri0Eu2PEyocEfmmhCWndJNMWCkXpY2gTfU0BVFzO
 7LFYW4oMxDAQQ==
Date: Sat, 21 May 2022 07:52:41 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 05/10] i2c: npcm: Add tx complete counter
Message-ID: <Yoh+KYtRzzbdsB9M@shikoro>
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
 <20220517101142.28421-6-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zcJ0vOC2Hk9d1kli"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-6-warp5tw@gmail.com>
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


--zcJ0vOC2Hk9d1kli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:37PM +0800, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
>=20
> tx_complete counter is used to indicate successful transaction
> count.
> Similar counters for failed tx were previously added.
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Applied to for-next, thanks!

I dropped the Fixes tag, doesn't look like a bugfix to me.


--zcJ0vOC2Hk9d1kli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIfikACgkQFA3kzBSg
KbYowA/+N3UTmwF4C9VAX8TTCnH/yJfoK+WmiMmINK6S/tQiBgJ14pBBrPCiQmnZ
Lez5J1leVLau1QBYsPev6Qm/wE+0Xr/YGCToOf72bfS5vkQxeroeukHL46y5/4X5
CrCeygDQ5X9gxMT2qINWNKb2LXGw8EyYHpU5Mw36nGVyhKuXXZjjMQZsEqxnmhEf
oSzoPJROCs6Vdtb4GxEQqRKZZkyKAasxGMfAPJy6FDUi/ZcWpZd+7Gvlvwql4ekt
c1VROwstFXca60XvEFwW1WP4PlcP8v78kNo5+23N2ISYtTC9yb0ytw8sRFsvFJos
kycNiFqKsfuyAsZZVOuUGtsgwoGdJVyRpmpKvuYsfahSGUABlb0jIRdvLZjsFQsd
RKZZPADtL5UM6WQhs4j8KwlzFMycFqDNQK19t8ToFl9M7UwvQahcUFxmMzDNNUUx
4swmrOE1vjaO6+1Hf3bIMhBzQ/ZyVSN6mJJDn/avt0VQqdkpJo2nrKCa+gTFUM3J
V6+/kMVVuBPynrDOodMPpBJIphWLQkjZ+Zgo35iWfTrRFXZa05Togv5o0rPjVrVF
wS7gluBO7inAvH2fbPOyeFgp0uusKom1qpOzgwBFd4AEU8nj71HS2duqAYtMuhrf
3LAS83oPh0yAiuaAFdtMzvrajhdaEs6K1pv020R5d94NxNTecss=
=S0HZ
-----END PGP SIGNATURE-----

--zcJ0vOC2Hk9d1kli--
