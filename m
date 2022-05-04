Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F5351A051
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 15:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtcXq6sHKz3bjq
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 23:06:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t2HZpKjc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t2HZpKjc; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtcXP6grmz3bbG
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 23:06:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A9AC0CE2493;
 Wed,  4 May 2022 13:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A5FC385A4;
 Wed,  4 May 2022 13:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651669570;
 bh=dnmH5WsMczQ058TyPUXueeJIA4Rl1nxkTJuqpWN88fg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t2HZpKjcw5cXF85ECYNoseK1TqjpP0u5iJcZ6SyxDz+sw9bTD3rE/sZ3UfHwzhKSX
 poYd27FmZovchz2DB/FeLieZ82BsepvvEFhF3rEUBpI3mKU6yjeDe4ZsFWckZaSMAp
 7zMOfvp8rtSYu+ecQquuWJTtmXRrdTSte53SIDjGMGO2qIhdTV6Nj+Nili+G8NWO1g
 bfOESBtBPm2ud6P3TDaXPsu0vceOlbdxKb7bk9Ua1351Hfr9lyueYgBBEUpolH9+dh
 gEcIGGiawL7000X4f9oR4x6MBFVFF+IWNRSxslFa1xecpHcygj3AHaZFHW1JHhaneK
 9s29mTGXUeW1w==
Date: Wed, 4 May 2022 14:06:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 4/6] regulator: core: Add external-output support
Message-ID: <YnJ6Pbmv9G3cy62n@sirena.org.uk>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
 <20220504065252.6955-4-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MgdOf/e57b7o062W"
Content-Disposition: inline
In-Reply-To: <20220504065252.6955-4-zev@bewilderbeest.net>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MgdOf/e57b7o062W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 11:52:50PM -0700, Zev Weiss wrote:
> Regulators feeding external outputs (i.e. supplying devices we don't
> control) can be switched on and off by userspace via the 'state' sysfs
> attribute, which is now (conditionally) writable.  They are also not
> automatically disabled in regulator_late_cleanup(), since we have no
> way of knowing that they're not actually in use.

No, this is an abstraction failure.  Enabling and disabling a regulator
is something that should be handled in consumer drivers, just as with
every other use case there's no reason why the regulator should be
offering direct control to userspace.  Putting this directly in the
regulator will cause problems as soon as you for example have multiple
outputs supplied from a single regulator and can't be integrated with
any other control mechanisms.

--MgdOf/e57b7o062W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJyejwACgkQJNaLcl1U
h9B6SAf+K0NM4GhP/wUxHWZLOu4RT872T+i8mSfQlF7aIQvREU4jlHJQrg/zkzm3
8HjhQQzPn+wKz7WEZwgL8N4HgZ9lzNIQYukpJBiGv60QgFlc1lbq7i9J6SX8LNjy
0QZLgcQYjOSIXV6ZMLCn/K8d/D4fS+Lt47REvp/KsxOH3T1U7/ISNrrrUVb3C8p0
bJS2vZ8rUwfSAjPQa/D/SBUeC8WLn5CFskonP492okTiAGKGZn35dTghvEuiQgOT
UH7DipdelxmAALYu3SxxFjfv9dBNELXzLcjtlR0snY2P6mkNbsZnombeWcx2McG3
Pu6RpgoJ/MUlEgDp9XzmY4wXeadGpQ==
=M4o/
-----END PGP SIGNATURE-----

--MgdOf/e57b7o062W--
