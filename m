Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5FE31FAD7
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 15:32:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhvDq3452z30R0
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:32:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=bE11dCvM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fD5atMSr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=bE11dCvM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fD5atMSr; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhv6N4bQ6z3cQ3;
 Sat, 20 Feb 2021 01:27:08 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B51055803B8;
 Fri, 19 Feb 2021 09:27:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=5nIryUrMy/Ji+
 0ZlfkGY+ZBu4atkkDBiqU72RrckVZs=; b=bE11dCvMkBCVSyZ3k2bSB5Fxa+4xh
 g9NAqxUorKc9mOQ4BKbzTVf0h9fUJG+Z28LMeTA50CS25Wls2eDKh72RGPF3oofJ
 uCYWaO4YCpbqpF7bMS47eihVyyztxWpvALR44/ONRJ2gO+Q0OD80avzqR8MfoMHL
 Cg7WIOx7qZGxwMp05wY6ogXW7oIT4QTF6N6AFvaC93rkCIvWX/xWR6lZVDnR86X6
 qIno7yOLDffcV/FeIdcCs6sGQy4z9Rn69r0zJegC8B2PCUIvfhxj9HZm7x6dcCRa
 zzBJXcuE9E5/pGvxKsDBUc75F6KgJ7cEnvxmTTZy/FeUFKcs271CoEIzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=5nIryUrMy/Ji+0ZlfkGY+ZBu4atkkDBiqU72RrckVZs=; b=fD5atMSr
 Z++O4PhyIglwqlZsEbdmPV8/HQmPbc20/JEyDN/wRvPyhSJJf6fdXQuares0vQUr
 tc3/6DUhMxw0vR2d56SkaE+WxNP9DCDvkWQbHGenkuDvnJ9q1veWsP22jeYP6FUp
 KhvYc0mDlpTAEgFl9XTBOdbvM/kOoknxOqcObg+4N+FmAEzhynS0z6dOtNnrhUW/
 LVkTRyrsro+SEdVUSnKQ9TQgIi3sKnUowqEb4ByTmqWwYXY1XQD1z1mDKKPtijhC
 5djvAcEIHFyj+/hRLnRCEshFa8/0kSBM85VyJkrdYY1+0/tZnBmOJEWBDrG0P9Ki
 sP1hKCjM5XSoGQ==
X-ME-Sender: <xms:usovYEbE2iEsgzHU3Sq8zfA6U-eELJEMV_4mWilZjoM-6WuvOZc2gQ>
 <xme:usovYPaR-uInMlLnVnuH4OTSp8MdoWK_1ennXTotwgV4lI3IEZPn5GC45LDUzczy6
 NkLl_9h1Y8BWFFnLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:usovYO-B-53_ViI3OK3Q25_dEQCC51OE5DuVzcYtrmb42Eamd-9XkA>
 <xmx:usovYOp4Cor8yplyE3Dw-0VWHsWSHwI61hFOBirX0Ma54NTKo1uTxQ>
 <xmx:usovYPp7E8_hQhN0LaruKpQGNJwJZZo85u5puEOygPqEtPT-JkycOw>
 <xmx:usovYFbeqg0bVInE1pGWJJbOM14jR76_NMgJbi3LtPiVJ_tbydaQhg>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30207240062;
 Fri, 19 Feb 2021 09:26:59 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH 12/19] ipmi: kcs_bmc: Strip private client data from struct
 kcs_bmc
Date: Sat, 20 Feb 2021 00:55:16 +1030
Message-Id: <20210219142523.3464540-13-andrew@aj.id.au>
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

Move all client-private data out of `struct kcs_bmc` into the KCS client
implementation.

With this change the KCS BMC core code now only concerns itself with
abstract `struct kcs_bmc` and `struct kcs_bmc_client` types, achieving
expected separation of concerns. Further, the change clears the path for
implementation of alternative userspace interfaces.

The chardev data-structures are rearranged in the same manner applied to
the KCS device driver data-structures in an earlier patch - `struct
kcs_bmc_client` is embedded in the client's private data and we exploit
container_of() to translate as required.

Finally, now that it is free of client data, `struct kcs_bmc` is renamed
to `struct kcs_bmc_device` to contrast `struct kcs_bmc_client`.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c           |  68 ++++-
 drivers/char/ipmi/kcs_bmc.h           |  86 +-----
 drivers/char/ipmi/kcs_bmc_aspeed.c    |  22 +-
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 424 ++++++++++++++++----------
 drivers/char/ipmi/kcs_bmc_client.h    |  28 +-
 drivers/char/ipmi/kcs_bmc_device.h    |  12 +-
 drivers/char/ipmi/kcs_bmc_npcm7xx.c   |  20 +-
 7 files changed, 366 insertions(+), 294 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 1046ce2bbefc..266ebec71d6f 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2021, IBM Corp.
  */
 
+#include <linux/device.h>
 #include <linux/module.h>
 
 #include "kcs_bmc.h"
@@ -14,51 +15,96 @@
 
 /* Consumer data access */
 
-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
+u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
 {
 	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
 }
 EXPORT_SYMBOL(kcs_bmc_read_data);
 
-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
+void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data)
 {
 	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
 }
 EXPORT_SYMBOL(kcs_bmc_write_data);
 
-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
+u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc)
 {
 	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
 }
 EXPORT_SYMBOL(kcs_bmc_read_status);
 
-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
+void kcs_bmc_write_status(struct kcs_bmc_device *kcs_bmc, u8 data)
 {
 	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
 }
 EXPORT_SYMBOL(kcs_bmc_write_status);
 
-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
+void kcs_bmc_update_status(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 val)
 {
 	kcs_bmc->ops->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
 }
 EXPORT_SYMBOL(kcs_bmc_update_status);
 
-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
+int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
 {
-	return kcs_bmc->client.ops->event(&kcs_bmc->client);
+	struct kcs_bmc_client *client;
+	int rc;
+
+	spin_lock(&kcs_bmc->lock);
+	client = kcs_bmc->client;
+	if (client) {
+		rc = client->ops->event(client);
+	} else {
+		u8 status;
+
+		status = kcs_bmc_read_status(kcs_bmc);
+		if (status & KCS_BMC_STR_IBF) {
+			/* Ack the event by reading the data */
+			kcs_bmc_read_data(kcs_bmc);
+			rc = KCS_BMC_EVENT_HANDLED;
+		} else {
+			rc = KCS_BMC_EVENT_NONE;
+		}
+	}
+	spin_unlock(&kcs_bmc->lock);
+
+	return rc;
 }
 EXPORT_SYMBOL(kcs_bmc_handle_event);
 
-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
+int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
+{
+	int rc;
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->client) {
+		rc = -EBUSY;
+	} else {
+		kcs_bmc->client = client;
+		rc = 0;
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(kcs_bmc_enable_device);
+
+void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
+{
+	spin_lock_irq(&kcs_bmc->lock);
+	if (client == kcs_bmc->client)
+		kcs_bmc->client = NULL;
+	spin_unlock_irq(&kcs_bmc->lock);
+}
+EXPORT_SYMBOL(kcs_bmc_disable_device);
+
+int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
 {
 	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
 }
 EXPORT_SYMBOL(kcs_bmc_add_device);
 
-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
+int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
 {
 	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
 }
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index a1350e567723..3f266740c759 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -6,9 +6,7 @@
 #ifndef __KCS_BMC_H__
 #define __KCS_BMC_H__
 
-#include <linux/miscdevice.h>
-
-#include "kcs_bmc_client.h"
+#include <linux/list.h>
 
 #define KCS_BMC_EVENT_NONE	0
 #define KCS_BMC_EVENT_HANDLED	1
@@ -17,53 +15,6 @@
 #define KCS_BMC_STR_IBF		BIT(1)
 #define KCS_BMC_STR_CMD_DAT	BIT(3)
 
-/* Different phases of the KCS BMC module.
- *  KCS_PHASE_IDLE:
- *            BMC should not be expecting nor sending any data.
- *  KCS_PHASE_WRITE_START:
- *            BMC is receiving a WRITE_START command from system software.
- *  KCS_PHASE_WRITE_DATA:
- *            BMC is receiving a data byte from system software.
- *  KCS_PHASE_WRITE_END_CMD:
- *            BMC is waiting a last data byte from system software.
- *  KCS_PHASE_WRITE_DONE:
- *            BMC has received the whole request from system software.
- *  KCS_PHASE_WAIT_READ:
- *            BMC is waiting the response from the upper IPMI service.
- *  KCS_PHASE_READ:
- *            BMC is transferring the response to system software.
- *  KCS_PHASE_ABORT_ERROR1:
- *            BMC is waiting error status request from system software.
- *  KCS_PHASE_ABORT_ERROR2:
- *            BMC is waiting for idle status afer error from system software.
- *  KCS_PHASE_ERROR:
- *            BMC has detected a protocol violation at the interface level.
- */
-enum kcs_phases {
-	KCS_PHASE_IDLE,
-
-	KCS_PHASE_WRITE_START,
-	KCS_PHASE_WRITE_DATA,
-	KCS_PHASE_WRITE_END_CMD,
-	KCS_PHASE_WRITE_DONE,
-
-	KCS_PHASE_WAIT_READ,
-	KCS_PHASE_READ,
-
-	KCS_PHASE_ABORT_ERROR1,
-	KCS_PHASE_ABORT_ERROR2,
-	KCS_PHASE_ERROR
-};
-
-/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
-enum kcs_errors {
-	KCS_NO_ERROR                = 0x00,
-	KCS_ABORTED_BY_COMMAND      = 0x01,
-	KCS_ILLEGAL_CONTROL_CODE    = 0x02,
-	KCS_LENGTH_ERROR            = 0x06,
-	KCS_UNSPECIFIED_ERROR       = 0xFF
-};
-
 /* IPMI 2.0 - 9.5, KCS Interface Registers
  * @idr: Input Data Register
  * @odr: Output Data Register
@@ -76,36 +27,23 @@ struct kcs_ioreg {
 };
 
 struct kcs_bmc_device_ops;
+struct kcs_bmc_client;
+
+struct kcs_bmc_device {
+	struct list_head entry;
 
-struct kcs_bmc {
 	struct device *dev;
-
-	const struct kcs_bmc_device_ops *ops;
-
-	struct kcs_bmc_client client;
-
-	spinlock_t lock;
-
 	u32 channel;
-	int running;
 
 	struct kcs_ioreg ioreg;
 
-	enum kcs_phases phase;
-	enum kcs_errors error;
+	const struct kcs_bmc_device_ops *ops;
 
-	wait_queue_head_t queue;
-	bool data_in_avail;
-	int  data_in_idx;
-	u8  *data_in;
-
-	int  data_out_idx;
-	int  data_out_len;
-	u8  *data_out;
-
-	struct mutex mutex;
-	u8 *kbuffer;
-
-	struct miscdevice miscdev;
+	spinlock_t lock;
+	struct kcs_bmc_client *client;
 };
+
+/* Temporary exports while refactoring */
+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
 #endif /* __KCS_BMC_H__ */
diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 1b313355b1c8..6f26e7366c0b 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -61,7 +61,7 @@
 #define LPC_STR4             0x11C
 
 struct aspeed_kcs_bmc {
-	struct kcs_bmc kcs_bmc;
+	struct kcs_bmc_device kcs_bmc;
 
 	struct regmap *map;
 };
@@ -71,12 +71,12 @@ struct aspeed_kcs_of_ops {
 	int (*get_io_address)(struct platform_device *pdev);
 };
 
-static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc *kcs_bmc)
+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc_device *kcs_bmc)
 {
 	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
 }
 
-static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
+static u8 aspeed_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 	u32 val = 0;
@@ -88,7 +88,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 	return rc == 0 ? (u8) val : 0;
 }
 
-static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
+static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 	int rc;
@@ -97,7 +97,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
 }
 
-static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val)
+static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 val)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 	int rc;
@@ -119,7 +119,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val
  *     C. KCS4
  *        D / C : CA4h / CA5h
  */
-static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
+static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 addr)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 
@@ -153,7 +153,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
 	}
 }
 
-static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
+static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enable)
 {
 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
 
@@ -228,7 +228,7 @@ static const struct kcs_bmc_device_ops aspeed_kcs_ops = {
 
 static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
 {
-	struct kcs_bmc *kcs_bmc = arg;
+	struct kcs_bmc_device *kcs_bmc = arg;
 	int rc;
 
 	rc = kcs_bmc_handle_event(kcs_bmc);
@@ -238,7 +238,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
 	return rc == KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
 }
 
-static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
+static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
 			struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -338,8 +338,8 @@ static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
 static int aspeed_kcs_probe(struct platform_device *pdev)
 {
 	const struct aspeed_kcs_of_ops *ops;
+	struct kcs_bmc_device *kcs_bmc;
 	struct aspeed_kcs_bmc *priv;
-	struct kcs_bmc *kcs_bmc;
 	struct device_node *np;
 	int rc, channel, addr;
 
@@ -400,7 +400,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 static int aspeed_kcs_remove(struct platform_device *pdev)
 {
 	struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
-	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
+	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
 
 	kcs_bmc_remove_device(kcs_bmc);
 
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
index 5472733b0005..537d936eb3e5 100644
--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -8,13 +8,88 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/ipmi_bmc.h>
+#include <linux/list.h>
+#include <linux/miscdevice.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/poll.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 
-#include "kcs_bmc.h"
+#include "kcs_bmc_client.h"
+
+/* Different phases of the KCS BMC module.
+ *  KCS_PHASE_IDLE:
+ *            BMC should not be expecting nor sending any data.
+ *  KCS_PHASE_WRITE_START:
+ *            BMC is receiving a WRITE_START command from system software.
+ *  KCS_PHASE_WRITE_DATA:
+ *            BMC is receiving a data byte from system software.
+ *  KCS_PHASE_WRITE_END_CMD:
+ *            BMC is waiting a last data byte from system software.
+ *  KCS_PHASE_WRITE_DONE:
+ *            BMC has received the whole request from system software.
+ *  KCS_PHASE_WAIT_READ:
+ *            BMC is waiting the response from the upper IPMI service.
+ *  KCS_PHASE_READ:
+ *            BMC is transferring the response to system software.
+ *  KCS_PHASE_ABORT_ERROR1:
+ *            BMC is waiting error status request from system software.
+ *  KCS_PHASE_ABORT_ERROR2:
+ *            BMC is waiting for idle status afer error from system software.
+ *  KCS_PHASE_ERROR:
+ *            BMC has detected a protocol violation at the interface level.
+ */
+enum kcs_ipmi_phases {
+	KCS_PHASE_IDLE,
+
+	KCS_PHASE_WRITE_START,
+	KCS_PHASE_WRITE_DATA,
+	KCS_PHASE_WRITE_END_CMD,
+	KCS_PHASE_WRITE_DONE,
+
+	KCS_PHASE_WAIT_READ,
+	KCS_PHASE_READ,
+
+	KCS_PHASE_ABORT_ERROR1,
+	KCS_PHASE_ABORT_ERROR2,
+	KCS_PHASE_ERROR
+};
+
+/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
+enum kcs_ipmi_errors {
+	KCS_NO_ERROR                = 0x00,
+	KCS_ABORTED_BY_COMMAND      = 0x01,
+	KCS_ILLEGAL_CONTROL_CODE    = 0x02,
+	KCS_LENGTH_ERROR            = 0x06,
+	KCS_UNSPECIFIED_ERROR       = 0xFF
+};
+
+struct kcs_bmc_ipmi {
+	struct list_head entry;
+
+	struct kcs_bmc_client client;
+
+	spinlock_t lock;
+
+	enum kcs_ipmi_phases phase;
+	enum kcs_ipmi_errors error;
+
+	wait_queue_head_t queue;
+	bool data_in_avail;
+	int  data_in_idx;
+	u8  *data_in;
+
+	int  data_out_idx;
+	int  data_out_len;
+	u8  *data_out;
+
+	struct mutex mutex;
+	u8 *kbuffer;
+
+	struct miscdevice miscdev;
+};
 
 #define DEVICE_NAME "ipmi-kcs"
 
@@ -44,171 +119,169 @@ enum kcs_states {
 #define KCS_CMD_WRITE_END         0x62
 #define KCS_CMD_READ_BYTE         0x68
 
-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
+static inline void set_state(struct kcs_bmc_ipmi *priv, u8 state)
 {
-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
-					KCS_STATUS_STATE(state));
+	kcs_bmc_update_status(priv->client.dev, KCS_STATUS_STATE_MASK, KCS_STATUS_STATE(state));
 }
 
-static void kcs_bmc_ipmi_force_abort(struct kcs_bmc *kcs_bmc)
+static void kcs_bmc_ipmi_force_abort(struct kcs_bmc_ipmi *priv)
 {
-	set_state(kcs_bmc, ERROR_STATE);
-	kcs_bmc_read_data(kcs_bmc);
-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+	set_state(priv, ERROR_STATE);
+	kcs_bmc_read_data(priv->client.dev);
+	kcs_bmc_write_data(priv->client.dev, KCS_ZERO_DATA);
 
-	kcs_bmc->phase = KCS_PHASE_ERROR;
-	kcs_bmc->data_in_avail = false;
-	kcs_bmc->data_in_idx = 0;
+	priv->phase = KCS_PHASE_ERROR;
+	priv->data_in_avail = false;
+	priv->data_in_idx = 0;
 }
 
-static void kcs_bmc_ipmi_handle_data(struct kcs_bmc *kcs_bmc)
+static void kcs_bmc_ipmi_handle_data(struct kcs_bmc_ipmi *priv)
 {
+	struct kcs_bmc_device *dev;
 	u8 data;
 
-	switch (kcs_bmc->phase) {
+	dev = priv->client.dev;
+
+	switch (priv->phase) {
 	case KCS_PHASE_WRITE_START:
-		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
+		priv->phase = KCS_PHASE_WRITE_DATA;
 		fallthrough;
 
 	case KCS_PHASE_WRITE_DATA:
-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
-			set_state(kcs_bmc, WRITE_STATE);
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						kcs_bmc_read_data(kcs_bmc);
+		if (priv->data_in_idx < KCS_MSG_BUFSIZ) {
+			set_state(priv, WRITE_STATE);
+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
+			priv->data_in[priv->data_in_idx++] = kcs_bmc_read_data(dev);
 		} else {
-			kcs_bmc_ipmi_force_abort(kcs_bmc);
-			kcs_bmc->error = KCS_LENGTH_ERROR;
+			kcs_bmc_ipmi_force_abort(priv);
+			priv->error = KCS_LENGTH_ERROR;
 		}
 		break;
 
 	case KCS_PHASE_WRITE_END_CMD:
-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
-			set_state(kcs_bmc, READ_STATE);
-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						kcs_bmc_read_data(kcs_bmc);
-			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
-			kcs_bmc->data_in_avail = true;
-			wake_up_interruptible(&kcs_bmc->queue);
+		if (priv->data_in_idx < KCS_MSG_BUFSIZ) {
+			set_state(priv, READ_STATE);
+			priv->data_in[priv->data_in_idx++] = kcs_bmc_read_data(dev);
+			priv->phase = KCS_PHASE_WRITE_DONE;
+			priv->data_in_avail = true;
+			wake_up_interruptible(&priv->queue);
 		} else {
-			kcs_bmc_ipmi_force_abort(kcs_bmc);
-			kcs_bmc->error = KCS_LENGTH_ERROR;
+			kcs_bmc_ipmi_force_abort(priv);
+			priv->error = KCS_LENGTH_ERROR;
 		}
 		break;
 
 	case KCS_PHASE_READ:
-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
-			set_state(kcs_bmc, IDLE_STATE);
+		if (priv->data_out_idx == priv->data_out_len)
+			set_state(priv, IDLE_STATE);
 
-		data = kcs_bmc_read_data(kcs_bmc);
+		data = kcs_bmc_read_data(dev);
 		if (data != KCS_CMD_READ_BYTE) {
-			set_state(kcs_bmc, ERROR_STATE);
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			set_state(priv, ERROR_STATE);
+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
 			break;
 		}
 
-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			kcs_bmc->phase = KCS_PHASE_IDLE;
+		if (priv->data_out_idx == priv->data_out_len) {
+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
+			priv->phase = KCS_PHASE_IDLE;
 			break;
 		}
 
-		kcs_bmc_write_data(kcs_bmc,
-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
+		kcs_bmc_write_data(dev, priv->data_out[priv->data_out_idx++]);
 		break;
 
 	case KCS_PHASE_ABORT_ERROR1:
-		set_state(kcs_bmc, READ_STATE);
-		kcs_bmc_read_data(kcs_bmc);
-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
+		set_state(priv, READ_STATE);
+		kcs_bmc_read_data(dev);
+		kcs_bmc_write_data(dev, priv->error);
+		priv->phase = KCS_PHASE_ABORT_ERROR2;
 		break;
 
 	case KCS_PHASE_ABORT_ERROR2:
-		set_state(kcs_bmc, IDLE_STATE);
-		kcs_bmc_read_data(kcs_bmc);
-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-		kcs_bmc->phase = KCS_PHASE_IDLE;
+		set_state(priv, IDLE_STATE);
+		kcs_bmc_read_data(dev);
+		kcs_bmc_write_data(dev, KCS_ZERO_DATA);
+		priv->phase = KCS_PHASE_IDLE;
 		break;
 
 	default:
-		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		kcs_bmc_ipmi_force_abort(priv);
 		break;
 	}
 }
 
-static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
+static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc_ipmi *priv)
 {
 	u8 cmd;
 
-	set_state(kcs_bmc, WRITE_STATE);
-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+	set_state(priv, WRITE_STATE);
+	kcs_bmc_write_data(priv->client.dev, KCS_ZERO_DATA);
 
-	cmd = kcs_bmc_read_data(kcs_bmc);
+	cmd = kcs_bmc_read_data(priv->client.dev);
 	switch (cmd) {
 	case KCS_CMD_WRITE_START:
-		kcs_bmc->phase = KCS_PHASE_WRITE_START;
-		kcs_bmc->error = KCS_NO_ERROR;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
+		priv->phase = KCS_PHASE_WRITE_START;
+		priv->error = KCS_NO_ERROR;
+		priv->data_in_avail = false;
+		priv->data_in_idx = 0;
 		break;
 
 	case KCS_CMD_WRITE_END:
-		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
-			kcs_bmc_ipmi_force_abort(kcs_bmc);
+		if (priv->phase != KCS_PHASE_WRITE_DATA) {
+			kcs_bmc_ipmi_force_abort(priv);
 			break;
 		}
 
-		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
+		priv->phase = KCS_PHASE_WRITE_END_CMD;
 		break;
 
 	case KCS_CMD_GET_STATUS_ABORT:
-		if (kcs_bmc->error == KCS_NO_ERROR)
-			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
+		if (priv->error == KCS_NO_ERROR)
+			priv->error = KCS_ABORTED_BY_COMMAND;
 
-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
+		priv->phase = KCS_PHASE_ABORT_ERROR1;
+		priv->data_in_avail = false;
+		priv->data_in_idx = 0;
 		break;
 
 	default:
-		kcs_bmc_ipmi_force_abort(kcs_bmc);
-		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
+		kcs_bmc_ipmi_force_abort(priv);
+		priv->error = KCS_ILLEGAL_CONTROL_CODE;
 		break;
 	}
 }
 
-static inline struct kcs_bmc *client_to_kcs_bmc(struct kcs_bmc_client *client)
+static inline struct kcs_bmc_ipmi *client_to_kcs_bmc_ipmi(struct kcs_bmc_client *client)
 {
-	return container_of(client, struct kcs_bmc, client);
+	return container_of(client, struct kcs_bmc_ipmi, client);
 }
 
 static int kcs_bmc_ipmi_event(struct kcs_bmc_client *client)
 {
-	struct kcs_bmc *kcs_bmc;
-	unsigned long flags;
+	struct kcs_bmc_ipmi *priv;
 	u8 status;
 	int ret;
 
-	kcs_bmc = client_to_kcs_bmc(client);
+	priv = client_to_kcs_bmc_ipmi(client);
+	if (!priv)
+		return KCS_BMC_EVENT_NONE;
 
-	spin_lock_irqsave(&kcs_bmc->lock, flags);
+	spin_lock(&priv->lock);
 
-	status = kcs_bmc_read_status(kcs_bmc);
+	status = kcs_bmc_read_status(client->dev);
 	if (status & KCS_STATUS_IBF) {
-		if (!kcs_bmc->running)
-			kcs_bmc_ipmi_force_abort(kcs_bmc);
-		else if (status & KCS_STATUS_CMD_DAT)
-			kcs_bmc_ipmi_handle_cmd(kcs_bmc);
+		if (status & KCS_STATUS_CMD_DAT)
+			kcs_bmc_ipmi_handle_cmd(priv);
 		else
-			kcs_bmc_ipmi_handle_data(kcs_bmc);
+			kcs_bmc_ipmi_handle_data(priv);
 
 		ret = KCS_BMC_EVENT_HANDLED;
 	} else {
 		ret = KCS_BMC_EVENT_NONE;
 	}
 
-	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
+	spin_unlock(&priv->lock);
 
 	return ret;
 }
@@ -217,37 +290,29 @@ static const struct kcs_bmc_client_ops kcs_bmc_ipmi_client_ops = {
 	.event = kcs_bmc_ipmi_event,
 };
 
-static inline struct kcs_bmc *file_to_kcs_bmc(struct file *filp)
+static inline struct kcs_bmc_ipmi *to_kcs_bmc(struct file *filp)
 {
-	return container_of(filp->private_data, struct kcs_bmc, miscdev);
+	return container_of(filp->private_data, struct kcs_bmc_ipmi, miscdev);
 }
 
 static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
 {
-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
-	int ret = 0;
+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
 
-	spin_lock_irq(&kcs_bmc->lock);
-	if (!kcs_bmc->running)
-		kcs_bmc->running = 1;
-	else
-		ret = -EBUSY;
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return ret;
+	return kcs_bmc_enable_device(priv->client.dev, &priv->client);
 }
 
 static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
 {
-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
 	__poll_t mask = 0;
 
-	poll_wait(filp, &kcs_bmc->queue, wait);
+	poll_wait(filp, &priv->queue, wait);
 
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->data_in_avail)
+	spin_lock_irq(&priv->lock);
+	if (priv->data_in_avail)
 		mask |= EPOLLIN;
-	spin_unlock_irq(&kcs_bmc->lock);
+	spin_unlock_irq(&priv->lock);
 
 	return mask;
 }
@@ -255,24 +320,24 @@ static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
 static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
 			    size_t count, loff_t *ppos)
 {
-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
 	bool data_avail;
 	size_t data_len;
 	ssize_t ret;
 
 	if (!(filp->f_flags & O_NONBLOCK))
-		wait_event_interruptible(kcs_bmc->queue,
-					 kcs_bmc->data_in_avail);
+		wait_event_interruptible(priv->queue,
+					 priv->data_in_avail);
 
-	mutex_lock(&kcs_bmc->mutex);
+	mutex_lock(&priv->mutex);
 
-	spin_lock_irq(&kcs_bmc->lock);
-	data_avail = kcs_bmc->data_in_avail;
+	spin_lock_irq(&priv->lock);
+	data_avail = priv->data_in_avail;
 	if (data_avail) {
-		data_len = kcs_bmc->data_in_idx;
-		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
+		data_len = priv->data_in_idx;
+		memcpy(priv->kbuffer, priv->data_in, data_len);
 	}
-	spin_unlock_irq(&kcs_bmc->lock);
+	spin_unlock_irq(&priv->lock);
 
 	if (!data_avail) {
 		ret = -EAGAIN;
@@ -281,35 +346,35 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
 
 	if (count < data_len) {
 		pr_err("channel=%u with too large data : %zu\n",
-			kcs_bmc->channel, data_len);
+			priv->client.dev->channel, data_len);
 
-		spin_lock_irq(&kcs_bmc->lock);
-		kcs_bmc_ipmi_force_abort(kcs_bmc);
-		spin_unlock_irq(&kcs_bmc->lock);
+		spin_lock_irq(&priv->lock);
+		kcs_bmc_ipmi_force_abort(priv);
+		spin_unlock_irq(&priv->lock);
 
 		ret = -EOVERFLOW;
 		goto out_unlock;
 	}
 
-	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
+	if (copy_to_user(buf, priv->kbuffer, data_len)) {
 		ret = -EFAULT;
 		goto out_unlock;
 	}
 
 	ret = data_len;
 
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
-		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
+	spin_lock_irq(&priv->lock);
+	if (priv->phase == KCS_PHASE_WRITE_DONE) {
+		priv->phase = KCS_PHASE_WAIT_READ;
+		priv->data_in_avail = false;
+		priv->data_in_idx = 0;
 	} else {
 		ret = -EAGAIN;
 	}
-	spin_unlock_irq(&kcs_bmc->lock);
+	spin_unlock_irq(&priv->lock);
 
 out_unlock:
-	mutex_unlock(&kcs_bmc->mutex);
+	mutex_unlock(&priv->mutex);
 
 	return ret;
 }
@@ -317,35 +382,35 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
 static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
 			     size_t count, loff_t *ppos)
 {
-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
 	ssize_t ret;
 
 	/* a minimum response size '3' : netfn + cmd + ccode */
 	if (count < 3 || count > KCS_MSG_BUFSIZ)
 		return -EINVAL;
 
-	mutex_lock(&kcs_bmc->mutex);
+	mutex_lock(&priv->mutex);
 
-	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
+	if (copy_from_user(priv->kbuffer, buf, count)) {
 		ret = -EFAULT;
 		goto out_unlock;
 	}
 
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
-		kcs_bmc->phase = KCS_PHASE_READ;
-		kcs_bmc->data_out_idx = 1;
-		kcs_bmc->data_out_len = count;
-		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
+	spin_lock_irq(&priv->lock);
+	if (priv->phase == KCS_PHASE_WAIT_READ) {
+		priv->phase = KCS_PHASE_READ;
+		priv->data_out_idx = 1;
+		priv->data_out_len = count;
+		memcpy(priv->data_out, priv->kbuffer, count);
+		kcs_bmc_write_data(priv->client.dev, priv->data_out[0]);
 		ret = count;
 	} else {
 		ret = -EINVAL;
 	}
-	spin_unlock_irq(&kcs_bmc->lock);
+	spin_unlock_irq(&priv->lock);
 
 out_unlock:
-	mutex_unlock(&kcs_bmc->mutex);
+	mutex_unlock(&priv->mutex);
 
 	return ret;
 }
@@ -353,22 +418,22 @@ static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
 static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
 			  unsigned long arg)
 {
-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
 	long ret = 0;
 
-	spin_lock_irq(&kcs_bmc->lock);
+	spin_lock_irq(&priv->lock);
 
 	switch (cmd) {
 	case IPMI_BMC_IOCTL_SET_SMS_ATN:
-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
+		kcs_bmc_update_status(priv->client.dev, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
 		break;
 
 	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
+		kcs_bmc_update_status(priv->client.dev, KCS_STATUS_SMS_ATN, 0);
 		break;
 
 	case IPMI_BMC_IOCTL_FORCE_ABORT:
-		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		kcs_bmc_ipmi_force_abort(priv);
 		break;
 
 	default:
@@ -376,19 +441,17 @@ static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
 		break;
 	}
 
-	spin_unlock_irq(&kcs_bmc->lock);
+	spin_unlock_irq(&priv->lock);
 
 	return ret;
 }
 
 static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
 {
-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
 
-	spin_lock_irq(&kcs_bmc->lock);
-	kcs_bmc->running = 0;
-	kcs_bmc_ipmi_force_abort(kcs_bmc);
-	spin_unlock_irq(&kcs_bmc->lock);
+	kcs_bmc_ipmi_force_abort(priv);
+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
 
 	return 0;
 }
@@ -403,54 +466,76 @@ static const struct file_operations kcs_bmc_ipmi_fops = {
 	.unlocked_ioctl = kcs_bmc_ipmi_ioctl,
 };
 
-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
+static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
+static LIST_HEAD(kcs_bmc_ipmi_instances);
+
+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
 {
+	struct kcs_bmc_ipmi *priv;
 	int rc;
 
-	spin_lock_init(&kcs_bmc->lock);
-	mutex_init(&kcs_bmc->mutex);
-	init_waitqueue_head(&kcs_bmc->queue);
-
-	kcs_bmc->client.dev = kcs_bmc;
-	kcs_bmc->client.ops = &kcs_bmc_ipmi_client_ops;
-	kcs_bmc->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-
-	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
-	kcs_bmc->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u",
-					       DEVICE_NAME, kcs_bmc->channel);
-	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
-	    !kcs_bmc->miscdev.name)
+	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	kcs_bmc->miscdev.fops = &kcs_bmc_ipmi_fops;
+	spin_lock_init(&priv->lock);
+	mutex_init(&priv->mutex);
 
-	rc = misc_register(&kcs_bmc->miscdev);
+	init_waitqueue_head(&priv->queue);
+
+	priv->client.dev = kcs_bmc;
+	priv->client.ops = &kcs_bmc_ipmi_client_ops;
+	priv->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	priv->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	priv->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u", DEVICE_NAME,
+					   kcs_bmc->channel);
+	if (!priv->data_in || !priv->data_out || !priv->kbuffer || !priv->miscdev.name)
+		return -EINVAL;
+
+	priv->miscdev.fops = &kcs_bmc_ipmi_fops;
+
+	rc = misc_register(&priv->miscdev);
 	if (rc) {
 		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
 		return rc;
 	}
 
+	spin_lock_irq(&kcs_bmc_ipmi_instances_lock);
+	list_add(&priv->entry, &kcs_bmc_ipmi_instances);
+	spin_unlock_irq(&kcs_bmc_ipmi_instances_lock);
+
 	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_bmc->channel);
 
 	return 0;
 }
 EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
 
-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc)
+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
 {
-	misc_deregister(&kcs_bmc->miscdev);
+	struct kcs_bmc_ipmi *priv, *pos;
 
-	spin_lock_irq(&kcs_bmc->lock);
-	kcs_bmc->running = 0;
-	kcs_bmc_ipmi_force_abort(kcs_bmc);
-	spin_unlock_irq(&kcs_bmc->lock);
+	spin_lock_irq(&kcs_bmc_ipmi_instances_lock);
+	list_for_each_entry(pos, &kcs_bmc_ipmi_instances, entry) {
+		if (pos->client.dev == kcs_bmc) {
+			priv = pos;
+			list_del(&pos->entry);
+			break;
+		}
+	}
+	spin_unlock_irq(&kcs_bmc_ipmi_instances_lock);
 
-	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
-	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
-	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
-	devm_kfree(kcs_bmc->dev, kcs_bmc);
+	if (!priv)
+		return 0;
+
+	misc_deregister(&priv->miscdev);
+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
+	devm_kfree(kcs_bmc->dev, priv->kbuffer);
+	devm_kfree(kcs_bmc->dev, priv->data_out);
+	devm_kfree(kcs_bmc->dev, priv->data_in);
+	devm_kfree(kcs_bmc->dev, priv);
 
 	return 0;
 }
@@ -458,4 +543,5 @@ EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
 MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system software");
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bmc_client.h
index 140631d157d8..2dd710f4b4aa 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -8,22 +8,24 @@
 #include <linux/notifier.h>
 #include <stdbool.h>
 
-struct kcs_bmc;
-struct kcs_bmc_client_ops;
-
-struct kcs_bmc_client {
-	const struct kcs_bmc_client_ops *ops;
-
-	struct kcs_bmc *dev;
-};
+#include "kcs_bmc.h"
 
 struct kcs_bmc_client_ops {
 	int (*event)(struct kcs_bmc_client *client);
 };
 
-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
+struct kcs_bmc_client {
+	const struct kcs_bmc_client_ops *ops;
+
+	struct kcs_bmc_device *dev;
+};
+
+int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
+void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
+
+u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc);
+void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data);
+u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc);
+void kcs_bmc_write_status(struct kcs_bmc_device *kcs_bmc, u8 data);
+void kcs_bmc_update_status(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 val);
 #endif
diff --git a/drivers/char/ipmi/kcs_bmc_device.h b/drivers/char/ipmi/kcs_bmc_device.h
index 33462174516d..57b7174b2bac 100644
--- a/drivers/char/ipmi/kcs_bmc_device.h
+++ b/drivers/char/ipmi/kcs_bmc_device.h
@@ -7,13 +7,13 @@
 #include "kcs_bmc.h"
 
 struct kcs_bmc_device_ops {
-	u8 (*io_inputb)(struct kcs_bmc *kcs_bmc, u32 reg);
-	void (*io_outputb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 b);
-	void (*io_updateb)(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 b);
+	u8 (*io_inputb)(struct kcs_bmc_device *kcs_bmc, u32 reg);
+	void (*io_outputb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 b);
+	void (*io_updateb)(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 b);
 };
 
-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc);
-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc);
+int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc);
+int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc);
 
 #endif
diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 1d21697fc585..dce93ec895fc 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -65,7 +65,7 @@ struct npcm7xx_kcs_reg {
 };
 
 struct npcm7xx_kcs_bmc {
-	struct kcs_bmc kcs_bmc;
+	struct kcs_bmc_device kcs_bmc;
 
 	struct regmap *map;
 
@@ -78,12 +78,12 @@ static const struct npcm7xx_kcs_reg npcm7xx_kcs_reg_tbl[KCS_CHANNEL_MAX] = {
 	{ .sts = KCS3ST, .dob = KCS3DO, .dib = KCS3DI, .ctl = KCS3CTL, .ie = KCS3IE },
 };
 
-static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc *kcs_bmc)
+static inline struct npcm7xx_kcs_bmc *to_npcm7xx_kcs_bmc(struct kcs_bmc_device *kcs_bmc)
 {
 	return container_of(kcs_bmc, struct npcm7xx_kcs_bmc, kcs_bmc);
 }
 
-static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
+static u8 npcm7xx_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
 {
 	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 	u32 val = 0;
@@ -95,7 +95,7 @@ static u8 npcm7xx_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
 	return rc == 0 ? (u8)val : 0;
 }
 
-static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
+static void npcm7xx_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
 {
 	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 	int rc;
@@ -104,7 +104,7 @@ static void npcm7xx_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
 }
 
-static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 data)
+static void npcm7xx_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 data)
 {
 	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 	int rc;
@@ -113,7 +113,7 @@ static void npcm7xx_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 da
 	WARN(rc != 0, "regmap_update_bits() failed: %d\n", rc);
 }
 
-static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
+static void npcm7xx_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enable)
 {
 	struct npcm7xx_kcs_bmc *priv = to_npcm7xx_kcs_bmc(kcs_bmc);
 
@@ -126,7 +126,7 @@ static void npcm7xx_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
 
 static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
 {
-	struct kcs_bmc *kcs_bmc = arg;
+	struct kcs_bmc_device *kcs_bmc = arg;
 	int rc;
 
 	rc = kcs_bmc_handle_event(kcs_bmc);
@@ -136,7 +136,7 @@ static irqreturn_t npcm7xx_kcs_irq(int irq, void *arg)
 	return rc == KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
 }
 
-static int npcm7xx_kcs_config_irq(struct kcs_bmc *kcs_bmc,
+static int npcm7xx_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
 				  struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -160,7 +160,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct npcm7xx_kcs_bmc *priv;
-	struct kcs_bmc *kcs_bmc;
+	struct kcs_bmc_device *kcs_bmc;
 	u32 chan;
 	int rc;
 
@@ -207,7 +207,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 static int npcm7xx_kcs_remove(struct platform_device *pdev)
 {
 	struct npcm7xx_kcs_bmc *priv = platform_get_drvdata(pdev);
-	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
+	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
 
 	kcs_bmc_remove_device(kcs_bmc);
 
-- 
2.27.0

