Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E0F706E85
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 18:48:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLzZV4HMzz3f8Z
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 02:48:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=akgw0EDn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=akgw0EDn;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLzYr6L1Sz3c9K
	for <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 02:47:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684342081; x=1715878081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3aGbiMN0V+5yc6Amt+Y7GgCQxqWtHVXzMieUoBpl1Y0=;
  b=akgw0EDnkysbTbMr6w1/0Ouy+2xXLengqevbrO45RfhgumRfmw1Zv9tE
   pB4k80WxM3XZhDo70y1RRaqfkv/CwvWL/PUXoYxIGHIFpaJ7K1yYvTXIy
   C05KifyReiBj19tIgFd25aOcN9NzZjggUyr2RkBhpTEJX6CH8niSyFpdA
   i2KXl896UagS/GBf2N5TwNDSzP4jhc380my+EWlEHuJ8gWes0NwlyCahD
   hSlalxk0NTB/Wj25wpleV5EjhZqJ5/xOhqjuWbRJKWoQE4Q7Tlp3AUNsn
   5H6m4Gj0eTGKp1Vw1R1C1v0A0MGWtYXNmPmFqLKGmyR8TbrrYZyyLVkmI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351834334"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="351834334"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 09:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948338934"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="948338934"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 17 May 2023 09:47:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pzKJL-0008UB-36;
	Wed, 17 May 2023 19:47:35 +0300
Date: Wed, 17 May 2023 19:47:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v4 2/7] iio: mb1232: relax return value check for IRQ get
Message-ID: <ZGUFJ5LRCzW2V0a1@smile.fi.intel.com>
References: <cover.1684220962.git.mazziesaccount@gmail.com>
 <429804dac3b1ea55dd233d1e2fdf94240e2f2b93.1684220962.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429804dac3b1ea55dd233d1e2fdf94240e2f2b93.1684220962.git.mazziesaccount@gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Eric Dumazet <edumazet@google.com>, Wolfram Sang <wsa@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, Marcin Wojtas <mw@semihalf.com>, Akhil R <akhilrajeev@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org, "David S. Miller" <d
 avem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 16, 2023 at 10:12:41AM +0300, Matti Vaittinen wrote:
> fwnode_irq_get() was changed to not return 0 anymore.
> 
> Drop check for return value 0.

...

> -	if (data->irqnr <= 0) {
> +	if (data->irqnr < 0) {
>  		/* usage of interrupt is optional */
>  		data->irqnr = -1;
>  	} else {


After this change I'm not sure we need this branch at all, I mean that -errn is
equal to -1 in the code (but needs to be checked for silly checks like == -1).

Hence

Entire excerpt can be replaced with

	if (data->irqnr > 0) {

-- 
With Best Regards,
Andy Shevchenko


