Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28480467018
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 03:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4xqD6nkYz30Hr
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 13:39:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Xt7MzYO3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3-ykpyqckb7gqsgafclemmejc.amkmnclzkajgqrq.mxjyzq.mpe@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Xt7MzYO3; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4xnS0x8Pz2ywZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 13:37:48 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id
 d9-20020a251d09000000b005c208092922so3620827ybd.20
 for <openbmc@lists.ozlabs.org>; Thu, 02 Dec 2021 18:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=+wFTtvlBsypOIxUwrXusJb0tjD/aJF4yN76zKAQ13mg=;
 b=Xt7MzYO3v/bRasrX9w7a47HtnQLDghV/M1u4UAfzoIM7Gwd7vMjZL09IkLQ+VAgqRi
 j1Z+inu5UwPpvTrW4MPQTDeKUVN//EDHNNnl0LdSborNpfMKfSnkLC+EsZjNnYt691Vc
 lvR0dRonxqNafyFwogHxYA6C5E59f5YgeuCxrgzSH1/G9rb0CrUE1yNvplA0/rz9oC84
 S6yKzne8BJLcwCGOlRiRnhSh8nuHL1kOnPl62I2fuM+IER0UF+YGXcNBdHZqVHyNyfz7
 0cPj8ELpgjd37Fx5ykBclsOkCHMM7KhkjcH8Y2dwzm15cmlyMG1BlKaq1yX7tD8+tJ9t
 LJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+wFTtvlBsypOIxUwrXusJb0tjD/aJF4yN76zKAQ13mg=;
 b=H01eJtvbIDZrQnD6hXCpfolnUEjj5qqR4iU+VXSpteLrrFuv5x+WCrQtJOhPMv+x9a
 AOihuUpKKWGFGZOdDrkzzGjgjAIqod92+n0srtqjIlrIEUu6bhlpVeI/mDLbPWxdXhuD
 wcozJRRZu4ont2Njs4HW0TouE3jO6KJjdXDaYTcIsDLOcRh6ahBNa9kBBS01u9ZNb909
 dXQXQGx8C67VGL34oc+/z1r0kKtJgfG0p98rfyfulZegS3Go3B0mzz9rPQWeaa+ZM/CA
 Hvte8Uvj8eVDIaaBVBkbHoaj7CK+zDdNPtkC6CKJkukc1TOogiSEOP4EgzjsTNXLGaMI
 056A==
X-Gm-Message-State: AOAM533bzjRns4eQYHhGzz5pdCdby0uN2Ce/ewU1y22gs8BvybXhfFes
 dT4JFbdXT9oWzgCAaB/+SBcw06fo8qfv
X-Google-Smtp-Source: ABdhPJyAXcscghDoENH07S/43gSKtbux83/rys5yj/UxH0ZoJhfg/cUXH8BbweI9XPBZR6nDR5XJxUPVWpNC
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:bc47:f5e4:20fa:844b])
 (user=suichen job=sendgmr) by 2002:a25:d9c5:: with SMTP id
 q188mr20212190ybg.630.1638499065976; Thu, 02 Dec 2021 18:37:45 -0800 (PST)
Date: Thu,  2 Dec 2021 18:37:27 -0800
In-Reply-To: <20211203023728.3699610-1-suichen@google.com>
Message-Id: <20211203023728.3699610-3-suichen@google.com>
Mime-Version: 1.0
References: <20211203023728.3699610-1-suichen@google.com>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
Subject: [RFC Patch v2 2/3] i2c: npcm7xx: add tx_complete counter
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
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org,
 joe@perches.com
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
index 2ad166355ec9b..0b87706de31d7 100644
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
+            bus->tx_complete_cnt++;
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
2.34.0.384.gca35af8252-goog

