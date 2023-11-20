Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 621F17F1D98
	for <lists+openbmc@lfdr.de>; Mon, 20 Nov 2023 20:57:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWtQ5RAK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYyvj3ng8z3cZd
	for <lists+openbmc@lfdr.de>; Tue, 21 Nov 2023 06:57:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWtQ5RAK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYyv31ywJz3bTP
	for <openbmc@lists.ozlabs.org>; Tue, 21 Nov 2023 06:56:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700510191; x=1732046191;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zb7vywnY5jyenAxj9sbtLt+bBMaQnCZHqRqsqRdZ/10=;
  b=cWtQ5RAKJaSRrBbpzBbeyZ5ub0+JfOFcTtqWta1MifzXOaPhNE/AMq0M
   z9H4YAh4HNVfq7O/z/hiRmlQAl1V7A5uU0SJil551Xpbqq9h4zP2JtvYD
   cyHXwu4LVPR7emS/kbNqTe14GbVXKeCQNlKcrlVVo4EzDZAwzVgKr9M2k
   yHuicilxuqRgPQGemQW0OkLS9YI/oTkTQnJnltASPWyTb6hxyFv7TJXoI
   UIxSZ0ylJBBFQQsutS0ZH2lSBq1h8Ef5h5gXREI6ppCwh8SgTWm/JLuyl
   XgbQsBuC5YEIoAT7CunlgVSgpK0HkJ/vyfwivHmYXJ8/LMewiSX7efdw/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="395622099"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="395622099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 11:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801298590"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801298590"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 11:56:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 184E813A; Mon, 20 Nov 2023 21:48:05 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()
Date: Mon, 20 Nov 2023 21:48:02 +0200
Message-ID: <20231120194802.1675239-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The pin control header provides struct pingroup and PINCTRL_PINGROUP() macro.
Utilize them instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 0cff44b07b29..4589900244c7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -474,9 +474,8 @@ enum {
 #undef WPCM450_GRP
 };
 
-static struct group_desc wpcm450_groups[] = {
-#define WPCM450_GRP(x) { .name = #x, .pins = x ## _pins, \
-			.num_pins = ARRAY_SIZE(x ## _pins) }
+static struct pingroup wpcm450_groups[] = {
+#define WPCM450_GRP(x) PINCTRL_PINGROUP(#x, x ## _pins, ARRAY_SIZE(x ## _pins))
 	WPCM450_GRPS
 #undef WPCM450_GRP
 };
@@ -852,7 +851,7 @@ static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
 				  const unsigned int **pins,
 				  unsigned int *npins)
 {
-	*npins = wpcm450_groups[selector].num_pins;
+	*npins = wpcm450_groups[selector].npins;
 	*pins  = wpcm450_groups[selector].pins;
 
 	return 0;
@@ -901,7 +900,7 @@ static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	struct wpcm450_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 
 	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
-			wpcm450_groups[group].num_pins, function);
+			wpcm450_groups[group].npins, function);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096

