Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3C056075B
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 19:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY7j062J2z3cgg
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 03:28:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pBPcDs7Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pBPcDs7Z;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY7hW1cyLz3bqr;
	Thu, 30 Jun 2022 03:27:55 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CCCB9B81F16;
	Wed, 29 Jun 2022 17:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED50C34114;
	Wed, 29 Jun 2022 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656523669;
	bh=x0EesMyFaiSD8rylLmQqTGs3zzcIl/WKMbvu1LL/AV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBPcDs7ZbJTPSInPM7tyCB+0SAxPf6O8wnPrY5bQ5hRcG4wj0bJhBAyLc+KNDe6H8
	 BfgwTzTPSlzVSvZLpfo4x+chPeMxywDFj6xQe3nbAYrZWGgEqRy3woZ0OkgcdvLe4H
	 Ad+Ni3xu4hsPYt9WeMy7doyJbTIccWokzoOXS8HQPttWMDEyueU6zlzIqy7p9SN4my
	 I+3ACBSudHDC2Br/wXSfR9TFqWe6iTHpECDA9v1F+scmxqE4aDOMixSxWvsuOkEMgM
	 UVvzq3MhzMlLPoJTpWGWNkJzL8hI34sIW/A2CdP1/4IHGw7HB2yIV0YJo4GDv152Qu
	 nTlqF0xa2Y9Ow==
Date: Wed, 29 Jun 2022 18:27:43 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3 2/2] spi: aspeed: Fix division by zero
Message-ID: <YryLj6iWVkqWowDg@sirena.org.uk>
References: <20220622161617.3719096-1-clg@kaod.org>
 <20220622161617.3719096-3-clg@kaod.org>
 <YryHVsrqNlhdwKzq@sirena.org.uk>
 <59b82730-f09f-f7e5-0e2f-4ad1765f0f6e@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VkJUd9CeU3kUqltG"
Content-Disposition: inline
In-Reply-To: <59b82730-f09f-f7e5-0e2f-4ad1765f0f6e@kaod.org>
X-Cookie: Booths for two or more.
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Ian Woloschin <iwolosch@akamai.com>, Ian Woloschin <ian.woloschin@akamai.com>, Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--VkJUd9CeU3kUqltG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 07:21:08PM +0200, C=E9dric Le Goater wrote:
> On 6/29/22 19:09, Mark Brown wrote:
> > On Wed, Jun 22, 2022 at 06:16:17PM +0200, C=E9dric Le Goater wrote:
> >=20
> > > Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
> >=20
> > This commit isn't in mainline.

> drat. It's the OpenBMC kernel. I will resend. Sorry about that.

It's OK, I fixed it up locally.

--VkJUd9CeU3kUqltG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK8i48ACgkQJNaLcl1U
h9D0+gf4tcfx+ldgEy2Wvrii45VbLbXw8yUXIxKQWcg1Ekf6E/5WrCYwVz5ZzRyj
DwH03bKdCTk598u1GbdxhugIaqvp76wQNbHJZ1kxVZd7a2i0cocCFjwaLlLQmdcv
BM0VmWsVJgA77QfAcdZJGdBtkqeObaAp7Uf/TZyg7Lq73fBK83hv9YyDp0JLSNla
TLwlT9Z7ot5cLFfBMOGiYRAsoPI/+6uf2u0zptUsnM105ArmVcC6WiOgbDB8eeDf
p9fFawvvtYgH5/pvK3WJjRehd+/KW/O2AAjJQmy2yhCMTsty3/4NCyUl/XFH7ymV
j8kcUIm7NlXWxsi45lGgDn2KlMNq
=K6NB
-----END PGP SIGNATURE-----

--VkJUd9CeU3kUqltG--
