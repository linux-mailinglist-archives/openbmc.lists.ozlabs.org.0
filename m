Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97D4FC22D
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 18:23:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcZ0z0lL7z3bYZ
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 02:23:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bj8PZYdW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bj8PZYdW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcYxW1CDBz2yWN
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 02:20:46 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BF2vI3004195; 
 Mon, 11 Apr 2022 16:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pr74oav5M7toJaL5SGGsPg2j48SzXxZv8d8aAXU7F+k=;
 b=Bj8PZYdWV4xFR1vk6EWZGcrJzUaoqhHRdVod60Q3lrPa/gUDyjq5/hMPaOPx8CaTZFfX
 4Dkkg/MdhoG69hWkh6OLaTGkI2osXH6G1rwJcDQfrrCUixliWVwb+zWMK3F5ipenaaxL
 H8TtrxQqKABri2sF1mhL7c3OM3ugCzgrwT2v3cJa4EV3f8hl46bj12QLWZrysEzrH5iv
 I7GVO/IcER/o9khsRHoRNUY8q3oVcihpyokzORdWPYiPQMyw8m0oxE6493xLGlBN3u/W
 62vJ3m3sHwd8VxaFY+JRqKpd0D8rQba7F5MJ0BMCEMVnKRfZvmLgLvpxbT5D5KPN7lGh Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghn7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:44 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BFrkEh018611;
 Mon, 11 Apr 2022 16:20:43 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcpmghn7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:43 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BGDea7008236;
 Mon, 11 Apr 2022 16:20:42 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3fb1s9w6eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:20:42 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BGKfam24183212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:20:41 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BB6A124058;
 Mon, 11 Apr 2022 16:20:41 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BA46124054;
 Mon, 11 Apr 2022 16:20:40 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.106.206])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 16:20:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH v3 4/4] leds: pca955x: Add HW blink support
Date: Mon, 11 Apr 2022 11:20:33 -0500
Message-Id: <20220411162033.39613-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220411162033.39613-1-eajames@linux.ibm.com>
References: <20220411162033.39613-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lMsxGr2Bhz0_skECN1_hVG1GIrY0jMuu
X-Proofpoint-GUID: P4y1bQdzYufdFiHTB6Cu0CTbodBzRrN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
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

Support blinking using the PCA955x chip. Use PWM0 for blinking
instead of LED_HALF brightness. Since there is only one frequency
and brightness register for any blinking LED, track the blink state
of each LED and only support one HW blinking frequency. If another
frequency is requested, fallback to software blinking.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 222 +++++++++++++++++++++++++++---------
 1 file changed, 168 insertions(+), 54 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 61f3cb84a945..7c156de215d7 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -62,6 +62,8 @@
 #define PCA955X_GPIO_HIGH	LED_OFF
 #define PCA955X_GPIO_LOW	LED_FULL
 
+#define PCA955X_BLINK_DEFAULT_MS	1000
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
@@ -170,7 +180,8 @@ static inline int pca955x_ledstate(u8 ls, int led_num)
 
 /*
  * Write to frequency prescaler register, used to program the
- * period of the PWM output.  period = (PSCx + 1) / 38
+ * period of the PWM output.  period = (PSCx + 1) / coeff
+ * Where for pca9551 chips coeff = 38 and for all other chips coeff = 44
  */
 static int pca955x_write_psc(struct pca955x *pca955x, int n, u8 val)
 {
@@ -251,6 +262,20 @@ static int pca955x_read_pwm(struct pca955x *pca955x, int n, u8 *val)
 	return 0;
 }
 
+static int pca955x_read_psc(struct pca955x *pca955x, int n, u8 *val)
+{
+	u8 cmd = pca955x_num_input_regs(pca955x->chipdef->bits) + (2 * n);
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(pca955x->client, cmd);
+	if (ret < 0) {
+		dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n", __func__, n, ret);
+		return ret;
+	}
+	*val = (u8)ret;
+	return 0;
+}
+
 static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 {
 	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
@@ -270,7 +295,10 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
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
@@ -299,29 +327,36 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
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
@@ -332,6 +367,94 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static u8 pca955x_period_to_psc(struct pca955x *pca955x, unsigned long p)
+{
+	p *= pca955x->chipdef->blink_div;
+	p /= MSEC_PER_SEC;
+	p -= 1;
+
+	return p;
+}
+
+static unsigned long pca955x_psc_to_period(struct pca955x *pca955x, u8 psc)
+{
+	unsigned long p = psc;
+
+	p += 1;
+	p *= MSEC_PER_SEC;
+	p /= pca955x->chipdef->blink_div;
+
+	return p;
+}
+
+static int pca955x_led_blink(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct pca955x_led *pca955x_led = led_to_pca955x(led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	unsigned long p = *delay_on + *delay_off;
+	int ret;
+
+	mutex_lock(&pca955x->lock);
+
+	if (p) {
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
+	} else {
+		p = pca955x->active_blink ? pca955x->blink_period :
+			PCA955X_BLINK_DEFAULT_MS;
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
@@ -487,8 +610,9 @@ static int pca955x_probe(struct i2c_client *client)
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
@@ -552,6 +676,7 @@ static int pca955x_probe(struct i2c_client *client)
 	mutex_init(&pca955x->lock);
 	pca955x->client = client;
 	pca955x->chipdef = chip;
+	pca955x->blink_period = PCA955X_BLINK_DEFAULT_MS;
 
 	init_data.devname_mandatory = false;
 	init_data.devicename = "pca955x";
@@ -581,15 +706,21 @@ static int pca955x_probe(struct i2c_client *client)
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
 
@@ -617,20 +748,6 @@ static int pca955x_probe(struct i2c_client *client)
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
 
@@ -642,22 +759,19 @@ static int pca955x_probe(struct i2c_client *client)
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
+	if (keep_psc0) {
+		err = pca955x_read_psc(pca955x, 0, &psc0);
+	} else {
+		psc0 = pca955x_period_to_psc(pca955x, pca955x->blink_period);
+		err = pca955x_write_psc(pca955x, 0, psc0);
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

