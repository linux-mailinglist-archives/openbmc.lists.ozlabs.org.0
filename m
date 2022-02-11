Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3E4B22F8
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 11:21:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw8mb1R4Tz3c7f
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 21:21:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GMFLOziB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GMFLOziB; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw8m63z8yz3bW9;
 Fri, 11 Feb 2022 21:21:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644574887; x=1676110887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RJ+0ZmlVTd1NI8J1ND1o+WTJfa5qruEZ7EtRTsDra1o=;
 b=GMFLOziB/0PcyPfu4htv5N57EGEYFRva8GTTGAmDHVVy4Pj/LcAOROW2
 R++ljYjiTEXVLFf9ReY3p+rOKPoZ7ZeolVFxtL65uLwNVI/TEmpWwYyfi
 zR9n81NxhQcCMv45oBGczjgzMG0CSwDkc6K00AXwmNtHfJpmx/NkFByRi
 uyKxoEJ7wgFLBee+C/GZ9lrdEI+pNhVuBXKj7maiYg15nodC14fleLD26
 Kxt24pNKcFigRPWuj93CIf6vIkD6Z9fsMN6sx17WaKxMIKbSAsdwkjk5h
 MWYOrGkPxeoWlB1XsGRN3oHahTZ95cCjG1FjXovzNjV6FPQz+E/B6IHT8 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248538210"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248538210"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:20:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="568999001"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 02:20:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIT1F-003PAX-4u; Fri, 11 Feb 2022 12:19:13 +0200
Date: Fri, 11 Feb 2022 12:19:12 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2] serial: 8250_aspeed_vuart: add PORT_ASPEED_VUART port
 type
Message-ID: <YgY4IODZlKTG7yzn@smile.fi.intel.com>
References: <20220211004203.14915-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211004203.14915-1-zev@bewilderbeest.net>
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
Cc: linux-aspeed@lists.ozlabs.org, Konstantin Aladyshev <aladyshev22@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Oskar Senft <osk@google.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 04:42:03PM -0800, Zev Weiss wrote:
> Commit 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to
> set up register mapping") fixed a bug that had, as a side-effect,
> prevented the 8250_aspeed_vuart driver from enabling the VUART's
> FIFOs.  However, fixing that (and hence enabling the FIFOs) has in
> turn revealed what appears to be a hardware bug in the ASPEED VUART in
> which the host-side THRE bit doesn't get if the BMC-side receive FIFO
> trigger level is set to anything but one byte.  This causes problems
> for polled-mode writes from the host -- for example, Linux kernel
> console writes proceed at a glacial pace (less than 100 bytes per
> second) because the write path waits for a 10ms timeout to expire
> after every character instead of being able to continue on to the next
> character upon seeing THRE asserted.  (GRUB behaves similarly.)
> 
> As a workaround, introduce a new port type for the ASPEED VUART that's
> identical to PORT_16550A as it had previously been using, but with
> UART_FCR_R_TRIG_00 instead to set the receive FIFO trigger level to
> one byte, which (experimentally) seems to avoid the problematic THRE
> behavior.

...

> +	[PORT_ASPEED_VUART] = {
> +		.name		= "ASPEED VUART",
> +		.fifo_size	= 16,
> +		.tx_loadsz	= 16,
> +		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_00,
> +		.rxtrig_bytes	= {1, 4, 8, 14},
> +		.flags		= UART_CAP_FIFO,
> +	},

This is quite similar to AR7 type. Can that be (re-)used?

-- 
With Best Regards,
Andy Shevchenko


