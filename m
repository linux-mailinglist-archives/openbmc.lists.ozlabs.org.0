Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8139A0FE5F
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 03:00:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXC4l52yDz3dVC
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 13:00:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736820003;
	cv=none; b=mpKKDz1qOU91doIIQQZygmpoFWuVlGz9XAXqbdXDOqEUyJZZMYFqZ8IBZz5NNZBPrPs7755qJUcOOPsXhWzJU4+RO9dquaPeG5wmTef9/iJAgGbJpkoCednoeneTIo8+iVabO1MfSHj+j/IlSZZSTNVOMRvkHWL09YHxTSrWD4wRUHc2mWJI5PizF6VW4e1/gkKVe2i7MumMDM0sxXJGJnr0FhESjJY3fd6/AyHCq9E3YO6f6ur6LX6POraALflLE+tuotqAoPmwuCZyvKf5eKXlo75F0BMZilFu95XL1KIBmD7NUZr0OnBRaM97d7FVx3kZa5YFnYNLmci7RNEt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736820003; c=relaxed/relaxed;
	bh=LN4mhBv11bQYirwOYr9gNIgXytcwvkBsTqALtdmLtxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LbUsnXkweQtx3jyvHP23FM1ONa9HcAzXuMWxMU7bKqzGvEQZVUEib4bbGjKGp8IMXtp2NR/Nt5HQbffLlV8PcRq7s3hr7LmsOCXNexeKgWr9Jr+SLSUfYLpZ+VKZ97Q3cHOshZwfU9l8AyesUDbYVSQGU+XJwj3jET3Q9eeagwZHppLfqnn3GNctpk/kqXLaV0GI5o+mFApT0pLJcFxN3hxy2FKXCP5yzNRUyZq3Gx+Hk2pj+T4B8yLe85Ki6BlRGopb9WCqeen9m8U02L6D8wH0+ZrzRQ2yC2QCk+QIS/tGi2u3gaT4k30c/y91ks8XS8s0i5Ba4+1IRCLezI6WMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 562 seconds by postgrey-1.37 at boromir; Tue, 14 Jan 2025 13:00:01 AEDT
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXC4d6NqWz3054
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2025 13:00:01 +1100 (AEDT)
Received: from [192.168.0.224] (ip5f5ae8ae.dynamic.kabel-deutschland.de [95.90.232.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7F0A661E64780;
	Tue, 14 Jan 2025 02:49:37 +0100 (CET)
Message-ID: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
Date: Tue, 14 Jan 2025 02:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Joey Lu <a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250113055434.3377508-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joey,


Thank you for your patch.

Am 13.01.25 um 00:54 schrieb Joey Lu:
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.

It’d be great if you added the datasheet name and revision to the commit 
message.

Also, please document how tested the driver. Maybe even paste new log 
messages.

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

As you use your company email address in the AUTHOR line below, please 
also add that email address to the commit message (and maybe even as the 
author).

> ---
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
>   3 files changed, 191 insertions(+)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> index 4cc85a36a1ab..2b424544cf6f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -121,6 +121,17 @@ config DWMAC_MESON
>   	  the stmmac device driver. This driver is used for Meson6,
>   	  Meson8, Meson8b and GXBB SoCs.
>   
> +config DWMAC_NUVOTON
> +	tristate "Nuvoton MA35 dwmac support"
> +	default ARCH_MA35
> +	depends on OF && (ARCH_MA35 || COMPILE_TEST)
> +	select MFD_SYSCON
> +	help
> +	  Support for Ethernet controller on Nuvoton MA35 series SoC.
> +
> +	  This selects the Nuvoton MA35 series SoC glue layer support
> +	  for the stmmac device driver.

Also mention the module name `dwmac-nuvoton`?

> +
>   config DWMAC_QCOM_ETHQOS
>   	tristate "Qualcomm ETHQOS support"
>   	default ARCH_QCOM
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index b26f0e79c2b3..48e25b85ea06 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DWMAC_IPQ806X)	+= dwmac-ipq806x.o
>   obj-$(CONFIG_DWMAC_LPC18XX)	+= dwmac-lpc18xx.o
>   obj-$(CONFIG_DWMAC_MEDIATEK)	+= dwmac-mediatek.o
>   obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
> +obj-$(CONFIG_DWMAC_NUVOTON)	+= dwmac-nuvoton.o
>   obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
>   obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
>   obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> new file mode 100644
> index 000000000000..edf1b88ce1cd
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Nuvoton DWMAC specific glue layer
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + *
> + * Author: Joey Lu <yclu4@nuvoton.com>
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_device.h>
> +#include <linux/of_net.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/stmmac.h>
> +
> +#include "stmmac.h"
> +#include "stmmac_platform.h"
> +
> +#define NVT_REG_SYS_GMAC0MISCR  0x108
> +#define NVT_REG_SYS_GMAC1MISCR  0x10C
> +
> +#define NVT_MISCR_RMII          BIT(0)
> +
> +/* 2000ps is mapped to 0x0 ~ 0xF */

Excuse my ignorance: What is ps?

> +#define NVT_PATH_DELAY_DEC      134
> +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
> +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
> +
> +struct nvt_priv_data {
> +	struct platform_device *pdev;
> +	struct regmap *regmap;
> +};
> +
> +static struct nvt_priv_data *
> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *bsp_priv;
> +	phy_interface_t phy_mode;
> +	u32 tx_delay, rx_delay;

Please append the unit to the variable name.

> +	u32 macid, arg, reg;
> +
> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
> +	if (!bsp_priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bsp_priv->regmap =
> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(bsp_priv->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
> +		return ERR_PTR(-ENODEV);
> +	}
> +	if (macid > 1) {
> +		dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0;
> +	} else {
> +		if (arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / NVT_PATH_DELAY_DEC);

Write hexcharacters lowercase?

> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> +		} else {
> +			dev_err(dev, "Invalid Tx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
> +		rx_delay = 0;
> +	} else {
> +		if (arg <= 2000) {
> +			rx_delay = (arg == 2000) ? 0xF : (arg / NVT_PATH_DELAY_DEC);
> +			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay);
> +		} else {
> +			dev_err(dev, "Invalid Rx path delay argument.\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +	}
> +
> +	regmap_read(bsp_priv->regmap,
> +		    macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, &reg);
> +	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
> +
> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
> +		dev_err(dev, "missing phy mode property\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	switch (phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		reg &= ~NVT_MISCR_RMII;
> +		break;
> +	case PHY_INTERFACE_MODE_RMII:
> +		reg |= NVT_MISCR_RMII;
> +		break;
> +	default:
> +		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (!(reg & NVT_MISCR_RMII)) {
> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay);
> +		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay);
> +	}
> +
> +	regmap_write(bsp_priv->regmap,
> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);
> +
> +	bsp_priv->pdev = pdev;
> +
> +	return bsp_priv;
> +}
> +
> +static int nvt_gmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct nvt_priv_data *priv_data;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return PTR_ERR(plat_dat);
> +
> +	/* Nuvoton DWMAC configs */
> +	plat_dat->has_gmac = 1;
> +	plat_dat->tx_fifo_size = 2048;
> +	plat_dat->rx_fifo_size = 4096;
> +	plat_dat->multicast_filter_bins = 0;
> +	plat_dat->unicast_filter_entries = 8;
> +	plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
> +
> +	priv_data = nvt_gmac_setup(pdev, plat_dat);
> +	if (IS_ERR(priv_data))
> +		return PTR_ERR(priv_data);
> +
> +	ret = stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +	if (ret)
> +		return ret;
> +
> +	/* The PMT flag is determined by the RWK property.
> +	 * However, our hardware is configured to support only MGK.
> +	 * This is an override on PMT to enable WoL capability.
> +	 */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nvt_dwmac_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-dwmac"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nvt_dwmac_match);
> +
> +static struct platform_driver nvt_dwmac_driver = {
> +	.probe  = nvt_gmac_probe,
> +	.remove = stmmac_pltfr_remove,
> +	.driver = {
> +		.name           = "nuvoton-dwmac",
> +		.pm		= &stmmac_pltfr_pm_ops,
> +		.of_match_table = nvt_dwmac_match,
> +	},
> +};
> +module_platform_driver(nvt_dwmac_driver);
> +
> +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");

Maybe Nuvoton can set up a generic address?

> +MODULE_DESCRIPTION("Nuvoton DWMAC specific glue layer");
> +MODULE_LICENSE("GPL v2");


Kind regards,

Paul
