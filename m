Return-Path: <openbmc+bounces-886-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8EC57245
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 12:21:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6dB73RKBz2yvX;
	Thu, 13 Nov 2025 22:21:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763032863;
	cv=none; b=IZIjSU3mH2b/1LjUPrFXh+5vDgLf4l2Uv8ZX3c4HI+C3l1gdHkYnZ+yMRmTgI7NluNRPCHiYzFyRSW9CCRvkOoCmL+G17jIeFulmV+IHH1phpMrcyEjYoh+FJL8wqbZVRxr0b1WqBgkjByVW518kZ1ZjN3xNx/w2dM1Hv9S8/BooaBIKtzvLJ22KGpz1QK+u9AyhE7bjLZMnZYTRF1Oy8mzY51Pn9F+g4AZQlxT6tr6yK0NVyA2N9zmlsnTAOlKWd5gN3dvXr1D0sHtbMTmMIQ4PCycMXPRGUhTV6yiPg1kW7MjJ1Wm1NhWyhKbqgS8VMmjuIUQIvmfIl0N2IUcXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763032863; c=relaxed/relaxed;
	bh=0BSvErUPz11tEY82/DGPmNOwLMUrJ/tvwpyhqNuk8Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqnPySa8GA5yEcR3o45+BqnuwmWELGHA4i4wVB91HGXZNRI2uomCfum4mJUpJ4zmx5DpLnWep2TXnpjDW8eq9iHyr2r/eD3VaG3hbHBaV9gN89XxoMEMb4gRMVS88v+uIAHCf1bM+pFLhkxM7OuS0zvhmQSp9oXOH/DWq9OlU3kjbfxmDxeCwxkDR6oAr6WgfTaBPFpcXBbJ1ksuKNFtaL2hrT+8omYQoXPiZMNL6Jc/tTYfuzWVx3pVbynQyAcmmfz2kD+oGJD+p7oyu+m92inRkmRSBeVMjFxNsJzqqWhWCwmzCrqAShCoqJzQw9YCm6y8CDCiCeZX/LvPZpSCUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SdZSjTkW; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SdZSjTkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6dB52QF3z2yvW
	for <openbmc@lists.ozlabs.org>; Thu, 13 Nov 2025 22:21:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BE68439AB;
	Thu, 13 Nov 2025 11:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A567C19423;
	Thu, 13 Nov 2025 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763032858;
	bh=vtBK544FRyKS1BOwji0xiD0d+JWv6PGkNg7wpRHpRxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SdZSjTkWNvwUE1+1q/Y6z8HApEWYFKsQV8J/3ylVYTDbNqnvBz7bG0SCIRZKkbdjI
	 Z55GKxjAUlXxLEhLhEJ8tNLn7z5utLBkz0NJdjszJlRHqklQG6oUDMtnH4jAr9v3kp
	 PF1ae0rWtMcdERLd9X/i7FUmM/8RUPh0AwTIv4rW0MAGZdVO9LBL25cqmCM//0NvyO
	 /GoQ/Fvi4ERBN1bRVCbVcr2Wfx7iOlOax9b20NI152XAseZyyRRqcICufQqoKmTqbV
	 Q8gpRLUCvhnbbqUM95+tU+M8TGVgTZcahtMAmsV5zM+BF7xQN+j3Xn+Giv3iQmpiM9
	 /fIFBV//4KDQg==
Date: Thu, 13 Nov 2025 11:20:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, avifishman70@gmail.com, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT
 schema
Message-ID: <9a175890-bfb9-43d7-bf19-5e2f5ca00f41@sirena.org.uk>
References: <20251112173314.1751671-1-tmaimon77@gmail.com>
 <20251113-loose-seahorse-of-endeavor-5d216e@kuoka>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c70ftPtkFe0Y8++O"
Content-Disposition: inline
In-Reply-To: <20251113-loose-seahorse-of-endeavor-5d216e@kuoka>
X-Cookie: An idle mind is worth two in the bush.
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--c70ftPtkFe0Y8++O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 13, 2025 at 09:51:47AM +0100, Krzysztof Kozlowski wrote:

> Anyway, address space is rarely optional, so I have doubts you would
> have proper justification for this change.

IIRC I have seen some of the controllers with memory mapped flash
support where the address range for the memory mapping was optional
since it could be configured out of the IP when wiring it into the
platform.  No idea if that's what's going on here.

--c70ftPtkFe0Y8++O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkVvw0ACgkQJNaLcl1U
h9Ac1wf+LU21wucZkPrUikGhqSauz0L9PAoNweBaHggildDs6G+y/dxG67+ucIZb
qNKB2x26bwrysd0AM9nenCcdSd72zNrsb5/lxYxLIYkRbHwTqGDshxn8CEjHYU8u
0tF9panGf6fGeS0cWP2vDNk2288cIGEJ3oSFbPjJaWJIleja2O8vhT3WYzDXF6h/
vNkYKl3kmStqr69F10KTad5IyExU5QhsvzYrhRcKWim9uSc5E+4Ip4Uqz5fwEnWC
oz1/qp2ZZiMWYsUi8gnY8qKtzocJ5muMbXyS80uZQlF8mYE2JJIPMgY4OrpdSypL
+dwe6cAI15iM2MiNhjv2BFinMda4Og==
=OfFS
-----END PGP SIGNATURE-----

--c70ftPtkFe0Y8++O--

