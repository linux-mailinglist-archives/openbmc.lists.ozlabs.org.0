Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC840EC77
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VWS4Qxsz2yJW
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:26:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rB+gGB+6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rB+gGB+6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQP3r1cz2xrL
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:49 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKnMDT024819; 
 Thu, 16 Sep 2021 17:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MmRXfYQ118sFzhCwqPpHKDVS5Ii7ptciclmU5BABTYs=;
 b=rB+gGB+60v/K66zzdoCC755a5qwqu0knC89rf+tZrPNYh2sUUQObLPP3Inah+fi15qCq
 QZ5UETL97o76cyljAYkhz7gJnfKkJcyPWijwuORrdFV/7XyxuUToXE+EsqNexFnzhPlD
 9s9H57MXazLCCDFap6PJab2556bq9haQ+9tQH2W3+fN5D5C38I6Hs9vgERNUvDwfzXR9
 69rr5fuqCSrmqn+UgSCDVun3N1z01/CCTbmd3FozLFdb2J4u1rvaH/wb8K2N1jFxCjdO
 nxtpFaINHw9i3BSJNSunfIlVumJwb7VmixLlN6dfyRDMq/JuBM6ZWFBB7L0tvWfmZTvx Sw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b453scmgg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:46 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GLBFft011133;
 Thu, 16 Sep 2021 21:21:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3b0m3cmq1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLiAD52494618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6674CAC05F;
 Thu, 16 Sep 2021 21:21:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16310AC059;
 Thu, 16 Sep 2021 21:21:44 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 6/7] leds: pca955x: Let the core process the
 fwnode
Date: Thu, 16 Sep 2021 16:21:39 -0500
Message-Id: <20210916212140.33915-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
References: <20210916212140.33915-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0ip4KYgx__dknLIbn-AuywjZneYdoYE8
X-Proofpoint-ORIG-GUID: 0ip4KYgx__dknLIbn-AuywjZneYdoYE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Much of the fwnode processing in the PCA955x driver is now in the
LEDs core driver, so pass the fwnode in the init data when
registering the LED device. In order to preserve the existing naming
scheme, check for an empty name and set it to the LED number.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-pca955x.c | 58 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index fa1d77d86ef6..a6aa4b9abde8 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -127,10 +127,9 @@ struct pca955x_led {
 	struct pca955x	*pca955x;
 	struct led_classdev	led_cdev;
 	int			led_num;	/* 0 .. 15 potentially */
-	char			name[32];
 	u32			type;
 	int			default_state;
-	const char		*default_trigger;
+	struct fwnode_handle	*fwnode;
 };
 
 struct pca955x_platform_data {
@@ -439,7 +438,6 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		return ERR_PTR(-ENOMEM);
 
 	device_for_each_child_node(&client->dev, child) {
-		const char *name;
 		const char *state;
 		u32 reg;
 		int res;
@@ -448,17 +446,10 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		if ((res != 0) || (reg >= chip->bits))
 			continue;
 
-		res = fwnode_property_read_string(child, "label", &name);
-		if ((res != 0) && is_of_node(child))
-			name = to_of_node(child)->name;
-
 		led = &pdata->leds[reg];
-		snprintf(led->name, sizeof(led->name), "%s", name);
-
 		led->type = PCA955X_TYPE_LED;
+		led->fwnode = child;
 		fwnode_property_read_u32(child, "type", &led->type);
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led->default_trigger);
 
 		if (!fwnode_property_read_string(child, "default-state",
 						 &state)) {
@@ -495,11 +486,14 @@ static int pca955x_probe(struct i2c_client *client,
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
 	struct led_classdev *led;
+	struct led_init_data init_data;
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
 	int ngpios = 0;
+	bool set_default_label = false;
 	bool keep_pwm = false;
+	char default_label[8];
 
 	chip = &pca955x_chipdefs[id->driver_data];
 	adapter = client->adapter;
@@ -547,6 +541,9 @@ static int pca955x_probe(struct i2c_client *client,
 	pca955x->client = client;
 	pca955x->chipdef = chip;
 
+	init_data.devname_mandatory = false;
+	init_data.devicename = "pca955x";
+
 	for (i = 0; i < chip->bits; i++) {
 		pca955x_led = &pca955x->leds[i];
 		pca955x_led->led_num = i;
@@ -560,23 +557,7 @@ static int pca955x_probe(struct i2c_client *client,
 			ngpios++;
 			break;
 		case PCA955X_TYPE_LED:
-			/*
-			 * Platform data can specify LED names and
-			 * default triggers
-			 */
-			if (pdata->leds[i].name[0] == '\0')
-				snprintf(pdata->leds[i].name,
-					 sizeof(pdata->leds[i].name), "%d", i);
-
-			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
-				 "pca955x:%s", pdata->leds[i].name);
-
 			led = &pca955x_led->led_cdev;
-			if (pdata->leds[i].default_trigger)
-				led->default_trigger =
-					pdata->leds[i].default_trigger;
-
-			led->name = pca955x_led->name;
 			led->brightness_set_blocking = pca955x_led_set;
 			led->brightness_get = pca955x_led_get;
 
@@ -592,7 +573,28 @@ static int pca955x_probe(struct i2c_client *client,
 					return err;
 			}
 
-			err = devm_led_classdev_register(&client->dev, led);
+			init_data.fwnode = pdata->leds[i].fwnode;
+
+			if (is_of_node(init_data.fwnode)) {
+				if (to_of_node(init_data.fwnode)->name[0] ==
+				    '\0')
+					set_default_label = true;
+				else
+					set_default_label = false;
+			} else {
+				set_default_label = true;
+			}
+
+			if (set_default_label) {
+				snprintf(default_label, sizeof(default_label),
+					 "%d", i);
+				init_data.default_label = default_label;
+			} else {
+				init_data.default_label = NULL;
+			}
+
+			err = devm_led_classdev_register_ext(&client->dev, led,
+							     &init_data);
 			if (err)
 				return err;
 
-- 
2.27.0

