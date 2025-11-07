Return-Path: <openbmc+bounces-855-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB52C3F374
	for <lists+openbmc@lfdr.de>; Fri, 07 Nov 2025 10:42:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2vHg3WTmz3054;
	Fri,  7 Nov 2025 20:42:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762508575;
	cv=none; b=DZ8Ewu1mHNw2NZtwIexhBBJnZ7grWB8p5QaIWfUdliBmvbW725IYHijIhk1k2Tn7khyN0ZgewQif36mSvKFiRNp9gXWd7Q40vQQ4NYeUgo5M9ny99OlvOVIlYy4M1gSOLC0ijBTpkbdmkDfUlWUxR4kgVQb7xg3eR23QuNdVrn5eFfnyc9v+JDLLrkVfe+IJZfly5c8MTPIdAs/SzSrtu9Bd7Xx/idT05dftfMfAs81TmjXDhLjac8vC6i/726LbqRVVZJKcGqptYLGFWArKC3SnpkvDBVQBG8VZFLcSCZuFER9EGrMGsU3L2pt+trGUl2gEzd2jNkMtHsyCD2KUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762508575; c=relaxed/relaxed;
	bh=afGjVttI914lkamQzbwHFWQI/mW5NqG7gu6A5EIHDVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BE7rDaAAANu6Rhp9f4OzD4JPAvVqdL6RhgfMaoPXRWzyatC9ch0m/mzZJKt0HTbc7HwqZROP2xoXvsGmJqjtObapVE8t1lm3ttH82H6VwYtdRK5ORlGWgAPGFjMCEzXFdHoeRKdubPwK4brLiKHuwVt5nhNML64ZpHbb+1nwALtRZshsWbp/gzoPpdAqzmeXpCQxjivyUGabFX+8zAqDp0wikMlUNBBl0+JVSR+xHQD4eEDXvhFm/XsO8/T13nt2cMC0ZcQ1CvJTjTnhr7X4rrKm1cdTZwu0R2+vDf7aMzPyaNZ5ecDD+m9BJ6Udqx+trSUu5CL11+AHx1BymLZWZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e9RuC0CJ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e9RuC0CJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2vHc48r1z2yjm;
	Fri,  7 Nov 2025 20:42:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762508573; x=1794044573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WJXOLztqSo4giTqFOw8G/lBkaE8BpltWb1JC16Iyvfc=;
  b=e9RuC0CJoV45YgMRosExhIVFAFWXRwlbqWnIdjeGbP2sEE8btPDLCVM7
   LxdyFu01zEzh6/URoHd2TzTmNLEWfpKTrWVJ5pEkiw09Mwuwu+8X5EM0e
   h3q2fgWwHuzaclKqL0kp7nL0m/LLQdeM4fzFVrTHq00HIbw3e2lASHlq3
   Z7YY4HD3/srBuoPNlQZVdhxTD9AR/nrcuxguNfE8cCHEJcbbmMHQEDAWc
   0yiEs/ktq3MUATNgOs1yhLmAlEV+/EKE89rSkJdZqKs2mj4S0FTJdlqRS
   CQKECdQnlcq5nod7b9KeAVUrdnE7JUm0Q/GV6AqNpMZRe1LheQL/b7FCv
   g==;
X-CSE-ConnectionGUID: dBevw6o9Ql2LESfZGa7rLg==
X-CSE-MsgGUID: 1YEeaJfzQqq6jrnLXfcvew==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63864702"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="63864702"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:42:48 -0800
X-CSE-ConnectionGUID: oCQK/vHQQpCJVDh93eyUgw==
X-CSE-MsgGUID: jz6q+Cp+QiGNuEuTne9Otg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="187253469"
Received: from vpanait-mobl.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.27])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 01:42:43 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vHIzQ-00000006QDe-05pD;
	Fri, 07 Nov 2025 11:42:40 +0200
Date: Fri, 7 Nov 2025 11:42:39 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v21 3/4] i2c: ast2600: Add controller driver for new
 register layout
Message-ID: <aQ2_D6vs4m1brNk0@smile.fi.intel.com>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-4-ryan_chen@aspeedtech.com>
 <f08b1078-fc8c-4834-984c-813e01291033@kernel.org>
 <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
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
In-Reply-To: <TY2PPF5CB9A1BE64FEBCCCDC7631B355135F2C3A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 07, 2025 at 06:26:39AM +0000, Ryan Chen wrote:
> > On 27/10/2025 07:12, Ryan Chen wrote:

...

> Add new file i2c-aspeed-core.c to do legacy probe and i2c-ast2600 probe.
> 
> 	if (of_device_is_compatible(dev_of_node(dev), "aspeed,ast2600-i2c-bus") &&

	if (device_is_compatible(dev, "aspeed,ast2600-i2c-bus") &&

> 	    of_parse_phandle(dev_of_node(dev), "aspeed,global-regs", 0)) {

Not sure why do you need this. Isn't it as simple as

	    device_property_present(dev, "aspeed,global-regs", 0)) {

or something between these lines?

> 		ret = ast2600_i2c_probe(pdev);
> 	} else {
> 		ret = aspeed_i2c_probe(pdev);
> 	}

-- 
With Best Regards,
Andy Shevchenko



