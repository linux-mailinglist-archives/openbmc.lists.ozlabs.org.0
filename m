Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA5177373
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 11:04:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wt0D2Qf1zDqKN
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 21:04:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wsxb26TPzDqTK
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 21:02:06 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 023A1Hvl019842;
 Tue, 3 Mar 2020 12:01:17 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 8178860330; Tue,  3 Mar 2020 12:01:17 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
 tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v2 2/3] watchdog: npcm: sets card ext1 and ext2 bootstatus
 during probe
Date: Tue,  3 Mar 2020 12:01:13 +0200
Message-Id: <20200303100114.87786-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200303100114.87786-1-tmaimon77@gmail.com>
References: <20200303100114.87786-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The NPCM750 have the following nine resets:
- Power on reset.
- Core reset
- Watchdog0-2 resets.
- Software1-4 resets

During probe NPCM watchdog sets WDIOF_CARDRESET, WDIOF_EXTERN1 and
WDIOF_EXTERN2 bootstatus flags.

Each bootstatus flag can represent one of the NPCM750 resets.

Bootstatus flag configure by the DT properties.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 112 ++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index 9c773c3d6d5d..84a728af6664 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -6,12 +6,29 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
 
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
@@ -43,6 +60,9 @@
 struct npcm_wdt {
 	struct watchdog_device  wdd;
 	void __iomem		*reg;
+	u32			card_reset;
+	u32			ext1_reset;
+	u32			ext2_reset;
 };
 
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
@@ -177,9 +197,66 @@ static const struct watchdog_ops npcm_wdt_ops = {
 	.restart = npcm_wdt_restart,
 };
 
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
+{
+	struct regmap *gcr_regmap;
+	u32 rstval;
+
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+		if (IS_ERR(gcr_regmap))
+			dev_warn(dev, "Failed to find nuvoton,npcm750-gcr WD reset status not supported\n");
+
+		/* Reading last reset status bit */
+		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
+		/* In case of NPCM750 power on, the reset status copied to
+		 * NPCM7XX_INTCR2_OFFSET register and then NPCM7XX_RESSR_OFFSET
+		 * register is cleaned.
+		 */
+		if (!rstval) {
+			regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
+			rstval = ~rstval;
+		}
+
+		if (rstval & wdt->card_reset)
+			wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+		if (rstval & wdt->ext1_reset)
+			wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+		if (rstval & wdt->ext2_reset)
+			wdt->wdd.bootstatus |= WDIOF_EXTERN2;
+	}
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
 	int irq;
 	int ret;
@@ -196,6 +273,39 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,card-reset-type",
+				      &card_reset_type);
+	if (ret) {
+		wdt->card_reset = NPCM7XX_PORST;
+	} else {
+		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
+		if (!wdt->card_reset)
+			wdt->card_reset = NPCM7XX_PORST;
+	}
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,ext1-reset-type",
+				      &ext1_reset_type);
+	if (ret) {
+		wdt->ext1_reset = NPCM7XX_WD0RST;
+	} else {
+		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
+		if (!wdt->ext1_reset)
+			wdt->ext1_reset = NPCM7XX_WD0RST;
+	}
+
+	ret = of_property_read_string(pdev->dev.of_node,
+				      "nuvoton,ext2-reset-type",
+				      &ext2_reset_type);
+	if (ret) {
+		wdt->ext2_reset = NPCM7XX_SWR1RST;
+	} else {
+		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
+		if (!wdt->ext2_reset)
+			wdt->ext2_reset = NPCM7XX_SWR1RST;
+	}
+
 	wdt->wdd.info = &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
@@ -214,6 +324,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
+	npcm_get_reset_status(wdt, dev);
+
 	ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchdog",
 			       wdt);
 	if (ret)
-- 
2.22.0

