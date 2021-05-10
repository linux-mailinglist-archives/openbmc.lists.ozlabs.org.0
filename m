Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2CB377BE1
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 07:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdqps6dZhz303P
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 15:48:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=jAAXUp5D;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FtCxL4lY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=jAAXUp5D; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FtCxL4lY; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdqjr3Ww3z307W;
 Mon, 10 May 2021 15:44:00 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 79C3C5803ED;
 Mon, 10 May 2021 01:43:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 10 May 2021 01:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=InrPZqVE3HCO6
 TAKccZenE663hE0xm5RBvgu+bsgDEw=; b=jAAXUp5Dqa76i0rGRavmtAD2Xc11D
 w1STNY/sDZZ/PJ6n74q9ZZ+liaRr8Mb8ohwinZw1EwlKbdenL6G7/YkFv/oJaoh5
 sCEtI2KFlPGtTIykmhvMuFdndL4Xa18LC6X3ua5SPeCcRX3ZqmmMV3AGwbR6lkvm
 PnKDfv8TczzGn4eWlRlaQJQryANRMDjZpfQLWDJhS+wkSXfp1k25r7L/MXQI+/4T
 qUHOnrUEa1lOh8dKjkm1EUhjivjuAHEI+EIikwnGNtWb+2i1nK2r/s+hWXB8x7Fg
 P0wFugR42AJXgOnlXWYXivamXwINIDGaIpyn9QRXU8/leZDDW1/9mlFHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=InrPZqVE3HCO6TAKccZenE663hE0xm5RBvgu+bsgDEw=; b=FtCxL4lY
 b25dXUeBpdn0iRs28Q2YKDEBDSu6ZAnbuC0xJVO3NoU+GoV8x9i28tdS+l4Ei3t8
 PLQeOZHAfHjWsUiweK3zaKp/mIX4SpCWzN/2+4x36S4TIwBXTWi8RjtBRVQpbyPY
 b4M9F0xGUOFEqXblUbCe5M9iRM2TQW6GM4hPrO4cDxjPRVcxfjNMwuBdNbVuz37w
 lEN2ar0S5GECdRX9+++wflz0+ocbIfBDnEgzrCeT1rF6aLZ73SXjg4eYh5obASTc
 DX9qrSU9d//PGtzqW26KfU9cx3fsy09hvxFTExJJVYF3+sjhg5DrN76TjFYwLEwj
 pBfaNKLaArclng==
X-ME-Sender: <xms:HsiYYHcZwLuPCNfNU-FVhdHABIZXCHhKCTOaYmBuIQAXWZBglGJlmA>
 <xme:HsiYYNPdVXuoT92WNrxDPHyU32kiIMOsuYEpMt7JowTjmPEaqfTbwQF94Lmr3nFVO
 Aq9Amtli3nISjK6cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedvtdefrdehjedrvdduhedrkeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:HsiYYAhdvxhGOhVbffeyHiWDVl6m5QUbtnB1uEYGsl8L61X7hEr7gA>
 <xmx:HsiYYI84U2-gnZ18vSQdxb3xqvEAsiHxnCEk8cn-wrwmh_d6Nyq1yA>
 <xmx:HsiYYDtTV42-Jj3_b9e-UY-yj6isaVGWimLqsiMtpdUjN4_7xLfGXA>
 <xmx:HsiYYMOvJpqcmWj8XztFMasFv3TPkIyRcSHHFxBST10kVVauSMLqRQ>
Received: from localhost.localdomain (unknown [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 01:43:52 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v3 08/16] ipmi: kcs_bmc: Decouple the IPMI chardev from the
 core
Date: Mon, 10 May 2021 15:12:05 +0930
Message-Id: <20210510054213.1610760-9-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510054213.1610760-1-andrew@aj.id.au>
References: <20210510054213.1610760-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, avifishman70@gmail.com, venture@google.com,
 chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Now that we have untangled the data-structures, split the userspace
interface out into its own module. Userspace interfaces and drivers are
registered to the KCS BMC core to support arbitrary binding of either.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/Kconfig             | 13 +++++
 drivers/char/ipmi/Makefile            |  3 +-
 drivers/char/ipmi/kcs_bmc.c           | 76 ++++++++++++++++++++++++---
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 31 ++++++++---
 drivers/char/ipmi/kcs_bmc_client.h    | 14 +++++
 5 files changed, 122 insertions(+), 15 deletions(-)

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
index 70bfeb72c3c7..2ec8312ce766 100644
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
 
+/* Record registered devices and drivers */
+static DEFINE_MUTEX(kcs_bmc_lock);
+static LIST_HEAD(kcs_bmc_devices);
+static LIST_HEAD(kcs_bmc_drivers);
+
 /* Consumer data access */
 
 u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
@@ -98,24 +105,77 @@ void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_clien
 }
 EXPORT_SYMBOL(kcs_bmc_disable_device);
 
-int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc);
 void kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
 {
-	if (kcs_bmc_ipmi_add_device(kcs_bmc))
-		pr_warn("Failed to add device for KCS channel %d\n",
-			kcs_bmc->channel);
+	struct kcs_bmc_driver *drv;
+	int rc;
+
+	spin_lock_init(&kcs_bmc->lock);
+	kcs_bmc->client = NULL;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
+	list_for_each_entry(drv, &kcs_bmc_drivers, entry) {
+		rc = drv->ops->add_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
 }
 EXPORT_SYMBOL(kcs_bmc_add_device);
 
-int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc);
 void kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
 {
-	if (kcs_bmc_ipmi_remove_device(kcs_bmc))
-		pr_warn("Failed to remove device for KCS channel %d\n",
-			kcs_bmc->channel);
+	struct kcs_bmc_driver *drv;
+	int rc;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_del(&kcs_bmc->entry);
+	list_for_each_entry(drv, &kcs_bmc_drivers, entry) {
+		rc = drv->ops->remove_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to remove chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
 }
 EXPORT_SYMBOL(kcs_bmc_remove_device);
 
+void kcs_bmc_register_driver(struct kcs_bmc_driver *drv)
+{
+	struct kcs_bmc_device *kcs_bmc;
+	int rc;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_add(&drv->entry, &kcs_bmc_drivers);
+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
+		rc = drv->ops->add_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
+}
+EXPORT_SYMBOL(kcs_bmc_register_driver);
+
+void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv)
+{
+	struct kcs_bmc_device *kcs_bmc;
+	int rc;
+
+	mutex_lock(&kcs_bmc_lock);
+	list_del(&drv->entry);
+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
+		rc = drv->ops->remove_device(kcs_bmc);
+		if (rc)
+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
+				kcs_bmc->channel, rc);
+	}
+	mutex_unlock(&kcs_bmc_lock);
+}
+EXPORT_SYMBOL(kcs_bmc_unregister_driver);
+
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
index 865d8b93f3b7..486834a962c3 100644
--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -469,8 +469,7 @@ static const struct file_operations kcs_bmc_ipmi_fops = {
 static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
 static LIST_HEAD(kcs_bmc_ipmi_instances);
 
-int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc);
-int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc)
+static int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc)
 {
 	struct kcs_bmc_ipmi *priv;
 	int rc;
@@ -512,10 +511,8 @@ int kcs_bmc_ipmi_add_device(struct kcs_bmc_device *kcs_bmc)
 
 	return 0;
 }
-EXPORT_SYMBOL(kcs_bmc_ipmi_add_device);
 
-int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc);
-int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc)
+static int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc)
 {
 	struct kcs_bmc_ipmi *priv = NULL, *pos;
 
@@ -541,7 +538,29 @@ int kcs_bmc_ipmi_remove_device(struct kcs_bmc_device *kcs_bmc)
 
 	return 0;
 }
-EXPORT_SYMBOL(kcs_bmc_ipmi_remove_device);
+
+static const struct kcs_bmc_driver_ops kcs_bmc_ipmi_driver_ops = {
+	.add_device = kcs_bmc_ipmi_add_device,
+	.remove_device = kcs_bmc_ipmi_remove_device,
+};
+
+static struct kcs_bmc_driver kcs_bmc_ipmi_driver = {
+	.ops = &kcs_bmc_ipmi_driver_ops,
+};
+
+static int kcs_bmc_ipmi_init(void)
+{
+	kcs_bmc_register_driver(&kcs_bmc_ipmi_driver);
+
+	return 0;
+}
+module_init(kcs_bmc_ipmi_init);
+
+static void kcs_bmc_ipmi_exit(void)
+{
+	kcs_bmc_unregister_driver(&kcs_bmc_ipmi_driver);
+}
+module_exit(kcs_bmc_ipmi_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
diff --git a/drivers/char/ipmi/kcs_bmc_client.h b/drivers/char/ipmi/kcs_bmc_client.h
index c0f85c5bdf5c..cb38b56cda85 100644
--- a/drivers/char/ipmi/kcs_bmc_client.h
+++ b/drivers/char/ipmi/kcs_bmc_client.h
@@ -11,6 +11,17 @@
 
 #include "kcs_bmc.h"
 
+struct kcs_bmc_driver_ops {
+	int (*add_device)(struct kcs_bmc_device *kcs_bmc);
+	int (*remove_device)(struct kcs_bmc_device *kcs_bmc);
+};
+
+struct kcs_bmc_driver {
+	struct list_head entry;
+
+	const struct kcs_bmc_driver_ops *ops;
+};
+
 struct kcs_bmc_client_ops {
 	irqreturn_t (*event)(struct kcs_bmc_client *client);
 };
@@ -21,6 +32,9 @@ struct kcs_bmc_client {
 	struct kcs_bmc_device *dev;
 };
 
+void kcs_bmc_register_driver(struct kcs_bmc_driver *drv);
+void kcs_bmc_unregister_driver(struct kcs_bmc_driver *drv);
+
 int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client);
 
-- 
2.27.0

