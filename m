Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2926347C540
	for <lists+openbmc@lfdr.de>; Tue, 21 Dec 2021 18:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJP5d6q8cz30Qx
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 04:46:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GiDwlFY4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3gblcyqckb8ez1pjolunvvnsl.jvtvwluitjspz0z.v6shiz.vyn@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=GiDwlFY4; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJP3Q4NnQz303H
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 04:44:34 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id
 b4-20020a17090a6e0400b001b179d36a57so2090883pjk.6
 for <openbmc@lists.ozlabs.org>; Tue, 21 Dec 2021 09:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=yQVcC55OoadpUPJm5lgEHKled6Uu3AS/23JgHN3JweM=;
 b=GiDwlFY4PevNZXTZxjYnA+LOJzLzost4vNTVzsrNvamLrnwxkYJYAaMz4PD5VxO/tq
 fXiy+gfDB17AzOm9ExFT9g4+nJMacXzvQmHqhjP1i2CrisMeEvfX7zcFqxRtGF/i38x5
 DbDdCZEdrp8ldNKoPo/hCA3DepLd8fQ882lLlCSRVrU4P44PKojnydVKH/7l/jMOAeJ4
 /2BuLQt3Nh8bFYth2C+kGhwX8fh897taYbjW+WT/jfhohd4okyf4OLXhpWc8GwGcQOZo
 LJqY5OqXrioPP7FVVEor+qksnpyMr36QEDSYU0bhHD6oi1DjTcg8ZYLGjhAc+6HxEhSc
 8AyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=yQVcC55OoadpUPJm5lgEHKled6Uu3AS/23JgHN3JweM=;
 b=Rbc3zj6p/q18XNJQvPIDqiWJH8JEtBjjeBt/cr2j15JBH6bGR9FdLbiQRmd/rOhGg9
 uJNuAxjmD3vwjCglPY9tJsLgASc7qVJ/OMAC7NzzxIjhs5vAN0DvLwVR2kNl/TnYOB70
 x5nTLGNGIa/8EJbsWjChdrIVusToNFk+MYVYZKNi6BCWxdNluiY/NF6ohCgkDkpzy3eR
 vrBA1WrF7p9iVmiMa4+pdk0djx+85MWWKC0qoJl2zmE6bjRFL4OB11HGXnbxZN519FYh
 TzqOoNLO33FfsDgZUcZ0l2yyWsOfpUdbd8IsLyEEMawrWAyrKnBigj0ojek8CCoMRocr
 gsMg==
X-Gm-Message-State: AOAM532Yae/ykO3UfR0Oa851QloIvcWY2T622vMmg4OqD8lbomAqw12Z
 M/XHERCljxb9FgkclkZD4sr7pPbbmk9C
X-Google-Smtp-Source: ABdhPJy1QkR7/Vg/h/zj3GiBFEnfoUAbZdCXSJyAJqx7x75BiMeFHNxASCd5GeldXB+EfbmjW5UqUdXWfz5k
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a17:90b:798:: with SMTP id
 l24mr5338989pjz.122.1640108672149; Tue, 21 Dec 2021 09:44:32 -0800 (PST)
Date: Tue, 21 Dec 2021 09:43:44 -0800
In-Reply-To: <20211221174344.1249202-1-suichen@google.com>
Message-Id: <20211221174344.1249202-4-suichen@google.com>
Mime-Version: 1.0
References: <20211221174344.1249202-1-suichen@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 3/3] add npcm7xx debug counters as sysfs attributes
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
 Sui Chen <suichen@google.com>
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
index cc7abd0b870be..c3ba5f3d33af1 100644
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
2.34.1.307.g9b7440fafd-goog

