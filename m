Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9305AAB6A
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 11:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJt1s6TnLz3c7N
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 19:30:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hGjb0T/c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hGjb0T/c;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsyW3yGHz300V
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 19:27:47 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id mj6so1493333pjb.1
        for <openbmc@lists.ozlabs.org>; Fri, 02 Sep 2022 02:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aTZcPMnqQap7msGPwB2F81Hly7ZiLQh5jI3JEQfy7wQ=;
        b=hGjb0T/cRtKgF3hHdzlzBfDQ9Cs0czLK4UCivLGN+lpcWFl0oD35G1WXv7aD3yraTG
         Kkf1qqP6OjHS4kU6ZuB3dDdXnHJ6yQC6RY1m+E/RGzHSEY8fuHLvmw4t/ejsGLfuVZyQ
         og67ot7k54MGDPk9kQ+v1y8/sudKhQ4DwHBDV6YvVUt+lf7HsVK3hWHluy1I9k+s0nAo
         moHarLEBv58Z4Nb2pmmzqHXsKmzLZ+ddIJx3BLQVyaf2ZCDTwGBBRiXsyM2TV7LzeE9n
         rUZOaWlFP6MPYwXmp1yHtd3okt41Lt96O751UrmboIbTVnJFth0wCCzg7DQBFe9zIcdk
         a1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aTZcPMnqQap7msGPwB2F81Hly7ZiLQh5jI3JEQfy7wQ=;
        b=SnEngGZ9e5mvwOFxM1cyPRlXEnxnucPe3PE5z1c5jxb9fBShBaa6QyAdi104F5Hxpp
         FzXuObdbaoK7hcOwwx2qv+zx1SPe8M2t6SyToW7l/T3dANPNY+db3bHU5ZP6gP6CZiw5
         zSgNhtcilelJTqklJQj2MTgjPKcazWrRVrfPZ/D7qvRcFM/kL4lA8mryxaBNmxOJkHw8
         l8ItideVEWnlEx7tdWlAjBfMW/3c0Fh3mq5S4N0+laEiWCcGL9cnRo04/eT5nh6RDebi
         Wa/prJRaGBQjUa54q3vCjNSv5AERO3grWLKWE8iuivaD28CIIpqGhFqGo7z3qxrrIKe6
         3Fww==
X-Gm-Message-State: ACgBeo2wDp8EvL1ezs56fsApY7htxXIhgBF/n6YDZIy61/Ioy6LoDfne
	1B2A+pYVLmyXHlPuU4C3+58=
X-Google-Smtp-Source: AA6agR42M+iKtrU9SkhRt2GZDF0MSKlEtHEUpHx+nDudWQ9ye8M4y49/s0V5HmWfMch8QHzP0pWKyg==
X-Received: by 2002:a17:902:d591:b0:172:689f:1059 with SMTP id k17-20020a170902d59100b00172689f1059mr35061193plh.121.1662110865135;
        Fri, 02 Sep 2022 02:27:45 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s62-20020a625e41000000b005350ea966c7sm1169315pfb.154.2022.09.02.02.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:27:44 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 3/3] EDAC/nuvoton: Add NPCM memory controller driver
Date: Fri,  2 Sep 2022 17:27:14 +0800
Message-Id: <20220902092714.3683980-4-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902092714.3683980-1-milkfafa@gmail.com>
References: <20220902092714.3683980-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add driver for memory controller present on Nuvoton NPCM SoCs. The memory
controller supports single bit error correction and double bit error
detection.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 MAINTAINERS              |   7 +
 drivers/edac/Kconfig     |  11 +
 drivers/edac/Makefile    |   1 +
 drivers/edac/npcm_edac.c | 516 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 535 insertions(+)
 create mode 100644 drivers/edac/npcm_edac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 868bbf31603d..dde5b3e647ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7409,6 +7409,13 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/mpc85xx_edac.[ch]
 
+EDAC-NPCM
+M:	Marvin Lin <kflin@nuvoton.com>
+L:	linux-edac@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
+F:	drivers/edac/npcm_edac.c
+
 EDAC-PASEMI
 M:	Egor Martovetsky <egor@pasemi.com>
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 17562cf1fe97..69b92dff7dbb 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -541,4 +541,15 @@ config EDAC_DMC520
 	  Support for error detection and correction on the
 	  SoCs with ARM DMC-520 DRAM controller.
 
+config EDAC_NPCM
+	tristate "Nuvoton NPCM DDR Memory Controller"
+	depends on (ARCH_NPCM || COMPILE_TEST)
+	help
+	  Support for error detection and correction on the Nuvoton NPCM DDR
+	  memory controller.
+
+	  The memory controller supports single bit error correction, double bit
+	  error detection (in-line ECC in which a section 1/8th of the memory
+	  device used to store data is used for ECC storage).
+
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 2d1641a27a28..db3c59d3ad84 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -84,3 +84,4 @@ obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
 obj-$(CONFIG_EDAC_ASPEED)		+= aspeed_edac.o
 obj-$(CONFIG_EDAC_BLUEFIELD)		+= bluefield_edac.o
 obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
+obj-$(CONFIG_EDAC_NPCM)			+= npcm_edac.o
diff --git a/drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
new file mode 100644
index 000000000000..a68ba7357369
--- /dev/null
+++ b/drivers/edac/npcm_edac.c
@@ -0,0 +1,516 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2022 Nuvoton Technology Corporation
+
+#include <linux/debugfs.h>
+#include <linux/iopoll.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include "edac_module.h"
+
+#define EDAC_MOD_NAME	"npcm-edac"
+#define EDAC_MSG_SIZE	256
+
+/* chip serials */
+#define NPCM7XX_CHIP	BIT(0)
+#define NPCM8XX_CHIP	BIT(1)
+
+/* syndrome values */
+#define UE_SYNDROME	0x03
+
+static char data_synd[] = {
+	0xf4, 0xf1, 0xec, 0xea, 0xe9, 0xe6, 0xe5, 0xe3,
+	0xdc, 0xda, 0xd9, 0xd6, 0xd5, 0xd3, 0xce, 0xcb,
+	0xb5, 0xb0, 0xad, 0xab, 0xa8, 0xa7, 0xa4, 0xa2,
+	0x9d, 0x9b, 0x98, 0x97, 0x94, 0x92, 0x8f, 0x8a,
+	0x75, 0x70, 0x6d, 0x6b, 0x68, 0x67, 0x64, 0x62,
+	0x5e, 0x5b, 0x58, 0x57, 0x54, 0x52, 0x4f, 0x4a,
+	0x34, 0x31, 0x2c, 0x2a, 0x29, 0x26, 0x25, 0x23,
+	0x1c, 0x1a, 0x19, 0x16, 0x15, 0x13, 0x0e, 0x0b
+};
+
+static struct regmap *npcm_regmap;
+
+struct npcm_platform_data {
+	/* chip serials */
+	int chip;
+
+	/* memory controller registers */
+	u32 ctl_ecc_en;
+	u32 ctl_int_status;
+	u32 ctl_int_ack;
+	u32 ctl_int_mask_master;
+	u32 ctl_int_mask_ecc;
+	u32 ctl_ce_addr_l;
+	u32 ctl_ce_addr_h;
+	u32 ctl_ce_data_l;
+	u32 ctl_ce_data_h;
+	u32 ctl_ce_synd;
+	u32 ctl_ue_addr_l;
+	u32 ctl_ue_addr_h;
+	u32 ctl_ue_data_l;
+	u32 ctl_ue_data_h;
+	u32 ctl_ue_synd;
+	u32 ctl_source_id;
+	u32 ctl_controller_busy;
+	u32 ctl_xor_check_bits;
+
+	/* masks and shifts */
+	u32 ecc_en_mask;
+	u32 int_status_ce_mask;
+	u32 int_status_ue_mask;
+	u32 int_ack_ce_mask;
+	u32 int_ack_ue_mask;
+	u32 int_mask_master_non_ecc_mask;
+	u32 int_mask_master_global_mask;
+	u32 int_mask_ecc_non_event_mask;
+	u32 ce_addr_h_mask;
+	u32 ce_synd_mask;
+	u32 ce_synd_shift;
+	u32 ue_addr_h_mask;
+	u32 ue_synd_mask;
+	u32 ue_synd_shift;
+	u32 source_id_ce_mask;
+	u32 source_id_ce_shift;
+	u32 source_id_ue_mask;
+	u32 source_id_ue_shift;
+	u32 controller_busy_mask;
+	u32 xor_check_bits_mask;
+	u32 xor_check_bits_shift;
+	u32 writeback_en_mask;
+	u32 fwc_mask;
+};
+
+struct priv_data {
+	void __iomem *reg;
+	char message[EDAC_MSG_SIZE];
+	const struct npcm_platform_data *pdata;
+
+	/* error injection */
+	struct dentry *debugfs;
+	u8 error_type;
+	u8 location;
+	u8 bit;
+};
+
+static void handle_ce(struct mem_ctl_info *mci)
+{
+	struct priv_data *priv = mci->pvt_info;
+	const struct npcm_platform_data *pdata = priv->pdata;
+	u64 addr = 0;
+	u64 data = 0;
+	u32 val_h = 0;
+	u32 val_l, id, synd;
+
+	regmap_read(npcm_regmap, pdata->ctl_ce_addr_l, &val_l);
+	if (pdata->chip == NPCM8XX_CHIP) {
+		regmap_read(npcm_regmap, pdata->ctl_ce_addr_h, &val_h);
+		val_h &= pdata->ce_addr_h_mask;
+	}
+	addr = ((addr | val_h) << 32) | val_l;
+
+	regmap_read(npcm_regmap, pdata->ctl_ce_data_l, &val_l);
+	if (pdata->chip == NPCM8XX_CHIP)
+		regmap_read(npcm_regmap, pdata->ctl_ce_data_h, &val_h);
+	data = ((data | val_h) << 32) | val_l;
+
+	regmap_read(npcm_regmap, pdata->ctl_source_id, &id);
+	id = (id & pdata->source_id_ce_mask) >> pdata->source_id_ce_shift;
+
+	regmap_read(npcm_regmap, pdata->ctl_ce_synd, &synd);
+	synd = (synd & pdata->ce_synd_mask) >> pdata->ce_synd_shift;
+
+	snprintf(priv->message, EDAC_MSG_SIZE,
+		 "addr = 0x%llx, data = 0x%llx, id = 0x%x", addr, data, id);
+
+	edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, addr >> PAGE_SHIFT,
+			     addr & ~PAGE_MASK, synd, 0, 0, -1, priv->message, "");
+}
+
+static void handle_ue(struct mem_ctl_info *mci)
+{
+	struct priv_data *priv = mci->pvt_info;
+	const struct npcm_platform_data *pdata = priv->pdata;
+	u64 addr = 0;
+	u64 data = 0;
+	u32 val_h = 0;
+	u32 val_l, id, synd;
+
+	regmap_read(npcm_regmap, pdata->ctl_ue_addr_l, &val_l);
+	if (pdata->chip == NPCM8XX_CHIP) {
+		regmap_read(npcm_regmap, pdata->ctl_ue_addr_h, &val_h);
+		val_h &= pdata->ue_addr_h_mask;
+	}
+	addr = ((addr | val_h) << 32) | val_l;
+
+	regmap_read(npcm_regmap, pdata->ctl_ue_data_l, &val_l);
+	if (pdata->chip == NPCM8XX_CHIP)
+		regmap_read(npcm_regmap, pdata->ctl_ue_data_h, &val_h);
+	data = ((data | val_h) << 32) | val_l;
+
+	regmap_read(npcm_regmap, pdata->ctl_source_id, &id);
+	id = (id & pdata->source_id_ue_mask) >> pdata->source_id_ue_shift;
+
+	regmap_read(npcm_regmap, pdata->ctl_ue_synd, &synd);
+	synd = (synd & pdata->ue_synd_mask) >> pdata->ue_synd_shift;
+
+	snprintf(priv->message, EDAC_MSG_SIZE,
+		 "addr = 0x%llx, data = 0x%llx, id = 0x%x", addr, data, id);
+
+	edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, addr >> PAGE_SHIFT,
+			     addr & ~PAGE_MASK, synd, 0, 0, -1, priv->message, "");
+}
+
+static irqreturn_t edac_ecc_isr(int irq, void *dev_id)
+{
+	struct mem_ctl_info *mci = dev_id;
+	struct priv_data *priv = mci->pvt_info;
+	const struct npcm_platform_data *pdata = priv->pdata;
+	u32 status;
+
+	regmap_read(npcm_regmap, pdata->ctl_int_status, &status);
+	if (status & pdata->int_status_ce_mask) {
+		handle_ce(mci);
+
+		/* acknowledge the CE interrupt */
+		regmap_write(npcm_regmap, pdata->ctl_int_ack,
+			     pdata->int_ack_ce_mask);
+		return IRQ_HANDLED;
+	} else if (status & pdata->int_status_ue_mask) {
+		handle_ue(mci);
+
+		/* acknowledge the UE interrupt */
+		regmap_write(npcm_regmap, pdata->ctl_int_ack,
+			     pdata->int_ack_ue_mask);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static ssize_t force_ecc_error(struct file *file, const char __user *data,
+				    size_t count, loff_t *ppos)
+{
+	struct device *dev = file->private_data;
+	struct mem_ctl_info *mci = to_mci(dev);
+	struct priv_data *priv = mci->pvt_info;
+	const struct npcm_platform_data *pdata = priv->pdata;
+	int ret;
+	u32 val, syndrome;
+
+	/*
+	 * error_type - 0: CE, 1: UE
+	 * location   - 0: data, 1: checkcode
+	 * bit        - 0 ~ 63 for data and 0 ~ 7 for checkcode
+	 */
+	edac_printk(KERN_INFO, EDAC_MOD_NAME,
+		    "force an ECC error, type = %d, location = %d, bit = %d\n",
+		    priv->error_type, priv->location, priv->bit);
+
+	/* ensure no pending writes */
+	ret = regmap_read_poll_timeout(npcm_regmap, pdata->ctl_controller_busy,
+				       val, !(val & pdata->controller_busy_mask),
+				       1000, 10000);
+	if (ret) {
+		edac_printk(KERN_INFO, EDAC_MOD_NAME,
+			    "wait pending writes timeout\n");
+		return count;
+	}
+
+	regmap_read(npcm_regmap, pdata->ctl_xor_check_bits, &val);
+	val &= ~pdata->xor_check_bits_mask;
+
+	/* write syndrome to XOR_CHECK_BITS */
+	if (priv->error_type == 0) {
+		if (priv->location == 0 && priv->bit > 63) {
+			edac_printk(KERN_INFO, EDAC_MOD_NAME,
+				    "data bit should not exceed 63\n");
+			return count;
+		}
+
+		if (priv->location == 1 && priv->bit > 7) {
+			edac_printk(KERN_INFO, EDAC_MOD_NAME,
+				    "checkcode bit should not exceed 7\n");
+			return count;
+		}
+
+		syndrome = priv->location ? 1 << priv->bit :
+			   data_synd[priv->bit];
+
+		regmap_write(npcm_regmap, pdata->ctl_xor_check_bits,
+			     val | (syndrome << pdata->xor_check_bits_shift) |
+			     pdata->writeback_en_mask);
+	} else if (priv->error_type == 1) {
+		regmap_write(npcm_regmap, pdata->ctl_xor_check_bits,
+			     val | (UE_SYNDROME << pdata->xor_check_bits_shift));
+	}
+
+	/* force write check */
+	regmap_update_bits(npcm_regmap, pdata->ctl_xor_check_bits,
+			   pdata->fwc_mask, pdata->fwc_mask);
+
+	return count;
+}
+
+static const struct file_operations force_ecc_error_fops = {
+	.open = simple_open,
+	.write = force_ecc_error,
+	.llseek = generic_file_llseek,
+};
+
+static void setup_debugfs(struct mem_ctl_info *mci)
+{
+	struct priv_data *priv = mci->pvt_info;
+
+	priv->debugfs = edac_debugfs_create_dir(mci->mod_name);
+	if (!priv->debugfs)
+		return;
+
+	edac_debugfs_create_x8("error_type", 0644, priv->debugfs, &priv->error_type);
+	edac_debugfs_create_x8("location", 0644, priv->debugfs, &priv->location);
+	edac_debugfs_create_x8("bit", 0644, priv->debugfs, &priv->bit);
+	edac_debugfs_create_file("force_ecc_error", 0200, priv->debugfs,
+				 &mci->dev, &force_ecc_error_fops);
+}
+
+static int setup_irq(struct mem_ctl_info *mci, struct platform_device *pdev)
+{
+	struct priv_data *priv = mci->pvt_info;
+	const struct npcm_platform_data *pdata = priv->pdata;
+	int ret, irq;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME, "IRQ not defined in DTS\n");
+		return irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, irq, edac_ecc_isr, 0,
+			       dev_name(&pdev->dev), mci);
+	if (ret < 0) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME, "failed to request IRQ\n");
+		return ret;
+	}
+
+	/* enable the functional group of ECC and mask the others */
+	regmap_write(npcm_regmap, pdata->ctl_int_mask_master,
+		     pdata->int_mask_master_non_ecc_mask);
+
+	if (pdata->chip == NPCM8XX_CHIP)
+		regmap_write(npcm_regmap, pdata->ctl_int_mask_ecc,
+			     pdata->int_mask_ecc_non_event_mask);
+
+	return 0;
+}
+
+static const struct regmap_config npcm_regmap_cfg = {
+	.reg_bits	= 32,
+	.reg_stride	= 4,
+	.val_bits	= 32,
+};
+
+static int edac_probe(struct platform_device *pdev)
+{
+	const struct npcm_platform_data *pdata;
+	struct device *dev = &pdev->dev;
+	struct edac_mc_layer layers[1];
+	struct mem_ctl_info *mci;
+	struct priv_data *priv;
+	void __iomem *reg;
+	int rc;
+	u32 val;
+
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
+
+	npcm_regmap = devm_regmap_init_mmio(dev, reg, &npcm_regmap_cfg);
+	if (IS_ERR(npcm_regmap))
+		return PTR_ERR(npcm_regmap);
+
+	pdata = of_device_get_match_data(dev);
+	if (!pdata)
+		return -EINVAL;
+
+	/* bail out if ECC is not enabled */
+	regmap_read(npcm_regmap, pdata->ctl_ecc_en, &val);
+	if (!(val & pdata->ecc_en_mask)) {
+		edac_printk(KERN_ERR, EDAC_MOD_NAME, "ECC is not enabled\n");
+		return -EPERM;
+	}
+
+	edac_op_state = EDAC_OPSTATE_INT;
+
+	layers[0].type = EDAC_MC_LAYER_ALL_MEM;
+	layers[0].size = 1;
+
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
+			    sizeof(struct priv_data));
+	if (!mci)
+		return -ENOMEM;
+
+	mci->pdev = &pdev->dev;
+	priv = mci->pvt_info;
+	priv->reg = reg;
+	priv->pdata = pdata;
+	platform_set_drvdata(pdev, mci);
+
+	mci->mtype_cap = MEM_FLAG_DDR4;
+	mci->edac_ctl_cap = EDAC_FLAG_SECDED;
+	mci->scrub_cap = SCRUB_FLAG_HW_SRC;
+	mci->scrub_mode = SCRUB_HW_SRC;
+	mci->edac_cap = EDAC_FLAG_SECDED;
+	mci->ctl_name = "npcm_ddr_controller";
+	mci->dev_name = dev_name(&pdev->dev);
+	mci->mod_name = EDAC_MOD_NAME;
+	mci->ctl_page_to_phys = NULL;
+
+	rc = setup_irq(mci, pdev);
+	if (rc)
+		goto free_edac_mc;
+
+	rc = edac_mc_add_mc(mci);
+	if (rc)
+		goto free_edac_mc;
+
+	if (IS_ENABLED(CONFIG_EDAC_DEBUG) && pdata->chip == NPCM8XX_CHIP)
+		setup_debugfs(mci);
+
+	return rc;
+
+free_edac_mc:
+	edac_mc_free(mci);
+	return rc;
+}
+
+static int edac_remove(struct platform_device *pdev)
+{
+	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
+	struct priv_data *priv = mci->pvt_info;
+	const struct npcm_platform_data *pdata = priv->pdata;
+
+	regmap_write(npcm_regmap, pdata->ctl_int_mask_master,
+		     pdata->int_mask_master_global_mask);
+	regmap_update_bits(npcm_regmap, pdata->ctl_ecc_en, pdata->ecc_en_mask,
+			   0);
+
+	edac_mc_del_mc(&pdev->dev);
+	edac_mc_free(mci);
+
+	if (IS_ENABLED(CONFIG_EDAC_DEBUG) && pdata->chip == NPCM8XX_CHIP)
+		edac_debugfs_remove_recursive(priv->debugfs);
+
+	return 0;
+}
+
+static const struct npcm_platform_data npcm750_edac = {
+	.chip				= NPCM7XX_CHIP,
+
+	/* memory controller registers */
+	.ctl_ecc_en			= 0x174,
+	.ctl_int_status			= 0x1d0,
+	.ctl_int_ack			= 0x1d4,
+	.ctl_int_mask_master		= 0x1d8,
+	.ctl_ce_addr_l			= 0x188,
+	.ctl_ce_data_l			= 0x190,
+	.ctl_ce_synd			= 0x18c,
+	.ctl_ue_addr_l			= 0x17c,
+	.ctl_ue_data_l			= 0x184,
+	.ctl_ue_synd			= 0x180,
+	.ctl_source_id			= 0x194,
+
+	/* masks and shifts */
+	.ecc_en_mask			= BIT(24),
+	.int_status_ce_mask		= GENMASK(4, 3),
+	.int_status_ue_mask		= GENMASK(6, 5),
+	.int_ack_ce_mask		= GENMASK(4, 3),
+	.int_ack_ue_mask		= GENMASK(6, 5),
+	.int_mask_master_non_ecc_mask	= GENMASK(30, 7) | GENMASK(2, 0),
+	.int_mask_master_global_mask	= BIT(31),
+	.ce_synd_mask			= GENMASK(6, 0),
+	.ce_synd_shift			= 0,
+	.ue_synd_mask			= GENMASK(6, 0),
+	.ue_synd_shift			= 0,
+	.source_id_ce_mask		= GENMASK(29, 16),
+	.source_id_ce_shift		= 16,
+	.source_id_ue_mask		= GENMASK(13, 0),
+	.source_id_ue_shift		= 0,
+};
+
+static const struct npcm_platform_data npcm845_edac = {
+	.chip =				NPCM8XX_CHIP,
+
+	/* memory controller registers */
+	.ctl_ecc_en			= 0x16c,
+	.ctl_int_status			= 0x228,
+	.ctl_int_ack			= 0x244,
+	.ctl_int_mask_master		= 0x220,
+	.ctl_int_mask_ecc		= 0x260,
+	.ctl_ce_addr_l			= 0x18c,
+	.ctl_ce_addr_h			= 0x190,
+	.ctl_ce_data_l			= 0x194,
+	.ctl_ce_data_h			= 0x198,
+	.ctl_ce_synd			= 0x190,
+	.ctl_ue_addr_l			= 0x17c,
+	.ctl_ue_addr_h			= 0x180,
+	.ctl_ue_data_l			= 0x184,
+	.ctl_ue_data_h			= 0x188,
+	.ctl_ue_synd			= 0x180,
+	.ctl_source_id			= 0x19c,
+	.ctl_controller_busy		= 0x20c,
+	.ctl_xor_check_bits		= 0x174,
+
+	/* masks and shifts */
+	.ecc_en_mask			= GENMASK(17, 16),
+	.int_status_ce_mask		= GENMASK(1, 0),
+	.int_status_ue_mask		= GENMASK(3, 2),
+	.int_ack_ce_mask		= GENMASK(1, 0),
+	.int_ack_ue_mask		= GENMASK(3, 2),
+	.int_mask_master_non_ecc_mask	= GENMASK(30, 3) | GENMASK(1, 0),
+	.int_mask_master_global_mask	= BIT(31),
+	.int_mask_ecc_non_event_mask	= GENMASK(8, 4),
+	.ce_addr_h_mask			= GENMASK(1, 0),
+	.ce_synd_mask			= GENMASK(15, 8),
+	.ce_synd_shift			= 8,
+	.ue_addr_h_mask			= GENMASK(1, 0),
+	.ue_synd_mask			= GENMASK(15, 8),
+	.ue_synd_shift			= 8,
+	.source_id_ce_mask		= GENMASK(29, 16),
+	.source_id_ce_shift		= 16,
+	.source_id_ue_mask		= GENMASK(13, 0),
+	.source_id_ue_shift		= 0,
+	.controller_busy_mask		= BIT(0),
+	.xor_check_bits_mask		= GENMASK(23, 16),
+	.xor_check_bits_shift		= 16,
+	.writeback_en_mask		= BIT(24),
+	.fwc_mask			= BIT(8),
+};
+
+static const struct of_device_id npcm_edac_of_match[] = {
+	{
+		.compatible = "nuvoton,npcm750-memory-controller",
+		.data = &npcm750_edac
+	},
+	{
+		.compatible = "nuvoton,npcm845-memory-controller",
+		.data = &npcm845_edac
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
+
+static struct platform_driver npcm_edac_driver = {
+	.driver = {
+		.name = "npcm-edac",
+		.of_match_table = npcm_edac_of_match,
+	},
+	.probe = edac_probe,
+	.remove = edac_remove,
+};
+
+module_platform_driver(npcm_edac_driver);
+
+MODULE_AUTHOR("Medad CChien <medadyoung@gmail.com>");
+MODULE_AUTHOR("Marvin Lin <kflin@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton NPCM EDAC Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

