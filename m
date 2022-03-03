Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C88534CBFA7
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 15:13:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Xy46MNGz3c1d
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 01:13:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PMg0LN2R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PMg0LN2R; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8Xxf3vM4z30NW
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 01:12:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646316759; x=1677852759;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8UFSNQlM9WPEp6bci8a0Zs4QbDnKrGrES/unqzgEs3s=;
 b=PMg0LN2R8uRqmu3eFVbHx1d8jrpHCRPMmGEaFW0l9Aezp7qogW2UHN7+
 jVWaqbD0gqc6OPk6ODLUJvXNdwHIn4rLE6+R/mkT7CepJAamWIgb9kzTN
 a+bwM3sOD3VAjU6TG2Dxy134EXfIsRRdFGTBNhoxxHTpOrSSKwhHc5cEw
 79yO4BbLViFdNw3+Q/z7YLnXUA00xlcKPXxN9gteV4PnLCJDbVZeURWkv
 tS3pn4gS4nTlpqAeS3pZMUdWYeCP+pi92kuoWyri+whWRKQll+NHUKXzv
 m0uGnolPu7fHSr9rE+tSC9rEcZ4yzXFzfU0j4TXaZ+EMN24T0Edm2SWtD w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234295452"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="234295452"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:11:34 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="576497839"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:11:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nPmAC-00ApFi-B4; Thu, 03 Mar 2022 16:10:40 +0200
Date: Thu, 3 Mar 2022 16:10:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v3 11/11] i2c: npcm: Support NPCM845
Message-ID: <YiDMX7pUqs/rLJUU@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-12-warp5tw@gmail.com>
 <YiCb7LNY9tmMCZx7@smile.fi.intel.com>
 <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=tWhtXK+c5GGbp6m23AHoyy=4woT_+n3a_N-6CqKUYb=g@mail.gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, devicetree <devicetree@vger.kernel.org>,
 yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 03, 2022 at 02:35:58PM +0200, Tali Perry wrote:
> > On Thu, Mar 3, 2022 at 12:45 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 03, 2022 at 04:31:41PM +0800, Tyrone Ting wrote:

...

> > > > -     left_in_fifo = FIELD_GET(NPCM_I2CTXF_STS_TX_BYTES,
> > > > -                              ioread8(bus->reg + NPCM_I2CTXF_STS));
> > > > +     left_in_fifo = (bus->data->txf_sts_tx_bytes &
> > > > +                     ioread8(bus->reg + NPCM_I2CTXF_STS));
> > >
> > > Besides too many parentheses, this is an interesting change. So, in different
> > > versions of IP the field is on different bits? Perhaps it means that you need
> > > something like internal ops structure for all these, where you will have been
> > > using the statically defined masks?
> > >
> 
> Those are two very similar modules. The first generation had a 16 bytes HW FIFO
> and the second generation has 32 bytes.
> In V1 of this patchset the masks were defined under
> CONFIG but we were asked to change the approach:
> 
> the entire discussion can be found here:
> 
> https://www.spinics.net/lists/linux-i2c/msg55566.html
> 
> Did we understand the request change right?

Not really. If you have not simply "one (MSB) bit more" for FIFO size, then
I proposed to create a specific operations structure and use callbacks (see
drivers/dma/dw/ case for iDMA 32-bit vs. DesignWare).

But hold on and read set of questions below.

Previously it was a fixed field with the NPCM_I2CTXF_STS_TX_BYTES mask applied,
right? From above I have got that FIFO is growing twice. Is it correct?
Does the LSB stay at the same offset? What is the meaning of the MSB in 32 byte
case? If it's reserved then why not to always use 32 byte approach?

-- 
With Best Regards,
Andy Shevchenko


