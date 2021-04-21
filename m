Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A53669AB
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 13:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQHmZ1qwgz3037
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 21:06:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fbeRSnW6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fbeRSnW6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQHmL40v2z2yYd
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 21:06:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD1566144D;
 Wed, 21 Apr 2021 11:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619003167;
 bh=ibymGhoC6SIgzayCKlW3avb2cLYOlJYug+lPz4rPiIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fbeRSnW6FX6RJVQNfQKsjsOMwyuShGFCbO7OVX/nber6M7zM1IqyQDAijSuwzME8Z
 2AJKir8gl0oltCnl2wxeaLRkl1SP9DPJgUdSG8s4/4QGolJYKDZZ0/JwVIzao07nTs
 gVG/6ulYen67+mOb74yODWu8nm8aCl6+/bxrHu3BWPO66ZikXTN54iXk647oVvFlJn
 QyMTGhoUWlyWFEGE88G+LZBc8fTCtj+jzHGYfNCB/4mbdUdO/6CYvATFwPFpsOAfHB
 Qch1zm1VS35xNf3AbmO09EATwJLXcs0dkE433pxLeFwEjSIn2nM5yscUTQkEWA2fiQ
 0HSl+5BfkjU7g==
Date: Wed, 21 Apr 2021 12:05:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: Enabling pmbus power control
Message-ID: <20210421110540.GA4617@sirena.org.uk>
References: <20210420033648.GA227111@roeck-us.net>
 <YH5rky8nA4nKAVdg@hatter.bewilderbeest.net>
 <9639fa33-01ca-9802-e745-5e3edb81e305@roeck-us.net>
 <YH59WOg0iKbz1d0l@hatter.bewilderbeest.net>
 <fe111c8a-9588-dbfb-624a-29bb3a5efe13@roeck-us.net>
 <YH7w6HUtBSCZRWq4@hatter.bewilderbeest.net>
 <20210420161317.GE6073@sirena.org.uk>
 <YH8D+LWxWPqnFd2h@hatter.bewilderbeest.net>
 <20210420171540.GG6073@sirena.org.uk>
 <YH8jUuOEJKDDDoMb@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <YH8jUuOEJKDDDoMb@hatter.bewilderbeest.net>
X-Cookie: RELATIVES!!
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


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2021 at 01:54:10PM -0500, Zev Weiss wrote:

> Consider the power shelf I mentioned earlier -- it's a rackmount power
> supply and that's about it.  It provides DC power to arbitrary devices that
> it has no other connection to, just ground and +12V.  Those devices might be
> servers, or cooling fans, or vacuum cleaners or floodlights -- the power
> shelf doesn't know, or care.  It's a lot like a switchable network PDU in

If your chassis is particularly simple then it will be particularly
simple to fit into a generic framework so that should make your life a
lot easier here.  Generally the simpler your system is the easier it
will be to use in something generic, it's not going to be stretching
ideas about how things should look and is more likely to have good
helpers available already.

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCABwMACgkQJNaLcl1U
h9ADpwf/VbjMaN7n+jZDxshUvMWZB1BdyohTc3svzJBpwgEZ64SKrE1c+kHOAoO/
7tZNItEYVN+0hugBvbWoC7zBG+X+NPue5Spl8H+vnNFUYxVigAa2bEpNSWInZnXc
TXdumtwjtmOMAGYBCh5Q+l+1KpzZbNADLEWQcei7+DXl0XqhvHzsJTslt07/hyIw
vEBXZTEMP7U5DWYszH7NIMyBN+qbBDVDXHVmeg+JHq8YHh2oF4GwLrx3wC2EQakF
KEQnQ2p/1xrKkzfcSkU0fCvgvf+pN9EvxS94rBkA2xDuer4vlx0ReA9Pll63GPAK
EJ5KQnnPxUbSziNlhuIY83TVxIPyIw==
=xLFC
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
