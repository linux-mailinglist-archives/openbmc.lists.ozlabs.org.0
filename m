Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCAC96284D
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 15:11:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4Xy5P9Dz3bvX
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 23:10:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724850653;
	cv=none; b=DWtbeWv5UXNk3tJOFjDq2CmuTy5x9hWeqB3arqR8IzdK1+dBIqqpKV2BkRv/b+okSvQZWOkyY9qMGbB6Z59woJC0+e5gV5AEjrnN11/kiib9FNUG9b7w8T9HBvoFEM0MklfcBgbkKZcNISfRQ/9IgV5PhklKdpQdZiYI9aCIqMJ67tQw2rKFjuL4MJVNDzQUO3rQ3aDmt5ZYYBhtdK7AVGTBcO1o+WGzjUsCU6aiTDxpPOtC6I1U1YFupwP8uVf4kKcqdcAQfAYIodl0JXBeO61tDHW8iED7alZcj43tQzCx87+/wbBKrQqA/BMnulxzO/fnBQ0QC2XWLAndefky+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724850653; c=relaxed/relaxed;
	bh=WWgJxCvEi788wav9yQfD9DxLrbdi9dHFOWM68zr3RkY=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NotSetDelaration; b=V/1T79HCT1qUvSxo9gm0w8rMIEpGablSdnigiDw2fRvITpuPJwnQyaoTVgiQ0s/7/FvddXxxPqXWCcuIXO8qSz/oWEYl755BY8oiVg3UIdkWhXpTjCj24O6Re2xm2duPhce4s8+5nvG9e+IDGv5EnA2Ki7jcpGJnEC7FYqOwymwdFylJR5pC9oX7RT5tiuzOjYun0ZKCuEfBafq4Rm67XXxX7SaVRG/YcONHzZ5rVV/MRIQ3M2WdL6VX2oXBmq9ZpbjNPz+knjMB+8B5J6ZRTNj3QfYHI6Pc66AO/NiCTZYQPJzadNwASPvt+B95tUQ279/jzmF1vpFpK/Zi5KE5Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv4Xl2sc9z2yVv
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 23:10:44 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47SDAZ3R029383
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 16:10:35 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 16:10:34 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 21:10:32 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 Aug 2024 21:10:32 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id EEC475F614;
	Wed, 28 Aug 2024 16:10:31 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id ECD6DDC11B1; Wed, 28 Aug 2024 16:10:31 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v4 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
Date: Wed, 28 Aug 2024 16:10:28 +0300
Message-ID: <20240828131029.3720213-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828131029.3720213-1-tmaimon77@gmail.com>
References: <20240828131029.3720213-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Benjamin Fair <benjaminfair@google.com>, Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add NPCM8xx clock controller auxiliary bus device registration.

The NPCM8xx clock controller is registered as an aux device because the
reset and the clock controller share the same register region.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Benjamin Fair <benjaminfair@google.com>
---
 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-npcm.c          | 74 ++++++++++++++++++++++++++++-
 include/soc/nuvoton/clock-npcm8xx.h | 16 +++++++
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 include/soc/nuvoton/clock-npcm8xx.h

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..531c9c6a7b54 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -139,6 +139,7 @@ config RESET_MESON_AUDIO_ARB
 config RESET_NPCM
 	bool "NPCM BMC Reset Driver" if COMPILE_TEST
 	default ARCH_NPCM
+	select AUXILIARY_BUS
 	help
 	  This enables the reset controller driver for Nuvoton NPCM
 	  BMC SoCs.
diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index f6c4f854f2be..3dd24da19d4e 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019 Nuvoton Technology corporation.
 
+#include <linux/auxiliary_bus.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
@@ -10,11 +11,14 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/reset-controller.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/of_address.h>
 
+#include <soc/nuvoton/clock-npcm8xx.h>
+
 /* NPCM7xx GCR registers */
 #define NPCM_MDLR_OFFSET	0x7C
 #define NPCM7XX_MDLR_USBD0	BIT(9)
@@ -89,6 +93,7 @@ struct npcm_rc_data {
 	const struct npcm_reset_info *info;
 	struct regmap *gcr_regmap;
 	u32 sw_reset_number;
+	struct device *dev;
 	void __iomem *base;
 	spinlock_t lock;
 };
@@ -373,6 +378,67 @@ static const struct reset_control_ops npcm_rc_ops = {
 	.status		= npcm_rc_status,
 };
 
+static void npcm_clock_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static void npcm_clock_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct npcm_clock_adev *rdev = to_npcm_clock_adev(adev);
+
+	kfree(rdev);
+}
+
+static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_data, char *clk_name)
+{
+	struct npcm_clock_adev *rdev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return ERR_PTR(-ENOMEM);
+
+	rdev->base = rst_data->base;
+
+	adev = &rdev->adev;
+	adev->name = clk_name;
+	adev->dev.parent = rst_data->dev;
+	adev->dev.release = npcm_clock_adev_release;
+	adev->id = 555u;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(rdev);
+		return ERR_PTR(ret);
+	}
+
+	return adev;
+}
+
+static int npcm8xx_clock_controller_register(struct npcm_rc_data *rst_data, char *clk_name)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = npcm_clock_adev_alloc(rst_data, clk_name);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(rst_data->dev, npcm_clock_unregister_adev, adev);
+}
+
 static int npcm_rc_probe(struct platform_device *pdev)
 {
 	struct npcm_rc_data *rc;
@@ -393,6 +459,7 @@ static int npcm_rc_probe(struct platform_device *pdev)
 	rc->rcdev.of_node = pdev->dev.of_node;
 	rc->rcdev.of_reset_n_cells = 2;
 	rc->rcdev.of_xlate = npcm_reset_xlate;
+	rc->dev = &pdev->dev;
 
 	ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
 	if (ret) {
@@ -414,7 +481,12 @@ static int npcm_rc_probe(struct platform_device *pdev)
 		}
 	}
 
-	return ret;
+	switch (rc->info->bmc_id) {
+	case BMC_NPCM8XX:
+		return npcm8xx_clock_controller_register(rc, "clk-npcm8xx");
+	default:
+		return ret;
+	}
 }
 
 static struct platform_driver npcm_rc_driver = {
diff --git a/include/soc/nuvoton/clock-npcm8xx.h b/include/soc/nuvoton/clock-npcm8xx.h
new file mode 100644
index 000000000000..139130e98c51
--- /dev/null
+++ b/include/soc/nuvoton/clock-npcm8xx.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_NPCM8XX_CLOCK_H
+#define __SOC_NPCM8XX_CLOCK_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+
+struct npcm_clock_adev {
+	void __iomem *base;
+	struct auxiliary_device adev;
+};
+
+#define to_npcm_clock_adev(_adev) \
+	container_of((_adev), struct npcm_clock_adev, adev)
+
+#endif
-- 
2.34.1

