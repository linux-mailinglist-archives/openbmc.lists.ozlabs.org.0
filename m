Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DF38CBB4
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 19:14:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmtWc2N77z303n
	for <lists+openbmc@lfdr.de>; Sat, 22 May 2021 03:14:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BV5Dv0HT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BV5Dv0HT; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmtWJ2qt0z302V;
 Sat, 22 May 2021 03:14:19 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so10820853otg.9; 
 Fri, 21 May 2021 10:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=i/DEH4XPlbQY/GAcAQLF1MiUOk01m9bUndu1B0Q0p2Q=;
 b=BV5Dv0HT4uSHK02mYT6zN0hk40iQRR5Xpdfpu4QtHAAzKCSdM4Sis8Vs4vOJRFofzy
 /T9hgsH2rtOW3syQQdWfe0/wR2rmHaVjlErceHDQ5D0k/XbrtWnkIG4SNpREJ9u9DZrL
 QJuoAxvF2YbjE0vJc/CdH6vAyf/MS0wTgIxgSyzEJtYpbrVTjGyOYquNtKk+nXs/FjvJ
 WJXi4IGrYKs0/B6x8UZVFyZDpTbPpglAnp37MeUdzu4p6JtDq9pIbZDLopSyNfFp4JZk
 b1gh7vRTPD4rbovKIpBmqj/1pKGAhKAZ2tw7JUb7ZLUlbvptkcJYCyabMlYh0By0dpLV
 UKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=i/DEH4XPlbQY/GAcAQLF1MiUOk01m9bUndu1B0Q0p2Q=;
 b=X7Bk9z4/rTZd0s7GXhnf3n64tsvTFI6OKRPaTCaq/Ur++k1S4VgSy/c84omhUh33d+
 JSl+gJTMWS9izCpmThbhh2kWjrEnWy+wLIUTuSIR6Fb8MdL+a4WY0JWR5y7tYCxAdOT7
 RJoDFGdB5tPV9jreqLwSYyhRdmGZ7OgBoRDliql37XUvxVmWFh68synZCdsyy8xZqsXO
 oxOMiyyzk0B4N/QEtMzUSk+9jiJ0Y7gY9NU2kr4IXU7CunrOqPhvjoG/K6dMnrzxsrjV
 AVn8wzPeYI63Bm+yz0nPQCHv7p6+jUxZlEo0XbLtdQaH4mgY4G8SdvSL30UfY5jgZWGD
 B88Q==
X-Gm-Message-State: AOAM530j9v8yOyFzEhuEgrBMQysnGbC1c0WjNcxX48Gzpm8hz0HfmGxH
 uIp6pASeiizZlTv32UupCQ==
X-Google-Smtp-Source: ABdhPJzmHdxLbXoaJBp1/xmpAmOe0Q15yNBm3JriguNf2vFLBw/GS4NToO7dnR4UroPXKS2RE874yA==
X-Received: by 2002:a9d:644f:: with SMTP id m15mr9364980otl.99.1621617255792; 
 Fri, 21 May 2021 10:14:15 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id n13sm1286675oov.30.2021.05.21.10.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:14:14 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9c8f:21cb:3961:b550])
 by serve.minyard.net (Postfix) with ESMTPSA id A826D180105;
 Fri, 21 May 2021 17:14:13 +0000 (UTC)
Date: Fri, 21 May 2021 12:14:12 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 05/16] ipmi: kcs_bmc: Turn the driver data-structures
 inside-out
Message-ID: <20210521171412.GI2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-6-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510054213.1610760-6-andrew@aj.id.au>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 robh+dt@kernel.org, arnd@arndb.de, openipmi-developer@lists.sourceforge.net,
 zweiss@equinix.com, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 10, 2021 at 03:12:02PM +0930, Andrew Jeffery wrote:
> Make the KCS device drivers responsible for allocating their own memory.
> 
> Until now the private data for the device driver was allocated internal
> to the private data for the chardev interface. This coupling required
> the slightly awkward API of passing through the struct size for the
> driver private data to the chardev constructor, and then retrieving a
> pointer to the driver private data from the allocated chardev memory.
> 
> In addition to being awkward, the arrangement prevents the
> implementation of alternative userspace interfaces as the device driver
> private data is not independent.
> 
> Peel a layer off the onion and turn the data-structures inside out by
> exploiting container_of() and embedding `struct kcs_device` in the
> driver private data.

All in all a very nice cleanup.  A few nits inline.

> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Zev Weiss <zweiss@equinix.com>
> ---
>  drivers/char/ipmi/kcs_bmc.c           | 19 +++++++--
>  drivers/char/ipmi/kcs_bmc.h           | 12 ++----
>  drivers/char/ipmi/kcs_bmc_aspeed.c    | 56 +++++++++++++------------
>  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 60 ++++++++++++++++++---------
>  drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
>  5 files changed, 111 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> index ef5c48ffe74a..83da681bf49e 100644
> --- a/drivers/char/ipmi/kcs_bmc.c
> +++ b/drivers/char/ipmi/kcs_bmc.c
> @@ -44,12 +44,23 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
>  }
>  EXPORT_SYMBOL(kcs_bmc_handle_event);
>  
> -struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
> -struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
> +int kcs_bmc_ipmi_add_device(struct kcs_bmc *kcs_bmc);

The above (and it's remove function) should be in an include file.

> +void kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)

This should return an error so the probe can be failed and cleaned up
and so confusing message don't get printed after this in one case.

>  {
> -	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
> +	if (kcs_bmc_ipmi_add_device(kcs_bmc))
> +		pr_warn("Failed to add device for KCS channel %d\n",
> +			kcs_bmc->channel);
>  }
> -EXPORT_SYMBOL(kcs_bmc_alloc);
> +EXPORT_SYMBOL(kcs_bmc_add_device);
> +
> +int kcs_bmc_ipmi_remove_device(struct kcs_bmc *kcs_bmc);
> +void kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
> +{
> +	if (kcs_bmc_ipmi_remove_device(kcs_bmc))
> +		pr_warn("Failed to remove device for KCS channel %d\n",
> +			kcs_bmc->channel);
> +}
> +EXPORT_SYMBOL(kcs_bmc_remove_device);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
> index febea0c8deb4..b2e6b7a7fe62 100644
> --- a/drivers/char/ipmi/kcs_bmc.h
> +++ b/drivers/char/ipmi/kcs_bmc.h
> @@ -67,6 +67,8 @@ struct kcs_ioreg {
>  };
>  
>  struct kcs_bmc {
> +	struct device *dev;
> +
>  	spinlock_t lock;
>  
>  	u32 channel;
> @@ -94,17 +96,11 @@ struct kcs_bmc {
>  	u8 *kbuffer;
>  
>  	struct miscdevice miscdev;
> -
> -	unsigned long priv[];
>  };
>  
> -static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
> -{
> -	return kcs_bmc->priv;
> -}
> -
>  int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
> -struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel);
> +void kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
> +void kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
>  
>  u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
>  void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index 06628ca69750..5d433dea5714 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -61,6 +61,8 @@
>  #define LPC_STR4             0x11C
>  
>  struct aspeed_kcs_bmc {
> +	struct kcs_bmc kcs_bmc;
> +
>  	struct regmap *map;
>  };
>  
> @@ -69,9 +71,14 @@ struct aspeed_kcs_of_ops {
>  	int (*get_io_address)(struct platform_device *pdev);
>  };
>  
> +static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc *kcs_bmc)
> +{
> +	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
> +}
> +
>  static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>  {
> -	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
>  	u32 val = 0;
>  	int rc;
>  
> @@ -83,7 +90,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>  
>  static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>  {
> -	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
>  	int rc;
>  
>  	rc = regmap_write(priv->map, reg, data);
> @@ -92,7 +99,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>  
>  static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val)
>  {
> -	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
>  	int rc;
>  
>  	rc = regmap_update_bits(priv->map, reg, mask, val);
> @@ -114,7 +121,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val
>   */
>  static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
>  {
> -	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
>  
>  	switch (kcs_bmc->channel) {
>  	case 1:
> @@ -148,7 +155,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
>  
>  static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
>  {
> -	struct aspeed_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
>  
>  	switch (kcs_bmc->channel) {
>  	case 1:
> @@ -323,17 +330,16 @@ static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
>  static int aspeed_kcs_probe(struct platform_device *pdev)
>  {
>  	const struct aspeed_kcs_of_ops *ops;
> -	struct device *dev = &pdev->dev;
>  	struct aspeed_kcs_bmc *priv;
>  	struct kcs_bmc *kcs_bmc;
>  	struct device_node *np;
>  	int rc, channel, addr;
>  
> -	np = dev->of_node->parent;
> +	np = pdev->dev.of_node->parent;
>  	if (!of_device_is_compatible(np, "aspeed,ast2400-lpc-v2") &&
>  	    !of_device_is_compatible(np, "aspeed,ast2500-lpc-v2") &&
>  	    !of_device_is_compatible(np, "aspeed,ast2600-lpc-v2")) {
> -		dev_err(dev, "unsupported LPC device binding\n");
> +		dev_err(&pdev->dev, "unsupported LPC device binding\n");
>  		return -ENODEV;
>  	}
>  	ops = of_device_get_match_data(&pdev->dev);
> @@ -344,20 +350,22 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  	if (channel < 0)
>  		return channel;
>  
> -	kcs_bmc = kcs_bmc_alloc(&pdev->dev, sizeof(struct aspeed_kcs_bmc), channel);
> -	if (!kcs_bmc)
> +	addr = ops->get_io_address(pdev);
> +	if (addr < 0)
> +		return addr;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
>  		return -ENOMEM;
>  
> +	kcs_bmc = &priv->kcs_bmc;
> +	kcs_bmc->dev = &pdev->dev;
> +	kcs_bmc->channel = channel;
>  	kcs_bmc->ioreg = ast_kcs_bmc_ioregs[channel - 1];
>  	kcs_bmc->io_inputb = aspeed_kcs_inb;
>  	kcs_bmc->io_outputb = aspeed_kcs_outb;
>  	kcs_bmc->io_updateb = aspeed_kcs_updateb;
>  
> -	addr = ops->get_io_address(pdev);
> -	if (addr < 0)
> -		return addr;
> -
> -	priv = kcs_bmc_priv(kcs_bmc);
>  	priv->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
>  	if (IS_ERR(priv->map)) {
>  		dev_err(&pdev->dev, "Couldn't get regmap\n");
> @@ -370,29 +378,23 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
>  	if (rc)
>  		return rc;
>  
> -	dev_set_drvdata(dev, kcs_bmc);
> +	platform_set_drvdata(pdev, priv);
>  
>  	aspeed_kcs_enable_channel(kcs_bmc, true);
>  
> -	rc = misc_register(&kcs_bmc->miscdev);
> -	if (rc) {
> -		dev_err(dev, "Unable to register device\n");
> -		return rc;
> -	}
> +	kcs_bmc_add_device(&priv->kcs_bmc);
>  
> -	dev_dbg(&pdev->dev,
> -		"Probed KCS device %d (IDR=0x%x, ODR=0x%x, STR=0x%x)\n",
> -		kcs_bmc->channel, kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr,
> -		kcs_bmc->ioreg.str);
> +	dev_info(&pdev->dev, "Initialised channel %d at 0x%x\n", kcs_bmc->channel, addr);
>  
>  	return 0;
>  }
>  
>  static int aspeed_kcs_remove(struct platform_device *pdev)
>  {
> -	struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
> +	struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
> +	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
>  
> -	misc_deregister(&kcs_bmc->miscdev);
> +	kcs_bmc_remove_device(kcs_bmc);
>  
>  	return 0;
>  }
> diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> index 82c77994e481..5060643bf530 100644
> --- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> +++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> @@ -382,7 +382,7 @@ static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> -static const struct file_operations kcs_bmc_fops = {
> +static const struct file_operations kcs_bmc_ipmi_fops = {
>  	.owner          = THIS_MODULE,
>  	.open           = kcs_bmc_ipmi_open,
>  	.read           = kcs_bmc_ipmi_read,
> @@ -392,36 +392,58 @@ static const struct file_operations kcs_bmc_fops = {
>  	.unlocked_ioctl = kcs_bmc_ipmi_ioctl,
>  };
>  
> -struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
> -struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel)
> +int kcs_bmc_ipmi_add_device(struct kcs_bmc *kcs_bmc);
> +int kcs_bmc_ipmi_add_device(struct kcs_bmc *kcs_bmc)
>  {
> -	struct kcs_bmc *kcs_bmc;
> -
> -	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
> -	if (!kcs_bmc)
> -		return NULL;
> +	int rc;
>  
>  	spin_lock_init(&kcs_bmc->lock);
> -	kcs_bmc->channel = channel;
> -
>  	mutex_init(&kcs_bmc->mutex);
>  	init_waitqueue_head(&kcs_bmc->queue);
>  
> -	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> -	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> -	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	kcs_bmc->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	kcs_bmc->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> +	kcs_bmc->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
>  
>  	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> -	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
> -					       DEVICE_NAME, channel);
> +	kcs_bmc->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u",
> +					       DEVICE_NAME, kcs_bmc->channel);
>  	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
>  	    !kcs_bmc->miscdev.name)
> -		return NULL;
> -	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
> +		return -ENOMEM;
>  
> -	return kcs_bmc;
> +	kcs_bmc->miscdev.fops = &kcs_bmc_ipmi_fops;
> +
> +	rc = misc_register(&kcs_bmc->miscdev);
> +	if (rc) {
> +		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
> +		return rc;
> +	}
> +
> +	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_bmc->channel);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(kcs_bmc_ipmi_add_device);
> +
> +int kcs_bmc_ipmi_remove_device(struct kcs_bmc *kcs_bmc);
> +int kcs_bmc_ipmi_remove_device(struct kcs_bmc *kcs_bmc)
> +{
> +	misc_deregister(&kcs_bmc->miscdev);
> +
> +	spin_lock_irq(&kcs_bmc->lock);
> +	kcs_bmc->running = 0;
> +	kcs_bmc_ipmi_force_abort(kcs_bmc);
> +	spin_unlock_irq(&kcs_bmc->lock);
> +
> +	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
> +	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
> +	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
> +	devm_kfree(kcs_bmc->dev, kcs_bmc);
> +
> +	return 0;
>  }
> -EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
> +EXPORT_SYMBOL(kcs_bmc_ipmi_remove_device);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
> diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> index 1f44aadec9e8..f7b4e866f86e 100644
> --- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> +++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
> @@ -65,6 +65,8 @@ struct npcm7xx_kcs_reg {
>  };
>  
>  struct npcm7xx_kcs_bmc {
> +	struct kcs_bmc kcs_bmc;
> +
>  	struct regmap *map;
>  
>  	const struct npcm7xx_kcs_reg *reg;
> @@ -76,9 +78,14 @@ static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
>  	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie = KCS3IE },
>  };
>  
> +static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc *kcs_bmc)
> +{
> +	return container_of(kcs_bmc, struct npcm7xx_kcs_bmc, kcs_bmc);
> +}
> +
>  static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>  {
> -	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
>  	u32 val = 0;
>  	int rc;
>  
> @@ -90,7 +97,7 @@ static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
>  
>  static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>  {
> -	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
>  	int rc;
>  
>  	rc = regmap_write(priv->map, reg, data);
> @@ -99,7 +106,7 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
>  
>  static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 data)
>  {
> -	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
>  	int rc;
>  
>  	rc = regmap_update_bits(priv->map, reg, mask, data);
> @@ -108,7 +115,7 @@ static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 da
>  
>  static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
>  {
> -	struct npcm7xx_kcs_bmc *priv = kcs_bmc_priv(kcs_bmc);
> +	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
>  
>  	regmap_update_bits(priv->map, priv->reg->ctl, KCS_CTL_IBFIE,
>  			   enable ? KCS_CTL_IBFIE : 0);
> @@ -155,11 +162,10 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	kcs_bmc = kcs_bmc_alloc(dev, sizeof(*priv), chan);
> -	if (!kcs_bmc)
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
>  		return -ENOMEM;
>  
> -	priv = kcs_bmc_priv(kcs_bmc);
>  	priv->map = syscon_node_to_regmap(dev->parent->of_node);
>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Couldn't get regmap\n");
> @@ -167,6 +173,9 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
>  	}
>  	priv->reg = &npcm7xx_kcs_reg_tbl[chan - 1];
>  
> +	kcs_bmc = &priv->kcs_bmc;
> +	kcs_bmc->dev = &pdev->dev;
> +	kcs_bmc->channel = chan;
>  	kcs_bmc->ioreg.idr = priv->reg->dib;
>  	kcs_bmc->ioreg.odr = priv->reg->dob;
>  	kcs_bmc->ioreg.str = priv->reg->sts;
> @@ -174,31 +183,29 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
>  	kcs_bmc->io_outputb = npcm7xx_kcs_outb;
>  	kcs_bmc->io_updateb = npcm7xx_kcs_updateb;
>  
> -	dev_set_drvdata(dev, kcs_bmc);
> +	platform_set_drvdata(pdev, priv);
>  
>  	npcm7xx_kcs_enable_channel(kcs_bmc, true);
>  	rc = npcm7xx_kcs_config_irq(kcs_bmc, pdev);
>  	if (rc)
>  		return rc;
>  
> -	rc = misc_register(&kcs_bmc->miscdev);
> -	if (rc) {
> -		dev_err(dev, "Unable to register device\n");
> -		return rc;
> -	}
>  
>  	pr_info("channel=%u idr=0x%x odr=0x%x str=0x%x\n",
>  		chan,
>  		kcs_bmc->ioreg.idr, kcs_bmc->ioreg.odr, kcs_bmc->ioreg.str);
>  
> +	kcs_bmc_add_device(kcs_bmc);
> +
>  	return 0;
>  }
>  
>  static int npcm7xx_kcs_remove(struct platform_device *pdev)
>  {
> -	struct kcs_bmc *kcs_bmc = dev_get_drvdata(&pdev->dev);
> +	struct npcm7xx_kcs_bmc *priv = platform_get_drvdata(pdev);
> +	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
>  
> -	misc_deregister(&kcs_bmc->miscdev);
> +	kcs_bmc_remove_device(kcs_bmc);
>  
>  	return 0;
>  }
> -- 
> 2.27.0
> 
