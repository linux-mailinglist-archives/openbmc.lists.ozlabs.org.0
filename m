Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843585FD79
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 17:02:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7mjcf7i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgdG43BJ8z3dWw
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:02:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7mjcf7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgdFP3NrFz2xHK;
	Fri, 23 Feb 2024 03:02:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 831896188A;
	Thu, 22 Feb 2024 16:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A48C433F1;
	Thu, 22 Feb 2024 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708617732;
	bh=Qr0MkPs/G1e5Xn714YNrc9XRwhwgTkOSsxVVNWdF2LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7mjcf7iuOCCBUXl/GQVlFFrxMwTHUcTkCCmfkoomiM+Dv+2Ji337lHaRBi7KaRVf
	 zsK4AmYrzBVIe+S43UmP/PCC7cBK5RDG/s4gFrZnNeNwWBdGB6jMB6HFKwQHPT7D3B
	 Nxji6MxxWHxhhtdIR0KcOxmZve7jfDNMrj8o4id73SFjKHTJSX/mz908fPjxvt9RTb
	 If4iL7FxlwrKaYFp9JZNW8x5dsZtvnDlpm8blbWXdO4JJysKg3apcq9dwrJm1TvgZk
	 QTJiczzpJfupb6RZyOhh5Labj0zj0eYBitvztx5Q+9JKzPmBXxiDpFUkfGJo1YvVbv
	 Fp4WixOUQC98A==
Date: Thu, 22 Feb 2024 16:02:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Kelly Hung <ppighouse@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Message-ID: <20240222-getting-nebulizer-8f75ba8063b1@spud>
References: <20240222085914.1218037-1-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Au0+rESux1qqjOB8"
Content-Disposition: inline
In-Reply-To: <20240222085914.1218037-1-Kelly_Hung@asus.com>
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


--Au0+rESux1qqjOB8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 04:59:13PM +0800, Kelly Hung wrote:
> Document the new compatibles used on ASUS X4TF.

It would be good to mention here what the x4tf is - is it a bmc or
an sbc etc.

Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 749ee54a3..80009948e 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -74,6 +74,7 @@ properties:
>                - ampere,mtmitchell-bmc
>                - aspeed,ast2600-evb
>                - aspeed,ast2600-evb-a1
> +              - asus,x4tf
>                - facebook,bletchley-bmc
>                - facebook,cloudripper-bmc
>                - facebook,elbert-bmc
> --=20
> 2.25.1
>=20

--Au0+rESux1qqjOB8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZddv/wAKCRB4tDGHoIJi
0o1NAQDiH3SRJuW0MwTpJkcBg5fhpGT7l0kNzZE50LRD8OTzpQEAvil0P51VktVE
eKT9OoXtIoNfTpFjZaZWh785rWy/lQw=
=qCiR
-----END PGP SIGNATURE-----

--Au0+rESux1qqjOB8--
