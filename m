Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD92F598E
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2019 22:23:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478tYY51rPzF3br
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2019 08:23:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478tM720LzzF5tH
 for <openbmc@lists.ozlabs.org>; Sat,  9 Nov 2019 08:14:42 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA8LALnw023896; Fri, 8 Nov 2019 16:14:38 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5bk794vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 16:14:38 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA8L9Y6q012094;
 Fri, 8 Nov 2019 21:14:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 2w41ujwhh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Nov 2019 21:14:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA8LEag249873396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Nov 2019 21:14:36 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 808C1C6057;
 Fri,  8 Nov 2019 21:14:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35F23C6055;
 Fri,  8 Nov 2019 21:14:36 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  8 Nov 2019 21:14:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/2] hwmon: (pmbus/ibm-cffps) Add version
 detection capability
Date: Fri,  8 Nov 2019 15:14:34 -0600
Message-Id: <1573247675-17611-2-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1573247675-17611-1-git-send-email-eajames@linux.ibm.com>
References: <1573247675-17611-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-08_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911080204
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some systems may plug in either version 1 or version 2 of the IBM common
form factor power supply. Add a version-less compatibility string that
tells the driver to try and detect which version of the power supply is
connected.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/1570648262-25383-3-git-send-email-eajames@linux.ibm.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index d44745e..d61547e 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -3,6 +3,7 @@
  * Copyright 2017 IBM Corp.
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
@@ -29,6 +30,10 @@
 #define CFFPS_INPUT_HISTORY_CMD			0xD6
 #define CFFPS_INPUT_HISTORY_SIZE		100
 
+#define CFFPS_CCIN_VERSION			GENMASK(15, 8)
+#define CFFPS_CCIN_VERSION_1			 0x2b
+#define CFFPS_CCIN_VERSION_2			 0x2e
+
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
 #define CFFPS_MFR_THERMAL_FAULT			BIT(1)
@@ -54,7 +59,7 @@ enum {
 	CFFPS_DEBUGFS_NUM_ENTRIES
 };
 
-enum versions { cffps1, cffps2 };
+enum versions { cffps1, cffps2, cffps_unknown };
 
 struct ibm_cffps_input_history {
 	struct mutex update_lock;
@@ -395,7 +400,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 			   const struct i2c_device_id *id)
 {
 	int i, rc;
-	enum versions vs;
+	enum versions vs = cffps_unknown;
 	struct dentry *debugfs;
 	struct dentry *ibm_cffps_dir;
 	struct ibm_cffps *psu;
@@ -405,8 +410,27 @@ static int ibm_cffps_probe(struct i2c_client *client,
 		vs = (enum versions)md;
 	else if (id)
 		vs = (enum versions)id->driver_data;
-	else
-		vs = cffps1;
+
+	if (vs == cffps_unknown) {
+		u16 ccin_version = CFFPS_CCIN_VERSION_1;
+		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
+
+		if (ccin > 0)
+			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
+
+		switch (ccin_version) {
+		default:
+		case CFFPS_CCIN_VERSION_1:
+			vs = cffps1;
+			break;
+		case CFFPS_CCIN_VERSION_2:
+			vs = cffps2;
+			break;
+		}
+
+		/* Set the client name to include the version number. */
+		snprintf(client->name, I2C_NAME_SIZE, "cffps%d", vs + 1);
+	}
 
 	client->dev.platform_data = &ibm_cffps_pdata;
 	rc = pmbus_do_probe(client, id, &ibm_cffps_info[vs]);
@@ -465,6 +489,7 @@ static int ibm_cffps_probe(struct i2c_client *client,
 static const struct i2c_device_id ibm_cffps_id[] = {
 	{ "ibm_cffps1", cffps1 },
 	{ "ibm_cffps2", cffps2 },
+	{ "ibm_cffps", cffps_unknown },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ibm_cffps_id);
@@ -478,6 +503,10 @@ static int ibm_cffps_probe(struct i2c_client *client,
 		.compatible = "ibm,cffps2",
 		.data = (void *)cffps2
 	},
+	{
+		.compatible = "ibm,cffps",
+		.data = (void *)cffps_unknown
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, ibm_cffps_of_match);
-- 
1.8.3.1

