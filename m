Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B2195157
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:34:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXBs1jwnzDr4D
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 17:34:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=N1yOEh6O; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BrWjPSg1; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pX8L6tn3zDr42
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 17:32:18 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E4B45C0308;
 Fri, 27 Mar 2020 02:32:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Mar 2020 02:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0NnwMw+p8QqmA
 qJYYMUFoFOqMMZiMD/mFHP7h6roas0=; b=N1yOEh6OrAc9OQD5e4ZSQCuavcPuu
 L4QRng/OUd81UVKLiLbGmEZb/1pmxN6lLKZlw++3tXEuP0rhlq2j8JmVELyl9Bcl
 5y8ztsyCo2y1lpLZbavZ2D8xLDdM7ONh5NTa/HkO5cmZU4/BmM5d5popmgheWxti
 9axR4HlnvugkzkWQegcGxsW0VbvMlmHJ6kzYXYM6eGtSLWXph6zGxRL4ZtUy47nf
 fLhv77JUDjrpcb2OLiIkixHwuk0PmkqznAi/WVi1VG5r7QAh9aG8O6OvpKRjusbS
 gtwN0lpQdFox5IOWyvimuLRZ68gWhjFsUsDyOE8Vef/K2nIA4/zNms91w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=0NnwMw+p8QqmAqJYYMUFoFOqMMZiMD/mFHP7h6roas0=; b=BrWjPSg1
 Ztrlv7S3FCUylykGr/vCjtga+KL4EeLXtiwDRVz02VxyMy0HeGu996jOnVxJ0zKc
 LxJiEN3XlITAU9g5F/vj+gIcdsHklvhOfCtIXJIlIo1GdQhvdQK8HbWal6l0/bq5
 VrfpImcWahZLFgizbV/guPL2RX8bG9PZZM/W0tZ8tZ3cA43Aa6cWSPgPTrjSHeBu
 P7HuOSP+2E5xSyQDKNuIBdd3RDcfRdTuGOh8f7COyJXuVfRYlPOiS63aZGjXZr9T
 iVmZ+NpLa8s6G4bFnJnb3OdVyhEh7M6fEIHdUK5x5Xe6MH/dFWvchfiqIIq/wfyQ
 SZe5OtXucxPFVQ==
X-ME-Sender: <xms:8J19XkFtY_fSoIhU59iAFPvD4m6cv0uOb_1uLShdLiXfl9y59wZBrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgudelhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucfkphepuddukedrvddutddrudekfedrudelkeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:8J19Xk9jIbcKxChFLvgIXi18iQUGqpmPWsXMBQHKNZ9CiiXe_v1Mkw>
 <xmx:8J19XuVJDR3xD-x1y3X2FTSXQoBbYJOHZQDHs8zdHXELDAUB9eSPPA>
 <xmx:8J19XuEZ6mrnJN1Eix1vGoe8SInVfCE_1e8nzu-kUaBICyAl03XFPg>
 <xmx:8J19Xnew5fNs20emdJOM5Il4jT4kEs7GxpN2Lb7rlHW4F9fK8ogzIw>
Received: from localhost.localdomain
 (ppp118-210-183-198.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.183.198])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9144C3280065;
 Fri, 27 Mar 2020 02:32:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [WIP PATCH linux dev-5.4 1/4] misc: Add ASPEED KCS driver for MCTP
 purposes
Date: Fri, 27 Mar 2020 17:01:43 +1030
Message-Id: <20200327063146.28885-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327063146.28885-1-andrew@aj.id.au>
References: <20200327063146.28885-1-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

IBM have developed a vendor-defined MCTP binding that utilises LPC IO
and FW interfaces to exchange MCTP messages. A KCS device in the IO
space is used to send single-byte control messages initialising the MCTP
channel and exchanging ownership of data buffers.

This driver exposes the KCS message stream to userspace, allowing an
MCTP-capable application to manipulate the data exposed via the FW
space.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/misc/Kconfig    |   7 +
 drivers/misc/Makefile   |   1 +
 drivers/misc/mctp-lpc.c | 443 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 451 insertions(+)
 create mode 100644 drivers/misc/mctp-lpc.c

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 06a2b753cc7c..c90a9cacc19f 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -454,6 +454,13 @@ config XILINX_SDFEC
 
 	  If unsure, say N.
 
+config MCTP_LPC
+	tristate "MCTP LPC binding implementation for ASPEED BMCs"
+	depends on REGMAP
+	help
+	  Implements the MCTP LPC binding via KCS LPC IO cycles for control and
+          LPC FWH cycles for data
+
 config MISC_RTSX
 	tristate
 	default MISC_RTSX_PCI || MISC_RTSX_USB
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b9e6d4c3e906..9ef78d42be9d 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,3 +59,4 @@ obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_NPCM7XX_LPC_BPC)	+= npcm7xx-lpc-bpc.o
 obj-$(CONFIG_NPCM7XX_PCI_MBOX)	+= npcm7xx-pci-mbox.o
+obj-$(CONFIG_MCTP_LPC)		+= mctp-lpc.o
diff --git a/drivers/misc/mctp-lpc.c b/drivers/misc/mctp-lpc.c
new file mode 100644
index 000000000000..71fc4ae69de7
--- /dev/null
+++ b/drivers/misc/mctp-lpc.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2019, IBM Corp.
+ */
+
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/sched/signal.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+
+#define LPC_HICRB            0x080
+#define     LPC_HICRB_IBFIF4         BIT(1)
+#define     LPC_HICRB_LPC4E          BIT(0)
+#define LPC_HICRC            0x084
+#define     LPC_KCS4_IRQSEL_MASK     GENMASK(7, 4)
+#define     LPC_KCS4_IRQSEL_SHIFT    4
+#define     LPC_KCS4_IRQTYPE_MASK    GENMASK(3, 2)
+#define     LPC_KCS4_IRQTYPE_SHIFT   2
+#define     LPC_KCS4_IRQTYPE_LOW     0b00
+#define     LPC_KCS4_IRQTYPE_HIGH    0b01
+#define     LPC_KCS4_IRQTYPE_RSVD    0b10
+#define     LPC_KCS4_IRQTYPE_RISING  0b11
+#define     LPC_KCS4_OBF4_AUTO_CLR   BIT(1)
+#define     LPC_KCS4_IRQ_HOST	     BIT(0)
+#define LPC_LADR4            0x090
+#define LPC_IDR4             0x094
+#define LPC_ODR4             0x098
+#define LPC_STR4             0x09C
+#define     STR4_IBF	     (1 << 1)
+#define     STR4_OBF	     (1 << 0)
+
+#define HOST_ODR             0xca2
+#define HOST_STR             0xca3
+#define HOST_SERIRQ_ID       11
+#define HOST_SERIRQ_TYPE     LPC_KCS4_IRQTYPE_LOW
+
+#define RX_BUF_SIZE 1024
+
+struct mctp_lpc {
+	struct miscdevice miscdev;
+	struct regmap *map;
+
+	wait_queue_head_t rx;
+	bool pending;
+	u8 idr;
+};
+
+static irqreturn_t mctp_lpc_irq(int irq, void *data)
+{
+	struct mctp_lpc *priv = data;
+	unsigned long flags;
+	unsigned int hicrb;
+	struct device *dev;
+	unsigned int str;
+	irqreturn_t ret;
+
+	dev = priv->miscdev.this_device;
+
+	spin_lock_irqsave(&priv->rx.lock, flags);
+
+	regmap_read(priv->map, LPC_STR4, &str);
+	regmap_read(priv->map, LPC_HICRB, &hicrb);
+
+	if ((str & STR4_IBF) && (hicrb & LPC_HICRB_IBFIF4)) {
+		unsigned int val;
+
+		if (priv->pending)
+			dev_err(dev, "Storm brewing!");
+
+		/* Mask the IRQ / Enter polling mode */
+		dev_dbg(dev, "Received IRQ %d, disabling to provide back-pressure\n",
+			irq);
+		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIF4, 0);
+
+		/*
+		 * Extract the IDR4 value to ack the IRQ. Reading IDR clears
+		 * IBF and allows the host to write another value, however as
+		 * we have disabled IRQs the back-pressure is still applied
+		 * until userspace starts servicing the interface.
+		 */
+		regmap_read(priv->map, LPC_IDR4, &val);
+		priv->idr = val & 0xff;
+		priv->pending = true;
+
+		dev_dbg(dev, "Set pending, waking waiters\n");
+		wake_up_locked(&priv->rx);
+		ret = IRQ_HANDLED;
+	} else {
+		dev_dbg(dev, "LPC IRQ triggered, but not for us (str=0x%x, hicrb=0x%x)\n",
+			str, hicrb);
+		ret = IRQ_NONE;
+	}
+
+	spin_unlock_irqrestore(&priv->rx.lock, flags);
+
+	return ret;
+}
+
+static inline struct mctp_lpc *to_mctp_lpc(struct file *filp)
+{
+	return container_of(filp->private_data, struct mctp_lpc, miscdev);
+}
+
+static ssize_t mctp_lpc_read(struct file *filp, char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	struct mctp_lpc *priv;
+	struct device *dev;
+	size_t remaining;
+	ssize_t rc;
+
+	priv = to_mctp_lpc(filp);
+	dev = priv->miscdev.this_device;
+
+	if (!count)
+		return 0;
+
+	if (count > 2 || *ppos > 1)
+		return -EINVAL;
+
+	remaining = count;
+
+	spin_lock_irq(&priv->rx.lock);
+	if (*ppos == 0) {
+		unsigned int val;
+		u8 str;
+
+		/* YOLO blocking, non-block not supported */
+		dev_dbg(dev, "Waiting for IBF\n");
+		regmap_read(priv->map, LPC_STR4, &val);
+		str = val & 0xff;
+		rc = wait_event_interruptible_locked(priv->rx, (priv->pending || str & STR4_IBF));
+		if (rc < 0)
+			goto out;
+
+		if (signal_pending(current)) {
+			dev_dbg(dev, "Interrupted waiting for IBF\n");
+			rc = -EINTR;
+			goto out;
+		}
+
+		/*
+		 * Re-enable IRQs prior to possible read of IDR (which clears
+		 * IBF) to ensure we receive interrupts for subsequent writes
+		 * to IDR. Writes to IDR by the host should not occur while IBF
+		 * is set.
+		 */
+		dev_dbg(dev, "Woken by IBF, enabling IRQ\n");
+		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_IBFIF4,
+				   LPC_HICRB_IBFIF4);
+
+		/* Read data out of IDR into internal storage if necessary */
+		if (!priv->pending) {
+			WARN(!(str & STR4_IBF), "Unknown reason for wakeup!");
+
+			/* Extract the IDR4 value to ack the IRQ */
+			regmap_read(priv->map, LPC_IDR4, &val);
+			priv->idr = val & 0xff;
+		}
+
+		/* Copy data from internal storage to userspace */
+		if (copy_to_user(buf, &priv->idr, sizeof(priv->idr))) {
+			rc = -EFAULT;
+			goto out;
+		}
+
+		/* We're done consuming the internally stored value */
+		priv->pending = false;
+
+		remaining--;
+		buf++;
+	}
+
+	if (remaining) {
+		/* Either:
+		 *
+		 * 1. (count == 1 && *ppos == 1)
+		 * 2. (count == 2 && *ppos == 0)
+		 */
+		unsigned int val;
+		u8 str;
+
+		regmap_read(priv->map, LPC_STR4, &val);
+		str = val & 0xff;
+		if (*ppos == 0 || priv->pending)
+			/*
+			 * If we got this far with `*ppos == 0` then we've read
+			 * data out of IDR, so set IBF when reporting back to
+			 * userspace so userspace knows the IDR value is valid.
+			 */
+			str |= STR4_IBF;
+
+		dev_dbg(dev, "Read status 0x%x\n", str);
+		if (copy_to_user(buf, &str, sizeof(str))) {
+			rc = -EFAULT;
+			goto out;
+		}
+
+		remaining--;
+	}
+
+	WARN_ON(remaining);
+
+	rc = count;
+
+out:
+	spin_unlock_irq(&priv->rx.lock);
+
+	return rc;
+}
+
+static ssize_t mctp_lpc_write(struct file *filp, const char __user *buf,
+			      size_t count, loff_t *ppos)
+{
+	uint8_t _data[2], *data = &_data[0];
+	struct mctp_lpc *priv;
+	struct device *dev;
+	size_t remaining;
+	unsigned int str;
+
+	priv = to_mctp_lpc(filp);
+	dev = priv->miscdev.this_device;
+
+	if (!count)
+		return count;
+
+	if (count > 2)
+		return -EINVAL;
+
+	if (*ppos >= 2)
+		return -EINVAL;
+
+	if (*ppos + count > 2)
+		return -EINVAL;
+
+	if (copy_from_user(data, buf, count))
+		return -EFAULT;
+
+	remaining = count;
+
+	if (*ppos == 0) {
+		/* Wait until OBF is clear - we don't get an IRQ */
+		dev_dbg(dev, "Waiting for OBF to clear\n");
+		for (;;) {
+			if (signal_pending(current))
+				return -EINTR;
+
+			regmap_read(priv->map, LPC_STR4, &str);
+			if (!(str & STR4_OBF))
+				break;
+
+			msleep(1);
+		}
+
+		dev_dbg(dev, "Writing 0x%x to ODR\n", *data);
+		regmap_write(priv->map, LPC_ODR4, *data);
+		remaining--;
+		data++;
+	}
+
+	if (remaining) {
+		if (!(*data & STR4_OBF))
+			dev_err(dev, "Clearing OBF with status write: 0x%x\n",
+				*data);
+		dev_dbg(dev, "Writing status 0x%x\n", *data);
+		regmap_write(priv->map, LPC_STR4, *data);
+		remaining--;
+	}
+
+	WARN_ON(remaining);
+
+	regmap_read(priv->map, LPC_STR4, &str);
+	dev_dbg(dev, "Triggering SerIRQ (current str=0x%x)\n", str);
+
+	/*
+	 * Trigger Host IRQ on ODR write. Do this after any STR write in case
+	 * we need to write ODR to indicate an STR update (which we do).
+	 */
+	if (*ppos == 0)
+		regmap_update_bits(priv->map, LPC_HICRC, LPC_KCS4_IRQ_HOST,
+				   LPC_KCS4_IRQ_HOST);
+
+	return count;
+}
+
+static __poll_t mctp_lpc_poll(struct file *filp, poll_table *wait)
+{
+	struct mctp_lpc *priv;
+	struct device *dev;
+	unsigned int val;
+	bool ibf;
+
+	priv = to_mctp_lpc(filp);
+	dev = priv->miscdev.this_device;
+
+	regmap_read(priv->map, LPC_STR4, &val);
+
+	spin_lock_irq(&priv->rx.lock);
+
+	ibf = priv->pending || val & STR4_IBF;
+
+	if (!ibf) {
+		dev_dbg(dev, "Polling on IBF\n");
+
+		spin_unlock_irq(&priv->rx.lock);
+
+		poll_wait(filp, &priv->rx, wait);
+		if (signal_pending(current)) {
+			dev_dbg(dev, "Polling IBF was interrupted\n");
+			goto out;
+		}
+
+		spin_lock_irq(&priv->rx.lock);
+
+		regmap_read(priv->map, LPC_STR4, &val);
+
+		ibf = priv->pending || val & STR4_IBF;
+	}
+
+	spin_unlock_irq(&priv->rx.lock);
+
+out:
+	dev_dbg(dev, "Polled IBF state: %s\n", ibf ? "set" : "clear");
+
+	return ibf ? EPOLLIN : 0;
+}
+
+static const struct file_operations mctp_lpc_fops = {
+	.owner          = THIS_MODULE,
+	.llseek		= no_seek_end_llseek,
+	.read           = mctp_lpc_read,
+	.write          = mctp_lpc_write,
+	.poll		= mctp_lpc_poll,
+};
+
+static int mctp_lpc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned int mask, val;
+	struct mctp_lpc *priv;
+	int irq;
+	int rc;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(priv->map)) {
+		dev_err(dev, "Couldn't get regmap\n");
+		return -ENODEV;
+	}
+
+	/*
+	 * Set the LPC address. Simultaneously, test our MMIO regmap works. All
+	 * subsequent accesses are assumed to work
+	 */
+	rc = regmap_write(priv->map, LPC_LADR4, ((HOST_STR) << 16) | HOST_ODR);
+	if (rc < 0)
+		return rc;
+
+	/* Set up the SerIRQ */
+	mask = LPC_KCS4_IRQSEL_MASK
+		| LPC_KCS4_IRQTYPE_MASK
+		| LPC_KCS4_OBF4_AUTO_CLR;
+	val = (HOST_SERIRQ_ID << LPC_KCS4_IRQSEL_SHIFT)
+		| (HOST_SERIRQ_TYPE << LPC_KCS4_IRQTYPE_SHIFT);
+	val &= ~LPC_KCS4_OBF4_AUTO_CLR; /* Unnecessary, just documentation */
+	regmap_update_bits(priv->map, LPC_HICRC, mask, val);
+
+	/* Trigger waiters from IRQ */
+	init_waitqueue_head(&priv->rx);
+
+	dev_set_drvdata(dev, priv);
+
+	/* Set up the miscdevice */
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = "mctp0";
+	priv->miscdev.fops = &mctp_lpc_fops;
+
+	/* Configure the IRQ handler */
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	rc = devm_request_irq(dev, irq, mctp_lpc_irq, IRQF_SHARED,
+			      dev_name(dev), priv);
+	if (rc < 0)
+		return rc;
+
+	/* Register the device */
+	rc = misc_register(&priv->miscdev);
+	if (rc) {
+		dev_err(dev, "Unable to register device\n");
+		return rc;
+	}
+
+	/* Enable the channel */
+	regmap_update_bits(priv->map, LPC_HICRB,
+			LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E,
+			LPC_HICRB_IBFIF4 | LPC_HICRB_LPC4E);
+
+	return 0;
+}
+
+static int mctp_lpc_remove(struct platform_device *pdev)
+{
+	struct mctp_lpc *ctx = dev_get_drvdata(&pdev->dev);
+
+	misc_deregister(&ctx->miscdev);
+
+	return 0;
+}
+
+static const struct of_device_id mctp_lpc_match[] = {
+	{ .compatible = "openbmc,mctp-lpc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mctp_lpc_match);
+
+static struct platform_driver mctp_lpc = {
+	.driver = {
+		.name           = "mctp-lpc",
+		.of_match_table = mctp_lpc_match,
+	},
+	.probe  = mctp_lpc_probe,
+	.remove = mctp_lpc_remove,
+};
+module_platform_driver(mctp_lpc);
+
+MODULE_LICENSE("GPL v2+");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_DESCRIPTION("OpenBMC MCTP LPC binding on ASPEED KCS");
-- 
2.20.1

