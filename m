Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5589622A61
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 12:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6jLM30QGz3cJq
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 22:24:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=yuancan@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6jKy28p7z2yy7
	for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2022 22:24:33 +1100 (AEDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N6jGC3d78zJnWM;
	Wed,  9 Nov 2022 19:21:23 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 9 Nov
 2022 19:24:24 +0800
From: Yuan Can <yuancan@huawei.com>
To: <avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<wsa@kernel.org>, <andriy.shevchenko@linux.intel.com>,
	<openbmc@lists.ozlabs.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH] i2c: npcm7xx: Fix error handling in npcm_i2c_init()
Date: Wed, 9 Nov 2022 11:22:50 +0000
Message-ID: <20221109112250.124829-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Cc: yuancan@huawei.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A problem about i2c-npcm7xx create debugfs failed is triggered with the
following log given:

 [  173.827310] debugfs: Directory 'npcm_i2c' with parent '/' already present!

The reason is that npcm_i2c_init() returns platform_driver_register()
directly without checking its return value, if platform_driver_register()
failed, it returns without destroy the newly created debugfs, resulting
the debugfs of npcm_i2c can never be created later.

 npcm_i2c_init()
   debugfs_create_dir() # create debugfs directory
   platform_driver_register()
     driver_register()
       bus_add_driver()
         priv = kzalloc(...) # OOM happened
   # return without destroy debugfs directory

Fix by removing debugfs when platform_driver_register() returns error.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 0c365b57d957..83457359ec45 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2393,8 +2393,17 @@ static struct platform_driver npcm_i2c_bus_driver = {
 
 static int __init npcm_i2c_init(void)
 {
+	int ret;
+
 	npcm_i2c_debugfs_dir = debugfs_create_dir("npcm_i2c", NULL);
-	return platform_driver_register(&npcm_i2c_bus_driver);
+
+	ret = platform_driver_register(&npcm_i2c_bus_driver);
+	if (ret) {
+		debugfs_remove_recursive(npcm_i2c_debugfs_dir);
+		return ret;
+	}
+
+	return 0;
 }
 module_init(npcm_i2c_init);
 
-- 
2.17.1

