Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E89F1F48
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 20:51:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477ccV4zcXzF4YN
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 06:51:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477cWz2JrvzDqwL
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 06:47:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA6JkTcR080257; Wed, 6 Nov 2019 14:47:56 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w41w4d7nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 14:47:55 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA6Jj0lN025090;
 Wed, 6 Nov 2019 19:47:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2w41uj9b9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Nov 2019 19:47:54 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA6Jlrqr62456304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 19:47:53 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E9DAC605A;
 Wed,  6 Nov 2019 19:47:53 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4D3DC6057;
 Wed,  6 Nov 2019 19:47:52 +0000 (GMT)
Received: from wisp4.ibm.com (unknown [9.163.22.179])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Nov 2019 19:47:52 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 2/2] hwmon: (pmbus/ibm-cffps) Fix LED blink
 behavior
Date: Wed,  6 Nov 2019 13:47:46 -0600
Message-Id: <20191106194746.27118-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106194746.27118-1-eajames@linux.ibm.com>
References: <20191106194746.27118-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=866 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911060194
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The LED blink_set function incorrectly did not tell the PSU LED to blink
if brightness was LED_OFF. Fix this, and also correct the LED_OFF
command data, which should give control of the LED back to the PSU
firmware. Also prevent I2C failures from getting the driver LED state
out of sync and add some dev_dbg statements.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index aa4cdbbb100a..929c909ac27a 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -39,9 +39,13 @@
 #define CFFPS_MFR_VAUX_FAULT			BIT(6)
 #define CFFPS_MFR_CURRENT_SHARE_WARNING		BIT(7)
 
+/*
+ * LED off state actually relinquishes LED control to PSU firmware, so it can
+ * turn on the LED for faults.
+ */
+#define CFFPS_LED_OFF				0
 #define CFFPS_LED_BLINK				BIT(0)
 #define CFFPS_LED_ON				BIT(1)
-#define CFFPS_LED_OFF				BIT(2)
 #define CFFPS_BLINK_RATE_MS			250
 
 enum {
@@ -296,23 +300,31 @@ static int ibm_cffps_led_brightness_set(struct led_classdev *led_cdev,
 					enum led_brightness brightness)
 {
 	int rc;
+	u8 next_led_state;
 	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
 
 	if (brightness == LED_OFF) {
-		psu->led_state = CFFPS_LED_OFF;
+		next_led_state = CFFPS_LED_OFF;
 	} else {
 		brightness = LED_FULL;
+
 		if (psu->led_state != CFFPS_LED_BLINK)
-			psu->led_state = CFFPS_LED_ON;
+			next_led_state = CFFPS_LED_ON;
+		else
+			next_led_state = CFFPS_LED_BLINK;
 	}
 
+	dev_dbg(&psu->client->dev, "LED brightness set: %d. Command: %d.\n",
+		brightness, next_led_state);
+
 	pmbus_set_page(psu->client, 0);
 
 	rc = i2c_smbus_write_byte_data(psu->client, CFFPS_SYS_CONFIG_CMD,
-				       psu->led_state);
+				       next_led_state);
 	if (rc < 0)
 		return rc;
 
+	psu->led_state = next_led_state;
 	led_cdev->brightness = brightness;
 
 	return 0;
@@ -325,10 +337,7 @@ static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
 	int rc;
 	struct ibm_cffps *psu = container_of(led_cdev, struct ibm_cffps, led);
 
-	psu->led_state = CFFPS_LED_BLINK;
-
-	if (led_cdev->brightness == LED_OFF)
-		return 0;
+	dev_dbg(&psu->client->dev, "LED blink set.\n");
 
 	pmbus_set_page(psu->client, 0);
 
@@ -337,6 +346,8 @@ static int ibm_cffps_led_blink_set(struct led_classdev *led_cdev,
 	if (rc < 0)
 		return rc;
 
+	psu->led_state = CFFPS_LED_BLINK;
+	led_cdev->brightness = LED_FULL;
 	*delay_on = CFFPS_BLINK_RATE_MS;
 	*delay_off = CFFPS_BLINK_RATE_MS;
 
-- 
2.23.0

