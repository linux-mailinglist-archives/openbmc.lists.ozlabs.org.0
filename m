Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49DA671F8
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 12:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH84z4rYcz3gFj
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 22:00:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742295592;
	cv=none; b=YizxRQkxxGkfjgy/3eZNvCZ6IRczvXqDQG978hHxtYrtJJYNgf7IJphk3ixMebvmWTwVoLuu7BcaODt8NrnHJwK0w12cYHHIqKpph4Aghj/alutRiJ3HfAk7ZOhZDaKxRIAvOv42ppO1YqTCoQlyitywJfLOjRMpizfLF5ONmvvvmBGmJW0EC2Cm0gKU2tgUc2XB2ZmXHlrLFQEu+BGoxhaft250+4NjCM4rFO16nRJYOVvBlsGzxPlgSNOTC0bSfN+7DP1O4jeuTjPkm5XAOmrvCJ8rU/4ghSOkTVpvm91WI9NHZ+TQmOBEX4q77SaMsVA6KhojZxFdAxqXdgnyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742295592; c=relaxed/relaxed;
	bh=7qSUr+pm3pdnbRsIh3hdQcHybpcWSk9Cg64DpmHfrRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qle6EK3p9oKC8EzDc66UGPdoNuivRKQQw9vD5TTHdzlO6m22aG9JnLforU7Ab75IPDmWR03ZSlQkiqEFSr0vTA+wJC9S3B5t39Bjb/Sj1ilsxBQSXlDFyPb0qXhHIQxfp7H49Jpdsuczas0qpHwdmjXkrPVmTOB6oLFD9xJbyBRV9xEU8Aqp28dSD4LncIV6eLYKAJYqwW79CDIoorLxT8zBI3GBYLfL0xBZy6ScB3KHAZNYcLYgigIpRfxk5A0muD3GLk1AJndkHTXigHJz7/unwRraNDwtRDSZ2jQSvAvVLuJb0deBJcoq191lduqy9k2xlcruvvHMzwYDEvrPFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bq8T2Lv1; dkim-atps=neutral; spf=none (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bq8T2Lv1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH84N4PG1z2yMF
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 21:59:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742295589; x=1773831589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K4Qh71+6FN2E5vhhDAN+lN9a5M2tg0WGTdBTyy5owTw=;
  b=Bq8T2Lv1AE2pDegR7G0P1CnNG8uIPEo6PyOCIMw8juKp0+PIgxyRaxCt
   KLWA4+Tq3SSLs0TgsuT6JTk2febx2kg3RzNZ203S9r28qfC5KN2dvZUF2
   HvHaZv4qbkO24NsudW2XikCMGp2fFRAbzpHgSjOowKmFGVKDlIzcb85KP
   d8+Ku8vjJ2/YitOVHctjPMZsBA1jv8PdFrFChCaoxQRKPKjGekzVVjqiI
   8NHQdTiFHvCy0muwRR1wtPGm7a/rsmNYntDNxQCOuvADfd6vW5Xt8eOXc
   Yn2dFJ4OOFGbLTvqXHpkyT70TndKNRmrp+SmUd2kvD9O7ii3TbBOWfQi1
   g==;
X-CSE-ConnectionGUID: LTVTrT6AReSgUaSPOQsBsA==
X-CSE-MsgGUID: CEBU72pOQXGih2dkUk+pYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68781750"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68781750"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:59:38 -0700
X-CSE-ConnectionGUID: 9KcpTX+ET7aels/yNDL6uw==
X-CSE-MsgGUID: TcQmfDf+TDiUMxf/WRhAPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="153215699"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2025 03:59:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1026A5DC; Tue, 18 Mar 2025 12:59:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jacky Huang <ychuang3@nuvoton.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 4/5] pinctrl: nuvoton: Convert to use struct group_desc
Date: Tue, 18 Mar 2025 12:57:17 +0200
Message-ID: <20250318105932.2090926-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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

The pin control core header provides struct group_desc.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 70 ++++++++++++--------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index ad4f9ca414c8..da3c8d8e3eb3 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -106,13 +106,6 @@ struct ma35_pin_setting {
 	unsigned int		nconfigs;
 };
 
-struct ma35_pin_group {
-	const char		*name;
-	unsigned int		npins;
-	unsigned int		*pins;
-	struct ma35_pin_setting	*settings;
-};
-
 struct ma35_pin_bank {
 	void __iomem		*reg_base;
 	struct clk		*clk;
@@ -141,7 +134,7 @@ struct ma35_pinctrl {
 	struct pinctrl_dev	*pctl;
 	const struct ma35_pinctrl_soc_info *info;
 	struct regmap		*regmap;
-	struct ma35_pin_group	*groups;
+	struct group_desc	*groups;
 	unsigned int		ngroups;
 	struct pinfunction	*functions;
 	unsigned int		nfunctions;
@@ -160,7 +153,7 @@ static const char *ma35_get_group_name(struct pinctrl_dev *pctldev, unsigned int
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
 
-	return npctl->groups[selector].name;
+	return npctl->groups[selector].grp.name;
 }
 
 static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selector,
@@ -171,19 +164,19 @@ static int ma35_get_group_pins(struct pinctrl_dev *pctldev, unsigned int selecto
 	if (selector >= npctl->ngroups)
 		return -EINVAL;
 
-	*pins = npctl->groups[selector].pins;
-	*npins = npctl->groups[selector].npins;
+	*pins = npctl->groups[selector].grp.pins;
+	*npins = npctl->groups[selector].grp.npins;
 
 	return 0;
 }
 
-static struct ma35_pin_group *ma35_pinctrl_find_group_by_name(
-			      const struct ma35_pinctrl *npctl, const char *name)
+static struct group_desc *
+ma35_pinctrl_find_group_by_name(const struct ma35_pinctrl *npctl, const char *name)
 {
 	int i;
 
 	for (i = 0; i < npctl->ngroups; i++) {
-		if (!strcmp(npctl->groups[i].name, name))
+		if (!strcmp(npctl->groups[i].grp.name, name))
 			return &npctl->groups[i];
 	}
 	return NULL;
@@ -195,9 +188,10 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 					    unsigned int *num_maps)
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
-	struct ma35_pin_group *grp;
+	struct ma35_pin_setting *setting;
 	struct pinctrl_map *new_map;
 	struct device_node *parent;
+	struct group_desc *grp;
 	int map_num = 1;
 	int i;
 
@@ -211,7 +205,7 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	map_num += grp->npins;
+	map_num += grp->grp.npins;
 	new_map = kcalloc(map_num, sizeof(*new_map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
@@ -223,17 +217,19 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 	if (!parent)
 		return -EINVAL;
 
+	setting = grp->data;
+
 	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
 	new_map[0].data.mux.function = parent->name;
 	new_map[0].data.mux.group = np->name;
 	of_node_put(parent);
 
 	new_map++;
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
-		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->pins[i]);
-		new_map[i].data.configs.configs = grp->settings[i].configs;
-		new_map[i].data.configs.num_configs = grp->settings[i].nconfigs;
+		new_map[i].data.configs.group_or_pin = pin_get_name(pctldev, grp->grp.pins[i]);
+		new_map[i].data.configs.configs = setting[i].configs;
+		new_map[i].data.configs.num_configs = setting[i].nconfigs;
 	}
 	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
 		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
@@ -281,14 +277,14 @@ static int ma35_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int selecto
 			       unsigned int group)
 {
 	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
-	struct ma35_pin_group *grp = &npctl->groups[group];
-	struct ma35_pin_setting *setting = grp->settings;
+	struct group_desc *grp = &npctl->groups[group];
+	struct ma35_pin_setting *setting = grp->data;
 	u32 i, regval;
 
 	dev_dbg(npctl->dev, "enable function %s group %s\n",
-		npctl->functions[selector].name, npctl->groups[group].name);
+		npctl->functions[selector].name, grp->grp.name);
 
-	for (i = 0; i < grp->npins; i++) {
+	for (i = 0; i < grp->grp.npins; i++) {
 		regmap_read(npctl->regmap, setting->offset, &regval);
 		regval &= ~GENMASK(setting->shift + MA35_MFP_BITS_PER_PORT - 1,
 				   setting->shift);
@@ -980,17 +976,16 @@ static const struct pinconf_ops ma35_pinconf_ops = {
 	.is_generic = true,
 };
 
-static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_group *grp,
+static int ma35_pinctrl_parse_groups(struct device_node *np, struct group_desc *grp,
 				     struct ma35_pinctrl *npctl, u32 index)
 {
 	struct ma35_pin_setting *pin;
 	unsigned long *configs;
 	unsigned int nconfigs;
+	unsigned int *pins;
 	int i, j, count, ret;
 	u32 *elems;
 
-	grp->name = np->name;
-
 	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &nconfigs);
 	if (ret)
 		return ret;
@@ -1003,21 +998,22 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_gro
 	if (!elems)
 		return -ENOMEM;
 
+	grp->grp.name = np->name;
+
 	ret = of_property_read_u32_array(np, "nuvoton,pins", elems, count);
 	if (ret)
 		return -EINVAL;
+	grp->grp.npins = count / 3;
 
-	grp->npins = count / 3;
-
-	grp->pins = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
-	if (!grp->pins)
+	pins = devm_kcalloc(npctl->dev, grp->grp.npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
 		return -ENOMEM;
+	grp->grp.pins = pins;
 
-	grp->settings = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->settings), GFP_KERNEL);
-	if (!grp->settings)
+	pin = devm_kcalloc(npctl->dev, grp->grp.npins, sizeof(*pin), GFP_KERNEL);
+	if (!pin)
 		return -ENOMEM;
-
-	pin = grp->settings;
+	grp->data = pin;
 
 	for (i = 0, j = 0; i < count; i += 3, j++) {
 		pin->offset = elems[i] * MA35_MFP_REG_SZ_PER_BANK + MA35_MFP_REG_BASE;
@@ -1025,7 +1021,7 @@ static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_gro
 		pin->muxval = elems[i + 2];
 		pin->configs = configs;
 		pin->nconfigs = nconfigs;
-		grp->pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
+		pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
 		pin++;
 	}
 	return 0;
@@ -1036,7 +1032,7 @@ static int ma35_pinctrl_parse_functions(struct device_node *np, struct ma35_pinc
 {
 	struct device_node *child;
 	struct pinfunction *func;
-	struct ma35_pin_group *grp;
+	struct group_desc *grp;
 	static u32 grp_index;
 	const char **groups;
 	u32 ret, i = 0;
-- 
2.47.2

