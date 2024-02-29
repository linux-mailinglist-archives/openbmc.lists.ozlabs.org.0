Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C786D126
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 18:52:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sKJ/7lZ8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlzMM1LQwz3vc8
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 04:52:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sKJ/7lZ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlzLg01Y0z3vZf;
	Fri,  1 Mar 2024 04:51:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE8F6CE1D9C;
	Thu, 29 Feb 2024 17:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893DAC433F1;
	Thu, 29 Feb 2024 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709229112;
	bh=pztRkRIxZDjEK/P+/LrFIUNQxaKPYxqTS7e0Q1kH47s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKJ/7lZ8bU4TFocSdCeda8O0nO6TBeOqN6MIiu/oiBNPTBjR+0Ndya1EyyreRLmX9
	 onNTc3eQatK2kN5b4Unmui/88ihW7yh0qEmYw66E7LkX4c0iYgjvPy80EkK098Tb95
	 2d9+vDtYeneE14tMrMdZMKgJmMs/LRfyk4IZkrRQwJDuW+0s128o1lhWD+5gimsJEU
	 bvj1YBa37WM5oxwPe01AmmGJnCfojE1EEjpjTwSouhufePlGr32fz7Cz6EM+XFTeo/
	 BPIkHcR/lQVV6T0AQb5BtXgH4jVI3x7ZAkGsORvpDaIJvkyv1eEx8hhLVBomPHO/+q
	 mLAjzolrJhIWg==
Date: Thu, 29 Feb 2024 17:51:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Kelly Hung <ppighouse@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Message-ID: <20240229-rocket-fraction-76e85d9f4bfb@spud>
References: <20240229111123.1932504-1-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DSM6j8ISbsPmqzxr"
Content-Disposition: inline
In-Reply-To: <20240229111123.1932504-1-Kelly_Hung@asus.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DSM6j8ISbsPmqzxr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 07:11:22PM +0800, Kelly Hung wrote:
> Document the new compatibles used on ASUS X4TF.
>=20
> Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> ---
> V4 -> V5: Update all changelog from v1 to v5.
> V3 -> V4: The new compatible is a BMC for a ASUS X4TF server which use a =
ast2600-a3 chip,
> so correct string to asus,x4tf-bmc.
> V2 -> V3: Add a label to indicate it is new compatible for bmc.
> V1 -> V2: Remove blank in front of the string x4tf.
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 749ee54a3..0047eb4ab 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -74,6 +74,7 @@ properties:
>                - ampere,mtmitchell-bmc
>                - aspeed,ast2600-evb
>                - aspeed,ast2600-evb-a1
> +              - asus,x4tf-bmc
>                - facebook,bletchley-bmc
>                - facebook,cloudripper-bmc
>                - facebook,elbert-bmc
> --=20
> 2.25.1
>=20

--DSM6j8ISbsPmqzxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeDEMwAKCRB4tDGHoIJi
0uSjAQDCxfOMOXE+N731h+7UuR11yoaeareD7d4LNBi19TtxKwEAwClcXRFU8kKV
1lxH4YC6Df+mCB0HWCV9QJLXzygNIQM=
=pTcc
-----END PGP SIGNATURE-----

--DSM6j8ISbsPmqzxr--
