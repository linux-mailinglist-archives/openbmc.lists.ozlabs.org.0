Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DEFA7765
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 01:02:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NMsv22YCzDqpy
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 09:02:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 46NMsF2TbTzDqY0
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 09:01:53 +1000 (AEST)
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
 by pokefinder.org (Postfix) with ESMTPSA id DCF292C4F2F;
 Tue,  3 Sep 2019 20:15:01 +0200 (CEST)
Date: Tue, 3 Sep 2019 20:15:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
Message-ID: <20190903181501.GJ2171@ninjato>
References: <20190706131911.3068-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="enLffk0M6cffIOOh"
Content-Disposition: inline
In-Reply-To: <20190706131911.3068-1-nishkadg.linux@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--enLffk0M6cffIOOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 06, 2019 at 06:49:11PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_available_childe_of_node puts the previous
> node, but in the case of a break from the middle of the loop, there
> is no put, thus causing a memory leak. Add an of_node_put before the
> break.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---

Eddie, are you okay with this change?

>  drivers/i2c/busses/i2c-fsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 1e2be2219a60..5e01875082c3 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -685,8 +685,10 @@ static int fsi_i2c_probe(struct device *dev)
>  			continue;
> =20
>  		port =3D kzalloc(sizeof(*port), GFP_KERNEL);
> -		if (!port)
> +		if (!port) {
> +			of_node_put(np);
>  			break;
> +		}
> =20
>  		port->master =3D i2c;
>  		port->port =3D port_no;
> --=20
> 2.19.1
>=20

--enLffk0M6cffIOOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uraUACgkQFA3kzBSg
KbbaZw/9HvM1QaU6GP2vT0EQAW16qI65FbRIK0+0hZCYchNp6c6qsgQfyMMPx8oO
RHqKzSup52s7rgBkwyRIR3ANb/IjoSQgGr3kKeJef/Bl0HHCrMHEeJM6bxzu7UyA
npYFI5Q6zJJwGGMDdIk+gNRnp+yc6kFqeVUaU54ge0DI3ffn/8jYgg0UT/JUJpcE
C8OU3ykrvjLLpKBYXWd8ca2aYQXlLgn4Wxtqj6xU4IHZ4SAwPkQewjFDtCCKoF6h
BfTUoN/K3spk4yUEK5pXqKJgNBeGDaEdVz58XWNx3FNyaf7MF+yMpo+fstApYID5
9SwFdWfyUnQ081RnRBe9mrNEnxYzk18GeFQ8WEjmFrwwGh8ntZMWYCWM734S6Rr1
/d+WIu3WOkXYf84qBmHPFiO8NZGtE4PWX8GNbJ9s2MhYK0ZwMrDdni8Z+I3p6uhp
WQe8pufw7DFCvEkyYILcMm8oTHl+xhw8ErvrlGi17rTnSqnGRWRJqIuYiYqsf0R0
FvcttMVDJNqjeRs4BEuqIdb44jr+hFSmRVTs6gYYfnjTADSE/6TPZwO8i8DLWUjR
Io8LQ63Qk57j68FTet6+FJwUF5VQSExgz8xYC+EoBfYagkPAd1+XJJrOLaGZm1+p
WW+berifhiKEEvn5UHJz05Dd4qKOC+AcfS3TKjViMCjp8xMAoqg=
=9gpV
-----END PGP SIGNATURE-----

--enLffk0M6cffIOOh--
