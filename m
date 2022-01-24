Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C5498BE9
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 20:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjKVy01p0z3bP1
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 06:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOVZG+/4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UOVZG+/4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjKSH25CGz30Qw
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 06:15:10 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OJ4Hvk031004; 
 Mon, 24 Jan 2022 19:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=UDegzf19IJG1/2gtmhgSLFVaeJaF0agvzagsd6cYnco=;
 b=UOVZG+/4JSE66BagDeqixXpd0eV1xBq3zwHysb3kY8UwkkxXSSTUhTrw5SuvhKjueD50
 JLopxX56ddawJdVbVgQloJ0/fPWVUhUodP08MS8zU8rZthQuFh5luI2GeR8UZ9ApWYt6
 goyQ1WfG2Y9HDTNtU/GD0UjCAbn369ZIgMiBX88dR0TdtIfnNSXXxlXp3XzddEYl/mMG
 ROnFRvXoEY7m+HsLH59bgPvodTEzhwj1PiM38H2+iZA5XsCDbZupG+Zfs8iskXnGAd0M
 hTo969YUSpfUqf7asyZITSdNEV3c/FsaJanxWnveL0TIdOa+i7KToIBt3KZmbW6Pom74 uQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsyx8uj3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:07 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OJ7856021832;
 Mon, 24 Jan 2022 19:15:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3dr9j9p6qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:06 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OJF5TI13042244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 19:15:05 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBE9AC6066;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE71CC6059;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.14.245])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 19:15:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 1/6] dm: Add a No-op uclass
Date: Mon, 24 Jan 2022 13:14:58 -0600
Message-Id: <20220124191503.88452-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220124191503.88452-1-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fiBTfhOStxIIQ9_pzpCoEkXpbw5k6ySM
X-Proofpoint-ORIG-GUID: fiBTfhOStxIIQ9_pzpCoEkXpbw5k6ySM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240125
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jean-Jacques Hiblot <jjhiblot@ti.com>

This uclass is intended for devices that do not need any features from the
uclass, including binding children.
This will typically be used by devices that are used to bind child devices
but do not use dm_scan_fdt_dev() to do it. That is for example the case of
several USB wrappers that have 2 child devices (1 for device and 1 for
host) but bind only one at a any given time.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---
 arch/sandbox/dts/test.dts | 12 +++++++
 drivers/core/uclass.c     |  5 +++
 include/dm/uclass-id.h    |  1 +
 test/dm/Makefile          |  1 +
 test/dm/nop.c             | 73 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 92 insertions(+)
 create mode 100644 test/dm/nop.c

diff --git a/arch/sandbox/dts/test.dts b/arch/sandbox/dts/test.dts
index 87d8e5bcc9..b705161086 100644
--- a/arch/sandbox/dts/test.dts
+++ b/arch/sandbox/dts/test.dts
@@ -400,6 +400,18 @@
 		sandbox,silent;	/* Don't emit sounds while testing */
 	};
 
+	nop-test_0 {
+		compatible = "sandbox,nop_sandbox1";
+		nop-test_1 {
+			compatible = "sandbox,nop_sandbox2";
+			bind = "True";
+		};
+		nop-test_2 {
+			compatible = "sandbox,nop_sandbox2";
+			bind = "False";
+		};
+	};
+
 	misc-test {
 		compatible = "sandbox,misc_sandbox";
 	};
diff --git a/drivers/core/uclass.c b/drivers/core/uclass.c
index fc3157de39..dc9eb62893 100644
--- a/drivers/core/uclass.c
+++ b/drivers/core/uclass.c
@@ -757,3 +757,8 @@ int uclass_pre_remove_device(struct udevice *dev)
 	return 0;
 }
 #endif
+
+UCLASS_DRIVER(nop) = {
+	.id		= UCLASS_NOP,
+	.name		= "nop",
+};
diff --git a/include/dm/uclass-id.h b/include/dm/uclass-id.h
index 13ae6e1e4c..281c0d6ed2 100644
--- a/include/dm/uclass-id.h
+++ b/include/dm/uclass-id.h
@@ -62,6 +62,7 @@ enum uclass_id {
 	UCLASS_MMC,		/* SD / MMC card or chip */
 	UCLASS_MOD_EXP,		/* RSA Mod Exp device */
 	UCLASS_MTD,		/* Memory Technology Device (MTD) device */
+	UCLASS_NOP,		/* No-op devices */
 	UCLASS_NORTHBRIDGE,	/* Intel Northbridge / SDRAM controller */
 	UCLASS_NVME,		/* NVM Express device */
 	UCLASS_PANEL,		/* Display panel, such as an LCD */
diff --git a/test/dm/Makefile b/test/dm/Makefile
index 49857c5092..aeb3aa0ca7 100644
--- a/test/dm/Makefile
+++ b/test/dm/Makefile
@@ -3,6 +3,7 @@
 # Copyright (c) 2013 Google, Inc
 
 obj-$(CONFIG_UT_DM) += bus.o
+obj-$(CONFIG_UT_DM) += nop.o
 obj-$(CONFIG_UT_DM) += test-driver.o
 obj-$(CONFIG_UT_DM) += test-fdt.o
 obj-$(CONFIG_UT_DM) += test-main.o
diff --git a/test/dm/nop.c b/test/dm/nop.c
new file mode 100644
index 0000000000..2df29f3d15
--- /dev/null
+++ b/test/dm/nop.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Test for the NOP uclass
+ *
+ * (C) Copyright 2019 - Texas Instruments Incorporated - http://www.ti.com/
+ * Jean-Jacques Hiblot <jjhiblot@ti.com>
+ */
+
+#include <common.h>
+#include <dm.h>
+#include <dm/ofnode.h>
+#include <dm/lists.h>
+#include <dm/device.h>
+#include <dm/test.h>
+#include <misc.h>
+#include <test/ut.h>
+
+static int noptest_bind(struct udevice *parent)
+{
+	ofnode ofnode = dev_read_first_subnode(parent);
+
+	while (ofnode_valid(ofnode)) {
+		struct udevice *dev;
+		const char *bind_flag = ofnode_read_string(ofnode, "bind");
+
+		if (bind_flag && (strcmp(bind_flag, "True") == 0))
+			lists_bind_fdt(parent, ofnode, &dev, false);
+		ofnode = dev_read_next_subnode(ofnode);
+	}
+
+	return 0;
+}
+
+static const struct udevice_id noptest1_ids[] = {
+	{
+		.compatible = "sandbox,nop_sandbox1",
+	},
+	{ }
+};
+
+U_BOOT_DRIVER(noptest_drv1) = {
+	.name	= "noptest1_drv",
+	.of_match	= noptest1_ids,
+	.id	= UCLASS_NOP,
+	.bind = noptest_bind,
+};
+
+static const struct udevice_id noptest2_ids[] = {
+	{
+		.compatible = "sandbox,nop_sandbox2",
+	},
+	{ }
+};
+
+U_BOOT_DRIVER(noptest_drv2) = {
+	.name	= "noptest2_drv",
+	.of_match	= noptest2_ids,
+	.id	= UCLASS_NOP,
+};
+
+static int dm_test_nop(struct unit_test_state *uts)
+{
+	struct udevice *dev;
+
+	ut_assertok(uclass_get_device_by_name(UCLASS_NOP, "nop-test_0", &dev));
+	ut_assertok(uclass_get_device_by_name(UCLASS_NOP, "nop-test_1", &dev));
+	ut_asserteq(-ENODEV,
+		    uclass_get_device_by_name(UCLASS_NOP, "nop-test_2", &dev));
+
+	return 0;
+}
+
+DM_TEST(dm_test_nop, DM_TESTF_FLAT_TREE | DM_TESTF_SCAN_FDT);
-- 
2.27.0

