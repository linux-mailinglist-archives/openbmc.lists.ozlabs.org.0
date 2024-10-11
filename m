Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DA99A590
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 15:58:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ7Wp50ZGz3cVq
	for <lists+openbmc@lfdr.de>; Sat, 12 Oct 2024 00:58:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728655124;
	cv=none; b=MuX6etlG/n9T4l4+D4Zx5dFm6JyhD/+Ea44HibzlTKZ0LCy3LlNKUg5toTK6hsjgv1Q0ooZJuHcq1XxQPtqGXhxsmFqlqeD5pt8eUirOYE00xChS+NigaOyClDCySNY3AD9QSAd89tPMUOTjTnFLEs4dSS7+qYAVIP3odlRU3xcRcMYbn9dBJCu/uNEaxKbV/QjgsisPVqtWXi3BgCpdkM9ycPTS4EKXk/L3ALSXTRSaqrrMtu3hryDIsMr5T9CIQOMM0SzSLk0r48ZTsvBQmwvx7ATIFyxajyZMMgvgaPnLlLUh8luwbU2hq2yQ3WLViF7bfPKnsTfc5aeQCoL8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728655124; c=relaxed/relaxed;
	bh=1xYIJuIiJtuxK36m2uGseVy/v0OYHa7d89EplH12Gto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogY+t76mKFAqYl0WggzDbU3Wg6v1vP6OVkQqz3P+Ba4D2UUD9Jfk+t+6ExcyehMu0/m46oGuGpja7yhqJ4p5P77kSnpi+4Aqx3RH8T6RrdA54lmtqeIbU6Conpgwc420dfyNKxfwVzwlVCCArjn9RLzuyFraKQuEybyac1nFZH38v4sAjw8H8mKRGaR7nXKd4xW0urmLt/MmjrON6qXD9pDUV8O5C1u2aN8amckLXni1Ad3+80GIo6TFwnbO6d1vAFO44iPxniahYpkrqSoDWq3j64pK8sgwA7y4x+qkAb8NwpkAGHyaWDNowxZg2kISFnW2EiNNNUJV7KZWTh+s2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bP1KHBYi; dkim-atps=neutral; spf=none (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bP1KHBYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ7Wh4wYVz3c18
	for <openbmc@lists.ozlabs.org>; Sat, 12 Oct 2024 00:58:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728655121; x=1760191121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=50t/8bIPuePIvNkFpNK6cx7S6M3odVVqVkTOhu9z+2c=;
  b=bP1KHBYi44J8V2Dt/lNpZYHxDvKJADoviQV6X6Sipg3qp2lrvTjDtmI4
   mLLk3WxS7mZHl1rKiNRjQtcF+J4NzsWtifZWg2AP8UsAJXQMyW1KakL7C
   BmzU8/sujE5oQg2+xPhxAAEIo9qwzH4jOKnPUrDbGrIBUBxKwyCjzxJpL
   Pypo3XCmqnfrbucybGuinMi20J/RXonnlXHRsI/s5VNoXUI8WjDHUWgqi
   qAGEpSKbFNaKHayeBJOquPla2V3vn1VOq53u5ASk0myFImKGtruuVqe96
   RDIfhhKhLJ+2ShzzU5LuPHNSeU/liTXJb2K983i6P+IZW39cbUcRRF3PR
   w==;
X-CSE-ConnectionGUID: SkjoYaR6Ry2lygs6/06SZg==
X-CSE-MsgGUID: EkLci0XHQcyfdf1nTe349w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38706081"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="38706081"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 06:58:36 -0700
X-CSE-ConnectionGUID: bP5oxpOOQqCAWQokdjP4HA==
X-CSE-MsgGUID: hedrGgucSQ2Cbsqo2kp53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76578587"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 06:58:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szGA1-00000001uSU-026m;
	Fri, 11 Oct 2024 16:58:29 +0300
Date: Fri, 11 Oct 2024 16:58:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <ZwkvBFHS1m3N2yoW@smile.fi.intel.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
 <20241011055231.9826-3-kfting@nuvoton.com>
 <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
 <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
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

On Fri, Oct 11, 2024 at 09:44:42PM +0800, Tyrone Ting wrote:
> > On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:

...

> > > +             if (bus->dest_addr & I2C_M_RD)
> >
> > Redundant.
> 
> Just to double check. Is the code "if (bus->dest_addr & I2C_M_RD)" redundant?

Yes.

> > > +                     bus->dest_addr &= ~I2C_M_RD;

-- 
With Best Regards,
Andy Shevchenko


