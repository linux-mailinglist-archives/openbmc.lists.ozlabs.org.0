Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8FA5FB7A0
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 17:45:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn0VD69V2z3bhv
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 02:45:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CyWmZhh+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CyWmZhh+;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn0TX1lNGz2xJ8;
	Wed, 12 Oct 2022 02:44:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665503088; x=1697039088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+ptjxKpKMe9ZpYpWkzy6xCUEZZDC37TWs3lCOeMWbyI=;
  b=CyWmZhh+pfnGDk2xw3J4gTMyndONj4jdoNmNYgb3xVlm26cr25WSGFVx
   63Cw1ELRcaTbDp4ik50IbvQX8MIlliygxrAWSYsOUY2Zju55BpFD76Ug4
   5VSU7WROExLD7CO8WZ8vI/uuUOwFaajud1xHqLnNyXT1mWV4vwgde/XMW
   gJAChklkNsY0HxjzA9xOixWm4OW98kcJWGwAehRqhQsF6WNCIkdvlTFwf
   NgvrcCWqshMHje9KTCA7oNazHujMu5urEPREulUagcBg6nR+gGcLKZNds
   Vs2nN+KE0GgOxXyL6yAAMu04w0V2mqvesItGXfX0VdA7n4MNW3MpqBHrS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="303277171"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="303277171"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2022 08:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="715553658"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; 
   d="scan'208";a="715553658"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2022 08:44:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oiHQo-005OPV-2A;
	Tue, 11 Oct 2022 18:44:34 +0300
Date: Tue, 11 Oct 2022 18:44:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0WPYuZ/9//jxwQ2@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com>
 <Y0V57gI75ik4ki3A@sol>
 <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
 <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
 <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
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
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 06:19:13PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 04:39:46PM +0200, Geert Uytterhoeven wrote:

...

After all this patch is not needed. However, during checking of the necessity
of this patch I realized that seq_file is used in a few GPIO drivers without
any actual users, so I will prepare clean up series for that as well.

-- 
With Best Regards,
Andy Shevchenko


