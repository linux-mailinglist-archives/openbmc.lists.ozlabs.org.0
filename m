Return-Path: <openbmc+bounces-603-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B2BB4816B
	for <lists+openbmc@lfdr.de>; Mon,  8 Sep 2025 02:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKnDd4jfRz2ytV;
	Mon,  8 Sep 2025 10:01:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757054654;
	cv=none; b=f1X3gFJazBO+mqP8r7ujqBRr3r0llJcTHNgAg0PvlJ1EkfDTfD/KnKyMSo5NQnkl0OjrwOxhRmpwrSNMeFNQQmOiwgtCEaNypq7KJXLIhZKC5fabh8Mf4KGUziWvqIU6vJhY2MXS3mLpKdDe1qfIMv3p4iYYkybzYslBDJSqrNTHmNrLZGcgARo4usB6bXTerOOTwyfUcq4nfvOqNgOvdDABlYUlLjbJvdt4APPlfb+XVQMXo2929KFefzECwBJpjpRvwOCWOfKKhfubo8vBwrx6TUY2EEv8iYh/RrdAtvF6y6OOVRfX0QM78fSpLcxt1HiUUG3ujUhqtRWC7zCASA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757054654; c=relaxed/relaxed;
	bh=hVdhS2d4X4//Z9WWP7hiG472tgg0L/pkgJtb6hOtGQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRQrewPGjcjKhBbTxkfOJHfpAqkYOArNSw7CwOC6+Niy7oyYWCNT0Jl3GvcPr7DbWHzk4k7obC3o4r29wDYLl6biRMu9+aF+7OY1JLMP4L8q+/I3DKVeENqx3UaCJzfhw5+KnoBV0GPBrwbqmi4iiKqEYgsQJ9VNPYhEuMxpg/v4osoHNaubltOXeNqH6c+WbpyUuYTrhv6eMxC/zslG7Gyz3wmlhVLPlfbi4UaeRrQnFrXUTdwNpclA+O8V1RJP4gE4v2Hm4doRVYLw+ZBaaPP38E9xc6NEh2cQqroFQ9IF5gM52N1D16S2BdgaffXl/iOBJ7hezRBAt2EhYZZXPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y2X9Ks2g; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y2X9Ks2g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ6JY2wcxz2yrq;
	Fri,  5 Sep 2025 16:44:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7914043E7F;
	Fri,  5 Sep 2025 06:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74712C4CEF1;
	Fri,  5 Sep 2025 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757054651;
	bh=UfhxzCMfcvQlEmL2GoSRyI5HMFwoZ9GqpOZ+vPyHLAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2X9Ks2gYu53TUSjcASGwp/amC/vnv8ma7hr0CaXVALfW/q1HxD4JCW474IiClQm+
	 lbdhrKOCU2EdWLq+SkC2XKXIdJYVqivIi4OUlryJNOuY/K/uXQXGf3iARLtL7s/Nhd
	 /r/AIvCU6ZIukivIL25XfZzwF+yBd9CUgVatLw3dILKuB1qUwG3+FE2GzznfsD/vBp
	 Z1tkDt8VopE44KhfqvhxYokr+FVN4R0nQXna7KVPuHFy0w7y2o0SkAxUD1dwjnmDcn
	 qyR7C3Ylr1vx9YxSe0M+UGqXysZb76XpyKaQflyU/lho3r8434Lu0MtYNRO+eOQ/J9
	 UmZa3icor2+Eg==
Date: Fri, 5 Sep 2025 12:14:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <v2q4ombbc7eaaybd6vt3ok3jeoiscr2bcvnooeluituszhxp3u@stj74x5wyknr>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
 <20250901055922.1553550-10-jacky_chou@aspeedtech.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901055922.1553550-10-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 01:59:21PM GMT, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/pci/controller/Kconfig       |   16 +
>  drivers/pci/controller/Makefile      |    1 +
>  drivers/pci/controller/pcie-aspeed.c | 1137 ++++++++++++++++++++++++++
>  3 files changed, 1154 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-aspeed.c
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 41748d083b93..bd0fb96f9dbd 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -58,6 +58,22 @@ config PCI_VERSATILE
>  	bool "ARM Versatile PB PCI controller"
>  	depends on ARCH_VERSATILE || COMPILE_TEST
>  
> +config PCIE_ASPEED
> +	bool "ASPEED PCIe controller"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on OF
> +	depends on PCI_MSI
> +	select IRQ_MSI_LIB
> +	help
> +	  Enable this option to add support for the PCIe controller

s/add support for/support

> +	  found on ASPEED SoCs.
> +
> +	  This driver provides initialization and management for PCIe
> +	  Root Complex functionality, including interrupt and MSI support.
> +
> +	  Select Y if your platform uses an ASPEED SoC and requires PCIe
> +	  connectivity.
> +
>  config PCIE_BRCMSTB
>  	tristate "Broadcom Brcmstb PCIe controller"
>  	depends on ARCH_BRCMSTB || ARCH_BCM2835 || ARCH_BCMBCA || \
> diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
> index 038ccbd9e3ba..1339f88e153d 100644
> --- a/drivers/pci/controller/Makefile
> +++ b/drivers/pci/controller/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_PCI_LOONGSON) += pci-loongson.o
>  obj-$(CONFIG_PCIE_HISI_ERR) += pcie-hisi-error.o
>  obj-$(CONFIG_PCIE_APPLE) += pcie-apple.o
>  obj-$(CONFIG_PCIE_MT7621) += pcie-mt7621.o
> +obj-$(CONFIG_PCIE_ASPEED) += pcie-aspeed.o
>  
>  # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
>  obj-y				+= dwc/
> diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
> new file mode 100644
> index 000000000000..3f684c09aa6c
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-aspeed.c
> @@ -0,0 +1,1137 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 Aspeed Technology Inc.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqchip/irq-msi-lib.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_pci.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/phy/pcie.h>
> +#include <linux/phy/phy.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include "../pci.h"
> +
> +#define MAX_MSI_HOST_IRQS	64
> +#define ASPEED_RESET_CONFIG_RC_WAIT_MS	10
> +
> +/* AST2600 AHBC Registers */

Prefix all ASPEED register definitions with ASPEED_

> +#define AHBC_KEY		0x00
> +#define  AHBC_UNLOCK_KEY		0xaeed1a03
> +#define  AHBC_UNLOCK			0x01
> +#define AHBC_ADDR_MAPPING	0x8c
> +#define  PCIE_RC_MEMORY_EN		BIT(5)
> +
> +/* AST2600 H2X Controller Registers */
> +#define H2X_INT_STS		0x08
> +#define  PCIE_TX_IDLE_CLEAR		BIT(0)
> +#define  PCIE_INTX_STS			GENMASK(3, 0)
> +#define H2X_TX_DESC0		0x10
> +#define H2X_TX_DESC1		0x14
> +#define H2X_TX_DESC2		0x18
> +#define H2X_TX_DESC3		0x1c
> +#define H2X_TX_DESC_DATA	0x20
> +#define H2X_STS			0x24
> +#define  PCIE_TX_IDLE			BIT(31)
> +#define  PCIE_STATUS_OF_TX		GENMASK(25, 24)
> +#define	 PCIE_RC_L_TX_COMPLETE		BIT(24)
> +#define	 PCIE_RC_H_TX_COMPLETE		BIT(25)
> +#define  PCIE_TRIGGER_TX		BIT(0)
> +#define H2X_AHB_ADDR_CONFIG0	0x60
> +#define  AHB_REMAP_LO_ADDR(x)		FIELD_PREP(GENMASK(15, 4), x)
> +#define  AHB_MASK_LO_ADDR(x)		FIELD_PREP(GENMASK(31, 20), x)
> +#define H2X_AHB_ADDR_CONFIG1	0x64
> +#define  AHB_REMAP_HI_ADDR(x)		(x)
> +#define H2X_AHB_ADDR_CONFIG2	0x68
> +#define  AHB_MASK_HI_ADDR(x)		(x)
> +#define H2X_DEV_CTRL		0xc0
> +#define  PCIE_RX_DMA_EN			BIT(9)
> +#define  PCIE_RX_LINEAR			BIT(8)
> +#define  PCIE_RX_MSI_SEL		BIT(7)
> +#define  PCIE_RX_MSI_EN			BIT(6)
> +#define  PCIE_UNLOCK_RX_BUFF		BIT(4)
> +#define  PCIE_WAIT_RX_TLP_CLR		BIT(2)
> +#define  PCIE_RC_RX_ENABLE		BIT(1)
> +#define  PCIE_RC_ENABLE			BIT(0)
> +#define H2X_DEV_STS		0xc8
> +#define  PCIE_RC_RX_DONE_ISR		BIT(4)
> +#define H2X_DEV_RX_DESC_DATA	0xcc
> +#define H2X_DEV_RX_DESC1	0xd4
> +#define H2X_DEV_TX_TAG		0xfc
> +
> +/* AST2700 H2X */
> +#define H2X_CTRL		0x00
> +#define  H2X_BRIDGE_EN			BIT(0)
> +#define  H2X_BRIDGE_DIRECT_EN		BIT(1)
> +#define H2X_CFGE_INT_STS	0x08
> +#define  CFGE_TX_IDLE			BIT(0)
> +#define  CFGE_RX_BUSY			BIT(1)
> +#define H2X_CFGI_TLP		0x20
> +#define  CFGI_BYTE_EN_MASK		GENMASK(19, 16)
> +#define  CFGI_BYTE_EN(x)		FIELD_PREP(CFGI_BYTE_EN_MASK, (x))
> +#define H2X_CFGI_WR_DATA	0x24
> +#define  CFGI_WRITE			BIT(20)
> +#define H2X_CFGI_CTRL		0x28
> +#define  CFGI_TLP_FIRE			BIT(0)
> +#define H2X_CFGI_RET_DATA	0x2c
> +#define H2X_CFGE_TLP_1ST	0x30
> +#define H2X_CFGE_TLP_NEXT	0x34
> +#define H2X_CFGE_CTRL		0x38
> +#define  CFGE_TLP_FIRE			BIT(0)
> +#define H2X_CFGE_RET_DATA	0x3c
> +#define H2X_REMAP_PREF_ADDR	0x70
> +#define  REMAP_PREF_ADDR_63_32(x)	(x)
> +#define H2X_REMAP_DIRECT_ADDR	0x78
> +#define  REMAP_BAR_BASE(x)		(x)
> +
> +/* AST2700 SCU */
> +#define SCU_60			0x60
> +#define  RC_E2M_PATH_EN			BIT(0)
> +#define  RC_H2XS_PATH_EN		BIT(16)
> +#define  RC_H2XD_PATH_EN		BIT(17)
> +#define  RC_H2XX_PATH_EN		BIT(18)
> +#define  RC_UPSTREAM_MEM_EN		BIT(19)
> +#define SCU_64			0x64
> +#define  RC0_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define  RC0_DECODE_DMA_LIMIT(x)	FIELD_PREP(GENMASK(15, 8), x)
> +#define  RC1_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define  RC1_DECODE_DMA_LIMIT(x)	FIELD_PREP(GENMASK(31, 24), x)
> +#define SCU_70			0x70
> +#define  DISABLE_EP_FUNC		0
> +
> +/* Macro to combine Fmt and Type into the 8-bit field */
> +#define ASPEED_TLP_FMT_TYPE(fmt, type)	(((fmt) << 5) | ((type) & 0x1F))

lowercase for hex

Don't you need to mask 'fmt' with 0x7?

> +#define ASPEED_TLP_COMMON_FIELDS	GENMASK(31, 24)
> +
> +/* TLP configuration type 0 and type 1 */
> +#define CRG0_READ_FMTTYPE                                        \
> +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                     \
> +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_NO_DATA, \
> +				       PCIE_TLP_TYPE_CFG0_RD))
> +#define CRG0_WRITE_FMTTYPE                                    \
> +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                  \
> +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_DATA, \
> +				       PCIE_TLP_TYPE_CFG0_WR))
> +#define CRG1_READ_FMTTYPE                                        \
> +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                     \
> +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_NO_DATA, \
> +				       PCIE_TLP_TYPE_CFG1_RD))
> +#define CRG1_WRITE_FMTTYPE                                    \
> +	FIELD_PREP(ASPEED_TLP_COMMON_FIELDS,                  \
> +		   ASPEED_TLP_FMT_TYPE(PCIE_TLP_FMT_3DW_DATA, \
> +				       PCIE_TLP_TYPE_CFG1_WR))
> +#define CRG_PAYLOAD_SIZE		0x01 /* 1 DWORD */
> +#define TLP_HEADER_BYTE_EN(x, y)	((GENMASK((x) - 1, 0) << ((y) % 4)))
> +#define TLP_GET_VALUE(x, y, z)	\
> +	(((x) >> ((((z) % 4)) * 8)) & GENMASK((8 * (y)) - 1, 0))
> +#define TLP_SET_VALUE(x, y, z)	\
> +	((((x) & GENMASK((8 * (y)) - 1, 0)) << ((((z) % 4)) * 8)))
> +#define AST2600_TX_DESC1_VALUE		0x00002000
> +#define AST2700_TX_DESC1_VALUE		0x00401000
> +
> +/**
> + * struct aspeed_pcie_port - PCIe port information
> + * @list: port list
> + * @pcie: pointer to PCIe host info
> + * @clk: pointer to the port clock gate
> + * @phy: pointer to PCIe PHY
> + * @perst: pointer to port reset control
> + * @slot: port slot
> + */
> +struct aspeed_pcie_port {
> +	struct list_head list;
> +	struct aspeed_pcie *pcie;
> +	struct clk *clk;
> +	struct phy *phy;
> +	struct reset_control *perst;
> +	u32 slot;
> +};
> +
> +/**
> + * struct aspeed_pcie - PCIe RC information
> + * @host: pointer to PCIe host bridge
> + * @dev: pointer to device structure
> + * @reg: PCIe host register base address
> + * @ahbc: pointer to AHHC register map
> + * @cfg: pointer to Aspeed PCIe configuration register map
> + * @platform: platform specific information
> + * @ports: list of PCIe ports
> + * @domain: PCI domain number
> + * @tx_tag: current TX tag for the port
> + * @host_bus_num: bus number of the host bridge
> + * @h2xrst: pointer to H2X reset control
> + * @intx_domain: IRQ domain for INTx interrupts
> + * @msi_domain: IRQ domain for MSI interrupts
> + * @lock: mutex to protect MSI bitmap variable
> + * @msi_irq_in_use: bitmap to track used MSI host IRQs
> + */
> +struct aspeed_pcie {
> +	struct pci_host_bridge *host;
> +	struct device *dev;
> +	void __iomem *reg;
> +	struct regmap *ahbc;
> +	struct regmap *cfg;
> +	const struct aspeed_pcie_rc_platform *platform;
> +	struct list_head ports;
> +
> +	int domain;
> +	u8 tx_tag;
> +	int host_bus_num;
> +
> +	struct reset_control *h2xrst;
> +
> +	struct irq_domain *intx_domain;
> +	struct irq_domain *msi_domain;
> +	struct mutex lock;		/* Protect MSI bitmap variable */

No need of this comment since kernel doc is present

> +	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_HOST_IRQS);
> +};
> +
> +/**
> + * struct aspeed_pcie_rc_platform - Platform information
> + * @setup: initialization function
> + * @reg_intx_en: INTx enable register offset
> + * @reg_intx_sts: INTx status register offset
> + * @reg_msi_en: MSI enable register offset
> + * @reg_msi_sts: MSI enable register offset
> + * @msi_address: HW fixed MSI address
> + */
> +struct aspeed_pcie_rc_platform {
> +	int (*setup)(struct platform_device *pdev);
> +	int reg_intx_en;
> +	int reg_intx_sts;
> +	int reg_msi_en;
> +	int reg_msi_sts;
> +	int msi_address;
> +};
> +
> +static void aspeed_pcie_intx_irq_ack(struct irq_data *d)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
> +	int intx_en = pcie->platform->reg_intx_en;
> +	u32 en;
> +
> +	en = readl(pcie->reg + intx_en);

You can safely use readl_relaxed and writel_relaxed variants throughout this
driver. Only in places where strict ordering is requried, you should use
readl/writel.

> +	en |= BIT(d->hwirq);
> +	writel(en, pcie->reg + intx_en);
> +}
> +
> +static void aspeed_pcie_intx_irq_mask(struct irq_data *d)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
> +	int intx_en = pcie->platform->reg_intx_en;
> +	u32 en;
> +
> +	en = readl(pcie->reg + intx_en);
> +	en &= ~BIT(d->hwirq);
> +	writel(en, pcie->reg + intx_en);
> +}
> +
> +static void aspeed_pcie_intx_irq_unmask(struct irq_data *d)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
> +	int intx_en = pcie->platform->reg_intx_en;
> +	u32 en;
> +
> +	en = readl(pcie->reg + intx_en);
> +	en |= BIT(d->hwirq);
> +	writel(en, pcie->reg + intx_en);
> +}
> +
> +static struct irq_chip aspeed_intx_irq_chip = {
> +	.name = "INTx",
> +	.irq_ack = aspeed_pcie_intx_irq_ack,
> +	.irq_mask = aspeed_pcie_intx_irq_mask,
> +	.irq_unmask = aspeed_pcie_intx_irq_unmask,
> +};
> +
> +static int aspeed_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
> +				irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler(irq, &aspeed_intx_irq_chip, handle_level_irq);
> +	irq_set_chip_data(irq, domain->host_data);
> +	irq_set_status_flags(irq, IRQ_LEVEL);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops aspeed_intx_domain_ops = {
> +	.map = aspeed_pcie_intx_map,
> +};
> +
> +static irqreturn_t aspeed_pcie_intr_handler(int irq, void *dev_id)
> +{
> +	struct aspeed_pcie *pcie = dev_id;
> +	const struct aspeed_pcie_rc_platform *platform = pcie->platform;
> +	unsigned long status;
> +	unsigned long intx;
> +	u32 bit;
> +	int i;
> +
> +	intx = FIELD_GET(PCIE_INTX_STS,
> +			 readl(pcie->reg + platform->reg_intx_sts));
> +	for_each_set_bit(bit, &intx, PCI_NUM_INTX)
> +		generic_handle_domain_irq(pcie->intx_domain, bit);
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {

This driver is depends on CONFIG_PCI_MSI.

> +		for (i = 0; i < 2; i++) {
> +			int msi_sts_reg = platform->reg_msi_sts + (i * 4);
> +
> +			status = readl(pcie->reg + msi_sts_reg);
> +			writel(status, pcie->reg + msi_sts_reg);
> +
> +			/*
> +			 * AST2700 A1 workaround:
> +			 * The MSI status needs to clear one more time.
> +			 */
> +			if (of_device_is_compatible(pcie->dev->of_node,
> +						    "aspeed,ast2700-pcie"))

Set a flag in the drvdata and use it to clear the register. This will make it
easy to add more quirks in the future.

> +				writel(status, pcie->reg + msi_sts_reg);
> +
> +			for_each_set_bit(bit, &status, 32) {
> +				bit += (i * 32);
> +				generic_handle_domain_irq(pcie->msi_domain,
> +							  bit);
> +			}
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static u32 aspeed_pcie_get_bdf_offset(struct pci_bus *bus, unsigned int devfn,
> +				      int where)
> +{
> +	return ((bus->number) << 24) | (PCI_SLOT(devfn) << 19) |
> +		(PCI_FUNC(devfn) << 16) | (where & ~3);
> +}
> +
> +static int aspeed_ast2600_conf(struct pci_bus *bus, unsigned int devfn,
> +			       int where, int size, u32 *val, u32 fmt_type,
> +			       bool write)
> +{
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 bdf_offset, cfg_val, isr;
> +	int ret;
> +
> +	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> +
> +	/* Driver may set unlock RX buffer before triggering next TX config */
> +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	cfg_val = fmt_type | CRG_PAYLOAD_SIZE;
> +	writel(cfg_val, pcie->reg + H2X_TX_DESC0);
> +
> +	cfg_val = AST2600_TX_DESC1_VALUE |
> +		  FIELD_PREP(GENMASK(11, 8), pcie->tx_tag) |
> +		  TLP_HEADER_BYTE_EN(size, where);
> +	writel(cfg_val, pcie->reg + H2X_TX_DESC1);
> +
> +	writel(bdf_offset, pcie->reg + H2X_TX_DESC2);
> +	writel(0, pcie->reg + H2X_TX_DESC3);
> +	if (write)
> +		writel(TLP_SET_VALUE(*val, size, where),
> +		       pcie->reg + H2X_TX_DESC_DATA);
> +
> +	cfg_val = readl(pcie->reg + H2X_STS);
> +	cfg_val |= PCIE_TRIGGER_TX;
> +	writel(cfg_val, pcie->reg + H2X_STS);
> +
> +	ret = readl_poll_timeout(pcie->reg + H2X_STS, cfg_val,
> +				 (cfg_val & PCIE_TX_IDLE), 0, 50);
> +	if (ret) {
> +		dev_err(pcie->dev,
> +			"%04x:%02x:%02x.%d CR tx timeout sts: 0x%08x\n",
> +			pcie->domain, bus->number, PCI_SLOT(devfn),
> +			PCI_FUNC(devfn), cfg_val);
> +		ret = PCIBIOS_SET_FAILED;
> +		PCI_SET_ERROR_RESPONSE(val);
> +		goto out;
> +	}
> +
> +	cfg_val = readl(pcie->reg + H2X_INT_STS);
> +	cfg_val |= PCIE_TX_IDLE_CLEAR;
> +	writel(cfg_val, pcie->reg + H2X_INT_STS);
> +
> +	cfg_val = readl(pcie->reg + H2X_STS);
> +	switch (cfg_val & PCIE_STATUS_OF_TX) {
> +	case PCIE_RC_L_TX_COMPLETE:
> +	case PCIE_RC_H_TX_COMPLETE:
> +		ret = readl_poll_timeout(pcie->reg + H2X_DEV_STS, isr,
> +					 (isr & PCIE_RC_RX_DONE_ISR), 0, 50);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"%04x:%02x:%02x.%d CR rx timeout sts: 0x%08x\n",
> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), isr);
> +			ret = PCIBIOS_SET_FAILED;
> +			PCI_SET_ERROR_RESPONSE(val);
> +			goto out;
> +		}
> +		if (!write) {
> +			if (readl(pcie->reg + H2X_DEV_RX_DESC1) & BIT(13)) {
> +				ret = PCIBIOS_SET_FAILED;
> +				PCI_SET_ERROR_RESPONSE(val);
> +				goto out;
> +			} else {
> +				*val = readl(pcie->reg + H2X_DEV_RX_DESC_DATA);
> +			}
> +		}
> +		break;
> +	case PCIE_STATUS_OF_TX:
> +		ret = PCIBIOS_SET_FAILED;
> +		PCI_SET_ERROR_RESPONSE(val);
> +		goto out;
> +	default:
> +		*val = readl(pcie->reg + H2X_DEV_RX_DESC_DATA);
> +		break;
> +	}
> +
> +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	*val = TLP_GET_VALUE(*val, size, where);
> +
> +	ret = PCIBIOS_SUCCESSFUL;
> +out:
> +	writel(readl(pcie->reg + H2X_DEV_STS), pcie->reg + H2X_DEV_STS);
> +	pcie->tx_tag = (pcie->tx_tag + 1) % 0x8;
> +	return ret;
> +}
> +
> +static int aspeed_ast2600_rd_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 *val)
> +{
> +	int slot = PCI_SLOT(devfn);
> +
> +	/*
> +	 * AST2600 has only one host on dev 0 and one root port on dev

What do you mean by 'one host on dev 0'? Host bridge is not a PCI device, so you
cannot access it's registers using PCI accessors.

> +	 * 8 in root bus.
> +	 */
> +	if (slot != 0 && slot != 8)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	return aspeed_ast2600_conf(bus, devfn, where, size, val,
> +				   CRG0_READ_FMTTYPE, false);
> +}
> +
> +static int aspeed_ast2600_child_rd_conf(struct pci_bus *bus, unsigned int devfn,
> +					int where, int size, u32 *val)
> +{
> +	return aspeed_ast2600_conf(bus, devfn, where, size, val,
> +				   CRG1_READ_FMTTYPE, false);
> +}
> +
> +static int aspeed_ast2600_wr_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 val)
> +{
> +	int slot = PCI_SLOT(devfn);
> +
> +	/*
> +	 * AST2600 has only one host on dev 0 and one root port on dev

Same here.

> +	 * 8 in root bus.
> +	 */
> +	if (slot != 0 && slot != 8)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	return aspeed_ast2600_conf(bus, devfn, where, size, &val,
> +				   CRG0_WRITE_FMTTYPE, true);
> +}
> +
> +static int aspeed_ast2600_child_wr_conf(struct pci_bus *bus, unsigned int devfn,
> +					int where, int size, u32 val)
> +{
> +	return aspeed_ast2600_conf(bus, devfn, where, size, &val,
> +				   CRG1_WRITE_FMTTYPE, true);
> +}
> +
> +static int aspeed_ast2700_config(struct pci_bus *bus, unsigned int devfn,
> +				 int where, int size, u32 *val, bool write)
> +{
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 cfg_val;
> +
> +	cfg_val = CFGI_BYTE_EN(TLP_HEADER_BYTE_EN(size, where)) | (where & ~3);
> +	if (write)
> +		cfg_val |= CFGI_WRITE;
> +	writel(cfg_val, pcie->reg + H2X_CFGI_TLP);
> +
> +	writel(TLP_SET_VALUE(*val, size, where), pcie->reg + H2X_CFGI_WR_DATA);
> +	writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
> +	*val = readl(pcie->reg + H2X_CFGI_RET_DATA);
> +	*val = TLP_GET_VALUE(*val, size, where);
> +
> +	return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static int aspeed_ast2700_child_config(struct pci_bus *bus, unsigned int devfn,
> +				       int where, int size, u32 *val,
> +				       bool write)
> +{
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 bdf_offset, status, cfg_val;
> +	int ret;
> +
> +	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> +
> +	cfg_val = CRG_PAYLOAD_SIZE;
> +	if (write)
> +		cfg_val |= (bus->number == (pcie->host_bus_num + 1)) ?
> +				   CRG0_WRITE_FMTTYPE :
> +				   CRG1_WRITE_FMTTYPE;
> +	else
> +		cfg_val |= (bus->number == (pcie->host_bus_num + 1)) ?
> +				   CRG0_READ_FMTTYPE :
> +				   CRG1_READ_FMTTYPE;
> +	writel(cfg_val, pcie->reg + H2X_CFGE_TLP_1ST);
> +
> +	cfg_val = AST2700_TX_DESC1_VALUE |
> +		  FIELD_PREP(GENMASK(11, 8), pcie->tx_tag) |
> +		  TLP_HEADER_BYTE_EN(size, where);
> +	writel(cfg_val, pcie->reg + H2X_CFGE_TLP_NEXT);
> +
> +	writel(bdf_offset, pcie->reg + H2X_CFGE_TLP_NEXT);
> +	if (write)
> +		writel(TLP_SET_VALUE(*val, size, where),
> +		       pcie->reg + H2X_CFGE_TLP_NEXT);
> +	writel(CFGE_TX_IDLE | CFGE_RX_BUSY, pcie->reg + H2X_CFGE_INT_STS);
> +	writel(CFGE_TLP_FIRE, pcie->reg + H2X_CFGE_CTRL);
> +
> +	ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> +				 (status & CFGE_TX_IDLE), 0, 50);
> +	if (ret) {
> +		dev_err(pcie->dev,
> +			"%04x:%02x:%02x.%d CR tx timeout sts: 0x%08x\n",
> +			pcie->domain, bus->number, PCI_SLOT(devfn),
> +			PCI_FUNC(devfn), status);
> +		ret = PCIBIOS_SET_FAILED;
> +		PCI_SET_ERROR_RESPONSE(val);
> +		goto out;
> +	}
> +
> +	ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> +				 (status & CFGE_RX_BUSY), 0, 50);
> +	if (ret) {
> +		dev_err(pcie->dev,
> +			"%04x:%02x:%02x.%d CR rx timeoutsts: 0x%08x\n",
> +			pcie->domain, bus->number, PCI_SLOT(devfn),
> +			PCI_FUNC(devfn), status);
> +		ret = PCIBIOS_SET_FAILED;
> +		PCI_SET_ERROR_RESPONSE(val);
> +		goto out;
> +	}
> +	*val = readl(pcie->reg + H2X_CFGE_RET_DATA);
> +	*val = TLP_GET_VALUE(*val, size, where);
> +
> +	ret = PCIBIOS_SUCCESSFUL;
> +out:
> +	writel(status, pcie->reg + H2X_CFGE_INT_STS);
> +	pcie->tx_tag = (pcie->tx_tag + 1) % 0xf;
> +	return ret;
> +}
> +
> +static int aspeed_ast2700_rd_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 *val)
> +{
> +	/*
> +	 * AST2700 has only one root port on dev 0 in root bus.

AST2700 has only one Root Port on the root bus.

> +	 */
> +	if (devfn != 0)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	return aspeed_ast2700_config(bus, devfn, where, size, val, false);
> +}
> +
> +static int aspeed_ast2700_child_rd_conf(struct pci_bus *bus, unsigned int devfn,
> +					int where, int size, u32 *val)
> +{
> +	return aspeed_ast2700_child_config(bus, devfn, where, size, val, false);
> +}
> +
> +static int aspeed_ast2700_wr_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 val)
> +{
> +	/*
> +	 * AST2700 has only one root port on dev 0 in root bus.

Same as above.

> +	 */
> +	if (devfn != 0)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	return aspeed_ast2700_config(bus, devfn, where, size, &val, true);
> +}
> +
> +static int aspeed_ast2700_child_wr_conf(struct pci_bus *bus, unsigned int devfn,
> +					int where, int size, u32 val)
> +{
> +	return aspeed_ast2700_child_config(bus, devfn, where, size, &val, true);
> +}
> +
> +static struct pci_ops aspeed_ast2600_pcie_ops = {
> +	.read = aspeed_ast2600_rd_conf,
> +	.write = aspeed_ast2600_wr_conf,
> +};
> +
> +static struct pci_ops aspeed_ast2600_pcie_child_ops = {
> +	.read = aspeed_ast2600_child_rd_conf,
> +	.write = aspeed_ast2600_child_wr_conf,
> +};
> +
> +static struct pci_ops aspeed_ast2700_pcie_ops = {
> +	.read = aspeed_ast2700_rd_conf,
> +	.write = aspeed_ast2700_wr_conf,
> +};
> +
> +static struct pci_ops aspeed_ast2700_pcie_child_ops = {
> +	.read = aspeed_ast2700_child_rd_conf,
> +	.write = aspeed_ast2700_child_wr_conf,
> +};
> +
> +#ifdef CONFIG_PCI_MSI

As mentioned above, this guard is redundant.

> +static void aspeed_msi_compose_msi_msg(struct irq_data *data,
> +				       struct msi_msg *msg)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(data);
> +
> +	msg->address_hi = 0;
> +	msg->address_lo = pcie->platform->msi_address;
> +	msg->data = data->hwirq;
> +}
> +
> +static int aspeed_msi_set_affinity(struct irq_data *irq_data,
> +				   const struct cpumask *mask, bool force)
> +{
> +	return -EINVAL;
> +}
> +
> +static struct irq_chip aspeed_msi_bottom_irq_chip = {
> +	.name = "ASPEED MSI",
> +	.irq_compose_msi_msg = aspeed_msi_compose_msi_msg,
> +	.irq_set_affinity = aspeed_msi_set_affinity,

Since you have already set MSI_FLAG_NO_AFFINITY flag, this callback is not
needed.

> +};
> +
> +static int aspeed_irq_msi_domain_alloc(struct irq_domain *domain,
> +				       unsigned int virq, unsigned int nr_irqs,
> +				       void *args)
> +{
> +	struct aspeed_pcie *pcie = domain->host_data;
> +	int bit;
> +	int i;
> +
> +	guard(mutex)(&pcie->lock);
> +
> +	bit = bitmap_find_free_region(pcie->msi_irq_in_use, MAX_MSI_HOST_IRQS,
> +				      get_count_order(nr_irqs));
> +
> +	if (bit < 0)
> +		return -ENOSPC;
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irq_domain_set_info(domain, virq + i, bit + i,
> +				    &aspeed_msi_bottom_irq_chip,
> +				    domain->host_data, handle_simple_irq, NULL,
> +				    NULL);
> +	}
> +
> +	return 0;
> +}
> +
> +static void aspeed_irq_msi_domain_free(struct irq_domain *domain,
> +				       unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(data);
> +
> +	mutex_lock(&pcie->lock);

Use guard() throughout the driver.

> +
> +	bitmap_release_region(pcie->msi_irq_in_use, data->hwirq,
> +			      get_count_order(nr_irqs));
> +
> +	mutex_unlock(&pcie->lock);
> +}
> +
> +static const struct irq_domain_ops aspeed_msi_domain_ops = {
> +	.alloc = aspeed_irq_msi_domain_alloc,
> +	.free = aspeed_irq_msi_domain_free,
> +};
> +
> +#define ASPEED_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
> +				  MSI_FLAG_USE_DEF_CHIP_OPS	| \
> +				  MSI_FLAG_NO_AFFINITY)
> +
> +#define ASPEED_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK	| \
> +				   MSI_FLAG_MULTI_PCI_MSI	| \
> +				   MSI_FLAG_PCI_MSIX)
> +
> +static const struct msi_parent_ops aspeed_msi_parent_ops = {
> +	.required_flags		= ASPEED_MSI_FLAGS_REQUIRED,
> +	.supported_flags	= ASPEED_MSI_FLAGS_SUPPORTED,
> +	.bus_select_token	= DOMAIN_BUS_PCI_MSI,
> +	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
> +	.prefix			= "ASPEED-",
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};
> +
> +static int aspeed_pcie_msi_init(struct aspeed_pcie *pcie)
> +{
> +	int ret = 0;
> +
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_en);
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_en + 0x04);
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts);
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts + 0x04);
> +
> +	struct irq_domain_info info = {
> +		.fwnode		= dev_fwnode(pcie->dev),
> +		.ops		= &aspeed_msi_domain_ops,
> +		.host_data	= pcie,
> +		.size		= MAX_MSI_HOST_IRQS,
> +	};
> +
> +	pcie->msi_domain = msi_create_parent_irq_domain(&info,
> +							&aspeed_msi_parent_ops);
> +	if (!pcie->msi_domain)
> +		return dev_err_probe(pcie->dev, -ENOMEM,
> +				     "failed to create MSI domain\n");
> +
> +	return ret;

return 0;

> +}
> +
> +static void aspeed_pcie_msi_free(struct aspeed_pcie *pcie)
> +{
> +	if (pcie->msi_domain) {
> +		irq_domain_remove(pcie->msi_domain);
> +		pcie->msi_domain = NULL;
> +	}
> +}
> +#else
> +static int aspeed_pcie_msi_init(struct aspeed_pcie *pcie)
> +{
> +	return 0;
> +}
> +
> +static void aspeed_pcie_msi_free(struct aspeed_pcie *pcie) {}
> +#endif
> +
> +static void aspeed_pcie_irq_domain_free(void *d)
> +{
> +	struct aspeed_pcie *pcie = d;
> +
> +	if (pcie->intx_domain) {
> +		irq_domain_remove(pcie->intx_domain);
> +		pcie->intx_domain = NULL;
> +	}
> +	aspeed_pcie_msi_free(pcie);
> +}
> +
> +static int aspeed_pcie_init_irq_domain(struct aspeed_pcie *pcie)
> +{
> +	struct device *dev = pcie->dev;
> +	struct device_node *node = dev->of_node;
> +	struct device_node *pcie_intc_node;
> +	int ret;
> +
> +	pcie_intc_node = of_get_next_child(node, NULL);

You have two child nodes in DT. One for intc and another for PCI bridge. So
don't assume that the first will always be intc.

> +	if (!pcie_intc_node)
> +		return dev_err_probe(dev, -ENODEV, "No PCIe INTc node found\n");
> +
> +	pcie->intx_domain = irq_domain_add_linear(pcie_intc_node,
> +						  PCI_NUM_INTX,
> +						  &aspeed_intx_domain_ops,
> +						  pcie);
> +	of_node_put(pcie_intc_node);
> +	if (!pcie->intx_domain) {
> +		ret = dev_err_probe(dev, -ENOMEM,
> +				    "failed to get INTx IRQ domain\n");
> +		goto err;
> +	}
> +
> +	writel(0, pcie->reg + pcie->platform->reg_intx_en);
> +	writel(~0, pcie->reg + pcie->platform->reg_intx_sts);
> +
> +	ret = aspeed_pcie_msi_init(pcie);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +err:
> +	aspeed_pcie_irq_domain_free(pcie);
> +	return ret;
> +}
> +
> +static int aspeed_pcie_port_init(struct aspeed_pcie_port *port)
> +{
> +	struct aspeed_pcie *pcie = port->pcie;
> +	struct device *dev = pcie->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(port->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clk pcie%d\n",

"failed to set enable clock for slot (%d)"

Similarly below.

> +				     port->slot);
> +
> +	ret = phy_init(port->phy);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to initialize phy pcie%d\n",
> +				     port->slot);
> +
> +	ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set phy pcie%d\n", port->slot);
> +
> +	reset_control_deassert(port->perst);
> +	mdelay(PCIE_RESET_CONFIG_WAIT_MS);
> +
> +	return 0;
> +}
> +
> +static int aspeed_pcie_init_ports(struct aspeed_pcie *pcie)
> +{
> +	struct aspeed_pcie_port *port, *tmp;
> +	u8 num_enabled = 0;
> +
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
> +		int ret;
> +
> +		ret = aspeed_pcie_port_init(port);

Just combine parse and init in a single function. No need to split them.

> +		if (ret)
> +			list_del(&port->list);
> +		else
> +			num_enabled++;
> +	}
> +
> +	return (num_enabled > 0) ? 0 : -ENODEV;
> +}
> +
> +static void aspeed_host_reset(struct aspeed_pcie *pcie)
> +{
> +	reset_control_assert(pcie->h2xrst);
> +	mdelay(ASPEED_RESET_CONFIG_RC_WAIT_MS);

I think you need a better name for this define. 'CONFIG' sounds like it is
related to PCI config access, but I'm sure it is not.

> +	reset_control_deassert(pcie->h2xrst);
> +}
> +
> +static int aspeed_ast2600_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +
> +	if (pcie->host_bus_num != 0x80)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "The host bus must be 0x80\n");
> +
> +	pcie->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "aspeed,ahbc");
> +	if (IS_ERR(pcie->ahbc))
> +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
> +				     "failed to map ahbc base\n");
> +
> +	aspeed_host_reset(pcie);
> +
> +	regmap_write(pcie->ahbc, AHBC_KEY, AHBC_UNLOCK_KEY);
> +	regmap_update_bits(pcie->ahbc, AHBC_ADDR_MAPPING, PCIE_RC_MEMORY_EN,
> +			   PCIE_RC_MEMORY_EN);
> +	regmap_write(pcie->ahbc, AHBC_KEY, AHBC_UNLOCK);
> +
> +	writel(AHB_REMAP_LO_ADDR(0x600) | AHB_MASK_LO_ADDR(0xe00),
> +	       pcie->reg + H2X_AHB_ADDR_CONFIG0);

What are these addresses?

> +	writel(AHB_REMAP_HI_ADDR(0), pcie->reg + H2X_AHB_ADDR_CONFIG1);
> +	writel(AHB_MASK_HI_ADDR(~0), pcie->reg + H2X_AHB_ADDR_CONFIG2);
> +	writel(H2X_BRIDGE_EN, pcie->reg + H2X_CTRL);
> +
> +	writel(PCIE_RX_DMA_EN | PCIE_RX_LINEAR | PCIE_RX_MSI_SEL |
> +	       PCIE_RX_MSI_EN | PCIE_WAIT_RX_TLP_CLR |
> +	       PCIE_RC_RX_ENABLE | PCIE_RC_ENABLE,
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	writel(0x28, pcie->reg + H2X_DEV_TX_TAG);

Can't you add a definition for this magic value?

> +
> +	pcie->host->ops = &aspeed_ast2600_pcie_ops;
> +	pcie->host->child_ops = &aspeed_ast2600_pcie_child_ops;
> +
> +	return 0;
> +}
> +
> +static int aspeed_ast2700_bar_assign(struct aspeed_pcie *pcie)
> +{
> +	struct resource_entry *win, *tmp;
> +	struct pci_host_bridge *bridge = pcie->host;
> +
> +	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
> +		struct resource *res = win->res;
> +
> +		if (resource_type(res) == IORESOURCE_MEM &&
> +		    !(res->flags & IORESOURCE_MEM_64)) {
> +			writel(REMAP_BAR_BASE(res->start),
> +			       pcie->reg + H2X_REMAP_DIRECT_ADDR);

Could you elaborate what this setting is about? The function name suggests it is
'assigning BAR', but I don't think it is.

> +			return 0;
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int aspeed_ast2700_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +	int ret;
> +
> +	pcie->cfg = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						    "aspeed,pciecfg");
> +	if (IS_ERR(pcie->cfg))
> +		return dev_err_probe(dev, PTR_ERR(pcie->cfg),
> +				     "failed to map pciecfg base\n");

Unless the 'cfg' domain is outside PCI, you should map it in PCI node and use
directly here.

> +
> +	regmap_update_bits(pcie->cfg, SCU_60,
> +			   RC_E2M_PATH_EN | RC_H2XS_PATH_EN | RC_H2XD_PATH_EN |
> +			   RC_H2XX_PATH_EN | RC_UPSTREAM_MEM_EN,
> +			   RC_E2M_PATH_EN | RC_H2XS_PATH_EN | RC_H2XD_PATH_EN |
> +			   RC_H2XX_PATH_EN | RC_UPSTREAM_MEM_EN);
> +	regmap_write(pcie->cfg, SCU_64,
> +		     RC0_DECODE_DMA_BASE(0) | RC0_DECODE_DMA_LIMIT(0xff) |
> +		     RC1_DECODE_DMA_BASE(0) | RC1_DECODE_DMA_LIMIT(0xff));
> +	regmap_write(pcie->cfg, SCU_70, DISABLE_EP_FUNC);
> +
> +	aspeed_host_reset(pcie);
> +
> +	writel(0, pcie->reg + H2X_CTRL);
> +	writel(H2X_BRIDGE_EN | H2X_BRIDGE_DIRECT_EN, pcie->reg + H2X_CTRL);
> +
> +	ret = aspeed_ast2700_bar_assign(pcie);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assign BAR\n");
> +
> +	/* Prepare for 64-bit BAR pref */
> +	writel(REMAP_PREF_ADDR_63_32(0x3), pcie->reg + H2X_REMAP_PREF_ADDR);
> +
> +	pcie->host->ops = &aspeed_ast2700_pcie_ops;
> +	pcie->host->child_ops = &aspeed_ast2700_pcie_child_ops;
> +
> +	return 0;
> +}
> +

[...]

> +
> +	ret = aspeed_pcie_init_irq_domain(pcie);
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_add_action_or_reset(dev, aspeed_pcie_irq_domain_free, pcie);

Drop this and do the cleanup in err label. You also need to cleanup other
resources like PHY, PERST#.

> +	if (ret)
> +		return ret;
> +
> +	ret = devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHARED,
> +			       dev_name(dev), pcie);
> +	if (ret)
> +		return ret;
> +
> +	ret = pci_host_probe(host);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +const struct aspeed_pcie_rc_platform pcie_rc_ast2600 = {
> +	.setup = aspeed_ast2600_setup,
> +	.reg_intx_en = 0xc4,
> +	.reg_intx_sts = 0xc8,
> +	.reg_msi_en = 0xe0,
> +	.reg_msi_sts = 0xe8,
> +	.msi_address = 0x1e77005c,
> +};
> +
> +const struct aspeed_pcie_rc_platform pcie_rc_ast2700 = {
> +	.setup = aspeed_ast2700_setup,
> +	.reg_intx_en = 0x40,
> +	.reg_intx_sts = 0x48,
> +	.reg_msi_en = 0x50,
> +	.reg_msi_sts = 0x58,
> +	.msi_address = 0x000000f0,
> +};
> +
> +static const struct of_device_id aspeed_pcie_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-pcie", .data = &pcie_rc_ast2600 },
> +	{ .compatible = "aspeed,ast2700-pcie", .data = &pcie_rc_ast2700 },
> +	{}
> +};
> +
> +static struct platform_driver aspeed_pcie_driver = {
> +	.driver = {
> +		.name = "aspeed-pcie",
> +		.of_match_table = aspeed_pcie_of_match,

Missing 'suppress_bind_attrs' and .probe_type = PROBE_PREFER_ASYNCHRONOUS.

> +	},
> +	.probe = aspeed_pcie_probe,
> +};
> +
> +module_platform_driver(aspeed_pcie_driver);

builtint_platform_driver() since users are not supposed to unload this driver.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

