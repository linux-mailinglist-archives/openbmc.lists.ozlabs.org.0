Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD01F57E5
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 17:33:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hrc61T2vzDqC4
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 01:33:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49hrZr0CPBzDqR7
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 01:32:15 +1000 (AEST)
Received: from localhost (p54b33234.dip0.t-ipconnect.de [84.179.50.52])
 by pokefinder.org (Postfix) with ESMTPSA id 4ACBE2C1F6D;
 Wed, 10 Jun 2020 17:32:12 +0200 (CEST)
Date: Wed, 10 Jun 2020 17:32:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: npcm7xx: Add maintainer for Nuvoton NPCM
 BMC
Message-ID: <20200610153209.GA2043@ninjato>
References: <20200610072451.76495-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <20200610072451.76495-1-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: robh@kernel.org, tmaimon77@gmail.com, mchehab+huawei@kernel.org,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org, avifishman70@gmail.com,
 linux-i2c@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 10:24:51AM +0300, Tali Perry wrote:
> Add maintainer for Nuvoton NPCM BMC
> I2C controller driver.
>=20
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Applied to for-next, thank you very much!


--J/dobhs11T7y2rNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7g/PUACgkQFA3kzBSg
KbZrSxAAoH79OBpxkgSNGxBPKeUyWL8jCZGtIS4LdOi4/3pEkAWOOGmGQU63XeK4
wHC/q+tquqfB4pj3qT/5zdYtEVLJ7diaCCtrs8/yMSazVbPh2VJg66kZfXPCKcCy
rjHIb+9G9tpBIMEqtKbtXZPB2t1zzzZqhqQdbL5XEbqD3fEHXu1oANsi0VT8Dlgh
GgtukyiLyPpIiXarpl+2QmC3z8b/Ah6c2uPq/jmy5OaZElLpMBb1AslMCNYOlHgC
5TPcZCwMVK8zHUe5fOBSrpS3qajIe/rLG9R6ryd8dcIdWkgtBi3h5CllEvgU/2mM
Hsnj2qw5FSTFVeDYIJLr9AFVWBXShPjHfyMArJZHFjK5j+T+sOy1y387LcRq7t44
Fi5zsnvdFm/HpwhUeq3hHCUOgdLkW993t88rAIY+riqhnfMsspXikAjYHsCFuR1m
UR/+p3ORWB4cHNks5l0FZINd0ZAlWoZ3GT45L4EHoGs6SjOF4a5ISC/ebNG1cUb7
muBSndJAoy4ZtrzvY9ywEtAnEnia9iix7rd98gmBlet4zHP7/0gATyTQEfRprmzZ
HunmxNEUwiEh1AELs1yQg1zKKzsQQqzrYZcajz4fLnh0SePD9Co9pYK/a8VJUl3J
H3qx/GY+OHxUIiSTozavBqxhTsob+E0gzGfMYjWqwHfrei97j4I=
=ymYi
-----END PGP SIGNATURE-----

--J/dobhs11T7y2rNN--
