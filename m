Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5069DA7A
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 02:15:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HTsd1xgSzDqSJ
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 10:15:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GUuYMNh/"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HTrn2QmgzDqJs;
 Tue, 27 Aug 2019 10:14:33 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d85so12894196pfd.2;
 Mon, 26 Aug 2019 17:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nJ8C78NoAqVqSum3LuoxAwskIWISqkgXdmo5sYpNHfk=;
 b=GUuYMNh/Zq9M6fu3kKwUR7xomor6vHtCuypnWT895hvqEeOCsaQgqtTUlpLfLT1S+o
 NkpHhFzliH5Lcd84Iu2vU+E93qYlREQSqB5+xntHrnTGwYhb6XslmoRGqDumw2vz8Cor
 gEEwJ/AjDkn2qUKos9LEGcfdNXCSjKxjhehiLRsTJy7tM9CAV4p+NEyo6yGR1FF55cjV
 OE/DMCIAu3bKaQj0ARtBGTikFBgjgIdsC53XHtFkTBr4qbZXUy/w/E9S7pqRNYzi8Wt1
 bPf/p5vnV6zh1RU0pVL4/yFQGTGekQqeYVcjLyQIac4bJBvIcasZ8ywgiG6Fd4tStHiT
 rLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nJ8C78NoAqVqSum3LuoxAwskIWISqkgXdmo5sYpNHfk=;
 b=E1Wp4uAUXU2IkP4YlG8UeW/LZtEio0RNNLRhKVu+EsitJfD1nqWI5j/ogFbuNQDHV1
 dqAy0ondy+hmmSQPVluqVQ+X1SDkEOuF7mcM/3EtDxI9Xu6mvdtgJTgThqBbC6NywDQu
 QKgpQvsVu8fiQAUJQEJlTDFR20FqZIxiAGlztMXgkqzybO0CXP56BRUCBel8y33tKq1i
 Ml4V5sDHUH4q3hly2oE2tVmn6Y9TNuCsFe1kbcdExx5RdiEi46G8sg537W6ZWz1DGkhu
 DJNdO0zcVRxW/yu2vtO9eQP0namgiIM0oOxp16D6csTXsH9fS6g8muCDs3fogiNWU7nB
 jJ5Q==
X-Gm-Message-State: APjAAAWxaUtUzC7ml12it8lJU8acEamfaltBNa5KgjXj3tVfzPy/7/y6
 ObZDDmGVHGy926tsQUbLMoM=
X-Google-Smtp-Source: APXvYqxvhXCKutjPnT5nWH3BMk7cObsbeQwIEFqub1CAyoV7XPoqs0YnakBp1Z0eeWOxE2cRwsTUlw==
X-Received: by 2002:a63:460d:: with SMTP id t13mr18245482pga.205.1566864869792; 
 Mon, 26 Aug 2019 17:14:29 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id j11sm4723844pfa.113.2019.08.26.17.14.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 17:14:29 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] watchdog/aspeed: add support for dual boot
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-4-i.mikhaylov@yadro.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0df27d36-b45f-2059-6ead-a09ceb4b7605@roeck-us.net>
Date: Mon, 26 Aug 2019 17:14:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826104636.19324-4-i.mikhaylov@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/26/19 3:46 AM, Ivan Mikhaylov wrote:
> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> to clear out boot code source and re-enable access to the primary SPI flash
> chip while booted via wdt2 from the alternate chip.
> 
> AST2400 datasheet says:
> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> register WDT30.bit[1]."
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 62 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..bbc42847c0e3 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -53,6 +53,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define   WDT_CTRL_ENABLE		BIT(0)
>   #define WDT_TIMEOUT_STATUS	0x10
>   #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
> +#define WDT_CLEAR_TIMEOUT_STATUS	0x14
> +#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
>   
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -165,6 +167,57 @@ static int aspeed_wdt_restart(struct watchdog_device *wdd,
>   	return 0;
>   }
>   
> +/* access_cs0 shows if cs0 is accessible, hence the reverted bit */
> +static ssize_t access_cs0_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)

This and other multi-line declarations do not appear to be aligned
with '('.

> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +	uint32_t status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> +
> +	return sprintf(buf, "%u\n",
> +			!(status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY));
> +}
> +
> +static ssize_t access_cs0_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t size)
> +{
> +	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 10, &val))
> +		return -EINVAL;
> +
> +	if (val)
> +		writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> +
> +	return size;
> +}
> +
> +/*
> + * At alternate side the 'access_cs0' sysfs node provides:
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
The above needs to be in the sysfs attribute documentation as well.

> + * This option can be used with wdt2 (watchdog1) only.

This implies a specific watchdog numbering which is not guaranteed.
Someone might implement a system with some external watchdog.

> + */
> +static DEVICE_ATTR_RW(access_cs0);
> +
> +static struct attribute *bswitch_attrs[] = {
> +	&dev_attr_access_cs0.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(bswitch);
> +
>   static const struct watchdog_ops aspeed_wdt_ops = {
>   	.start		= aspeed_wdt_start,
>   	.stop		= aspeed_wdt_stop,
> @@ -306,9 +359,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	}
>   
>   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
>   		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>   
> +		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
> +			of_device_is_compatible(np, "aspeed,ast2500-wdt"))
> +			wdt->wdd.groups = bswitch_groups;

Kind of odd that the attribute only exists if the system booted from the
second flash, but if that is what you want I won't object. Just make sure
that this is explained properly.

> +	}
> +
> +	dev_set_drvdata(dev, wdt);
> +
>   	return devm_watchdog_register_device(dev, &wdt->wdd);
>   }
>   
> 

