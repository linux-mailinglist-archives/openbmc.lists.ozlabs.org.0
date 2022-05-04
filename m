Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4B051AFBB
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktpq94DtJz3bpZ
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 06:49:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=azIP2rCe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=azIP2rCe; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktppn5gkVz3bXw
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 06:49:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28BD3B828AA;
 Wed,  4 May 2022 20:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229DEC385A5;
 Wed,  4 May 2022 20:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651697357;
 bh=uAn1jx4nc/AyBKpUGArQO9zmKvmz3TirIiMxZEWuzcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=azIP2rCeokqKbAzsWLeh/51f72I2r/dtxufFiQT1RPrFaPBYSqj/s5pkOUM5GmsQV
 nrQM+zGGqt4HRLNoTaaPKnVTVceTC+7XgOV4PkrmXeM4DkT9UaVUBlFHafejXpLhRY
 arLbbxLrx+rL0Q1WHeG2FHnKcBsN8OFkEgHRjhaqLNCyMeO2bybTg/lO8iUzwsjxfJ
 2BfMNwBbm1EF1B6IXsbTgFNCyoq7p6yNtWJQYiAxKNgIyEFGPEKOCPNOW6n/v2uKmA
 YYChYKS8chwl6Dj0bV9jmrItxddT2tuFiF5Si96tvZF9eBBnePoKXHKqdq8tt+sJ53
 D/FNXZ5sQxacA==
Date: Wed, 4 May 2022 21:49:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/6] dt-bindings: regulator: Add reg-external-output
 binding
Message-ID: <YnLmyHwMGnRL18LD@sirena.org.uk>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
 <20220504065252.6955-2-zev@bewilderbeest.net>
 <YnJ32bG4IkSrRtHV@sirena.org.uk>
 <YnLjNn9WVhvd4izZ@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="66W6v/kA9l7TTEWD"
Content-Disposition: inline
In-Reply-To: <YnLjNn9WVhvd4izZ@hatter.bewilderbeest.net>
X-Cookie: Mother is the invention of necessity.
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--66W6v/kA9l7TTEWD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2022 at 01:33:58PM -0700, Zev Weiss wrote:
> On Wed, May 04, 2022 at 05:55:53AM PDT, Mark Brown wrote:

> > I think at a minimum anything like this would need some sort of
> > representation of how the output physically appears so that people can
> > work out how outputs are mapped to the hardware they see.

> I don't quite understand what you're describing here -- could you elaborate
> on what you mean by "how the output physically appears", and what that might
> look like in a DT binding?

For example if the output comes out on a socket then that socket should
be described.

> > However we
> > already have a subsystem for external connectors - extcon.  Perhaps this
> > should be a regulator client in the extcon API?  It's common for
> > connectors to include some sort of power provision so it seems like this
> > would fit right in.

> Interesting -- I wasn't previously aware of the extcon subsystem, thanks for
> the pointer.  However, after looking at it a bit, I'm not sure I see how
> it'd be applicable here, since it looks like it's built to handle hardware
> that's at least sophisticated enough for software to tell whether or not
> something's plugged in, which isn't the case here.  The connector is just a
> ground pin and +12VDC pin, no presence-detection mechanism or anything else.
> Outside of the regulator itself there's really no "device" there for
> software to talk to or otherwise interact with at all.

Sure, but there's no reason why it can't scale down to something
simpler.  It's easier to support something simpler than have to extend
to support something more complicated.

--66W6v/kA9l7TTEWD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJy5sgACgkQJNaLcl1U
h9B35Af+PHHkp2wfo6G66nqsy/m9SQn1PAVUGFZ0DrivXUKk7YOodvsS0HglBDu2
gkBV/c4Kdp3RrS3MYpqsGRRCdkRMiEO98WLKhnIW7LVqs4fB+BMi6TbFUyJX4IVS
S86d8/3j97F7mA/EzmITT3naxTPMnym23r2wDfL1BTf7MuQGwRbchmQfwxArsz4c
Vh+CbfhYTk4b7X4sG8AddkqRvRG0yuHtokGbIqBFOiPZbgulVrqWPPKLYgIzqYKY
LTo2IeGwL5pRTtzfqNDNfWsMfFo879rPIzeOCUvzraToQRABMPanKEyP/LYI7eWA
c9LJQhPk8fhLuDunH6clBkWd1m1CBg==
=lUz7
-----END PGP SIGNATURE-----

--66W6v/kA9l7TTEWD--
