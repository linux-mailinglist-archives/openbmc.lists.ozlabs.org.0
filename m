Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3D35EF6
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 16:18:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JrVH6TS1zDq9R
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 00:17:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=ghung.quanta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dd2y9O7v"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JrSb5p3nzDqSf
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 00:16:28 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id j2so14914868pfe.6
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzjAQQNTxJuvdLK5VSZcERZ/zKJY8Quwk3Yy0sj0GiQ=;
 b=Dd2y9O7vPKC6bDtwbWUVEtMNEZ+ADmRDvLmn17FQLXLlXe+YYQJf07SEd0tzOa2dRb
 PCl3C9KK2oykDRS+Wq50M15YS6k88rZSAnXtzTWL1VJHzTc//PnMDsNeLEr2flqrygBw
 HzD87odle0Ow4gaTmuPG+QWpg/i/pcVloZcCEpV+WSJ2PkeqUplKSHHvuz6QcymcBzRN
 ZMsEFjy+vzOJBRX6nXjOsIH7EFcQ3DrqK7UdJL7GaaIJ5egGVu2I0CwR2BmFhydJ39Gk
 U0bKD5fKFAwp07mVHM3uDo90L3GUDQSlV85pUeU7LT4y9PWx6GkC2CMtqnteJPF8Q8O3
 KBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzjAQQNTxJuvdLK5VSZcERZ/zKJY8Quwk3Yy0sj0GiQ=;
 b=s3L8U6N5c7mHGi0pWPyvk/QUZdppdHnDGOC8YEPZSDjN2DOSxYQVVQdhHdsxiYnMwD
 L3PWT1kVElAP41NqYsn3XCihT7sXAYZodE7Cpx0hlwEu/AhGY5sNN6yr8MOEa9mBWfn2
 LGMv5fsNk6MFDW5l5Pe214ai4raDA/SbhRprgcscc3kohC1Fnom5YgweYgDVpZ0BhNOV
 S2hHWAQveqbdC+Xu9zjXJDQPCwROpoOMu02FwDV0tdDD2nh4vmZSMAEvqJx0salATCHL
 O4YhjnQm5upj7nKdFysH6E+45bgtC3/vJptKVq6DfO/eWJMCZ1IUM2IEeh5URxkkVlBx
 zc2g==
X-Gm-Message-State: APjAAAX55Gf7DvbVkZY/vO69ZTGHvnalXo0sQlM0mvXFAnu4v8mp8OhX
 YZS+SZaWtMla0Nzprbw7qdA=
X-Google-Smtp-Source: APXvYqxjMNiuFHfT+sAofnefHUg2Ff4AViuUGsk9oqm/yG0Di7Tk7RitV25oen2N/5Blgi5J16Yygw==
X-Received: by 2002:a62:a511:: with SMTP id v17mr45122654pfm.129.1559744185445; 
 Wed, 05 Jun 2019 07:16:25 -0700 (PDT)
Received: from george-Quanta.com.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id 24sm22376443pgn.32.2019.06.05.07.16.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:16:24 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
To: linux-edac <linux-edac@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 5.2 v2 1/2] edac: npcm: Add Nuvoton NPCM7xx EDAC driver
Date: Wed,  5 Jun 2019 22:12:52 +0800
Message-Id: <20190605141253.38554-1-ghung.quanta@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, benjaminfair@google.com,
 paulmck@linux.ibm.com, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 James Morse <james.morse@arm.com>, wak@google.com, davem@davemloft.net,
 tomer.maimon@nuvoton.com, Avi.Fishman@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add support for the Nuvoton NPCM7xx SoC EDAC driver

NPCM7xx ECC datasheet from nuvoton.israel-Poleg:
"Cadence DDR Controller User’s Manual For DDR3 & DDR4 Memories"

Tested: Forcing an ECC error event

Write a value to the xor_check_bits parameter that will trigger
an ECC event once that word is read

For example, to force a single-bit correctable error on bit 0 of
the user-word space shown, write 0x75 into that byte of the
xor_check_bits parameter and then assert fwc (force write check)
bit to 'b1' (mem base: 0xf0824000, xor_check_bits reg addr: 0x178)

$ devmem 0xf0824178 32 0x7501

To force a double-bit un-correctable error for the user-word space,
write 0x03 into that byte of the xor_check_bits parameter

$ devmem 0xf0824178 32 0x301

Signed-off-by: George Hung <ghung.quanta@gmail.com>
---
 MAINTAINERS                 |   6 +
 drivers/edac/Kconfig        |   7 +
 drivers/edac/Makefile       |   1 +
 drivers/edac/npcm7xx_edac.c | 424 ++++++++++++++++++++++++++++++++++++
 4 files changed, 438 insertions(+)
 create mode 100644 drivers/edac/npcm7xx_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a6954776a37e..9faf7a48eea2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5784,6 +5784,12 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/mpc85xx_edac.[ch]
 
+EDAC-NPCM7XX
+M:	George Hung <george.hung@quantatw.com>
+S:	Maintained
+F:	drivers/edac/npcm7xx_edac.c
+F:	Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
+
 EDAC-PASEMI
 M:	Egor Martovetsky <egor@pasemi.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 5e2e0348d460..d8834b3c9ec8 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -504,4 +504,11 @@ config EDAC_ASPEED
 	  First, ECC must be configured in the bootloader. Then, this driver
 	  will expose error counters via the EDAC kernel framework.
 
+config EDAC_NPCM7XX
+	tristate "Nuvoton NPCM7xx DDR Memory Controller"
+	depends on ARCH_NPCM7XX
+	help
+	  Support for error detection and correction on the
+	  Nuvoton NPCM7xx DDR memory controller.
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 89ad4a84a0f6..ae70e4c02fd9 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -84,3 +84,4 @@ obj-$(CONFIG_EDAC_XGENE)		+= xgene_edac.o
 obj-$(CONFIG_EDAC_TI)			+= ti_edac.o
 obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
 obj-$(CONFIG_EDAC_ASPEED)		+= aspeed_edac.o
+obj-$(CONFIG_EDAC_NPCM7XX)		+= npcm7xx_edac.o
diff --git a/drivers/edac/npcm7xx_edac.c b/drivers/edac/npcm7xx_edac.c
new file mode 100644
index 000000000000..2d2deb81e49c
--- /dev/null
+++ b/drivers/edac/npcm7xx_edac.c
@@ -0,0 +1,424 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Quanta Computer lnc.
+ */
+
+#include <linux/edac.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+
+#include "edac_module.h"
+
+#define ECC_ENABLE                     BIT(24)
+#define ECC_EN_INT_MASK                0x7fffff87
+
+#define INT_STATUS_ADDR                116
+#define INT_ACK_ADDR                   117
+#define INT_MASK_ADDR                  118
+
+#define ECC_EN_ADDR                    93
+#define ECC_C_ADDR_ADDR                98
+#define ECC_C_DATA_ADDR                100
+#define ECC_C_ID_ADDR                  101
+#define ECC_C_SYND_ADDR                99
+#define ECC_U_ADDR_ADDR                95
+#define ECC_U_DATA_ADDR                97
+#define ECC_U_ID_ADDR                  101
+#define ECC_U_SYND_ADDR                96
+
+#define ECC_ERROR                      -1
+#define EDAC_MSG_SIZE                  256
+#define EDAC_MOD_NAME                  "npcm7xx-edac"
+
+struct ecc_error_signature_info {
+	u32 ecc_addr;
+	u32 ecc_data;
+	u32 ecc_id;
+	u32 ecc_synd;
+};
+
+struct npcm7xx_ecc_int_status {
+	u32 int_mask;
+	u32 int_status;
+	u32 int_ack;
+	u32 ce_cnt;
+	u32 ue_cnt;
+	struct ecc_error_signature_info ceinfo;
+	struct ecc_error_signature_info ueinfo;
+};
+
+struct npcm7xx_edac_priv {
+	void __iomem *baseaddr;
+	char message[EDAC_MSG_SIZE];
+	struct npcm7xx_ecc_int_status stat;
+};
+
+/**
+ * npcm7xx_edac_get_ecc_syndrom - Get the current ecc error info
+ * @base:	Pointer to the base address of the ddr memory controller
+ * @p:		Pointer to the Nuvoton ecc status structure
+ *
+ * Determines there is any ecc error or not
+ *
+ * Return: ECC detection status
+ */
+static int npcm7xx_edac_get_ecc_syndrom(void __iomem *base,
+					struct npcm7xx_ecc_int_status *p)
+{
+	int status = 0;
+	u32 int_status = 0;
+
+	int_status = readl(base + 4*INT_STATUS_ADDR);
+	writel(int_status, base + 4*INT_ACK_ADDR);
+	edac_dbg(3, "int_status: %#08x\n", int_status);
+
+	if ((int_status & (1 << 6)) == (1 << 6)) {
+		edac_dbg(3, "6-Mult uncorrectable detected.\n");
+		p->ue_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if ((int_status & (1 << 5)) == (1 << 5)) {
+		edac_dbg(3, "5-An uncorrectable detected\n");
+		p->ue_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if ((int_status & (1 << 4)) == (1 << 4)) {
+		edac_dbg(3, "4-mult correctable detected.\n");
+		p->ce_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if ((int_status & (1 << 3)) == (1 << 3)) {
+		edac_dbg(3, "3-A correctable detected.\n");
+		p->ce_cnt++;
+		status = ECC_ERROR;
+	}
+
+	if (status == ECC_ERROR) {
+		u32 ecc_id;
+
+		p->ceinfo.ecc_addr = readl(base + 4*ECC_C_ADDR_ADDR);
+		p->ceinfo.ecc_data = readl(base + 4*ECC_C_DATA_ADDR);
+		p->ceinfo.ecc_synd = readl(base + 4*ECC_C_SYND_ADDR);
+
+		p->ueinfo.ecc_addr = readl(base + 4*ECC_U_ADDR_ADDR);
+		p->ueinfo.ecc_data = readl(base + 4*ECC_U_DATA_ADDR);
+		p->ueinfo.ecc_synd = readl(base + 4*ECC_U_SYND_ADDR);
+
+		/* ECC_C_ID_ADDR has same value as ECC_U_ID_ADDR */
+		ecc_id = readl(base + 4*ECC_C_ID_ADDR);
+		p->ueinfo.ecc_id = ecc_id & 0xffff;
+		p->ceinfo.ecc_id = ecc_id >> 16;
+	}
+
+	return status;
+}
+
+/**
+ * npcm7xx_edac_handle_error - Handle controller error types CE and UE
+ * @mci:	Pointer to the edac memory controller instance
+ * @p:		Pointer to the Nuvoton ecc status structure
+ *
+ * Handles the controller ECC correctable and un correctable error.
+ */
+static void npcm7xx_edac_handle_error(struct mem_ctl_info *mci,
+				    struct npcm7xx_ecc_int_status *p)
+{
+	struct npcm7xx_edac_priv *priv = mci->pvt_info;
+	u32 page, offset;
+
+	if (p->ce_cnt) {
+		snprintf(priv->message, EDAC_MSG_SIZE,
+			"DDR ECC: synd=%#08x addr=%#08x data=%#08x source_id=%#08x ",
+			p->ceinfo.ecc_synd, p->ceinfo.ecc_addr,
+			p->ceinfo.ecc_data, p->ceinfo.ecc_id);
+
+		page = p->ceinfo.ecc_addr >> PAGE_SHIFT;
+		offset = p->ceinfo.ecc_addr & ~PAGE_MASK;
+		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
+				     p->ce_cnt, page, offset,
+				     p->ceinfo.ecc_synd,
+				     0, 0, -1,
+				     priv->message, "");
+	}
+
+	if (p->ue_cnt) {
+		snprintf(priv->message, EDAC_MSG_SIZE,
+			"DDR ECC: synd=%#08x addr=%#08x data=%#08x source_id=%#08x ",
+			p->ueinfo.ecc_synd, p->ueinfo.ecc_addr,
+			p->ueinfo.ecc_data, p->ueinfo.ecc_id);
+
+		page = p->ueinfo.ecc_addr >> PAGE_SHIFT;
+		offset = p->ueinfo.ecc_addr & ~PAGE_MASK;
+		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
+				     p->ue_cnt, page, offset,
+				     p->ueinfo.ecc_synd,
+				     0, 0, -1,
+				     priv->message, "");
+	}
+
+	memset(p, 0, sizeof(*p));
+}
+
+/**
+ * npcm7xx_edac_check - Check controller for ECC errors
+ * @mci:	Pointer to the edac memory controller instance
+ *
+ * This routine is used to check and post ECC errors and is called by
+ * this driver's CE and UE interrupt handler.
+ */
+static void npcm7xx_edac_check(struct mem_ctl_info *mci)
+{
+	struct npcm7xx_edac_priv *priv = mci->pvt_info;
+	int status = 0;
+
+	status = npcm7xx_edac_get_ecc_syndrom(priv->baseaddr, &priv->stat);
+	if (status != ECC_ERROR)
+		return;
+
+	npcm7xx_edac_handle_error(mci, &priv->stat);
+}
+
+/**
+ * npcm7xx_edac_isr - CE/UE interrupt service routine
+ * @irq:    The virtual interrupt number being serviced.
+ * @dev_id: A pointer to the EDAC memory controller instance
+ *          associated with the interrupt being handled.
+ *
+ * This routine implements the interrupt handler for both correctable
+ * (CE) and uncorrectable (UE) ECC errors for the Nuvoton Cadence DDR
+ * controller. It simply calls through to the routine used to check,
+ * report and clear the ECC status.
+ *
+ * Unconditionally returns IRQ_HANDLED.
+ */
+static irqreturn_t npcm7xx_edac_isr(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	int npcm_edac_report = 0;
+
+	npcm_edac_report = edac_get_report_status();
+	if (npcm_edac_report != EDAC_REPORTING_DISABLED)
+		npcm7xx_edac_check(mci);
+
+	return IRQ_HANDLED;
+}
+
+static int npcm7xx_edac_register_irq(struct mem_ctl_info *mci,
+					struct platform_device *pdev)
+{
+	int status = 0;
+	int mc_irq;
+	struct npcm7xx_edac_priv *priv = mci->pvt_info;
+
+	/* Only enable MC interrupts with ECC - clear int_mask[6:3] */
+	writel(ECC_EN_INT_MASK, priv->baseaddr + 4*INT_MASK_ADDR);
+
+	mc_irq = platform_get_irq(pdev, 0);
+
+	if (!mc_irq) {
+		edac_printk(KERN_ERR, EDAC_MC, "Unable to map interrupts.\n");
+		status = -ENODEV;
+		goto fail;
+	}
+
+	status = devm_request_irq(&pdev->dev, mc_irq, npcm7xx_edac_isr, 0,
+			       "npcm-memory-controller", mci);
+
+	if (status < 0) {
+		edac_printk(KERN_ERR, EDAC_MC,
+				      "Unable to request irq %d for ECC",
+				      mc_irq);
+		status = -ENODEV;
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	return status;
+}
+
+static const struct of_device_id npcm7xx_edac_of_match[] = {
+	{ .compatible = "nuvoton,npcm7xx-sdram-edac"},
+	{ /* end of table */ }
+};
+
+MODULE_DEVICE_TABLE(of, npcm7xx_edac_of_match);
+
+/**
+ * npcm7xx_edac_mc_init - Initialize driver instance
+ * @mci:	Pointer to the edac memory controller instance
+ * @pdev:	Pointer to the platform_device struct
+ *
+ * Performs initialization of the EDAC memory controller instance and
+ * related driver-private data associated with the memory controller the
+ * instance is bound to.
+ *
+ * Returns 0 if OK; otherwise, < 0 on error.
+ */
+static int npcm7xx_edac_mc_init(struct mem_ctl_info *mci,
+				 struct platform_device *pdev)
+{
+	const struct of_device_id *id;
+
+	id = of_match_device(npcm7xx_edac_of_match, &pdev->dev);
+	if (!id)
+		return -ENODEV;
+
+	/* Initialize controller capabilities and configuration */
+	mci->mtype_cap = MEM_FLAG_DDR4;
+	mci->edac_ctl_cap = EDAC_FLAG_SECDED;
+	mci->edac_cap = EDAC_FLAG_SECDED;
+	mci->scrub_cap = SCRUB_FLAG_HW_SRC;
+	mci->scrub_mode = SCRUB_HW_SRC;
+	mci->ctl_name = id->compatible;
+	mci->dev_name = dev_name(&pdev->dev);
+	mci->mod_name = EDAC_MOD_NAME;
+
+	edac_op_state = EDAC_OPSTATE_INT;
+
+	return 0;
+}
+
+/**
+ * npcm7xx_edac_get_eccstate - Return the controller ecc enable/disable status
+ * @base:	Pointer to the ddr memory controller base address
+ *
+ * Get the ECC enable/disable status for the controller
+ *
+ * Return: a ecc status boolean i.e true/false - enabled/disabled.
+ */
+static bool npcm7xx_edac_get_eccstate(void __iomem *base)
+{
+	u32 ecc_en;
+	bool state = false;
+
+	ecc_en = readl(base + 4*ECC_EN_ADDR);
+	if (ecc_en & ECC_ENABLE) {
+		edac_printk(KERN_INFO, EDAC_MC, "ECC reporting and correcting on. ");
+		state = true;
+	}
+
+	return state;
+}
+
+/**
+ * npcm7xx_edac_mc_probe - Check controller and bind driver
+ * @pdev:	Pointer to the platform_device struct
+ *
+ * Probes a specific controller instance for binding with the driver.
+ *
+ * Return: 0 if the controller instance was successfully bound to the
+ * driver; otherwise, < 0 on error.
+ */
+static int npcm7xx_edac_mc_probe(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci;
+	struct edac_mc_layer layers[1];
+	struct npcm7xx_edac_priv *priv;
+	struct resource *res;
+	void __iomem *baseaddr;
+	int rc;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	baseaddr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(baseaddr)) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME,
+			    "DDR controller regs not defined\n");
+		return PTR_ERR(baseaddr);
+	}
+
+	/*
+	 * Check if ECC is enabled.
+	 * If not, there is no useful monitoring that can be done
+	 * for this controller.
+	 */
+	if (!npcm7xx_edac_get_eccstate(baseaddr)) {
+		edac_printk(KERN_INFO, EDAC_MC, "ECC disabled\n");
+		return -ENXIO;
+	}
+
+	/*
+	 * Allocate an EDA controller instance and perform the appropriate
+	 * initialization.
+	 */
+	layers[0].type = EDAC_MC_LAYER_ALL_MEM;
+	layers[0].size = 1;
+
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
+			    sizeof(struct npcm7xx_edac_priv));
+	if (!mci) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed memory allocation for mc instance\n");
+		return -ENOMEM;
+	}
+
+	mci->pdev = &pdev->dev;
+	priv = mci->pvt_info;
+	priv->baseaddr = baseaddr;
+	platform_set_drvdata(pdev, mci);
+
+	rc = npcm7xx_edac_mc_init(mci, pdev);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed to initialize instance\n");
+		goto free_edac_mc;
+	}
+
+	/* Attempt to register it with the EDAC subsystem */
+	rc = edac_mc_add_mc(mci);
+	if (rc) {
+		edac_printk(KERN_ERR, EDAC_MC,
+			    "Failed to register with EDAC core\n");
+		goto free_edac_mc;
+	}
+
+	/* Register interrupts */
+	rc = npcm7xx_edac_register_irq(mci, pdev);
+	if (rc)
+		goto free_edac_mc;
+
+	return 0;
+
+free_edac_mc:
+	edac_mc_free(mci);
+
+	return rc;
+}
+
+/**
+ * npcm7xx_edac_mc_remove - Unbind driver from controller
+ * @pdev:	Pointer to the platform_device struct
+ *
+ * Return: Unconditionally 0
+ */
+static int npcm7xx_edac_mc_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+
+	return 0;
+}
+
+static struct platform_driver npcm7xx_edac_driver = {
+	.probe = npcm7xx_edac_mc_probe,
+	.remove = npcm7xx_edac_mc_remove,
+	.driver = {
+		   .name = EDAC_MOD_NAME,
+		   .of_match_table = npcm7xx_edac_of_match,
+	},
+};
+
+module_platform_driver(npcm7xx_edac_driver);
+
+MODULE_AUTHOR("Quanta Computer Inc.");
+MODULE_DESCRIPTION("Nuvoton NPCM7xx EDAC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

