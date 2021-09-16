Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C162840EC70
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 23:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9VT65Vw9z2yLg
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 07:24:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UfLUZ5bn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UfLUZ5bn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9VQN1xQnz2y8R
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 07:21:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GKecRZ025809; 
 Thu, 16 Sep 2021 17:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2rfpFtNjUPOKtQQpDTbQdXk7BJhNPc43BJTJ8wFssg8=;
 b=UfLUZ5bni9pRy0GkaiBalCFx+jDYuzS1RtH74J/pfK3s5lCq19SmbFBxLt1OyKoBEY7x
 afvySDZLF7ISYOjqXNzYO7Q+wEGeRkf/CrmODp9ZKXI4AIed+TZJwny5KvjVeiiiPWPO
 dQ42k3P3pqt0tPjsEipWtIX09g4cag0KPIVZBMZqgh1sfPXzA9OZEoagcEIKo8Ez2S2P
 pkqAqyF3+XGbYVgI8/pJGHL3adbEmh4IAIoCWQ1OBqbyUyqFtZ7F2QxxkXm9u7U62t/7
 1q6BCNMuhP0qWLk85qpS6AfsfSJ3RasEQ5JeXhuwu/OF0X+g3Q7PcX4he7C7VyViYXCE Mw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b49k0wayq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 17:21:44 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18GL9qHU027310;
 Thu, 16 Sep 2021 21:21:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3b0m3f0sh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 21:21:43 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18GLLgK839256554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 21:21:42 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1025AC060;
 Thu, 16 Sep 2021 21:21:42 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 733F0AC05E;
 Thu, 16 Sep 2021 21:21:42 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.39.159])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 Sep 2021 21:21:42 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 3/7] leds: pca955x: Clean up code formatting
Date: Thu, 16 Sep 2021 16:21:36 -0500
Message-Id: <20210916212140.33915-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916212140.33915-1-eajames@linux.ibm.com>
References: <20210916212140.33915-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yVYViLA_11GRzamuQpt-DkcwT6e1aCIk
X-Proofpoint-ORIG-GUID: yVYViLA_11GRzamuQpt-DkcwT6e1aCIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-16_07,2021-09-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

Format the code. Add some variables to help shorten lines.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-pca955x.c | 63 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..f0d841cb59fc 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -166,11 +166,10 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
 static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 2*n,
-		val);
+	ret = i2c_smbus_write_byte_data(client, cmd, val);
 	if (ret < 0)
 		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
 			__func__, n, val, ret);
@@ -187,11 +186,10 @@ static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + (2 * n);
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + 2*n,
-		val);
+	ret = i2c_smbus_write_byte_data(client, cmd, val);
 	if (ret < 0)
 		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
 			__func__, n, val, ret);
@@ -205,11 +203,10 @@ static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
 static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_write_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n,
-		val);
+	ret = i2c_smbus_write_byte_data(client, cmd, val);
 	if (ret < 0)
 		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
 			__func__, n, val, ret);
@@ -223,10 +220,10 @@ static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
 static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
 {
 	struct pca955x *pca955x = i2c_get_clientdata(client);
+	u8 cmd = pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n;
 	int ret;
 
-	ret = i2c_smbus_read_byte_data(client,
-		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
+	ret = i2c_smbus_read_byte_data(client, cmd);
 	if (ret < 0) {
 		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
 			__func__, n, ret);
@@ -371,6 +368,7 @@ static struct pca955x_platform_data *
 pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 {
 	struct pca955x_platform_data *pdata;
+	struct pca955x_led *led;
 	struct fwnode_handle *child;
 	int count;
 
@@ -401,13 +399,13 @@ pca955x_get_pdata(struct i2c_client *client, struct pca955x_chipdef *chip)
 		if ((res != 0) && is_of_node(child))
 			name = to_of_node(child)->name;
 
-		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
-			 "%s", name);
+		led = &pdata->leds[reg];
+		snprintf(led->name, sizeof(led->name), "%s", name);
 
-		pdata->leds[reg].type = PCA955X_TYPE_LED;
-		fwnode_property_read_u32(child, "type", &pdata->leds[reg].type);
+		led->type = PCA955X_TYPE_LED;
+		fwnode_property_read_u32(child, "type", &led->type);
 		fwnode_property_read_string(child, "linux,default-trigger",
-					&pdata->leds[reg].default_trigger);
+					    &led->default_trigger);
 	}
 
 	pdata->num_leds = chip->bits;
@@ -426,11 +424,12 @@ static const struct of_device_id of_pca955x_match[] = {
 MODULE_DEVICE_TABLE(of, of_pca955x_match);
 
 static int pca955x_probe(struct i2c_client *client,
-					const struct i2c_device_id *id)
+			 const struct i2c_device_id *id)
 {
 	struct pca955x *pca955x;
 	struct pca955x_led *pca955x_led;
 	struct pca955x_chipdef *chip;
+	struct led_classdev *led;
 	struct i2c_adapter *adapter;
 	int i, err;
 	struct pca955x_platform_data *pdata;
@@ -449,13 +448,13 @@ static int pca955x_probe(struct i2c_client *client,
 	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
 	    chip->slv_addr) {
 		dev_err(&client->dev, "invalid slave address %02x\n",
-				client->addr);
+			client->addr);
 		return -ENODEV;
 	}
 
 	dev_info(&client->dev, "leds-pca955x: Using %s %d-bit LED driver at "
-			"slave address 0x%02x\n",
-			client->name, chip->bits, client->addr);
+		 "slave address 0x%02x\n", client->name, chip->bits,
+		 client->addr);
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
@@ -471,8 +470,8 @@ static int pca955x_probe(struct i2c_client *client,
 	if (!pca955x)
 		return -ENOMEM;
 
-	pca955x->leds = devm_kcalloc(&client->dev,
-			chip->bits, sizeof(*pca955x_led), GFP_KERNEL);
+	pca955x->leds = devm_kcalloc(&client->dev, chip->bits,
+				     sizeof(*pca955x_led), GFP_KERNEL);
 	if (!pca955x->leds)
 		return -ENOMEM;
 
@@ -501,27 +500,25 @@ static int pca955x_probe(struct i2c_client *client,
 			 */
 			if (pdata->leds[i].name[0] == '\0')
 				snprintf(pdata->leds[i].name,
-					sizeof(pdata->leds[i].name), "%d", i);
+					 sizeof(pdata->leds[i].name), "%d", i);
 
-			snprintf(pca955x_led->name,
-				sizeof(pca955x_led->name), "pca955x:%s",
-				pdata->leds[i].name);
+			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
+				 "pca955x:%s", pdata->leds[i].name);
 
+			led = &pca955x_led->led_cdev;
 			if (pdata->leds[i].default_trigger)
-				pca955x_led->led_cdev.default_trigger =
+				led->default_trigger =
 					pdata->leds[i].default_trigger;
 
-			pca955x_led->led_cdev.name = pca955x_led->name;
-			pca955x_led->led_cdev.brightness_set_blocking =
-				pca955x_led_set;
+			led->name = pca955x_led->name;
+			led->brightness_set_blocking = pca955x_led_set;
 
-			err = devm_led_classdev_register(&client->dev,
-							&pca955x_led->led_cdev);
+			err = devm_led_classdev_register(&client->dev, led);
 			if (err)
 				return err;
 
 			/* Turn off LED */
-			err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+			err = pca955x_led_set(led, LED_OFF);
 			if (err)
 				return err;
 		}
-- 
2.27.0

