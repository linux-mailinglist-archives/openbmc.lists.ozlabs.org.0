Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9D1D1948
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 17:25:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mdlw11mRzDqg1
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 01:25:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MdkW2FTHzDq9G
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 01:24:18 +1000 (AEST)
IronPort-SDR: yrKJQWcRlY37P0kI3RqvGGw8jK5Am+DVjn+MmsgknD7POfqrL1HLkLuPeEJWQabp5c86HOeS0r
 4lOml69TxJkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 08:24:15 -0700
IronPort-SDR: LEYmL0D8h4/MJPzQww7+nG6ZMTyIUMdrpW620uivs8d1RMOvGn0hsKExHGUYjZoUgEhe4Gmdup
 YKNkAXzriOTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,388,1583222400"; d="scan'208";a="251288456"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 13 May 2020 08:24:10 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jYtEz-006Rr3-Pi; Wed, 13 May 2020 18:24:13 +0300
Date: Wed, 13 May 2020 18:24:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v10 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200513152413.GQ185537@smile.fi.intel.com>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
 <20200510102330.66715-3-tali.perry1@gmail.com>
 <20200511091759.GE185537@smile.fi.intel.com>
 <CAHb3i=tERsM+gwmQN1+vjnML9o5NxRK=uBokEUsd-Ljyje4s3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=tERsM+gwmQN1+vjnML9o5NxRK=uBokEUsd-Ljyje4s3A@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 avifishman70@gmail.com, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Brendan Higgins <brendanhiggins@google.com>, ofery@google.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 11, 2020 at 02:28:50PM +0300, Tali Perry wrote:
> On Mon, May 11, 2020 at 12:18 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, May 10, 2020 at 01:23:29PM +0300, Tali Perry wrote:

...

> > > +#if IS_ENABLED(CONFIG_DEBUG_FS)
> >
> > Why?
> 
> We wanted to add an optional feature to track i2c slave status.
> the NPCM has 16 channels handling multiple devices each. Some of the devices
> are polled periodically, and might power down.
> The user wanted to implement a health monitoring option
> to occasionally check the status of the buses (how many timeouts, recovery etc.)
> This feature is optional and depends on CONFIG_DEBUG_FS The counters are exposed
> to user through the file system.

What I meant is why do you need an #ifdef?


...

> > > +#define I2C_NUM_OF_ADDR 10
> >
> > Is it 10-bit address support or what?
> >
> 
> No, the NPCM has an option to respond to multiple slave addresses
> (10 own slave addresses)

Perhaps more descriptive name then?

...

> > > +     // Repeat the following sequence until SDA is released
> > > +     do {
> > > +             // Issue a single SCL toggle
> > > +             iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
> > > +             udelay(20);
> > > +             // If SDA line is inactive (high), stop
> > > +             if (npcm_i2c_get_SDA(_adap)) {
> > > +                     done = true;
> > > +                     status = 0;
> > > +             }
> > > +     } while (!done && iter--);
> >
> > readx_poll_timeout() ?
> 
> Not exactly, readx_poll_timeout includes only a read operation, here there is a
> write in the middle. (iowrite8)

Ah, indeed. Perhaps time to add writex_poll_timeout() ?

-- 
With Best Regards,
Andy Shevchenko


