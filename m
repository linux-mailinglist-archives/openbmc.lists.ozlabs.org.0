Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB704CBFD4
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 15:17:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8Y3M68g8z3c1P
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 01:17:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cxY9RDR0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cxY9RDR0; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8Y2x1cLdz3bvP
 for <openbmc@lists.ozlabs.org>; Fri,  4 Mar 2022 01:17:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646317034; x=1677853034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ynRuusHJD/05mmCsacrrHzXmY4ZK7oPmKnF+sWwUGc0=;
 b=cxY9RDR0wdYc3Is4aSRDGhXaQfrBC1tFB/q28h6v0gYHtSjdEQAUmUy5
 uEvHb1IfpXGkHTJaBS6ZUIub1hheAgq6n7DCv+5kCCSeZZZ/k8V0ik5BV
 7TOgp5my7rOku3u3gQNK6zZWjuS5BBIGE3w0Xia5CjyktmPk5lft4AsFm
 FFKFvOGYdTJr2KYkBYN1Jqsyth0bbAdiKbpEEJ9BJJcXMZaHkhV6rUiNo
 K4FFRWtk6V8c96N4nPnaQSN4wLdkxC0hFvKGk2SGYduvmF5IGNDm2qm33
 xIcc5q9bxB39Md4gAljak0JSW6Ao+/Zd/4LnwR6Px00L+6en/PG/h0IJd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253878175"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="253878175"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:16:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="545876842"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 06:16:05 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nPmEg-00ApL3-8j; Thu, 03 Mar 2022 16:15:18 +0200
Date: Thu, 3 Mar 2022 16:15:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tali Perry <tali.perry1@gmail.com>
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
Message-ID: <YiDNdlEKqorDFkZB@smile.fi.intel.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
 <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
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

On Thu, Mar 03, 2022 at 02:54:27PM +0200, Tali Perry wrote:
> > On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> > > the register is only 8-bit wide.
> >
> > > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> >
> > No, this is bad commit message, since you have bitwise masks and there is
> > nothing to fix from functional point of view. So, why is this a fix?
> >
> 
> The next gen of this device is a 64 bit cpu.
> The module is and was 8 bit.
> 
> The ioread32 that seemed to work smoothly on a 32 bit machine
> was causing a panic on a 64 bit machine.
> since the module is 8 bit we changed to ioread8.
> This is working both for the 32 and 64 CPUs with no issue.

Then the commit message is completely wrong here.
And provide necessary (no need to have noisy commit messages)
bits of the oops to show what's going on

-- 
With Best Regards,
Andy Shevchenko


