Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFABC96696A
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2024 21:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwSZW0df6z3bb2
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2024 05:17:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725045422;
	cv=none; b=RDeLq+pVxAYptbxYxaYS43UC3NeWkja/Njtmw4lBkOL1nbB99G7dV1wHmUcyXaxcU7ogMR/ol85xFgbi0n+0T2Zca1bFtdwbUDPXcOAybk1niUdOHyafSKqrIDcmWcB+b25ESyqi4QcXJvAFsdTL2p0UC+eg9ecbl722l0UCsRvejs2+bhwGzq8QAit+7IPec8cFNl4hNZCNfCtZHGWaeT43HBHE/97ih7vDmM5kHKr5WFHg7c61BXLjgK8Vng47l/mml2NMgoR2BF5g/0BT4SHTQ3aduu3XHu4RYPcvWvizst1hnPzigP9JLAr4NGUSU3mh9EBMKTM94l3ROdXAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725045422; c=relaxed/relaxed;
	bh=QNrOewYPqQmjmATz6Zaw9sQ5WHeoRp+73IVYR2MkHQE=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=AefKuER+tfqYl2AN04M5RKpva5Q21B8DzZPbA1M57ljz29wnwshR0fL2c5OeFF6PVHvoyeZYGi7bKBMWnJDnRqlZdFNBBi5oPhwYFVPc290JSg89KPay1k27NGlscHoFX8zBxJI2yRqwck08QBJZVO7GkzMIqdCzoes9dVvPh27Vm4qwDLw8a5OsuynNi+hcv1DAmm6XKp9Uy72l6vtj05KcEXu9be0gb+aK/1uZkEm4Nfb21zrstADLvqWZItaPV7T4ixakRA76aJ7ttYSxFX22RBvFo36zoUQZ8Tci/IAIqMFkRfNWRczCpjfDyvkhRi2DDjUYPgyBV5EL7h9QyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aa9L0RZR; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aa9L0RZR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwSZP12Hwz30BY
	for <openbmc@lists.ozlabs.org>; Sat, 31 Aug 2024 05:16:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725045422; x=1756581422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IBnwaKpoyVKtRe031HOYtZkxDfnhJqMCAFEihDYmr/8=;
  b=aa9L0RZRDQC+Uq+Cj9Basetr7iquEk4RhraoTor27c0y/Lx5irn3Pf0q
   nIohy7ar7bEHf2MfTtoWnqGTXV6zKQ+RTRW1imXscnuE4lPlI/G5dyJpM
   Nb1Zh+DuIUs5e9x6TU1/SKv+T8WN5Z/wxuilz4PFRLcATHirgPgVnijFg
   8acN4buXdUIJFkX+mocT6K6CxDQBYnSH6L9JV+vhLQ+VQG4gjYSeyaGQ1
   iKax34jHDYPq2W9AJTiRhMO5iAX8093FhQHWfbcivTLc9WFdWp/Ts/f8Y
   RpCO03FxEO3JNkYLiTCN9F72Oo9xUxyPYcbtvf012OXYKPyEjM9JOLvbs
   w==;
X-CSE-ConnectionGUID: uUgFnsMpSNie/JB0pRvpyg==
X-CSE-MsgGUID: 81w/EQdoQPSVY+XLnFdPoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23655910"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="23655910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:16:58 -0700
X-CSE-ConnectionGUID: vRufghYcSsuyGzF0Tslhxg==
X-CSE-MsgGUID: 9mfoLPQaRuaomDnZGr2uvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="64175228"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 12:16:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sk774-00000003SP7-0MIZ;
	Fri, 30 Aug 2024 22:16:50 +0300
Date: Fri, 30 Aug 2024 22:16:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
Message-ID: <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-6-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-6-kfting@nuvoton.com>
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

On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> Store the client address earlier since it's used in the i2c_recover_bus
> logic flow.

Here no explanation why it's now left-shifted by one bit.

-- 
With Best Regards,
Andy Shevchenko


