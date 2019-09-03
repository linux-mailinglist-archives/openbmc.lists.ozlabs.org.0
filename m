Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC9A76B8
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 00:12:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NLm31N5XzDqpf
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 08:12:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 46NLlY2wfLzDqg6
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 08:11:52 +1000 (AEST)
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
 by pokefinder.org (Postfix) with ESMTPSA id C2EF82C4F33;
 Tue,  3 Sep 2019 20:33:31 +0200 (CEST)
Date: Tue, 3 Sep 2019 20:33:31 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: Re: [PATCH] i2c: busses: i2c-fsi.c: Add of_put_node() before break
Message-ID: <20190903183331.GN2171@ninjato>
References: <20190706131911.3068-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BtmVPk+Smchi6n7w"
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


--BtmVPk+Smchi6n7w
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

Applied to for-next, thanks!


--BtmVPk+Smchi6n7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1usfsACgkQFA3kzBSg
KbbHqA//RwujgS4uaBK1Ojt7XUWb2fC1z63kOV4O01H1vsHLztEKc2Ix2iRXjGz+
qGW8BcGjeJ82n8tKxssnBv06d28UdwAtS+kgN+6EiG5XBtaYiSWaQeMRG/qiET/t
AIBOmp3uMKNr0/asxGcq1aWQ1AbwcMw22so/TzDQ/ZXxmXiH7QYXfsqyImB4XnJH
0MJ+RW5f9JnpSN3mMBwMgFDgvurVt7Wuubv5QMYPrtLDrUVY/hXSFb/hhEWTkHG+
2TjcvtdRyXhRyxS6bim9RsMViSy/p9HMDafHF2QyUNCKJ1peK8A8Qg0NR1D7lEwR
xIgl22GGq3Ej4VHqtj+TH2Z/ZJjTxNAR9E55orS2RWa9nDpbN0r9bwRTv9y4CsBi
WaTjm8LzaUbIaBU1KJjC4izEawGnp6JcgX25Tyj/XwSzfJIhAPEeflUNAAZ54Fxh
ZQeVS7G9DAbzWV722aD7Gpt4/HcjrKfH4hJNcerpipGmFz/gLTu7vWZmo7+lalce
SQn6l+vUm5kNnoyZ7KytNgOGTdSkcNYQUCOXsQZLMbrhV6dhgAxX/EEeNKCasyt6
2ak+GEByX5rnFfEpw1VIxvbesbdq3Ra1t6N5pln8EtrVjiVcUqmNXoJpIV8C4zlY
48UKMblMB1qLjUhLpDrIrO13LCJA0HZD7ZYohCSvSSIO9RpPkzE=
=CxMq
-----END PGP SIGNATURE-----

--BtmVPk+Smchi6n7w--
