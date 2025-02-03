Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C4A2610D
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 18:12:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmtMZ0dJ8z3g7L
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 04:11:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738602707;
	cv=none; b=QQZbh24LlGyJwQkqG6Q/YUb7zT04xtrxlUoodeUAOQgoqeaXiqoBoZXHT2D63YfMViJ2kXzbak1ZB5E2rE8k5w3Vdb0esF9yW+RYAvfCM/FEdAd6oBbwG1lfUUMMsOmbBvRSJWyTamnSGiWC7QRxju/2vBKxQ84AgpCWA/Ji+M2PhtWCfVJ5jZEsU2e+Gvti6M1SvX+3crIyUoG65QoPFbyl1UiFhI+WoONsEq4fK1mnikJweb33L70I/lmGj6DttR/GxszGIcZUXOkGJfgmGqDUhGW5WGhxUYVCJu2j1q9RyVTDwzwTb+GYXjyq0RW6RB+7vs8jc2w/IcN+lHo3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738602707; c=relaxed/relaxed;
	bh=zIIMJaytrUmy8HHqXq+779IWfwf6z0+NHhvnOtA535c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YCbtxOwfkwa/D2LaAJrLXyEd9MFdLc4kVGsif5aFctM3VnvGy9Pe+i5gZxDDQeF8pWlihouRuGVntbh7Eavcvs59TwbEBXBAmX+7iZpiYOOvFp2o0goKaQvLE1VgimKYr9e6NqE5HWizTjwEQc0PFx1CgzroQV03kqagcF6NEmbHPYSPPlr5PZ18fa1UFCfsUxij8oCZYWufbHOhAsX6H7RLN1aHpslMUJupbuwwyP3CiVRhP+ii1Z/Kor+04Ksgo1DnK23eLLXiC3V/CrR2KB71Q7B6GQq1y25EOMbSe9y/UQGLzxGVJfw7kVR6QWvdQp+tlPKbisBtwzcHYDunqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmtMQ50WWz3fVk
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 04:11:46 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 513GEwU6006474
	for <openbmc@lists.ozlabs.org>; Mon, 3 Feb 2025 18:14:59 +0200
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Mon, 3 Feb
 2025 18:14:58 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 00:14:56 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 00:14:56 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 4FD0E5F64D;
	Mon,  3 Feb 2025 18:14:55 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 503E7DC3281; Mon,  3 Feb 2025 18:14:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 3/8] i2c: npcm: correct the read/write operation procedure
Date: Mon, 3 Feb 2025 18:14:45 +0200
Message-ID: <20250203161450.265480-4-tmaimon77@gmail.com>
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Andi Shyti <andi.shyti@kernel.org>, Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Originally the driver uses the XMIT bit in SMBnST register to decide
the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
write operation. If it's 0, then a read operation will be executed.

In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as an indication to the current state of the state
machine during slave operation. (meaning XMIT = 1 during writing and
XMIT = 0 during reading).

In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions, the XMIT bit
cannot be trusted.

However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track what it is currently doing.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 83a7b7577dcc..608dc14593e2 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1629,13 +1629,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm_i2c *bus, u8 i2cst)
 			npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
 	/* SDA interrupt, after start\restart */
 	} else {
-		if (NPCM_I2CST_XMIT & i2cst) {
-			bus->operation = I2C_WRITE_OPER;
+		if (bus->operation == I2C_WRITE_OPER)
 			npcm_i2c_irq_master_handler_write(bus);
-		} else {
-			bus->operation = I2C_READ_OPER;
+		else if (bus->operation == I2C_READ_OPER)
 			npcm_i2c_irq_master_handler_read(bus);
-		}
 	}
 }
 
-- 
2.34.1

