Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D721C1DCFAE
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 16:27:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SX4f1t79zDqdq
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 00:26:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SX1J3kWSzDqkd
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 00:24:02 +1000 (AEST)
IronPort-SDR: T4oLM85U64G9gsR0Uzt7WQ0buzFF1uP5CoTrLEr2oErOoMMjCQ9c+On/o21EQvUiwgKAzm3tCi
 pgUMdS8pWMnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 07:23:41 -0700
IronPort-SDR: HJwr70oF8r+qmhLkXdAqGrFwTDZR+Uh1JWVRI1suhxl+UzDLL/Fl2/k3MnYyHkfNDm743d3dr5
 u5ECfTDgt3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="253985670"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007.fm.intel.com with ESMTP; 21 May 2020 07:23:38 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jbm6m-0082sf-QV; Thu, 21 May 2020 17:23:40 +0300
Date: Thu, 21 May 2020 17:23:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521142340.GM1634618@smile.fi.intel.com>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521110910.45518-3-tali.perry1@gmail.com>
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

On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

Thanks. My comments below.
After addressing them, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

...

> +	/* Frequency larger than 1 MHZ is not supported */

1 MHZ -> 1MHz

...

> +#ifdef CONFIG_DEBUG_FS

Again, why is this here?

Have you checked debugfs.h for !CONFIG_DEBUG_FS case?

> +/* i2c debugfs directory: used to keep health monitor of i2c devices */
> +static struct dentry *npcm_i2c_debugfs_dir;
> +
> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
> +{
> +	struct dentry *d;
> +
> +	if (!npcm_i2c_debugfs_dir)
> +		return;
> +
> +	d = debugfs_create_dir(dev_name(&pdev->dev), npcm_i2c_debugfs_dir);
> +	if (IS_ERR_OR_NULL(d))
> +		return;
> +
> +	debugfs_create_u64("ber_cnt", 0444, d, &bus->ber_cnt);
> +	debugfs_create_u64("nack_cnt", 0444, d, &bus->nack_cnt);
> +	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> +	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> +	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +
> +	bus->debugfs = d;
> +}

> +#else
> +static void i2c_init_debugfs(struct platform_device *pdev, struct npcm_i2c *bus)
> +{
> +}

This is completely redundant.

> +#endif

...

> +#ifdef CONFIG_DEBUG_FS

Ditto.

> +static int __init npcm_i2c_init(void)
> +{
> +	struct dentry *dir;
> +
> +	dir = debugfs_create_dir("i2c", NULL);
> +	if (IS_ERR_OR_NULL(dir))
> +		return 0;
> +
> +	npcm_i2c_debugfs_dir = dir;
> +	return 0;
> +}
> +
> +static void __exit npcm_i2c_exit(void)
> +{
> +	debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> +}
> +
> +module_init(npcm_i2c_init);
> +module_exit(npcm_i2c_exit);
> +#endif

...

> +MODULE_VERSION("0.1.3");

Module version is defined by kernel commit hash. But it's up to you and
subsystem maintainer to decide.

-- 
With Best Regards,
Andy Shevchenko


