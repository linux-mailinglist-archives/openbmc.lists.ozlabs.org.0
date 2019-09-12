Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33043BAD54
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:42:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBW23hmyzDqN1
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 14:42:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=vkoul@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ayIcBPmA"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tl7T6JtbzF4XL
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 02:47:49 +1000 (AEST)
Received: from localhost (unknown [117.99.85.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 522ED20830;
 Thu, 12 Sep 2019 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568306866;
 bh=Z7Klsx0EQczgLubsgIk5uElx4M0dhwRgXxx6ASoZUEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ayIcBPmAbnC7L3gNfW1IcX/cpM3lbEo/wtyftE897vJQn7yJSYI0N1JVJXFJlVwQ8
 beEkdFPhPb6AF3D9hpxXhyiC8ugc149ONF0A6JuGmSIbzybA7t9rneHrl75ObttLTQ
 jjjN1y5B/c1XJXTVR7yhix2mOuiH/MARRqFsMEA0=
Date: Thu, 12 Sep 2019 22:16:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v3 2/2] hwrng: npcm: add NPCM RNG driver
Message-ID: <20190912164638.GB4392@vkoul-mobl>
References: <20190912090149.7521-1-tmaimon77@gmail.com>
 <20190912090149.7521-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912090149.7521-3-tmaimon77@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 23 Sep 2019 14:40:35 +1000
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
Cc: mark.rutland@arm.com, sumit.garg@linaro.org, linux-crypto@vger.kernel.org,
 herbert@gondor.apana.org.au, arnd@arndb.de, devicetree@vger.kernel.org,
 avifishman70@gmail.com, gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 mpm@selenic.com, venture@google.com, tglx@linutronix.de,
 jens.wiklander@linaro.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12-09-19, 12:01, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.

Is this a true RNG or a psedo RNG, in case of latter it should be added
in drivers/crypto/. See crypto_register_rng()

> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/char/hw_random/Kconfig    |  13 +++
>  drivers/char/hw_random/Makefile   |   1 +
>  drivers/char/hw_random/npcm-rng.c | 186 ++++++++++++++++++++++++++++++
>  3 files changed, 200 insertions(+)
>  create mode 100644 drivers/char/hw_random/npcm-rng.c
> 
> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
> index 59f25286befe..87a1c30e7958 100644
> --- a/drivers/char/hw_random/Kconfig
> +++ b/drivers/char/hw_random/Kconfig
> @@ -440,6 +440,19 @@ config HW_RANDOM_OPTEE
>  
>  	  If unsure, say Y.
>  
> +config HW_RANDOM_NPCM
> +	tristate "NPCM Random Number Generator support"
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	default HW_RANDOM
> +	help
> + 	  This driver provides support for the Random Number
> +	  Generator hardware available in Nuvoton NPCM SoCs.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called npcm-rng.
> +
> + 	  If unsure, say Y.
> +
>  endif # HW_RANDOM
>  
>  config UML_RANDOM
> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
> index 7c9ef4a7667f..17b6d4e6d591 100644
> --- a/drivers/char/hw_random/Makefile
> +++ b/drivers/char/hw_random/Makefile
> @@ -39,3 +39,4 @@ obj-$(CONFIG_HW_RANDOM_MTK)	+= mtk-rng.o
>  obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
>  obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
>  obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
> +obj-$(CONFIG_HW_RANDOM_NPCM) += npcm-rng.o
> diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
> new file mode 100644
> index 000000000000..b7c8c7e13a49
> --- /dev/null
> +++ b/drivers/char/hw_random/npcm-rng.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology corporation.
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/init.h>
> +#include <linux/random.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/hw_random.h>
> +#include <linux/delay.h>
> +#include <linux/of_irq.h>
> +#include <linux/pm_runtime.h>
> +
> +#define NPCM_RNGCS_REG		0x00	/* Control and status register */
> +#define NPCM_RNGD_REG		0x04	/* Data register */
> +#define NPCM_RNGMODE_REG	0x08	/* Mode register */
> +
> +#define NPCM_RNG_CLK_SET_25MHZ	GENMASK(4, 3) /* 20-25 MHz */
> +#define NPCM_RNG_DATA_VALID	BIT(1)
> +#define NPCM_RNG_ENABLE		BIT(0)
> +#define NPCM_RNG_M1ROSEL	BIT(1)
> +
> +#define NPCM_RNG_TIMEOUT_USEC	20000
> +#define NPCM_RNG_POLL_USEC	1000
> +
> +#define to_npcm_rng(p)	container_of(p, struct npcm_rng, rng)
> +
> +struct npcm_rng {
> +	void __iomem *base;
> +	struct hwrng rng;
> +};
> +
> +static int npcm_rng_init(struct hwrng *rng)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +
> +	writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
> +	       priv->base + NPCM_RNGCS_REG);
> +
> +	return 0;
> +}
> +
> +static void npcm_rng_cleanup(struct hwrng *rng)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +
> +	writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
> +}
> +
> +static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
> +{
> +	struct npcm_rng *priv = to_npcm_rng(rng);
> +	int retval = 0;
> +	int ready;
> +
> +	pm_runtime_get_sync((struct device *)priv->rng.priv);
> +
> +	while (max >= sizeof(u32)) {
> +		if (wait) {
> +			if (readl_poll_timeout(priv->base + NPCM_RNGCS_REG,
> +					       ready,
> +					       ready & NPCM_RNG_DATA_VALID,
> +					       NPCM_RNG_POLL_USEC,
> +					       NPCM_RNG_TIMEOUT_USEC))
> +				break;
> +		} else {
> +			if ((readl(priv->base + NPCM_RNGCS_REG) &
> +			    NPCM_RNG_DATA_VALID) == 0)
> +				break;
> +		}
> +
> +		*(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
> +		retval += sizeof(u32);
> +		buf += sizeof(u32);
> +		max -= sizeof(u32);
> +	}
> +
> +	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
> +	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
> +
> +	return retval || !wait ? retval : -EIO;
> +}
> +
> +static int npcm_rng_probe(struct platform_device *pdev)
> +{
> +	struct npcm_rng *priv;
> +	struct resource *res;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	dev_set_drvdata(&pdev->dev, priv);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +#ifndef CONFIG_PM
> +	priv->rng.init = npcm_rng_init;
> +	priv->rng.cleanup = npcm_rng_cleanup;
> +#endif
> +	priv->rng.name = pdev->name;
> +	priv->rng.read = npcm_rng_read;
> +	priv->rng.priv = (unsigned long)&pdev->dev;
> +	priv->rng.quality = 1000;
> +
> +	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
> +
> +	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register rng device: %d\n",
> +			ret);
> +		pm_runtime_disable(&pdev->dev);
> +		pm_runtime_set_suspended(&pdev->dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int npcm_rng_remove(struct platform_device *pdev)
> +{
> +	struct npcm_rng *priv = platform_get_drvdata(pdev);
> +
> +	devm_hwrng_unregister(&pdev->dev, &priv->rng);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int npcm_rng_runtime_suspend(struct device *dev)
> +{
> +	struct npcm_rng *priv = dev_get_drvdata(dev);
> +
> +	npcm_rng_cleanup(&priv->rng);
> +
> +	return 0;
> +}
> +
> +static int npcm_rng_runtime_resume(struct device *dev)
> +{
> +	struct npcm_rng *priv = dev_get_drvdata(dev);
> +
> +	return npcm_rng_init(&priv->rng);
> +}
> +#endif
> +
> +static const struct dev_pm_ops npcm_rng_pm_ops = {
> +	SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
> +			   npcm_rng_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};
> +
> +static const struct of_device_id rng_dt_id[] = {
> +	{ .compatible = "nuvoton,npcm750-rng",  },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, rng_dt_id);
> +
> +static struct platform_driver npcm_rng_driver = {
> +	.driver = {
> +		.name		= "npcm-rng",
> +		.pm		= &npcm_rng_pm_ops,
> +		.of_match_table = of_match_ptr(rng_dt_id),
> +	},
> +	.probe		= npcm_rng_probe,
> +	.remove		= npcm_rng_remove,
> +};
> +
> +module_platform_driver(npcm_rng_driver);
> +
> +MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.18.0

-- 
~Vinod
