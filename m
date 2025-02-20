Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C77A3DF4D
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 16:51:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzHmd5SJHz3cVL
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2025 02:51:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740066671;
	cv=none; b=n5GuxArVz1G4g/1ca503bBSW94/BT7O+4u/4pLZd6QZm1+QKP+VmU4l+ViF8+51GZyyqWsLg/Xk18RXDvonD+1w2J4EZwj/BaQkRHMUZFW0gmsWpy4WJ5M9TTIuR3u6iMwxuZcLboEgUlez/btSZCLsQZuag4mmxHPQmVw071x2aDxLhcXUci8MYhYfZhlq/LjhyqtoE0l65u1RhYseJu1uNBwF2gd0EAjUUbffkUCOTWQOJmSJ0QYQ8v7Zunf3sJltoFjlq6v1VWeoHTH660k4xwQXmDMDVIzdJ+nyO3w0AXm9+0w1/Ub36UBvXhnxmOn4xnEyjKTnxOwygdrYH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740066671; c=relaxed/relaxed;
	bh=mJdLGpjCZShdeLEWGiEmXtnN8K8Vh3HU8y/zq7y2ux8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pd4CVLBmisUdk+maSc7FfcX//TMrK0FRb364KQ3AmpFIg+n17Qfrm/Ek8syyl/jqvtb7z8yYkKoNEeEpaI0sCRFYYab1kb3N+QllyGDP0eBOthMU/Lchsqa2llium14Em7v5ZoGQ/W/tfe8pzjcRyQMbZpfQzJnsL+OYFRupIJF8KtSjolcfIkSAjTDK7j+ezodJvKAN5/447CpLLQpdhG6woq1e3mPyN0MQGTlZ5hUdVQlIlELxj0tV2PeSqWmrwIlVkEFSmzS022b7luotp+m4bLj8wJWu/utFHSMibtOHplSQ0iJCAALPVDDT4v5Zqk6SdFQDlrr2k2G6FN+EaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EF/3VP3y; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EF/3VP3y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzHmZ2Ctzz30Tp
	for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2025 02:51:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740066670; x=1771602670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+2MUjbCa+6/uP+xBk14uglQoYufUxL/uj8e1kmFQ0D4=;
  b=EF/3VP3ylJN3Q9PVLd4wuNffrfgA5UOMf7+xB5vqakyjjwlcIpub0XjN
   NcFyLwfyQ9qLk+Zd927aVTBvpIETfn2YDUvpEHg1HARwloI1VXEm3KknX
   2lOgsTaMqE8r19ylmA7/rhmlBZYM9Yk/5Khs3E2vZt/WtMXl/9Kep00f/
   CYYliLaSjzSOkQaDCPPE2Mn69yFQMa5MQjsvKkU3FsdA10K7s9HnZIdwN
   6xlU4ANhRfebMVSZRKurj4yG+LvISZ6QSZV6sr1e7OGXlacg20Z4dRTHV
   c6eJlWxComgSz73ndV91091NoMe/d3zaKceTdk1soRgctjCboTfh7+WBi
   w==;
X-CSE-ConnectionGUID: R/XNQQL8SxiKfMh85hjfWw==
X-CSE-MsgGUID: sqFOsDwJT9eqfuuF1TMyQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40988500"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="40988500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:51:08 -0800
X-CSE-ConnectionGUID: ppWrqNqSQwCOThS6X1+cQw==
X-CSE-MsgGUID: Q+75E4/ASASw5LvrslftUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115745550"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 07:51:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tl8pM-0000000DNdi-25Xo;
	Thu, 20 Feb 2025 17:51:04 +0200
Date: Thu, 20 Feb 2025 17:51:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node()
 helper
Message-ID: <Z7dPaDdM6wSY9U4a@smile.fi.intel.com>
References: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
 <Z65O_SaoSUcAY-rt@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z65O_SaoSUcAY-rt@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 13, 2025 at 09:58:53PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 13, 2025 at 09:31:52PM +0200, Andy Shevchenko wrote:
> > Switch the code to use for_each_gpiochip_node() helper.
> > 
> > While at it, correct header inclusion as device property APIs
> > are provided in property.h.
> 
> Linus, I forgot to update prefix. So, I will wait for other comments, etc.
> If no problems appear, can you fix that when applying, please?

Nevermind, I just sent a v2:
20250220155036.2734838-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko


