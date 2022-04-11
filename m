Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972E4FC220
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 18:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcYxv42XDz3bWt
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 02:21:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zpk0TYng;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zpk0TYng; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcYxR67g7z2yWN
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 02:20:43 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BF2qQ5004038; 
 Mon, 11 Apr 2022 16:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s7ozJlP7XT89+2pv9Mj5WzxpHBNotI7o7KcOVNQYjaU=;
 b=Zpk0TYngS46RayETAZyxeNsD9LZQjATe5HCbiFuvAaWuTjjMixu5vsU/cafp27CdTIYx
 2GZjBaO8oEr/iwAi5BYJIajSyd2XsjRhk1JthUOQ52Vg4IKlbJBa5t7pqsm74v45JSB+
 bSGANc/2DUyCQTy6vxwvFkfQOtq4PaZcJLfxxKQx68WYnqSE/MZWigq3mDAQBawFoPgY
 db+T6BMuV8TrcWxpEVSV1wTFPIib5z0ikOUp4xN2PPfQ5DIrUtIsRFZAPC1yIxe2b2bI
 +OhlHzyCH+CoCUxY7B7gj9pU58m/C4+W1ffdottMiDkzuuYANM6jqo5YNTWpz+mHVJCD 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghn6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:40 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BFqRgN015782;
 Mon, 11 Apr 2022 16:20:40 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghn6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:40 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BGDK03009906;
 Mon, 11 Apr 2022 16:20:38 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3fb1s9gxu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:38 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BGKcJW21299518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:20:38 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 422CA124055;
 Mon, 11 Apr 2022 16:20:38 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 699A0124053;
 Mon, 11 Apr 2022 16:20:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.106.206])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 16:20:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH v3 1/4] leds: pca955x: Refactor with helper functions and
 renaming
Date: Mon, 11 Apr 2022 11:20:30 -0500
Message-Id: <20220411162033.39613-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220411162033.39613-1-eajames@linux.ibm.com>
References: <20220411162033.39613-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Yz640mPN-z35jHu_ZJwJQ7caQPRCoxnY
X-Proofpoint-GUID: fP9OjfdxdwekiVwgtkX5-GZdIMbcEH8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=829
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110089
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, joel@jms.id.au,
 pavel@ucw.cz
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add helper functions to clean up the code, and rename a few
oddly named functions and variables.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 50 ++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 81aaf21212d7..a683c872e1ff 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -134,19 +134,21 @@ struct pca955x_led {
 	struct fwnode_handle	*fwnode;
 };
 
+#define led_to_pca955x(l)	container_of(l, struct pca955x_led, led_cdev)
+
 struct pca955x_platform_data {
 	struct pca955x_led	*leds;
 	int			num_leds;
 };
 
 /* 8 bits per input register */
-static inline int pca95xx_num_input_regs(int bits)
+static inline int pca955x_num_input_regs(int bits)
 {
 	return (bits + 7) / 8;
 }
 
 /* 4 bits per LED selector register */
-static inline int pca95xx_num_led_regs(int bits)
+static inline int pca955x_num_led_regs(int bits)
 {
 	return (bits + 3)  / 4;
 }
@@ -161,6 +163,11 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 		((state & 0x3) << (led_num << 1));
 }
 
+static inline int pca955x_ledstate(u8 ls, int led_num)
+{
+	return (ls >> (led_num << 1)) & 0x3;
+}
+
 /*
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
@@ -168,7 +175,7 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, cmd, val);
@@ -188,7 +195,7 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, cmd, val);
@@ -205,7 +212,7 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
 	ret = i2c_smbus_write_byte_data(client, cmd, val);
@@ -222,7 +229,7 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
 	ret = i2c_smbus_read_byte_data(client, cmd);
@@ -238,7 +245,7 @@ static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
 	ret = i2c_smbus_read_byte_data(client, cmd);
@@ -253,9 +260,7 @@ static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
 
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
-	struct pca955x_led *pca955x_led = container_of(led_cdev,
-						       struct pca955x_led,
-						       led_cdev);
+	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
 	struct pca955x *pca955x = pca955x_led->pca955x;
 	u8 ls, pwm;
 	int ret;
@@ -264,8 +269,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	if (ret)
 		return ret;
 
-	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
-	switch (ls) {
+	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
 	case PCA955X_LS_LED_ON:
 		ret = LED_FULL;
 		break;
@@ -289,19 +293,13 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 static int pca955x_led_set(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
-	struct pca955x_led *pca955x_led;
-	struct pca955x *pca955x;
+	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	int reg = pca955x_led->led_num / 4;
+	int bit = pca955x_led->led_num % 4;
 	u8 ls;
-	int chip_ls;	/* which LSx to use (0-3 potentially) */
-	int ls_led;	/* which set of bits within LSx to use (0-3) */
 	int ret;
 
-	pca955x_led = container_of(led_cdev, struct pca955x_led, led_cdev);
-	pca955x = pca955x_led->pca955x;
-
-	chip_ls = pca955x_led->led_num / 4;
-	ls_led = pca955x_led->led_num % 4;
-
 	mutex_lock(&pca955x->lock);
 
 	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
@@ -310,13 +308,13 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	switch (value) {
 	case LED_FULL:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
 		break;
 	case LED_OFF:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
 		break;
 	case LED_HALF:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
 		break;
 	default:
 		/*
@@ -329,7 +327,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
 		if (ret)
 			goto out;
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
 		break;
 	}
 
-- 
2.27.0

