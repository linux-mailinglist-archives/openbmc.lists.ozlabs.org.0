Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A902738FE
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:58:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwQxC5fjbzDqjV
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 12:58:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=miaoqinglang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw4ZF2bZJzDqQK
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 23:10:59 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EAFC137D5C4A578F6FB8;
 Mon, 21 Sep 2020 21:10:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:42 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 "Mark Brown" <broonie@kernel.org>
Subject: [PATCH -next] spi: npcm-fiu: simplify the return expression of
 npcm_fiu_probe()
Date: Mon, 21 Sep 2020 21:11:06 +0800
Message-ID: <20200921131106.93228-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 12:55:31 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Qinglang Miao <miaoqinglang@huawei.com>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/spi/spi-npcm-fiu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
index 9468e71f0..341f7cffe 100644
--- a/drivers/spi/spi-npcm-fiu.c
+++ b/drivers/spi/spi-npcm-fiu.c
@@ -677,7 +677,6 @@ static int npcm_fiu_probe(struct platform_device *pdev)
 	struct npcm_fiu_spi *fiu;
 	void __iomem *regbase;
 	struct resource *res;
-	int ret;
 	int id;
 
 	ctrl = spi_alloc_master(dev, sizeof(*fiu));
@@ -736,11 +735,7 @@ static int npcm_fiu_probe(struct platform_device *pdev)
 	ctrl->num_chipselect = fiu->info->max_cs;
 	ctrl->dev.of_node = dev->of_node;
 
-	ret = devm_spi_register_master(dev, ctrl);
-	if (ret)
-		return ret;
-
-	return 0;
+	return devm_spi_register_master(dev, ctrl);
 }
 
 static int npcm_fiu_remove(struct platform_device *pdev)
-- 
2.23.0

