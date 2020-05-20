Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1E1DB01E
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 12:26:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RpnX45zCzDqfr
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 20:26:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rplt5NGHzDqfb
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 20:24:56 +1000 (AEST)
IronPort-SDR: DAWgYuePlBK/VtFU+qGA6ewIjGayMW2F1cHc4X1vwnn2T9fa8n9SCNhPWx90h/4F68nJjcV3WE
 pafiodSZuWxg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 03:24:53 -0700
IronPort-SDR: Nhksymg73kKZB1ULTIzriSwEHijsFG3lboDHBnmMS2BN0DW2yzcwXvhIDWAJqgHL4zldive+jM
 9zD0x8K4JzHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; d="scan'208";a="264633133"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 20 May 2020 03:24:49 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jbLu8-007omv-GV; Wed, 20 May 2020 13:24:52 +0300
Date: Wed, 20 May 2020 13:24:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v11 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200520102452.GP1634618@smile.fi.intel.com>
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520095113.185414-3-tali.perry1@gmail.com>
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

On Wed, May 20, 2020 at 12:51:12PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

...

> +#ifdef CONFIG_DEBUG_FS

Why?!

> +#include <linux/debugfs.h>
> +#endif


...

> +/* Status of one I2C module */
> +struct npcm_i2c {
> +	struct i2c_adapter adap;

> +	struct device *dev;

Isn't it adap.dev->parent?

> +};

...

> +static void npcm_i2c_master_abort(struct npcm_i2c *bus)
> +{
> +	/* Only current master is allowed to issue a stop condition */

> +	if (npcm_i2c_is_master(bus)) {

	if (!npcm_i2c_is_master(bus))
		return;

?

> +		npcm_i2c_eob_int(bus, true);
> +		npcm_i2c_master_stop(bus);
> +		npcm_i2c_clear_master_status(bus);
> +	}
> +}

...

> +/* SDA status is set - TX or RX, master */
> +static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
> +{
> +	u8 fif_cts;

> +	if (bus->state == I2C_IDLE) {
> +		if (npcm_i2c_is_master(bus)) {

	if (a) {
		if (b) {
			...
		}
	}

==

	if (a && b) {
		...
	}

Check whole code for such pattern.

> +		}
> +
> +	/* SDA interrupt, after start\restart */
> +	} else {
> +		if (NPCM_I2CST_XMIT & i2cst) {
> +			bus->operation = I2C_WRITE_OPER;
> +			npcm_i2c_irq_master_handler_write(bus);
> +		} else {
> +			bus->operation = I2C_READ_OPER;
> +			npcm_i2c_irq_master_handler_read(bus);
> +		}
> +	}
> +}

...


> +	}
> +

+ /* 1MHz */ ?

> +	else if (bus_freq_hz <= I2C_MAX_FAST_MODE_PLUS_FREQ) {

> +	}
> +
> +	/* Frequency larger than 1 MHZ is not supported */
> +	else
> +		return -EINVAL;

...

> +	// master and slave modes share a single irq.

It's again being inconsistent with comment style. Choose one and fix all
comments accordingly (SPDX is another story, though)

...

> +static int i2c_debugfs_get(void *data, u64 *val)
> +{
> +	*val = *(u64 *)(data);
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_debugfs_ops, i2c_debugfs_get, NULL, "0x%02llx\n");

Why not to use debugfs_create_u64(), or how is it called?

> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
> +{
> +	if (!npcm_i2c_debugfs_dir)
> +		return;
> +

> +	if (!pdev || !bus)
> +		return;

How is it possible?

> +	bus->debugfs = debugfs_create_dir(dev_name(&pdev->dev),
> +					  npcm_i2c_debugfs_dir);
> +	if (IS_ERR_OR_NULL(bus->debugfs)) {
> +		bus->debugfs = NULL;
> +		return;
> +	}

	struct dentry *d;

	d = create(...);
	if (IS_ERR_OR_NULL(d))
		return;

	bus->... = d;

> +
> +	debugfs_create_file("ber_count", 0444, bus->debugfs,
> +			    &bus->ber_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("rec_succ_count", 0444, bus->debugfs,
> +			    &bus->rec_succ_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("rec_fail_count", 0444, bus->debugfs,
> +			    &bus->rec_fail_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("nack_count", 0444, bus->debugfs,
> +			    &bus->nack_count,
> +			    &i2c_debugfs_ops);
> +
> +	debugfs_create_file("timeout_count", 0444, bus->debugfs,
> +			    &bus->timeout_count,
> +			    &i2c_debugfs_ops);
> +}

...

> +#ifdef CONFIG_DEBUG_FS

Why?!

> +	i2c_init_debugfs(pdev, bus);
> +#endif

...

> +#ifdef CONFIG_DEBUG_FS

Ditto.

> +	debugfs_remove_recursive(bus->debugfs);
> +#endif

> +static int __init npcm_i2c_init(void)
> +{

> +	npcm_i2c_debugfs_dir = debugfs_create_dir("i2c", NULL);

You didn't compile this with !CONFIG_DEBUG_FS?

> +	if (IS_ERR_OR_NULL(npcm_i2c_debugfs_dir)) {
> +		pr_warn("i2c init of debugfs failed\n");
> +		npcm_i2c_debugfs_dir = NULL;
> +	}

See above for the better pattern. Why do you need noisy warning? What does it
say to user? Can they use device or not?

> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


