Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 856664CF797
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 10:46:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBtrH2tfsz3bPK
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 20:46:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FFeztctr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FFeztctr; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBtqq5MCVz30Kq
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2022 20:45:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646646344; x=1678182344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iYmh9KvmrAN/9n49jwIZ1qbV8GdSrmGWQVFa5C6rxI4=;
 b=FFeztctrsXVjWEnjAorV7rOgX6SMlTKdrv5Uafx1Jm27Aoc80vKMOe5A
 zjGEPpBje2RVKmc5vg9sC1z9XsFVGr11au/VFKTbnLrDV6VTD1t+Q3Su1
 6EywN1hl7lfamdmFueS1kMKYPJXB3A/VVivVGf/Al7JZ6BGQcViIW9WWr
 thc3ZkaO5bR0qCfFdwsodXNdmGl/TzpyVVRpxlGXkvEEM7N4apa4clxaU
 2DEpuIEkZfXK9ofBoqNMkUIACncQjPsLXyICnrfZCvnvPLpBfbayB0FzF
 59qlEf+SdpJl8LF56t4xKA32+xDWi689WR+p67WBho2iyY50vZtMQHdUE w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="241781871"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="241781871"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:44:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; d="scan'208";a="495003939"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 01:44:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nR9u8-00Ch1M-IP; Mon, 07 Mar 2022 11:43:48 +0200
Date: Mon, 7 Mar 2022 11:43:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
Message-ID: <YiXT1JX5A7Ez7C6G@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
 <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
 <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
 <CAP6Zq1iy0yNMemqDjrLu1F0rrRSDFhZ+SqdoOa9FyJDNL0ENXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1iy0yNMemqDjrLu1F0rrRSDFhZ+SqdoOa9FyJDNL0ENXA@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, Tomer Maimon <tomer.maimon@nuvoton.com>,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, Arnd Bergmann <arnd@arndb.de>,
 sven@svenpeter.dev, Rob Herring <robh+dt@kernel.org>,
 Avi Fishman <Avi.Fishman@nuvoton.com>, Tyrone Ting <warp5tw@gmail.com>,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, jie.deng@intel.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Mar 06, 2022 at 03:33:20PM +0200, Tomer Maimon wrote:
> On Thu, 3 Mar 2022 at 16:11, Andy Shevchenko <
> andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:
> > > > On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <
> > andriy.shevchenko@linux.intel.com> wrote:

...

> > But hold on and read set of questions below.
> >
> > Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask
> > applied,
> > right? From above I have got that FIFO is growing twice. Is it correct?
> 
> What do you mean by growing twice? TX and RX?

I meant from 16 bytes to 32 bytes.

> > Does the LSB stay at the same offset? What is the meaning of the MSB in 32
> > byte
> > case? If it's reserved then why not to always use 32 byte approach?
> 
> Yes, the LSB stays in the same place, and bit 5 is reserved in the NPCM7XX
> SoC.
> Unfortunately, the I2C test failed when we tried to use the 32 bytes
> approach at NPCM7XX Soc, this is why we added NPCM_I2CTXF_STS_TX_BYTES and
> NPCM_I2C_STSRXF_RX_BYTES to the data structure.
> 
> The device tree data structure pass data for each specific device, so I
> don't understand why not use device tree data for supporting the I2C
> specific device? this is not the case here?

Basically we use compatible strings for that, but in any case if something
can be autodetected from hardware, it's better to use autodetection.


-- 
With Best Regards,
Andy Shevchenko


