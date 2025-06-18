Return-Path: <openbmc+bounces-252-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049F8ADF30B
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 18:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMqZ94RQFz2ym2;
	Thu, 19 Jun 2025 02:53:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750265616;
	cv=none; b=gRd0ue3wwtkzvaflfadq8xmrxyBsIRfG1M/05Ifl4caV47fGZKkp6Lqj6mg/Pq1jFLl0VWPSdwyQuw72C2axEMD00bVRRYYOyhgjj7b06wsaffrBN/XqS/qGvz0H76bK7Rjed3MSNqy2tNrkSmyS7WSqpjfs8e91TRMJA9dLuHOCiXzATd0VX5Q7cQMgKzelFbhRKercKGZW9W0mxu3XII3OPMWZHFD27Yo2c7cvRzBvFJQoLDaCgQDTJFE2A5XcTgu7XYsuX8sLMn10Fw+jg+iMrUy76qad7YwXbxS14lpibccY48lhXzJcWd5VRuOS9VTGmZjPOy+bI8DhYFeY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750265616; c=relaxed/relaxed;
	bh=SP4SQ1xNIDbuYUWBIIW0U84YRwPWknCvP4bl8nJ+Io0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5HXO9d15SeBQJp5L56q5l1n9ofXULTpTZ6pyWhfUEZx/cY/LgBhZsZgOQi9VVL5E/jQ07xZN6oo9WVjVR1u0tLe83dMAINulDhXaIxbVBzJRW6fHhIUKyjzlcaxUEHuVLpRO7xMLYOwjUbvLP1jCa0F6QA7mRsYHvACr5O1PWhxvYtdBTLQifubzoPmjR5M09WTq574rYP8loCXs0fYz8g2BKSiLAND/+XChiiPrz6+9/g/KvWOJVA3P7GwW6l1Xbiyhsfp4X+kKRN2BGgNpK2xo2z8joONJJxSsdaz1ol7iCkn1vVgtOkt4N/P/RWeeLMsE/oGjMC9mbspUIOEag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kt0pW+ZI; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kt0pW+ZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMqZ74fRkz30TG
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 02:53:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3C945C3E0A;
	Wed, 18 Jun 2025 16:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91339C4CEE7;
	Wed, 18 Jun 2025 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750265613;
	bh=7JHZ1JIYEO3EYdgf5LTaJMuvW/itgVgyH9exl2xZ5/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kt0pW+ZIraWY4kEMPTrowAUeaLRYIHw+wU3miwExFs8QJypayKj6KItziYfLvAZCK
	 9e/miOrm6AXanTp0urZP4zz3UdAQ4bGPVWxZEj4bf8rGoyW5uTEtvxYc9G5+Evs7Ke
	 /NvuzM5QGxdKosf/Zk/vf90IuIQ8hEaVreo/Nr4q6hWVXzk52DE3uKJZ/hYSIubc2u
	 WHWe7nXfnVvrGsOwc7iF7MEVfYnmhdAjQmBFIM0qiFL8Tm8ldrQHt6SjpKhjEeZr6S
	 iGTEjNkn/xCWkKWH1AApJPcS43KZx/Iv1YngoHG6MeMwRUweuTfFP0Hy0jpXlg5jX4
	 Mpmloj0ADFbtw==
Date: Wed, 18 Jun 2025 17:53:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
Message-ID: <b522222d-f16d-4093-8a63-fc8195ae4c4c@sirena.org.uk>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
 <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IS6dHsJOPgUCFXvr"
Content-Disposition: inline
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
X-Cookie: Is it clean in other dimensions?
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--IS6dHsJOPgUCFXvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 03:02:07PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> We've converted this driver to using the new GPIO line value setters but
> missed the instances where the legacy callback is accessed directly using
> the function pointer. This will lead to a NULL-pointer dereference as
> this pointer is no longer populated. The issue needs fixing locally as
> well as in the already converted previously users of gpio-mmio.

Tested-by: Mark Brown <broonie@kernel.org>

This fixes boot breakage in -next on at least the i.MX6 platforms I
have, I'm also seeing similar issues on a bunch of i.MX8 systems which
look to be due to the same issue but didn't verify them yet.  I'll let
you know if it looks like something else.

--IS6dHsJOPgUCFXvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhS7wYACgkQJNaLcl1U
h9CkHgf9F8X5HfrdZ8GChs5katxlr+IuyIyHqXJyzBuGdWPO0kPD55IqBkEyfiL7
2KCYhj39ITpMfYx/NwxdO1GJwYijguVODtZGCYSLtzuUmUxian6otd+9+k9Mf3M2
S0HB8OWIQDlrSwr+FwGq097E82gEIqgt0VUgZuVSS3rtE4yy3dOw87S3xnKxzP2y
UFxe4DY0YInzgfFKLCykCHHoaEKlEtSTqeJVZE0fgt4DCUu/j8NTjltdTOLA40ab
4W9cghu4Kmxjc+766PeFMujQgPV1Ys2hH3HM8p3jhmParbnnnNKQ9QeMmL8nVmty
zcS9ws8g45ZC06c8SLDIdVQ5qGeGxA==
=Y9BN
-----END PGP SIGNATURE-----

--IS6dHsJOPgUCFXvr--

