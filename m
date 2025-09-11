Return-Path: <openbmc+bounces-634-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08192B52A82
	for <lists+openbmc@lfdr.de>; Thu, 11 Sep 2025 09:51:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMqWj6FfYz303y;
	Thu, 11 Sep 2025 17:51:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757577105;
	cv=none; b=JQh9L3yBCsI79cmQ1bgF8v1YbcA3HlQj58MypLWw/ChGmzKUZiWqmVE8zL6EARYkvbIzgGD0tAbUORRQeZPe9RpfTgCbJXeI4CAGSh83W9CiwFVb+wQFLt+tbnwRujsQfAnOdCM+K6xM52RkuJRhx3gFwCDqdslKYSpxqk8m9ezsAPF36Uku0To0JvaEzVxMUjKasA6J/6PNnPmakzvzJP0rz8hf8RvYbj41KWF2rbyRXc0U4S8i09EpwmY1kiMPgmOPukwik9xvpesBo6q56kQ2M9f9J4fqBRobL95Xls0rNrGNbjMXfiDv/GP413c2eBcDYWg3KViQksY/oT7umA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757577105; c=relaxed/relaxed;
	bh=MwzDNI9yJYt0FbdpLoCs5UFoez7p7JLe3AO8r/PxG6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX3w4rW5DkXDxbHjIesZZJ3tH/85z5J7GfS+FwNEUntmT/hqAbaTfLVbmpGqCgqTntW8bYNl1C5W/7aqLcaD2xlXEMaorPbkX6Um42IfODH66RcNzActDDoMDRbY+3YzFR0rMEbmLc9c7jderwNsOxgCMWoyKYyB1nx3V7C02lpnIDVLw62afJ4yfxp3ieZkhkyw+rSUD+At2EL5kKQZN0HySXUTBBz/9OCldF65EijlBLaVknpUoHRRYVvGZ9YH/s2uzqQ6U21/I4a4KEA1FeyStCv6/X9Ge6lyKR03iycuSyDm8wssHzAwnPVFxdcX9Tb9OO1lZ7yZjBD6JFGGpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fxE0TBtz; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fxE0TBtz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 11 Sep 2025 17:51:43 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMqWg358gz303F
	for <openbmc@lists.ozlabs.org>; Thu, 11 Sep 2025 17:51:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757577104; x=1789113104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m30L7S1WvoRggLHv6LreiIlctXHF+XJ1XKVdT0+e9qo=;
  b=fxE0TBtzBlC7Yz4VqyQqNRv4RSagkxL7zi2wNqjRrxIVzQUO1+FLNx00
   0f8OWPSodvOnV1CPYugIwOs+oO597QtDNdbS5jO7+7tzDfdg5NIu99lFD
   DB4VVCmv/EI7IVsGRSQur6+sTzq9EoZnvPEYX1iDE2mMuTPvcpP3N4EY1
   kzGqcAiHInT2kp3MTyW9YnoXYOypkYHBHK0OcNGiHmUp/j3/HH2ot/BLa
   ZTEXgs7egJFvf37FRtavwK/JCB5AGohjfwj3CRzq9sVZzxXXRbGDc8/38
   N7BAy8GSxw5r10oH6ObuWoBH42sTX3ZeQbc51elC+dizchPmI+112Sicn
   g==;
X-CSE-ConnectionGUID: yRnaTSSJSA2rsW9coFGVHw==
X-CSE-MsgGUID: 7jE1ohH+TnSFj1wxFyx4BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58941637"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="58941637"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:50:32 -0700
X-CSE-ConnectionGUID: /rkAzoZPQPW19fuKTvUXuA==
X-CSE-MsgGUID: uzsJIT7GTJKG20+iNoc2mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="178821912"
Received: from smile.fi.intel.com ([10.237.72.51])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 00:50:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uwc4R-000000022QJ-0Efr;
	Thu, 11 Sep 2025 10:50:19 +0300
Date: Thu, 11 Sep 2025 10:50:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>, Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for
 compound literals
Message-ID: <aMJ_Ohp5YtYNFnYV@smile.fi.intel.com>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025 at 09:25:44AM +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.

Thank you! All look good to me,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

> [1] https://lore.kernel.org/all/20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org/

-- 
With Best Regards,
Andy Shevchenko



