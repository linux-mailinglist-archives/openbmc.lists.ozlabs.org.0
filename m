Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C2497D6F1
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 16:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9FHF5HbMz3c7Q
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2024 00:33:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726842790;
	cv=none; b=mmkdb/HKQgRT9JjSkTTYL1OjwqQVPXXR0aYlzhsmm/w+3IymEDfcaO37E0jy4qtOC7L9M6e0SLSH/kqeyXAFlfG2L8zSoyYbrPbdZvfOa6YJnDnGcG0Jqm59dbsacJdgVtWbJiBZdDeAam8DWoELNbxOeHwwE+lB2j6MwJ3Gjz0cHpi4OAcuDxo3YRVPl6bTn04mTjjBYDi1Wy5enEAIjgoSZg+hA/LJkb53osVYwjcdjgSrt9iHw2NIyY84JBS4oSEDBT0ExFmRgpnXUUVQKbgYOsM561YGAN/tM7QWxMGtJhsHrN7nLcz+WtPCSmEYstDdEOEDA70AR88OautR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726842790; c=relaxed/relaxed;
	bh=9VK5+kcQg7hEc43tRiHJKpoIevPWo/Ko0TUcBiXgHBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa1i4xL4mJn8mA6LTspSpgBu4UAExK69fYEtyKAbOsacfDtGBXAJM7M0MlApzUtVb8VMJQaHoePyzT/uH3oAtvW6P7DX5awPF042ttGVb3zAy530e1MbItv6/kojWGnbIIk6r0RbOMtyP0WD+Isr1GKzeIsDMfeIkLmwVI+rNtGlvsCzpVwU41QY4RWahQRYJrlUjM/SKQXn2wiR4MH0YQBt4ixtD9UkqrzqtzPJzBL2jZlwchiRrvw55+T7KRrQg9YBsqo3VpdlIdE+iHsgUPC5q8WF1hxMLRr6McsDzJZTE42fWPyKb5nXaZirMi28L6plaeJsPVmMLIjs14wrQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=md+kZtQI; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=md+kZtQI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9FHB016Lz2xnQ
	for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2024 00:33:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726842790; x=1758378790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FmZ1iPfYLpvXQ9iWVPvde2w99WvWCFNwTvXH1ZHG+/s=;
  b=md+kZtQI3p6hjkmAjHpvafET9nj4Nv5Ra+xyhxZaSwOUDYwoPkeizv+v
   gzFkaszZYr5HZ7aaFPh0nzg1hs9rDYQEoTN/16ohfljwGFNiCpyyLJi7t
   Sw3WA8mb+qh+310WnJdCcZk30HAZCcpx7/Fwz8Vzss2tYkrwndLHUe+f/
   l/zLwjxrNHPZ+3bQ0NPPsYN+xmALdecGGJNJcVLx5gENAMq7++EsjCCIk
   GEwyB9DK9SMFdAtvQ9ex5q95ml3Q2sFEs6JmPa+O0olQTKbHDsDfOoKX/
   ru1TxhSeOO/6/F3wvOLbrbTDu+f1b9aZxThOszFd1OvcBKVDhKwtnhOEY
   w==;
X-CSE-ConnectionGUID: bGxYnx9kTIWCIhPpCleC1A==
X-CSE-MsgGUID: xemhsyVqQ1e2v6ZwXOHiqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29638675"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="29638675"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:33:06 -0700
X-CSE-ConnectionGUID: VlqCpYX8QHyARjpiYlo3Pg==
X-CSE-MsgGUID: eQh73CTxSP6P2ajTxgRzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70198558"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sregs-0000000AwL1-2MqZ;
	Fri, 20 Sep 2024 17:32:58 +0300
Date: Fri, 20 Sep 2024 17:32:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Subject: Re: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-5-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-5-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2024 at 06:18:18PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>

It seems all your mails have an issue.

> Store the client address earlier since it might get called in
> the i2c_recover_bus logic flow at the early stage of the func()
> npcm_i2c_master_xfer.

You got my comment really wrong.

func() in my example was to refer to _a_ function mentioned in the text.
And IIRC I even posted the example, like: i2c_recover_bus().

-- 
With Best Regards,
Andy Shevchenko


