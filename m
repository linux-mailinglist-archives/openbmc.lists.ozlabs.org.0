Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB94398A4
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2019 00:27:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LHGD5rhrzDqMX
	for <lists+openbmc@lfdr.de>; Sat,  8 Jun 2019 08:27:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
X-Greylist: delayed 450 seconds by postgrey-1.36 at bilbo;
 Sat, 08 Jun 2019 08:26:59 AEST
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 45LHFb6pvKzDqJC
 for <openbmc@lists.ozlabs.org>; Sat,  8 Jun 2019 08:26:59 +1000 (AEST)
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
 by pokefinder.org (Postfix) with ESMTPSA id 684603E43BA;
 Sat,  8 Jun 2019 00:19:24 +0200 (CEST)
Date: Sat, 8 Jun 2019 00:19:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH v2] i2c: fsi: Create busses for all ports
Message-ID: <20190607221924.GC869@kunai>
References: <20190606115220.9888-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <20190606115220.9888-1-oohall@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 Eddie James <eajames@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 09:52:20PM +1000, Oliver O'Halloran wrote:
> Currently we only create an I2C bus for the ports listed in the
> device-tree for that master. There's no real reason for this since
> we can discover the number of ports the master supports by looking
> at the port_max field of the status register.
>=20
> This patch re-works the bus add logic so that we always create buses
> for each port, unless the bus is marked as unavailable in the DT. This
> is useful since it ensures that all the buses provided by the CFAM I2C
> master are accessible to debug tools.
>=20
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Applied to for-next, thanks!


--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz64usACgkQFA3kzBSg
KbbYthAArVDgB7Kw8dfQVNVvY21iHqMnEE+6VseRR2PzZyWqGLJPTTAnqJm8L6sL
rhR+fZXxa8nFvU1rKnybYcp58OxxhJT1RO/UQDs4Qv6+9JMHmteb2Ll3ETno+FMu
2I8Y5xFNeGqf3X2wn+yFm36IcXIn2l2P7BaQ8cN82AW7Etq+fTAmDH5v46ydngqQ
OeXgSIR9bP1T6qEzcdf9sDENC3Dkw7S6YbPKA3UzOFypsXOo2f9xPC6Esmr0sZkb
apquwU4lUCkQj//neBtI0mZqSQCv0k1F3k8BFmtFqLKw+KkaHQP3HxDWlOchv9Ow
A14dNahgdm5D2IVcpM3MjrGS04U9Puu4dpYZ6X3adXwg25qLp6nS7XRVykV0OUcy
2Va7Kot+e1u2n9S5Io4owfCdjszVW0ANkiyrQ8wp0o8A1dgSeAHfAH99I8wfBfxS
yaKz+QCoMH3UQ/VDnMdS4EBLNFRuEdjmszAbrDIhoP9oul7nxar1ZTiAL/w/8w5I
yA5Wmlf3oTXHRbOPc7qy7TT6zI4ZxjoNKRJpzYnrXeZYo6hbpK+vwK6DZlUy3R2k
ohkg1s952Poq0nvrruBlCvz214nDonJmXDHxuzrmqCl57uV5VHh9g1WiHkRFrIWB
+RThkQpHnTmXTLc8ax2D6b1VzYHiVoS39mZFtMyulniv5/42DKw=
=tZYM
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
