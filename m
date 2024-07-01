Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C102691E33B
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 17:04:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GrqXYAsl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCTpl4Lq6z3dS5
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 01:04:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GrqXYAsl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCTnr1x8xz3dSM
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2024 01:03:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EF7261418;
	Mon,  1 Jul 2024 15:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82747C116B1;
	Mon,  1 Jul 2024 15:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846222;
	bh=U/EJ8D/Tfr6OznzJRJUQtg9hf0KFmSbGxB7rMS1TF5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GrqXYAslaCu2jiWxD12Vy0N0SS2Uwx67L5z927STQmY3ibxz+qkf8/XzfdjCdzh9M
	 W0ONax2L4+PXgPPunra9AK/ieVr54F8I+AfQg7VtbEPvolFbABu1Iz1/mhYJEkqEVD
	 ZbhSIJRS0LHwakM7ZYbbl7hv5rgliOtv14waBSRQsjf8yb+WxssKNZVKActCcZ0NS4
	 2PE5Ppm/fXD+JyJoTnPA7vQZhJE81839aPqArsuctjloddfCGtdYB47fR9+8z++i9j
	 aRlbwTWqUBYROXHyXlXoIRe+1KdiCfBXVs/iTvpEeh3ul9vRk8FSUVIz3DrCzrOQRq
	 QzxcURxkippNQ==
Date: Mon, 1 Jul 2024 16:03:37 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: npcm8xx: add missing pin group
 and mux function
Message-ID: <20240701-unreal-fester-477720e68dae@spud>
References: <20240630090104.565779-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2UZrTae3B0K5RTNy"
Content-Disposition: inline
In-Reply-To: <20240630090104.565779-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2UZrTae3B0K5RTNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 12:01:04PM +0300, Tomer Maimon wrote:
> Add the following missing pin group and mux function:
> smb6b, smb6c, smb6d, smb7b, smb7c, smb7d, bu4, bu4b, bu5, bu5b, bu6,
> gpo187.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2UZrTae3B0K5RTNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLFSQAKCRB4tDGHoIJi
0kWlAQDrib++ORF3992J5J2D4JW60q9UtcZJrVsV7tMdu3oHcAEAys1Wd9QhBgAV
bXzA+/Vev8OlNVlUYuwH7Fb6xGNl4wc=
=6aKU
-----END PGP SIGNATURE-----

--2UZrTae3B0K5RTNy--
