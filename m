Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6E1A9BBF
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 09:27:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PC2d3mWTzDqxc
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 17:27:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PC0f2L3xzDr3D
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 17:26:10 +1000 (AEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 791E84E5E855BABD024E;
 Thu,  5 Sep 2019 15:26:04 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 5 Sep 2019
 15:25:57 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>, 
 <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
 <broonie@kernel.org>
Subject: [PATCH -next] spi: npcm-fiu: remove set but not used variable 'retlen'
Date: Thu, 5 Sep 2019 15:24:36 +0800
Message-ID: <20190905072436.23932-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: openbmc@lists.ozlabs.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

drivers/spi/spi-npcm-fiu.c: In function npcm_fiu_read:
drivers/spi/spi-npcm-fiu.c:472:9: warning:
 variable retlen set but not used [-Wunused-but-set-variable]

It is never used, so remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/spi/spi-npcm-fiu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index d9e2f58..cb52fd8 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -469,7 +469,6 @@ static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	u8 *data = op->data.buf.in;
 	int i, readlen, currlen;
-	size_t retlen = 0;
 	u8 *buf_ptr;
 	u32 addr;
 	int ret;
@@ -494,8 +493,6 @@ static int npcm_fiu_read(struct spi_mem *mem, const struct spi_mem_op *op)
 		currlen -= 16;
 	} while (currlen > 0);
 
-	retlen = i;
-
 	return 0;
 }
 
-- 
2.7.4


