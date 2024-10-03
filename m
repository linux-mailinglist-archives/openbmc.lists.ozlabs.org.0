Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F098ECC8
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 12:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK6yj0fg3z3c9q
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 20:16:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727950569;
	cv=none; b=lMWwbLq8oX6RZko+6cDHje9QokEKvaynayRTJ0nTQt13KXoNV6v7Ez8RLUTzF6Mu630MJ+uQfaHd2tWBpSn3G46El347PwLjnCKhH/G5NUzOKwDn66ulau92S5lNe87bt2puO/L1gyti1fThtOhdzi3hZq88eQAVrIDGprKZANc83ld38I3aR96y+OYCNJ3M/RYTGpFHA3G40jgwwxIGhZRfWNCi8hcIZZSYTi+2fNy+Mwb4DPgc6rtEwKk1tn8MncNshhU0HUc6EMYj3/VtR09Sj5oviF6A5nXraX0JDx6P0HUNEgxzHyxi2GWnDQmB9YaDfAvQyOWocGkCTmpTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727950569; c=relaxed/relaxed;
	bh=IBGEciqXLkAYuBJB5LbxAvEZS2jVMJ0HxbsSlaCaiq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdnJ6dHJ1r7F50Txc/IN6ww7fREUw5ZMCQIkxiy9tK94xLYva2mfec6OK1/4AHFBD9ozwhM7cSAE2vqwq7tUKsm51uSyr+2rVWsWWFJfu2Ev7FZT+++SEoNmgh3bR0XVtq3yPSXfsFzmN62J2Ok5JP4aRwEEnN8X8L58C8dadBgEjR6cn8iI6YNemV3dmlY9EVlCREQBdT8bnfqMgGS5xKBQMEMjro7is3f0YIfm6AQDyYU1QRSk5e1ewKpg9GR7KHfNuD3gCR5FWaAtcJRZe6BmhltL9b8aUCkE91JGzzP3BiSUMEKEl5qb2UvL7UmsnyseSkftr6fGKkjZ5NQWBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cCe4Wxdw; dkim-atps=neutral; spf=none (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cCe4Wxdw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK6yX1tb0z2yVT;
	Thu,  3 Oct 2024 20:16:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727950565; x=1759486565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qqEr/d7JEF3M3078b1QH5LAWJO35b+cVIAnjF94+Bxg=;
  b=cCe4Wxdw5mkOKz3puHMJK7dB61uI8GdAzUGW2S/Zyy5Em4KokXH7gTTc
   C2736ESblc0IgIanaFFy/tsTsqN7xfaGsrJWps68sRZJfYkUVgQT+TbN4
   11Qe8XigL0g5L4GcGlbYw2q3aZG8so+fj5ySxfQAj/58QYmFkqCo/kPYq
   UhQKibOj4rPbo6OShPoqKnz0+3LG5kBdpSnfrwQ2QmCta+ZFs6xrN3n7W
   zLgABpODG2gH1Nl4i2veHbNim7UDqM4Ybp7j5ndHkrWbGBVLtU2ktwzJr
   2A/QZkG4ckSwE6n0ju3gsb4QzF5VhTu1Buq9JEGeXiOTZzlOLSS/I8eCM
   A==;
X-CSE-ConnectionGUID: vq/Wt7KjQMaogzgHpGeqng==
X-CSE-MsgGUID: DPX4c7OkSbGOtM7WSB4Hvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27316567"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27316567"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:15:58 -0700
X-CSE-ConnectionGUID: scu9vYm7Q3m+jU3LjkymsQ==
X-CSE-MsgGUID: DmjSEk4eQZq8E6Eebv1+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="111764920"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 03:15:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1swIsB-0000000G5Fu-02QF;
	Thu, 03 Oct 2024 13:15:51 +0300
Date: Thu, 3 Oct 2024 13:15:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:

...

> > Is it possible to switch to new terminology wherever it's possible?
> > I.e. master --> controller, slave --> target. See, for example, f872d28500bd
> > ("i2c: uniphier-f: reword according to newest specification").
> > 
> Just for cover latter? Or I should modify for each patches commit message?
> Or entire i2c driver statement need switch to target?

I believe everywhere, where it applies: driver code, comments, documentation,
commit messages...

-- 
With Best Regards,
Andy Shevchenko


