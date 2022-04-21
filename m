Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7042150EE76
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:05:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQFM20hBz3bdC
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:05:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wupeng58@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1069 seconds by postgrey-1.36 at boromir;
 Thu, 21 Apr 2022 16:15:55 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkS2z4Bzzz2xCp
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 16:15:51 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KkRdG3fCrz1J9vy;
 Thu, 21 Apr 2022 13:57:06 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500023.china.huawei.com
 (7.185.36.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 13:57:52 +0800
From: Peng Wu <wupeng58@huawei.com>
To: <j.neuschaefer@gmx.net>, <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: nuvoton: Add missing fwnode_handle_put in
 wpcm450_gpio_register
Date: Thu, 21 Apr 2022 05:53:56 +0000
Message-ID: <20220421055356.8163-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
Cc: wupeng58@huawei.com, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
 liwei391@huawei.com, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In one of the error paths of the device_for_each_child_node() loop
in wpcm450_gpio_register, add missing call to fwnode_handle_put.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 0dbeb91f0bf2..de4388b512d7 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1038,15 +1038,19 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 			continue;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(child);
 			return ret;
+		}
 
 		gpio = &pctrl->gpio_bank[reg];
 		gpio->pctrl = pctrl;
 
-		if (reg >= WPCM450_NUM_BANKS)
+		if (reg >= WPCM450_NUM_BANKS) {
+			fwnode_handle_put(child);
 			return dev_err_probe(dev, -EINVAL,
-					     "GPIO index %d out of range!\n", reg);
+					"GPIO index %d out of range!\n", reg);
+		}
 
 		bank = &wpcm450_banks[reg];
 		gpio->bank = bank;
@@ -1060,8 +1064,10 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		}
 		ret = bgpio_init(&gpio->gc, dev, 4,
 				 dat, set, NULL, dirout, NULL, flags);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(child);
 			return dev_err_probe(dev, ret, "GPIO initialization failed\n");
+		}
 
 		gpio->gc.ngpio = bank->length;
 		gpio->gc.set_config = wpcm450_gpio_set_config;
@@ -1074,8 +1080,11 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		girq->parent_handler = wpcm450_gpio_irqhandler;
 		girq->parents = devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
 					     sizeof(*girq->parents), GFP_KERNEL);
-		if (!girq->parents)
+		if (!girq->parents) {
+			fwnode_handle_put(child);
 			return -ENOMEM;
+		}
+
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_bad_irq;
 
@@ -1091,8 +1100,10 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		}
 
 		ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(child);
 			return dev_err_probe(dev, ret, "Failed to add GPIO chip\n");
+		}
 	}
 
 	return 0;
-- 
2.17.1

