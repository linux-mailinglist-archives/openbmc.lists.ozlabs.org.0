Return-Path: <openbmc+bounces-206-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75804AD8B8E
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 14:05:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJdPt5bCMz30Pg;
	Fri, 13 Jun 2025 22:05:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749816322;
	cv=none; b=mCJlB98hd1wEqTGyBJ48MQPbXni9NEeDB/4CHJn1aILLfsyGvFjTc96eQlAvxrvS6qxdKIAei3J5oCsjn4wRCvf098B/H5Kp6A/XJVjmGPsgISKuOJ1n2Lf9Gu07mj/9dj/7+4As6WhMTwsg701sWaY3ivwGtWFLKDFEKRMzUjA0a83fZG2cnLUGH+Xm6GHZamejoDyF1EYw+bgBCn7LbCwes7+e+a3bexI/USUhKQf6RhvRmPbqPr2i1rjpzntCxFMz+QxBaIxueEFZFQfyxAdzXdEMdhiFRtZlaVQLSOBH8O7598y6x/yJXOtJJ1HAqqRBXQUXVI1Mazlbj6VsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749816322; c=relaxed/relaxed;
	bh=asHUUyl3RO+q9fHjxVUuoJiLg85DsM8NYcc51jNB6Vk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Co/HkX15t59SjMbDdBno1lmmeIrkjyU09c51Uwp8JGz3raeoK5wPR/NKl+zUYXtJlM5DozHsAs7VqpmF8jlQghipASFZYgIukmUOoJ9nZIZyY6qzrvzPC+jzeru9m8FNOvpXp5TJ1eEDCipxKxznmoL1vuBiZYesbmfOO355F1ntGZEIdTGEjsEWB+AoXEQUxWqc/0uleWLrtfKk2c/7MuvS3Gj+Qd/w2AzE9jmEfextCMV7PKCfJ1MIEAxkNxWnui47tl779LUsIg/ykPU6BqvxteY9/AjxE6YKpDiblfrNlm0+R7VSjGmeO5Vpl4KgsgPujaUNU7Z9GaleCIT0zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GAB85NZ4; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GAB85NZ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 13 Jun 2025 22:05:18 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJdPp4vdhz30HB;
	Fri, 13 Jun 2025 22:05:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749816319; x=1781352319;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=neESV+jAJ44S4/uI8DS/EYdZM8vgcZu/imdfxefXFE4=;
  b=GAB85NZ4d8sk6i+MQJrH51FvYbMxQzQjEVg9cU2+kYvao/z75rez2ZEB
   Q0Dz8OjKr7r/U0pLJ8pM5qX0uS4IOP4kEGkNjKlr01UWpG1w9cIOHeboB
   0VQz+0dTZXqTeOxD03O18JTxHJS3UewZs7HZop75C+aeH/qSN2j5khLdj
   BrJO1ge4LjYs70zpJfI5ULWrbu+4Z2kAV6afVdJ3fpMY5kR4Yp5TO5gj4
   OleL9p4WV+7VAr1IPYpY6WKLMKh0apZwfg8yyCXeamzdJMvF/kCrs7LkV
   4hzYdbSRjBvhHOb6+Z/5ZtAXkBM2Jtq++bFVBT6o7YfYvmJPdmFEAdbzq
   w==;
X-CSE-ConnectionGUID: eWb15+oaS9qtgatcSBHKPw==
X-CSE-MsgGUID: Pq/7IIpJQQaBIoAHgW/CHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55827253"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="55827253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:04:08 -0700
X-CSE-ConnectionGUID: SbP1gSwLQ9erYKVhRwkzeA==
X-CSE-MsgGUID: Ke/fd2CMQKiBrNec6miUCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="147795208"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:03:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 15:03:55 +0300 (EEST)
To: Jacky Chou <jacky_chou@aspeedtech.com>
cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
    mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
    joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
    kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de, 
    linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-phy@lists.infradead.org, 
    openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, elbadrym@google.com, 
    romlem@google.com, anhphan@google.com, wak@google.com, 
    yuxiaozhang@google.com, BMC-SW@aspeedtech.com
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller
 driver
In-Reply-To: <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
Message-ID: <40d1c5bd-0457-55ea-2514-ba27e6a4c720@linux.intel.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 13 Jun 2025, Jacky Chou wrote:

> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/pci/controller/Kconfig       |   13 +
>  drivers/pci/controller/Makefile      |    1 +
>  drivers/pci/controller/pcie-aspeed.c | 1039 ++++++++++++++++++++++++++
>  3 files changed, 1053 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-aspeed.c
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 886f6f43a895..f6b5eea3b570 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -216,6 +216,19 @@ config PCIE_MT7621
>  	help
>  	  This selects a driver for the MediaTek MT7621 PCIe Controller.
>  
> +config PCIE_ASPEED
> +	bool "ASPEED PCIe controller"
> +	depends on PCI
> +	depends on OF || COMPILE_TEST
> +	select PCI_MSI_ARCH_FALLBACKS
> +	help
> +	  Enable this option to add support for the PCIe controller
> +	  found on ASPEED SoCs.
> +	  This driver provides initialization and management for PCIe
> +	  Root Complex functionality, including interrupt and MSI support.
> +	  Select Y if your platform uses an ASPEED SoC and requires PCIe
> +	  connectivity.
> +
>  config PCI_HYPERV_INTERFACE
>  	tristate "Microsoft Hyper-V PCI Interface"
>  	depends on ((X86 && X86_64) || ARM64) && HYPERV && PCI_MSI
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
> index 000000000000..c745684a7f9b
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-aspeed.c
> @@ -0,0 +1,1039 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 Aspeed Technology Inc.
> + */
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/kernel.h>
> +#include <linux/msi.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_pci.h>
> +#include <linux/pci.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/workqueue.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>

Please order alphabetically.

> +
> +#define MAX_MSI_HOST_IRQS	64
> +
> +/* AST2600 AHBC Registers */
> +#define AHBC_KEY		0x00
> +#define AHBC_UNLOCK_KEY			0xAEED1A03
> +#define AHBC_UNLOCK			0x01
> +#define AHBC_ADDR_MAPPING	0x8C
> +#define PCIE_RC_MEMORY_EN		BIT(5)

Add include for BIT()

> +
> +/* AST2600 PCIe Host Controller Registers */
> +#define PEHR_MISC_10		0x10
> +#define DATALINK_REPORT_CAPABLE		BIT(4)
> +#define PEHR_GLOBAL		0x30
> +#define RC_SYNC_RESET_DISABLE		BIT(20)
> +#define PCIE_RC_SLOT_ENABLE		BIT(1)
> +#define ROOT_COMPLEX_ID(x)		((x) << 4)

Add field define with GENMASK() and use FIELD_PREP() ?

> +#define PEHR_LOCK		0x7C
> +#define PCIE_UNLOCK			0xa8
> +#define PEHR_LINK		0xC0
> +#define PCIE_LINK_STS			BIT(5)
> +
> +/* AST2600 H2X Controller Registers */
> +/* Common Registers*/
> +#define H2X_INT_STS		0x08
> +#define PCIE_TX_IDLE_CLEAR		BIT(0)
> +#define H2X_TX_DESC0		0x10
> +#define H2X_TX_DESC1		0x14
> +#define H2X_TX_DESC2		0x18
> +#define H2X_TX_DESC3		0x1C
> +#define H2X_TX_DESC_DATA	0x20
> +#define H2X_STS			0x24
> +#define PCIE_TX_IDLE			BIT(31)
> +#define PCIE_STATUS_OF_TX		GENMASK(25, 24)
> +#define	PCIE_RC_L_TX_COMPLETE		BIT(24)
> +#define	PCIE_RC_H_TX_COMPLETE		BIT(25)
> +#define PCIE_TRIGGER_TX			BIT(0)
> +#define H2X_AHB_ADDR_CONFIG0	0x60
> +#define AHB_REMAP_ADDR_31_20(x)	FIELD_PREP(GENMASK(15, 4), x)
> +#define AHB_MASK_ADDR_31_20(x)	FIELD_PREP(GENMASK(31, 20), x)

It might make more sense to name these fields with defines and use 
FIELD_PREP at the calling site instead.

> +#define H2X_AHB_ADDR_CONFIG1	0x64
> +#define AHB_REMAP_ADDR_64_32(x)	(x)
> +#define H2X_AHB_ADDR_CONFIG2	0x68
> +#define AHB_MASK_ADDR_64_32(x)	(x)

ADd empty line.

> +/* Device Registers */
> +#define H2X_DEV_CTRL		0x00
> +#define PCIE_RX_DMA_EN			BIT(9)
> +#define PCIE_RX_LINEAR			BIT(8)
> +#define PCIE_RX_MSI_SEL			BIT(7)
> +#define PCIE_RX_MSI_EN			BIT(6)
> +#define PCIE_UNLOCK_RX_BUFF		BIT(4)
> +#define PCIE_Wait_RX_TLP_CLR		BIT(2)

WAIT

> +#define PCIE_RC_RX_ENABLE		BIT(1)
> +#define PCIE_RC_ENABLE			BIT(0)
> +#define H2X_DEV_STS		0x08
> +#define PCIE_RC_RX_DONE_ISR		BIT(4)
> +#define H2X_DEV_RX_DESC_DATA	0x0C
> +#define H2X_DEV_RX_DESC1	0x14
> +#define H2X_DEV_TX_TAG		0x3C
> +
> +/* AST2700 H2X */
> +#define H2X_CTRL		0x00
> +#define H2X_BRIDGE_EN			BIT(0)
> +#define H2X_BRIDGE_DIRECT_EN		BIT(1)
> +#define H2X_CFGE_INT_STS	0x08
> +#define CFGE_TX_IDLE			BIT(0)
> +#define CFGE_RX_BUSY			BIT(1)
> +#define H2X_CFGI_TLP		0x20
> +#define H2X_CFGI_WR_DATA	0x24
> +#define CFGI_WRITE			BIT(20)
> +#define H2X_CFGI_CTRL		0x28
> +#define CFGI_TLP_FIRE			BIT(0)
> +#define H2X_CFGI_RET_DATA	0x2C
> +#define H2X_CFGE_TLP_1ST	0x30
> +#define H2X_CFGE_TLP_NEXT	0x34
> +#define H2X_CFGE_CTRL		0x38
> +#define CFGE_TLP_FIRE			BIT(0)
> +#define H2X_CFGE_RET_DATA	0x3C
> +#define H2X_REMAP_PREF_ADDR	0x70
> +#define REMAP_PREF_ADDR_63_32(x)	(x)
> +#define H2X_REMAP_DIRECT_ADDR	0x78
> +#define REMAP_BAR_BASE(x)		(x)
> +
> +/* AST2700 PEHR */
> +#define PEHR_VID_DID		0x00
> +#define PEHR_MISC_58		0x58
> +#define LOCAL_SCALE_SUP			BIT(0)
> +#define PEHR_MISC_5C		0x5C
> +#define CONFIG_RC_DEVICE		BIT(30)
> +#define PEHR_MISC_60		0x60
> +#define PORT_TPYE			GENMASK(7, 4)
> +#define PORT_TYPE_ROOT			BIT(2)
> +#define PEHR_MISC_70		0x70
> +#define POSTED_DATA_CREDITS(x)		FIELD_PREP(GENMASK(15, 0), x)
> +#define POSTED_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
> +#define PEHR_MISC_78		0x78
> +#define COMPLETION_DATA_CREDITS(x)	FIELD_PREP(GENMASK(15, 0), x)
> +#define COMPLETION_HEADER_CREDITS(x)	FIELD_PREP(GENMASK(27, 16), x)
> +#define PEHR_MISC_300		0x300
> +#define CAPABILITY_GEN2		BIT(0)
> +#define PEHR_MISC_344		0x344
> +#define LINK_STATUS_GEN2		BIT(18)
> +#define PEHR_MISC_358		0x358
> +#define LINK_STATUS_GEN4		BIT(8)
> +
> +/* AST2700 SCU */
> +#define SCU_60			0x60
> +#define RC_E2M_PATH_EN			BIT(0)
> +#define RC_H2XS_PATH_EN			BIT(16)
> +#define RC_H2XD_PATH_EN			BIT(17)
> +#define RC_H2XX_PATH_EN			BIT(18)
> +#define RC_UPSTREAM_MEM_EN		BIT(19)
> +#define SCU_64			0x64
> +#define RC0_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(7, 0), x)
> +#define RC0_DECODE_DMA_LIMIT(x)		FIELD_PREP(GENMASK(15, 8), x)
> +#define RC1_DECODE_DMA_BASE(x)		FIELD_PREP(GENMASK(23, 16), x)
> +#define RC1_DECODE_DMA_LIMIT(x)		FIELD_PREP(GENMASK(31, 24), x)
> +#define SCU_70			0x70
> +#define DISABLE_EP_FUNC			0x0
> +
> +/* TLP configuration type 0 and type 1 */
> +#define CRG_READ_FMTTYPE(type)		(0x04000000 | (type << 24))
> +#define CRG_WRITE_FMTTYPE(type)		(0x44000000 | (type << 24))

These are straight from PCIe spec, right?

I think those should come from defines inside 
include/uapi/linux/pci_regs.h, there might not be one already, so you 
might have to add them.

I also think you should actually use the type as boolean, and return one 
of the two defines based on it. A helper to do that might be generic PCI 
header material as well.

> +#define CRG_PAYLOAD_SIZE		0x01 /* 1 DWORD */
> +#define TLP_COMP_STATUS(s)		(((s) >> 13) & 7)

Name the field if not yet done with a define and use FIELD_GET().

> +#define TLP_BYTE_EN(x)			(x)
> +#define AST2600_TX_DESC1_VALUE		0x00002000

Is this some flag, which should be using a named define instead of the 
literal?

> +#define AST2700_TX_DESC1_VALUE		0x00401000

Can this be constructed by ORing named defines together?

> +
> +struct aspeed_pcie_rc_platform {
> +	int (*setup)(struct platform_device *pdev);
> +	/* Interrupt Register Offset */
> +	int reg_intx_en;

Really? The variable ends with _en which is a short for "Enable" AFAICT 
but your comment talks nothing about "Enable"??

> +	int reg_intx_sts;
> +	int reg_msi_en;
> +	int reg_msi_sts;
> +};
> +
> +struct aspeed_pcie {
> +	struct pci_host_bridge *host;
> +	struct device *dev;
> +	void __iomem *reg;
> +	struct regmap *ahbc;
> +	struct regmap *cfg;
> +	struct regmap *pciephy;
> +	struct clk *clock;
> +	const struct aspeed_pcie_rc_platform *platform;
> +
> +	int domain;
> +	u32 msi_address;
> +	u8 tx_tag;
> +
> +	struct reset_control *h2xrst;
> +	struct reset_control *perst;
> +
> +	struct irq_domain *irq_domain;
> +	struct irq_domain *dev_domain;
> +	struct irq_domain *msi_domain;
> +	/* Protect bitmap variable */

Protects

Can you group them visually together using empty line before and removing 
the empty line in between them too.

> +	struct mutex lock;
> +
> +	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_HOST_IRQS);
> +};
> +
> +static void aspeed_pcie_intx_ack_irq(struct irq_data *d)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
> +	int intx_en = pcie->platform->reg_intx_en;
> +
> +	writel(readl(pcie->reg + intx_en) | BIT(d->hwirq), pcie->reg + intx_en);

Please split this kind of operations on 3 (or more) lines (there seem to 
be more below too):

	val = readl(...);
	val |= ...;
	writel();

It will be much easier to read that way. If you need more lines for logic, 
e.g., to clear the field first before ORing the new value in, don't 
hesitate to add them as needed.

(val is just a placeholder, you can pick better name for the variable 
where appropriate.)

> +}
> +
> +static void aspeed_pcie_intx_mask_irq(struct irq_data *d)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
> +	int intx_en = pcie->platform->reg_intx_en;
> +
> +	writel(readl(pcie->reg + intx_en) & ~BIT(d->hwirq), pcie->reg + intx_en);
> +}
> +
> +static void aspeed_pcie_intx_unmask_irq(struct irq_data *d)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(d);
> +	int intx_en = pcie->platform->reg_intx_en;
> +
> +	writel(readl(pcie->reg + intx_en) | BIT(d->hwirq), pcie->reg + intx_en);
> +}
> +
> +static struct irq_chip aspeed_intx_irq_chip = {
> +	.name = "ASPEED:IntX",
> +	.irq_ack = aspeed_pcie_intx_ack_irq,
> +	.irq_mask = aspeed_pcie_intx_mask_irq,
> +	.irq_unmask = aspeed_pcie_intx_unmask_irq,
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
> +	intx = readl(pcie->reg + platform->reg_intx_sts) & 0xf;

Use a named define for the field of interes instead of the literal.

> +	if (intx) {
> +		for_each_set_bit(bit, &intx, PCI_NUM_INTX)
> +			generic_handle_domain_irq(pcie->irq_domain, bit);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI)) {
> +		for (i = 0; i < 2; i++) {
> +			status = readl(pcie->reg + platform->reg_msi_sts + (i * 4));
> +			writel(status, pcie->reg + platform->reg_msi_sts + (i * 4));
> +
> +			for_each_set_bit(bit, &status, 32) {
> +				bit += (i * 32);
> +				generic_handle_domain_irq(pcie->dev_domain, bit);
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
> +static int aspeed_ast2600_rd_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 *val)
> +{
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 bdf_offset;
> +	int rx_done_fail = 0, slot = PCI_SLOT(devfn);
> +	u32 cfg_val, isr, type = 0;
> +	u32 link_sts = 0;
> +	int ret;
> +
> +	/* Driver may set unlock RX buffere before triggering next TX config */

buffer

> +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	if (bus->number == 128 && slot != 0 && slot != 8)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +	type = (bus->number > 128);
> +
> +	if (type) {
> +		regmap_read(pcie->pciephy, PEHR_LINK, &link_sts);
> +		if (!(link_sts & PCIE_LINK_STS))
> +			return PCIBIOS_DEVICE_NOT_FOUND;
> +	}
> +
> +	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> +
> +	regmap_write(pcie->cfg, H2X_TX_DESC0, CRG_READ_FMTTYPE(type) | CRG_PAYLOAD_SIZE);
> +	regmap_write(pcie->cfg, H2X_TX_DESC1,
> +		     AST2600_TX_DESC1_VALUE | (pcie->tx_tag << 8) | TLP_BYTE_EN(0xf));

Use FIELD_PREP() instead of the custom shifting. I strongly suggest you 
replace also that TLP_BYTE_EN() with FIELD_PREP() done here. If you feel 
need more space, you can first calculate the value into a local variable 
using a multiline construct:

	val = AST2600_TX_DESC1_VALUE | \
	      FIELD_PREP(..., pcie->tx_tag) | \
	      FIELD_PREP(...);

> +	regmap_write(pcie->cfg, H2X_TX_DESC2, bdf_offset);
> +	regmap_write(pcie->cfg, H2X_TX_DESC3, 0);
> +
> +	regmap_write_bits(pcie->cfg, H2X_STS, PCIE_TRIGGER_TX, PCIE_TRIGGER_TX);
> +
> +	ret = regmap_read_poll_timeout(pcie->cfg, H2X_STS, cfg_val,
> +				       (cfg_val & PCIE_TX_IDLE), 0, 50);
> +	if (ret) {
> +		dev_err(pcie->dev,
> +			"[%X:%02X:%02X.%02X]CR tx timeout sts: 0x%08x\n",
> +			pcie->domain, bus->number, PCI_SLOT(devfn),
> +			PCI_FUNC(devfn), cfg_val);
> +		ret = PCIBIOS_SET_FAILED;
> +		*val = ~0;

PCI_SET_ERROR_RESPONSE()

> +		goto out;
> +	}
> +
> +	regmap_write_bits(pcie->cfg, H2X_INT_STS, PCIE_TX_IDLE_CLEAR,
> +			  PCIE_TX_IDLE_CLEAR);
> +
> +	regmap_read(pcie->cfg, H2X_STS, &cfg_val);
> +	switch (cfg_val & PCIE_STATUS_OF_TX) {
> +	case PCIE_RC_L_TX_COMPLETE:
> +	case PCIE_RC_H_TX_COMPLETE:
> +		ret = readl_poll_timeout(pcie->reg + H2X_DEV_STS, isr,
> +					 (isr & PCIE_RC_RX_DONE_ISR), 0, 50);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"[%X:%02X:%02X.%02X]CR rx timeoutsts: 0x%08x\n",

Add space after ]

> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), isr);
> +			rx_done_fail = 1;
> +			*val = ~0;

PCI_SET_ERROR_RESPONSE()

> +		}
> +		if (!rx_done_fail) {
> +			if (readl(pcie->reg + H2X_DEV_RX_DESC1) & BIT(13))

Use a named define instead of BIT() literal.

> +				*val = ~0;

PCI_SET_ERROR_RESPONSE()

> +			else
> +				*val = readl(pcie->reg + H2X_DEV_RX_DESC_DATA);
> +		}
> +
> +		writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> +		       pcie->reg + H2X_DEV_CTRL);
> +		break;
> +	case PCIE_STATUS_OF_TX:
> +		*val = ~0;
> +		break;
> +	default:
> +		regmap_read(pcie->cfg, H2X_DEV_RX_DESC_DATA, &cfg_val);
> +		*val = cfg_val;
> +		break;
> +	}
> +
> +	switch (size) {
> +	case 1:
> +		*val = (*val >> ((where & 3) * 8)) & 0xff;
> +		break;
> +	case 2:
> +		*val = (*val >> ((where & 2) * 8)) & 0xffff;
> +		break;
> +	case 4:
> +	default:
> +		break;
> +	}
> +
> +	ret = PCIBIOS_SUCCESSFUL;
> +out:
> +	writel(readl(pcie->reg + H2X_DEV_STS), pcie->reg + H2X_DEV_STS);
> +	pcie->tx_tag = (pcie->tx_tag + 1) % 0x8;
> +	return ret;
> +}
> +
> +static int aspeed_ast2600_wr_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 val)
> +{
> +	u32 type = 0;
> +	u32 shift = 8 * (where & 3);
> +	u32 bdf_offset;
> +	u8 byte_en = 0;
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 isr, cfg_val;
> +	int ret;
> +
> +	/* Driver may set unlock RX buffere before triggering next TX config */

buffer

Many similar things in this function so please reflect my other comments 
to this.

> +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	switch (size) {
> +	case 1:
> +		byte_en = 1 << (where % 4);
> +		val = (val & 0xff) << shift;
> +		break;
> +	case 2:
> +		byte_en = 0x3 << (2 * ((where >> 1) % 2));
> +		val = (val & 0xffff) << shift;
> +		break;
> +	case 4:
> +	default:
> +		byte_en = 0xf;
> +		break;
> +	}
> +
> +	type = (bus->number > 128);
> +
> +	bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> +
> +	regmap_write(pcie->cfg, H2X_TX_DESC0, CRG_WRITE_FMTTYPE(type) | CRG_PAYLOAD_SIZE);
> +	regmap_write(pcie->cfg, H2X_TX_DESC1,
> +		     AST2600_TX_DESC1_VALUE | (pcie->tx_tag << 8) | TLP_BYTE_EN(byte_en));
> +	regmap_write(pcie->cfg, H2X_TX_DESC2, bdf_offset);
> +	regmap_write(pcie->cfg, H2X_TX_DESC3, 0);
> +	regmap_write(pcie->cfg, H2X_TX_DESC_DATA, val);
> +
> +	regmap_write_bits(pcie->cfg, H2X_STS, PCIE_TRIGGER_TX, PCIE_TRIGGER_TX);
> +
> +	ret = regmap_read_poll_timeout(pcie->cfg, H2X_STS, cfg_val,
> +				       (cfg_val & PCIE_TX_IDLE), 0, 50);
> +	if (ret) {
> +		dev_err(pcie->dev,
> +			"[%X:%02X:%02X.%02X]CT tx timeout sts: 0x%08x\n",
> +			pcie->domain, bus->number, PCI_SLOT(devfn),
> +			PCI_FUNC(devfn), cfg_val);
> +		ret = PCIBIOS_SET_FAILED;
> +		goto out;
> +	}
> +
> +	regmap_write_bits(pcie->cfg, H2X_INT_STS, PCIE_TX_IDLE_CLEAR,
> +			  PCIE_TX_IDLE_CLEAR);
> +
> +	regmap_read(pcie->cfg, H2X_STS, &cfg_val);
> +	switch (cfg_val & PCIE_STATUS_OF_TX) {
> +	case PCIE_RC_L_TX_COMPLETE:
> +	case PCIE_RC_H_TX_COMPLETE:
> +		ret = readl_poll_timeout(pcie->reg + H2X_DEV_STS, isr,
> +					 (isr & PCIE_RC_RX_DONE_ISR), 0, 50);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"[%X:%02X:%02X.%02X]CT rx timeout sts: 0x%08x\n",
> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), isr);
> +			ret = PCIBIOS_SET_FAILED;
> +			goto out;
> +		}
> +		break;
> +	}
> +
> +	ret = PCIBIOS_SUCCESSFUL;
> +out:
> +	writel(readl(pcie->reg + H2X_DEV_STS), pcie->reg + H2X_DEV_STS);
> +	pcie->tx_tag = (pcie->tx_tag + 1) % 0x8;
> +	return ret;
> +}
> +
> +static bool aspeed_ast2700_get_link(struct aspeed_pcie *pcie)
> +{
> +	u32 reg;
> +	bool link;
> +
> +	regmap_read(pcie->pciephy, PEHR_MISC_300, &reg);
> +	if (reg & CAPABILITY_GEN2) {
> +		regmap_read(pcie->pciephy, PEHR_MISC_344, &reg);
> +		link = !!(reg & LINK_STATUS_GEN2);
> +	} else {
> +		regmap_read(pcie->pciephy, PEHR_MISC_358, &reg);
> +		link = !!(reg & LINK_STATUS_GEN4);

While I don't entirely know the meaning of these bits, what if the link is 
not using maximum speed it is capable of, does this check misbehave?

> +	}
> +
> +	return link;
> +}
> +
> +static int aspeed_ast2700_rd_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 *val)
> +{
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 bdf_offset, status;
> +	u8 type;
> +	int ret;
> +
> +	if ((bus->number == 0 && devfn != 0))
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	if (bus->number == 0) {
> +		/* Internal access to bridge */
> +		writel(TLP_BYTE_EN(0xf) << 16 | (where & ~3), pcie->reg + H2X_CFGI_TLP);

FIELD_PREP()

> +		writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
> +		*val = readl(pcie->reg + H2X_CFGI_RET_DATA);
> +	} else {
> +		if (!aspeed_ast2700_get_link(pcie))
> +			return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +		bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> +
> +		type = (bus->number == 1) ? PCI_HEADER_TYPE_NORMAL : PCI_HEADER_TYPE_BRIDGE;
> +
> +		writel(CRG_READ_FMTTYPE(type) | CRG_PAYLOAD_SIZE, pcie->reg + H2X_CFGE_TLP_1ST);
> +		writel(AST2700_TX_DESC1_VALUE | (pcie->tx_tag << 8) | TLP_BYTE_EN(0xf),
> +		       pcie->reg + H2X_CFGE_TLP_NEXT);
> +		writel(bdf_offset, pcie->reg + H2X_CFGE_TLP_NEXT);
> +		writel(CFGE_TX_IDLE | CFGE_RX_BUSY, pcie->reg + H2X_CFGE_INT_STS);
> +		writel(CFGE_TLP_FIRE, pcie->reg + H2X_CFGE_CTRL);
> +
> +		ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> +					 (status & CFGE_TX_IDLE), 0, 50);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"[%X:%02X:%02X.%02X]CR tx timeout sts: 0x%08x\n",
> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), status);
> +			ret = PCIBIOS_SET_FAILED;
> +			*val = ~0;
> +			goto out;
> +		}
> +
> +		ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> +					 (status & CFGE_RX_BUSY), 0, 50000);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"[%X:%02X:%02X.%02X]CR rx timeoutsts: 0x%08x\n",
> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), status);
> +			ret = PCIBIOS_SET_FAILED;
> +			*val = ~0;
> +			goto out;
> +		}
> +		*val = readl(pcie->reg + H2X_CFGE_RET_DATA);
> +	}
> +
> +	switch (size) {
> +	case 1:
> +		*val = (*val >> ((where & 3) * 8)) & 0xff;
> +		break;
> +	case 2:
> +		*val = (*val >> ((where & 2) * 8)) & 0xffff;
> +		break;
> +	case 4:
> +	default:
> +		break;
> +	}
> +
> +	ret = PCIBIOS_SUCCESSFUL;
> +out:
> +	writel(status, pcie->reg + H2X_CFGE_INT_STS);
> +	pcie->tx_tag = (pcie->tx_tag + 1) % 0xF;
> +	return ret;
> +}

On a glance, this (& the wr func) looked very similar to the 2600 one on a 
glance, I didn't check it with diff how similar it really is.

If you need minor variation e.g. in some register value, you could add 
that into the struct pointed by .data. Then you can get it easily here 
using pcie->info->tx_desc_val without duplicating lots of code.

> +static int aspeed_ast2700_wr_conf(struct pci_bus *bus, unsigned int devfn,
> +				  int where, int size, u32 val)
> +{
> +	struct aspeed_pcie *pcie = bus->sysdata;
> +	u32 shift = 8 * (where & 3);
> +	u8 byte_en;
> +	u32 bdf_offset, status, type;
> +	int ret;
> +
> +	if ((bus->number == 0 && devfn != 0))
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +	switch (size) {
> +	case 1:
> +		byte_en = 1 << (where % 4);
> +		val = (val & 0xff) << shift;
> +		break;
> +	case 2:
> +		byte_en = 0x3 << (2 * ((where >> 1) % 2));
> +		val = (val & 0xffff) << shift;
> +		break;
> +	case 4:
> +	default:
> +		byte_en = 0xf;
> +		break;
> +	}
> +
> +	if (bus->number == 0) {
> +		/* Internal access to bridge */
> +		writel(CFGI_WRITE | TLP_BYTE_EN(byte_en) << 16 | (where & ~3),
> +		       pcie->reg + H2X_CFGI_TLP);
> +		writel(val, pcie->reg + H2X_CFGI_WR_DATA);
> +		writel(CFGI_TLP_FIRE, pcie->reg + H2X_CFGI_CTRL);
> +	} else {
> +		if (!aspeed_ast2700_get_link(pcie))
> +			return PCIBIOS_SET_FAILED;
> +
> +		bdf_offset = aspeed_pcie_get_bdf_offset(bus, devfn, where);
> +
> +		type = (bus->number == 1) ? PCI_HEADER_TYPE_NORMAL : PCI_HEADER_TYPE_BRIDGE;
> +
> +		writel(CRG_WRITE_FMTTYPE(type) | CRG_PAYLOAD_SIZE, pcie->reg + H2X_CFGE_TLP_1ST);
> +		writel(AST2700_TX_DESC1_VALUE | (pcie->tx_tag << 8) | byte_en,
> +		       pcie->reg + H2X_CFGE_TLP_NEXT);
> +		writel(bdf_offset, pcie->reg + H2X_CFGE_TLP_NEXT);
> +		writel(val, pcie->reg + H2X_CFGE_TLP_NEXT);
> +		writel(CFGE_TX_IDLE | CFGE_RX_BUSY, pcie->reg + H2X_CFGE_INT_STS);
> +		writel(CFGE_TLP_FIRE, pcie->reg + H2X_CFGE_CTRL);
> +
> +		ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> +					 (status & CFGE_TX_IDLE), 0, 50);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"[%X:%02X:%02X.%02X]CT tx timeout sts: 0x%08x\n",
> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), status);
> +			ret = PCIBIOS_SET_FAILED;
> +			goto out;
> +		}
> +
> +		ret = readl_poll_timeout(pcie->reg + H2X_CFGE_INT_STS, status,
> +					 (status & CFGE_RX_BUSY), 0, 50000);
> +		if (ret) {
> +			dev_err(pcie->dev,
> +				"[%X:%02X:%02X.%02X]CT rx timeout sts: 0x%08x\n",
> +				pcie->domain, bus->number, PCI_SLOT(devfn),
> +				PCI_FUNC(devfn), status);
> +			ret = PCIBIOS_SET_FAILED;
> +			goto out;
> +		}
> +
> +		(void)readl(pcie->reg + H2X_CFGE_RET_DATA);
> +	}
> +
> +	ret = PCIBIOS_SUCCESSFUL;
> +out:
> +	writel(status, pcie->reg + H2X_CFGE_INT_STS);
> +	pcie->tx_tag = (pcie->tx_tag + 1) % 0xF;
> +	return ret;
> +}
> +
> +static struct pci_ops aspeed_ast2600_pcie_ops = {
> +	.read = aspeed_ast2600_rd_conf,
> +	.write = aspeed_ast2600_wr_conf,
> +};
> +
> +static struct pci_ops aspeed_ast2700_pcie_ops = {
> +	.read = aspeed_ast2700_rd_conf,
> +	.write = aspeed_ast2700_wr_conf,
> +};
> +
> +#ifdef CONFIG_PCI_MSI
> +static void aspeed_msi_compose_msi_msg(struct irq_data *data,
> +				       struct msi_msg *msg)
> +{
> +	struct aspeed_pcie *pcie = irq_data_get_irq_chip_data(data);
> +
> +	msg->address_hi = 0;
> +	msg->address_lo = pcie->msi_address;
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
> +	mutex_lock(&pcie->lock);
> +
> +	bit = bitmap_find_free_region(pcie->msi_irq_in_use, MAX_MSI_HOST_IRQS,
> +				      get_count_order(nr_irqs));
> +
> +	mutex_unlock(&pcie->lock);
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
> +static struct irq_chip aspeed_msi_irq_chip = {
> +	.name = "PCIe MSI",
> +	.irq_enable = pci_msi_unmask_irq,
> +	.irq_disable = pci_msi_mask_irq,
> +	.irq_mask = pci_msi_mask_irq,
> +	.irq_unmask = pci_msi_unmask_irq,
> +};
> +
> +static struct msi_domain_info aspeed_msi_domain_info = {
> +	.flags = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> +		  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
> +	.chip = &aspeed_msi_irq_chip,
> +};
> +#endif
> +
> +static void aspeed_pcie_irq_domain_free(struct aspeed_pcie *pcie)
> +{
> +	if (pcie->irq_domain) {
> +		irq_domain_remove(pcie->irq_domain);
> +		pcie->irq_domain = NULL;
> +	}
> +#ifdef CONFIG_PCI_MSI
> +	if (pcie->msi_domain) {
> +		irq_domain_remove(pcie->msi_domain);
> +		pcie->msi_domain = NULL;
> +	}
> +
> +	if (pcie->dev_domain) {
> +		irq_domain_remove(pcie->dev_domain);
> +		pcie->dev_domain = NULL;
> +	}
> +#endif

Add aspeed_msi_init() and aspeed_msi_free() helpers inside the large 
#ifdef CONFIG_PCI_MSI block and make them empty on #else side so you don't 
need ifdeffery here at all but can just make one call.

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
> +	if (!pcie_intc_node)
> +		return dev_err_probe(dev, -ENODEV, "No PCIe Intc node found\n");
> +
> +	pcie->irq_domain =
> +		irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX, &aspeed_intx_domain_ops, pcie);
> +	of_node_put(pcie_intc_node);
> +	if (!pcie->irq_domain) {
> +		ret = dev_err_probe(dev, -ENOMEM, "failed to get an INTx IRQ domain\n");
> +		goto err;
> +	}
> +
> +	writel(0, pcie->reg + pcie->platform->reg_intx_en);
> +	writel(~0, pcie->reg + pcie->platform->reg_intx_sts);
> +
> +#ifdef CONFIG_PCI_MSI
> +	pcie->dev_domain =
> +		irq_domain_add_linear(NULL, MAX_MSI_HOST_IRQS, &aspeed_msi_domain_ops, pcie);
> +	if (!pcie->dev_domain) {
> +		ret = dev_err_probe(pcie->dev, -ENOMEM, "failed to create IRQ domain\n");
> +		goto err;
> +	}
> +
> +	pcie->msi_domain = pci_msi_create_irq_domain(dev_fwnode(pcie->dev), &aspeed_msi_domain_info,
> +						     pcie->dev_domain);
> +	if (!pcie->msi_domain) {
> +		ret = dev_err_probe(pcie->dev, -ENOMEM, "failed to create MSI domain\n");
> +		goto err;
> +	}
> +
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_en);
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_en + 0x04);
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts);
> +	writel(~0, pcie->reg + pcie->platform->reg_msi_sts + 0x04);
> +#endif

Ditto.

> +	return 0;
> +err:
> +	aspeed_pcie_irq_domain_free(pcie);
> +	return ret;
> +}
> +
> +static void aspeed_pcie_port_init(struct aspeed_pcie *pcie)
> +{
> +	u32 link_sts = 0;
> +
> +	regmap_write(pcie->pciephy, PEHR_LOCK, PCIE_UNLOCK);
> +	regmap_write(pcie->pciephy, PEHR_GLOBAL, ROOT_COMPLEX_ID(0x3));
> +
> +	reset_control_deassert(pcie->perst);
> +	mdelay(500);
> +
> +	writel(PCIE_RX_DMA_EN | PCIE_RX_LINEAR | PCIE_RX_MSI_SEL | PCIE_RX_MSI_EN |
> +	       PCIE_Wait_RX_TLP_CLR | PCIE_RC_RX_ENABLE | PCIE_RC_ENABLE,
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	writel(0x28, pcie->reg + H2X_DEV_TX_TAG);

A magic number?

> +
> +	regmap_read(pcie->pciephy, PEHR_LINK, &link_sts);
> +	if (link_sts & PCIE_LINK_STS)
> +		dev_info(pcie->dev, "PCIe Link UP");
> +	else
> +		dev_info(pcie->dev, "PCIe Link DOWN");

No info level prints like that, use _dbg level instead if you feel that 
is necessary information.

> +}
> +
> +static int aspeed_ast2600_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +
> +	pcie->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,ahbc");
> +	if (IS_ERR(pcie->ahbc))
> +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc), "failed to map ahbc base\n");
> +
> +	reset_control_assert(pcie->h2xrst);
> +	mdelay(5);
> +	reset_control_deassert(pcie->h2xrst);
> +
> +	regmap_write(pcie->ahbc, AHBC_KEY, AHBC_UNLOCK_KEY);
> +	regmap_update_bits(pcie->ahbc, AHBC_ADDR_MAPPING, PCIE_RC_MEMORY_EN, PCIE_RC_MEMORY_EN);
> +	regmap_write(pcie->ahbc, AHBC_KEY, AHBC_UNLOCK);
> +
> +	regmap_write(pcie->cfg, H2X_AHB_ADDR_CONFIG0,
> +		     AHB_REMAP_ADDR_31_20(0x600) | AHB_MASK_ADDR_31_20(0xE00));
> +	regmap_write(pcie->cfg, H2X_AHB_ADDR_CONFIG1, AHB_REMAP_ADDR_64_32(0));
> +	regmap_write(pcie->cfg, H2X_AHB_ADDR_CONFIG2, AHB_MASK_ADDR_64_32(~0));
> +
> +	regmap_write(pcie->cfg, H2X_CTRL, H2X_BRIDGE_EN);
> +
> +	aspeed_pcie_port_init(pcie);
> +
> +	pcie->host->ops = &aspeed_ast2600_pcie_ops;
> +
> +	return 0;
> +}
> +
> +static int aspeed_ast2700_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	u32 cfg_val;
> +
> +	reset_control_assert(pcie->perst);
> +
> +	regmap_write(pcie->pciephy, PEHR_MISC_70,
> +		     POSTED_DATA_CREDITS(0xc0) | POSTED_HEADER_CREDITS(0xa));
> +	regmap_write(pcie->pciephy, PEHR_MISC_78,
> +		     COMPLETION_DATA_CREDITS(0x30) | COMPLETION_HEADER_CREDITS(0x8));
> +	regmap_write(pcie->pciephy, PEHR_MISC_58, LOCAL_SCALE_SUP);
> +
> +	regmap_update_bits(pcie->cfg, SCU_60,
> +			   RC_E2M_PATH_EN | RC_H2XS_PATH_EN | RC_H2XD_PATH_EN | RC_H2XX_PATH_EN |
> +			   RC_UPSTREAM_MEM_EN,
> +			   RC_E2M_PATH_EN | RC_H2XS_PATH_EN | RC_H2XD_PATH_EN | RC_H2XX_PATH_EN |
> +			   RC_UPSTREAM_MEM_EN);
> +	regmap_write(pcie->cfg, SCU_64,
> +		     RC0_DECODE_DMA_BASE(0) | RC0_DECODE_DMA_LIMIT(0xFF) | RC1_DECODE_DMA_BASE(0) |
> +		     RC1_DECODE_DMA_LIMIT(0xFF));
> +	regmap_write(pcie->cfg, SCU_70, DISABLE_EP_FUNC);
> +
> +	reset_control_assert(pcie->h2xrst);
> +	mdelay(10);
> +	reset_control_deassert(pcie->h2xrst);
> +
> +	regmap_write(pcie->pciephy, PEHR_MISC_5C, CONFIG_RC_DEVICE);
> +	regmap_read(pcie->pciephy, PEHR_MISC_60, &cfg_val);
> +	regmap_write(pcie->pciephy, PEHR_MISC_60,
> +		     (cfg_val & ~PORT_TPYE) | FIELD_PREP(PORT_TPYE, PORT_TYPE_ROOT));

TYPE (typo)


Put the logic on separate lines before the write.

> +
> +	writel(0, pcie->reg + H2X_CTRL);
> +	writel(H2X_BRIDGE_EN | H2X_BRIDGE_DIRECT_EN, pcie->reg + H2X_CTRL);
> +
> +	/* The BAR mapping:
> +	 * CPU Node0(domain 0): 0x60000000
> +	 * CPU Node1(domain 1): 0x80000000
> +	 * IO       (domain 2): 0xa0000000
> +	 */
> +	writel(REMAP_BAR_BASE(0x60000000 + (0x20000000 * pcie->domain)),

Please name what is in the comment with defines and use the named defines 
in the code instead of the literals. Also consider using SZ_* for that 
size(?) (remember to add the include if using them).

> +	       pcie->reg + H2X_REMAP_DIRECT_ADDR);
> +
> +	/* Prepare for 64-bit BAR pref */
> +	writel(REMAP_PREF_ADDR_63_32(0x3), pcie->reg + H2X_REMAP_PREF_ADDR);
> +
> +	reset_control_deassert(pcie->perst);
> +	mdelay(1000);
> +
> +	pcie->host->ops = &aspeed_ast2700_pcie_ops;
> +
> +	if (aspeed_ast2700_get_link(pcie))
> +		dev_info(pcie->dev, "PCIe Link UP");
> +	else
> +		dev_info(pcie->dev, "PCIe Link DOWN");
> +
> +	return 0;
> +}
> +
> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct device_node *node = dev->of_node;
> +	const void *md = of_device_get_match_data(dev);
> +	int irq, ret;
> +
> +	if (!md)
> +		return -ENODEV;
> +
> +	host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> +	if (!host)
> +		return -ENOMEM;
> +
> +	pcie = pci_host_bridge_priv(host);
> +	pcie->dev = dev;
> +	pcie->tx_tag = 0;
> +	platform_set_drvdata(pdev, pcie);
> +
> +	pcie->platform = md;
> +	pcie->host = host;
> +
> +	pcie->reg = devm_platform_ioremap_resource(pdev, 0);
> +
> +	of_property_read_u32(node, "msi_address", &pcie->msi_address);
> +	of_property_read_u32(node, "linux,pci-domain", &pcie->domain);
> +
> +	pcie->cfg = syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,pciecfg");
> +	if (IS_ERR(pcie->cfg))
> +		return dev_err_probe(dev, PTR_ERR(pcie->cfg), "Failed to map pciecfg base\n");
> +
> +	pcie->pciephy = syscon_regmap_lookup_by_phandle(node, "aspeed,pciephy");
> +	if (IS_ERR(pcie->pciephy))
> +		return dev_err_probe(dev, PTR_ERR(pcie->pciephy), "Failed to map pciephy base\n");
> +
> +	pcie->h2xrst = devm_reset_control_get_exclusive(dev, "h2x");
> +	if (IS_ERR(pcie->h2xrst))
> +		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst), "Failed to get h2x reset\n");
> +
> +	pcie->perst = devm_reset_control_get_exclusive(dev, "perst");
> +	if (IS_ERR(pcie->perst))
> +		return dev_err_probe(dev, PTR_ERR(pcie->perst), "Failed to get perst reset\n");
> +
> +	ret = pcie->platform->setup(pdev);
> +	if (ret)
> +		goto err_setup;
> +
> +	host->sysdata = pcie;
> +
> +	ret = aspeed_pcie_init_irq_domain(pcie);
> +	if (ret)
> +		goto err_irq_init;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		goto err_irq;
> +
> +	ret = devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHARED, dev_name(dev),
> +			       pcie);
> +	if (ret)
> +		goto err_irq;
> +
> +	pcie->clock = clk_get(dev, NULL);
> +	if (IS_ERR(pcie->clock))
> +		goto err_clk;
> +	ret = clk_prepare_enable(pcie->clock);
> +	if (ret)
> +		goto err_clk_enable;
> +
> +	ret = pci_host_probe(host);
> +	if (ret)
> +		goto err_clk_enable;
> +
> +	return 0;
> +
> +err_clk_enable:
> +	clk_put(pcie->clock);
> +err_clk:
> +err_irq:

It would be better to name these on what is rolled back, not based on what 
failed.

> +	aspeed_pcie_irq_domain_free(pcie);
> +err_irq_init:
> +err_setup:

These should be removed and the goto replaced with direct return.

> +	return dev_err_probe(dev, ret, "Failed to setup PCIe RC\n");

Common printing is not well suited for the rollback path. It's not much 
value to print a generic message like that, instead print the more 
specific error before gotos.

> +}

Where's the mutex initialized??? Please use devm_mutex_init() and don't 
forget to check errors because devm can fail.

> +
> +static void aspeed_pcie_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +
> +	if (pcie->clock) {
> +		clk_disable_unprepare(pcie->clock);
> +		clk_put(pcie->clock);
> +	}
> +
> +	pci_stop_root_bus(pcie->host->bus);
> +	pci_remove_root_bus(pcie->host->bus);
> +	aspeed_pcie_irq_domain_free(pcie);
> +}
> +
> +static struct aspeed_pcie_rc_platform pcie_rc_ast2600 = {
> +	.setup = aspeed_ast2600_setup,
> +	.reg_intx_en = 0x04,
> +	.reg_intx_sts = 0x08,
> +	.reg_msi_en = 0x20,
> +	.reg_msi_sts = 0x28,
> +};
> +
> +static struct aspeed_pcie_rc_platform pcie_rc_ast2700 = {
> +	.setup = aspeed_ast2700_setup,
> +	.reg_intx_en = 0x40,
> +	.reg_intx_sts = 0x48,
> +	.reg_msi_en = 0x50,
> +	.reg_msi_sts = 0x58,
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
> +		.suppress_bind_attrs = true,
> +		.of_match_table = aspeed_pcie_of_match,
> +	},
> +	.probe = aspeed_pcie_probe,
> +	.remove = aspeed_pcie_remove,
> +};
> +
> +module_platform_driver(aspeed_pcie_driver);
> +
> +MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED PCIe Root Complex");
> +MODULE_LICENSE("GPL");
> 

-- 
 i.


