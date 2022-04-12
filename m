Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081E4FE62E
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 18:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBR50NB3z3c7p
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 02:45:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VCUoezP/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VCUoezP/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdBMw0cC4z3bYY
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 02:42:19 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn4Al007327; 
 Tue, 12 Apr 2022 16:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HquGM2J/ZNgAlKAcAStevPGPep73MogVOe8sYWPOsdI=;
 b=VCUoezP/qNutlbxbQhJU1Kgv4zM5iFZ5NNBdqrANQmHUxQxSE/5h90z3MecYpwGLm2W0
 9U9Fxwx9nAERZnkf7QQ4mSzVDpMc6YSKYUh3MhiL8cUDSFVZHSS/P6evfoIKUDK7MSbG
 sIz4C4PIJcNwcGjawMLhQQuC7wgduQP7YK5ddLeOJY6VeFcCLe4mp+hjrwvhP58+d3H5
 u8ZnAE7nxvgxOFNnbq3yf8Xoq39PktEwhkbZaKa8Pfngn8mm2OaJFMzWCedgch5UeqUR
 Laas/E1mauxxrseUatDTlsVagDwr7jaF6tmN/o0De9Kq1ligK8XgrjHDR4dxNGbxs7bx nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fd7wcrc95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:42:16 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CGXYCb017625;
 Tue, 12 Apr 2022 16:42:16 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fd7wcrc91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:42:16 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGXRlC002211;
 Tue, 12 Apr 2022 16:42:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3fb1s9seq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:42:15 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGgFNS13369698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:42:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28963AE05F;
 Tue, 12 Apr 2022 16:42:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F2F6AE060;
 Tue, 12 Apr 2022 16:42:14 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.113.187])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 16:42:14 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: pavel@ucw.cz
Subject: [PATCH v4 2/4] leds: pca955x: Use pointers to driver data rather than
 I2C client
Date: Tue, 12 Apr 2022 11:42:09 -0500
Message-Id: <20220412164211.28824-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412164211.28824-1-eajames@linux.ibm.com>
References: <20220412164211.28824-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nsF7pxwDiPW20qmuM-XbCiqZWyakwPrk
X-Proofpoint-ORIG-GUID: Nlhhm1UxO6GQVQqYx2A80sJ7NF0GDOOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=695
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

As a minor clean up item, pass the driver data pointer instead of the
I2C client to the reader and writer helper functions. Now the PCA
driver data doesn't have to be looked up again in the I2C client data

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-pca955x.c | 61 ++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a683c872e1ff..cb1895b79eab 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -172,16 +172,15 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
  * Write to frequency prescaler register, used to program the
  * period of the PWM output.  period = (PSCx + 1) / 38
  */
-static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n,
+			val, ret);
 	return ret;
 }
 
@@ -192,16 +191,15 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
  *
  * Duty cycle is (256 - PWMx) / 256
  */
-static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_pwm(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n,
+			val, ret);
 	return ret;
 }
 
@@ -209,16 +207,15 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
  * Write to LED selector register, which determines the source that
  * drives the LED output.
  */
-static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
+static int pca955x_write_ls(struct pca955x *pca955x, int n, u8 val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client, cmd, val);
+	ret = i2c_smbus_write_byte_data(pca955x->client, cmd, val);
 	if (ret < 0)
-		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
-			__func__, n, val, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n,
+			val, ret);
 	return ret;
 }
 
@@ -226,32 +223,28 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
  * Read the LED selector register, which determines the source that
  * drives the LED output.
  */
-static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
+static int pca955x_read_ls(struct pca955x *pca955x, int n, u8 *val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, cmd);
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
 	if (ret < 0) {
-		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
-			__func__, n, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
 		return ret;
 	}
 	*val = (u8)ret;
 	return 0;
 }
 
-static int pca955x_read_pwm(struct i2c_client *client, int n, u8 *val)
+static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
 {
-	struct pca955x *pca955x = i2c_get_clientdata(client);
 	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client, cmd);
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
 	if (ret < 0) {
-		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
-			__func__, n, ret);
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
 		return ret;
 	}
 	*val = (u8)ret;
@@ -265,7 +258,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	u8 ls, pwm;
 	int ret;
 
-	ret = pca955x_read_ls(pca955x->client, pca955x_led->led_num / 4, &ls);
+	ret = pca955x_read_ls(pca955x, pca955x_led->led_num / 4, &ls);
 	if (ret)
 		return ret;
 
@@ -280,7 +273,7 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 		ret = LED_HALF;
 		break;
 	case PCA955X_LS_BLINK1:
-		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
+		ret = pca955x_read_pwm(pca955x, 1, &pwm);
 		if (ret)
 			return ret;
 		ret = 255 - pwm;
@@ -302,7 +295,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&pca955x->lock);
 
-	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
+	ret = pca955x_read_ls(pca955x, reg, &ls);
 	if (ret)
 		goto out;
 
@@ -324,14 +317,14 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		 * OFF, HALF, or FULL.  But, this is probably better than
 		 * just turning off for all other values.
 		 */
-		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
+		ret = pca955x_write_pwm(pca955x, 1, 255 - value);
 		if (ret)
 			goto out;
 		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
 		break;
 	}
 
-	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
+	ret = pca955x_write_ls(pca955x, reg, ls);
 
 out:
 	mutex_unlock(&pca955x->lock);
@@ -632,22 +625,22 @@ static int pca955x_probe(struct i2c_client *client)
 	}
 
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

