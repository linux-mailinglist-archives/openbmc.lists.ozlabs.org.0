Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAED98BD44
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 15:17:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHz4y1Dx1z3c5h
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2024 23:17:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727788654;
	cv=none; b=iDc+idiH4k/4qPCVSB8dE77IKrnL14vlDeEV0mOB/dOJdsbJnS7SLP44Q3Yl5vi1E5R4bhzob8prCJ1SE4Ni7eoOM/53Cmx0HgCwQIjU6LSysG34FQxg2H4+/hgohaLzN6Tkbm7pji8vhVr9aNGZm0D8KH550Nh8KU16LIK0vj1uYeX7jF8MS1EAdiY0AOdqxJ7xW9rwIUJryaN5rSnHV6K2D7IpbGDwdPCAFUQtgGP12o7z6zaQ12Ljj2TE/vafbAlnwZBn7ubfiTELe27ywFBolDlWX76qA6mCZR0aeIYak4XK3pFm86epgXFQCaa/IKl2brTvq/JNX659EXdxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727788654; c=relaxed/relaxed;
	bh=VAWfe/iB68atm9fhN1XD0WhEvsoY+tb/Jjg+Mnrn5Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McEThOg6dWP4YedTAGT0L4KATIUVUKZfvJDJTC7usmKUXKswQEAWt8WYWBY2zjJb0CN8jEFcZY2m+FhE7JzUYU6/c6BgpKaZd/w+CDlD9nvMWR0B5dmAvHvSnt7Y3LxE9dmIulu340YsxdPX5baBEGVkbxQqkITkahx72eKeeoUj+F1dZ3ocaT2P5voUOVNgZ6lxogNwCM8A9AqLlP8YA7ImbXuhpOEfpsij7TLsV3nlzNf2lmUWirKMgVv3wFL5bYXD8JjaYGnNcy7USQQXeulAyuNRVK9QZ6sxTdsx8PdmIN4y8Sz1Gp+0vRlr+I+P1vgfECmDst+ETBuIeSbWvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQfkuC3A; dkim-atps=neutral; spf=none (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lQfkuC3A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHz4s5P49z2yGY
	for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2024 23:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727788654; x=1759324654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+BV+/OtENujiFENVoIMCzWcgjltFgWnxAGqn4HcKus=;
  b=lQfkuC3AuEtH46lqUVyLoPKkhWvRVD50ew6U78PztHy50iVzhzIKbkZS
   dDItpwFp+LDenF2HBRNL1g9rgm0SYW/+A4Qd/Pd5zLZYZQCXJJWNMLUIE
   oE4nmDOFMStevjPXxZGc34ks5fe8NsMihXTXow481lRoN1KMwjJR+KVp6
   AQXy/by3YFFURDKDP2RrvmNa0S8ZCJVP2v/dscsDmFQIcikAw01sE6jnf
   1AXXTudfa5pmuBy3Y/44f+DuPwKqsfhvyVXRftJiltRy3+9FGRvHe/eIc
   bqeq3dq3AwWHtCB/iSJRelRmbB6mKlIZX3m4lDek2BVutsCVbXEjxhCF6
   g==;
X-CSE-ConnectionGUID: QJAPhLvtSSinRF52O1WYmQ==
X-CSE-MsgGUID: dNypcLcmRd65qH6EoKdDZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26381205"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26381205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:17:31 -0700
X-CSE-ConnectionGUID: MDvbuMW5SnyhzmydfW3hDQ==
X-CSE-MsgGUID: aGYAp03ERaKdgfKmJ5E+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73985678"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 06:17:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1svckm-0000000FCd8-0lao;
	Tue, 01 Oct 2024 16:17:24 +0300
Date: Tue, 1 Oct 2024 16:17:23 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-5-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001062855.6928-5-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE
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

On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Store the client address earlier since it might get called in
> the i2c_recover_bus() logic flow at the early stage of
> npcm_i2c_master_xfer().

...

> +	/*
> +	 * Previously, the address was stored w/o left-shift by one bit and
> +	 * with that shift in the following call to npcm_i2c_master_start_xmit().
> +	 *
> +	 * Since there are cases that the i2c_recover_bus() gets called at the
> +	 * early stage of npcm_i2c_master_xfer(), the address is stored with
> +	 * the shift and used in the i2c_recover_bus().
> +	 *
> +	 * The address is stored from bit 1 to bit 7 in the register for
> +	 * sending the i2c address later so it's left-shifted by 1 bit.
> +	 */
> +	bus->dest_addr = slave_addr << 1;

I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?

-- 
With Best Regards,
Andy Shevchenko


