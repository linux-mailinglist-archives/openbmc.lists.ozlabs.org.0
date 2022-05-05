Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFB651BED4
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 14:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvC8K49rmz3bcm
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 22:05:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MC2c9NhE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MC2c9NhE; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvC7s6K7cz2yWn
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 22:05:29 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DC4A615BD;
 Thu,  5 May 2022 12:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5618C385A8;
 Thu,  5 May 2022 12:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651752326;
 bh=YOSvkdiD9YeJgj4aRLVreDoeI4SdaGNCAtWBB3qrsZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MC2c9NhE+Pp2MlVr3eXkpI9xcJh1KF7xIr04oUTt6jPiN4MhfDWrvX4CmOp/8DIkx
 6lLS9h6njGu+8KOSenAdgP5CoTDXKWtmfFqjh4LLgii3NS7DVLesGnm9Gs7r9ymxic
 g0DNA2Dz3sfBQAJ7NYg0FcGyPHC54ylRSMHbAtZo8btjuEaXYeSXqK6KkY/t8J6ZbT
 WPc4AabJ9vePARuVBWs1TjOjVg1JPToqG8IyIEdHtf8h0UHcYYTtljfxsDoZqmFH6M
 hNBQRcMltqpyX/xHW8zQKpLnymUyV8sXagxEvYa8dlASeDdK2OsxqiHFp6goiTffCW
 iNDW434jhq2zw==
Date: Thu, 5 May 2022 13:05:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/6] dt-bindings: regulator: Add reg-external-output
 binding
Message-ID: <YnO9fxkuk6AnEhLl@sirena.org.uk>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
 <20220504065252.6955-2-zev@bewilderbeest.net>
 <YnJ32bG4IkSrRtHV@sirena.org.uk>
 <YnLjNn9WVhvd4izZ@hatter.bewilderbeest.net>
 <YnLmyHwMGnRL18LD@sirena.org.uk>
 <YnLxjJI8Vu3LqAnL@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7moZXgHmwiy4vUEp"
Content-Disposition: inline
In-Reply-To: <YnLxjJI8Vu3LqAnL@hatter.bewilderbeest.net>
X-Cookie: Real programs don't eat cache.
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
 linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--7moZXgHmwiy4vUEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2022 at 02:35:08PM -0700, Zev Weiss wrote:
> On Wed, May 04, 2022 at 01:49:12PM PDT, Mark Brown wrote:

> > For example if the output comes out on a socket then that socket should
> > be described.

> Okay -- in the case of an Open19 power shelf like the ahe-50dc, there are 50
> instances of this, 48 of which are in four ganged connectors each with 12
> pairs of pins, but two of which have their own dedicated little individual
> sockets.  The connectors are physically different, but they're all identical
> as far as software is concerned, so I'm not clear on why it would need to be
> expressed in any DT properties or the like.  Or did you just mean
> explanatory free-form text in the description field?

Explanatory description would be one example of something that should be
described, yes - if there is control for switching the supplies on and
off the user is going to need to be able to figure out which software
control corresponds to which physical connection.  Other devices may
have more things that need autoamtion (eg, jack detection).

> > Sure, but there's no reason why it can't scale down to something
> > simpler.  It's easier to support something simpler than have to extend
> > to support something more complicated.

> Alright, so would you suggest creating something like
> drivers/extcon/extcon-regulator-output.c, and just having its extcon
> functionality be something of a stub for now?

I'm not super familiar with extcon but that seems plausible.

--7moZXgHmwiy4vUEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJzvX8ACgkQJNaLcl1U
h9A8UAf/fie/0qtJtkcTIuxOavIxjrhnkZVoXgVXIZQkG30kKpFcFusvyLn7WqXr
gpDsmSfB5Z2Eg2pd6Vqx58Gst7G7sDnZJt5O7PubZzenBQCMkyiWZiyqc5Rufp9F
vtG6Zfsj1xhkkmZiXuuLuoDm+xLqFTuybFX0WiFCyis5gqvJdMnESUYcxrAhqafh
YnxdpGueFPqxO/tT8kXNrt62bk5xZ1VpJDtesx1FvQ/tGj1I0alTPs30SRrNRNyc
UkYI4t+wLyPh/NGIukqN+yzllWgjjHM7LCMnAM+VyM9vMtNunlRtx/M+T4E8K1b3
j4fLzaFv8XLddtp/924vcwv2ZG/nnw==
=k/3z
-----END PGP SIGNATURE-----

--7moZXgHmwiy4vUEp--
