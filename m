Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E52E83BB
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 13:51:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D6lJ43PVvzDqD3
	for <lists+openbmc@lfdr.de>; Fri,  1 Jan 2021 23:51:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D6kxd3whpzDqJW
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jan 2021 23:35:00 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 101CNd4q027183;
 Fri, 1 Jan 2021 14:23:39 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 2D0F563A17; Fri,  1 Jan 2021 14:23:39 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 04/11] watchdog: npcm: Add DT restart
 priority and reset type support
Date: Fri,  1 Jan 2021 14:23:21 +0200
Message-Id: <20210101122328.43510-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210101122328.43510-1-tmaimon77@gmail.com>
References: <20210101122328.43510-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Device tree restart priority and
three reset types support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 121 +++++++++++++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 765577f11c8d..bbf27da34834 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -11,7 +11,24 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
-
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+/* NPCM7xx GCR module */
+#define NPCM7XX_RESSR_OFFSET		0x6C
+#define NPCM7XX_INTCR2_OFFSET		0x60
+
+#define NPCM7XX_PORST			BIT(31)
+#define NPCM7XX_CORST			BIT(30)
+#define NPCM7XX_WD0RST			BIT(29)
+#define NPCM7XX_WD1RST			BIT(24)
+#define NPCM7XX_WD2RST			BIT(23)
+#define NPCM7XX_SWR1RST			BIT(28)
+#define NPCM7XX_SWR2RST			BIT(27)
+#define NPCM7XX_SWR3RST			BIT(26)
+#define NPCM7XX_SWR4RST			BIT(25)
+
+ /* WD register */
 #define NPCM_WTCR	0x1C
 
 #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
@@ -43,6 +60,10 @@
 struct npcm_wdt {
 	struct watchdog_device  wdd;
 	void __iomem		*reg;
+	u32 			card_reset;
+	u32 			ext1_reset;
+	u32 			ext2_reset;
+
 };
 
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
@@ -176,14 +197,70 @@ static const struct watchdog_ops npcm_wdt_ops = {
 	.restart = npcm_wdt_restart,
 };
 
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
+{
+	struct regmap *gcr_regmap;
+	u32 rstval;
+
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+		if (IS_ERR(gcr_regmap)) {
+			dev_warn(dev, "Failed to find nuvoton,npcm750-gcr WD reset status not supported\n");
+		}
+
+		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
+		if (!rstval) {
+			regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
+			rstval = ~rstval;
+		}
+
+		if(rstval & wdt->card_reset)
+			wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+		if(rstval & wdt->ext1_reset)
+			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+		if(rstval & wdt->ext2_reset)
+			wdt->wdd.bootstatus |= WDIOF_EXTERN2;
+	}
+
+}
+
+static u32 npcm_wdt_reset_type(const char *reset_type)
+{
+	if (!strcmp(reset_type, "porst"))
+		return NPCM7XX_PORST;
+	else if (!strcmp(reset_type, "corst"))
+		return NPCM7XX_CORST;
+	else if (!strcmp(reset_type, "wd0"))
+		return NPCM7XX_WD0RST;
+	else if (!strcmp(reset_type, "wd1"))
+		return NPCM7XX_WD1RST;
+	else if (!strcmp(reset_type, "wd2"))
+		return NPCM7XX_WD2RST;
+	else if (!strcmp(reset_type, "sw1"))
+		return NPCM7XX_SWR1RST;
+	else if (!strcmp(reset_type, "sw2"))
+		return NPCM7XX_SWR2RST;
+	else if (!strcmp(reset_type, "sw3"))
+		return NPCM7XX_SWR3RST;
+	else if (!strcmp(reset_type, "sw4"))
+		return NPCM7XX_SWR4RST;
+
+	return 0;
+}
+
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const char *card_reset_type;
+	const char *ext1_reset_type;
+	const char *ext2_reset_type;
 	struct npcm_wdt *wdt;
+	struct resource *res;
+	u32 priority;
 	int irq;
 	int ret;
 
-	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
+	wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
 		return -ENOMEM;
 
@@ -195,6 +272,45 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (of_property_read_u32(pdev->dev.of_node, "nuvoton,restart-priority", 
+				 &priority))
+		watchdog_set_restart_priority(&wdt->wdd, 128);
+	else
+		watchdog_set_restart_priority(&wdt->wdd, priority);
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,card-reset-type",
+				      &card_reset_type);
+	if (ret)
+		wdt->card_reset = NPCM7XX_PORST;
+	else {
+		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
+		if (!wdt->card_reset)
+			wdt->card_reset = NPCM7XX_PORST;
+	}
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,ext1-reset-type",
+				      &ext1_reset_type);
+	if (ret)
+		wdt->ext1_reset = NPCM7XX_WD0RST;
+	else {
+		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
+		if (!wdt->ext1_reset)
+			wdt->ext1_reset = NPCM7XX_WD0RST;
+	}
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,ext2-reset-type",
+				      &ext2_reset_type);
+	if (ret)
+		wdt->ext2_reset = NPCM7XX_SWR1RST;
+	else {
+		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
+		if (!wdt->ext2_reset)
+			wdt->ext2_reset = NPCM7XX_SWR1RST;
+	}
+
 	wdt->wdd.info = &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
@@ -213,6 +329,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	npcm_get_reset_status(wdt, dev);
 	ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchdog",
 			       wdt);
 	if (ret)
-- 
2.22.0

