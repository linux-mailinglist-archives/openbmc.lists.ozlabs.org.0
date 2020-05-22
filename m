Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEE1DE6E8
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 14:29:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T5Qp1zDdzDqyc
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 22:29:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T5NS12nDzDqwW
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 22:27:34 +1000 (AEST)
IronPort-SDR: kW4zwq1Saoqg3565RlOQ0rvKY7yxWt5NE9lVvFCBsveuwfIXFLIbqlvhLv5xKLAeayL5ZJLJyk
 ZJs+oqNYBNtw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 05:27:29 -0700
IronPort-SDR: NWN5dJDnXUsXQ04oQAKBsYU5gIqJK6FUXRe2aHRdhrhd52IyQKR9HNREhdbx+cfpvDIsKi3bIJ
 boHtr1ha77rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,421,1583222400"; d="scan'208";a="265415473"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 22 May 2020 05:27:17 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jc6lh-008EFe-DI; Fri, 22 May 2020 15:27:17 +0300
Date: Fri, 22 May 2020 15:27:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v13 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200522122717.GB1634618@smile.fi.intel.com>
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522113312.181413-3-tali.perry1@gmail.com>
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

On Fri, May 22, 2020 at 02:33:11PM +0300, Tali Perry wrote:
> Add Nuvoton NPCM BMC I2C controller driver.

I thought we are waiting for Wolfram finishing his review...


In any case see couple of comments below.

...


> +#ifdef CONFIG_DEBUG_FS

Now, do we need the rest of DEBUG_FS guards?

> +	if (status) {
> +		if (bus->rec_fail_cnt == ULLONG_MAX) {
> +			dev_dbg(bus->dev, "rec_fail_cnt reach max, reset to 0");

> +			bus->rec_fail_cnt = 0;

It's redundant, since we will anyway roll over when incrementing.
https://stackoverflow.com/q/18195715/2511795

> +		}
> +		bus->rec_fail_cnt++;
> +	} else {
> +		if (bus->rec_succ_cnt == ULLONG_MAX) {
> +			dev_dbg(bus->dev, "rec_succ_cnt reach max, reset to 0");

> +			bus->rec_succ_cnt = 0;

Ditto.

> +		}
> +		bus->rec_succ_cnt++;
> +	}
> +#endif

...

> +static int npcm_i2c_remove_bus(struct platform_device *pdev)
> +{
> +	unsigned long lock_flags;
> +	struct npcm_i2c *bus = platform_get_drvdata(pdev);
> +
> +	spin_lock_irqsave(&bus->lock, lock_flags);
> +	npcm_i2c_disable(bus);
> +	spin_unlock_irqrestore(&bus->lock, lock_flags);
> +	i2c_del_adapter(&bus->adap);

> +	debugfs_remove_recursive(bus->debugfs);

This should be in reversed order, i.e. you inited last in ->probe(), thus
should remove first in ->remove().

> +	return 0;
> +}

...

> +static int __init npcm_i2c_init(void)
> +{
> +	struct dentry *dir;
> +
> +	dir = debugfs_create_dir("i2c", NULL);

> +	if (IS_ERR_OR_NULL(dir))

IS_ERR() is redundant. And NULL already being checked inside i2c_init_debugfs()
or how do you call it?

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

Slightly better to attach to the respective function, like other macros above
do.

-- 
With Best Regards,
Andy Shevchenko


