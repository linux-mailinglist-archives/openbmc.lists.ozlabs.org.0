Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022975A637
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 08:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R62cy2JbDz3c3c
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 16:21:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R62cd0xTvz2ytb
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 16:20:46 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aee77.dynamic.kabel-deutschland.de [95.90.238.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AD75261E5FE04;
	Thu, 20 Jul 2023 08:20:05 +0200 (CEST)
Message-ID: <dfda43af-e9b4-85bf-e165-02127e02fbf0@molgen.mpg.de>
Date: Thu, 20 Jul 2023 08:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] peci: Add peci-npcm controller driver
Content-Language: en-US
To: Iwona Winiarska <iwona.winiarska@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
 <20230719220853.1029316-3-iwona.winiarska@intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230719220853.1029316-3-iwona.winiarska@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Iwona,


Am 20.07.23 um 00:08 schrieb Iwona Winiarska:
> From: Tomer Maimon <tmaimon77@gmail.com>
> 
> Add support for Nuvoton NPCM BMC hardware to the Platform Environment
> Control Interface (PECI) subsystem.

Please elaborate on the implementation, and document the used datasheets.

Additionally, please document how you tested this.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
>   drivers/peci/controller/Kconfig     |  16 ++
>   drivers/peci/controller/Makefile    |   1 +
>   drivers/peci/controller/peci-npcm.c | 298 ++++++++++++++++++++++++++++
>   3 files changed, 315 insertions(+)
>   create mode 100644 drivers/peci/controller/peci-npcm.c
> 
> diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kconfig
> index 2fc5e2abb74a..4f9c245ad042 100644
> --- a/drivers/peci/controller/Kconfig
> +++ b/drivers/peci/controller/Kconfig
> @@ -16,3 +16,19 @@ config PECI_ASPEED
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called peci-aspeed.
> +
> +config PECI_NPCM
> +	tristate "Nuvoton NPCM PECI support"
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	depends on OF
> +	select REGMAP_MMIO
> +	help
> +	  This option enables PECI controller driver for Nuvoton NPCM7XX
> +	  and NPCM8XX SoCs. It allows BMC to discover devices connected
> +	  to it and communicate with them using PECI protocol.
> +
> +	  Say Y here if you want support for the Platform Environment Control
> +	  Interface (PECI) bus adapter driver on the Nuvoton NPCM SoCs.
> +
> +	  This support is also available as a module. If so, the module
> +	  will be called peci-npcm.
> diff --git a/drivers/peci/controller/Makefile b/drivers/peci/controller/Makefile
> index 022c28ef1bf0..e247449bb423 100644
> --- a/drivers/peci/controller/Makefile
> +++ b/drivers/peci/controller/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   
>   obj-$(CONFIG_PECI_ASPEED)	+= peci-aspeed.o
> +obj-$(CONFIG_PECI_NPCM)		+= peci-npcm.o
> diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
> new file mode 100644
> index 000000000000..3647e3628a17
> --- /dev/null
> +++ b/drivers/peci/controller/peci-npcm.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology corporation.

No dot/period at the end.

[…]

> +static int npcm_peci_xfer(struct peci_controller *controller, u8 addr, struct peci_request *req)
> +{
> +	struct npcm_peci *priv = dev_get_drvdata(controller->dev.parent);
> +	unsigned long timeout = msecs_to_jiffies(priv->cmd_timeout_ms);
> +	unsigned int msg_rd;
> +	u32 cmd_sts;
> +	int i, ret;
> +
> +	/* Check command sts and bus idle state */
> +	ret = regmap_read_poll_timeout(priv->regmap, NPCM_PECI_CTL_STS, cmd_sts,
> +				       !(cmd_sts & NPCM_PECI_CTRL_START_BUSY),
> +				       NPCM_PECI_IDLE_CHECK_INTERVAL_USEC,
> +				       NPCM_PECI_IDLE_CHECK_TIMEOUT_USEC);
> +	if (ret)
> +		return ret; /* -ETIMEDOUT */
> +
> +	spin_lock_irq(&priv->lock);
> +	reinit_completion(&priv->xfer_complete);
> +
> +	regmap_write(priv->regmap, NPCM_PECI_ADDR, addr);
> +	regmap_write(priv->regmap, NPCM_PECI_RD_LENGTH, NPCM_PECI_WR_LEN_MASK & req->rx.len);
> +	regmap_write(priv->regmap, NPCM_PECI_WR_LENGTH, NPCM_PECI_WR_LEN_MASK & req->tx.len);
> +
> +	if (req->tx.len) {
> +		regmap_write(priv->regmap, NPCM_PECI_CMD, req->tx.buf[0]);
> +
> +		for (i = 0; i < (req->tx.len - 1); i++)
> +			regmap_write(priv->regmap, NPCM_PECI_DAT_INOUT(i), req->tx.buf[i + 1]);
> +	}
> +
> +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
> +	dev_dbg(priv->dev, "addr : %#02x, tx.len : %#02x, rx.len : %#02x\n",
> +		addr, req->tx.len, req->rx.len);
> +	print_hex_dump_bytes("TX : ", DUMP_PREFIX_NONE, req->tx.buf, req->tx.len);
> +#endif

The preprocessor guards are not needed, as it’s taken care of in 
`include/linux/printk.h`. Also in other parts of the patch.

[…]

> +module_platform_driver(npcm_peci_driver);
> +
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_DESCRIPTION("NPCM PECI driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PECI);

Also add an entry to `MAINTAINERS`, if Tomer is going to be the maintainer?


Kind regards,

Paul
