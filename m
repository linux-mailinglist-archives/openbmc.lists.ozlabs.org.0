Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE008A853A
	for <lists+openbmc@lfdr.de>; Wed, 17 Apr 2024 15:49:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GZNP2czp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKMjB0bfXz3cQq
	for <lists+openbmc@lfdr.de>; Wed, 17 Apr 2024 23:49:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GZNP2czp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKMhc3rcFz3bjK
	for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2024 23:49:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713361761; x=1744897761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ltyfGUT+Q1+XHGbLf8LZqsmChBW2AZtse+4kwOov8BQ=;
  b=GZNP2czpaS6cs/+GHnJ/KDAlQ4SisUmQ8p7FR57Yg3mxLWyVMt4wYtkY
   6koxuFWZD1TwMNx1+Rmk+bOO2h3tghzB3LEKitJ7xYFE5oz/uWZ54//7S
   m/bMhWxy2seKJZLmy/r70uGuK3ENss8CDhvEUpiYEFI0LecdyJo8aD3S5
   KDV3ZC6xo8EzGWsUPtM/b1sUJUxxDEV+3hj1tSDJDp9qrjf7lfRbUjP43
   oXn+CYyw7Tk7OMuO/gOT5c3RY+oxHl5wSZzzjk7XLMox6WWCsikN7jJF6
   BEPhGx3aA5j83xUNfhSZCkXaAq7OMqH7K1swlyKu3Wu0jzeSB7XC2fcxm
   g==;
X-CSE-ConnectionGUID: QaQQ7Qa6Qy+mC1We1z5gkg==
X-CSE-MsgGUID: nbAwK24nQUifGhvhtBqf7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20243258"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="20243258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 06:49:13 -0700
X-CSE-ConnectionGUID: 15UkjXbFQ0yniwze6OGHzw==
X-CSE-MsgGUID: lHfY7O6WRHO4OiRM3eJPng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="23059043"
Received: from molech-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.36])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 06:49:12 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] peci: aspeed: Clear clock_divider value before setting it
Date: Wed, 17 Apr 2024 15:48:49 +0200
Message-ID: <20240417134849.5793-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PECI clock divider is programmed on 10:8 bits of PECI Control register.
Before setting a new value, clear bits read from hardware.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 drivers/peci/controller/peci-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index 7fdc25afcf2f..de7046e6b9c4 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -351,6 +351,7 @@ static int clk_aspeed_peci_set_rate(struct clk_hw *hw, unsigned long rate,
 	clk_aspeed_peci_find_div_values(this_rate, &msg_timing, &clk_div_exp);
 
 	val = readl(aspeed_peci->base + ASPEED_PECI_CTRL);
+	val &= ~ASPEED_PECI_CTRL_CLK_DIV_MASK;
 	val |= FIELD_PREP(ASPEED_PECI_CTRL_CLK_DIV_MASK, clk_div_exp);
 	writel(val, aspeed_peci->base + ASPEED_PECI_CTRL);
 
-- 
2.44.0

