Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AF359566
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 08:25:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGp5m5gX3z30RJ
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 16:25:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=r5/e97xx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iRPBBTcL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=r5/e97xx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iRPBBTcL; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGp5Q24k0z2yhx;
 Fri,  9 Apr 2021 16:24:58 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 17DDA5807E5;
 Fri,  9 Apr 2021 02:24:55 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Apr 2021 02:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=ide85Y6I3nLlU21oZu0+39r8t0oRTPX
 dyMtRCjs0F6c=; b=r5/e97xxS+m0PjTFSn115oBSwosQ53R/yPSVvM97dosczzI
 jiDWqbectoRQ4Ux+yda6QSH4TnKWSXmPoUZuQARGrXIqBgjvz37jWtgvLzTCQTN9
 ePgTMgcGe4B7T5C2TRRcpCWsVYEI9+v8bh3BgR3xtTv6Wy+4kycoR12m2zoP5rWv
 T8QIFaPZtC6L44YNUAFKte2NxdMep0jGoa/Q6rZV8Yu3kzlq8HTYg+0xBuyzekss
 NYLPM5IWm/Fg2e0k4Sy8o3DfTzbXYpWSVdkBxfNiYc+x3XgUD6jnTiAp8AUfs/jZ
 XowBCZ7aR4rYu7e4oD8LLs5XS1KW90HR8pIN1Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ide85Y
 6I3nLlU21oZu0+39r8t0oRTPXdyMtRCjs0F6c=; b=iRPBBTcL6jJtM7O+0Z7lVn
 L2D2YiB3+RQ9NOyzgD5cnir4RxRdNNY7tafnxndKUrxRVTRfWc/Q7zUm5fiSwFEf
 kTyilUmrP5+GXkcZNqoFuUQpaTG/B7tR/JU7OIEwvwTQQSFF+xBrASQyl5/j8n7v
 y9WVHtjTgELCV+YDFzfPp0LEmSHCGm+NFW/kajwjJ3bWZHo2gytU8HUGuwzm8SBc
 Gz5ppWWY2hy+KUG/pffmaH4/guJcIVrr7sgfdps/rJDOlGCtaBjckHg4Zq/VgZnK
 kC36QMw1Gsrz+hGoJjyGI12iUOhBjn7CYaK17NusMFhnaPdbXbsYW34XMvpcc9RQ
 ==
X-ME-Sender: <xms:NvNvYGAub2vG7S0I7_GRYwGGaoaCzBpi00rVV8F8y4NK25beUMF_7Q>
 <xme:NvNvYAgbd-oc45JKQRK1w54KZ2XWJ7NLud_iVlQYOM1dLcMnwPWQSif4Gb6YJOo1s
 DmSuQB8MxMrmzgHjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileet
 tedvtdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:NvNvYJkKwKmYxaNbwOaJI6EHJL2zz2cnw6w45VoNNk4tTeqtfWnJJg>
 <xmx:NvNvYExlOYjUFQrYNAQ7WtSky7Ln2MQZxQzZnlAO-HH8GapEL93_PA>
 <xmx:NvNvYLQtxhfOlU0V0vPWxhdR3hpcuDQd9AQ6xQdNJjFDOHXh1et-vw>
 <xmx:N_NvYMDgMMSNU9PJerYziw94PWOto2Nh-AWZg0k8e8K4IAZleVMRlg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 14E9BA0007F; Fri,  9 Apr 2021 02:24:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <386cc03a-f6d0-45b6-a27b-fc204dedbcac@www.fastmail.com>
In-Reply-To: <YG/ZkanVAypmjCba@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-13-andrew@aj.id.au> <YG/ZkanVAypmjCba@packtop>
Date: Fri, 09 Apr 2021 15:54:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_13/21]_ipmi:_kcs=5Fbmc:_Decouple_the_IPMI_charde?=
 =?UTF-8?Q?v_from_the_core?=
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 9 Apr 2021, at 14:05, Zev Weiss wrote:
> On Fri, Mar 19, 2021 at 01:27:44AM CDT, Andrew Jeffery wrote:
> >Now that we have untangled the data-structures, split the userspace
> >interface out into its own module. Userspace interfaces and drivers are
> >registered to the KCS BMC core to support arbitrary binding of either.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/char/ipmi/Kconfig             | 13 +++++
> > drivers/char/ipmi/Makefile            |  3 +-
> > drivers/char/ipmi/kcs_bmc.c           | 78 ++++++++++++++++++++++++++-
> > drivers/char/ipmi/kcs_bmc.h           |  4 --
> > drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 33 +++++++++---
> > drivers/char/ipmi/kcs_bmc_client.h    | 14 +++++
> > 6 files changed, 132 insertions(+), 13 deletions(-)
> >
> >diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
> >index 07847d9a459a..bc5f81899b62 100644
> >--- a/drivers/char/ipmi/Kconfig
> >+++ b/drivers/char/ipmi/Kconfig
> >@@ -124,6 +124,19 @@ config NPCM7XX_KCS_IPMI_BMC
> > 	  This support is also available as a module.  If so, the module
> > 	  will be called kcs_bmc_npcm7xx.
> >
> >+config IPMI_KCS_BMC_CDEV_IPMI
> >+	depends on IPMI_KCS_BMC
> >+	tristate "IPMI character device interface for BMC KCS devices"
> >+	help
> >+	  Provides a BMC-side character device implementing IPMI
> >+	  semantics for KCS IPMI devices.
> >+
> >+	  Say YES if you wish to expose KCS devices on the BMC for IPMI
> >+	  purposes.
> >+
> >+	  This support is also available as a module. The module will be
> >+	  called kcs_bmc_cdev_ipmi.
> >+
> > config ASPEED_BT_IPMI_BMC
> > 	depends on ARCH_ASPEED || COMPILE_TEST
> > 	depends on REGMAP && REGMAP_MMIO && MFD_SYSCON
> >diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
> >index a302bc865370..fcfa676afddb 100644
> >--- a/drivers/char/ipmi/Makefile
> >+++ b/drivers/char/ipmi/Makefile
> >@@ -22,7 +22,8 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
> > obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
> > obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
> > obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
> >-obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o kcs_bmc_cdev_ipmi.o
> >+obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
> >+obj-$(CONFIG_IPMI_KCS_BMC_CDEV_IPMI) += kcs_bmc_cdev_ipmi.o
> > obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
> > obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
> > obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
> >diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> >index 266ebec71d6f..694db6ee2a92 100644
> >--- a/drivers/char/ipmi/kcs_bmc.c
> >+++ b/drivers/char/ipmi/kcs_bmc.c
> >@@ -5,7 +5,9 @@
> >  */
> >
> > #include <linux/device.h>
> >+#include <linux/list.h>
> > #include <linux/module.h>
> >+#include <linux/mutex.h>
> >
> > #include "kcs_bmc.h"
> >
> >@@ -13,6 +15,11 @@
> > #include "kcs_bmc_device.h"
> > #include "kcs_bmc_client.h"
> >
> >+/* Record probed devices and cdevs */
> >+static DEFINE_MUTEX(kcs_bmc_lock);
> >+static LIST_HEAD(kcs_bmc_devices);
> >+static LIST_HEAD(kcs_bmc_cdevs);
> >+
> > /* Consumer data access */
> >
> > u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
> >@@ -100,16 +107,83 @@ EXPORT_SYMBOL(kcs_bmc_disable_device);
> >
> > int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
> > {
> >-	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
> >+	struct kcs_bmc_cdev *cdev;
> >+	int rc;
> >+
> >+	spin_lock_init(&kcs_bmc->lock);
> >+	kcs_bmc->client = NULL;
> >+
> >+	mutex_lock(&kcs_bmc_lock);
> >+	list_add(&kcs_bmc->entry, &kcs_bmc_devices);
> >+	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
> >+		rc = cdev->ops->add_device(kcs_bmc);
> >+		if (rc)
> >+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
> >+				kcs_bmc->channel, rc);
> >+	}
> >+	mutex_unlock(&kcs_bmc_lock);
> >+
> >+	return 0;
> 
> We're ignoring failed ->add_device() calls here?

Yep. If one chardev module is failing to accept new devices we don't 
want to not add them to the remaining chardev modules.

What would the caller do with a error return value? Maybe it should 
just be void.

> 
> > }
> > EXPORT_SYMBOL(kcs_bmc_add_device);
> >
> > int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
> > {
> >-	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
> >+	struct kcs_bmc_cdev *cdev;
> >+	int rc;
> >+
> >+	mutex_lock(&kcs_bmc_lock);
> >+	list_del(&kcs_bmc->entry);
> >+	list_for_each_entry(cdev, &kcs_bmc_cdevs, entry) {
> >+		rc = cdev->ops->remove_device(kcs_bmc);
> >+		if (rc)
> >+			dev_err(kcs_bmc->dev, "Failed to remove chardev for KCS channel %d: %d",
> >+				kcs_bmc->channel, rc);
> >+	}
> >+	mutex_unlock(&kcs_bmc_lock);
> >+
> >+	return 0;
> 
> Similarly with the return value here...

As above.

> 
> > }
> > EXPORT_SYMBOL(kcs_bmc_remove_device);
> >
> >+int kcs_bmc_register_cdev(struct kcs_bmc_cdev *cdev)
> >+{
> >+	struct kcs_bmc_device *kcs_bmc;
> >+	int rc;
> >+
> >+	mutex_lock(&kcs_bmc_lock);
> >+	list_add(&cdev->entry, &kcs_bmc_cdevs);
> >+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
> >+		rc = cdev->ops->add_device(kcs_bmc);
> >+		if (rc)
> >+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
> >+				kcs_bmc->channel, rc);
> >+	}
> >+	mutex_unlock(&kcs_bmc_lock);
> >+
> >+	return 0;
> 
> ...return value again here...

As above.

> 
> >+}
> >+EXPORT_SYMBOL(kcs_bmc_register_cdev);
> >+
> >+int kcs_bmc_unregister_cdev(struct kcs_bmc_cdev *cdev)
> >+{
> >+	struct kcs_bmc_device *kcs_bmc;
> >+	int rc;
> >+
> >+	mutex_lock(&kcs_bmc_lock);
> >+	list_del(&cdev->entry);
> >+	list_for_each_entry(kcs_bmc, &kcs_bmc_devices, entry) {
> >+		rc = cdev->ops->remove_device(kcs_bmc);
> >+		if (rc)
> >+			dev_err(kcs_bmc->dev, "Failed to add chardev for KCS channel %d: %d",
> 
> s/add/remove/

Thanks.

> 
> Might also want to differentiate the *_device() error messages from the
> *_cdev() ones a bit more?

I'll look into it.

> 
> >+				kcs_bmc->channel, rc);
> >+	}
> >+	mutex_unlock(&kcs_bmc_lock);
> >+
> >+	return rc;
> 
> ...but this one is a bit incongruous, propagating the return value of
> only the last ->remove_device() call.

Hah. good catch.

Andrew
