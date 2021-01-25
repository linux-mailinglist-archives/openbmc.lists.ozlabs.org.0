Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D33024F5
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 13:31:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPTk74CnVzDqJK
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 23:31:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gXf/rN+F; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPTff4t84zDqtv;
 Mon, 25 Jan 2021 23:28:10 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B967F2310C;
 Mon, 25 Jan 2021 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611577688;
 bh=zrGnvmXulEw+Ps4sGkdPh+BXUTzR8G54IaR9EQXhkXs=;
 h=From:To:Cc:Subject:Date:From;
 b=gXf/rN+F7ALFrI+/fFCV+sAuUgXj/71PUoThimfacmVwKjxGvT2oHlYXX6/EIZmw6
 REPaggAnMj1+7Taq0ZdiktFiBmP0GEstg0K9ItrSb3Z4xe5BAq7JDl1RAr0JLa+LUO
 zdIVcEdNZrEz1LDBc0Ta1DfbkYkii2R/4Vh3Nll2a49dzVDHdGPZWHk4P31Fwy0drj
 SMg9yUwrxSj9MlzQL9/3+QgleFcf2Nxidi0LdUlkfSPERngc6ZJEg7muSLA+BEB90R
 qMj0Wiq369B/gHNtYTwbsll5jH5DQqGugxuv7de6Akl5MED45Li4AY86SuH+Fues8r
 FGIad8esWIPRQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH] mmc: aspeed: move kunit test into separate module
Date: Mon, 25 Jan 2021 13:27:27 +0100
Message-Id: <20210125122802.982-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Baolin Wang <baolin.wang@linaro.org>, openbmc@lists.ozlabs.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Having both the driver and the unit test in the same module
leads to a link failure because of the extra init/exit functions:

drivers/mmc/host/sdhci-of-aspeed-test.c:98:1: error: redefinition of '__inittest'
kunit_test_suite(aspeed_sdhci_test_suite);

Make it a separate module instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mmc/host/Kconfig                |  2 +-
 drivers/mmc/host/Makefile               |  1 +
 drivers/mmc/host/sdhci-of-aspeed-test.c |  5 +++++
 drivers/mmc/host/sdhci-of-aspeed.c      | 11 ++++-------
 drivers/mmc/host/sdhci-of-aspeed.h      | 10 ++++++++++
 5 files changed, 21 insertions(+), 8 deletions(-)
 create mode 100644 drivers/mmc/host/sdhci-of-aspeed.h

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index d6f00d1d6251..a248f9f6be91 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -169,7 +169,7 @@ config MMC_SDHCI_OF_ASPEED
 	  If unsure, say N.
 
 config MMC_SDHCI_OF_ASPEED_TEST
-	bool "Tests for the ASPEED SDHCI driver"
+	tristate "Tests for the ASPEED SDHCI driver"
 	depends on MMC_SDHCI_OF_ASPEED && KUNIT=y
 	help
 	  Enable KUnit tests for the ASPEED SDHCI driver. Select this
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index 451c25fc2c69..5cc7e5f13587 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_MMC_SDHCI_DOVE)		+= sdhci-dove.o
 obj-$(CONFIG_MMC_SDHCI_TEGRA)		+= sdhci-tegra.o
 obj-$(CONFIG_MMC_SDHCI_OF_ARASAN)	+= sdhci-of-arasan.o
 obj-$(CONFIG_MMC_SDHCI_OF_ASPEED)	+= sdhci-of-aspeed.o
+obj-$(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)  += sdhci-of-aspeed-test.o
 obj-$(CONFIG_MMC_SDHCI_OF_AT91)		+= sdhci-of-at91.o
 obj-$(CONFIG_MMC_SDHCI_OF_ESDHC)	+= sdhci-of-esdhc.o
 obj-$(CONFIG_MMC_SDHCI_OF_HLWD)		+= sdhci-of-hlwd.o
diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
index 34070605b28b..e7e42991534a 100644
--- a/drivers/mmc/host/sdhci-of-aspeed-test.c
+++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2020 IBM Corp. */
 
 #include <kunit/test.h>
+#include "sdhci-of-aspeed.h"
 
 static void aspeed_sdhci_phase_ddr52(struct kunit *test)
 {
@@ -96,3 +97,7 @@ static struct kunit_suite aspeed_sdhci_test_suite = {
 	.test_cases = aspeed_sdhci_test_cases,
 };
 kunit_test_suite(aspeed_sdhci_test_suite);
+
+MODULE_DESCRIPTION("Unit test for the ASPEED SD/SDIO/SDHCI Controllers");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 3b0d381e1215..dcc80099f528 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
+#include "sdhci-of-aspeed.h"
 #include "sdhci-pltfm.h"
 
 #define ASPEED_SDC_INFO			0x00
@@ -42,7 +43,6 @@ struct aspeed_sdc {
 struct aspeed_sdhci_tap_param {
 	bool valid;
 
-#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK	BIT(4)
 	u8 in;
 	u8 out;
 };
@@ -123,8 +123,8 @@ aspeed_sdc_set_phase_taps(struct aspeed_sdc *sdc,
 #define ASPEED_SDHCI_NR_TAPS		15
 /* Measured value with *handwave* environmentals and static loading */
 #define ASPEED_SDHCI_MAX_TAP_DELAY_PS	1253
-static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
-				     int phase_deg)
+int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
+			      int phase_deg)
 {
 	u64 phase_period_ps;
 	u64 prop_delay_ps;
@@ -158,6 +158,7 @@ static int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
 
 	return inverted | tap;
 }
+EXPORT_SYMBOL_GPL(aspeed_sdhci_phase_to_tap);
 
 static void
 aspeed_sdhci_phases_to_taps(struct device *dev, unsigned long rate,
@@ -579,10 +580,6 @@ static void __exit aspeed_sdc_exit(void)
 }
 module_exit(aspeed_sdc_exit);
 
-#if defined(CONFIG_MMC_SDHCI_OF_ASPEED_TEST)
-#include "sdhci-of-aspeed-test.c"
-#endif
-
 MODULE_DESCRIPTION("Driver for the ASPEED SD/SDIO/SDHCI Controllers");
 MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
diff --git a/drivers/mmc/host/sdhci-of-aspeed.h b/drivers/mmc/host/sdhci-of-aspeed.h
new file mode 100644
index 000000000000..931e70781d08
--- /dev/null
+++ b/drivers/mmc/host/sdhci-of-aspeed.h
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#ifndef _SDHCI_OF_ASPEED_H
+#define _SDHCI_OF_ASPEED_H
+
+struct device;
+int aspeed_sdhci_phase_to_tap(struct device *dev, unsigned long rate_hz,
+			      int phase_deg);
+#define ASPEED_SDHCI_TAP_PARAM_INVERT_CLK	BIT(4)
+
+#endif /* _SDHCI_OF_ASPEED_H */
-- 
2.29.2

