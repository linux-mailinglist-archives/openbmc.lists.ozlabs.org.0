Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C791F803995
	for <lists+openbmc@lfdr.de>; Mon,  4 Dec 2023 17:05:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MxfaLNbl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkT5l1pQrz3dBb
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 03:05:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MxfaLNbl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkT2c0dp6z2yps
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 03:02:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701705753; x=1733241753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GcznTEzkYh7381dOAmLl/g2Ovk3HvI9vfBlGPtxsvN8=;
  b=MxfaLNblezN7JIxn0nG61g0ncAqrxhpdgotIt7tIk2u636ElSTPgzQ+Y
   q8cuaXAru0sF/7X4UeyXXQP/zLFEy1WA8KLfOJXwu1Z0mi8NtIHg3EoO5
   vrH9UjXx6nduxRdapNWt+0dCMV9WV33MZPw9DrbNKC4sBxZjmR9nkvTki
   gvnShsRHJ9xvtW75vxM2ResmPzuRvNQx94sBw7dMivt9Qkkd1ksJl2iUd
   uA1J6ENPaKxK72ZBfgwddr0OJT36R2aAvYvJfm4E/SflyrwzLC8klRUqA
   4tc7nJqp+hbkOaFjABaNtvxIgrKzeh0HuRKC/jpLtu1jh4MZ2g09Cbo0K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="807875"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="807875"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 08:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="774297204"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="774297204"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 04 Dec 2023 08:00:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1DF2FA02; Mon,  4 Dec 2023 18:00:43 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 3/5] pinctrl: equilibrium: Convert to use struct pingroup
Date: Mon,  4 Dec 2023 17:56:34 +0200
Message-ID: <20231204160033.1872569-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
References: <20231204160033.1872569-1-andriy.shevchenko@linux.intel.com>
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
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The pin control header provides struct pingroup.
Utilize it instead of open coded variants in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index fd59cfdeefac..4ebae516d1b1 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -705,7 +705,7 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 	struct device *dev = drvdata->dev;
 	struct device_node *node = dev->of_node;
 	unsigned int *pins, *pinmux, pin_id, pinmux_id;
-	struct group_desc group;
+	struct pingroup group, *grp = &group;
 	struct device_node *np;
 	struct property *prop;
 	int j, err;
@@ -721,49 +721,49 @@ static int eqbr_build_groups(struct eqbr_pinctrl_drv_data *drvdata)
 			of_node_put(np);
 			return err;
 		}
-		group.num_pins = err;
-		group.name = prop->value;
-		pins = devm_kcalloc(dev, group.num_pins, sizeof(*pins), GFP_KERNEL);
+		grp->npins = err;
+		grp->name = prop->value;
+		pins = devm_kcalloc(dev, grp->npins, sizeof(*pins), GFP_KERNEL);
 		if (!pins) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
-		group.pins = pins;
+		grp->pins = pins;
 
-		pinmux = devm_kcalloc(dev, group.num_pins, sizeof(*pinmux), GFP_KERNEL);
+		pinmux = devm_kcalloc(dev, grp->npins, sizeof(*pinmux), GFP_KERNEL);
 		if (!pinmux) {
 			of_node_put(np);
 			return -ENOMEM;
 		}
 
-		for (j = 0; j < group.num_pins; j++) {
+		for (j = 0; j < grp->npins; j++) {
 			if (of_property_read_u32_index(np, "pins", j, &pin_id)) {
 				dev_err(dev, "Group %s: Read intel pins id failed\n",
-					group.name);
+					grp->name);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			if (pin_id >= drvdata->pctl_desc.npins) {
 				dev_err(dev, "Group %s: Invalid pin ID, idx: %d, pin %u\n",
-					group.name, j, pin_id);
+					grp->name, j, pin_id);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			pins[j] = pin_id;
 			if (of_property_read_u32_index(np, "pinmux", j, &pinmux_id)) {
 				dev_err(dev, "Group %s: Read intel pinmux id failed\n",
-					group.name);
+					grp->name);
 				of_node_put(np);
 				return -EINVAL;
 			}
 			pinmux[j] = pinmux_id;
 		}
 
-		err = pinctrl_generic_add_group(drvdata->pctl_dev, group.name,
-						group.pins, group.num_pins,
+		err = pinctrl_generic_add_group(drvdata->pctl_dev,
+						grp->name, grp->pins, grp->npins,
 						pinmux);
 		if (err < 0) {
-			dev_err(dev, "Failed to register group %s\n", group.name);
+			dev_err(dev, "Failed to register group %s\n", grp->name);
 			of_node_put(np);
 			return err;
 		}
-- 
2.43.0.rc1.1.gbec44491f096

