Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 038951BD7E0
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 11:05:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BszY6gx4zDr2k
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 19:05:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49Bsy83WNHzDqcn;
 Wed, 29 Apr 2020 19:03:59 +1000 (AEST)
Received: from localhost (p54B330EB.dip0.t-ipconnect.de [84.179.48.235])
 by pokefinder.org (Postfix) with ESMTPSA id 266772C08B2;
 Wed, 29 Apr 2020 11:03:56 +0200 (CEST)
Date: Wed, 29 Apr 2020 11:03:55 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Message-ID: <20200429090355.GA2891@kunai>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
 <20200429075357.GA1957@kunai>
 <56add9c6e6b5410986325a1360466e4b@TWMBX02.aspeed.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <56add9c6e6b5410986325a1360466e4b@TWMBX02.aspeed.com>
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And is there maybe a Fixes: tag for it?
> [Ryan Chen] Yes it is a fix patch.

I meant this (from submitting-patches.rst):

===

If your patch fixes a bug in a specific commit, e.g. you found an issue using
``git bisect``, please use the 'Fixes:' tag with the first 12 characters of
the SHA-1 ID, and the one line summary.  Do not split the tag across multiple
lines, tags are exempt from the "wrap at 75 columns" rule in order to simplify
parsing scripts.  For example::

        Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")

===

So, is it possible to identify a commit introducing the problem?

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6pQvgACgkQFA3kzBSg
KbbFHQ/+K57P1NyZRw5B1Rv9WNar6q/eQ41eSy2AlAGuIpeszu87HBT8bm06Pgqo
A7YRNyGbNNxxwFpp237SnxaQuaiaunkM47dv+nodutzcc84onXviG9XbkuLzuQRv
OTXdVQ87+u1xXwcmIP1tY0xSBVyM8S51yCcpWqfdGbJ6NjQg/QHMBJv0keVQDc2h
BwSHJW/UcJBvSn7yMReQb1GPCSomhHu66tG1CRxbM1ZCJ2wh0tjqUvTTH8btXs4o
cji5F23YM9DvUR9iKXayc6ETAsM8uhbahgkSfgp5ZimhOjud5kZyyi1H4DyoG0a+
chWZn1UoyfKbqQoCZMlmGsDizl2u9yvOF0VUclcx0PpGhXeR7cUJkFCtW02aY1B0
2/rh1MLyho2HzLOPZwDuF6/X17Tj+QdhdOJd/Oq8AqZNHvvUB+fXClXFWxnzksEx
qJACY88BqtX6PiXRRtbjjJAxCyhszZbKohVVYwoOHz15DARLRYJfetseC5e2Pvlk
D2ppvmggfk8o8YsgI3f29FquAkVn9cYHzef4A32NVJ/jviug9vmouv0AgAon63dM
UKGd+Ue5zghpD8DR2Vgq5V+VR749W6Q/f0R914xlIMvDzbPVOvggu9391U9aEaa5
XHsi/4GmOYnrGwSo+Ql1O0vF0g4RwppQiHgYN13QjevcgWqZJH8=
=8XDO
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
