Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A5A13C5C0
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 15:19:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yTw30bCrzDqLJ
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 01:18:59 +1100 (AEDT)
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
 header.s=zoho header.b=d9iTFwwR; dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yTt71CxbzDqLJ
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 01:17:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1579097825; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=5lqUkq0kf/9HXDkUyzO+bB46TjCcOIAWkVDtsVW1sa0=;
 b=d9iTFwwRwrb2mx6wl6D7ewp20oinNPJ8L+HkI1c0kv2dswMcvv6rVdDEVHJpJ+YS
 uq6H85te4tUIVUTw+YyK6yLnfftj4PIIf/r4tjWJWJmGwz0Ana1DcJOKRktq+hYwwPw
 OTagX9+INCQ1N2UGlFIUU5Jg25Ak5yxROTJoRcBo=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1579097821671554.6765147139852;
 Wed, 15 Jan 2020 06:17:01 -0800 (PST)
Date: Wed, 15 Jan 2020 08:16:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
Message-ID: <20200115141656.GC3512@patrickw3-mbp.dhcp.thefacebook.com>
References: <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
 <22A3B800-F833-4615-B980-EE933E1F83A9@ozlabs.org>
 <20200114174532.GB3512@patrickw3-mbp.dhcp.thefacebook.com>
 <ade63a1fda67cd8df1a2ba0638b1015878a0ac80.camel@ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bKyqfOwhbdpXa4YI"
Content-Disposition: inline
In-Reply-To: <ade63a1fda67cd8df1a2ba0638b1015878a0ac80.camel@ozlabs.org>
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


--bKyqfOwhbdpXa4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 09:51:38PM +0800, Jeremy Kerr wrote:
> Hi Patrick,
>=20
> > > Just a suggestion - you probably don't want to be passing MCTP
> > > messages over dbus - this is something we learnt from the IPMI
> > > implementation.
> >=20
> > Is there a pointer to this "lesson learned" or the issues surrounding
> > it?  It seems like the btbridge is still using dbus, so I assume
> > host-ipmid is as well.
> >=20
> > https://github.com/openbmc/btbridge/blob/master/btbridged.c#L47
> >=20
> > I'm curious to understand what the issues were/are.
>=20
> No, nothing that anyone had specifically documented. I recall there
> were concerns with shuffling larger amounts of data over dbus,
> particularly for things like firmware update over IPMI. Because we're
> using a dbus signal for incoming messages, we could potentially be
> writing a lot of data to multiple processes - and more than necessary
> if those processes haven't set up their dbus matches correctly.
>=20
> I don't think there's enough concern to change existing code over for,
> more just a consideration for future designs, of which this is one.
>=20

Maybe by that time bus1 will be a mature replacement for dbus. ;)

Thanks for the reply.

--=20
Patrick Williams

--bKyqfOwhbdpXa4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4fHtYACgkQqwNHzC0A
wRmuIRAAouLOvPJ4+w2Gu9+hrj3ea0MBhSvElxsQGSctF9Yu3v5illBJTHrKMKAG
2CrpBbmmtu23Xdxgd4Hq7jqMAw6lULu8Rhqf0qicEPm1b9rg+RkuQOi1ZtsoBRF0
flCy/z2unIUCEy7RryCs7n/Z3oN9pFlLBho49K0VfkWlw5b3BGCJySpj74bqIJaQ
2NcoVOJgWfvV+PHg8KunqmyUro4qbXOq4t+uCCCykfvAt6AAyc5H5QOgCGaKSGTr
qaM/me2LHVv8MSAVFXNKCyAwkrxJAEmiBN5vFn3L+aX9FeW3OQMslrnzXqJNwIqo
KCx/J2pe1m35owSGTFBy12DrygUNlunYi4XPldOStfFvoHRzpgL8noFlTaOWHsut
qyu4WCuyQDyBWRdA2oQTV9ZA8aKEjkU0tpx0RpGjs7tgK23pYJrgrsvu85G5vHlL
n6+JLht9zD/i1/l96ksqyWO6/b3qIKhF9FpiI5ldUjY5OfGQRLwXniodmRPnD6lW
shRVSx6N/CR62iVq8WQPJvcmPc1OMDo17TgfVCJ1+BbYasRP3gYxWqhRJhYoPsar
Ur3KnXo79rDCypwzxxyK2Mo6wlYfEwyffiFzXnTNuZjKadJaSG2ASMRFWRqRg1uj
DXCCLpRkaa2jNH2+Eb290R03de7+53STEm5oqdhGsZ3RMIlIo6I=
=45FW
-----END PGP SIGNATURE-----

--bKyqfOwhbdpXa4YI--

