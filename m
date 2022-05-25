Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C5534237
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 19:33:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7dSn3sC1z3bkL
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 03:33:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afSXkBhk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=afSXkBhk; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7dSM1D2gz30Hf
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2022 03:32:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653499971; x=1685035971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zFfZG5aE64Sz5hHGHeaLLPFGzXoXwE70vbeN27URneg=;
 b=afSXkBhkLJ7/V9PTiDmydGhlRcad8W2zEUYp5wDrxD/YGUVEZIkiWD3J
 Th9GQX94hu67WSX8OUtMNWrFF5n5RgayUjdMvjnGoqqe70ugo6Yg955+J
 6ukoMBpnroYxZHzSlsEuMxqwonXenrAKC5Zb7I29acSI3Q+yEXcBOfi7Q
 5aSEc4cxDkAemdCGCO6qqe+obZh+7KZyZvCr+p2wKp9O9M+aijRRrs5ba
 CQ74+4QoNxwla/r68Kxok9hdAzQrfpKs1lnP+Hs39CZ307TP5WVeq7A87
 DtJzyX3IebXJh1RgLhrOA/7EYz7VWsh9n5IwsR+P5g/xYrNzQheGwtb/Q g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="272697140"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="272697140"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 10:08:39 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="609286483"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 10:08:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1ntuUn-000L4I-9o; Wed, 25 May 2022 20:08:29 +0300
Date: Wed, 25 May 2022 20:08:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 0/5] i2c: npcm: Bug fixes timeout, spurious interrupts
Message-ID: <Yo5ijJ9mqXRNB7d8@smile.fi.intel.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, wsa@kernel.org, kfting@nuvoton.com,
 tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 25, 2022 at 11:23:36AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Add dt-bindings description for NPCM845.
> - Bug fix for timeout calculation.
> - Better handling of spurious interrupts.
> - Fix for event type in slave mode.
> - Removal of own slave addresses [2:10].
> - Support for next gen BMC (NPCM845).
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Addressed comments from:
>  - Wolfram Sang : https://lkml.org/lkml/2022/5/21/51
> 
> Changes since version 5:
>  - Shorten npcm_i2caddr array since the number of supported i2c slave
>    addresses is reduced.
>  - Create a new patch from the original PATCH v5 08/10 to modify the slave
>    transaction logic.
> 
> Changes since version 4:
>  - Remove quotes around ref handle to nuvoton,sys-mgr in i2c binding
>    document.
>  - Keep the "longer line first" order.
>  - Correct the SoB chain.
>  - Modify the if statement in one line and add new line characters.
>  - Modify the commit message format in the patch Remove own slave
>    addresses 2:10. Correct the if statement in one line and shorten the
>    debug messages.
>  - Create a new patch to capitalize the one-line comment in the driver.
> 
> Changes since version 3:
>  - Correct the const format in if condition in i2c binding document.
>  - Add the oops message statement and register information in register
>    access width patch.
>  - Add the occurring rate of the i2c spurious interrupt issue and more
>    details in driver's behavior to overcome this issue.
>  - Address Andy's comments in the patch to support NPCM845.
>  
> Changes since version 2:
>  - Keep old code as fallback, if getting nuvoton,sys-mgr property fails.
>  - Fix the error reported by running 'make DT_CHECKER_FLAGS=-m 
>    dt_binding_check'.
>  - Make nuvoton,sys-mgr required for nuvoton,npcm845-i2c.
>  - Correct the patch's subject about changing the way of getting GCR
>    regmap and add the description about keeping old code as fallback
>    if getting nuvoton,sys-mgr property fails.
>  - Correct the patch title and description about removing the unused 
>    variable clk_regmap.
>  - Use the data field directly instead of the macros since macros are
>    not constants anymore in this patch.
>  
> Changes since version 1:
>  - Add nuvoton,sys-mgr property in NPCM devicetree.
>  - Describe the commit message in imperative mood.
>  - Modify the description in i2c binding document to cover NPCM series.
>  - Add new property in i2c binding document.
>  - Create a new patch for client address calculation.
>  - Create a new patch for updating gcr property name.
>  - Create a new patch for removing unused clock node.
>  - Explain EOB in the commit description.
>  - Create a new patch for correcting NPCM register access width.
>  - Remove some comment since the corresponding logic no longer exists.
>  - Remove fixes tag while the patch adds an additional feature.
>  - Use devicetree data field to support NPCM845.
> 
> Tali Perry (2):
>   i2c: npcm: Remove own slave addresses 2:10
>   i2c: npcm: Correct slave role behavior
> 
> Tyrone Ting (3):
>   dt-bindings: i2c: npcm: support NPCM845
>   i2c: npcm: Support NPCM845
>   i2c: npcm: Capitalize the one-line comment
> 
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     |  25 ++-
>  drivers/i2c/busses/Kconfig                    |   8 +-
>  drivers/i2c/busses/Makefile                   |   2 +-
>  drivers/i2c/busses/i2c-npcm7xx.c              | 176 ++++++++++--------
>  4 files changed, 124 insertions(+), 87 deletions(-)
> 
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


