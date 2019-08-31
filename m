Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBEA44E4
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 17:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LKMb3FKpzDr2p
	for <lists+openbmc@lfdr.de>; Sun,  1 Sep 2019 01:02:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CuCpBywj"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LKLL1QZGzDr0V;
 Sun,  1 Sep 2019 01:01:27 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d10so468936pgo.5;
 Sat, 31 Aug 2019 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Z3F2/OBM2r9MZXkNsTFN/E8FK5FABjqdMx5/AO1nG/g=;
 b=CuCpBywjeSbor/AUATEjJGeahuzzcf61kGRBxkCn9VujZBwt1OH7GBtazWd8HWWZ9V
 uxDdha5Hkvd2WhaTH8sAlRpaXL+Sdo0o7Mq89dpGqtnhSkfhlfaSXCQiFMNKFCu/Bp6W
 TgTMsPUw+KHQzZ6efA51vBlWkuMvzoHQLk5ywEnngDLduCoJl7Rr0oZSTLAMfTIAb2md
 V3xxwyGQzyfuXqA+dazV/1F+2tjLV/+qIwZV9MSlmmmkhlmyNmEWuVv0ze729MlqqPVF
 MJcATu8EWdnyFLtZZcCmk8Epyiv0aVbE7/tlOz1AiUbSaSKe6B43hnp0MEY8b8g/jet+
 gmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Z3F2/OBM2r9MZXkNsTFN/E8FK5FABjqdMx5/AO1nG/g=;
 b=j4XpBWgLrT4vXIU222G3siivuCgyV/5ak2V7y0srfq/uBAhk5AVPzpCF+HGKkX/cnT
 Mu1iYF0ig0ZCV60/CpLh1gvlTnUI+KKj5nYCBUxSIMFkWJY5jSJdPdZDUQNELZFfnbvH
 Xav7YB5uNyzuUb/q+canWR30mxpNBitSuLrnWXfqrcWmHZ6ZGq1dp5oRFISgp1/WjCuU
 kKnK9hIDZnDvpJ86d71ClyTt/UVWPaL4xaTZuteBPYdIG60OO7CXhK1Hb2PTF8iMR9he
 gRXAw7+eh60SXNG/v8h5f95+7qccbQx3jw0frH/ATdHQd0XNzet0SrXGISuHLfQmAkgM
 j4Zg==
X-Gm-Message-State: APjAAAXu/9t8bahYcP6RH08g5e9KcYLP4dVeAXDeoXp7UlQib6z61pGT
 gSPLc4WI+yuL9sOY8bkq1Ic=
X-Google-Smtp-Source: APXvYqxXttPAlJ1qKQngtS+ANawEYl7YbL2EVX15AVZnZuJHMlbx6iKicR8YpvckL1STr06dOyGfww==
X-Received: by 2002:a17:90a:17aa:: with SMTP id
 q39mr4272622pja.106.1567263683947; 
 Sat, 31 Aug 2019 08:01:23 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id v18sm11994233pgl.87.2019.08.31.08.01.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 31 Aug 2019 08:01:23 -0700 (PDT)
Date: Sat, 31 Aug 2019 08:01:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v4 3/4] watchdog/aspeed: add support for dual boot
Message-ID: <20190831150122.GA7207@roeck-us.net>
References: <20190828102402.13155-1-i.mikhaylov@yadro.com>
 <20190828102402.13155-4-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828102402.13155-4-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 01:24:01PM +0300, Ivan Mikhaylov wrote:
> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> to clear out boot code source and re-enable access to the primary SPI flash
> chip while booted via wdt2 from the alternate chip.
> 
> AST2400 datasheet says:
> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> re-directed to CS1#. And CS0# is not accessible under this mode. To access
> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> register WDT30.bit[1]."
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/aspeed_wdt.c | 65 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..125dbd349b00 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -53,6 +53,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>  #define   WDT_CTRL_ENABLE		BIT(0)
>  #define WDT_TIMEOUT_STATUS	0x10
>  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define WDT_CLEAR_TIMEOUT_STATUS	0x14
> +#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
>  
>  /*
>   * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -165,6 +167,60 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>  	return 0;
>  }
>  
> +/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
> +static ssize_t access_cs0_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> +
> +	return sprintf(buf, "%u\n",
> +		      !(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
> +}
> +
> +static ssize_t access_cs0_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t size)
> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 10, &val))
> +		return -EINVAL;
> +
> +	if (val)
> +		writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> +		       wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> +
> +	return size;
> +}
> +
> +/*
> + * This attribute exists only if the system has booted from the alternate
> + * flash with 'alt-boot' option.
> + *
> + * At alternate flash the 'access_cs0' sysfs node provides:
> + *   ast2400: a way to get access to the primary SPI flash chip at CS0
> + *            after booting from the alternate chip at CS1.
> + *   ast2500: a way to restore the normal address mapping from
> + *            (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
> + *
> + * Clearing the boot code selection and timeout counter also resets to the
> + * initial state the chip select line mapping. When the SoC is in normal
> + * mapping state (i.e. booted from CS0), clearing those bits does nothing for
> + * both versions of the SoC. For alternate boot mode (booted from CS1 due to
> + * wdt2 expiration) the behavior differs as described above.
> + *
> + * This option can be used with wdt2 (watchdog1) only.
> + */
> +static DEVICE_ATTR_RW(access_cs0);
> +
> +static struct attribute *bswitch_attrs[] = {
> +	&dev_attr_access_cs0.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(bswitch);
> +
>  static const struct watchdog_ops aspeed_wdt_ops = {
>  	.start		= aspeed_wdt_start,
>  	.stop		= aspeed_wdt_stop,
> @@ -306,9 +362,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  	}
>  
>  	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
>  		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>  
> +		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
> +		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
> +			wdt->wdd.groups = bswitch_groups;
> +	}
> +
> +	dev_set_drvdata(dev, wdt);
> +
>  	return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>  
