Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193F4DBFF8
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 08:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJyr66xg9z30HY
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 18:07:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=zhangjialin11@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 988 seconds by postgrey-1.36 at boromir;
 Thu, 17 Mar 2022 18:06:01 AEDT
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJypx2P61z30Dh
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 18:05:53 +1100 (AEDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KJyKs1Kgsz1GBxl;
 Thu, 17 Mar 2022 14:44:17 +0800 (CST)
Received: from localhost.localdomain (10.175.103.91) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 14:49:15 +0800
From: Jialin Zhang <zhangjialin11@huawei.com>
To: <j.neuschaefer@gmx.net>, <linus.walleij@linaro.org>
Subject: [PATCH -next] pinctrl: nuvoton: Fix return value check in
 wpcm450_gpio_register()
Date: Thu, 17 Mar 2022 14:58:51 +0800
Message-ID: <20220317065851.495394-1-zhangjialin11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500021.china.huawei.com (7.185.36.109)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Mar 2022 18:06:13 +1100
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In case of error, the function devm_platform_ioremap_resource()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().

Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 661aa963e3fc..a71b684b9b44 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1019,8 +1019,9 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 	int ret;
 
 	pctrl->gpio_base = devm_platform_ioremap_resource(pdev, 0);
-	if (!pctrl->gpio_base)
-		return dev_err_probe(dev, -ENOMEM, "Resource fail for GPIO controller\n");
+	if (IS_ERR(pctrl->gpio_base))
+		return dev_err_probe(dev, PTR_ERR(pctrl->gpio_base),
+				     "Resource fail for GPIO controller\n");
 
 	device_for_each_child_node(dev, child)  {
 		void __iomem *dat = NULL;
-- 
2.25.1

