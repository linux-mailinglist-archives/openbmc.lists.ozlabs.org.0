Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F739F456
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 12:54:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznF70WHJz3c0m
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 20:54:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=aSPN97J6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mLPR22AZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=aSPN97J6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=mLPR22AZ; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzn760lc4z3060;
 Tue,  8 Jun 2021 20:49:38 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A3ADC5804DB;
 Tue,  8 Jun 2021 06:49:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 08 Jun 2021 06:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=gHCNwwemg//gj
 HtLDAoSY5RqAZJdtGPfoXjISKifQ6E=; b=aSPN97J6DbpCwWdWPuhxKfkXefVAT
 5C/+eqBt5bVwNSjVqLn0SqNc8RPyiozG+XIqLwad/DywVSSJBHWkC3xPLJQjLIh6
 zh0iDvTqIeDhfAx2aQhWrozdr79Cb+A9s+0F7sP8icqaEmbLTldm2EDu2JwEk6m+
 LT+MywSXvNMBofmS+T3ZeqdayNCpmrvtztlnUkT5H1oOGYeJzQQ2COqQUL1P2Lun
 srWKpuzqEmT06u9taOVKgXzS9NDUQxwSkkyAgtGyfYpT0SbL6h3YofjQPX+M+SzR
 hHEDYd7XqVh1fcQvI+uz03b7Odjwi8k1NROhgcWEfsXV32ibwVHkSXvLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=gHCNwwemg//gjHtLDAoSY5RqAZJdtGPfoXjISKifQ6E=; b=mLPR22AZ
 6WPAAGJjRq9GYBrla+I41cxwbkEAnYLThRf1NS+deuKV3eiWKiyJfkco3Zp00+Iy
 gCDPo0tbY+Q3ltovTtznSJniWl6Uhv/ZCb0A+jHzpPSNORLjxi4MVLb3Fy+3dKzb
 KTBr2HvinwokZU6GXaoYIi0DBpAFYkRXgZXsVBBabUDuZUV1oHNcgCOpLTWEfVCW
 bX/L4Vn95L3yuZfDXnyU6VWYfv/fcD2gq7aPGLMGz8hpmNg29aeVvHDT24jj8aHi
 QB6ZIdUCadXgr5DBsZWgsOR9/kpggk7Mci6mA5dzNA623P37ZfnZm4IK+BLdINKs
 gocu+5nEEx9Hjg==
X-ME-Sender: <xms:P0u_YK40317aeJS_wxlZap2Ihot3-YLjFT0O2lgB02K3cGz2X3umHA>
 <xme:P0u_YD7eu6pNZyXZGYEeFcifqmWxfmzAuowNtRlSDx9RiIdPL81KcalraIagJz67Q
 Xw6nUS_DTKsg912zg>
X-ME-Received: <xmr:P0u_YJesMRhfmVTpJuw3LTKkUfIhRj5zlI-noVFfa2wDVH2oo_iyAz9VBRRs9tlsvbTn8N4t_ZbyzAYPUeo4b5rff8mM7XuQbxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgepgeenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:P0u_YHKSTUDLlpPw6pL-gwNgg9OjRzyb_3e-P2BoY8fKOzOT9g8hmA>
 <xmx:P0u_YOKK9Ss5Qno-lPrVJuJpPWVy8iS57mjWY3f3qn2KiFpj7kNJ5A>
 <xmx:P0u_YIzKkdfIE8p74LDtG8PSY1V2TLt35dMuY6XN-Ga4eDcYp-Y12A>
 <xmx:P0u_YP7vsSF5xLJVT54YjFLRdSaM1Wu6EtD6zOJc1hnVtRzWMJrHiQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 06:49:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH v4 11/16] ipmi: kcs_bmc: Add serio adaptor
Date: Tue,  8 Jun 2021 20:17:52 +0930
Message-Id: <20210608104757.582199-12-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608104757.582199-1-andrew@aj.id.au>
References: <20210608104757.582199-1-andrew@aj.id.au>
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
 linux-aspeed@lists.ozlabs.org, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, chiawei_wang@aspeedtech.com, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de, zweiss@equinix.com,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

kcs_bmc_serio acts as a bridge between the KCS drivers in the IPMI
subsystem and the existing userspace interfaces available through the
serio subsystem. This is useful when userspace would like to make use of
the BMC KCS devices for purposes that aren't IPMI.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/Kconfig         |  14 +++
 drivers/char/ipmi/Makefile        |   1 +
 drivers/char/ipmi/kcs_bmc_serio.c | 157 ++++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c

diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index bc5f81899b62..249b31197eea 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -137,6 +137,20 @@ config IPMI_KCS_BMC_CDEV_IPMI
 	  This support is also available as a module. The module will be
 	  called kcs_bmc_cdev_ipmi.
 
+config IPMI_KCS_BMC_SERIO
+	depends on IPMI_KCS_BMC && SERIO
+	tristate "SerIO adaptor for BMC KCS devices"
+	help
+	  Adapts the BMC KCS device for the SerIO subsystem. This allows users
+	  to take advantage of userspace interfaces provided by SerIO where
+	  appropriate.
+
+	  Say YES if you wish to expose KCS devices on the BMC via SerIO
+	  interfaces.
+
+	  This support is also available as a module. The module will be
+	  called kcs_bmc_serio.
+
 config ASPEED_BT_IPMI_BMC
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index fcfa676afddb..84f47d18007f 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
 obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
+obj-$(CONFIG_IPMI_KCS_BMC_SERIO) += kcs_bmc_serio.o
 obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
diff --git a/drivers/char/ipmi/kcs_bmc_serio.c b/drivers/char/ipmi/kcs_bmc_serio.c
new file mode 100644
index 000000000000..7948cabde50b
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_serio.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 IBM Corp. */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/sched/signal.h>
+#include <linux/serio.h>
+#include <linux/slab.h>
+
+#include "kcs_bmc_client.h"
+
+struct kcs_bmc_serio {
+	struct list_head entry;
+
+	struct kcs_bmc_client client;
+	struct serio *port;
+
+	spinlock_t lock;
+};
+
+static inline struct kcs_bmc_serio *client_to_kcs_bmc_serio(struct kcs_bmc_client *client)
+{
+	return container_of(client, struct kcs_bmc_serio, client);
+}
+
+static irqreturn_t kcs_bmc_serio_event(struct kcs_bmc_client *client)
+{
+	struct kcs_bmc_serio *priv;
+	u8 handled = IRQ_NONE;
+	u8 status;
+
+	priv = client_to_kcs_bmc_serio(client);
+
+	spin_lock(&priv->lock);
+
+	status = kcs_bmc_read_status(client->dev);
+
+	if (status & KCS_BMC_STR_IBF)
+		handled = serio_interrupt(priv->port, kcs_bmc_read_data(client->dev), 0);
+
+	spin_unlock(&priv->lock);
+
+	return handled;
+}
+
+static const struct kcs_bmc_client_ops kcs_bmc_serio_client_ops = {
+	.event = kcs_bmc_serio_event,
+};
+
+static int kcs_bmc_serio_open(struct serio *port)
+{
+	struct kcs_bmc_serio *priv = port->port_data;
+
+	return kcs_bmc_enable_device(priv->client.dev, &priv->client);
+}
+
+static void kcs_bmc_serio_close(struct serio *port)
+{
+	struct kcs_bmc_serio *priv = port->port_data;
+
+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
+}
+
+static DEFINE_SPINLOCK(kcs_bmc_serio_instances_lock);
+static LIST_HEAD(kcs_bmc_serio_instances);
+
+static int kcs_bmc_serio_add_device(struct kcs_bmc_device *kcs_bmc)
+{
+	struct kcs_bmc_serio *priv;
+	struct serio *port;
+
+	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
+
+	/* Use kzalloc() as the allocation is cleaned up with kfree() via serio_unregister_port() */
+	port = kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!(priv && port))
+		return -ENOMEM;
+
+	port->id.type = SERIO_8042;
+	port->open = kcs_bmc_serio_open;
+	port->close = kcs_bmc_serio_close;
+	port->port_data = priv;
+	port->dev.parent = kcs_bmc->dev;
+
+	spin_lock_init(&priv->lock);
+	priv->port = port;
+	priv->client.dev = kcs_bmc;
+	priv->client.ops = &kcs_bmc_serio_client_ops;
+
+	spin_lock_irq(&kcs_bmc_serio_instances_lock);
+	list_add(&priv->entry, &kcs_bmc_serio_instances);
+	spin_unlock_irq(&kcs_bmc_serio_instances_lock);
+
+	serio_register_port(port);
+
+	dev_info(kcs_bmc->dev, "Initialised serio client for channel %d", kcs_bmc->channel);
+
+	return 0;
+}
+
+static int kcs_bmc_serio_remove_device(struct kcs_bmc_device *kcs_bmc)
+{
+	struct kcs_bmc_serio *priv = NULL, *pos;
+
+	spin_lock_irq(&kcs_bmc_serio_instances_lock);
+	list_for_each_entry(pos, &kcs_bmc_serio_instances, entry) {
+		if (pos->client.dev == kcs_bmc) {
+			priv = pos;
+			list_del(&pos->entry);
+			break;
+		}
+	}
+	spin_unlock_irq(&kcs_bmc_serio_instances_lock);
+
+	if (!priv)
+		return -ENODEV;
+
+	/* kfree()s priv->port via put_device() */
+	serio_unregister_port(priv->port);
+
+	/* Ensure the IBF IRQ is disabled if we were the active client */
+	kcs_bmc_disable_device(kcs_bmc, &priv->client);
+
+	devm_kfree(priv->client.dev->dev, priv);
+
+	return 0;
+}
+
+static const struct kcs_bmc_driver_ops kcs_bmc_serio_driver_ops = {
+	.add_device = kcs_bmc_serio_add_device,
+	.remove_device = kcs_bmc_serio_remove_device,
+};
+
+static struct kcs_bmc_driver kcs_bmc_serio_driver = {
+	.ops = &kcs_bmc_serio_driver_ops,
+};
+
+static int kcs_bmc_serio_init(void)
+{
+	kcs_bmc_register_driver(&kcs_bmc_serio_driver);
+
+	return 0;
+}
+module_init(kcs_bmc_serio_init);
+
+static void kcs_bmc_serio_exit(void)
+{
+	kcs_bmc_unregister_driver(&kcs_bmc_serio_driver);
+}
+module_exit(kcs_bmc_serio_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_DESCRIPTION("Adapter driver for serio access to BMC KCS devices");
-- 
2.30.2

