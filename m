Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF94A7928
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 21:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jpt3W0fJ0z3bdC
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 07:01:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5bNtZhW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M5bNtZhW; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpt334tl7z30Dv
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 07:01:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643832064; x=1675368064;
 h=message-id:date:mime-version:to:from:subject:
 content-transfer-encoding;
 bh=ghoaGIvHOohYAdEMkU3TDebLbUxwZUrAGaJ7rg8UWuQ=;
 b=M5bNtZhWdb4I0gLaFoLoRrnWHz1+qbwuwjojeJFRJCLX84917U6wSgLO
 hqZ8QqoMCX7nDzYCzs4InGU09u2o443CVCsdA1fjT9NpjteXypnG5vTNS
 NxoO4AqDCDu2foynMDZKXUsBA91L8Ic4Pg66JvD++i5YMCPD4y8p9ZT/s
 rfEpfDWiARvOUqLSFa8Hgh6AkeaW9ykrZsnqlO1WR0esJMhaKyFZmv4xF
 llGvu8ZvPhzTKefbcIceBJTDusO3oP1qeafEdL4AhMcOgBqGtqWpCkrRi
 y/0B6FnM5EiqyYxq3fN2QIQEDMIzgg/durB/QqaIipAJ5fD0cBOR84sGY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="248226978"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="248226978"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 11:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="497870159"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2022 11:59:59 -0800
Received: from [10.212.254.232] (jmbills-MOBL.amr.corp.intel.com
 [10.212.254.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 9CC89580B0E
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 11:59:59 -0800 (PST)
Message-ID: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
Date: Wed, 2 Feb 2022 12:59:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and GPIOE3
 free
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

