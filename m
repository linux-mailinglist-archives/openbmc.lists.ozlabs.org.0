Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54D7866A55
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 07:55:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KgKbjAAs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjrwy4kgfz3cPk
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 17:55:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KgKbjAAs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjrwJ05Rlz2yk8;
	Mon, 26 Feb 2024 17:55:11 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-168-240.adl-adc-lon-bras34.tpg.internode.on.net [118.210.168.240])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B956D20179;
	Mon, 26 Feb 2024 14:55:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708930507;
	bh=fM/+3i+uo0h9vj6JNAMzhCNj28si11s6PI7s/m/RuUY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=KgKbjAAs+ka/ghyfQ9+7i5uuod5smNXfmAGyDfK07wVFz+gn6AHadyfkmyIUVXSjq
	 t6+ThglVkkhai65wquLw0Dh3jNItCyaydHI+BBft//thg4/YGLxeyg5C05ICZxmXQA
	 XWivXnQUcZDAqXuyzk/bP22+zj8+P+ngKPVGw3i0ZrIzkQnYVymN/9nlPWlei3owVX
	 14T/R9kfrLEqZDm3dKpCFKqpptPL37FhZSoaLIWRPVBPDClo0HeoD6nac8GVXl0vM2
	 jiMf6cQCtzQOZSPYhyhPHuz5L15gp0XjU1XcLyJjNJuYdUxEjq3/KetNDw+5qe060I
	 LeDSIoxj/uI8Q==
Message-ID: <572d53516dee6db5af7089090056185abb4e78c7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>, joel@jms.id.au, 
	andrew@aj.id.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org
Date: Mon, 26 Feb 2024 17:25:03 +1030
In-Reply-To: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-01-09 at 21:35 -0600, Supreeth Venkatesh wrote:
> This patch adds initial device tree and makefile updates for
> AMD Onyx platform.
>=20
> AMD Onyx platform is an AMD customer reference board with an Aspeed
> ast2600 BMC manufactured by AMD.
> It describes I2c devices, Fans, Kcs devices, Uarts, Mac, LEDs, etc.
> present on AMD Onyx platform.
>=20
> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> ---
>  arch/arm/boot/dts/aspeed/Makefile             |  1 +
>  .../boot/dts/aspeed/aspeed-bmc-amd-onyx.dts   | 98 +++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index fb9cc95f1b60..2b27d377aae2 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	aspeed-ast2600-evb.dtb \
>  	aspeed-bmc-amd-daytonax.dtb \
>  	aspeed-bmc-amd-ethanolx.dtb \
> +	aspeed-bmc-amd-onyx.dtb \
>  	aspeed-bmc-ampere-mtjade.dtb \
>  	aspeed-bmc-ampere-mtmitchell.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts b/arch/arm/=
boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
> new file mode 100644
> index 000000000000..a7056cd29553
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dts
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2021 - 2024 AMD Inc.
> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model =3D "AMD Onyx BMC";
> +       compatible =3D "amd,onyx-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial0 =3D &uart1;
> +               serial4 =3D &uart5;
> +      };
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3DttyS4,115200 earlyprintk vmalloc=
=3D512MB";

Why `vmalloc=3D512MB`? Can you add a comment explaining the need for
that?

That said, setting bootargs in the devicetree is generally discouraged.

> +       };
> +
> +       memory@80000000 {
> +               device_type =3D "memory";
> +               reg =3D <0x80000000 0x80000000>;
> +       };
> +
> +};
> +
> +&mdio0 {
> +       status =3D "okay";
> +
> +       ethphy0: ethernet-phy@0 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <0>;
> +       };
> +};
> +
> +&mac3 {
> +       status =3D "okay";
> +       phy-mode =3D "rgmii";
> +       phy-handle =3D <&ethphy0>;
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_rgmii4_default>;
> +};
> +
> +
> +
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               compatible =3D "jedec,spi-nor";
> +               status =3D "okay";
> +               #include "openbmc-flash-layout-128.dtsi"
> +       };
> +};
> +
> +//Host Console
> +&uart1 {
> +       status =3D "okay";
> +};

How are you managing the host console? Enabling UART1 for that on the
BMC piques my interest :)

Apologies for the delay in reviewing.

Andrew

