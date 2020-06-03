Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D771ED756
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 22:26:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cgS0445yzDqW2
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 06:26:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49cgQy4bwRzDqPm
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 06:25:59 +1000 (AEST)
Received: from localhost (p5486cfa5.dip0.t-ipconnect.de [84.134.207.165])
 by pokefinder.org (Postfix) with ESMTPSA id 116E32C1FE2;
 Wed,  3 Jun 2020 22:25:55 +0200 (CEST)
Date: Wed, 3 Jun 2020 22:25:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v14 0/3] i2c: npcm7xx: add NPCM i2c controller driver
Message-ID: <20200603202553.GB7684@kunai>
References: <20200527200820.47359-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <20200527200820.47359-1-tali.perry1@gmail.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, brendanhiggins@google.com,
 ofery@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 kbuild test robot <lkp@intel.com>, andriy.shevchenko@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 11:08:17PM +0300, Tali Perry wrote:
> This patch set adds i2c controller support=20
> for the Nuvoton NPCM Baseboard Management Controller (BMC).
>=20
> NPCM7xx includes 16 I2C controllers. This driver operates the controller.
> This module also includes a slave mode.
>=20
> ---
> v14 -> v13:
> 	- Fix yaml example: add missing include.
> 	- Replace all udelay to usleep_range, except one which is called from
> 	  irq.
> 	- Fix compilation error (module_platfrom_init conflict).
> 	- debugfs counters always updated. Counting till max value,
> 	  then stop counting.
> 	- Rename bus-frequency to clock-frequency.
> 	- Remove unused variables.

I don't have time for a deeper review, but from what I can tell this
driver is good to go and we can fix things incrementally from now on.

Applied to for-next (will go into 5.8), thanks!


--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7YB1EACgkQFA3kzBSg
KbZmVw//dD5ttj+RhzDcyUcRJ9NMb6dXctKo/EQYXzZfQlKOJqL36iVqKjy8rmFM
S2F42QY95jaNRdUHEGaFzDazxEUhy7J+07z0XPHk1CrGUDBVVtRf28dsEAXS7UTm
o8pq67KgL+rr4PcKVd92OnBF0Sdi5d6HlVYah9W7dlnR/crg95cd9JUdwn1THmFw
/PEmw4XRnYk/+GC4D+hai+W/E86RPpMzCU9YbOCfgnTWC+L7b9W4hS3j9+xtv62V
HD2GagLUGpBiKENxUSS0NJ7agC31Eea7gi9Gn5P8OfxYr4VtPSagnchKwCoohFbU
EySi0qXRd5+hWMOjg2DcGqC8mo/FC2ZDSKlLYWiicTgyZjP4vkRpMHqqtwS9u+23
EFQv0Gy+QjePWEJdjYHP+TxuKw0+2OqMfSr/mkB49sgcKe1Fd7EFlCJbnDmIoZc1
loO0x9MGK9bl/hlVWUpTorkAJGJygdstxTVk9jFJAEFvUXz6ZNk7HKdb0yOqvZcu
hRqp1nOCL3fSUjtNPfE3ovaEQBiJO/FcGPf4bSgKycnfeFEbnJy+lYhCvsTV6x6A
fUy85pKXZad4b51OFi9Hgo+a59ocTopYQRPvAiTcD+e9x2WagmMJCdNjTFsKCUy0
kprWATccn3TZJ3pSZpqlPX9FvP8u3mZOywM4WXtpX8xvT6qXqys=
=fEJK
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
