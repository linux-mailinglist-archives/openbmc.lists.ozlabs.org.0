Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A675DEBE
	for <lists+openbmc@lfdr.de>; Sat, 22 Jul 2023 23:57:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZtC8D2q2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R7gJ24tqfz30gy
	for <lists+openbmc@lfdr.de>; Sun, 23 Jul 2023 07:57:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZtC8D2q2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R7gHQ1vN5z2yWD
	for <openbmc@lists.ozlabs.org>; Sun, 23 Jul 2023 07:56:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1690062937; x=1690667737; i=j.neuschaefer@gmx.net;
 bh=Flafcb8uH5w8NvUBOSyz16mfGfIVxU+ZdD7JX/OjYFA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZtC8D2q2ztcVZja1bA3RfZjGlpLQpxAuPKLflUFlOXGnqPdKTui98gBNGcS9jV2/xJ51XHY
 k+OyYUUK73BnyGnpHgn3Vlp9lSg19/A/Xy91LV4kSWKkCJnTMuR5GUuGjlH1Ea37nGt3rV+K4
 oPqTeBpU0ajX6EFRXPkoXlbU4uJ9DXCwHn0Y37b5JlBOwGK2WQwtcYkLALeoXty4Fsz0cig9R
 sb5CQwK3FN2R7K1TYB511ir60SSeo7ZqOL7Q1iL1xjOwCT08G4Vqtp2jFf54oaFUcjXVN/dum
 yAGGthVQ4E3hmmnpOeyoJ5xfMwy+nU9epIq8YHUe05AN2m0cRvbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.79.98.241]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYvY2-1qRg9B0iyu-00Usfe; Sat, 22
 Jul 2023 23:55:37 +0200
Date: Sat, 22 Jul 2023 23:55:34 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v8 2/2] clk: wpcm450: Add Nuvoton WPCM450 clock/reset
 controller driver
Message-ID: <ZLxQVoZgWenX3xeU@probook>
References: <20230428190226.1304326-1-j.neuschaefer@gmx.net>
 <20230428190226.1304326-3-j.neuschaefer@gmx.net>
 <4e0a5db18ed7d37038e67be0f1ddcb08.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nn9q3w52Gn17IEpS"
Content-Disposition: inline
In-Reply-To: <4e0a5db18ed7d37038e67be0f1ddcb08.sboyd@kernel.org>
X-Provags-ID: V03:K1:LTXzvoyPUC6mK8qVMvjAurjLejlJrQlCMfKDZJWMdiuQoyuQP4d
 P9XpJza2Qdhh7dPxdALFSmYkha8Nxx4N1m508v01kAdCQntFNZ9TP6AIvCHPgifPAaPiGW+
 MsBUoeJ75yTa6XSwdCHKM2mTJy8h8Xj/n7t0RBFCGOiOfdGARqWNlZk15FMmZfPKD7akwF0
 gl7R4FOhsrYWzxMohsdCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ncz1xJtm9UE=;V/MAGSev4maedt6Lw3EwySMvkB+
 ke8kLLN0LCV4LrLjIAn/Hk0Ir51jVT+9d6igx3T15c7xmNUzlShhmdq7QGNu5C9fi9NkGkZRQ
 rrRGHBRyuky5xOf37iIPBzYZHrR2UDXDozorleLhH9ycaL9qzfzKIezgfDLjIqMrg7kKY7krr
 D2e91YdH1BUAR1qt1AwgkqFy40YhQlS8W23vShgHzwSvvCi5opOIbRx0bs4Z/3VyAYLvxKUBI
 4mLbC00CrVtFEFTzHbcjicVY1TSbj+PoJFnLTAs2jeS4lwIlJilxdZva4hk/57zyE7ah84V2f
 zZEwgQOEh6R19S03PCsnkbOa94zVHm1WlCopuzXWL3+hI2UICakQaEHqKua1xqPHSh0J3dChY
 eknchwwAIDvAYXCJozUY4mOVbKdVVcdd1q61EaXnq9mMFyHUKd9mWXkKnTnrIvwXVsDWoYIZf
 INVlqO3vZS5Fmc5Rarfr4KZNiAk+VYjSoeBxdZ3yiF0IohbSFBMWas5gkzGHSnLjOA+JREZa/
 Vbmsv8DsqrYnbXvR5RLmUJwVMWXKOxeskjrmWsVLtvIV5Bwso8fJE4iywziAWA5Dhoi4QqAxt
 vO0rFlhziTon2J6muk6vMYq7Zlo9MnG18GQp0gq6ZQHxQMjMIDodrNZm8ulGhQjv0oUGwgoSc
 H+JrGdiKa6/4U8VYPdAjQzVWFMOojoXTGHcv+ZRE5nzI9adWAUUfacqvVXoCA8YA74aGqe43o
 0z8JpWDOF2Jx4CTgnQ/MCGebQ3bgjUPh/dsfYew6GCtm3yLWo/woqmeaVnrpWyVUqzc72N1xr
 /4LzKqXsaiJV7dSsh0Prs0tZloq47uQUeuWFEgKyVvTH4vtfkqP/LNgL2g3ps3w+ohX1fqSqF
 tU4z3EU/zB5o58oTIHDESPMVCo/SRuu8inz/CBCmmvBZnlANw0QnEl5SVnWbVWxg76dNzCJhK
 NDa7pA==
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nn9q3w52Gn17IEpS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 05:02:15PM -0700, Stephen Boyd wrote:
> Quoting Jonathan Neusch=C3=A4fer (2023-04-28 12:02:26)
[...]
> > +CLK_OF_DECLARE(wpcm450_clk_init, "nuvoton,wpcm450-clk", wpcm450_clk_in=
it);
>=20
> Is something preventing this from being a platform driver?

Ok, when I tried this again, I ran into the issue that the clocks need
to be ready before the timer-npcm7xx driver is initialized, which is
done with TIMER_OF_DECLARE. So, AFAIUI, I need to use the old
CLK_OF_DECLARE mechanism unless I also convert timer-npcm7xx to a
platform driver.


Jonathan

--nn9q3w52Gn17IEpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmS8UC8ACgkQCDBEmo7z
X9t6Pw//SuAXG73wXTGC1XDe0yM/+2QtZx40l1NGapEpmglBkkVYW5gmI7L1111E
wlttlKwOcFDhGUC1AF2zv7DKmlDzKKusA0E0NxBl+uDMwVw+TlU+633sKnpdCLXK
A2aZ5rwldIaTB40Eapl1Mqf1TiZmvRI7Ng4G+02R+ZRqIwb/4WdScHrE6HV1pzoj
3nkT1QOuWHYUYdgzfS5MEepoGluNUwz0M1ZpbBCrodJWg1/BF3Sq+9l1VygYRgAr
9pVuCz4NsAcXS/YG8vUnz3C4ubbYCq39vKLodIucLmsJ8YdtyfVlyG7zbyc/Yg81
CQCzA8Iz6YW9MgrJ3xTU5GItPSFkTBHc0rrRK6YnHtzIn0o4Hyu8WLwI/RrWRrn5
eIIamri1Ofc4iYz9b4Hr83Mmse9Q01hlWHKw8rHUQydmkTCtl+CtPEhNDRKcvRha
5in3dJj4ZpCRG+9tfU1kyx7nEfCtL0+rej6MyCQyY315NkLQquvtClpPiduFlZRz
E/9zhIbn9JxqhJiS5ESZcYIQDl41BGLIVjZY+j0ZAu6bCOT5lROB5IOvtZXxaaf5
rIr6yx5kvsQ2JEHufSXmEW9R2K37oXs7C1xK5hOcAe1tDF6rXD8uWfrwq4hN9sBX
L3hH6itJBUZVnAF0HS7HT1704iLu2OVAIxc/ryztjC7b+OVw19Y=
=Vn/6
-----END PGP SIGNATURE-----

--nn9q3w52Gn17IEpS--
