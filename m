Return-Path: <openbmc+bounces-939-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFBC87977
	for <lists+openbmc@lfdr.de>; Wed, 26 Nov 2025 01:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGL7Z6mkLz2yrT;
	Wed, 26 Nov 2025 11:30:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764117034;
	cv=none; b=cIguDOeqUZYw9OQv0+Plh5bmmf5OBG5AuTDluCoYL/bSVO1Aq8X5JLh1DIzT2zykDLWERvYFadfhtsl16GKVVPGpQavmeLO6maNx1DvqgRWSe5E5yrimh1OfavAPoWQ5foHDWmEpcR66BKTke7LjwC+fqsL7v3jFKM4H4NhxnVt6mHug3Ec1hk4DsnHXY/ahUIVd8kJMZHNErqjnesQjK85g9dzMezU7ECzvgW4uWJQacWa+75MoBCe/qTVk0d2vU8Fs4iLKsyiSeMB1x1gaN0EJu6ApCR4b5xQKQ3X3mzqsSmU5N4Ze3r6P5AthzgYQGElu6BQWYkBAwvkdBI5+eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764117034; c=relaxed/relaxed;
	bh=p56fv2e8Zkv3pyYmZqaoaJmbSCqj+YDrJHpnQCdkcec=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AmLkzX9KDbZIjGajoiFzrUBldbPG8c9WUwabjOOX/wPjrZB5RT1/jCx5BpH1xmGAEEfTtBFhBm+1p2k/acCvwqpi9P4H2ypx6dLcXChJ0a1yGIlY8Kn79uhp0GPP6Hfi/DxRoh1zci7nI/2XE731xMBXKyLz+DOJZHJv/4003GryWkERPM5kbRRAzc70rSuWwxMJy4qD5vJP+iq4tYePPeVaSHK837k9WG1Ve8tA/8WYd4W4nWu42wGQpIOx8gXJE+5YsYFcaPaE3BKOati+GBN7A1YSN46/o4m7SEzXDORnUTM7yjZz7Uv0Vaylyte5XL4E6t18pUAMz1iEAqyElA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cWBWUH2A; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cWBWUH2A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGL7Z3YkVz2yr9
	for <openbmc@lists.ozlabs.org>; Wed, 26 Nov 2025 11:30:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764117033;
	bh=p56fv2e8Zkv3pyYmZqaoaJmbSCqj+YDrJHpnQCdkcec=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=cWBWUH2Assts0MOKQUaGSAimZMj/KEbW6xg7sU67R7UO0x3uYsWTo/LTeqlc3xm2k
	 qpZxj6S3ZrKlxOot6v4YjKRM7BkHyRHgr3dnsZ1fTe3FcHtlBcdB3bm3SH6ZcLoRAj
	 IcWKxCyFfHjcjFds/76LeHlU5RxQyCRV1Mq29Vf3TgZlQk50gdborlaFRXlDy/kzae
	 KwWpUsILXu7W2s/weArjuNMQZb1qz8ViTqUiiDjp+Sqdz9tIeez14EhhpNKsyv4hHa
	 pVpVeRda6OnYlKAe8W13b7+3b4+sbPycseK/2ruwCAzC+6SI/yZc90YtQMiQxsajXX
	 O56sVNe0rJ4dA==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C6FB464DF5;
	Wed, 26 Nov 2025 08:30:33 +0800 (AWST)
Message-ID: <9e3bee690272f89ea0f25120c95f166065a3d888.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot 1/2] Add a new board for the gigabyte msx4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, joel@jms.id.au, 
	openbmc@lists.ozlabs.org
Date: Wed, 26 Nov 2025 11:00:33 +1030
In-Reply-To: <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
	 <20251121-msx4-v1-1-fc0118b666c1@nvidia.com>
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

On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> Adds a new board for the gigabyte msx4. The primary
> difference is just that we disable the fmc_wdt2 in
> early board init
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> =C2=A0arch/arm/mach-aspeed/ast2600/Kconfig |=C2=A0 9 +++++
> =C2=A0board/aspeed/ast2600_msx4/Kconfig=C2=A0=C2=A0=C2=A0 | 13 ++++++
> =C2=A0board/aspeed/ast2600_msx4/Makefile=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0board/aspeed/ast2600_msx4/msx4.c=C2=A0=C2=A0=C2=A0=C2=A0 | 77 +++++=
+++++++++++++++++++++++++++++++
> =C2=A04 files changed, 100 insertions(+)
>=20
> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/=
ast2600/Kconfig
> index decf263627fa6ed83123a25268d278fc0f7add2a..6779b000a6ba23dcc4b595151=
96ecc67d4f429d5 100644
> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> @@ -37,6 +37,14 @@ config TARGET_AST2600_IBM
> =C2=A0	help
> =C2=A0	=C2=A0 AST2600-IBM is IBM boards for AST2600 BMC based P0WER10+ se=
rvers
> =C2=A0
> +config TARGET_AST2600_MSX4
> +	bool "AST2600-MSX4"
> +	depends on ASPEED_AST2600
> +	help
> +	=C2=A0 AST2600-MSX4 is an Nvidia board for an AST2600 BMC based Intel s=
erver.
> +	=C2=A0 It is nominally similar to the EVB, but it turns off support for
> +	=C2=A0 FMC_WDT2
> +
> =C2=A0config TARGET_AST2600_INTEL
> =C2=A0	bool "AST2600-INTEL"
> =C2=A0	depends on ASPEED_AST2600
> @@ -66,6 +74,7 @@ source "board/aspeed/slt_ast2600/Kconfig"
> =C2=A0source "board/aspeed/ast2600_ibm/Kconfig"
> =C2=A0source "board/aspeed/ast2600_intel/Kconfig"
> =C2=A0source "board/aspeed/ast2600_dcscm/Kconfig"
> +source "board/aspeed/ast2600_msx4/Kconfig"
> =C2=A0source "board/qualcomm/dc-scm-v1/Kconfig"
> =C2=A0
> =C2=A0endif
> diff --git a/board/aspeed/ast2600_msx4/Kconfig b/board/aspeed/ast2600_msx=
4/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..9096e60aaad31db89998e2d8a=
f8b0adff1f1a62e
> --- /dev/null
> +++ b/board/aspeed/ast2600_msx4/Kconfig
> @@ -0,0 +1,13 @@
> +if TARGET_AST2600_MSX4
> +
> +config SYS_BOARD
> +=C2=A0=C2=A0=C2=A0 default "ast2600_msx4"
> +
> +config SYS_VENDOR
> +=C2=A0=C2=A0=C2=A0 default "aspeed"
> +
> +config SYS_CONFIG_NAME
> +=C2=A0=C2=A0=C2=A0 string "board configuration name"
> +=C2=A0=C2=A0=C2=A0 default ast2600_msx4
> +
> +endif
> diff --git a/board/aspeed/ast2600_msx4/Makefile b/board/aspeed/ast2600_ms=
x4/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..7a01cbec85dafa25a59bbe135=
34c7f5f36abdc81
> --- /dev/null
> +++ b/board/aspeed/ast2600_msx4/Makefile
> @@ -0,0 +1 @@
> +obj-y +=3D msx4.o
> diff --git a/board/aspeed/ast2600_msx4/msx4.c b/board/aspeed/ast2600_msx4=
/msx4.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ce249886ca008e01f9b3b7d81=
d35eef12ec9eca4
> --- /dev/null
> +++ b/board/aspeed/ast2600_msx4/msx4.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) Nvidia
> + */
> +#include <common.h>
> +#include <asm/io.h>
> +
> +#define ESPI_BASE	0x1e6ee000
> +#define SCU_BASE	0x1e6e2000
> +
> +static void __maybe_unused disable_fmc_wdt(void)
> +{
> +	u32 reg;
> +
> +	reg =3D readl(ASPEED_FMC_WDT2);
> +	reg &=3D ~(0x1);
> +	writel(reg, ASPEED_FMC_WDT2);
> +}

Can we rather add support to the SPI driver, and disable it via a
devicetree property?

That way the option is available to other platforms and minimises the
spread of board file code.

> +
> +static void __maybe_unused espi_init(void)
> +{
> +	u32 reg;
> +
> +	/* skip eSPI init if LPC mode is selected */
> +	reg =3D readl(SCU_BASE + 0x510);
> +	if (reg & BIT(6))
> +		return;
> +
> +	/*
> +	 * Aspeed STRONGLY NOT recommend to use eSPI early init.
> +	 *
> +	 * This eSPI early init sequence merely set OOB_FREE. It
> +	 * is NOT able to actually handle OOB requests from PCH.
> +	 *
> +	 * During the power on stage, PCH keep waiting OOB_FREE
> +	 * to continue its booting. In general, OOB_FREE is set
> +	 * when BMC firmware is ready. That is, the eSPI kernel
> +	 * driver is mounted and ready to serve eSPI. However,
> +	 * it means that PCH must wait until BMC kernel ready.
> +	 *
> +	 * For customers that request PCH booting as soon as
> +	 * possible. You may use this early init to set OOB_FREE
> +	 * to prevent PCH from blocking by OOB_FREE before BMC
> +	 * kernel ready.
> +	 *
> +	 * If you are not sure what you are doing, DO NOT use it.
> +	 */
> +	reg =3D readl(ESPI_BASE + 0x000);
> +	reg |=3D 0xef;
> +	writel(reg, ESPI_BASE + 0x000);
> +
> +	writel(0x0, ESPI_BASE + 0x110);
> +	writel(0x0, ESPI_BASE + 0x114);
> +
> +	reg =3D readl(ESPI_BASE + 0x00c);
> +	reg |=3D 0x80000000;
> +	writel(reg, ESPI_BASE + 0x00c);
> +
> +	writel(0xffffffff, ESPI_BASE + 0x094);
> +	writel(0x1, ESPI_BASE + 0x100);
> +	writel(0x1, ESPI_BASE + 0x120);
> +
> +	reg =3D readl(ESPI_BASE + 0x080);
> +	reg |=3D 0x50;
> +	writel(reg, ESPI_BASE + 0x080);
> +
> +	reg =3D readl(ESPI_BASE + 0x000);
> +	reg |=3D 0x10;
> +	writel(reg, ESPI_BASE + 0x000);

What is the behavioural difference to what's in
board/aspeed/ast2600_intel/intel.c? It's a little annoying to tell
because intel.c uses macro symbols for the register offsets where
you've open-coded the values here.

Can we try to make the implementation common?

Andrew

