Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC378359542
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 08:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGnvm54Z5z3bqW
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 16:16:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=a+JQPe5K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=CUhWvCob;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=a+JQPe5K; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CUhWvCob; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGnvQ6VlQz302Z;
 Fri,  9 Apr 2021 16:16:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1AC31580682;
 Fri,  9 Apr 2021 02:16:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Apr 2021 02:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=91UgGlQQqzAH2BOCz6I89spQ7+9C6FS
 pmtUpcXGTo2M=; b=a+JQPe5KDwtUeEf97AGfD+EEzgyIAyb+zo6TYyfA2MMg+A/
 cVTV2etRe2fnxo+hpsNXVbF4LsbXxFS1zgyLCwPYPkWGbfkpX4XUTW3fZM/3QlW1
 bd+LY32DnY+5iErC5nSmUGxHTSkFydRdEgvqTWNx/gMdXdpPFBQ6+/5BFfhBgzVY
 s57YOgtZrG8p5ctig8bT14zcGufbKBwuC1C5ua+WEyTE9pAeprUorHqLurx0MsFl
 TCputTD43SV6f7CX3mldV9Fjg9LfBqhcMmxGaZk058cqNDjPtMUnzauQ4M34J3Tp
 yHsdtkQ33D5xRNfwo/6UnoLqieU01syAX1E+KMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=91UgGl
 QQqzAH2BOCz6I89spQ7+9C6FSpmtUpcXGTo2M=; b=CUhWvCobSTNfQemY+Mguvs
 Y7yhukHpvoSLaqU+sVrpJzeaewDRNNcJrsdENq6jPjA41nNynvxaAfAR9uXHQ5lt
 EKS66Cij6akKi3+nWzDPO56ri3yZL9llVq96I88mQQUPSevGS11pM5KX3uADqpJA
 aeAXh/M0KTns9VPAJbWlQGpGrLnwYE45Ch3xmEa+anBNERAtJShJXiywpBAxICOh
 GvSgbI6sgr3F2RXE7Q/v2+Nz9FPJ0BAcR9/xdT4kYU9u13chSgLFIqnjAbSo1v/L
 vTLcDaBZXr2N5cqCSNDwrrUkScxyVAVI9x8/58rCUYHsSV9IqkVSevaW9dKX416w
 ==
X-ME-Sender: <xms:L_FvYKD_W7QfRCte3DfRnBSb6ZJRQN9aLS2bmtEFL6_4M7mjM_MTXQ>
 <xme:L_FvYEizSyLafnc6KXvo2KoOpXnvtdN5EUV4Yi-V4WovggUyMj37qoNn37LGraFAR
 CCdMGOLx7jM6yRAbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileet
 tedvtdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:L_FvYNldDku6pfHTH514h3O9pgRAVU8SiVXdiP3IoVb_uD3JaRaaOg>
 <xmx:L_FvYIxXXtRVLeKLHpPjShWVxBGIPEzjKhESs90c-D97blOOHqwbmA>
 <xmx:L_FvYPTSJoiVvTyoPQYQ6KAxchMw-RN7f0zV_55QgUwbD8dxLwDgCA>
 <xmx:MPFvYACskzSNhlhfTC9hj2do4SsaelQj_YJ7qNEvZ7cawKAmwIDZYw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 18020A0007C; Fri,  9 Apr 2021 02:16:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <c96c9a2f-6c9c-4dd3-ba20-13e7f76aec37@www.fastmail.com>
In-Reply-To: <YG/S8UdjT8TH6cqs@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-12-andrew@aj.id.au> <YG/S8UdjT8TH6cqs@packtop>
Date: Fri, 09 Apr 2021 15:45:29 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_12/21]_ipmi:_kcs=5Fbmc:_Strip_private_client_dat?=
 =?UTF-8?Q?a_from_struct_kcs=5Fbmc?=
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



On Fri, 9 Apr 2021, at 13:37, Zev Weiss wrote:
> On Fri, Mar 19, 2021 at 01:27:43AM CDT, Andrew Jeffery wrote:
> >Move all client-private data out of `struct kcs_bmc` into the KCS client
> >implementation.
> >
> >With this change the KCS BMC core code now only concerns itself with
> >abstract `struct kcs_bmc` and `struct kcs_bmc_client` types, achieving
> >expected separation of concerns. Further, the change clears the path for
> >implementation of alternative userspace interfaces.
> >
> >The chardev data-structures are rearranged in the same manner applied to
> >the KCS device driver data-structures in an earlier patch - `struct
> >kcs_bmc_client` is embedded in the client's private data and we exploit
> >container_of() to translate as required.
> >
> >Finally, now that it is free of client data, `struct kcs_bmc` is renamed
> >to `struct kcs_bmc_device` to contrast `struct kcs_bmc_client`.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/char/ipmi/kcs_bmc.c           |  68 +++-
> > drivers/char/ipmi/kcs_bmc.h           |  86 +-----
> > drivers/char/ipmi/kcs_bmc_aspeed.c    |  22 +-
> > drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 428 ++++++++++++++++----------
> > drivers/char/ipmi/kcs_bmc_client.h    |  28 +-
> > drivers/char/ipmi/kcs_bmc_device.h    |  12 +-
> > drivers/char/ipmi/kcs_bmc_npcm7xx.c   |  20 +-
> > 7 files changed, 368 insertions(+), 296 deletions(-)
> >
> >diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> >index 1046ce2bbefc..266ebec71d6f 100644
> >--- a/drivers/char/ipmi/kcs_bmc.c
> >+++ b/drivers/char/ipmi/kcs_bmc.c
> >@@ -4,6 +4,7 @@
> >  * Copyright (c) 2021, IBM Corp.
> >  */
> >
> >+#include <linux/device.h>
> > #include <linux/module.h>
> >
> > #include "kcs_bmc.h"
> >@@ -14,51 +15,96 @@
> >
> > /* Consumer data access */
> >
> >-u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
> >+u8 kcs_bmc_read_data(struct kcs_bmc_device *kcs_bmc)
> > {
> > 	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
> > }
> > EXPORT_SYMBOL(kcs_bmc_read_data);
> >
> >-void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
> >+void kcs_bmc_write_data(struct kcs_bmc_device *kcs_bmc, u8 data)
> > {
> > 	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
> > }
> > EXPORT_SYMBOL(kcs_bmc_write_data);
> >
> >-u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
> >+u8 kcs_bmc_read_status(struct kcs_bmc_device *kcs_bmc)
> > {
> > 	return kcs_bmc->ops->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
> > }
> > EXPORT_SYMBOL(kcs_bmc_read_status);
> >
> >-void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
> >+void kcs_bmc_write_status(struct kcs_bmc_device *kcs_bmc, u8 data)
> > {
> > 	kcs_bmc->ops->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
> > }
> > EXPORT_SYMBOL(kcs_bmc_write_status);
> >
> >-void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
> >+void kcs_bmc_update_status(struct kcs_bmc_device *kcs_bmc, u8 mask, u8 val)
> > {
> > 	kcs_bmc->ops->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
> > }
> > EXPORT_SYMBOL(kcs_bmc_update_status);
> >
> >-int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> >+int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
> > {
> >-	return kcs_bmc->client.ops->event(&kcs_bmc->client);
> >+	struct kcs_bmc_client *client;
> >+	int rc;
> >+
> >+	spin_lock(&kcs_bmc->lock);
> >+	client = kcs_bmc->client;
> >+	if (client) {
> >+		rc = client->ops->event(client);
> >+	} else {
> >+		u8 status;
> >+
> >+		status = kcs_bmc_read_status(kcs_bmc);
> >+		if (status & KCS_BMC_STR_IBF) {
> >+			/* Ack the event by reading the data */
> >+			kcs_bmc_read_data(kcs_bmc);
> >+			rc = KCS_BMC_EVENT_HANDLED;
> >+		} else {
> >+			rc = KCS_BMC_EVENT_NONE;
> >+		}
> >+	}
> >+	spin_unlock(&kcs_bmc->lock);
> >+
> >+	return rc;
> > }
> > EXPORT_SYMBOL(kcs_bmc_handle_event);
> >
> >-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
> >-int kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
> >+int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
> >+{
> >+	int rc;
> >+
> >+	spin_lock_irq(&kcs_bmc->lock);
> >+	if (kcs_bmc->client) {
> >+		rc = -EBUSY;
> >+	} else {
> >+		kcs_bmc->client = client;
> >+		rc = 0;
> >+	}
> >+	spin_unlock_irq(&kcs_bmc->lock);
> >+
> >+	return rc;
> >+}
> >+EXPORT_SYMBOL(kcs_bmc_enable_device);
> >+
> >+void kcs_bmc_disable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
> >+{
> >+	spin_lock_irq(&kcs_bmc->lock);
> >+	if (client == kcs_bmc->client)
> >+		kcs_bmc->client = NULL;
> 
> Is there any situation in which a non-matching client could be passed in
> here?

Yes; this allows the chardev modules to just unconditionally call 
kcs_bmc_disable_device() without having to duplicate the state tracking 
done here.

>  Might we consider issuing a warning of some sort or returning an
> error to the caller if so?

No, see above.

> 
> >+	spin_unlock_irq(&kcs_bmc->lock);
> >+}
> >+EXPORT_SYMBOL(kcs_bmc_disable_device);
> >+
> >+int kcs_bmc_add_device(struct kcs_bmc_device *kcs_bmc)
> > {
> > 	return kcs_bmc_ipmi_attach_cdev(kcs_bmc);
> > }
> > EXPORT_SYMBOL(kcs_bmc_add_device);
> >
> >-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
> >-int kcs_bmc_remove_device(struct kcs_bmc *kcs_bmc)
> >+int kcs_bmc_remove_device(struct kcs_bmc_device *kcs_bmc)
> > {
> > 	return kcs_bmc_ipmi_detach_cdev(kcs_bmc);
> > }
> >diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
> >index a1350e567723..3f266740c759 100644
> >--- a/drivers/char/ipmi/kcs_bmc.h
> >+++ b/drivers/char/ipmi/kcs_bmc.h
> >@@ -6,9 +6,7 @@
> > #ifndef __KCS_BMC_H__
> > #define __KCS_BMC_H__
> >
> >-#include <linux/miscdevice.h>
> >-
> >-#include "kcs_bmc_client.h"
> >+#include <linux/list.h>
> >
> > #define KCS_BMC_EVENT_NONE	0
> > #define KCS_BMC_EVENT_HANDLED	1
> >@@ -17,53 +15,6 @@
> > #define KCS_BMC_STR_IBF		BIT(1)
> > #define KCS_BMC_STR_CMD_DAT	BIT(3)
> >
> >-/* Different phases of the KCS BMC module.
> >- *  KCS_PHASE_IDLE:
> >- *            BMC should not be expecting nor sending any data.
> >- *  KCS_PHASE_WRITE_START:
> >- *            BMC is receiving a WRITE_START command from system software.
> >- *  KCS_PHASE_WRITE_DATA:
> >- *            BMC is receiving a data byte from system software.
> >- *  KCS_PHASE_WRITE_END_CMD:
> >- *            BMC is waiting a last data byte from system software.
> >- *  KCS_PHASE_WRITE_DONE:
> >- *            BMC has received the whole request from system software.
> >- *  KCS_PHASE_WAIT_READ:
> >- *            BMC is waiting the response from the upper IPMI service.
> >- *  KCS_PHASE_READ:
> >- *            BMC is transferring the response to system software.
> >- *  KCS_PHASE_ABORT_ERROR1:
> >- *            BMC is waiting error status request from system software.
> >- *  KCS_PHASE_ABORT_ERROR2:
> >- *            BMC is waiting for idle status afer error from system software.
> >- *  KCS_PHASE_ERROR:
> >- *            BMC has detected a protocol violation at the interface level.
> >- */
> >-enum kcs_phases {
> >-	KCS_PHASE_IDLE,
> >-
> >-	KCS_PHASE_WRITE_START,
> >-	KCS_PHASE_WRITE_DATA,
> >-	KCS_PHASE_WRITE_END_CMD,
> >-	KCS_PHASE_WRITE_DONE,
> >-
> >-	KCS_PHASE_WAIT_READ,
> >-	KCS_PHASE_READ,
> >-
> >-	KCS_PHASE_ABORT_ERROR1,
> >-	KCS_PHASE_ABORT_ERROR2,
> >-	KCS_PHASE_ERROR
> >-};
> >-
> >-/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
> >-enum kcs_errors {
> >-	KCS_NO_ERROR                = 0x00,
> >-	KCS_ABORTED_BY_COMMAND      = 0x01,
> >-	KCS_ILLEGAL_CONTROL_CODE    = 0x02,
> >-	KCS_LENGTH_ERROR            = 0x06,
> >-	KCS_UNSPECIFIED_ERROR       = 0xFF
> >-};
> >-
> > /* IPMI 2.0 - 9.5, KCS Interface Registers
> >  * @idr: Input Data Register
> >  * @odr: Output Data Register
> >@@ -76,36 +27,23 @@ struct kcs_ioreg {
> > };
> >
> > struct kcs_bmc_device_ops;
> >+struct kcs_bmc_client;
> >+
> >+struct kcs_bmc_device {
> >+	struct list_head entry;
> >
> >-struct kcs_bmc {
> > 	struct device *dev;
> >-
> >-	const struct kcs_bmc_device_ops *ops;
> >-
> >-	struct kcs_bmc_client client;
> >-
> >-	spinlock_t lock;
> >-
> > 	u32 channel;
> >-	int running;
> >
> > 	struct kcs_ioreg ioreg;
> >
> >-	enum kcs_phases phase;
> >-	enum kcs_errors error;
> >+	const struct kcs_bmc_device_ops *ops;
> >
> >-	wait_queue_head_t queue;
> >-	bool data_in_avail;
> >-	int  data_in_idx;
> >-	u8  *data_in;
> >-
> >-	int  data_out_idx;
> >-	int  data_out_len;
> >-	u8  *data_out;
> >-
> >-	struct mutex mutex;
> >-	u8 *kbuffer;
> >-
> >-	struct miscdevice miscdev;
> >+	spinlock_t lock;
> >+	struct kcs_bmc_client *client;
> > };
> >+
> >+/* Temporary exports while refactoring */
> >+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
> >+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
> > #endif /* __KCS_BMC_H__ */
> >diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> >index 1b313355b1c8..6f26e7366c0b 100644
> >--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> >+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> >@@ -61,7 +61,7 @@
> > #define LPC_STR4             0x11C
> >
> > struct aspeed_kcs_bmc {
> >-	struct kcs_bmc kcs_bmc;
> >+	struct kcs_bmc_device kcs_bmc;
> >
> > 	struct regmap *map;
> > };
> >@@ -71,12 +71,12 @@ struct aspeed_kcs_of_ops {
> > 	int (*get_io_address)(struct platform_device *pdev);
> > };
> >
> >-static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc *kcs_bmc)
> >+static inline struct aspeed_kcs_bmc *to_aspeed_kcs_bmc(struct kcs_bmc_device *kcs_bmc)
> > {
> > 	return container_of(kcs_bmc, struct aspeed_kcs_bmc, kcs_bmc);
> > }
> >
> >-static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> >+static u8 aspeed_kcs_inb(struct kcs_bmc_device *kcs_bmc, u32 reg)
> > {
> > 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> > 	u32 val = 0;
> >@@ -88,7 +88,7 @@ static u8 aspeed_kcs_inb(struct kcs_bmc *kcs_bmc, u32 reg)
> > 	return rc == 0 ? (u8) val : 0;
> > }
> >
> >-static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
> >+static void aspeed_kcs_outb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 data)
> > {
> > 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> > 	int rc;
> >@@ -97,7 +97,7 @@ static void aspeed_kcs_outb(struct kcs_bmc *kcs_bmc, u32 reg, u8 data)
> > 	WARN(rc != 0, "regmap_write() failed: %d\n", rc);
> > }
> >
> >-static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val)
> >+static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask, u8 val)
> > {
> > 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> > 	int rc;
> >@@ -119,7 +119,7 @@ static void aspeed_kcs_updateb(struct kcs_bmc *kcs_bmc, u32 reg, u8 mask, u8 val
> >  *     C. KCS4
> >  *        D / C : CA4h / CA5h
> >  */
> >-static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
> >+static void aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u16 addr)
> > {
> > 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> >
> >@@ -153,7 +153,7 @@ static void aspeed_kcs_set_address(struct kcs_bmc *kcs_bmc, u16 addr)
> > 	}
> > }
> >
> >-static void aspeed_kcs_enable_channel(struct kcs_bmc *kcs_bmc, bool enable)
> >+static void aspeed_kcs_enable_channel(struct kcs_bmc_device *kcs_bmc, bool enable)
> > {
> > 	struct aspeed_kcs_bmc *priv = to_aspeed_kcs_bmc(kcs_bmc);
> >
> >@@ -228,7 +228,7 @@ static const struct kcs_bmc_device_ops aspeed_kcs_ops = {
> >
> > static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> > {
> >-	struct kcs_bmc *kcs_bmc = arg;
> >+	struct kcs_bmc_device *kcs_bmc = arg;
> > 	int rc;
> >
> > 	rc = kcs_bmc_handle_event(kcs_bmc);
> >@@ -238,7 +238,7 @@ static irqreturn_t aspeed_kcs_irq(int irq, void *arg)
> > 	return rc == KCS_BMC_EVENT_HANDLED ? IRQ_HANDLED : IRQ_NONE;
> > }
> >
> >-static int aspeed_kcs_config_irq(struct kcs_bmc *kcs_bmc,
> >+static int aspeed_kcs_config_irq(struct kcs_bmc_device *kcs_bmc,
> > 			struct platform_device *pdev)
> > {
> > 	struct device *dev = &pdev->dev;
> >@@ -338,8 +338,8 @@ static int aspeed_kcs_of_v2_get_io_address(struct platform_device *pdev)
> > static int aspeed_kcs_probe(struct platform_device *pdev)
> > {
> > 	const struct aspeed_kcs_of_ops *ops;
> >+	struct kcs_bmc_device *kcs_bmc;
> > 	struct aspeed_kcs_bmc *priv;
> >-	struct kcs_bmc *kcs_bmc;
> > 	struct device_node *np;
> > 	int rc, channel, addr;
> >
> >@@ -400,7 +400,7 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
> > static int aspeed_kcs_remove(struct platform_device *pdev)
> > {
> > 	struct aspeed_kcs_bmc *priv = platform_get_drvdata(pdev);
> >-	struct kcs_bmc *kcs_bmc = &priv->kcs_bmc;
> >+	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
> >
> > 	kcs_bmc_remove_device(kcs_bmc);
> >
> >diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> >index fd852d8abe48..58c42e76483d 100644
> >--- a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> >+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
> >@@ -8,13 +8,88 @@
> > #include <linux/errno.h>
> > #include <linux/io.h>
> > #include <linux/ipmi_bmc.h>
> >+#include <linux/list.h>
> >+#include <linux/miscdevice.h>
> > #include <linux/module.h>
> >+#include <linux/mutex.h>
> > #include <linux/platform_device.h>
> > #include <linux/poll.h>
> > #include <linux/sched.h>
> > #include <linux/slab.h>
> >
> >-#include "kcs_bmc.h"
> >+#include "kcs_bmc_client.h"
> >+
> >+/* Different phases of the KCS BMC module.
> >+ *  KCS_PHASE_IDLE:
> >+ *            BMC should not be expecting nor sending any data.
> >+ *  KCS_PHASE_WRITE_START:
> >+ *            BMC is receiving a WRITE_START command from system software.
> >+ *  KCS_PHASE_WRITE_DATA:
> >+ *            BMC is receiving a data byte from system software.
> >+ *  KCS_PHASE_WRITE_END_CMD:
> >+ *            BMC is waiting a last data byte from system software.
> >+ *  KCS_PHASE_WRITE_DONE:
> >+ *            BMC has received the whole request from system software.
> >+ *  KCS_PHASE_WAIT_READ:
> >+ *            BMC is waiting the response from the upper IPMI service.
> >+ *  KCS_PHASE_READ:
> >+ *            BMC is transferring the response to system software.
> >+ *  KCS_PHASE_ABORT_ERROR1:
> >+ *            BMC is waiting error status request from system software.
> >+ *  KCS_PHASE_ABORT_ERROR2:
> >+ *            BMC is waiting for idle status afer error from system software.
> >+ *  KCS_PHASE_ERROR:
> >+ *            BMC has detected a protocol violation at the interface level.
> >+ */
> >+enum kcs_ipmi_phases {
> >+	KCS_PHASE_IDLE,
> >+
> >+	KCS_PHASE_WRITE_START,
> >+	KCS_PHASE_WRITE_DATA,
> >+	KCS_PHASE_WRITE_END_CMD,
> >+	KCS_PHASE_WRITE_DONE,
> >+
> >+	KCS_PHASE_WAIT_READ,
> >+	KCS_PHASE_READ,
> >+
> >+	KCS_PHASE_ABORT_ERROR1,
> >+	KCS_PHASE_ABORT_ERROR2,
> >+	KCS_PHASE_ERROR
> >+};
> >+
> >+/* IPMI 2.0 - Table 9-4, KCS Interface Status Codes */
> >+enum kcs_ipmi_errors {
> >+	KCS_NO_ERROR                = 0x00,
> >+	KCS_ABORTED_BY_COMMAND      = 0x01,
> >+	KCS_ILLEGAL_CONTROL_CODE    = 0x02,
> >+	KCS_LENGTH_ERROR            = 0x06,
> >+	KCS_UNSPECIFIED_ERROR       = 0xFF
> >+};
> >+
> >+struct kcs_bmc_ipmi {
> >+	struct list_head entry;
> >+
> >+	struct kcs_bmc_client client;
> >+
> >+	spinlock_t lock;
> >+
> >+	enum kcs_ipmi_phases phase;
> >+	enum kcs_ipmi_errors error;
> >+
> >+	wait_queue_head_t queue;
> >+	bool data_in_avail;
> >+	int  data_in_idx;
> >+	u8  *data_in;
> >+
> >+	int  data_out_idx;
> >+	int  data_out_len;
> >+	u8  *data_out;
> >+
> >+	struct mutex mutex;
> >+	u8 *kbuffer;
> >+
> >+	struct miscdevice miscdev;
> >+};
> >
> > #define DEVICE_NAME "ipmi-kcs"
> >
> >@@ -44,171 +119,169 @@ enum kcs_states {
> > #define KCS_CMD_WRITE_END         0x62
> > #define KCS_CMD_READ_BYTE         0x68
> >
> >-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
> >+static inline void set_state(struct kcs_bmc_ipmi *priv, u8 state)
> > {
> >-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
> >-					KCS_STATUS_STATE(state));
> >+	kcs_bmc_update_status(priv->client.dev, KCS_STATUS_STATE_MASK, KCS_STATUS_STATE(state));
> > }
> >
> >-static void kcs_bmc_ipmi_force_abort(struct kcs_bmc *kcs_bmc)
> >+static void kcs_bmc_ipmi_force_abort(struct kcs_bmc_ipmi *priv)
> > {
> >-	set_state(kcs_bmc, ERROR_STATE);
> >-	kcs_bmc_read_data(kcs_bmc);
> >-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >+	set_state(priv, ERROR_STATE);
> >+	kcs_bmc_read_data(priv->client.dev);
> >+	kcs_bmc_write_data(priv->client.dev, KCS_ZERO_DATA);
> >
> >-	kcs_bmc->phase = KCS_PHASE_ERROR;
> >-	kcs_bmc->data_in_avail = false;
> >-	kcs_bmc->data_in_idx = 0;
> >+	priv->phase = KCS_PHASE_ERROR;
> >+	priv->data_in_avail = false;
> >+	priv->data_in_idx = 0;
> > }
> >
> >-static void kcs_bmc_ipmi_handle_data(struct kcs_bmc *kcs_bmc)
> >+static void kcs_bmc_ipmi_handle_data(struct kcs_bmc_ipmi *priv)
> > {
> >+	struct kcs_bmc_device *dev;
> > 	u8 data;
> >
> >-	switch (kcs_bmc->phase) {
> >+	dev = priv->client.dev;
> >+
> >+	switch (priv->phase) {
> > 	case KCS_PHASE_WRITE_START:
> >-		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
> >+		priv->phase = KCS_PHASE_WRITE_DATA;
> > 		fallthrough;
> >
> > 	case KCS_PHASE_WRITE_DATA:
> >-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
> >-			set_state(kcs_bmc, WRITE_STATE);
> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> >-						kcs_bmc_read_data(kcs_bmc);
> >+		if (priv->data_in_idx < KCS_MSG_BUFSIZ) {
> >+			set_state(priv, WRITE_STATE);
> >+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> >+			priv->data_in[priv->data_in_idx++] = kcs_bmc_read_data(dev);
> > 		} else {
> >-			kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-			kcs_bmc->error = KCS_LENGTH_ERROR;
> >+			kcs_bmc_ipmi_force_abort(priv);
> >+			priv->error = KCS_LENGTH_ERROR;
> > 		}
> > 		break;
> >
> > 	case KCS_PHASE_WRITE_END_CMD:
> >-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
> >-			set_state(kcs_bmc, READ_STATE);
> >-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
> >-						kcs_bmc_read_data(kcs_bmc);
> >-			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
> >-			kcs_bmc->data_in_avail = true;
> >-			wake_up_interruptible(&kcs_bmc->queue);
> >+		if (priv->data_in_idx < KCS_MSG_BUFSIZ) {
> >+			set_state(priv, READ_STATE);
> >+			priv->data_in[priv->data_in_idx++] = kcs_bmc_read_data(dev);
> >+			priv->phase = KCS_PHASE_WRITE_DONE;
> >+			priv->data_in_avail = true;
> >+			wake_up_interruptible(&priv->queue);
> > 		} else {
> >-			kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-			kcs_bmc->error = KCS_LENGTH_ERROR;
> >+			kcs_bmc_ipmi_force_abort(priv);
> >+			priv->error = KCS_LENGTH_ERROR;
> > 		}
> > 		break;
> >
> > 	case KCS_PHASE_READ:
> >-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
> >-			set_state(kcs_bmc, IDLE_STATE);
> >+		if (priv->data_out_idx == priv->data_out_len)
> >+			set_state(priv, IDLE_STATE);
> >
> >-		data = kcs_bmc_read_data(kcs_bmc);
> >+		data = kcs_bmc_read_data(dev);
> > 		if (data != KCS_CMD_READ_BYTE) {
> >-			set_state(kcs_bmc, ERROR_STATE);
> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >+			set_state(priv, ERROR_STATE);
> >+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> > 			break;
> > 		}
> >
> >-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
> >-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-			kcs_bmc->phase = KCS_PHASE_IDLE;
> >+		if (priv->data_out_idx == priv->data_out_len) {
> >+			kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> >+			priv->phase = KCS_PHASE_IDLE;
> > 			break;
> > 		}
> >
> >-		kcs_bmc_write_data(kcs_bmc,
> >-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
> >+		kcs_bmc_write_data(dev, priv->data_out[priv->data_out_idx++]);
> > 		break;
> >
> > 	case KCS_PHASE_ABORT_ERROR1:
> >-		set_state(kcs_bmc, READ_STATE);
> >-		kcs_bmc_read_data(kcs_bmc);
> >-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
> >-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
> >+		set_state(priv, READ_STATE);
> >+		kcs_bmc_read_data(dev);
> >+		kcs_bmc_write_data(dev, priv->error);
> >+		priv->phase = KCS_PHASE_ABORT_ERROR2;
> > 		break;
> >
> > 	case KCS_PHASE_ABORT_ERROR2:
> >-		set_state(kcs_bmc, IDLE_STATE);
> >-		kcs_bmc_read_data(kcs_bmc);
> >-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >-		kcs_bmc->phase = KCS_PHASE_IDLE;
> >+		set_state(priv, IDLE_STATE);
> >+		kcs_bmc_read_data(dev);
> >+		kcs_bmc_write_data(dev, KCS_ZERO_DATA);
> >+		priv->phase = KCS_PHASE_IDLE;
> > 		break;
> >
> > 	default:
> >-		kcs_bmc_ipmi_force_abort(kcs_bmc);
> >+		kcs_bmc_ipmi_force_abort(priv);
> > 		break;
> > 	}
> > }
> >
> >-static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
> >+static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc_ipmi *priv)
> > {
> > 	u8 cmd;
> >
> >-	set_state(kcs_bmc, WRITE_STATE);
> >-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
> >+	set_state(priv, WRITE_STATE);
> >+	kcs_bmc_write_data(priv->client.dev, KCS_ZERO_DATA);
> >
> >-	cmd = kcs_bmc_read_data(kcs_bmc);
> >+	cmd = kcs_bmc_read_data(priv->client.dev);
> > 	switch (cmd) {
> > 	case KCS_CMD_WRITE_START:
> >-		kcs_bmc->phase = KCS_PHASE_WRITE_START;
> >-		kcs_bmc->error = KCS_NO_ERROR;
> >-		kcs_bmc->data_in_avail = false;
> >-		kcs_bmc->data_in_idx = 0;
> >+		priv->phase = KCS_PHASE_WRITE_START;
> >+		priv->error = KCS_NO_ERROR;
> >+		priv->data_in_avail = false;
> >+		priv->data_in_idx = 0;
> > 		break;
> >
> > 	case KCS_CMD_WRITE_END:
> >-		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
> >-			kcs_bmc_ipmi_force_abort(kcs_bmc);
> >+		if (priv->phase != KCS_PHASE_WRITE_DATA) {
> >+			kcs_bmc_ipmi_force_abort(priv);
> > 			break;
> > 		}
> >
> >-		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
> >+		priv->phase = KCS_PHASE_WRITE_END_CMD;
> > 		break;
> >
> > 	case KCS_CMD_GET_STATUS_ABORT:
> >-		if (kcs_bmc->error == KCS_NO_ERROR)
> >-			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
> >+		if (priv->error == KCS_NO_ERROR)
> >+			priv->error = KCS_ABORTED_BY_COMMAND;
> >
> >-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
> >-		kcs_bmc->data_in_avail = false;
> >-		kcs_bmc->data_in_idx = 0;
> >+		priv->phase = KCS_PHASE_ABORT_ERROR1;
> >+		priv->data_in_avail = false;
> >+		priv->data_in_idx = 0;
> > 		break;
> >
> > 	default:
> >-		kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
> >+		kcs_bmc_ipmi_force_abort(priv);
> >+		priv->error = KCS_ILLEGAL_CONTROL_CODE;
> > 		break;
> > 	}
> > }
> >
> >-static inline struct kcs_bmc *client_to_kcs_bmc(struct kcs_bmc_client *client)
> >+static inline struct kcs_bmc_ipmi *client_to_kcs_bmc_ipmi(struct kcs_bmc_client *client)
> > {
> >-	return container_of(client, struct kcs_bmc, client);
> >+	return container_of(client, struct kcs_bmc_ipmi, client);
> > }
> >
> > static int kcs_bmc_ipmi_event(struct kcs_bmc_client *client)
> > {
> >-	struct kcs_bmc *kcs_bmc;
> >-	unsigned long flags;
> >+	struct kcs_bmc_ipmi *priv;
> > 	u8 status;
> > 	int ret;
> >
> >-	kcs_bmc = client_to_kcs_bmc(client);
> >+	priv = client_to_kcs_bmc_ipmi(client);
> >+	if (!priv)
> >+		return KCS_BMC_EVENT_NONE;
> >
> >-	spin_lock_irqsave(&kcs_bmc->lock, flags);
> >+	spin_lock(&priv->lock);
> >
> >-	status = kcs_bmc_read_status(kcs_bmc);
> >+	status = kcs_bmc_read_status(client->dev);
> > 	if (status & KCS_STATUS_IBF) {
> >-		if (!kcs_bmc->running)
> >-			kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-		else if (status & KCS_STATUS_CMD_DAT)
> >-			kcs_bmc_ipmi_handle_cmd(kcs_bmc);
> >+		if (status & KCS_STATUS_CMD_DAT)
> >+			kcs_bmc_ipmi_handle_cmd(priv);
> > 		else
> >-			kcs_bmc_ipmi_handle_data(kcs_bmc);
> >+			kcs_bmc_ipmi_handle_data(priv);
> >
> > 		ret = KCS_BMC_EVENT_HANDLED;
> > 	} else {
> > 		ret = KCS_BMC_EVENT_NONE;
> > 	}
> >
> >-	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
> >+	spin_unlock(&priv->lock);
> >
> > 	return ret;
> > }
> >@@ -217,37 +290,29 @@ static const struct kcs_bmc_client_ops kcs_bmc_ipmi_client_ops = {
> > 	.event = kcs_bmc_ipmi_event,
> > };
> >
> >-static inline struct kcs_bmc *file_to_kcs_bmc(struct file *filp)
> >+static inline struct kcs_bmc_ipmi *to_kcs_bmc(struct file *filp)
> > {
> >-	return container_of(filp->private_data, struct kcs_bmc, miscdev);
> >+	return container_of(filp->private_data, struct kcs_bmc_ipmi, miscdev);
> > }
> >
> > static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
> > {
> >-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> >-	int ret = 0;
> >+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	if (!kcs_bmc->running)
> >-		kcs_bmc->running = 1;
> >-	else
> >-		ret = -EBUSY;
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >-
> >-	return ret;
> >+	return kcs_bmc_enable_device(priv->client.dev, &priv->client);
> > }
> >
> > static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
> > {
> >-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> >+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
> > 	__poll_t mask = 0;
> >
> >-	poll_wait(filp, &kcs_bmc->queue, wait);
> >+	poll_wait(filp, &priv->queue, wait);
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	if (kcs_bmc->data_in_avail)
> >+	spin_lock_irq(&priv->lock);
> >+	if (priv->data_in_avail)
> > 		mask |= EPOLLIN;
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	spin_unlock_irq(&priv->lock);
> >
> > 	return mask;
> > }
> >@@ -255,24 +320,24 @@ static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
> > static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
> > 			    size_t count, loff_t *ppos)
> > {
> >-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> >+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
> > 	bool data_avail;
> > 	size_t data_len;
> > 	ssize_t ret;
> >
> > 	if (!(filp->f_flags & O_NONBLOCK))
> >-		wait_event_interruptible(kcs_bmc->queue,
> >-					 kcs_bmc->data_in_avail);
> >+		wait_event_interruptible(priv->queue,
> >+					 priv->data_in_avail);
> >
> >-	mutex_lock(&kcs_bmc->mutex);
> >+	mutex_lock(&priv->mutex);
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	data_avail = kcs_bmc->data_in_avail;
> >+	spin_lock_irq(&priv->lock);
> >+	data_avail = priv->data_in_avail;
> > 	if (data_avail) {
> >-		data_len = kcs_bmc->data_in_idx;
> >-		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
> >+		data_len = priv->data_in_idx;
> >+		memcpy(priv->kbuffer, priv->data_in, data_len);
> > 	}
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	spin_unlock_irq(&priv->lock);
> >
> > 	if (!data_avail) {
> > 		ret = -EAGAIN;
> >@@ -281,35 +346,35 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
> >
> > 	if (count < data_len) {
> > 		pr_err("channel=%u with too large data : %zu\n",
> >-			kcs_bmc->channel, data_len);
> >+			priv->client.dev->channel, data_len);
> >
> >-		spin_lock_irq(&kcs_bmc->lock);
> >-		kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-		spin_unlock_irq(&kcs_bmc->lock);
> >+		spin_lock_irq(&priv->lock);
> >+		kcs_bmc_ipmi_force_abort(priv);
> >+		spin_unlock_irq(&priv->lock);
> >
> > 		ret = -EOVERFLOW;
> > 		goto out_unlock;
> > 	}
> >
> >-	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
> >+	if (copy_to_user(buf, priv->kbuffer, data_len)) {
> > 		ret = -EFAULT;
> > 		goto out_unlock;
> > 	}
> >
> > 	ret = data_len;
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
> >-		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
> >-		kcs_bmc->data_in_avail = false;
> >-		kcs_bmc->data_in_idx = 0;
> >+	spin_lock_irq(&priv->lock);
> >+	if (priv->phase == KCS_PHASE_WRITE_DONE) {
> >+		priv->phase = KCS_PHASE_WAIT_READ;
> >+		priv->data_in_avail = false;
> >+		priv->data_in_idx = 0;
> > 	} else {
> > 		ret = -EAGAIN;
> > 	}
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	spin_unlock_irq(&priv->lock);
> >
> > out_unlock:
> >-	mutex_unlock(&kcs_bmc->mutex);
> >+	mutex_unlock(&priv->mutex);
> >
> > 	return ret;
> > }
> >@@ -317,35 +382,35 @@ static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
> > static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
> > 			     size_t count, loff_t *ppos)
> > {
> >-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> >+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
> > 	ssize_t ret;
> >
> > 	/* a minimum response size '3' : netfn + cmd + ccode */
> > 	if (count < 3 || count > KCS_MSG_BUFSIZ)
> > 		return -EINVAL;
> >
> >-	mutex_lock(&kcs_bmc->mutex);
> >+	mutex_lock(&priv->mutex);
> >
> >-	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
> >+	if (copy_from_user(priv->kbuffer, buf, count)) {
> > 		ret = -EFAULT;
> > 		goto out_unlock;
> > 	}
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
> >-		kcs_bmc->phase = KCS_PHASE_READ;
> >-		kcs_bmc->data_out_idx = 1;
> >-		kcs_bmc->data_out_len = count;
> >-		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
> >-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
> >+	spin_lock_irq(&priv->lock);
> >+	if (priv->phase == KCS_PHASE_WAIT_READ) {
> >+		priv->phase = KCS_PHASE_READ;
> >+		priv->data_out_idx = 1;
> >+		priv->data_out_len = count;
> >+		memcpy(priv->data_out, priv->kbuffer, count);
> >+		kcs_bmc_write_data(priv->client.dev, priv->data_out[0]);
> > 		ret = count;
> > 	} else {
> > 		ret = -EINVAL;
> > 	}
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	spin_unlock_irq(&priv->lock);
> >
> > out_unlock:
> >-	mutex_unlock(&kcs_bmc->mutex);
> >+	mutex_unlock(&priv->mutex);
> >
> > 	return ret;
> > }
> >@@ -353,22 +418,22 @@ static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
> > static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
> > 			  unsigned long arg)
> > {
> >-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> >+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
> > 	long ret = 0;
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >+	spin_lock_irq(&priv->lock);
> >
> > 	switch (cmd) {
> > 	case IPMI_BMC_IOCTL_SET_SMS_ATN:
> >-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
> >+		kcs_bmc_update_status(priv->client.dev, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
> > 		break;
> >
> > 	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
> >-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
> >+		kcs_bmc_update_status(priv->client.dev, KCS_STATUS_SMS_ATN, 0);
> > 		break;
> >
> > 	case IPMI_BMC_IOCTL_FORCE_ABORT:
> >-		kcs_bmc_ipmi_force_abort(kcs_bmc);
> >+		kcs_bmc_ipmi_force_abort(priv);
> > 		break;
> >
> > 	default:
> >@@ -376,19 +441,17 @@ static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
> > 		break;
> > 	}
> >
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	spin_unlock_irq(&priv->lock);
> >
> > 	return ret;
> > }
> >
> > static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
> > {
> >-	struct kcs_bmc *kcs_bmc = file_to_kcs_bmc(filp);
> >+	struct kcs_bmc_ipmi *priv = to_kcs_bmc(filp);
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	kcs_bmc->running = 0;
> >-	kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	kcs_bmc_ipmi_force_abort(priv);
> >+	kcs_bmc_disable_device(priv->client.dev, &priv->client);
> >
> > 	return 0;
> > }
> >@@ -403,56 +466,78 @@ static const struct file_operations kcs_bmc_ipmi_fops = {
> > 	.unlocked_ioctl = kcs_bmc_ipmi_ioctl,
> > };
> >
> >-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc);
> >-int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc *kcs_bmc)
> >+static DEFINE_SPINLOCK(kcs_bmc_ipmi_instances_lock);
> >+static LIST_HEAD(kcs_bmc_ipmi_instances);
> >+
> >+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc);
> >+int kcs_bmc_ipmi_attach_cdev(struct kcs_bmc_device *kcs_bmc)
> > {
> >+	struct kcs_bmc_ipmi *priv;
> > 	int rc;
> >
> >-	spin_lock_init(&kcs_bmc->lock);
> >-	mutex_init(&kcs_bmc->mutex);
> >-	init_waitqueue_head(&kcs_bmc->queue);
> >-
> >-	kcs_bmc->client.dev = kcs_bmc;
> >-	kcs_bmc->client.ops = &kcs_bmc_ipmi_client_ops;
> >-	kcs_bmc->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> >-	kcs_bmc->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> >-	kcs_bmc->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> >-
> >-	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> >-	kcs_bmc->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u",
> >-					       DEVICE_NAME, kcs_bmc->channel);
> >-	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
> >-	    !kcs_bmc->miscdev.name)
> >+	priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
> >+	if (!priv)
> > 		return -ENOMEM;
> >
> >-	kcs_bmc->miscdev.fops = &kcs_bmc_ipmi_fops;
> >+	spin_lock_init(&priv->lock);
> >+	mutex_init(&priv->mutex);
> >
> >-	rc = misc_register(&kcs_bmc->miscdev);
> >+	init_waitqueue_head(&priv->queue);
> >+
> >+	priv->client.dev = kcs_bmc;
> >+	priv->client.ops = &kcs_bmc_ipmi_client_ops;
> >+	priv->data_in = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> >+	priv->data_out = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> >+	priv->kbuffer = devm_kmalloc(kcs_bmc->dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
> >+
> >+	priv->miscdev.minor = MISC_DYNAMIC_MINOR;
> >+	priv->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u", DEVICE_NAME,
> >+					   kcs_bmc->channel);
> >+	if (!priv->data_in || !priv->data_out || !priv->kbuffer || !priv->miscdev.name)
> >+		return -EINVAL;
> >+
> >+	priv->miscdev.fops = &kcs_bmc_ipmi_fops;
> >+
> >+	rc = misc_register(&priv->miscdev);
> > 	if (rc) {
> > 		dev_err(kcs_bmc->dev, "Unable to register device: %d\n", rc);
> > 		return rc;
> > 	}
> >
> >+	spin_lock_irq(&kcs_bmc_ipmi_instances_lock);
> >+	list_add(&priv->entry, &kcs_bmc_ipmi_instances);
> >+	spin_unlock_irq(&kcs_bmc_ipmi_instances_lock);
> >+
> > 	dev_info(kcs_bmc->dev, "Initialised IPMI client for channel %d", kcs_bmc->channel);
> >
> > 	return 0;
> > }
> > EXPORT_SYMBOL(kcs_bmc_ipmi_attach_cdev);
> >
> >-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc);
> >-int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc *kcs_bmc)
> >+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc);
> >+int kcs_bmc_ipmi_detach_cdev(struct kcs_bmc_device *kcs_bmc)
> > {
> >-	misc_deregister(&kcs_bmc->miscdev);
> >+	struct kcs_bmc_ipmi *priv = NULL, *pos;
> >
> >-	spin_lock_irq(&kcs_bmc->lock);
> >-	kcs_bmc->running = 0;
> >-	kcs_bmc_ipmi_force_abort(kcs_bmc);
> >-	spin_unlock_irq(&kcs_bmc->lock);
> >+	spin_lock_irq(&kcs_bmc_ipmi_instances_lock);
> >+	list_for_each_entry(pos, &kcs_bmc_ipmi_instances, entry) {
> >+		if (pos->client.dev == kcs_bmc) {
> >+			priv = pos;
> >+			list_del(&pos->entry);
> >+			break;
> >+		}
> >+	}
> >+	spin_unlock_irq(&kcs_bmc_ipmi_instances_lock);
> >
> >-	devm_kfree(kcs_bmc->dev, kcs_bmc->kbuffer);
> >-	devm_kfree(kcs_bmc->dev, kcs_bmc->data_out);
> >-	devm_kfree(kcs_bmc->dev, kcs_bmc->data_in);
> >-	devm_kfree(kcs_bmc->dev, kcs_bmc);
> >+	if (!priv)
> >+		return 0;
> 
> Would -ENOENT or something be appropriate here if the thing we're trying
> to detach isn't found?

Maybe -ENODEV. Let me think about this.

Cheers,

Andrew
