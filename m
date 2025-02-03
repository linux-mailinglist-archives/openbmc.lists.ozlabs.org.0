Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C3A2610B
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 18:12:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmtMQ2C0Xz3fT0
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 04:11:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738602703;
	cv=none; b=PUTCQ1I8Mp50XSvznxYxiIbzpDA07k29LjR/yTpZUK7JSt+FnZiYES5x6HDZeEiYp5n+S2U1gVPP+AZEno6sXU6dDdgfAkXZ4Kg++hC3ZoD8rNqLoIMjofQqvpi7AawGFZMAKkKYwirvRb6L1LvqbxIGbbWkcxtqNnEorRFDuX8xIRm7PaOrBvaYe2ydoxcK7OnMMfq02O9ZUmD6nxxqx/eq4rlTS99SUbQyWJXQF4dfzc/twiV71j1wt9zrGl0NZqgIbLta2gPpu0w+npMCzyDpwxo/l0m/qgfwQWtMr1LH/+95iSQlLsYnfpyTQTvPhXJNBbyzHmMHqGQ2UOzT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738602703; c=relaxed/relaxed;
	bh=t+B9tPJaxDDUfHD9tOuMdNvzsOLRdelba8UC6PzaTDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f8uFDjEKfYb7Psy+W965mjW4sFlELg5X7iqD/RiWFC/hhPlsDHl+owIYhMH6mutqxoUDq7b/2K2g335QQgdp2EoNqoBBYh6KM2emsWjv5gYu8pCxBOb3v4tudx0U9ys5HLY9ATA8od/NEFzuYcGz39Cp695sGFrnI2tE5FgWN+0aimjCiHzQJKADPlig8A+IHh4k41p1I8WlCfKbb0HifS07lc9R2/Aa0OFGcFrraIfURTQW0lIC2pXac8MrtmBJc2DoTkvPH/lg5pQlN9TtZWbwsIP1JfOm+imZTgMhr4HLlpxVZtzdI0dIv7E/OU3IWnoruLprnykwMEPq8lt/mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmtMK6q0fz2yVF
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 04:11:41 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 513GExET006481
	for <openbmc@lists.ozlabs.org>; Mon, 3 Feb 2025 18:15:00 +0200
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Mon, 3 Feb
 2025 18:14:58 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 00:14:56 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 00:14:56 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 4D3E15F64B;
	Mon,  3 Feb 2025 18:14:55 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 47EFADC331A; Mon,  3 Feb 2025 18:14:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 2/8] i2c: npcm: restore slave addresses array length
Date: Mon, 3 Feb 2025 18:14:44 +0200
Message-ID: <20250203161450.265480-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203161450.265480-1-tmaimon77@gmail.com>
References: <20250203161450.265480-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,KHOP_HELO_FCRDNS,MAY_BE_FORGED,
	NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>, Dan
 Carpenter <dan.carpenter@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <= 9".
The original design supports 10 target addresses although only 2
addresses are required for current implementation.

Restore the npcm_i2caddr array length to fix the smatch warning.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index a28699b680f7..83a7b7577dcc 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -136,11 +136,13 @@ enum i2c_addr {
  * Since the addr regs are sprinkled all over the address space,
  * use this array to get the address or each register.
  */
-#define I2C_NUM_OWN_ADDR 2
+#define I2C_NUM_OWN_ADDR 10
 #define I2C_NUM_OWN_ADDR_SUPPORTED 2
 
 static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
-	NPCM_I2CADDR1, NPCM_I2CADDR2,
+	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
+	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
+	NPCM_I2CADDR9, NPCM_I2CADDR10,
 };
 #endif
 
-- 
2.34.1

