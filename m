Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6A8087F8
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 13:38:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ck1cteRZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDMH2Jqpz3d95
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 23:38:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ck1cteRZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDLd52HYz3cX4
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 23:37:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701952649; x=1733488649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uoIOAcneX9AofP4JnfDFkqufIngyLWMkLfkJAUEGqpI=;
  b=ck1cteRZkQ7QzNAhLeQ2u4SGcOnC9ICOngkHye1AOPnxv8HysVIMMOGv
   AFiHwBNXqn2bugd4BK6IlOIJVvjS+eoLaQ0XH9sukxXRY7UhuuyLB5SEg
   qrs4MHRFysTGXeLM8SW9E7spqtvx02b9/mdrpwfi1H8JL+nWGtW0s0iHJ
   GajxWADDgK6A4VsDUGE+lG3rS7tgtWpPyTRll+E259N+ZN2YOmsbBF7GZ
   BCx2AVd35kev+w18GpgD4y3O23Y9ocFnekwTNr4GMIBEHQ4zgHEO3mO6+
   E/gNWOoXwc68D7hoq1qdzqDLpSCtJEcHrQxzt4yR/scrwcyUQSiDswEQd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="384628702"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="384628702"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837702740"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837702740"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:37:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rBDcz-00000002bDf-3Wqj;
	Thu, 07 Dec 2023 14:37:17 +0200
Date: Thu, 7 Dec 2023 14:37:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/5] pinctrl: Use struct pingroup and
 PINCTRL_PINGROUP()
Message-ID: <ZXG8fQpWBQ8eag6x@smile.fi.intel.com>
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYVTgNCdDE6qK8wnbPAL2=S6RyDQYwPUVdtfQSSTratnQ@mail.gmail.com>
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
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 07, 2023 at 10:54:58AM +0100, Linus Walleij wrote:
> On Mon, Dec 4, 2023 at 5:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > This is an excerpt from v4 of the "pinctrl: Convert struct group_desc
> > to use struct pingroup" [1]. The series has been compiled with GCC 8
> > for ARM64 besides x86_64 GCC 13 and LLVM 16.
> >
> > Changelog to the mother series [1]:
> > - added a new patch against Renesas code, so no warnings will be seen
> 
> Patches applied!

Thank you!
I will send the rest after this part appears in Linux Next.

-- 
With Best Regards,
Andy Shevchenko


