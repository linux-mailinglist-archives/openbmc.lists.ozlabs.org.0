Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 029BE1DD097
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 16:58:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SXn718DgzDqQK
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 00:58:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SXgh3PYJzDqnf
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 00:53:51 +1000 (AEST)
IronPort-SDR: A+J3E3+QPRhSN5ai04TAY/rgUAMMq3Q6nQcHbqVx4/5nwlVLQ4PG2zW57nShHKP+2jKYkqkWc4
 bIB+IZGHFvAg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 07:53:49 -0700
IronPort-SDR: CB261a1GJ8FH2/VHlwwKegEMCLgFPSudpuK9cAivmEf2gXDxZY8ZSeaP1UTGCBvzUk02CvmFs8
 cpKaQJw4V22A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; d="scan'208";a="412417898"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 21 May 2020 07:53:44 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jbmZv-0083Dh-LU; Thu, 21 May 2020 17:53:47 +0300
Date: Thu, 21 May 2020 17:53:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521145347.GO1634618@smile.fi.intel.com>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com>
 <20200521143100.GA16812@ninjato>
 <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
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
 Wolfram Sang <wsa@the-dreams.de>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Ofer Yehielli <ofery@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kfting@nuvoton.com,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 05:45:03PM +0300, Tali Perry wrote:
> On Thu, May 21, 2020 at 5:31 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > On Thu, May 21, 2020 at 05:23:40PM +0300, Andy Shevchenko wrote:
> > > On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> > > > Add Nuvoton NPCM BMC I2C controller driver.
> > >
> > > Thanks. My comments below.
> > > After addressing them, FWIW,
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Thanks, Andy, for all the review!
> >
> 
> Highly appreciate your time and patience for a newbie :)
> 
> > From a glimpse, this looks good to go. I will have a close look later
> > today.
> >
> > > > +#ifdef CONFIG_DEBUG_FS
> > >
> > > Again, why is this here?
> > >
> > > Have you checked debugfs.h for !CONFIG_DEBUG_FS case?
> 
> I compiled both options. I removed the ifdef in most places, except in the
> struct itself. Users that don't use the debugfs don't need this in the struct.
> 
> >
> > I wondered also about DEBUG_FS entries. I can see their value when
> > developing the driver. But since this is done now, do they really help a
> > user to debug a difficult case? I am not sure, and then I wonder if we
> > should have that code in upstream. I am open for discussion, though.
> 
> The user wanted to have health monitor implemented on top of the driver.
> The user has 16 channels connected the multiple devices. All are operated
> using various daemons in the system. Sometimes the slave devices are power down.
> Therefor the user wanted to track the health status of the devices.

Ah, then there are these options I have in mind (Wolfram, FYI as well!):
1) push with debugfs as a temporary solution and convert to devlink health protocol [1];
2) drop it and develop devlink_health solution;
3) push debugfs and wait if I²C will gain devlink health support

[1]: https://www.kernel.org/doc/html/latest/networking/devlink/devlink-health.html

-- 
With Best Regards,
Andy Shevchenko


