Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7646DA671F0
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:00:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH84X0qnQz3fSr
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 21:59:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742295586;
	cv=none; b=eWGW+N5Cin7hNws5ReKE/EVx/aA32uyH/iA/WYOst9htAVy7NGB1+IJiB6VDd4dIvoanm31ihNcHZHhqOjWXlPaLueAsA3xUcRannCuXxHR536uvtRHfpCItnKvJLc+yE/S5rL/K/pozvmQMrVQ2EQwhJqnayIPyWILvEDLUfYo+RNgIMVBDAiyjaFrgA8Q6jhJNxPY6o+wCN0GOS2Q04uZSrM9Hvf6wi65OQgYXfxIgf3pEESyMS5M488xckKrlIV7IQyi1uZ733dLIe3UxRo8+6RIn2uh5TrdnvWCIZC+Eu+sDQiWnL2bx5rk7EDPzloKnXJLugK+2q7/fnqYqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742295586; c=relaxed/relaxed;
	bh=1pfUlvb5zhw99ZWb0RJphObm/FvmLmvLrCf2wM6zAkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eWt2IjnRjnsz7shqf5nzNieahe+BDL9MdeUjRNIBfd5ocR0TSIWE6+6qtWxwkHMRVyiIwnDbcipEEmcEjD8ABeI2yJj5KILSI/AJ9sYkP8hDY2yclEZS36t/QEuMKwgvxMh0yiILbIKgTjrqlfVBYNCs0Ds2pbFl6O11SKyp9FlLu0k0kCrRf0VShkJ1LKCSe8WiKkIQ74rBBuQ7CInKq7scIsicfYK78EtxUzvwr1F15HEHcmuOlamxW/ke3/GTQD/69r4L6aazqO8tr2s2dB18GJVZS6V2JUWvbTFcxigO3NuWeSl2+Gs1LSSK+VCNQKA+VLD3pgABihTb4/FG9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NdACpVG7; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NdACpVG7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH84H1kv2z2ySd
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 21:59:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295583; x=1773831583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aXsahCvO2KYQIW3IfJ3vGR9arA9mwP0c7xLGGryhCno=;
  b=NdACpVG7RybsYMppUeyyeLORw2rMHOhI1dsWmG+Do/0uQpNKpClLXNlT
   A+29CrTduMdt/6sikwwtLDCQ59wIR84q2oG7PZDu1L+ociHQU4ZhBWqML
   qJeBYqqgOdxmue8a3+UxlL3vOXQ1O1Tvlgk+C7HGLKX0eiW47ajNgHB8P
   vzxYD1gjD36jn2lRWtXdSZ/V8lUHBnV2BoSOfqKuo1gcgPAwa+G9Un/cO
   dAugSqN/ba9rqSfQDImJlXY7tXEHg2v0DHPyfh7U2tIdkrJqmAoB4wceX
   F5Gu/P2TtO0iqJkWwaq5weCqbfpIK4a9A4hNdfMJDYbymdLnTetqGXbIW
   Q==;
X-CSE-ConnectionGUID: 4cyAQepDSrWBdbgMBS/a8g==
X-CSE-MsgGUID: HmfP+TqkTAGc8Y5yhAafrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60959398"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="60959398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:39 -0700
X-CSE-ConnectionGUID: 7sgIk1i0SGCfXDhHYH+nLg==
X-CSE-MsgGUID: ATtY5SUDR1+3aksE20WR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="127322155"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 03AB32FC; Tue, 18 Mar 2025 12:59:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 3/5] pinctrl: nuvoton: Make use of struct pinfunction and PINCTRL_PINFUNCTION()
Date: Tue, 18 Mar 2025 12:57:16 +0200
Message-ID: <20250318105932.2090926-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tali Perry <tali.perry1@gmail.com>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Since pin control provides a generic data type and a macro for
the pin function definition, use them in the driver.

Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c    | 19 ++++++++-----------
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 11 +++--------
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 11 +++--------
 4 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index 59c4e7c6cdde..ad4f9ca414c8 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -98,12 +98,6 @@ static const u32 ds_3300mv_tbl[] = {
 	17100, 25600, 34100, 42800, 48000, 56000, 77000, 82000,
 };
 
-struct ma35_pin_func {
-	const char		*name;
-	const char		**groups;
-	u32			ngroups;
-};
-
 struct ma35_pin_setting {
 	u32			offset;
 	u32			shift;
@@ -149,7 +143,7 @@ struct ma35_pinctrl {
 	struct regmap		*regmap;
 	struct ma35_pin_group	*groups;
 	unsigned int		ngroups;
-	struct ma35_pin_func	*functions;
+	struct pinfunction	*functions;
 	unsigned int		nfunctions;
 };
 
@@ -1041,9 +1035,10 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 					u32 index)
 {
 	struct device_node *child;
-	struct ma35_pin_func *func;
+	struct pinfunction *func;
 	struct ma35_pin_group *grp;
 	static u32 grp_index;
+	const char **groups;
 	u32 ret, i = 0;
 
 	dev_dbg(npctl->dev, "parse function(%d): %s\n", index, np->name);
@@ -1055,12 +1050,12 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 	if (func->ngroups <= 0)
 		return 0;
 
-	func->groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(char *), GFP_KERNEL);
-	if (!func->groups)
+	groups = devm_kcalloc(npctl->dev, func->ngroups, sizeof(*groups), GFP_KERNEL);
+	if (!groups)
 		return -ENOMEM;
 
 	for_each_child_of_node(np, child) {
-		func->groups[i] = child->name;
+		groups[i] = child->name;
 		grp = &npctl->groups[grp_index++];
 		ret = ma35_pinctrl_parse_groups(child, grp, npctl, i++);
 		if (ret) {
@@ -1068,6 +1063,8 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 			return ret;
 		}
 	}
+
+	func->groups = groups;
 	return 0;
 }
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 2601aacfb976..c6b11a198c76 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -639,13 +639,6 @@ static struct pingroup npcm7xx_groups[] = {
 
 #define NPCM7XX_SFUNC(a) NPCM7XX_FUNC(a, #a)
 #define NPCM7XX_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define NPCM7XX_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct npcm7xx_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 NPCM7XX_SFUNC(smb0);
 NPCM7XX_SFUNC(smb0b);
@@ -764,7 +757,8 @@ NPCM7XX_SFUNC(lkgpo2);
 NPCM7XX_SFUNC(nprd_smi);
 
 /* Function names */
-static struct npcm7xx_func npcm7xx_funcs[] = {
+static struct pinfunction npcm7xx_funcs[] = {
+#define NPCM7XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM7XX_MKFUNC(smb0),
 	NPCM7XX_MKFUNC(smb0b),
 	NPCM7XX_MKFUNC(smb0c),
@@ -880,6 +874,7 @@ static struct npcm7xx_func npcm7xx_funcs[] = {
 	NPCM7XX_MKFUNC(lkgpo1),
 	NPCM7XX_MKFUNC(lkgpo2),
 	NPCM7XX_MKFUNC(nprd_smi),
+#undef NPCM7XX_MKFUNC
 };
 
 #define NPCM7XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index eac43315a360..62347a82282d 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -826,13 +826,6 @@ static struct pingroup npcm8xx_pingroups[] = {
 
 #define NPCM8XX_SFUNC(a) NPCM8XX_FUNC(a, #a)
 #define NPCM8XX_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define NPCM8XX_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct npcm8xx_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 NPCM8XX_SFUNC(gpi36);
 NPCM8XX_SFUNC(gpi35);
@@ -1055,7 +1048,8 @@ NPCM8XX_SFUNC(hgpio6);
 NPCM8XX_SFUNC(hgpio7);
 
 /* Function names */
-static struct npcm8xx_func npcm8xx_funcs[] = {
+static struct pinfunction npcm8xx_funcs[] = {
+#define NPCM8XX_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	NPCM8XX_MKFUNC(gpi36),
 	NPCM8XX_MKFUNC(gpi35),
 	NPCM8XX_MKFUNC(tp_jtag3),
@@ -1275,6 +1269,7 @@ static struct npcm8xx_func npcm8xx_funcs[] = {
 	NPCM8XX_MKFUNC(hgpio5),
 	NPCM8XX_MKFUNC(hgpio6),
 	NPCM8XX_MKFUNC(hgpio7),
+#undef NPCM8XX_MKFUNC
 };
 
 #define NPCM8XX_PINCFG(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q) \
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 2f97accef837..4264ca749175 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -482,13 +482,6 @@ static const struct pingroup wpcm450_groups[] = {
 
 #define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
 #define WPCM450_FUNC(a, b...) static const char *a ## _grp[] = { b }
-#define WPCM450_MKFUNC(nm) { .name = #nm, .ngroups = ARRAY_SIZE(nm ## _grp), \
-			.groups = nm ## _grp }
-struct wpcm450_func {
-	const char *name;
-	const unsigned int ngroups;
-	const char *const *groups;
-};
 
 WPCM450_SFUNC(smb3);
 WPCM450_SFUNC(smb4);
@@ -555,7 +548,8 @@ WPCM450_FUNC(gpio, WPCM450_GRPS);
 #undef WPCM450_GRP
 
 /* Function names */
-static struct wpcm450_func wpcm450_funcs[] = {
+static struct pinfunction wpcm450_funcs[] = {
+#define WPCM450_MKFUNC(nm) PINCTRL_PINFUNCTION(#nm, nm ## _grp, ARRAY_SIZE(nm ## _grp))
 	WPCM450_MKFUNC(smb3),
 	WPCM450_MKFUNC(smb4),
 	WPCM450_MKFUNC(smb5),
@@ -616,6 +610,7 @@ static struct wpcm450_func wpcm450_funcs[] = {
 	WPCM450_MKFUNC(hg6),
 	WPCM450_MKFUNC(hg7),
 	WPCM450_MKFUNC(gpio),
+#undef WPCM450_MKFUNC
 };
 
 #define WPCM450_PINCFG(a, b, c, d, e, f, g) \
-- 
2.47.2

