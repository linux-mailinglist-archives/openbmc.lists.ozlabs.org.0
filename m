Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D04DEBAA
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 14:10:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xb7p1y8dzDqhR
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 23:10:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 46xb6n0qt1zDqTx;
 Mon, 21 Oct 2019 23:09:50 +1100 (AEDT)
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
 by pokefinder.org (Postfix) with ESMTPSA id 47D132C0076;
 Mon, 21 Oct 2019 14:09:46 +0200 (CEST)
Date: Mon, 21 Oct 2019 14:09:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Message-ID: <20191021120945.GC1145@ninjato>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline
In-Reply-To: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, linux-arm-kernel@lists.infradead.org,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 02:20:34PM -0700, Jae Hyun Yoo wrote:
> In case of master pending state, it should not trigger a master
> command, otherwise data could be corrupted because this H/W shares
> the same data buffer for slave and master operations. It also means
> that H/W command queue handling is unreliable because of the buffer
> sharing issue. To fix this issue, it clears command queue if a
> master command is queued in pending state to use S/W solution
> instead of H/W command queue handling. Also, it refines restarting
> mechanism of the pending master command.
>=20
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Applied to for-current, thanks!


--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2toAUACgkQFA3kzBSg
Kba5gw//TeZ9Sn0wM9c2yDDqlKcM/U6TRZYv/mqcZCi5l8hjGfnb/HmnpQN8R/7M
3BrEsK1Zu3FqYbL1JOliu/i91YHd7tAo1lju2claxrX5NbnS2rcEQo4NAxnFG5yK
Ni3sdX1ymQUIxbsjrM/2bhJNOtUFi/j/4ILyFKAyU/bNUZcmbXJHgBIQyFOAHrRX
jpRdPxw7CVro9haEtJV5b6Dk+YAl7aSva82Nu/GFelURpRJDb3Y3/AcKxPTrJ1/u
dydZoenb5S1uY15faP8/0H+cL7LfB5PmxwbnKRO+dI1HDlUVHA6GHFhFQhaAsD5b
kJ4kfmXzI4TR/YjcBArtMsdnXSnwq361pc5VkSiJ8EGLZ2tiuY3sPUxyUSoqEGtT
thAp0K+im/VGdqZVUm8q8n0JTW5CwWGocVVbR/XDkoWgM7Jm9oLOK/VTVsO7N3ih
xHgKnuQ4KMDE2+2rzn5wVTEqyeHUswAcAMNMDXZ4IE1JYI1dj+MDw2s+zYkgoTPJ
9r0zJP0CHj8epiRg09qsQ6xl2iyiAUMIH2uyf+a51fTdBN2BeCNTtWd6VciWuPwM
pAi25JK/ejgOLdCxfGnfnh8u1C5Zp0p40wqtPywwGeynoxdGFMfrfmnPBfP6Qjbl
UUPS4tdFuKJgRv17zVNlfe8bayTm6Lk5/jrgYEuyLp7nqt2/714=
=yVes
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
