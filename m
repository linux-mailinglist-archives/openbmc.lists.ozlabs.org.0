Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB21CD4B2
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 11:18:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LFjn3L0XzDqWh
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 19:18:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LFhr63N9zDqHR
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 19:18:03 +1000 (AEST)
IronPort-SDR: phkC4iNY3P6JDCpEIvOwmX+qUSYGN2AEz+uowyRPdfH8lBt5aGvDgqZQqAcp3Ntj1hfzQN1xha
 c9kaSfTS4VSw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 02:18:00 -0700
IronPort-SDR: lFcPFw0rjOLmc9U7pwB597vGZb9TyE+DyfcOYrSLjdyW3DrOAjqXVA1nhcz0l2tCU20FKhtXbg
 2q/hCGWKojsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; d="scan'208";a="306126183"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 11 May 2020 02:17:56 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jY4ZT-005vIK-61; Mon, 11 May 2020 12:17:59 +0300
Date: Mon, 11 May 2020 12:17:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v10 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200511091759.GE185537@smile.fi.intel.com>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510102330.66715-3-tali.perry1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, wsa@the-dreams.de,
 brendanhiggins@google.com, ofery@google.com, linux-kernel@vger.kernel.org,
 kfting@nuvoton.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, May 10, 2020 at 01:23:29PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

Some cosmetic changes needs to be done.

...

> +/*
> + * Nuvoton NPCM7xx I2C Controller driver
> + *
> + * Copyright (C) 2020 Nuvoton Technologies tali.perry@nuvoton.com
> + */

So, entire file has C99 comment style, but this and few other places.
Any reason of inconsistency?

...

> +#if IS_ENABLED(CONFIG_DEBUG_FS)

Why?

> +#include <linux/debugfs.h>
> +#endif

...

> +//#define _I2C_DEBUG_

Leftover, remove.

...

> +// Common regs
> +#define NPCM_I2CSDA                       0x00
> +#define NPCM_I2CST                        0x02
> +#define NPCM_I2CCST                       0x04

> +#define NPCM_I2CCTL1	                  0x06

Indentation issue. And it's better to use TABs over spaces here and
in the similar places above and below.

> +#define NPCM_I2CADDR1                     0x08
> +#define NPCM_I2CCTL2                      0x0A
> +#define NPCM_I2CADDR2                     0x0C
> +#define NPCM_I2CCTL3                      0x0E
> +#define NPCM_I2CCST2                      0x18
> +#define NPCM_I2CCST3                      0x19

...

> +// supported clk settings. values in KHz.
> +#define I2C_FREQ_MIN                      10
> +#define I2C_FREQ_MAX                      1000

_KHZ to both.

...

> +#define I2C_NUM_OF_ADDR 10

Is it 10-bit address support or what?

...

> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +static struct dentry *npcm_i2c_debugfs_dir;   /* i2c debugfs directory */
> +static const char *ber_cnt_name      = "ber_count";
> +static const char *rec_succ_cnt_name = "rec_succ_count";
> +static const char *rec_fail_cnt_name = "rec_fail_count";
> +static const char *nack_cnt_name     = "nack_count";
> +static const char *timeout_cnt_name  = "timeout_count";
> +#endif

Why are these global?

...

> +static void npcm_i2c_write_to_fifo_master(struct npcm_i2c *bus,
> +					  u16 max_bytes_to_send)
> +{
> +	// Fill the FIFO, while the FIFO is not full and there are more bytes to
> +	// write

> +	while ((max_bytes_to_send--) &&

Inner parentheses are redundant.

> +	       (I2C_HW_FIFO_SIZE - npcm_i2c_fifo_usage(bus))) {
> +		if (bus->wr_ind < bus->wr_size)
> +			npcm_i2c_wr_byte(bus, bus->wr_buf[bus->wr_ind++]);
> +		else
> +			npcm_i2c_wr_byte(bus, 0xFF);
> +	}
> +}

...

> +		// Clear stall only after setting STOP
> +		iowrite8(NPCM_I2CST_STASTR, bus->reg + NPCM_I2CST);
> +
> +		ret =  IRQ_HANDLED;

Indentation issue.

...

> +				if (bus->wr_size)
> +					npcm_i2c_set_fifo(bus, -1,
> +							  bus->wr_size);
> +				else
> +					npcm_i2c_set_fifo(bus, bus->rd_size,
> +							  -1);

These two looks much better on one line.

...

> +				if (npcm_i2c_is_quick(bus) || bus->wr_size)
> +					npcm_i2c_wr_byte(bus, bus->dest_addr);
> +				else
> +					npcm_i2c_wr_byte(bus, bus->dest_addr |
> +							      0x01);

0x01 has its definition, hasn't it?

...

> +	// Repeat the following sequence until SDA is released
> +	do {
> +		// Issue a single SCL toggle
> +		iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
> +		udelay(20);
> +		// If SDA line is inactive (high), stop
> +		if (npcm_i2c_get_SDA(_adap)) {
> +			done = true;
> +			status = 0;
> +		}
> +	} while (!done && iter--);

readx_poll_timeout() ?

...

> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	if (!status) {

Why not positive condition?

	if (status) {
		...
	} else {
		...
	}

> +	} else {

> +	}
> +#endif

...

> +static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq)
> +{
> +	u32  k1 = 0;
> +	u32  k2 = 0;
> +	u8   dbnct = 0;
> +	u32  sclfrq = 0;
> +	u8   hldt = 7;
> +	bool fast_mode = false;

> +	u32  src_clk_freq; // in KHz

src_clk_khz ?

> +
> +	src_clk_freq = bus->apb_clk / 1000;
> +	bus->bus_freq = bus_freq;
> +
> +	// 100KHz and below:

> +	if (bus_freq <= (I2C_MAX_STANDARD_MODE_FREQ / 1000)) {

Instead of all these / 1000 can't you use bus frequency in Hz and do division
when it's really needed?

> +		sclfrq = src_clk_freq / (bus_freq * 4);
> +
> +		if (sclfrq < SCLFRQ_MIN || sclfrq > SCLFRQ_MAX)
> +			return -EDOM;
> +
> +		if (src_clk_freq >= 40000)
> +			hldt = 17;
> +		else if (src_clk_freq >= 12500)
> +			hldt = 15;
> +		else
> +			hldt = 7;
> +	}
> +
> +	// 400KHz:
> +	else if (bus_freq <= (I2C_MAX_FAST_MODE_FREQ / 1000)) {
> +		sclfrq = 0;
> +		fast_mode = true;
> +
> +		if (src_clk_freq < 7500)
> +			// 400KHZ cannot be supported for core clock < 7.5 MHZ
> +			return -EDOM;
> +
> +		else if (src_clk_freq >= 50000) {
> +			k1 = 80;
> +			k2 = 48;
> +			hldt = 12;
> +			dbnct = 7;
> +		}
> +
> +		// Master or Slave with frequency > 25 MHZ
> +		else if (src_clk_freq > 25000) {

> +			hldt = (DIV_ROUND_UP(src_clk_freq * 300,
> +							 1000000) + 7) & 0xFF;

How ' & 0xFF' is not no-op here and in the similar cases?

> +
> +			k1 = DIV_ROUND_UP(src_clk_freq * 1600,
> +						   1000000);
> +			k2 = DIV_ROUND_UP(src_clk_freq * 900,
> +						   1000000);

Perhaps,

#define clk_coef(freq, mul)	DIV_ROUND_UP((freq) * (mul), 1000000)

?

> +			k1 = round_up(k1, 2);
> +			k2 = round_up(k2 + 1, 2);
> +			if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
> +			    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
> +				return -EDOM;
> +		}
> +	}
> +
> +	else if (bus_freq <= (I2C_MAX_FAST_MODE_PLUS_FREQ / 1000)) {
> +		sclfrq = 0;
> +		fast_mode = true;
> +
> +		if (src_clk_freq < 24000)
> +		// 1MHZ cannot be supported for master core clock < 15 MHZ
> +		// or slave core clock < 24 MHZ
> +			return -EDOM;
> +
> +		k1 = round_up((DIV_ROUND_UP(src_clk_freq * 620,
> +						     1000000)), 2);
> +		k2 = round_up((DIV_ROUND_UP(src_clk_freq * 380,
> +						     1000000) + 1), 2);
> +		if (k1 < SCLFRQ_MIN || k1 > SCLFRQ_MAX ||
> +		    k2 < SCLFRQ_MIN || k2 > SCLFRQ_MAX)
> +			return -EDOM;
> +
> +		// Core clk > 40 MHZ
> +		if (src_clk_freq > 40000) {
> +			// Set HLDT:
> +			// SDA hold time:  (HLDT-7) * T(CLK) >= 120
> +			// HLDT = 120/T(CLK) + 7 = 120 * FREQ(CLK) + 7
> +			hldt = (DIV_ROUND_UP(src_clk_freq * 120,
> +							 1000000) + 7) & 0xFF;
> +		} else {
> +			hldt = 7;
> +			dbnct = 2;
> +		}
> +	}
> +
> +	// Frequency larger than 1 MHZ is not supported
> +	else
> +		return false;

> +	return true;
> +}

...

> +	ret = device_property_read_u32(&pdev->dev, "bus-frequency", &clk_freq);
> +	if (ret < 0) {
> +		dev_info(&pdev->dev, "Could not read bus-frequency property\n");

> +		clk_freq = 100000;

We have define for this, don't we?

> +	}

Wolfram, we discussed this simplified timings property parser,
any news about it?

...

> +static irqreturn_t npcm_i2c_bus_irq(int irq, void *dev_id)
> +{
> +	irqreturn_t ret;
> +	struct npcm_i2c *bus = dev_id;
> +
> +	bus->int_cnt++;
> +
> +	if (npcm_i2c_is_master(bus))
> +		bus->master_or_slave = I2C_MASTER;
> +
> +	if (bus->master_or_slave == I2C_MASTER)	{
> +		bus->int_time_stamp = jiffies;
> +		ret = npcm_i2c_int_master_handler(bus);

> +		if (ret == IRQ_HANDLED)
> +			return ret;

What's the point?

> +	}
> +	return IRQ_HANDLED;
> +}

...

> +	bus->dest_addr = (slave_addr << 1) & 0xFE;

How ' & 0xFE' part is not a no-op?

...

> +	time_left = jiffies +
> +		    msecs_to_jiffies(DEFAULT_STALL_COUNT) + 1;

It's perfectly one line. Fix here and in any other place with similar issue.

...

> +static int i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)

Should be void.

...

> +	bus->irq = platform_get_irq(pdev, 0);
> +	if (bus->irq < 0) {

> +		dev_err(&pdev->dev, "failed to get IRQ number\n");

Duplicate message.

> +		return bus->irq;
> +	}

...

> +#if IS_ENABLED(CONFIG_DEBUG_FS)

Why? Okay, why here instead of making a stub?

> +	ret = i2c_init_debugfs(pdev, bus);

> +	if (ret < 0)
> +		return ret;

Wrong. Should not fail the probe.

> +#endif

...

> +#if IS_ENABLED(CONFIG_DEBUG_FS)

Why? Just make it always present in the structure.

> +	if (!!bus->debugfs) {

!! ???

> +		debugfs_remove_recursive(bus->debugfs);
> +		bus->debugfs = NULL;
> +	}
> +#endif

...

> +	npcm_i2c_debugfs_dir = debugfs_create_dir("i2c", NULL);

> +	if (IS_ERR_OR_NULL(npcm_i2c_debugfs_dir)) {
> +		pr_warn("i2c init of debugfs failed\n");
> +		npcm_i2c_debugfs_dir = NULL;
> +		return -ENOMEM;
> +	}

Shouldn't prevent driver to work.

...

> +	if (!!npcm_i2c_debugfs_dir) {

!! ???

> +		debugfs_remove_recursive(npcm_i2c_debugfs_dir);

> +		npcm_i2c_debugfs_dir = NULL;

What's the point?

> +	}

-- 
With Best Regards,
Andy Shevchenko


