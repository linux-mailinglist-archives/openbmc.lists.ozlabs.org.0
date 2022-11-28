Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CC63B099
	for <lists+openbmc@lfdr.de>; Mon, 28 Nov 2022 18:58:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLY9M6Mygz3cKG
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 04:58:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lkZTBD09;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lkZTBD09;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLY8q357Bz3cFt
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 04:57:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 76864B80E81;
	Mon, 28 Nov 2022 17:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB5CC433C1;
	Mon, 28 Nov 2022 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669658263;
	bh=HOm5tlWIniy5T1amAXM6Y8prJ7Kjyr4oEW5FOmYDoic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lkZTBD09uxBmtzSZiuor8HjGnbbP1RV/lyx2WAeOihIR7vO4VrljoBY1MtGSNUK3E
	 98JP5V9jtxBTF8PDeS1XarMMo5dPw+/rlowPp8unwkO1PMiK6Ru1I65LBMcTSN9y1F
	 9GH0y3P0Dz2GPAMi0QFsGEEODDYzzO5cvYMhjnOMpDT/P6DG306vNIg/sGCjE87b9Y
	 pGcerHb/jNWALLUDd5Ibi7KJl7j/OtUgs77xojC1MVkaBYnhiZinT7MRSVPqm7rBZv
	 UE3nRqjJFcSb7VCYe7VKxKUBmw8jRLpE5LW2EE96f73kUoLNevfSJHiATVXCL4/B96
	 OCl7V7suyc6hg==
Date: Mon, 28 Nov 2022 17:57:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash
 Interface Unit (FIU)
Message-ID: <Y4T2kowzjQMqxckF@sirena.org.uk>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-2-j.neuschaefer@gmx.net>
 <166950112932.8087.6546134123286782729.robh@kernel.org>
 <Y4SV+5/3Y0dw5QeU@wendy>
 <Y4S+oWz8fNsQj5Gj@probook>
 <Y4TBIah6vJAG3kj2@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8hu38K+e8vZwubEp"
Content-Disposition: inline
In-Reply-To: <Y4TBIah6vJAG3kj2@wendy>
X-Cookie: In the next world, you're on your own.
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--8hu38K+e8vZwubEp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 28, 2022 at 02:09:37PM +0000, Conor Dooley wrote:

> Without being a Responsible Adult^TM for either SPI or DT, my preference
> would be for simplifying the binding so that if your clk stuff doesn't
> land for 6.2 the binding checks still work.

Yes, please simplify the example.

--8hu38K+e8vZwubEp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOE9pEACgkQJNaLcl1U
h9Bs1wf+OUxEzRc8Sldcia8LNWHm678IKCqgxrejUeJvY8R7o/7LTsHa5JVhnTt3
Ovq4CmMPJ+0bEF5DIDBxGFWNfEA5C1E9eNJOm9HWTpSYfxZTpBRcP+YC0p1bS9pS
IQhoCxI4K+iYfERMqy6QDCiBCXr9y0+7QHQvwJGvjHNwOXrfEeGdP8GACFTYzCno
3fMMk+tuTUHeRiLKCjdDSbEZwYzMwapBi5mXKS7Ocj+S8SIZFe4zQWY2ViO21GtA
SYedntOzggayxP4PyoIdxyoju5UqteP59QHtE28ygxkzZZt9G1dKhbjhzQ8QAviL
5rv8aCuy9lWvUL45v2NzDVf5/IzSwQ==
=bB+P
-----END PGP SIGNATURE-----

--8hu38K+e8vZwubEp--
