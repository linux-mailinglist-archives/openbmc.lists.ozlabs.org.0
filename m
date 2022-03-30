Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088C4ECDFB
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 22:33:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTJ7664XCz30BP
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 07:33:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oNRbIzAN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oNRbIzAN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTJ6d45nmz2xTs
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 07:33:28 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UKS7Rp027273; 
 Wed, 30 Mar 2022 20:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=kcf/82b6SUQ3yZYUpTVdE9S+6JOprRKCJ8nUpvyBIcw=;
 b=oNRbIzAN6FMwE49TtF+aJijk/4RR3dxnSVR+B/yNXR1C4OOYeZmMyqbVsc2Qi2IaDFrk
 ide4JUNQA98JQxHTvEagkP6OaiQZu4IeEfGpdF38SJoxpe7j+0nZ0+wgq+wwxesxz+uJ
 6HPPy1hwKh5j6a1IjHJL7j2SSFNvn4C9FHSEI4pfkXG2ITYmlTKojpzWrsj1qKdcCrxg
 KmjzG3bEf2n77ksbrGvnvJnZjlLcDumtjCNwS0Nwaw+yErliTyAuNDWIqmww/G8czp8y
 ZBirIDLhq8bFX4uJVqEHaEULVuldm3Kph6dFJAYHMtFSUib5lg/7TZTQ8bNyhBssgt5y Rw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4we493wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 20:33:23 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UKJfEg029809;
 Wed, 30 Mar 2022 20:33:22 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3f1tf9qntr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 20:33:22 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UKXLfC19595668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 20:33:21 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8F796E04E;
 Wed, 30 Mar 2022 20:33:21 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DC9D6E058;
 Wed, 30 Mar 2022 20:33:21 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.74.63])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 20:33:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-leds@vger.kernel.org
Subject: [PATCH] leds: pca955x: Add HW blink support
Date: Wed, 30 Mar 2022 15:33:18 -0500
Message-Id: <20220330203318.19225-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: b7kEhhJyvgbQD-VUo789u0T_kJBBwqhK
X-Proofpoint-GUID: b7kEhhJyvgbQD-VUo789u0T_kJBBwqhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300099
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
 linux-kernel@vger.kernel.org, pavel@ucw.cz, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support blinking using the PCA955x chip. Use PWM0 for blinking
instead of LED_HALF brightness. Since there is only one frequency
and brightness register for any blinking LED, all blinked LEDs on
the chip will have the same frequency and brightness.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/leds-pca955x.c | 175 ++++++++++++++++++++++++------------
 1 file changed, 120 insertions(+), 55 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 81aaf21212d7..aeddc64e8ecf 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -74,6 +74,7 @@ struct pca955x_chipdef {
 	int			bits;
 	u8			slv_addr;	/* 7-bit slave address mask */
 	int			slv_addr_shift;	/* Number of bits to ignore */
+	int			blink_div;	/* PSC divider */
 };
 
 static struct pca955x_chipdef pca955x_chipdefs[] = {
@@ -81,26 +82,31 @@ static struct pca955x_chipdef pca955x_chipdefs[] = {
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
 
@@ -163,7 +169,7 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 
 /*
  * Write to frequency prescaler register, used to program the
- * period of the PWM output.  period = (PSCx + 1) / 38
+ * period of the PWM output.  period = (PSCx + 1) / <38 or 44, chip dependent>
  */
 static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
@@ -273,13 +279,16 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 		ret = LED_OFF;
 		break;
 	case PCA955X_LS_BLINK0:
-		ret = LED_HALF;
+		ret = pca955x_read_pwm(pca955x->client, 0, &pwm);
+		if (ret)
+			return ret;
+		ret = 256 - pwm;
 		break;
 	case PCA955X_LS_BLINK1:
 		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
 		if (ret)
 			return ret;
-		ret = 255 - pwm;
+		ret = 256 - pwm;
 		break;
 	}
 
@@ -308,32 +317,98 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 	if (ret)
 		goto out;
 
-	switch (value) {
-	case LED_FULL:
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
-		break;
-	case LED_OFF:
+	if (value == LED_OFF) {
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
-		break;
-	case LED_HALF:
+	} else {
+		u8 tls = (ls >> (ls_led << 1)) & 0x3;
+
+		if (tls == PCA955X_LS_BLINK0) {
+			ret = pca955x_write_pwm(pca955x->client, 0,
+						256 - value);
+			goto out;
+		} else {
+			if (value == LED_FULL) {
+				ls = pca955x_ledsel(ls, ls_led,
+						    PCA955X_LS_LED_ON);
+			} else {
+				/*
+				 * Use PWM1 for all other values. This has the
+				 * unwanted side effect of making all LEDs on
+				 * the chip share the same brightness level if
+				 * set to a value other than OFF or FULL. But,
+				 * this is probably better than just turning
+				 * off for all other values.
+				 */
+				ret = pca955x_write_pwm(pca955x->client, 1,
+							256 - value);
+				if (ret || tls == PCA955X_LS_BLINK1)
+					goto out;
+				ls = pca955x_ledsel(ls, ls_led,
+						    PCA955X_LS_BLINK1);
+			}
+		}
+	}
+
+	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
+
+out:
+	mutex_unlock(&pca955x->lock);
+
+	return ret;
+}
+
+static int pca955x_led_blink(struct led_classdev *led_cdev,
+			     unsigned long *delay_on, unsigned long *delay_off)
+{
+	int chip_ls;
+	int ls_led;
+	int ret;
+	u8 ls;
+	struct pca955x_led *pca955x_led = container_of(led_cdev,
+						      struct pca955x_led,
+						      led_cdev);
+	struct pca955x *pca955x = pca955x_led->pca955x;
+	unsigned long p = *delay_on + *delay_off;
+
+	/* 1 Hz default */
+	if (!p)
+		p = 1000;
+
+	p *= (unsigned long)pca955x->chipdef->blink_div;
+	p /= 1000;
+	p -= 1;
+
+	chip_ls = pca955x_led->led_num / 4;
+	ls_led = pca955x_led->led_num % 4;
+
+	mutex_lock(&pca955x->lock);
+
+	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
+	if (ret)
+		goto out;
+
+	/*
+	 * All blinking leds on the PCA955x chip will use the same period and
+	 * brightness.
+	 */
+	ret = pca955x_write_psc(pca955x->client, 0, (u8)p);
+	if (ret)
+		goto out;
+
+	if (((ls >> (ls_led << 1)) & 0x3) != PCA955X_LS_BLINK0) {
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
-		break;
-	default:
-		/*
-		 * Use PWM1 for all other values.  This has the unwanted
-		 * side effect of making all LEDs on the chip share the
-		 * same brightness level if set to a value other than
-		 * OFF, HALF, or FULL.  But, this is probably better than
-		 * just turning off for all other values.
-		 */
-		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
+		ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
 		if (ret)
 			goto out;
-		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
-		break;
 	}
 
-	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
+	p += 1;
+	p *= 1000;
+	p /= (unsigned long)pca955x->chipdef->blink_div;
+	p /= 2;
+
+	*delay_on = p;
+	*delay_off = p;
 
 out:
 	mutex_unlock(&pca955x->lock);
@@ -495,7 +570,6 @@ static int pca955x_probe(struct i2c_client *client)
 	int i, err;
 	struct pca955x_platform_data *pdata;
 	bool set_default_label = false;
-	bool keep_pwm = false;
 	char default_label[8];
 	enum pca955x_type chip_type;
 	const void *md = device_get_match_data(&client->dev);
@@ -577,6 +651,7 @@ static int pca955x_probe(struct i2c_client *client)
 			led = &pca955x_led->led_cdev;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
+			led->blink_set = pca955x_led_blink;
 
 			if (pdata->leds[i].default_state ==
 			    LEDS_GPIO_DEFSTATE_OFF) {
@@ -585,9 +660,28 @@ static int pca955x_probe(struct i2c_client *client)
 					return err;
 			} else if (pdata->leds[i].default_state ==
 				   LEDS_GPIO_DEFSTATE_ON) {
-				err = pca955x_led_set(led, LED_FULL);
+				/*
+				 * handle this case specially in order to turn
+				 * off blinking, which pca955x_led_set won't do
+				 */
+				u8 ls;
+				int chip_ls = i / 4;
+				int ls_led = i % 4;
+
+				err = pca955x_read_ls(pca955x->client, chip_ls,
+						      &ls);
 				if (err)
 					return err;
+
+				if (((ls >> (ls_led << 1)) & 0x3) !=
+				    PCA955X_LS_LED_ON) {
+					ls = pca955x_ledsel(ls, ls_led,
+							    PCA955X_LS_LED_ON);
+					err = pca955x_write_ls(pca955x->client,
+							       chip_ls, ls);
+					if (err)
+						return err;
+				}
 			}
 
 			init_data.fwnode = pdata->leds[i].fwnode;
@@ -616,39 +710,10 @@ static int pca955x_probe(struct i2c_client *client)
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
 
-	/* PWM0 is used for half brightness or 50% duty cycle */
-	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
-	if (err)
-		return err;
-
-	if (!keep_pwm) {
-		/* PWM1 is used for variable brightness, default to OFF */
-		err = pca955x_write_pwm(client, 1, 0);
-		if (err)
-			return err;
-	}
-
-	/* Set to fast frequency so we do not see flashing */
-	err = pca955x_write_psc(client, 0, 0);
-	if (err)
-		return err;
+	/* Set PWM1 to fast frequency so we do not see flashing */
 	err = pca955x_write_psc(client, 1, 0);
 	if (err)
 		return err;
-- 
2.27.0

