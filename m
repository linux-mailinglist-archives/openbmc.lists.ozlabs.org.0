Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E44F873D
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 20:42:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ9HB3rk3z3bbb
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 04:42:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWYgqro1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QWYgqro1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ9F72psgz3bmP
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 04:40:59 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 237Hvtrk023024; 
 Thu, 7 Apr 2022 18:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=X0/w+ht4B+jaN85pRfLQ7j/u2mfPti3ZQH2HIjLHkQw=;
 b=QWYgqro1tZXEqlOGBm2XGHRDJSa2twhgedYkU1ntNTqhCPs2zvT2TU6YeRQsSXleuJIO
 xBDsUowduwkHX/KK9FkFUtye3xrLfoh9UN3C+QG0MSLQxwxIQzm78g+vXYl3aajDcNcb
 eArF6zI72i7+/XQ7UZl7A6jBJ6ijWxOhGmi7hHVYSrIPwxzK1L+VRj7lP7VzaZXtXCH7
 DuPSy4pPZWaSbNbQ6VNCUjoxzd7ImiGhzyWY74gn278fcBUAaS6XFpVtXYTG9MqBBtpA
 KqaI8dlvoABISqpaJ4JfEXZGZszMCzHtbwtfvtgHLMJ5SFoppxDBQ9L0YlBx+mloV06W qg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa4tgh166-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:39:47 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 237INGg3017743;
 Thu, 7 Apr 2022 18:39:46 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3f6e4b2eeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:39:46 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 237IdjwS14221672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 18:39:45 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBBFE12405C;
 Thu,  7 Apr 2022 18:39:45 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0765F124052;
 Thu,  7 Apr 2022 18:39:45 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.114.26])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Apr 2022 18:39:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH v2 1/2] leds: pca955x: Clean up and optimize
Date: Thu,  7 Apr 2022 13:39:40 -0500
Message-Id: <20220407183941.36555-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407183941.36555-1-eajames@linux.ibm.com>
References: <20220407183941.36555-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K6ReIpX5mBIObrUOI8TcR515NuYvLtAf
X-Proofpoint-ORIG-GUID: K6ReIpX5mBIObrUOI8TcR515NuYvLtAf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_04,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=782 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204070092
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
 linux-kernel@vger.kernel.org, joel@jms.id.au, pavel@ucw.cz
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Clean up the I2C access functions to avoid fetching the pca955x
driver data again. Optimize the probe to do at most 4 reads and
4 writes of the LED selector regs, rather than 16 of each.
Rename some functions and variables to be more consistent and
descriptive.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 148 ++++++++++++++++++++----------------
 1 file changed, 82 insertions(+), 66 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 81aaf21212d7..dd51f40973d8 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -140,13 +140,13 @@ struct pca955x_platform_data {
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
@@ -161,20 +161,25 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
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
  */
-static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev,
+			"%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
+			ret);
 	return ret;
 }
 
@@ -185,16 +190,16 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
  *
  * Duty cycle is (256 - PWMx) / 256
  */
-static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_pwm(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev,
+			"%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
+			ret);
 	return ret;
 }
 
@@ -202,16 +207,16 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
  * Write to LED selector register, which determines the source that
  * drives the LED output.
  */
-static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_ls(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev,
+			"%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
+			ret);
 	return ret;
 }
 
@@ -219,15 +224,14 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
  * Read the LED selector register, which determines the source that
  * drives the LED output.
  */
-static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
+static int pca955x_read_ls(struct pca955x *pca955x, int n, u8 *val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, cmd);
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
 	if (ret < 0) {
-		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
 			__func__, n, ret);
 		return ret;
 	}
@@ -235,15 +239,14 @@ static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 	return 0;
 }
 
-static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
+static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
-	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, cmd);
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
 	if (ret < 0) {
-		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
 			__func__, n, ret);
 		return ret;
 	}
@@ -260,12 +263,11 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	u8 ls, pwm;
 	int ret;
 
-	ret = pca955x_read_ls(pca955x->client, pca955x_led->led_num / 4, &ls);
+	ret = pca955x_read_ls(pca955x, pca955x_led->led_num / 4, &ls);
 	if (ret)
 		return ret;
 
-	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
-	switch (ls) {
+	switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
 	case PCA955X_LS_LED_ON:
 		ret = LED_FULL;
 		break;
@@ -276,7 +278,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 		ret = LED_HALF;
 		break;
 	case PCA955X_LS_BLINK1:
-		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
+		ret = pca955x_read_pwm(pca955x, 1, &pwm);
 		if (ret)
 			return ret;
 		ret = 255 - pwm;
@@ -289,34 +291,30 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 static int pca955x_led_set(struct led_classdev *led_cdev,
 			    enum led_brightness value)
 {
-	struct pca955x_led *pca955x_led;
-	struct pca955x *pca955x;
+	struct pca955x_led *pca955x_led = container_of(led_cdev,
+						       struct pca955x_led,
+						       led_cdev);
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
 
-	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
+	ret = pca955x_read_ls(pca955x, reg, &ls);
 	if (ret)
 		goto out;
 
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
@@ -326,14 +324,14 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		 * OFF, HALF, or FULL.  But, this is probably better than
 		 * just turning off for all other values.
 		 */
-		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
+		ret = pca955x_write_pwm(pca955x, 1, 255 - value);
 		if (ret)
 			goto out;
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
+		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
 		break;
 	}
 
-	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
+	ret = pca955x_write_ls(pca955x, reg, ls);
 
 out:
 	mutex_unlock(&pca955x->lock);
@@ -492,7 +490,9 @@ static int pca955x_probe(struct i2c_client *client)
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
@@ -563,6 +563,15 @@ static int pca955x_probe(struct i2c_client *client)
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
@@ -574,21 +583,20 @@ static int pca955x_probe(struct i2c_client *client)
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
 
@@ -633,23 +641,31 @@ static int pca955x_probe(struct i2c_client *client)
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
-	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
+	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
 	if (err)
 		return err;
 
 	if (!keep_pwm) {
 		/* PWM1 is used for variable brightness, default to OFF */
-		err = pca955x_write_pwm(client, 1, 0);
+		err = pca955x_write_pwm(pca955x, 1, 0);
 		if (err)
 			return err;
 	}
 
 	/* Set to fast frequency so we do not see flashing */
-	err = pca955x_write_psc(client, 0, 0);
+	err = pca955x_write_psc(pca955x, 0, 0);
 	if (err)
 		return err;
-	err = pca955x_write_psc(client, 1, 0);
+	err = pca955x_write_psc(pca955x, 1, 0);
 	if (err)
 		return err;
 
-- 
2.27.0

