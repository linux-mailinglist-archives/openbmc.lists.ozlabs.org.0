Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A473B1252
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:40:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8ptk1r7Sz306w
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:40:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=h6Cr2bOR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KWXEobmK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=h6Cr2bOR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KWXEobmK; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psZ5TlCz307j
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:14 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 20077D25;
 Tue, 22 Jun 2021 23:39:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 22 Jun 2021 23:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=vH6omC5hc28Li
 cPoZ2XrJnVd+EV5JxqMlltQbj9TwDs=; b=h6Cr2bORgWmTzsr/6rAWsD2gpFHqX
 K1byVYe4Z8MYhe9nF2XqtqhD9Cnj4//7Y86RL0ZrA+KbDeAFlGUQVRxVbC9VoFCj
 qCDGwu5+scK8G0jbuPyPyMp2vus2/JDpxznH0FIXF8nXhIBo1lEFVoDBf1EM4AbY
 faxAP0Qg2rpDBfAX60iDoJ+D2GQOQAOuBSoMmBr50LIH8sGxZggXYp9jeJxF6hqd
 +N+l1Z/iIET/MCa72ppUvSbOF9svmuSt+DQR/W/c2gyjrlqMAmp/konHaSjXm/n2
 Q5DFMaFFSIqDigK+IrAThmhjyZjEcKwUl4Uuu85OIpsCW/Jrz3E2tlzOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vH6omC5hc28LicPoZ2XrJnVd+EV5JxqMlltQbj9TwDs=; b=KWXEobmK
 P1rZ98zx4s7aUXnzSEpg5ZrlQAZWapTLdVEANLQqUyRNe5B0SgxLS6U9wz9UdS/c
 oJOalRF7IU8UONbcTEh4HTGBEqs0uQlrOssFrBWlrtBzVKK/7Xmi5/mrr6SMdrD1
 Z/gEx/UIvcpP5ZVjbTYt0OsmT1KLkcVUB2HlZi07tM0u/uX3+w6U/Dpp4hIS0yEg
 frbNLHW1ITFCXjvgaPsVqz/rOG1uSCp/NhpBHq0Zft15CGYBsXPl7ese/FIfpBdM
 /gH6aVfgWCdKAPBCdffLVye2SFZPAnbk26mFzpgQ6LpF0XKtXUrn2C34ciM9MZ5W
 hn5wl2MyNBMmvQ==
X-ME-Sender: <xms:36zSYJNf325aUawNSjC6fgIyefWDlybCsQUxJ_wcpuFTs1-QOZdWXw>
 <xme:36zSYL_fc8Ip-tijC7djcSnPPGUEDxcJSptGIg6F757n-h6LBwXbiT5KiPdM1JId6
 wmAcvDF17Bo3brZSQ>
X-ME-Received: <xmr:36zSYIQ20MNULS1mcBlHNXF4hAyEUoTYVT_qXjT-qZ0ZXB8mDkqy0NQ7OuabX37Y8i_DeUGvj76hOOvd8mpetnqTsnYzkfM9D4KijOSEe_JVcNWZBKlAAq8SoZ_uuClhlUn3YF8YbDR_Hw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepuefhtefhudeufeehffeffeetieeufe
 duleevgfekteefteekleetffehjeeukeehnecuffhomhgrihhnpehgihhthhhusgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:36zSYFs6NW9ENLRc7uENDPAOXUTdGWz1R-57_LtzXNvDdm4fhwL73g>
 <xmx:36zSYBdfPx4jA6vVVhJs5xYq0PHyYggY9LOnyGSKnK5IeabDydfu6w>
 <xmx:36zSYB3DhOzHne100gY0gh5FBb683ZJn3cFTAMKh-Dp7hb0KyZDWiA>
 <xmx:36zSYBkgFJVpoSC7vggMOHZruA1vgPH7GJftn4M5l_1FX0bga95qLQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:10 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 2/7] ipmi: kcs_bmc: Add a "raw" character
 device interface
Date: Wed, 23 Jun 2021 13:08:49 +0930
Message-Id: <20210623033854.587464-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623033854.587464-1-andrew@aj.id.au>
References: <20210623033854.587464-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The existing IPMI chardev encodes IPMI behaviours as the name suggests.
However, KCS devices are useful beyond IPMI (or keyboards), as they
provide a means to generate IRQs and exchange arbitrary data between a
BMC and its host system.

Implement a "raw" KCS character device that exposes the IDR, ODR and STR
registers to userspace via read() and write() implemented on a character
device:

+--------+--------+---------+
| Offset | read() | write() |
+--------+--------+---------+
|   0    |   IDR  |   ODR   |
+--------+--------+---------+
|   1    |   STR  |   STR   |
+--------+--------+---------+

This interface allows userspace to implement arbitrary (though somewhat
inefficient) protocols for exchanging information between a BMC and host
firmware. Conceptually the KCS interface can be used as an out-of-band
mechanism for interrupt-signaled control messages while bulk data
transfers occur over more appropriate interfaces between the BMC and the
host (which may lack their own interrupt mechanism, e.g. LPC FW cycles).

poll() is provided, which will wait for IBF or OBE conditions for data
reads and writes respectively. Reads of STR on its own never blocks,
though accessing both offsets in the one system call may block if the
data registers are not ready.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/ABI/testing/dev-raw-kcs |  25 ++
 drivers/char/ipmi/Kconfig             |  17 +
 drivers/char/ipmi/Makefile            |   1 +
 drivers/char/ipmi/kcs_bmc_cdev_raw.c  | 447 ++++++++++++++++++++++++++
 4 files changed, 490 insertions(+)
 create mode 100644 Documentation/ABI/testing/dev-raw-kcs
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_raw.c

diff --git a/Documentation/ABI/testing/dev-raw-kcs b/Documentation/ABI/testing/dev-raw-kcs
new file mode 100644
index 000000000000..06e7e2071562
--- /dev/null
+++ b/Documentation/ABI/testing/dev-raw-kcs
@@ -0,0 +1,25 @@
+What:		/dev/raw-kcs*
+Date:		2021-02-15
+KernelVersion:	5.13
+Contact:	openbmc@lists.ozlabs.org
+Contact:	openipmi-developer@lists.sourceforge.net
+Contact:	Andrew Jeffery <andrew@aj.id.au>
+Description:	``/dev/raw-kcs*`` exposes to userspace the data and
+		status registers of Keyboard-Controller-Style (KCS) IPMI
+		interfaces via read() and write() syscalls. Direct
+		exposure of the data and status registers enables
+		inefficient but arbitrary protocols to be implemented
+		over the device. A typical approach is to use KCS
+		devices for out-of-band signalling for bulk data
+		transfers over other interfaces between a Baseboard
+		Management Controller and its host.
+
+		+--------+--------+---------+
+		| Offset | read() | write() |
+		+--------+--------+---------+
+		|   0    |   IDR  |   ODR   |
+		+--------+--------+---------+
+		|   1    |   STR  |   STR   |
+		+--------+--------+---------+
+
+Users:		libmctp: https://github.com/openbmc/libmctp
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 249b31197eea..19f1efc0bc3d 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -151,6 +151,23 @@ config IPMI_KCS_BMC_SERIO
 	  This support is also available as a module. The module will be
 	  called kcs_bmc_serio.
 
+config IPMI_KCS_BMC_CDEV_RAW
+	depends on IPMI_KCS_BMC
+	tristate "Raw character device interface for BMC KCS devices"
+	help
+	  Provides a BMC-side character device directly exposing the
+	  data and status registers of a KCS device to userspace. While
+	  KCS devices are commonly used to implement IPMI message
+	  passing, they provide a general interface for exchange of
+	  interrupts, data and status information between the BMC and
+	  its host.
+
+	  Say YES if you wish to use the KCS devices to implement
+	  protocols that are not IPMI.
+
+	  This support is also available as a module. The module will be
+	  called kcs_bmc_cdev_raw.
+
 config ASPEED_BT_IPMI_BMC
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 84f47d18007f..3390985b4802 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
 obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
 obj-$(CONFIG_IPMI_KCS_BMC_SERIO) += kcs_bmc_serio.o
 obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
+obj-$(CONFIG_IPMI_KCS_BMC_CDEV_RAW) += kcs_bmc_cdev_raw.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_raw.c b/drivers/char/ipmi/kcs_bmc_cdev_raw.c
new file mode 100644
index 000000000000..6865628476e1
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_cdev_raw.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Copyright (c) 2021 IBM Corp. */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/poll.h>
+
+#include "kcs_bmc_client.h"
+
+#define DEVICE_NAME "raw-kcs"
+
+struct kcs_bmc_raw {
+	struct list_head entry;
+
+	struct kcs_bmc_client client;
+
+	wait_queue_head_t queue;
+	u8 events;
+	bool writable;
+	bool readable;
+	u8 idr;
+
+	struct miscdevice miscdev;
+};
+
+static inline struct kcs_bmc_raw *client_to_kcs_bmc_raw(struct kcs_bmc_client *client)
+{
+	return container_of(client, struct kcs_bmc_raw, client);
+}
+
+/* Call under priv->queue.lock */
+static void kcs_bmc_raw_update_event_mask(struct kcs_bmc_raw *priv, u8 mask, u8 state)
+{
+	kcs_bmc_update_event_mask(priv->client.dev, mask, state);
+	priv->events &= ~mask;
+	priv->events |= state & mask;
+}
+
+static irqreturn_t kcs_bmc_raw_event(struct kcs_bmc_client *client)
+{
+	struct kcs_bmc_raw *priv;
+	struct device *dev;
+	u8 status, handled;
+
+	priv = client_to_kcs_bmc_raw(client);
+	dev = priv->miscdev.this_device;
+
+	spin_lock(&priv->queue.lock);
+
+	status = kcs_bmc_read_status(client->dev);
+	handled = 0;
+
+	if ((priv->events & KCS_BMC_EVENT_TYPE_IBF) && (status & KCS_BMC_STR_IBF)) {
+		if (priv->readable)
+			dev_err(dev, "Unexpected IBF IRQ, dropping data");
+
+		dev_dbg(dev, "Disabling IDR events for back-pressure\n");
+		kcs_bmc_raw_update_event_mask(priv, KCS_BMC_EVENT_TYPE_IBF, 0);
+		priv->idr = kcs_bmc_read_data(client->dev);
+		priv->readable = true;
+
+		dev_dbg(dev, "IDR read, waking waiters\n");
+		wake_up_locked(&priv->queue);
+
+		handled |= KCS_BMC_EVENT_TYPE_IBF;
+	}
+
+	if ((priv->events & KCS_BMC_EVENT_TYPE_OBE) && !(status & KCS_BMC_STR_OBF)) {
+		kcs_bmc_raw_update_event_mask(priv, KCS_BMC_EVENT_TYPE_OBE, 0);
+		priv->writable = true;
+
+		dev_dbg(dev, "ODR writable, waking waiters\n");
+		wake_up_locked(&priv->queue);
+
+		handled |= KCS_BMC_EVENT_TYPE_OBE;
+	}
+
+	spin_unlock(&priv->queue.lock);
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static const struct kcs_bmc_client_ops kcs_bmc_raw_client_ops = {
+	.event = kcs_bmc_raw_event,
+};
+
+static inline struct kcs_bmc_raw *file_to_kcs_bmc_raw(struct file *filp)
+{
+	return container_of(filp->private_data, struct kcs_bmc_raw, miscdev);
+}
+
+static int kcs_bmc_raw_open(struct inode *inode, struct file *filp)
+{
+	struct kcs_bmc_raw *priv = file_to_kcs_bmc_raw(filp);
+	int rc;
+
+	priv->events = KCS_BMC_EVENT_TYPE_IBF;
+	rc = kcs_bmc_enable_device(priv->client.dev, &priv->client);
+	if (rc)
+		priv->events = 0;
+
+	return rc;
+}
+
+static bool kcs_bmc_raw_prepare_obe(struct kcs_bmc_raw *priv)
+{
+	bool writable;
+
+	/* Enable the OBE event so we can catch the host clearing OBF */
+	kcs_bmc_raw_update_event_mask(priv, KCS_BMC_EVENT_TYPE_OBE, KCS_BMC_EVENT_TYPE_OBE);
+
+	/* Now that we'll catch an OBE event, check if it's already occurred */
+	writable = !(kcs_bmc_read_status(priv->client.dev) & KCS_BMC_STR_OBF);
+
+	/* If OBF is clear we've missed the OBE event, so disable it */
+	if (writable)
+		kcs_bmc_raw_update_event_mask(priv, KCS_BMC_EVENT_TYPE_OBE, 0);
+
+	return writable;
+}
+
+static __poll_t kcs_bmc_raw_poll(struct file *filp, poll_table *wait)
+{
+	struct kcs_bmc_raw *priv;
+	__poll_t events = 0;
+
+	priv = file_to_kcs_bmc_raw(filp);
+
+	poll_wait(filp, &priv->queue, wait);
+
+	spin_lock_irq(&priv->queue.lock);
+	if (kcs_bmc_raw_prepare_obe(priv))
+		events |= (EPOLLOUT | EPOLLWRNORM);
+
+	if (priv->readable || (kcs_bmc_read_status(priv->client.dev) & KCS_BMC_STR_IBF))
+		events |= (EPOLLIN | EPOLLRDNORM);
+	spin_unlock_irq(&priv->queue.lock);
+
+	return events;
+}
+
+static ssize_t kcs_bmc_raw_read(struct file *filp, char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	struct kcs_bmc_device *kcs_bmc;
+	struct kcs_bmc_raw *priv;
+	bool read_idr, read_str;
+	struct device *dev;
+	u8 idr, str;
+	ssize_t rc;
+
+	priv = file_to_kcs_bmc_raw(filp);
+	kcs_bmc = priv->client.dev;
+	dev = priv->miscdev.this_device;
+
+	if (!count)
+		return 0;
+
+	if (count > 2 || *ppos > 1)
+		return -EINVAL;
+
+	if (*ppos + count > 2)
+		return -EINVAL;
+
+	read_idr = (*ppos == 0);
+	read_str = (*ppos == 1) || (count == 2);
+
+	spin_lock_irq(&priv->queue.lock);
+	if (read_idr) {
+		dev_dbg(dev, "Waiting for IBF\n");
+		str = kcs_bmc_read_status(kcs_bmc);
+		if ((filp->f_flags & O_NONBLOCK) && (str & KCS_BMC_STR_IBF)) {
+			rc = -EWOULDBLOCK;
+			goto out;
+		}
+
+		rc = wait_event_interruptible_locked(priv->queue,
+						     priv->readable || (str & KCS_BMC_STR_IBF));
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
+		 * Re-enable events prior to possible read of IDR (which clears
+		 * IBF) to ensure we receive interrupts for subsequent writes
+		 * to IDR. Writes to IDR by the host should not occur while IBF
+		 * is set.
+		 */
+		dev_dbg(dev, "Woken by IBF, enabling IRQ\n");
+		kcs_bmc_raw_update_event_mask(priv, KCS_BMC_EVENT_TYPE_IBF,
+					      KCS_BMC_EVENT_TYPE_IBF);
+
+		/* Read data out of IDR into internal storage if necessary */
+		if (!priv->readable) {
+			WARN(!(str & KCS_BMC_STR_IBF), "Unknown reason for wakeup!");
+
+			priv->idr = kcs_bmc_read_data(kcs_bmc);
+		}
+
+		/* Copy data from internal storage to userspace */
+		idr = priv->idr;
+
+		/* We're done consuming the internally stored value */
+		priv->readable = false;
+	}
+
+	if (read_str) {
+		str = kcs_bmc_read_status(kcs_bmc);
+		if (*ppos == 0 || priv->readable)
+			/*
+			 * If we got this far with `*ppos == 0` then we've read
+			 * data out of IDR, so set IBF when reporting back to
+			 * userspace so userspace knows the IDR value is valid.
+			 */
+			str |= KCS_BMC_STR_IBF;
+
+		dev_dbg(dev, "Read status 0x%x\n", str);
+
+	}
+
+	rc = count;
+out:
+	spin_unlock_irq(&priv->queue.lock);
+
+	if (rc < 0)
+		return rc;
+
+	/* Now copy the data in to the userspace buffer */
+
+	if (read_idr)
+		if (copy_to_user(buf++, &idr, sizeof(idr)))
+			return -EFAULT;
+
+	if (read_str)
+		if (copy_to_user(buf, &str, sizeof(str)))
+			return -EFAULT;
+
+	return count;
+}
+
+static ssize_t kcs_bmc_raw_write(struct file *filp, const char __user *buf,
+			      size_t count, loff_t *ppos)
+{
+	struct kcs_bmc_device *kcs_bmc;
+	bool write_odr, write_str;
+	struct kcs_bmc_raw *priv;
+	struct device *dev;
+	ssize_t result;
+	u8 data[2];
+	u8 str;
+
+	priv = file_to_kcs_bmc_raw(filp);
+	kcs_bmc = priv->client.dev;
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
+	write_odr = (*ppos == 0);
+	write_str = (*ppos == 1) || (count == 2);
+
+	spin_lock_irq(&priv->queue.lock);
+
+	/* Always write status before data, we generate the SerIRQ by writing ODR */
+	if (write_str) {
+		/* The index of STR in the userspace buffer depends on whether ODR is written */
+		str = data[*ppos == 0];
+		if (!(str & KCS_BMC_STR_OBF))
+			dev_warn(dev, "Clearing OBF with status write: 0x%x\n", str);
+		dev_dbg(dev, "Writing status 0x%x\n", str);
+		kcs_bmc_write_status(kcs_bmc, str);
+	}
+
+	if (write_odr) {
+		/* If we're writing ODR it's always the first byte in the buffer */
+		u8 odr = data[0];
+
+		str = kcs_bmc_read_status(kcs_bmc);
+		if (str & KCS_BMC_STR_OBF) {
+			if (filp->f_flags & O_NONBLOCK) {
+				result = -EWOULDBLOCK;
+				goto out;
+			}
+
+			priv->writable = kcs_bmc_raw_prepare_obe(priv);
+
+			/* Now either OBF is already clear, or we'll get an OBE event to wake us */
+			dev_dbg(dev, "Waiting for OBF to clear\n");
+			wait_event_interruptible_locked(priv->queue, priv->writable);
+
+			if (signal_pending(current)) {
+				kcs_bmc_raw_update_event_mask(priv, KCS_BMC_EVENT_TYPE_OBE, 0);
+				result = -EINTR;
+				goto out;
+			}
+
+			WARN_ON(kcs_bmc_read_status(kcs_bmc) & KCS_BMC_STR_OBF);
+		}
+
+		dev_dbg(dev, "Writing 0x%x to ODR\n", odr);
+		kcs_bmc_write_data(kcs_bmc, odr);
+	}
+
+	result = count;
+out:
+	spin_unlock_irq(&priv->queue.lock);
+
+	return result;
+}
+
+static int kcs_bmc_raw_release(struct inode *inode, struct file *filp)
+{
+	struct kcs_bmc_raw *priv = file_to_kcs_bmc_raw(filp);
+
+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
+	priv->events = 0;
+
+	return 0;
+}
+
+static const struct file_operations kcs_bmc_raw_fops = {
+	.owner          = THIS_MODULE,
+	.open		= kcs_bmc_raw_open,
+	.llseek		= no_seek_end_llseek,
+	.read           = kcs_bmc_raw_read,
+	.write          = kcs_bmc_raw_write,
+	.poll		= kcs_bmc_raw_poll,
+	.release	= kcs_bmc_raw_release,
+};
+
+static DEFINE_SPINLOCK(kcs_bmc_raw_instances_lock);
+static LIST_HEAD(kcs_bmc_raw_instances);
+
+static int kcs_bmc_raw_add_device(struct kcs_bmc_device *kcs_bmc)
+{
+	struct kcs_bmc_raw *priv;
+	int rc;
+
+	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client.dev = kcs_bmc;
+	priv->client.ops = &kcs_bmc_raw_client_ops;
+
+	init_waitqueue_head(&priv->queue);
+	priv->writable = false;
+	priv->readable = false;
+
+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
+	priv->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u", DEVICE_NAME,
+					   kcs_bmc->channel);
+	if (!priv->miscdev.name)
+		return -EINVAL;
+
+	priv->miscdev.fops = &kcs_bmc_raw_fops;
+
+	/* Disable interrupts until userspace opens the the chardev */
+	kcs_bmc_raw_update_event_mask(priv, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
+
+	rc = misc_register(&priv->miscdev);
+	if (rc) {
+		dev_err(kcs_bmc->dev, "Unable to register device\n");
+		return rc;
+	}
+
+	spin_lock_irq(&kcs_bmc_raw_instances_lock);
+	list_add(&priv->entry, &kcs_bmc_raw_instances);
+	spin_unlock_irq(&kcs_bmc_raw_instances_lock);
+
+	dev_info(kcs_bmc->dev, "Initialised raw client for channel %d", kcs_bmc->channel);
+
+	return 0;
+}
+
+static int kcs_bmc_raw_remove_device(struct kcs_bmc_device *kcs_bmc)
+{
+	struct kcs_bmc_raw *priv = NULL, *pos;
+
+	spin_lock_irq(&kcs_bmc_raw_instances_lock);
+	list_for_each_entry(pos, &kcs_bmc_raw_instances, entry) {
+		if (pos->client.dev == kcs_bmc) {
+			priv = pos;
+			list_del(&pos->entry);
+			break;
+		}
+	}
+	spin_unlock_irq(&kcs_bmc_raw_instances_lock);
+
+	if (!priv)
+		return -ENODEV;
+
+	misc_deregister(&priv->miscdev);
+	kcs_bmc_disable_device(kcs_bmc, &priv->client);
+	devm_kfree(priv->client.dev->dev, priv);
+
+	return 0;
+}
+
+static const struct kcs_bmc_driver_ops kcs_bmc_raw_driver_ops = {
+	.add_device = kcs_bmc_raw_add_device,
+	.remove_device = kcs_bmc_raw_remove_device,
+};
+
+static struct kcs_bmc_driver kcs_bmc_raw_driver = {
+	.ops = &kcs_bmc_raw_driver_ops,
+};
+
+static int kcs_bmc_raw_init(void)
+{
+	kcs_bmc_register_driver(&kcs_bmc_raw_driver);
+
+	return 0;
+}
+module_init(kcs_bmc_raw_init);
+
+static void kcs_bmc_raw_exit(void)
+{
+	kcs_bmc_unregister_driver(&kcs_bmc_raw_driver);
+}
+module_exit(kcs_bmc_raw_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
+MODULE_DESCRIPTION("Character device for raw access to a KCS device");
-- 
2.30.2

