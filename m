Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD247EF1D
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 14:20:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL7313zFGz2yY7
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 00:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EEJ8KMwB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EEJ8KMwB; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL72c0c7jz2yPT;
 Sat, 25 Dec 2021 00:19:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18C2CB82278;
 Fri, 24 Dec 2021 13:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF53C36AE5;
 Fri, 24 Dec 2021 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640351985;
 bh=RRC0/259fcqHbTn1tWwd3RXhY57VSROcl0lc6qKKWdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EEJ8KMwBUMwKQVwvE8D34Otw7cDN5W5yRIX4/F/mJXKzKsHAlFf2b/ujW+9dkkq9m
 nvwlgHv29Gs1iv1gzJHkweZW3DN3N6qgfMmviBXMCEDKw0Dq52WZHYiyAKffwqoBb8
 qG0kyPcnBpujUGB+4SC5+LJvN+/+bNqtuV16aaWYfkZzf/b/i0VVr51Dpi5ZGQt9Jy
 oIshsV73npxECqQXUFaT1DRB46FwXtTWvK6Sn4e1yKxWcEn4imNsszFopXtZFNJrm2
 pkjABeo5XycsVYISnnjbIQZK+DajbUAnL+DPZUJ7/YOTykmQJW+MQNSMFJfVlRRg46
 wwoSQXY6bt+ng==
Date: Fri, 24 Dec 2021 13:19:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 5/9] regmap: Introduces regmap lock helpers
Message-ID: <YcXI73GKNdx/gvUb@sirena.org.uk>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-6-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mlX9XU0JAkRu6gCR"
Content-Disposition: inline
In-Reply-To: <20211224041352.29405-6-quan@os.amperecomputing.com>
X-Cookie: I brake for chezlogs!
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Phong Vo <phong@os.amperecomputing.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--mlX9XU0JAkRu6gCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 24, 2021 at 11:13:48AM +0700, Quan Nguyen wrote:
> This commit introduces regmap_acquire/release_lock() functions and makes
> them available for drivers that need atomic access of regmap registers

You've not explained what something would need this for and how
it's expected to work - we don't provide unlocked access to the
regmap to client drivers so I don't see how one could safely use
this.  It's unclear to me what this would mean or why it's not
better implemented in the client driver.

--mlX9XU0JAkRu6gCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHFyO4ACgkQJNaLcl1U
h9DaeAf+LrT+e8nVJuT7C0PxLOgU/FymUBhAX0UdyOknH3zdIG0c7DcvOXau1O1x
Kld90ZKSql9M73A3NpWy7ZnamQwLSd+7ik25B9lSL6lY7yRK7Or2N5YL0yWWg9Tl
fJq5v7gTLRLHk5DYQaO7OGXpW5GHKuE4VB7u2aoiWGH1/ovF1odyGVRhbFz6Yn2c
8PaAz4+ja4FDk77vird8NbSpHWOTFVPJg1hq9Kl1ru/ylihcqcNQOlYdubCxLudc
LZSmGUv3WYRRq6ruyjGgQblUkYdlakLVTk8lNi5LaJamD2gKBqPOi1Q1NvPGrhZi
JIMOd8EICA6jR9Hj+s1SIxK4RJNPDQ==
=Dgc1
-----END PGP SIGNATURE-----

--mlX9XU0JAkRu6gCR--
