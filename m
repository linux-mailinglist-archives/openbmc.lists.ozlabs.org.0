Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB748604AA6
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 17:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsvJQ0kFnz3c1p
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 02:08:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BoKHViLq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BoKHViLq;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsvGp71hhz2xZf
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 02:07:30 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JEho3h015291;
	Wed, 19 Oct 2022 15:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=y8zSz4gfnfcaCEnWDkDVDkQe/cJfkVO2WJRY+gkVtjc=;
 b=BoKHViLqgyjVWDh58wqV79CbH1BVt+kdy3lqpfxlrDwkSoCyLgziPTSWCP4vZI7RgKph
 l8u7a0yqfUjS+CFy09qXxTA2EBi6yaBHZrnjfSqFO6Wwx+zD4vgkfpvSnvIM62KztNSG
 jkJW+D3njtpCUZR+y0tY7F/weD+grEgttJ7nBFf4qIJjkTWCIUWLvDyiCR8+MUC/Btn4
 QIZtXYvqW5toXWZVYuQ0aOIyyGg0nLtn0rfMcPnhMEENZ5TyfDfLKjio7AI3RqgNhQ+e
 2FhEAW0wL1tRfwoF6JcTMEBvlgP/MDVFC+3fY7Cv273bkMzm47SMoscvCXhLUYuP37Z/ kg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kak8j0y09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:25 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JEoAhL008474;
	Wed, 19 Oct 2022 15:07:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3k7mg9xn13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:24 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JF7MkC8848030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 15:07:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AE435805D;
	Wed, 19 Oct 2022 15:07:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B48FD58043;
	Wed, 19 Oct 2022 15:07:22 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.7.147])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 15:07:22 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0 1/3] watchdog: aspeed: Add pre-timeout interrupt support
Date: Wed, 19 Oct 2022 10:07:12 -0500
Message-Id: <20221019150714.606390-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221019150714.606390-1-eajames@linux.ibm.com>
References: <20221019150714.606390-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PRGaScxZStwTx_srIm6f89SKoRpKq_-1
X-Proofpoint-ORIG-GUID: PRGaScxZStwTx_srIm6f89SKoRpKq_-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_08,2022-10-19_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190081
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable the pre-timeout interrupt if requested by device property.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/watchdog/aspeed_wdt.c | 54 +++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index bd06622813eb..6a6d53a9e21c 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -5,11 +5,14 @@
  * Joel Stanley <joel@jms.id.au>
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
@@ -22,24 +25,37 @@ struct aspeed_wdt {
 	struct watchdog_device	wdd;
 	void __iomem		*base;
 	u32			ctrl;
+	u8			stop : 1;
 };
 
 struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
+	u32 irq_shift;
+	u32 irq_mask;
 };
 
 static const struct aspeed_wdt_config ast2400_config = {
 	.ext_pulse_width_mask = 0xff,
+	.irq_shift = 0,
+	.irq_mask = 0,
 };
 
 static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 12,
+	.irq_mask = GENMASK(31, 12),
+};
+
+static const struct aspeed_wdt_config ast2600_config = {
+	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 0,
+	.irq_mask = GENMASK(31, 10),
 };
 
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
-	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -58,6 +74,7 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_CTRL_RESET_SYSTEM		BIT(1)
 #define   WDT_CTRL_ENABLE		BIT(0)
 #define WDT_TIMEOUT_STATUS	0x10
+#define   WDT_TIMEOUT_STATUS_IRQ		BIT(2)
 #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
 #define WDT_CLEAR_TIMEOUT_STATUS	0x14
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
@@ -243,6 +260,17 @@ static const struct watchdog_info aspeed_wdt_info = {
 	.identity	= KBUILD_MODNAME,
 };
 
+static irqreturn_t aspeed_wdt_irq(int irq, void *arg)
+{
+	struct aspeed_wdt *wdt = arg;
+	u32 status = readl(wdt->base + WDT_TIMEOUT_STATUS);
+
+	if (status & WDT_TIMEOUT_STATUS_IRQ)
+		panic("Watchdog pre-timeout IRQ");
+
+	return IRQ_NONE;
+}
+
 static int aspeed_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -253,6 +281,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	const char *reset_type;
 	u32 duration;
 	u32 status;
+	u32 timeout = 0;
 	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
@@ -291,6 +320,27 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
 		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
 
+	if (config->irq_mask) {
+		if (!of_property_read_u32(np, "aspeed,pre-timeout-irq-us", &timeout) && timeout) {
+			int irq =  platform_get_irq(pdev, 0);
+
+			if (irq < 0) {
+				dev_warn(dev, "Couldn't find IRQ: %d\n", irq);
+				timeout = 0;
+			} else {
+				ret = devm_request_irq(dev, irq, aspeed_wdt_irq, IRQF_SHARED,
+						       dev_name(dev), wdt);
+				if (ret) {
+					dev_warn(dev, "Couldn't request IRQ:%d\n", ret);
+					timeout = 0;
+				} else {
+					wdt->ctrl |= ((timeout << config->irq_shift) &
+						      config->irq_mask) | WDT_CTRL_WDT_INTR;
+				}
+			}
+		}
+	}
+
 	/*
 	 * Control reset on a per-device basis to ensure the
 	 * host is not affected by a BMC reboot
@@ -308,7 +358,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		else if (!strcmp(reset_type, "system"))
 			wdt->ctrl |= WDT_CTRL_RESET_MODE_FULL_CHIP |
 				     WDT_CTRL_RESET_SYSTEM;
-		else if (strcmp(reset_type, "none"))
+		else if (strcmp(reset_type, "none") && !timeout)
 			return -EINVAL;
 	}
 	if (of_property_read_bool(np, "aspeed,external-signal"))
-- 
2.31.1

