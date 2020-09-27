Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7627A552
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 04:07:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C05Wc0r4HzDqWL
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 12:07:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YwrArF11; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BztrG2CtQzDqNP
 for <openbmc@lists.ozlabs.org>; Mon, 28 Sep 2020 04:06:22 +1000 (AEST)
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3C29823A05;
 Sun, 27 Sep 2020 18:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601229978;
 bh=2G9SbJ/cJpywKU3C9LDI23sdvEaOKHzPJIaoxw96RnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwrArF11uS67h3nQpwyvKAdyGkuArwYeZC7BVinQI3FmyVa+oiuq75RckZTCbjxMu
 eB7X645Flqjj75iWFIiATsZyAiLq084vg3xPg9RWIMVkB1fMFMuL1jK9jgrg+uS26I
 lAwDWwA2wCn60JtroaeaosvZrSzxAvZZC8TqJ7XQ=
Date: Sun, 27 Sep 2020 20:06:16 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Clear LAST bit after a failed
 transaction.
Message-ID: <20200927180616.GG19475@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 andriy.shevchenko@linux.intel.com, kunyi@google.com,
 benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au,
 tmaimon77@gmail.com, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20200920204809.132911-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline
In-Reply-To: <20200920204809.132911-1-tali.perry1@gmail.com>
X-Mailman-Approved-At: Mon, 28 Sep 2020 12:05:45 +1000
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
Cc: benjaminfair@google.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2020 at 11:48:09PM +0300, Tali Perry wrote:
> Due to a HW issue, in some scenarios the LAST bit might remain set.
> This will cause an unexpected NACK after reading 16 bytes on the next
> read.
>=20
> Example: if user tries to read from a missing device, get a NACK,
> then if the next command is a long read ( > 16 bytes),
> the master will stop reading after 16 bytes.
> To solve this, if a command fails, check if LAST bit is still
> set. If it does, reset the module.
>=20
> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Applied to for-current, thanks!


--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9w1JgACgkQFA3kzBSg
KbZh3g//XYIGDk4pDY8HrG7y81c38n5KYK+HXD635lZxwr0D3Hp/DVeAw2YWmS4f
15It6nyQIk9ENrURatSHh2fVbh5EAhdXlnmHVWF5Ey2XS7Rv/RL6QLxanBHl385E
3q+FHqSMrcSjfQqqPILlGEDpHfOmVEDLV+pwcxbeku5P8CPzThXT1ZVfxB5Ild9j
eysaEdluZ/KFtDQnnzLupeOUYsTt69a0Kz/8vSvfFOS1QnLQfObyZoW9801odQEl
b2SzGSPYKMaiZLX+rSlONIA9ZLzyIsB1YE0R3gU1V4blzdHdxkVtK1tyaW69UPxs
kIP5WnjTvAHKxeN9juz+61qH5NpEUg8vrBjRM8Ey6FSZf6g+672Q6vVQcnqO7MNm
PG0LgmVwd0GzDlSDt4pHZLt2o9OkVcYgyul5ZoFV5rDatILSlOGPiCUTUWG7QgK4
hZEhhlgyib7o7S9eEzB5ORiMw4pF+C4cPpQmPryQetnvWmkxU/PIQgAHzSfS+Jvo
UaEKWzlZrdfx7SKSikJEDXn6y6FFWyIyD/S/WRBTolvqP9XXmiHIhdDrEc95Mqwu
/r4x4GP/k5ec4qkwAu4JTdup2WUs+lD5ZEzRu8SelWURCKp2in0Yu2ZZLeMlYFZD
zUO2lAkwE/LbQuflJ0MVqHcMiJz/W22FkxYDttpvATSoq0f7wig=
=gCdm
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
