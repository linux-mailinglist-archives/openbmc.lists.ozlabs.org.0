Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57053B1AC3
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 11:28:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V9LW5VqKzF5LC
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 19:28:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=daniel.thompson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="QJ2EQbmd"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V9Kn6DbFzF5KZ
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 19:28:11 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id a11so21598130wrx.1
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 02:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KdWl9728cR3NNiz9k+CiAkkKPRvWRTcoTTHEAo/qVZc=;
 b=QJ2EQbmdNJEE9UMfwolykX8/l+ediIZaceAqN/IPpUYMTVgSE54U4qllmgRK3Ux0Zt
 0dMb6acTKqq+xSxWQ1c8QiCU+xtyZ9W2+IsHEcdwvoWCTdHOhlFalGEk3sLBEA8tyk7O
 q+UJO5xzm95lhGqDnvqYjGB2OKxAxguQ5FmXKe1ui6GE5P/B2N59jSn1XdcyHOV5VlBQ
 DhWfn/E7VNn6/Dwe9vExWiTu85nA99BxTpmylJmHXHJkAyraYOHDJ3XIWPKg2s7mra3O
 40sEk0ZoIndUm0C87iC/mOGsJ2JeVmYYqNVDoNgnjRNe8k4lU3zy/lq1rFPwI/iUg4M7
 Ccrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KdWl9728cR3NNiz9k+CiAkkKPRvWRTcoTTHEAo/qVZc=;
 b=XbrdFi6QskWupCR8hbJcOrC0630cPZZuTsTRVHS9myswBstkGePMwv9uS+ZGMCFnCW
 FYi4WeqBCinidQe1dt/PdMZtIbwgf8XHP9NbOFcE39ZdBWSKtv8fFOw9UNXzN4Z3swos
 Aryvr7hz76TvbO9Ba91bhT4H3uA9QQfSVSV7Dkj2KxX2Cf1C74TK7efuYN5Liyk2wtRK
 jRYqz+f5S8HJXT1z9XaOJhbmG1LGXnYJ1FfsTdN/ukc3TSdKdl106ncZpHvuO2DdKIQu
 Pf088wgPmxWTNqM6LDR3eQuO1xJ224KKxMmxG45eILDFim7MFUSKOv5oth8NUrh/lk1e
 SLgg==
X-Gm-Message-State: APjAAAWTvyqrR6mjtCkc+J2hLbgD1wQx1mxB2F4+WNh805ojvygtnhw8
 XJTkq5vkgsIhwZ/9nw995vAMXQ==
X-Google-Smtp-Source: APXvYqzdx/vM0/cxgvic+nxBUexn/uhZ9A+cfJck+MegqHD7tgtAwwwN4Psg7HJVSDd40ktpMINsVg==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr6314573wrm.15.1568366887451; 
 Fri, 13 Sep 2019 02:28:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id s10sm3659226wmf.48.2019.09.13.02.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 02:28:06 -0700 (PDT)
Date: Fri, 13 Sep 2019 10:28:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 2/2] hwrng: npcm: add NPCM RNG driver
Message-ID: <20190913092805.4bemarnbh6jo3lxh@holly.lan>
References: <20190912090149.7521-1-tmaimon77@gmail.com>
 <20190912090149.7521-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912090149.7521-3-tmaimon77@gmail.com>
User-Agent: NeoMutt/20180716
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
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, vkoul@kernel.org,
 robh+dt@kernel.org, mpm@selenic.com, venture@google.com, tglx@linutronix.de,
 jens.wiklander@linaro.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 12, 2019 at 12:01:49PM +0300, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Note, you are welcome to preseve this if you have to respin and
change directory based on Vinod's feedback...


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
> 
