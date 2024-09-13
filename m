Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A995977D67
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4rDT1Hthz3cDr
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:30:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726223429;
	cv=none; b=T2g+KpwcmAPjPLZ4xz2jJZLSDLKPvF93gXZ4oK7bGH24OcDWoaKSzI3n2UDhWKuWn9+iQhp86IHKF9OeTqN2Ve+IFNmi5A8esxR2S/4tW3IKPkT835QogRFsTjFyM3KxNZ/RNkEZpt1bGsT6WO7OdRqsRW8KrpI58soWmdo7MZg9EG8CtjgjfTHoqL6mPAATX99OjjkKa9c15YtBAh+C2lfBca6K3HkM0N52SzPSArVDiRCh0WqKxsI82NHLvwQleWUI9hZcdyrssPEUubvK3vvgmHE7ntzYZ4JeBDUXlZC3z5CKV5sqJ6tCZZkzTQrcH77DpDcEw+70JwhhJKofDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726223429; c=relaxed/relaxed;
	bh=/r0EIAXxkIjil/3dR3CNb6bs4POb1qPuN3tLhSr/fMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPKLihWtbR00EBAFzhJlqZO+ix1WpFbEyY/VbLo1aSDxG6OioFX2+qm4wjR4sOHWnp52qCxRTGcXMm6RAp7g9CLoNqVGn1KjoCI1uEqYFx7NsdwCLWsV/lt/yUQqNCu/CUwtgolUNYJ5QX1z1t3ZjOQk7zr+P5unqJserbB0giTAj8P+4g0ABRqTNmvlujkMYd0FZUw99yHcdPbhh1P7kYfTH0wrQL9qm6maZxY24QrmwzUSYzTIlyUphbVI6MMGPq1Kl1H3USjXHmuhKhBwToPXJDeeAHACdcat7PM1sKl3DpGMNYL0j8KZnKlc7KYYnoKcwCuYodePvGP8obLw+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PVMTzu/u; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PVMTzu/u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4rDP2PPKz2yn1
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:30:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223429; x=1757759429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oD+Qsgq58ocfiZiQ8YH8GER77w5w9FSuVLKbvSvLgRM=;
  b=PVMTzu/u77em3r7hdGOjfZnr/A09Wk50NWJ6PO2iIL+nO3pG4LLJ/ZMA
   bF1kMAfaTGlLFIXXBqss0x75Ir+tRnag+NsyQ/zRbQiUpzADf5z6h8smi
   dRGZA52lOaBcYeVUWCz1AGYUxtOa4oMWA59eFEaJOYvTMe/U6nqe3yDes
   1i8P1B3cl+Zt643rlG0SfCAWtuQYdAwBC9k5/OLXj/xEkHYysaJdEkNvU
   1U1qgT4uK4hZEQxGxS1c6G6FgeSxqpt8XnrHfIX4ep+avzJbx54QpJw3L
   OOevYZptQjC5Fab9menhklS5BtDFDxV2jIujoWkOEXgEq+ZJ0h9Jfo54/
   Q==;
X-CSE-ConnectionGUID: W5VEw8obT7WU2gmy+769Hw==
X-CSE-MsgGUID: giL+80gDTLmN5WKHjl7oHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25272103"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25272103"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:30:27 -0700
X-CSE-ConnectionGUID: gaR+cvi6Sb+Gvch5XSFGcw==
X-CSE-MsgGUID: df8w1pRzTNWUh5IXFaV8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67978434"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:30:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3ZE-00000008GHh-02wk;
	Fri, 13 Sep 2024 13:30:20 +0300
Date: Fri, 13 Sep 2024 13:30:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation,
 checkpatch
Message-ID: <ZuQUOw5Y2hZgGyFJ@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
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

On Fri, Sep 13, 2024 at 06:14:40PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Enable the target functionality in the interrupt handling routine 
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Somehow your 6th patch becomes independent from the email thread.
(Initially I thought it was a separate fix)

Please, check what's going on with email settings on your side.

-- 
With Best Regards,
Andy Shevchenko


