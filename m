Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C063A4628E
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 15:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2xYX3FJhz3cZ9
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 01:24:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740579853;
	cv=none; b=idUVIa6Y+qsvqAOE1cHlP+bX903oGYYDg4GKxhJ3BGsxf0432CSJ4JXmKwpqeO/9fpKhU2OxyRXeUnZ+p3YMFZz1woHClcT2Zl7uZX5QanIqhPGf0s/oUvMBVPWKGwYlUkQ/1qFZDVI11l93Q1XE+h9KkJZL2lDDw8juyeM1pSD3hwk8eBhTU09re5beSRsg2ZOU3c8cVkHwMsqllQ+tZ3P/UO1Mv2BvdJrpENAErA+bqvNXsMjwU62xPWmZrk/XKlwAaEunwbT6DfJ2jdplyjiFMzFqz2Pssz0T2T+EF4uqQO7PbuRCotiC1cL4N1doo8Pd3FNVn5klGboKtxF+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740579853; c=relaxed/relaxed;
	bh=2FR6ycy1H4/gsHmbcznuRW4wzcRrOH4+lFuwTC+AvPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNGuykqNkFSUMU4hmQSZkU3J+ayEl/3tu6A/x/3qgaZLjXpQu63xWWbt9RaKyhMBY170jNaGl5HVWnl/pUyIRZiaaY5g7oa8MqGhWzahCdOsUa6sVwVs5dHqqHDMP2bPEt8d+c+8UAyoNyjQtNVdLbJQA6383y8flkQZhxHQoB1SeJO1mNxeCfMG93y2ru1lCMD/R/vtqpw5iV9XTx/6b1fPZbRH2qH5MZJeYmRgpIGsQSSaVkSO4jjYCh4yo6kaCpYdwB5xayUlIY3rLVA0EUSCo4OlfURVevyZIeluOcgJwjeMDjHkDCBX3f2inCnJHnx/OB3JVyiXY5T1qUuYbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LYEEFJ9S; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LYEEFJ9S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 27 Feb 2025 01:24:10 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2xYQ6YH8z3blT
	for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2025 01:24:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740579852; x=1772115852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OrOB40cYbVLCfH0lnAsYoiZZ2zB91mfdMiAb0yEbrLQ=;
  b=LYEEFJ9SCquZIXgjJCYkjiI/SQn52E5wAWDkMffe/7R7PCScmA+wup0l
   BtEMZlbWO2eyl/MhCvVDJn0eUDlMnq98hc8CJHjUEKOXx8Xv85c9seVBf
   K87+bqCF0zdZ99lc147wmFevLsZriAEKIWMixoO1TyEM6IdgDfPSqkSdE
   O6qptNN0Je3box/F0Y1RU7IHXNFQ5Rez12mE7FIKfowgKY8CWiV6RQkug
   Gd1WtO4zruHYfqJ/2WJR5ihGtfNuz7nIOmvRB1Cz+bWJxdL7mJHgWUgIr
   fRnIf4pCwGqFtcNE8tsLpwGwbEHPh2x2hkPa76/zefy8NiFY0Oq+q50pD
   w==;
X-CSE-ConnectionGUID: fP9oaghjTJSHJgHCBLqUAw==
X-CSE-MsgGUID: 7lzhb3FtSBWch0n2iDg6PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="63890712"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="63890712"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:23:03 -0800
X-CSE-ConnectionGUID: qRUPd3CBTbyC46Q47oFPzA==
X-CSE-MsgGUID: WVf+wpDaR9a69sA3ZOCNwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="117202774"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 06:23:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnIJO-0000000FLVY-2saw;
	Wed, 26 Feb 2025 16:22:58 +0200
Date: Wed, 26 Feb 2025 16:22:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Switch to use
 for_each_gpiochip_node() helper
Message-ID: <Z78jwi8s34t3H8fG@smile.fi.intel.com>
References: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

On Thu, Feb 20, 2025 at 05:50:11PM +0200, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, correct header inclusion as device property APIs
> are provided in property.h.

Linus, Are you okay with the change?

-- 
With Best Regards,
Andy Shevchenko


