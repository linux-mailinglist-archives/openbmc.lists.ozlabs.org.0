Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A29CE977DD2
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:39:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4rR30lv0z3cFN
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:39:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726223980;
	cv=none; b=nB23hii5EpgrBiJxD16Pjtmy1holynA7MsaJE5kZEAlL57QowKQrvB4HbQsO0fbEw51NHgoZobWBLOkZHg8Rya5hAQpYHffAgVEU4CcAKx7jPfkRwpzr9JaycHMIf+6Qh2BBE1aLq+sgd1lpClBonAgb7hL6ELOISrwMcf8G0pXwLat2cQMZqOAwDT8lZHBTeYsDammhptDCfxbr4JE0Q7qmhfoIp/RZ+KaMnd9if6xQ9hGQkmsFmQtuBLMuJsHqDBqBbxJ3g9Up8fqdhmEquZmbytYJEegcaRTCFoOdAwPpwIQN+hUyx362eOsCC3laDco3QIShQ81nelaqeCQzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726223980; c=relaxed/relaxed;
	bh=g1d7RXF4WDmrT9IAyhvamWE3Ng0jpfHhDtk+KkIrZZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8HcyPul+61InhHFFVPuPnlRAZBG7jHg6/MRAktapw5ndLeQ/FQ1mrv/4NP9nXOSrEPBUqQzHeK+RrNOzO1HOa5JyHsVOcBcDtc6traOBfQgpFE5hmvPMCxnjBUUZju5hFbUjrfRV75F7R+gqoCEBJt61Jqk0GUKsbnq6wdEyciVT0ZTsVe0IqJM50QHxG9La1EKFhhQa7wZnD0vmHQyQZBKuv/YxFEW48iSn6sNkBWKiuZilzw0t5Mi8bfX+eMShTSk5SIEucmIjO/SreCX3DfCfkJ7Gc5aVhgD2b0eh9P4gd6zj4OPEV/Eru8D+ytgAJq0gNS2ueN0hMPX6s9dVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lN6/14ve; dkim-atps=neutral; spf=none (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lN6/14ve;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4rQz5t7dz2yn9
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:39:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223980; x=1757759980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6sF+wPKjn76Jsy/0GoNxE4UqYC466NE3LDyXXL2yCd4=;
  b=lN6/14veZbvzQqsO0KjlSbTqEsiQ+gv1mFp6Xb59A5kwMe/GSDds/Oi+
   +URBM+LSnwACmaBB2Jb5+41cN2H/6GDKlGr/Dc3N3CC86ByTz+hNbzVlB
   v9Oh0OdEirULuuxf00/B1Z0EsR8VGqJHBpuIg9tQfRyaQX9HX30pkTMKw
   TRDJoPre+hU+jQEFyN10j3/CucZsy8NzUj0FbFwqBhYhkI0xUQ5GnSB29
   QIy5PrZTGacxVQyYLC1YXPjDKUuOCfFTAwpRtFkGmPCXkWroVBiX742yM
   Nd3V8HWwLkBJbeagAhvTFMXIuAiDhTCPYbl3r/kLj6RN+A9NJbl1utUIs
   Q==;
X-CSE-ConnectionGUID: 7GiJdag1SBmhgj9/f/bwsA==
X-CSE-MsgGUID: ivV7VMP1Su6fwF81YTrlHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35784904"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35784904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:39:37 -0700
X-CSE-ConnectionGUID: j4EqSQe+R3u8rz+7vbv3AQ==
X-CSE-MsgGUID: KNkvfoktRnmdiNOXEIoUsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68781907"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:39:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3i5-00000008GRR-3LAw;
	Fri, 13 Sep 2024 13:39:29 +0300
Date: Fri, 13 Sep 2024 13:39:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Subject: Re: [PATCH v3 5/6] i2c: npcm: use i2c frequency table
Message-ID: <ZuQWYabomv_xyYyj@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
 <20240913101445.16513-6-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-6-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2024 at 06:14:45PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Modify i2c frequency from table parameters
> for NPCM i2c modules.
> 
> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz
> 
> The original equations were tested on a variety of chips and base clocks.
> Since we added devices that use higher frequencies of the module we
> saw that there is a mismatch between the equation and the actual
> results on the bus itself, measured on scope.
> 
> Meanwhile, the equations were not accurate to begin with.
> They are an approximation of the ideal value. The ideal value is
> calculated per frequency of the core module.
> 
> So instead of using the equations we did an optimization per module
> frequency, verified on a device.
> 
> Most of the work was focused on the rise time of the SCL and SDA,
> which depends on external load of the bus and PU.
> 
> Different PCB designs, or specifically to this case: the number
> and type of targets on the bus, impact the required values for
> the timing registers.
> 
> Users can recalculate the numbers for each bus and get an even better
> optimization, but our users chose not to.
> 
> We manually picked values per frequency that match the entire valid
> range of targets (from 1 to max number). Then we check against the
> AMR described in SMB spec and make sure that none of the values
> is exceeding.
> 
> This process was led by the chip architect and included a lot of testing.

...

> +	{.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4, .sclfrq = 0xFB, .scllt = 0x0,
> +	.sclht  = 0x0, .fast_mode = false },

It seems you have no leading space, while having trailing one. Also the split
seems a bit illogical to me, I would rather do like

	{
		.core_clk = 100000000, .hldt = 0x2A, .dbcnt = 0x4,
		.sclfrq = 0xFB, .scllt = 0x0, .sclht  = 0x0,
		.fast_mode = false,
	},

Yes, this takes more lines, but also more flexible to the updates in the
future. Also mind the trailing comma at the last member assignment.

...

> +	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)

Extra spaces...

> +		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
> +			break;

...

>  	/* bits [8:7] are in I2CCTL3 reg */
> -	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (sclfrq >> 7) & 0x3),
> +	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
> +		 & 0x3),
>  		 bus->reg + NPCM_I2CCTL3);

This has broken (illogical) indentation. Consider

	iowrite8(FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7) & 0x3) |
		 fast_mode,
		 bus->reg + NPCM_I2CCTL3);

-- 
With Best Regards,
Andy Shevchenko


