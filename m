Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0C49C3C98
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 12:00:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xn65r4hlLz3bZq
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 22:00:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731322826;
	cv=none; b=Qzcr6uPfksGNtQufdr7qABTk/69+es/xxepj9cjVAcDYGc/6zb1j+eSXPHtn1vfwahJVJUPQhPzIMSsjGiXlCurvzEeTb6EFvz8jzrwbrWOblGn6WqpFLsj5HSPZXFo+3PqAJjJXHYkmt+yOPg4xMHIy9jHms3bh+45sWbpReFuZ4vZH7WaFi0xsvnmTcJq26hN8wT8A4pHCytqOooddHfFZTi5+6NDNrfytJDvXHOiynHVQ9OTl+6LU9jk/Fdy72HFLI+FGyZYSjbVK9C5j/zHopHd4+9BR+V1U2jYplTHWOg6kf05LsP/+AeXadqKgoq8i2gdtr6HZUPlRMFjE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731322826; c=relaxed/relaxed;
	bh=WtWnewh6ssMh9fFFavvh/PBE+TNvtVqD8l0d1wosr1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lxuC3CB27bTyjUnXhNp4bgT4bwN4j4EjeydIK4TzPAY0XsnzhpLGFQEotYWl5REhrKw9EKTGPNMQFkunxwDf+Im/ZbfPx3vA5+W0O4CHgDIBqVbqQKZMn+9ZQBVQ8l9kkSE/A8yejGWFcOKDlEguyK+jTD4Cng1R2ZXiJ0yPT4Eps3nB8kaGTeRsAvMYwMddCeKXmw17Dz95tbGQwzhVccGZ9psnsqdwPSC13EUA/qWixsXiG2mEdvbHuTpmT3QYKiTFZNFZ0VcJH8tJhtekZpon2D+XmhVjPl9SttP3dfivpXiSavaevNTrJCCnNsHP5hodsvxNh93ZUwvlR+hVAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=YRVLi8rU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=YRVLi8rU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xn65f2XCgz2yDr
	for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 22:00:21 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4316cce103dso55395045e9.3
        for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1731322816; x=1731927616; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtWnewh6ssMh9fFFavvh/PBE+TNvtVqD8l0d1wosr1w=;
        b=YRVLi8rUqCpcN30AJTKOASk0wwHDhUnqBjwse1ZCsPA+7pLYsUszWAUFzT0ae/NUQC
         l2OpjwCMfuBEF6Os8bWL9TDVFEl3rXDFYnKsn2XziWS8xq3RKgPcK+Us7wDTKkSD8IqS
         MlUK/yHcPwJUKxlyeY2HjPv9CyFZhSgbn9E00f1SPLN7li54SsnSPj6G9/LD5cXA/HwK
         1MDYuknX/SqjEcUCo+wdyJ+Bfg31GHQfd8Zo/97x5VUr7jUCjAHs59n5/MdDuHD8/7kW
         bELuc0wCEnplO3FsFK5hPPrhYUyCKW8HoBkeRGi0gUCmU4EvfQLlkR16N5Xw+wmi49u8
         /ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731322816; x=1731927616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtWnewh6ssMh9fFFavvh/PBE+TNvtVqD8l0d1wosr1w=;
        b=SOIxYFlrPqopMRrOZbfsbVoZ2v9FnlzcNheNqA9eRmGR/Sn2gOs6rMHG6uWtYfnJKH
         L/PHUexZrigFIWiA/+l6cqQIPDcTzXc4YJDNpzeDgDMGQ6DvoOw9wTLcmXBCAr/fBksc
         PwYKo+B+ftfKzl5INZJh+fHdt3Bd9SDXFsgWaJyXRuGeIQpr78AHKRTwqVu5+g6jJ2sX
         2BYfwAHSIRoxaL3GzaCe6CmlHaSowfipM/sNGiLgLWb5rxTPU9GVpvPl/V60RRPs+60r
         dNU3Fq9z7Ve34ZtFDVae1eQiDxrR9kzUZeln74nLatHHViQF31/uwDQ6dI10npf4uR0u
         dSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcvEoObRea5KLLdCM8DKo6yyimBkKnHxDv4iPEjxG7j/jLRoFENRxp8UJBQnMQFBZObZOp6WTl@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxa28D4Er7DkK4eoSjHeDsphffl/4nwtWdbNoO91+06fdXM44Nu
	cYNMytib2Zt4Kz0I3i3C9TnezuYb4wcwu2uKPXrwVPa1RrsYhxVN48y2fn9JMIU=
X-Google-Smtp-Source: AGHT+IG1lFS+bB1WIeamnsdNJ348FT/clmXe8mVnq+OpbpsC+6FRgGMcaoqCokcl7YlNmSZmmi/4Kg==
X-Received: by 2002:a05:600d:b:b0:431:555d:e184 with SMTP id 5b1f17b1804b1-432bb355338mr120014405e9.25.1731322815503;
        Mon, 11 Nov 2024 03:00:15 -0800 (PST)
Received: from [192.168.50.50] ([27.63.251.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e2a31sm170130105e9.36.2024.11.11.03.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 03:00:15 -0800 (PST)
Message-ID: <9717830f-0efe-4921-81ab-40fa0cb143e9@9elements.com>
Date: Mon, 11 Nov 2024 16:30:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
 benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
 andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20241007035235.2254138-1-ryan_chen@aspeedtech.com>
 <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
Content-Language: en-US
From: Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20241007035235.2254138-3-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

I've tested the driver changes in my machine
based on "SOC: AST2600-A3".

I faced some issue testing the driver.
While the driver functions correctly in
Normal mode, I encountered issues when attempting
to run it in DMA and BUFF modes. Given the
instability in these modes, I suspect there may
be misconfigurations in my device tree setup.

Could you please provide a sample configuration for
the device tree that would ensure stable operation
of the driver in both DMA and BUFF modes?

Thank you for your support.

Regards,
Naresh


On 07-10-2024 09:22:34, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The new register mode have separate register
> set to control i2c controller and target. This patch is for i2c
> controller mode driver.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>   drivers/i2c/busses/Kconfig       |   11 +
>   drivers/i2c/busses/Makefile      |    1 +
>   drivers/i2c/busses/i2c-ast2600.c | 1032 ++++++++++++++++++++++++++++++
>   3 files changed, 1044 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-ast2600.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a22f9125322a..abfb027350d4 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -410,6 +410,17 @@ config I2C_ALTERA
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-altera.
>   
> +config I2C_AST2600
> +	tristate "Aspeed I2C v2 Controller"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	select I2C_SMBUS
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  Aspeed I2C controller with new register set.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-ast2600.
> +
>   config I2C_ASPEED
>   	tristate "Aspeed I2C Controller"
>   	depends on ARCH_ASPEED || COMPILE_TEST
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 78d0561339e5..5665b60b1566 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
>   obj-$(CONFIG_I2C_ALTERA)	+= i2c-altera.o
>   obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
>   obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
> +obj-$(CONFIG_I2C_AST2600)	+= i2c-ast2600.o
>   obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
>   i2c-at91-objs			:= i2c-at91-core.o i2c-at91-master.o
>   ifeq ($(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL),y)
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-ast2600.c
> new file mode 100644
> index 000000000000..17ba0ee77c27
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1032 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ASPEED AST2600 new register set I2C controller driver
> + *
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +#include <asm/unaligned.h>
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/i2c-smbus.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/minmax.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +#include <linux/string_helpers.h>
> +
> +#define AST2600_I2CG_ISR			0x00
> +#define AST2600_I2CG_SLAVE_ISR		0x04
> +#define AST2600_I2CG_OWNER		0x08
> +#define AST2600_I2CG_CTRL		0x0C
> +#define AST2600_I2CG_CLK_DIV_CTRL	0x10
> +
> +#define AST2600_I2CG_SLAVE_PKT_NAK	BIT(4)
> +#define AST2600_I2CG_M_S_SEPARATE_INTR	BIT(3)
> +#define AST2600_I2CG_CTRL_NEW_REG	BIT(2)
> +#define AST2600_I2CG_CTRL_NEW_CLK_DIV	BIT(1)
> +#define AST2600_GLOBAL_INIT	\
> +	(AST2600_I2CG_CTRL_NEW_REG | AST2600_I2CG_CTRL_NEW_CLK_DIV)
> +/*
> + * APB clk : 100Mhz
> + * div	: scl		: baseclk [APB/((div/2) + 1)] : tBuf [1/bclk * 16]
> + * I2CG10[31:24] base clk4 for i2c auto recovery timeout counter (0xC6)
> + * I2CG10[23:16] base clk3 for Standard-mode (100Khz) min tBuf 4.7us
> + * 0x3c : 100.8Khz	: 3.225Mhz					  : 4.96us
> + * 0x3d : 99.2Khz	: 3.174Mhz					  : 5.04us
> + * 0x3e : 97.65Khz	: 3.125Mhz					  : 5.12us
> + * 0x40 : 97.75Khz	: 3.03Mhz					  : 5.28us
> + * 0x41 : 99.5Khz	: 2.98Mhz					  : 5.36us (default)
> + * I2CG10[15:8] base clk2 for Fast-mode (400Khz) min tBuf 1.3us
> + * 0x12 : 400Khz	: 10Mhz						  : 1.6us
> + * I2CG10[7:0] base clk1 for Fast-mode Plus (1Mhz) min tBuf 0.5us
> + * 0x08 : 1Mhz		: 20Mhz						  : 0.8us
> + */
> +#define I2CCG_DIV_CTRL 0xC6411208
> +
> +/* 0x00 : I2CC Controller/Target Function Control Register  */
> +#define AST2600_I2CC_FUN_CTRL		0x00
> +#define AST2600_I2CC_SLAVE_ADDR_RX_EN		BIT(20)
> +#define AST2600_I2CC_MASTER_RETRY_MASK		GENMASK(19, 18)
> +#define AST2600_I2CC_MASTER_RETRY(x)		(((x) & GENMASK(1, 0)) << 18)
> +#define AST2600_I2CC_BUS_AUTO_RELEASE		BIT(17)
> +#define AST2600_I2CC_M_SDA_LOCK_EN			BIT(16)
> +#define AST2600_I2CC_MULTI_MASTER_DIS		BIT(15)
> +#define AST2600_I2CC_M_SCL_DRIVE_EN			BIT(14)
> +#define AST2600_I2CC_MSB_STS				BIT(9)
> +#define AST2600_I2CC_SDA_DRIVE_1T_EN		BIT(8)
> +#define AST2600_I2CC_M_SDA_DRIVE_1T_EN		BIT(7)
> +#define AST2600_I2CC_M_HIGH_SPEED_EN		BIT(6)
> +/* reserver 5 : 2 */
> +#define AST2600_I2CC_SLAVE_EN			BIT(1)
> +#define AST2600_I2CC_MASTER_EN			BIT(0)
> +
> +/* 0x04 : I2CC Controller/Target Clock and AC Timing Control Register #1 */
> +#define AST2600_I2CC_AC_TIMING		0x04
> +#define AST2600_I2CC_TTIMEOUT(x)			(((x) & GENMASK(4, 0)) << 24)
> +#define AST2600_I2CC_TCKHIGHMIN(x)			(((x) & GENMASK(3, 0)) << 20)
> +#define AST2600_I2CC_TCKHIGH(x)			(((x) & GENMASK(3, 0)) << 16)
> +#define AST2600_I2CC_TCKLOW(x)			(((x) & GENMASK(3, 0)) << 12)
> +#define AST2600_I2CC_THDDAT(x)			(((x) & GENMASK(1, 0)) << 10)
> +#define AST2600_I2CC_TOUTBASECLK(x)			(((x) & GENMASK(1, 0)) << 8)
> +#define AST2600_I2CC_TBASECLK(x)			((x) & GENMASK(3, 0))
> +
> +/* 0x08 : I2CC Controller/Target Transmit/Receive Byte Buffer Register */
> +#define AST2600_I2CC_STS_AND_BUFF		0x08
> +#define AST2600_I2CC_TX_DIR_MASK			GENMASK(31, 29)
> +#define AST2600_I2CC_SDA_OE				BIT(28)
> +#define AST2600_I2CC_SDA_O				BIT(27)
> +#define AST2600_I2CC_SCL_OE				BIT(26)
> +#define AST2600_I2CC_SCL_O				BIT(25)
> +
> +#define AST2600_I2CC_SCL_LINE_STS			BIT(18)
> +#define AST2600_I2CC_SDA_LINE_STS			BIT(17)
> +#define AST2600_I2CC_BUS_BUSY_STS			BIT(16)
> +
> +#define AST2600_I2CC_GET_RX_BUFF(x)			(((x) >> 8) & GENMASK(7, 0))
> +
> +/* 0x0C : I2CC Controller/Target Pool Buffer Control Register  */
> +#define AST2600_I2CC_BUFF_CTRL		0x0C
> +#define AST2600_I2CC_GET_RX_BUF_LEN(x)      (((x) & GENMASK(29, 24)) >> 24)
> +#define AST2600_I2CC_SET_RX_BUF_LEN(x)		(((((x) - 1) & GENMASK(4, 0)) << 16) | BIT(0))
> +#define AST2600_I2CC_SET_TX_BUF_LEN(x)		(((((x) - 1) & GENMASK(4, 0)) << 8) | BIT(0))
> +#define AST2600_I2CC_GET_TX_BUF_LEN(x)      ((((x) & GENMASK(12, 8)) >> 8) + 1)
> +
> +/* 0x10 : I2CM Controller Interrupt Control Register */
> +#define AST2600_I2CM_IER			0x10
> +/* 0x14 : I2CM Controller Interrupt Status Register   : WC */
> +#define AST2600_I2CM_ISR			0x14
> +
> +#define AST2600_I2CM_PKT_TIMEOUT			BIT(18)
> +#define AST2600_I2CM_PKT_ERROR			BIT(17)
> +#define AST2600_I2CM_PKT_DONE			BIT(16)
> +
> +#define AST2600_I2CM_BUS_RECOVER_FAIL		BIT(15)
> +#define AST2600_I2CM_SDA_DL_TO			BIT(14)
> +#define AST2600_I2CM_BUS_RECOVER			BIT(13)
> +#define AST2600_I2CM_SMBUS_ALT			BIT(12)
> +
> +#define AST2600_I2CM_SCL_LOW_TO			BIT(6)
> +#define AST2600_I2CM_ABNORMAL			BIT(5)
> +#define AST2600_I2CM_NORMAL_STOP			BIT(4)
> +#define AST2600_I2CM_ARBIT_LOSS			BIT(3)
> +#define AST2600_I2CM_RX_DONE			BIT(2)
> +#define AST2600_I2CM_TX_NAK				BIT(1)
> +#define AST2600_I2CM_TX_ACK				BIT(0)
> +
> +/* 0x18 : I2CM Controller Command/Status Register   */
> +#define AST2600_I2CM_CMD_STS		0x18
> +#define AST2600_I2CM_PKT_ADDR(x)			(((x) & GENMASK(6, 0)) << 24)
> +#define AST2600_I2CM_PKT_EN				BIT(16)
> +#define AST2600_I2CM_SDA_OE_OUT_DIR			BIT(15)
> +#define AST2600_I2CM_SDA_O_OUT_DIR			BIT(14)
> +#define AST2600_I2CM_SCL_OE_OUT_DIR			BIT(13)
> +#define AST2600_I2CM_SCL_O_OUT_DIR			BIT(12)
> +#define AST2600_I2CM_RECOVER_CMD_EN			BIT(11)
> +
> +#define AST2600_I2CM_RX_DMA_EN			BIT(9)
> +#define AST2600_I2CM_TX_DMA_EN			BIT(8)
> +/* Command Bit */
> +#define AST2600_I2CM_RX_BUFF_EN			BIT(7)
> +#define AST2600_I2CM_TX_BUFF_EN			BIT(6)
> +#define AST2600_I2CM_STOP_CMD			BIT(5)
> +#define AST2600_I2CM_RX_CMD_LAST			BIT(4)
> +#define AST2600_I2CM_RX_CMD				BIT(3)
> +
> +#define AST2600_I2CM_TX_CMD				BIT(1)
> +#define AST2600_I2CM_START_CMD			BIT(0)
> +
> +/* 0x1C : I2CM Controller DMA Transfer Length Register	 */
> +#define AST2600_I2CM_DMA_LEN		0x1C
> +/* Tx Rx support length 1 ~ 4096 */
> +#define AST2600_I2CM_SET_RX_DMA_LEN(x)	((((x) & GENMASK(11, 0)) << 16) | BIT(31))
> +#define AST2600_I2CM_SET_TX_DMA_LEN(x)	(((x) & GENMASK(11, 0)) | BIT(15))
> +
> +/* 0x20 : I2CS Target Interrupt Control Register   */
> +#define AST2600_I2CS_IER			0x20
> +/* 0x24 : I2CS Target Interrupt Status Register	 */
> +#define AST2600_I2CS_ISR			0x24
> +
> +#define AST2600_I2CS_ADDR_INDICATE_MASK	GENMASK(31, 30)
> +#define AST2600_I2CS_SLAVE_PENDING			BIT(29)
> +
> +#define AST2600_I2CS_WAIT_TX_DMA			BIT(25)
> +#define AST2600_I2CS_WAIT_RX_DMA			BIT(24)
> +
> +#define AST2600_I2CS_ADDR3_NAK			BIT(22)
> +#define AST2600_I2CS_ADDR2_NAK			BIT(21)
> +#define AST2600_I2CS_ADDR1_NAK			BIT(20)
> +
> +#define AST2600_I2CS_ADDR_MASK			GENMASK(19, 18)
> +#define AST2600_I2CS_PKT_ERROR			BIT(17)
> +#define AST2600_I2CS_PKT_DONE			BIT(16)
> +#define AST2600_I2CS_INACTIVE_TO			BIT(15)
> +
> +#define AST2600_I2CS_SLAVE_MATCH			BIT(7)
> +#define AST2600_I2CS_ABNOR_STOP			BIT(5)
> +#define AST2600_I2CS_STOP				BIT(4)
> +#define AST2600_I2CS_RX_DONE_NAK			BIT(3)
> +#define AST2600_I2CS_RX_DONE			BIT(2)
> +#define AST2600_I2CS_TX_NAK				BIT(1)
> +#define AST2600_I2CS_TX_ACK				BIT(0)
> +
> +/* 0x28 : I2CS Target CMD/Status Register   */
> +#define AST2600_I2CS_CMD_STS		0x28
> +#define AST2600_I2CS_ACTIVE_ALL			GENMASK(18, 17)
> +#define AST2600_I2CS_PKT_MODE_EN			BIT(16)
> +#define AST2600_I2CS_AUTO_NAK_NOADDR		BIT(15)
> +#define AST2600_I2CS_AUTO_NAK_EN			BIT(14)
> +
> +#define AST2600_I2CS_ALT_EN				BIT(10)
> +#define AST2600_I2CS_RX_DMA_EN			BIT(9)
> +#define AST2600_I2CS_TX_DMA_EN			BIT(8)
> +#define AST2600_I2CS_RX_BUFF_EN			BIT(7)
> +#define AST2600_I2CS_TX_BUFF_EN			BIT(6)
> +#define AST2600_I2CS_RX_CMD_LAST			BIT(4)
> +
> +#define AST2600_I2CS_TX_CMD				BIT(2)
> +
> +#define AST2600_I2CS_DMA_LEN		0x2C
> +#define AST2600_I2CS_SET_RX_DMA_LEN(x)	(((((x) - 1) & GENMASK(11, 0)) << 16) | BIT(31))
> +#define AST2600_I2CS_SET_TX_DMA_LEN(x)	((((x) - 1) & GENMASK(11, 0)) | BIT(15))
> +
> +/* I2CM Controller DMA Tx Buffer Register   */
> +#define AST2600_I2CM_TX_DMA			0x30
> +/* I2CM Controller DMA Rx Buffer Register	*/
> +#define AST2600_I2CM_RX_DMA			0x34
> +/* I2CS Target DMA Tx Buffer Register   */
> +#define AST2600_I2CS_TX_DMA			0x38
> +/* I2CS Target DMA Rx Buffer Register   */
> +#define AST2600_I2CS_RX_DMA			0x3C
> +
> +#define AST2600_I2CS_ADDR_CTRL		0x40
> +
> +#define	AST2600_I2CS_ADDR3_MASK		GENMASK(22, 16)
> +#define	AST2600_I2CS_ADDR2_MASK		GENMASK(14, 8)
> +#define	AST2600_I2CS_ADDR1_MASK		GENMASK(6, 0)
> +
> +#define AST2600_I2CM_DMA_LEN_STS		0x48
> +#define AST2600_I2CS_DMA_LEN_STS		0x4C
> +
> +#define AST2600_I2C_GET_TX_DMA_LEN(x)		((x) & GENMASK(12, 0))
> +#define AST2600_I2C_GET_RX_DMA_LEN(x)        (((x) & GENMASK(28, 16)) >> 16)
> +
> +/* 0x40 : Target Device Address Register */
> +#define AST2600_I2CS_ADDR3_ENABLE			BIT(23)
> +#define AST2600_I2CS_ADDR3(x)			((x) << 16)
> +#define AST2600_I2CS_ADDR2_ENABLE			BIT(15)
> +#define AST2600_I2CS_ADDR2(x)			((x) << 8)
> +#define AST2600_I2CS_ADDR1_ENABLE			BIT(7)
> +#define AST2600_I2CS_ADDR1(x)			(x)
> +
> +#define I2C_TARGET_MSG_BUF_SIZE		256
> +
> +#define AST2600_I2C_DMA_SIZE		4096
> +
> +#define CONTROLLER_TRIGGER_LAST_STOP	(AST2600_I2CM_RX_CMD_LAST | AST2600_I2CM_STOP_CMD)
> +#define TARGET_TRIGGER_CMD	(AST2600_I2CS_ACTIVE_ALL | AST2600_I2CS_PKT_MODE_EN)
> +
> +#define AST_I2C_TIMEOUT_CLK		0x2
> +
> +enum xfer_mode {
> +	BYTE_MODE,
> +	BUFF_MODE,
> +	DMA_MODE,
> +};
> +
> +struct ast2600_i2c_bus {
> +	struct i2c_adapter	adap;
> +	struct device		*dev;
> +	void __iomem		*reg_base;
> +	struct regmap		*global_regs;
> +	struct reset_control	*rst;
> +	struct clk		*clk;
> +	struct i2c_timings	timing_info;
> +	struct completion	cmd_complete;
> +	struct i2c_msg		*msgs;
> +	u8			*controller_dma_safe_buf;
> +	dma_addr_t		controller_dma_addr;
> +	u32			apb_clk;
> +	u32			timeout;
> +	int			irq;
> +	int			cmd_err;
> +	int			msgs_index;
> +	int			msgs_count;
> +	int			controller_xfer_cnt;
> +	size_t			buf_index;
> +	size_t			buf_size;
> +	enum xfer_mode		mode;
> +	bool			multi_master;
> +	/* Buffer mode */
> +	void __iomem		*buf_base;
> +	struct i2c_smbus_alert_setup	alert_data;
> +};
> +
> +static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	unsigned long base_clk[16];
> +	int baseclk_idx = 0;
> +	int divisor = 0;
> +	u32 clk_div_reg;
> +	u32 scl_low;
> +	u32 scl_high;
> +	u32 data;
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, &clk_div_reg);
> +
> +	for (int i = 0; i < ARRAY_SIZE(base_clk); i++) {
> +		if (i == 0)
> +			base_clk[i] = i2c_bus->apb_clk;
> +		else if (i < 5)
> +			base_clk[i] = (i2c_bus->apb_clk * 2) /
> +			   (((clk_div_reg >> ((i - 1) * 8)) & GENMASK(7, 0)) + 2);
> +		else
> +			base_clk[i] = base_clk[4] >> (i - 5);
> +
> +		if ((base_clk[i] / i2c_bus->timing_info.bus_freq_hz) <= 32) {
> +			baseclk_idx = i;
> +			divisor = DIV_ROUND_UP(base_clk[i], i2c_bus->timing_info.bus_freq_hz);
> +			break;
> +		}
> +	}
> +	baseclk_idx = min(baseclk_idx, 15);
> +	divisor = min(divisor, 32);
> +	scl_low = min(divisor * 9 / 16 - 1, 15);
> +	scl_high = (divisor - scl_low - 2) & GENMASK(3, 0);
> +	data = (scl_high - 1) << 20 | scl_high << 16 | scl_low << 12 | baseclk_idx;
> +	if (i2c_bus->timeout) {
> +		data |= AST2600_I2CC_TOUTBASECLK(AST_I2C_TIMEOUT_CLK);
> +		data |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
> +	}
> +
> +	return data;
> +}
> +
> +static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	int ret = 0;
> +	u32 ctrl;
> +	int r;
> +
> +	dev_dbg(i2c_bus->dev, "%d-bus recovery bus [%x]\n", i2c_bus->adap.nr, state);
> +
> +	ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	/* Disable controller */
> +	writel(ctrl & ~(AST2600_I2CC_MASTER_EN | AST2600_I2CC_SLAVE_EN),
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	writel(readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) | AST2600_I2CC_MASTER_EN,
> +	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	i2c_bus->cmd_err = 0;
> +
> +	/* Check 0x14's SDA and SCL status */
> +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (!(state & AST2600_I2CC_SDA_LINE_STS) && (state & AST2600_I2CC_SCL_LINE_STS)) {
> +		writel(AST2600_I2CM_RECOVER_CMD_EN, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		r = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> +		if (r == 0) {
> +			dev_dbg(i2c_bus->dev, "recovery timed out\n");
> +			writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +			return -ETIMEDOUT;
> +		} else if (i2c_bus->cmd_err) {
> +			dev_dbg(i2c_bus->dev, "recovery error\n");
> +			ret = -EPROTO;
> +		}
> +	}
> +
> +	/* Recovery done */
> +	state = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	if (state & AST2600_I2CC_BUS_BUSY_STS) {
> +		dev_dbg(i2c_bus->dev, "Can't recover bus [%x]\n", state);
> +		ret = -EPROTO;
> +	}
> +
> +	/* restore original controller setting */
> +	writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	return ret;
> +}
> +
> +static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	int ret;
> +
> +	cmd |= AST2600_I2CM_PKT_EN;
> +	xfer_len = msg->len - i2c_bus->controller_xfer_cnt;
> +	if (xfer_len > AST2600_I2C_DMA_SIZE)
> +		xfer_len = AST2600_I2C_DMA_SIZE;
> +	else if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +		cmd |= AST2600_I2CM_STOP_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD) {
> +		cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
> +		i2c_bus->controller_dma_safe_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> +		if (!i2c_bus->controller_dma_safe_buf)
> +			return -ENOMEM;
> +		i2c_bus->controller_dma_addr =
> +			dma_map_single(i2c_bus->dev, i2c_bus->controller_dma_safe_buf,
> +				       msg->len, DMA_TO_DEVICE);
> +		ret = dma_mapping_error(i2c_bus->dev, i2c_bus->controller_dma_addr);
> +		if (ret) {
> +			i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf, msg, false);
> +			i2c_bus->controller_dma_safe_buf = NULL;
> +			return ret;
> +		}
> +	}
> +
> +	if (xfer_len) {
> +		cmd |= AST2600_I2CM_TX_DMA_EN | AST2600_I2CM_TX_CMD;
> +		writel(AST2600_I2CM_SET_TX_DMA_LEN(xfer_len - 1),
> +		       i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> +		writel(i2c_bus->controller_dma_addr + i2c_bus->controller_xfer_cnt,
> +		       i2c_bus->reg_base + AST2600_I2CM_TX_DMA);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	u32 wbuf_dword;
> +	int xfer_len;
> +	int i;
> +
> +	cmd |= AST2600_I2CM_PKT_EN;
> +	xfer_len = msg->len - i2c_bus->controller_xfer_cnt;
> +	if (xfer_len > i2c_bus->buf_size)
> +		xfer_len = i2c_bus->buf_size;
> +	else if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +		cmd |= AST2600_I2CM_STOP_CMD;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if (xfer_len) {
> +		cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
> +		/*
> +		 * The controller's buffer register supports dword writes only.
> +		 * Therefore, write dwords to the buffer register in a 4-byte aligned,
> +		 * and write the remaining unaligned data at the end.
> +		 */
> +		for (i = 0; i < xfer_len; i += 4) {
> +			int xfer_cnt = i2c_bus->controller_xfer_cnt + i;
> +
> +			switch (min(xfer_len - i, 4) % 4) {
> +			case 1:
> +				wbuf_dword = msg->buf[xfer_cnt];
> +				break;
> +			case 2:
> +				wbuf_dword = get_unaligned_le16(&msg->buf[xfer_cnt]);
> +				break;
> +			case 3:
> +				wbuf_dword = get_unaligned_le24(&msg->buf[xfer_cnt]);
> +				break;
> +			default:
> +				wbuf_dword = get_unaligned_le32(&msg->buf[xfer_cnt]);
> +				break;
> +			}
> +			writel(wbuf_dword, i2c_bus->buf_base + i);
> +		}
> +		writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
> +		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_byte_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +
> +	xfer_len = msg->len - i2c_bus->controller_xfer_cnt;
> +
> +	cmd |= AST2600_I2CM_PKT_EN;
> +
> +	if (cmd & AST2600_I2CM_START_CMD)
> +		cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
> +
> +	if ((i2c_bus->msgs_index + 1 == i2c_bus->msgs_count) &&
> +	    ((i2c_bus->controller_xfer_cnt + 1) == msg->len))
> +		cmd |= AST2600_I2CM_STOP_CMD;
> +
> +	if (xfer_len) {
> +		cmd |= AST2600_I2CM_TX_CMD;
> +		writel(msg->buf[i2c_bus->controller_xfer_cnt],
> +		       i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_dma_rx(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	u32 cmd;
> +	int ret;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) |
> +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_DMA_EN;
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		xfer_len = 1;
> +	} else if (msg->len > AST2600_I2C_DMA_SIZE) {
> +		xfer_len = AST2600_I2C_DMA_SIZE;
> +	} else {
> +		xfer_len = msg->len;
> +		if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +			cmd |= CONTROLLER_TRIGGER_LAST_STOP;
> +	}
> +	writel(AST2600_I2CM_SET_RX_DMA_LEN(xfer_len - 1), i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> +	i2c_bus->controller_dma_safe_buf = i2c_get_dma_safe_msg_buf(msg, 1);
> +	if (!i2c_bus->controller_dma_safe_buf)
> +		return -ENOMEM;
> +	i2c_bus->controller_dma_addr =
> +		dma_map_single(i2c_bus->dev, i2c_bus->controller_dma_safe_buf,
> +			       msg->len, DMA_FROM_DEVICE);
> +	ret = dma_mapping_error(i2c_bus->dev, i2c_bus->controller_dma_addr);
> +	if (ret) {
> +		i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf, msg, false);
> +		i2c_bus->controller_dma_safe_buf = NULL;
> +		return ret;
> +	}
> +	writel(i2c_bus->controller_dma_addr, i2c_bus->reg_base + AST2600_I2CM_RX_DMA);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_buff_rx(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	int xfer_len;
> +	u32 cmd;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) |
> +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_BUFF_EN;
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");
> +		xfer_len = 1;
> +	} else if (msg->len > i2c_bus->buf_size) {
> +		xfer_len = i2c_bus->buf_size;
> +	} else {
> +		xfer_len = msg->len;
> +		if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +			cmd |= CONTROLLER_TRIGGER_LAST_STOP;
> +	}
> +	writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_setup_byte_rx(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	u32 cmd;
> +
> +	cmd = AST2600_I2CM_PKT_EN | AST2600_I2CM_PKT_ADDR(msg->addr) |
> +	      AST2600_I2CM_START_CMD | AST2600_I2CM_RX_CMD;
> +
> +	if (msg->flags & I2C_M_RECV_LEN) {
> +		dev_dbg(i2c_bus->dev, "smbus read\n");
> +	} else if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count) {
> +		if (msg->len == 1)
> +			cmd |= CONTROLLER_TRIGGER_LAST_STOP;
> +	}
> +
> +	writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +
> +	return 0;
> +}
> +
> +static int ast2600_i2c_do_start(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +
> +	/* send start */
> +	dev_dbg(i2c_bus->dev, "[%d] %s %d byte%s %s 0x%02x\n",
> +		i2c_bus->msgs_index, str_read_write(msg->flags & I2C_M_RD),
> +		msg->len, str_plural(msg->len),
> +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);
> +
> +	i2c_bus->controller_xfer_cnt = 0;
> +	i2c_bus->buf_index = 0;
> +
> +	if (msg->flags & I2C_M_RD) {
> +		if (i2c_bus->mode == DMA_MODE)
> +			return ast2600_i2c_setup_dma_rx(i2c_bus);
> +		else if (i2c_bus->mode == BUFF_MODE)
> +			return ast2600_i2c_setup_buff_rx(i2c_bus);
> +		else
> +			return ast2600_i2c_setup_byte_rx(i2c_bus);
> +	} else {
> +		if (i2c_bus->mode == DMA_MODE)
> +			return ast2600_i2c_setup_dma_tx(AST2600_I2CM_START_CMD, i2c_bus);
> +		else if (i2c_bus->mode == BUFF_MODE)
> +			return ast2600_i2c_setup_buff_tx(AST2600_I2CM_START_CMD, i2c_bus);
> +		else
> +			return ast2600_i2c_setup_byte_tx(AST2600_I2CM_START_CMD, i2c_bus);
> +	}
> +}
> +
> +static int ast2600_i2c_irq_err_to_errno(u32 irq_status)
> +{
> +	if (irq_status & AST2600_I2CM_ARBIT_LOSS)
> +		return -EAGAIN;
> +	if (irq_status & (AST2600_I2CM_SDA_DL_TO | AST2600_I2CM_SCL_LOW_TO))
> +		return -EBUSY;
> +	if (irq_status & (AST2600_I2CM_ABNORMAL))
> +		return -EPROTO;
> +
> +	return 0;
> +}
> +
> +static void ast2600_i2c_controller_package_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
> +{
> +	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
> +	u32 cmd = AST2600_I2CM_PKT_EN;
> +	int xfer_len;
> +	int i;
> +
> +	sts &= ~AST2600_I2CM_PKT_DONE;
> +	writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +	switch (sts) {
> +	case AST2600_I2CM_PKT_ERROR:
> +		i2c_bus->cmd_err = -EAGAIN;
> +		complete(&i2c_bus->cmd_complete);
> +		break;
> +	case AST2600_I2CM_PKT_ERROR | AST2600_I2CM_TX_NAK: /* a0 fix for issue */
> +		fallthrough;
> +	case AST2600_I2CM_PKT_ERROR | AST2600_I2CM_TX_NAK | AST2600_I2CM_NORMAL_STOP:
> +		i2c_bus->cmd_err = -ENXIO;
> +		complete(&i2c_bus->cmd_complete);
> +		break;
> +	case AST2600_I2CM_NORMAL_STOP:
> +		/* write 0 byte only have stop isr */
> +		i2c_bus->msgs_index++;
> +		if (i2c_bus->msgs_index < i2c_bus->msgs_count) {
> +			if (ast2600_i2c_do_start(i2c_bus)) {
> +				i2c_bus->cmd_err = -ENOMEM;
> +				complete(&i2c_bus->cmd_complete);
> +			}
> +		} else {
> +			i2c_bus->cmd_err = i2c_bus->msgs_index;
> +			complete(&i2c_bus->cmd_complete);
> +		}
> +		break;
> +	case AST2600_I2CM_TX_ACK:
> +	case AST2600_I2CM_TX_ACK | AST2600_I2CM_NORMAL_STOP:
> +		if (i2c_bus->mode == DMA_MODE)
> +			xfer_len = AST2600_I2C_GET_TX_DMA_LEN(readl(i2c_bus->reg_base +
> +							  AST2600_I2CM_DMA_LEN_STS));
> +		else if (i2c_bus->mode == BUFF_MODE)
> +			xfer_len = AST2600_I2CC_GET_TX_BUF_LEN(readl(i2c_bus->reg_base +
> +							   AST2600_I2CC_BUFF_CTRL));
> +		else
> +			xfer_len = 1;
> +
> +		i2c_bus->controller_xfer_cnt += xfer_len;
> +
> +		if (i2c_bus->controller_xfer_cnt == msg->len) {
> +			if (i2c_bus->mode == DMA_MODE) {
> +				dma_unmap_single(i2c_bus->dev, i2c_bus->controller_dma_addr,
> +						 msg->len, DMA_TO_DEVICE);
> +				i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf,
> +							 msg, true);
> +				i2c_bus->controller_dma_safe_buf = NULL;
> +			}
> +			i2c_bus->msgs_index++;
> +			if (i2c_bus->msgs_index == i2c_bus->msgs_count) {
> +				i2c_bus->cmd_err = i2c_bus->msgs_index;
> +				complete(&i2c_bus->cmd_complete);
> +			} else {
> +				if (ast2600_i2c_do_start(i2c_bus)) {
> +					i2c_bus->cmd_err = -ENOMEM;
> +					complete(&i2c_bus->cmd_complete);
> +				}
> +			}
> +		} else {
> +			if (i2c_bus->mode == DMA_MODE)
> +				ast2600_i2c_setup_dma_tx(0, i2c_bus);
> +			else if (i2c_bus->mode == BUFF_MODE)
> +				ast2600_i2c_setup_buff_tx(0, i2c_bus);
> +			else
> +				ast2600_i2c_setup_byte_tx(0, i2c_bus);
> +		}
> +		break;
> +	case AST2600_I2CM_RX_DONE:
> +	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
> +		/* do next rx */
> +		if (i2c_bus->mode == DMA_MODE) {
> +			xfer_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
> +								    AST2600_I2CM_DMA_LEN_STS));
> +		} else if (i2c_bus->mode == BUFF_MODE) {
> +			xfer_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
> +								     AST2600_I2CC_BUFF_CTRL));
> +			for (i = 0; i < xfer_len; i++)
> +				msg->buf[i2c_bus->controller_xfer_cnt + i] =
> +					readb(i2c_bus->buf_base + 0x10 + i);
> +		} else {
> +			xfer_len = 1;
> +			msg->buf[i2c_bus->controller_xfer_cnt] =
> +				AST2600_I2CC_GET_RX_BUFF(readl(i2c_bus->reg_base +
> +						     AST2600_I2CC_STS_AND_BUFF));
> +		}
> +
> +		if (msg->flags & I2C_M_RECV_LEN) {
> +			msg->len = min_t(unsigned int, msg->buf[0], I2C_SMBUS_BLOCK_MAX);
> +			msg->len += ((msg->flags & I2C_CLIENT_PEC) ? 2 : 1);
> +			msg->flags &= ~I2C_M_RECV_LEN;
> +		}
> +		i2c_bus->controller_xfer_cnt += xfer_len;
> +
> +		if (i2c_bus->controller_xfer_cnt == msg->len) {
> +			if (i2c_bus->mode == DMA_MODE) {
> +				dma_unmap_single(i2c_bus->dev, i2c_bus->controller_dma_addr,
> +						 msg->len, DMA_FROM_DEVICE);
> +				i2c_put_dma_safe_msg_buf(i2c_bus->controller_dma_safe_buf,
> +							 msg, true);
> +				i2c_bus->controller_dma_safe_buf = NULL;
> +			}
> +
> +			i2c_bus->msgs_index++;
> +			if (i2c_bus->msgs_index == i2c_bus->msgs_count) {
> +				i2c_bus->cmd_err = i2c_bus->msgs_index;
> +				complete(&i2c_bus->cmd_complete);
> +			} else {
> +				if (ast2600_i2c_do_start(i2c_bus)) {
> +					i2c_bus->cmd_err = -ENOMEM;
> +					complete(&i2c_bus->cmd_complete);
> +				}
> +			}
> +		} else {
> +			/* next rx */
> +			cmd |= AST2600_I2CM_RX_CMD;
> +			if (i2c_bus->mode == DMA_MODE) {
> +				cmd |= AST2600_I2CM_RX_DMA_EN;
> +				xfer_len = msg->len - i2c_bus->controller_xfer_cnt;
> +				if (xfer_len > AST2600_I2C_DMA_SIZE) {
> +					xfer_len = AST2600_I2C_DMA_SIZE;
> +				} else {
> +					if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +						cmd |= CONTROLLER_TRIGGER_LAST_STOP;
> +				}
> +				writel(AST2600_I2CM_SET_RX_DMA_LEN(xfer_len - 1),
> +				       i2c_bus->reg_base + AST2600_I2CM_DMA_LEN);
> +				writel(i2c_bus->controller_dma_addr + i2c_bus->controller_xfer_cnt,
> +				       i2c_bus->reg_base + AST2600_I2CM_RX_DMA);
> +			} else if (i2c_bus->mode == BUFF_MODE) {
> +				cmd |= AST2600_I2CM_RX_BUFF_EN;
> +				xfer_len = msg->len - i2c_bus->controller_xfer_cnt;
> +				if (xfer_len > i2c_bus->buf_size) {
> +					xfer_len = i2c_bus->buf_size;
> +				} else {
> +					if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
> +						cmd |= CONTROLLER_TRIGGER_LAST_STOP;
> +				}
> +				writel(AST2600_I2CC_SET_RX_BUF_LEN(xfer_len),
> +				       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +			} else {
> +				if ((i2c_bus->msgs_index + 1 == i2c_bus->msgs_count) &&
> +				    ((i2c_bus->controller_xfer_cnt + 1) == msg->len)) {
> +					cmd |= CONTROLLER_TRIGGER_LAST_STOP;
> +				}
> +			}
> +			writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		}
> +		break;
> +	default:
> +		dev_dbg(i2c_bus->dev, "unhandled sts %x\n", sts);
> +		break;
> +	}
> +}
> +
> +static int ast2600_i2c_controller_irq(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	u32 sts = readl(i2c_bus->reg_base + AST2600_I2CM_ISR);
> +	u32 ctrl;
> +
> +	sts &= ~AST2600_I2CM_SMBUS_ALT;
> +
> +	if (AST2600_I2CM_BUS_RECOVER_FAIL & sts) {
> +		writel(AST2600_I2CM_BUS_RECOVER_FAIL, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		i2c_bus->cmd_err = -EPROTO;
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	if (AST2600_I2CM_BUS_RECOVER & sts) {
> +		writel(AST2600_I2CM_BUS_RECOVER, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		i2c_bus->cmd_err = 0;
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	i2c_bus->cmd_err = ast2600_i2c_irq_err_to_errno(sts);
> +	if (i2c_bus->cmd_err) {
> +		writel(AST2600_I2CM_PKT_DONE, i2c_bus->reg_base + AST2600_I2CM_ISR);
> +		complete(&i2c_bus->cmd_complete);
> +		return 1;
> +	}
> +
> +	if (AST2600_I2CM_PKT_DONE & sts) {
> +		ast2600_i2c_controller_package_irq(i2c_bus, sts);
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ast2600_i2c_bus_irq(int irq, void *dev_id)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = dev_id;
> +
> +	return IRQ_RETVAL(ast2600_i2c_controller_irq(i2c_bus));
> +}
> +
> +static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(adap);
> +	unsigned long timeout;
> +	int ret;
> +
> +	if (!i2c_bus->multi_master &&
> +	    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) & AST2600_I2CC_BUS_BUSY_STS)) {
> +		ret = ast2600_i2c_recover_bus(i2c_bus);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	i2c_bus->cmd_err = 0;
> +	i2c_bus->msgs = msgs;
> +	i2c_bus->msgs_index = 0;
> +	i2c_bus->msgs_count = num;
> +	reinit_completion(&i2c_bus->cmd_complete);
> +	ret = ast2600_i2c_do_start(i2c_bus);
> +	if (ret)
> +		goto controller_out;
> +	timeout = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
> +	if (timeout == 0) {
> +		u32 ctrl = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +		dev_dbg(i2c_bus->dev, "timeout isr[%x], sts[%x]\n",
> +			readl(i2c_bus->reg_base + AST2600_I2CM_ISR),
> +			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +		if (i2c_bus->multi_master &&
> +		    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
> +		    AST2600_I2CC_BUS_BUSY_STS))
> +			ast2600_i2c_recover_bus(i2c_bus);
> +
> +		ret = -ETIMEDOUT;
> +	} else {
> +		ret = i2c_bus->cmd_err;
> +	}
> +
> +	dev_dbg(i2c_bus->dev, "bus%d-m: %d end\n", i2c_bus->adap.nr, i2c_bus->cmd_err);
> +
> +controller_out:
> +	if (i2c_bus->mode == DMA_MODE) {
> +		kfree(i2c_bus->controller_dma_safe_buf);
> +		i2c_bus->controller_dma_safe_buf = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static void ast2600_i2c_init(struct ast2600_i2c_bus *i2c_bus)
> +{
> +	struct platform_device *pdev = to_platform_device(i2c_bus->dev);
> +	u32 fun_ctrl = AST2600_I2CC_BUS_AUTO_RELEASE | AST2600_I2CC_MASTER_EN;
> +
> +	/* I2C Reset */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +
> +	i2c_bus->multi_master = device_property_read_bool(&pdev->dev, "multi-master");
> +	if (!i2c_bus->multi_master)
> +		fun_ctrl |= AST2600_I2CC_MULTI_MASTER_DIS;
> +
> +	/* Enable Controller Mode */
> +	writel(fun_ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	/* disable target address */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
> +
> +	/* Set AC Timing */
> +	writel(ast2600_select_i2c_clock(i2c_bus), i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
> +
> +	/* Clear Interrupt */
> +	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CM_ISR);
> +}
> +
> +static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
> +}
> +
> +static const struct i2c_algorithm i2c_ast2600_algorithm = {
> +	.xfer = ast2600_i2c_controller_xfer,
> +	.functionality = ast2600_i2c_functionality,
> +};
> +
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret;
> +
> +	i2c_bus = devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;
> +
> +	i2c_bus->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_bus->reg_base))
> +		return PTR_ERR(i2c_bus->reg_base);
> +
> +	i2c_bus->rst = devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n");
> +
> +	reset_control_deassert(i2c_bus->rst);
> +
> +	i2c_bus->global_regs =
> +		syscon_regmap_lookup_by_phandle(dev_of_node(dev), "aspeed,global-regs");
> +	if (IS_ERR(i2c_bus->global_regs))
> +		return PTR_ERR(i2c_bus->global_regs);
> +
> +	regmap_read(i2c_bus->global_regs, AST2600_I2CG_CTRL, &global_ctrl);
> +	if ((global_ctrl & AST2600_GLOBAL_INIT) != AST2600_GLOBAL_INIT) {
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CTRL, AST2600_GLOBAL_INIT);
> +		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DIV_CTRL);
> +	}
> +
> +	i2c_bus->dev = dev;
> +	i2c_bus->mode = BUFF_MODE;
> +
> +	if (device_property_read_bool(dev, "aspeed,enable-dma"))
> +		i2c_bus->mode = DMA_MODE;
> +
> +	if (i2c_bus->mode == BUFF_MODE) {
> +		i2c_bus->buf_base = devm_platform_get_and_ioremap_resource(pdev, 1, &res);
> +		if (IS_ERR(i2c_bus->buf_base))
> +			i2c_bus->mode = BYTE_MODE;
> +		else
> +			i2c_bus->buf_size = resource_size(res) / 2;
> +	}
> +
> +	/*
> +	 * i2c timeout counter: use base clk4 1Mhz,
> +	 * per unit: 1/(1000/4096) = 4096us
> +	 */
> +	ret = device_property_read_u32(dev, "i2c-scl-clk-low-timeout-us", &i2c_bus->timeout);
> +	if (!ret)
> +		i2c_bus->timeout /= 4096;
> +
> +	init_completion(&i2c_bus->cmd_complete);
> +
> +	i2c_bus->irq = platform_get_irq(pdev, 0);
> +	if (i2c_bus->irq < 0)
> +		return i2c_bus->irq;
> +
> +	platform_set_drvdata(pdev, i2c_bus);
> +
> +	i2c_bus->clk = devm_clk_get(i2c_bus->dev, NULL);
> +	if (IS_ERR(i2c_bus->clk))
> +		return dev_err_probe(i2c_bus->dev, PTR_ERR(i2c_bus->clk), "Can't get clock\n");
> +
> +	i2c_bus->apb_clk = clk_get_rate(i2c_bus->clk);
> +
> +	i2c_parse_fw_timings(i2c_bus->dev, &i2c_bus->timing_info, true);
> +
> +	/* Initialize the I2C adapter */
> +	i2c_bus->adap.owner = THIS_MODULE;
> +	i2c_bus->adap.algo = &i2c_ast2600_algorithm;
> +	i2c_bus->adap.retries = 0;
> +	i2c_bus->adap.dev.parent = i2c_bus->dev;
> +	device_set_node(&i2c_bus->adap.dev, dev_fwnode(dev));
> +	i2c_bus->adap.algo_data = i2c_bus;
> +	strscpy(i2c_bus->adap.name, pdev->name);
> +	i2c_set_adapdata(&i2c_bus->adap, i2c_bus);
> +
> +	ast2600_i2c_init(i2c_bus);
> +
> +	ret = devm_request_irq(dev, i2c_bus->irq, ast2600_i2c_bus_irq, 0,
> +			       dev_name(dev), i2c_bus);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Unable to request irq %d\n", i2c_bus->irq);
> +
> +	writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +	       i2c_bus->reg_base + AST2600_I2CM_IER);
> +
> +	ret = devm_i2c_add_adapter(dev, &i2c_bus->adap);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void ast2600_i2c_remove(struct platform_device *pdev)
> +{
> +	struct ast2600_i2c_bus *i2c_bus = platform_get_drvdata(pdev);
> +
> +	/* Disable everything. */
> +	writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
> +	writel(0, i2c_bus->reg_base + AST2600_I2CM_IER);
> +}
> +
> +static const struct of_device_id ast2600_i2c_bus_of_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-i2cv2",
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);
> +
> +static struct platform_driver ast2600_i2c_bus_driver = {
> +	.probe = ast2600_i2c_probe,
> +	.remove = ast2600_i2c_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = ast2600_i2c_bus_of_table,
> +	},
> +};
> +
> +module_platform_driver(ast2600_i2c_bus_driver);
> +
> +MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
> +MODULE_DESCRIPTION("ASPEED AST2600 I2C Controller Driver");
> +MODULE_LICENSE("GPL");

