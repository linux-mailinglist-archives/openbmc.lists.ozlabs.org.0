Return-Path: <openbmc+bounces-586-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CB5B42D8D
	for <lists+openbmc@lfdr.de>; Thu,  4 Sep 2025 01:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHJzq6n2Dz2yrK;
	Thu,  4 Sep 2025 09:41:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756939705;
	cv=none; b=k1KcG9S+kCSBNvFX25LniTgrhrFU9dUuq4X0hbukBeBfF/9Cfkif+ciPUfGyvM8WGOlePfULM6Iku4dTQM6Cnx7uqPPqbzJOLHBT/yJ6qjAO5qbGN85XnNxXS9+6MrIwNxVOs+dGuCK5div1Hyo4NMV8Gzt2wmX6q+YHubX9F8/Q526Sq1MWSN01zAuiPx9n4sO3+MaLlJBGY2GMh/JVZyPsLrUDwedgmEJdaWvF/n8f2AU5JskhHNUws4C4Hlt+iEen04y3X98XSGuiXCmd37QDGibN/NXUWTPnMcs6hTXuWPtj8d5IcPPEhokuGZW+e85tPUggy/eQ+urQchdlFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756939705; c=relaxed/relaxed;
	bh=kJr/vsg11PDGde+tPwNUDMrCDz/yMniDPFre5VbKIxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QeUWQ06av6xGRBe3yoLfjOxfJLpIGvK/XdKrSz0pGz/RNPwIpUn0TjNox90tN4nNaOHAfbWuRwM8Hf1aJp/AIj4SecblbX4FZBQFIT10a5inmYpjbqd//6A1hxVSlfauSVouCon4wZYO8XHs0MmvY4SOPdLP5iCwQjJVWiwC1IanC3nxEOtevV/FFSg3/KqCEC9K61AdClSgoEADz7re/T3Q5bBA/jPMAtLBP7Hv84vHBTLh38rj75qbJJegBtJpKU4BUKeuRNjeV2eODGE0iCCsHGyq5HkvmCtkg/4k6LEeHORDmqPLa0C5K4d/qwAS79ww4NMG+rGJfH4fouFD7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhyLpheo; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qhyLpheo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHHp05kTCz2xgp;
	Thu,  4 Sep 2025 08:48:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E16C4151A;
	Wed,  3 Sep 2025 22:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B871C4CEE7;
	Wed,  3 Sep 2025 22:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756939702;
	bh=YcfB4l+gmOM4aOgmEy4a8CGvNnhQdJHOOYqURSHDj/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qhyLpheof5ut+vh/LbKCU6pWpxhQ66XWnCqc2B5sVd0zmTjqvde3dV1OMZrH/YTbR
	 FTXUkWtQY0JcfaUF1fEzYX6/YFTIxAO9ZZN6LoNW7lwkpDaRDa+yVD92hrCkEjzqoH
	 r4GPh0qGNf1IFkgXD6VKEt5ABn7AwepPj3ao3bN2cGQNt86Krw5aCetyOmHxFucaAh
	 473zQTCG1yuEu0QYAAxClYv+CS2rKoAhokY0RIjPXXoABWNBxEkqxVZNMxaEQthLv0
	 qsa3AE+wWhNLwtKsVthiPoJ1qrCrpFy60yRB70u62qhIl/T3MSBh1Bom4snBP/y0mU
	 D9/fNGSiGMTgw==
Date: Wed, 3 Sep 2025 17:48:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org,
	kishon@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <20250903224820.GA1234878@bhelgaas>
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
In-Reply-To: <20250901055922.1553550-10-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 01:59:21PM +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.

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

What does "CRG" in the above mean?  If it means the same as "CFG",
i.e., an abbreviation for "configuration", can you use "CFG" instead?
It it's to match an internal spec, go ahead and keep "CRG".

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

I think this should be u32 to match struct msi_msg.address_lo.

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

It looks pretty expensive to look this up for every interrupt.  It's
constant for the life of the driver, so you only need to do it once at
probe time.

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

> +static int aspeed_msi_set_affinity(struct irq_data *irq_data,
> +				   const struct cpumask *mask, bool force)
> +{
> +	return -EINVAL;
> +}

From comparing with other drivers, I doubt this is needed.

> +
> +static struct irq_chip aspeed_msi_bottom_irq_chip = {
> +	.name = "ASPEED MSI",
> +	.irq_compose_msi_msg = aspeed_msi_compose_msi_msg,

I would prefer a name that matches irq_chip.irq_compose_msi_msg, e.g.,
"aspeed_irq_compose_msi_msg()".

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

Useless "ret".  Remove it and just "return 0;"

> +static int aspeed_ast2600_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +
> +	if (pcie->host_bus_num != 0x80)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "The host bus must be 0x80\n");

Why not check this at the point you read it from the devicetree?

> +	pcie->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "aspeed,ahbc");
> +	if (IS_ERR(pcie->ahbc))
> +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
> +				     "failed to map ahbc base\n");

Same here.  Looks like a devicetree validation check.

> +static int aspeed_pcie_parse_port(struct aspeed_pcie *pcie,
> +				  struct device_node *node,
> +				  int slot)
> +{
> +	struct aspeed_pcie_port *port;
> +	struct device *dev = pcie->dev;
> +	int ret;
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->clk = devm_get_clk_from_child(dev, node, NULL);
> +	if (IS_ERR(port->clk))
> +		return dev_err_probe(dev, PTR_ERR(port->clk),
> +				     "failed to get pcie%d clock\n", slot);
> +
> +	port->phy = devm_of_phy_get(dev, node, NULL);
> +	if (IS_ERR(port->phy))
> +		return dev_err_probe(dev, PTR_ERR(port->phy),
> +				     "failed to get phy pcie%d\n",
> +				     port->slot);

port->slot hasn't been set yet.

> +	port->perst = of_reset_control_get_exclusive(node, "perst");
> +	if (IS_ERR(port->perst))
> +		return dev_err_probe(dev, PTR_ERR(port->perst),
> +				     "failed to get pcie%d reset control\n",
> +				     slot);
> +	ret = devm_add_action_or_reset(dev, aspeed_pcie_reset_release,
> +				       port->perst);
> +	if (ret)
> +		return ret;
> +	reset_control_assert(port->perst);
> +
> +	port->slot = slot;
> +	port->pcie = pcie;
> +
> +	INIT_LIST_HEAD(&port->list);
> +	list_add_tail(&port->list, &pcie->ports);
> +
> +	return 0;
> +}

> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct device_node *node = dev->of_node;
> +	const struct aspeed_pcie_rc_platform *md;
> +	u32 bus_range[2];
> +	int irq, ret;
> +
> +	md = of_device_get_match_data(dev);
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
> +	INIT_LIST_HEAD(&pcie->ports);
> +
> +	ret = of_property_read_u32_array(node, "bus-range", bus_range,
> +					 ARRAY_SIZE(bus_range));

No other drivers do this; why do you need it?

> +	if (ret) {
> +		dev_warn(dev, "failed to get bus range, assuming bus is 0\n");
> +		pcie->host_bus_num = 0;
> +	}
> +	pcie->host_bus_num = bus_range[0];
> +
> +	pcie->reg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pcie->reg))
> +		return PTR_ERR(pcie->reg);
> +
> +	pcie->domain = of_get_pci_domain_nr(node);

Almost no drivers use this; why do you need it?

> +	pcie->h2xrst = devm_reset_control_get_exclusive(dev, "h2x");
> +	if (IS_ERR(pcie->h2xrst))
> +		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst),
> +				     "failed to get h2x reset\n");
> +
> +	ret = devm_mutex_init(dev, &pcie->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init mutex\n");
> +
> +	ret = pcie->platform->setup(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to setup PCIe RC\n");
> +
> +	ret = aspeed_pcie_parse_dt(pcie);
> +	if (ret)
> +		return ret;
> +
> +	ret = aspeed_pcie_init_ports(pcie);
> +	if (ret)
> +		return ret;
> +
> +	host->sysdata = pcie;
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

This is the same as:

  return pci_host_probe(hoste);

> +}
> +
> +const struct aspeed_pcie_rc_platform pcie_rc_ast2600 = {
> +	.setup = aspeed_ast2600_setup,
> +	.reg_intx_en = 0xc4,
> +	.reg_intx_sts = 0xc8,
> +	.reg_msi_en = 0xe0,
> +	.reg_msi_sts = 0xe8,
> +	.msi_address = 0x1e77005c,

Where does this .msi_address come from?  Does this depend on an
address map that could vary based on the platform?  Should it come
from devicetree?

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

