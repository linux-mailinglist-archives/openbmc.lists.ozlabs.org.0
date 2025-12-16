Return-Path: <openbmc+bounces-1036-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F9CC5752
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 00:23:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWCfg2McBz2yFW;
	Wed, 17 Dec 2025 10:23:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765927419;
	cv=none; b=T8zuPVMpZym1QqprkIxUYKDIeYIkS2zPjwEIwBnohGdHL6RtxLJbnKdHs/qFYZbQmffknUHCKISzPUPnojuVcq8ZWSiRgKysO2Orz9AtbS04tUyZPWCKxuslPjegc2hx8A0tXDcCmXO/Ino9wU8WQyjdXqqkSXXpdbGvWCTc/inLPBpkm/Q6KIfcETpGgZlOa4h+LYQdR4czrP0LwbWVOrfUQvT5Cz9ccr4AXwl4O72u08ZGARwwfPnRgpGddDF9PoilZskSU5n4FJT20BONap1YEPTPhdDBBo30CxnPaaPXk9qdRAjmA4de1v2a2RO6a/r0QP70sgeaUDTqK+DhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765927419; c=relaxed/relaxed;
	bh=x+4fUc4uxsahY1Ougf2Mf/BDidT0bXz+R2eCfiZ6MdI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YCMmPEpFnJruGunFRU+kdhJJl+SJ/ymr30DTBcMXDBcOVrThx+6Cwo61RKgEAcn6Mj494cgJNpPXtEYbuZoi77GLyUoZy1xlf5lYRDwAJgZuVYz+XxYG+0YymsDo64BR6L3511DySJa3udLNqx9AcewDvIiP/EUNo3muJOo9iC3Ek7EYf3kcHiPEqmD/rhuluQ6uCqoZkHfhEguKmuU+6++u8R1EHdnoO0XC0gpGRrqC6hdcHGiVIemRFO4LbA433NPvfeWHCGoS/Ts7+7eDtX1x+96UzqrDjCkV/+4mV+uHWZGO6/bYB9axgTPhMPC8kyha9XBXERCg3kOI84+f0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=H+oUqKjm; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=H+oUqKjm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWCfd569rz2y6G
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 10:23:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765927415;
	bh=x+4fUc4uxsahY1Ougf2Mf/BDidT0bXz+R2eCfiZ6MdI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=H+oUqKjmpNKcVuh/ppYnEbatU3pXfVkYHiasPQ2TcJLNSnOjOkLCPY+A4PE7G+hM4
	 t+5jxgvRudVBH4dI12AIObNt8s+z/Zbtj4bakugtrAMibjgUO5X+X5evQqa1/KGAm5
	 6VwlVjCyawSZrRcXHiCFVhnwBN9ex6GohgBA0ZgGAn/blxlK+Xm1Djq57xDaYRhFc/
	 RyfunDTK4AziJMPa/CzO2FJfA7A8qbYjS6IF6Mta4Q+gVvuFbyVm5YwTd3SVMVvTHA
	 zXnxwu19bQygcW1buTrBF2X3qu+5U06ZF+xKV+pMywZMvN7pyB1m+wElDoatszcjgT
	 oLXWmJgSjVOtA==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C62707B1F0;
	Wed, 17 Dec 2025 07:23:34 +0800 (AWST)
Message-ID: <cc4141d2b1636c99c8f25b378f34ca214289a51a.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Date: Wed, 17 Dec 2025 09:53:33 +1030
In-Reply-To: <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
	 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
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
> Adds support for disabling the ast2600 FMC_WDT2 through
> a device tree entry in the fmc node.
> Set `aspeed,watchdog-disable` in your device tree to have
> the driver disable it.
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>
> ---
> =C2=A0drivers/spi/aspeed_spi.c | 19 +++++++++++++++----
> =C2=A01 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/aspeed_spi.c b/drivers/spi/aspeed_spi.c
> index 54520122f1c48c8b2052b4b1e47445a9b990d25e..de954e477aa15e6d1be042a2a=
ee47f5a501178da 100644
> --- a/drivers/spi/aspeed_spi.c
> +++ b/drivers/spi/aspeed_spi.c
> @@ -30,14 +30,16 @@ struct aspeed_spi_regs {
> =C2=A0					/* 0x30 .. 0x38 Segment Address */
> =C2=A0	u32 _reserved1[5];		/* .. */
> =C2=A0	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset Command Control */
> -	u32 _reserved2[11];		/* .. */
> +	u32 _reserved2[4];		/* .. */
> +	u32 wdt2_ctrl;			/* 0x64 FMC_WDT2 control */
> +	u32 _reserved3[6];		/* .. */

Ugh (passing commentary, not your fault).

> =C2=A0	u32 dma_ctrl;			/* 0x80 DMA Control/Status */
> =C2=A0	u32 dma_flash_addr;		/* 0x84 DMA Flash Side Address */
> =C2=A0	u32 dma_dram_addr;		/* 0x88 DMA DRAM Side Address */
> =C2=A0	u32 dma_len;			/* 0x8c DMA Length Register */
> =C2=A0	u32 dma_checksum;		/* 0x90 Checksum Calculation Result */
> =C2=A0	u32 timings;			/* 0x94 Read Timing Compensation */
> -	u32 _reserved3[1];
> +	u32 _reserved4[1];
> =C2=A0	/* not used */
> =C2=A0	u32 soft_strap_status;		/* 0x9c Software Strap Status */
> =C2=A0	u32 write_cmd_filter_ctrl;	/* 0xa0 Write Command Filter Control */
> @@ -45,7 +47,7 @@ struct aspeed_spi_regs {
> =C2=A0	u32 lock_ctrl_reset;		/* 0xa8 Lock Control (SRST#) */
> =C2=A0	u32 lock_ctrl_wdt;		/* 0xac Lock Control (Watchdog) */
> =C2=A0	u32 write_addr_filter[8];	/* 0xb0 Write Address Filter */
> -	u32 _reserved4[12];
> +	u32 _reserved5[12];
> =C2=A0	u32 fully_qualified_cmd[20];	/* 0x100 Fully Qualified Command */
> =C2=A0	u32 addr_qualified_cmd[12];	/* 0x150 Address Qualified Command */
> =C2=A0};
> @@ -163,7 +165,8 @@ struct aspeed_spi_regs {
> =C2=A0#define SPI_3B_AUTO_CLR_REG=C2=A0=C2=A0 0x1e6e2510
> =C2=A0#define SPI_3B_AUTO_CLR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(9)
> =C2=A0
> -
> +/* FMC_WDT2 control register */
> +#define WDT2_ENABLE		BIT(0)
> =C2=A0/*
> =C2=A0 * flash related info
> =C2=A0 */
> @@ -267,6 +270,7 @@ struct aspeed_spi_priv {
> =C2=A0	ulong hclk_rate; /* AHB clock rate */
> =C2=A0	u8 num_cs;
> =C2=A0	bool is_fmc;
> +	bool disable_wdt;
> =C2=A0
> =C2=A0	struct aspeed_spi_flash flashes[ASPEED_SPI_MAX_CS];
> =C2=A0	u32 flash_count;
> @@ -683,6 +687,9 @@ static int aspeed_spi_controller_init(struct aspeed_s=
pi_priv *priv)
> =C2=A0	setbits_le32(&priv->regs->conf,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 CONF_ENABLE_W2 | CONF_ENABLE_W1 | CONF_E=
NABLE_W0);
> =C2=A0
> +	if (priv->is_fmc && priv->disable_wdt)
> +		clrbits_le32(&priv->regs->wdt2_ctrl, WDT2_ENABLE);
> +
> =C2=A0	/*
> =C2=A0	 * Set safe default settings for each device. These will be
> =C2=A0	 * tuned after the SPI flash devices are probed.
> @@ -1907,6 +1914,10 @@ static int aspeed_spi_probe(struct udevice *bus)
> =C2=A0	 * SPI controllers
> =C2=A0	 */
> =C2=A0	priv->is_fmc =3D dev_get_driver_data(bus);
> +	if (device_is_compatible(bus, "aspeed,ast2600-fmc") &&
> +	=C2=A0=C2=A0=C2=A0 dev_read_bool(bus, "aspeed,watchdog-disable"))
> +		priv->disable_wdt =3D true;

We're not setting it to false, just declaring it above, which means if
this branch isn't taken then its value is undefined.

Perhaps initialise it to false by default.

> +

Unnecessary new-line?

> =C2=A0
> =C2=A0	ret =3D aspeed_spi_controller_init(priv);
> =C2=A0	if (ret)

