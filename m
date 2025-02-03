Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA87A26108
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 18:11:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmtMJ4SZ1z3bSm
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 04:11:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738602697;
	cv=none; b=TZtMm6/ZlhMaxDtoOmrzddMln2okM97MopPRmBSabyqGaWC4EHiEOb8PpPV+13HGZNbsBrxhvGVp5OLXS/11i7Y87yGk7THOxaETR/plyRycxL0XJZWm/2Zyih+9vgDk7oX+TRoOLa0NeMUAfRhuV3cjK9DqQ7UPa0kh9YAbvrnVQVJKVUUT1C9fT1Nc2tN1zf1YT5G4GT9u83KEfQyE1op6DkjqTTsJhMHkz/UCl1yqK2XzyRAgD4v1epzQa1CzFOKJTowxmEBAfVb9pXUwMALpvK8G9o7VN1vxdCCrfrLIsXCFJGrgYCgVMDTndRHpdyGJjZ7+vggn3P3Q+Gws8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738602697; c=relaxed/relaxed;
	bh=9xu+YDBL2l2DPc10DmG5NY0v5SBiy6SLrdNt9WjmlyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FwZZk3NQxhxkceFg6sptWUX7YzY1pRPK+4Rgim4NZk6Bp1UaKrmJo/dMD4vRRbqxePydEOgeRbZuMd0JyKQ04BNs0CRHWCLQnfOoTLat4z7yoMPdu4796+okuW3LpP9l8nG2uaqei9ST6rXj9lDnWrlLXAd+e5RJOm0Yiymg6BaQEqJsn646/kPgERH7R2PvMc7cluQYWyu3F/RzGG4FrLPzeBjAo23KuVL8Zaxu5Rd/KqjGquP5aFgFFn66WC6T9DmvIBO7v2+R9rJP8+An60anaP0MfDyRwnP8LHuSMtUUgo/C8K36TUmDpp6sn9/sUUY3YOQHOXtwh5yjX/muQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
X-Greylist: delayed 3378 seconds by postgrey-1.37 at boromir; Tue, 04 Feb 2025 04:11:29 AEDT
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmtM5457Pz2xjd
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 04:11:29 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 513GEwU5006474
	for <openbmc@lists.ozlabs.org>; Mon, 3 Feb 2025 18:14:59 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.43; Mon, 3 Feb
 2025 18:14:58 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Feb
 2025 00:14:56 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Feb 2025 00:14:56 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 485205F635;
	Mon,  3 Feb 2025 18:14:55 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 3E787DC3313; Mon,  3 Feb 2025 18:14:55 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-6.6 v1 1/8] i2c: Remove redundant comparison in npcm_i2c_reg_slave
Date: Mon, 3 Feb 2025 18:14:43 +0200
Message-ID: <20250203161450.265480-2-tmaimon77@gmail.com>
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Joel Stanley <joel@jms.id.au>, Rand Deeb <rand.sec96@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Rand Deeb <rand.sec96@gmail.com>

In the npcm_i2c_reg_slave() function, there was a redundant
comparison that checked if 'bus->slave' was null immediately after
assigning it the 'client' value. There were concerns about a
potential null dereference because of `client->adapter`, but
according to Wolfram Sang, "we trusted ourselves here" Therefore,
this comparison is unnecessary.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index ae4bae63ad4f..a28699b680f7 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1265,9 +1265,6 @@ static int npcm_i2c_reg_slave(struct i2c_client *client)
 
 	bus->slave = client;
 
-	if (!bus->slave)
-		return -EINVAL;
-
 	if (client->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
-- 
2.34.1

