Return-Path: <openbmc+bounces-339-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEBAB05E48
	for <lists+openbmc@lfdr.de>; Tue, 15 Jul 2025 15:52:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhLGS4tCCz3bwX;
	Tue, 15 Jul 2025 23:52:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752587536;
	cv=none; b=Rb8dp8G0qpdvaKDemdI8N9Av9GPPlHn7UPdEWVKry9hL1LXKYrHpy51bXyRh8vP6toBumiSeqpppjDkGtD5Vj4uJ3XCDMMPXIv4+XJdlxZ6h1np8oxk5HNTzZgdPBYcoHqTBrskknY2h0VgI1/fOZOGZCtyIRggFNAAsoIPlKLsVaw38Nwru4Lp+31Rwy0Qk6o7Uxo7eLcmJoPSO5rCGqV8yTXZEYAm5EjhQy6lFwF28jU7OJS3G37C82x31EOuj92o7O7Z9Hb91Blg9GSjQE6CuVII/CYzT5wQVaJ8wWEdgTnVvWNWsK/yzB9Ccfym7o7UZCVOjH4FmGyaa84FU0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752587536; c=relaxed/relaxed;
	bh=ubdROuUEIbDV82nF9cix7jyq/BTKbWSZ5HttQeKP04s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AuGSciCaqPBuRkgzRwA9bk3yY/p+UCNc0aGZxYOB1taZ3+TtshepZ/hQod+BEouormG48vbmKzLd4CiWa2gdyY9eqJto1fCGHemOtTEU14dEAV6rs9Q1Zxd6Z9wodLi9Yfabg9O66f0or4X8H1b+NR4WibQ2R0bCd2AvG8rtekuPxZN6OsjD1fvFofBX5Huo2/2Z6E4px0oqLtiSyV3s1ZVNocYzxMQ5gx19zrAtGdHcvIap5tA6o246LQX8DdOMks4hZCC/jH+00KICp6djBFgiekhegFlb6kdIZPbceDrtAh2mNCBTqMCTEzUVetRHTXZ8JQ4tZT78D6NkS0QGGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhLGR60jGz3c9D
	for <openbmc@lists.ozlabs.org>; Tue, 15 Jul 2025 23:52:15 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ubg4V-0000Zx-U7; Tue, 15 Jul 2025 15:51:51 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ubg4S-008aWa-1W;
	Tue, 15 Jul 2025 15:51:48 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ubg4S-000MYS-1C;
	Tue, 15 Jul 2025 15:51:48 +0200
Message-ID: <e52bd959eea8a4284404f701d0519c4631a31238.camel@pengutronix.de>
Subject: Re: [PATCH v2 09/10] PCI: aspeed: Add ASPEED PCIe RC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org,  krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
 andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, BMC-SW@aspeedtech.com
Date: Tue, 15 Jul 2025 15:51:48 +0200
In-Reply-To: <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
	 <20250715034320.2553837-10-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Di, 2025-07-15 at 11:43 +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.
>=20
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/pci/controller/Kconfig       |   13 +
>  drivers/pci/controller/Makefile      |    1 +
>  drivers/pci/controller/pcie-aspeed.c | 1137 ++++++++++++++++++++++++++
>  3 files changed, 1151 insertions(+)
>  create mode 100644 drivers/pci/controller/pcie-aspeed.c
>=20
[...]
> diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controlle=
r/pcie-aspeed.c
> new file mode 100644
> index 000000000000..a7e679d5fb42
> --- /dev/null
> +++ b/drivers/pci/controller/pcie-aspeed.c
> @@ -0,0 +1,1137 @@
[...]
> +static int aspeed_pcie_parse_port(struct aspeed_pcie *pcie,
> +				  struct device_node *node,
> +				  int slot)
> +{
> +	struct aspeed_pcie_port *port;
> +	struct device *dev =3D pcie->dev;
> +
> +	port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->pciephy =3D syscon_regmap_lookup_by_phandle(node, "aspeed,pciephy=
");
> +	if (IS_ERR(port->pciephy))
> +		return dev_err_probe(dev, PTR_ERR(port->pciephy),
> +				     "Failed to map pcie%d pciephy base\n", slot);
> +
> +	port->clk =3D devm_get_clk_from_child(dev, node, NULL);
> +	if (IS_ERR(port->clk))
> +		return dev_err_probe(dev, PTR_ERR(port->clk),
> +				     "Failed to get pcie%d clock\n", slot);
> +
> +	port->perst =3D of_reset_control_get_exclusive(node, "perst");
> +	if (IS_ERR(port->perst))
> +		return dev_err_probe(dev, PTR_ERR(port->perst),
> +				     "Failed to get pcie%d reset control\n", slot);

How about registering a reset_control_put() via
devm_add_action_or_reset()?
Otherwise these reset controls are not released on .remove.

[...]
> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct aspeed_pcie_port *port;
> +	struct device_node *node =3D dev->of_node;
> +	const struct aspeed_pcie_rc_platform *md =3D of_device_get_match_data(d=
ev);
> +	int irq, ret;
> +
> +	if (!md)
> +		return -ENODEV;
> +
> +	host =3D devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> +	if (!host)
> +		return -ENOMEM;
> +
> +	pcie =3D pci_host_bridge_priv(host);
> +	pcie->dev =3D dev;
> +	pcie->tx_tag =3D 0;
> +	platform_set_drvdata(pdev, pcie);
> +
> +	pcie->platform =3D md;
> +	pcie->host =3D host;
> +	INIT_LIST_HEAD(&pcie->ports);
> +
> +	pcie->reg =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pcie->reg))
> +		return PTR_ERR(pcie->reg);
> +
> +	of_property_read_u32(node, "linux,pci-domain", &pcie->domain);
> +
> +	pcie->cfg =3D syscon_regmap_lookup_by_phandle(dev->of_node, "aspeed,pci=
ecfg");
> +	if (IS_ERR(pcie->cfg))
> +		return dev_err_probe(dev, PTR_ERR(pcie->cfg), "Failed to map pciecfg b=
ase\n");
> +
> +	pcie->h2xrst =3D devm_reset_control_get_exclusive(dev, "h2x");
> +	if (IS_ERR(pcie->h2xrst))
> +		return dev_err_probe(dev, PTR_ERR(pcie->h2xrst), "Failed to get h2x re=
set\n");
> +
> +	ret =3D devm_mutex_init(dev, &pcie->lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to init mutex\n");
> +
> +	ret =3D pcie->platform->setup(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to setup PCIe RC\n");
> +
> +	ret =3D aspeed_pcie_parse_dt(pcie);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D aspeed_pcie_init_ports(pcie);
> +	if (ret)
> +		goto err_remove_resets;
> +
> +	host->sysdata =3D pcie;
> +
> +	ret =3D aspeed_pcie_init_irq_domain(pcie);
> +	if (ret)
> +		goto err_irq_init;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret =3D irq;
> +		goto err_irq;
> +	}
> +
> +	ret =3D devm_request_irq(dev, irq, aspeed_pcie_intr_handler, IRQF_SHARE=
D, dev_name(dev),
> +			       pcie);
> +	if (ret)
> +		goto err_irq;
> +
> +	ret =3D pci_host_probe(host);
> +	if (ret)
> +		goto err_irq;
> +
> +	return 0;
> +err_irq:
> +	aspeed_pcie_irq_domain_free(pcie);

If pci_host_probe() fails, aspeed_pcie_irq_domain_free() will be called
before the IRQ requested with devm_request_irq() above is released.
Also, this is never called on .remove. You can fix both with
devm_add_action_or_reset().

> +err_irq_init:
> +err_remove_resets:
> +	list_for_each_entry(port, &pcie->ports, list)
> +		reset_control_put(port->perst);

I suggest to let devres handle this (see above).

regards
Philipp


