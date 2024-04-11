Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F838A0977
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 09:15:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFWFD59K2z3vZR
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 17:15:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFWDx67QMz3vXk
	for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2024 17:15:29 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruoeG-0003hE-DG; Thu, 11 Apr 2024 09:15:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruoeF-00Bdrr-Mg; Thu, 11 Apr 2024 09:15:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruoeF-000PVS-1v;
	Thu, 11 Apr 2024 09:15:03 +0200
Date: Thu, 11 Apr 2024 09:15:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corey Minyard <minyard@acm.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH 0/6] ipmi: Convert to platform remove callback returning
 void
Message-ID: <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lcngjfs7wpvalyyt"
Content-Disposition: inline
In-Reply-To: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
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
Cc: Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, kernel@pengutronix.de, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--lcngjfs7wpvalyyt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Mar 05, 2024 at 05:26:57PM +0100, Uwe Kleine-K=F6nig wrote:
> this series converts all drivers below drivers/char/ipmi to struct
> platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provid=
e a
> remove callback that returns no value") for an extended explanation and t=
he
> eventual goal.
>=20
> All conversations are trivial, because their .remove() callbacks
> returned zero unconditionally.
>=20
> There are no interdependencies between these patches, so they could be
> picked up individually. But I'd hope that they get picked up all
> together by Corey.

Apart from a (positive) review reply I didn't get any feedback to this
series. My quest to change the prototype of struct
platform_driver::remove depends on these patches, so it would be great
if they made it in during the next merge window.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lcngjfs7wpvalyyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYXjfYACgkQj4D7WH0S
/k5niAgApNMQneCEXf2z/4f0oMw7n29zB1VBA8XqNBe8gywAwtS/EIYj+LTG2anz
YAwL1f4zIxTxn3XvSroSLY1oQXVdCEXgVOUaBzmBdDqhcp71M1+RiQ1ihROhFN/7
LoWdNpmjMSZKGe53xy2t0uFeIOQ0GhS5POyZ+YMN/MCbTXwqO2BhEJFKOVf13oDT
gtDaoLPom1R/TIqsVXzjj9qq9r68Lgt21ELjpu4dAr9ZElsiezenS67LKWMgbqTq
o5oupsG/zwlOSYmOeXKWo/CuIVBwXMbQwKIzuRZc32zDJhVD5U4F0h0F/tAgMsTB
z2FsEhWmTytqEVPVdMij2fk7MuaICw==
=MgkB
-----END PGP SIGNATURE-----

--lcngjfs7wpvalyyt--
