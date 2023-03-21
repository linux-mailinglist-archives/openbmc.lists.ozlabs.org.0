Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 169586C3254
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 14:09:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgsPz0b6fz3bh5
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 00:09:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=azRDJLRN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=azRDJLRN;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgsPL3xrvz3bfk
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 00:08:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679404134; x=1710940134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDawhMbCoPJQU9jRIClAgTZfAFVmoWyY2z2wwL5eHyA=;
  b=azRDJLRN6r7K5lI5zPb6IZrNo44D2WrlIGuYEKCZdyIbZhqmmh9b3Wa7
   l5MJiYy77mMqLnof90EXdIUhvOsD/cq0baOB8bD4vUDMhn5XurUkat2ry
   jNkv1/dOH9t0BBnvv6ISSRDKWGVz//kIzofsd5+Rp06Sq9BLzZkhYc9BL
   dDkg5htJ769sqVC/GSK3fZowckFjpqSmSC2KV7cKekli5IrU8yJb4LZAL
   w8JCc5fJPz/VbaoCG3n7YsgZPiCJ5AM1VAxQImyd6LK2R0yaksxMX7UWG
   gmIBRjUhssDQhhjfgnCXnSzn8jAOZR7NDK4VuoRAPC24ab77t4zuCZDbH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425209712"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="425209712"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 06:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750552792"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="750552792"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2023 06:08:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pebjJ-006ijj-1j;
	Tue, 21 Mar 2023 15:08:45 +0200
Date: Tue, 21 Mar 2023 15:08:45 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [PATCH] hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
Message-ID: <ZBmsXYV6jkLiFmJz@smile.fi.intel.com>
References: <20230321090410.866766-1-iwona.winiarska@intel.com>
 <f2fe16cf-3838-df89-958f-c39d1bae81a1@molgen.mpg.de>
 <df6ab72faf9f1484f7f850ad7386f76b60e5bf02.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df6ab72faf9f1484f7f850ad7386f76b60e5bf02.camel@intel.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "jdelvare@suse.com" <jdelvare@suse.com>, "fercerpav@gmail.com" <fercerpav@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 21, 2023 at 10:29:22AM +0000, Winiarska, Iwona wrote:
> On Tue, 2023-03-21 at 10:41 +0100, Paul Menzel wrote:
> > Am 21.03.23 um 10:04 schrieb Iwona Winiarska:

...

> > This is not aligned. Why not only use one space before the equal sign?
> 
> Yeah - same alignment problem is present in cpu_hsx and cpu_icx though, so I
> just followed along for skx to not stand out visually.
> So while I agree that alignment is broken here, I think it might be better to
> separate out the potential cleanup from the fix.

I agree with Iwona. If community wants a cleanup, it can be created in
a separate patch. For the fixes it's better to reduce the unrelated churn.

-- 
With Best Regards,
Andy Shevchenko


