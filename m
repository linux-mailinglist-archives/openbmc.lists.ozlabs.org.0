Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D33247DC7B
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 02:03:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKBl20fG3z2yp0
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 12:03:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J25eKcHk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=przemyslaw.hawrylewicz.czarnowski@linux.intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J25eKcHk; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKBkd0YQDz2xsY
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 12:02:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640221369; x=1671757369;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=JrcsWZdP8rKH9VmFY5B5ex64el5jCFnDMselmqd3qaE=;
 b=J25eKcHkcDZA33Csf2eh1FVkZQe0gWpoSuvV6p47Wm7i/gfAxjYV+Vds
 zdntCmbOaFcn3/flWmYMl6IucsariRR53YM/A9XBbg5yPwLRlzU3y1h9S
 1C59uXCrJ4oevftm94Rfubr4jhG34l1HVE9INPzTNBKZ4hz4P8GZf+Bik
 XhtIEGGoXsiocAadCuVGSgPnf28rVXpB4IMACmG8ChsuVBY+1CmO2fv0S
 ZmiFUvyUH5xatRIOe0XrPv2vCurxZElFkNnsHjGN8BaCWJEgb7nFGSN9V
 zLRiQaiHKhk8VymP6ftG7HJ/vcYVJoPJ/SNVuRiNyfygnXTgjIUFs746K w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304101144"
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="304101144"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 17:01:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,228,1635231600"; d="scan'208";a="508671399"
Received: from phawryle-mobl1.ger.corp.intel.com (HELO [10.249.149.33])
 ([10.249.149.33])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 17:01:44 -0800
Message-ID: <4ab2d31e-4433-5987-c2ad-8f3d4ce50090@linux.intel.com>
Date: Thu, 23 Dec 2021 02:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: Virtual Media repository request
Content-Language: en-US
From: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
 <YbdwYODNRJPuRady@heinlein>
 <5c98b6d46d71907242f1d868cc3d918db99cea53.camel@codeconstruct.com.au>
 <CACWQX819tsUA6t190mVp8LrrHbteiP4w-35MEH9LG9mWTvYgxw@mail.gmail.com>
 <d9ea11af-4b30-3424-5b1b-e0a51dde28f4@linux.intel.com>
 <8857fb3c25b2e3918dcda00f04710b3e9f84f1d9.camel@codeconstruct.com.au>
 <592e3b4d-2125-22b7-2413-0aa0857c9fe8@linux.intel.com>
In-Reply-To: <592e3b4d-2125-22b7-2413-0aa0857c9fe8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20.12.2021 13:54, Czarnowski, Przemyslaw wrote:
> 
> I plan to start pushing changes here this week.
> 
Replying to myself, but just pushed a series of first 4 patches to review.

It is just a skeleton (infrastructure to build main flows on) but wanted 
to get the first reviews for initial changes (transition from old 
content to the new one in particular).

-- 
Best regards,
Przemyslaw Czarnowski
