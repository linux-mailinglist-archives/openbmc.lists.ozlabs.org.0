Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 586CF47C53C
	for <lists+openbmc@lfdr.de>; Tue, 21 Dec 2021 18:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJP4y0yFSz306R
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 04:45:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ETNvHd81;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3frlcyqckb74wymglirksskpi.gsqstirfqgpmwxw.s3pefw.svk@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=ETNvHd81; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJP3M0L9sz2ywn
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 04:44:31 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id
 l75-20020a25254e000000b005f763be2fecso26964519ybl.7
 for <openbmc@lists.ozlabs.org>; Tue, 21 Dec 2021 09:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HkXdeoDDS4XC9WW1t3ovXGQdnbI8L5ktylsEwvM1dMc=;
 b=ETNvHd8111/hLG/3/ROxw3sC6AqMoWNtx1W2oVtJKNsM5tdBbnLwCpLxyxBEpJxoOK
 pcCq+L1AMUhQf10lvFRHOysRre6GXkZ6InOGARh3EmPwaQJHqa1oPFo6aUyC+am5vibq
 DC25E2eGr5Ts4/9M5el+gPDxxPgakEGZOE5zNfGkkC/R6jZsnAaLha0n90XkOPmEr4gA
 DnulDSw9hJApvOFHNlTlCC19SxtmbHfC0x0vTSoVY9dgY98mJKoXTW48nk8dxV1zwI31
 pI0Y3fJGBcjBJ4uunsi9ZWaoixmMab4ug8sqWtWCK5UFCoNI51jcBqR8tIYXceRTMa8N
 XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HkXdeoDDS4XC9WW1t3ovXGQdnbI8L5ktylsEwvM1dMc=;
 b=dx2OV11PV8+G8W8H0i+V4ZrY+tdBnh+dJ01BpDaZOYsByzze9NyfLz2/d5YL3n5nFq
 vRC6farz2WDM2LDlWifcTcOfMHRlARi6vZiawczAKUErKHdpygRqmWcip7F70dq2915I
 udD/R3xwZ+hj/mbHDCzVX6mbcB3txtQdoU4I+/vsdHuNtz7qwQVMbdFxjCFl5Qm6Bw62
 O+DfJEK26Cuh8TbyJsJR0RcfkcF9df7rznwS0VKTUf+1a5vLXPu7tDAA0dSx9u40r3TP
 lGbT+UWYpDQY0X4g0HFyfSmX+p35hDa+iakLmwlORyF+r2gXnYJEIR0+lkA6xMFNy+ZD
 AvYA==
X-Gm-Message-State: AOAM530Bc3b5qiWAkJsz+AbtN6XBXQk3qcJtsHiOanCmEh4uL8xJM1ef
 K65aXDxYrr29bfblNqzgNmAV8LYGCi0d
X-Google-Smtp-Source: ABdhPJwCJM4EkwOClyVAfTDeoeRC4+/Y03u13sQX/1lpfnuJre5DLbkFg1YukGstywgAkyz6SQT6mUZi0gzY
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a25:bfd2:: with SMTP id
 q18mr6304044ybm.542.1640108669011; Tue, 21 Dec 2021 09:44:29 -0800 (PST)
Date: Tue, 21 Dec 2021 09:43:43 -0800
In-Reply-To: <20211221174344.1249202-1-suichen@google.com>
Message-Id: <20211221174344.1249202-3-suichen@google.com>
Mime-Version: 1.0
References: <20211221174344.1249202-1-suichen@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 2/3] i2c: npcm7xx: add tx_complete counter
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Add tx_copmplete counter which increments when a
valid transaction completes.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 2ad166355ec9b..cc7abd0b870be 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -314,6 +314,7 @@ struct npcm_i2c {
 	u64 rec_fail_cnt;
 	u64 nack_cnt;
 	u64 timeout_cnt;
+	u64 tx_complete_cnt;
 };
 
 static inline void npcm_i2c_select_bank(struct npcm_i2c *bus,
@@ -684,6 +685,8 @@ static void npcm_i2c_callback(struct npcm_i2c *bus,
 	switch (op_status) {
 	case I2C_MASTER_DONE_IND:
 		bus->cmd_err = bus->msgs_num;
+		if (bus->tx_complete_cnt < ULLONG_MAX)
+			bus->tx_complete_cnt++;
 		fallthrough;
 	case I2C_BLOCK_BYTES_ERR_IND:
 		/* Master tx finished and all transmit bytes were sent */
@@ -2223,6 +2226,7 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
 	debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
+	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
 	bus->debugfs = d;
 }
-- 
2.34.1.307.g9b7440fafd-goog

