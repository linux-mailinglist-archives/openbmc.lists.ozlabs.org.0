Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48B52F921
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 08:01:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4tJJ5Xq4z3bl4
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 16:01:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uMoUOxx4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uMoUOxx4; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4tHx6d1Lz2xbY
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 16:01:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECC9960BD3;
 Sat, 21 May 2022 06:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A685C385A9;
 Sat, 21 May 2022 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112859;
 bh=yRlCgFBRhmt2UdNmbaMWVoFj7xEM4POzNRs4hlqC1PY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uMoUOxx4fk6zaVOzrAPNhw8bPqQMnWyLw9aiwLLSEAILugeahA4nCW3gD6+pLpgmH
 Lh5kAZQ3VRuax87OmoW8MTLOpFPdGA2qaMAqeq/45OPofUASdaQqxu9HScGa2iEy8B
 FI0mfpOXESdId0JcpiM6whOsf14Iawk4BkxLBtj6YEics4ilRVNz5CP1AsMlcyWIY9
 BvpAR3DasNToAIZE2KHB2CVtTzObVNsFEWck118988NkR+XXNEn9I1hQyv02aku/+7
 u9Hg4de8diMvPX3/5gJpsSb4PY42jTgyVYkQbQzrhqMKnrVI9BneaH4H2zea6iFRGY
 8nteBJo/cSfAA==
Date: Sat, 21 May 2022 08:00:55 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 09/10] i2c: npcm: Support NPCM845
Message-ID: <YoiAF3fcFJiH4nGP@shikoro>
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
 <20220517101142.28421-10-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5LoHH9RppV0a11Md"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-10-warp5tw@gmail.com>
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


--5LoHH9RppV0a11Md
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2022 at 06:11:41PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Would be great to get an ack from one of the listed Nuvoton maintainers.


--5LoHH9RppV0a11Md
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIgBcACgkQFA3kzBSg
KbYP8Q/+LmC3akfquzhe3STyirrK5m+Wp26tWS5IGdzw2Xpn9K1Ewn0FcU+/U8cP
Q5Q+F/2DIBGV/Vn9cloaIkyQK/42P2pbGU0+mQnMVUPGYvo0DLY+2TLE9xj8067k
ICATrgV4zwqfD5W+dLyylOUGVi2JNH4ugniVJ/Lg4WinQC4cjZHHJzpfbSY6hp68
3jC9nk+o57qtLWXh3cDfNYw0VA5Upe1isMIdBiQFckKwUZ9OmRbd7K4r1t2dvNQb
5kaY/tyuHVKSefMn5yIpPHrhctO4aKM0eY60agX94dmkIp8RwdP0Ra2f0oJsG3lK
xdDKMcUkx90WpvHjUmwY+s2bvPLDUs+oKv+h09WDmLWQg1re6E31yGmuWgF35oXy
v7xh4C/RNtu49OJ9HWDFxjZ2NbefxBHDaDXzAEjZkjt59eSmzP35Mmb3UgcffjZo
RElYT3zQluGlXTKqKvs4MFX/j1gl3BqpcK4bX5bvrfXQ0L3IRWMBqr/1Bdc02ySO
kDC/fwEYgKMf+JHeb/pVQKBMmOXSp5d167pFmPwskdMIGmImJMDKamYyeMO9Q+oH
5w7cIA07V3pT6kmDNxgOQaU2okPDNUmqR7rjNIRwNblh+/Swd2t+EoITisOXzAka
AoPYLbSvBMkvH1ChsvEwWPhTZ+8X2d97sG1LZd3w/a4wfF60HjI=
=NbHz
-----END PGP SIGNATURE-----

--5LoHH9RppV0a11Md--
