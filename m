Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B246701A
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 03:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4xqv5hCJz3bT7
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 13:39:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Xnx6dEs6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3_ikpyqckb7stvjdifohpphmf.dpnpqfocndmjtut.p0mbct.psh@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Xnx6dEs6; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4xnW04jdz2ywZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 13:37:50 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id
 v20-20020a25fc14000000b005c2109e5ad1so3707936ybd.9
 for <openbmc@lists.ozlabs.org>; Thu, 02 Dec 2021 18:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fSw1ht/VcZ3dSf5YuPKT0BcZLwiLH8OOB5DtUZgNMMw=;
 b=Xnx6dEs6acvz81QlVuLmXZMWgzDXPNak7TnUiGkbMVubfP4OHilSQf/RxSCgL9k2uw
 S4MeHA2mRv4qVUg/RuE56bCmds4fm/4WSajSpH+WnGGC96iFY/TOOazGhjlAfd1z2SE5
 YqSe/e+hO9lnRg2//z0getll7GikcejkXDSP25pni+r08TnieVWRY/4ZF+qaIYyy2zGF
 zIhHnlJTSZaONZ19tscSkuu6yi6U1SQ8YEok5g9ro2NL/fY36DfMgKf28vLgSVuGCsHy
 //XXyrLNu4HakZ9ZMmAraZk84/T4sqOKk9LOkbX7mXP5086m+hWgI5Zrr422UwLZTf2B
 HnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fSw1ht/VcZ3dSf5YuPKT0BcZLwiLH8OOB5DtUZgNMMw=;
 b=sPtSQCavrqoOXrlkaTc6/+CNjCIthzb1GlWJqPWfKYLn3T6muB6SnINuSFa8d6PQ6T
 634qkBn4XGOIYtlWScOiIDRZ07rM4x/mnfxxoW35R5VPwvoJ9hwLAYLhElayP/BfRxq1
 ZP5CwqL8o1DVdK/jpTNIRQ4gkMGJLNlR6WjZNEVhMsIb2OvE95PwM/F2xWV+F1F8hbz0
 PhJvUTNrEjeztrjtRGNZUED1BhGG6pH/qTQb9icXhQJtKD+j6mmnNrHfHoWhF5PKic9e
 BbA8dThBIiFJ0Gs6RQtGo3ZAETtIOuCqoQHWHhAN9La/ur4s2HmTc1lDmA74GukCN+Q7
 +36Q==
X-Gm-Message-State: AOAM532EnYsWpQfIRK+ruxP/dsHKQoLj1rqeUQ0gBb1dZftIp6Yr5mve
 gKy6hpM2CrS6MjccUAMQb1U16T7zCjlh
X-Google-Smtp-Source: ABdhPJwnEfF+Irtkf60aNMSjduABvwU4/QHaaj4fyZOSZiapm3CEKdh0zg13dyEc38z3JrO0bwhfaVrzC6Qa
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:bc47:f5e4:20fa:844b])
 (user=suichen job=sendgmr) by 2002:a25:abcb:: with SMTP id
 v69mr19365697ybi.628.1638499068416; Thu, 02 Dec 2021 18:37:48 -0800 (PST)
Date: Thu,  2 Dec 2021 18:37:28 -0800
In-Reply-To: <20211203023728.3699610-1-suichen@google.com>
Message-Id: <20211203023728.3699610-4-suichen@google.com>
Mime-Version: 1.0
References: <20211203023728.3699610-1-suichen@google.com>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
Subject: [RFC Patch v2 3/3] add npcm7xx debug counters as sysfs attributes
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
 joe@perches.com, Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change adds npcm7xx debug counters as sysfs attributes using the
i2c_adapter_stats_register_counter function.

Signed-off-by: Sui Chen <suichen@google.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 0b87706de31d7..1268b2d71ca0a 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2228,6 +2228,15 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 	debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
 	debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_cnt);
 
+	/* register debug counters in sysfs */
+	i2c_adapter_stats_register_counter(&bus->adap, "ber_cnt", &bus->ber_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "nack_cnt", &bus->nack_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "rec_succ_cnt", &bus->rec_succ_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "rec_fail_cnt", &bus->rec_fail_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "timeout_cnt", &bus->timeout_cnt);
+	i2c_adapter_stats_register_counter(&bus->adap, "i2c_speed", &bus->bus_freq);
+	i2c_adapter_stats_register_counter(&bus->adap, "tx_complete_cnt", &bus->tx_complete_cnt);
+
 	bus->debugfs = d;
 }
 
-- 
2.34.0.384.gca35af8252-goog

