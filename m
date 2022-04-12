Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20C4FE638
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 18:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBRq5Bb1z3bxM
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 02:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COnORLH4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=COnORLH4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdBMx3QTlz3bpP
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 02:42:20 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn2Ra010974; 
 Tue, 12 Apr 2022 16:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+kBwWuPEUhZ28vc3jxYK1jdylDIHm9/AR3N8jWcX0+0=;
 b=COnORLH4wWSMGZAwhXok4PsvP1nXPeO292LaGHK4gq+zwkMl9Q0CW6zcJgm3XLeCbi4z
 JurVztrVqWzIL3utq1/Bkp49Cso7UUQu0RjpWJNJ+8D9zKkwMlwm0RGrplla7m1kAkti
 wcseTk/Yq+bP2sQZi+zggcW0L/I3A1lu9EGjcgj9CGqJ2EU3z3zpTY17R0aIdYEPBy9e
 g9y/byYJMEj+9RYMV0VFZvNxKBflDa7NMY7TsyOF+wfB0Oku/lgEnCNd7z+M7Q27kHVe
 yXHzqZniuDinslKeJNjGBQRpJNYAFasHJ6iWVnIK1rBRoF7y26J3Lky+N/VjIwPAFCdW eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fd9t0dfev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:42:18 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGI8bJ017614;
 Tue, 12 Apr 2022 16:42:17 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fd9t0dfem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:42:17 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGXQZA002200;
 Tue, 12 Apr 2022 16:42:16 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3fb1s9seq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:42:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGgGf326739046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:42:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34E82AE060;
 Tue, 12 Apr 2022 16:42:16 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50CBCAE05F;
 Tue, 12 Apr 2022 16:42:15 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.113.187])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 16:42:15 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: pavel@ucw.cz
Subject: [PATCH v4 3/4] leds: pca955x: Optimize probe led selection
Date: Tue, 12 Apr 2022 11:42:10 -0500
Message-Id: <20220412164211.28824-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412164211.28824-1-eajames@linux.ibm.com>
References: <20220412164211.28824-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AjdQG4IJ5Y1Og2Nu4UBil4xTRt_8cJgq
X-Proofpoint-GUID: e4oUe9cwq3k8QImXIgoI1b_B51L4LzZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=655 priorityscore=1501 adultscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120079
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, linux-leds@vger.kernel.org,
 dan.carpenter@oracle.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Previously, the probe function might do up to 32 reads and writes
to the same 4 registers to program the led selection. Reduce this to
a maximum of 8 operations by accumulating the changes to the led
selection and comparing with the previous value to write the
selection if different.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-pca955x.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index cb1895b79eab..61f3cb84a945 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -483,7 +483,9 @@ static int pca955x_probe(struct i2c_client *client)
 	struct led_classdev *led;
 	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
-	int i, err;
+	int i, bit, err, nls, reg;
+	u8 ls1[4];
+	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
 	bool set_default_label = false;
 	bool keep_pwm = false;
@@ -554,6 +556,15 @@ static int pca955x_probe(struct i2c_client *client)
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
 
+	nls = pca955x_num_led_regs(chip->bits);
+	for (i = 0; i < nls; ++i) {
+		err = pca955x_read_ls(pca955x, i, &ls1[i]);
+		if (err)
+			return err;
+
+		ls2[i] = ls1[i];
+	}
+
 	for (i = 0; i < chip->bits; i++) {
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
@@ -565,21 +576,20 @@ static int pca955x_probe(struct i2c_client *client)
 		case PCA955X_TYPE_GPIO:
 			break;
 		case PCA955X_TYPE_LED:
+			bit = i % 4;
+			reg = i / 4;
 			led = &pca955x_led->led_cdev;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
 			if (pdata->leds[i].default_state ==
-			    LEDS_GPIO_DEFSTATE_OFF) {
-				err = pca955x_led_set(led, LED_OFF);
-				if (err)
-					return err;
-			} else if (pdata->leds[i].default_state ==
-				   LEDS_GPIO_DEFSTATE_ON) {
-				err = pca955x_led_set(led, LED_FULL);
-				if (err)
-					return err;
-			}
+			    LEDS_GPIO_DEFSTATE_OFF)
+				ls2[reg] = pca955x_ledsel(ls2[reg], bit,
+							  PCA955X_LS_LED_OFF);
+			else if (pdata->leds[i].default_state ==
+				   LEDS_GPIO_DEFSTATE_ON)
+				ls2[reg] = pca955x_ledsel(ls2[reg], bit,
+							  PCA955X_LS_LED_ON);
 
 			init_data.fwnode = pdata->leds[i].fwnode;
 
@@ -624,6 +634,14 @@ static int pca955x_probe(struct i2c_client *client)
 		}
 	}
 
+	for (i = 0; i < nls; ++i) {
+		if (ls1[i] != ls2[i]) {
+			err = pca955x_write_ls(pca955x, i, ls2[i]);
+			if (err)
+				return err;
+		}
+	}
+
 	/* PWM0 is used for half brightness or 50% duty cycle */
 	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
 	if (err)
-- 
2.27.0

