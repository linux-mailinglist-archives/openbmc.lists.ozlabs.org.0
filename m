Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF7845ABD
	for <lists+openbmc@lfdr.de>; Thu,  1 Feb 2024 15:59:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cdLULesm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQhrm0M5sz3cDg
	for <lists+openbmc@lfdr.de>; Fri,  2 Feb 2024 01:59:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cdLULesm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 02 Feb 2024 01:59:05 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQhr90fSzz3c4l
	for <openbmc@lists.ozlabs.org>; Fri,  2 Feb 2024 01:59:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706799545; x=1738335545;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=uDfO6MKK5anA6LUKyDyinlEfESTgcA6SEeVsHi7/kiA=;
  b=cdLULesm7xsbrD406dLXhA0jViJ5hF4QWU1cS/5MayUrRp449mqtV34m
   w46iiLBynzimO/igvzOZObCTX0qD4tRUmVIRv0pKYzv8dTITBT9uoQvZl
   2USbZZumklbHGvZNu7klv0ez96h4oWOcpcQZiJ7asksiAuSaruAWz9EFE
   NCsCKSD70q/XrQJvUpaU793hiX/sEL2g7mM0HYxb3S0XlDxsQdiXsyY6H
   uxR2F/wUXqCCX2p/PrKg8B3uShlGP/FC7rUPfopIoajOqhbkbF9hL0cT9
   N9cH/9mPUaqjEe37CuSNLczOuiq7NkGYd2LT+JTe3SRKNk5b89jhY2DNu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394360665"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="394360665"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 06:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822936089"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="822936089"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 06:57:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rVYVj-00000000rec-0kE8;
	Thu, 01 Feb 2024 16:57:51 +0200
Date: Thu, 1 Feb 2024 16:57:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Constify wpcm450_groups
Message-ID: <Zbuxbp6IWRBGjQSW@smile.fi.intel.com>
References: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211154239.4190429-1-andriy.shevchenko@linux.intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 11, 2023 at 05:42:39PM +0200, Andy Shevchenko wrote:
> There is no modifications are assumed for wpcm450_groups. Constify it.

Linus, can this be applied?

-- 
With Best Regards,
Andy Shevchenko


