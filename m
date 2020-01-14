Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 979BB13B152
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 18:48:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xycW4mRNzDqMx
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 04:48:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.a=rsa-sha256
 header.s=zoho header.b=LjX791PY; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xybW3kggzDqRM
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2020 04:47:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1579024061; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=E95EtvtkHYExVBozPNdQ9bW4zRdi/77Z3OWfsybWAEU=;
 b=LjX791PYK7Xv7eD3NOszbhGxiTeuaBfqM234ePSCsys9ZglrgwADnvduzphc8m/E
 EF7pMiwyDB2kC1ERBXgvXYoRtI27TlAc2/3KugEtCAtIbQrodC0tbN7qDF3SqQLE28y
 4bzXYZb0Y2l87EixLbeCcMAcVA1F9J/SM6updC+Y=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1579023935029267.374315294716;
 Tue, 14 Jan 2020 09:45:35 -0800 (PST)
Date: Tue, 14 Jan 2020 11:45:32 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
Message-ID: <20200114174532.GB3512@patrickw3-mbp.dhcp.thefacebook.com>
References: <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
 <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
In-Reply-To: <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 rgrs <rgrs@protonmail.com>, "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jeremy,

On Tue, Jan 14, 2020 at 02:20:52PM +0800, Jeremy Kerr wrote:
> Hi Ketan,
>=20
> Just a suggestion - you probably don't want to be passing MCTP messages o=
ver dbus - this is something we learnt from the IPMI implementation.

Is there a pointer to this "lesson learned" or the issues surrounding
it?  It seems like the btbridge is still using dbus, so I assume
host-ipmid is as well.

https://github.com/openbmc/btbridge/blob/master/btbridged.c#L47

I'm curious to understand what the issues were/are.

--=20
Patrick Williams

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4d/jwACgkQqwNHzC0A
wRnuqg//bMaB9lnR4X4jyu/OI6JpULkXiiZNRK8oWHmy/Duoa4J9I/pwDr4LWoCX
nq8p3iUXQGfunus1Q99JXX29sTZT83TTJiSgKIp6bZD5p30MDiKd8p3Wn+2weJI8
LcLt1KZ5BbzipjCO00qv0OJMxCcQqvFAQ3jyIM2m07eEVWl7pA01J4lEaKfYD/+J
5ndv2xI8B+/oVRnOyyW1aXOlIvdmQui8AMMRCeYlwSXGGokPB9RSsvtOXY7wurUz
2rTO1fj3MjWh2S1G3VsWWRdt7M/23bCybbYYd0bEAki6kYOJ7cmhUOElDFJnCyVx
htVU/hNOYXka+DnyGxf9O0rdP1sS4lr+M2ruTmSvto/9MzNVYYfr61/TAvP7uom8
V8vr9JeC0APDffvexCmIP9iZFS0cE7dxojbAznMq5d6UEJr00w+4iuv3MaMcTl6U
ikd/uzdgOLPSd2Ht/8XBKvbRwQRwv3rSmShey/B7wZuPKlTtnUPed0lgwRWLcxKa
OxYa+QYvBEVJGDWpYkw1bBGUAd5glwDWc3h43issp+rtM4hw3aIV6md5K/h/2ycS
PMRX5bJ30AAmfPxh2ZZfZGsDpd3O0/xc45hx8u3eRueAMmlM9ggHMeZv1Qn7XNVZ
xoh49zTlYPG4gvzQFxaUIPBXuJzHC+V0QovUPCjt/qNs0sAkdrU=
=08GC
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

