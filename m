Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97C9686C8
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 13:55:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy6cp2vlBz3cD7
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 21:54:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725278087;
	cv=none; b=g70f7ZQNUJPxvqfISXexDxDa3JmEKvOMgFTHcZy5hLrVC+WGjxRfLZAXms0M2sVgYVfsG7ofDgLxDnXYniubtv4QomGdqj994R8RLVwjzD8IRM03qWneY9gLLWneZqjNEsNJGudKAZP4uWu9HX1bLjky68rOuYGotyCONETXnGDemY6rM3DhSZfAOzaO86o4eCbfoW5e1dh25wEL75KuunE0NrhRx1VFyfAI+FTiJ4C/K1VFFupnONG25DFD9I0hQvaRjBNus4kGrz2v2Hn5ZydbaTcvEcdOWwSngNDPbzCP+RwJF5ni+tir46emg4kExrKEBM/ZbUabbprdaskLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725278087; c=relaxed/relaxed;
	bh=658dkyhfxgCSSrDBJgaPG8gJzo8NCpdaHANWIb+uFbw=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=a+eHDsQpPky/CmKBAgz/uhH7CtNAFCRNf3vROO/3ygCU+uwhzmYANwGN0rl4GfFDmb0pqf3iEDlGfCT5aGFJsXnlIUv4QG//pph35wL20ELHyNnlhxXhIpd7OjsZBXMa8/FHd3CWAw9mHfhwpwAap2T1kj99EBCg0fnJvtPTTvZqEPmgfsN8hXVZPwoIFckBLUOTXkTtFz7USz2AV7u4nJXgjavUKgk3jkDNReZoqscg+uFUXw/pVKPYVtVC+yez+AJ14ttHaXJzHhrdZ5kB+qe+fOTBdncu9/Wc7mO6d5Tf2mbOGG95ItLYrPLalpUMBSQt8HhhvQ8yBtuiII790g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5USeP1J; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N5USeP1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy6cj2Nzpz2xch
	for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2024 21:54:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725278086; x=1756814086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sCdVNs/IlL95N+ZKq2piCTHeDB0GFDDYsaZYUbXVBnM=;
  b=N5USeP1JAM0uL5+LeF1bYrCHYw1/mjhUaQu4ghJ4WEueGAv2gSy+1v1g
   MZPQ7T3YGMEzYmZ74JYljW/eQhx2XembziXgXsLU4vNnMaeqzI61bja4m
   qgjjY28v+pW9D/XVzDsEf3g7pTKLWdEKcg237WWEFmwDvJopNaowXcFjC
   5IhnbreX8I4g3op4nzjWIJJI6uUo5g4oyac5Z8B6G0GDOLkzUpZam6Hk1
   /+7M/RBPhVQmUnq8Q2DBxhJk9rtiRshXfPYpnAXEvd5Amw7q/W33712kg
   2HuFBHRoi4iz0xW5IttC9/kUdWSJThw/f+7uMG9dEO6AkfsHpOk02Y6jE
   g==;
X-CSE-ConnectionGUID: f02kBclMSFeDjd0V5Uy97A==
X-CSE-MsgGUID: GYVuXbsATBC1Dk4IY5g6/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="24014064"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="24014064"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:54:40 -0700
X-CSE-ConnectionGUID: OvdcPaPcTuqTjN4oqZCmQw==
X-CSE-MsgGUID: yJ7JoR8XSVylSgT57ULXtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64945939"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 04:54:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl5df-00000004LgL-2a60;
	Mon, 02 Sep 2024 14:54:31 +0300
Date: Mon, 2 Sep 2024 14:54:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
Message-ID: <ZtWnd8bmiu-M4fQg@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-6-kfting@nuvoton.com>
 <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
 <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
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
Cc: kwliu@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, jjliu0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, avi.fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 02, 2024 at 09:40:09AM +0800, Tyrone Ting wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年8月31日 週六 上午3:16寫道：
> > On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> > > Store the client address earlier since it's used in the i2c_recover_bus
> > > logic flow.
> >
> > Here no explanation why it's now left-shifted by one bit.
> 
> The address is stored from bit 1 to bit 7 in the register for sending
> the i2c address later.

Yes, but previously it was stored w/o that shift.

> I'll write some comments about the left-shifted by one bit behavior
> above this modification in next patch set.

-- 
With Best Regards,
Andy Shevchenko


