Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 066C5A15B33
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2025 04:18:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZhdZ3Sxvz3dRt
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2025 14:18:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.35
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737170319;
	cv=none; b=LwO4br0z7hlK1oTIeG5neuG6KctkYa3agmDyWOpe5P13E1a6es4IWB+gs9TmKgA0+bPAanNiEyW2P9vkDlS3UqLm11nP9jSejbCi914xiBZy6TxH9WcGAPO/evRuOnd9NopMisQGrGJzlHinXF5A32pONz9Z5Uz4WJUTMJwNigZ/2zzPK5fr/hs7z1TvCuBlGgRPBXbse5GON4PEc80oqRqOAlxc3YoifLSspkybMGUpYOlGXw2Rfl4rWnqRHq0GlsePPi2yXe834uQJ98AZq2VC6490R30faHEzrzU5UChEMDd7gEu/hAQJaLrIINH0XYLu/WMEQ7p3o9lWM0iAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737170319; c=relaxed/relaxed;
	bh=zgUnqloRKSyZaJcKphfH6p/0KKEYI6pLW6VqktiakxU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V5flXeMTyFjFaZNOH4oPWYnt9AIY6EGhgPyzkzteHznPQhVsiAzPx7NxTBG2RVzR4RlngvCCINBmtSoV4H0Y/98EhOKZTtwsn8f5nJi8zmTyPMoIKmeFCIUmtirCJD0NvpZAstmwcrD1FKA5OC3cMxApu2/ApeFT1cDFMuy7b2f4IDensTZE1+XO/1yBSweGYHsVWGIKO50jlFYb1CCgjf47JMsBvf2P676F9LNolF+1iRP/MN2/opMhArwBv/S4h/IJssLocnyA2VvgYjm6qDPLj27G4V7XTybmWVwKs4HwVod/sAksEAAPzQQdyeEeVSoldest9WPl3yFPC4X+4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yuehaibing@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=yuehaibing@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1070 seconds by postgrey-1.37 at boromir; Sat, 18 Jan 2025 14:18:37 AEDT
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZhdT0M0cz30Bd
	for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2025 14:18:34 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4YZh8y2zkBz1V50B;
	Sat, 18 Jan 2025 10:57:22 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id B6659180214;
	Sat, 18 Jan 2025 11:00:36 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 18 Jan
 2025 11:00:36 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>
Subject: [PATCH -next] pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()
Date: Sat, 18 Jan 2025 11:13:34 +0800
Message-ID: <20250118031334.243324-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, yuehaibing@huawei.com, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

fwnode_irq_get() was changed to not return 0, fix this by checking
for negative error, also update the error log.

Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 471f644c5eef..70e6966049e4 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2361,8 +2361,8 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 			return dev_err_probe(dev, ret, "gpio-ranges fail for GPIO bank %u\n", id);
 
 		ret = fwnode_irq_get(child, 0);
-		if (!ret)
-			return dev_err_probe(dev, ret, "No IRQ for GPIO bank %u\n", id);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to retrieve IRQ for bank %u\n", id);
 
 		pctrl->gpio_bank[id].irq = ret;
 		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
-- 
2.34.1

