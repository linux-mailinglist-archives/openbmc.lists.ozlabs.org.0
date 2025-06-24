Return-Path: <openbmc+bounces-283-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED3AE62E6
	for <lists+openbmc@lfdr.de>; Tue, 24 Jun 2025 12:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRMFc2b2vz2yft;
	Tue, 24 Jun 2025 20:51:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750762292;
	cv=none; b=h4g3Hx7ci8GjewCcIYZavjz/OizwqPEt8M+1F59vJDmhf1aYdgzlDpH9HPv2xNvxy7oI+5D/1DOvoB6EX/8PiwW5sGDjEJPtmi21caTKoMOjqwI9S1koaT4zaRhtPq4VXNFFU4+MrykfGAddeYRLetlRTte1ubMD05q5pOJhnBlBY1kMgM8anHG26g93cdTWbf+ZXcFN7uwWYUrap8f1sJMTE0YGnHY/D2SPEOAOf4S1fl1oxWbjHYtGr/n0jQrEu6d5ctJXch94RB/QpIKkTePc0uyhdUKzii2WeD8N7QOduuLKghjRD2rf6UBLcg/b7+ygY5zY85H5pbvpK8i4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750762292; c=relaxed/relaxed;
	bh=GwASaybr7tTBa/RnWzp5kiw4jn5j6IBVC/FDU+4fRf4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MKYIJCF9+Gykf6ohLLNxm5+jFa+qLmHblcAWVLi1xEHPYgZEC86kIdMF5NUNQlDTixki21pejYYPxtQBgBDpyz9M2LCksq1xlwXf0G5u+h7GUhKkAPP3tpIDhPEmbIDEHvS5x1TfqdweVHJ/i0ZTYkvwiyYgDrU8oYJJCZQ4P5coWwDVY/3ZVRYdYNImfqN90G76Ehrc2bTh+BpyYKa+qdOZBnryPXOwZdOyyonCFVpE+3cj5R3ycVX61/BLiJK+RSOklmygD/SBW6oQ4d4gaQFMLCvyEDnpUe06PnOBhCYMB3IkH6VdBr+XA4SMXIr9ORi0YNyLEdL4O1BYhc0xUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D47wVn+b; dkim-atps=neutral; spf=none (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D47wVn+b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 24 Jun 2025 20:51:28 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRMFX2Mblz2xk5;
	Tue, 24 Jun 2025 20:51:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750762289; x=1782298289;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dv6ZN9qLcc39VhlOnYfqWOhVKBnveT9waBSLrEElVx8=;
  b=D47wVn+b4FJ06ELQgow8fh5btgHBxIaZJX+DruR/1BUJvkPXLQoLcpkZ
   H7JC9MVt/t8Mu3zUw5/D+Ayj2lHhCltZK0QsFoxqQOFGzjpCJSexmMUAs
   KJqiFdT2+JJSORvbReAC7XZnIhNlKzwqxfgGae0RuMMqGHHtlhlDrMxJJ
   0Q+hkWUGaqCNw4027HtQXGfXf8DSl1ertSyZBwKtzNatylnSsyi1GaE84
   KpR2YsrqGHFHWWzUHBZ7t1NBDb9/DxOivLU1VReMOj0kQntZy2CiLzh6M
   wx7dEwJrjiLipgBT9dJu8tkIijGNkJfREeyZI69QCKVTeDafPPlD8C/cT
   A==;
X-CSE-ConnectionGUID: RHKapWU+Qwe8e/ZhmMhXWQ==
X-CSE-MsgGUID: FPf+wqgFSAOn7/onE5SOfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64352257"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="64352257"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:50:20 -0700
X-CSE-ConnectionGUID: P3jobHMUQAe9pUeBJdc30Q==
X-CSE-MsgGUID: JnGhA3LFT8aHV12Y11RQCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151306478"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 03:50:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 13:50:06 +0300 (EEST)
To: Jacky Chou <jacky_chou@aspeedtech.com>
cc: "bhelgaas@google.com" <bhelgaas@google.com>, 
    "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
    "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
    "mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
    "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
    "conor+dt@kernel.org" <conor+dt@kernel.org>, 
    "joel@jms.id.au" <joel@jms.id.au>, 
    "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, 
    "vkoul@kernel.org" <vkoul@kernel.org>, 
    "kishon@kernel.org" <kishon@kernel.org>, 
    "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
    "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
    "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
    "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
    "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
    "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
    "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
    "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
    "elbadrym@google.com" <elbadrym@google.com>, 
    "romlem@google.com" <romlem@google.com>, 
    "anhphan@google.com" <anhphan@google.com>, 
    "wak@google.com" <wak@google.com>, 
    "yuxiaozhang@google.com" <yuxiaozhang@google.com>, 
    BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH 7/7] pci: aspeed: Add ASPEED PCIe host controller
 driver
In-Reply-To: <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
Message-ID: <a618588d-54fe-69a9-27f7-7b19ba905a52@linux.intel.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-8-jacky_chou@aspeedtech.com> <40d1c5bd-0457-55ea-2514-ba27e6a4c720@linux.intel.com> <SEYPR06MB5134973F678EB5B163DD50809D79A@SEYPR06MB5134.apcprd06.prod.outlook.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 23 Jun 2025, Jacky Chou wrote:

> > > +static bool aspeed_ast2700_get_link(struct aspeed_pcie *pcie) {
> > > +	u32 reg;
> > > +	bool link;
> > > +
> > > +	regmap_read(pcie->pciephy, PEHR_MISC_300, &reg);
> > > +	if (reg & CAPABILITY_GEN2) {
> > > +		regmap_read(pcie->pciephy, PEHR_MISC_344, &reg);
> > > +		link = !!(reg & LINK_STATUS_GEN2);
> > > +	} else {
> > > +		regmap_read(pcie->pciephy, PEHR_MISC_358, &reg);
> > > +		link = !!(reg & LINK_STATUS_GEN4);
> > 
> > While I don't entirely know the meaning of these bits, what if the link is not
> > using maximum speed it is capable of, does this check misbehave?
> > 
> 
> In our AST2700, there are gen4 RC and gen2 RC.
> Therefore, here will get capability to confirm it is gen2 or gen4.
> And the link status is in different register.

Okay, but then I'm a bit worried the naming of the defines as "Link 
Status" has a well-known meaning in PCIe Spec so it is confusing to call 
something else LINK_STATUS_*. Does that name come from some AST spec? In 
not, change the define naming. If yes, you should prefix it with so it is 
clear this is not referring to a generic PCIe thing and I suggest also 
adding a comment above those defines too so anyone looking them later 
won't wonder if you're just duplicating something from the PCIe spec.

-- 
 i.


