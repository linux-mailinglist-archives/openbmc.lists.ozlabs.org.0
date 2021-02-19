Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4F31FAD3
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 15:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhvD026bpz3cGl
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:32:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=syY9LauL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DbXr4PdD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=syY9LauL; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DbXr4PdD; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhv6H0MlSz3cPP;
 Sat, 20 Feb 2021 01:27:03 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 179B95803B0;
 Fri, 19 Feb 2021 09:27:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 19 Feb 2021 09:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=nKz4XmFfVVUhw
 bo7d4A+YZ1zv8twYH09kSSgWmxRb6E=; b=syY9LauLhOepInaePT4NKDa6YH2iL
 qTR8ezChrWswj6A1iK5C6rNIK+7DNR/fRsxHt06n1zw1byQEJFnQTmaz2z9fDv4K
 hDQwI5QQ29p7lhQQoDf6FuV/Dg0/Zo+UlxJqhgpPehMmh3e91ZjZrtV9AYkzFJld
 l/ooQZ/729pR6RipspLezksa/OnEtjWQOYZD4wgnrna1b0RYaeGZzwugg2sJTRps
 v3OkSpbUKQ8zWhFzvBZJNbtmDQRwmSjoVUJMHcvE46+B5m5G4vGcTUOW2qK/PTrZ
 xvW/B5v9JfrTb+3nlqnbmZy1Ry795ufrYZRhpcFxQa0VuoxBJhnQnwS1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nKz4XmFfVVUhwbo7d4A+YZ1zv8twYH09kSSgWmxRb6E=; b=DbXr4PdD
 GGxYe8G6gKrO7xYx0e7gzD7kbfA08J+I/IdRsmAhyLbQ5J1w3TL+qqD6PN8vcIuX
 chy1uJ8GejQl5OWzXD1rlsquPuTj5KOPo5wTi+jukR3E+pduigW5jrX8cuz8ZPQU
 2aJUNjoEPWFO8AmJhiFmTBzOwyMRkD8uCZ/20uDUmoxr16Ay/ymdb3eexpFeyT/q
 zPO2SDin/0Tr2s7OLYZPMQIAYOCZKszfArGn1HBeQUS96DuxGxtaPnLElN5Pqwh7
 uChceVlZTojNACmow5AVCXv6nEbf12hkB3nQOtNjyxxjlZxCj0mQ0OcLE7SOxSZr
 8YuEW4m1shGV0g==
X-ME-Sender: <xms:s8ovYDOEMeAqj7AOoZ2YiBgtRV0CUdYfJFLD2jqfDgZrIN64QP9wRw>
 <xme:s8ovYIAmyaPLDhbw4A5KwhFzV2OA5ls0wgHISqGkOf-CS0XCASeUHrBhUL9iXmevK
 8M9vcC844Q0xAP_Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:s8ovYHOw5gBNoxst73lKDaH5KLOVk6wgMjNkef-adUcmVRuQymkDAQ>
 <xmx:s8ovYPdVsoKEpmaYLoJ2lBUa7CCCrvHcRqECBZgVqVlrczcCqxQirw>
 <xmx:s8ovYI53pO5gaPdK6vMiluoWZMS-vVWKjXtaUswtIPrzrf1d8zkdiQ>
 <xmx:tcovYIiC7M4hYXhRN1UYcb71uFNtQqDqFu3XfESWQnj1sv_ayIQPHA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67A1124005D;
 Fri, 19 Feb 2021 09:26:53 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH 11/19] ipmi: kcs_bmc: Split headers into device and client
Date: Sat, 20 Feb 2021 00:55:15 +1030
Message-Id: <20210219142523.3464540-12-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219142523.3464540-1-andrew@aj.id.au>
References: <20210219142523.3464540-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 avifishman70@gmail.com, venture@google.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org,
 lee.jones@linaro.org, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Strengthen the distinction between code that abstracts the
implementation of the KCS behaviours (device drivers) and code that
exploits KCS behaviours (clients). Neither needs to know about the APIs
required by the other, so provide separate headers.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c           | 21 ++++++++++-----
 drivers/char/ipmi/kcs_bmc.h           | 30 ++++++++++-----------
 drivers/char/ipmi/kcs_bmc_aspeed.c    | 20 +++++++++-----
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 38 ++++++++++++++++++---------
 drivers/char/ipmi/kcs_bmc_client.h    | 29 ++++++++++++++++++++
 drivers/char/ipmi/kcs_bmc_device.h    | 19 ++++++++++++++
 drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 20 +++++++++-----
 7 files changed, 129 insertions(+), 48 deletions(-)
 create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
 create mode 100644 drivers/char/ipmi/kcs_bmc_device.h

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 709b6bdec165..1046ce2bbefc 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -1,46 +1,52 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2015-2018, Intel Corporation.
+ * Copyright (c) 2021, IBM Corp.
  */
 
 #include <linux/module.h>
 
 #include "kcs_bmc.h"
 
+/* Implement both the device and client interfaces here */
+#include "kcs_bmc_device.h"
+#include "kcs_bmc_client.h"
+
+/* Consumer data access */
+
 u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
 {
-	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
+	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
 }
 EXPORT_SYMBOL(kcs_bmc_read_data);
 
 void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
 {
-	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
+	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
 }
 EXPORT_SYMBOL(kcs_bmc_write_data);
 
 u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
 {
-	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
+	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
 }
 EXPORT_SYMBOL(kcs_bmc_read_status);
 
 void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
 {
-	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
+	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
 }
 EXPORT_SYMBOL(kcs_bmc_write_status);
 
 void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
 {
-	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
+	kcs_bmc->ops->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
 }
 EXPORT_SYMBOL(kcs_bmc_update_status);
 
-int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
 int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
 {
-	return kcs_bmc_ipmi_event(kcs_bmc);
+	return kcs_bmc->client.ops->event(&kcs_bmc->client);
 }
 EXPORT_SYMBOL(kcs_bmc_handle_event);
 
@@ -60,4 +66,5 @@ EXPORT_SYMBOL(kcs_bmc_remove_device);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
 MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system software");
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index bf0ae327997f..a1350e567723 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -8,6 +8,15 @@
 
 #include <linux/miscdevice.h>
 
+#include "kcs_bmc_client.h"
+
+#define KCS_BMC_EVENT_NONE	0
+#define KCS_BMC_EVENT_HANDLED	1
+
+#define KCS_BMC_STR_OBF		BIT(0)
+#define KCS_BMC_STR_IBF		BIT(1)
+#define KCS_BMC_STR_CMD_DAT	BIT(3)
+
 /* Different phases of the KCS BMC module.
  *  KCS_PHASE_IDLE:
  *            BMC should not be expecting nor sending any data.
@@ -66,19 +75,21 @@ struct kcs_ioreg {
 	u32 str;
 };
 
+struct kcs_bmc_device_ops;
+
 struct kcs_bmc {
 	struct device *dev;
 
+	const struct kcs_bmc_device_ops *ops;
+
+	struct kcs_bmc_client client;
+
 	spinlock_t lock;
 
 	u32 channel;
 	int running;
 
-	/* Setup by BMC KCS controller driver */
 	struct kcs_ioreg ioreg;
-	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
-	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
-	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val);
 
 	enum kcs_phases phase;
 	enum kcs_errors error;
@@ -97,15 +108,4 @@ struct kcs_bmc {
 
 	struct miscdevice miscdev;
 };
-
-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
-
-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
-
 #endif /* __KCS_BMC_H__ */
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 0416ac78ce68..1b313355b1c8 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -21,7 +21,7 @@
 #include <linux/slab.h>
 #include <linux/timer.h>
 
-#include "kcs_bmc.h"
+#include "kcs_bmc_device.h"
 
 
 #define DEVICE_NAME     "ast-kcs-bmc"
@@ -220,14 +220,22 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 	}
 }
 
+static const struct kcs_bmc_device_ops aspeed_kcs_ops = {
+	.io_inputb = aspeed_kcs_inb,
+	.io_outputb = aspeed_kcs_outb,
+	.io_updateb = aspeed_kcs_updateb,
+};
+
 static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
 {
 	struct kcs_bmc *kcs_bmc = arg;
+	int rc;
 
-	if (!kcs_bmc_handle_event(kcs_bmc))
-		return IRQ_HANDLED;
+	rc = kcs_bmc_handle_event(kcs_bmc);
+	if (rc < 0)
+		dev_warn(kcs_bmc->dev, "Failed to service irq: %d\n", rc);
 
-	return IRQ_NONE;
+	return rc == KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
@@ -362,9 +370,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 	kcs_bmc->dev = &pdev->dev;
 	kcs_bmc->channel = channel;
 	kcs_bmc->ioreg = ast_kcs_bmc_ioregs[channel - 1];
-	kcs_bmc->io_inputb = aspeed_kcs_inb;
-	kcs_bmc->io_outputb = aspeed_kcs_outb;
-	kcs_bmc->io_updateb = aspeed_kcs_updateb;
+	kcs_bmc->ops = &aspeed_kcs_ops;
 
 	priv->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(priv->map)) {
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
index c8922f94bafd..5472733b0005 100644
--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -22,7 +22,6 @@
 
 #define KCS_ZERO_DATA     0
 
-
 /* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
 #define KCS_STATUS_STATE(state) (state << 6)
 #define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
@@ -179,11 +178,19 @@ static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
 	}
 }
 
-int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
+static inline struct kcs_bmc *client_to_kcs_bmc(struct kcs_bmc_client *client)
 {
+	return container_of(client, struct kcs_bmc, client);
+}
+
+static int kcs_bmc_ipmi_event(struct kcs_bmc_client *client)
+{
+	struct kcs_bmc *kcs_bmc;
 	unsigned long flags;
-	int ret = -ENODATA;
 	u8 status;
+	int ret;
+
+	kcs_bmc = client_to_kcs_bmc(client);
 
 	spin_lock_irqsave(&kcs_bmc->lock, flags);
 
@@ -196,23 +203,28 @@ int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
 		else
 			kcs_bmc_ipmi_handle_data(kcs_bmc);
 
-		ret = 0;
+		ret = KCS_BMC_EVENT_HANDLED;
+	} else {
+		ret = KCS_BMC_EVENT_NONE;
 	}
 
 	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
 
 	return ret;
 }
-EXPORT_SYMBOL(kcs_bmc_ipmi_event);
 
-static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
+static const struct kcs_bmc_client_ops kcs_bmc_ipmi_client_ops = {
+	.event = kcs_bmc_ipmi_event,
+};
+
+static inline struct kcs_bmc *file_to_kcs_bmc(struct file *filp)
 {
 	return container_of(filp->private_data, struct kcs_bmc, miscdev);
 }
 
 static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
 {
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
 	int ret = 0;
 
 	spin_lock_irq(&kcs_bmc->lock);
@@ -227,7 +239,7 @@ static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
 
 static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
 {
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
 	__poll_t mask = 0;
 
 	poll_wait(filp, &kcs_bmc->queue, wait);
@@ -243,7 +255,7 @@ static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
 static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
 			    size_t count, loff_t *ppos)
 {
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
 	bool data_avail;
 	size_t data_len;
 	ssize_t ret;
@@ -305,7 +317,7 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
 static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
 			     size_t count, loff_t *ppos)
 {
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
 	ssize_t ret;
 
 	/* a minimum response size '3' : netfn + cmd + ccode */
@@ -341,7 +353,7 @@ static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
 static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
 			  unsigned long arg)
 {
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
 	long ret = 0;
 
 	spin_lock_irq(&kcs_bmc->lock);
@@ -371,7 +383,7 @@ static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
 
 static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
 {
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
 
 	spin_lock_irq(&kcs_bmc->lock);
 	kcs_bmc->running = 0;
@@ -399,6 +411,8 @@ int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
 	mutex_init(&kcs_bmc->mutex);
 	init_waitqueue_head(&kcs_bmc->queue);
 
+	kcs_bmc->client.dev = kcs_bmc;
+	kcs_bmc->client.ops = &kcs_bmc_ipmi_client_ops;
 	kcs_bmc->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
 	kcs_bmc->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
 	kcs_bmc->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bmc_client.h
new file mode 100644
index 000000000000..140631d157d8
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2021, IBM Corp. */
+
+#ifndef __KCS_BMC_CONSUMER_H__
+#define __KCS_BMC_CONSUMER_H__
+
+#include <linux/list.h>
+#include <linux/notifier.h>
+#include <stdbool.h>
+
+struct kcs_bmc;
+struct kcs_bmc_client_ops;
+
+struct kcs_bmc_client {
+	const struct kcs_bmc_client_ops *ops;
+
+	struct kcs_bmc *dev;
+};
+
+struct kcs_bmc_client_ops {
+	int (*event)(struct kcs_bmc_client *client);
+};
+
+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
+#endif
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bmc_device.h
new file mode 100644
index 000000000000..33462174516d
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_device.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2021, IBM Corp. */
+
+#ifndef __KCS_BMC_DEVICE_H__
+#define __KCS_BMC_DEVICE_H__
+
+#include "kcs_bmc.h"
+
+struct kcs_bmc_device_ops {
+	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
+	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
+	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 b);
+};
+
+int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
+
+#endif
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 5d017498dc69..1d21697fc585 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -17,7 +17,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-#include "kcs_bmc.h"
+#include "kcs_bmc_device.h"
 
 #define DEVICE_NAME	"npcm-kcs-bmc"
 #define KCS_CHANNEL_MAX	3
@@ -127,11 +127,13 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
 {
 	struct kcs_bmc *kcs_bmc = arg;
+	int rc;
 
-	if (!kcs_bmc_handle_event(kcs_bmc))
-		return IRQ_HANDLED;
+	rc = kcs_bmc_handle_event(kcs_bmc);
+	if (rc < 0)
+		dev_warn(kcs_bmc->dev, "Failed to service irq: %d\n", rc);
 
-	return IRQ_NONE;
+	return rc == KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
@@ -148,6 +150,12 @@ static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
 				dev_name(dev), kcs_bmc);
 }
 
+static const struct kcs_bmc_device_ops npcm7xx_kcs_ops = {
+	.io_inputb = npcm7xx_kcs_inb,
+	.io_outputb = npcm7xx_kcs_outb,
+	.io_updateb = npcm7xx_kcs_updateb,
+};
+
 static int npcm7xx_kcs_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -179,9 +187,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 	kcs_bmc->ioreg.idr = priv->reg->dib;
 	kcs_bmc->ioreg.odr = priv->reg->dob;
 	kcs_bmc->ioreg.str = priv->reg->sts;
-	kcs_bmc->io_inputb = npcm7xx_kcs_inb;
-	kcs_bmc->io_outputb = npcm7xx_kcs_outb;
-	kcs_bmc->io_updateb = npcm7xx_kcs_updateb;
+	kcs_bmc->ops = &npcm7xx_kcs_ops;
 
 	platform_set_drvdata(pdev, priv);
 
-- 
2.27.0

