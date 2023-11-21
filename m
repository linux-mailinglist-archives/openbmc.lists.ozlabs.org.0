Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3247F35BB
	for <lists+openbmc@lfdr.de>; Tue, 21 Nov 2023 19:12:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHbydk5b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZXXY3DH0z3cb6
	for <lists+openbmc@lfdr.de>; Wed, 22 Nov 2023 05:12:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BHbydk5b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZXWw0qq7z3cT7
	for <openbmc@lists.ozlabs.org>; Wed, 22 Nov 2023 05:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700590316; x=1732126316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6gNaIiHSkGOx3pUPJYXxwWlzVU2Zgy4WYJYQocOPIYw=;
  b=BHbydk5bA76M9uzR90JZ/o3lrgYjZI/AGNL11x3/uE3a26FnGmBMj/kx
   1D+wSw14M0iWz+YiJewent6r49BBHnqVUr6ypfk2WrDaN8zKl32JXVNql
   pE2vh6dUGhCFIA/zHV8u4Y632MuDFj9JvSvXf+CwGvPSuGUtpXUpt1sz/
   xXg2SglQRVI4ZRb0MXCadJt60iKfnVNoB76io/g/+hCh4W0Oo1vGBFfnS
   V3Tj1E83w3kyk0GflVAuDOcfOqofVz4qvnAPYXLGcXnz7TIfa5hMfkSFy
   9EI6GF41RDFwcy3OtHlaMzuD0qbFYQjS0tdoHlipzmTU1XsZmZrI5nKHq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="13443306"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="13443306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 10:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1013992261"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="1013992261"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 10:11:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r5VDo-0000000Fsrj-1UCn;
	Tue, 21 Nov 2023 20:11:40 +0200
Date: Tue, 21 Nov 2023 20:11:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
Message-ID: <ZVzy227f3cIiTmtE@smile.fi.intel.com>
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:
> The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
> Utilize them instead of open coded variants in the driver.

Linus, I dunno if you are going to apply this sooner (assuming Jonathan is okay
with the change), but I have a bigger pending series where this will be a
prerequisite. So, when I will be ready and if it's not being applied (yet),
I'll include it into the bigger series as well.

-- 
With Best Regards,
Andy Shevchenko


