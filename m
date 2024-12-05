Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B483B9E60C8
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 23:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y48dS63gzz3cCC
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2024 09:46:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733422968;
	cv=none; b=THLTHFqbxlR8yovpA4vOns6Qu8KKVfWZ38yWn/rS9EwYBWzrmPIDnG4qbrPNR6vo8NjcPmbL6rm6przlqNS+X2DE23QPlnDCArnpZg4YVd1JUPC16Yu88KtK7x49F3jhK75DYYDljJRr/FGIt2DaWgJLUl8LgehRa+Z8uXVVWICxR4FX/6+Yng0mWW4y/CFl80pde06HbGfCvmdtmbjsa7IvJkcwAYvM3S2czEfNF3CmgOnSuzBFJ5kCo0hlzK6uog9MDcNqsqMeoMFnWt66Z5p6vSeB32r/V2mmrEEX0QmCWJdAaVsnGAO/XkZKx1BaLrJ35mQPeG1XKBedwgEufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733422968; c=relaxed/relaxed;
	bh=5PrAtgjWhGUbT6fpAuSSwUHzgtH1B6FTI5RVBzwZwNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qp4NAPTllDbHw1yhBKf8hh8I2CECAtZ/qfZT88oocINwrM1jDCb7Klx7HC7xYOfTjTEs/wVxgc5BxJhWmqCYkgn0ihJZRoVpYzDY9F5/MPyZwA5sktd+x9xlXF6ZI8b5Pyoj6ANpeClxTZIWOfuUY0cblaYrmxNzLF7SMgS/DgpHnxz8giPQQFp1cEoumqctppcP/XU5WyuhcOtxb90KfyQ/r/0VV4mj/J9bCO8tEOEY8T6ib6VLZteve4eDiYvtN4GsXHZ2ojBQ2J9olrAU+7XrPmBEsLrAya2bvMlKvTTfqd/9ciA7e3zqCbj1sYrwomDLHaxCUcCtaiuLJJ/LRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jD+MUDI2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jD+MUDI2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=dlechner@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y42n13Ycvz2xCW
	for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2024 05:22:42 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-71d579bb207so430266a34.2
        for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2024 10:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733422958; x=1734027758; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PrAtgjWhGUbT6fpAuSSwUHzgtH1B6FTI5RVBzwZwNo=;
        b=jD+MUDI2PVpRSYhdMt0Fr6h/33fCUfr0dvpzphbtKSSY2b+NOoGyFAK1B2X67bWgLd
         2IbfRD3sHxzX4ANEVN3JO31i/u9AyQxppjOCdcs/5dsC5RAeZHf9A11lqg/hPYRjBIAY
         F+swD6F357RYPlIoQ6dFJC8wqddQqJxM79JTGXtw3mSiOippoxBkBkY1Veqc5hOXVEkm
         wcJPq+KzqGSPZzVB+VZxWkuxLb+gjoDCTniTc1pn1J6WIsXxliw/5OJhPPRH0eARrijt
         EDpT/gnxbT/P2sccv9iex/T6VD9k0jOfHpVCjMhFtZzg9/P/HaKcjq8DUOlt1LbgRZTl
         iWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733422958; x=1734027758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PrAtgjWhGUbT6fpAuSSwUHzgtH1B6FTI5RVBzwZwNo=;
        b=fe08OE0n/B/7KbvIJdvvpa6UBfiSfMyDAAoNxToFQ0jzCo9uUHulJr6my2uibYului
         YzmTlQ2ks7OB1uc98vS45F9xwf1QuKs3h9QmLu8ETOZsvQ1cL9Sv9b45bj+4rkbIVTCH
         md3OycpB7DymcBHBgKdj/KDAUTEt6ximKpwOhttKTVIj0d/5UazSQWgR8FWXbojRcHMu
         xyJSnWuHwZRFWxs3YLMb7k9AGpfRap7Pr/ml0poBQfC8qNrYxGAoVABDim2Bft2g1pIE
         AYRRI6oH1icIWknni42RCI8TSx3Z+B+gPiCg5m/v8NsbLDkMxxCQDTjf2VQv1z6AYs1O
         5TQA==
X-Gm-Message-State: AOJu0YzdOkLL1TwDfaWA9Og+wH5xvOdRBJ6CgDQP5B+5l8pnXU2jI9UW
	LAocRMK4tVLGB2wog6Taih61DTEuKd+SkO3N5BQkog0i3JbbVS9z4vx36Kfl488=
X-Gm-Gg: ASbGncu9AG2uYPpsZN4+ARM93RXdksTpO67H6onP+q3SIh3EMsw1qObwtRGJ/KhlirW
	3tKzg+5JhYx7TgTb2SbrFyd6PfIJ4DdzVCz5/w8IBKcJYEzErChyDWBssAveVMTQt7ZNVHP7qT1
	zfefOsHrlhtK3S4ScItlETdTP7J+nb+aThdFZWs5IQkzTpCaIhK6dwYtz8ktKlYwoSwVzx6SSY1
	tOChRFKzksUCwDByQBORDMSwRa69iJ9F+ZcAdsN1yVWIEi27a97sMY7B/BeTgr5H942/lJsnJP7
	6o1H1POzWzg=
X-Google-Smtp-Source: AGHT+IHJA/cbIOIYBSs859F5miq2GrUcx29X6pK5u63jJlhb4HI6Ohl70/7j3yniuY4qdJAn3J6PMg==
X-Received: by 2002:a05:6830:2a06:b0:71d:4733:b723 with SMTP id 46e09a7af769-71dcf4f5409mr21624a34.18.1733422957946;
        Thu, 05 Dec 2024 10:22:37 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71dc4a02506sm381948a34.47.2024.12.05.10.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 10:22:37 -0800 (PST)
Message-ID: <8f5ca298-54ba-4274-a35d-83be868fcfc8@baylibre.com>
Date: Thu, 5 Dec 2024 12:22:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
To: Eason Yang <j2anfernee@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 andriy.shevchenko@linux.intel.com, marcelo.schmitt@analog.com,
 olivier.moysan@foss.st.com, mitrutzceclan@gmail.com, tgamblin@baylibre.com,
 matteomartelli3@gmail.com, alisadariana@gmail.com, gstols@baylibre.com,
 thomas.bonnefille@bootlin.com, ramona.nechita@analog.com,
 mike.looijmans@topic.nl, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20241203091540.3695650-3-j2anfernee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 06 Dec 2024 09:46:33 +1100
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
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/3/24 3:15 AM, Eason Yang wrote:
> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> 
> NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
> 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
> independent alarm signals, and the all threshold values could be set for
> system protection without any timing delay. It also supports reset input
> RSTIN# to recover system from a fault condition.
> 
> Currently, only single-edge mode conversion and threshold events support.

In the code, there are channels set up for differential inputs. Should we
remove these until conversion and event support for them is added?

> 
> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/iio/adc/Kconfig   |  10 +
>  drivers/iio/adc/Makefile  |   1 +
>  drivers/iio/adc/nct720x.c | 533 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 545 insertions(+)
>  create mode 100644 drivers/iio/adc/nct720x.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bea10a846475..573b12f0cd4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2799,6 +2799,7 @@ F:	arch/arm/mach-npcm/
>  F:	arch/arm64/boot/dts/nuvoton/
>  F:	drivers/*/*/*npcm*
>  F:	drivers/*/*npcm*
> +F:	drivers/iio/adc/nct720x.c
>  F:	drivers/rtc/rtc-nct3018y.c
>  F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
>  F:	include/dt-bindings/clock/nuvoton,npcm845-clk.h
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 849c90203071..6eed518efa1c 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1048,6 +1048,16 @@ config NAU7802
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called nau7802.
>  
> +config NCT720X
> +	tristate "Nuvoton Instruments NCT7201 and NCT7202 Power Monitor"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the Nuvoton NCT7201 and
> +	  NCT7202 Voltage Monitor.
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nct720x.

Don't put "x" in the name, just call it nct7201. We always try to avoid
using "x" in the IIO subsystem because too often it causes problems in
the future.

> +
>  config NPCM_ADC
>  	tristate "Nuvoton NPCM ADC driver"
>  	depends on ARCH_NPCM || COMPILE_TEST
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index ee19afba62b7..89f5b5d1a567 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -94,6 +94,7 @@ obj-$(CONFIG_MESON_SARADC) += meson_saradc.o
>  obj-$(CONFIG_MP2629_ADC) += mp2629_adc.o
>  obj-$(CONFIG_MXS_LRADC_ADC) += mxs-lradc-adc.o
>  obj-$(CONFIG_NAU7802) += nau7802.o
> +obj-$(CONFIG_NCT720X) += nct720x.o
>  obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
>  obj-$(CONFIG_PAC1921) += pac1921.o
>  obj-$(CONFIG_PAC1934) += pac1934.o
> diff --git a/drivers/iio/adc/nct720x.c b/drivers/iio/adc/nct720x.c
> new file mode 100644
> index 000000000000..b28b5f4d7d70
> --- /dev/null
> +++ b/drivers/iio/adc/nct720x.c
> @@ -0,0 +1,533 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Nuvoton nct7201 and nct7202 power monitor chips.
> + *
> + * Copyright (c) 2024 Nuvoton Inc.

If there are datasheets available, it would be helpful to link to them here.

> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +
> +#include <linux/iio/events.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>

Unused header.

> +
> +#define VIN_MAX					12	/* Counted from 1 */
> +#define NCT720X_IN_SCALING			4995
> +#define NCT720X_IN_SCALING_FACTOR		10000
> +
> +#define REG_INTERRUPT_STATUS_1			0x0C
> +#define REG_INTERRUPT_STATUS_2			0x0D
> +#define REG_VOLT_LOW_BYTE			0x0F
> +#define REG_CONFIGURATION			0x10
> +#define  BIT_CONFIGURATION_START		BIT(0)
> +#define  BIT_CONFIGURATION_ALERT_MSK		BIT(1)
> +#define  BIT_CONFIGURATION_CONV_RATE		BIT(2)
> +#define  BIT_CONFIGURATION_RESET		BIT(7)
> +
> +#define REG_ADVANCED_CONFIGURATION		0x11
> +#define  BIT_ADVANCED_CONF_MOD_ALERT		BIT(0)
> +#define  BIT_ADVANCED_CONF_MOD_STS		BIT(1)
> +#define  BIT_ADVANCED_CONF_FAULT_QUEUE		BIT(2)
> +#define  BIT_ADVANCED_CONF_EN_DEEP_SHUTDOWN	BIT(4)
> +#define  BIT_ADVANCED_CONF_EN_SMB_TIMEOUT	BIT(5)
> +#define  BIT_ADVANCED_CONF_MOD_RSTIN		BIT(7)
> +
> +#define REG_CHANNEL_INPUT_MODE			0x12
> +#define REG_CHANNEL_ENABLE_1			0x13
> +#define  REG_CHANNEL_ENABLE_1_MASK		GENMASK(7, 0)
> +#define REG_CHANNEL_ENABLE_2			0x14
> +#define  REG_CHANNEL_ENABLE_2_MASK		GENMASK(3, 0)
> +#define REG_INTERRUPT_MASK_1			0x15
> +#define REG_INTERRUPT_MASK_2			0x16
> +#define REG_BUSY_STATUS				0x1E
> +#define  BIT_BUSY				BIT(0)
> +#define  BIT_PWR_UP				BIT(1)
> +#define REG_ONE_SHOT				0x1F
> +#define REG_SMUS_ADDRESS			0xFC
> +#define REG_VIN_LIMIT_LSB_MASK			GENMASK(4, 0)
> +
> +static const u8 REG_VIN[VIN_MAX] = {

Usually ALL_CAPS is reserved for macros and static const data is
lower_snake_case. Plus, prefer to always add the driver name as
a namespace to help avoid conflics with more generic names.

Example:

static const u8 nct7201_reg_vin[NCT7201_VIN_MAX] = {

Or (even better IMHO) just turn these into macros and avoid
the tables:

#define NCT7201_REG_VIN(i) (i)
#define NCT7201_REG_VIN_HIGH_LIMIT(i) (0x20 + (i) * 2)
#define NCT7201_REG_VIN_LOW_LIMIT(i) (0x21 + (i) * 2)

> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,	/* 0 -7 */
> +	0x08, 0x09, 0x0A, 0x0B,				/* 8 - 11 */
> +};
> +static const u8 REG_VIN_HIGH_LIMIT[VIN_MAX] = {
> +	0x20, 0x22, 0x24, 0x26, 0x28, 0x2A, 0x2C, 0x2E,
> +	0x30, 0x32, 0x34, 0x36,
> +};
> +static const u8 REG_VIN_LOW_LIMIT[VIN_MAX] = {
> +	0x21, 0x23, 0x25, 0x27, 0x29, 0x2B, 0x2D, 0x2F,
> +	0x31, 0x33, 0x35, 0x37,
> +};
> +static const u8 REG_VIN_HIGH_LIMIT_LSB[VIN_MAX] = {
> +	0x40, 0x42, 0x44, 0x46, 0x48, 0x4A, 0x4C, 0x4E,
> +	0x50, 0x52, 0x54, 0x56,
> +};
> +static const u8 REG_VIN_LOW_LIMIT_LSB[VIN_MAX] = {
> +	0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F,
> +	0x51, 0x53, 0x55, 0x57,
> +};
> +static u8 nct720x_chan_to_index[] = {

Should be const. Although, even better, just store this value in
the address field, then we don't need the translation table.

Right now, the address is always the same as the channel, so it
is redundant anyway.

> +	0 /* Not used */, 0, 1, 2, 3, 4, 5, 6,
> +	7, 8, 9, 10, 11,
> +};
> +
> +struct nct720x_chip_info {
> +	struct i2c_client *client;
> +	struct mutex access_lock;	/* for multi-byte read and write operations */
> +	struct regmap *regmap;
> +	struct regmap *regmap16;
> +	int vin_max;			/* number of VIN channels */

We could rename this to num_vin_channels, then we wouldn't need
a comment to explain it.

> +	u32 vin_mask;
> +};
> +
> +struct nct720x_adc_model_data {
> +	const char *model_name;
> +	const struct iio_chan_spec *channels;
> +	const int num_channels;
> +	int vin_max;
> +};
> +
> +static const struct iio_event_spec nct720x_events[] = {
> +	{
> +		.type = IIO_EV_TYPE_THRESH,
> +		.dir = IIO_EV_DIR_RISING,
> +		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
> +				 BIT(IIO_EV_INFO_ENABLE),
> +	}, {
> +		.type = IIO_EV_TYPE_THRESH,
> +		.dir = IIO_EV_DIR_FALLING,
> +		.mask_separate = BIT(IIO_EV_INFO_VALUE) |
> +				 BIT(IIO_EV_INFO_ENABLE),
> +	},
> +};
> +
> +#define NCT720X_VOLTAGE_CHANNEL(chan, addr)				\
> +	{								\
> +		.type = IIO_VOLTAGE,					\
> +		.indexed = 1,						\
> +		.channel = chan,					\
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> +		.address = addr,					\
> +		.event_spec = nct720x_events,				\
> +		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
> +	}
> +
> +#define NCT720X_VOLTAGE_CHANNEL_DIFF(chan1, chan2, addr)		\
> +	{								\
> +		.type = IIO_VOLTAGE,					\
> +		.indexed = 1,						\
> +		.channel = (chan1),					\
> +		.channel2 = (chan2),					\
> +		.differential = 1,					\
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> +		.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> +		.address = addr,					\
> +		.event_spec = nct720x_events,				\
> +		.num_event_specs = ARRAY_SIZE(nct720x_events),		\
> +	}
> +
> +static const struct iio_chan_spec nct7201_channels[] = {
> +	NCT720X_VOLTAGE_CHANNEL(1, 1),
> +	NCT720X_VOLTAGE_CHANNEL(2, 2),
> +	NCT720X_VOLTAGE_CHANNEL(3, 3),
> +	NCT720X_VOLTAGE_CHANNEL(4, 4),
> +	NCT720X_VOLTAGE_CHANNEL(5, 5),
> +	NCT720X_VOLTAGE_CHANNEL(6, 6),
> +	NCT720X_VOLTAGE_CHANNEL(7, 7),
> +	NCT720X_VOLTAGE_CHANNEL(8, 8),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
> +};
> +
> +static const struct iio_chan_spec nct7202_channels[] = {
> +	NCT720X_VOLTAGE_CHANNEL(1, 1),
> +	NCT720X_VOLTAGE_CHANNEL(2, 2),
> +	NCT720X_VOLTAGE_CHANNEL(3, 3),
> +	NCT720X_VOLTAGE_CHANNEL(4, 4),
> +	NCT720X_VOLTAGE_CHANNEL(5, 5),
> +	NCT720X_VOLTAGE_CHANNEL(6, 6),
> +	NCT720X_VOLTAGE_CHANNEL(7, 7),
> +	NCT720X_VOLTAGE_CHANNEL(8, 8),
> +	NCT720X_VOLTAGE_CHANNEL(9, 9),
> +	NCT720X_VOLTAGE_CHANNEL(10, 10),
> +	NCT720X_VOLTAGE_CHANNEL(11, 11),
> +	NCT720X_VOLTAGE_CHANNEL(12, 12),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(1, 2, 1),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(3, 4, 3),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(5, 6, 5),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(7, 8, 7),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(9, 10, 9),
> +	NCT720X_VOLTAGE_CHANNEL_DIFF(11, 12, 11),
> +};
> +
> +static int nct720x_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan,
> +			    int *val, int *val2, long mask)
> +{
> +	int index = nct720x_chan_to_index[chan->address];
> +	u16 volt;
> +	unsigned int value;
> +	int err;
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	guard(mutex)(&chip->access_lock);
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		err = regmap_read(chip->regmap16, REG_VIN[index], &value);
> +		if (err < 0)
> +			return err;
> +		volt = (u16)value;
> +		*val = volt >> 3;

It seems strange that this is 13 bits when the chips are 8 and 12 bit.

> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_SCALE:
> +		/* From the datasheet, we have to multiply by 0.0004995 */

The scale is the same for both 8 bit and 12 bit chips?

> +		*val = 0;
> +		*val2 = 499500;
> +		return IIO_VAL_INT_PLUS_NANO;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int nct720x_read_event_value(struct iio_dev *indio_dev,
> +				    const struct iio_chan_spec *chan,
> +				    enum iio_event_type type,
> +				    enum iio_event_direction dir,
> +				    enum iio_event_info info,
> +				    int *val, int *val2)
> +{
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	u16 volt;
> +	unsigned int value;
> +	int tmp, err;
> +	int index = nct720x_chan_to_index[chan->address];
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info != IIO_EV_INFO_VALUE)
> +		return -EINVAL;

Do we need guard(mutex)(&chip->access_lock); here?

> +
> +	if (dir == IIO_EV_DIR_FALLING) {
> +		err = regmap_read(chip->regmap16, REG_VIN_LOW_LIMIT[index], &value);
> +		if (err < 0)
> +			return err;
> +		volt = (u16)value;
> +	} else {
> +		err = regmap_read(chip->regmap16, REG_VIN_HIGH_LIMIT[index], &value);
> +		if (err < 0)
> +			return err;
> +		volt = (u16)value;
> +	}
> +
> +	/* Voltage(V) = 13bitCountValue * 0.0004995 */
> +	tmp = (volt >> 3) * NCT720X_IN_SCALING;
> +	*val = tmp / NCT720X_IN_SCALING_FACTOR;

I'm pretty sure event threshold values need to be in raw units to match
the `in_voltageY_raw` attributes, so the scaling factor would not be
applied here.

> +
> +	return IIO_VAL_INT;
> +}
> +
> +static int nct720x_write_event_value(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir,
> +				     enum iio_event_info info,
> +				     int val, int val2)
> +{
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int index, err = 0;
> +	long v1, v2, volt;
> +
> +	index = nct720x_chan_to_index[chan->address];
> +	volt = (val * NCT720X_IN_SCALING_FACTOR) / NCT720X_IN_SCALING;

Same applies here.

> +	v1 = volt >> 5;
> +	v2 = (volt & REG_VIN_LIMIT_LSB_MASK) << 3;

Looks like FIELD_PREP() could be used here.

> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	if (info == IIO_EV_INFO_VALUE) {
> +		if (dir == IIO_EV_DIR_FALLING) {
> +			guard(mutex)(&chip->access_lock);
> +			err = regmap_write(chip->regmap, REG_VIN_LOW_LIMIT[index], v1);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_LOW_LIMIT\n",
> +					index + 1);
> +
> +			err = regmap_write(chip->regmap, REG_VIN_LOW_LIMIT_LSB[index], v2);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_LOW_LIMIT_LSB\n",
> +					index + 1);
> +
> +		} else {
> +			guard(mutex)(&chip->access_lock);
> +			err = regmap_write(chip->regmap, REG_VIN_HIGH_LIMIT[index], v1);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_HIGH_LIMIT\n",
> +					index + 1);
> +
> +			err = regmap_write(chip->regmap, REG_VIN_HIGH_LIMIT_LSB[index], v2);
> +			if (err < 0)
> +				dev_err(&indio_dev->dev, "Failed to write REG_VIN%d_HIGH_LIMIT_LSB\n",
> +					index + 1);
> +		}
> +	}
> +	return err;
> +}
> +
> +static int nct720x_read_event_config(struct iio_dev *indio_dev,
> +				     const struct iio_chan_spec *chan,
> +				     enum iio_event_type type,
> +				     enum iio_event_direction dir)
> +{
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int index = nct720x_chan_to_index[chan->address];
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	return !!(chip->vin_mask & BIT(index));
> +}
> +
> +static int nct720x_write_event_config(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      enum iio_event_type type,
> +				      enum iio_event_direction dir,
> +				      bool state)
> +{
> +	int err = 0;
> +	struct nct720x_chip_info *chip = iio_priv(indio_dev);
> +	int index = nct720x_chan_to_index[chan->address];
> +	unsigned int mask;
> +
> +	if (chan->type != IIO_VOLTAGE)
> +		return -EOPNOTSUPP;
> +
> +	mask = BIT(index);
> +
> +	if (!state && (chip->vin_mask & mask))
> +		chip->vin_mask &= ~mask;
> +	else if (state && !(chip->vin_mask & mask))
> +		chip->vin_mask |= mask;
> +
> +	guard(mutex)(&chip->access_lock);
> +
> +	err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1,
> +			   chip->vin_mask & REG_CHANNEL_ENABLE_1_MASK);
> +	if (err < 0)
> +		dev_err(&indio_dev->dev, "Failed to write REG_CHANNEL_ENABLE_1\n");
> +
> +	if (chip->vin_max == 12) {
> +		err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, chip->vin_mask >> 8);
> +		if (err < 0)
> +			dev_err(&indio_dev->dev, "Failed to write REG_CHANNEL_ENABLE_2\n");
> +	}
> +	return err;
> +}
> +
> +static const struct iio_info nct720x_info = {
> +	.read_raw = nct720x_read_raw,
> +	.read_event_config = nct720x_read_event_config,
> +	.write_event_config = nct720x_write_event_config,
> +	.read_event_value = nct720x_read_event_value,
> +	.write_event_value = nct720x_write_event_value,
> +};
> +
> +static const struct nct720x_adc_model_data nct7201_model_data = {
> +	.model_name = "nct7201",
> +	.channels = nct7201_channels,
> +	.num_channels = ARRAY_SIZE(nct7201_channels),
> +	.vin_max = 8,
> +};
> +
> +static const struct nct720x_adc_model_data nct7202_model_data = {
> +	.model_name = "nct7202",
> +	.channels = nct7202_channels,
> +	.num_channels = ARRAY_SIZE(nct7202_channels),
> +	.vin_max = 12,
> +};
> +
> +static int nct720x_init_chip(struct nct720x_chip_info *chip)
> +{
> +	u8 data[2];
> +	unsigned int value;
> +	int err;
> +
> +	err = regmap_write(chip->regmap, REG_CONFIGURATION, BIT_CONFIGURATION_RESET);
> +	if (err) {
> +		dev_err(&chip->client->dev, "Failed to write REG_CONFIGURATION\n");
> +		return err;

Better would be `return dev_err_probe()`. But it is very rare for
regmap_write() to fail so usually we don't print an error message
for these.

> +	}
> +
> +	/*
> +	 * After about 25 msecs, the device should be ready and then
> +	 * the Power Up bit will be set to 1. If not, wait for it.

I don't see anything that looks like waiting after checking the power
up bit.

> +	 */
> +	mdelay(25);
> +	err  = regmap_read(chip->regmap, REG_BUSY_STATUS, &value);
> +	if (err < 0)
> +		return err;
> +	if (!(value & BIT_PWR_UP))
> +		return err;

Won't this return 0? It seems like it should be returning an error code.

Better would be something like:

		return dev_err_probe(dev, -EIO, "failed to power up after reset\n");

> +
> +	/* Enable Channel */
> +	err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_1, REG_CHANNEL_ENABLE_1_MASK);
> +	if (err) {
> +		dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_1\n");
> +		return err;
> +	}
> +
> +	if (chip->vin_max == 12) {
> +		err = regmap_write(chip->regmap, REG_CHANNEL_ENABLE_2, REG_CHANNEL_ENABLE_2_MASK);
> +		if (err) {
> +			dev_err(&chip->client->dev, "Failed to write REG_CHANNEL_ENABLE_2\n");
> +			return err;
> +		}
> +	}
> +
> +	guard(mutex)(&chip->access_lock);

Why guard here and not before other regmap access in this function?

Since this is only called during probe, we probably don't need the guard.

> +	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_1, &value);
> +	if (err < 0)
> +		return err;
> +	data[0] = (u8)value;
> +
> +	err  = regmap_read(chip->regmap, REG_CHANNEL_ENABLE_2, &value);
> +	if (err < 0)
> +		return err;
> +	data[1] = (u8)value;
> +
> +	value = get_unaligned_le16(data);
> +	chip->vin_mask = value;
> +
> +	/* Start monitoring if needed */
> +	err = regmap_read(chip->regmap, REG_CONFIGURATION, &value);
> +	if (err < 0) {
> +		dev_err(&chip->client->dev, "Failed to read REG_CONFIGURATION\n");
> +		return value;
> +	}
> +
> +	value |= BIT_CONFIGURATION_START;
> +	err = regmap_write(chip->regmap, REG_CONFIGURATION, value);
> +	if (err < 0) {
> +		dev_err(&chip->client->dev, "Failed to write REG_CONFIGURATION\n");
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config nct720x_regmap8_config = {
> +	.name = "vin-data-read-byte",
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +static const struct regmap_config nct720x_regmap16_config = {
> +	.name = "vin-data-read-word",
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +	.max_register = 0xff,
> +	.cache_type = REGCACHE_NONE,

REGCACHE_NONE is the default, so can be omitted.

> +};
> +
> +static int nct720x_probe(struct i2c_client *client)
> +{
> +	const struct nct720x_adc_model_data *model_data;
> +	struct nct720x_chip_info *chip;
> +	struct iio_dev *indio_dev;
> +	int ret;
> +
> +	model_data = i2c_get_match_data(client);
> +	if (!model_data)
> +		return -EINVAL;
> +
> +	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*chip));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +	chip = iio_priv(indio_dev);
> +
> +	chip->regmap = devm_regmap_init_i2c(client, &nct720x_regmap8_config);
> +	if (IS_ERR(chip->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> +			"Failed to init regmap\n");
> +
> +	chip->regmap16 = devm_regmap_init_i2c(client, &nct720x_regmap16_config);
> +	if (IS_ERR(chip->regmap16))
> +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap16),
> +			"Failed to init regmap16\n");
> +
> +	chip->vin_max = model_data->vin_max;
> +
> +	ret = devm_mutex_init(&client->dev, &chip->access_lock);
> +	if (ret)
> +		return ret;
> +
> +	chip->client = client;
> +
> +	ret = nct720x_init_chip(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	indio_dev->name = model_data->model_name;
> +	indio_dev->channels = model_data->channels;
> +	indio_dev->num_channels = model_data->num_channels;
> +	indio_dev->info = &nct720x_info;
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}
> +
> +static const struct i2c_device_id nct720x_id[] = {
> +	{ "nct7201", (kernel_ulong_t)&nct7201_model_data },
> +	{ "nct7202", (kernel_ulong_t)&nct7202_model_data },

To be consistent with [1], please add .name = and .driver_data = in this table.

[1]: https://lore.kernel.org/linux-iio/20241204150036.1695824-2-u.kleine-koenig@baylibre.com/

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, nct720x_id);
> +
> +static const struct of_device_id nct720x_of_match[] = {
> +	{
> +		.compatible = "nuvoton,nct7201",
> +		.data = &nct7201_model_data,
> +	},
> +	{
> +		.compatible = "nuvoton,nct7202",
> +		.data = &nct7202_model_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nct720x_of_match);
> +
> +static struct i2c_driver nct720x_driver = {
> +	.driver = {
> +		.name	= "nct720x",
> +		.of_match_table = nct720x_of_match,
> +	},
> +	.probe = nct720x_probe,
> +	.id_table = nct720x_id,
> +};
> +module_i2c_driver(nct720x_driver);
> +
> +MODULE_AUTHOR("Eason Yang <j2anfernee@gmail.com>");
> +MODULE_DESCRIPTION("Nuvoton NCT720x voltage monitor driver");
> +MODULE_LICENSE("GPL");

