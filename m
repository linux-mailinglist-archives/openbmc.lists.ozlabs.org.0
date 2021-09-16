Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62940EC6F
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VSK1KVMz2ygC
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:23:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8nnIDbp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m8nnIDbp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQM6qXmz2xrL
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKpZGC029963; 
 Thu, 16 Sep 2021 17:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jDTzKOJxfNOimhCEjnwMx9TnDvnQMsV+d/YAj4z0O3E=;
 b=m8nnIDbpeRDahsh19GHjx4xDgBG4Gu4b2iAZpXu56ZUPqHOsSfgMr4QDfJtvP4kPAB2D
 zvJbIFu/HZW3CFkDIGlk/8lavR3OjhJ6d5DBvtpO3tigBe68ArWPbiOhNOUKmixCicBS
 bIdv8rcAZC30n5zB9rm4BRyc1kVfI8aOOa9nsSsyTmVX0l54x1u6/kHoDOH2wmQIMtjv
 rrZgImDhDygiwjofeeXyqQyVmL3XFGs2dh2GAIfUP22nUkpAos0X1CcGq17RdqBvtPeF
 6r4f0uEW2mmsMPYGvUg6GVndPQYA2SIVp4z3ARUROAzFo7r0ftN2HOvnAaUd1EvS4kBn Pg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b4bbaju6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:44 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GL9r0f004191;
 Thu, 16 Sep 2021 21:21:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3b0m3d8v29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLhrq12256006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BE9BAC05B;
 Thu, 16 Sep 2021 21:21:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00508AC05E;
 Thu, 16 Sep 2021 21:21:42 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 4/7] leds: pca955x: Add brightness_get function
Date: Thu, 16 Sep 2021 16:21:37 -0500
Message-Id: <20210916212140.33915-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
References: <20210916212140.33915-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WsDaykQ-hRKZbX6yhHk8EeWb9wvlRdKC
X-Proofpoint-ORIG-GUID: WsDaykQ-hRKZbX6yhHk8EeWb9wvlRdKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160122
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a function to fetch the state of the hardware LED.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-pca955x.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index f0d841cb59fc..e47ba7c3b7c7 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -233,6 +233,57 @@ static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 	return 0;
 }
 
+static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
+{
+	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, cmd);
+	if (ret < 0) {
+		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
+}
+
+static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
+{
+	struct pca955x_led *pca955x_led = container_of(led_cdev,
+						       struct pca955x_led,
+						       led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	u8 ls, pwm;
+	int ret;
+
+	ret = pca955x_read_ls(pca955x->client, pca955x_led->led_num / 4, &ls);
+	if (ret)
+		return ret;
+
+	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
+	switch (ls) {
+	case PCA955X_LS_LED_ON:
+		ret = LED_FULL;
+		break;
+	case PCA955X_LS_LED_OFF:
+		ret = LED_OFF;
+		break;
+	case PCA955X_LS_BLINK0:
+		ret = LED_HALF;
+		break;
+	case PCA955X_LS_BLINK1:
+		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
+		if (ret)
+			return ret;
+		ret = 255 - pwm;
+		break;
+	}
+
+	return ret;
+}
+
 static int pca955x_led_set(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
@@ -512,6 +563,7 @@ static int pca955x_probe(struct i2c_client *client,
 
 			led->name = pca955x_led->name;
 			led->brightness_set_blocking = pca955x_led_set;
+			led->brightness_get = pca955x_led_get;
 
 			err = devm_led_classdev_register(&client->dev, led);
 			if (err)
-- 
2.27.0

