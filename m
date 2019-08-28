Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EB2A0757
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 18:28:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JWPv2rYZzDrB5
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 02:28:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JWNt36TMzDr7m
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 02:27:22 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x7SGQJeN004240;
 Wed, 28 Aug 2019 19:26:19 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id AB1A462CAA; Wed, 28 Aug 2019 19:26:19 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org,
 jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de,
 joel@jms.id.au
Subject: [PATCH v1 2/2] hwrng: npcm: add NPCM RNG driver
Date: Wed, 28 Aug 2019 19:26:17 +0300
Message-Id: <20190828162617.237398-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190828162617.237398-1-tmaimon77@gmail.com>
References: <20190828162617.237398-1-tmaimon77@gmail.com>
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
 Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC Random Number Generator(RNG) driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/char/hw_random/Kconfig    |  13 ++
 drivers/char/hw_random/Makefile   |   1 +
 drivers/char/hw_random/npcm-rng.c | 207 ++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/char/hw_random/npcm-rng.c

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 59f25286befe..87a1c30e7958 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -440,6 +440,19 @@ config HW_RANDOM_OPTEE
 
 	  If unsure, say Y.
 
+config HW_RANDOM_NPCM
+	tristate "NPCM Random Number Generator support"
+	depends on ARCH_NPCM || COMPILE_TEST
+	default HW_RANDOM
+	help
+ 	  This driver provides support for the Random Number
+	  Generator hardware available in Nuvoton NPCM SoCs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called npcm-rng.
+
+ 	  If unsure, say Y.
+
 endif # HW_RANDOM
 
 config UML_RANDOM
diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
index 7c9ef4a7667f..17b6d4e6d591 100644
--- a/drivers/char/hw_random/Makefile
+++ b/drivers/char/hw_random/Makefile
@@ -39,3 +39,4 @@ obj-$(CONFIG_HW_RANDOM_MTK)	+= mtk-rng.o
 obj-$(CONFIG_HW_RANDOM_S390) += s390-trng.o
 obj-$(CONFIG_HW_RANDOM_KEYSTONE) += ks-sa-rng.o
 obj-$(CONFIG_HW_RANDOM_OPTEE) += optee-rng.o
+obj-$(CONFIG_HW_RANDOM_NPCM) += npcm-rng.o
diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
new file mode 100644
index 000000000000..5b4b1b6cb362
--- /dev/null
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Nuvoton Technology corporation.
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/init.h>
+#include <linux/random.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/hw_random.h>
+#include <linux/delay.h>
+#include <linux/of_irq.h>
+#include <linux/pm_runtime.h>
+
+#define NPCM_RNGCS_REG		0x00	/* Control and status register */
+#define NPCM_RNGD_REG		0x04	/* Data register */
+#define NPCM_RNGMODE_REG	0x08	/* Mode register */
+
+#define NPCM_RNG_CLK_SET_25MHZ	GENMASK(4, 3) /* 20-25 MHz */
+#define NPCM_RNG_DATA_VALID	BIT(1)
+#define NPCM_RNG_ENABLE		BIT(0)
+#define NPCM_RNG_M1ROSEL	BIT(1)
+
+#define NPCM_RNG_TIMEOUT_POLL	20
+
+#define to_npcm_rng(p)	container_of(p, struct npcm_rng, rng)
+
+struct npcm_rng {
+	void __iomem *base;
+	struct hwrng rng;
+};
+
+static int npcm_rng_init(struct hwrng *rng)
+{
+	struct npcm_rng *priv = to_npcm_rng(rng);
+	u32 val;
+
+	val = readl(priv->base + NPCM_RNGCS_REG);
+	val |= NPCM_RNG_ENABLE;
+	writel(val, priv->base + NPCM_RNGCS_REG);
+
+	return 0;
+}
+
+static void npcm_rng_cleanup(struct hwrng *rng)
+{
+	struct npcm_rng *priv = to_npcm_rng(rng);
+	u32 val;
+
+	val = readl(priv->base + NPCM_RNGCS_REG);
+	val &= ~NPCM_RNG_ENABLE;
+	writel(val, priv->base + NPCM_RNGCS_REG);
+}
+
+static bool npcm_rng_wait_ready(struct hwrng *rng, bool wait)
+{
+	struct npcm_rng *priv = to_npcm_rng(rng);
+	int timeout_cnt = 0;
+	int ready;
+
+	ready = readl(priv->base + NPCM_RNGCS_REG) & NPCM_RNG_DATA_VALID;
+	while ((ready == 0) && (timeout_cnt < NPCM_RNG_TIMEOUT_POLL)) {
+		usleep_range(500, 1000);
+		ready = readl(priv->base + NPCM_RNGCS_REG) &
+			NPCM_RNG_DATA_VALID;
+		timeout_cnt++;
+	}
+
+	return !!ready;
+}
+
+static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
+{
+	struct npcm_rng *priv = to_npcm_rng(rng);
+	int retval = 0;
+
+	pm_runtime_get_sync((struct device *)priv->rng.priv);
+
+	while (max >= sizeof(u32)) {
+		if (!npcm_rng_wait_ready(rng, wait))
+			break;
+
+		*(u32 *)buf = readl(priv->base + NPCM_RNGD_REG);
+		retval += sizeof(u32);
+		buf += sizeof(u32);
+		max -= sizeof(u32);
+	}
+
+	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
+	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+
+	return retval || !wait ? retval : -EIO;
+}
+
+static int npcm_rng_probe(struct platform_device *pdev)
+{
+	struct npcm_rng *priv;
+	struct resource *res;
+	u32 quality;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->rng.name = pdev->name;
+#ifndef CONFIG_PM
+	priv->rng.init = npcm_rng_init;
+	priv->rng.cleanup = npcm_rng_cleanup;
+#endif
+	priv->rng.read = npcm_rng_read;
+	priv->rng.priv = (unsigned long)&pdev->dev;
+	if (of_property_read_u32(pdev->dev.of_node, "quality", &quality))
+		priv->rng.quality = 1000;
+	else
+		priv->rng.quality = quality;
+
+	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
+#ifndef CONFIG_PM
+	writel(NPCM_RNG_CLK_SET_25MHZ, priv->base + NPCM_RNGCS_REG);
+#else
+	writel(NPCM_RNG_CLK_SET_25MHZ | NPCM_RNG_ENABLE,
+	       priv->base + NPCM_RNGCS_REG);
+#endif
+
+	ret = devm_hwrng_register(&pdev->dev, &priv->rng);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register rng device: %d\n",
+			ret);
+		return ret;
+	}
+
+	dev_set_drvdata(&pdev->dev, priv);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	dev_info(&pdev->dev, "Random Number Generator Probed\n");
+
+	return 0;
+}
+
+static int npcm_rng_remove(struct platform_device *pdev)
+{
+	struct npcm_rng *priv = platform_get_drvdata(pdev);
+
+	hwrng_unregister(&priv->rng);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int npcm_rng_runtime_suspend(struct device *dev)
+{
+	struct npcm_rng *priv = dev_get_drvdata(dev);
+
+	npcm_rng_cleanup(&priv->rng);
+
+	return 0;
+}
+
+static int npcm_rng_runtime_resume(struct device *dev)
+{
+	struct npcm_rng *priv = dev_get_drvdata(dev);
+
+	return npcm_rng_init(&priv->rng);
+}
+#endif
+
+static const struct dev_pm_ops npcm_rng_pm_ops = {
+	SET_RUNTIME_PM_OPS(npcm_rng_runtime_suspend,
+			   npcm_rng_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static const struct of_device_id rng_dt_id[] = {
+	{ .compatible = "nuvoton,npcm750-rng",  },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rng_dt_id);
+
+static struct platform_driver npcm_rng_driver = {
+	.driver = {
+		.name		= "npcm-rng",
+		.pm		= &npcm_rng_pm_ops,
+		.owner		= THIS_MODULE,
+		.of_match_table = of_match_ptr(rng_dt_id),
+	},
+	.probe		= npcm_rng_probe,
+	.remove		= npcm_rng_remove,
+};
+
+module_platform_driver(npcm_rng_driver);
+
+MODULE_DESCRIPTION("Nuvoton NPCM Random Number Generator Driver");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0

