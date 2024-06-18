Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5602890DC28
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2024 21:03:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3bkJ0bZGz3cTc
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2024 05:03:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3bjV0Xc9z3bZ3
	for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2024 05:02:37 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 45IIwQI9013168
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2024 21:58:27 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Jun
 2024 21:58:26 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 02:58:24 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Jun 2024 02:58:24 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 4C88D5F627;
	Tue, 18 Jun 2024 21:58:23 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 47DA2DC0726; Tue, 18 Jun 2024 21:58:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v25 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
Date: Tue, 18 Jun 2024 21:58:18 +0300
Message-ID: <20240618185819.2155595-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618185819.2155595-1-tmaimon77@gmail.com>
References: <20240618185819.2155595-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add NPCM8xx clock controller auxiliary bus device registration.

The NPCM8xx clock controller is registered as an aux device because the
reset and the clock controller share the same register region.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/reset/reset-npcm.c          | 72 ++++++++++++++++++++++++++++-
 include/soc/nuvoton/clock-npcm8xx.h | 16 +++++++
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 include/soc/nuvoton/clock-npcm8xx.h

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 8935ef95a2d1..a27f0666c990 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -15,6 +15,8 @@
 #include <linux/regmap.h>
 #include <linux/of_address.h>
 
+#include <soc/nuvoton/clock-npcm8xx.h>
+
 /* NPCM7xx GCR registers */
 #define NPCM_MDLR_OFFSET	0x7C
 #define NPCM7XX_MDLR_USBD0	BIT(9)
@@ -89,6 +91,7 @@ struct npcm_rc_data {
 	const struct npcm_reset_info *info;
 	struct regmap *gcr_regmap;
 	u32 sw_reset_number;
+	struct device *dev;
 	void __iomem *base;
 	spinlock_t lock;
 };
@@ -372,6 +375,67 @@ static const struct reset_control_ops npcm_rc_ops = {
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
@@ -392,6 +456,7 @@ static int npcm_rc_probe(struct platform_device *pdev)
 	rc->rcdev.of_node = pdev->dev.of_node;
 	rc->rcdev.of_reset_n_cells = 2;
 	rc->rcdev.of_xlate = npcm_reset_xlate;
+	rc->dev = &pdev->dev;
 
 	ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);
 	if (ret) {
@@ -413,7 +478,12 @@ static int npcm_rc_probe(struct platform_device *pdev)
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

