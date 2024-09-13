Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28981977D82
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 12:33:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4rHY6F5rz3cF1
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2024 20:33:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726223590;
	cv=none; b=iJz53yGNmbUl05Z172LMiPG1pYflMa3Ryy4seG6eOB9wiEaNBi3r7i8olUhqUrM+RGNOot3s2OESFrK5NcCLzVeceuRT47gDc8XhytjrrJwfcNurpbKNmwOZQGW27p0qPXMzN8B642Ef6ZvFJ+WxHMYzWeIBiYOq1bD7lLUhVs2dH65dkYajnvUvlGswRmbAaNfFg5gF86eDJkFTspUGCDUZ5OHmse95zCHOsUWrGX/3fCRRhQc4l7G04Jnse5MSeQBr/T+qh9tGMAELsZJNs0ahxqhQfF/UGNcnN5DlIc+DQzckobwrmHhLXSurN31VINBEqSiXhV1O/qGKxK5LXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726223590; c=relaxed/relaxed;
	bh=ZdKJao3oGerlwUX+qn5HC8p4vrKJvagQ81HAexnGTBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CuIjdq9J9WuUZiZTfOoCEmIsbY6cflNKl2iICD/2sE4YRwqY986VZ4h0f5ZEDru6g/GBe2+SZDa4GIGa46tVGHofLcPvVyqf2JPY4UhPo6k+3my49TP32DorygiZZf3hNQpX3VYLvk8Dt8oe2kPhWrtm5ws0ZV+ofcQs4akFWz40fuSbmEY8K1TiDfafBOG98INXdE96vzkqC7EE5T6OBB7bJKF0pX0gl5IZs2Tu+/4rEAZburQekfmn+URw+6C5nEkZvjftBjdY7NpJA3nznBcs3ETw2TlM2khMDbBVXx6QvXZExKyOox+wKuZkc/5kKrL5X8Fvz8yx6M6rUj8hJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jV1YmLOX; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jV1YmLOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4rHV1ylbz2ykC
	for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2024 20:33:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223590; x=1757759590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z9EvHk8XwDoWDzB9UU9hm/ejOwPkx++wY5mYfVvTTn8=;
  b=jV1YmLOXM+L33Hguw3/+5ENa4ygwrEPNrwpGG94V3LU4HPZnnJu4ifib
   r27T3yeCzOnWaUvZ9rHhv/pa7WpvaJWVfxYSPrn6YQa38BZl8gSRofP5F
   Gr4ud5Itn37dKzpYcGjoW3tGz9ImWZxFjjvszfIKgPdA3if2DlMDHKPy+
   +dTniPHzjWtbyjlqz9pvN/Ea80y4X4pLFBAzv5j1OeOHzsc30lGk3vuvV
   kIMcZIy/A7Nwxc6PHnPThmRNHoGD3oCf0MJwhLMpPrtUkDQqg/wyre7UE
   b4jtQEHteoUD48JCIPML1GkATrSolh5bzVmvRxCduix4pGRbHo8SFJ3Rf
   w==;
X-CSE-ConnectionGUID: 9p5dHrsDTt+SfuwGBZBLyw==
X-CSE-MsgGUID: G9nt88MTQuWl+n1qJ1UAiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24996003"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24996003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:33:06 -0700
X-CSE-ConnectionGUID: dnB8CsN/Q2iy/b6EUnzxVQ==
X-CSE-MsgGUID: AO3zy03GSXOAhlueUtVMDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72778575"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:33:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sp3bm-00000008GKu-1uSW;
	Fri, 13 Sep 2024 13:32:58 +0300
Date: Fri, 13 Sep 2024 13:32:58 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: warp5tw@gmail.com
Subject: Re: [PATCH v3 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <ZuQU2iIZwW4mAumo@smile.fi.intel.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
 <20240913101445.16513-5-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913101445.16513-5-kfting@nuvoton.com>
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

On Fri, Sep 13, 2024 at 06:14:44PM +0800, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Store the client address earlier since it might get called in
> the i2c_recover_bus logic flow at the early stage of the function
> npcm_i2c_master_xfer.

We refer to the functions as func().

...

> +	/*
> +	 * Previously, the address was stored w/o left-shift by one bit and
> +	 * with that shift in the following call to npcm_i2c_master_start_xmit.
> +	 *
> +	 * Since there are cases that the i2c_recover_bus gets called at the
> +	 * early stage of the function npcm_i2c_master_xfer, the address is

Ditto.

> +	 * stored with the shift and used in the i2c_recover_bus call.
> +	 *
> +	 * The address is stored from bit 1 to bit 7 in the register for
> +	 * sending the i2c address later so it's left-shifted by 1 bit.
> +	 */


-- 
With Best Regards,
Andy Shevchenko


