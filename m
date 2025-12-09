Return-Path: <openbmc+bounces-1025-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30395CBC3CE
	for <lists+openbmc@lfdr.de>; Mon, 15 Dec 2025 03:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dV3Zd4Ynrz2yF1;
	Mon, 15 Dec 2025 13:16:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765239373;
	cv=none; b=LCyj8DloT3W1bvyxeeSeogNZg9vM7vGcP9k5lmizM3+uM5kBuGFcoiNCDtKsesa9/4UIVwumjpiahtuwXC8PUGywJpA40fX021DlAAoHv0rdJ+L7sddjLYxs7fnO0vCuwz+9VYTAk4YpefbqD8GKMv/PI/URpNXSc6Lb1UM7dwhi9UwOaM+lmPQyf1ldrdOHdRr7W6g7oQpovR0x3sVenTvg9tu9K2BgiKqF4AYfcYdSnJ16xAiIFWS0gbuTAsvLVFHxQNfRRT4IElZhi35qsl60RScLkb1DsEceqKSFP7ni05y0LC1iJiUSh3js/EZsNKEOZn1BMi+dMRcOFnvcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765239373; c=relaxed/relaxed;
	bh=2ZscvsbGvY30JuXEtwJ/NklAkr1juTvT+P51+rUN4M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=O/asjiRwIPc9Tj1in2qSMIoaXxl95BxN2P3XM2ehBXwVJeDOhwV1H3HRUU/mSeBwgmmIUfFIm0KVJ+d+7YGPzfzgjdLVBtNrFG4LrNdSpHxxDmcRyv3ck0bxczelAYTopRwhVO+zoTILMAypv5Kk1U0hl5yODJPs1JXuEg5IstQNPdOe6onNemPXU1vjqZMReZWKTz14wQ2HBqP2pu8wMmTXs9Tx/c77mEYQRckebo05ChFEL8xgsSAYzOlPueoeweL1uKe0+cTORzQjKecXGTHJoT/a7x4aN635C8CkBs9oB2DTFJ+64v5/6HszUD4lfqj9cvlLpY5T5nFQhb0HKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nzqe2YsL; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nzqe2YsL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQKC03MjCz2xbQ;
	Tue, 09 Dec 2025 11:16:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31F6060125;
	Tue,  9 Dec 2025 00:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF78BC4CEF1;
	Tue,  9 Dec 2025 00:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765239068;
	bh=7ptARhGnIW0rweJs/X7vTtC/SQB8ulRmWeebM2Urvl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Nzqe2YsLmvHdUUpvvSUvm6rLElIkqyZsP8E7UC7VgLN1jMvslaQaB65EuuR2M3tQD
	 ++rs5KQFBsdOe7SSQ8hVf+DJAugUoPM5Mqrfs69Wm5NDb1BwhrWGYUAduiY2Yokwcw
	 UnX/Dznj2igM6Bvu9sfjXeM7bTJaA4vS7oKDjiqP6a78W6GKZiw//u+Q7WQb61e+KS
	 HRkk6gQ/8ovRTrwFr5gibfZmzjuyR5eHFLZzYqvj1cKSwTFL0LbWpbU7omxzWiVhGp
	 mAEOHH5Lmz7F8T0wk0TahZiroHww1QftElDdmGAe4Dk+Qfg0wy4JVD6zQ794GMZXJu
	 /flhU9gTQ0Z9A==
Date: Mon, 8 Dec 2025 18:11:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 6/7] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <20251209001107.GA3430423@bhelgaas>
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
In-Reply-To: <20251201-upstream_pcie_rc-v6-6-8c8800c56b16@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 01, 2025 at 02:29:16PM +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.
> ...

> +struct aspeed_pcie {
> +	struct pci_host_bridge *host;
> +	struct device *dev;
> +	void __iomem *reg;
> +	struct regmap *ahbc;
> +	struct regmap *cfg;
> +	const struct aspeed_pcie_rc_platform *platform;
> +	struct list_head ports;
> +
> +	u8 tx_tag;
> +	int host_bus_num;

Only needs a u8.

> +static int aspeed_pcie_port_init(struct aspeed_pcie_port *port)
> +{
> +	struct aspeed_pcie *pcie = port->pcie;
> +	struct device *dev = pcie->dev;
> +	int ret;
> +
> +	ret = clk_prepare_enable(port->clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set clock for slot (%d)\n",
> +				     port->slot);
> +
> +	ret = phy_init(port->phy);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to init phy pcie for slot (%d)\n",
> +				     port->slot);
> +
> +	ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to set phy mode for slot (%d)\n",
> +				     port->slot);
> +
> +	reset_control_deassert(port->perst);
> +	mdelay(PCIE_RESET_CONFIG_WAIT_MS);

I think this should use msleep().

> +static int aspeed_ast2600_setup(struct platform_device *pdev)
> +{
> +	struct aspeed_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = pcie->dev;
> +
> +	pcie->ahbc = syscon_regmap_lookup_by_phandle(dev->of_node,
> +						     "aspeed,ahbc");
> +	if (IS_ERR(pcie->ahbc))
> +		return dev_err_probe(dev, PTR_ERR(pcie->ahbc),
> +				     "failed to map ahbc base\n");
> +
> +	aspeed_host_reset(pcie);
> +
> +	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK_KEY);
> +	regmap_update_bits(pcie->ahbc, ASPEED_AHBC_ADDR_MAPPING,
> +			   ASPEED_PCIE_RC_MEMORY_EN, ASPEED_PCIE_RC_MEMORY_EN);
> +	regmap_write(pcie->ahbc, ASPEED_AHBC_KEY, ASPEED_AHBC_UNLOCK);
> +
> +	/* Due to the BAR assignment is fixed mapping on 0x6000_0000.*/
> +	writel(ASPEED_AHB_REMAP_LO_ADDR(0x600) | ASPEED_AHB_MASK_LO_ADDR(0xe00),
> +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG0);
> +	writel(ASPEED_AHB_REMAP_HI_ADDR(0),
> +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG1);

I assume this ASPEED_H2X_AHB_ADDR_CONFIG is doing basically the same
thing as aspeed_ast2700_remap_pci_addr() below, so see the comments
there.

> +	writel(ASPEED_AHB_MASK_HI_ADDR(~0),
> +	       pcie->reg + ASPEED_H2X_AHB_ADDR_CONFIG2);
> +	writel(ASPEED_H2X_BRIDGE_EN, pcie->reg + ASPEED_H2X_CTRL);
> +
> +	writel(ASPEED_PCIE_RX_DMA_EN | ASPEED_PCIE_RX_LINEAR |
> +	       ASPEED_PCIE_RX_MSI_SEL | ASPEED_PCIE_RX_MSI_EN |
> +	       ASPEED_PCIE_WAIT_RX_TLP_CLR | ASPEED_PCIE_RC_RX_ENABLE |
> +	       ASPEED_PCIE_RC_ENABLE,
> +	       pcie->reg + ASPEED_H2X_DEV_CTRL);
> +
> +	writel(ASPEED_RC_TLP_TX_TAG_NUM, pcie->reg + ASPEED_H2X_DEV_TX_TAG);
> +
> +	pcie->host->ops = &aspeed_ast2600_pcie_ops;
> +	pcie->host->child_ops = &aspeed_ast2600_pcie_child_ops;
> +
> +	return 0;
> +}
> +
> +static int aspeed_ast2700_remap_pci_addr(struct aspeed_pcie *pcie)
> +{
> +	struct device_node *dev_node = pcie->dev->of_node;
> +	struct of_pci_range range;
> +	struct of_pci_range_parser parser;
> +	int ret;
> +
> +	ret = of_pci_range_parser_init(&parser, dev_node);
> +	if (ret)
> +		return ret;
> +
> +	for_each_of_pci_range(&parser, &range) {
> +		if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_MEM) {
> +			writel(ASPEED_REMAP_PCI_ADDR_31_12(range.pci_addr),
> +			       pcie->reg + ASPEED_H2X_REMAP_PCI_ADDR_LO);
> +			writel(ASPEED_REMAP_PCI_ADDR_63_32(range.pci_addr),
> +			       pcie->reg + ASPEED_H2X_REMAP_PCI_ADDR_HI);
> +			return 0;

It looks like this is essentially hardcoding the offset between the
parent-bus-address and the child-bus-address in the DT 'ranges'
property.  Since ASPEED_REMAP_PCI_ADDR_31_12() and
ASPEED_REMAP_PCI_ADDR_63_32() do nothing except mask out the low 12
bits, I assume that offset is zero.

But this should not be hard-coded at all; it should be extracted from
'ranges'.  I don't think we really have a consistent way of doing
this, but you can take a look at how these other drivers program
"outbound" mappings like this using bridge->windows:

  cdns_pcie_hpa_host_init_address_translation()
  dw_pcie_iatu_setup()
  mobiveil_host_init()
  xgene_pcie_map_ranges()
  iproc_pcie_map_ranges()
  rzg3s_pcie_parse_map_ranges()

> +static int aspeed_pcie_parse_dt(struct aspeed_pcie *pcie)
> +{
> +	struct device *dev = pcie->dev;
> +	struct device_node *node = dev->of_node;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(node, child) {
> +		int slot;
> +		const char *type;
> +
> +		ret = of_property_read_string(child, "device_type", &type);
> +		if (ret || strcmp(type, "pci"))
> +			continue;
> +
> +		ret = of_pci_get_devfn(child);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret,
> +					     "failed to parse devfn\n");
> +
> +		slot = PCI_SLOT(ret);
> +
> +		ret = aspeed_pcie_parse_port(pcie, child, slot);
> +		if (ret)
> +			return ret;

It looks unnecessarily complicated to put each port on a list in
aspeed_pcie_parse_port() and then iterate over that list in
aspeed_pcie_init_ports().

I think you could just do something like:

  aspeed_pcie_parse_port();
  aspeed_pcie_port_init();

and get rid of the list completely.

> +	}
> +
> +	if (list_empty(&pcie->ports))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "No PCIe port found in DT\n");
> +
> +	return 0;
> +}
> +
> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct resource_entry *entry;
> +	const struct aspeed_pcie_rc_platform *md;
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
> +	/* Get root bus num for cfg command to decide tlp type 0 or type 1 */
> +	entry = resource_list_first_type(&host->windows, IORESOURCE_BUS);
> +	if (entry)
> +		pcie->host_bus_num = entry->res->start;

s/host_bus_num/root_bus_nr/   to match struct altera_pcie

