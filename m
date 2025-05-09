Return-Path: <openbmc+bounces-38-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78CBAB1946
	for <lists+openbmc@lfdr.de>; Fri,  9 May 2025 17:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvD3w00y6z3bgn;
	Sat, 10 May 2025 01:50:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746805835;
	cv=none; b=KQCm/Ajo2IzzgKS0Itu0aJK7qul4puc1Rmuqt8lcKLWEU7GD6uJEsQBJt7cKdBM/CDqSzcbVFcL9mcEQUpythqk5cAL1dOCq1rz/NsrYYC2061/jWYbPoBPSy9MIl64slxXNpHQ7+XPNcpzFN3InKDdJOjGO0fu/2Be/3S1siN173j2NYwvHnxovrJ15mdhUth9MsVR3PexUAS49KgBwci8EDWeOfuf/BCqMHfJOacssVcyPLlRCtGIGEnkjLJBda4nbjJ1/yik8wB0JrdlQwnxAFdUh0sQZrKlUxfi2TTuGBOh0B/6fCi+B1xDOIEUnn79PNYTD0N4aNbiR44YIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746805835; c=relaxed/relaxed;
	bh=MWAkGidqBX5HBclIK0w8IRw+9+HbrMS7tiBfUakCTeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZKL3vgPnJOPRYNS9sumgT5JFPhXbL6Jh8c4UP8asjSZg8HftHX95uhiR5g/B705w5rW0iNpkAVaNcmWwmERSqYpK1XYRDxXkJNt9RbAUmj96+4Nm+uRb/kxLyfT4RfYUBlI4vi8SP9d8grWs2p2LL7M4EW6X0ewvz0ewphlkW94wlPJbcGiey5fJ+seoP5KshhlA9eJysW2ASnr948b7vq2v4ZG9tq0QUkAeJayzqQ2JySRVppyyKqTcnqTxmCMmEvS4jhkC0mvAZbS0M5i7n4XeFRPPHt614NR+yx6j57hDG6CN+FTLWCK0YHbqAIDVja+DcLi8YGHyhodnXjS7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=agPE/e38; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=agPE/e38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvD3t22yMz2xpg
	for <openbmc@lists.ozlabs.org>; Sat, 10 May 2025 01:50:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A689E5C5433;
	Fri,  9 May 2025 15:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25259C4CEE4;
	Fri,  9 May 2025 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805830;
	bh=MWAkGidqBX5HBclIK0w8IRw+9+HbrMS7tiBfUakCTeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agPE/e38PsyLDYEY7NP19Kk/S3Aki2UA+OUsmF/Ur0wiu8MwfK13WMkYRpSoktZ3x
	 qYhMlflMGek/F7qJiDASfOQAKDQ6iFuoBSsknUIWyjckHs6AZdS7ZrXCECZMGA31zE
	 henLbXb4ceM4pH+zqlVlSM4xAyb55uw08vNs1Ym1d//KHxWGl/adzIG9kTipPnwVAy
	 0sSfriM3YS2b34KI8jzLtNhpKru+SAeetkxbzMyHW02ewuvB/G71gm9lu/RiCOtc2S
	 KJMndkwXkLJqRZDKcI8jvOv2pjcUAvQI6J0KaWcVHwUSz8qPEQmE7ZNFXzpw9z/G/u
	 irnqM44abmMJA==
Date: Fri, 9 May 2025 16:50:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Frank Li <Frank.Li@nxp.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] spi: dt-bindings: fsl,dspi: Fix example indentation
Message-ID: <20250509-anew-slept-032f64ac6034@spud>
References: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
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
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JLtz9K+e58T54EQF"
Content-Disposition: inline
In-Reply-To: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--JLtz9K+e58T54EQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 01:21:31PM +0200, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For both
Acked-by: Conor Dooley <conor.dooley@microchip.com>

(idc about both appearing in tree with an ack Mark)

--JLtz9K+e58T54EQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4kQQAKCRB4tDGHoIJi
0qShAQCd9ufBaxXRPbap/bGPVseVhTYkT+wTdHHy2pa1ltrV8QD+Jy6vOTleDf2K
GCgM3WPo4O3ActnatJPM376WaePb7AE=
=7huX
-----END PGP SIGNATURE-----

--JLtz9K+e58T54EQF--

