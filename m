Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD224A78D1
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 20:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpsdd0r53z3cBZ
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 06:42:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dBL2GpyA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dBL2GpyA; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpsdC6j2Zz2xY6
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 06:42:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643830928; x=1675366928;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=TJ7VQzE63R4Se9UOTYu3C03DxVr1A7FIGvKfj0AVdYo=;
 b=dBL2GpyAQ9lUGhk+SzlEWWNrvdShM4nwxyfbZ53e3v2lZRcDz72hYEEZ
 /+Bh1D4dGCVLJCd0vZfVbvWiwTXCPxKoDQUu0iBUQK0sazi9YrEHHCeS8
 o7jN8MYXM7bRnzcKWzhUdXqVsH/ilnr2+n9Xqy0TFgIrdw6nrcF2uVazh
 MtmWi8dLDXwt4m4riG66372gUUxGP0rFnC6F5th1U3p8U6JJDYEJDP8zA
 ATXZQMfuN/lalL1WWkPlUzH8ELhDWdgyl9W4fQ0q1vQhVJhxYy9gGVVlR
 mgOR18/B7kHg408ot1lMS2P5fnisYi39Jw06U1Hyfl76NqKNkjkh+UcMY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="334365126"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
 d="scan'208,223";a="334365126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 11:41:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; 
 d="scan'208,223";a="771549658"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2022 11:41:03 -0800
Received: from [10.212.254.232] (jmbills-MOBL.amr.corp.intel.com
 [10.212.254.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E6C8F580B0E
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 11:41:01 -0800 (PST)
Message-ID: <3f326d63-a803-0305-ce82-6d9f7fcba830@linux.intel.com>
Date: Wed, 2 Feb 2022 12:41:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: [PATCH 1/2] Enable pass-through on GPIOE1 and GPIOE3 free
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 From a511f72a6514e67ee332715f1950140be528f112 Mon Sep 17 00:00:00 2001
From: "Jason M. Bills" <jason.m.bills@linux.intel.com>
Date: Fri, 3 May 2019 16:12:39 -0700
Subject: [PATCH 1/2] Enable pass-through on GPIOE1 and GPIOE3 free

This change adds a gpio_disable_free() implementation that checks
if the GPIO being freed is GPIOE1 (33) or GPIOE3 (35) and will
re-enable the pass-through mux.

Tested:
Requested GPIOs 33 and 35 and used devmem to check that pass-through
was disabled. Then freed them and checked that pass-through was
enabled again.

Signed-off-by: Jason M. Bills <jason.m.bills@linux.intel.com>
---
  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 17 +++++++
  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 +++++++
  drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 53 ++++++++++++++++++++++
  drivers/pinctrl/aspeed/pinctrl-aspeed.h    |  3 ++
  4 files changed, 90 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c 
b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 4c0d26606b6c..6ab3473cbba6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2785,6 +2785,22 @@ static int aspeed_g5_sig_expr_set(struct 
aspeed_pinmux_data *ctx,
  	return 0;
  }

+#define GPIOE1 33
+#define GPIOE3 35
+static void aspeed_g5_gpio_disable_free(struct pinctrl_dev *pctldev,
+			      struct pinctrl_gpio_range *range,
+			      unsigned int offset)
+{
+	/*
+	 * If we're freeing GPIOE1 (33) or GPIOE3 (35) then re-enable the
+	 * pass-through mux setting; otherwise, do nothing.
+	 */
+	if (offset != GPIOE1 && offset != GPIOE3)
+		return;
+
+	aspeed_gpio_disable_free(pctldev, range, offset);
+}
+
  static const struct aspeed_pin_config_map aspeed_g5_pin_config_map[] = {
  	{ PIN_CONFIG_BIAS_PULL_DOWN,  0, 1, BIT_MASK(0)},
  	{ PIN_CONFIG_BIAS_PULL_DOWN, -1, 0, BIT_MASK(0)},
@@ -2820,6 +2836,7 @@ static const struct pinmux_ops 
aspeed_g5_pinmux_ops = {
  	.get_function_groups = aspeed_pinmux_get_fn_groups,
  	.set_mux = aspeed_pinmux_set_mux,
  	.gpio_request_enable = aspeed_gpio_request_enable,
+	.gpio_disable_free = aspeed_g5_gpio_disable_free,
  	.strict = true,
  };

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c 
b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index a3fa03bcd9a3..ffc72168ef7b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -2693,6 +2693,22 @@ static int aspeed_g6_sig_expr_set(struct 
aspeed_pinmux_data *ctx,
  	return 0;
  }

+#define GPIOP1 121
+#define GPIOP3 123
+static void aspeed_g6_gpio_disable_free(struct pinctrl_dev *pctldev,
+			      struct pinctrl_gpio_range *range,
+			      unsigned int offset)
+{
+	/*
+	 * If we're freeing GPIOP1 (121) or GPIOP3 (123) then re-enable the
+	 * pass-through mux setting; otherwise, do nothing.
+	 */
+	if (offset != GPIOP1 && offset != GPIOP3)
+		return;
+
+	aspeed_gpio_disable_free(pctldev, range, offset);
+}
+
  static const struct aspeed_pin_config_map aspeed_g6_pin_config_map[] = {
  	{ PIN_CONFIG_BIAS_PULL_DOWN,  0,   1, BIT_MASK(0)},
  	{ PIN_CONFIG_BIAS_PULL_DOWN, -1,   0, BIT_MASK(0)},
@@ -2733,6 +2749,7 @@ static const struct pinmux_ops 
aspeed_g6_pinmux_ops = {
  	.get_function_groups = aspeed_pinmux_get_fn_groups,
  	.set_mux = aspeed_pinmux_set_mux,
  	.gpio_request_enable = aspeed_gpio_request_enable,
+	.gpio_disable_free = aspeed_g6_gpio_disable_free,
  	.strict = true,
  };

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c 
b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index c94e24aadf92..ade658af580b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -439,6 +439,59 @@ int aspeed_gpio_request_enable(struct pinctrl_dev 
*pctldev,
  	return 0;
  }

+void aspeed_gpio_disable_free(struct pinctrl_dev *pctldev,
+			      struct pinctrl_gpio_range *range,
+			      unsigned int offset)
+{
+	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	const struct aspeed_pin_desc *pdesc = pdata->pins[offset].drv_data;
+	const struct aspeed_sig_expr ***prios, **funcs, *expr;
+	int ret;
+
+	if (!pdesc)
+		return;
+
+	dev_dbg(pctldev->dev,
+		"Freeing pass-through pin %s (%d). Re-enabling pass-through.\n",
+		pdesc->name, offset);
+
+	prios = pdesc->prios;
+
+	if (!prios)
+		return;
+
+	/* Disable any functions of higher priority than GPIO just in case */
+	while ((funcs = *prios)) {
+		if (aspeed_gpio_in_exprs(funcs))
+			break;
+
+		ret = aspeed_disable_sig(&pdata->pinmux, funcs);
+		if (ret)
+			return;
+
+		prios++;
+	}
+
+	if (!funcs) {
+		char *signals = get_defined_signals(pdesc);
+
+		pr_warn("No GPIO signal type found on pin %s (%d). Found: %s\n",
+			pdesc->name, offset, signals);
+		kfree(signals);
+
+		return;
+	}
+
+	/*
+	 * Pass-through should be one priority higher than the GPIO function,
+	 * so decrement our prios and enable that function
+	 */
+	prios--;
+	funcs = *prios;
+	expr = *funcs;
+	aspeed_sig_expr_enable(&pdata->pinmux, expr);
+}
+
  int aspeed_pinctrl_probe(struct platform_device *pdev,
  			 struct pinctrl_desc *pdesc,
  			 struct aspeed_pinctrl_data *pdata)
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h 
b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index 4dcde3bc29c8..bd497c20a15f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -101,6 +101,9 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev 
*pctldev, unsigned int function,
  int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
  		struct pinctrl_gpio_range *range,
  		unsigned int offset);
+void aspeed_gpio_disable_free(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range,
+		unsigned int offset);
  int aspeed_pinctrl_probe(struct platform_device *pdev,
  		struct pinctrl_desc *pdesc,
  		struct aspeed_pinctrl_data *pdata);
-- 
2.25.1

