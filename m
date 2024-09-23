Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C824C97E77C
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 10:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBwzl437nz3c6b
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2024 18:25:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727079935;
	cv=none; b=GINiZidngoLGk0UDPP5t5sPqqxKbSmviTDLOyftSJ9SeEwwtFQkHwMoRzThXqFnxKMynEUYBXKdTtnEna395TVzYpL9UeZ/1a5x5TkVAyJbqdmUYwWbez25DGeGVGLZ44EOQIsnvm9rvseMFQDAwmeLESY0OfgO0TJ83uqIIyMitL4//GUzCYqHuKjAyawsKMydInFEcvcJpZos5qdm2oufVI6dBFa7V6vDlGCQeG9mEE3qNWxSPkGoL+EYfcpD2comYNY3r7hui1QD+nQOn/gq7Ce/pqY1ukWnVgHh1wGD/CQlw6gIYxZnU/zsKRVTs2sYyRxaNYsSxlamJCYBJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727079935; c=relaxed/relaxed;
	bh=zlZBGcTSuW1IpZypEayiholGfoF/GFBLZAGT1U+cD78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArQ9PgBTFxGE3BB4f5V5fpVHRjBhiPvsZcUBdoZqOQt+xZEQWlJTWw8NVnWbZv32ciOoSGQXwC/8g38AVS+YtdsfG4PbLLvXbe1wOEsaIRXZ4ghp1uGMIuuMgC7o1nTekWpWbvkCf1YOr3p+Dn8L6IBoXvIKa84gRUvuVvuFLPEp6nFqZnwQlzaq+COhik8UPhUkTV9h14+2vPN4x263i3ERPBc4u6Wu+KlMZ4MFGnSAi4uNkDIXrTj1TZCl1/hVrrwOQqq/w7bimN2uQQb39k5WtDP3bbFvhSSmDvbt9hLl0MDcuRIcD7Nb2si/o8tl3NRDSc603qxT0GeSqj5Jxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZfHpM998; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZfHpM998;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBwzd2gXPz2yDM
	for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2024 18:25:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727079933; x=1758615933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1Cf4C1+sLwIadApLBZyzieaza09oq+YyYQasxL0Ht7w=;
  b=ZfHpM998ZpEYky2KeZUdqsUL7OTOiQ3qta3ZzDYzwEiaXLz5XpRfbmHB
   IuqoHdd5ackwbxu+9YRuCSsi+gamtk+FyoegKaXo5IQBZ7Ab5AZDghPPn
   Ywo9VIoMBKcbveW3WdoGl0DsVLUau/qBdlZRedo5fqh1/+45C0/Y2lDb5
   OilOfEjebUEB5oQaPl406mTP8eTlyYe9c4W2PTG6P1VisjU0uTcm47Vjw
   bplO70xUi6V6Me8dfcbOK/h7Oz2UnyxoYrpaI8pxef2Lp1Ipkj6rgVtcJ
   zNZPAyXpLYxUTWB0Hi+7uyQ3tKTEj9FiA362Tm/rKalsM8jTOSeP1yrkm
   g==;
X-CSE-ConnectionGUID: ys6fH39mRIuV/MjRs+x4dA==
X-CSE-MsgGUID: dKc/+1J+SCylSD/klq0ujA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26108026"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26108026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:25:27 -0700
X-CSE-ConnectionGUID: uUOCbsW8TSi11bfKU2Xwtw==
X-CSE-MsgGUID: X5GI/7SVTMiFcKMxvvSs9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71016318"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 01:25:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sseNj-0000000BtJt-3Lv3;
	Mon, 23 Sep 2024 11:25:19 +0300
Date: Mon, 23 Sep 2024 11:25:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v4 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <ZvEl77NIpNwtAAow@smile.fi.intel.com>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-5-kfting@nuvoton.com>
 <Zu2HmkagbpMf_CNE@smile.fi.intel.com>
 <CACD3sJbD4TuhDwazBwcc4FR2yK40LV=D-mk6VAKwNvxqAHNGLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJbD4TuhDwazBwcc4FR2yK40LV=D-mk6VAKwNvxqAHNGLw@mail.gmail.com>
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

On Mon, Sep 23, 2024 at 09:59:31AM +0800, Tyrone Ting wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年9月20日 週五 下午10:33寫道：
> > On Fri, Sep 20, 2024 at 06:18:18PM +0800, warp5tw@gmail.com wrote:

...

> > > Store the client address earlier since it might get called in
> > > the i2c_recover_bus logic flow at the early stage of the func()
> > > npcm_i2c_master_xfer.
> >
> > You got my comment really wrong.
> >
> > func() in my example was to refer to _a_ function mentioned in the text.
> > And IIRC I even posted the example, like: i2c_recover_bus().
> 
> So the commit message in next patch set would be like:

Yes.

> Store the client address earlier since it might get called in
> the i2c_recover_bus() logic flow at the early stage of
> npcm_i2c_master_xfer().
> 
> The code comment would be like:

Yes!

> Previously, the address was stored w/o left-shift by one bit and
> with that shift in the following call to npcm_i2c_master_start_xmit().
> 
> Since there are cases that the i2c_recover_bus() gets called at the
> early stage of npcm_i2c_master_xfer(), the address is
> stored with the shift and used in the i2c_recover_bus call().

-- 
With Best Regards,
Andy Shevchenko


