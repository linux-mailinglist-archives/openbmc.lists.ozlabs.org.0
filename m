Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D79411DD969
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 23:22:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SjJG2zrpzDqv8
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 07:22:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49SjHM495MzDq9D
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 07:21:51 +1000 (AEST)
Received: from localhost (p5486ce13.dip0.t-ipconnect.de [84.134.206.19])
 by pokefinder.org (Postfix) with ESMTPSA id DF02A2C1FCF;
 Thu, 21 May 2020 23:21:49 +0200 (CEST)
Date: Thu, 21 May 2020 23:21:49 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521212149.GB20150@ninjato>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com>
 <20200521143100.GA16812@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <20200521143100.GA16812@ninjato>
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


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> From a glimpse, this looks good to go. I will have a close look later
> today.

Phew, this driver is huge. I won't finish my review today, but I am
working on it and am maybe 2/3 through.


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7G8OkACgkQFA3kzBSg
KbYcCw/9H7oWUrWBWy5C49NVa1N+n9JHdtx5KFE40DwXAwm2mRCSuoMr1JP9Rq5M
IFVgQp7Kk1mZ0jDR178dMQSYKuwDuFkOMDrewvQyOGPbGtn38FyInpJ6Te+uVyBS
HNJMGTluuvvM6840KdZSkRYZ9ynptA/JwSfvKoBk9/UAL6W/4C1LR97a4AEb/JFT
1To5HWdtArLvqSdfwvAaZyRghNLM2bjrp46NUFsfcXvxbZoiRZJBlmqBPJqkO4sw
wyVdSW16rdxMrAa6sFlcCjnCCZWusEgf5hdUtm3dRqnELLYH87iLqZpdfpMyOA8E
YJSLRpRBj2GUlmvG2S2Kd2H03UUyfspn9Qxe5T7MOpYDuoQQoOXrjH88kqTyEVty
3pkQ0z/oo62JsfgfjJQW5cBxbRhIiwP/rvMai1eXo303chCA2ieP9cT1bPbw8BXY
uJ3Xl2Botr7hgj7VywLHN6cp4S5m4iWJVbjUZfM2vAmSKTSKvBcIR1mVVzfZgWJD
vE9PsxfHtt0EOAU8WE9iseFJPOvzK7tuuaibHaD6gVAaNLr0Nv4adcM1MwSCicum
PqkDvXWuP+n6HdQ9+L/FA63xAtbT5SRQIFYhMBxots9hOYAUxK5gOnoHJYbAqB5R
TY2mr5I/NekkgzmBbh0ZRWTRdCmgfQCXmzMku6xaM4D57Weuauk=
=vjY8
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
