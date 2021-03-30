Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E5434EFF5
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 19:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8xc61m9Sz3byV
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 04:42:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W3fIdCIM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W3fIdCIM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8xbv0b4Qz30Bm
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 04:42:34 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FFD761953;
 Tue, 30 Mar 2021 17:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617126152;
 bh=GRGXjpsdSI2flci4hR1I1/0EJbwuHARdHaht1gFjlS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3fIdCIMBGILsyzm5FdqL/ZghdvRkkk5pSiRVs1VtB9VQsfy1x+m9Ad64CwajmKFp
 vsWnFacLYPuVdPRIDPKlypQGM7JtlRqUyqERSuk3rOBsA0Ayc82cIzaPLuuMXb9RER
 xdUgsHd9+ej1i/sk/MOq7fIpiuyfEfE6giwMX+IdSuNvR5zaHfZ+IbrWWJ2sYK6fhx
 FJm17Pm6hwfVlHbTYhqD+XwGmDaZ1dbLjW4yPvFNUv7eWW/NOMJnN9tufHHlYjP47Y
 xjmtTdIq5y3S8fp+WB6r+99IN4bNVDdPDOJIOn9FDKynkb1SAhQ3XyrNv5ejaZj4SZ
 f/grT1xhT+7XA==
Date: Tue, 30 Mar 2021 18:42:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: Enabling pmbus power control
Message-ID: <20210330174221.GJ4976@sirena.org.uk>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
 <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Content-Disposition: inline
In-Reply-To: <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
X-Cookie: Memory fault - where am I?
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 12:19:29PM -0500, Zev Weiss wrote:
> On Tue, Mar 30, 2021 at 06:22:54AM CDT, Mark Brown wrote:
> > On Tue, Mar 30, 2021 at 03:34:16AM -0700, Guenter Roeck wrote:

> > > (and I don't know if the userspace consumer code is appropriate - you
> > > might want to check with the regulator maintainer on that).

> > It's not, you should never see this in a production system.

> Sorry, can you clarify what exactly "this" refers to here?

The userspace consumer.

> > I can't really tell what the issue is here without more context, the
> > global name list should not be relevant for much in a system that's well
> > configured so it sounds like it's user error.

> My initial attempt I guess followed the existing ltc2978 code a little too
> closely and I ended up with all my lm25066 regulators registered under the
> same (static) name, so when I went to attach the reg-userspace-consumer
> instances to them by way of that name I got this:

I don't know what you're trying to do or why, nor how you're going about
achieving it so I can't really comment.  Like I say anything that's
instantiating a userspace consumer in upstream code is broken, it's
there for test during development of regulator drivers.  Whatever device
is supplied by the regulator should have a driver which should control
the regulator at runtime if that is needed.

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBjYvwACgkQJNaLcl1U
h9Bxpwf/SZ+FXLhS4V+BYH5iTDeRJN66xjbkUzAPF4SaBey01AL1oKHSeeJ+/Fiq
7ekXSJcFBI1+oVjmufd8r1jEKRoOy8npWz1WVNqcjqgf+QVz1VNyfa3gB8iPnShq
nHIuZAXxoHxTJHxTwq0UTu97K9FALBCavcO5mO0oUWGi8HTpQsHiCvAIYDC3yK17
/pSDqoc+zQvl4KnFAOQICd72uLhxCx8lI2NeNmjYIfohYtra1lkZ4zAY1/7RQPq7
TtJz4GM82pxFFf2XsV6Hpwyt/nB7PNEwpmKUs72hxPkO/r99mKWjzVBMqPL0a37J
BDpthZPQmvwPjytwDdt9f1F7oP/0mA==
=xHZf
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--
