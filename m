Return-Path: <openbmc+bounces-1295-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCCEHO8Qe2nqAwIAu9opvQ
	(envelope-from <openbmc+bounces-1295-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 29 Jan 2026 08:49:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0462EACF7E
	for <lists+openbmc@lfdr.de>; Thu, 29 Jan 2026 08:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1rqs106Fz2xpn;
	Thu, 29 Jan 2026 18:48:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769672937;
	cv=none; b=F3Ef+Se0oC/GWdrT9DT7wmcEtxq4deFiioMB2v8ViYdMhR6MD8mxiY99ALaC5FHlEdZ9TbOvWlHg4EzkMDzr+M3GAA90gCmQk752+yFzj5T534GhqPqWiOJjKGKQD5QKJ3U3s6LT6B9Pi3sNQ5ctN5jygHpHHhDu4Gk6owvBnOj/wLniPMJHr+8S3mYo5Am/ypAc+gI2+vd+DjNmJUY6nlcJj/prHrHPX3MzQ6Wa3LY8ksjgyriHDyiYjNL6gjO+R6Tfh84XJAe643JypSW41T41Q09fluyd/zeOjjBDdiSIudvsDXRJd5c7FRT4a3xylxT0heTtx7LFSQq5MOWtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769672937; c=relaxed/relaxed;
	bh=/SrDZWzjNouMaqzYfX1jKs98jvPndIlYNWtZWMBYrSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BuxeZoh3wR1wGK64HaoibgSanQ6hHDAzFJBvfcavqv/+iS7axuCtYTs019shZ/1WwM7cC8WXvoToGQdAHjiNoKZIyTvEtOiXPs1lSvHErCDl/5SvJi3Xka8DfAgYierjBu5hbEaza1BV92pejzZQ/klJyoQJHcULjgkz+7Xtzx2E5e+pgowUtsY8Uw6Ev8IGDwWiuI6a62p/pIdnMImik3TPmTGu2LLdZOG0/FrFNq8yI6E6oc9xnu2aL3oBMCm64heM+T5VIZayhthRabMa/apfJX+VZ27if+VOreJq6fQcySe6cL0SutSJoOT3H04p8L6MJKKWEJOMPLyy5UegWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D5pAdHEZ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D5pAdHEZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1rqp0X9wz2xKh;
	Thu, 29 Jan 2026 18:48:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769672935; x=1801208935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N1n5iH1I6H9Z6SqaMYFKHSqa1YgvE2UHyKlj1De/3+8=;
  b=D5pAdHEZ2DAwSTMVFW9HKiHhQ3/RFY6710A/dQ4g8cpFhl8wzmhP82Ef
   JVwp5S5WiN3ggi1BJfKGi+5uhHCZ0S+htP6dSXKeoHRd8EGp5V56fEQ2T
   eK4iwAYQNnuYrb4ykq6LmaHKamvrAo9X3SVvJYnaNV5CxQLD1zpJQV1YE
   HxG4NCSV+oQgAwPZt4/UFlXkhj3hrKaRMRjES5A9HaCmp37zE2Yjlac5v
   oiDE4b/LoxHjyUtLqefR1PXSiBX1G1hGF0KPFAv7mj1TTRTRVj4wtW/VM
   127vrhKFQrt6LauIH3NKFEvcoreAAKSduR/a99LcTc9N1XuhVtUWKpFdV
   g==;
X-CSE-ConnectionGUID: fRPYFrqpQAmwPCoINJHzdw==
X-CSE-MsgGUID: Lab61ZNTQWuzFQNUeqSVPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74750591"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="74750591"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 23:48:50 -0800
X-CSE-ConnectionGUID: b7B3yOV4Rp2UQUZP3/Rmtg==
X-CSE-MsgGUID: 6hfgPNoAS0Oh9LMT4NoAyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208396371"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.105])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 23:48:45 -0800
Date: Thu, 29 Jan 2026 09:48:43 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, BMC-SW <BMC-SW@aspeedtech.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v24 3/4] i2c: ast2600: Add controller driver for new
 register layout
Message-ID: <aXsQ2xgao5PPqnk6@smile.fi.intel.com>
References: <20251118014034.820988-1-ryan_chen@aspeedtech.com>
 <20251118014034.820988-4-ryan_chen@aspeedtech.com>
 <6b99a6ea267fd0f75d4c366293fe6887cc038b7e.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE6E6353CEB66FFD0E498C1F29EA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE6E6353CEB66FFD0E498C1F29EA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1295-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0462EACF7E
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 02:08:00AM +0000, Ryan Chen wrote:

...

> Will add in i2c-aspeed.c aspeed_i2c_probe_bus
> 
> 	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2600-i2c-bus") &&

Just device_is_compatible(...) instead of OF-centric APIs.

> 	    device_property_present(&pdev->dev, "aspeed,global-regs"))
> 		return -ENODEV;

-- 
With Best Regards,
Andy Shevchenko



