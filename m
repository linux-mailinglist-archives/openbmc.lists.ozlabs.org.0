Return-Path: <openbmc+bounces-888-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F7C59C6C
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 20:36:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6r9m1bKPz2yvX;
	Fri, 14 Nov 2025 06:36:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763062588;
	cv=none; b=LE9BbKhjhpv2NKRY9v5YW4kHZlg8MP7hM1f3l5b8MXmUvE6CsyhgCkXXObyqK0Lufwgw/hV396yaGk0JXi8jgCHa4d0udtdeA9PVeJfjhPji7g9hCt8YkZfAPFG87hRnyLaxoZustu3io5RAawqPKDHlN8hqR13ER//EI0WkeHfoaukICNDhC5PLV3nhWG1BXGc6dv/xepoolG2tKWpL3RFADMdqnsUVLtXdmMY70vTl/ZEupysVNLqtBcUm9ILBmIlU0xQK9kNrahFYkFV/pAmYkNV9IlUk10D8PwHJ+NzPetuabBgB28HheL9zDIMUgB/Xfb2PVFCP8SRcRI3iyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763062588; c=relaxed/relaxed;
	bh=xjNTfX9qsyG2BosjClH9M3Nm9++o3pe8nvYaw1YQOU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FM7Tkr5216HypuRgbeDr4FAW8vaPk2icQcK/H3F9a68GnwhKTgwWtVl65qw1xTV2RY8vL+Ybcvpnygign9ogXSNKl13gycxeRLBEHplhrzF4JxqDDA70kAhC/DU8lFH/xSQxrg4uzvUzJNRR3+Jjxx7fePwyXoWm7lWc4x1jYcv75DcvlPULD8uZ4A4xiBDj2Pn294Dn7RI5q/Bi9I8tGbvn27KHhpLHHrGBpAE67tWfEJCYc33DrJEJWFclMcqO4pidJuY3yKX96atPFAoqpzcMh4WJTvrb/JV6TZWaAbmANtPlUePJMQ7ukgDHSy0/QSpe65qUUNV0kuvbMC+OCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fVo5395u; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fVo5395u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6r9l2DVpz2yvJ;
	Fri, 14 Nov 2025 06:36:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03CA141984;
	Thu, 13 Nov 2025 19:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06EAC4CEF5;
	Thu, 13 Nov 2025 19:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062584;
	bh=OUQ+Qmgs7ku22AW5gxYYNj5W9qbgTRyidFX1ThPc08Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVo5395uuWVkGDkpQEn4MEn43J6l9a+VMxco++53CmD15eZPSt9Ip6/9SLG9XruF5
	 GVFH3+fUSYwGzKI5/V8g1PLnc2vK4qkCt2F5Y8zjVavMmASmJ69d6YuBSOl8IsNFlZ
	 VGfQgRXxVAOpPadLloiVmKEierKsdndDvxomHfGzjI5vE5ZXR8bYt6XemLEMnVf8+T
	 heiYU2s4fwklhs5rVDpO0e9zowxf9NgZvx2CwS7YbL9ziWtOBDlngJCKhR/7cndQoZ
	 e2Gjn1ELU9XgKPgBzh3lcOdRhzOeiLHvjYg13zTvW1Wdu+uZja9/eLxK1qeMxuBV6C
	 4Z+xEHCc26R7A==
Date: Thu, 13 Nov 2025 19:36:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, clg@kaod.org,
	clg@redhat.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-spi@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH 1/4] dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700
 SoC support
Message-ID: <20251113-reroute-backlit-b2e1d1b6dc04@spud>
References: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
 <20251113085332.89688-2-chin-ting_kuo@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="LS0ZL1mlvV8tsXyl"
Content-Disposition: inline
In-Reply-To: <20251113085332.89688-2-chin-ting_kuo@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--LS0ZL1mlvV8tsXyl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 04:53:29PM +0800, Chin-Ting Kuo wrote:
> Add AST2700 to the list of supported SoCs in the ASPEED FMC/SPI bindings.

Please add information here as to why these devices are not compatible
with the ast2600 ones. With that info,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>=20
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yam=
l b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> index 57d932af4506..80e542624cc6 100644
> --- a/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> +++ b/Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> @@ -12,7 +12,7 @@ maintainers:
> =20
>  description: |
>    This binding describes the Aspeed Static Memory Controllers (FMC and
> -  SPI) of the AST2400, AST2500 and AST2600 SOCs.
> +  SPI) of the AST2400, AST2500, AST2600 and AST2700 SOCs.
> =20
>  allOf:
>    - $ref: spi-controller.yaml#
> @@ -20,6 +20,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - aspeed,ast2700-fmc
> +      - aspeed,ast2700-spi
>        - aspeed,ast2600-fmc
>        - aspeed,ast2600-spi
>        - aspeed,ast2500-fmc
> --=20
> 2.34.1
>=20

--LS0ZL1mlvV8tsXyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYzMwAKCRB4tDGHoIJi
0hcsAP9GQ4eMq05L+q3QOeYKmFSX9l0RK7CzAFAaEFVK2vQKoAD/cOZK1QxP2nV7
sUnhA4Tv0TcCZ4ixDmGcDKByRdBFwgo=
=8VOg
-----END PGP SIGNATURE-----

--LS0ZL1mlvV8tsXyl--

