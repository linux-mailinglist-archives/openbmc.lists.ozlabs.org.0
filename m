Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512B377C83
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsFD43bWz306S
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:52:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=j8XWzOQI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RsBeqc6P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=j8XWzOQI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RsBeqc6P; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsBl4CrYz2ymJ
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:50:39 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B119616D8;
 Mon, 10 May 2021 02:50:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 10 May 2021 02:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=AGY1Obu/JHy/i
 Qm9onvFNxW29x0bpj0BoK1Nr879xuU=; b=j8XWzOQIJa1wPYm09r27mzdhQ5kip
 9R5eCF2XOCxaRIZjDyXLwNERkAidXnopBZCFPDXn0tX0yWmpL+2FIBJEbsQ2O7Qb
 ciDp4tldoTlcqPb3EZ1FEKPBiLEOn9nrFjiDxYF9dVupz6+oe+eM/iL3wHEceuSy
 HzDHmpFv/EzkIUfL5+MpeuUmSOmKQQ9kXnfrPqnmoi2Ff3Z6QnkIK3p+xPBoF7uh
 kHhVfx/jmK0yd0sI9FZiL8HdJm5Yr9PystBJCoZLoqRzXN0U8J7ENGXqaiWpm+xj
 rZWYDOXpw+ga99B4i5PwEOrQtpMDFkdZQ1oDdw/Y0OT0PWPZxccjkR3gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=AGY1Obu/JHy/iQm9onvFNxW29x0bpj0BoK1Nr879xuU=; b=RsBeqc6P
 7pCwHTQ+EktY3ix4wOugQi89GgBnDod2jEIsugWzY+IXjo7a/fa7+3E8kGJOONzr
 rY5jfYc7yIDsPUbECt87QLN29ISrYmCcNRzKfgB6D0nbiNNkQrB9X0rDD1ovU3zA
 yRARw5RIkViAJ1yYV++KRcsd0WW/h0XY0j19wZ5d/JyjYBNyI7CDr6QS1oqOPicD
 k/oY+48FKYYBKp9ETLKcC7bC0gQ3lCAvCv7bvIewt38KQmMpnxQv/9EyopFL1FVr
 YqWmJRTOd+0vDLUz0J0nP4jWmmhfBjPbif03do8iPaR0Dui1dhiMe4yAssL8NT6Y
 N1yLmeGCUF3mhA==
X-ME-Sender: <xms:vdeYYP--0UohZOMwKQqW2m0C4xs4Bz6MFlKKeOPeGgsLxUFWTsOcdQ>
 <xme:vdeYYLuI8cmJ6dkPvr6MuA72FU3RwbYi8KA7xd2OFtHwYDloQPDZWfVYS7lrYFjY2
 uYOUBFqEhCF6Vgj1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepvddtfedrheejrddvudehrdek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:vdeYYNCRcyp_dpe59SELN5S3rfnv2GH6dYlKFvNC37hFgoLTPsu8tA>
 <xmx:vdeYYLdh2fgqfsykDs105OCPd-V8mdW8r7oPL5-D8xDzeNUYZa2xgQ>
 <xmx:vdeYYEPJUEXZSwGAqxfbjVl1DzrbB90gG0RAaSiZl9NlVGzRJJwcKw>
 <xmx:vdeYYPb32WO3RvoNXSEKJi4s9J4zCITV5OqgbgD7qWgIzwKX8OHKCw>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:50:35 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 04/18] ipmi: kcs_bmc: Split out
 kcs_bmc_cdev_ipmi
Date: Mon, 10 May 2021 16:19:41 +0930
Message-Id: <20210510064955.1704652-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510064955.1704652-1-andrew@aj.id.au>
References: <20210510064955.1704652-1-andrew@aj.id.au>
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

Take steps towards defining a coherent API to separate the KCS device
drivers from the userspace interface. Decreasing the coupling will
improve the separation of concerns and enable the introduction of
alternative userspace interfaces.

For now, simply split the chardev logic out to a separate file. The code
continues to build into the same module.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
 drivers/char/ipmi/Makefile            |   2 +-
 drivers/char/ipmi/kcs_bmc.c           | 423 +------------------------
 drivers/char/ipmi/kcs_bmc.h           |  10 +-
 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 428 ++++++++++++++++++++++++++
 4 files changed, 451 insertions(+), 412 deletions(-)
 create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c

diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 0822adc2ec41..a302bc865370 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_IPMI_SSIF) += ipmi_ssif.o
 obj-$(CONFIG_IPMI_POWERNV) += ipmi_powernv.o
 obj-$(CONFIG_IPMI_WATCHDOG) += ipmi_watchdog.o
 obj-$(CONFIG_IPMI_POWEROFF) += ipmi_poweroff.o
-obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o
+obj-$(CONFIG_IPMI_KCS_BMC) += kcs_bmc.o kcs_bmc_cdev_ipmi.o
 obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
 obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index c4336c1f2d6d..ef5c48ffe74a 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -3,446 +3,51 @@
  * Copyright (c) 2015-2018, Intel Corporation.
  */
 
-#define pr_fmt(fmt) "kcs-bmc: " fmt
-
-#include <linux/errno.h>
-#include <linux/io.h>
-#include <linux/ipmi_bmc.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/poll.h>
-#include <linux/sched.h>
-#include <linux/slab.h>
 
 #include "kcs_bmc.h"
 
-#define DEVICE_NAME "ipmi-kcs"
-
-#define KCS_MSG_BUFSIZ    1000
-
-#define KCS_ZERO_DATA     0
-
-
-/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
-#define KCS_STATUS_STATE(state) (state << 6)
-#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
-#define KCS_STATUS_CMD_DAT      BIT(3)
-#define KCS_STATUS_SMS_ATN      BIT(2)
-#define KCS_STATUS_IBF          BIT(1)
-#define KCS_STATUS_OBF          BIT(0)
-
-/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
-enum kcs_states {
-	IDLE_STATE  = 0,
-	READ_STATE  = 1,
-	WRITE_STATE = 2,
-	ERROR_STATE = 3,
-};
-
-/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
-#define KCS_CMD_GET_STATUS_ABORT  0x60
-#define KCS_CMD_WRITE_START       0x61
-#define KCS_CMD_WRITE_END         0x62
-#define KCS_CMD_READ_BYTE         0x68
-
-static inline u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
 {
 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
 }
+EXPORT_SYMBOL(kcs_bmc_read_data);
 
-static inline void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
 {
 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
 }
+EXPORT_SYMBOL(kcs_bmc_write_data);
 
-static inline u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
 {
 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
 }
+EXPORT_SYMBOL(kcs_bmc_read_status);
 
-static inline void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
 {
 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
 }
+EXPORT_SYMBOL(kcs_bmc_write_status);
 
-static void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
 {
 	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
 }
+EXPORT_SYMBOL(kcs_bmc_update_status);
 
-static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
-{
-	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
-					KCS_STATUS_STATE(state));
-}
-
-static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
-{
-	set_state(kcs_bmc, ERROR_STATE);
-	kcs_bmc_read_data(kcs_bmc);
-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-
-	kcs_bmc->phase = KCS_PHASE_ERROR;
-	kcs_bmc->data_in_avail = false;
-	kcs_bmc->data_in_idx = 0;
-}
-
-static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
-{
-	u8 data;
-
-	switch (kcs_bmc->phase) {
-	case KCS_PHASE_WRITE_START:
-		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
-		fallthrough;
-
-	case KCS_PHASE_WRITE_DATA:
-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
-			set_state(kcs_bmc, WRITE_STATE);
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						kcs_bmc_read_data(kcs_bmc);
-		} else {
-			kcs_force_abort(kcs_bmc);
-			kcs_bmc->error = KCS_LENGTH_ERROR;
-		}
-		break;
-
-	case KCS_PHASE_WRITE_END_CMD:
-		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
-			set_state(kcs_bmc, READ_STATE);
-			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						kcs_bmc_read_data(kcs_bmc);
-			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
-			kcs_bmc->data_in_avail = true;
-			wake_up_interruptible(&kcs_bmc->queue);
-		} else {
-			kcs_force_abort(kcs_bmc);
-			kcs_bmc->error = KCS_LENGTH_ERROR;
-		}
-		break;
-
-	case KCS_PHASE_READ:
-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
-			set_state(kcs_bmc, IDLE_STATE);
-
-		data = kcs_bmc_read_data(kcs_bmc);
-		if (data != KCS_CMD_READ_BYTE) {
-			set_state(kcs_bmc, ERROR_STATE);
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			break;
-		}
-
-		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
-			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-			kcs_bmc->phase = KCS_PHASE_IDLE;
-			break;
-		}
-
-		kcs_bmc_write_data(kcs_bmc,
-			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
-		break;
-
-	case KCS_PHASE_ABORT_ERROR1:
-		set_state(kcs_bmc, READ_STATE);
-		kcs_bmc_read_data(kcs_bmc);
-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
-		break;
-
-	case KCS_PHASE_ABORT_ERROR2:
-		set_state(kcs_bmc, IDLE_STATE);
-		kcs_bmc_read_data(kcs_bmc);
-		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-		kcs_bmc->phase = KCS_PHASE_IDLE;
-		break;
-
-	default:
-		kcs_force_abort(kcs_bmc);
-		break;
-	}
-}
-
-static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
-{
-	u8 cmd;
-
-	set_state(kcs_bmc, WRITE_STATE);
-	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
-
-	cmd = kcs_bmc_read_data(kcs_bmc);
-	switch (cmd) {
-	case KCS_CMD_WRITE_START:
-		kcs_bmc->phase = KCS_PHASE_WRITE_START;
-		kcs_bmc->error = KCS_NO_ERROR;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
-		break;
-
-	case KCS_CMD_WRITE_END:
-		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
-			kcs_force_abort(kcs_bmc);
-			break;
-		}
-
-		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
-		break;
-
-	case KCS_CMD_GET_STATUS_ABORT:
-		if (kcs_bmc->error == KCS_NO_ERROR)
-			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
-
-		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
-		break;
-
-	default:
-		kcs_force_abort(kcs_bmc);
-		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
-		break;
-	}
-}
-
+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
 int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
 {
-	unsigned long flags;
-	int ret = -ENODATA;
-	u8 status;
-
-	spin_lock_irqsave(&kcs_bmc->lock, flags);
-
-	status = kcs_bmc_read_status(kcs_bmc);
-	if (status & KCS_STATUS_IBF) {
-		if (!kcs_bmc->running)
-			kcs_force_abort(kcs_bmc);
-		else if (status & KCS_STATUS_CMD_DAT)
-			kcs_bmc_handle_cmd(kcs_bmc);
-		else
-			kcs_bmc_handle_data(kcs_bmc);
-
-		ret = 0;
-	}
-
-	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
-
-	return ret;
+	return kcs_bmc_ipmi_event(kcs_bmc);
 }
 EXPORT_SYMBOL(kcs_bmc_handle_event);
 
-static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
-{
-	return container_of(filp->private_data, struct kcs_bmc, miscdev);
-}
-
-static int kcs_bmc_open(struct inode *inode, struct file *filp)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	int ret = 0;
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (!kcs_bmc->running)
-		kcs_bmc->running = 1;
-	else
-		ret = -EBUSY;
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return ret;
-}
-
-static __poll_t kcs_bmc_poll(struct file *filp, poll_table *wait)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	__poll_t mask = 0;
-
-	poll_wait(filp, &kcs_bmc->queue, wait);
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->data_in_avail)
-		mask |= EPOLLIN;
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return mask;
-}
-
-static ssize_t kcs_bmc_read(struct file *filp, char __user *buf,
-			    size_t count, loff_t *ppos)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	bool data_avail;
-	size_t data_len;
-	ssize_t ret;
-
-	if (!(filp->f_flags & O_NONBLOCK))
-		wait_event_interruptible(kcs_bmc->queue,
-					 kcs_bmc->data_in_avail);
-
-	mutex_lock(&kcs_bmc->mutex);
-
-	spin_lock_irq(&kcs_bmc->lock);
-	data_avail = kcs_bmc->data_in_avail;
-	if (data_avail) {
-		data_len = kcs_bmc->data_in_idx;
-		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
-	}
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	if (!data_avail) {
-		ret = -EAGAIN;
-		goto out_unlock;
-	}
-
-	if (count < data_len) {
-		pr_err("channel=%u with too large data : %zu\n",
-			kcs_bmc->channel, data_len);
-
-		spin_lock_irq(&kcs_bmc->lock);
-		kcs_force_abort(kcs_bmc);
-		spin_unlock_irq(&kcs_bmc->lock);
-
-		ret = -EOVERFLOW;
-		goto out_unlock;
-	}
-
-	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
-		ret = -EFAULT;
-		goto out_unlock;
-	}
-
-	ret = data_len;
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
-		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
-		kcs_bmc->data_in_avail = false;
-		kcs_bmc->data_in_idx = 0;
-	} else {
-		ret = -EAGAIN;
-	}
-	spin_unlock_irq(&kcs_bmc->lock);
-
-out_unlock:
-	mutex_unlock(&kcs_bmc->mutex);
-
-	return ret;
-}
-
-static ssize_t kcs_bmc_write(struct file *filp, const char __user *buf,
-			     size_t count, loff_t *ppos)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	ssize_t ret;
-
-	/* a minimum response size '3' : netfn + cmd + ccode */
-	if (count < 3 || count > KCS_MSG_BUFSIZ)
-		return -EINVAL;
-
-	mutex_lock(&kcs_bmc->mutex);
-
-	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
-		ret = -EFAULT;
-		goto out_unlock;
-	}
-
-	spin_lock_irq(&kcs_bmc->lock);
-	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
-		kcs_bmc->phase = KCS_PHASE_READ;
-		kcs_bmc->data_out_idx = 1;
-		kcs_bmc->data_out_len = count;
-		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
-		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
-		ret = count;
-	} else {
-		ret = -EINVAL;
-	}
-	spin_unlock_irq(&kcs_bmc->lock);
-
-out_unlock:
-	mutex_unlock(&kcs_bmc->mutex);
-
-	return ret;
-}
-
-static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
-			  unsigned long arg)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-	long ret = 0;
-
-	spin_lock_irq(&kcs_bmc->lock);
-
-	switch (cmd) {
-	case IPMI_BMC_IOCTL_SET_SMS_ATN:
-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
-		break;
-
-	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
-		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
-		break;
-
-	case IPMI_BMC_IOCTL_FORCE_ABORT:
-		kcs_force_abort(kcs_bmc);
-		break;
-
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return ret;
-}
-
-static int kcs_bmc_release(struct inode *inode, struct file *filp)
-{
-	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
-
-	spin_lock_irq(&kcs_bmc->lock);
-	kcs_bmc->running = 0;
-	kcs_force_abort(kcs_bmc);
-	spin_unlock_irq(&kcs_bmc->lock);
-
-	return 0;
-}
-
-static const struct file_operations kcs_bmc_fops = {
-	.owner          = THIS_MODULE,
-	.open           = kcs_bmc_open,
-	.read           = kcs_bmc_read,
-	.write          = kcs_bmc_write,
-	.release        = kcs_bmc_release,
-	.poll           = kcs_bmc_poll,
-	.unlocked_ioctl = kcs_bmc_ioctl,
-};
-
+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
 struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
 {
-	struct kcs_bmc *kcs_bmc;
-
-	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
-	if (!kcs_bmc)
-		return NULL;
-
-	spin_lock_init(&kcs_bmc->lock);
-	kcs_bmc->channel = channel;
-
-	mutex_init(&kcs_bmc->mutex);
-	init_waitqueue_head(&kcs_bmc->queue);
-
-	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
-
-	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
-	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
-					       DEVICE_NAME, channel);
-	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
-	    !kcs_bmc->miscdev.name)
-		return NULL;
-	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
-
-	return kcs_bmc;
+	return kcs_bmc_ipmi_alloc(dev, sizeof_priv, channel);
 }
 EXPORT_SYMBOL(kcs_bmc_alloc);
 
diff --git a/drivers/char/ipmi/kcs_bmc.h b/drivers/char/ipmi/kcs_bmc.h
index 970f53892f2d..febea0c8deb4 100644
--- a/drivers/char/ipmi/kcs_bmc.h
+++ b/drivers/char/ipmi/kcs_bmc.h
@@ -104,6 +104,12 @@ static inline void *kcs_bmc_priv(struct kcs_bmc *kcs_bmc)
 }
 
 int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc);
-struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv,
-					u32 channel);
+struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel);
+
+u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc);
+void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data);
+u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc);
+void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data);
+void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val);
+
 #endif /* __KCS_BMC_H__ */
diff --git a/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
new file mode 100644
index 000000000000..82c77994e481
--- /dev/null
+++ b/drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2015-2018, Intel Corporation.
+ */
+
+#define pr_fmt(fmt) "kcs-bmc: " fmt
+
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/ipmi_bmc.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+
+#include "kcs_bmc.h"
+
+#define DEVICE_NAME "ipmi-kcs"
+
+#define KCS_MSG_BUFSIZ    1000
+
+#define KCS_ZERO_DATA     0
+
+
+/* IPMI 2.0 - Table 9-1, KCS Interface Status Register Bits */
+#define KCS_STATUS_STATE(state) (state << 6)
+#define KCS_STATUS_STATE_MASK   GENMASK(7, 6)
+#define KCS_STATUS_CMD_DAT      BIT(3)
+#define KCS_STATUS_SMS_ATN      BIT(2)
+#define KCS_STATUS_IBF          BIT(1)
+#define KCS_STATUS_OBF          BIT(0)
+
+/* IPMI 2.0 - Table 9-2, KCS Interface State Bits */
+enum kcs_states {
+	IDLE_STATE  = 0,
+	READ_STATE  = 1,
+	WRITE_STATE = 2,
+	ERROR_STATE = 3,
+};
+
+/* IPMI 2.0 - Table 9-3, KCS Interface Control Codes */
+#define KCS_CMD_GET_STATUS_ABORT  0x60
+#define KCS_CMD_WRITE_START       0x61
+#define KCS_CMD_WRITE_END         0x62
+#define KCS_CMD_READ_BYTE         0x68
+
+static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
+{
+	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
+					KCS_STATUS_STATE(state));
+}
+
+static void kcs_bmc_ipmi_force_abort(struct kcs_bmc *kcs_bmc)
+{
+	set_state(kcs_bmc, ERROR_STATE);
+	kcs_bmc_read_data(kcs_bmc);
+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+
+	kcs_bmc->phase = KCS_PHASE_ERROR;
+	kcs_bmc->data_in_avail = false;
+	kcs_bmc->data_in_idx = 0;
+}
+
+static void kcs_bmc_ipmi_handle_data(struct kcs_bmc *kcs_bmc)
+{
+	u8 data;
+
+	switch (kcs_bmc->phase) {
+	case KCS_PHASE_WRITE_START:
+		kcs_bmc->phase = KCS_PHASE_WRITE_DATA;
+		fallthrough;
+
+	case KCS_PHASE_WRITE_DATA:
+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
+			set_state(kcs_bmc, WRITE_STATE);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
+						kcs_bmc_read_data(kcs_bmc);
+		} else {
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+			kcs_bmc->error = KCS_LENGTH_ERROR;
+		}
+		break;
+
+	case KCS_PHASE_WRITE_END_CMD:
+		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
+			set_state(kcs_bmc, READ_STATE);
+			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
+						kcs_bmc_read_data(kcs_bmc);
+			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
+			kcs_bmc->data_in_avail = true;
+			wake_up_interruptible(&kcs_bmc->queue);
+		} else {
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+			kcs_bmc->error = KCS_LENGTH_ERROR;
+		}
+		break;
+
+	case KCS_PHASE_READ:
+		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
+			set_state(kcs_bmc, IDLE_STATE);
+
+		data = kcs_bmc_read_data(kcs_bmc);
+		if (data != KCS_CMD_READ_BYTE) {
+			set_state(kcs_bmc, ERROR_STATE);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			break;
+		}
+
+		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc->phase = KCS_PHASE_IDLE;
+			break;
+		}
+
+		kcs_bmc_write_data(kcs_bmc,
+			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
+		break;
+
+	case KCS_PHASE_ABORT_ERROR1:
+		set_state(kcs_bmc, READ_STATE);
+		kcs_bmc_read_data(kcs_bmc);
+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
+		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
+		break;
+
+	case KCS_PHASE_ABORT_ERROR2:
+		set_state(kcs_bmc, IDLE_STATE);
+		kcs_bmc_read_data(kcs_bmc);
+		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+		kcs_bmc->phase = KCS_PHASE_IDLE;
+		break;
+
+	default:
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		break;
+	}
+}
+
+static void kcs_bmc_ipmi_handle_cmd(struct kcs_bmc *kcs_bmc)
+{
+	u8 cmd;
+
+	set_state(kcs_bmc, WRITE_STATE);
+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
+
+	cmd = kcs_bmc_read_data(kcs_bmc);
+	switch (cmd) {
+	case KCS_CMD_WRITE_START:
+		kcs_bmc->phase = KCS_PHASE_WRITE_START;
+		kcs_bmc->error = KCS_NO_ERROR;
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx = 0;
+		break;
+
+	case KCS_CMD_WRITE_END:
+		if (kcs_bmc->phase != KCS_PHASE_WRITE_DATA) {
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+			break;
+		}
+
+		kcs_bmc->phase = KCS_PHASE_WRITE_END_CMD;
+		break;
+
+	case KCS_CMD_GET_STATUS_ABORT:
+		if (kcs_bmc->error == KCS_NO_ERROR)
+			kcs_bmc->error = KCS_ABORTED_BY_COMMAND;
+
+		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR1;
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx = 0;
+		break;
+
+	default:
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		kcs_bmc->error = KCS_ILLEGAL_CONTROL_CODE;
+		break;
+	}
+}
+
+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc);
+int kcs_bmc_ipmi_event(struct kcs_bmc *kcs_bmc)
+{
+	unsigned long flags;
+	int ret = -ENODATA;
+	u8 status;
+
+	spin_lock_irqsave(&kcs_bmc->lock, flags);
+
+	status = kcs_bmc_read_status(kcs_bmc);
+	if (status & KCS_STATUS_IBF) {
+		if (!kcs_bmc->running)
+			kcs_bmc_ipmi_force_abort(kcs_bmc);
+		else if (status & KCS_STATUS_CMD_DAT)
+			kcs_bmc_ipmi_handle_cmd(kcs_bmc);
+		else
+			kcs_bmc_ipmi_handle_data(kcs_bmc);
+
+		ret = 0;
+	}
+
+	spin_unlock_irqrestore(&kcs_bmc->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL(kcs_bmc_ipmi_event);
+
+static inline struct kcs_bmc *to_kcs_bmc(struct file *filp)
+{
+	return container_of(filp->private_data, struct kcs_bmc, miscdev);
+}
+
+static int kcs_bmc_ipmi_open(struct inode *inode, struct file *filp)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	int ret = 0;
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (!kcs_bmc->running)
+		kcs_bmc->running = 1;
+	else
+		ret = -EBUSY;
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return ret;
+}
+
+static __poll_t kcs_bmc_ipmi_poll(struct file *filp, poll_table *wait)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	__poll_t mask = 0;
+
+	poll_wait(filp, &kcs_bmc->queue, wait);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->data_in_avail)
+		mask |= EPOLLIN;
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return mask;
+}
+
+static ssize_t kcs_bmc_ipmi_read(struct file *filp, char __user *buf,
+			    size_t count, loff_t *ppos)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	bool data_avail;
+	size_t data_len;
+	ssize_t ret;
+
+	if (!(filp->f_flags & O_NONBLOCK))
+		wait_event_interruptible(kcs_bmc->queue,
+					 kcs_bmc->data_in_avail);
+
+	mutex_lock(&kcs_bmc->mutex);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	data_avail = kcs_bmc->data_in_avail;
+	if (data_avail) {
+		data_len = kcs_bmc->data_in_idx;
+		memcpy(kcs_bmc->kbuffer, kcs_bmc->data_in, data_len);
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	if (!data_avail) {
+		ret = -EAGAIN;
+		goto out_unlock;
+	}
+
+	if (count < data_len) {
+		pr_err("channel=%u with too large data : %zu\n",
+			kcs_bmc->channel, data_len);
+
+		spin_lock_irq(&kcs_bmc->lock);
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		spin_unlock_irq(&kcs_bmc->lock);
+
+		ret = -EOVERFLOW;
+		goto out_unlock;
+	}
+
+	if (copy_to_user(buf, kcs_bmc->kbuffer, data_len)) {
+		ret = -EFAULT;
+		goto out_unlock;
+	}
+
+	ret = data_len;
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->phase == KCS_PHASE_WRITE_DONE) {
+		kcs_bmc->phase = KCS_PHASE_WAIT_READ;
+		kcs_bmc->data_in_avail = false;
+		kcs_bmc->data_in_idx = 0;
+	} else {
+		ret = -EAGAIN;
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+out_unlock:
+	mutex_unlock(&kcs_bmc->mutex);
+
+	return ret;
+}
+
+static ssize_t kcs_bmc_ipmi_write(struct file *filp, const char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	ssize_t ret;
+
+	/* a minimum response size '3' : netfn + cmd + ccode */
+	if (count < 3 || count > KCS_MSG_BUFSIZ)
+		return -EINVAL;
+
+	mutex_lock(&kcs_bmc->mutex);
+
+	if (copy_from_user(kcs_bmc->kbuffer, buf, count)) {
+		ret = -EFAULT;
+		goto out_unlock;
+	}
+
+	spin_lock_irq(&kcs_bmc->lock);
+	if (kcs_bmc->phase == KCS_PHASE_WAIT_READ) {
+		kcs_bmc->phase = KCS_PHASE_READ;
+		kcs_bmc->data_out_idx = 1;
+		kcs_bmc->data_out_len = count;
+		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
+		ret = count;
+	} else {
+		ret = -EINVAL;
+	}
+	spin_unlock_irq(&kcs_bmc->lock);
+
+out_unlock:
+	mutex_unlock(&kcs_bmc->mutex);
+
+	return ret;
+}
+
+static long kcs_bmc_ipmi_ioctl(struct file *filp, unsigned int cmd,
+			  unsigned long arg)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+	long ret = 0;
+
+	spin_lock_irq(&kcs_bmc->lock);
+
+	switch (cmd) {
+	case IPMI_BMC_IOCTL_SET_SMS_ATN:
+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
+		break;
+
+	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
+		break;
+
+	case IPMI_BMC_IOCTL_FORCE_ABORT:
+		kcs_bmc_ipmi_force_abort(kcs_bmc);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return ret;
+}
+
+static int kcs_bmc_ipmi_release(struct inode *inode, struct file *filp)
+{
+	struct kcs_bmc *kcs_bmc = to_kcs_bmc(filp);
+
+	spin_lock_irq(&kcs_bmc->lock);
+	kcs_bmc->running = 0;
+	kcs_bmc_ipmi_force_abort(kcs_bmc);
+	spin_unlock_irq(&kcs_bmc->lock);
+
+	return 0;
+}
+
+static const struct file_operations kcs_bmc_fops = {
+	.owner          = THIS_MODULE,
+	.open           = kcs_bmc_ipmi_open,
+	.read           = kcs_bmc_ipmi_read,
+	.write          = kcs_bmc_ipmi_write,
+	.release        = kcs_bmc_ipmi_release,
+	.poll           = kcs_bmc_ipmi_poll,
+	.unlocked_ioctl = kcs_bmc_ipmi_ioctl,
+};
+
+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
+struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel)
+{
+	struct kcs_bmc *kcs_bmc;
+
+	kcs_bmc = devm_kzalloc(dev, sizeof(*kcs_bmc) + sizeof_priv, GFP_KERNEL);
+	if (!kcs_bmc)
+		return NULL;
+
+	spin_lock_init(&kcs_bmc->lock);
+	kcs_bmc->channel = channel;
+
+	mutex_init(&kcs_bmc->mutex);
+	init_waitqueue_head(&kcs_bmc->queue);
+
+	kcs_bmc->data_in = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->data_out = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+	kcs_bmc->kbuffer = devm_kmalloc(dev, KCS_MSG_BUFSIZ, GFP_KERNEL);
+
+	kcs_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
+	kcs_bmc->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s%u",
+					       DEVICE_NAME, channel);
+	if (!kcs_bmc->data_in || !kcs_bmc->data_out || !kcs_bmc->kbuffer ||
+	    !kcs_bmc->miscdev.name)
+		return NULL;
+	kcs_bmc->miscdev.fops = &kcs_bmc_fops;
+
+	return kcs_bmc;
+}
+EXPORT_SYMBOL(kcs_bmc_ipmi_alloc);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Haiyue Wang <haiyue.wang@linux.intel.com>");
+MODULE_DESCRIPTION("KCS BMC to handle the IPMI request from system software");
-- 
2.27.0

