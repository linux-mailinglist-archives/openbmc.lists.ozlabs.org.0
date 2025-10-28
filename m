Return-Path: <openbmc+bounces-828-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27634C172FE
	for <lists+openbmc@lfdr.de>; Tue, 28 Oct 2025 23:25:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx4gw3ChMz2xQ6;
	Wed, 29 Oct 2025 09:25:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761671615;
	cv=none; b=DMj6NTorQg+QN9NXLHHpd8inwdd4iJAqZIt6XC3R8q+Q+hOE1Wj6i3WoFur9WgJtlBNkuFdOWLdznixJqTY95QjIMbvh8VwJoIZzuRFzhAYrHjr65cY2M1FuItjjhkiklZQbVv1u+sSQr6Kg1hiIM4TRw5SgjL3Qr24DYJoraY/RqG1sySUYp3nBDhOi52n9/Noww2d1vWbKKUmXBEgz1K7u1NPqT7q2/RKQELP5kqEJ3cy2Gr38M/Biz+zi9pcT8Cnim7dppZN1ST6H6QvFpjuf1/AOoEw3GPW7sHwJtVvs6fJQjfp8JtA3hqF7QNPKhDZg4d1mZn0YojkuLh3Dog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761671615; c=relaxed/relaxed;
	bh=CdJ+7CGRqx2pwaR7nFsvxokq6e2hsboYVcp35XvnspA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ED+H0QYZM0HgRKdHC64+2SIIcmSADsjgsfGckW1vUq9il1t2bMOaGBmbE2g6XFeCfnmb2pISS/3oREldfFFhpH2vl3yja2KOfX3WuHP8+nKApsh418Y4zvSwDbuyjt12wuNKC+RcHNxG9cfbEAJvJj2sLbLrJd0rh5rvv0lIVKqriYuZSZTojF+NlZ+tq1ypbN3bzjkkvVlBS8scW2cyl6Vj5qJoMuKRDAjRhHxHm0k6L7487KpC2jPpR3976R7WRGimsCDBXwH0h0/kvjViSlUvZqcEUhLF4bSghCxN4oLOLoBSm5bBnMBAWjmOlw4f1CohbyUuWyO/6oOoGbcY5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GHWgETQ1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GHWgETQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwxmG6TcPz2xlK;
	Wed, 29 Oct 2025 04:13:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B9306124B;
	Tue, 28 Oct 2025 17:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B658BC4CEE7;
	Tue, 28 Oct 2025 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761671611;
	bh=+cenkb0yL5U6fkb9PXEJLOZBBfbIw/K5JcCnxUVgehI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GHWgETQ1RNiG4NgBjVLnhJH9atMiVJdloWNMv11jPg99tyK+rmBwAzqK9hTb4gVhT
	 2ZtFnJKwxLI4s2Q1P8yhoci5coU0j5l4vn2zCzKepsIfscxlIj7Zu5fXo/n3/KWGIz
	 hHMqKbrGfsuMHEa9JXdVniJNLDuD3aTag4FRYpY8MZC7Tdt+1tj5Isr/dt42Ncc8NJ
	 sH4jdipg5MKIr6H7mirxdjLBByUiKYKRocaUoLgV9TRC+GCZAmUas2q83NjwZJ561i
	 7CYd2BuJMIACVxarC+376c/AlA60uR1HFbp6n2bx39j1c/IyYibnP+f7s04InfotSN
	 hUMwQm5MxpCww==
Date: Tue, 28 Oct 2025 12:13:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	vkoul@kernel.org, kishon@kernel.org, linus.walleij@linaro.org,
	p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 8/9] PCI: aspeed: Add ASPEED PCIe RC driver
Message-ID: <20251028171330.GA1506282@bhelgaas>
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
In-Reply-To: <20251027095825.181161-9-jacky_chou@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 05:58:24PM +0800, Jacky Chou wrote:
> Introduce PCIe Root Complex driver for ASPEED SoCs. Support RC
> initialization, reset, clock, IRQ domain, and MSI domain setup.
> Implement platform-specific setup and register configuration for
> ASPEED. And provide PCI config space read/write and INTx/MSI
> interrupt handling.

> +config PCIE_ASPEED
> +	bool "ASPEED PCIe controller"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on OF
> +	depends on PCI_MSI
> +	select IRQ_MSI_LIB
> +	help
> +	  Enable this option to support the PCIe controller found on ASPEED
> +	  SoCs.
> +
> +	  This driver provides initialization and management for PCIe
> +	  Root Complex functionality, including interrupt and MSI support.

Maybe "INTx and MSI support", since MSI is an interrupt?

> +/* Complete status */

"Completion"

> +static int aspeed_ast2700_ahb_remap_to_bar(struct aspeed_pcie *pcie)
> +{
> +	struct resource_entry *win, *tmp;
> +	struct pci_host_bridge *bridge = pcie->host;
> +
> +	/* Configure AHB remapping to BAR on AST27x0.
> +	 * The BAR region is HW-fixed in AST27x0, these BARs will be filled
> +	 * in the ranges of pcie node in DT.
> +	 */

I don't understand what "HW-fixed" means here.  It looks like you're
writing host bridge window addresses (that came from DT) to the
hardware.  That sounds like they're not actually "fixed" but
programmable.

Host bridge windows are not BARs themselves.  Mem space for devices
below the host bridge is allocated from the windows, and the addresses
are programmed into BARs of those downstream devices.

Multi-line comment style:

  /*
   * Configure ...
   */

Wrap to fill 78 columns, or add blank lines between paragraphs.

> +	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
> +		struct resource *res = win->res;
> +
> +		if (resource_type(res) == IORESOURCE_MEM &&
> +		    !(res->flags & IORESOURCE_MEM_64)) {
> +			writel(ASPEED_REMAP_BAR_BASE(res->start),
> +			       pcie->reg + ASPEED_H2X_REMAP_DIRECT_ADDR);
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
> +
> +	regmap_update_bits(pcie->cfg, ASPEED_SCU_60,
> +			   ASPEED_RC_E2M_PATH_EN | ASPEED_RC_H2XS_PATH_EN |
> +			   ASPEED_RC_H2XD_PATH_EN | ASPEED_RC_H2XX_PATH_EN |
> +			   ASPEED_RC_UPSTREAM_MEM_EN,
> +			   ASPEED_RC_E2M_PATH_EN | ASPEED_RC_H2XS_PATH_EN |
> +			   ASPEED_RC_H2XD_PATH_EN | ASPEED_RC_H2XX_PATH_EN |
> +			   ASPEED_RC_UPSTREAM_MEM_EN);
> +	regmap_write(pcie->cfg, ASPEED_SCU_64,
> +		     ASPEED_RC0_DECODE_DMA_BASE(0) |
> +		     ASPEED_RC0_DECODE_DMA_LIMIT(0xff) |
> +		     ASPEED_RC1_DECODE_DMA_BASE(0) |
> +		     ASPEED_RC1_DECODE_DMA_LIMIT(0xff));
> +	regmap_write(pcie->cfg, ASPEED_SCU_70, ASPEED_DISABLE_EP_FUNC);
> +
> +	aspeed_host_reset(pcie);
> +
> +	writel(0, pcie->reg + ASPEED_H2X_CTRL);
> +	writel(ASPEED_H2X_BRIDGE_EN | ASPEED_H2X_BRIDGE_DIRECT_EN,
> +	       pcie->reg + ASPEED_H2X_CTRL);
> +
> +	ret = aspeed_ast2700_ahb_remap_to_bar(pcie);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to assign BAR\n");

This is not assigning *BARs*.  A host bridge doesn't have BARs in the
PCI spec sense.  It might have programmable address ranges, but the
host bridge is not itself a PCI device, so its programmability is
device specific.

