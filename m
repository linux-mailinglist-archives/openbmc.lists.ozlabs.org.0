Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965267C7A0D
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 01:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S64rr1jCyz3c5S
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 10:01:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S64rP68VZz30hj
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 10:01:20 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 39CN1AsV031272
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 02:01:10 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 13 Oct
 2023 02:01:08 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 13 Oct
 2023 07:01:03 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Oct 2023 07:01:03 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id E91BA68E78;
	Fri, 13 Oct 2023 02:01:01 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id C15BA21CFCC4; Fri, 13 Oct 2023 02:01:01 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <peter.chen@kernel.org>, <gregkh@linuxfoundation.org>,
        <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <j.neuschaefer@gmx.net>
Subject: [PATCH v6 3/3] usb: chipidea: Add support for NPCM
Date: Fri, 13 Oct 2023 02:00:57 +0300
Message-ID: <20231012230057.3365626-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231012230057.3365626-1-tmaimon77@gmail.com>
References: <20231012230057.3365626-1-tmaimon77@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton NPCM BMC SoCs support to USB ChipIdea driver.
NPCM SoC include ChipIdea IP block that used for USB device controller
mode.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Acked-by: Peter Chen <peter.chen@kernel.org>
---
 drivers/usb/chipidea/Kconfig        |   4 +
 drivers/usb/chipidea/Makefile       |   1 +
 drivers/usb/chipidea/ci_hdrc_npcm.c | 114 ++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 drivers/usb/chipidea/ci_hdrc_npcm.c

diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
index c815824a0b2d..bab45bc62361 100644
--- a/drivers/usb/chipidea/Kconfig
+++ b/drivers/usb/chipidea/Kconfig
@@ -43,6 +43,10 @@ config USB_CHIPIDEA_MSM
 	tristate "Enable MSM hsusb glue driver" if EXPERT
 	default USB_CHIPIDEA
 
+config USB_CHIPIDEA_NPCM
+	tristate "Enable NPCM hsusb glue driver" if EXPERT
+	default USB_CHIPIDEA
+
 config USB_CHIPIDEA_IMX
 	tristate "Enable i.MX USB glue driver" if EXPERT
 	depends on OF
diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index 71afeab97e83..718cb24603dd 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -13,6 +13,7 @@ ci_hdrc-$(CONFIG_USB_OTG_FSM)		+= otg_fsm.o
 
 obj-$(CONFIG_USB_CHIPIDEA_GENERIC)	+= ci_hdrc_usb2.o
 obj-$(CONFIG_USB_CHIPIDEA_MSM)		+= ci_hdrc_msm.o
+obj-$(CONFIG_USB_CHIPIDEA_NPCM)		+= ci_hdrc_npcm.o
 obj-$(CONFIG_USB_CHIPIDEA_PCI)		+= ci_hdrc_pci.o
 obj-$(CONFIG_USB_CHIPIDEA_IMX)		+= usbmisc_imx.o ci_hdrc_imx.o
 obj-$(CONFIG_USB_CHIPIDEA_TEGRA)	+= ci_hdrc_tegra.o
diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
new file mode 100644
index 000000000000..37b64a3dbd96
--- /dev/null
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2023 Nuvoton Technology corporation.
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/usb/chipidea.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/reset-controller.h>
+#include <linux/of.h>
+
+#include "ci.h"
+
+struct npcm_udc_data {
+	struct platform_device	*ci;
+	struct clk		*core_clk;
+	struct ci_hdrc_platform_data pdata;
+};
+
+static int npcm_udc_notify_event(struct ci_hdrc *ci, unsigned event)
+{
+	struct device *dev = ci->dev->parent;
+
+	switch (event) {
+	case CI_HDRC_CONTROLLER_RESET_EVENT:
+		/* clear all mode bits */
+		hw_write(ci, OP_USBMODE, 0xffffffff, 0x0);
+		break;
+	default:
+		dev_dbg(dev, "unknown ci_hdrc event\n");
+		break;
+	}
+
+	return 0;
+}
+
+static int npcm_udc_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct npcm_udc_data *ci;
+	struct platform_device *plat_ci;
+	struct device *dev = &pdev->dev;
+
+	ci = devm_kzalloc(&pdev->dev, sizeof(*ci), GFP_KERNEL);
+	if (!ci)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, ci);
+
+	ci->core_clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ci->core_clk))
+		return PTR_ERR(ci->core_clk);
+
+	ret = clk_prepare_enable(ci->core_clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable the clock: %d\n", ret);
+
+	ci->pdata.name = dev_name(dev);
+	ci->pdata.capoffset = DEF_CAPOFFSET;
+	ci->pdata.flags	= CI_HDRC_REQUIRES_ALIGNED_DMA |
+		CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS;
+	ci->pdata.phy_mode = USBPHY_INTERFACE_MODE_UTMI;
+	ci->pdata.notify_event = npcm_udc_notify_event;
+
+	plat_ci = ci_hdrc_add_device(dev, pdev->resource, pdev->num_resources,
+				     &ci->pdata);
+	if (IS_ERR(plat_ci)) {
+		ret = PTR_ERR(plat_ci);
+		dev_err(dev, "failed to register HDRC NPCM device: %d\n", ret);
+		goto clk_err;
+	}
+
+	pm_runtime_no_callbacks(dev);
+	pm_runtime_enable(dev);
+
+	return 0;
+
+clk_err:
+	clk_disable_unprepare(ci->core_clk);
+	return ret;
+}
+
+static int npcm_udc_remove(struct platform_device *pdev)
+{
+	struct npcm_udc_data *ci = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	ci_hdrc_remove_device(ci->ci);
+	clk_disable_unprepare(ci->core_clk);
+
+	return 0;
+}
+
+static const struct of_device_id npcm_udc_dt_match[] = {
+	{ .compatible = "nuvoton,npcm750-udc", },
+	{ .compatible = "nuvoton,npcm845-udc", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, npcm_udc_dt_match);
+
+static struct platform_driver npcm_udc_driver = {
+	.probe = npcm_udc_probe,
+	.remove = npcm_udc_remove,
+	.driver = {
+		.name = "npcm_udc",
+		.of_match_table = npcm_udc_dt_match,
+	},
+};
+
+module_platform_driver(npcm_udc_driver);
+
+MODULE_DESCRIPTION("NPCM USB device controller driver");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

