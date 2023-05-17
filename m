Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2D706EFA
	for <lists+openbmc@lfdr.de>; Wed, 17 May 2023 19:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLzwb14cmz3f7P
	for <lists+openbmc@lfdr.de>; Thu, 18 May 2023 03:04:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7BAB+Wa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O7BAB+Wa;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLzw21mRtz3cJn
	for <openbmc@lists.ozlabs.org>; Thu, 18 May 2023 03:03:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684343026; x=1715879026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2y9dc4fvVXmSayb63VV0cFv6otKKoZXMYMxw98nbiUY=;
  b=O7BAB+Wa0JnDyJU+dHqys9nlqZDkDuizQBO/FFlAVH6t8BBJRyUGeCLs
   nS0rJigyffLT0ssSDsY8wtFBG0bfhTtMqVwd7kap+OcX+VSCIGUBz3CXO
   qLPJqBCbB06CGAz9E3ik5y6ZPrRg+b5QnHcQ0Zy98qHYSBd097IxJiffv
   B9SsG1t32q2wkWQzHtPbap0vRrwd5FOOxSaaVmL2l3TClRChqfqJUypbq
   XqEIxID7q0e0l1kxVbJyv/0vlgUkACtW1Ck/Jj0lxc+0/jGcIU/glD+1S
   tGrCo5h5Uawg96NClubHb7OPZuucVmpbWdp3bDH3xdMt3BYn6SxWtkzJD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351840400"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="351840400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 10:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="813944402"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="813944402"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 17 May 2023 10:03:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pzKYi-0008V6-2X;
	Wed, 17 May 2023 20:03:28 +0300
Date: Wed, 17 May 2023 20:03:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v4 4/7] pinctrl: wpcm450: elax return value check for IRQ
 get
Message-ID: <ZGUI4J27h69ed005@smile.fi.intel.com>
References: <cover.1684220962.git.mazziesaccount@gmail.com>
 <2d89de999a1d142efbd5eb10ff31cca12309e66d.1684220962.git.mazziesaccount@gmail.com>
 <ZGOwCSPH68DJN/NC@probook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGOwCSPH68DJN/NC@probook>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Eric Dumazet <edumazet@google.com>, Wolfram Sang <wsa@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, Marcin Wojtas <mw@semihalf.com>, Akhil R <akhilrajeev@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
  Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 16, 2023 at 06:32:09PM +0200, Jonathan Neuschäfer wrote:
> On Tue, May 16, 2023 at 10:13:14AM +0300, Matti Vaittinen wrote:

> > The special handling in this driver was added when fixing a problem
> > where returning zero from fwnode_irq_get[_byname]() was treated as
> > succes yielding zero being used as a valid IRQ by the driver.
> > f4a31facfa80 ("pinctrl: wpcm450: Correct the fwnode_irq_get() return value check")
> > The commit message does not mention if choosing not to abort the probe
> > on device-tree mapping failure (as is done on other errors) was chosen
> > because: a) Abort would have broken some existing setup. b) Because skipping
> > an IRQ on failure is "the right thing to do", or c) because it sounded like
> > a way to minimize risk of breaking something.
> > 
> > If the reason is a) - then I'd appreciate receiving some more
> > information and a suggestion how to proceed (if possible). If the reason
> > is b), then it might be best to just skip the IRQ instead of aborting
> > the probe for all errors on IRQ getting. Finally, in case of c), well,
> > by acking this change you will now accept the risk :)

From my side it was c).

> > The first patch of the series changes the fwnode_irq_get() so this depends
> > on the first patch of the series and should not be applied alone.
> 
> Thanks for investigating this!
> 
> It's not a), because there are no existing setups that rely on broken
> IRQs connected to this pinctrl/GPIO controller.
> 
> I suspect b) or c), but I'll let Andy give a more definite answer.


-- 
With Best Regards,
Andy Shevchenko


