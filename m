Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE014901F2
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 07:27:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jchlb6XJBz2ynQ
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 17:27:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256 header.s=security header.b=H37+A631;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.18; helo=segapp02.wistron.com;
 envelope-from=lulu_su@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=wistron.com header.i=@wistron.com header.a=rsa-sha256
 header.s=security header.b=H37+A631; dkim-atps=neutral
X-Greylist: delayed 396 seconds by postgrey-1.36 at boromir;
 Fri, 14 Jan 2022 14:35:42 AEDT
Received: from segapp02.wistron.com (segapp01.wistron.com [103.200.3.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZn4t5gGWz2xBk
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 14:35:41 +1100 (AEDT)
Received: from EXCHAPP04.whq.wistron (unknown [10.37.38.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by segapp02.wistron.com (MTA) with ESMTPS id 4JZmvz08dmzMpvk5;
 Fri, 14 Jan 2022 11:27:59 +0800 (CST)
x-scoring-category: 1 100
Received: from EXCHAPP04.whq.wistron (10.37.38.27) by EXCHAPP04.whq.wistron
 (10.37.38.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 14 Jan
 2022 11:27:56 +0800
Received: from gitserver.wistron.com (10.37.38.240) by EXCHAPP04.whq.wistron
 (10.37.38.27) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 14 Jan 2022 11:27:56 +0800
From: Lulu Su <Lulu_Su@wistron.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.4 v1] hwmon: (pmbus) Add a PMBUS_NO_CAPABILITY
 platform data flag
Date: Fri, 14 Jan 2022 11:27:08 +0800
Message-ID: <20220114032708.2532-1-Lulu_Su@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 79961A6ED3178AD3CC92295669A34E92B44541B6AAE2433613B9058FA075B21A2000:8
x-msw-jemd-scanning-scores: mailshell=1
X-OriginalId: qf20EBRxpi024900
x-msw-jemd-newsletter: false
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wistron.com; s=security;
 t=1642130940; bh=8EcKTubOVgzJc/eKnwvl1uED46J6h6mqXXSlTKLEem4=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=H37+A631V5FKqQsUfIjr8tJ8j2JNxLE9cwNxrrrTL+B3JfruoGgR2HjlLqAe5O50c
 jP/cKHS68XDWlt11DpyW8f86ybvM4q8GIncRYKM294bHVkT2iA45aJWZ6qVJVa3eSR
 kULO6xrdlraFUglqoQFOYz3va0C0F4n2leqd20nw=
X-Mailman-Approved-At: Mon, 17 Jan 2022 17:27:04 +1100
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
Cc: Eddie James <eajames@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eddie James <eajames@linux.ibm.com>

Some PMBus chips don't respond with valid data when reading the
CAPABILITY register. Add a flag that device drivers can set so
that the PMBus core driver doesn't use CAPABILITY to determine it's
behavior.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/20201222152640.27749-2-eajames@linux.ibm.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit e5befc024cb4515d815662ed8746712cc5366bfc)
---
 drivers/hwmon/pmbus/pmbus_core.c | 8 +++++---
 include/linux/pmbus.h            | 9 +++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index f7fc388..0f381558 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2156,9 +2156,11 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	}
 
 	/* Enable PEC if the controller supports it */
-	ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-	if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
-		client->flags |= I2C_CLIENT_PEC;
+	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
+		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
+		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
+			client->flags |= I2C_CLIENT_PEC;
+	}
 
 	if (data->info->pages)
 		pmbus_clear_faults(client);
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 08468fc..74e1be0 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -25,6 +25,15 @@
  */
 #define PMBUS_SKIP_STATUS_CHECK	(1 << 0)
 
+/*
+ * PMBUS_NO_CAPABILITY
+ *
+ * Some PMBus chips don't respond with valid data when reading the CAPABILITY
+ * register. For such chips, this flag should be set so that the PMBus core
+ * driver doesn't use CAPABILITY to determine it's behavior.
+ */
+#define PMBUS_NO_CAPABILITY			BIT(2)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 
-- 
2.7.4


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------

