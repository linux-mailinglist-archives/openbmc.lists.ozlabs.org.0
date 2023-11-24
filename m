Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A96417F72BF
	for <lists+openbmc@lfdr.de>; Fri, 24 Nov 2023 12:31:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBqoo0wN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScCVF4Lbnz3dRr
	for <lists+openbmc@lfdr.de>; Fri, 24 Nov 2023 22:31:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBqoo0wN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScCTZ1sykz3dK8
	for <openbmc@lists.ozlabs.org>; Fri, 24 Nov 2023 22:30:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700825443; x=1732361443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JzMZ2vsKB2C1D0HWsCG583RAi3ZzKOvnFMfsXDwCl/M=;
  b=XBqoo0wNYrmztexa81ZQMSdnLRcQgk1GVV6XMc1yO8jiKTAPUucftmJp
   ma22NCUgx8n3s6xx2rDGSZaFFtW9Utn9djrVyxCiVHZKmxSj/TTqS6Dyy
   wt1TAEa0UGpjwXIi68bE4pFe+6zbFGlBDR+U538wMbnN50nMQHflFX8Lc
   HaJDN4KXRK8mZtMij9aP6wRkZzZnFQYXnvHpZ5QWQ/8gDpX7sidLBc01R
   uB6JnIEjvcER0vTs2WDXSexFrefarhl1L+0gPeNabYqiMBeWDKmQgXIFv
   45PgmXfwjKTLfOuP7x0Si02erQjqnW2cs62GAXDJ2xvuCZtt65QzGRZ9R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5565365"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="5565365"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="743860674"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="743860674"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:30:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r6UNs-0000000GhWa-0xhz;
	Fri, 24 Nov 2023 13:30:08 +0200
Date: Fri, 24 Nov 2023 13:30:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup
 and PINCTRL_PINGROUP()
Message-ID: <ZWCJP48WopQdCp6h@smile.fi.intel.com>
References: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
 <ZVzy227f3cIiTmtE@smile.fi.intel.com>
 <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZi5uW7saBFFA=VWDYpj_MCw3he2k-CLh__zJzUOOEkyw@mail.gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 24, 2023 at 11:09:07AM +0100, Linus Walleij wrote:
> On Tue, Nov 21, 2023 at 7:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Nov 20, 2023 at 09:48:02PM +0200, Andy Shevchenko wrote:
> 
> > > The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
> > > Utilize them instead of open coded variants in the driver.
> >
> > Linus, I dunno if you are going to apply this sooner (assuming Jonathan is okay
> > with the change), but I have a bigger pending series where this will be a
> > prerequisite. So, when I will be ready and if it's not being applied (yet),
> > I'll include it into the bigger series as well.
> 
> No answer from Jonathan but I just applied another Nuvoton patch from
> Tomer, so maybe Tomer can look at/test this patch?

Jonathan acked it  in the reincarnation in the series (see my big one).

-- 
With Best Regards,
Andy Shevchenko


