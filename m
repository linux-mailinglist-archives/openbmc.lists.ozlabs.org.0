Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 781378CEE76
	for <lists+openbmc@lfdr.de>; Sat, 25 May 2024 12:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vmd460Fqfz79YT
	for <lists+openbmc@lfdr.de>; Sat, 25 May 2024 20:11:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vmd3k1vLNz79Gn
	for <openbmc@lists.ozlabs.org>; Sat, 25 May 2024 20:11:28 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1sAoMN-0005QQ-16; Sat, 25 May 2024 12:10:43 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1sAoMI-002uS7-MQ; Sat, 25 May 2024 12:10:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1sAoMI-00Bs4j-1u;
	Sat, 25 May 2024 12:10:38 +0200
Date: Sat, 25 May 2024 12:10:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <minyard@acm.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/6] ipmi: Convert to platform remove callback returning
 void
Message-ID: <sjgseqireuaswtbuwl3rvcszpsjzph4opq52x2kbudczxutz7o@2tua2oueufdd>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
 <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
 <Zhf9mQx/KgXOzPTs@mail.minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ajph324orx2jafee"
Content-Disposition: inline
In-Reply-To: <Zhf9mQx/KgXOzPTs@mail.minyard.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Tali Perry <tali.perry1@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, kernel@pengutronix.de, Patrick Venture <venture@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ajph324orx2jafee
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Corey,

On Thu, Apr 11, 2024 at 10:11:21AM -0500, Corey Minyard wrote:
> On Thu, Apr 11, 2024 at 09:15:03AM +0200, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Tue, Mar 05, 2024 at 05:26:57PM +0100, Uwe Kleine-K=F6nig wrote:
> > > this series converts all drivers below drivers/char/ipmi to struct
> > > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Pr=
ovide a
> > > remove callback that returns no value") for an extended explanation a=
nd the
> > > eventual goal.
> > >=20
> > > All conversations are trivial, because their .remove() callbacks
> > > returned zero unconditionally.
> > >=20
> > > There are no interdependencies between these patches, so they could be
> > > picked up individually. But I'd hope that they get picked up all
> > > together by Corey.
>=20
> Yeah, I was kind of waiting for more reviews, but this is pretty
> straightforward.  I've pulled this into my tree.

These changes are in next since a while but didn't land in Linus tree
for v6.10-rc1. I intend to send a PR to Greg early next week changing
platform_driver::remove to match remove_new. If these commits don't make
it in in time, I'll be so bold and just include the commits from your
for-next branch in my PR.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ajph324orx2jafee
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZRuR0ACgkQj4D7WH0S
/k7iXQf+JY2QTPcPdx/jTOE0dUvCeBEjZ4bRh4mIpawNO0kdNbwYcQUVpo5OrDQ8
qnEQRMBPPam51IgxAWEEO1+xa86RbYUrSqNsVQn+chiBr+EQHeAXYpGKuHK8STRO
8Mg38AeS0M4k35+W9RE5WdQQRPbVv/SvIZIWHvqnK7unCaCJmWxbL6LHj6Vy5cR/
BMMd87EEIR+dBbK1EvHqJgKqrtlF58qBMWWiIA9N67SdRSE96WXwRffe+o63evky
YHUl2bvlEn3uwDDwLyFUV6Inqu0RR8YLCS1M2nYpGZE91xQFN9DG7AyXEKMPbXyD
nAHcivIcWONurbCNqax3/T91fn8ftA==
=mxtd
-----END PGP SIGNATURE-----

--ajph324orx2jafee--
