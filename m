Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DEB977D77
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4rFm069nz3cF1
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:31:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726223496;
	cv=none; b=j5zSTDbICHtvs5YTuJ+4S/bPNbh2TztJl017cArwX2Wj//TpDCBDEAMogFAQEnHgtB/al53by/hdgl01I55oLhOs/NULWhUevMrIiWcaUPgHpDHGdzrb659GY2vWmZSdPEIjpMDYs8dBoGbNS2VBGYCy2oHo+RUYzXIReuL1i60LD9dtytIdDpj3UmfKCYzFsZjP/ejmiI49T4Go9tJChrqHm/r7d6DEJ8297lw2ErKbhSXKxXDVX52eaLIVgAHLOZICnudOa2Y6z/ZQwFPfu12SBTC5JXIy5K+bc4HbCBEy/wDKWKg65TTHTCeOeOok+SKctpRyNvCEAASlC+BazA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726223496; c=relaxed/relaxed;
	bh=u8J4eMTXr+lu6sfFfscbEwOYvqULpfOuS+tiCf/8ZDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIJNNLL106KGzSt5b1nOoiQlI3eYcfAE4286z2E1cmBDi1svaFtO4LChbO5O5NXfK96eB4UCHS5cyHXuBO0lWfhoV0Yzws+HB53ccxpJs06R0gtOPfQRuj29+yxJ58PFji/LpLabHFcGJrOylGNZu1tuW8CDVzDsyAdRKO1UcZt297XYhLtScBu2Z0ZM8jCAU+yj+73nkBhNF5Aif6TONOnHSUZbIMrPTax90lCCuc3RPRmWNbR4TjZ/vKqe8AVgHjkhlLAj5xCxgXoTFInzPUgb2lvR6EDHXpEzOkAzBtfx5gjAMwyGMKdtq6MdasKDI/IgZyDz7wlXeg4HCd8pSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BEOopaQs; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BEOopaQs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4rFg0Yl8z2yk8
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:31:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223495; x=1757759495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umc/QQJkCARCnnFGxpEN/mJo5J57ciWJs1xO1nkn4xg=;
  b=BEOopaQs6HxOM0KUJsFSbtg71ZpwR/2OAV9St4/K1JOcwrWB7MzFZueN
   qqKuTXB8jEvGXrHIg9froFiTUVS8xCjc+V1nn70HdlMs1AhH6gYE0QR4m
   mr5gyxdHpxTLyYlErrOncEZpS4AYUd7E5coYJLb5CLUphhPAqDVUGqlSN
   Q9hGiQfiHmJ5m5nQrpWmntBSijd6LL3px3M1VbbqU6nSos7Yo+Pz3Mn9m
   11hG0BnHCQ2TZo2cphJd+y//+RCGonEW8pCmarYXTepQphUZZjBzH31+h
   r2S0oPZPs6iA1scX0YB4JfMykqI6RrlIkcYxvAT/lDHYOqiZI7nw9Ueer
   Q==;
X-CSE-ConnectionGUID: vRHTheatSiGc08wT2Uv32Q==
X-CSE-MsgGUID: 21FKgq/CQ7WqolBrN0C2Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25244752"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25244752"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:31:32 -0700
X-CSE-ConnectionGUID: FxFQaakdRQu2qCFdV7ew6w==
X-CSE-MsgGUID: iGlRV2t4SIi8BHeTujM19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72814351"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:31:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3aG-00000008GIo-3sK8;
	Fri, 13 Sep 2024 13:31:24 +0300
Date: Fri, 13 Sep 2024 13:31:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Subject: Re: [PATCH v3 0/6] i2c: npcm: Bug fixes read/write operation,
 checkpatch
Message-ID: <ZuQUfCK7d7DuR9eH@smile.fi.intel.com>
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

The series titled as "Bug fixes...", however I haven't noticed many
Fixes tags in it.

-- 
With Best Regards,
Andy Shevchenko


