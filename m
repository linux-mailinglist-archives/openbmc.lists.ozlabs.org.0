Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 7440F8CF3EE
	for <lists+openbmc@lfdr.de>; Sun, 26 May 2024 12:31:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnFLG6TX8z79Nh
	for <lists+openbmc@lfdr.de>; Sun, 26 May 2024 20:26:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnFKv5mS4z3gHp
	for <openbmc@lists.ozlabs.org>; Sun, 26 May 2024 20:25:54 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1sBB3o-0002ub-4H; Sun, 26 May 2024 12:25:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1sBB3i-0032ch-Nm; Sun, 26 May 2024 12:24:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1sBB3i-00CPaP-22;
	Sun, 26 May 2024 12:24:58 +0200
Date: Sun, 26 May 2024 12:24:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <corey@minyard.net>
Subject: Re: [PATCH 0/6] ipmi: Convert to platform remove callback returning
 void
Message-ID: <nkhpr2ddrc4i7ai6gwamxrednx327atigoaxmamwq763bgpi46@fghhdinrqda7>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
 <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
 <Zhf9mQx/KgXOzPTs@mail.minyard.net>
 <sjgseqireuaswtbuwl3rvcszpsjzph4opq52x2kbudczxutz7o@2tua2oueufdd>
 <ZlH4KFZ3MYzelzZK@mail.minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iom6itn46xokgfg6"
Content-Disposition: inline
In-Reply-To: <ZlH4KFZ3MYzelzZK@mail.minyard.net>
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
Cc: Corey Minyard <minyard@acm.org>, Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Tali Perry <tali.perry1@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, kernel@pengutronix.de, Patrick Venture <venture@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--iom6itn46xokgfg6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Corey,

On Sat, May 25, 2024 at 09:39:36AM -0500, Corey Minyard wrote:
> On Sat, May 25, 2024 at 12:10:38PM +0200, Uwe Kleine-K=F6nig wrote:
> > These changes are in next since a while but didn't land in Linus tree
> > for v6.10-rc1. I intend to send a PR to Greg early next week changing
> > platform_driver::remove to match remove_new. If these commits don't make
> > it in in time, I'll be so bold and just include the commits from your
> > for-next branch in my PR.
>=20
> I sent them to Linus right after 6.9 dropped, let me resend...

That worked, they landed now in Linus' tree. Thanks, that makes it a bit
less ugly for me.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iom6itn46xokgfg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZTDfkACgkQj4D7WH0S
/k7BPwgAr6xD+4ieftmbUYTU20hpTMCFNQIGMGywkgy6RQbW9ETmo4DTqDfVVtQw
rOTCz1AIpQXqREfEmaf6Z+mUHHXwl3+9M1H0VdEnDQXJNbGTEpoL7hW5fBNXeBEw
t5OnxEpvcN3nggHf8XRynW9SSgnw7RMepD0veOWeUxe76AmJZrYOTNwgYwp61ade
7vOgwlSmPQ6s5ygQ0YJCckbVxfthPXBwMHFmdu1NcBDIzXz+b0jYwe2ixKfZEXZz
N8Ti522H4WgTjtr9TMXXNkQd3cjLmBMdbFLr6xtKpxrsvJKkjOlJhm+irzw+Mhgj
b04pbiT3qFEfsmSj+LMFKeWPl29liw==
=Qytg
-----END PGP SIGNATURE-----

--iom6itn46xokgfg6--
