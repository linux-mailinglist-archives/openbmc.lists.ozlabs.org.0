Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD65ED306
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 04:22:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McgJ73BSXz3bl4
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 12:22:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=yuancan@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McLQY2SHKz3blg
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 23:42:13 +1000 (AEST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4McLJy0LKczHtgR;
	Tue, 27 Sep 2022 21:37:22 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:42:08 +0800
From: Yuan Can <yuancan@huawei.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>
Subject: [PATCH] clk: clk-npcm7xx: Remove unused struct npcm7xx_clk_gate_data and npcm7xx_clk_div_fixed_data
Date: Tue, 27 Sep 2022 13:39:31 +0000
Message-ID: <20220927133931.104060-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 28 Sep 2022 12:19:09 +1000
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
Cc: yuancan@huawei.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

After commit 6a5898411159("clk: clk-npcm7xx: Remove unused static const tables
'npcm7xx_gates' and 'npcm7xx_divs_fx'"), no one use struct
npcm7xx_clk_gate_data and struct npcm7xx_clk_div_fixed_data, so remove them.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/clk/clk-npcm7xx.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index e677bb5a784b..e319cfa51a8a 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -129,20 +129,6 @@ npcm7xx_clk_register_pll(void __iomem *pllcon, const char *name,
 #define NPCM7XX_SECCNT          (0x68)
 #define NPCM7XX_CNTR25M         (0x6C)
 
-struct npcm7xx_clk_gate_data {
-	u32 reg;
-	u8 bit_idx;
-	const char *name;
-	const char *parent_name;
-	unsigned long flags;
-	/*
-	 * If this clock is exported via DT, set onecell_idx to constant
-	 * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h for
-	 * this specific clock.  Otherwise, set to -1.
-	 */
-	int onecell_idx;
-};
-
 struct npcm7xx_clk_mux_data {
 	u8 shift;
 	u8 mask;
@@ -160,21 +146,6 @@ struct npcm7xx_clk_mux_data {
 
 };
 
-struct npcm7xx_clk_div_fixed_data {
-	u8 mult;
-	u8 div;
-	const char *name;
-	const char *parent_name;
-	u8 clk_divider_flags;
-	/*
-	 * If this clock is exported via DT, set onecell_idx to constant
-	 * defined in include/dt-bindings/clock/nuvoton, NPCM7XX-clock.h for
-	 * this specific clock.  Otherwise, set to -1.
-	 */
-	int onecell_idx;
-};
-
-
 struct npcm7xx_clk_div_data {
 	u32 reg;
 	u8 shift;
-- 
2.17.1

