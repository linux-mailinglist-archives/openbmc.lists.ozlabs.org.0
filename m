Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD0F99A233
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 13:01:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ3Zj2ssRz3cTs
	for <lists+openbmc@lfdr.de>; Fri, 11 Oct 2024 22:01:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728644458;
	cv=none; b=WFwVqf7BF5w2yMQqL8q4q4udCoGrSNOdGXAQ5HG5tN8DN2kF1oNHjBRPanOmciB9a4+71cT1LwGdOCLkSbKCb+KLy7KugXWEvpj0RbY3MrZdfSeR4MmUnjttuVGzl2F0KJw0vBfmpF40HUPyPpkewdWukA4eiWixMhMyfLX3OU0Mc8xTNsT/so+T58iXLVHyUIGeYt7OaT/b3COtWFRzOsbI8yeE+OR01HnK2FElBkvpvqYUbA3GKysJAbP8qg0nvN/mbqu+nBk/JvbaY3+SrCFC6oZtwOybBry/4bdzicFLpcYhgaols3H/UVRzLUx2jcv9Wei87JrWCnaPH1eoJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728644458; c=relaxed/relaxed;
	bh=QLindWIp3bcQbstJh3lK4nXEW2O/c1YVQnbZnV9q8F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8djjbZI3q/hZojUDc7LAm8pTbWDKzGwpOdO6H4UtlWq3WsztMnAdCyR3qUh3Bz7teB8pT8LUlVcItbGLjlOchPo0O8VsYwwQCogNdgWDGoN1XP9O1+ukDDOmRJ5odzg1x4fjn+r+Jb7+DrsFgtPdOLubTj8wTNP7aDrWJap/Od12P6bLoRAYv6gcEIVzOLAesRU7dmDBzxAj3ceIGHRFwrh6LESOlD1jKJjHHhqdqiVaUaHnAjK5v0XvgB/qBudrDveUfP0htgFgjBqJBsDBWjOnQYzuxWX6+bCUSglMxdcyAPGjkCQ7AFSl8sLW7Gip753cYadR6N3ROWW0igarg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKIC3Ci8; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKIC3Ci8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ3ZZ71p2z3bxL
	for <openbmc@lists.ozlabs.org>; Fri, 11 Oct 2024 22:00:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728644455; x=1760180455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SxASXN/DKncrAiabitEc0oaTlVRcphYtNi5cDXvkuQc=;
  b=nKIC3Ci8oSSDv+/SNZyaGUeOiVnFpc70C1XA+OCMyAjkR75sgiKFcEUW
   2Ij8UBhnJpaiNlUBDqiE0fkMU++UrOl69UPMxy2iOBkyh6vEZxbt7sYjk
   b2KL8Kot+6GaeSK3jbCJthUQ/XQ82EM6HCGj1fAuIvctJvaF+bgP8/xmH
   0hg6N9lwIt69awISIhF1MPRyoVkx4k26fwbUs2YWLFIq3FK3T3zhhAlPV
   Y/K2WiUrg8HYF5o8NzsI1qU7C31Agq3/7r2iSTQVe2bpDdM5FE3fwtH8X
   iHb7Nlpc9yhK4esvqwT2Jh/nSkehmvFHSJ48x+5/ZZ2nzXJ9kVe3BGEFt
   g==;
X-CSE-ConnectionGUID: Fh7k//7nQfW1SgTcr2SbAQ==
X-CSE-MsgGUID: GDnBCmS6Rd6iMqUzc95usA==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="50582140"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="50582140"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:00:50 -0700
X-CSE-ConnectionGUID: njuZsZEOTqW+vRcqCaoGKQ==
X-CSE-MsgGUID: cvcsFYMdQl+7ss1gQmeiOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="81878617"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 04:00:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1szDNy-00000001rqO-0yOT;
	Fri, 11 Oct 2024 14:00:42 +0300
Date: Fri, 11 Oct 2024 14:00:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
 <20241011055231.9826-3-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011055231.9826-3-kfting@nuvoton.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:
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

I would rephrase it a bit like

	/*
	 * Previously, the 7-bit address was stored and being converted to
	 * the address of event in the following call to npcm_i2c_master_start_xmit().
	 *
	 * Since there are cases that the i2c_recover_bus() gets called at the
	 * early stage of npcm_i2c_master_xfer(), the address of event is stored
	 * and then used in the i2c_recover_bus().
	 */

(E.g., the last paragraph just describes 101 about I2C 7-bit addresses usage
 and may be dropped completely.)

> +	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);

...

> +		/*
> +		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
> +		 * from the bus->dest_addr for the i2c_recover_bus() call later.
> +		 *
> +		 * The i2c_recover_bus() uses the address in a write direction to recover
> +		 * the i2c bus if some error condition occurs.
> +		 */

> +		if (bus->dest_addr & I2C_M_RD)

Redundant.

> +			bus->dest_addr &= ~I2C_M_RD;

-- 
With Best Regards,
Andy Shevchenko


