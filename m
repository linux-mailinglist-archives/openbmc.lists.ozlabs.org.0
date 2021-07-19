Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EBF3CDACD
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 17:20:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT5Bq2g6lz30NG
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 01:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XgTL8aCZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XgTL8aCZ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT5BW6ZZqz306h
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 01:20:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C51261244;
 Mon, 19 Jul 2021 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626708014;
 bh=eZlfxmn16/DejZBT5q1Wtni1vItkSwB4wGlazbM0YlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgTL8aCZ82ReJIafFMisf5nVvWSN5hzj7dwNIYzyUVEDBxeOxaF4i04YvFw7Si85I
 pD2XDTeebny26MfXP/Il+RIkwyuyD8IgGzxKXqbDXOdkVlgLyB9ZX9XNdJyh450oKO
 VcjIr1nAz7bEfUL5lCM86mSFjujUsPBXHnjhBohtrMXXpsp1dr1mjxNbCB+BAygHiQ
 XR+6jOkf3O5tH9pwWn9Qvy9h0F08hFsyBkPvdYh2ItoJrUy9rz9SNdDNe9F8/YgKj2
 XtDpMOaowXqNcg7s7xdeJtpHHdHSlZZ+nhJdnUFr+JnTlbmRUwyppAncOhVhvYn96N
 l0b/lBBpfu4Uw==
Date: Mon, 19 Jul 2021 16:20:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
Message-ID: <20210719152010.GB4174@sirena.org.uk>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <20210716133915.14697-2-eajames@linux.ibm.com>
 <20210716171936.GB4137@sirena.org.uk>
 <81a40f8690d297ebfb6697dbea63279bcf2f24fa.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <81a40f8690d297ebfb6697dbea63279bcf2f24fa.camel@linux.ibm.com>
X-Cookie: You will be divorced within a year.
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 16, 2021 at 01:34:38PM -0500, Eddie James wrote:

> Security changes in the SPI controller - in the device microcode. I can
> reword the commit if you like.

How will people end up running this device microcode?  Is this a bug
fix, or is this going to needlessly reduce performance for people with
existing hardware?

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD1mCkACgkQJNaLcl1U
h9CTpQf/UhCO1XdGF7aljJI2cp2YtB4ew20JV3ml/uya+9qkrR+TxamAV9Yiz3I0
FuIE4j53u06I5QtBn/zan2iQBvVuBbtOZvLJKjRrMyUxPGrWKxwCjo4R6cmWID26
l5xWQnFxkhw3JX3ZGCnuyUJLzCkN5k05gV7faYgkN7h/K+2p5r0eIUKT9X4aPGzu
Nkw/Npv3ltnS0fcUTLreXs60lag6yInRrL2iYkJhxyEvndi7yS9Uc8CvZafpCrDl
hjKdSkQ4aRonuf2iUVN/6eUY8KJyB5X8SgrWohB/CkETMJVK8k3RZZk5M1HKH1aW
CTTqUFAkrr5gB1n6frcrq1PXAWqQFw==
=/M5n
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
