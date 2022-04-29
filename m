Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013695149F8
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 14:53:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqXVF6M3zz3bcK
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 22:53:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iZtGAwW1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iZtGAwW1; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqXTq56pRz2y6F
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2022 22:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651236799; x=1682772799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UpTl+EI4OxATNhRZbN10QD6jlbsYNUk1LadQPcxzoLY=;
 b=iZtGAwW1TR9Q2BY2GqbBv+R3TqVDVPiR+FvHINBD9pHJp/ENTBR3IEyj
 6GoC6yWQSiY0uxOZ1dbN3kEq0kuCH2BUxmIBAA6MyEy+KP3ZxLwQykinr
 CWWOhEWxbSDA2BZt099Euh/9XL7uo59Odwm4Sg7J5byal2k6QRkhnCWrj
 /5cujjKGEd++XZ1iPHsctUyIOa9aRPHV3Od9uQTQpp+QavtxYIIv7Z7ij
 V8ktORuuoQPwC/G6RNRnMNdQqZ1iZPNlFrjVnMJ8UxIjqsJpZDnSwtLM1
 wuG67foCH3tZzif++hayy1IYyGq0Y/GDNy+YtJmJyVDcaxDv62HceJana g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="248564711"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="248564711"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 05:52:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="542495249"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 05:52:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nkQ6T-009iHu-By; Fri, 29 Apr 2022 15:52:09 +0300
Date: Fri, 29 Apr 2022 15:52:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: Fix irq_of_parse_and_map()
 return value
Message-ID: <Ymvfeea1QXqSoq76@smile.fi.intel.com>
References: <20220423094142.33013-1-krzysztof.kozlowski@linaro.org>
 <20220423094142.33013-2-krzysztof.kozlowski@linaro.org>
 <CACRpkdY8LJ5xMW0eDsL-ycrqV8io2zXJrT6RfZj=KxaE9rvcvA@mail.gmail.com>
 <064f5758-a3ae-d116-fe72-9f52b4cbea78@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064f5758-a3ae-d116-fe72-9f52b4cbea78@linaro.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 29, 2022 at 08:03:19AM +0200, Krzysztof Kozlowski wrote:
> On 29/04/2022 00:52, Linus Walleij wrote:
> > On Sat, Apr 23, 2022 at 11:41 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > 
> >> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
> >>
> >> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Changes since v1:
> >> 1. Correct the return value passed further.
> > 
> > This doesn't apply to my tree neither for fixes or devel, can you rebase it?
> > I'd like to queue it on devel for non-urgent fixes.
> 
> Sure, I will rebase. The issue was because of Andy's commit
> https://lore.kernel.org/all/20220401103604.8705-9-andriy.shevchenko@linux.intel.com/
> which was in next but not in your tree.
> 
> Including such development branches in next, bypassing maintainer, makes
> it difficult for everyone else to develop patches... :(

I'm about to send PR with my stuff to Linus and Bart, but I have difficulties
right now with the signing tag. I hope I figure out sooner than later.

-- 
With Best Regards,
Andy Shevchenko


