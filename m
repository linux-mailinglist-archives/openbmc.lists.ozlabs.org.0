Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594BF31FAC8
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 15:30:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhvBD1BCrz3ckc
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 01:30:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=vH4Ba9Av;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KURsjUbH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=vH4Ba9Av; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KURsjUbH; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhv5r2p0Mz3bPW;
 Sat, 20 Feb 2021 01:26:40 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7EC2F5803A8;
 Fri, 19 Feb 2021 09:26:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 09:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Ko3OKT6VnAb6a
 e+1fgFzozhFm1BKXxGAhRiRJMA4uKI=; b=vH4Ba9AvGSO6JVBP2T7WU2wXlII7u
 veXXceAKMCyyZ1oO/Ku2hUq9ix+azrKYEwy2OicoiJ16kcnxNZdJi1QvXJEGdDxD
 jLEArwd3E2nmmHwHZj/748Vpe/bkO7DZtYLM9CGGjcrRxdohBLOCKlwlxYVypCB5
 inbhE9JOzimciqc9gxmGbYw7adO3WKrECtBD4IHEOvzoympl6RWOZZMeBCymib1I
 IKOSItc0a1YPUMlEupSzswbkph+JZN/Gv78uc57OWhJRZgp8vZy45h6Qgc6D+7y8
 7lFEFPt9JKDaL5L+lAgX+tDbp40MdYWkLEYstgEpYEZJHatrvNxnIFASw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Ko3OKT6VnAb6ae+1fgFzozhFm1BKXxGAhRiRJMA4uKI=; b=KURsjUbH
 veIGfA3ilzXnnC7pHvYsaRdhVjHyeuIzE9fOrZ0HL0fV5fhrrVqNWRS6Kb48J3th
 OvVg6HTkKfhReRjyrU5zJaRw/HU9uSPz3Tv0gUfmvmpEAr0B77twGCX5Gm4uZICZ
 IwjPlTDMFt9iIpZE3Zg1V2pL2n/H80bNhZ4Ud+cSZa/BINXDUkJvwvlc61upJef2
 4aMR8K94aluBsRaFBg0q+mv0o12UHf30Aoh0rx36VnA4yBwKWCghdiqWKptnI6pd
 TudHqyacT4ITAHoMBCc3ax9gOEs5vECH6RK1LWniKo7UQd5X9F31+Aw/Rn1ga3Ef
 OlndWtniMCDuhw==
X-ME-Sender: <xms:nsovYH5j6tOqkivY-5uRjdS9JPyVPRFOSlpW_TOSB6wcPnP1w8knXQ>
 <xme:nsovYM6sTRSh7BMXR8htASNSEbG4AFaF1SwyOEqa9B-qQxG1X1ZZPLXGYfV16DCcj
 a5lc_jiCVPbFRtVDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdeigecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrdeluddrfeejnecuvehl
 uhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:nsovYOf_m1e6gG7axzPHOnXC040R6tUv0MAwYsBZZpwCNsPQCo5vyQ>
 <xmx:nsovYILrLPUJjLfqmsZ8ONHu09ioxFsPNH70q168fYaGmHRLO31y6Q>
 <xmx:nsovYLLW0tPUpkRqqS3fsFVHoQaCHA7xxBIgZlp0bAdV6_sFcJupPw>
 <xmx:nsovYE5Rq-K8C7B7kZNDaiPpcqDDstG0DOkhZ0BSxc6t3uzdXFHLyA>
Received: from localhost.localdomain
 (ppp14-2-91-37.adl-apt-pir-bras31.tpg.internode.on.net [14.2.91.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E854240062;
 Fri, 19 Feb 2021 09:26:31 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 minyard@acm.org
Subject: [PATCH 08/19] ipmi: kcs_bmc: Rename {read, write}_{status,
 data}() functions
Date: Sat, 20 Feb 2021 00:55:12 +1030
Message-Id: <20210219142523.3464540-9-andrew@aj.id.au>
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

Rename the functions in preparation for separating the IPMI chardev out
from the KCS BMC core.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/char/ipmi/kcs_bmc.c | 52 ++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
index 58fb1a7bd50d..c4336c1f2d6d 100644
--- a/drivers/char/ipmi/kcs_bmc.c
+++ b/drivers/char/ipmi/kcs_bmc.c
@@ -45,42 +45,42 @@ enum kcs_states {
 #define KCS_CMD_WRITE_END         0x62
 #define KCS_CMD_READ_BYTE         0x68
 
-static inline u8 read_data(struct kcs_bmc *kcs_bmc)
+static inline u8 kcs_bmc_read_data(struct kcs_bmc *kcs_bmc)
 {
 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.idr);
 }
 
-static inline void write_data(struct kcs_bmc *kcs_bmc, u8 data)
+static inline void kcs_bmc_write_data(struct kcs_bmc *kcs_bmc, u8 data)
 {
 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.odr, data);
 }
 
-static inline u8 read_status(struct kcs_bmc *kcs_bmc)
+static inline u8 kcs_bmc_read_status(struct kcs_bmc *kcs_bmc)
 {
 	return kcs_bmc->io_inputb(kcs_bmc, kcs_bmc->ioreg.str);
 }
 
-static inline void write_status(struct kcs_bmc *kcs_bmc, u8 data)
+static inline void kcs_bmc_write_status(struct kcs_bmc *kcs_bmc, u8 data)
 {
 	kcs_bmc->io_outputb(kcs_bmc, kcs_bmc->ioreg.str, data);
 }
 
-static void update_status_bits(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
+static void kcs_bmc_update_status(struct kcs_bmc *kcs_bmc, u8 mask, u8 val)
 {
 	kcs_bmc->io_updateb(kcs_bmc, kcs_bmc->ioreg.str, mask, val);
 }
 
 static inline void set_state(struct kcs_bmc *kcs_bmc, u8 state)
 {
-	update_status_bits(kcs_bmc, KCS_STATUS_STATE_MASK,
+	kcs_bmc_update_status(kcs_bmc, KCS_STATUS_STATE_MASK,
 					KCS_STATUS_STATE(state));
 }
 
 static void kcs_force_abort(struct kcs_bmc *kcs_bmc)
 {
 	set_state(kcs_bmc, ERROR_STATE);
-	read_data(kcs_bmc);
-	write_data(kcs_bmc, KCS_ZERO_DATA);
+	kcs_bmc_read_data(kcs_bmc);
+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
 
 	kcs_bmc->phase = KCS_PHASE_ERROR;
 	kcs_bmc->data_in_avail = false;
@@ -99,9 +99,9 @@ static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
 	case KCS_PHASE_WRITE_DATA:
 		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
 			set_state(kcs_bmc, WRITE_STATE);
-			write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
 			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						read_data(kcs_bmc);
+						kcs_bmc_read_data(kcs_bmc);
 		} else {
 			kcs_force_abort(kcs_bmc);
 			kcs_bmc->error = KCS_LENGTH_ERROR;
@@ -112,7 +112,7 @@ static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
 		if (kcs_bmc->data_in_idx < KCS_MSG_BUFSIZ) {
 			set_state(kcs_bmc, READ_STATE);
 			kcs_bmc->data_in[kcs_bmc->data_in_idx++] =
-						read_data(kcs_bmc);
+						kcs_bmc_read_data(kcs_bmc);
 			kcs_bmc->phase = KCS_PHASE_WRITE_DONE;
 			kcs_bmc->data_in_avail = true;
 			wake_up_interruptible(&kcs_bmc->queue);
@@ -126,34 +126,34 @@ static void kcs_bmc_handle_data(struct kcs_bmc *kcs_bmc)
 		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len)
 			set_state(kcs_bmc, IDLE_STATE);
 
-		data = read_data(kcs_bmc);
+		data = kcs_bmc_read_data(kcs_bmc);
 		if (data != KCS_CMD_READ_BYTE) {
 			set_state(kcs_bmc, ERROR_STATE);
-			write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
 			break;
 		}
 
 		if (kcs_bmc->data_out_idx == kcs_bmc->data_out_len) {
-			write_data(kcs_bmc, KCS_ZERO_DATA);
+			kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
 			kcs_bmc->phase = KCS_PHASE_IDLE;
 			break;
 		}
 
-		write_data(kcs_bmc,
+		kcs_bmc_write_data(kcs_bmc,
 			kcs_bmc->data_out[kcs_bmc->data_out_idx++]);
 		break;
 
 	case KCS_PHASE_ABORT_ERROR1:
 		set_state(kcs_bmc, READ_STATE);
-		read_data(kcs_bmc);
-		write_data(kcs_bmc, kcs_bmc->error);
+		kcs_bmc_read_data(kcs_bmc);
+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->error);
 		kcs_bmc->phase = KCS_PHASE_ABORT_ERROR2;
 		break;
 
 	case KCS_PHASE_ABORT_ERROR2:
 		set_state(kcs_bmc, IDLE_STATE);
-		read_data(kcs_bmc);
-		write_data(kcs_bmc, KCS_ZERO_DATA);
+		kcs_bmc_read_data(kcs_bmc);
+		kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
 		kcs_bmc->phase = KCS_PHASE_IDLE;
 		break;
 
@@ -168,9 +168,9 @@ static void kcs_bmc_handle_cmd(struct kcs_bmc *kcs_bmc)
 	u8 cmd;
 
 	set_state(kcs_bmc, WRITE_STATE);
-	write_data(kcs_bmc, KCS_ZERO_DATA);
+	kcs_bmc_write_data(kcs_bmc, KCS_ZERO_DATA);
 
-	cmd = read_data(kcs_bmc);
+	cmd = kcs_bmc_read_data(kcs_bmc);
 	switch (cmd) {
 	case KCS_CMD_WRITE_START:
 		kcs_bmc->phase = KCS_PHASE_WRITE_START;
@@ -212,7 +212,7 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
 
 	spin_lock_irqsave(&kcs_bmc->lock, flags);
 
-	status = read_status(kcs_bmc);
+	status = kcs_bmc_read_status(kcs_bmc);
 	if (status & KCS_STATUS_IBF) {
 		if (!kcs_bmc->running)
 			kcs_force_abort(kcs_bmc);
@@ -350,7 +350,7 @@ static ssize_t kcs_bmc_write(struct file *filp, const char __user *buf,
 		kcs_bmc->data_out_idx = 1;
 		kcs_bmc->data_out_len = count;
 		memcpy(kcs_bmc->data_out, kcs_bmc->kbuffer, count);
-		write_data(kcs_bmc, kcs_bmc->data_out[0]);
+		kcs_bmc_write_data(kcs_bmc, kcs_bmc->data_out[0]);
 		ret = count;
 	} else {
 		ret = -EINVAL;
@@ -373,13 +373,11 @@ static long kcs_bmc_ioctl(struct file *filp, unsigned int cmd,
 
 	switch (cmd) {
 	case IPMI_BMC_IOCTL_SET_SMS_ATN:
-		update_status_bits(kcs_bmc, KCS_STATUS_SMS_ATN,
-				   KCS_STATUS_SMS_ATN);
+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, KCS_STATUS_SMS_ATN);
 		break;
 
 	case IPMI_BMC_IOCTL_CLEAR_SMS_ATN:
-		update_status_bits(kcs_bmc, KCS_STATUS_SMS_ATN,
-				   0);
+		kcs_bmc_update_status(kcs_bmc, KCS_STATUS_SMS_ATN, 0);
 		break;
 
 	case IPMI_BMC_IOCTL_FORCE_ABORT:
-- 
2.27.0

