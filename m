Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D9A34EE2
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 20:59:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv5bv04j9z3cVc
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 06:59:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739476744;
	cv=none; b=mCtJdxd2Ke58XPaEnqX1R/vs7uGPnMPvzLzfBj+b6+T1DZn3PhoS9VTrYn1l0xZ4P5J0FxMMamMsv5oT+i+e0vnwmLrIaV4ydyMLNRPfKFSjNgORAs3bpiH9kQSR32/pVnNUG5Dy96Y4GajVSTE+1Be0yNFs8umfLuyOTK8LplNf2eNkJCKATk9O0NPQj7HntBsLM2fGdyXb6vxJJ8wUDo2xkYLj2TInQ9L9zsgUfhiwP+RRM8gemxCuuWdHhjJVpSgP7m9GvDOWAi75WCaOdOJwPpU8XF3t74LyNUvsIzbx/7M3TbN0eTUbwq7RKBg1L/avpIqKMA1rdwegW8OApw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739476744; c=relaxed/relaxed;
	bh=yNTBJbXq6XQDQXwdcOEMdp7c8k98TPmJyNZQVeGAGec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg5v5+sWTSDoGy6OVks2DpYCoNWwpW2ZcH93VtzgreHUlD+2BnGH9StmKEx3XvL/rSgdU2vWl+Z6Xlo5SUA+2x2t5yE3TuZl77LmoHkUa3ELqKzRH9xkBtJr48y1paGY/crUjB8m52ZdARh2a8TDHt5XQkZPzL5I4yt4NWee0seeCIzJvg70kmC41vflf/012RQmfuB9sJVkiBqngHlv5UOiUQpSSQwkvgif53pkXFuD7qB2eu8Ahhlr3MFjfGlu84hurgXlBZpR8xaZFEW0IvSX+D5rk4g8s4Ccp/OnWEGoBN+/vY5saTC58JuO4uaRdHvvZd6gM3ULGdq76NDapA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JdBcgSKD; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JdBcgSKD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv5bp1PTCz2yGC
	for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 06:59:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739476742; x=1771012742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RyreHDxBizlFiBJyVrYaLJTxuTc8Y9j30c42u9G6/UU=;
  b=JdBcgSKDHLFbq0Cc1fnQolSGbmP7IhyUf7+i9prg56gdDSwwIaaw/Ky+
   Wk44O6UOOgOu3ARw7m1oH560GPThNWLd0oNJk1mfjWFsOG/GBoMeEEB2X
   QyNQB/2vOZusk3C+kAsHUEGfkkKUQgtbsIdIFpr2nghP0iKWy68Ivccs5
   XpmF3k7UnIv58l2O7TaoEO8hbNapaGhXkETD0Cg1Jp2aih5jif6cZWipH
   TiJij35KCGCobdeZ6v3DhUmBtccJ62xQUtEicJclPLNgHb38G/oOk8pxW
   hM2q4azaFUE5+8dHEVt92rFPZFsq8sPSxteh5nxNCegLeEXkBCGDgtgSI
   A==;
X-CSE-ConnectionGUID: i3D/5XlnT9+iJ7IXxFDA5Q==
X-CSE-MsgGUID: 89ZOIb6lRaueyw5/Dmd2pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40355411"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="40355411"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:58:58 -0800
X-CSE-ConnectionGUID: RZOTy1WsQEiPhZdbmarpAQ==
X-CSE-MsgGUID: zdlZnutgQw+nzLEJWQLRWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117373760"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 11:58:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tifML-0000000BGwD-3DSN;
	Thu, 13 Feb 2025 21:58:53 +0200
Date: Thu, 13 Feb 2025 21:58:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] pinctrl: : Switch to use for_each_gpiochip_node()
 helper
Message-ID: <Z65O_SaoSUcAY-rt@smile.fi.intel.com>
References: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213193152.3120396-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 13, 2025 at 09:31:52PM +0200, Andy Shevchenko wrote:
> Switch the code to use for_each_gpiochip_node() helper.
> 
> While at it, correct header inclusion as device property APIs
> are provided in property.h.

Linus, I forgot to update prefix. So, I will wait for other comments, etc.
If no problems appear, can you fix that when applying, please?

-- 
With Best Regards,
Andy Shevchenko


