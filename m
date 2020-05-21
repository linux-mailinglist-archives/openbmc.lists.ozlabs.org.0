Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 827DA1DD886
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 22:38:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ShKh439TzDqvR
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 06:38:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49ShJv3B27zDqvR
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 06:38:04 +1000 (AEST)
Received: from localhost (p5486ce13.dip0.t-ipconnect.de [84.134.206.19])
 by pokefinder.org (Postfix) with ESMTPSA id 7F7B02C1FCF;
 Thu, 21 May 2020 22:37:58 +0200 (CEST)
Date: Thu, 21 May 2020 22:37:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521203758.GA20150@ninjato>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com>
 <20200521143100.GA16812@ninjato>
 <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
 <20200521145347.GO1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20200521145347.GO1634618@smile.fi.intel.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Ofer Yehielli <ofery@google.com>,
 Tali Perry <tali.perry1@gmail.com>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > I wondered also about DEBUG_FS entries. I can see their value when
> > > developing the driver. But since this is done now, do they really hel=
p a
> > > user to debug a difficult case? I am not sure, and then I wonder if we
> > > should have that code in upstream. I am open for discussion, though.
> >=20
> > The user wanted to have health monitor implemented on top of the driver.
> > The user has 16 channels connected the multiple devices. All are operat=
ed
> > using various daemons in the system. Sometimes the slave devices are po=
wer down.
> > Therefor the user wanted to track the health status of the devices.
>=20
> Ah, then there are these options I have in mind (Wolfram, FYI as well!):
> 1) push with debugfs as a temporary solution and convert to devlink healt=
h protocol [1];
> 2) drop it and develop devlink_health solution;
> 3) push debugfs and wait if I=C2=B2C will gain devlink health support

No need for 2). We can push it now and convert it later. That being
said, I wonder if [1] is suitable for this driver? Things like NACKs and
timeouts happen regularly on an I2C bus and are not a state of bad
health.


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7G5qEACgkQFA3kzBSg
KbYDmQ/+OTWXWz2QGQFX0uxtaXhfs432/2BO3z/AA7ZJn7t6OCSyyvDL9L26maBs
Hu/S78wYqdLY6l58jtz8iUHsMwqL+zcQSTjOlo8mqj99T10GpZiwzJlSVB7AxT28
jmlxqN+z9fNUDQDujV+Y8UVvi7+UZ8Y37nYewtOz3AMskTx90HflDt4OHUBQsG7p
1bj1wtPmUfOy8su9FZrPN6SdhzO24XXaqVJgNg2FWqiuNoZ6Kdo8ekQAc3bjvNiO
PbEjpRw9QFE8pY9bWyHHJ7pFfpUvwe1bCXAA+Dj19LY2R+29lOxwaRZ3teTWxhG1
ArYFtxWrvCwYezyEKZEPozzfOYwd9LZE28c30aDC/8gfeAP1Gz8C9jySYRid6/Zp
RglnDBJKcR3V71fjLTLIXIkPd7kMbxK9A9MQkwlPeLbqlkiLbZflr9ceusirhxmU
IP98Ma6w8fob0ntpPGBD0j42rCebhN1d6PG2HHnvbQqj7hpjCUvVNAerGY38enaJ
+kNWO8/Y+Hwry7VLp/l5cQ23BeVJpeh8nGME+t6rJhWIP69oP6GEQNGWdzYCElD5
X3l4OOSdFAw1ZFjfj0K8wtMEHno/wDglPsrGxjReFI5YCQyKSKi3NtqONSEPiVrn
40cpX2SNefM4PjPQwRSVKuYNlAvmzo9cQKpkgg2YluT2V+JFJVo=
=jcCF
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
