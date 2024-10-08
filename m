Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCBA995448
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2024 18:22:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNLrZ433lz3c2K
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2024 03:22:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728404523;
	cv=none; b=ZPCttbUV9tLzqExxKPYs7OKL0RiaIzLd6lK8V/lSb8UbN8TanOHpnwySWCW2eTgLq/vxS6zbH8jPYP72C8wbvRDF8RRptkP+JWTi3WuoOPdvVwcojdSdQQmQl2hx4H5SXIxTgCF/+nwrL6Ux0vRDluA5jKY2HS1aYBi8KXdL55XO0XIBAEAugEJDK/S5R1XVHj94QA3cNjYPmV1wx2V9yFyySEluYmR2gPVYFeUvlVWU9OXy0LM1XZLApE6mfCuxH69Ljtwtu7i6I2x4yiuDCNaBKXt1G1ZVAU4xNljeFOcJ4aWMDT7usLeaCMDfwDoyu1KCIgqn5l3ifOjrjeuUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728404523; c=relaxed/relaxed;
	bh=m+aibm0WExevH84fDzn32F0jJdiiqh6Wnvz3WT+jRzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fsh/cGFO72ccb8uGbPC3TpBVSM8sf1mNaJlYEYc9I/kPRi4g0RK1k6u4yb10GcsVFwETRtQp7DAixGkviYJSBo3KmXj8jlLHizu6d/xMgLW62GVAkR3p7Hh729XZZVhhGlCtGqON3CH4SPxq28/Tg8zgC9ggZuf4373HlLYXDXiar7S6Q+1DNgxaAnFen0ABNzTI5PaLIOvZ0IkazFfqQVB/8OenEufIOl5LLm0ou7KIYRZd2bsY+z8GnYaVldxsg/S5sVO1s1PkI68FQWn+dcF/3qwD+zvuQqfz+mTPyXWIbb5Pm6Vpba0orqxHR9KJ+Eyp5iSZU7XpqYi0yYD6Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRb/SncI; dkim-atps=neutral; spf=none (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRb/SncI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNLrQ5lntz2yVP
	for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2024 03:21:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728404519; x=1759940519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=56j0MbqjsKqUdLUCTSs6ZzNdm7C7JX746nf3ep8nc10=;
  b=kRb/SncIdQ/iAXSPoK8VDAlUDm7Ya6ot5MHaS67UFEqACmXclsEwwFcn
   XCrbGCtnBdghKI8cikQkf7bVqsBKgHZQWb0aT5CsO4/598SVWlJQGqb64
   Tw3uvcbcgV89cS2nz0B/Me2ToZTcA0mRPeyCKbrxXAQJcqZm++2R3BePd
   /ACP3Jva3HqZnfHz4qO/pthEeBtHTQQ58FTAYju8eD1dTb7ad1oUlxpCQ
   dit6f9HO50Ny17jYKN5+TohyhNlEGwMG45D6xm5gnJTDP9dtcxjiuIe4z
   CQqYgmH0XbppWySjbaQANAfurvz/0b7jTVp40p6pccRRMHZagtO9/v37w
   w==;
X-CSE-ConnectionGUID: Ui9ieXo9RMuO6fjF4FMhrg==
X-CSE-MsgGUID: nQ7qrXTpRr2Z0zr3W4bqfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31320322"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="31320322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 09:21:52 -0700
X-CSE-ConnectionGUID: dcEKRUjyQ5ypUQhDSIsasQ==
X-CSE-MsgGUID: xEP1D9qhTWy6MIHneojlzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="76251435"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 08 Oct 2024 09:21:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 23E3020F; Tue, 08 Oct 2024 19:21:46 +0300 (EEST)
Date: Tue, 8 Oct 2024 19:21:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
Message-ID: <ZwVcGu3YeJ6pI0sM@black.fi.intel.com>
References: <20241001062855.6928-1-kfting@nuvoton.com>
 <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
 <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
 <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
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

On Fri, Oct 04, 2024 at 10:29:10AM +0800, Tyrone Ting wrote:
> Hi Andy:
> 
> Thank you for your comments.
> 
> After a second thought, I'll explain why slave_addr << 1 is given here.
> 
> Tyrone Ting <warp5tw@gmail.com> 於 2024年10月4日 週五 上午9:49寫道：
> >
> > Hi Andy:
> >
> > Thank you for your comments and they'll be addressed.
> >
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年10月1日 週二 下午9:17寫道：
> > >
> > > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > >
> > > > Store the client address earlier since it might get called in
> > > > the i2c_recover_bus() logic flow at the early stage of
> > > > npcm_i2c_master_xfer().
> > >
> > > ...
> > >
> > > > +     /*
> > > > +      * Previously, the address was stored w/o left-shift by one bit and
> > > > +      * with that shift in the following call to npcm_i2c_master_start_xmit().
> > > > +      *
> > > > +      * Since there are cases that the i2c_recover_bus() gets called at the
> > > > +      * early stage of npcm_i2c_master_xfer(), the address is stored with
> > > > +      * the shift and used in the i2c_recover_bus().
> > > > +      *
> > > > +      * The address is stored from bit 1 to bit 7 in the register for
> > > > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > > > +      */
> > > > +     bus->dest_addr = slave_addr << 1;
> > >
> > > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> > >
> 
> The current implementation of i2c_8bit_addr_from_msg() (ref link:
> https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
> is
> "return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
> extra consideration about the read flag when retrieving the i2c
> address.
> IOW, if there is a read event, the i2c address contains a read
> indication (bit 0 of the i2c address is 1).
> 
> The patch code "bus->dest_addr = slave_addr << 1;" might get used in
> i2c_recover_bus() later. (ref link:
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L1691)
> 
> Suppose there is a read event and the i2c address is 0x60.
> 
> With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
> With the original patch, bus->dest_addr will be 0xc0.
> 
> If some error condition occurs and it requires i2c_recover_bus() to
> recover the bus, according to the description at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L1742,
> the address "0xc1" is used
> as a parameter to npcm_i2c_wr_byte() which is used to send the address
> in the write direction.
> 
> If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
> described at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L1742,
> which is about to send
> an address in a write direction since the address from
> i2c_8bit_addr_from_msg() contains a read indication.

Okay, then I would do the i2c_8bit_addr_from_msg() call here as AFAICS
this is the real event where you save the address *of the event*.

And in the respective user update the comment to summarize above and do
rather ->dest_addr & ~I2C_M_RD there.

-- 
With Best Regards,
Andy Shevchenko


