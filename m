Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF469A078C
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 12:37:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT6qW1qckz3cKV
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2024 21:37:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729075060;
	cv=none; b=CKYfJpAfpDojo8H6q0aiKtqWu+AY8lKO8u5iuxMnRPfly9slM0yY+9sRehYezzPAQvnspheFkF47zilQiL+rJ5YM43JG3gXnfIjE3CWeMibJ8LL4G2Xs53sa7nhJX5RaJCaULVVbA2svK0UQsiMVfrkdrBHXUsuz+Ea6qtRy0W2lZfjxOD7LPIp2oyRkSChnYSiCuFRPYkca1pVq4/nsDUdLHVOO6canlaqrMKGJ9u9oILGxRMCBIS4QvRlAVlGl5vHQWQGr1oAMFYBW37mVLaEZaYomD7RqIzw+TQB2HUXVKWFGsDulsF6xkKOXMCF4Nsx7bCAUxGSLWZxXcBymyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729075060; c=relaxed/relaxed;
	bh=zgUnqloRKSyZaJcKphfH6p/0KKEYI6pLW6VqktiakxU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VlhRrzLOqGgFc6Hqcx6MwNdOcclW/OzVanm8gBgylnVEWH6jFqd4TU5Vb+1Sdg+L9xVyFVQP9uZsYAwBQUKo/WUFlbPKXbeXFFkOA7KwIVqunZKAKGADQEIBFMTR9ayC8Pu0f7j7dJQMV2RmM024f9f9nxFtI8sAjKGDPxreyYEzl3b05LjUN42pTjHi2SdZAA5FmP5nGkySkA5i+Sutd8el3BZY/hzwKSSdxN28HWo942yq4vwZJw6Kix3uMWWsT0XE5gmC0dKBFExeTyGZ5NezGo3oNbEeWSoO329qfBttAJOjLAlYCEFQWPT5EJH3jTLETj1Pao+Ija0JsMcWGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yuehaibing@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=yuehaibing@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1132 seconds by postgrey-1.37 at boromir; Wed, 16 Oct 2024 21:37:39 AEDT
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT6qR1Mqlz2xrk
	for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2024 21:37:36 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XT6Lg55fGz10N33;
	Wed, 16 Oct 2024 18:16:11 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 75CBA180106;
	Wed, 16 Oct 2024 18:18:04 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 16 Oct
 2024 18:18:03 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nuvoton: npcm8xx: Fix error handling in npcm8xx_gpio_fw()
Date: Wed, 16 Oct 2024 18:35:18 +0800
Message-ID: <20241016103518.3499455-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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

