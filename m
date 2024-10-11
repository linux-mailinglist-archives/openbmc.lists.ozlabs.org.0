Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9099A23A
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 13:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ3cc362lz3cTf
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 22:02:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728644556;
	cv=none; b=Tf7XDsWcHm5MPD8dpUOK2RbvnQdRFG0Y4xAQV+QdfKIX3MF9n/zxCbD7kQEG0X5a6sUsVQotlGG96MXso6fSANsNe1cmZimOp3exN4M02iNmmj3ZnI8rKzxPdbDRc1HNdbVfXHeJ1xwfQ8OFTT+4xlZugyZ/HrQw8RSFTFHIE0C/InjrPEQHPWLptb61yYPqP2Ft16mBVJ6PGT0E542eQJ84TFrnZj7u2uz18+shtgZnBEQ0aWIy4oXngLtU3JDFZw8DKnZiI/MiywShjvgTlOwqileD+kK4im4Ci7wGK4xqDjkxtQuklERRwynym0ugnNnfXcNgdCAlo8AhGGi/nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728644556; c=relaxed/relaxed;
	bh=Lm4Idxpm5Fjt1++DICt/89A1ro/70Nc1OvzFuKEEPls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnNSCmmckrO9TtbgxQO/NgxWVOmIv5FWr7fd90GYUmgsJJeuPp3VzmEGB9ckGczounNVSZMsF5A4H54ZRzIUOYQP8lgTHT9hKEszn9wxHF/AbdIfBsAyhmffEVcg1p3zq0lVtqdiMCLnW9NwYisGLpM1KgAkccl2DcBhyWEA7Mutw/8OMQkn3/Nh59N5HYLdpuKbTvu10KkHqaSMT9mC5zKvnwBKrOJ8cazRQ/h8I2IxGl8ws7i6p/m0piepUTgV59ayMOms6tJ74VFbCBBVl6yziioo6orcQf8aePLlT9muwOZacj9qW9JMyHl0kT6ZIIqG00v9YB5s33LYwxNFbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PfKH2aTX; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PfKH2aTX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ3cV5sMMz3bxM
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 22:02:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644555; x=1760180555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UncUJn9yZxkr9bOQkMsz4eQD82edd1qYiWUFWxGXe/I=;
  b=PfKH2aTX0Nt3RxwlkSozI0FLIRhWk65PO4wQX+KDQbtZ3LIDL37Se3Gs
   wlIVHdUCveEzKYQcSjcFX/HdPI+8V6BsOjKRPXWTzEK+gz46uq+eoKmCI
   jxIa1iP2p70VtahhUjkri2oQlNwdROYxMbd5PwDi/PQKI6nxhqa6y3pI1
   ELldxT9P4YCUsCOCHBdbXn67GSNx5zCxUu3CueMNQMp04GtkMC59DlBIy
   FZe3gAx4vk5Z30dBrNSXqYUciAflt4V3Ol1/02rQLrpv3recv9ZCFMkVT
   G/aNeODtWd5stkQYGbbcQJB/sr9qeAScijw0Ir44ZTTvTNJaOehm3+RCi
   Q==;
X-CSE-ConnectionGUID: BEhI3Za0QMOJvai5Knli6Q==
X-CSE-MsgGUID: +A3KOeJMRSq8hbUUEpSJHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="31835431"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="31835431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:02:32 -0700
X-CSE-ConnectionGUID: fCD2AnhvRDyKVn8emBfNHQ==
X-CSE-MsgGUID: ieOYz05aQXGx22OfgXaNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="80889908"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:02:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szDPc-00000001rrg-1ZFR;
	Fri, 11 Oct 2024 14:02:24 +0300
Date: Fri, 11 Oct 2024 14:02:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 4/4] i2c: npcm: Enable slave in eob interrupt
Message-ID: <ZwkFwABviY8ClyUo@smile.fi.intel.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
 <20241011055231.9826-5-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011055231.9826-5-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, Charles Boyer <Charles.Boyer@fii-usa.com>, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Vivekanand Veeracholan <vveerach@google.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2024 at 01:52:31PM +0800, Tyrone Ting wrote:
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

...

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +		/* reenable slave if it was enabled */
> +		if (bus->slave)
> +			iowrite8((bus->slave->addr & 0x7F) | NPCM_I2CADDR_SAEN,

GENMASK()?
But why do we need it? Do we expect this to be 10-bit address or...?

> +				 bus->reg + NPCM_I2CADDR1);
> +#endif

-- 
With Best Regards,
Andy Shevchenko


