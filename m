Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820F57CA4D
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 14:10:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpWbl0vphz3cF8
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 22:10:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iG7EuUC2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iG7EuUC2;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpWbK2xn7z3bnV
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 22:09:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A1D761D4F;
	Thu, 21 Jul 2022 12:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBBBC3411E;
	Thu, 21 Jul 2022 12:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658405385;
	bh=Is1b7K1zP/3u0FK9rRtUZbsH5NcbGby4sQBDfEtE5P0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iG7EuUC2eFEtuAh9lO7Gdb5CUn8qCMad1EgCcxOwxHzuvUoEM0rb9jyJKnagNwX4e
	 x14GZunev8iP+CVXaIXKY+Jd2fUKr64cDGB96MzonyMGUo2jhq+50mgaBU35MDTp3e
	 k10+toz3abomP3mzXn0H+Ksr7uLRyeTIjh7HU0sJO5pbTJ2WhHdnEZE7QuwwI82fKF
	 laLspgKV1boLi+I3YAW/ndz+nbYv2Uo+SLNLijH5g0/P3lXjYM9jAmP82gcsu6zhR2
	 /Cg4u83F7TDCzt4pqBdVzfSvBW11AcX8/wHLTyIeXD9hb3VuBBMN4VDUUQGAg/T/6X
	 ZAZJn755a82Pg==
Date: Thu, 21 Jul 2022 13:09:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] dt-binding: spi: npcm-pspi: Add npcm845 compatible
Message-ID: <YtlCAvJK/pb4PbJ6@sirena.org.uk>
References: <20220721101556.118568-1-tmaimon77@gmail.com>
 <20220721101556.118568-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fAOdgDIIiCA86x/O"
Content-Disposition: inline
In-Reply-To: <20220721101556.118568-3-tmaimon77@gmail.com>
X-Cookie: Exercise caution in your daily affairs.
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--fAOdgDIIiCA86x/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 21, 2022 at 01:15:56PM +0300, Tomer Maimon wrote:

>  Required properties:
> - - compatible : "nuvoton,npcm750-pspi" for NPCM7XX BMC
> + - compatible : "nuvoton,npcm750-pspi" for Poleg NPCM7XX.
> +				"nuvoton,npcm845-pspi" for Arbel NPCM8XX.

You've not updated the driver to accept this compatible and this doesn't
say anything about fallbacks.

--fAOdgDIIiCA86x/O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZQgIACgkQJNaLcl1U
h9BwuQf+MgqHMK5RNzIBd69yNdZ64oCneh+BsjdFstytLx4t07xWCOv5+XBZ68ct
cDoz13GzxwS2bysHegbH30+oUEmGQBb6LRB3+IGyLc5XGFWIzf4idBGXQI4c25zK
jEz8cK7i9q548YD+pwtpVzPyPW5DC2+llPoyKFIzECn8+UmaxR3OTTrFDabmV0+m
KonNrnoWCLggYz+t/DVkVLdECAnQwbatCXOKKwSn5atkrGpzd3kHTNGzXv+FB/qp
9pSPrfNMRFXl9tRuUISkFx0iqhiyCpMlVoJx00jZYq9Vw7Y5ZW1y/4/nRrQkqR1j
KGsll59OiewC/YZvU8L2dM8Z9DWYCQ==
=Pul1
-----END PGP SIGNATURE-----

--fAOdgDIIiCA86x/O--
