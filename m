Return-Path: <openbmc+bounces-1037-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E503CC58CA
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 01:06:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWDbT0HNxz2yFn;
	Wed, 17 Dec 2025 11:05:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765929956;
	cv=none; b=QEy3NS/bot2jWAptOrEF3nuLsxnLrJaaaHe/ITAt4vwy+dtDWVQUn4Tc0vChDgIWwCawYS2h3Fi+0WUvhi27vAAu8eHES2L2cFxgdlODmXd82EQVkwZyahzOxTqpuyidEYbUVuj7059DJuak66eRtNgNX1BbCJi2sUofb2FTltGhfaWaDOtJ3KoYsVbFBjS36LBzwsLY83fHWLfTFGk3dNRjIx3EKc0WU9kZYcuQDOuZolHAbaYEHD/3F/DUGMjp3WwdKfyV8IoQP57D8tVas72f77dOzM/jW/OwvmW6je7cQpMSUhuT9h+kaWLRNE/Mrdri1NUn4Erj+ezMAzYM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765929956; c=relaxed/relaxed;
	bh=a0N+IS2aWI4j2M50hZp6epetuw92aWo3MyUo89auR2w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z49W60tHUtWI+u9rjuWIFQpgnfglKmdSYpGAwbhu10m4X9rQjWQQ/Xo3Isctb5SeSq4phLKmznI/RDLanwm4e59xSjrxwDA/S3F6ioq4tW7jEqPK+HW0SggCeYe2zCm8r/LW2eJo7hKd6W2GKpIUyS6jRs+tEw2VC85+O1V9al0hJUrJ1RFMDcmggAnmldiw01woqQsUNXcAUifSUEltlF6FcTOO3pPNUVJOEtXzSBGN804pRI6G+RwkJJ0yPZlSrP6qZsv2FzOw3G/vdytR4vyuNTSRvfoZ0EcRkP2H/+vmmS9hsRGuZ5GJ4EiSFbDGzipwkpljvF4l9+78spy79Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HSM7SXV9; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=HSM7SXV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWDbN6lTgz2yFb
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 11:05:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765929951;
	bh=a0N+IS2aWI4j2M50hZp6epetuw92aWo3MyUo89auR2w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=HSM7SXV9+VsK42WwXvY4xqqeIjoGYk1Q2S1t484QJhS38o/ILzTdgZ76JYAj1ODhd
	 8zFWFNcAyxVJtudgKtXMnDoK6gXSiALU2MHPZ2JfXMq6DZL/XDpuWTRgcSOO8XsACa
	 yDm/111Z2mkO1ktstMqOPGPdR+HTzq4NDutz7c4KJnGLpvF19qS+x1c3OjWjUkJczI
	 FgLBpUBPY4DHSZId9NempvpAeA9D3j+3WMh0eHin5SWyV+rQlYbTHBVvZEGt+pE157
	 YucMMa1ErTKg+XKjb7RvO0fMvuSGABQR9oiMqsxX4USpzGY4C7pmryt4+Od+4iSn+j
	 6f5ok7hvElWHw==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1A6467B1F0;
	Wed, 17 Dec 2025 08:05:51 +0800 (AWST)
Message-ID: <75cfc8e29f561802e6b8e7025475507fbe7df2d4.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2 2/2] arch: arm: dts: Add dts for the nvidia
 msx4 board
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Date: Wed, 17 Dec 2025 10:35:50 +1030
In-Reply-To: <20251202-msx4-v2-2-a605d448bd02@nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
	 <20251202-msx4-v2-2-a605d448bd02@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On Tue, 2025-12-02 at 15:52 -0800, Marc Olberding wrote:
> Adds a dts for the nvidia msx4 board, a granite rapids based
> motherboard
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> =C2=A0arch/arm/dts/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0arch/arm/dts/ast2600-msx4-bmc-nvidia.dts | 112
> +++++++++++++++++++++++++++++++
> =C2=A02 files changed, 113 insertions(+)
>=20
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index
> dbb2fafc4f4c13302a02875cd678477ab95334cb..aebc5b60abc6b267669650be098
> 315f5d5715074 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -689,6 +689,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	ast2600-facebook.dtb \
> =C2=A0	ast2600-fpga.dtb \
> =C2=A0	ast2600-gb200nvl-bmc-nvidia.dtb \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ast2600-msx4-bmc-nvidia.dtb \

Whitespace seems funky here?

> =C2=A0	ast2600-greatlakes.dtb \
> =C2=A0	ast2600-intel.dtb \
> =C2=A0	ast2600-intel.dtb \
> diff --git a/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
> b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..3f5146c65dec3ec569cd46745a1
> 3be5466f7218c
> --- /dev/null
> +++ b/arch/arm/dts/ast2600-msx4-bmc-nvidia.dts
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "ast2600-u-boot.dtsi"
> +
> +/ {
> +	model =3D "AST2600 MSX4 BMC";
> +	compatible =3D "aspeed,ast2600-msx4", "aspeed,ast2600";
> +
> +	memory {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart5;
> +	};
> +
> +	aliases {
> +		spi0 =3D &fmc;
> +		ethernet0 =3D &mac0;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			clock-frequency =3D <800000000>;
> +		};
> +		cpu@1 {
> +			clock-frequency =3D <800000000>;
> +		};
> +	};
> +};
> +
> +&display_port {
> +	status =3D "okay";
> +};
> +
> +&fmc {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> +	aspeed,watchdog-disable;
> +	status =3D "okay";
> +
> +	flash@0 {
> +		status =3D "okay";
> +		spi-max-frequency =3D <10000000>;
> +		spi-tx-bus-width =3D <2>;
> +		spi-rx-bus-width =3D <2>;
> +	};
> +
> +	flash@1 {
> +		status =3D "okay";
> +		spi-max-frequency =3D <10000000>;
> +		spi-tx-bus-width =3D <1>;
> +		spi-rx-bus-width =3D <1>;
> +	};
> +};
> +
> +&hace {
> +	status =3D "okay";
> +};
> +
> +&mac0 {
> +	phy-mode =3D "rgmii";
> +	phy-handle =3D <&ethphy3>;
> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default>;
> +	status =3D "okay";
> +};
> +
> +&mdio {
> +	status =3D "okay";

Nit: It'd be nice if the status property were in a consistent location
(wrt ordering in e.g. the fmc node above).

I like it at the top as you have here, makes it clear that the node has
relevant changes.

> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mdio4_default>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	ethphy3: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <2>;
> +	};
> +};
> +
> +&scu {
> +	mac0-clk-delay =3D <0x1d 0x0a
> +			=C2=A0 0x1d 0x0a
> +			=C2=A0 0x1d 0x0a>;
> +};
> +
> +&sdrammc {
> +	clock-frequency =3D <400000000>;
> +	aspeed,ecc-enabled;
> +	aspeed,ecc-size-mb =3D <0>;
> +};
> +
> +&uart5 {
> +	u-boot,dm-pre-reloc;
> +	status =3D "okay";
> +};
> +
> +&wdt1 {
> +	status =3D "okay";
> +};
> +
> +&wdt2 {
> +	status =3D "okay";
> +};
> +
> +&wdt3 {
> +	status =3D "okay";
> +};

