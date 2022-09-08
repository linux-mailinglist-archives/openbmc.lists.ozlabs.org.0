Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3F5B1986
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 12:02:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNZRK2bK6z3bl4
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 20:02:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HmnxE1R+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HmnxE1R+;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNZQv3NsKz2xYy
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 20:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662631303; x=1694167303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w2tDfZt6u3hn+SCpvEA9SBmEoYmSetazfTtjlLehh7c=;
  b=HmnxE1R+OQ9WblNMTA/MDvhzNyrEq7plGXRghBA3uAn4A108SzyDVit4
   WGhisAk7xf4pY9/kgtDJjNTsLSfpX3BHkKmwzK7hZa25lefUkHg1iTlce
   twlJ3CaEaaAytnlPRPgIvuccjGfW3H8qUKzNwJN+b5ClRvLCaC49JB6gb
   ch1z0ijGFkdK57ljIF2N0+8CkS+tZ8+COUGKoJzH+GbY8CIbO3xU3et8N
   80tUEqnCA+qaQQiEq0MJFtuhbopazAXrRooHRwSLbdknStxzpyZXPzFmE
   FumKSREwKqsdPKZ9AYTfBzC5cVPeGDiDrk9iKyAEZ13MSzjulUAS9vr60
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276863351"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="276863351"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 03:01:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="614832034"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 03:01:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oWELk-00A4K4-1a;
	Thu, 08 Sep 2022 13:01:32 +0300
Date: Thu, 8 Sep 2022 13:01:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v1 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get()
 return value check
Message-ID: <Yxm9fB/5IJS3MXGu@smile.fi.intel.com>
References: <20220905191408.73794-1-andriy.shevchenko@linux.intel.com>
 <YxkHaBKtiO9zVuKM@probook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxkHaBKtiO9zVuKM@probook>
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 07, 2022 at 11:04:40PM +0200, Jonathan Neuschäfer wrote:
> On Mon, Sep 05, 2022 at 10:14:08PM +0300, Andy Shevchenko wrote:
> > fwnode_irq_get() may return all possible signed values, such as Linux
> > error code. Fix the code to handle this properly.
> 
> It would be good to note explicitly here what a return value of zero
> means, i.e., as the documentation of of_irq_get says, "IRQ mapping
> failure", and why it should result in skipping this IRQ.

Not that I'm fun of duplicating documentation in the commit message,
but it won't take much in this case.

...

> >  		for (i = 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
> > -			int irq = fwnode_irq_get(child, i);
> > +			int irq;
> >  
> > +			irq = fwnode_irq_get(child, i);

> (Unneccesary churn, but I'll allow it)

The point here is to see that we actually check something that we just got
from somewhere else. It's slightly better for reading and maintaining the
code as I explained in [1].

And there is a difference to the cases like

static int foo(struct platform_device *pdev, ...)
{
	struct device *dev = &pdev->dev;
	...
}

when we know ahead that if pdev is NULL, something is _so_ wrong that
it's not even our issue.

[1]: https://lore.kernel.org/lkml/CAHp75Vda5KX5pVrNeueQEODoEy405eTb9SYJtts-Lm9jMNocHQ@mail.gmail.com/

> >  			if (irq < 0)
> >  				break;
> > +			if (!irq)
> > +				continue;
> 
> Since irq == 0 seems to be an error condition, the following seems fine
> to me, and simpler:
> 
> -			if (irq < 0)
> +			if (irq <= 0)
>  				break;

Not sure it's the same by two reasons:
 1) break != continue;
 2) we might need to convert 0 to error if we ever go to report this

So, to me mapping error shouldn't be fatal to continue, but I would
like to hear your interpretation since you know this case much better
than me.

Thanks for the review!

-- 
With Best Regards,
Andy Shevchenko


