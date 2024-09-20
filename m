Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9239597D6EC
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 16:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9FDt01rSz3c7R
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2024 00:31:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726842665;
	cv=none; b=mdFYb1yq9gdEU+lG4bBSksEHoT7MvsotoUlRaROA5+HUG6RE1tpYsKajWrRngiUZyCNoQbtcbv+h8W+MgQ3Pkz+JU4kMZsPJIWd//2d008H9Gz0hVaM86oWC29/QRb1hx8toboh66PzYFtAUzLt//XYZ1xvK2aosmDcEDu2bu7mRw+P/UabWq83n1C+nkkKap/cOspMh6BMUETvWNT6M5Zi6YQGPe3464IasKUxFka80ylEH4hRBxELSsFVoIC7bBQfp1EZSRzL2SteWGx1WwWgUhiOFB7pMcKd+rMeHZ8Eb8Ye32LkQBQY/3I7a/aBb6GTx2ZBrruyL3wtcica2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726842665; c=relaxed/relaxed;
	bh=9RdAB2YVu7y2cUTrtUP0O78tvWjTMKm6rnP7gJgm4YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ox073yZeL/8pB9nADDWjDXgRW9N/MCA94SSBjNhCddQ1r3i7mB3hA4ehMZLQhOyfLlf/0SY9wIV6VhHB+hWxCqsNgpl6mktxe2tnTxAV7sC2W6iM4P84OnEiVXSy8FrrTxOY2pDv4TTxcq2zFf2v9rz0m2lZth4Fk4nKXY95I32PLi8Yy6jkdaa1NNmZxrfRtqnaRFWBINtqHB9jzKyxi1fBDF9+trKK8PEytkrpT+NhwklzL0nFN/GyTLYlcu9I85IaDt/Fr8IpQ4YuCzgGYveGweUeC2TIpK95MoxCfJWzkX33vwCWq69SOn8+p7hRwpCCcbm7fKCej1Rk/CXjag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IRVK1ppa; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IRVK1ppa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9FDk6gzWz2yKD
	for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2024 00:31:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726842663; x=1758378663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vb1mlYEI0m2HdYRCsq804tsecR/GPPDj7yvi33gn2g0=;
  b=IRVK1ppatyWkgcUIzKNSK4uthbZB9P3DTjNT94RQN9aZXlXR/Fb7y0UU
   dAjvGil1SLqJZlAsNu1pul0JSmXkQ6BIhF4a0AAIJVdYZ85G1b2pp64GE
   6nFJWHnBlDCDt59o+ZV5eMdrTdQWVs3wmwbvYY9XU+DjLOqCyazXNZ7IS
   tbPw+v5C6T2yLmXch3Xq2bw7zw6z8K0Ad6/0jz6VyMiaGCFKETZceP6Fb
   MkSK6j2lz/l2i0r0a7WoKPN32CqvGqdW8ve7ruYdNqNCJ4oCrslpi38dS
   oHNH8Tp+Czu16Th9TfZGmnduYPvEtrHlIiuYLctoKjgLItVSXM00bByS2
   A==;
X-CSE-ConnectionGUID: BDGxsognRXecdAxKyseDRQ==
X-CSE-MsgGUID: qwtCR1+vSwG3R+BSoH+IFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25948019"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25948019"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:30:58 -0700
X-CSE-ConnectionGUID: PRjBQ4eRSZ25VQOQKvFwNg==
X-CSE-MsgGUID: cL6Lh7OnQLafA4rleM5aRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="71167211"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 07:30:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sreeo-0000000AwIn-1X9L;
	Fri, 20 Sep 2024 17:30:50 +0300
Date: Fri, 20 Sep 2024 17:30:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation
 procedure
Message-ID: <Zu2HGte_05AA6yky@smile.fi.intel.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-2-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-2-kfting@nuvoton.com>
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

On Fri, Sep 20, 2024 at 06:18:15PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>

Something wrong with your email setup. This patch may not be applied in this form.

But before (re-)sending, wait for others to comment (up to 1 week).

-- 
With Best Regards,
Andy Shevchenko


