Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9298BD28
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 15:14:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHz1S2q0Xz30W5
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 23:14:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727788471;
	cv=none; b=ETiQuCxsbqb4MfekMTzSdhp5yFKabh+ESFxRRP4/AYvNfG3ymehmybmfD/elTnzmMtnxeDlvl9i5ZwadGH8rscelb3h4yqzefzfhiPSBofZild8+xsobaONZDnlISxjy6ObE7D9z/bhQGmlSZKIl9itZfHeW3Durx4g0v8RQ884Vh7cWhFMMXnJWwCEAbdDkMtmB3iHO2xvkLH1xlwksFx/+pqtVL63e5imXrkU2AWnIYxOR33RdIPEvwZ0PMtb9A8F9NFfe1AKxcrFWMCbIVitsKHv1Q3tGN1MSVwliacQPuQqJt60IGO4o380T1AXLu5B5GQ3CRNhLVHbn6xbPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727788471; c=relaxed/relaxed;
	bh=+JVff5JlAGfma9DB9RVA5Vfv/EuA3a6CIlYES9g6oAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lacvitLv7pdOkaWFN0j2QgQvWZk65KyuwG0MoQYhuPh5d7WhFXLIAz1ww+kbbDofn8KIWrThCo101RAzqLOo683e3vxXkpH5wAgQy7cmVE2r9Mp0lz0AgN7w0i2MKSQeV0zZQh+tA1HIiMEeC/44eqhnzbD0nQogdNqNJK4Dng+dcNxpQ+iYECGLCXf7s+Bm3NsSa0ofipyVnMtw2It4Rk3kLY8gx84cGXPVJMia0MWRN4OYlknY/myPX6My7O1zs8mHb/C6X/ThtQjR3b2c4BK8vZgp8qiUeXs5Y0rlLAfwcQAzlaMiqW1tLacqcxaVC8FRm70ea7lAObSHoCl8aA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVWm1Eaq; dkim-atps=neutral; spf=none (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SVWm1Eaq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHz1J1M9vz2xnX
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 23:14:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727788469; x=1759324469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PJNiEgbOR/XVTDdp1Jdns/xshRQMPHYvX91kndFUefY=;
  b=SVWm1EaqKaNhbCzPIUOSRXFL8PeQ8ANAyClFFY4EZbvWQuIhHrxyuYAg
   pR1WErLW3EO119j+1s5iaUIHU36BL8WFB62bg4QGJAj6gdR6QzqZPIx03
   iyPNVhug0t2WhXF8l4g5G+5whvhGO9FMnqyDTzpLw6nZx+5+CdTcSvyG3
   E+3fZRJC+SI6LdmsjOyTlKHoe2C3SlMufAKCFDFxLfiM0q/2WtIyT8byb
   q2L+0bPUI+3/uZ+aKcn2hTzBkc7gGa2YCOes+UHXUYP8NllkjqV31DC60
   SPMdEBHZoms1gjXkwCZo87sq+iCSwKvDkU86qkNhuWBV20SASimm3dN4+
   w==;
X-CSE-ConnectionGUID: arCJw5wXSOCqbkseTm4Z2A==
X-CSE-MsgGUID: LujEEaLpSUuBvOCdfobQ1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14541860"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="14541860"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:14:12 -0700
X-CSE-ConnectionGUID: Ma3gRYy8Rg67o/OpEJBLmw==
X-CSE-MsgGUID: Xj2342VOQI2bwAH8+7KC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="74459795"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:14:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svchY-0000000FCZ5-03jr;
	Tue, 01 Oct 2024 16:14:04 +0300
Date: Tue, 1 Oct 2024 16:14:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 3/6] i2c: npcm: Modify timeout evaluation mechanism
Message-ID: <Zvv1m3RT916dyYRC@smile.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-4-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062855.6928-4-kfting@nuvoton.com>
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

On Tue, Oct 01, 2024 at 02:28:52PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> The users want to connect a lot of masters on the same bus.
> This timeout is used to determine the time it takes to take bus ownership.
> The transactions are very long, so waiting 35ms is not enough.
> 
> Increase the timeout and treat it as the total timeout, including retries.
> The total timeout is 2 seconds now.
> 
> The i2c core layer will have chances to retry to call the i2c driver
> transfer function if the i2c driver reports that the bus is busy and
> returns EAGAIN.

-EAGAIN

...

> +		/*
> +		 * Adaptive TimeOut: estimated time in usec + 100% margin:
> +		 * 2: double the timeout for clock stretching case
> +		 * 9: bits per transaction (including the ack/nack)
> +		 */
> +		timeout_usec = (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nread + nwrite);

Side note (as I see it was in the original code), from physics
point of view the USEC_PER_SEC here should be simply MICRO
(as 1/Hz == s, and here it will be read as s^2 in the result),
but if one finds the current more understandable, okay then.

-- 
With Best Regards,
Andy Shevchenko


