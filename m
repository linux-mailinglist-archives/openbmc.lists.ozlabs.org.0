Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 874BC2EB9E1
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 07:12:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9fCw6Z7szDqNC
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 17:12:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9dyP2VpHzDqb5;
 Wed,  6 Jan 2021 17:00:45 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1065sFls004601;
 Wed, 6 Jan 2021 13:54:15 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 6 Jan 2021 13:58:49 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <tglx@linutronix.de>, <maz@kernel.org>, <p.zabel@pengutronix.de>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] soc: aspeed: Add eSPI driver
Date: Wed, 6 Jan 2021 13:59:38 +0800
Message-ID: <20210106055939.19386-6-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1065sFls004601
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Aspeed eSPI controller is slave device to communicate with
the master through the Enhanced Serial Peripheral Interface (eSPI).
All of the four eSPI channels, namely peripheral, virtual wire,
out-of-band, and flash are supported.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/soc/aspeed/Kconfig                  |  49 ++
 drivers/soc/aspeed/Makefile                 |   5 +
 drivers/soc/aspeed/aspeed-espi-ctrl.c       | 197 ++++++
 drivers/soc/aspeed/aspeed-espi-flash.c      | 490 ++++++++++++++
 drivers/soc/aspeed/aspeed-espi-oob.c        | 706 ++++++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-peripheral.c | 613 +++++++++++++++++
 drivers/soc/aspeed/aspeed-espi-vw.c         | 211 ++++++
 include/uapi/linux/aspeed-espi.h            | 160 +++++
 8 files changed, 2431 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-oob.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-peripheral.c
 create mode 100644 drivers/soc/aspeed/aspeed-espi-vw.c
 create mode 100644 include/uapi/linux/aspeed-espi.h

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 243ca196e6ad..e4408e97023d 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -42,6 +42,55 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
+config ASPEED_ESPI
+	tristate "Aspeed eSPI Engine Driver"
+	select REGMAP
+	select MFD_SYSON
+	select ASPEED_ESPI_PERIPHERAL
+	select ASPEED_ESPI_VW
+	select ASPEED_ESPI_OOB
+	select ASPEED_ESPI_FLASH
+	default n
+	help
+	  Enable support for the Aspeed eSPI engine. The eSPI engine
+	  plays as a slave device in BMC to communicate with the host
+	  side master over the eSPI bus interface.
+
+	  eSPI and LPC are mutually execulisve features on Aspeed SoC.
+	  If not sure, say N.
+
+config ASPEED_ESPI_PERIPHERAL
+	tristate "Aspeed eSPI peripheral channel driver"
+	depends on ASPEED_ESPI
+	help
+	  Control Aspeed eSPI peripheral channel driver. The driver
+	  also provides an eSPI packet put/get interface to communicate
+	  with the eSPI host.
+
+config ASPEED_ESPI_VW
+	tristate "Aspeed eSPI virtual wire channel driver"
+	depends on ASPEED_ESPI
+	help
+	  Control Aspeed eSPI virtual wire channel driver. The driver
+	  also provides an eSPI packet put/get interface to communicate
+	  with the eSPI host.
+
+config ASPEED_ESPI_OOB
+	tristate "Aspeed eSPI out-of-band channel driver"
+	depends on ASPEED_ESPI
+	help
+	  Control Aspeed eSPI out-of-band channel driver. The driver
+	  also provides an eSPI packet put/get interface to communicat
+	  with the eSPI host.
+
+config ASPEED_ESPI_FLASH
+	tristate "Aspeed eSPI flash channel driver"
+	depends on ASPEED_ESPI
+	help
+	  Control Aspeed eSPI flash channel driver. The driver
+	  also provides an eSPI packet put/get interface to communicat
+	  with the eSPI host.
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fcab7192e1a4..ac41ce82bb78 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -3,3 +3,8 @@ obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)	+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_ESPI)	+= aspeed-espi-ctrl.o \
+				   aspeed-espi-peripheral.o \
+				   aspeed-espi-vw.o \
+				   aspeed-espi-oob.o \
+				   aspeed-espi-flash.o
diff --git a/drivers/soc/aspeed/aspeed-espi-ctrl.c b/drivers/soc/aspeed/aspeed-espi-ctrl.c
new file mode 100644
index 000000000000..e4329f5f8ed3
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-ctrl.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+
+#include <soc/aspeed/espi.h>
+
+#define DEVICE_NAME "aspeed-espi-ctrl"
+
+struct aspeed_espi_ctrl {
+	struct regmap *map;
+	struct clk *clk;
+	struct reset_control *rst;
+
+	int irq;
+	int irq_reset;
+};
+
+static irqreturn_t aspeed_espi_ctrl_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	struct aspeed_espi_ctrl *espi_ctrl = (struct aspeed_espi_ctrl *)arg;
+
+	regmap_read(espi_ctrl->map, ESPI_INT_STS, &sts);
+
+	if (!(sts & ESPI_INT_STS_HW_RST_DEASSERT))
+		return IRQ_NONE;
+
+	regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT,
+			   ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE,
+			   ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE);
+
+	regmap_write(espi_ctrl->map, ESPI_INT_STS, ESPI_INT_STS_HW_RST_DEASSERT);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t aspeed_espi_ctrl_reset_isr(int irq, void *arg)
+{
+	struct aspeed_espi_ctrl *espi_ctrl = (struct aspeed_espi_ctrl *)arg;
+
+	disable_irq(espi_ctrl->irq);
+
+	reset_control_assert(espi_ctrl->rst);
+	udelay(1);
+	reset_control_deassert(espi_ctrl->rst);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT,
+			   ESPI_SYSEVT_SLV_BOOT_STS | ESPI_SYSEVT_SLV_BOOT_DONE,
+			   0);
+
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_EN, 0xffffffff);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT1_INT_T0,
+			   ESPI_SYSEVT1_INT_T0_SUSPEND_WARN,
+			   ESPI_SYSEVT1_INT_T0_SUSPEND_WARN);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT1_INT_EN,
+			   ESPI_SYSEVT1_INT_EN_SUSPEND_WARN,
+			   ESPI_SYSEVT1_INT_EN_SUSPEND_WARN);
+
+	enable_irq(espi_ctrl->irq);
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_ctrl_init(struct device *dev,
+				 struct aspeed_espi_ctrl *espi_ctrl)
+{
+	int rc;
+
+	regmap_write(espi_ctrl->map, ESPI_SYSEVT_INT_EN, 0xffffffff);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT1_INT_T0,
+			   ESPI_SYSEVT1_INT_T0_SUSPEND_WARN,
+			   ESPI_SYSEVT1_INT_T0_SUSPEND_WARN);
+
+	regmap_update_bits(espi_ctrl->map, ESPI_SYSEVT1_INT_EN,
+			   ESPI_SYSEVT1_INT_EN_SUSPEND_WARN,
+			   ESPI_SYSEVT1_INT_EN_SUSPEND_WARN);
+
+	rc = devm_request_irq(dev, espi_ctrl->irq,
+			      aspeed_espi_ctrl_isr,
+			      0, DEVICE_NAME, espi_ctrl);
+	if (rc) {
+		dev_err(dev, "failed to request IRQ\n");
+		return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_ctrl->irq_reset,
+			      aspeed_espi_ctrl_reset_isr,
+			      IRQF_SHARED, DEVICE_NAME, espi_ctrl);
+	if (rc) {
+		dev_err(dev, "failed to request reset IRQ\n");
+		return rc;
+	}
+
+	return 0;
+}
+
+static int aspeed_espi_ctrl_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct aspeed_espi_ctrl *espi_ctrl;
+	struct device *dev;
+
+	dev = &pdev->dev;
+
+	espi_ctrl = devm_kzalloc(dev, sizeof(*espi_ctrl), GFP_KERNEL);
+	if (!espi_ctrl)
+		return -ENOMEM;
+
+	espi_ctrl->map = syscon_node_to_regmap(
+			dev->parent->of_node);
+	if (IS_ERR(espi_ctrl->map)) {
+		dev_err(dev, "cannot get remap\n");
+		return -ENODEV;
+	}
+
+	espi_ctrl->irq = platform_get_irq(pdev, 0);
+	if (espi_ctrl->irq < 0)
+		return espi_ctrl->irq;
+
+	espi_ctrl->irq_reset = platform_get_irq(pdev, 1);
+	if (espi_ctrl->irq_reset < 0)
+		return espi_ctrl->irq_reset;
+
+	espi_ctrl->rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(espi_ctrl->rst)) {
+		dev_err(dev, "cannot get reset\n");
+		return -ENODEV;
+	}
+
+	espi_ctrl->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(espi_ctrl->clk)) {
+		dev_err(dev, "cannot get clock\n");
+		return -ENODEV;
+	}
+
+	rc = clk_prepare_enable(espi_ctrl->clk);
+	if (rc) {
+		dev_err(dev, "cannot enable clock\n");
+		return rc;
+	}
+
+	rc = aspeed_espi_ctrl_init(dev, espi_ctrl);
+	if (rc)
+		return rc;
+
+	dev_set_drvdata(dev, espi_ctrl);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_espi_ctrl_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_ctrl *espi_ctrl = dev_get_drvdata(dev);
+
+	devm_free_irq(dev, espi_ctrl->irq, espi_ctrl);
+	devm_free_irq(dev, espi_ctrl->irq_reset, espi_ctrl);
+	devm_kfree(dev, espi_ctrl);
+	return 0;
+}
+
+static const struct of_device_id aspeed_espi_ctrl_of_matches[] = {
+	{ .compatible = "aspeed,ast2600-espi-ctrl" },
+	{ },
+};
+
+static struct platform_driver aspeed_espi_ctrl_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
+		.of_match_table = aspeed_espi_ctrl_of_matches,
+	},
+	.probe = aspeed_espi_ctrl_probe,
+	.remove = aspeed_espi_ctrl_remove,
+};
+
+module_platform_driver(aspeed_espi_ctrl_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of Aspeed eSPI reset and clocks");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/aspeed/aspeed-espi-flash.c b/drivers/soc/aspeed/aspeed-espi-flash.c
new file mode 100644
index 000000000000..80b9a612cf6e
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-flash.c
@@ -0,0 +1,490 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/miscdevice.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/uaccess.h>
+#include <linux/module.h>
+
+#include <soc/aspeed/espi.h>
+#include <uapi/linux/aspeed-espi.h>
+
+#define DEVICE_NAME	"aspeed-espi-flash"
+
+enum aspeed_espi_flash_safs_mode {
+	SAFS_MODE_MIX,
+	SAFS_MODE_SW,
+	SAFS_MODE_HW,
+	SAFS_MODES,
+};
+
+struct aspeed_espi_flash_dma {
+	void *tx_virt;
+	dma_addr_t tx_addr;
+	void *rx_virt;
+	dma_addr_t rx_addr;
+};
+
+struct aspeed_espi_flash {
+	struct regmap *map;
+
+	int irq;
+	int irq_reset;
+
+	uint32_t safs_mode;
+
+	uint32_t dma_mode;
+	struct aspeed_espi_flash_dma dma;
+
+	uint32_t rx_ready;
+	wait_queue_head_t wq;
+
+	struct mutex get_rx_mtx;
+	struct mutex put_tx_mtx;
+
+	spinlock_t lock;
+
+	struct miscdevice mdev;
+
+	uint32_t version;
+};
+
+static long aspeed_espi_flash_get_rx(struct file *fp,
+				     struct aspeed_espi_ioc *ioc,
+				     struct aspeed_espi_flash *espi_flash)
+{
+	int i, rc = 0;
+	unsigned long flags;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+
+	if (fp->f_flags & O_NONBLOCK) {
+		if (mutex_trylock(&espi_flash->get_rx_mtx))
+			return -EBUSY;
+
+		if (!espi_flash->rx_ready) {
+			rc = -ENODATA;
+			goto unlock_mtx_n_out;
+		}
+	} else {
+		mutex_lock(&espi_flash->get_rx_mtx);
+
+		if (!espi_flash->rx_ready) {
+			rc = wait_event_interruptible(espi_flash->wq,
+						      espi_flash->rx_ready);
+			if (rc == -ERESTARTSYS) {
+				rc = -EINTR;
+				goto unlock_mtx_n_out;
+			}
+		}
+	}
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_flash->map, ESPI_FLASH_RX_CTRL, &reg);
+	cyc = (reg & ESPI_FLASH_RX_CTRL_CYC_MASK) >> ESPI_FLASH_RX_CTRL_CYC_SHIFT;
+	tag = (reg & ESPI_FLASH_RX_CTRL_TAG_MASK) >> ESPI_FLASH_RX_CTRL_TAG_SHIFT;
+	len = (reg & ESPI_FLASH_RX_CTRL_LEN_MASK) >> ESPI_FLASH_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	switch (cyc) {
+	case ESPI_FLASH_READ:
+	case ESPI_FLASH_WRITE:
+	case ESPI_FLASH_ERASE:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_flash_rwe);
+		break;
+	case ESPI_FLASH_SUC_CMPLT_D_MIDDLE:
+	case ESPI_FLASH_SUC_CMPLT_D_FIRST:
+	case ESPI_FLASH_SUC_CMPLT_D_LAST:
+	case ESPI_FLASH_SUC_CMPLT_D_ONLY:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_flash_cmplt);
+		break;
+	case ESPI_FLASH_SUC_CMPLT:
+	case ESPI_FLASH_UNSUC_CMPLT:
+		pkt_len = len + sizeof(struct espi_flash_cmplt);
+		break;
+	default:
+		rc = -EFAULT;
+		goto unlock_mtx_n_out;
+	}
+
+	if (ioc->pkt_len < pkt_len) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = cyc;
+	hdr->tag = tag;
+	hdr->len_h = len >> 8;
+	hdr->len_l = len & 0xff;
+
+	if (espi_flash->dma_mode) {
+		memcpy(hdr + 1, espi_flash->dma.rx_virt,
+		       pkt_len - sizeof(*hdr));
+	} else {
+		for (i = sizeof(*hdr); i < pkt_len; ++i) {
+			regmap_read(espi_flash->map,
+				    ESPI_FLASH_RX_PORT, &reg);
+			pkt[i] = reg & 0xff;
+		}
+	}
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	spin_lock_irqsave(&espi_flash->lock, flags);
+
+	regmap_write_bits(espi_flash->map, ESPI_FLASH_RX_CTRL,
+			  ESPI_FLASH_RX_CTRL_PEND_SERV,
+			  ESPI_FLASH_RX_CTRL_PEND_SERV);
+
+	espi_flash->rx_ready = 0;
+
+	spin_unlock_irqrestore(&espi_flash->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_flash->get_rx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_flash_put_tx(struct file *fp,
+				     struct aspeed_espi_ioc *ioc,
+				     struct aspeed_espi_flash *espi_flash)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+
+	if (!mutex_trylock(&espi_flash->put_tx_mtx))
+		return -EAGAIN;
+
+	regmap_read(espi_flash->map, ESPI_FLASH_TX_CTRL, &reg);
+	if (reg & ESPI_FLASH_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_flash->dma_mode) {
+		memcpy(espi_flash->dma.tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_flash->map,
+				     ESPI_FLASH_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_FLASH_TX_CTRL_CYC_SHIFT) & ESPI_FLASH_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_FLASH_TX_CTRL_TAG_SHIFT) & ESPI_FLASH_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_FLASH_TX_CTRL_LEN_SHIFT) & ESPI_FLASH_TX_CTRL_LEN_MASK)
+		| ESPI_FLASH_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_flash->map, ESPI_FLASH_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_flash->put_tx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_flash_ioctl(struct file *fp, unsigned int cmd,
+				    unsigned long arg)
+{
+	struct aspeed_espi_ioc ioc;
+	struct aspeed_espi_flash *espi_flash = container_of(
+			fp->private_data,
+			struct aspeed_espi_flash,
+			mdev);
+
+	if (copy_from_user(&ioc, (void __user *)arg, sizeof(ioc)))
+		return -EFAULT;
+
+	if (ioc.pkt_len > ESPI_PKT_LEN_MAX)
+		return -EINVAL;
+
+	switch (cmd) {
+	case ASPEED_ESPI_FLASH_GET_RX:
+		return aspeed_espi_flash_get_rx(fp, &ioc, espi_flash);
+	case ASPEED_ESPI_FLASH_PUT_TX:
+		return aspeed_espi_flash_put_tx(fp, &ioc, espi_flash);
+	};
+
+	return -EINVAL;
+}
+
+static const struct file_operations aspeed_espi_flash_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = aspeed_espi_flash_ioctl,
+};
+
+static irqreturn_t aspeed_espi_flash_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	unsigned long flags;
+	struct aspeed_espi_flash *espi_flash = arg;
+
+	regmap_read(espi_flash->map, ESPI_INT_STS, &sts);
+
+	if (!(sts & ESPI_INT_STS_FLASH_BITS))
+		return IRQ_NONE;
+
+	if (sts & ESPI_INT_STS_FLASH_RX_CMPLT) {
+		spin_lock_irqsave(&espi_flash->lock, flags);
+		espi_flash->rx_ready = 1;
+		spin_unlock_irqrestore(&espi_flash->lock, flags);
+
+		wake_up_interruptible(&espi_flash->wq);
+	}
+
+	regmap_write(espi_flash->map, ESPI_INT_STS, sts & ESPI_INT_STS_FLASH_BITS);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t aspeed_espi_flash_reset_isr(int irq, void *arg)
+{
+	struct aspeed_espi_flash *espi_flash = arg;
+	struct aspeed_espi_flash_dma *dma = &espi_flash->dma;
+
+	disable_irq(espi_flash->irq);
+
+	if (espi_flash->dma_mode) {
+		regmap_write(espi_flash->map, ESPI_FLASH_TX_DMA, dma->tx_addr);
+		regmap_write(espi_flash->map, ESPI_FLASH_RX_DMA, dma->rx_addr);
+		regmap_update_bits(espi_flash->map, ESPI_CTRL,
+				   ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN,
+				   ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN);
+	}
+
+	regmap_update_bits(espi_flash->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_SW_MODE_MASK,
+			   espi_flash->safs_mode << ESPI_CTRL_FLASH_SW_MODE_SHIFT);
+
+	regmap_update_bits(espi_flash->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_SW_RDY,
+			   ESPI_CTRL_FLASH_SW_RDY);
+
+	enable_irq(espi_flash->irq);
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_flash_dma_init(struct device *dev,
+				      struct aspeed_espi_flash *espi_flash)
+{
+	struct aspeed_espi_flash_dma *dma = &espi_flash->dma;
+
+	dma->tx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+					  &dma->tx_addr, GFP_KERNEL);
+	if (!dma->tx_virt)
+		return -ENOMEM;
+
+	dma->rx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+					  &dma->rx_addr, GFP_KERNEL);
+	if (!dma->rx_virt)
+		return -ENOMEM;
+
+	regmap_write(espi_flash->map, ESPI_FLASH_TX_DMA, dma->tx_addr);
+	regmap_write(espi_flash->map, ESPI_FLASH_RX_DMA, dma->rx_addr);
+	regmap_update_bits(espi_flash->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN,
+			   ESPI_CTRL_FLASH_TX_DMA_EN | ESPI_CTRL_FLASH_RX_DMA_EN);
+
+	return 0;
+}
+
+static int aspeed_espi_flash_init(struct device *dev,
+				  struct aspeed_espi_flash *espi_flash)
+{
+	int rc;
+
+	if (espi_flash->dma_mode) {
+		rc = aspeed_espi_flash_dma_init(dev, espi_flash);
+		if (rc)
+			return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_flash->irq, aspeed_espi_flash_isr,
+			      0, DEVICE_NAME, espi_flash);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI flash channel irq\n");
+		return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_flash->irq_reset, aspeed_espi_flash_reset_isr,
+			      IRQF_SHARED, DEVICE_NAME, espi_flash);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI channel reset irq\n");
+		return rc;
+	}
+
+	init_waitqueue_head(&espi_flash->wq);
+
+	spin_lock_init(&espi_flash->lock);
+
+	mutex_init(&espi_flash->put_tx_mtx);
+	mutex_init(&espi_flash->get_rx_mtx);
+
+	espi_flash->mdev.parent = dev;
+	espi_flash->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_flash->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", DEVICE_NAME);
+	espi_flash->mdev.fops = &aspeed_espi_flash_fops;
+	rc = misc_register(&espi_flash->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return rc;
+	}
+
+	regmap_update_bits(espi_flash->map, ESPI_CTRL,
+			   ESPI_CTRL_FLASH_SW_MODE_MASK | ESPI_CTRL_FLASH_SW_RDY,
+			   (espi_flash->safs_mode << ESPI_CTRL_FLASH_SW_MODE_SHIFT) |
+			    ESPI_CTRL_FLASH_SW_RDY);
+
+	return 0;
+}
+
+static int aspeed_espi_flash_probe(struct platform_device *pdev)
+{
+	int rc = 0;
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_flash *espi_flash;
+
+	espi_flash = devm_kzalloc(dev, sizeof(*espi_flash), GFP_KERNEL);
+	if (!espi_flash)
+		return -ENOMEM;
+
+	espi_flash->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(espi_flash->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return PTR_ERR(espi_flash->map);
+	}
+
+	espi_flash->irq = platform_get_irq(pdev, 0);
+	if (espi_flash->irq < 0)
+		return espi_flash->irq;
+
+	espi_flash->irq_reset = platform_get_irq(pdev, 1);
+	if (espi_flash->irq_reset < 0)
+		return espi_flash->irq_reset;
+
+	espi_flash->version = (uint32_t)of_device_get_match_data(dev);
+
+	if (of_property_read_bool(dev->of_node, "dma-mode"))
+		espi_flash->dma_mode = 1;
+
+	of_property_read_u32(dev->of_node, "safs-mode", &espi_flash->safs_mode);
+	if (espi_flash->safs_mode >= SAFS_MODES) {
+		dev_err(dev, "invalid SAFS mode\n");
+		return -EINVAL;
+	}
+
+	rc = aspeed_espi_flash_init(dev, espi_flash);
+	if (rc)
+		return rc;
+
+	dev_set_drvdata(dev, espi_flash);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_espi_flash_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_flash *espi_flash = dev_get_drvdata(dev);
+	struct aspeed_espi_flash_dma *dma;
+
+	mutex_destroy(&espi_flash->put_tx_mtx);
+	mutex_destroy(&espi_flash->get_rx_mtx);
+
+	if (!espi_flash->dma_mode)
+		return 0;
+
+	dma = &espi_flash->dma;
+
+	if (dma->tx_virt)
+		dma_free_coherent(dev, PAGE_SIZE, dma->tx_virt, dma->tx_addr);
+
+	if (dma->rx_virt)
+		dma_free_coherent(dev, PAGE_SIZE, dma->rx_virt, dma->rx_addr);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_espi_flash_match[] = {
+	{ .compatible = "aspeed,ast2600-espi-flash" },
+	{ }
+};
+
+static struct platform_driver aspeed_espi_flash_driver = {
+	.driver = {
+		.name           = DEVICE_NAME,
+		.of_match_table = aspeed_espi_flash_match,
+	},
+	.probe  = aspeed_espi_flash_probe,
+	.remove = aspeed_espi_flash_remove,
+};
+
+module_platform_driver(aspeed_espi_flash_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of Aspeed eSPI flash channel");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/aspeed/aspeed-espi-oob.c b/drivers/soc/aspeed/aspeed-espi-oob.c
new file mode 100644
index 000000000000..3565a0f1e403
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-oob.c
@@ -0,0 +1,706 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/poll.h>
+#include <linux/slab.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/miscdevice.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/module.h>
+
+#include <soc/aspeed/espi.h>
+#include <uapi/linux/aspeed-espi.h>
+
+#define DEVICE_NAME	"aspeed-espi-oob"
+
+#define OOB_DMA_DESC_MAX_NUM	1024
+#define OOB_DMA_UNLOCK		0x45535049
+
+/* TX DMA descriptor type */
+#define OOB_DMA_TX_DESC_CUST	0x04
+
+struct oob_tx_dma_desc {
+	uint32_t data_addr;
+	uint8_t cyc;
+	uint16_t tag : 4;
+	uint16_t len : 12;
+	uint8_t msg_type : 3;
+	uint8_t raz0 : 1;
+	uint8_t pec : 1;
+	uint8_t int_en : 1;
+	uint8_t pause : 1;
+	uint8_t raz1 : 1;
+	uint32_t raz2;
+	uint32_t raz3;
+} __packed;
+
+struct oob_rx_dma_desc {
+	uint32_t data_addr;
+	uint8_t cyc;
+	uint16_t tag : 4;
+	uint16_t len : 12;
+	uint8_t raz : 7;
+	uint8_t dirty : 1;
+} __packed;
+
+struct aspeed_espi_oob_dma {
+	uint32_t tx_desc_num;
+	uint32_t rx_desc_num;
+
+	struct oob_tx_dma_desc *tx_desc;
+	dma_addr_t tx_desc_addr;
+
+	struct oob_rx_dma_desc *rx_desc;
+	dma_addr_t rx_desc_addr;
+
+	void *tx_virt;
+	dma_addr_t tx_addr;
+
+	void *rx_virt;
+	dma_addr_t rx_addr;
+};
+
+struct aspeed_espi_oob {
+	struct regmap *map;
+
+	int irq;
+	int irq_reset;
+
+	uint32_t dma_mode;
+	struct aspeed_espi_oob_dma dma;
+
+	uint32_t rx_ready;
+	wait_queue_head_t wq;
+
+	struct mutex get_rx_mtx;
+	struct mutex put_tx_mtx;
+
+	spinlock_t lock;
+
+	struct miscdevice mdev;
+};
+
+/* descriptor-based RX DMA handling */
+static long aspeed_espi_oob_dma_desc_get_rx(struct file *fp,
+					    struct aspeed_espi_ioc *ioc,
+					    struct aspeed_espi_oob *espi_oob)
+{
+	int rc = 0;
+	unsigned long flags;
+	uint32_t reg;
+	uint32_t rptr, wptr, sptr;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+	struct oob_rx_dma_desc *d;
+
+	regmap_read(espi_oob->map, ESPI_OOB_RX_DMA_WS_PTR, &reg);
+	wptr = (reg & ESPI_OOB_RX_DMA_WS_PTR_WP_MASK) >> ESPI_OOB_RX_DMA_WS_PTR_WP_SHIFT;
+	sptr = (reg & ESPI_OOB_RX_DMA_WS_PTR_SP_MASK) >> ESPI_OOB_RX_DMA_WS_PTR_SP_SHIFT;
+
+	regmap_read(espi_oob->map, ESPI_OOB_RX_DMA_RD_PTR, &rptr);
+
+	d = &espi_oob->dma.rx_desc[sptr];
+
+	if (!d->dirty)
+		return -EFAULT;
+
+	pkt_len = ((d->len) ? d->len : 0x1000) +
+		  sizeof(struct espi_comm_hdr);
+
+	if (ioc->pkt_len < pkt_len)
+		return -EINVAL;
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt)
+		return -ENOMEM;
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = d->cyc;
+	hdr->tag = d->tag;
+	hdr->len_h = d->len >> 8;
+	hdr->len_l = d->len & 0xff;
+	memcpy(hdr + 1, espi_oob->dma.rx_virt + (PAGE_SIZE * sptr), pkt_len - sizeof(*hdr));
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/* make the descriptor available again */
+	d->dirty = 0;
+	sptr = (sptr + 1) % espi_oob->dma.rx_desc_num;
+	wptr = (wptr + 1) % espi_oob->dma.rx_desc_num;
+
+	reg = ((wptr << ESPI_OOB_RX_DMA_WS_PTR_WP_SHIFT) & ESPI_OOB_RX_DMA_WS_PTR_WP_MASK)
+		| ((sptr << ESPI_OOB_RX_DMA_WS_PTR_SP_SHIFT) & ESPI_OOB_RX_DMA_WS_PTR_SP_MASK)
+		| ESPI_OOB_RX_DMA_WS_PTR_RECV_EN;
+
+	spin_lock_irqsave(&espi_oob->lock, flags);
+
+	regmap_write(espi_oob->map, ESPI_OOB_RX_DMA_WS_PTR, reg);
+
+	/* set ready flag base on the next RX descriptor */
+	espi_oob->rx_ready = espi_oob->dma.rx_desc[sptr].dirty;
+
+	spin_unlock_irqrestore(&espi_oob->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+	return rc;
+}
+
+static long aspeed_espi_oob_get_rx(struct file *fp,
+				   struct aspeed_espi_ioc *ioc,
+				   struct aspeed_espi_oob *espi_oob)
+{
+	int i, rc = 0;
+	unsigned long flags;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+
+	if (fp->f_flags & O_NONBLOCK) {
+		if (mutex_trylock(&espi_oob->get_rx_mtx))
+			return -EBUSY;
+
+		if (!espi_oob->rx_ready) {
+			rc = -ENODATA;
+			goto unlock_mtx_n_out;
+		}
+	} else {
+		mutex_lock(&espi_oob->get_rx_mtx);
+
+		if (!espi_oob->rx_ready) {
+			rc = wait_event_interruptible(espi_oob->wq,
+						      espi_oob->rx_ready);
+			if (rc == -ERESTARTSYS) {
+				rc = -EINTR;
+				goto unlock_mtx_n_out;
+			}
+		}
+	}
+
+	if (espi_oob->dma_mode) {
+		rc = aspeed_espi_oob_dma_desc_get_rx(fp, ioc, espi_oob);
+		goto unlock_mtx_n_out;
+	}
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_oob->map, ESPI_OOB_RX_CTRL, &reg);
+	cyc = (reg & ESPI_OOB_RX_CTRL_CYC_MASK) >> ESPI_OOB_RX_CTRL_CYC_SHIFT;
+	tag = (reg & ESPI_OOB_RX_CTRL_TAG_MASK) >> ESPI_OOB_RX_CTRL_TAG_SHIFT;
+	len = (reg & ESPI_OOB_RX_CTRL_LEN_MASK) >> ESPI_OOB_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+		  sizeof(struct espi_comm_hdr);
+
+	if (ioc->pkt_len < pkt_len) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = cyc;
+	hdr->tag = tag;
+	hdr->len_h = len >> 8;
+	hdr->len_l = len & 0xff;
+
+	for (i = sizeof(*hdr); i < pkt_len; ++i) {
+		regmap_read(espi_oob->map,
+			    ESPI_OOB_RX_PORT, &reg);
+		pkt[i] = reg & 0xff;
+	}
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	spin_lock_irqsave(&espi_oob->lock, flags);
+
+	regmap_write_bits(espi_oob->map, ESPI_OOB_RX_CTRL,
+			  ESPI_OOB_RX_CTRL_PEND_SERV,
+			  ESPI_OOB_RX_CTRL_PEND_SERV);
+
+	espi_oob->rx_ready = 0;
+
+	spin_unlock_irqrestore(&espi_oob->lock, flags);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_oob->get_rx_mtx);
+
+	return rc;
+}
+
+/* descriptor-based TX DMA handling */
+static long aspeed_espi_oob_dma_desc_put_tx(struct file *fp,
+					    struct aspeed_espi_ioc *ioc,
+					    struct aspeed_espi_oob *espi_oob)
+{
+	int rc = 0;
+	uint32_t rptr, wptr;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+	struct oob_tx_dma_desc *d;
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt)
+		return -ENOMEM;
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/* kick HW to reflect the up-to-date read/write pointer */
+	regmap_write(espi_oob->map, ESPI_OOB_TX_DMA_RD_PTR,
+		     ESPI_OOB_TX_DMA_RD_PTR_UPDATE);
+
+	regmap_read(espi_oob->map, ESPI_OOB_TX_DMA_RD_PTR, &rptr);
+	regmap_read(espi_oob->map, ESPI_OOB_TX_DMA_WR_PTR, &wptr);
+
+	if (((wptr + 1) % espi_oob->dma.tx_desc_num) == rptr)
+		return -EBUSY;
+
+	d = &espi_oob->dma.tx_desc[wptr];
+	d->cyc = hdr->cyc;
+	d->tag = hdr->tag;
+	d->len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+	d->msg_type = OOB_DMA_TX_DESC_CUST;
+
+	memcpy(espi_oob->dma.tx_virt + (PAGE_SIZE * wptr), hdr + 1,
+	       ioc->pkt_len - sizeof(*hdr));
+
+	dma_wmb();
+
+	wptr = (wptr + 1) % espi_oob->dma.tx_desc_num;
+	wptr |= ESPI_OOB_TX_DMA_WR_PTR_SEND_EN;
+	regmap_write(espi_oob->map, ESPI_OOB_TX_DMA_WR_PTR, wptr);
+
+free_n_out:
+	vfree(pkt);
+
+	return rc;
+}
+
+static long aspeed_espi_oob_put_tx(struct file *fp,
+				   struct aspeed_espi_ioc *ioc,
+				   struct aspeed_espi_oob *espi_oob)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+
+	if (!mutex_trylock(&espi_oob->put_tx_mtx))
+		return -EBUSY;
+
+	if (espi_oob->dma_mode) {
+		rc = aspeed_espi_oob_dma_desc_put_tx(fp, ioc, espi_oob);
+		goto unlock_mtx_n_out;
+	}
+
+	regmap_read(espi_oob->map, ESPI_OOB_TX_CTRL, &reg);
+	if (reg & ESPI_OOB_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_mtx_n_out;
+	}
+
+	if (ioc->pkt_len > ESPI_PKT_LEN_MAX) {
+		rc = -EINVAL;
+		goto unlock_mtx_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_mtx_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+		regmap_write(espi_oob->map,
+			     ESPI_OOB_TX_PORT, pkt[i]);
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_OOB_TX_CTRL_CYC_SHIFT) & ESPI_OOB_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_OOB_TX_CTRL_TAG_SHIFT) & ESPI_OOB_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_OOB_TX_CTRL_LEN_SHIFT) & ESPI_OOB_TX_CTRL_LEN_MASK)
+		| ESPI_OOB_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_oob->map, ESPI_OOB_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_mtx_n_out:
+	mutex_unlock(&espi_oob->put_tx_mtx);
+
+	return rc;
+}
+
+static long aspeed_espi_oob_ioctl(struct file *fp, unsigned int cmd,
+				    unsigned long arg)
+{
+	struct aspeed_espi_ioc ioc;
+	struct aspeed_espi_oob *espi_oob = container_of(
+			fp->private_data,
+			struct aspeed_espi_oob,
+			mdev);
+
+	if (copy_from_user(&ioc, (void __user *)arg, sizeof(ioc)))
+		return -EFAULT;
+
+	if (ioc.pkt_len > ESPI_PKT_LEN_MAX)
+		return -EINVAL;
+
+	switch (cmd) {
+	case ASPEED_ESPI_OOB_GET_RX:
+		return aspeed_espi_oob_get_rx(fp, &ioc, espi_oob);
+	case ASPEED_ESPI_OOB_PUT_TX:
+		return aspeed_espi_oob_put_tx(fp, &ioc, espi_oob);
+	};
+
+	return -EINVAL;
+}
+
+static const struct file_operations aspeed_espi_oob_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = aspeed_espi_oob_ioctl,
+};
+
+static irqreturn_t aspeed_espi_oob_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	unsigned long flags;
+	struct aspeed_espi_oob *espi_oob = arg;
+
+	regmap_read(espi_oob->map, ESPI_INT_STS, &sts);
+
+	if (!(sts & ESPI_INT_STS_OOB_BITS))
+		return IRQ_NONE;
+
+	if (sts & ESPI_INT_STS_OOB_RX_CMPLT) {
+		spin_lock_irqsave(&espi_oob->lock, flags);
+		espi_oob->rx_ready = 1;
+		spin_unlock_irqrestore(&espi_oob->lock, flags);
+
+		wake_up_interruptible(&espi_oob->wq);
+	}
+
+	regmap_write(espi_oob->map, ESPI_INT_STS, sts & ESPI_INT_STS_OOB_BITS);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t aspeed_espi_oob_reset_isr(int irq, void *arg)
+{
+	int i;
+	struct aspeed_espi_oob *espi_oob = arg;
+	struct aspeed_espi_oob_dma *dma = &espi_oob->dma;
+
+	disable_irq(espi_oob->irq);
+
+	if (espi_oob->dma_mode) {
+		regmap_update_bits(espi_oob->map, ESPI_CTRL,
+				   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN,
+				   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN);
+
+		for (i = 0; i < dma->rx_desc_num; ++i)
+			dma->rx_desc[i].dirty = 0;
+
+		regmap_write(espi_oob->map, ESPI_OOB_TX_DMA, dma->tx_desc_addr);
+		regmap_write(espi_oob->map, ESPI_OOB_TX_DMA_RB_SIZE, dma->tx_desc_num);
+		regmap_write(espi_oob->map, ESPI_OOB_TX_DMA_RD_PTR, OOB_DMA_UNLOCK);
+		regmap_write(espi_oob->map, ESPI_OOB_TX_DMA_WR_PTR, 0);
+
+		regmap_write(espi_oob->map, ESPI_OOB_RX_DMA, dma->rx_desc_addr);
+		regmap_write(espi_oob->map, ESPI_OOB_RX_DMA_RB_SIZE, dma->rx_desc_num);
+		regmap_write(espi_oob->map, ESPI_OOB_RX_DMA_RD_PTR, OOB_DMA_UNLOCK);
+		regmap_write(espi_oob->map, ESPI_OOB_RX_DMA_WS_PTR, 0);
+
+		regmap_update_bits(espi_oob->map, ESPI_OOB_RX_DMA_WS_PTR,
+				   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN,
+				   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN);
+	} else
+		regmap_write(espi_oob->map, ESPI_OOB_RX_CTRL, ESPI_OOB_RX_CTRL_PEND_SERV);
+
+	regmap_update_bits(espi_oob->map, ESPI_CTRL,
+			   ESPI_CTRL_OOB_SW_RDY,
+			   ESPI_CTRL_OOB_SW_RDY);
+
+	enable_irq(espi_oob->irq);
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_oob_dma_init(struct device *dev,
+				struct aspeed_espi_oob *espi_oob)
+{
+	int i;
+	struct aspeed_espi_oob_dma *dma = &espi_oob->dma;
+
+	dma->tx_desc = dma_alloc_coherent(dev, sizeof(*dma->tx_desc) * dma->tx_desc_num,
+					  &dma->tx_desc_addr, GFP_KERNEL);
+	if (!dma->tx_desc) {
+		dev_dbg(dev, "cannot allocate DMA TX descriptor\n");
+		return -ENOMEM;
+	}
+
+	dma->rx_desc = dma_alloc_coherent(dev, sizeof(*dma->rx_desc) * dma->rx_desc_num,
+					  &dma->rx_desc_addr, GFP_KERNEL);
+	if (!dma->rx_desc) {
+		dev_dbg(dev, "cannot allocate DMA RX descriptor\n");
+		return -ENOMEM;
+	}
+
+	dma->tx_virt = dma_alloc_coherent(dev, PAGE_SIZE * dma->tx_desc_num,
+					  &dma->tx_addr, GFP_KERNEL);
+	if (!dma->tx_virt) {
+		dev_dbg(dev, "cannot allocate DMA TX buffer\n");
+		return -ENOMEM;
+	}
+
+	dma->rx_virt = dma_alloc_coherent(dev, PAGE_SIZE * dma->rx_desc_num,
+					  &dma->rx_addr, GFP_KERNEL);
+	if (!dma->rx_virt) {
+		dev_dbg(dev, "cannot allocate DMA RX buffer\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < dma->tx_desc_num; ++i)
+		dma->tx_desc[i].data_addr = dma->tx_addr + (i * PAGE_SIZE);
+
+	for (i = 0; i < dma->rx_desc_num; ++i) {
+		dma->rx_desc[i].data_addr = dma->rx_addr + (i * PAGE_SIZE);
+		dma->rx_desc[i].dirty = 0;
+	}
+
+	regmap_update_bits(espi_oob->map, ESPI_CTRL,
+			   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN,
+			   ESPI_CTRL_OOB_TX_DMA_EN | ESPI_CTRL_OOB_RX_DMA_EN);
+
+	regmap_write(espi_oob->map, ESPI_OOB_TX_DMA, dma->tx_desc_addr);
+	regmap_write(espi_oob->map, ESPI_OOB_TX_DMA_RB_SIZE, dma->tx_desc_num);
+
+	regmap_write(espi_oob->map, ESPI_OOB_RX_DMA, dma->rx_desc_addr);
+	regmap_write(espi_oob->map, ESPI_OOB_RX_DMA_RB_SIZE, dma->rx_desc_num);
+	regmap_update_bits(espi_oob->map, ESPI_OOB_RX_DMA_WS_PTR,
+			   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN,
+			   ESPI_OOB_RX_DMA_WS_PTR_RECV_EN);
+
+	return 0;
+}
+
+static int aspeed_espi_oob_init(struct device *dev,
+				struct aspeed_espi_oob *espi_oob)
+{
+	int rc;
+
+	if (espi_oob->dma_mode) {
+		rc = aspeed_espi_oob_dma_init(dev, espi_oob);
+		if (rc)
+			return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_oob->irq, aspeed_espi_oob_isr,
+			      0, DEVICE_NAME, espi_oob);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI out-of-band channel irq\n");
+		return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_oob->irq_reset, aspeed_espi_oob_reset_isr,
+			      IRQF_SHARED, DEVICE_NAME, espi_oob);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI channel reset irq\n");
+		return rc;
+	}
+
+	init_waitqueue_head(&espi_oob->wq);
+
+	spin_lock_init(&espi_oob->lock);
+
+	mutex_init(&espi_oob->put_tx_mtx);
+	mutex_init(&espi_oob->get_rx_mtx);
+
+	espi_oob->mdev.parent = dev;
+	espi_oob->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_oob->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", DEVICE_NAME);
+	espi_oob->mdev.fops = &aspeed_espi_oob_fops;
+	rc = misc_register(&espi_oob->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return rc;
+	}
+
+	regmap_update_bits(espi_oob->map, ESPI_CTRL,
+			   ESPI_CTRL_OOB_SW_RDY,
+			   ESPI_CTRL_OOB_SW_RDY);
+
+	return 0;
+}
+
+static int aspeed_espi_oob_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct aspeed_espi_oob *espi_oob;
+	struct aspeed_espi_oob_dma *dma;
+	struct device *dev = &pdev->dev;
+
+	espi_oob = devm_kzalloc(dev, sizeof(*espi_oob), GFP_KERNEL);
+	if (!espi_oob)
+		return -ENOMEM;
+
+	espi_oob->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(espi_oob->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return PTR_ERR(espi_oob->map);
+	}
+
+	espi_oob->irq = platform_get_irq(pdev, 0);
+	if (espi_oob->irq < 0)
+		return espi_oob->irq;
+
+	espi_oob->irq_reset = platform_get_irq(pdev, 1);
+	if (espi_oob->irq_reset < 0)
+		return espi_oob->irq_reset;
+
+	if (of_property_read_bool(dev->of_node, "dma-mode"))
+		espi_oob->dma_mode = 1;
+
+	if (espi_oob->dma_mode) {
+		dma = &espi_oob->dma;
+
+		of_property_read_u32(dev->of_node, "dma-tx-desc-num",
+				     &dma->tx_desc_num);
+		of_property_read_u32(dev->of_node, "dma-rx-desc-num",
+				     &dma->rx_desc_num);
+
+		if (!dma->tx_desc_num || dma->tx_desc_num >= OOB_DMA_DESC_MAX_NUM) {
+			dev_err(dev, "invalid number of TX DMA descriptors\n");
+			return -EINVAL;
+		}
+
+		if (!dma->rx_desc_num || dma->rx_desc_num >= OOB_DMA_DESC_MAX_NUM) {
+			dev_err(dev, "invalid number of RX DMA descriptors\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * DMA descriptors are consumed in the circular
+		 * queue paradigm. Therefore, one dummy slot is
+		 * reserved to detect the full condition.
+		 */
+		dma->tx_desc_num += 1;
+		dma->rx_desc_num += 1;
+	}
+
+	rc = aspeed_espi_oob_init(dev, espi_oob);
+	if (rc)
+		return rc;
+
+	dev_set_drvdata(dev, espi_oob);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_espi_oob_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_oob *espi_oob = dev_get_drvdata(dev);
+	struct aspeed_espi_oob_dma *dma;
+
+	mutex_destroy(&espi_oob->put_tx_mtx);
+	mutex_destroy(&espi_oob->get_rx_mtx);
+
+	if (!espi_oob->dma_mode)
+		return 0;
+
+	dma = &espi_oob->dma;
+
+	if (dma->tx_desc)
+		dma_free_coherent(dev, sizeof(*dma->tx_desc) * dma->tx_desc_num,
+				  dma->tx_desc, dma->tx_desc_addr);
+
+	if (dma->rx_desc)
+		dma_free_coherent(dev, sizeof(*dma->rx_desc) * dma->rx_desc_num,
+				  dma->rx_desc, dma->rx_desc_addr);
+
+	if (dma->tx_virt)
+		dma_free_coherent(dev, PAGE_SIZE * dma->tx_desc_num,
+				  dma->tx_virt, dma->tx_addr);
+
+	if (dma->rx_virt)
+		dma_free_coherent(dev, PAGE_SIZE * dma->rx_desc_num,
+				  dma->rx_virt, dma->rx_addr);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_espi_oob_match[] = {
+	{ .compatible = "aspeed,ast2600-espi-oob" },
+	{ }
+};
+
+static struct platform_driver aspeed_espi_oob_driver = {
+	.driver = {
+		.name           = DEVICE_NAME,
+		.of_match_table = aspeed_espi_oob_match,
+	},
+	.probe  = aspeed_espi_oob_probe,
+	.remove = aspeed_espi_oob_remove,
+};
+
+module_platform_driver(aspeed_espi_oob_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of Aspeed eSPI out-of-band channel");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/aspeed/aspeed-espi-peripheral.c b/drivers/soc/aspeed/aspeed-espi-peripheral.c
new file mode 100644
index 000000000000..852456d7019e
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-peripheral.c
@@ -0,0 +1,613 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/miscdevice.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/uaccess.h>
+
+#include <soc/aspeed/espi.h>
+#include <uapi/linux/aspeed-espi.h>
+
+#define DEVICE_NAME	"aspeed-espi-peripheral"
+
+#define MEMCYC_SIZE_MIN		0x10000
+
+struct aspeed_espi_perif_dma {
+	void *pc_tx_virt;
+	dma_addr_t pc_tx_addr;
+
+	void *pc_rx_virt;
+	dma_addr_t pc_rx_addr;
+
+	void *np_tx_virt;
+	dma_addr_t np_tx_addr;
+};
+
+struct aspeed_espi_perif {
+	struct regmap *map;
+
+	int	irq;
+	int irq_reset;
+
+	void *mcyc_virt;
+	phys_addr_t mcyc_saddr;
+	phys_addr_t mcyc_taddr;
+	uint32_t mcyc_size;
+	uint32_t mcyc_mask;
+
+	uint32_t dma_mode;
+	struct aspeed_espi_perif_dma dma;
+
+	uint32_t rx_ready;
+	wait_queue_head_t wq;
+
+	spinlock_t rx_lock;
+	struct mutex pc_tx_lock;
+	struct mutex np_tx_lock;
+
+	struct miscdevice mdev;
+};
+
+static long aspeed_espi_perif_pc_get_rx(struct file *fp,
+					struct aspeed_espi_ioc *ioc,
+					struct aspeed_espi_perif *espi_perif)
+{
+	int i, rc;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	uint32_t pkt_len;
+	struct espi_comm_hdr *hdr;
+	unsigned long flags;
+
+	if (!espi_perif->rx_ready) {
+		if (fp->f_flags & O_NONBLOCK)
+			return -ENODATA;
+
+		rc = wait_event_interruptible(espi_perif->wq, espi_perif->rx_ready);
+		if (rc == -ERESTARTSYS)
+			return -EINTR;
+	}
+
+	/* common header (i.e. cycle type, tag, and length) is taken by HW */
+	regmap_read(espi_perif->map, ESPI_PERIF_PC_RX_CTRL, &reg);
+	cyc = (reg & ESPI_PERIF_PC_RX_CTRL_CYC_MASK) >> ESPI_PERIF_PC_RX_CTRL_CYC_SHIFT;
+	tag = (reg & ESPI_PERIF_PC_RX_CTRL_TAG_MASK) >> ESPI_PERIF_PC_RX_CTRL_TAG_SHIFT;
+	len = (reg & ESPI_PERIF_PC_RX_CTRL_LEN_MASK) >> ESPI_PERIF_PC_RX_CTRL_LEN_SHIFT;
+
+	/*
+	 * calculate the length of the rest part of the
+	 * eSPI packet to be read from HW and copied to
+	 * user space.
+	 */
+	switch (cyc) {
+	case ESPI_PERIF_MSG:
+		pkt_len = len + sizeof(struct espi_perif_msg);
+		break;
+	case ESPI_PERIF_MSG_D:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_perif_msg);
+		break;
+	case ESPI_PERIF_SUC_CMPLT_D_MIDDLE:
+	case ESPI_PERIF_SUC_CMPLT_D_FIRST:
+	case ESPI_PERIF_SUC_CMPLT_D_LAST:
+	case ESPI_PERIF_SUC_CMPLT_D_ONLY:
+		pkt_len = ((len) ? len : ESPI_PLD_LEN_MAX) +
+			  sizeof(struct espi_perif_cmplt);
+		break;
+	case ESPI_PERIF_SUC_CMPLT:
+	case ESPI_PERIF_UNSUC_CMPLT:
+		pkt_len = len + sizeof(struct espi_perif_cmplt);
+		break;
+	default:
+		return -EFAULT;
+	}
+
+	if (ioc->pkt_len < pkt_len)
+		return -EINVAL;
+
+	pkt = vmalloc(pkt_len);
+	if (!pkt)
+		return -ENOMEM;
+
+	hdr = (struct espi_comm_hdr *)pkt;
+	hdr->cyc = cyc;
+	hdr->tag = tag;
+	hdr->len_h = len >> 8;
+	hdr->len_l = len & 0xff;
+
+	if (espi_perif->dma_mode) {
+		memcpy(hdr + 1, espi_perif->dma.pc_rx_virt,
+		       pkt_len - sizeof(*hdr));
+	} else {
+		for (i = sizeof(*hdr); i < pkt_len; ++i) {
+			regmap_read(espi_perif->map,
+				    ESPI_PERIF_PC_RX_PORT, &reg);
+			pkt[i] = reg & 0xff;
+		}
+	}
+
+	if (copy_to_user((void __user *)ioc->pkt, pkt, pkt_len))
+		return -EFAULT;
+
+	spin_lock_irqsave(&espi_perif->rx_lock, flags);
+
+	regmap_write_bits(espi_perif->map, ESPI_PERIF_PC_RX_CTRL,
+			  ESPI_PERIF_PC_RX_CTRL_PEND_SERV,
+			  ESPI_PERIF_PC_RX_CTRL_PEND_SERV);
+
+	espi_perif->rx_ready = 0;
+
+	spin_unlock_irqrestore(&espi_perif->rx_lock, flags);
+
+	return pkt_len;
+}
+
+static long aspeed_espi_perif_pc_put_tx(struct file *fp,
+					struct aspeed_espi_ioc *ioc,
+					struct aspeed_espi_perif *espi_perif)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+
+	if (!mutex_trylock(&espi_perif->pc_tx_lock))
+		return -EAGAIN;
+
+	regmap_read(espi_perif->map, ESPI_PERIF_PC_TX_CTRL, &reg);
+	if (reg & ESPI_PERIF_PC_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_perif->dma_mode) {
+		memcpy(espi_perif->dma.pc_tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_perif->map,
+				     ESPI_PERIF_PC_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_PERIF_PC_TX_CTRL_CYC_SHIFT) & ESPI_PERIF_PC_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_PERIF_PC_TX_CTRL_TAG_SHIFT) & ESPI_PERIF_PC_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_PERIF_PC_TX_CTRL_LEN_SHIFT) & ESPI_PERIF_PC_TX_CTRL_LEN_MASK)
+		| ESPI_PERIF_PC_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_perif->map, ESPI_PERIF_PC_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_n_out:
+	mutex_unlock(&espi_perif->pc_tx_lock);
+
+	return rc;
+}
+
+static long aspeed_espi_perif_np_put_tx(struct file *fp,
+					struct aspeed_espi_ioc *ioc,
+					struct aspeed_espi_perif *espi_perif)
+{
+	int i, rc = 0;
+	uint32_t reg;
+	uint32_t cyc, tag, len;
+	uint8_t *pkt;
+	struct espi_comm_hdr *hdr;
+
+	if (!mutex_trylock(&espi_perif->np_tx_lock))
+		return -EAGAIN;
+
+	regmap_read(espi_perif->map, ESPI_PERIF_NP_TX_CTRL, &reg);
+	if (reg & ESPI_PERIF_NP_TX_CTRL_TRIGGER) {
+		rc = -EBUSY;
+		goto unlock_n_out;
+	}
+
+	pkt = vmalloc(ioc->pkt_len);
+	if (!pkt) {
+		rc = -ENOMEM;
+		goto unlock_n_out;
+	}
+
+	hdr = (struct espi_comm_hdr *)pkt;
+
+	if (copy_from_user(pkt, (void __user *)ioc->pkt, ioc->pkt_len)) {
+		rc = -EFAULT;
+		goto free_n_out;
+	}
+
+	/*
+	 * common header (i.e. cycle type, tag, and length)
+	 * part is written to HW registers
+	 */
+	if (espi_perif->dma_mode) {
+		memcpy(espi_perif->dma.pc_tx_virt, hdr + 1,
+		       ioc->pkt_len - sizeof(*hdr));
+		dma_wmb();
+	} else {
+		for (i = sizeof(*hdr); i < ioc->pkt_len; ++i)
+			regmap_write(espi_perif->map,
+				     ESPI_PERIF_NP_TX_PORT, pkt[i]);
+	}
+
+	cyc = hdr->cyc;
+	tag = hdr->tag;
+	len = (hdr->len_h << 8) | (hdr->len_l & 0xff);
+
+	reg = ((cyc << ESPI_PERIF_NP_TX_CTRL_CYC_SHIFT) & ESPI_PERIF_NP_TX_CTRL_CYC_MASK)
+		| ((tag << ESPI_PERIF_NP_TX_CTRL_TAG_SHIFT) & ESPI_PERIF_NP_TX_CTRL_TAG_MASK)
+		| ((len << ESPI_PERIF_NP_TX_CTRL_LEN_SHIFT) & ESPI_PERIF_NP_TX_CTRL_LEN_MASK)
+		| ESPI_PERIF_NP_TX_CTRL_TRIGGER;
+
+	regmap_write(espi_perif->map, ESPI_PERIF_NP_TX_CTRL, reg);
+
+free_n_out:
+	vfree(pkt);
+
+unlock_n_out:
+	mutex_unlock(&espi_perif->np_tx_lock);
+
+	return rc;
+
+}
+
+static long aspeed_espi_perif_ioctl(struct file *fp, unsigned int cmd,
+				    unsigned long arg)
+{
+	struct aspeed_espi_ioc ioc;
+	struct aspeed_espi_perif *espi_perif = container_of(
+			fp->private_data,
+			struct aspeed_espi_perif,
+			mdev);
+
+	if (copy_from_user(&ioc, (void __user *)arg, sizeof(ioc)))
+		return -EFAULT;
+
+	if (ioc.pkt_len > ESPI_PKT_LEN_MAX)
+		return -EINVAL;
+
+	switch (cmd) {
+	case ASPEED_ESPI_PERIF_PC_GET_RX:
+		return aspeed_espi_perif_pc_get_rx(fp, &ioc, espi_perif);
+	case ASPEED_ESPI_PERIF_PC_PUT_TX:
+		return aspeed_espi_perif_pc_put_tx(fp, &ioc, espi_perif);
+	case ASPEED_ESPI_PERIF_NP_PUT_TX:
+		return aspeed_espi_perif_np_put_tx(fp, &ioc, espi_perif);
+	};
+
+	return -EINVAL;
+}
+
+static int aspeed_espi_perif_mmap(struct file *fp, struct vm_area_struct *vma)
+{
+	struct aspeed_espi_perif *espi_perif = container_of(
+			fp->private_data,
+			struct aspeed_espi_perif,
+			mdev);
+	unsigned long vm_size = vma->vm_end - vma->vm_start;
+	pgprot_t prot = vma->vm_page_prot;
+
+	if (((vma->vm_pgoff << PAGE_SHIFT) + vm_size) > espi_perif->mcyc_size)
+		return -EINVAL;
+
+	prot = pgprot_noncached(prot);
+
+	if (remap_pfn_range(vma, vma->vm_start,
+			    (espi_perif->mcyc_taddr >> PAGE_SHIFT) + vma->vm_pgoff,
+			    vm_size, prot))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static const struct file_operations aspeed_espi_perif_fops = {
+	.owner = THIS_MODULE,
+	.mmap = aspeed_espi_perif_mmap,
+	.unlocked_ioctl = aspeed_espi_perif_ioctl,
+};
+
+static irqreturn_t aspeed_espi_peripheral_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	unsigned long flags;
+	struct aspeed_espi_perif *espi_perif = arg;
+
+	regmap_read(espi_perif->map, ESPI_INT_STS, &sts);
+
+	if (!(sts & ESPI_INT_STS_PERIF_BITS))
+		return IRQ_NONE;
+
+	if (sts & ESPI_INT_STS_PERIF_PC_RX_CMPLT) {
+		spin_lock_irqsave(&espi_perif->rx_lock, flags);
+		espi_perif->rx_ready = 1;
+		spin_unlock_irqrestore(&espi_perif->rx_lock, flags);
+
+		wake_up_interruptible(&espi_perif->wq);
+	}
+
+	regmap_write(espi_perif->map, ESPI_INT_STS, sts & ESPI_INT_STS_PERIF_BITS);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t aspeed_espi_peripheral_reset_isr(int irq, void *arg)
+{
+	struct aspeed_espi_perif *espi_perif = arg;
+	struct aspeed_espi_perif_dma *dma = &espi_perif->dma;
+
+	disable_irq(espi_perif->irq);
+
+	if (espi_perif->dma_mode) {
+		regmap_write(espi_perif->map, ESPI_PERIF_PC_RX_DMA, dma->pc_rx_addr);
+		regmap_write(espi_perif->map, ESPI_PERIF_PC_TX_DMA, dma->pc_tx_addr);
+		regmap_write(espi_perif->map, ESPI_PERIF_NP_TX_DMA, dma->np_tx_addr);
+
+		regmap_update_bits(espi_perif->map, ESPI_CTRL,
+				   ESPI_CTRL_PERIF_NP_TX_DMA_EN
+				   | ESPI_CTRL_PERIF_PC_TX_DMA_EN
+				   | ESPI_CTRL_PERIF_PC_RX_DMA_EN,
+				   ESPI_CTRL_PERIF_NP_TX_DMA_EN
+				   | ESPI_CTRL_PERIF_PC_TX_DMA_EN
+				   | ESPI_CTRL_PERIF_PC_RX_DMA_EN);
+	}
+
+	regmap_update_bits(espi_perif->map, ESPI_CTRL,
+			   ESPI_CTRL_PERIF_SW_RDY,
+			   ESPI_CTRL_PERIF_SW_RDY);
+
+	enable_irq(espi_perif->irq);
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_peripheral_dma_init(struct platform_device *pdev,
+				       struct aspeed_espi_perif *espi_perif)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_perif_dma *dma = &espi_perif->dma;
+
+	dma->pc_tx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+					     &dma->pc_tx_addr, GFP_KERNEL);
+	if (!dma->pc_tx_virt) {
+		dev_dbg(dev, "cannot allocate posted TX DMA buffer\n");
+		return -ENOMEM;
+	}
+
+	dma->pc_rx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+					     &dma->pc_rx_addr, GFP_KERNEL);
+	if (!dma->pc_rx_virt) {
+		dev_dbg(dev, "cannot allocate posted RX DMA buffer\n");
+		return -ENOMEM;
+	}
+
+	dma->np_tx_virt = dma_alloc_coherent(dev, PAGE_SIZE,
+			&dma->np_tx_addr, GFP_KERNEL);
+	if (!dma->np_tx_virt) {
+		dev_dbg(dev, "cannot allocate non-posted TX DMA buffer\n");
+		return -ENOMEM;
+	}
+
+	regmap_write(espi_perif->map, ESPI_PERIF_PC_RX_DMA, dma->pc_rx_addr);
+	regmap_write(espi_perif->map, ESPI_PERIF_PC_TX_DMA, dma->pc_tx_addr);
+	regmap_write(espi_perif->map, ESPI_PERIF_NP_TX_DMA, dma->np_tx_addr);
+
+	regmap_update_bits(espi_perif->map, ESPI_CTRL,
+			   ESPI_CTRL_PERIF_NP_TX_DMA_EN
+			   | ESPI_CTRL_PERIF_PC_TX_DMA_EN
+			   | ESPI_CTRL_PERIF_PC_RX_DMA_EN,
+			   ESPI_CTRL_PERIF_NP_TX_DMA_EN
+			   | ESPI_CTRL_PERIF_PC_TX_DMA_EN
+			   | ESPI_CTRL_PERIF_PC_RX_DMA_EN);
+
+	return 0;
+}
+
+static int aspeed_espi_peripheral_init(struct platform_device *pdev,
+				       struct aspeed_espi_perif *espi_perif)
+{
+	int rc;
+	struct device *dev = &pdev->dev;
+
+	espi_perif->mcyc_virt = dma_alloc_coherent(dev, espi_perif->mcyc_size,
+						   &espi_perif->mcyc_taddr, GFP_KERNEL);
+	if (!espi_perif->mcyc_virt) {
+		dev_dbg(dev, "cannot allocate memory cycle region\n");
+		return -ENOMEM;
+	}
+
+	regmap_write(espi_perif->map, ESPI_PERIF_PC_RX_MASK,
+		     espi_perif->mcyc_mask | ESPI_PERIF_PC_RX_MASK_CFG_WP);
+	regmap_update_bits(espi_perif->map, ESPI_CTRL2,
+			   ESPI_CTRL2_MEMCYC_RD_DIS | ESPI_CTRL2_MEMCYC_WR_DIS, 0);
+
+	regmap_write(espi_perif->map, ESPI_PERIF_PC_RX_SADDR,
+		     espi_perif->mcyc_saddr);
+	regmap_write(espi_perif->map, ESPI_PERIF_PC_RX_TADDR,
+		     espi_perif->mcyc_taddr);
+
+	if (espi_perif->dma_mode) {
+		rc = aspeed_espi_peripheral_dma_init(pdev, espi_perif);
+		if (rc)
+			return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_perif->irq, aspeed_espi_peripheral_isr,
+			      0, DEVICE_NAME, espi_perif);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI peripheral channel irq\n");
+		return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_perif->irq_reset, aspeed_espi_peripheral_reset_isr,
+			      IRQF_SHARED, DEVICE_NAME, espi_perif);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI channel reset irq\n");
+		return rc;
+	}
+
+	init_waitqueue_head(&espi_perif->wq);
+
+	spin_lock_init(&espi_perif->rx_lock);
+	mutex_init(&espi_perif->pc_tx_lock);
+	mutex_init(&espi_perif->np_tx_lock);
+
+	espi_perif->mdev.parent = dev;
+	espi_perif->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_perif->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", DEVICE_NAME);
+	espi_perif->mdev.fops = &aspeed_espi_perif_fops;
+	rc = misc_register(&espi_perif->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return rc;
+	}
+
+	regmap_update_bits(espi_perif->map, ESPI_CTRL,
+			   ESPI_CTRL_PERIF_SW_RDY,
+			   ESPI_CTRL_PERIF_SW_RDY);
+
+	return 0;
+}
+
+static int aspeed_espi_peripheral_probe(struct platform_device *pdev)
+{
+	int rc = 0;
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_perif *espi_perif;
+
+	espi_perif = devm_kzalloc(&pdev->dev, sizeof(*espi_perif), GFP_KERNEL);
+	if (!espi_perif)
+		return -ENOMEM;
+
+	espi_perif->map = syscon_node_to_regmap(
+			dev->parent->of_node);
+	if (IS_ERR(espi_perif->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return -ENODEV;
+	}
+
+	espi_perif->irq = platform_get_irq(pdev, 0);
+	if (espi_perif->irq < 0)
+		return espi_perif->irq;
+
+	espi_perif->irq_reset = platform_get_irq(pdev, 1);
+	if (espi_perif->irq_reset < 0)
+		return espi_perif->irq_reset;
+
+	rc = of_property_read_u32(dev->of_node, "memcyc,map-src-addr", &espi_perif->mcyc_saddr);
+	if (rc) {
+		dev_err(dev, "cannot get Host mapping address for memroy cycle\n");
+		return -ENODEV;
+	}
+
+	rc = of_property_read_u32(dev->of_node, "memcyc,map-size", &espi_perif->mcyc_size);
+	if (rc) {
+		dev_err(dev, "cannot get size for memory cycle\n");
+		return -ENODEV;
+	}
+
+	if (espi_perif->mcyc_size < MEMCYC_SIZE_MIN)
+		espi_perif->mcyc_size = MEMCYC_SIZE_MIN;
+
+	espi_perif->mcyc_size = roundup_pow_of_two(espi_perif->mcyc_size);
+	espi_perif->mcyc_mask = ~(espi_perif->mcyc_size - 1);
+
+	espi_perif->dma_mode = of_property_read_bool(pdev->dev.of_node,
+						     "dma-mode");
+
+	rc = aspeed_espi_peripheral_init(pdev, espi_perif);
+	if (rc)
+		return rc;
+
+	dev_set_drvdata(dev, espi_perif);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_espi_peripheral_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aspeed_espi_perif *espi_perif = dev_get_drvdata(dev);
+	struct aspeed_espi_perif_dma *dma;
+
+	mutex_destroy(&espi_perif->pc_tx_lock);
+	mutex_destroy(&espi_perif->np_tx_lock);
+
+	if (espi_perif->mcyc_virt)
+		dma_free_coherent(dev, espi_perif->mcyc_size,
+				  espi_perif->mcyc_virt,
+				  espi_perif->mcyc_taddr);
+
+	if (!espi_perif->dma_mode)
+		return 0;
+
+	dma = &espi_perif->dma;
+
+	if (dma->pc_tx_virt)
+		dma_free_coherent(dev, PAGE_SIZE, dma->pc_tx_virt,
+				  dma->pc_tx_addr);
+	if (dma->pc_rx_virt)
+		dma_free_coherent(dev, PAGE_SIZE, dma->pc_rx_virt,
+				  dma->pc_rx_addr);
+	if (dma->np_tx_virt)
+		dma_free_coherent(dev, PAGE_SIZE, dma->np_tx_virt,
+				  dma->np_tx_addr);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_espi_peripheral_match[] = {
+	{ .compatible = "aspeed,ast2600-espi-peripheral" },
+	{ }
+};
+
+static struct platform_driver aspeed_espi_peripheral_driver = {
+	.driver = {
+		.name           = DEVICE_NAME,
+		.of_match_table = aspeed_espi_peripheral_match,
+	},
+	.probe  = aspeed_espi_peripheral_probe,
+	.remove = aspeed_espi_peripheral_remove,
+};
+
+module_platform_driver(aspeed_espi_peripheral_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of Aspeed eSPI peripheral channel");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/aspeed/aspeed-espi-vw.c b/drivers/soc/aspeed/aspeed-espi-vw.c
new file mode 100644
index 000000000000..60cf775b09ed
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-espi-vw.c
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/miscdevice.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/uaccess.h>
+
+#include <soc/aspeed/espi.h>
+#include <uapi/linux/aspeed-espi.h>
+
+#define DEVICE_NAME	"aspeed-espi-vw"
+
+struct aspeed_espi_vw {
+	struct regmap *map;
+
+	int irq;
+	int irq_reset;
+
+	struct miscdevice mdev;
+};
+
+static long aspeed_espi_vw_ioctl(struct file *fp, unsigned int cmd,
+				    unsigned long arg)
+{
+	uint32_t val;
+
+	struct aspeed_espi_vw *espi_vw = container_of(
+			fp->private_data,
+			struct aspeed_espi_vw,
+			mdev);
+
+	switch (cmd) {
+	case ASPEED_ESPI_VW_GET_GPIO_VAL:
+		regmap_read(espi_vw->map, ESPI_VW_GPIO_VAL, &val);
+		if (put_user(val, (uint32_t __user *)arg))
+			return -EFAULT;
+		break;
+
+	case ASPEED_ESPI_VW_PUT_GPIO_VAL:
+		if (get_user(val, (uint32_t __user *)arg))
+			return -EFAULT;
+		regmap_write(espi_vw->map, ESPI_VW_GPIO_VAL, val);
+		break;
+
+	default:
+		return -EINVAL;
+	};
+
+	return 0;
+}
+
+static const struct file_operations aspeed_espi_vw_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = aspeed_espi_vw_ioctl,
+};
+
+static irqreturn_t aspeed_espi_vw_isr(int irq, void *arg)
+{
+	uint32_t sts;
+	uint32_t sysevt_sts;
+
+	struct aspeed_espi_vw *espi_vw = arg;
+
+	regmap_read(espi_vw->map, ESPI_INT_STS, &sts);
+
+	if (!(sts & ESPI_INT_STS_VW_BITS))
+		return IRQ_NONE;
+
+	if (sts & ESPI_INT_STS_VW_SYSEVT) {
+		regmap_read(espi_vw->map, ESPI_SYSEVT_INT_STS, &sysevt_sts);
+		regmap_write(espi_vw->map, ESPI_SYSEVT_INT_STS, sysevt_sts);
+	}
+
+	if (sts & ESPI_INT_STS_VW_SYSEVT1) {
+		regmap_read(espi_vw->map, ESPI_SYSEVT1_INT_STS, &sysevt_sts);
+
+		if (sysevt_sts & ESPI_SYSEVT1_INT_STS_SUSPEND_WARN)
+			regmap_update_bits(espi_vw->map, ESPI_SYSEVT1,
+					   ESPI_SYSEVT1_SUSPEND_ACK,
+					   ESPI_SYSEVT1_SUSPEND_ACK);
+
+		regmap_write(espi_vw->map, ESPI_SYSEVT1_INT_STS, sysevt_sts);
+	}
+
+	regmap_write(espi_vw->map, ESPI_INT_STS, sts & ESPI_INT_STS_VW_BITS);
+
+	return IRQ_HANDLED;
+
+}
+
+static irqreturn_t aspeed_espi_vw_reset_isr(int irq, void *arg)
+{
+	struct aspeed_espi_vw *espi_vw = arg;
+
+	disable_irq(espi_vw->irq);
+
+	regmap_update_bits(espi_vw->map, ESPI_CTRL,
+			   ESPI_CTRL_VW_SW_RDY,
+			   ESPI_CTRL_VW_SW_RDY);
+
+	enable_irq(espi_vw->irq);
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_espi_vw_init(struct device *dev,
+		struct aspeed_espi_vw *espi_vw)
+{
+	int rc;
+
+	rc = devm_request_irq(dev, espi_vw->irq, aspeed_espi_vw_isr,
+			0, DEVICE_NAME, espi_vw);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI virtual wire channel irq\n");
+		return rc;
+	}
+
+	rc = devm_request_irq(dev, espi_vw->irq_reset, aspeed_espi_vw_reset_isr,
+			IRQF_SHARED, DEVICE_NAME, espi_vw);
+	if (rc) {
+		dev_err(dev, "cannot request eSPI channel reset irq\n");
+		return rc;
+	}
+
+	espi_vw->mdev.parent = dev;
+	espi_vw->mdev.minor = MISC_DYNAMIC_MINOR;
+	espi_vw->mdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s", DEVICE_NAME);
+	espi_vw->mdev.fops = &aspeed_espi_vw_fops;
+	rc = misc_register(&espi_vw->mdev);
+	if (rc) {
+		dev_err(dev, "cannot register device\n");
+		return rc;
+	}
+
+	regmap_update_bits(espi_vw->map, ESPI_CTRL,
+			   ESPI_CTRL_VW_SW_RDY,
+			   ESPI_CTRL_VW_SW_RDY);
+
+	return 0;
+}
+
+static int aspeed_espi_vw_probe(struct platform_device *pdev)
+{
+	int rc = 0;
+	struct aspeed_espi_vw *espi_vw;
+	struct device *dev = &pdev->dev;
+
+	espi_vw = devm_kzalloc(dev, sizeof(*espi_vw), GFP_KERNEL);
+	if (!espi_vw)
+		return -ENOMEM;
+
+	espi_vw->map = syscon_node_to_regmap(
+			dev->parent->of_node);
+	if (IS_ERR(espi_vw->map)) {
+		dev_err(dev, "cannot get regmap\n");
+		return -ENODEV;
+	}
+
+	espi_vw->irq = platform_get_irq(pdev, 0);
+	if (espi_vw->irq < 0)
+		return espi_vw->irq;
+
+	espi_vw->irq_reset = platform_get_irq(pdev, 1);
+	if (espi_vw->irq_reset < 0)
+		return espi_vw->irq_reset;
+
+	rc = aspeed_espi_vw_init(dev, espi_vw);
+	if (rc)
+		return rc;
+
+	dev_set_drvdata(dev, espi_vw);
+
+	dev_info(dev, "module loaded\n");
+
+	return 0;
+}
+
+static int aspeed_espi_vw_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static const struct of_device_id aspeed_espi_vw_match[] = {
+	{ .compatible = "aspeed,ast2600-espi-vw" },
+	{ }
+};
+
+static struct platform_driver aspeed_espi_vw_driver = {
+	.driver = {
+		.name           = DEVICE_NAME,
+		.of_match_table = aspeed_espi_vw_match,
+	},
+	.probe  = aspeed_espi_vw_probe,
+	.remove = aspeed_espi_vw_remove,
+};
+
+module_platform_driver(aspeed_espi_vw_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
+MODULE_DESCRIPTION("Control of eSPI virtual wire channel");
+MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/aspeed-espi.h b/include/uapi/linux/aspeed-espi.h
new file mode 100644
index 000000000000..eb5633b33e66
--- /dev/null
+++ b/include/uapi/linux/aspeed-espi.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 Aspeed Technology Inc.
+ * Author: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+ */
+#ifndef _UAPI_LINUX_ASPEED_ESPI_H
+#define _UAPI_LINUX_ASPEED_ESPI_H
+
+#ifdef __KERNEL__
+#include <linux/ioctl.h>
+#include <linux/types.h>
+#else
+#include <sys/ioctl.h>
+#include <stdint.h>
+#endif
+
+/*
+ * eSPI cycle type encoding
+ *
+ * Section 5.1 Cycle Types and Packet Format,
+ * Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
+ */
+#define ESPI_PERIF_MEMRD32		0x00
+#define ESPI_PERIF_MEMRD64		0x02
+#define ESPI_PERIF_MEMWR32		0x01
+#define ESPI_PERIF_MEMWR64		0x03
+#define ESPI_PERIF_MSG			0x10
+#define ESPI_PERIF_MSG_D		0x11
+#define ESPI_PERIF_SUC_CMPLT		0x06
+#define ESPI_PERIF_SUC_CMPLT_D_MIDDLE	0x09
+#define ESPI_PERIF_SUC_CMPLT_D_FIRST	0x0b
+#define ESPI_PERIF_SUC_CMPLT_D_LAST	0x0d
+#define ESPI_PERIF_SUC_CMPLT_D_ONLY	0x0f
+#define ESPI_PERIF_UNSUC_CMPLT		0x0c
+#define ESPI_OOB_MSG			0x21
+#define ESPI_FLASH_READ			0x00
+#define ESPI_FLASH_WRITE		0x01
+#define ESPI_FLASH_ERASE		0x02
+#define ESPI_FLASH_SUC_CMPLT		0x06
+#define ESPI_FLASH_SUC_CMPLT_D_MIDDLE	0x09
+#define ESPI_FLASH_SUC_CMPLT_D_FIRST	0x0b
+#define ESPI_FLASH_SUC_CMPLT_D_LAST	0x0d
+#define ESPI_FLASH_SUC_CMPLT_D_ONLY	0x0f
+#define ESPI_FLASH_UNSUC_CMPLT		0x0c
+
+/*
+ * eSPI packet format structure
+ *
+ * Section 5.1 Cycle Types and Packet Format,
+ * Intel eSPI Interface Base Specification, Rev 1.0, Jan. 2016.
+ */
+struct espi_comm_hdr {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+};
+
+struct espi_perif_mem32 {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint32_t addr_be;
+	uint8_t data[];
+} __attribute__((packed));
+
+struct espi_perif_mem64 {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint32_t addr_be;
+	uint8_t data[];
+} __attribute__((packed));
+
+struct espi_perif_msg {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t msg_code;
+	uint8_t msg_byte[4];
+	uint8_t data[];
+} __attribute__((packed));
+
+struct espi_perif_cmplt {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t data[];
+} __attribute__((packed));
+
+struct espi_oob_msg {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t data[];
+};
+
+struct espi_flash_rwe {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint32_t addr_be;
+	uint8_t data[];
+} __attribute__((packed));
+
+struct espi_flash_cmplt {
+	uint8_t cyc;
+	uint8_t len_h : 4;
+	uint8_t tag : 4;
+	uint8_t len_l;
+	uint8_t data[];
+} __attribute__((packed));
+
+struct aspeed_espi_ioc {
+	uint32_t pkt_len;
+	uint8_t *pkt;
+};
+
+#define ESPI_PLD_LEN_MIN	(1UL << 6)
+#define ESPI_PLD_LEN_MAX	(1UL << 12)
+
+/*
+ * we choose the longest header and the max payload size
+ * based on the Intel specification to define the maximum
+ * eSPI packet length
+ */
+#define ESPI_PKT_LEN_MAX	(sizeof(struct espi_perif_msg) + ESPI_PLD_LEN_MAX)
+
+#define __ASPEED_ESPI_IOCTL_MAGIC	0xb8
+
+/* peripheral channel (ch0) */
+#define ASPEED_ESPI_PERIF_PC_GET_RX	_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x00, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_PERIF_PC_PUT_TX	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x01, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_PERIF_NP_PUT_TX	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x02, struct aspeed_espi_ioc)
+/* peripheral channel (ch1) */
+#define ASPEED_ESPI_VW_GET_GPIO_VAL	_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x10, uint8_t)
+#define ASPEED_ESPI_VW_PUT_GPIO_VAL	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x11, uint8_t)
+/* out-of-band channel (ch2) */
+#define ASPEED_ESPI_OOB_GET_RX		_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x20, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_OOB_PUT_TX		_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x21, struct aspeed_espi_ioc)
+/* flash channel (ch3) */
+#define ASPEED_ESPI_FLASH_GET_RX	_IOR(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x30, struct aspeed_espi_ioc)
+#define ASPEED_ESPI_FLASH_PUT_TX	_IOW(__ASPEED_ESPI_IOCTL_MAGIC, \
+					     0x31, struct aspeed_espi_ioc)
+
+#endif
-- 
2.17.1

