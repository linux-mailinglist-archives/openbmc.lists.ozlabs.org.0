Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371519B889
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:38:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t1Lq36VyzDr8L
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:38:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=fOd6Sf7X; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t1L70Ql4zDr09
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:37:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1585780663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RdeMB1H2Uu5gors2H+ZSwru2YDvf9FoLBDr4gkqEfJE=;
 b=fOd6Sf7XorB76qiPM10L/1nf3gOGuxSAzfukZiFjuQ1JrYIq6XamokKzwI5tGt89upTMPn
 NOyOKFl2MNtiyEv7BLUvRFLmLkBoed+VRbM6GHb39xQmALV6ISi6ZS+Rw0EQ/TEIpyIo8q
 wVKJwNODCgwLPLztrojylgSoafZUgEM=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-uiCPgIpOPUKY6XjFuC74TA-1; Wed, 01 Apr 2020 18:37:41 -0400
X-MC-Unique: uiCPgIpOPUKY6XjFuC74TA-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 1 Apr 2020 15:37:39 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 1 Apr 2020 15:37:39 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Patrick Williams <patrick@stwcx.xyz>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: meta-inventec MAINTAINERS
Thread-Topic: meta-inventec MAINTAINERS
Thread-Index: AQHWCHWq4LDJV5Q5CEOfcxyi9uSlIqhk2xJA
Date: Wed, 1 Apr 2020 22:37:38 +0000
Message-ID: <0e59aef8a51e4a9993dd381e3dffa444@SCL-EXCHMB-13.phoenix.com>
References: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
 <20200401223006.GC580847@heinlein.lan.stwcx.xyz>
 <20200401223332.GD580847@heinlein.lan.stwcx.xyz>
In-Reply-To: <20200401223332.GD580847@heinlein.lan.stwcx.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256; boundary="=-=F+qPRtjSGWQSq2=-="
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--=-=F+qPRtjSGWQSq2=-=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Does that mean they are unmaintained and should be remove due to not being =
maintained?

> -----Original Message-----
> From: openbmc [mailto:openbmc-
> bounces+bruce_mitchell=3Dphoenix.com@lists.ozlabs.org] On Behalf Of
> Patrick Williams
> Sent: Wednesday, April 1, 2020 15:34
> To: openbmc@lists.ozlabs.org
> Subject: meta-inventec MAINTAINERS
>=20
> Similarly, meta-inventec has no MAINTAINERS.
>=20
> On Wed, Apr 01, 2020 at 05:30:06PM -0500, Patrick Williams wrote:
> > Similarly, meta-ingrasys has no MAINTAINERS.
> >
> > On Wed, Apr 01, 2020 at 05:26:41PM -0500, Patrick Williams wrote:
> > > Can we get a MAINTAINERS file added for meta-intel?  There isn't=20
> > > one
> now
> > > and I'm not sure who should be added by default for any code
> reviews
> to
> > > it.
> > >
> > > --
> > > Patrick Williams
> >
> >
> >
> > --
> > Patrick Williams
>=20
>=20
>=20
> --
> Patrick Williams


--=-=F+qPRtjSGWQSq2=-=
Content-Type: application/pgp-signature;
	name="openpgp-digital-signature.asc"
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE6YWDO7/ap7Iuu9Ap0DSCK0/0Hx0FAl6FF7EACgkQ0DSCK0/0
Hx2u/Q//dXVBF+M6h4FjCbLx5dGxiZXunQxa1QtgCBt2UEcgSqLHgrRHn9b6RsGH
q6VBWGhUPRHfxifnLVzWKCYLu8j0EpqtyEm5csknhtLH8XA9ihsmH18P7GYsL6aQ
atYgZWcU4sfS5BmhCiWUzuXtCwDlRFjbVREY4kFgmrP4zRCcjCeur532bRbW+xDx
KQWCPxfxXlSWJja/rKVpVV+ADX3EV1l/NKOxrYduB40Ucxl2UDqYP0Zo8ezGCsaD
MzNIAHGQZgF0cp3wZdwtoTCw/dTOneHgCUp93B1wV/dKd35ONoNLp4hFN1SDalyy
NrXtI37LHQ+XY4WdKEKna57l1lHxVHXP3jwkBa4v6ZZxw2r0+fUCfc3Qh6zpQ2MQ
SUF2NaY0m+qyZ2p9uogWrE8U764JdkZ4Rk/A+S7x5O4G6Mrbb2lL84+morkh7fiI
aqZDD3DHYRepd52DT3r6f8AO33oUqsY2VFaCERKGaVQljBrnj0mNKF+C6Zto1nr4
g+IIpZhZU1pJVGZgjuxpIclOSzv+be66f0HNYS7e/fh0G1v46jYLn+uylVrydQbl
lbTRMTnukG0pbwp5HKIacxWIvp4DO39NrmIkwolrR+ogFTR5XrN/KhX6DzEGJ4qm
YlLyXJ6m0ACgPb1T65edjllu1j6+WFcJbOt05VoOV0+IrAljDHE=
=ka0p
-----END PGP SIGNATURE-----


--=-=F+qPRtjSGWQSq2=-=--

