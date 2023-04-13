Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E16E1227
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 18:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4bK23Qrz3fZM
	for <lists+openbmc@lfdr.de>; Fri, 14 Apr 2023 02:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JQu/q+y2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JQu/q+y2;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Nb5nLDz3fgy;
	Fri, 14 Apr 2023 02:12:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681402354; x=1712938354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u3In46KoV7jrlPQBLlMpa2pfQ3+DhOK7gwXj89ZvQh0=;
  b=JQu/q+y2YAa8FcuIm7NLMOIz6ZR9we4T1tqwRsXwM7QzxXgT4AgQbTLI
   pAdNZpGCKL+mlbvfSPXaBsWvRhc3qPN1yYV/zJrXWmSxJXJLzmUfLrGUx
   83cpjzHggEjLj2PkShGS896XWn1vCTN7eRtGiofcYLLTQ0/Qnvq2vLxNX
   zvE1TcSaqrUVFUwG+Xn2hL0wS2bkMaMZbgOnAQK6lhCozKaBUxF05H9KW
   gP18AWb9syuxg25o2g1MBEx2yYJvSnNVem+fqgpn+wtxPTUpU5MT3tUFp
   5+mEkM34stOJY+cxP9bB0I7uC94ERzFek0JzkY97tlBIiA11uwD34McUr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="323853016"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="323853016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758753815"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="758753815"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 13 Apr 2023 09:12:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pmzYT-00GchC-2q;
	Thu, 13 Apr 2023 19:12:13 +0300
Date: Thu, 13 Apr 2023 19:12:13 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v9 2/2 RESEND] i2c: aspeed: support ast2600 i2c new
 register mode driver
Message-ID: <ZDgp3VrjW1YdC16z@smile.fi.intel.com>
References: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
 <20230413075327.1397306-3-ryan_chen@aspeedtech.com>
 <ZDgpkK/Dv3y1LUe2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDgpkK/Dv3y1LUe2@smile.fi.intel.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Phil Edworthy <phil.edworthy@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-aspeed@lists.ozlabs.org, Tyrone Ting <kfting@nuvoton.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, William Zhang <william.zhang@broadcom.com>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 13, 2023 at 07:10:56PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 13, 2023 at 03:53:27PM +0800, Ryan Chen wrote:
> > Add i2c new register mode driver to support AST2600 i2c
> > new register mode. AST2600 i2c controller have legacy and
> > new register mode. The new register mode have global register
> > support 4 base clock for scl clock selection, and new clock
> > divider mode. The i2c new register mode have separate register
> > set to control i2c master and slave.
> 
> There is already i2c-aspeed.c in the kernel. Can you elaborate what's wrong
> with the extending existing driver? (It seems to me that so called "legacy"
> mode is exactly what is being serviced by that driver.)

Okay, it seems the answer is in cover letter.

-- 
With Best Regards,
Andy Shevchenko


