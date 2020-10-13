Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD628CCB9
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 13:50:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9Yl93RzyzDqhC
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 22:50:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9Yk40LKCzDqcM
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 22:49:30 +1100 (AEDT)
IronPort-SDR: KFSfu+eyCJG4OQBm3jqipWAoVyehenUHhFnDXN2lWbvRwNVTM2AJMW3v2bxrBOBrRyLfF6OflI
 9iyJCliXYkWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="250589293"
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; d="scan'208";a="250589293"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 04:49:25 -0700
IronPort-SDR: fKI1CIVL3TQGd0i33Ir236iwYH6hYmucZP/YzxKQuSuYVNcZs5we04sss9kdiEzuaA2shv9ihM
 IHGwFF2cH4Gg==
X-IronPort-AV: E=Sophos;i="5.77,370,1596524400"; d="scan'208";a="313770836"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 04:49:21 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kSIox-005n54-Sf; Tue, 13 Oct 2020 14:50:23 +0300
Date: Tue, 13 Oct 2020 14:50:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: Support changing bus speed using debugfs.
Message-ID: <20201013115023.GL4077@smile.fi.intel.com>
References: <20201013100314.216154-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013100314.216154-1-tali.perry1@gmail.com>
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
Cc: xqiu@google.com, benjaminfair@google.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org,
 linux-i2c@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 13, 2020 at 01:03:14PM +0300, Tali Perry wrote:
> Systems that can dynamically add and remove slave devices
> often need to change the bus speed in runtime.
> This patch expose the bus frequency to the user.
> This feature can also be used for test automation.

> --
> v2 -> v1:
> 	- Fix typos.
> 	- Remove casting to u64.
> 	
> v1: initial version

Above block should go after cutter '---' (see below) line...

> Fixes: 56a1485b102e (i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---

...here.

>  drivers/i2c/busses/i2c-npcm7xx.c | 35 ++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

As we discussed previously I'm not a fan of the functionality this gives and a
way it's done, but this is debugfs and not anyhow an ABI. Also it's localized
inside one driver. In the future we may come up with better approach.

That said, no objections from me.

> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 2ad166355ec9..633ac67153e2 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2208,6 +2208,40 @@ static const struct i2c_algorithm npcm_i2c_algo = {
>  /* i2c debugfs directory: used to keep health monitor of i2c devices */
>  static struct dentry *npcm_i2c_debugfs_dir;
>  
> +static int i2c_speed_get(void *data, u64 *val)
> +{
> +	struct npcm_i2c *bus = data;
> +
> +	*val = bus->bus_freq;
> +	return 0;
> +}
> +
> +static int i2c_speed_set(void *data, u64 val)
> +{
> +	struct npcm_i2c *bus = data;
> +	int ret;
> +
> +	if (val < I2C_FREQ_MIN_HZ || val > I2C_FREQ_MAX_HZ)
> +		return -EINVAL;
> +
> +	if (val == bus->bus_freq)
> +		return 0;
> +
> +	i2c_lock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	npcm_i2c_int_enable(bus, false);
> +
> +	ret = npcm_i2c_init_module(bus, I2C_MASTER, (u32)val);
> +
> +	i2c_unlock_bus(&bus->adap, I2C_LOCK_ROOT_ADAPTER);
> +
> +	if (ret)
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(i2c_clock_ops, i2c_speed_get, i2c_speed_set, "%llu\n");
> +
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  				  struct npcm_i2c *bus)
>  {
> @@ -2223,6 +2257,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>  	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
>  	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
>  	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> +	debugfs_create_file("i2c_speed", 0644, d, bus, &i2c_clock_ops);
>  
>  	bus->debugfs = d;
>  }
> 
> base-commit: 865c50e1d279671728c2936cb7680eb89355eeea
> -- 
> 2.22.0
> 

-- 
With Best Regards,
Andy Shevchenko


