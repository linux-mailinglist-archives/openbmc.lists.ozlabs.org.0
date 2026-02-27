Return-Path: <openbmc+bounces-1420-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAp9GTDYpGnWtwUAu9opvQ
	(envelope-from <openbmc+bounces-1420-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:22:08 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 911FF1D2118
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:22:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKPS6ZX2z2xS5;
	Mon, 02 Mar 2026 11:22:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772204005;
	cv=none; b=SN9NEa+IHL49RUxnoxkW859p2vagTx4XCzgeruuq0UBRn9OTGa/+9Xx4bFTIbQ4Y7D/f80uyfxKShEuVZFAOt9IMG3NI2BkrEbjVPGCHzaL0l7JXFfW5EdHAOJ8n3xgxNkF8TgYQb8EOiYxB7VZ39YOXHLTaE/fuk7dVm4L2Q73s1UmmS2ftc6kKIc3XCPcKrMhSSv/EfMaoYaXl2Q4F6yquF3V7rcmwGtTB6dcZAdnkxRNRAXls4vt4iCchXi7cRtVdtLAY4X68nbtGJAq4wAB/gpGWtP37ZEQjB1jMUwLG24Rr+WLHhE5Mkod7QKKUMj2/mAyjoVOB1h6SYdwOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772204005; c=relaxed/relaxed;
	bh=kEGaf9zqcWTV5lUNoFG6YgkinNxqtmaRJ7WKJCFDZQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbHymenqE/bTYLutlWJFUqkTS7tDLL8aFwj9n2MJPIzPdMBV9nnueKrUdx9RH7rDoDyqiVZJDGxnAUyh+aljc8zXkYLz1f5O5Mw03QHKxBMtojrwxDwXJd9/HyGJ5mEkUaDSXlz21eugBKVmZ++0PINvfiRoSpgMXZdyTCQEHLgmxhu4Zudoxxa1gk8nSUB+YPGt8+0u0qqKLXEveQJhmAeT0aFZfTYKwPrMKNLkx9fQPwTJJowuQJoRAxbtGiIExwWKxNELnXmL7qwX8BrjZVSMe+sXeaGVKPM+XdAYY8FMwzhtRGGBzn7+I/I04bbaLWjhDNpTBYxYq6Y3pi8HgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KNHx9uzj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KNHx9uzj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMrtD51RMz2xKh
	for <openbmc@lists.ozlabs.org>; Sat, 28 Feb 2026 01:53:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75F5B44394;
	Fri, 27 Feb 2026 14:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D099C2BC9E;
	Fri, 27 Feb 2026 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204002;
	bh=ld7NR675p8M5i366cnAgjhmDv51p+1WaNWwPE8ixVMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KNHx9uzj6ZyzCtHaKb4X2/uUbngS3GRRKfIFQBMUUUyQcfDdMJjXyhoDET2GwXoU9
	 tw6lz0GtjSQ5zymFWPwDZrCiU3t3aDLIAExSZmeBf1Zt//0SW2LeNuv1uuVksWcZvZ
	 Z7ql7nceE/JolyD6oqdDCGwPTx8t0Ao4gkUQFHtI7Z8tcenwS2k4NqrMr+bzi+WfkH
	 nX57vvuaxkD+zKPdBzgzB3inGqV5kFbtqcTekEqY4HJwlq9dGFD0RMkqlKV9M9cAKR
	 2mQVuNLRwK0UrmY03QLfHiwNEUw+xpRAgneTVjhPKJKpct/JeCUt4wAiScsFmUUjsh
	 Oyr65Nsmc0ZSw==
Date: Fri, 27 Feb 2026 20:23:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 2/4] phy: axiado: add Axiado eMMC PHY driver
Message-ID: <aaGv3q8czkrKyW42@vaman>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
 <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-2-a2f59e97a92d@axiado.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-2-a2f59e97a92d@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[57];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1420-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:twei@axiado.com,m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vkoul@kernel.org,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,axiado.com:email]
X-Rspamd-Queue-Id: 911FF1D2118
X-Rspamd-Action: no action

On 06-02-26, 16:22, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> It provides the required configurations for Axiado eMMC PHY driver for
> HS200 mode.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  drivers/phy/Kconfig                  |   1 +
>  drivers/phy/Makefile                 |   1 +
>  drivers/phy/axiado/Kconfig           |  11 ++
>  drivers/phy/axiado/Makefile          |   1 +
>  drivers/phy/axiado/phy-axiado-emmc.c | 221 +++++++++++++++++++++++++++++++++++
>  5 files changed, 235 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0aa0597773433f04d2a9ba77474d2a..b802274ea45a84bd36d7c0b7fb90e368a5c018b4 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
>  
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
> +source "drivers/phy/axiado/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494283d7fd05dd670ebd1b12df8b1a1..f1b9e4a8673bcde3fdc0fdc06a3deddb5785ced1 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
>  obj-y					+= allwinner/	\
>  					   amlogic/	\
> +					   axiado/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   freescale/	\
> diff --git a/drivers/phy/axiado/Kconfig b/drivers/phy/axiado/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..d159e0345345987c7f48dcd12d3237997735d2b5
> --- /dev/null
> +++ b/drivers/phy/axiado/Kconfig
> @@ -0,0 +1,11 @@
> +#
> +# PHY drivers for Axiado platforms
> +#
> +
> +config PHY_AX3000_EMMC
> +	tristate "Axiado eMMC PHY driver"
> +	depends on OF && (ARCH_AXIADO || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enables this to support for the AX3000 EMMC PHY driver.
> +	  If unsure, say N.
> diff --git a/drivers/phy/axiado/Makefile b/drivers/phy/axiado/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..1e2b1ba016092eaffdbd7acbd9cdc8577d79b35c
> --- /dev/null
> +++ b/drivers/phy/axiado/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_PHY_AX3000_EMMC)		+= phy-axiado-emmc.o
> diff --git a/drivers/phy/axiado/phy-axiado-emmc.c b/drivers/phy/axiado/phy-axiado-emmc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..28d2a30c3b35ee7dba917487959e226941e8ea4b
> --- /dev/null
> +++ b/drivers/phy/axiado/phy-axiado-emmc.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Axiado eMMC PHY driver
> + *
> + * Copyright (C) 2017 Arasan Chip Systems Inc.
> + * Copyright (C) 2022-2025 Axiado Corporation (or its affiliates).

2026

> + *
> + * Based on Arasan Driver (sdhci-pci-arasan.c)
> + * sdhci-pci-arasan.c - Driver for Arasan PCI Controller with integrated phy.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +/* Arasan eMMC 5.1 - PHY configuration registers */
> +#define CAP_REG_IN_S1_LSB		0x00
> +#define CAP_REG_IN_S1_MSB		0x04
> +#define PHY_CTRL_1			0x38
> +#define PHY_CTRL_2			0x3C

smaller hex case please, here and other places

> +#define PHY_CTRL_3			0x40
> +#define STATUS				0x50
> +
> +#define DLL_ENBL	BIT(26)
> +#define RTRIM_EN	BIT(21)
> +#define PDB_ENBL	BIT(23)
> +#define RETB_ENBL	BIT(1)
> +
> +#define REN_STRB	BIT(27)
> +#define REN_CMD		BIT(12)
> +#define REN_DAT0	BIT(13)
> +#define REN_DAT1	BIT(14)
> +#define REN_DAT2	BIT(15)
> +#define REN_DAT3	BIT(16)
> +#define REN_DAT4	BIT(17)
> +#define REN_DAT5	BIT(18)
> +#define REN_DAT6	BIT(19)
> +#define REN_DAT7	BIT(20)
> +#define REN_CMD_EN	(REN_CMD | REN_DAT0 | REN_DAT1 | REN_DAT2 | \
> +		REN_DAT3 | REN_DAT4 | REN_DAT5 | REN_DAT6 | REN_DAT7)
> +
> +/* Pull-UP Enable on CMD Line */
> +#define PU_CMD		BIT(3)
> +#define PU_DAT0		BIT(4)
> +#define PU_DAT1		BIT(5)
> +#define PU_DAT2		BIT(6)
> +#define PU_DAT3		BIT(7)
> +#define PU_DAT4		BIT(8)
> +#define PU_DAT5		BIT(9)
> +#define PU_DAT6		BIT(10)
> +#define PU_DAT7		BIT(11)
> +#define PU_CMD_EN (PU_CMD | PU_DAT0 | PU_DAT1 | PU_DAT2 | PU_DAT3 | \
> +		PU_DAT4 | PU_DAT5 | PU_DAT6 | PU_DAT7)

The bit define are used only once, why not define the cmd with
respective bits here

> +
> +/* Selection value for the optimum delay from 1-32 output tap lines */
> +#define OTAP_DLY	0x02
> +/* DLL charge pump current trim default [1000] */
> +#define DLL_TRM_ICP	0x08
> +/* Select the frequency range of DLL Operation */
> +#define FRQ_SEL	0x01
> +
> +#define OTAP_SEL_MASK		GENMASK(10, 7)
> +#define DLL_TRM_MASK		GENMASK(25, 22)
> +#define DLL_FRQSEL_MASK		GENMASK(27, 25)
> +
> +#define OTAP_SEL(x)		(FIELD_PREP(OTAP_SEL_MASK, x) | OTAPDLY_EN)
> +#define DLL_TRM(x)		(FIELD_PREP(DLL_TRM_MASK, x) | DLL_ENBL)
> +#define DLL_FRQSEL(x)	FIELD_PREP(DLL_FRQSEL_MASK, x)
> +
> +#define OTAPDLY_EN	BIT(11)
> +
> +#define SEL_DLY_RXCLK	BIT(18)
> +#define SEL_DLY_TXCLK	BIT(19)
> +
> +#define CALDONE_MASK	0x40
> +#define DLL_RDY_MASK	0x1
> +#define MAX_CLK_BUF0	BIT(20)
> +#define MAX_CLK_BUF1	BIT(21)
> +#define MAX_CLK_BUF2	BIT(22)
> +
> +#define CLK_MULTIPLIER	0xC008E
> +#define POLL_TIMEOUT_MS	3000
> +#define POLL_DELAY_US	100
> +
> +struct axiado_emmc_phy {
> +	void __iomem *reg_base;
> +	struct device *dev;
> +};
> +
> +static int axiado_emmc_phy_init(struct phy *phy)
> +{
> +	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
> +	struct device *dev = ax_phy->dev;
> +	u32 val;
> +	int ret;
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | RETB_ENBL | RTRIM_EN, ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
> +
> +	ret = readl_poll_timeout(ax_phy->reg_base + STATUS, val,
> +				 val & CALDONE_MASK, POLL_DELAY_US,
> +				 POLL_TIMEOUT_MS * 1000);
> +	if (ret) {
> +		dev_err(dev, "PHY calibration timeout\n");
> +		return ret;
> +	}
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | REN_CMD_EN | PU_CMD_EN, ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_2);
> +	writel(val | REN_STRB, ax_phy->reg_base + PHY_CTRL_2);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | MAX_CLK_BUF0 | MAX_CLK_BUF1 | MAX_CLK_BUF2,
> +	       ax_phy->reg_base + PHY_CTRL_3);
> +
> +	writel(CLK_MULTIPLIER, ax_phy->reg_base + CAP_REG_IN_S1_MSB);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | SEL_DLY_RXCLK | SEL_DLY_TXCLK,
> +	       ax_phy->reg_base + PHY_CTRL_3);
> +
> +	return 0;
> +}
> +
> +static int axiado_emmc_phy_power_on(struct phy *phy)
> +{
> +	struct axiado_emmc_phy *ax_phy = phy_get_drvdata(phy);
> +	struct device *dev = ax_phy->dev;
> +	u32 val;
> +	int ret;
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | RETB_ENBL, ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | PDB_ENBL, ax_phy->reg_base + PHY_CTRL_3);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_2);
> +	writel(val | OTAP_SEL(OTAP_DLY), ax_phy->reg_base + PHY_CTRL_2);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_1);
> +	writel(val | DLL_TRM(DLL_TRM_ICP), ax_phy->reg_base + PHY_CTRL_1);
> +
> +	val = readl(ax_phy->reg_base + PHY_CTRL_3);
> +	writel(val | DLL_FRQSEL(FRQ_SEL), ax_phy->reg_base + PHY_CTRL_3);
> +
> +	ret = read_poll_timeout(readl, val, val & DLL_RDY_MASK, POLL_DELAY_US,
> +				POLL_TIMEOUT_MS * 1000, false,
> +				ax_phy->reg_base + STATUS);
> +	if (ret) {
> +		dev_err(dev, "DLL ready timeout\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops axiado_emmc_phy_ops = {
> +	.init = axiado_emmc_phy_init,
> +	.power_on = axiado_emmc_phy_power_on,

no power_off?

-- 
~Vinod

