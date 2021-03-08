Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E006331AAB
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYlm06FLz3dV3
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:03:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WzogwLO8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WzogwLO8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYy2TdHz3cP7
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:29 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128Mc2Ab080082; Mon, 8 Mar 2021 17:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tqKZRUmv0KJFZQy0jox+E7/rakC5yVon83n6Xa2eKTw=;
 b=WzogwLO8QtJWfLJvAZV/bgAa5r4gPUIhpB8O3yi1y+J7//Bk7weM6KsVXcP8vUSuTypW
 W1mPNrAyqaNSSLPAo3ItUGPOisy5/IBSt/2W5DqJiT/D5jwdiOd4DTe36ChQch1KvjYX
 w5O0JuaI645b4L0A1MhdvQRhvze+sjBJUYtH1z8TwL/05vT9YJTH0OD3G0QZWz59qZGV
 u8BQ1ca1YHsAth3Ah00+LQU/jIiOTWAq6vhJ03NW6MroaN2Y2m62n+2RL110JeGGzVSC
 qcyzKRXHxkv9JQ0unmdb+jYXvrXRwzVfAdyvxwGAshkQ8/Emn6LcEGg8+nXyFvEcgVm1 NQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37577ggg80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:27 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MkgfL027653;
 Mon, 8 Mar 2021 22:54:26 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3741c89xse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsODv26214778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 538EEC605D;
 Mon,  8 Mar 2021 22:54:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2599AC6057;
 Mon,  8 Mar 2021 22:54:24 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:24 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 14/35] mmc: sdhci: aspeed: Expose data sample
 phase delay tuning
Date: Mon,  8 Mar 2021 16:53:58 -0600
Message-Id: <20210308225419.46530-15-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103080118
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

From: Andrew Jeffery <andrew@aj.id.au>

Allow sample phase adjustment to deal with layout or tolerance issues.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 65 ++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 4f008ba3280e..21c40e3ad762 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 ASPEED Technology Inc. */
 /* Copyright (C) 2019 IBM Corp. */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -16,9 +17,14 @@
 
 #include "sdhci-pltfm.h"
 
-#define ASPEED_SDC_INFO		0x00
-#define   ASPEED_SDC_S1MMC8	BIT(25)
-#define   ASPEED_SDC_S0MMC8	BIT(24)
+#define ASPEED_SDC_INFO			0x00
+#define   ASPEED_SDC_S1MMC8		BIT(25)
+#define   ASPEED_SDC_S0MMC8		BIT(24)
+#define ASPEED_SDC_PHASE		0xf4
+#define   ASPEED_SDC_PHASE_IN		GENMASK(20, 16)
+#define   ASPEED_SDC_PHASE_OUT		GENMASK(7, 3)
+#define   ASPEED_SDC_PHASE_IN_EN	BIT(2)
+#define   ASPEED_SDC_PHASE_OUT_EN	GENMASK(1, 0)
 
 struct aspeed_sdc {
 	struct clk *clk;
@@ -247,6 +253,55 @@ static struct platform_driver aspeed_sdhci_driver = {
 	.remove		= aspeed_sdhci_remove,
 };
 
+static int aspeed_sdc_configure_of(struct platform_device *pdev,
+				   struct aspeed_sdc *sdc)
+{
+	u32 phase, iphase, ophase;
+	struct device_node *np;
+	struct device *dev;
+	int ret;
+
+	dev = &pdev->dev;
+	np = dev->of_node;
+	phase = 0;
+
+	ret = of_property_read_u32(np, "aspeed,input-phase", &iphase);
+	if (ret < 0) {
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_IN, 0);
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_IN_EN, 0);
+		dev_dbg(dev, "Input phase configuration disabled");
+	} else if (iphase >= (1 << 5)) {
+		dev_err(dev,
+			"Input phase value exceeds field range (5 bits): %u",
+			iphase);
+		return -ERANGE;
+	} else {
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_IN, iphase);
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_IN_EN, 1);
+		dev_info(dev, "Input phase relationship: %u", iphase);
+	}
+
+	ret = of_property_read_u32(np, "aspeed,output-phase", &ophase);
+	if (ret < 0) {
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_OUT, 0);
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_OUT_EN, 0);
+		dev_dbg(dev, "Output phase configuration disabled");
+	} else if (ophase >= (1 << 5)) {
+		dev_err(dev,
+			"Output phase value exceeds field range (5 bits): %u",
+			iphase);
+		return -ERANGE;
+	} else {
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_OUT, ophase);
+		phase |= FIELD_PREP(ASPEED_SDC_PHASE_OUT_EN, 3);
+		dev_info(dev, "Output phase relationship: %u", ophase);
+	}
+
+	writel(phase, sdc->regs + ASPEED_SDC_PHASE);
+
+	return 0;
+}
+
 static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
@@ -277,6 +332,10 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
+	ret = aspeed_sdc_configure_of(pdev, sdc);
+	if (ret)
+		goto err_clk;
+
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
-- 
2.27.0

