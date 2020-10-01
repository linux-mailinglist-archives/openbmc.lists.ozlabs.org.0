Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106F2805AD
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 19:42:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2L6D3cVgzDqb0
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 03:41:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=gmail.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2L5B482JzDqVv
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 03:41:00 +1000 (AEST)
IronPort-SDR: z+udMOnOm6MzMEqCeGq+oZzhtrOGoBtFAUsVIQkwmYoKULeelzq2z/O3nv+Bvz7VTbEqSkCxKa
 q9dsSTBgltHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="224409851"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="224409851"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 10:40:56 -0700
IronPort-SDR: MCXDRqQZOepaqaV9bmXjhsE4cmN81J+zNy1QBx7+SBPTHHRgjL+yK4UxtywV436mpunpxcbP00
 NOF/rTiMO38g==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; d="scan'208";a="339633448"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 10:40:53 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1kO2ZS-003H5E-LL; Thu, 01 Oct 2020 20:40:46 +0300
Date: Thu, 1 Oct 2020 20:40:46 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
Message-ID: <20201001174046.GK3956970@smile.fi.intel.com>
References: <20200930071342.98691-1-tali.perry1@gmail.com>
 <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
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
Cc: Alex Qiu <xqiu@google.com>, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> Hi Andy,
> 
> Customers using BMC with complex i2c topology asked us to support
> changing bus frequency at run time, for example same device will
> communicate with one slave at 100Kbp/s and another with 400kbp/s and
> maybe also with smae device at different speed (for example an i2c
> mux).
> This is not only for debug.

The above design is fragile to start with. If you have connected peripheral
devices with different speed limitations and you try to access faster one the
slower ones may block and break the bus which will need recovery.

> Can DT overlay support that?

Probably. DT overlay describes the update in the device topology, including
certain device properties.

P.S. Please do not top post.

> On Thu, Oct 1, 2020 at 6:40 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Oct 1, 2020 at 8:34 AM Tali Perry <tali.perry1@gmail.com> wrote:
> > > On Wed, Sep 30, 2020 at 12:31 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Wed, Sep 30, 2020 at 10:13:42AM +0300, Tali Perry wrote:
> > > > > Systems that can dinamically add and remove slave devices
> > > >
> > > > dynamically
> > > >
> > > > > often need to change the bus speed in runtime.
> > > >
> > > > > This patch exposes the bus frequency to the user.
> > > >
> > > > Expose the bus frequency to the user.
> > > >
> > > > > This feature can also be used for test automation.
> > > >
> > > > In general I think that DT overlays or so should be user rather than this.
> > > > If we allow to change bus speed settings for debugging purposes it might make
> > > > sense to do this on framework level for all drivers which support that (via
> > > > additional callback or so).
> > >
> > > Do you mean adding something like this:
> >
> > Nope. I meant to use DT description for that. I²C core should cope
> > with DT already.
> > I do not understand why you need special nodes for that rather than DT
> > overlay which will change the speed for you.

-- 
With Best Regards,
Andy Shevchenko


