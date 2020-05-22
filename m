Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8E1DE6F7
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 14:34:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T5Wx6HLDzDr0Q
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 22:34:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T5VZ0FFMzDqvn
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 22:32:52 +1000 (AEST)
IronPort-SDR: x6i6/2gE/JCBRAIZWP6oYy5pYb4jhdH6MgEJvv/mKk9c6Gio3pKXjqVWByfe7w8HsR7R2gzQHr
 xdWRQCyC9YrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 05:32:49 -0700
IronPort-SDR: gdNOhWPiD26Qwsk/8U/6trhMNaOkd6iMPsw+64KEMYwuMKrff1ja/OqQ3CbSLJRswf4BsofcDC
 tkglDYyxrfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,421,1583222400"; d="scan'208";a="309358979"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by FMSMGA003.fm.intel.com with ESMTP; 22 May 2020 05:32:46 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jc6r2-008EIs-Rz; Fri, 22 May 2020 15:32:48 +0300
Date: Fri, 22 May 2020 15:32:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v13 3/3] i2c: npcm7xx: Add support for slave mode for
 Nuvoton
Message-ID: <20200522123248.GC1634618@smile.fi.intel.com>
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-4-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522113312.181413-4-tali.perry1@gmail.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, wsa@the-dreams.de,
 brendanhiggins@google.com, ofery@google.com, linux-kernel@vger.kernel.org,
 kfting@nuvoton.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 02:33:12PM +0300, Tali Perry wrote:
> Add support for slave mode for Nuvoton
> NPCM BMC I2C controller driver.

I guess it will require v14, so, few nits below.

...

> +const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> +					    NPCM_I2CADDR1, NPCM_I2CADDR2,
> +					    NPCM_I2CADDR3, NPCM_I2CADDR4,
> +					    NPCM_I2CADDR5, NPCM_I2CADDR6,
> +					    NPCM_I2CADDR7, NPCM_I2CADDR8,
> +					    NPCM_I2CADDR9, NPCM_I2CADDR10,

One TAB is enough.

> +					   };

No need to indent at all.

...

> +	/* Set and enable the address */
> +	iowrite8(sa_reg, bus->reg + npcm_i2caddr[(int)addr_type]);

I'm wondering why you need a casting here.

-- 
With Best Regards,
Andy Shevchenko


