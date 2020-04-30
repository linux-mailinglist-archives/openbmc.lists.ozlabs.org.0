Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793E1BFDC7
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 16:19:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ccw64sbKzDr7Z
	for <lists+openbmc@lfdr.de>; Fri,  1 May 2020 00:19:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49Ccs00tk1zDr4Y;
 Fri,  1 May 2020 00:17:05 +1000 (AEST)
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
 by pokefinder.org (Postfix) with ESMTPSA id 865B62C08FC;
 Thu, 30 Apr 2020 16:17:01 +0200 (CEST)
Date: Thu, 30 Apr 2020 16:17:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: ryan_chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Message-ID: <20200430141701.GC3355@ninjato>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
In-Reply-To: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 11:37:37AM +0800, ryan_chen wrote:
> In AST2600 there have a slow peripheral bus between CPU
>  and i2c controller.
> Therefore GIC i2c interrupt status clear have delay timing,
> when CPU issue write clear i2c controller interrupt status.
> To avoid this issue, the driver need have read after write
>  clear at i2c ISR.
>=20
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>

Applied to for-current with a Fixes tag, thanks! Please, try to add one
next time and please also check how the subsystem formats the $subject
line.


--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q3d0ACgkQFA3kzBSg
KbaoUQ//QVc//2TXd44pz2LgsMx+qUkEgZNrrJKgAGlXr1KGtLR1Km4XWzGzEutz
cQCYsZtGWucGPt93oJeSXYx9FWagTYPrR47XbX0U5gCQyVY7XtQc4Wj9LXFOgfi4
c/QQVEAtO38HiNGcWumxxc8Td57nbEuvDfMQltBqsuNXeo4BDLl39xvbzFIWHVDE
9D4Re0pWNf4Y4sYFB4kR8hHdaQkYfki1jE0j99sXskuC6pMcVzSMKUIzrISs4BAe
LUCDcrSFokr1W0eqBT6uFvHk4SErXjY0OH+jWxugBXgVliAvSER22FBg2kwqvHC3
fH9CGDi7Ns3RdOoW7d9bTLiHgeaRLBbmTUyuzzKOgXrBJqBnT0AucMfa+X6Is7vC
DS4ojD5tVuP3cMQb+sqVxufPIDPVGRXd7Ee2upMtkNNrd9U6W1cun8jPto6hg5Zu
G/llTNEsGQaYXrSNXJ6mO3p8BL2EhhvSyaOCItGWKvzGudpNCIR47bMiobK1mZwM
F/tkz9xTiXnNipwRMmoQwcon/XoDdVcMs6VoVRIdKk0llGks5kfuZA+zTqc2Kv+h
UvuYl+dTFHH9QEbVN/guogoINdM+Fn0+NMaZWcg7D09tUxRFbbRB/eoyD5q8ms7n
O/NsT911s4Uw1axbcH/+iF4Ys1dnQlRuDglr/xiqogiibdbkfTY=
=f9co
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
