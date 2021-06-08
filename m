Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684739EADB
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 02:37:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzWYG3VMTz3061
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 10:37:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=QSG4Mf75;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GKrgIZP3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=QSG4Mf75; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=GKrgIZP3; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzWXp55jLz2xvH;
 Tue,  8 Jun 2021 10:37:30 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7906B5804E0;
 Mon,  7 Jun 2021 20:37:26 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 20:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=yBCq6nwjdfe7dMAcZu21nIyfwfagBbY
 E5SfivjE0NBU=; b=QSG4Mf75bxuMOTWUpZLd9hfuWWOhffwrvIJdl565GGjCbHp
 FsU/7cSnExk40ZcBxkU4a9XkPl0iKlEToNVoHVXqwocPPeb4J2z/V4mePE6K915l
 pMDyg1rdAf6f2Gp/cne8qGMnf11FKyvOngVN9xB/8MZsA/X+ONPJT2G7Om+EnClz
 jDLcHbY9z/eYW47SNeudU3KIPsrHWjHkmxJuAFl0vrwJHmVcgQbV2dMr4f08IpRz
 Mf9n/fbCsLGUC7K5Z9FaGDcAEpMOei6t3Mo/a4SrMefdV1QZnQ2IMGvhNp0MdA0H
 9wdtpsOJ6VhgnsBYYluf/3ajcunepAc68MfqOJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yBCq6n
 wjdfe7dMAcZu21nIyfwfagBbYE5SfivjE0NBU=; b=GKrgIZP3/n9Xx79RGsKT1O
 VGQqsMJlMsaYa05QKQjaSamCw1Qcsq5VsqpAuqzoc9bbrVO3IyuUj3bQR8vxzriI
 1CtRfjisuZ9kQN1eqcbwPWdm7sWd78RC9eSa6p86ZhHNZiOxzgUw+YAh7zBySiWp
 d2egvck1aaDulnz8IDLxXbSWae+Kp9KVtDSMH0pMnFzMUOafeSQ3Z9JqSWDUd3CI
 nUMc6IS1McTHctyxaOquHrq5yrlChOR1mibAZFLZeMNjaekwY2V/TrQ5Tkeb6Na4
 bxS6geXmDrFeE7/m5+DW4tBKjazd6FeBXFHHGw7b6/V9dDv3w1SXGOvmNmowayZQ
 ==
X-ME-Sender: <xms:xLu-YBopTqB2dHRusQmnc8xMm339jxIG5CGsr0RNHSTc8vFFZKnKZg>
 <xme:xLu-YDr4IjKNVs8Jojt5CbuO-cmePj0V7YnUjXwnhEn23hGBuv4llzhohHv1OP1CP
 7hDRnhjxuQq_7K82w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:xbu-YOMkwNwc0C9j_2CKSsL2gtGPLkPlg3RxFQ25C-9uXyy9vFEb5w>
 <xmx:xbu-YM4SG7_n6L9M0g36gv1G2hhqsAplYKawS_XdFDI2DmbtQlDaNw>
 <xmx:xbu-YA7al-d1FCGZoyUpWS-4VJlLiOKyqrvsv4fg7Tj_UwdxmO7RjQ>
 <xmx:xru-YLK4_1AZSuHhbJYGcOqzqkiPLPBPQwHt3OmPim1BWdG1lTMWXw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EE4F0AC0062; Mon,  7 Jun 2021 20:37:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <15bfe16d-a9a1-464b-bb23-c59ac91b41a8@www.fastmail.com>
In-Reply-To: <YKdfP6br29Te0VZ6@packtop>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-12-andrew@aj.id.au> <YKdfP6br29Te0VZ6@packtop>
Date: Tue, 08 Jun 2021 10:07:03 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>
Subject: Re: [PATCH v3 11/16] ipmi: kcs_bmc: Add serio adaptor
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Corey Minyard <minyard@acm.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Benjamin Fair <benjaminfair@google.com>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 21 May 2021, at 16:50, Zev Weiss wrote:
> On Mon, May 10, 2021 at 12:42:08AM CDT, Andrew Jeffery wrote:
> >kcs_bmc_serio acts as a bridge between the KCS drivers in the IPMI
> >subsystem and the existing userspace interfaces available through the
> >serio subsystem. This is useful when userspace would like to make use of
> >the BMC KCS devices for purposes that aren't IPMI.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/char/ipmi/Kconfig         |  14 +++
> > drivers/char/ipmi/Makefile        |   1 +
> > drivers/char/ipmi/kcs_bmc_serio.c | 151 ++++++++++++++++++++++++++++++
> > 3 files changed, 166 insertions(+)
> > create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c
> >
> >diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> >index bc5f81899b62..249b31197eea 100644
> >--- a/drivers/char/ipmi/Kconfig
> >+++ b/drivers/char/ipmi/Kconfig
> >@@ -137,6 +137,20 @@ config IPMI_KCS_BMC_CDEV_IPMI
> > 	  This support is also available as a module. The module will be
> > 	  called kcs_bmc_cdev_ipmi.
> >
> >+config IPMI_KCS_BMC_SERIO
> >+	depends on IPMI_KCS_BMC && SERIO
> >+	tristate "SerIO adaptor for BMC KCS devices"
> >+	help
> >+	  Adapts the BMC KCS device for the SerIO subsystem. This allows users
> >+	  to take advantage of userspace interfaces provided by SerIO where
> >+	  appropriate.
> >+
> >+	  Say YES if you wish to expose KCS devices on the BMC via SerIO
> >+	  interfaces.
> >+
> >+	  This support is also available as a module. The module will be
> >+	  called kcs_bmc_serio.
> >+
> > config ASPEED_BT_IPMI_BMC
> > 	depends on ARCH_ASPEED || COMPILE_TEST
> > 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> >diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> >index fcfa676afddb..84f47d18007f 100644
> >--- a/drivers/char/ipmi/Makefile
> >+++ b/drivers/char/ipmi/Makefile
> >@@ -23,6 +23,7 @@ obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
> > obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
> > obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
> > obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
> >+obj-$(CONFIG_IPMI_KCS_BMC_SERIO) += kcs_bmc_serio.o
> > obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
> > obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> > obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
> >diff --git a/drivers/char/ipmi/kcs_bmc_serio.c b/drivers/char/ipmi/kcs_bmc_serio.c
> >new file mode 100644
> >index 000000000000..30a2b7ab464b
> >--- /dev/null
> >+++ b/drivers/char/ipmi/kcs_bmc_serio.c
> >@@ -0,0 +1,151 @@
> >+// SPDX-License-Identifier: GPL-2.0-or-later
> >+/* Copyright (c) 2021 IBM Corp. */
> >+
> >+#include <linux/delay.h>
> >+#include <linux/device.h>
> >+#include <linux/errno.h>
> >+#include <linux/list.h>
> >+#include <linux/module.h>
> >+#include <linux/sched/signal.h>
> >+#include <linux/serio.h>
> >+#include <linux/slab.h>
> >+
> >+#include "kcs_bmc_client.h"
> >+
> >+struct kcs_bmc_serio {
> >+	struct list_head entry;
> >+
> >+	struct kcs_bmc_client client;
> >+	struct serio *port;
> >+
> >+	spinlock_t lock;
> >+};
> >+
> >+static inline struct kcs_bmc_serio *client_to_kcs_bmc_serio(struct kcs_bmc_client *client)
> >+{
> >+	return container_of(client, struct kcs_bmc_serio, client);
> >+}
> >+
> >+static irqreturn_t kcs_bmc_serio_event(struct kcs_bmc_client *client)
> >+{
> >+	struct kcs_bmc_serio *priv;
> >+	u8 handled = IRQ_NONE;
> >+	u8 status;
> >+
> >+	priv = client_to_kcs_bmc_serio(client);
> >+
> >+	spin_lock(&priv->lock);
> >+
> >+	status = kcs_bmc_read_status(client->dev);
> >+
> >+	if (status & KCS_BMC_STR_IBF)
> >+		handled = serio_interrupt(priv->port, kcs_bmc_read_data(client->dev), 0);
> >+
> >+	spin_unlock(&priv->lock);
> >+
> >+	return handled;
> >+}
> >+
> >+static const struct kcs_bmc_client_ops kcs_bmc_serio_client_ops = {
> >+	.event = kcs_bmc_serio_event,
> >+};
> >+
> >+static int kcs_bmc_serio_open(struct serio *port)
> >+{
> >+	struct kcs_bmc_serio *priv = port->port_data;
> >+
> >+	return kcs_bmc_enable_device(priv->client.dev, &priv->client);
> >+}
> >+
> >+static void kcs_bmc_serio_close(struct serio *port)
> >+{
> >+	struct kcs_bmc_serio *priv = port->port_data;
> >+
> >+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
> >+}
> >+
> >+static DEFINE_SPINLOCK(kcs_bmc_serio_instances_lock);
> >+static LIST_HEAD(kcs_bmc_serio_instances);
> >+
> >+static int kcs_bmc_serio_add_device(struct kcs_bmc_device *kcs_bmc)
> >+{
> >+	struct kcs_bmc_serio *priv;
> >+	struct serio *port;
> >+
> >+	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
> >+	port = kzalloc(sizeof(*port), GFP_KERNEL);
> 
> Is there a particular reason to allocate port with a raw kzalloc()
> instead of another devm_kzalloc()?

Yes, because it causes pointer confusion on remove. We get the following backtrace:

[   95.018845] Backtrace: 
[   95.019162] [<802e1fb0>] (___cache_free) from [<802e31cc>] (kfree+0xc0/0x1e8)
[   95.019658]  r10:00000081 r9:8667c000 r8:80100284 r7:81000b40 r6:a0000013 r5:80640bd4
[   95.020032]  r4:82a5ec40
[   95.020206] [<802e310c>] (kfree) from [<80640bd4>] (serio_release_port+0x1c/0x28)
[   95.020571]  r7:00000000 r6:819c1540 r5:86acf480 r4:82a5ed70
[   95.020818] [<80640bb8>] (serio_release_port) from [<80565e00>] (device_release+0x40/0xb4)
[   95.021387] [<80565dc0>] (device_release) from [<804a0bcc>] (kobject_put+0xc8/0x210)
[   95.021961]  r5:80c77c30 r4:82a5ed70
[   95.022141] [<804a0b04>] (kobject_put) from [<80566078>] (put_device+0x20/0x24)
[   95.022537]  r7:80c820cc r6:82a5ec40 r5:80c820e4 r4:82a5ed70
[   95.023017] [<80566058>] (put_device) from [<80640a58>] (serio_destroy_port+0x12c/0x140)
[   95.023719] [<8064092c>] (serio_destroy_port) from [<80640b3c>] (serio_unregister_port+0x34/0x44)
[   95.024326]  r7:7f0012b4 r6:7f002024 r5:80c820e4 r4:82a5ec40
[   95.024792] [<80640b08>] (serio_unregister_port) from [<7f0100b8>] (kcs_bmc_serio_remove_device+0x90/0xbc [kcs_bmc_serio])
[   95.026951]  r5:8668b7c0 r4:86acf0c0
[   95.027390] [<7f010028>] (kcs_bmc_serio_remove_device [kcs_bmc_serio]) from [<7f00048c>] (kcs_bmc_unregister_driver+0x60/0xbd4 [kcs_bmc])
[   95.028443]  r5:7f012018 r4:8668b7c0
[   95.028634] [<7f00042c>] (kcs_bmc_unregister_driver [kcs_bmc]) from [<7f0102c4>] (kcs_bmc_serio_exit+0x1c/0xd58 [kcs_bmc_serio])
[   95.029165]  r7:00000081 r6:80cd0dac r5:00000000 r4:7f012040
[   95.029397] [<7f0102a8>] (kcs_bmc_serio_exit [kcs_bmc_serio]) from [<801cbab0>] (sys_delete_module+0x140/0x280)
[   95.029875] [<801cb970>] (sys_delete_module) from [<80100080>] (ret_fast_syscall+0x0/0x58)

> 
> >+	if (!(priv && port))
> >+		return -ENOMEM;
> >+
> >+	port->id.type = SERIO_8042;
> >+	port->open = kcs_bmc_serio_open;
> >+	port->close = kcs_bmc_serio_close;
> >+	port->port_data = priv;
> >+	port->dev.parent = kcs_bmc->dev;
> >+
> >+	spin_lock_init(&priv->lock);
> >+	priv->port = port;
> >+	priv->client.dev = kcs_bmc;
> >+	priv->client.ops = &kcs_bmc_serio_client_ops;
> >+
> >+	spin_lock_irq(&kcs_bmc_serio_instances_lock);
> >+	list_add(&priv->entry, &kcs_bmc_serio_instances);
> >+	spin_unlock_irq(&kcs_bmc_serio_instances_lock);
> >+
> >+	serio_register_port(port);
> >+
> >+	dev_info(kcs_bmc->dev, "Initialised serio client for channel %d", kcs_bmc->channel);
> >+
> >+	return 0;
> >+}
> >+
> >+static int kcs_bmc_serio_remove_device(struct kcs_bmc_device *kcs_bmc)
> >+{
> >+	struct kcs_bmc_serio *priv = NULL, *pos;
> >+
> >+	spin_lock_irq(&kcs_bmc_serio_instances_lock);
> >+	list_for_each_entry(pos, &kcs_bmc_serio_instances, entry) {
> >+		if (pos->client.dev == kcs_bmc) {
> >+			priv = pos;
> >+			list_del(&pos->entry);
> >+			break;
> >+		}
> >+	}
> >+	spin_unlock_irq(&kcs_bmc_serio_instances_lock);
> >+
> >+	if (!priv)
> >+		return -ENODEV;
> >+
> >+	serio_unregister_port(priv->port);
> >+	kcs_bmc_disable_device(kcs_bmc, &priv->client);
> >+	devm_kfree(priv->client.dev->dev, priv);
> 
> Looks like the priv->port allocation would leak here I think?

No, because port's released through serio_unregister_port(). It's not super obvious though, so I'll add a comment next to the kzalloc().

> 
> Also, is the asymmetry of having kcs_bmc_disable_device() here but no
> corresponding kcs_bmc_enable_device() in kcs_bmc_serio_add_device()
> intentional?  If so, an explanatory comment of some sort might be nice
> to add.

It's intentional to make sure the device isn't left registered as enabled in the core. kcs_bmc_enable_device() is called in the open() path.

Andrew
