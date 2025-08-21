Return-Path: <openbmc+bounces-501-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C1CB301C5
	for <lists+openbmc@lfdr.de>; Thu, 21 Aug 2025 20:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7BHl4K2Cz3bb6;
	Fri, 22 Aug 2025 04:12:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755799955;
	cv=none; b=ncoMv4/f9IIPW0OKkXppcUjeeQVFKxH9r18msrrHu9zCOAbBSXDfyerq6Ifbhgu+AB+4cq3/Kw+J+oOW7GqgbcAgTBcLU8fzObw9ysWPCGObo9jkSXIQYZXfs1qlD5OUTJ0mAo515mZcM7yPxDHi0YTgjy2hwTyVjPXN5b05rNYnVlq/3k2wL0g4MlvG8iWsmJQnYpalhmZfTeZZxaBZV6vswt9oVWAZRxWZwVeQzkajquaQou2GStPUFoJDCTH22Kz5+UoFbfAVdfaOIbtpzV2LNs5gf7iJaJSbm/QO4/uN/4MeEBx3Y0a5vWZOWTRNtNqEm+oJFa9HgUgSpTGnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755799955; c=relaxed/relaxed;
	bh=IwkemSw4Vx24EVbbSX7QEvQKVtin90a3h15SG3fkg6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNjHm8qTJpTtQFrPFSLdLHKyffevFwIeZEVRsiri26TtnNNQrk/cCOuOw8uPtG2NX2J8UxbI6VBhCYZnZqY7CzS3lkl9yt+WTFY5mK3bAKzE6t6FDWzPmKHk21vGHBwImUnJf01Fm8atAeWEuvYCsjx7mo6yWKEOukuNbynMzbDEzneJFcurLjcfg02IljBTGsmldYfQfA7ZjS4kE/kerzErQLvkKTYEdulChSWp/UsNxLln2imZDsio+4cbprkoUHwtcwO95PHP3kIv/3AlnaS6DAjgtQz1nHLHGGlL+dyWFoaXHUallJmxSsLgqMRfObLriDG8Fs6Gy9uiPYvnLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jrbldMhW; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jrbldMhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7BHk6y0fz30T9;
	Fri, 22 Aug 2025 04:12:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54F2A601F8;
	Thu, 21 Aug 2025 18:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B2DC4CEEB;
	Thu, 21 Aug 2025 18:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799952;
	bh=tyZZ+il8BMFYTQkAPqh2zWtcW1YYUU3DlFkhMHgu0cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrbldMhWX5CiMxOc8iQ+3bFUFDSo2J7QvQoVDX5+d2TS/S4+JogfQay5R7re4KtMX
	 4raE5FpjqgERfbc5DUol18xjsccrX+F4mjJvwJcPcFYo9wLbe25hV++timmdwvbtCc
	 xNCrh6GKumyWk8LSextmRdyKWgyNiFIxOWyKIt5XeyAipeIIzsqAXdcIS77zfYBvrX
	 sLQcrvKhsbtwrvaDl7AQbGn2s+DTlReSPgE9h5S5O6pCNuz4GEruNpq8wmrhoASfUI
	 5lDe9xaOMaCMZcr38WASAKZ83RIBIONE1ppqPBE2OA6tZ+rGoMOvbxfTmU+5KnrJ/i
	 YzWMANvgvwPcg==
Date: Thu, 21 Aug 2025 19:12:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Message-ID: <20250821-baffling-immersion-e86971edb6e0@spud>
References: <20250821051047.3638978-1-donalds@nvidia.com>
 <20250821051047.3638978-3-donalds@nvidia.com>
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
	protocol="application/pgp-signature"; boundary="I8HKQZSFF8kf2/3M"
Content-Disposition: inline
In-Reply-To: <20250821051047.3638978-3-donalds@nvidia.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--I8HKQZSFF8kf2/3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2025 at 10:10:47PM -0700, Donald Shannon wrote:
> +// I2C2
> +// Baseboard 0 Management 1
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9548";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		i2c-mux-idle-disconnect;
> +		vdd-supply = <&reg_3v3_stby>;
> +
> +		c0uphy0: i2c@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		reg = <0>;

Incorrect indent.

> +		};
> +
> +		c0uphy2: i2c@1 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +		};
> +
> +		c0unused2: i2c@2 {

If these are unused, why are they here?

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +		};
> +
> +		c0unused3: i2c@3 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +		};
> +
> +		c0unused4: i2c@4 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <4>;
> +		};
> +
> +		c0unused5: i2c@5 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <5>;
> +		};
> +
> +		c0unused6: i2c@6 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <6>;
> +		};
> +
> +		c0unused7: i2c@7 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <7>;
> +		};
> +	};

--I8HKQZSFF8kf2/3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdhiwAKCRB4tDGHoIJi
0m2xAP4wGIl/Es2Bp6NAxJ+HV4Tf8VzTJK8IeGd3GjtpjTwM/gD/QRt1hUb5Xf9D
jc00evZQh79KWiMdlVcfo/aTExP+xws=
=y2Po
-----END PGP SIGNATURE-----

--I8HKQZSFF8kf2/3M--

