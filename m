Return-Path: <openbmc+bounces-1073-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71969CE5B24
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dff8t5NhRz2yFc;
	Mon, 29 Dec 2025 12:42:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766504362;
	cv=none; b=AZW0NCIPAc/gC/lxmaBydJFf1riRmrwRUlceQn420MJikFdLnbIbsUyzUFA4BBflKFXHmDfYQSqTKWqokSCsLWaMosICSvIFWO3VkebVLSAInZyUuer392alvhqz08DO+6igyX1wfsl1IsjiwXvWPDblILKVoGoLCfjBz+fysiRkeq94Hf9W5wcQELQvBDIxfDnd9XLOqlB8925DfTexOfBBa8c4tnvMkor08NVCNcDyXTCsFITMT1PoiD9igulSmlIY3QerteP3SyeP2zYwX9jjkJliyKQIQQaKmnEGhHJJSTyo+m84xAAnoMCODs+Ozr5tv8Ul/x5FnxtgxBU5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766504362; c=relaxed/relaxed;
	bh=sH2zjlcqHDt9oPtqvJtutzzDiU3VYiaDu+gIuqfRy4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFmYNNKMJADZilGltuPWn8YFLVnFhoe6ozx8xWEspW+nXojXg1aXWI0IpHIuZq4n0oecAm8+kOjUH4SgcdlvPdou3uHsMl4MWTm3sc9CuBlR2dYf6GNjZvYisWH9JwVTkR+Lj/TcTYToHAoX3j/tJKqApKhfqUGI23j6K1sEIfKKvX6EJ1FfgPmA/LlqPSAGyz//6dy5GLnblzyBmuFNWNy/se0KwA2I/9HsW3PAOf/YKh+BcTTozPZdHVEgvgztR0mjwLPpPzMStmlYV++DGPuf/9XuA023ybyYqIhaKhA1t9iuo0SRtSmz8/83qaHWAKZ8cDojOvIEfDZKQzx6aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gUVBe1kC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gUVBe1kC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbK1j3v1hz2xXB;
	Wed, 24 Dec 2025 02:39:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04E5660123;
	Tue, 23 Dec 2025 15:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03767C113D0;
	Tue, 23 Dec 2025 15:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766504328;
	bh=+TcYH6TIplkug/gQDHnsv7nQ7tnduk4LL2LEZzCzTXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUVBe1kCA7fLdvKrVG0h5qsIh/rC+egrV6e7Up8wRserT+b4oT/cWBgXvVYtRkJLx
	 XXmXOeV3PxUG3J6sTPqcRTPX6LN057jv6T2BTlX/9rvwal2APvWfFe+BdErlJyDw2/
	 AdgMW+/5AJFvJXeW+knuJIjBvt1lFeHqRZtfjjN77djedCv8pi6aVbcEpHrgQoZWxa
	 tzBOBqGG5uOt/ASGMox4RtJLubgZXl89Hd6b3x5sbC9M2QvYme51dj+U2EYfFZi87X
	 raWvWn/d6vOn0FQPFRvGcHrgW9bENrAKpJLfdCk792XxCYhGdFOgxeBqhFZ8siwtx0
	 zd+8TbCtNY6rg==
Date: Tue, 23 Dec 2025 21:08:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 4/7] PHY: aspeed: Add ASPEED PCIe PHY driver
Message-ID: <aUq3hF7Xfk-f35Nh@vaman>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <20251216-upstream_pcie_rc-v7-4-4aeb0f53c4ce@aspeedtech.com>
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
In-Reply-To: <20251216-upstream_pcie_rc-v7-4-4aeb0f53c4ce@aspeedtech.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16-12-25, 09:50, Jacky Chou wrote:
> Introduce support for Aspeed PCIe PHY controller available in
> AST2600/2700.

What is with the uppercase "PHY" in patch title instead of lowercase
'phy' as is the convention

> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/phy/Kconfig                  |   1 +
>  drivers/phy/Makefile                 |   1 +
>  drivers/phy/aspeed/Kconfig           |  15 +++
>  drivers/phy/aspeed/Makefile          |   2 +
>  drivers/phy/aspeed/phy-aspeed-pcie.c | 209 +++++++++++++++++++++++++++++++++++
>  5 files changed, 228 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 678dd0452f0a..f6a8f06fd244 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -103,6 +103,7 @@ config PHY_NXP_PTN3222
>  
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
> +source "drivers/phy/aspeed/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
>  source "drivers/phy/freescale/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index bfb27fb5a494..18990c87dfb0 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
>  obj-y					+= allwinner/	\
>  					   amlogic/	\
> +					   aspeed/	\
>  					   broadcom/	\
>  					   cadence/	\
>  					   freescale/	\
> diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
> new file mode 100644
> index 000000000000..6aeeca84091f
> --- /dev/null
> +++ b/drivers/phy/aspeed/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Aspeed platforms
> +#
> +config PHY_ASPEED_PCIE
> +	tristate "ASPEED PCIe PHY driver"
> +	select GENERIC_PHY
> +	depends on ARCH_ASPEED
> +	default y

NO! why should this driver be default!

> +	help
> +	  This option enables support for the ASPEED PCIe PHY driver.
> +	  The driver provides the necessary interface to control and
> +	  configure the PCIe PHY hardware found on ASPEED SoCs.
> +	  It is required for proper operation of PCIe devices on
> +	  platforms using ASPEED chips.
> \ No newline at end of file

??

> diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
> new file mode 100644
> index 000000000000..7203152f44bf
> --- /dev/null
> +++ b/drivers/phy/aspeed/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_ASPEED_PCIE)		+= phy-aspeed-pcie.o
> \ No newline at end of file

Are we expecting more drivers for aspeed, if not move it to drivers/phy/
once we have couple of them we can add a directory

> diff --git a/drivers/phy/aspeed/phy-aspeed-pcie.c b/drivers/phy/aspeed/phy-aspeed-pcie.c
> new file mode 100644
> index 000000000000..3de43a86ac17
> --- /dev/null
> +++ b/drivers/phy/aspeed/phy-aspeed-pcie.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 Aspeed Technology Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>

why do you need this

> +#include <linux/phy/pcie.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>


Do you need all headers here?

-- 
~Vinod

