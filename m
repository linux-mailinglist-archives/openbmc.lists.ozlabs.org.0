Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4491E32F
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 17:03:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WKP31U3P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCTnp6rQCz3dTZ
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 01:03:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WKP31U3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCTnC2SM7z30Tk;
	Tue,  2 Jul 2024 01:03:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F05EDCE13E1;
	Mon,  1 Jul 2024 15:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA9EC116B1;
	Mon,  1 Jul 2024 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846188;
	bh=9zEnVq1vKf8ZCB+ZTWMUuZ5XV/zSomvjrV9gFojPVhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKP31U3PYNlxmJ5Jw6ioMcWDQnElftOp2CStBuFMpol50DHkEDljLXpYZneKe1hK/
	 V+Gzkx/DA10SFxNMABh5BXp6LpumMgOF3zJi8+RqTegYGwwVu1Cv1G2NgtPk5jsj7V
	 wu8qzmuCoAaBYDgWCjmT2uFTh4nRowX0GrqnZ3skuKsek7sqOgeKF0KVraQ7oEaXQA
	 bmTn0A63keAa789BFAcl8D7VXLegb4ugUTcuRLKhrHAb8kj4llVkKd7vd6PWcfkrql
	 ISTEAL+faHJHnOmfNpwilUfMY/cDu+mEF33TVK6Asti4NavBdUskw83zY6gy8u2bYl
	 SctQE3VkLt17w==
Date: Mon, 1 Jul 2024 16:03:03 +0100
From: Conor Dooley <conor@kernel.org>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: aspeed: add IEIT x86 platform
 BMC boards
Message-ID: <20240701-penniless-purplish-99aa73b47a42@spud>
References: <20240701105259.972135-1-liuxiwei@ieisystem.com>
 <20240701105259.972135-2-liuxiwei@ieisystem.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IXUbULBPs5b4abff"
Content-Disposition: inline
In-Reply-To: <20240701105259.972135-2-liuxiwei@ieisystem.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--IXUbULBPs5b4abff
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 06:52:58PM +0800, George Liu wrote:
> Document the new compatibles used on the ieisystems
>=20
> Signed-off-by: George Liu <liuxiwei@ieisystem.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index e386d0ebfb14..818fbe9c45fc 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -92,6 +92,7 @@ properties:
>                - ibm,rainier-bmc
>                - ibm,system1-bmc
>                - ibm,tacoma-bmc
> +              - ieit,nf5280m7-bmc

This is a singular item, but your commit message's $body and $subject
both sound plural. Is that intentional?

>                - inventec,starscream-bmc
>                - inventec,transformer-bmc
>                - jabil,rbp-bmc
> --=20
> 2.34.1
>=20

--IXUbULBPs5b4abff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLFJwAKCRB4tDGHoIJi
0pXnAP4labcVzdg4N5elo5nMFW9/bbZHoNZWdzlofSvdJaEHJwD/cMxGLP+opluH
MicGC5BtbXqGAUic3usuJcSJOjWoYwM=
=O6so
-----END PGP SIGNATURE-----

--IXUbULBPs5b4abff--
