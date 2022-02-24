Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87034C3756
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 22:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4QR054xsz2yQ9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 08:05:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDbL2k2f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lDbL2k2f; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4QQZ5nYxz2xsd
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 08:04:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645736695; x=1677272695;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IFBeUUR0XrsIjHq7Xv1aFtUp8B8jK38k7MgDsDsIj4A=;
 b=lDbL2k2fLdArrcbYWBClA/rIt3q4thvMBXZZpInqZGS7R9bAdkgxQPL9
 nsv5JuZUZw0tvhd5+3OdIBgKthTUJmmq6wenS2cPCr2/obnhue/aBtYnb
 QYTQZDnZ8WVNW1rWxN85/cTXtXBtQEJrsoMIEeY0OfeQ5GV/vy4BTNMdC
 MCR2gUOaq3GR1Iy2jTuMqA913GlMNjOZUvQ4/wU7gDOvJOOsRRoVffaNj
 fnQKlEmJAecBrErs/EtaC/pRGCDCcmf+01iiHGki2PgPWrpTEIlzS2rYE
 eqT9B++4bhBe4DQ7k+PAq2G3pDg1pRUQLfkBmgnPEHXUvsGVxhu5XKidX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252546787"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="252546787"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 13:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="788171189"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2022 13:03:49 -0800
Received: from [10.255.229.197] (jmbills-MOBL.amr.corp.intel.com
 [10.255.229.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9B2D2580BDB;
 Thu, 24 Feb 2022 13:03:49 -0800 (PST)
Message-ID: <7d792cb4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com>
Date: Thu, 24 Feb 2022 14:03:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
 <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
 <CACPK8Xf+6cLOWNYpMH21KDxRX3w5W=EwheTwL-ZktJvbG_pGeg@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <CACPK8Xf+6cLOWNYpMH21KDxRX3w5W=EwheTwL-ZktJvbG_pGeg@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/6/2022 11:45 PM, Joel Stanley wrote:
> On Wed, 2 Feb 2022 at 22:49, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>>
>> On Thu, 3 Feb 2022, at 06:29, Bills, Jason M wrote:
>>> This change adds a gpio_disable_free() implementation that checks
>>> if the GPIO being freed is GPIOE1 (33) or GPIOE3 (35) and will
>>> re-enable the pass-through mux.
>>
>> Okay. So trying to pull back from the implementation for a moment:
>>
>> Perhaps we can view pass-through as a property on a pair of GPIOs, rather than a mux state? I think it would be better if we could, for instance, annotate this in the devicetree?
>>
>> If we did that I don't think we're require this awkward and pin-specific implementation of the free callback for GPIOs.
>>
>> If pass-through is enabled it puts constraints on how the pins are used if they're requested as GPIOs, but we can add those dynamic checks in the GPIO driver.
>>
>> Let me think about it some more.
>>
>> Thanks for surfacing the patch.
> 
> This is for the kernel, I assume.
> 
> Jason, you should send the patch to the upstream lists (use
> get_maintainers.pl) for review.
Sorry for the delay.  I found the right lists with get_maintainers.pl. 
Should I send these patches to the upstream lists as they are, or do 
they need to be tweaked?

Thanks!
-Jason

> 
> Cheers,
> 
> Joel
