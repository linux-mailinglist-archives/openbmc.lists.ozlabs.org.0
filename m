Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB5D642F
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 15:37:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sKP029xzzDqgD
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 00:37:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C9Q79c8c"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sK3C2s35zDqn5
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 00:21:59 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id h195so10412642pfe.5
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xu2EHB0dJW6A7sWbVXHLOqvo5xxhErhfF/dTadFF4W4=;
 b=C9Q79c8cafOgfVX7sTysd+QuODVDxr9/p6opmqBbs6/I2nB+0syZhc5OcyWkAySceo
 7Irq8tXhiiw/2K2fbKdourBqqmztnyjUCrtNyrkQd5Nc5EgssTyepVo5aJD4LUcXn6Ui
 rRm4ZNlNnjvAyZKDhlUkRGVX38uSfaB5f7ZfpzsKHgxDHj2K0ZSXX1dundw6yygxIwbv
 AiqcvuCgEBu3eiOMYA7ejmVlmPRnDFHRRbGui4FPdbDEwzxA/KtTnDcogK6hRBu/epCD
 +Xi14NxXIcle3WPcMkMcvdADY9TTHpRFfRY1WiQVkBz65R0zNKKfmI/NN2vAR+GCYRmU
 NnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xu2EHB0dJW6A7sWbVXHLOqvo5xxhErhfF/dTadFF4W4=;
 b=nHoX4mvA9y5DVEztGU8D8X86SB8zc3oYw+kil8oNE41p+4eLT5n+rHzXVa0NVdt7vo
 l9muuEEDpQnt4fkc5N8yoxOPGpry4rzRJMkF5q0RzUG9rNIiMlPhixYxnb0EBcL3eo5W
 wesX8pF9nHf21SS6JL2VwyztoBD12CFywFHbF7A3jT6bHQmKFdgCaedMFK+kZjEqT5Og
 /JUK9XkipDZmWvI6IUEmON4qvmNwuOKgkDxU53QqJ/1sWq0dKF1Ii5yUFu3hwYkJcIJr
 rCNiJysVc44WjLvrj8Sr70UlhAWj7KgEa7oKbiPQladv1BKBJ87vKvH2RxwGond8x5Aa
 dX+A==
X-Gm-Message-State: APjAAAWHDbNC7mUEBRahIuZvWhrekqU1nSlPs9k0RHnLQhje+I5za/LR
 etPR7PXH30YKQ3b5xPOae7NhXYocV10=
X-Google-Smtp-Source: APXvYqyHiiXL9aSSeciWtvt7eJEPiG0mqTQcFwcNo3R/9Cd68g8Sk0fd40rp+m1hJ8v0zQ3V5PqzJA==
X-Received: by 2002:a17:90a:a605:: with SMTP id
 c5mr37320455pjq.28.1571059316820; 
 Mon, 14 Oct 2019 06:21:56 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id i187sm9322548pfc.177.2019.10.14.06.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 06:21:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/2] fsi: aspeed: Add trace when error occurs
Date: Mon, 14 Oct 2019 23:51:40 +1030
Message-Id: <20191014132140.7618-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014132140.7618-1-joel@jms.id.au>
References: <20191014132140.7618-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This prints out three registers in the FSI master when an error occurs.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c          |  7 +++++++
 include/trace/events/fsi_master_aspeed.h | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index d796c4012875..66657b7848de 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -251,6 +251,13 @@ static int opb_read(void __iomem *base, uint32_t addr, size_t size, u32 *out)
 static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
+	u32 mresp0, mstap0, mesrb0;
+
+	opb_read(aspeed->base, ctrl_base + FSI_MRESP0, 4, &mresp0);
+	opb_read(aspeed->base, ctrl_base + FSI_MSTAP0, 4, &mstap0);
+	opb_read(aspeed->base, ctrl_base + FSI_MESRB0, 4, &mesrb0);
+
+	trace_fsi_master_aspeed_opb_error(mresp0, mstap0, mesrb0);
 
 	if (err == -EIO) {
 		/* Check MAEB (0x70) ? */
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
index 63b9ce7f0de6..8e47637c5fb7 100644
--- a/include/trace/events/fsi_master_aspeed.h
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -54,6 +54,24 @@ TRACE_EVENT(fsi_master_aspeed_opb_write,
 		)
 	);
 
+TRACE_EVENT(fsi_master_aspeed_opb_error,
+	TP_PROTO(uint32_t mresp0, uint32_t mstap0, uint32_t mesrb0),
+	TP_ARGS(mresp0, mstap0, mesrb0),
+	TP_STRUCT__entry(
+		__field(uint32_t,  mresp0)
+		__field(uint32_t,  mstap0)
+		__field(uint32_t,  mesrb0)
+		),
+	TP_fast_assign(
+		__entry->mresp0 = mresp0;
+		__entry->mstap0 = mstap0;
+		__entry->mesrb0 = mesrb0;
+		),
+	TP_printk("mresp0 %08x mstap0 %08x mesrb0 %08x",
+		__entry->mresp0, __entry->mstap0, __entry->mesrb0
+		)
+	);
+
 #endif
 
 #include <trace/define_trace.h>
-- 
2.23.0

