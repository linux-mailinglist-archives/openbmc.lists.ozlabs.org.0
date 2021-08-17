Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406A3EE4B6
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 05:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpbQD00g1z3cM6
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 13:01:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (unknown [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpbNt3cVfz2yfZ;
 Tue, 17 Aug 2021 12:59:20 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 17H2eVxa035574;
 Tue, 17 Aug 2021 10:40:31 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Aug 2021 10:58:39 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <cyrilbur@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 1/2] soc: aspeed: Add LPC mailbox support
Date: Tue, 17 Aug 2021 10:58:47 +0800
Message-ID: <20210817025848.19914-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210817025848.19914-1-chiawei_wang@aspeedtech.com>
References: <20210817025848.19914-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 17H2eVxa035574
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The LPC mailbox controller consists of multiple general
registers for the communication between the Host and the BMC.
The interrupts for data update signaling are also introduced.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/aspeed/Kconfig           |  10 +
 drivers/soc/aspeed/Makefile          |   9 +-
 drivers/soc/aspeed/aspeed-lpc-mbox.c | 418 +++++++++++++++++++++++++++
 3 files changed, 433 insertions(+), 4 deletions(-)
 create mode 100644 drivers/soc/aspeed/aspeed-lpc-mbox.c

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 243ca196e6ad..5b31a6e2620c 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -24,6 +24,16 @@ config ASPEED_LPC_SNOOP
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
+config ASPEED_LPC_MAILBOX
+	tristate "ASPEED LPC mailbox support"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Provides a driver to control the LPC mailbox which possesses
+	  up to 32 data registers for the communication between the Host
+	  and the BMC over LPC.
+
 config ASPEED_P2A_CTRL
 	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index fcab7192e1a4..cde6b4514c97 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
-obj-$(CONFIG_ASPEED_LPC_SNOOP)	+= aspeed-lpc-snoop.o
-obj-$(CONFIG_ASPEED_P2A_CTRL)	+= aspeed-p2a-ctrl.o
-obj-$(CONFIG_ASPEED_SOCINFO)	+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
+obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
+obj-$(CONFIG_ASPEED_LPC_MAILBOX)	+= aspeed-lpc-mbox.o
+obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
+obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
diff --git a/drivers/soc/aspeed/aspeed-lpc-mbox.c b/drivers/soc/aspeed/aspeed-lpc-mbox.c
new file mode 100644
index 000000000000..a09ca6a175f7
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-lpc-mbox.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2017 IBM Corporation
+ * Copyright 2021 Aspeed Technology Inc.
+ */
+#include <linux/interrupt.h>
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define DEVICE_NAME	"aspeed-mbox"
+
+#define ASPEED_MBOX_DR(dr, n)	(dr + (n * 4))
+#define ASPEED_MBOX_STR(str, n)	(str + (n / 8) * 4)
+#define ASPEED_MBOX_BIE(bie, n)	(bie + (n / 8) * 4)
+#define ASPEED_MBOX_HIE(hie, n) (hie + (n / 8) * 4)
+
+#define ASPEED_MBOX_BCR_RECV	BIT(7)
+#define ASPEED_MBOX_BCR_MASK	BIT(1)
+#define ASPEED_MBOX_BCR_SEND	BIT(0)
+
+/* ioctl code */
+#define ASPEED_MBOX_IOCTL		0xA3
+#define ASPEED_MBOX_IOCTL_GET_SIZE	\
+	_IOR(ASPEED_MBOX_IOCTL, 0, struct aspeed_mbox_ioctl_data)
+
+struct aspeed_mbox_ioctl_data {
+	unsigned int data;
+};
+
+struct aspeed_mbox_model {
+	unsigned int dr_num;
+
+	/* offsets to the MBOX registers */
+	unsigned int dr;
+	unsigned int str;
+	unsigned int bcr;
+	unsigned int hcr;
+	unsigned int bie;
+	unsigned int hie;
+};
+
+struct aspeed_mbox {
+	struct miscdevice miscdev;
+	struct regmap *map;
+	unsigned int base;
+	wait_queue_head_t queue;
+	struct mutex mutex;
+	const struct aspeed_mbox_model *model;
+};
+
+static atomic_t aspeed_mbox_open_count = ATOMIC_INIT(0);
+
+static u8 aspeed_mbox_inb(struct aspeed_mbox *mbox, int reg)
+{
+	/*
+	 * The mbox registers are actually only one byte but are addressed
+	 * four bytes apart. The other three bytes are marked 'reserved',
+	 * they *should* be zero but lets not rely on it.
+	 * I am going to rely on the fact we can casually read/write to them...
+	 */
+	unsigned int val = 0xff; /* If regmap throws an error return 0xff */
+	int rc = regmap_read(mbox->map, mbox->base + reg, &val);
+
+	if (rc)
+		dev_err(mbox->miscdev.parent, "regmap_read() failed with "
+			"%d (reg: 0x%08x)\n", rc, reg);
+
+	return val & 0xff;
+}
+
+static void aspeed_mbox_outb(struct aspeed_mbox *mbox, u8 data, int reg)
+{
+	int rc = regmap_write(mbox->map, mbox->base + reg, data);
+
+	if (rc)
+		dev_err(mbox->miscdev.parent, "regmap_write() failed with "
+			"%d (data: %u reg: 0x%08x)\n", rc, data, reg);
+}
+
+static struct aspeed_mbox *file_mbox(struct file *file)
+{
+	return container_of(file->private_data, struct aspeed_mbox, miscdev);
+}
+
+static int aspeed_mbox_open(struct inode *inode, struct file *file)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	const struct aspeed_mbox_model *model = mbox->model;
+
+	if (atomic_inc_return(&aspeed_mbox_open_count) == 1) {
+		/*
+		 * Clear the interrupt status bit if it was left on and unmask
+		 * interrupts.
+		 * ASPEED_MBOX_BCR_RECV bit is W1C, this also unmasks in 1 step
+		 */
+		aspeed_mbox_outb(mbox, ASPEED_MBOX_BCR_RECV, model->bcr);
+		return 0;
+	}
+
+	atomic_dec(&aspeed_mbox_open_count);
+	return -EBUSY;
+}
+
+static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	const struct aspeed_mbox_model *model = mbox->model;
+	char __user *p = buf;
+	ssize_t ret;
+	int i;
+
+	if (!access_ok(buf, count))
+		return -EFAULT;
+
+	if (count + *ppos > model->dr_num)
+		return -EINVAL;
+
+	if (file->f_flags & O_NONBLOCK) {
+		if (!(aspeed_mbox_inb(mbox, model->bcr) &
+				ASPEED_MBOX_BCR_RECV))
+			return -EAGAIN;
+	} else if (wait_event_interruptible(mbox->queue,
+				aspeed_mbox_inb(mbox, model->bcr) &
+				ASPEED_MBOX_BCR_RECV)) {
+		return -ERESTARTSYS;
+	}
+
+	mutex_lock(&mbox->mutex);
+
+	for (i = *ppos; count > 0 && i < model->dr_num; i++) {
+		uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DR(model->dr, i));
+
+		ret = __put_user(reg, p);
+		if (ret)
+			goto out_unlock;
+
+		p++;
+		count--;
+	}
+
+	/* ASPEED_MBOX_BCR_RECV bit is write to clear, this also unmasks in 1 step */
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_BCR_RECV, model->bcr);
+	ret = p - buf;
+
+out_unlock:
+	mutex_unlock(&mbox->mutex);
+	return ret;
+}
+
+static ssize_t aspeed_mbox_write(struct file *file, const char __user *buf,
+				size_t count, loff_t *ppos)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	const struct aspeed_mbox_model *model = mbox->model;
+	const char __user *p = buf;
+	ssize_t ret;
+	char c;
+	int i;
+
+	if (!access_ok(buf, count))
+		return -EFAULT;
+
+	if (count + *ppos > model->dr_num)
+		return -EINVAL;
+
+	mutex_lock(&mbox->mutex);
+
+	for (i = *ppos; count > 0 && i < model->dr_num; i++) {
+		ret = __get_user(c, p);
+		if (ret)
+			goto out_unlock;
+
+		aspeed_mbox_outb(mbox, c, ASPEED_MBOX_DR(model->dr, i));
+		p++;
+		count--;
+	}
+
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_BCR_SEND, model->bcr);
+	ret = p - buf;
+
+out_unlock:
+	mutex_unlock(&mbox->mutex);
+	return ret;
+}
+
+static __poll_t aspeed_mbox_poll(struct file *file, poll_table *wait)
+{
+	struct aspeed_mbox *mbox = file_mbox(file);
+	const struct aspeed_mbox_model *model = mbox->model;
+	__poll_t mask = 0;
+
+	poll_wait(file, &mbox->queue, wait);
+
+	if (aspeed_mbox_inb(mbox, model->bcr) & ASPEED_MBOX_BCR_RECV)
+		mask |= POLLIN;
+
+	return mask;
+}
+
+static int aspeed_mbox_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&aspeed_mbox_open_count);
+	return 0;
+}
+
+static long aspeed_mbox_ioctl(struct file *file, unsigned int cmd,
+				 unsigned long param)
+{
+	long ret = 0;
+	struct aspeed_mbox *mbox = file_mbox(file);
+	const struct aspeed_mbox_model *model = mbox->model;
+	struct aspeed_mbox_ioctl_data data;
+
+	switch (cmd) {
+	case ASPEED_MBOX_IOCTL_GET_SIZE:
+		data.data = model->dr_num;
+		if (copy_to_user((void __user *)param, &data, sizeof(data)))
+			ret = -EFAULT;
+		break;
+	default:
+		ret = -ENOTTY;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations aspeed_mbox_fops = {
+	.owner		= THIS_MODULE,
+	.llseek		= no_seek_end_llseek,
+	.read		= aspeed_mbox_read,
+	.write		= aspeed_mbox_write,
+	.open		= aspeed_mbox_open,
+	.release	= aspeed_mbox_release,
+	.poll		= aspeed_mbox_poll,
+	.unlocked_ioctl	= aspeed_mbox_ioctl,
+};
+
+static irqreturn_t aspeed_mbox_irq(int irq, void *arg)
+{
+	struct aspeed_mbox *mbox = arg;
+	const struct aspeed_mbox_model *model = mbox->model;
+
+	if (!(aspeed_mbox_inb(mbox, model->bcr) & ASPEED_MBOX_BCR_RECV))
+		return IRQ_NONE;
+
+	/*
+	 * Leave the status bit set so that we know the data is for us,
+	 * clear it once it has been read.
+	 */
+
+	/* Mask it off, we'll clear it when we the data gets read */
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_BCR_MASK, model->bcr);
+
+	wake_up(&mbox->queue);
+	return IRQ_HANDLED;
+}
+
+static int aspeed_mbox_config_irq(struct aspeed_mbox *mbox,
+		struct platform_device *pdev)
+{
+	const struct aspeed_mbox_model *model = mbox->model;
+	struct device *dev = &pdev->dev;
+	int i, rc, irq;
+
+	irq = irq_of_parse_and_map(dev->of_node, 0);
+	if (!irq)
+		return -ENODEV;
+
+	rc = devm_request_irq(dev, irq, aspeed_mbox_irq,
+			IRQF_SHARED, DEVICE_NAME, mbox);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		return rc;
+	}
+
+	/*
+	 * Disable all register based interrupts.
+	 */
+	for (i = 0; i < model->dr_num / 8; ++i)
+		aspeed_mbox_outb(mbox, 0x00, ASPEED_MBOX_BIE(model->bie, i));
+
+	/* These registers are write one to clear. Clear them. */
+	for (i = 0; i < model->dr_num / 8; ++i)
+		aspeed_mbox_outb(mbox, 0xff, ASPEED_MBOX_STR(model->str, i));
+
+	aspeed_mbox_outb(mbox, ASPEED_MBOX_BCR_RECV, model->bcr);
+	return 0;
+}
+
+static int aspeed_mbox_probe(struct platform_device *pdev)
+{
+	struct aspeed_mbox *mbox;
+	struct device *dev;
+	int rc;
+
+	dev = &pdev->dev;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, mbox);
+
+	rc = of_property_read_u32(dev->of_node, "reg", &mbox->base);
+	if (rc) {
+		dev_err(dev, "Couldn't read reg device tree property\n");
+		return rc;
+	}
+
+	mbox->model = of_device_get_match_data(dev);
+	if (IS_ERR(mbox->model)) {
+		dev_err(dev, "Couldn't get model data\n");
+		return -ENODEV;
+	}
+
+	mbox->map = syscon_node_to_regmap(
+			pdev->dev.parent->of_node);
+	if (IS_ERR(mbox->map)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
+
+	mutex_init(&mbox->mutex);
+	init_waitqueue_head(&mbox->queue);
+
+	mbox->miscdev.minor = MISC_DYNAMIC_MINOR;
+	mbox->miscdev.name = DEVICE_NAME;
+	mbox->miscdev.fops = &aspeed_mbox_fops;
+	mbox->miscdev.parent = dev;
+	rc = misc_register(&mbox->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		return rc;
+	}
+
+	rc = aspeed_mbox_config_irq(mbox, pdev);
+	if (rc) {
+		dev_err(dev, "Failed to configure IRQ\n");
+		misc_deregister(&mbox->miscdev);
+		return rc;
+	}
+
+	return 0;
+}
+
+static int aspeed_mbox_remove(struct platform_device *pdev)
+{
+	struct aspeed_mbox *mbox = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&mbox->miscdev);
+
+	return 0;
+}
+
+static const struct aspeed_mbox_model ast2400_model = {
+	.dr_num = 16,
+	.dr	= 0x0,
+	.str = 0x40,
+	.bcr = 0x48,
+	.hcr = 0x4c,
+	.bie = 0x50,
+	.hie = 0x58,
+};
+
+static const struct aspeed_mbox_model ast2500_model = {
+	.dr_num = 16,
+	.dr	= 0x0,
+	.str = 0x40,
+	.bcr = 0x48,
+	.hcr = 0x4c,
+	.bie = 0x50,
+	.hie = 0x58,
+};
+
+static const struct aspeed_mbox_model ast2600_model = {
+	.dr_num = 32,
+	.dr	= 0x0,
+	.str = 0x80,
+	.bcr = 0x90,
+	.hcr = 0x94,
+	.bie = 0xa0,
+	.hie = 0xb0,
+};
+
+static const struct of_device_id aspeed_mbox_match[] = {
+	{ .compatible = "aspeed,ast2400-mbox",
+	  .data = &ast2400_model },
+	{ .compatible = "aspeed,ast2500-mbox",
+	  .data = &ast2500_model },
+	{ .compatible = "aspeed,ast2600-mbox",
+	  .data = &ast2600_model },
+	{ },
+};
+
+static struct platform_driver aspeed_mbox_driver = {
+	.driver = {
+		.name		= DEVICE_NAME,
+		.of_match_table = aspeed_mbox_match,
+	},
+	.probe = aspeed_mbox_probe,
+	.remove = aspeed_mbox_remove,
+};
+
+module_platform_driver(aspeed_mbox_driver);
+MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Cyril Bur <cyrilbur@gmail.com>");
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com");
+MODULE_DESCRIPTION("Aspeed mailbox device driver");
-- 
2.17.1

