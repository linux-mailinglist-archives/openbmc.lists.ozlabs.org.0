Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E57977D5E
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4rC52hdFz3cDg
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:29:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726223357;
	cv=none; b=ZIauhVnHzerT9X2qkNLQgvLy5mS4xktqYVsill/V+yRmGCpS0ojGUs4GMN1RHfzxuNW/sSiDi61OplGqbshZbVthDz6yut+H20L9tnTJeiqiTqmgG3TiRkK4mPt+cjavB8mw4WRIlQf3WppZODrBm1nSo3roOOaUUuvUX2DsNjD9jF9W4xtdWFROr57MkL4USOcR4OxllqMI03v1DpYxjfCZGY5JbXV98MqOK9OCKtZ5+s6IugHoyFY3XqGiW0Ro7vfwF5iifsCseLNhsdEmCckCLLgB+BC2wXGrNtbENM9kFJorG/E1aw3NJBZO9lWOoKkdpUqcpfmXoiArAl8A3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726223357; c=relaxed/relaxed;
	bh=ZiYKe2gBSq1rUpLT09CDjz7WDQG2lbo2tHDWiM7+0PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/nAxESj10USdhCYMz8t/bIGtMyDeo0zOY8zFQTVw5OMDyXqGjvQ3OC+Bg2P/UdObNEXVyGvbOdO0r4X95RI9Qdo9PCu+9d7ZKaXYBOP43Z5ruBqphkIh344yVq/xBPmgNXuHRyOB9t0vPnvDB9Wc5d9HAPYI2D7r8VAFqmNS0rzbYuMtlD4s/yMKo40er4D9fBxY+g10UKynmbv7MPifeJ8Cj94J4Xye8NU3VFnNu2PZrBgluc1W1pwieNUTOPAWiqF30LRvOIAQ+mlM4OS+gxplY50Nszm6DksTJ+ray4Def+RfIAgvy5n6xyemDo+gkq0356lgdv9/URjeQ8ifg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehZOc1yI; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehZOc1yI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4rC00b99z2yl1
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:29:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223356; x=1757759356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6ULjdQFx3hSTUi2FClPl+Wv7jWBPBdc7fIJZO9A84g=;
  b=ehZOc1yILneFTgnLsLExtpP3mGDXNNrZj5dUto0Y4VA1IJHpIRlQzluu
   w6CxKGpwfLuAgKYEysSZT9fqhbgpW/Ht80c6U3YbSzVRIwSmjnoAR8761
   Iy5b+FD8XjX9fp9cpbFzdqIwVgnf9nv4MC7JC4ZY49t/dXHjABaBqZFhq
   sOsl723uTnwH15kODsfsweRtBI0xeTP5xzu7j/cZLTa6S2M6de5lZEWZp
   oCKMTJL+0IEm5I5/UKLtbY2auDqjP3qAbMQ8hykRZ5gp7R9k2nd5Ebyja
   j4igjkaaw+Dlg8TtIr6HlMF1esD9QfFBXvU5/calMUHWAlif+H3RkfKlC
   Q==;
X-CSE-ConnectionGUID: mBKEWRTXSn+LZFc1Mhmy0Q==
X-CSE-MsgGUID: a0moXe86SR+F3m33aKwQWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25271993"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="25271993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:29:13 -0700
X-CSE-ConnectionGUID: +ctQAAoLTYehwwW77k+SjQ==
X-CSE-MsgGUID: eaMqxQcmT3O+2Qu47QihrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67978143"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:29:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3Y1-00000008GGM-1jvO;
	Fri, 13 Sep 2024 13:29:05 +0300
Date: Fri, 13 Sep 2024 13:29:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v3 6/6] i2c: npcm: Enable slave in eob interrupt
Message-ID: <ZuQT8YfVetrkMotQ@smile.fi.intel.com>
References: <20240913101532.16571-1-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101532.16571-1-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, Charles Boyer <Charles.Boyer@fii-usa.com>, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Vivekanand Veeracholan <vveerach@google.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2024 at 06:15:32PM +0800, Tyrone Ting wrote:
> From: Charles Boyer <Charles.Boyer@fii-usa.com>
> 
> Nuvoton slave enable was in user space API call master_xfer, so it is
> subject to delays from the OS scheduler. If the BMC is not enabled for
> slave mode in time for master to send response, then it will NAK the
> address match. Then the PLDM request timeout occurs.
> 
> If the slave enable is moved to the EOB interrupt service routine, then
> the BMC can be ready in slave mode by the time it needs to receive a
> response.

Fixes tag?

-- 
With Best Regards,
Andy Shevchenko


