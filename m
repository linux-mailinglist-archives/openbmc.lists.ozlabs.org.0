Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F881DCFD7
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 16:34:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SXF75QbwzDqM6
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 00:34:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49SX9X52VNzDqQ1
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 00:31:08 +1000 (AEST)
Received: from localhost (p5486ce13.dip0.t-ipconnect.de [84.134.206.19])
 by pokefinder.org (Postfix) with ESMTPSA id F01102C1FCF;
 Thu, 21 May 2020 16:31:03 +0200 (CEST)
Date: Thu, 21 May 2020 16:31:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521143100.GA16812@ninjato>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20200521142340.GM1634618@smile.fi.intel.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, brendanhiggins@google.com, ofery@google.com,
 Tali Perry <tali.perry1@gmail.com>, kfting@nuvoton.com, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tali, Andy!

On Thu, May 21, 2020 at 05:23:40PM +0300, Andy Shevchenko wrote:
> On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> > Add Nuvoton NPCM BMC I2C controller driver.
>=20
> Thanks. My comments below.
> After addressing them, FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks, Andy, for all the review!

=46rom a glimpse, this looks good to go. I will have a close look later
today.

> > +#ifdef CONFIG_DEBUG_FS
>=20
> Again, why is this here?
>=20
> Have you checked debugfs.h for !CONFIG_DEBUG_FS case?

I wondered also about DEBUG_FS entries. I can see their value when
developing the driver. But since this is done now, do they really help a
user to debug a difficult case? I am not sure, and then I wonder if we
should have that code in upstream. I am open for discussion, though.

> > +MODULE_VERSION("0.1.3");
>=20
> Module version is defined by kernel commit hash. But it's up to you and
> subsystem maintainer to decide.

Please drop it. I also think commit id's (or even kernel versions) are a
more precise description.

Regards,

   Wolfram


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7GkKAACgkQFA3kzBSg
KbZ4kA/+J19dZhaJMmLz3WgryibpVzJTnhheDeduLgYVUvQcBoHj7dvuMF9+RYNM
R+ClE6BTGWDYBGglNFSSFq/M8TUro7GzIPJw1wzSjLLtxYh13FeFx9FFYX+XS1zO
oKff+p2gC1XM6RjEsIyTz7+/e0AsUKgCM6ENX4re+BbU/6IHvv2zOOaaVn2oEsoO
3jQ/V2yV9U1QsFLd/Ev2SnYT4owBZY/CVz93njaUc9/Hfvz5FawH0SD3/GnWh8+K
3gm7Ry1VoW8oopkXEcquXTBjaLKQPE3/w0cuJHFh4f9PAi1aEYHCfFa6MgC/Z8xg
Fkhwkxj5m226WUa41Lswib5sdQ/ITRLetMkoM3VTLFKj5x2HmluwSV2Jt6tGFReZ
K5fP8h8b4/TjEqVILEctTAfW0pEVT+BF0/cg9MiPPlKjNKXdOollLpu6hnaUdUxb
QYz3ehhDfsD9lKpKFfCTyx1seQ54DwBM/C/w+RAg8ThTWjMHuj2rz872SVC1i+hY
OCqRzUicn60p0SzZW5rL+kAVEKQkWjuosQ9XyoBMASXZnfWjzhLIFde6Yas6SXHV
rTKLx5840wEuTVnNKsQ5XoMN0eadd9H0eu4I/XBXoc5ywX5EISq6df4xKfGC0kx6
VB9hc42qrJ5lmQVOMVQ1bAdFba+mwzLKdCNcC+qHISoNJOctprY=
=dVRn
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
