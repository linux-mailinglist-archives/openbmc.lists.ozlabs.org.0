Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A999E4F8733
	for <lists+openbmc@lfdr.de>; Thu,  7 Apr 2022 20:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ9Ds6xnXz3bYF
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 04:40:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EJq06eLz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EJq06eLz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ9DN3Cgqz2xBb
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 04:40:19 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 237Hl2Pr021794; 
 Thu, 7 Apr 2022 18:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=r2mQzDdGonkJsJn2qcbBMN2VVgdPYyRC/+J/7bqwhTc=;
 b=EJq06eLzYZpZgqNhM+8PDeAkxXTPNHSbc+wR7qIyvXFUpaK4zriE4hI0TZQx/4bH/brf
 qnVMe5ZRix1xV/CBMknIwB/LPArexYu/9VkTCp3IaQ3/ssTa0WqK7Z5I9DgrznTPQvlI
 cLpZNRXnaZrKkWQ9u9jpQ1H1kYK1NkA2nID1DtccPkif8jC+yKPr4ayx9fahKIiaKsdr
 phh3lTNdESULWczLNkrBnBDAiUn7DIUGQbOqMPb1He3O4oeBJqVCVa5cjSJYOHo6YT7l
 JpxldiGVucKObMxcEEn7HEgEu/IiLDrPK4KAKxQxeC193a+LSksL75UXWzje9u16EbQu Pg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa4a5sqve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:39:48 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 237INTxa028878;
 Thu, 7 Apr 2022 18:39:47 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3f6e4a8fc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:39:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 237Idkg48061580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 18:39:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C44E6124060;
 Thu,  7 Apr 2022 18:39:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0012F124052;
 Thu,  7 Apr 2022 18:39:45 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.114.26])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Apr 2022 18:39:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH v2 2/2] leds: pca955x: Add HW blink support
Date: Thu,  7 Apr 2022 13:39:41 -0500
Message-Id: <20220407183941.36555-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407183941.36555-1-eajames@linux.ibm.com>
References: <20220407183941.36555-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oIO0d2NM1t2JCyydWFUIgkPkcCOX6hCn
X-Proofpoint-GUID: oIO0d2NM1t2JCyydWFUIgkPkcCOX6hCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_04,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070092
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

Support blinking using the PCA955x chip. Use PWM0 for blinking
instead of LED_HALF brightness. Since there is only one frequency
and brightness register for any blinking LED, track the blink state
of each LED and only support one HW blinking frequency. If another
frequency is requested, fallback to software blinking.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 224 +++++++++++++++++++++++++++---------
 1 file changed, 170 insertions(+), 54 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index dd51f40973d8..d1bbcbbaab68 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -62,6 +62,8 @@
 #define PCA955X_GPIO_HIGH	LED_OFF
 #define PCA955X_GPIO_LOW	LED_FULL
 
+#define PCA955X_BLINK_DEFAULT	1000
+
 enum pca955x_type {
 	pca9550,
 	pca9551,
@@ -74,6 +76,7 @@ struct pca955x_chipdef {
 	int			bits;
 	u8			slv_addr;	/* 7-bit slave address mask */
 	int			slv_addr_shift;	/* Number of bits to ignore */
+	int			blink_div;	/* PSC divider */
 };
 
 static struct pca955x_chipdef pca955x_chipdefs[] = {
@@ -81,26 +84,31 @@ static struct pca955x_chipdef pca955x_chipdefs[] = {
 		.bits		= 2,
 		.slv_addr	= /* 110000x */ 0x60,
 		.slv_addr_shift	= 1,
+		.blink_div	= 44,
 	},
 	[pca9551] = {
 		.bits		= 8,
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
+		.blink_div	= 38,
 	},
 	[pca9552] = {
 		.bits		= 16,
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
+		.blink_div	= 44,
 	},
 	[ibm_pca9552] = {
 		.bits		= 16,
 		.slv_addr	= /* 0110xxx */ 0x30,
 		.slv_addr_shift	= 3,
+		.blink_div	= 44,
 	},
 	[pca9553] = {
 		.bits		= 4,
 		.slv_addr	= /* 110001x */ 0x62,
 		.slv_addr_shift	= 1,
+		.blink_div	= 44,
 	},
 };
 
@@ -119,7 +127,9 @@ struct pca955x {
 	struct pca955x_led *leds;
 	struct pca955x_chipdef	*chipdef;
 	struct i2c_client	*client;
+	unsigned long active_blink;
 	unsigned long active_pins;
+	unsigned long blink_period;
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 	struct gpio_chip gpio;
 #endif
@@ -168,7 +178,7 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
 
 /*
  * Write to frequency prescaler register, used to program the
- * period of the PWM output.  period = (PSCx + 1) / 38
+ * period of the PWM output.  period = (PSCx + 1) / <38 or 44, chip dependent>
  */
 static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
 {
@@ -254,6 +264,21 @@ static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
 	return 0;
 }
 
+static int pca955x_read_psc(struct pca955x *pca955x, int n, u8 *val)
+{
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
+	if (ret < 0) {
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
+			__func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
+}
+
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
 	struct pca955x_led *pca955x_led = container_of(led_cdev,
@@ -275,7 +300,10 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 		ret = LED_OFF;
 		break;
 	case PCA955X_LS_BLINK0:
-		ret = LED_HALF;
+		ret = pca955x_read_pwm(pca955x, 0, &pwm);
+		if (ret)
+			return ret;
+		ret = 256 - pwm;
 		break;
 	case PCA955X_LS_BLINK1:
 		ret = pca955x_read_pwm(pca955x, 1, &pwm);
@@ -306,29 +334,36 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	if (ret)
 		goto out;
 
-	switch (value) {
-	case LED_FULL:
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
-		break;
-	case LED_OFF:
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
-		break;
-	case LED_HALF:
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
-		break;
-	default:
-		/*
-		 * Use PWM1 for all other values.  This has the unwanted
-		 * side effect of making all LEDs on the chip share the
-		 * same brightness level if set to a value other than
-		 * OFF, HALF, or FULL.  But, this is probably better than
-		 * just turning off for all other values.
-		 */
-		ret = pca955x_write_pwm(pca955x, 1, 255 - value);
-		if (ret)
+	if (test_bit(pca955x_led->led_num, &pca955x->active_blink)) {
+		if (value == LED_OFF) {
+			clear_bit(pca955x_led->led_num, &pca955x->active_blink);
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
+		} else {
+			ret = pca955x_write_pwm(pca955x, 0, 256 - value);
 			goto out;
-		ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
-		break;
+		}
+	} else {
+		switch (value) {
+		case LED_FULL:
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_ON);
+			break;
+		case LED_OFF:
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
+			break;
+		default:
+			/*
+			 * Use PWM1 for all other values. This has the unwanted
+			 * side effect of making all LEDs on the chip share the
+			 * same brightness level if set to a value other than
+			 * OFF or FULL. But, this is probably better than just
+			 * turning off for all other values.
+			 */
+			ret = pca955x_write_pwm(pca955x, 1, 255 - value);
+			if (ret)
+				goto out;
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK1);
+			break;
+		}
 	}
 
 	ret = pca955x_write_ls(pca955x, reg, ls);
@@ -339,6 +374,96 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static u8 pca955x_period_to_psc(struct pca955x *pca955x, unsigned long p)
+{
+	p *= (unsigned long)pca955x->chipdef->blink_div;
+	p /= 1000;
+	p -= 1;
+
+	return (u8)p;
+}
+
+static unsigned long pca955x_psc_to_period(struct pca955x *pca955x, u8 psc)
+{
+	unsigned long p = (unsigned long)psc;
+
+	p += 1;
+	p *= 1000;
+	p /= (unsigned long)pca955x->chipdef->blink_div;
+
+	return p;
+}
+
+static int pca955x_led_blink(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct pca955x_led *pca955x_led = container_of(led_cdev,
+						      struct pca955x_led,
+						      led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	int ret;
+	unsigned long p = *delay_on + *delay_off;
+
+	mutex_lock(&pca955x->lock);
+
+	if (!p) {
+		p = pca955x->active_blink ? pca955x->blink_period :
+			PCA955X_BLINK_DEFAULT;
+	} else {
+		if (*delay_on != *delay_off) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (p < pca955x_psc_to_period(pca955x, 0) ||
+		    p > pca955x_psc_to_period(pca955x, 0xff)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	if (!pca955x->active_blink ||
+	    pca955x->active_blink == BIT(pca955x_led->led_num) ||
+	    pca955x->blink_period == p) {
+		u8 psc = pca955x_period_to_psc(pca955x, p);
+
+		if (!test_and_set_bit(pca955x_led->led_num,
+				      &pca955x->active_blink)) {
+			u8 ls;
+			int reg = pca955x_led->led_num / 4;
+			int bit = pca955x_led->led_num % 4;
+
+			ret = pca955x_read_ls(pca955x, reg, &ls);
+			if (ret)
+				goto out;
+
+			ls = pca955x_ledsel(ls, bit, PCA955X_LS_BLINK0);
+			ret = pca955x_write_ls(pca955x, reg, ls);
+			if (ret)
+				goto out;
+		}
+
+		if (pca955x->blink_period != p) {
+			pca955x->blink_period = p;
+			ret = pca955x_write_psc(pca955x, 0, psc);
+			if (ret)
+				goto out;
+		}
+
+		p = pca955x_psc_to_period(pca955x, psc);
+		p /= 2;
+		*delay_on = p;
+		*delay_off = p;
+	} else {
+		ret = -EBUSY;
+	}
+
+out:
+	mutex_unlock(&pca955x->lock);
+
+	return ret;
+}
+
 #ifdef CONFIG_LEDS_PCA955X_GPIO
 /*
  * Read the INPUT register, which contains the state of LEDs.
@@ -494,8 +619,9 @@ static int pca955x_probe(struct i2c_client *client)
 	u8 ls1[4];
 	u8 ls2[4];
 	struct pca955x_platform_data *pdata;
+	u8 psc0;
+	bool keep_psc0 = false;
 	bool set_default_label = false;
-	bool keep_pwm = false;
 	char default_label[8];
 	enum pca955x_type chip_type;
 	const void *md = device_get_match_data(&client->dev);
@@ -559,6 +685,7 @@ static int pca955x_probe(struct i2c_client *client)
 	mutex_init(&pca955x->lock);
 	pca955x->client = client;
 	pca955x->chipdef = chip;
+	pca955x->blink_period = PCA955X_BLINK_DEFAULT;
 
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
@@ -588,15 +715,21 @@ static int pca955x_probe(struct i2c_client *client)
 			led = &pca955x_led->led_cdev;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
+			led->blink_set = pca955x_led_blink;
 
 			if (pdata->leds[i].default_state ==
-			    LEDS_GPIO_DEFSTATE_OFF)
+			    LEDS_GPIO_DEFSTATE_OFF) {
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit,
 							  PCA955X_LS_LED_OFF);
-			else if (pdata->leds[i].default_state ==
-				   LEDS_GPIO_DEFSTATE_ON)
+			} else if (pdata->leds[i].default_state ==
+				   LEDS_GPIO_DEFSTATE_ON) {
 				ls2[reg] = pca955x_ledsel(ls2[reg], bit,
 							  PCA955X_LS_LED_ON);
+			} else if (pca955x_ledstate(ls2[reg], bit) ==
+				   PCA955X_LS_BLINK0) {
+				keep_psc0 = true;
+				set_bit(i, &pca955x->active_blink);
+			}
 
 			init_data.fwnode = pdata->leds[i].fwnode;
 
@@ -624,20 +757,6 @@ static int pca955x_probe(struct i2c_client *client)
 				return err;
 
 			set_bit(i, &pca955x->active_pins);
-
-			/*
-			 * For default-state == "keep", let the core update the
-			 * brightness from the hardware, then check the
-			 * brightness to see if it's using PWM1. If so, PWM1
-			 * should not be written below.
-			 */
-			if (pdata->leds[i].default_state ==
-			    LEDS_GPIO_DEFSTATE_KEEP) {
-				if (led->brightness != LED_FULL &&
-				    led->brightness != LED_OFF &&
-				    led->brightness != LED_HALF)
-					keep_pwm = true;
-			}
 		}
 	}
 
@@ -649,22 +768,19 @@ static int pca955x_probe(struct i2c_client *client)
 		}
 	}
 
-	/* PWM0 is used for half brightness or 50% duty cycle */
-	err = pca955x_write_pwm(pca955x, 0, 255 - LED_HALF);
-	if (err)
-		return err;
-
-	if (!keep_pwm) {
-		/* PWM1 is used for variable brightness, default to OFF */
-		err = pca955x_write_pwm(pca955x, 1, 0);
-		if (err)
-			return err;
+	if (!keep_psc0) {
+		psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
+		err = pca955x_write_psc(pca955x, 0, psc0);
+	} else {
+		err = pca955x_read_psc(pca955x, 0, &psc0);
 	}
 
-	/* Set to fast frequency so we do not see flashing */
-	err = pca955x_write_psc(pca955x, 0, 0);
 	if (err)
 		return err;
+
+	pca955x->blink_period = pca955x_psc_to_period(pca955x, psc0);
+
+	/* Set PWM1 to fast frequency so we do not see flashing */
 	err = pca955x_write_psc(pca955x, 1, 0);
 	if (err)
 		return err;
-- 
2.27.0

