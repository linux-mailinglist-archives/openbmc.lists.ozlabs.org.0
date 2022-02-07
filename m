Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B034ACC8B
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 00:16:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt28W3V4dz3bNg
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:16:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tte11kwz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tte11kwz; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt2571d1hz2ymg
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 10:13:46 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217LTZHB019416; 
 Mon, 7 Feb 2022 23:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AhNP7yjfdmPS0S+UIihkJOg/VlM71BwTaD6SsNMZeQE=;
 b=tte11kwzVBBiXwRhsjjgvrNW6JxniM+cRPr8KJ2BGe9wMuUkvWOhvHEPUaWBm2UM/jck
 3pqtCMWg4QTBX7ctSfatEQQrX5QXS90zzIdTsuwVN4/Sm9oo4nSadH/DJnY6asKOvrUj
 ND2au1Jcxg1cZhiSzq2rg4ELanz0PjvXxPDy8pCyH7qmZZPgxxDfF+cyl7ZzTG6ux23M
 zawlPiemqp8VecOYKL6uetiXTAANJCYjM+7stiPR/7HtKOzoZ26D7/PKqjEwJgPmKLDr
 ++Ibv+sNImNFfpZpq+EXxtbkz6I2jA8Cns1sedHrX1w4IONcGXBCBx1qtUvL2gPTtm6x yA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e236f15g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:42 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217NDgUH017214;
 Mon, 7 Feb 2022 23:13:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 3e1gvagpq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217NDebe30802400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 23:13:40 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7CD7AE063;
 Mon,  7 Feb 2022 23:13:40 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1A5EAE066;
 Mon,  7 Feb 2022 23:13:39 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 23:13:39 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 4/6] gpio: Enable hogging
 support in SPL
Date: Mon,  7 Feb 2022 17:13:32 -0600
Message-Id: <20220207231334.59845-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220207231334.59845-1-eajames@linux.ibm.com>
References: <20220207231334.59845-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kYiQK3i1wlfutxsuPWPW9MfdJYDDN2FU
X-Proofpoint-GUID: kYiQK3i1wlfutxsuPWPW9MfdJYDDN2FU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070126
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use the CONFIG macros to conditionally build the GPIO hogging support in
either the SPL or U-Boot, or both, depending on the configuration. Also
call the GPIO hog probe function in the common SPL board initialization
as an equivalent to adding it to the U-Boot init sequence functions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 common/spl/spl.c           |  4 ++++
 drivers/gpio/Kconfig       | 10 ++++++++++
 drivers/gpio/gpio-uclass.c | 10 +++++-----
 3 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/common/spl/spl.c b/common/spl/spl.c
index a1d4514fd3..927e072778 100644
--- a/common/spl/spl.c
+++ b/common/spl/spl.c
@@ -12,6 +12,7 @@
 #include <dm.h>
 #include <handoff.h>
 #include <spl.h>
+#include <asm/gpio.h>
 #include <asm/sections.h>
 #include <asm/u-boot.h>
 #include <nand.h>
@@ -652,6 +653,9 @@ void board_init_r(gd_t *dummy1, ulong dummy2)
 	timer_init();
 #endif
 
+	if (CONFIG_IS_ENABLED(GPIO_HOG))
+		gpio_hog_probe_all();
+
 #if CONFIG_IS_ENABLED(BOARD_INIT)
 	spl_board_init();
 #endif
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a8dc16ca0e..69ca18c15b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -24,6 +24,16 @@ config GPIO_HOG
 	  is a mechanism providing automatic GPIO request and config-
 	  uration as part of the gpio-controller's driver probe function.
 
+config SPL_GPIO_HOG
+	bool "Enable GPIO hog support in SPL"
+	depends on SPL_GPIO_SUPPORT
+	default n
+	help
+	  Enable gpio hog support in SPL
+	  The GPIO chip may contain GPIO hog definitions. GPIO hogging
+	  is a mechanism providing automatic GPIO request and config-
+	  uration as part of the gpio-controller's driver probe function.
+
 config ALTERA_PIO
 	bool "Altera PIO driver"
 	depends on DM_GPIO
diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 01cfa2f788..f511a26db0 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -144,7 +144,7 @@ static int gpio_find_and_xlate(struct gpio_desc *desc,
 		return gpio_xlate_offs_flags(desc->dev, desc, args);
 }
 
-#if defined(CONFIG_GPIO_HOG)
+#if CONFIG_IS_ENABLED(GPIO_HOG)
 
 struct gpio_hog_priv {
 	struct gpio_desc gpiod;
@@ -1033,9 +1033,6 @@ int gpio_dev_request_index(struct udevice *dev, const char *nodename,
 
 static int gpio_post_bind(struct udevice *dev)
 {
-	struct udevice *child;
-	ofnode node;
-
 #if defined(CONFIG_NEEDS_MANUAL_RELOC)
 	struct dm_gpio_ops *ops = (struct dm_gpio_ops *)device_get_ops(dev);
 	static int reloc_done;
@@ -1066,7 +1063,10 @@ static int gpio_post_bind(struct udevice *dev)
 	}
 #endif
 
-	if (IS_ENABLED(CONFIG_GPIO_HOG)) {
+	if (CONFIG_IS_ENABLED(GPIO_HOG)) {
+		struct udevice *child;
+		ofnode node;
+
 		dev_for_each_subnode(node, dev) {
 			if (ofnode_read_bool(node, "gpio-hog")) {
 				const char *name = ofnode_get_name(node);
-- 
2.27.0

