Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F740EC75
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VVh0hbDz2yM7
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EH5AZ4iF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EH5AZ4iF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQN4B3Nz2xrL
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:48 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKtBLT027392; 
 Thu, 16 Sep 2021 17:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5Ww1TOZNG3TPnLqj971/ZabQ+OA9qJikXzfE0bodOJY=;
 b=EH5AZ4iFPsay6kpkSI71HcRS+FztRXDVHlFQioR+LZuw458lTNczNzGVnTiU0hSV15Dq
 TYX7GhfiMFK/jvs/PMh7E2WmcFUdithnFSvaL27JNV1y56glc9hbkb3qbwlgrgLFi4rg
 tNeS0s9kYFEim5yFxUyrALApOH7c1/0ap5QgP32qIUMGH1Ore0HIhMMWhaWWRVxCHvNb
 keltG7oROWRTNDZ+nRiak4ZUcDw3YDY5g2KIa9RYBxKIxRW5Xk6lsq8OGUePDZDQRvwz
 yLenpnS69GRsmiGezMXNXxcb1kb/mCuSEvxJwRwoCtaki21aPGyK/AOcPLEDfLIM+h3z vA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b462g3be4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:45 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GLB9xY008292;
 Thu, 16 Sep 2021 21:21:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 3b0m3bcsnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLhOJ17695170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3FFBAC065;
 Thu, 16 Sep 2021 21:21:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87501AC05F;
 Thu, 16 Sep 2021 21:21:43 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 5/7] leds: pca955x: Implement the default-state
 property
Date: Thu, 16 Sep 2021 16:21:38 -0500
Message-Id: <20210916212140.33915-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
References: <20210916212140.33915-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9Px9O--BIhVxsa74O8lgG3k4d0PUJHzw
X-Proofpoint-ORIG-GUID: 9Px9O--BIhVxsa74O8lgG3k4d0PUJHzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160122
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

In order to retain the LED state after a system reboot, check the
documented default-state device tree property during initialization.
Modify the behavior of the probe according to the property.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-pca955x.c | 54 +++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index e47ba7c3b7c7..fa1d77d86ef6 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -129,6 +129,7 @@ struct pca955x_led {
 	int			led_num;	/* 0 .. 15 potentially */
 	char			name[32];
 	u32			type;
+	int			default_state;
 	const char		*default_trigger;
 };
 
@@ -439,6 +440,7 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 
 	device_for_each_child_node(&client->dev, child) {
 		const char *name;
+		const char *state;
 		u32 reg;
 		int res;
 
@@ -457,6 +459,18 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		fwnode_property_read_u32(child, "type", &led->type);
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->default_trigger);
+
+		if (!fwnode_property_read_string(child, "default-state",
+						 &state)) {
+			if (!strcmp(state, "keep"))
+				led->default_state = LEDS_GPIO_DEFSTATE_KEEP;
+			else if (!strcmp(state, "on"))
+				led->default_state = LEDS_GPIO_DEFSTATE_ON;
+			else
+				led->default_state = LEDS_GPIO_DEFSTATE_OFF;
+		} else {
+			led->default_state = LEDS_GPIO_DEFSTATE_OFF;
+		}
 	}
 
 	pdata->num_leds = chip->bits;
@@ -485,6 +499,7 @@ static int pca955x_probe(struct i2c_client *client,
 	int i, err;
 	struct pca955x_platform_data *pdata;
 	int ngpios = 0;
+	bool keep_pwm = false;
 
 	chip = &pca955x_chipdefs[id->driver_data];
 	adapter = client->adapter;
@@ -565,14 +580,35 @@ static int pca955x_probe(struct i2c_client *client,
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
+			if (pdata->leds[i].default_state ==
+			    LEDS_GPIO_DEFSTATE_OFF) {
+				err = pca955x_led_set(led, LED_OFF);
+				if (err)
+					return err;
+			} else if (pdata->leds[i].default_state ==
+				   LEDS_GPIO_DEFSTATE_ON) {
+				err = pca955x_led_set(led, LED_FULL);
+				if (err)
+					return err;
+			}
+
 			err = devm_led_classdev_register(&client->dev, led);
 			if (err)
 				return err;
 
-			/* Turn off LED */
-			err = pca955x_led_set(led, LED_OFF);
-			if (err)
-				return err;
+			/*
+			 * For default-state == "keep", let the core update the
+			 * brightness from the hardware, then check the
+			 * brightness to see if it's using PWM1. If so, PWM1
+			 * should not be written below.
+			 */
+			if (pdata->leds[i].default_state ==
+			    LEDS_GPIO_DEFSTATE_KEEP) {
+				if (led->brightness != LED_FULL &&
+				    led->brightness != LED_OFF &&
+				    led->brightness != LED_HALF)
+					keep_pwm = true;
+			}
 		}
 	}
 
@@ -581,10 +617,12 @@ static int pca955x_probe(struct i2c_client *client,
 	if (err)
 		return err;
 
-	/* PWM1 is used for variable brightness, default to OFF */
-	err = pca955x_write_pwm(client, 1, 0);
-	if (err)
-		return err;
+	if (!keep_pwm) {
+		/* PWM1 is used for variable brightness, default to OFF */
+		err = pca955x_write_pwm(client, 1, 0);
+		if (err)
+			return err;
+	}
 
 	/* Set to fast frequency so we do not see flashing */
 	err = pca955x_write_psc(client, 0, 0);
-- 
2.27.0

