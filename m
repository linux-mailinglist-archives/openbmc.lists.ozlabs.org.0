Return-Path: <openbmc+bounces-204-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42255AD8889
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 11:54:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJZWB1MDCz30MZ;
	Fri, 13 Jun 2025 19:54:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749808486;
	cv=none; b=C1RSYhqvHf5d2Sr53okm/ue5UBxKhvklrDVPSoDIUU+AN09BUt9G+Vsyc8AU1fzdQuBdqcHDBhFDv60yp1/ISFaQFxHVN47YPiT7hInFg0Jp8scfKIVLccQKqSjmrmbvDhtKyChKj7FcY55Z97FGnUNIL8PzeJ25yajlKpWoAOEGXXONzbvgUDOh2ajod4D9SNL18YlQEdToWhCmrJRf7GTki8s7MJcNWs+MoXafJE9JVF6TgBMzRDC0KgWG48cnxVRQKnWvCIxMWsa7RPVk4DCsbhuYzmeKXDoF8g7AbrT/mrnA+Dcs3a9anmCthK7TwMOeMnA3m7dTxOuXI1ilkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749808486; c=relaxed/relaxed;
	bh=+QE7uo3opxh9em17i8XHHo2wsfE9LEuRzwaUWPwJTNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNaUhdpywYkcFpFTU0RMZ2Ji+lIvakhT0LvmhJpB8rLdpI6vCfjP0WpTtfi6ZcsxM2jQSDzFL1wa+yoeioZZH2bgL/ITLTEFHyH5iTm9O/1fJHpjXa414+Zfqsi2KyOof7uHZQ3CnHfN+1hroDHL2cScnnw+eOBnL1mHTxQzojCWS0CtMQSQOXpggB8HhFy3bC+E9lluztnyg7zUnL6pmbGCjvlpq+oeOHn1C5OFKicVsW2Vt6Fpf1xj/IbKYu5fkxbuJ1IwVomtJzmqVEbwQVOrPCnzeNg/R28/mPM6Zx62EjtDV0A7wtKDdmOp77FD/p2HkEaFI7EF6VXrqhIxCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IgwWZzCd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IgwWZzCd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJZW92V6tz2yMF;
	Fri, 13 Jun 2025 19:54:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 790415C47E8;
	Fri, 13 Jun 2025 09:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14343C4CEE3;
	Fri, 13 Jun 2025 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749808482;
	bh=7S40Zuc2TNAecTyadpX90VMiKscvd9zWpUm96dO61pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IgwWZzCduhTWWVz0Ik0YoXpB8DwGFZHsTowAQDDHQVYhQv9QRP34IURI4Hl9yCc29
	 4FlZxQ2xGoW39/quqB0hicrkzjFGe/Iim73kY7UdEr5popAOvhGPe+hej2bdOUGzzz
	 NCFidSOWEI6m1Yy8pRAA5+KJ5oPRZ26qrLNWEhxBte0vywQJIcqitbBfmPICZeWUtf
	 DBbBwNtxjtxEmoJ3kTn+WjaFCpezmZplSZdZK//Zrcetp8lu6MfuITyXXmwUJ/zkIe
	 O1VLGw+kvQJANu1osi+nLeWlr0UQZ9okqtAaCaipvC9FcpoC8G9iFHKlozVAC5vzQK
	 AZv9VAeaeADpg==
Message-ID: <576ca6bb-291c-458e-9703-46e7d2f43bbe@kernel.org>
Date: Fri, 13 Jun 2025 11:54:35 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller driver
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org,
 linus.walleij@linaro.org, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250613033001.3153637-8-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13/06/2025 05:30, Jacky Chou wrote:
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

depends ARCH_ASPEED || COMPILE_TEST

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

Where do you use it?

> +#include <linux/of_address.h>

Where do you use it?


> +#include <linux/of_irq.h>

Where do you use it?


> +#include <linux/of_pci.h>

Where do you use it?

> +#include <linux/pci.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/workqueue.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +



...

> +
> +static int aspeed_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pci_host_bridge *host;
> +	struct aspeed_pcie *pcie;
> +	struct device_node *node = dev->of_node;
> +	const void *md = of_device_get_match_data(dev);

Not void, but specific type. This is not Javascript, we have here types.

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

Huh...

> +	if (IS_ERR(pcie->clock))
> +		goto err_clk;
> +	ret = clk_prepare_enable(pcie->clock);

devm_clk_get_enabled.

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
> +	aspeed_pcie_irq_domain_free(pcie);
> +err_irq_init:
> +err_setup:
> +	return dev_err_probe(dev, ret, "Failed to setup PCIe RC\n");
> +}
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

This should be const. Why it cannot?

> +	.setup = aspeed_ast2600_setup,
> +	.reg_intx_en = 0x04,
> +	.reg_intx_sts = 0x08,
> +	.reg_msi_en = 0x20,
> +	.reg_msi_sts = 0x28,
> +};
> +
> +static struct aspeed_pcie_rc_platform pcie_rc_ast2700 = {

This should be const. Why it cannot?

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

Why?

> +		.of_match_table = aspeed_pcie_of_match,
> +	},
> +	.probe = aspeed_pcie_probe,
> +	.remove = aspeed_pcie_remove,

So how exactly remove can be triggered?

> +};
> +
> +module_platform_driver(aspeed_pcie_driver);
> +
> +MODULE_AUTHOR("Jacky Chou <jacky_chou@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED PCIe Root Complex");
> +MODULE_LICENSE("GPL");


Best regards,
Krzysztof

