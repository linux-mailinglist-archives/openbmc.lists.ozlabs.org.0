Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80FD27E9
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 13:26:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ppgT6NZhzDr5R
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 22:26:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 46ppfZ637tzDr4C;
 Thu, 10 Oct 2019 22:25:25 +1100 (AEDT)
Received: from localhost (p54B33257.dip0.t-ipconnect.de [84.179.50.87])
 by pokefinder.org (Postfix) with ESMTPSA id E00F42C01E8;
 Thu, 10 Oct 2019 08:37:35 +0200 (CEST)
Date: Thu, 10 Oct 2019 08:37:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH] i2c: aspeed: fix master pending state handling
Message-ID: <20191010063735.GA893@kunai>
References: <20191009212034.20325-1-jae.hyun.yoo@linux.intel.com>
 <20191010003234.GA12710@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20191010003234.GA12710@google.com>
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Tao Ren <taoren@fb.com>, linux-arm-kernel@lists.infradead.org,
 Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, since this is a bugfix, can we get this in 5.4?

Of course! Just giving Tao Ren some time for the Tested-by.


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2e0asACgkQFA3kzBSg
KbZEfA//eG2wIit8ZvHICrI4HHDAD/xgrOjZcCQHKy+PB5uNFMnEVdGy0ifN2Oml
NIZvvWUp0hjhw7ZkPI0uJQ/MLGO47R02T9s9IXx5s0OaxYjB3MINRr1r/8SHvY2h
4CeHFuMbAOdGx6h0vCACwXVpAvjewebvO45bX80AOXq88b8bRtS4Dx9sWIWRS8Fy
5wpSWP0fFbPCimwIkW8SZE6KZcKy4AenP95Jjxyv7YXGFXDRHgV9xAp5eXDw0ZZR
lhfsSkIWsQkNqOCDzwXO6IKX+GMu2UMzX8ipsXi0S2u03/HUGnhlxMg04AwH28x5
iQv7tO0Boj1/OMJ2jfz/QAk0A+C04lo20/z+heHJoBz6BbhFnbXX+tMUzdn070EB
AHN1pcLMlpPufqEcCBPj0Ky0RP2WH48vFqY+uJnTwAWAFx5quO1/DOYBRyzc4kPW
FnDv6cgFtQKIbO6UWyGs4dHOttBFs2KSpNWcFaRxUHqUDpR7BBw0Bt8V7f6irsql
lVPjyAQj5kDm3eA621uZR3/hFP4Ud1hLF1HzF+j9LX/1lA2+PMB/L7E2Yt6Dv+Ba
1vX55ITdwFTyQ1MKpVileOYL1IY62EcFvUdhi5ahyjQNQtHaslKwa/l4Q/WDpMNu
7AjPGDDcjnmNTW2DAcdxbHMeN3so766ZPr08ujZezcXZX7BBT14=
=ApV2
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
