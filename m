Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4656344
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 09:24:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZKG45nfzDqZw
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2019 17:24:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oiD6cueS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="IdlHA7Ln"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZ7y2RdrzDqXl;
 Wed, 26 Jun 2019 17:16:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A84601DB0;
 Wed, 26 Jun 2019 03:16:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 26 Jun 2019 03:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
 3njZDwYYs7bLJ2uLmxQtgdDrfKxdUCSsFndXalV7J9k=; b=oiD6cueSElf3jLa6
 dIWfb+N4OCfUnqqUm2ufl7Eec+1nqzVe24Ip+tz9z/gNhk8EoBetmk8CU/xd1pBQ
 uMqrh28ssaIsb8rhKImoo6An1hTBr7KX5H8BNyJLBLPgIRU20KM6b8/RjJf7zJ4D
 AjyEhFD8zHuzobARHGU/Oiq2s1H/UeNjIo0L8O8WICAp75McCnd6GIztAza9MoYp
 IR1WdqFgXFYqkJU5fp7ayQMVuELWBAY+FMRgTAUKSGa5izUngCzkky8k8QAbhu4T
 0/eX/vdMD391VkDTC5wOebKurC5q0igurauqmfHSPrOAqe64Rfw+zIfVTOTnUeV1
 X608cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=3njZDwYYs7bLJ2uLmxQtgdDrfKxdUCSsFndXalV7J
 9k=; b=IdlHA7LnbfDfur6WQEwYBzMbVyZQIT6vHerO5ZVUYQxyBYv4CettvRdT7
 WqBAbnEyozBI1DXrwPjxkwMx69bYoXRMu7EQ+1E5IiduXtgt07PYXHItNvW7I/2P
 1PkagGC4zAGVg34IZJpzZx6j9PbpB5ia9fcsTx7dyUZ7M29BpCIeWeQWjUEOQDBK
 nsBLASssLDJ0cGuebaZL8oLxKh74ZZsebglvkv8v4PvGC422Of4NJtCodNcrWP1c
 M6AdGFkzmHSb7hROkYBLHSOaxBkY7akgVwIDSa0H7pB2TLyMKqF4/0uKFLgskcf4
 W5E4kdlpL054+CXaveKz3w5t4zDGA==
X-ME-Sender: <xms:uxsTXQuj-AJXHompQXPRTqVmRUlmiNaICmfBW9ifxhyiYldPjcjgPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhggtgfgsehtke
 ertdertdejnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucfkphepvddtvddrkedurddukedrfedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:uxsTXYmw5wUaM9ibB8t4a7iS8XXtjHDTY0Sak9fucTO2twpOi2FIsA>
 <xmx:uxsTXbKEZo3Uw_ERoSdHVMYgbG9G2M97q7JgKVU2DOf32EI2OaZEsg>
 <xmx:uxsTXSdaiPaRkCTGpkB6sLP2jeEYi9rHX1gnl7ZVriO6l06DbMqu5g>
 <xmx:uxsTXQv6HvEDVSCwnLN0c563iuuBYZmjL5dG5X-z1fKSwFJ9FaO7nA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 05AAB380085;
 Wed, 26 Jun 2019 03:16:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH 7/8] pinctrl: aspeed: Split out pinmux from general pinctrl
Date: Wed, 26 Jun 2019 16:44:29 +0930
Message-Id: <20190626071430.28556-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626071430.28556-1-andrew@aj.id.au>
References: <20190626071430.28556-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ASPEED have completely rearranged the System Control Unit register
layout with the AST2600. The existing code took advantage of the fact
that the AST2400 and AST2500 had layouts that were similar enough to
have little impact on the pinmux infrastructure (though there is a wart
with read-modify-write vs write-1-clear semantics of the hardware
strapping registers between the two).

Given that any similarity has been thrown out with the AST2600, separate
out the function applying an expression state to be driver-specific.
With it, extract out the pinmux macro jungle to its own header and
implementation so the pieces can be composed without dependency cycles.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/Makefile            |   2 +-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c |  94 +++-
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 123 ++++-
 drivers/pinctrl/aspeed/pinctrl-aspeed.c    | 250 ++--------
 drivers/pinctrl/aspeed/pinctrl-aspeed.h    | 548 +--------------------
 drivers/pinctrl/aspeed/pinmux-aspeed.c     |  96 ++++
 drivers/pinctrl/aspeed/pinmux-aspeed.h     | 539 ++++++++++++++++++++
 7 files changed, 892 insertions(+), 760 deletions(-)
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.c
 create mode 100644 drivers/pinctrl/aspeed/pinmux-aspeed.h

diff --git a/drivers/pinctrl/aspeed/Makefile b/drivers/pinctrl/aspeed/Makefile
index 068729bf4f86..ea8962645e49 100644
--- a/drivers/pinctrl/aspeed/Makefile
+++ b/drivers/pinctrl/aspeed/Makefile
@@ -2,6 +2,6 @@
 # Aspeed pinctrl support
 
 ccflags-y += $(call cc-option,-Woverride-init)
-obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o
+obj-$(CONFIG_PINCTRL_ASPEED)	+= pinctrl-aspeed.o pinmux-aspeed.o
 obj-$(CONFIG_PINCTRL_ASPEED_G4)	+= pinctrl-aspeed-g4.o
 obj-$(CONFIG_PINCTRL_ASPEED_G5)	+= pinctrl-aspeed-g5.o
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index 73e2c9c0e549..384396cbb22d 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -18,8 +18,34 @@
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
+#include "pinmux-aspeed.h"
 #include "pinctrl-aspeed.h"
 
+/*
+ * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
+ * references registers by the device/offset mnemonic. The register macros
+ * below are named the same way to ease transcription and verification (as
+ * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
+ * reference registers beyond those dedicated to pinmux, such as the system
+ * reset control and MAC clock configuration registers.
+ */
+#define SCU2C           0x2C /* Misc. Control Register */
+#define SCU3C           0x3C /* System Reset Control/Status Register */
+#define SCU48           0x48 /* MAC Interface Clock Delay Setting */
+#define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is split */
+#define HW_REVISION_ID  0x7C /* Silicon revision ID register */
+#define SCU80           0x80 /* Multi-function Pin Control #1 */
+#define SCU84           0x84 /* Multi-function Pin Control #2 */
+#define SCU88           0x88 /* Multi-function Pin Control #3 */
+#define SCU8C           0x8C /* Multi-function Pin Control #4 */
+#define SCU90           0x90 /* Multi-function Pin Control #5 */
+#define SCU94           0x94 /* Multi-function Pin Control #6 */
+#define SCUA0           0xA0 /* Multi-function Pin Control #7 */
+#define SCUA4           0xA4 /* Multi-function Pin Control #8 */
+#define SCUA8           0xA8 /* Multi-function Pin Control #9 */
+#define SCUAC           0xAC /* Multi-function Pin Control #10 */
+#define HW_STRAP2       0xD0 /* Strapping */
+
 /*
  * Uses undefined macros for symbol naming and references, eg GPIOA0, MAC1LINK,
  * TIMER3 etc.
@@ -2386,13 +2412,73 @@ static const struct aspeed_pin_config aspeed_g4_configs[] = {
 	{ PIN_CONFIG_INPUT_DEBOUNCE, { C14, B14 }, SCUA8, 27 },
 };
 
+static int aspeed_g4_sig_expr_set(const struct aspeed_pinmux_data *ctx,
+				  const struct aspeed_sig_expr *expr,
+				  bool enable)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < expr->ndescs; i++) {
+		const struct aspeed_sig_desc *desc = &expr->descs[i];
+		u32 pattern = enable ? desc->enable : desc->disable;
+		u32 val = (pattern << __ffs(desc->mask));
+
+		if (!ctx->maps[desc->ip])
+			return -ENODEV;
+
+		/*
+		 * Strap registers are configured in hardware or by early-boot
+		 * firmware. Treat them as read-only despite that we can write
+		 * them. This may mean that certain functions cannot be
+		 * deconfigured and is the reason we re-evaluate after writing
+		 * all descriptor bits.
+		 *
+		 * Port D and port E GPIO loopback modes are the only exception
+		 * as those are commonly used with front-panel buttons to allow
+		 * normal operation of the host when the BMC is powered off or
+		 * fails to boot. Once the BMC has booted, the loopback mode
+		 * must be disabled for the BMC to control host power-on and
+		 * reset.
+		 */
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
+		    !(desc->mask & (BIT(21) | BIT(22))))
+			continue;
+
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
+			continue;
+
+		ret = regmap_update_bits(ctx->maps[desc->ip], desc->reg,
+					 desc->mask, val);
+
+		if (ret)
+			return ret;
+	}
+
+	ret = aspeed_sig_expr_eval(ctx, expr, enable);
+	if (ret < 0)
+		return ret;
+
+	if (!ret)
+		return -EPERM;
+
+	return 0;
+}
+
+static const struct aspeed_pinmux_ops aspeed_g4_ops = {
+	.set = aspeed_g4_sig_expr_set,
+};
+
 static struct aspeed_pinctrl_data aspeed_g4_pinctrl_data = {
 	.pins = aspeed_g4_pins,
 	.npins = ARRAY_SIZE(aspeed_g4_pins),
-	.groups = aspeed_g4_groups,
-	.ngroups = ARRAY_SIZE(aspeed_g4_groups),
-	.functions = aspeed_g4_functions,
-	.nfunctions = ARRAY_SIZE(aspeed_g4_functions),
+	.pinmux = {
+		.ops = &aspeed_g4_ops,
+		.groups = aspeed_g4_groups,
+		.ngroups = ARRAY_SIZE(aspeed_g4_groups),
+		.functions = aspeed_g4_functions,
+		.nfunctions = ARRAY_SIZE(aspeed_g4_functions),
+	},
 	.configs = aspeed_g4_configs,
 	.nconfigs = ARRAY_SIZE(aspeed_g4_configs),
 };
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index aa7e148b38bb..e20e2a259141 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -21,6 +21,32 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-aspeed.h"
 
+/*
+ * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
+ * references registers by the device/offset mnemonic. The register macros
+ * below are named the same way to ease transcription and verification (as
+ * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
+ * reference registers beyond those dedicated to pinmux, such as the system
+ * reset control and MAC clock configuration registers. The AST2500 goes a step
+ * further and references registers in the graphics IP block.
+ */
+#define SCU2C           0x2C /* Misc. Control Register */
+#define SCU3C           0x3C /* System Reset Control/Status Register */
+#define SCU48           0x48 /* MAC Interface Clock Delay Setting */
+#define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is split */
+#define HW_REVISION_ID  0x7C /* Silicon revision ID register */
+#define SCU80           0x80 /* Multi-function Pin Control #1 */
+#define SCU84           0x84 /* Multi-function Pin Control #2 */
+#define SCU88           0x88 /* Multi-function Pin Control #3 */
+#define SCU8C           0x8C /* Multi-function Pin Control #4 */
+#define SCU90           0x90 /* Multi-function Pin Control #5 */
+#define SCU94           0x94 /* Multi-function Pin Control #6 */
+#define SCUA0           0xA0 /* Multi-function Pin Control #7 */
+#define SCUA4           0xA4 /* Multi-function Pin Control #8 */
+#define SCUA8           0xA8 /* Multi-function Pin Control #9 */
+#define SCUAC           0xAC /* Multi-function Pin Control #10 */
+#define HW_STRAP2       0xD0 /* Strapping */
+
 #define ASPEED_G5_NR_PINS 236
 
 #define COND1		{ ASPEED_IP_SCU, SCU90, BIT(6), 0, 0 }
@@ -2477,13 +2503,98 @@ static struct aspeed_pin_config aspeed_g5_configs[] = {
 	{ PIN_CONFIG_INPUT_DEBOUNCE, { A20, B19 }, SCUA8, 27 },
 };
 
+/**
+ * Configure a pin's signal by applying an expression's descriptor state for
+ * all descriptors in the expression.
+ *
+ * @ctx: The pinmux context
+ * @expr: The expression associated with the function whose signal is to be
+ *        configured
+ * @enable: true to enable an function's signal through a pin's signal
+ *          expression, false to disable the function's signal
+ *
+ * Return: 0 if the expression is configured as requested and a negative error
+ * code otherwise
+ */
+static int aspeed_g5_sig_expr_set(const struct aspeed_pinmux_data *ctx,
+				  const struct aspeed_sig_expr *expr,
+				  bool enable)
+{
+	int ret;
+	int i;
+
+	for (i = 0; i < expr->ndescs; i++) {
+		const struct aspeed_sig_desc *desc = &expr->descs[i];
+		u32 pattern = enable ? desc->enable : desc->disable;
+		u32 val = (pattern << __ffs(desc->mask));
+
+		if (!ctx->maps[desc->ip])
+			return -ENODEV;
+
+		/*
+		 * Strap registers are configured in hardware or by early-boot
+		 * firmware. Treat them as read-only despite that we can write
+		 * them. This may mean that certain functions cannot be
+		 * deconfigured and is the reason we re-evaluate after writing
+		 * all descriptor bits.
+		 *
+		 * Port D and port E GPIO loopback modes are the only exception
+		 * as those are commonly used with front-panel buttons to allow
+		 * normal operation of the host when the BMC is powered off or
+		 * fails to boot. Once the BMC has booted, the loopback mode
+		 * must be disabled for the BMC to control host power-on and
+		 * reset.
+		 */
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
+		    !(desc->mask & (BIT(21) | BIT(22))))
+			continue;
+
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
+			continue;
+
+		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
+		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
+			u32 value = ~val & desc->mask;
+
+			if (value) {
+				ret = regmap_write(ctx->maps[desc->ip],
+						   HW_REVISION_ID, value);
+				if (ret < 0)
+					return ret;
+			}
+		}
+
+		ret = regmap_update_bits(ctx->maps[desc->ip], desc->reg,
+					 desc->mask, val);
+
+		if (ret)
+			return ret;
+	}
+
+	ret = aspeed_sig_expr_eval(ctx, expr, enable);
+	if (ret < 0)
+		return ret;
+
+	if (!ret)
+		return -EPERM;
+
+	return 0;
+}
+
+static const struct aspeed_pinmux_ops aspeed_g5_ops = {
+	.set = aspeed_g5_sig_expr_set,
+};
+
 static struct aspeed_pinctrl_data aspeed_g5_pinctrl_data = {
 	.pins = aspeed_g5_pins,
 	.npins = ARRAY_SIZE(aspeed_g5_pins),
-	.groups = aspeed_g5_groups,
-	.ngroups = ARRAY_SIZE(aspeed_g5_groups),
-	.functions = aspeed_g5_functions,
-	.nfunctions = ARRAY_SIZE(aspeed_g5_functions),
+	.pinmux = {
+		.ops = &aspeed_g5_ops,
+		.groups = aspeed_g5_groups,
+		.ngroups = ARRAY_SIZE(aspeed_g5_groups),
+		.functions = aspeed_g5_functions,
+		.nfunctions = ARRAY_SIZE(aspeed_g5_functions),
+	},
 	.configs = aspeed_g5_configs,
 	.nconfigs = ARRAY_SIZE(aspeed_g5_configs),
 };
@@ -2539,7 +2650,7 @@ static int aspeed_g5_pinctrl_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "No GFX phandle found, some mux configurations may fail\n");
 		map = NULL;
 	}
-	aspeed_g5_pinctrl_data.maps[ASPEED_IP_GFX] = map;
+	aspeed_g5_pinctrl_data.pinmux.maps[ASPEED_IP_GFX] = map;
 
 	node = of_parse_phandle(pdev->dev.of_node, "aspeed,external-nodes", 1);
 	if (node) {
@@ -2553,7 +2664,7 @@ static int aspeed_g5_pinctrl_probe(struct platform_device *pdev)
 		map = NULL;
 	}
 	of_node_put(node);
-	aspeed_g5_pinctrl_data.maps[ASPEED_IP_LPC] = map;
+	aspeed_g5_pinctrl_data.pinmux.maps[ASPEED_IP_LPC] = map;
 
 	return aspeed_pinctrl_probe(pdev, &aspeed_g5_pinctrl_desc,
 			&aspeed_g5_pinctrl_data);
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index b510bb475851..18f46177b4af 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -1,7 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2016 IBM Corp.
- */
+/* Copyright (C) 2016 IBM Corp. */
 
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
@@ -10,17 +8,11 @@
 #include "../core.h"
 #include "pinctrl-aspeed.h"
 
-static const char *const aspeed_pinmux_ips[] = {
-	[ASPEED_IP_SCU] = "SCU",
-	[ASPEED_IP_GFX] = "GFX",
-	[ASPEED_IP_LPC] = "LPC",
-};
-
 int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->ngroups;
+	return pdata->pinmux.ngroups;
 }
 
 const char *aspeed_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
@@ -28,7 +20,7 @@ const char *aspeed_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->groups[group].name;
+	return pdata->pinmux.groups[group].name;
 }
 
 int aspeed_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
@@ -37,8 +29,8 @@ int aspeed_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = &pdata->groups[group].pins[0];
-	*npins = pdata->groups[group].npins;
+	*pins = &pdata->pinmux.groups[group].pins[0];
+	*npins = pdata->pinmux.groups[group].npins;
 
 	return 0;
 }
@@ -53,7 +45,7 @@ int aspeed_pinmux_get_fn_count(struct pinctrl_dev *pctldev)
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->nfunctions;
+	return pdata->pinmux.nfunctions;
 }
 
 const char *aspeed_pinmux_get_fn_name(struct pinctrl_dev *pctldev,
@@ -61,7 +53,7 @@ const char *aspeed_pinmux_get_fn_name(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->functions[function].name;
+	return pdata->pinmux.functions[function].name;
 }
 
 int aspeed_pinmux_get_fn_groups(struct pinctrl_dev *pctldev,
@@ -71,208 +63,38 @@ int aspeed_pinmux_get_fn_groups(struct pinctrl_dev *pctldev,
 {
 	struct aspeed_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	*groups = pdata->functions[function].groups;
-	*num_groups = pdata->functions[function].ngroups;
+	*groups = pdata->pinmux.functions[function].groups;
+	*num_groups = pdata->pinmux.functions[function].ngroups;
 
 	return 0;
 }
 
-static inline void aspeed_sig_desc_print_val(
-		const struct aspeed_sig_desc *desc, bool enable, u32 rv)
-{
-	pr_debug("Want %s%X[0x%08X]=0x%X, got 0x%X from 0x%08X\n",
-			aspeed_pinmux_ips[desc->ip], desc->reg,
-			desc->mask, enable ? desc->enable : desc->disable,
-			(rv & desc->mask) >> __ffs(desc->mask), rv);
-}
-
-/**
- * Query the enabled or disabled state of a signal descriptor
- *
- * @desc: The signal descriptor of interest
- * @enabled: True to query the enabled state, false to query disabled state
- * @map: The IP block's regmap instance
- *
- * Return: 1 if the descriptor's bitfield is configured to the state
- * selected by @enabled, 0 if not, and less than zero if an unrecoverable
- * failure occurred
- *
- * Evaluation of descriptor state is non-trivial in that it is not a binary
- * outcome: The bitfields can be greater than one bit in size and thus can take
- * a value that is neither the enabled nor disabled state recorded in the
- * descriptor (typically this means a different function to the one of interest
- * is enabled). Thus we must explicitly test for either condition as required.
- */
-static int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
-				 bool enabled, struct regmap *map)
-{
-	int ret;
-	unsigned int raw;
-	u32 want;
-
-	if (!map)
-		return -ENODEV;
-
-	ret = regmap_read(map, desc->reg, &raw);
-	if (ret)
-		return ret;
-
-	aspeed_sig_desc_print_val(desc, enabled, raw);
-	want = enabled ? desc->enable : desc->disable;
-
-	return ((raw & desc->mask) >> __ffs(desc->mask)) == want;
-}
-
-/**
- * Query the enabled or disabled state for a mux function's signal on a pin
- *
- * @expr: An expression controlling the signal for a mux function on a pin
- * @enabled: True to query the enabled state, false to query disabled state
- * @maps: The list of regmap instances
- *
- * Return: 1 if the expression composed by @enabled evaluates true, 0 if not,
- * and less than zero if an unrecoverable failure occurred.
- *
- * A mux function is enabled or disabled if the function's signal expression
- * for each pin in the function's pin group evaluates true for the desired
- * state. An signal expression evaluates true if all of its associated signal
- * descriptors evaluate true for the desired state.
- *
- * If an expression's state is described by more than one bit, either through
- * multi-bit bitfields in a single signal descriptor or through multiple signal
- * descriptors of a single bit then it is possible for the expression to be in
- * neither the enabled nor disabled state. Thus we must explicitly test for
- * either condition as required.
- */
-static int aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
-				 bool enabled, struct regmap * const *maps)
-{
-	int i;
-	int ret;
-
-	for (i = 0; i < expr->ndescs; i++) {
-		const struct aspeed_sig_desc *desc = &expr->descs[i];
-
-		ret = aspeed_sig_desc_eval(desc, enabled, maps[desc->ip]);
-		if (ret <= 0)
-			return ret;
-	}
-
-	return 1;
-}
-
-/**
- * Configure a pin's signal by applying an expression's descriptor state for
- * all descriptors in the expression.
- *
- * @expr: The expression associated with the function whose signal is to be
- *        configured
- * @enable: true to enable an function's signal through a pin's signal
- *          expression, false to disable the function's signal
- * @maps: The list of regmap instances for pinmux register access.
- *
- * Return: 0 if the expression is configured as requested and a negative error
- * code otherwise
- */
-static int aspeed_sig_expr_set(const struct aspeed_sig_expr *expr,
-				bool enable, struct regmap * const *maps)
-{
-	int ret;
-	int i;
-
-	for (i = 0; i < expr->ndescs; i++) {
-		const struct aspeed_sig_desc *desc = &expr->descs[i];
-		u32 pattern = enable ? desc->enable : desc->disable;
-		u32 val = (pattern << __ffs(desc->mask));
-
-		if (!maps[desc->ip])
-			return -ENODEV;
-
-		/*
-		 * Strap registers are configured in hardware or by early-boot
-		 * firmware. Treat them as read-only despite that we can write
-		 * them. This may mean that certain functions cannot be
-		 * deconfigured and is the reason we re-evaluate after writing
-		 * all descriptor bits.
-		 *
-		 * Port D and port E GPIO loopback modes are the only exception
-		 * as those are commonly used with front-panel buttons to allow
-		 * normal operation of the host when the BMC is powered off or
-		 * fails to boot. Once the BMC has booted, the loopback mode
-		 * must be disabled for the BMC to control host power-on and
-		 * reset.
-		 */
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
-		    !(desc->mask & (BIT(21) | BIT(22))))
-			continue;
-
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
-			continue;
-
-		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
-			unsigned int rev_id;
-
-			ret = regmap_read(maps[ASPEED_IP_SCU],
-				HW_REVISION_ID, &rev_id);
-			if (ret < 0)
-				return ret;
-
-			if (0x04 == (rev_id >> 24)) {
-				u32 value = ~val & desc->mask;
-
-				if (value) {
-					ret = regmap_write(maps[desc->ip],
-						HW_REVISION_ID, value);
-					if (ret < 0)
-						return ret;
-				}
-			}
-		}
-
-		ret = regmap_update_bits(maps[desc->ip], desc->reg,
-					 desc->mask, val);
-
-		if (ret)
-			return ret;
-	}
-
-	ret = aspeed_sig_expr_eval(expr, enable, maps);
-	if (ret < 0)
-		return ret;
-
-	if (!ret)
-		return -EPERM;
-
-	return 0;
-}
-
-static int aspeed_sig_expr_enable(const struct aspeed_sig_expr *expr,
-				   struct regmap * const *maps)
+static int aspeed_sig_expr_enable(const struct aspeed_pinmux_data *ctx,
+				  const struct aspeed_sig_expr *expr)
 {
 	int ret;
 
-	ret = aspeed_sig_expr_eval(expr, true, maps);
+	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
 
 	if (!ret)
-		return aspeed_sig_expr_set(expr, true, maps);
+		return aspeed_sig_expr_set(ctx, expr, true);
 
 	return 0;
 }
 
-static int aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
-				    struct regmap * const *maps)
+static int aspeed_sig_expr_disable(const struct aspeed_pinmux_data *ctx,
+				   const struct aspeed_sig_expr *expr)
 {
 	int ret;
 
-	ret = aspeed_sig_expr_eval(expr, true, maps);
+	ret = aspeed_sig_expr_eval(ctx, expr, true);
 	if (ret < 0)
 		return ret;
 
 	if (ret)
-		return aspeed_sig_expr_set(expr, false, maps);
+		return aspeed_sig_expr_set(ctx, expr, false);
 
 	return 0;
 }
@@ -280,13 +102,13 @@ static int aspeed_sig_expr_disable(const struct aspeed_sig_expr *expr,
 /**
  * Disable a signal on a pin by disabling all provided signal expressions.
  *
+ * @ctx: The pinmux context
  * @exprs: The list of signal expressions (from a priority level on a pin)
- * @maps: The list of regmap instances for pinmux register access.
  *
  * Return: 0 if all expressions are disabled, otherwise a negative error code
  */
-static int aspeed_disable_sig(const struct aspeed_sig_expr **exprs,
-			       struct regmap * const *maps)
+static int aspeed_disable_sig(const struct aspeed_pinmux_data *ctx,
+			      const struct aspeed_sig_expr **exprs)
 {
 	int ret = 0;
 
@@ -294,7 +116,7 @@ static int aspeed_disable_sig(const struct aspeed_sig_expr **exprs,
 		return true;
 
 	while (*exprs && !ret) {
-		ret = aspeed_sig_expr_disable(*exprs, maps);
+		ret = aspeed_sig_expr_disable(ctx, *exprs);
 		exprs++;
 	}
 
@@ -395,9 +217,9 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	int ret;
 	const struct aspeed_pinctrl_data *pdata =
 		pinctrl_dev_get_drvdata(pctldev);
-	const struct aspeed_pin_group *pgroup = &pdata->groups[group];
+	const struct aspeed_pin_group *pgroup = &pdata->pinmux.groups[group];
 	const struct aspeed_pin_function *pfunc =
-		&pdata->functions[function];
+		&pdata->pinmux.functions[function];
 
 	for (i = 0; i < pgroup->npins; i++) {
 		int pin = pgroup->pins[i];
@@ -423,7 +245,7 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 			if (expr)
 				break;
 
-			ret = aspeed_disable_sig(funcs, pdata->maps);
+			ret = aspeed_disable_sig(&pdata->pinmux, funcs);
 			if (ret)
 				return ret;
 
@@ -443,7 +265,7 @@ int aspeed_pinmux_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 			return -ENXIO;
 		}
 
-		ret = aspeed_sig_expr_enable(expr, pdata->maps);
+		ret = aspeed_sig_expr_enable(&pdata->pinmux, expr);
 		if (ret)
 			return ret;
 	}
@@ -500,7 +322,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 		if (aspeed_gpio_in_exprs(funcs))
 			break;
 
-		ret = aspeed_disable_sig(funcs, pdata->maps);
+		ret = aspeed_disable_sig(&pdata->pinmux, funcs);
 		if (ret)
 			return ret;
 
@@ -531,7 +353,7 @@ int aspeed_gpio_request_enable(struct pinctrl_dev *pctldev,
 	 * If GPIO is not the lowest priority signal type, assume there is only
 	 * one expression defined to enable the GPIO function
 	 */
-	return aspeed_sig_expr_enable(expr, pdata->maps);
+	return aspeed_sig_expr_enable(&pdata->pinmux, expr);
 }
 
 int aspeed_pinctrl_probe(struct platform_device *pdev,
@@ -547,12 +369,14 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 		return -ENODEV;
 	}
 
-	pdata->maps[ASPEED_IP_SCU] = syscon_node_to_regmap(parent->of_node);
-	if (IS_ERR(pdata->maps[ASPEED_IP_SCU])) {
+	pdata->scu = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR(pdata->scu)) {
 		dev_err(&pdev->dev, "No regmap for syscon pincontroller parent\n");
-		return PTR_ERR(pdata->maps[ASPEED_IP_SCU]);
+		return PTR_ERR(pdata->scu);
 	}
 
+	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
+
 	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
 
 	if (IS_ERR(pctl)) {
@@ -587,7 +411,9 @@ static inline const struct aspeed_pin_config *find_pinconf_config(
 	return NULL;
 }
 
-/**
+/*
+ * Aspeed pin configuration description.
+ *
  * @param: pinconf configuration parameter
  * @arg: The supported argument for @param, or -1 if any value is supported
  * @val: The register value to write to configure @arg for @param
@@ -661,7 +487,7 @@ int aspeed_pin_config_get(struct pinctrl_dev *pctldev, unsigned int offset,
 	if (!pconf)
 		return -ENOTSUPP;
 
-	rc = regmap_read(pdata->maps[ASPEED_IP_SCU], pconf->reg, &val);
+	rc = regmap_read(pdata->scu, pconf->reg, &val);
 	if (rc < 0)
 		return rc;
 
@@ -716,8 +542,8 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 
 		val = pmap->val << pconf->bit;
 
-		rc = regmap_update_bits(pdata->maps[ASPEED_IP_SCU], pconf->reg,
-				BIT(pconf->bit), val);
+		rc = regmap_update_bits(pdata->scu, pconf->reg,
+					BIT(pconf->bit), val);
 
 		if (rc < 0)
 			return rc;
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.h b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
index c5918c4a087c..11cc0eb6666b 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.h
@@ -1,514 +1,15 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2016 IBM Corp.
- */
+/* Copyright (C) 2016,2019 IBM Corp. */
 
 #ifndef PINCTRL_ASPEED
 #define PINCTRL_ASPEED
 
+#include "pinmux-aspeed.h"
+
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/regmap.h>
-
-/*
- * The ASPEED SoCs provide typically more than 200 pins for GPIO and other
- * functions. The SoC function enabled on a pin is determined on a priority
- * basis where a given pin can provide a number of different signal types.
- *
- * The signal active on a pin is described by both a priority level and
- * compound logical expressions involving multiple operators, registers and
- * bits. Some difficulty arises as the pin's function bit masks for each
- * priority level are frequently not the same (i.e. cannot just flip a bit to
- * change from a high to low priority signal), or even in the same register.
- * Further, not all signals can be unmuxed, as some expressions depend on
- * values in the hardware strapping register (which is treated as read-only).
- *
- * SoC Multi-function Pin Expression Examples
- * ------------------------------------------
- *
- * Here are some sample mux configurations from the AST2400 and AST2500
- * datasheets to illustrate the corner cases, roughly in order of least to most
- * corner. The signal priorities are in decending order from P0 (highest).
- *
- * D6 is a pin with a single function (beside GPIO); a high priority signal
- * that participates in one function:
- *
- * Ball | Default | P0 Signal | P0 Expression               | P1 Signal | P1 Expression | Other
- * -----+---------+-----------+-----------------------------+-----------+---------------+----------
- *  D6    GPIOA0    MAC1LINK    SCU80[0]=1                                                GPIOA0
- * -----+---------+-----------+-----------------------------+-----------+---------------+----------
- *
- * C5 is a multi-signal pin (high and low priority signals). Here we touch
- * different registers for the different functions that enable each signal:
- *
- * -----+---------+-----------+-----------------------------+-----------+---------------+----------
- *  C5    GPIOA4    SCL9        SCU90[22]=1                   TIMER5      SCU80[4]=1      GPIOA4
- * -----+---------+-----------+-----------------------------+-----------+---------------+----------
- *
- * E19 is a single-signal pin with two functions that influence the active
- * signal. In this case both bits have the same meaning - enable a dedicated
- * LPC reset pin. However it's not always the case that the bits in the
- * OR-relationship have the same meaning.
- *
- * -----+---------+-----------+-----------------------------+-----------+---------------+----------
- *  E19   GPIOB4    LPCRST#     SCU80[12]=1 | Strap[14]=1                                 GPIOB4
- * -----+---------+-----------+-----------------------------+-----------+---------------+----------
- *
- * For example, pin B19 has a low-priority signal that's enabled by two
- * distinct SoC functions: A specific SIOPBI bit in register SCUA4, and an ACPI
- * bit in the STRAP register. The ACPI bit configures signals on pins in
- * addition to B19. Both of the low priority functions as well as the high
- * priority function must be disabled for GPIOF1 to be used.
- *
- * Ball | Default | P0 Signal | P0 Expression                           | P1 Signal | P1 Expression                          | Other
- * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
- *  B19   GPIOF1    NDCD4       SCU80[25]=1                               SIOPBI#     SCUA4[12]=1 | Strap[19]=0                GPIOF1
- * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
- *
- * For pin E18, the SoC ANDs the expected state of three bits to determine the
- * pin's active signal:
- *
- * * SCU3C[3]: Enable external SOC reset function
- * * SCU80[15]: Enable SPICS1# or EXTRST# function pin
- * * SCU90[31]: Select SPI interface CS# output
- *
- * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
- *  E18   GPIOB7    EXTRST#     SCU3C[3]=1 & SCU80[15]=1 & SCU90[31]=0    SPICS1#     SCU3C[3]=1 & SCU80[15]=1 & SCU90[31]=1   GPIOB7
- * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
- *
- * (Bits SCU3C[3] and SCU80[15] appear to only be used in the expressions for
- * selecting the signals on pin E18)
- *
- * Pin T5 is a multi-signal pin with a more complex configuration:
- *
- * Ball | Default | P0 Signal | P0 Expression                | P1 Signal | P1 Expression | Other
- * -----+---------+-----------+------------------------------+-----------+---------------+----------
- *  T5    GPIOL1    VPIDE       SCU90[5:4]!=0 & SCU84[17]=1    NDCD1       SCU84[17]=1     GPIOL1
- * -----+---------+-----------+------------------------------+-----------+---------------+----------
- *
- * The high priority signal configuration is best thought of in terms of its
- * exploded form, with reference to the SCU90[5:4] bits:
- *
- * * SCU90[5:4]=00: disable
- * * SCU90[5:4]=01: 18 bits (R6/G6/B6) video mode.
- * * SCU90[5:4]=10: 24 bits (R8/G8/B8) video mode.
- * * SCU90[5:4]=11: 30 bits (R10/G10/B10) video mode.
- *
- * Re-writing:
- *
- * -----+---------+-----------+------------------------------+-----------+---------------+----------
- *  T5    GPIOL1    VPIDE      (SCU90[5:4]=1 & SCU84[17]=1)    NDCD1       SCU84[17]=1     GPIOL1
- *                             | (SCU90[5:4]=2 & SCU84[17]=1)
- *                             | (SCU90[5:4]=3 & SCU84[17]=1)
- * -----+---------+-----------+------------------------------+-----------+---------------+----------
- *
- * For reference the SCU84[17] bit configure the "UART1 NDCD1 or Video VPIDE
- * function pin", where the signal itself is determined by whether SCU94[5:4]
- * is disabled or in one of the 18, 24 or 30bit video modes.
- *
- * Other video-input-related pins require an explicit state in SCU90[5:4], e.g.
- * W1 and U5:
- *
- * -----+---------+-----------+------------------------------+-----------+---------------+----------
- *  W1    GPIOL6    VPIB0       SCU90[5:4]=3 & SCU84[22]=1     TXD1        SCU84[22]=1     GPIOL6
- *  U5    GPIOL7    VPIB1       SCU90[5:4]=3 & SCU84[23]=1     RXD1        SCU84[23]=1     GPIOL7
- * -----+---------+-----------+------------------------------+-----------+---------------+----------
- *
- * The examples of T5 and W1 are particularly fertile, as they also demonstrate
- * that despite operating as part of the video input bus each signal needs to
- * be enabled individually via it's own SCU84 (in the cases of T5 and W1)
- * register bit. This is a little crazy if the bus doesn't have optional
- * signals, but is used to decent effect with some of the UARTs where not all
- * signals are required. However, this isn't done consistently - UART1 is
- * enabled on a per-pin basis, and by contrast, all signals for UART6 are
- * enabled by a single bit.
- *
- * Further, the high and low priority signals listed in the table above share
- * a configuration bit. The VPI signals should operate in concert in a single
- * function, but the UART signals should retain the ability to be configured
- * independently. This pushes the implementation down the path of tagging a
- * signal's expressions with the function they participate in, rather than
- * defining masks affecting multiple signals per function. The latter approach
- * fails in this instance where applying the configuration for the UART pin of
- * interest will stomp on the state of other UART signals when disabling the
- * VPI functions on the current pin.
- *
- * Ball |  Default   | P0 Signal | P0 Expression             | P1 Signal | P1 Expression | Other
- * -----+------------+-----------+---------------------------+-----------+---------------+------------
- *  A12   RGMII1TXCK   GPIOT0      SCUA0[0]=1                  RMII1TXEN   Strap[6]=0      RGMII1TXCK
- *  B12   RGMII1TXCTL  GPIOT1      SCUA0[1]=1                  –           Strap[6]=0      RGMII1TXCTL
- * -----+------------+-----------+---------------------------+-----------+---------------+------------
- *
- * A12 demonstrates that the "Other" signal isn't always GPIO - in this case
- * GPIOT0 is a high-priority signal and RGMII1TXCK is Other. Thus, GPIO
- * should be treated like any other signal type with full function expression
- * requirements, and not assumed to be the default case. Separately, GPIOT0 and
- * GPIOT1's signal descriptor bits are distinct, therefore we must iterate all
- * pins in the function's group to disable the higher-priority signals such
- * that the signal for the function of interest is correctly enabled.
- *
- * Finally, three priority levels aren't always enough; the AST2500 brings with
- * it 18 pins of five priority levels, however the 18 pins only use three of
- * the five priority levels.
- *
- * Ultimately the requirement to control pins in the examples above drive the
- * design:
- *
- * * Pins provide signals according to functions activated in the mux
- *   configuration
- *
- * * Pins provide up to five signal types in a priority order
- *
- * * For priorities levels defined on a pin, each priority provides one signal
- *
- * * Enabling lower priority signals requires higher priority signals be
- *   disabled
- *
- * * A function represents a set of signals; functions are distinct if their
- *   sets of signals are not equal
- *
- * * Signals participate in one or more functions
- *
- * * A function is described by an expression of one or more signal
- *   descriptors, which compare bit values in a register
- *
- * * A signal expression is the smallest set of signal descriptors whose
- *   comparisons must evaluate 'true' for a signal to be enabled on a pin.
- *
- * * A function's signal is active on a pin if evaluating all signal
- *   descriptors in the pin's signal expression for the function yields a 'true'
- *   result
- *
- * * A signal at a given priority on a given pin is active if any of the
- *   functions in which the signal participates are active, and no higher
- *   priority signal on the pin is active
- *
- * * GPIO is configured per-pin
- *
- * And so:
- *
- * * To disable a signal, any function(s) activating the signal must be
- *   disabled
- *
- * * Each pin must know the signal expressions of functions in which it
- *   participates, for the purpose of enabling the Other function. This is done
- *   by deactivating all functions that activate higher priority signals on the
- *   pin.
- *
- * As a concrete example:
- *
- * * T5 provides three signals types: VPIDE, NDCD1 and GPIO
- *
- * * The VPIDE signal participates in 3 functions: VPI18, VPI24 and VPI30
- *
- * * The NDCD1 signal participates in just its own NDCD1 function
- *
- * * VPIDE is high priority, NDCD1 is low priority, and GPIOL1 is the least
- *   prioritised
- *
- * * The prerequisit for activating the NDCD1 signal is that the VPI18, VPI24
- *   and VPI30 functions all be disabled
- *
- * * Similarly, all of VPI18, VPI24, VPI30 and NDCD1 functions must be disabled
- *   to provide GPIOL6
- *
- * Considerations
- * --------------
- *
- * If pinctrl allows us to allocate a pin we can configure a function without
- * concern for the function of already allocated pins, if pin groups are
- * created with respect to the SoC functions in which they participate. This is
- * intuitive, but it did not feel obvious from the bit/pin relationships.
- *
- * Conversely, failing to allocate all pins in a group indicates some bits (as
- * well as pins) required for the group's configuration will already be in use,
- * likely in a way that's inconsistent with the requirements of the failed
- * group.
- */
-
-#define ASPEED_IP_SCU		0
-#define ASPEED_IP_GFX		1
-#define ASPEED_IP_LPC		2
-#define ASPEED_NR_PINMUX_IPS	3
-
-/*
- * The "Multi-function Pins Mapping and Control" table in the SoC datasheet
- * references registers by the device/offset mnemonic. The register macros
- * below are named the same way to ease transcription and verification (as
- * opposed to naming them e.g. PINMUX_CTRL_[0-9]). Further, signal expressions
- * reference registers beyond those dedicated to pinmux, such as the system
- * reset control and MAC clock configuration registers. The AST2500 goes a step
- * further and references registers in the graphics IP block.
- */
-#define SCU2C           0x2C /* Misc. Control Register */
-#define SCU3C           0x3C /* System Reset Control/Status Register */
-#define SCU48           0x48 /* MAC Interface Clock Delay Setting */
-#define HW_STRAP1       0x70 /* AST2400 strapping is 33 bits, is split */
-#define HW_REVISION_ID  0x7C /* Silicon revision ID register */
-#define SCU80           0x80 /* Multi-function Pin Control #1 */
-#define SCU84           0x84 /* Multi-function Pin Control #2 */
-#define SCU88           0x88 /* Multi-function Pin Control #3 */
-#define SCU8C           0x8C /* Multi-function Pin Control #4 */
-#define SCU90           0x90 /* Multi-function Pin Control #5 */
-#define SCU94           0x94 /* Multi-function Pin Control #6 */
-#define SCUA0           0xA0 /* Multi-function Pin Control #7 */
-#define SCUA4           0xA4 /* Multi-function Pin Control #8 */
-#define SCUA8           0xA8 /* Multi-function Pin Control #9 */
-#define SCUAC           0xAC /* Multi-function Pin Control #10 */
-#define HW_STRAP2       0xD0 /* Strapping */
-
- /**
-  * A signal descriptor, which describes the register, bits and the
-  * enable/disable values that should be compared or written.
-  *
-  * @ip: The IP block identifier, used as an index into the regmap array in
-  *      struct aspeed_pinctrl_data
-  * @reg: The register offset with respect to the base address of the IP block
-  * @mask: The mask to apply to the register. The lowest set bit of the mask is
-  *        used to derive the shift value.
-  * @enable: The value that enables the function. Value should be in the LSBs,
-  *          not at the position of the mask.
-  * @disable: The value that disables the function. Value should be in the
-  *           LSBs, not at the position of the mask.
-  */
-struct aspeed_sig_desc {
-	unsigned int ip;
-	unsigned int reg;
-	u32 mask;
-	u32 enable;
-	u32 disable;
-};
-
-/**
- * Describes a signal expression. The expression is evaluated by ANDing the
- * evaluation of the descriptors.
- *
- * @signal: The signal name for the priority level on the pin. If the signal
- *          type is GPIO, then the signal name must begin with the string
- *          "GPIO", e.g. GPIOA0, GPIOT4 etc.
- * @function: The name of the function the signal participates in for the
- *            associated expression
- * @ndescs: The number of signal descriptors in the expression
- * @descs: Pointer to an array of signal descriptors that comprise the
- *         function expression
- */
-struct aspeed_sig_expr {
-	const char *signal;
-	const char *function;
-	int ndescs;
-	const struct aspeed_sig_desc *descs;
-};
-
-/**
- * A struct capturing the list of expressions enabling signals at each priority
- * for a given pin. The signal configuration for a priority level is evaluated
- * by ORing the evaluation of the signal expressions in the respective
- * priority's list.
- *
- * @name: A name for the pin
- * @prios: A pointer to an array of expression list pointers
- *
- */
-struct aspeed_pin_desc {
-	const char *name;
-	const struct aspeed_sig_expr ***prios;
-};
-
-/* Macro hell */
-
-#define SIG_DESC_IP_BIT(ip, reg, idx, val) \
-	{ ip, reg, BIT_MASK(idx), val, (((val) + 1) & 1) }
-
-/**
- * Short-hand macro for describing an SCU descriptor enabled by the state of
- * one bit. The disable value is derived.
- *
- * @reg: The signal's associated register, offset from base
- * @idx: The signal's bit index in the register
- * @val: The value (0 or 1) that enables the function
- */
-#define SIG_DESC_BIT(reg, idx, val) \
-	SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, val)
-
-#define SIG_DESC_IP_SET(ip, reg, idx) SIG_DESC_IP_BIT(ip, reg, idx, 1)
-
-/**
- * A further short-hand macro expanding to an SCU descriptor enabled by a set
- * bit.
- *
- * @reg: The register, offset from base
- * @idx: The bit index in the register
- */
-#define SIG_DESC_SET(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 1)
-
-#define SIG_DESC_LIST_SYM(sig, func) sig_descs_ ## sig ## _ ## func
-#define SIG_DESC_LIST_DECL(sig, func, ...) \
-	static const struct aspeed_sig_desc SIG_DESC_LIST_SYM(sig, func)[] = \
-		{ __VA_ARGS__ }
-
-#define SIG_EXPR_SYM(sig, func) sig_expr_ ## sig ## _ ## func
-#define SIG_EXPR_DECL_(sig, func) \
-	static const struct aspeed_sig_expr SIG_EXPR_SYM(sig, func) = \
-	{ \
-		.signal = #sig, \
-		.function = #func, \
-		.ndescs = ARRAY_SIZE(SIG_DESC_LIST_SYM(sig, func)), \
-		.descs = &(SIG_DESC_LIST_SYM(sig, func))[0], \
-	}
-
-/**
- * Declare a signal expression.
- *
- * @sig: A macro symbol name for the signal (is subjected to stringification
- *        and token pasting)
- * @func: The function in which the signal is participating
- * @...: Signal descriptors that define the signal expression
- *
- * For example, the following declares the ROMD8 signal for the ROM16 function:
- *
- *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
- *
- * And with multiple signal descriptors:
- *
- *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
- *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
- */
-#define SIG_EXPR_DECL(sig, func, ...) \
-	SIG_DESC_LIST_DECL(sig, func, __VA_ARGS__); \
-	SIG_EXPR_DECL_(sig, func)
-
-/**
- * Declare a pointer to a signal expression
- *
- * @sig: The macro symbol name for the signal (subjected to token pasting)
- * @func: The macro symbol name for the function (subjected to token pasting)
- */
-#define SIG_EXPR_PTR(sig, func) (&SIG_EXPR_SYM(sig, func))
-
-#define SIG_EXPR_LIST_SYM(sig) sig_exprs_ ## sig
-
-/**
- * Declare a signal expression list for reference in a struct aspeed_pin_prio.
- *
- * @sig: A macro symbol name for the signal (is subjected to token pasting)
- * @...: Signal expression structure pointers (use SIG_EXPR_PTR())
- *
- * For example, the 16-bit ROM bus can be enabled by one of two possible signal
- * expressions:
- *
- *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
- *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
- *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
- *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
- *              SIG_EXPR_PTR(ROMD8, ROM16S));
- */
-#define SIG_EXPR_LIST_DECL(sig, ...) \
-	static const struct aspeed_sig_expr *SIG_EXPR_LIST_SYM(sig)[] = \
-		{ __VA_ARGS__, NULL }
-
-/**
- * A short-hand macro for declaring a function expression and an expression
- * list with a single function.
- *
- * @func: A macro symbol name for the function (is subjected to token pasting)
- * @...: Function descriptors that define the function expression
- *
- * For example, signal NCTS6 participates in its own function with one group:
- *
- *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
- */
-#define SIG_EXPR_LIST_DECL_SINGLE(sig, func, ...) \
-	SIG_DESC_LIST_DECL(sig, func, __VA_ARGS__); \
-	SIG_EXPR_DECL_(sig, func); \
-	SIG_EXPR_LIST_DECL(sig, SIG_EXPR_PTR(sig, func))
-
-#define SIG_EXPR_LIST_DECL_DUAL(sig, f0, f1) \
-	SIG_EXPR_LIST_DECL(sig, SIG_EXPR_PTR(sig, f0), SIG_EXPR_PTR(sig, f1))
-
-#define SIG_EXPR_LIST_PTR(sig) (&SIG_EXPR_LIST_SYM(sig)[0])
-
-#define PIN_EXPRS_SYM(pin) pin_exprs_ ## pin
-#define PIN_EXPRS_PTR(pin) (&PIN_EXPRS_SYM(pin)[0])
-#define PIN_SYM(pin) pin_ ## pin
-
-#define MS_PIN_DECL_(pin, ...) \
-	static const struct aspeed_sig_expr **PIN_EXPRS_SYM(pin)[] = \
-		{ __VA_ARGS__, NULL }; \
-	static const struct aspeed_pin_desc PIN_SYM(pin) = \
-		{ #pin, PIN_EXPRS_PTR(pin) }
-
-/**
- * Declare a multi-signal pin
- *
- * @pin: The pin number
- * @other: Macro name for "other" functionality (subjected to stringification)
- * @high: Macro name for the highest priority signal functions
- * @low: Macro name for the low signal functions
- *
- * For example:
- *
- *     #define A8 56
- *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
- *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
- *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
- *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
- *              SIG_EXPR_PTR(ROMD8, ROM16S));
- *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
- *     MS_PIN_DECL(A8, GPIOH0, ROMD8, NCTS6);
- */
-#define MS_PIN_DECL(pin, other, high, low) \
-	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
-	MS_PIN_DECL_(pin, \
-			SIG_EXPR_LIST_PTR(high), \
-			SIG_EXPR_LIST_PTR(low), \
-			SIG_EXPR_LIST_PTR(other))
-
-#define PIN_GROUP_SYM(func) pins_ ## func
-#define FUNC_GROUP_SYM(func) groups_ ## func
-#define FUNC_GROUP_DECL(func, ...) \
-	static const int PIN_GROUP_SYM(func)[] = { __VA_ARGS__ }; \
-	static const char *FUNC_GROUP_SYM(func)[] = { #func }
-
-/**
- * Declare a single signal pin
- *
- * @pin: The pin number
- * @other: Macro name for "other" functionality (subjected to stringification)
- * @sig: Macro name for the signal (subjected to stringification)
- *
- * For example:
- *
- *     #define E3 80
- *     SIG_EXPR_LIST_DECL_SINGLE(SCL5, I2C5, I2C5_DESC);
- *     SS_PIN_DECL(E3, GPIOK0, SCL5);
- */
-#define SS_PIN_DECL(pin, other, sig) \
-	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
-	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(sig), SIG_EXPR_LIST_PTR(other))
-
-/**
- * Single signal, single function pin declaration
- *
- * @pin: The pin number
- * @other: Macro name for "other" functionality (subjected to stringification)
- * @sig: Macro name for the signal (subjected to stringification)
- * @...: Signal descriptors that define the function expression
- *
- * For example:
- *
- *    SSSF_PIN_DECL(A4, GPIOA2, TIMER3, SIG_DESC_SET(SCU80, 2));
- */
-#define SSSF_PIN_DECL(pin, other, sig, ...) \
-	SIG_EXPR_LIST_DECL_SINGLE(sig, sig, __VA_ARGS__); \
-	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
-	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(sig), SIG_EXPR_LIST_PTR(other)); \
-	FUNC_GROUP_DECL(sig, pin)
-
-#define GPIO_PIN_DECL(pin, gpio) \
-	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
-	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
 
 /**
  * @param The pinconf parameter type
@@ -524,22 +25,6 @@ struct aspeed_pin_config {
 	u8 value;
 };
 
-struct aspeed_pinctrl_data {
-	struct regmap *maps[ASPEED_NR_PINMUX_IPS];
-
-	const struct pinctrl_pin_desc *pins;
-	const unsigned int npins;
-
-	const struct aspeed_pin_group *groups;
-	const unsigned int ngroups;
-
-	const struct aspeed_pin_function *functions;
-	const unsigned int nfunctions;
-
-	const struct aspeed_pin_config *configs;
-	const unsigned int nconfigs;
-};
-
 #define ASPEED_PINCTRL_PIN(name_) \
 	[name_] = { \
 		.number = name_, \
@@ -547,30 +32,19 @@ struct aspeed_pinctrl_data {
 		.drv_data = (void *) &(PIN_SYM(name_)) \
 	}
 
-struct aspeed_pin_group {
-	const char *name;
-	const unsigned int *pins;
+struct aspeed_pinctrl_data {
+	struct regmap *scu;
+
+	const struct pinctrl_pin_desc *pins;
 	const unsigned int npins;
-};
 
-#define ASPEED_PINCTRL_GROUP(name_) { \
-	.name = #name_, \
-	.pins = &(PIN_GROUP_SYM(name_))[0], \
-	.npins = ARRAY_SIZE(PIN_GROUP_SYM(name_)), \
-}
+	const struct aspeed_pin_config *configs;
+	const unsigned int nconfigs;
 
-struct aspeed_pin_function {
-	const char *name;
-	const char *const *groups;
-	unsigned int ngroups;
+	struct aspeed_pinmux_data pinmux;
 };
 
-#define ASPEED_PINCTRL_FUNC(name_, ...) { \
-	.name = #name_, \
-	.groups = &FUNC_GROUP_SYM(name_)[0], \
-	.ngroups = ARRAY_SIZE(FUNC_GROUP_SYM(name_)), \
-}
-
+/* Aspeed pinctrl helpers */
 int aspeed_pinctrl_get_groups_count(struct pinctrl_dev *pctldev);
 const char *aspeed_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 		unsigned int group);
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c b/drivers/pinctrl/aspeed/pinmux-aspeed.c
new file mode 100644
index 000000000000..5b0fe178ccf2
--- /dev/null
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (C) 2019 IBM Corp. */
+
+/* Pieces to enable drivers to implement the .set callback */
+
+#include "pinmux-aspeed.h"
+
+const char *const aspeed_pinmux_ips[] = {
+	[ASPEED_IP_SCU] = "SCU",
+	[ASPEED_IP_GFX] = "GFX",
+	[ASPEED_IP_LPC] = "LPC",
+};
+
+static inline void aspeed_sig_desc_print_val(
+		const struct aspeed_sig_desc *desc, bool enable, u32 rv)
+{
+	pr_debug("Want %s%X[0x%08X]=0x%X, got 0x%X from 0x%08X\n",
+			aspeed_pinmux_ips[desc->ip], desc->reg,
+			desc->mask, enable ? desc->enable : desc->disable,
+			(rv & desc->mask) >> __ffs(desc->mask), rv);
+}
+
+/**
+ * Query the enabled or disabled state of a signal descriptor
+ *
+ * @desc: The signal descriptor of interest
+ * @enabled: True to query the enabled state, false to query disabled state
+ * @map: The IP block's regmap instance
+ *
+ * Return: 1 if the descriptor's bitfield is configured to the state
+ * selected by @enabled, 0 if not, and less than zero if an unrecoverable
+ * failure occurred
+ *
+ * Evaluation of descriptor state is non-trivial in that it is not a binary
+ * outcome: The bitfields can be greater than one bit in size and thus can take
+ * a value that is neither the enabled nor disabled state recorded in the
+ * descriptor (typically this means a different function to the one of interest
+ * is enabled). Thus we must explicitly test for either condition as required.
+ */
+int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
+			 bool enabled, struct regmap *map)
+{
+	int ret;
+	unsigned int raw;
+	u32 want;
+
+	if (!map)
+		return -ENODEV;
+
+	ret = regmap_read(map, desc->reg, &raw);
+	if (ret)
+		return ret;
+
+	aspeed_sig_desc_print_val(desc, enabled, raw);
+	want = enabled ? desc->enable : desc->disable;
+
+	return ((raw & desc->mask) >> __ffs(desc->mask)) == want;
+}
+
+/**
+ * Query the enabled or disabled state for a mux function's signal on a pin
+ *
+ * @ctx: The driver context for the pinctrl IP
+ * @expr: An expression controlling the signal for a mux function on a pin
+ * @enabled: True to query the enabled state, false to query disabled state
+ *
+ * Return: 1 if the expression composed by @enabled evaluates true, 0 if not,
+ * and less than zero if an unrecoverable failure occurred.
+ *
+ * A mux function is enabled or disabled if the function's signal expression
+ * for each pin in the function's pin group evaluates true for the desired
+ * state. An signal expression evaluates true if all of its associated signal
+ * descriptors evaluate true for the desired state.
+ *
+ * If an expression's state is described by more than one bit, either through
+ * multi-bit bitfields in a single signal descriptor or through multiple signal
+ * descriptors of a single bit then it is possible for the expression to be in
+ * neither the enabled nor disabled state. Thus we must explicitly test for
+ * either condition as required.
+ */
+int aspeed_sig_expr_eval(const struct aspeed_pinmux_data *ctx,
+			 const struct aspeed_sig_expr *expr, bool enabled)
+{
+	int i;
+	int ret;
+
+	for (i = 0; i < expr->ndescs; i++) {
+		const struct aspeed_sig_desc *desc = &expr->descs[i];
+
+		ret = aspeed_sig_desc_eval(desc, enabled, ctx->maps[desc->ip]);
+		if (ret <= 0)
+			return ret;
+	}
+
+	return 1;
+}
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
new file mode 100644
index 000000000000..a036ce8f1571
--- /dev/null
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -0,0 +1,539 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* Copyright (C) 2019 IBM Corp.  */
+
+#ifndef ASPEED_PINMUX_H
+#define ASPEED_PINMUX_H
+
+#include <linux/regmap.h>
+#include <stdbool.h>
+
+/*
+ * The ASPEED SoCs provide typically more than 200 pins for GPIO and other
+ * functions. The SoC function enabled on a pin is determined on a priority
+ * basis where a given pin can provide a number of different signal types.
+ *
+ * The signal active on a pin is described by both a priority level and
+ * compound logical expressions involving multiple operators, registers and
+ * bits. Some difficulty arises as the pin's function bit masks for each
+ * priority level are frequently not the same (i.e. cannot just flip a bit to
+ * change from a high to low priority signal), or even in the same register.
+ * Further, not all signals can be unmuxed, as some expressions depend on
+ * values in the hardware strapping register (which is treated as read-only).
+ *
+ * SoC Multi-function Pin Expression Examples
+ * ------------------------------------------
+ *
+ * Here are some sample mux configurations from the AST2400 and AST2500
+ * datasheets to illustrate the corner cases, roughly in order of least to most
+ * corner. The signal priorities are in decending order from P0 (highest).
+ *
+ * D6 is a pin with a single function (beside GPIO); a high priority signal
+ * that participates in one function:
+ *
+ * Ball | Default | P0 Signal | P0 Expression               | P1 Signal | P1 Expression | Other
+ * -----+---------+-----------+-----------------------------+-----------+---------------+----------
+ *  D6    GPIOA0    MAC1LINK    SCU80[0]=1                                                GPIOA0
+ * -----+---------+-----------+-----------------------------+-----------+---------------+----------
+ *
+ * C5 is a multi-signal pin (high and low priority signals). Here we touch
+ * different registers for the different functions that enable each signal:
+ *
+ * -----+---------+-----------+-----------------------------+-----------+---------------+----------
+ *  C5    GPIOA4    SCL9        SCU90[22]=1                   TIMER5      SCU80[4]=1      GPIOA4
+ * -----+---------+-----------+-----------------------------+-----------+---------------+----------
+ *
+ * E19 is a single-signal pin with two functions that influence the active
+ * signal. In this case both bits have the same meaning - enable a dedicated
+ * LPC reset pin. However it's not always the case that the bits in the
+ * OR-relationship have the same meaning.
+ *
+ * -----+---------+-----------+-----------------------------+-----------+---------------+----------
+ *  E19   GPIOB4    LPCRST#     SCU80[12]=1 | Strap[14]=1                                 GPIOB4
+ * -----+---------+-----------+-----------------------------+-----------+---------------+----------
+ *
+ * For example, pin B19 has a low-priority signal that's enabled by two
+ * distinct SoC functions: A specific SIOPBI bit in register SCUA4, and an ACPI
+ * bit in the STRAP register. The ACPI bit configures signals on pins in
+ * addition to B19. Both of the low priority functions as well as the high
+ * priority function must be disabled for GPIOF1 to be used.
+ *
+ * Ball | Default | P0 Signal | P0 Expression                           | P1 Signal | P1 Expression                          | Other
+ * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
+ *  B19   GPIOF1    NDCD4       SCU80[25]=1                               SIOPBI#     SCUA4[12]=1 | Strap[19]=0                GPIOF1
+ * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
+ *
+ * For pin E18, the SoC ANDs the expected state of three bits to determine the
+ * pin's active signal:
+ *
+ * * SCU3C[3]: Enable external SOC reset function
+ * * SCU80[15]: Enable SPICS1# or EXTRST# function pin
+ * * SCU90[31]: Select SPI interface CS# output
+ *
+ * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
+ *  E18   GPIOB7    EXTRST#     SCU3C[3]=1 & SCU80[15]=1 & SCU90[31]=0    SPICS1#     SCU3C[3]=1 & SCU80[15]=1 & SCU90[31]=1   GPIOB7
+ * -----+---------+-----------+-----------------------------------------+-----------+----------------------------------------+----------
+ *
+ * (Bits SCU3C[3] and SCU80[15] appear to only be used in the expressions for
+ * selecting the signals on pin E18)
+ *
+ * Pin T5 is a multi-signal pin with a more complex configuration:
+ *
+ * Ball | Default | P0 Signal | P0 Expression                | P1 Signal | P1 Expression | Other
+ * -----+---------+-----------+------------------------------+-----------+---------------+----------
+ *  T5    GPIOL1    VPIDE       SCU90[5:4]!=0 & SCU84[17]=1    NDCD1       SCU84[17]=1     GPIOL1
+ * -----+---------+-----------+------------------------------+-----------+---------------+----------
+ *
+ * The high priority signal configuration is best thought of in terms of its
+ * exploded form, with reference to the SCU90[5:4] bits:
+ *
+ * * SCU90[5:4]=00: disable
+ * * SCU90[5:4]=01: 18 bits (R6/G6/B6) video mode.
+ * * SCU90[5:4]=10: 24 bits (R8/G8/B8) video mode.
+ * * SCU90[5:4]=11: 30 bits (R10/G10/B10) video mode.
+ *
+ * Re-writing:
+ *
+ * -----+---------+-----------+------------------------------+-----------+---------------+----------
+ *  T5    GPIOL1    VPIDE      (SCU90[5:4]=1 & SCU84[17]=1)    NDCD1       SCU84[17]=1     GPIOL1
+ *                             | (SCU90[5:4]=2 & SCU84[17]=1)
+ *                             | (SCU90[5:4]=3 & SCU84[17]=1)
+ * -----+---------+-----------+------------------------------+-----------+---------------+----------
+ *
+ * For reference the SCU84[17] bit configure the "UART1 NDCD1 or Video VPIDE
+ * function pin", where the signal itself is determined by whether SCU94[5:4]
+ * is disabled or in one of the 18, 24 or 30bit video modes.
+ *
+ * Other video-input-related pins require an explicit state in SCU90[5:4], e.g.
+ * W1 and U5:
+ *
+ * -----+---------+-----------+------------------------------+-----------+---------------+----------
+ *  W1    GPIOL6    VPIB0       SCU90[5:4]=3 & SCU84[22]=1     TXD1        SCU84[22]=1     GPIOL6
+ *  U5    GPIOL7    VPIB1       SCU90[5:4]=3 & SCU84[23]=1     RXD1        SCU84[23]=1     GPIOL7
+ * -----+---------+-----------+------------------------------+-----------+---------------+----------
+ *
+ * The examples of T5 and W1 are particularly fertile, as they also demonstrate
+ * that despite operating as part of the video input bus each signal needs to
+ * be enabled individually via it's own SCU84 (in the cases of T5 and W1)
+ * register bit. This is a little crazy if the bus doesn't have optional
+ * signals, but is used to decent effect with some of the UARTs where not all
+ * signals are required. However, this isn't done consistently - UART1 is
+ * enabled on a per-pin basis, and by contrast, all signals for UART6 are
+ * enabled by a single bit.
+ *
+ * Further, the high and low priority signals listed in the table above share
+ * a configuration bit. The VPI signals should operate in concert in a single
+ * function, but the UART signals should retain the ability to be configured
+ * independently. This pushes the implementation down the path of tagging a
+ * signal's expressions with the function they participate in, rather than
+ * defining masks affecting multiple signals per function. The latter approach
+ * fails in this instance where applying the configuration for the UART pin of
+ * interest will stomp on the state of other UART signals when disabling the
+ * VPI functions on the current pin.
+ *
+ * Ball |  Default   | P0 Signal | P0 Expression             | P1 Signal | P1 Expression | Other
+ * -----+------------+-----------+---------------------------+-----------+---------------+------------
+ *  A12   RGMII1TXCK   GPIOT0      SCUA0[0]=1                  RMII1TXEN   Strap[6]=0      RGMII1TXCK
+ *  B12   RGMII1TXCTL  GPIOT1      SCUA0[1]=1                  –           Strap[6]=0      RGMII1TXCTL
+ * -----+------------+-----------+---------------------------+-----------+---------------+------------
+ *
+ * A12 demonstrates that the "Other" signal isn't always GPIO - in this case
+ * GPIOT0 is a high-priority signal and RGMII1TXCK is Other. Thus, GPIO
+ * should be treated like any other signal type with full function expression
+ * requirements, and not assumed to be the default case. Separately, GPIOT0 and
+ * GPIOT1's signal descriptor bits are distinct, therefore we must iterate all
+ * pins in the function's group to disable the higher-priority signals such
+ * that the signal for the function of interest is correctly enabled.
+ *
+ * Finally, three priority levels aren't always enough; the AST2500 brings with
+ * it 18 pins of five priority levels, however the 18 pins only use three of
+ * the five priority levels.
+ *
+ * Ultimately the requirement to control pins in the examples above drive the
+ * design:
+ *
+ * * Pins provide signals according to functions activated in the mux
+ *   configuration
+ *
+ * * Pins provide up to five signal types in a priority order
+ *
+ * * For priorities levels defined on a pin, each priority provides one signal
+ *
+ * * Enabling lower priority signals requires higher priority signals be
+ *   disabled
+ *
+ * * A function represents a set of signals; functions are distinct if their
+ *   sets of signals are not equal
+ *
+ * * Signals participate in one or more functions
+ *
+ * * A function is described by an expression of one or more signal
+ *   descriptors, which compare bit values in a register
+ *
+ * * A signal expression is the smallest set of signal descriptors whose
+ *   comparisons must evaluate 'true' for a signal to be enabled on a pin.
+ *
+ * * A function's signal is active on a pin if evaluating all signal
+ *   descriptors in the pin's signal expression for the function yields a 'true'
+ *   result
+ *
+ * * A signal at a given priority on a given pin is active if any of the
+ *   functions in which the signal participates are active, and no higher
+ *   priority signal on the pin is active
+ *
+ * * GPIO is configured per-pin
+ *
+ * And so:
+ *
+ * * To disable a signal, any function(s) activating the signal must be
+ *   disabled
+ *
+ * * Each pin must know the signal expressions of functions in which it
+ *   participates, for the purpose of enabling the Other function. This is done
+ *   by deactivating all functions that activate higher priority signals on the
+ *   pin.
+ *
+ * As a concrete example:
+ *
+ * * T5 provides three signals types: VPIDE, NDCD1 and GPIO
+ *
+ * * The VPIDE signal participates in 3 functions: VPI18, VPI24 and VPI30
+ *
+ * * The NDCD1 signal participates in just its own NDCD1 function
+ *
+ * * VPIDE is high priority, NDCD1 is low priority, and GPIOL1 is the least
+ *   prioritised
+ *
+ * * The prerequisit for activating the NDCD1 signal is that the VPI18, VPI24
+ *   and VPI30 functions all be disabled
+ *
+ * * Similarly, all of VPI18, VPI24, VPI30 and NDCD1 functions must be disabled
+ *   to provide GPIOL6
+ *
+ * Considerations
+ * --------------
+ *
+ * If pinctrl allows us to allocate a pin we can configure a function without
+ * concern for the function of already allocated pins, if pin groups are
+ * created with respect to the SoC functions in which they participate. This is
+ * intuitive, but it did not feel obvious from the bit/pin relationships.
+ *
+ * Conversely, failing to allocate all pins in a group indicates some bits (as
+ * well as pins) required for the group's configuration will already be in use,
+ * likely in a way that's inconsistent with the requirements of the failed
+ * group.
+ */
+
+#define ASPEED_IP_SCU		0
+#define ASPEED_IP_GFX		1
+#define ASPEED_IP_LPC		2
+#define ASPEED_NR_PINMUX_IPS	3
+
+ /**
+  * A signal descriptor, which describes the register, bits and the
+  * enable/disable values that should be compared or written.
+  *
+  * @ip: The IP block identifier, used as an index into the regmap array in
+  *      struct aspeed_pinctrl_data
+  * @reg: The register offset with respect to the base address of the IP block
+  * @mask: The mask to apply to the register. The lowest set bit of the mask is
+  *        used to derive the shift value.
+  * @enable: The value that enables the function. Value should be in the LSBs,
+  *          not at the position of the mask.
+  * @disable: The value that disables the function. Value should be in the
+  *           LSBs, not at the position of the mask.
+  */
+struct aspeed_sig_desc {
+	unsigned int ip;
+	unsigned int reg;
+	u32 mask;
+	u32 enable;
+	u32 disable;
+};
+
+/**
+ * Describes a signal expression. The expression is evaluated by ANDing the
+ * evaluation of the descriptors.
+ *
+ * @signal: The signal name for the priority level on the pin. If the signal
+ *          type is GPIO, then the signal name must begin with the string
+ *          "GPIO", e.g. GPIOA0, GPIOT4 etc.
+ * @function: The name of the function the signal participates in for the
+ *            associated expression
+ * @ndescs: The number of signal descriptors in the expression
+ * @descs: Pointer to an array of signal descriptors that comprise the
+ *         function expression
+ */
+struct aspeed_sig_expr {
+	const char *signal;
+	const char *function;
+	int ndescs;
+	const struct aspeed_sig_desc *descs;
+};
+
+/**
+ * A struct capturing the list of expressions enabling signals at each priority
+ * for a given pin. The signal configuration for a priority level is evaluated
+ * by ORing the evaluation of the signal expressions in the respective
+ * priority's list.
+ *
+ * @name: A name for the pin
+ * @prios: A pointer to an array of expression list pointers
+ *
+ */
+struct aspeed_pin_desc {
+	const char *name;
+	const struct aspeed_sig_expr ***prios;
+};
+
+/* Macro hell */
+
+#define SIG_DESC_IP_BIT(ip, reg, idx, val) \
+	{ ip, reg, BIT_MASK(idx), val, (((val) + 1) & 1) }
+
+/**
+ * Short-hand macro for describing an SCU descriptor enabled by the state of
+ * one bit. The disable value is derived.
+ *
+ * @reg: The signal's associated register, offset from base
+ * @idx: The signal's bit index in the register
+ * @val: The value (0 or 1) that enables the function
+ */
+#define SIG_DESC_BIT(reg, idx, val) \
+	SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, val)
+
+#define SIG_DESC_IP_SET(ip, reg, idx) SIG_DESC_IP_BIT(ip, reg, idx, 1)
+
+/**
+ * A further short-hand macro expanding to an SCU descriptor enabled by a set
+ * bit.
+ *
+ * @reg: The register, offset from base
+ * @idx: The bit index in the register
+ */
+#define SIG_DESC_SET(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 1)
+
+#define SIG_DESC_LIST_SYM(sig, func) sig_descs_ ## sig ## _ ## func
+#define SIG_DESC_LIST_DECL(sig, func, ...) \
+	static const struct aspeed_sig_desc SIG_DESC_LIST_SYM(sig, func)[] = \
+		{ __VA_ARGS__ }
+
+#define SIG_EXPR_SYM(sig, func) sig_expr_ ## sig ## _ ## func
+#define SIG_EXPR_DECL_(sig, func) \
+	static const struct aspeed_sig_expr SIG_EXPR_SYM(sig, func) = \
+	{ \
+		.signal = #sig, \
+		.function = #func, \
+		.ndescs = ARRAY_SIZE(SIG_DESC_LIST_SYM(sig, func)), \
+		.descs = &(SIG_DESC_LIST_SYM(sig, func))[0], \
+	}
+
+/**
+ * Declare a signal expression.
+ *
+ * @sig: A macro symbol name for the signal (is subjected to stringification
+ *        and token pasting)
+ * @func: The function in which the signal is participating
+ * @...: Signal descriptors that define the signal expression
+ *
+ * For example, the following declares the ROMD8 signal for the ROM16 function:
+ *
+ *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
+ *
+ * And with multiple signal descriptors:
+ *
+ *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
+ *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
+ */
+#define SIG_EXPR_DECL(sig, func, ...) \
+	SIG_DESC_LIST_DECL(sig, func, __VA_ARGS__); \
+	SIG_EXPR_DECL_(sig, func)
+
+/**
+ * Declare a pointer to a signal expression
+ *
+ * @sig: The macro symbol name for the signal (subjected to token pasting)
+ * @func: The macro symbol name for the function (subjected to token pasting)
+ */
+#define SIG_EXPR_PTR(sig, func) (&SIG_EXPR_SYM(sig, func))
+
+#define SIG_EXPR_LIST_SYM(sig) sig_exprs_ ## sig
+
+/**
+ * Declare a signal expression list for reference in a struct aspeed_pin_prio.
+ *
+ * @sig: A macro symbol name for the signal (is subjected to token pasting)
+ * @...: Signal expression structure pointers (use SIG_EXPR_PTR())
+ *
+ * For example, the 16-bit ROM bus can be enabled by one of two possible signal
+ * expressions:
+ *
+ *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
+ *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
+ *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
+ *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
+ *              SIG_EXPR_PTR(ROMD8, ROM16S));
+ */
+#define SIG_EXPR_LIST_DECL(sig, ...) \
+	static const struct aspeed_sig_expr *SIG_EXPR_LIST_SYM(sig)[] = \
+		{ __VA_ARGS__, NULL }
+
+/**
+ * A short-hand macro for declaring a function expression and an expression
+ * list with a single function.
+ *
+ * @func: A macro symbol name for the function (is subjected to token pasting)
+ * @...: Function descriptors that define the function expression
+ *
+ * For example, signal NCTS6 participates in its own function with one group:
+ *
+ *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
+ */
+#define SIG_EXPR_LIST_DECL_SINGLE(sig, func, ...) \
+	SIG_DESC_LIST_DECL(sig, func, __VA_ARGS__); \
+	SIG_EXPR_DECL_(sig, func); \
+	SIG_EXPR_LIST_DECL(sig, SIG_EXPR_PTR(sig, func))
+
+#define SIG_EXPR_LIST_DECL_DUAL(sig, f0, f1) \
+	SIG_EXPR_LIST_DECL(sig, SIG_EXPR_PTR(sig, f0), SIG_EXPR_PTR(sig, f1))
+
+#define SIG_EXPR_LIST_PTR(sig) (&SIG_EXPR_LIST_SYM(sig)[0])
+
+#define PIN_EXPRS_SYM(pin) pin_exprs_ ## pin
+#define PIN_EXPRS_PTR(pin) (&PIN_EXPRS_SYM(pin)[0])
+#define PIN_SYM(pin) pin_ ## pin
+
+#define MS_PIN_DECL_(pin, ...) \
+	static const struct aspeed_sig_expr **PIN_EXPRS_SYM(pin)[] = \
+		{ __VA_ARGS__, NULL }; \
+	static const struct aspeed_pin_desc PIN_SYM(pin) = \
+		{ #pin, PIN_EXPRS_PTR(pin) }
+
+/**
+ * Declare a multi-signal pin
+ *
+ * @pin: The pin number
+ * @other: Macro name for "other" functionality (subjected to stringification)
+ * @high: Macro name for the highest priority signal functions
+ * @low: Macro name for the low signal functions
+ *
+ * For example:
+ *
+ *     #define A8 56
+ *     SIG_EXPR_DECL(ROMD8, ROM16, SIG_DESC_SET(SCU90, 6));
+ *     SIG_EXPR_DECL(ROMD8, ROM16S, SIG_DESC_SET(HW_STRAP1, 4),
+ *              { HW_STRAP1, GENMASK(1, 0), 0, 0 });
+ *     SIG_EXPR_LIST_DECL(ROMD8, SIG_EXPR_PTR(ROMD8, ROM16),
+ *              SIG_EXPR_PTR(ROMD8, ROM16S));
+ *     SIG_EXPR_LIST_DECL_SINGLE(NCTS6, NCTS6, SIG_DESC_SET(SCU90, 7));
+ *     MS_PIN_DECL(A8, GPIOH0, ROMD8, NCTS6);
+ */
+#define MS_PIN_DECL(pin, other, high, low) \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	MS_PIN_DECL_(pin, \
+			SIG_EXPR_LIST_PTR(high), \
+			SIG_EXPR_LIST_PTR(low), \
+			SIG_EXPR_LIST_PTR(other))
+
+#define PIN_GROUP_SYM(func) pins_ ## func
+#define FUNC_GROUP_SYM(func) groups_ ## func
+#define FUNC_GROUP_DECL(func, ...) \
+	static const int PIN_GROUP_SYM(func)[] = { __VA_ARGS__ }; \
+	static const char *FUNC_GROUP_SYM(func)[] = { #func }
+
+/**
+ * Declare a single signal pin
+ *
+ * @pin: The pin number
+ * @other: Macro name for "other" functionality (subjected to stringification)
+ * @sig: Macro name for the signal (subjected to stringification)
+ *
+ * For example:
+ *
+ *     #define E3 80
+ *     SIG_EXPR_LIST_DECL_SINGLE(SCL5, I2C5, I2C5_DESC);
+ *     SS_PIN_DECL(E3, GPIOK0, SCL5);
+ */
+#define SS_PIN_DECL(pin, other, sig) \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(sig), SIG_EXPR_LIST_PTR(other))
+
+/**
+ * Single signal, single function pin declaration
+ *
+ * @pin: The pin number
+ * @other: Macro name for "other" functionality (subjected to stringification)
+ * @sig: Macro name for the signal (subjected to stringification)
+ * @...: Signal descriptors that define the function expression
+ *
+ * For example:
+ *
+ *    SSSF_PIN_DECL(A4, GPIOA2, TIMER3, SIG_DESC_SET(SCU80, 2));
+ */
+#define SSSF_PIN_DECL(pin, other, sig, ...) \
+	SIG_EXPR_LIST_DECL_SINGLE(sig, sig, __VA_ARGS__); \
+	SIG_EXPR_LIST_DECL_SINGLE(other, other); \
+	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(sig), SIG_EXPR_LIST_PTR(other)); \
+	FUNC_GROUP_DECL(sig, pin)
+
+#define GPIO_PIN_DECL(pin, gpio) \
+	SIG_EXPR_LIST_DECL_SINGLE(gpio, gpio); \
+	MS_PIN_DECL_(pin, SIG_EXPR_LIST_PTR(gpio))
+
+struct aspeed_pin_group {
+	const char *name;
+	const unsigned int *pins;
+	const unsigned int npins;
+};
+
+#define ASPEED_PINCTRL_GROUP(name_) { \
+	.name = #name_, \
+	.pins = &(PIN_GROUP_SYM(name_))[0], \
+	.npins = ARRAY_SIZE(PIN_GROUP_SYM(name_)), \
+}
+
+struct aspeed_pin_function {
+	const char *name;
+	const char *const *groups;
+	unsigned int ngroups;
+};
+
+#define ASPEED_PINCTRL_FUNC(name_, ...) { \
+	.name = #name_, \
+	.groups = &FUNC_GROUP_SYM(name_)[0], \
+	.ngroups = ARRAY_SIZE(FUNC_GROUP_SYM(name_)), \
+}
+
+struct aspeed_pinmux_data;
+
+struct aspeed_pinmux_ops {
+	int (*set)(const struct aspeed_pinmux_data *ctx,
+		   const struct aspeed_sig_expr *expr, bool enabled);
+};
+
+struct aspeed_pinmux_data {
+	struct regmap *maps[ASPEED_NR_PINMUX_IPS];
+
+	const struct aspeed_pinmux_ops *ops;
+
+	const struct aspeed_pin_group *groups;
+	const unsigned int ngroups;
+
+	const struct aspeed_pin_function *functions;
+	const unsigned int nfunctions;
+};
+
+int aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc, bool enabled,
+			 struct regmap *map);
+
+int aspeed_sig_expr_eval(const struct aspeed_pinmux_data *ctx,
+			 const struct aspeed_sig_expr *expr,
+			 bool enabled);
+
+static inline int aspeed_sig_expr_set(const struct aspeed_pinmux_data *ctx,
+				      const struct aspeed_sig_expr *expr,
+				      bool enabled)
+{
+	return ctx->ops->set(ctx, expr, enabled);
+}
+
+#endif /* ASPEED_PINMUX_H */
-- 
2.20.1

