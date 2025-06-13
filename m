Return-Path: <openbmc+bounces-216-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB661AD992D
	for <lists+openbmc@lfdr.de>; Sat, 14 Jun 2025 02:42:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJyB46sFTz30WS;
	Sat, 14 Jun 2025 10:41:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749832122;
	cv=none; b=HugAwZpA7SUfZOSc9qpfVEBCAcia5M3REvlux+zeqo7//rHvDDJeehSN4Xc/Zr7LBeNTtX94OmMWdsMbOckYmXnuZbsieMBEVXi8vxpWZoKMF/Uedxob5ovcwiLpMrCt4dAMU2X0Z7uG4CQifgUi4WX9Xg42K8K2Jz1J8nt8Q5ILxlKQ5eQoMrhd+Z48JgUP/hsQDJBfxW1B5uumOBy3zDMJ/pil1CCoMqDAQcRbvqOjbUXCsCbStHcSHo7WYmumhhwpxCeVUcVo5t3Fw4IEG7HEQ/NlMWF7zBvZa4eeRtqqdkniNl17cVzuFtEW2Z/ld/moKujqO1mbja7/As0ZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749832122; c=relaxed/relaxed;
	bh=KXuUPiNs0jGlNzOvonoMKvNlBKQFOiQg6umENLL3PPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Az00o6ZFbAtm8QPPbIYE7N8je9GmxSzPad8Fa8RXNwvPNgr+vNWRcPnztVJRS99pLAzKHDN9r66ow4rYHn0WRK565YK2Kx30u683cnxLspZj3owi1pOgKBAlcx5RTYRLswpyQG4GmQZcNKex8byCp7iBWybOpHz+LMeJwdzd2GnQc/Re5IEnP349SCcU0LZnhj7EDW6zMwXDzUyzmiE1BCpwApltAks+lbcWZ6YCtI+OGsUyqJws2UyfArFZVRQalTMa8JUgOb958EVPdENOBLBUrzcjFyj+xIu0Efc+Wa9wtyD6eqwrliaozPeTu3zwCI22BCHdh3vmKOuUopPF7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MDCNr2Ck; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MDCNr2Ck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJlFj5xkcz2xBb;
	Sat, 14 Jun 2025 02:28:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B16849C7D;
	Fri, 13 Jun 2025 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09430C4CEE3;
	Fri, 13 Jun 2025 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749832119;
	bh=LfgLcCh/Rd/dyzbnkE69yjafGpQ8BEikgpj0nsy/XCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MDCNr2Cktn5UWbBuKG/DM68N1yt5sia4wH4cn7qMVp9Yc7/l+XfUUa+XzvUnh77x/
	 XBfmyi8zXzRdL1N9FHzRRKwv2rxfzileVZilD3BMkWF0wUWfNbigYIG10/C12C82j9
	 Vx0I21/NAmbOvLKbPxYxmHBiZfXLtu60E9HxeB8DmMMPsplrmC6u6LKhWSOMGdx8Io
	 ILd76j2aVcAdSEQ+zE6n/tmzVIIH4YaKVZpyNPBzpRgjaqVx+xXQs1cWSDsayIhCSI
	 4hyE1GHdvqaDjbltQRQEcNJC4qscGrioIMvXyUq0txuZSiSILBlg0c0BwavuXcmCkM
	 c6rhhz+T/uzkA==
Date: Fri, 13 Jun 2025 11:28:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com,
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
Message-ID: <20250613162837.GA962545@bhelgaas>
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
In-Reply-To: <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 13, 2025 at 11:30:01AM +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.

Make the subject match drivers/pci/controller/ style.

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

Alphabetize this entry by vendor to match the file.

Add blank line between paragraphs.

> + * Copyright 2025 Aspeed Technology Inc.

Settle on "ASPEED" or "Aspeed" in text/comment/etc to match corporate
style.  "aspeed" is good for the driver name, e.g., "PCI: aspeed: ..."
for the subject.

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

The trend is to alphabetize these #includes.

> +/* AST2600 PCIe Host Controller Registers */
> +#define PEHR_MISC_10		0x10
> +#define DATALINK_REPORT_CAPABLE		BIT(4)

Name register bits like these in a way that connects them with the
register.

> +static struct irq_chip aspeed_intx_irq_chip = {
> +	.name = "ASPEED:IntX",

Usual styling is "INTx".

> +	.irq_ack = aspeed_pcie_intx_ack_irq,
> +	.irq_mask = aspeed_pcie_intx_mask_irq,
> +	.irq_unmask = aspeed_pcie_intx_unmask_irq,

Name these functions to match the name of the function pointer, e.g.,
aspeed_pcie_intx_irq_ack() instead of aspeed_pcie_intx_ack_irq()
This makes grep/cscope more useful.

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
> +	if (intx) {

Don't need "if (intx)" here; the loop is sufficient.

> +		for_each_set_bit(bit, &intx, PCI_NUM_INTX)
> +			generic_handle_domain_irq(pcie->irq_domain, bit);
> +	}

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

s/buffere/buffer/

> +	writel(PCIE_UNLOCK_RX_BUFF | readl(pcie->reg + H2X_DEV_CTRL),
> +	       pcie->reg + H2X_DEV_CTRL);
> +
> +	if (bus->number == 128 && slot != 0 && slot != 8)
> +		return PCIBIOS_DEVICE_NOT_FOUND;
> +	type = (bus->number > 128);

Weird.  What's all this?  Some kind of device you want to hide?
Deserves a hint about what's special.

> +	if (ret) {
> +		dev_err(pcie->dev,
> +			"[%X:%02X:%02X.%02X]CR tx timeout sts: 0x%08x\n",

Conventional format is "%04x:%02x:%02x.%d" (4-digit domain, lower-case
hex).

> +			pcie->domain, bus->number, PCI_SLOT(devfn),
> +			PCI_FUNC(devfn), cfg_val);
> +		ret = PCIBIOS_SET_FAILED;
> +		*val = ~0;

PCI_SET_ERROR_RESPONSE(val)

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

s/buffere/buffer/

I don't understand this; I suppose it requires hardware knowledge.

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

You're not allowed to *read* bus 128, dev 1, but you can write it?

> +static void aspeed_pcie_port_init(struct aspeed_pcie *pcie)
> +{
> +	u32 link_sts = 0;
> +
> +	regmap_write(pcie->pciephy, PEHR_LOCK, PCIE_UNLOCK);
> +	regmap_write(pcie->pciephy, PEHR_GLOBAL, ROOT_COMPLEX_ID(0x3));
> +
> +	reset_control_deassert(pcie->perst);
> +	mdelay(500);

Where did this come from?  Should be a #define with reference to a
spec.

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

Source?

> +	reset_control_deassert(pcie->h2xrst);
> +
> +	regmap_write(pcie->pciephy, PEHR_MISC_5C, CONFIG_RC_DEVICE);
> +	regmap_read(pcie->pciephy, PEHR_MISC_60, &cfg_val);
> +	regmap_write(pcie->pciephy, PEHR_MISC_60,
> +		     (cfg_val & ~PORT_TPYE) | FIELD_PREP(PORT_TPYE, PORT_TYPE_ROOT));
> +
> +	writel(0, pcie->reg + H2X_CTRL);
> +	writel(H2X_BRIDGE_EN | H2X_BRIDGE_DIRECT_EN, pcie->reg + H2X_CTRL);
> +
> +	/* The BAR mapping:
> +	 * CPU Node0(domain 0): 0x60000000
> +	 * CPU Node1(domain 1): 0x80000000
> +	 * IO       (domain 2): 0xa0000000

Are these addresses or sizes?  Should they come from DT?  Maybe it's
something wired into the hardware?

> +	writel(REMAP_BAR_BASE(0x60000000 + (0x20000000 * pcie->domain)),
> +	       pcie->reg + H2X_REMAP_DIRECT_ADDR);
> +
> +	/* Prepare for 64-bit BAR pref */
> +	writel(REMAP_PREF_ADDR_63_32(0x3), pcie->reg + H2X_REMAP_PREF_ADDR);
> +
> +	reset_control_deassert(pcie->perst);
> +	mdelay(1000);

Source?

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

We need to observe PCIE_T_RRS_READY_MS (or
PCIE_RESET_CONFIG_DEVICE_WAIT_MS or whatever name we eventually settle
on) before pci_host_probe() starts issuing config reads.  Maybe this
is accounted for by one of the sleeps above, but we need a generic
#define that we can look for.

> +	ret = pci_host_probe(host);
> +	if (ret)
> +		goto err_clk_enable;
> +
> +	return 0;

Sorry, I see there's a lot of duplication with comments from other
reviewers :)

Bjorn

