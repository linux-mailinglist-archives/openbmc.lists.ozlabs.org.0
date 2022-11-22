Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD53863477E
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 21:14:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGwTB4h4Xz3cNX
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 07:14:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGwRT4GFFz2yRV
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 07:12:49 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 2AMKCeiU009113
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 22:12:40 +0200
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 22 Nov
 2022 22:12:39 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 23 Nov
 2022 04:12:37 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 23 Nov 2022 04:12:37 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4474B63A20; Tue, 22 Nov 2022 22:12:36 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <arnd@arndb.de>, <hasegawa-hitomi@fujitsu.com>, <marcan@marcan.st>,
        <nicolas.ferre@microchip.com>, <conor.dooley@microchip.com>,
        <heiko@sntech.de>, <sven@svenpeter.dev>, <briannorris@chromium.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
Date: Tue, 22 Nov 2022 22:12:32 +0200
Message-ID: <20221122201232.107065-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221122201232.107065-1-tmaimon77@gmail.com>
References: <20221122201232.107065-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton BMC NPCM LPC BIOS post code (BPC) driver.

The NPCM BPC monitoring two configurable I/O address written by the host
on the Low Pin Count (LPC) bus.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/soc/Kconfig                |   1 +
 drivers/soc/Makefile               |   1 +
 drivers/soc/nuvoton/Kconfig        |  24 ++
 drivers/soc/nuvoton/Makefile       |   3 +
 drivers/soc/nuvoton/npcm-lpc-bpc.c | 396 +++++++++++++++++++++++++++++
 5 files changed, 425 insertions(+)
 create mode 100644 drivers/soc/nuvoton/Kconfig
 create mode 100644 drivers/soc/nuvoton/Makefile
 create mode 100644 drivers/soc/nuvoton/npcm-lpc-bpc.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index e461c071189b..f17764a7e588 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -15,6 +15,7 @@ source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/microchip/Kconfig"
+source "drivers/soc/nuvoton/Kconfig"
 source "drivers/soc/pxa/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 69ba6508cf2c..9f9250685485 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SOC_XWAY)		+= lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
 obj-y				+= mediatek/
 obj-y				+= microchip/
+obj-y				+= nuvoton/
 obj-y				+= pxa/
 obj-y				+= amlogic/
 obj-y				+= qcom/
diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
new file mode 100644
index 000000000000..9f92b8380f2a
--- /dev/null
+++ b/drivers/soc/nuvoton/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if ARCH_NPCM || COMPILE_TEST
+
+menu "NUVOTON SoC drivers"
+
+config NPCM_LPC_BPC
+	tristate "NPCM LPC BIOS Post Code support"
+	depends on (ARCH_NPCM || COMPILE_TEST)
+	help
+	  Provides a NPCM driver to control the LPC BIOS Post Code
+	  interface which allows the BMC to monitoring and save
+	  the data written by the host to an arbitrary LPC I/O port.
+
+config NPCM_PCI_MBOX
+	tristate "NPCM PCI Mailbox Controller"
+	depends on (ARCH_NPCM || COMPILE_TEST) && REGMAP && MFD_SYSCON
+	help
+	  Expose the NPCM BMC PCI MBOX registers found on Nuvoton SOCs
+	  to userspace.
+
+endmenu
+
+endif
diff --git a/drivers/soc/nuvoton/Makefile b/drivers/soc/nuvoton/Makefile
new file mode 100644
index 000000000000..b44b044ca335
--- /dev/null
+++ b/drivers/soc/nuvoton/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_NPCM_LPC_BPC)		+= npcm-lpc-bpc.o
+obj-$(CONFIG_NPCM_PCI_MBOX)		+= npcm-pci-mbox.o
diff --git a/drivers/soc/nuvoton/npcm-lpc-bpc.c b/drivers/soc/nuvoton/npcm-lpc-bpc.c
new file mode 100644
index 000000000000..42ac94f9ddf9
--- /dev/null
+++ b/drivers/soc/nuvoton/npcm-lpc-bpc.c
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Nuvoton Technology corporation.
+
+#include <linux/fs.h>
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/kfifo.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/miscdevice.h>
+#include <linux/poll.h>
+
+#define DEVICE_NAME	"npcm-lpc-bpc"
+
+#define NUM_BPC_CHANNELS	2
+#define DW_PAD_SIZE		3
+
+/* BIOS POST Code FIFO Registers */
+#define NPCM_BPCFA2L_REG	0x2 //BIOS POST Code FIFO Address 2 LSB
+#define NPCM_BPCFA2M_REG	0x4 //BIOS POST Code FIFO Address 2 MSB
+#define NPCM_BPCFEN_REG		0x6 //BIOS POST Code FIFO Enable
+#define NPCM_BPCFSTAT_REG	0x8 //BIOS POST Code FIFO Status
+#define NPCM_BPCFDATA_REG	0xA //BIOS POST Code FIFO Data
+#define NPCM_BPCFMSTAT_REG	0xC //BIOS POST Code FIFO Miscellaneous Status
+#define NPCM_BPCFA1L_REG	0x10 //BIOS POST Code FIFO Address 1 LSB
+#define NPCM_BPCFA1M_REG	0x12 //BIOS POST Code FIFO Address 1 MSB
+
+/* BIOS regiser data */
+#define FIFO_IOADDR1_ENABLE	0x80
+#define FIFO_IOADDR2_ENABLE	0x40
+
+/* BPC interface package and structure definition */
+#define BPC_KFIFO_SIZE		0x400
+
+/* BPC regiser data */
+#define FIFO_DATA_VALID		0x80
+#define FIFO_OVERFLOW		0x20
+#define FIFO_READY_INT_ENABLE	0x8
+#define FIFO_DWCAPTURE		0x4
+#define FIFO_ADDR_DECODE	0x1
+
+/* Host Reset */
+#define HOST_RESET_INT_ENABLE	0x10
+#define HOST_RESET_CHANGED	0x40
+
+struct npcm_bpc_channel {
+	struct npcm_bpc	*data;
+	struct kfifo		fifo;
+	wait_queue_head_t	wq;
+	bool			host_reset;
+	struct miscdevice	miscdev;
+};
+
+struct npcm_bpc {
+	void __iomem		*base;
+	struct device		*dev;
+	int			irq;
+	bool			en_dwcap;
+	struct npcm_bpc_channel	ch[NUM_BPC_CHANNELS];
+};
+
+static struct npcm_bpc_channel *npcm_file_to_ch(struct file *file)
+{
+	return container_of(file->private_data, struct npcm_bpc_channel,
+			    miscdev);
+}
+
+static ssize_t npcm_bpc_read(struct file *file, char __user *buffer,
+			     size_t count, loff_t *ppos)
+{
+	struct npcm_bpc_channel *chan = npcm_file_to_ch(file);
+	struct npcm_bpc *lpc_bpc = chan->data;
+	unsigned int copied;
+	int cond_size = 1;
+	int ret = 0;
+
+	if (lpc_bpc->en_dwcap)
+		cond_size = 3;
+
+	if (kfifo_len(&chan->fifo) < cond_size) {
+		if (file->f_flags & O_NONBLOCK)
+			return -EAGAIN;
+
+		ret = wait_event_interruptible
+			(chan->wq, kfifo_len(&chan->fifo) > cond_size);
+		if (ret == -ERESTARTSYS)
+			return -EINTR;
+	}
+
+	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
+
+	return ret ? ret : copied;
+}
+
+static __poll_t npcm_bpc_poll(struct file *file, struct poll_table_struct *pt)
+{
+	struct npcm_bpc_channel *chan = npcm_file_to_ch(file);
+	__poll_t mask = 0;
+
+	poll_wait(file, &chan->wq, pt);
+	if (!kfifo_is_empty(&chan->fifo))
+		mask |= POLLIN;
+
+	if (chan->host_reset) {
+		mask |= POLLHUP;
+		chan->host_reset = false;
+	}
+
+	return mask;
+}
+
+static const struct file_operations npcm_bpc_fops = {
+	.owner		= THIS_MODULE,
+	.read		= npcm_bpc_read,
+	.poll		= npcm_bpc_poll,
+	.llseek		= noop_llseek,
+};
+
+static irqreturn_t npcm_bpc_irq(int irq, void *arg)
+{
+	struct npcm_bpc *lpc_bpc = arg;
+	u8 fifo_st, host_st, data;
+	bool isr_flag = false;
+	u8 last_addr_bit = 0;
+	u8 padzero[3] = {0};
+	u8 addr_index = 0;
+
+	fifo_st = ioread8(lpc_bpc->base + NPCM_BPCFSTAT_REG);
+	while (FIFO_DATA_VALID & fifo_st) {
+		 /* If dwcapture enabled only channel 0 (FIFO 0) used */
+		if (!lpc_bpc->en_dwcap)
+			addr_index = fifo_st & FIFO_ADDR_DECODE;
+		else
+			last_addr_bit = fifo_st & FIFO_ADDR_DECODE;
+
+		/* Read data from FIFO to clear interrupt */
+		data = ioread8(lpc_bpc->base + NPCM_BPCFDATA_REG);
+		if (kfifo_is_full(&lpc_bpc->ch[addr_index].fifo))
+			kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
+		kfifo_put(&lpc_bpc->ch[addr_index].fifo, data);
+		if (fifo_st & FIFO_OVERFLOW)
+			dev_warn(lpc_bpc->dev, "BIOS Post Codes FIFO Overflow\n");
+
+		fifo_st = ioread8(lpc_bpc->base + NPCM_BPCFSTAT_REG);
+		if (lpc_bpc->en_dwcap && last_addr_bit) {
+			if ((fifo_st & FIFO_ADDR_DECODE) ||
+			    ((FIFO_DATA_VALID & fifo_st) == 0)) {
+				while (kfifo_avail(&lpc_bpc->ch[addr_index].fifo) < DW_PAD_SIZE)
+					kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
+				kfifo_in(&lpc_bpc->ch[addr_index].fifo,
+					 padzero, DW_PAD_SIZE);
+			}
+		}
+		isr_flag = true;
+	}
+
+	host_st = ioread8(lpc_bpc->base + NPCM_BPCFMSTAT_REG);
+	if (host_st & HOST_RESET_CHANGED) {
+		iowrite8(HOST_RESET_CHANGED,
+			 lpc_bpc->base + NPCM_BPCFMSTAT_REG);
+		lpc_bpc->ch[addr_index].host_reset = true;
+		isr_flag = true;
+	}
+
+	if (isr_flag) {
+		wake_up_interruptible(&lpc_bpc->ch[addr_index].wq);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int npcm_bpc_config_irq(struct npcm_bpc *lpc_bpc,
+			       struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	lpc_bpc->irq = platform_get_irq(pdev, 0);
+	if (lpc_bpc->irq < 0) {
+		dev_err(dev, "get IRQ failed\n");
+		return lpc_bpc->irq;
+	}
+
+	rc = devm_request_irq(dev, lpc_bpc->irq,
+			      npcm_bpc_irq, IRQF_SHARED,
+			      DEVICE_NAME, lpc_bpc);
+	if (rc < 0) {
+		dev_warn(dev, "Unable to request IRQ %d\n", lpc_bpc->irq);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int npcm_enable_bpc(struct npcm_bpc *lpc_bpc, struct device *dev,
+			   int channel, u16 lpc_port)
+{
+	u8 addr_en, reg_en;
+	int err;
+
+	init_waitqueue_head(&lpc_bpc->ch[channel].wq);
+
+	err = kfifo_alloc(&lpc_bpc->ch[channel].fifo, BPC_KFIFO_SIZE,
+			  GFP_KERNEL);
+	if (err)
+		return err;
+
+	lpc_bpc->ch[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
+	lpc_bpc->ch[channel].miscdev.name =
+		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	lpc_bpc->ch[channel].miscdev.fops = &npcm_bpc_fops;
+	lpc_bpc->ch[channel].miscdev.parent = dev;
+	err = misc_register(&lpc_bpc->ch[channel].miscdev);
+	if (err)
+		return err;
+
+	lpc_bpc->ch[channel].data = lpc_bpc;
+	lpc_bpc->ch[channel].host_reset = false;
+
+	/* Enable LPC snoop channel at requested port */
+	switch (channel) {
+	case 0:
+		addr_en = FIFO_IOADDR1_ENABLE;
+		iowrite8((u8)lpc_port & 0xFF,
+			 lpc_bpc->base + NPCM_BPCFA1L_REG);
+		iowrite8((u8)(lpc_port >> 8),
+			 lpc_bpc->base + NPCM_BPCFA1M_REG);
+		break;
+	case 1:
+		addr_en = FIFO_IOADDR2_ENABLE;
+		iowrite8((u8)lpc_port & 0xFF,
+			 lpc_bpc->base + NPCM_BPCFA2L_REG);
+		iowrite8((u8)(lpc_port >> 8),
+			 lpc_bpc->base + NPCM_BPCFA2M_REG);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (lpc_bpc->en_dwcap)
+		addr_en = FIFO_DWCAPTURE;
+
+	/*
+	 * Enable FIFO Ready Interrupt, FIFO Capture of I/O addr,
+	 * and Host Reset
+	 */
+	reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
+	iowrite8(reg_en | addr_en | FIFO_READY_INT_ENABLE |
+		 HOST_RESET_INT_ENABLE, lpc_bpc->base + NPCM_BPCFEN_REG);
+
+	return 0;
+}
+
+static void npcm_disable_bpc(struct npcm_bpc *lpc_bpc, int channel)
+{
+	u8 reg_en;
+
+	switch (channel) {
+	case 0:
+		reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
+		if (lpc_bpc->en_dwcap)
+			iowrite8(reg_en & ~FIFO_DWCAPTURE,
+				 lpc_bpc->base + NPCM_BPCFEN_REG);
+		else
+			iowrite8(reg_en & ~FIFO_IOADDR1_ENABLE,
+				 lpc_bpc->base + NPCM_BPCFEN_REG);
+		break;
+	case 1:
+		reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
+		iowrite8(reg_en & ~FIFO_IOADDR2_ENABLE,
+			 lpc_bpc->base + NPCM_BPCFEN_REG);
+		break;
+	default:
+		return;
+	}
+
+	if (!(reg_en & (FIFO_IOADDR1_ENABLE | FIFO_IOADDR2_ENABLE)))
+		iowrite8(reg_en &
+			 ~(FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE),
+			 lpc_bpc->base + NPCM_BPCFEN_REG);
+
+	kfifo_free(&lpc_bpc->ch[channel].fifo);
+	misc_deregister(&lpc_bpc->ch[channel].miscdev);
+}
+
+static int npcm_bpc_probe(struct platform_device *pdev)
+{
+	struct npcm_bpc *lpc_bpc;
+	struct device_node *np;
+	struct device *dev;
+	u32 port;
+	int err;
+
+	dev = &pdev->dev;
+
+	lpc_bpc = devm_kzalloc(dev, sizeof(*lpc_bpc), GFP_KERNEL);
+	if (!lpc_bpc)
+		return -ENOMEM;
+
+	np = pdev->dev.parent->of_node;
+	if (!of_device_is_compatible(np, "nuvoton,npcm750-lpc") &&
+	    !of_device_is_compatible(np, "nuvoton,npcm845-lpc")) {
+		dev_err(dev, "unsupported LPC device binding\n");
+		return -ENODEV;
+	}
+
+	lpc_bpc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(lpc_bpc->base))
+		return PTR_ERR(lpc_bpc->base);
+
+	dev_set_drvdata(&pdev->dev, lpc_bpc);
+
+	err = of_property_read_u32_index(dev->of_node, "nuvoton,monitor-ports",
+					 0, &port);
+	if (err) {
+		dev_err(dev, "no monitor ports configured\n");
+		return -ENODEV;
+	}
+
+	lpc_bpc->en_dwcap =
+		of_property_read_bool(dev->of_node, "nuvoton,bpc-en-dwcapture");
+
+	lpc_bpc->dev = dev;
+
+	err = npcm_bpc_config_irq(lpc_bpc, pdev);
+	if (err)
+		return err;
+
+	err = npcm_enable_bpc(lpc_bpc, dev, 0, port);
+	if (err) {
+		dev_err(dev, "Enable BIOS post code I/O port 0 failed\n");
+		return err;
+	}
+
+	/*
+	 * Configuration of second BPC channel port is optional
+	 * Double-Word Capture ignoring address 2
+	 */
+	if (!lpc_bpc->en_dwcap) {
+		if (of_property_read_u32_index(dev->of_node,
+					       "nuvoton,monitor-ports", 1,
+					       &port) == 0) {
+			err = npcm_enable_bpc(lpc_bpc, dev, 1, port);
+			if (err) {
+				dev_err(dev, "Enable BIOS post code I/O port 1 failed, disable I/O port 0\n");
+				npcm_disable_bpc(lpc_bpc, 0);
+				return err;
+			}
+		}
+	}
+
+	pr_info("NPCM BIOS Post Code probe\n");
+
+	return err;
+}
+
+static int npcm_bpc_remove(struct platform_device *pdev)
+{
+	struct npcm_bpc *lpc_bpc = dev_get_drvdata(&pdev->dev);
+	u8 reg_en;
+
+	reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
+
+	if (reg_en & FIFO_IOADDR1_ENABLE)
+		npcm_disable_bpc(lpc_bpc, 0);
+	if (reg_en & FIFO_IOADDR2_ENABLE)
+		npcm_disable_bpc(lpc_bpc, 1);
+
+	return 0;
+}
+
+static const struct of_device_id npcm_bpc_match[] = {
+	{ .compatible = "nuvoton,npcm750-lpc-bpc" },
+	{ .compatible = "nuvoton,npcm845-lpc-bpc" },
+	{ },
+};
+
+static struct platform_driver npcm_bpc_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = npcm_bpc_match,
+	},
+	.probe = npcm_bpc_probe,
+	.remove = npcm_bpc_remove,
+};
+
+module_platform_driver(npcm_bpc_driver);
+
+MODULE_DEVICE_TABLE(of, npcm_bpc_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
+MODULE_DESCRIPTION("NPCM LPC BIOS post code monitoring device driver");
-- 
2.33.0

