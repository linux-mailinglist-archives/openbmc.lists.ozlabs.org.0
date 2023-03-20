Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8138F6C123F
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 13:47:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgDzQ2yXKz3cGk
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 23:47:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kp+y3A1L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kp+y3A1L;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgDyg0fDxz3c6m;
	Mon, 20 Mar 2023 23:47:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679316427; x=1710852427;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BS/iDj084XvVXlM/TI4ORDgBbDzLSZq0yXe7n1ACXBA=;
  b=kp+y3A1Lgytkqvanyi+4EdZJLq/esAhQUDgEVtMncR59DPmFxZjzM5w8
   LrMg7jBiEEa+qQTlCMJDA6H4kmDFZN/mmhKOKLxigs5FE1HguavmeyJIF
   rxVFNVaeIPG4nly2jvAUgZImIzO+UIm3x7eA1TBeQ1waMUP9//5eF5rBl
   tvAIaFsTJoAOsKESWKGrsxpslHvmunXcOEp9J097QT9ohJoKxipE3uYqW
   T2mI9QFBEhtIegO0womTJJJHKGo5B2pz3etAluJS3iZqIGtRTRaYN0COT
   vsL77hYM3zvkHkWlyt4n0h0UUwUHif7nvxcnEshqL2Q+nt7bKB1hDnwfA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319050914"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="319050914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 05:46:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="745361757"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="745361757"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 20 Mar 2023 05:46:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1peEuW-006GkN-0C;
	Mon, 20 Mar 2023 14:46:48 +0200
Date: Mon, 20 Mar 2023 14:46:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: [PATCH v8 10/13] hwmon: peci: Add cputemp driver
Message-ID: <ZBhVt74i1DSoa+bE@smile.fi.intel.com>
References: <20220208153639.255278-1-iwona.winiarska@intel.com>
 <20220208153639.255278-11-iwona.winiarska@intel.com>
 <ZBhHS7v+98NK56is@home.paul.comp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBhHS7v+98NK56is@home.paul.comp>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>, Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Iwona Winiarska <iwona.winiarska@intel.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 20, 2023 at 02:45:15PM +0300, Paul Fertser wrote:
> Hello,
> 
> We are seeing wrong DTS temperatures on at least "Intel(R) Xeon(R)
> Bronze 3204 CPU @ 1.90GHz" and most probably other Skylake Xeon CPUs
> are also affected, see inline.

Thanks for the report! I guess we need a fix for this indeed.

> On Tue, Feb 08, 2022 at 04:36:36PM +0100, Iwona Winiarska wrote:
> > Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
> > readings of the processor package and processor cores that are
> > accessible via the PECI interface.
> ...
> > +static const struct cpu_info cpu_hsx = {
> > +	.reg		= &resolved_cores_reg_hsx,
> > +	.min_peci_revision = 0x33,
> > +	.thermal_margin_to_millidegree = &dts_eight_dot_eight_to_millidegree,
> > +};
> > +
> > +static const struct cpu_info cpu_icx = {
> > +	.reg		= &resolved_cores_reg_icx,
> > +	.min_peci_revision = 0x40,
> > +	.thermal_margin_to_millidegree = &dts_ten_dot_six_to_millidegree,
> > +};
> ...
> > +	{
> > +		.name = "peci_cpu.cputemp.skx",
> > +		.driver_data = (kernel_ulong_t)&cpu_hsx,
> > +	},
> 
> With this configuration we get this data:
> 
> /sys/bus/peci/devices/0-30/peci_cpu.cputemp.skx.48/hwmon/hwmon15# grep . temp[123]_{label,input}
> temp1_label:Die
> temp2_label:DTS
> temp3_label:Tcontrol
> temp1_input:30938
> temp2_input:67735
> temp3_input:80000
> 
> On the host system "sensors" report
> 
> Package id 0:  +31.C (high = +80.C, crit = +90.C)
> 
> So I conclude Die temperature as retrieved over PECI is correct while
> DTS is mis-calculated. The old downstream code in OpenBMC was using
> ten_dot_six_to_millidegree() function for conversion, and that was
> providing expected results. And indeed if we reverse the calculation
> here we get 80000 - ((80000-67735) * 256 / 64) = 30940 which matches
> expectations.

-- 
With Best Regards,
Andy Shevchenko


