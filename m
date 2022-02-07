Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9A4AC2E6
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:23:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsqdw6Vfbz30L4
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:23:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DW3nt6Zd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DW3nt6Zd; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsqdX1Slsz2xKK
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:22:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217EZAk0001129; 
 Mon, 7 Feb 2022 15:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eLKH+7rlW/DIY2snYmG1c3i+s4ov3q6KyAaG7UBcTxw=;
 b=DW3nt6ZdwcHDDzNb9hhmaCLWGtmH1drz0yHg7DwbnFiBwd+A5Hga/2puAuImrrdObHQq
 0Xd/kFD1wracwMH0lqW0L5KO80VEIAtjbM4P/auGrUAV/B+ZH/s6yvgpl5w2lGOsWtLV
 v0goneSgD9X+CsWwXX8101tIsimi6h3rsVUiuc1IsBijiuJB8BM6/2iwc3+CsBfvrUod
 EB8cJvzOkKux6SYFrLboBPOiqh80vVr21pf+kPG/b0q5tkqGjXfydern5QZJ3saUrxAN
 g1Q27RgTDlER4RCvpDjEpdofJVUEpr2JSggugDVVurJ11FeC187PCWCXwapQzzRyv5tA bw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e231973f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:22:36 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217FDfWW025118;
 Mon, 7 Feb 2022 15:22:36 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3e1gv9qr5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:22:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217FMYLH32833988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:22:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D036AC6065;
 Mon,  7 Feb 2022 15:22:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB521C6055;
 Mon,  7 Feb 2022 15:22:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 15:22:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-oepnbmc v3 4/6] gpio: Enable hogging
 support in SPL
Date: Mon,  7 Feb 2022 09:22:30 -0600
Message-Id: <20220207152232.25745-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220207152232.25745-1-eajames@linux.ibm.com>
References: <20220207152232.25745-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ELEZEOrTKSFNhWjEwe34SN3_hUdbfoKG
X-Proofpoint-GUID: ELEZEOrTKSFNhWjEwe34SN3_hUdbfoKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070097
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

Use the CONFIG macros to conditionally build the GPIO hogging support in
either the SPL or U-Boot, or both, depending on the configuration. Also
call the GPIO hog probe function in the common SPL board initialization
as an equivalent to adding it to the U-Boot init sequence functions.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 common/spl/spl.c           |  4 ++++
 drivers/gpio/Kconfig       | 10 ++++++++++
 drivers/gpio/gpio-uclass.c | 12 +++++++-----
 3 files changed, 21 insertions(+), 5 deletions(-)

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
index 01cfa2f788..219caa651b 100644
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
@@ -1066,7 +1063,11 @@ static int gpio_post_bind(struct udevice *dev)
 	}
 #endif
 
-	if (IS_ENABLED(CONFIG_GPIO_HOG)) {
+#if CONFIG_IS_ENABLED(GPIO_HOG)
+	{
+		struct udevice *child;
+		ofnode node;
+
 		dev_for_each_subnode(node, dev) {
 			if (ofnode_read_bool(node, "gpio-hog")) {
 				const char *name = ofnode_get_name(node);
@@ -1081,6 +1082,7 @@ static int gpio_post_bind(struct udevice *dev)
 			}
 		}
 	}
+#endif
 	return 0;
 }
 
-- 
2.27.0

