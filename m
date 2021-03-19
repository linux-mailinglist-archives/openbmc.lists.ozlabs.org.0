Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2C13415E3
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 07:35:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1vJy6Myjz3cFq
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 17:35:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Nx7n3I54;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HqA+Y5rX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Nx7n3I54; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HqA+Y5rX; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1vBV5hvVz3bxK;
 Fri, 19 Mar 2021 17:29:38 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DE852580A7B;
 Fri, 19 Mar 2021 02:29:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Mar 2021 02:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Q2miSwLqRNV3E
 hwMpXHGmYjjEg834SrPc8bx9cmDie8=; b=Nx7n3I541OknayZgEWBA9zlpY2CNK
 MOVgrMd9t3n/yAZcHpvTjNPaotr8CfpEGBwwz5tLp3bGPh0+89RklTkuRRFfx4Uw
 K+hdoGrTxsw1gmXduVQetLcMvR26WW8khqjk+ppL7QeeNDOjSbzKhP+ZvKB1W87i
 gPUuagiA3mOdfyfQKmg6/HL0o0HndcdbXcNM4kDx7gmb7RdaLmx3bupl+kpmo3HU
 PlHJb5YR9rtVanJYMiK9SoWDH28tkljuGHiJMVeaZhm2viIggGmAAo6AXjGBn71c
 MSGIcoWLPQsUcYN5DjZXgxdX/+CLq5CXAI7Cz14zY7TJD902uM5y6cl/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Q2miSwLqRNV3EhwMpXHGmYjjEg834SrPc8bx9cmDie8=; b=HqA+Y5rX
 eBgOQigjRY+pciDxyDeP4WX9DetiOz/idnStJKGY60Hj+UwFV51pH7q6DDNzstL1
 igm+rrrCvW010X2dgEG85Gz8NDPf11GkLScA+gx+7kbok4uTNQ8K2tzJkYlfzKEh
 Isng+GAo6E9B4vq0Ur5S5CNLZ0ltjjHlAYOz4sBITS4Ujl6xO4lNA/x0eIMRtOOf
 2F01UrMnICv1buIKYU5UG2X2MfuCkii/KH04dUm1vahosFMxHFvP605XZ4XxaCc0
 TxHNOxjRyKTCfq5A5jkdzyeN+0kTI4wIzoajpjjvMPn6XiGDVdFNQG0rqjmthXbs
 iXLL6w+R1/1kPA==
X-ME-Sender: <xms:0ERUYBC3oKSeDRNr8hLMgcM86cQIf9OwhjtdJQaPunK2kyISmVc3EQ>
 <xme:0ERUYPhtnGd7AusiJt969hfk3MwdMV9GD5AP5Q1X4mbxmEkVT3h3-0aF52AwvBBAN
 wB7X7FXggV4FMUfaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppeduudekrddvuddtrddukedurdeh
 heenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:0ERUYMn6ZxDqLiYxQkz-W0BeeE0vJJiMDtvu7x7tI-3Y9qN6FylC8g>
 <xmx:0ERUYLzJxSuB2EDhEZ4Ys6_Tnm5UbFP-lBCB5oeNYuHS-nWAkeig5Q>
 <xmx:0ERUYGSRCZRMXQI3y-8Ln0jWRikIbhBo-lyHlGVvS7g14qK1heJ43w>
 <xmx:0ERUYPCSMluSBuqIhgolOXqqAl9Duzh9XN2jj6vr2A_xmN8KLHdC9g>
Received: from localhost.localdomain
 (ppp118-210-181-55.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.55])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F437240057;
 Fri, 19 Mar 2021 02:29:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v2 13/21] ipmi: kcs_bmc: Decouple the IPMI chardev from the
 core
Date: Fri, 19 Mar 2021 16:57:44 +1030
Message-Id: <20210319062752.145730-13-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319062752.145730-1-andrew@aj.id.au>
References: <20210319062752.145730-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, ryan_chen@aspeedtech.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org,
 chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Now that we have untangled the data-structures, split the userspace
interface out into its own module. Userspace interfaces and drivers are
registered to the KCS BMC core to support arbitrary binding of either.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/Kconfig             | 13 +++++
 drivers/char/ipmi/Makefile            |  3 +-
 drivers/char/ipmi/kcs_bmc.c           | 78 ++++++++++++++++++++++++++-
 drivers/char/ipmi/kcs_bmc.h           |  4 --
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 33 +++++++++---
 drivers/char/ipmi/kcs_bmc_client.h    | 14 +++++
 6 files changed, 132 insertions(+), 13 deletions(-)

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 07847d9a459a..bc5f81899b62 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -124,6 +124,19 @@ config NPCM7XX_KCS_IPMI_BMC
 	  This support is also available as a module.  If so, the module
 	  will be called kcs_bmc_npcm7xx.
 
+config IPMI_KCS_BMC_CDEV_IPMI
+	depends on IPMI_KCS_BMC
+	tristate "IPMI character device interface for BMC KCS devices"
+	help
+	  Provides a BMC-side character device implementing IPMI
+	  semantics for KCS IPMI devices.
+
+	  Say YES if you wish to expose KCS devices on the BMC for IPMI
+	  purposes.
+
+	  This support is also available as a module. The module will be
+	  called kcs_bmc_cdev_ipmi.
+
 config ASPEED_BT_IPMI_BMC
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index a302bc865370..fcfa676afddb 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -22,7 +22,8 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
 obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
-obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o kcs_bmc_cdev_ipmi.o
+obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
+obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 266ebec71d6f..694db6ee2a92 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -5,7 +5,9 @@
  */
 
 #include <linux/device.h>
+#include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 
 #include "kcs_bmc.h"
 
@@ -13,6 +15,11 @@
 #include "kcs_bmc_device.h"
 #include "kcs_bmc_client.h"
 
+/* Record probed devices and cdevs */
+static DEFINE_MUTEX(kcs_bmc_lock);
+static LIST_HEAD(kcs_bmc_devices);
+static LIST_HEAD(kcs_bmc_cdevs);
+
 /* Consumer data access */
 
 u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
@@ -100,16 +107,83 @@ EXPORT_SYMBOL(kcs_bmc_disable_device);
 
 int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
 {
-	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
+	struct kcs_bmc_cdev *cdev;
+	int rc;
+
+	spin_lock_init(&kcs_bmc->lock);
+	kcs_bmc->client = NULL;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
+	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
+		rc = cdev->ops->add_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
+
+	return 0;
 }
 EXPORT_SYMBOL(kcs_bmc_add_device);
 
 int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
 {
-	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
+	struct kcs_bmc_cdev *cdev;
+	int rc;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_del(&kcs_bmc->entry);
+	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
+		rc = cdev->ops->remove_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to remove chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
+
+	return 0;
 }
 EXPORT_SYMBOL(kcs_bmc_remove_device);
 
+int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev)
+{
+	struct kcs_bmc_device *kcs_bmc;
+	int rc;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_add(&cdev->entry, &kcs_bmc_cdevs);
+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
+		rc = cdev->ops->add_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(kcs_bmc_register_cdev);
+
+int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev)
+{
+	struct kcs_bmc_device *kcs_bmc;
+	int rc;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_del(&cdev->entry);
+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
+		rc = cdev->ops->remove_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
+
+	return rc;
+}
+EXPORT_SYMBOL(kcs_bmc_unregister_cdev);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index 3f266740c759..5deb9a0b8e60 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -42,8 +42,4 @@ struct kcs_bmc_device {
 	spinlock_t lock;
 	struct kcs_bmc_client *client;
 };
-
-/* Temporary exports while refactoring */
-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
 #endif /* __KCS_BMC_H__ */
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
index 58c42e76483d..df83d67851ac 100644
--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -469,8 +469,7 @@ static const struct file_operations kcs_bmc_ipmi_fops = {
 static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
 static LIST_HEAD(kcs_bmc_ipmi_instances);
 
-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
+static int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
 {
 	struct kcs_bmc_ipmi *priv;
 	int rc;
@@ -512,10 +511,8 @@ int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
 
 	return 0;
 }
-EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
 
-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
+static int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
 {
 	struct kcs_bmc_ipmi *priv = NULL, *pos;
 
@@ -541,7 +538,31 @@ int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
 
 	return 0;
 }
-EXPORT_SYMBOL(kcs_bmc_ipmi_detach_cdev);
+
+static const struct kcs_bmc_cdev_ops kcs_bmc_ipmi_cdev_ops = {
+	.add_device = kcs_bmc_ipmi_attach_cdev,
+	.remove_device = kcs_bmc_ipmi_detach_cdev,
+};
+
+static struct kcs_bmc_cdev kcs_bmc_ipmi_cdev = {
+	.ops = &kcs_bmc_ipmi_cdev_ops,
+};
+
+static int kcs_bmc_ipmi_init(void)
+{
+	return kcs_bmc_register_cdev(&kcs_bmc_ipmi_cdev);
+}
+module_init(kcs_bmc_ipmi_init);
+
+static void kcs_bmc_ipmi_exit(void)
+{
+	int rc;
+
+	rc = kcs_bmc_unregister_cdev(&kcs_bmc_ipmi_cdev);
+	if (rc)
+		pr_warn("Failed to remove KCS BMC client: %d", rc);
+}
+module_exit(kcs_bmc_ipmi_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bmc_client.h
index 2dd710f4b4aa..d0a7404ff584 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -10,6 +10,17 @@
 
 #include "kcs_bmc.h"
 
+struct kcs_bmc_cdev_ops {
+	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
+	int (*remove_device)(struct kcs_bmc_device *kcs_bmc);
+};
+
+struct kcs_bmc_cdev {
+	struct list_head entry;
+
+	const struct kcs_bmc_cdev_ops *ops;
+};
+
 struct kcs_bmc_client_ops {
 	int (*event)(struct kcs_bmc_client *client);
 };
@@ -20,6 +31,9 @@ struct kcs_bmc_client {
 	struct kcs_bmc_device *dev;
 };
 
+int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev);
+int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev);
+
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 
-- 
2.27.0

