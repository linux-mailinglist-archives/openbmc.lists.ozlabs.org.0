Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2157D9C92
	for <lists+openbmc@lfdr.de>; Fri, 27 Oct 2023 17:07:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TxLZBfZO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SH5cs6MmZz3cRj
	for <lists+openbmc@lfdr.de>; Sat, 28 Oct 2023 02:07:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TxLZBfZO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH5cF3d7gz3c1B;
	Sat, 28 Oct 2023 02:07:09 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a7fb84f6ceso16819537b3.1;
        Fri, 27 Oct 2023 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698419224; x=1699024024; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mo3O0p+CzwKWAWB1pfHPZ/CuSeHzf50SCiiPDlGgfRM=;
        b=TxLZBfZOiCzHZ7SODSuR3MjZEldOA1j5M9PCsQyi4o5Wrn0tpHYMwYckJlhIOPhvB8
         iVoisH2ExMgoRIi9U5qKUkgZOqJk3/8Y/jZXYtycdCWIaOhWfidgAn8d43taX56LEmjN
         QVDRTs/0lEcC2/ll9erPbabmHHhMHQDr9Qm+5vXVvEj05CWKiIKZ6/fgmynjtn+slpj2
         PEEORZkW6dr5E+y6I+iNoNmPmQU4OMKgY07AKeDBg+EAKIn+owS4Zm8REnerRV7+7xlD
         VHaV0Tuk59J1+a2A25I8G6Fc7x02LG0f/IZPdKnQf0jHsmt+QKiDPhQjYjQYM/L9a9vh
         QT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698419224; x=1699024024;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mo3O0p+CzwKWAWB1pfHPZ/CuSeHzf50SCiiPDlGgfRM=;
        b=vOeVX0FPN58fA5KP6wAiMAsOUYZmPR0gpBFDdSUorJyi9NljJzsjCjXMjSsQMFqgpf
         8Z0uIwEOMZcjMZA4nKRN/WTYltvpznn21RAWnbdreVjveTDNpHkvtUcEUsZrEtCe8Pou
         klnEMp8AOj5Pot0IviWFeO1iZb5Ej3Fh16TWm9Ohn8FSvQkl+gFiNJtMvBbAmmK4wct6
         yFepmgFRnV9Jkir1n3Zj0tAy0wa7sBqld/Bgv5XA0rKlqJzjfC2U9xewFhLBrBn22VLb
         /HCy30+pLtnw+Y2uufQ4jRjG/l200JzgtdoaTMJC9QtziXZ6aQD6Jy30Z9tE4CUzEszN
         lRnA==
X-Gm-Message-State: AOJu0Yxa4wvnu9FdeX8l4foTzmTY73jKbXlDJUakv7ok0w3dDGirK9Uh
	DsWgq8+HS/zYJOzE2J90d9U=
X-Google-Smtp-Source: AGHT+IEUA15s9csObhGY1VaWPXTJtNoAaDlDKUPl616L6wjUxkjVM3XBSTS10OJ6jaS8PfKdZ/8TuQ==
X-Received: by 2002:a05:690c:f88:b0:593:47ff:bd7 with SMTP id df8-20020a05690c0f8800b0059347ff0bd7mr3474380ywb.46.1698419223770;
        Fri, 27 Oct 2023 08:07:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u84-20020a818457000000b005af9da2225bsm753862ywf.20.2023.10.27.08.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 08:07:03 -0700 (PDT)
Message-ID: <22b4d0d7-ee50-2b64-ef0a-745b166230ea@roeck-us.net>
Date: Fri, 27 Oct 2023 08:07:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] watchdog: aspeed: Add support for aspeed,reset-mask
 DT property
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, "Milton D. Miller II" <mdmii@outlook.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20230922104231.1434-4-zev@bewilderbeest.net>
 <20230922104231.1434-6-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230922104231.1434-6-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, Eddie James <eajames@linux.ibm.com>, =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/22/23 03:42, Zev Weiss wrote:
> This property allows the device-tree to specify how the Aspeed
> watchdog timer's reset mask register(s) should be set, so that
> peripherals can be individually exempted from (or opted in to) being
> reset when the watchdog timer expires.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/aspeed_wdt.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index b72a858bbac7..b4773a6aaf8c 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -79,6 +79,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>   #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
>   #define WDT_CLEAR_TIMEOUT_STATUS	0x14
>   #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
> +#define WDT_RESET_MASK1		0x1c
> +#define WDT_RESET_MASK2		0x20
>   
>   /*
>    * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
> @@ -402,6 +404,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   
>   	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
>   		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
> +		u32 reset_mask[2];
> +		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
>   		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>   
>   		reg &= wdt->cfg->ext_pulse_width_mask;
> @@ -419,6 +423,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   			reg |= WDT_OPEN_DRAIN_MAGIC;
>   
>   		writel(reg, wdt->base + WDT_RESET_WIDTH);
> +
> +		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
> +		if (!ret) {
> +			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
> +			if (nrstmask > 1)
> +				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
> +		}
>   	}
>   
>   	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {

