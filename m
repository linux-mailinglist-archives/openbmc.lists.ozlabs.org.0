Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1D1DB242
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 13:50:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RrfG3Xx7zDqXS
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 21:50:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RrdR0gMMzDqH1
 for <openbmc@lists.ozlabs.org>; Wed, 20 May 2020 21:49:30 +1000 (AEST)
IronPort-SDR: I5PSGKRw200LSYkvM9vnMOHkpB/x1uUPVqUJG1ExYZmD4zobWWcSuKNW5fAcNWonNDpOIMs449
 gsxAwM+IowEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 04:49:27 -0700
IronPort-SDR: a/+Fpg54o+8PTDC2WA+m5PdUJa0V8mJpZ3R5KEtl27Vp1YaBQPYo9Gd+f4hN621W9nP6OxLRAh
 AaEUA68Jxk4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; d="scan'208";a="253582839"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 20 May 2020 04:49:23 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jbNDx-007pYn-Jd; Wed, 20 May 2020 14:49:25 +0300
Date: Wed, 20 May 2020 14:49:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH v11 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200520114925.GQ1634618@smile.fi.intel.com>
References: <20200520095113.185414-1-tali.perry1@gmail.com>
 <20200520095113.185414-3-tali.perry1@gmail.com>
 <20200520102452.GP1634618@smile.fi.intel.com>
 <CAKKbWA5L_n7iC6-d22Am62SOoDBwNWO87+sXtRbwxwuVdjmRYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKKbWA5L_n7iC6-d22Am62SOoDBwNWO87+sXtRbwxwuVdjmRYA@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, wsa@the-dreams.de,
 Brendan Higgins <brendanhiggins@google.com>, ofery@google.com,
 Tali Perry <tali.perry1@gmail.com>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 02:37:13PM +0300, Avi Fishman wrote:
> On Wed, May 20, 2020 at 1:24 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Wed, May 20, 2020 at 12:51:12PM +0300, Tali Perry wrote:
> > > Add Nuvoton NPCM BMC I2C controller driver.
> >
> > ...
> >
> > > +#ifdef CONFIG_DEBUG_FS
> >
> > Why?!
> 
> It is made to save code size if CONFIG_DEBUG_FS is not defined?

Nope (in cases I have commented on). Try again.

> We see a lot of kernel code that is doing it.

Cargo cult, okay. So, somebody should try to understand what they are doing.

> So could you elaborate what is the problem?

Problem 1: ugly code.
Problem 2: some of the code is not guarded (seems never been tested with disabled debugfs).
Problem 3: it's not needed.

> > > +#include <linux/debugfs.h>
> > > +#endif

-- 
With Best Regards,
Andy Shevchenko


