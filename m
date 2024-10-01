Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3C98BD6C
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 15:23:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHzCk1BC2z3bwJ
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 23:23:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727789006;
	cv=none; b=JQNxZNtEEq2bxZ48ibLomTbdewYmFmLUCwY9gTvVHrix4sUgoXFSexVu8tYvBZoPse5UKuB/GF2oUraATWydPjUe/J4bewGQg1Ne+F5VCkeIV/GrkUTkCNxZL/5f1+kx5osM2xXKVha4QRC7XmCle7M7o87vnwmIUqYq/tm3UMfHU6jm2ZNIyda6B3JWxmjfCT+0bjr8+0W6Xa2EvCrCwUEZ2tHW2mbSOvDRM4sA9d0GX16bQ0Kpf4nD1iCS+q+VYsbb7cM+SJgwyvSRn2kUZGzxQTKQA69qwxqJutDOAQEXxLVJ0f5qSCGRfbjDhae/2J8rA8Rw2go8WUvn7dEyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727789006; c=relaxed/relaxed;
	bh=FVHP38VY22rYi4pgRHMwf2+4U7m3Q5p8ks3k7sgqL20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur8YUyLgoW7JMoTFIXsIi6mPBCsFHGDeCcIYOmfDBQpD9t19x13BliummxrPvK3vPQSRHOg/5eS1AZi7Dm41erBhTkNhTxelsUEnxXz09vagO8PjgHIY4DIEUwhh9OCXhZK3M4/AFp8qYgDDAatqEIARN8VqiWKuUlmRQBrZtlC+KGYWsWBtaVLb2BtCXQSPWusFMZSNsInO5NX8cIfixHbwluJEwRc7EiN7tAxkARgb+MrEuLdtbI+OJVKLF0aFj2nKa4/HDqLal4ZRcoqpN/gcayP6NJ/3KNLEGdqHdfCupRFbu3pxL01UmznN5GiccHnt8R1+GPIPWirnVFoj7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TdTFvbST; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TdTFvbST;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHzCd6b9zz2y3Z
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 23:23:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727789006; x=1759325006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fQ2vhUzLtGvkWyq8DZsTCLJmKFg82cwiPY8f99KGWqw=;
  b=TdTFvbSTNkkU+98mK2yFhPAI1yFcmXR6AfMwI4loMSbByAJMnYEO7ehA
   GNXAggJfET19bCfpahCvfw7uGGKn6cKsfwmLvOFPci6HkcFhlq9+W5Z5G
   fGo0F7RugRLb/PWH+peC/qE6cE3/HLDfQ3oTzt2WRq/0a0ZA0BPZL30aL
   mJ96A+0K6mgdQDKTFejTKWO8ljBSuW57zsPsA9EBya260Wh9IsposTDEl
   bZhUYbQHye1znRtsw3hh8D1ikvAA7WLmAJGyrHfP3KMRCIbXFla44Hd3K
   VcXmb3BrhYRuqWMqQGLmH7UE20na8ucIh5gap09t/gGEhKIX8r0mkiJhW
   Q==;
X-CSE-ConnectionGUID: pIt52mMQSWqfQPmekRlkDA==
X-CSE-MsgGUID: gYJQEP7jRraASKuqokkAnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27061999"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="27061999"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:23:22 -0700
X-CSE-ConnectionGUID: cEVT+0U0RLiRN7ywqh996Q==
X-CSE-MsgGUID: mVzLgWZCQkeWYNTyQqvzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="74079983"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:23:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svcqR-0000000FCj1-08ap;
	Tue, 01 Oct 2024 16:23:15 +0300
Date: Tue, 1 Oct 2024 16:23:14 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 5/6] i2c: npcm: use i2c frequency table
Message-ID: <Zvv3ws1_jUMVnAAJ@smile.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-6-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241001062855.6928-6-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 01, 2024 at 02:28:54PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Modify i2c frequency from table parameters
> for NPCM i2c modules.

This two lines have a too small wrapping limit.

> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz
> 
> The original equations were tested on a variety of chips and base clocks.
> Since we added devices that use higher frequencies of the module we
> saw that there is a mismatch between the equation and the actual
> results on the bus itself, measured on scope.
> 
> Meanwhile, the equations were not accurate to begin with.
> They are an approximation of the ideal value. The ideal value is
> calculated per frequency of the core module.
> 
> So instead of using the equations we did an optimization per module
> frequency, verified on a device.
> 
> Most of the work was focused on the rise time of the SCL and SDA,
> which depends on external load of the bus and PU.
> 
> Different PCB designs, or specifically to this case: the number
> and type of targets on the bus, impact the required values for
> the timing registers.
> 
> Users can recalculate the numbers for each bus and get an even better
> optimization, but our users chose not to.
> 
> We manually picked values per frequency that match the entire valid
> range of targets (from 1 to max number). Then we check against the
> AMR described in SMB spec and make sure that none of the values
> is exceeding.
> 
> This process was led by the chip architect and included a lot of testing.

Personally I consider table approach is not so flexible and it is definitely
does not scale (in the result — hard to maintain for all customers), but if
it's hard to calculate all necessary data and there are other pros of it,
I'm fine.

TL;DR: I don't like this patch, but I don't want to stop you, hence no tags
from me.

-- 
With Best Regards,
Andy Shevchenko


