Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 912479E4777
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:07:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Wpb6WgMz3g3K
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733286470;
	cv=none; b=b3sSuwviC6mcQNJ7E9wSBtiAU5IcfDCuA0ip6btUw90KwPCYCK2UbZmfJ6UjGTXuXs1iTmwWpscV/Iiq7Tp4PtBZgKQ6CmrNxqVf/Rb5S5efHxvInEH0n3EGs5IVbbxFSxYqzzUDK1D1LWzvNwkqxcQBLL8oDy51JXSrRNw4dPqFUHkECa6MtWEMJQRqTGZh7PNBDE2yAFWzk6YAFiwI5JI7IAMd4qwfa4GB7XfgRuOIfYVTSRjmCuFccRARwb/8/trkIc3h/GC+elg5Rl/+cSmRONGXaKL8vfBxBmxVc+05Zp4j4vHdF4C6uif612ROgA6vk8qTx6pTsy0C9hyp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733286470; c=relaxed/relaxed;
	bh=51EyoG4eh+qANNjflwJ2wonQiDqrpVX7j8TKCA8mgjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDXTIpjqz5EF/z48uD/bnrnYRbdVE0XPDpa+3IHDmLq4pbzA570HHJHHxSDQLDmX5kmBTqndA5MRV7t1gwn5IiaIbOgeL8jcODDyfJEYNLaWhl5esoTzY5Px7l+35R26nStgvBOjgOS7u8RUtMNg+O1kVFXyR9BGZH0dSRidJoYq7raUC7gAQMJNKHiDutDz4IAT2qFvGg55c4U9Mv7qNEMc7HRMbhWU2UU4o92D5WxsSEDJx2Vex5Ok9+NBJMYEZI4XRpzIHqXC7NwzK4tpWx/oc0YcHzKILrxrXT64VyC5esCrMmQ3dDhG7/0hAKV1W3KMk0Z4I68Y7aa/atrGVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DgthE1AO; dkim-atps=neutral; spf=none (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DgthE1AO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y34J30HXcz2xGF
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 15:27:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733286467; x=1764822467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s0E3gcq3e6cneHEa28ew8UWbRCJ77LQjBy4rKqIhalM=;
  b=DgthE1AOBk17y9fCs0IE59Em+kuSIcjKIO9jldBBYM2cabAXt+TsDYus
   OELBetd5iDlUk1H/RuMTB3BfZ7C9JtJ4CWMdUPTJEhGVQUFwZ5dibJxk4
   JHkQO0yDosnukla7DOOWPoxbx5gusIscHaSKfKjLEn5g2dQQ6QwCNrpGy
   ghAQ1WRquAuqnf/66k4YmLz0fcfJCZBAeru7D6K9CmHDhFrdXmaCB6f59
   F/WafKXFAbHqRv1KGIH4DvgtoFTOL9p4cYxllZ3Ay7zhanD+WMLtrtRqQ
   0cctVsBiL2BSODKlT077kdmpOi0N9KspGT9DbsNnofDVLqavlR3cBWOqd
   Q==;
X-CSE-ConnectionGUID: XCx6TO45T8eSt2jNrTECJw==
X-CSE-MsgGUID: rMKlSk/4QsySKRET3F50qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44196059"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44196059"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 20:27:42 -0800
X-CSE-ConnectionGUID: GNeRPHi7Ro6aYZQf33DG4g==
X-CSE-MsgGUID: VwKyph+eRS2iBB2CaT/B+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93988426"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 20:27:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tIgz6-00000003dvG-1beY;
	Wed, 04 Dec 2024 06:27:32 +0200
Date: Wed, 4 Dec 2024 06:27:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yu-Hsian Yang <j2anfernee@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: add Nuvoton NCT720x ADC driver
Message-ID: <Z0_aNIrNvLxqcRHv@smile.fi.intel.com>
References: <20241203091540.3695650-1-j2anfernee@gmail.com>
 <20241203091540.3695650-3-j2anfernee@gmail.com>
 <Z08MkR40fjfW3MXZ@smile.fi.intel.com>
 <CA+4VgcJW=9rtuqr3VZbfA8QxgYAR+KvfAHdf_0xv4XLQtVVQJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+4VgcJW=9rtuqr3VZbfA8QxgYAR+KvfAHdf_0xv4XLQtVVQJw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 05 Dec 2024 09:07:01 +1100
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

On Wed, Dec 04, 2024 at 11:20:20AM +0800, Yu-Hsian Yang wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> 於 2024年12月3日 週二 下午9:50寫道：
> > On Tue, Dec 03, 2024 at 05:15:40PM +0800, Eason Yang wrote:

...

> > Second, why do you need two regmaps? How debugfs is supposed to work on the
> > registers that are 16-bit if you access them via 8-bit regmap and vice versa?
> >
> > Can't you simply use bulk reads/writes when it makes sense and drop 16-bit
> > regmap completely?
> 
> Read VIN info can use word read or byte read, and other registers
> should use byte read.
> 
> For a reviewer's comment, If the i2c controller allows word read then the
> right thing is to always use it.

But how does this differ to bulk read of two sequential 8-bit offsets?
And if there is a difference, shouldn't this be addressed on regmap level for
all? Like testing for the supported flags and access registers based on the
controller capability and user request.

-- 
With Best Regards,
Andy Shevchenko


