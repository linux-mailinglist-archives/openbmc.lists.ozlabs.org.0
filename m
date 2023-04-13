Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD06E1228
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 18:22:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4cJ281Qz3fmq
	for <lists+openbmc@lfdr.de>; Fri, 14 Apr 2023 02:22:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RLQxd/5R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RLQxd/5R;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4QN3Hf8z3flR;
	Fri, 14 Apr 2023 02:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681402444; x=1712938444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iAGgqsfkVCgnhVtMdEmX8hcxBQ/3qJLFMKe4cTfgjds=;
  b=RLQxd/5Ry9wC6SaJfAqsLspYDz47f+d3atM497aEZvrsg8/hFEmt5NcI
   iVAv3PY39GtUh67A6N4ngL8N+EB5DOzhW3jSDD/FSwxGIW+qD/bccGQZp
   YZHQvHo+BPob3h/IdLQ5fJmwtCVA2rFRnuNxnRM+ePPzkWVw82huLi96H
   eRXe7zuPiAwA/Ic934gqxQM8sRZ4DEMl8aypSaKkmsEVUCtUoR0476/KB
   QUYqrbMj4PsqZtEJMqUUMCOEUYArd9ayqRnRQ+oHgER8bWe5cyfplYdxD
   77xwijx1Pq7eyzF8ZU0xay7JFrwDXl36VUQ4AWh5qxBmFhZgYlucHSLRK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="332966827"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="332966827"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 09:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="813506683"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="813506683"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 13 Apr 2023 09:10:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pmzXE-00GcfK-2T;
	Thu, 13 Apr 2023 19:10:56 +0300
Date: Thu, 13 Apr 2023 19:10:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v9 2/2 RESEND] i2c: aspeed: support ast2600 i2c new
 register mode driver
Message-ID: <ZDgpkK/Dv3y1LUe2@smile.fi.intel.com>
References: <20230413075327.1397306-1-ryan_chen@aspeedtech.com>
 <20230413075327.1397306-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413075327.1397306-3-ryan_chen@aspeedtech.com>
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

On Thu, Apr 13, 2023 at 03:53:27PM +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.

There is already i2c-aspeed.c in the kernel. Can you elaborate what's wrong
with the extending existing driver? (It seems to me that so called "legacy"
mode is exactly what is being serviced by that driver.)

-- 
With Best Regards,
Andy Shevchenko


