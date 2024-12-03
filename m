Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A689E2F3B
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 23:47:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2wkR5Vyjz3g9R
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 09:46:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733233892;
	cv=none; b=iheRRWY+VByf/hbBQxUGywnLy7g9WhrLlbp5WJrAiHZgXhb8C2FDzoZlQ1NlFK56ufUGna+dVPRDK6UyP2/8QsadjPvj39sRDq6ix0h+acyIyzyaY/wfaPSaqNRZA0lYB2Ij+C96fRIRGNvIFw/uLH1RvY4BozaMmGJayANxyDfr+8MrL86YS/BvdzHLVNIZGnMjNBM4gXQdfL7mwPg3xYxmAqa4kOhBTmyhtM2eo2OJe/m05PydjrTYIbksQCDuz/78BmFcck3lpC1cwq/kDuXGZxr/ct6POz9Xeak0apds2lY/Or/DK2aGfLnNcUrfi6LLnNYPHiEXA3qssnSMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733233892; c=relaxed/relaxed;
	bh=fgAk5hj7Jc5Rp5rjLUDsHYB79ki6M9TZKymh0+eNZ3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkzEi3Mbb/f/GTU8BXMcKXgPOIrHF7Io+qCyXRqnXGAI7YNfLF2qFCIBYpR35rBLmTXzcRn3eTPj2MDKUoMW2kfq5/Ed+YBYwDQ8G9WSbjvouCPo516ikaYSoyctVr+/GYoiJliJTg9l+rDM+sVlF+niK4mucCJ1zmP0yyjh2PHe5z+5pORfSebIXGiSp/e+6S8ptVT2SGWvfXwsmC8DZQt+KDaS/af1DG+T9VwUbojBY5hRu+GVfuJ+ZPBihfSBe+eCKKUugXl/CrurhHJU4jwfUWMm6kj4FmA3FlCyrCsEVmCjMhhqG8aGVo/2cZI56fqML1Ogdfo9pmtz1faX0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TV1DDfFo; dkim-atps=neutral; spf=none (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TV1DDfFo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 00:51:28 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2hrw3rNrz2yYf
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 00:51:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733233889; x=1764769889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zib4VMRdhk2SyW/n2/OIybINtZxsOwBjr0XGB3bosyo=;
  b=TV1DDfFo/PIFYuRYEVQGNo3H18su9HSmeMyHJ6ekFspZUNpWuFjHqlv+
   cdRRWujC3w8u/0Z3UzKec0OUdSkjE3MgHkidI4ZVm2WBjKTXuMB0pR7uR
   2CtjBpQyP1Sl3XSL488uPgiPzlgd9s0MSHNbhVvUXfnh5/DhrS7u5QPnB
   xbgVoKFDGkZfzN0udWEDosa95op6VNoVnDA3tgzUcOHPjn5bAixf8yxWh
   ny4yhk/lEMEPdnyZyxg6IzjhAGWrtHEEW0RM07XKrrfMrkdL6LuguHAaC
   oxRaZshaQgl75QwSxIQcrfUNAC/lZj1/+ZBsYDu0ehsfKUYUGrqNynEtA
   A==;
X-CSE-ConnectionGUID: e0liyPGLTAej2Rti6kM4RQ==
X-CSE-MsgGUID: xcPYx5j8SYapCoNj3B5bsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="36299232"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="36299232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 05:50:20 -0800
X-CSE-ConnectionGUID: Y3t33y3ySZ+ldxE8KMacsw==
X-CSE-MsgGUID: 4TpyAc/pSOWCHKgyzIC1TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="130904309"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 05:50:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tITI1-00000003S9G-1cCT;
	Tue, 03 Dec 2024 15:50:09 +0200
Date: Tue, 3 Dec 2024 15:50:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Eason Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <Z08MkR40fjfW3MXZ@smile.fi.intel.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203091540.3695650-3-j2anfernee@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 04 Dec 2024 09:46:15 +1100
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
Cc: tgamblin@baylibre.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, tali.perry1@gmail.com, yhyang2@nuvoton.com, marcelo.schmitt@analog.com, robh@kernel.org, lars@metafoo.de, benjaminfair@google.com, javier.carrasco.cruz@gmail.com, openbmc@lists.ozlabs.org, ramona.nechita@analog.com, matteomartelli3@gmail.com, olivier.moysan@foss.st.com, thomas.bonnefille@bootlin.com, dlechner@baylibre.com, KWLIU@nuvoton.com, conor+dt@kernel.org, alisadariana@gmail.com, mike.looijmans@topic.nl, nuno.sa@analog.com, krzk+dt@kernel.org, chanh@os.amperecomputing.com, avifishman70@gmail.com, venture@google.com, mitrutzceclan@gmail.com, linux-kernel@vger.kernel.org, gstols@baylibre.com, jic23@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2024 at 05:15:40PM +0800, Eason Yang wrote:
> Add Nuvoton NCT7201/NCT7202 system voltage monitor 12-bit ADC driver
> 
> NCT7201/NCT7202 supports up to 12 analog voltage monitor inputs and up to
> 4 SMBus addresses by ADDR pin. Meanwhile, ALERT# hardware event pins for
> independent alarm signals, and the all threshold values could be set for
> system protection without any timing delay. It also supports reset input
> RSTIN# to recover system from a fault condition.
> 
> Currently, only single-edge mode conversion and threshold events support.

Please, get rid of explicit castings where the are not needed or implied, like

	u16 foo;
	...
	foo = (u16)bar;

you have a lot of this in the code.

Second, why do you need two regmaps? How debugfs is supposed to work on the
registers that are 16-bit if you access them via 8-bit regmap and vice versa?

Can't you simply use bulk reads/writes when it makes sense and drop 16-bit
regmap completely?


-- 
With Best Regards,
Andy Shevchenko


