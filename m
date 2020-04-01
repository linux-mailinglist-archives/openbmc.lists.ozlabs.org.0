Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7615D19B820
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:07:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0gC4RDGzDrC0
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:07:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0Zx6dMSzDqCh
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:03:53 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031M2vVO108729; Wed, 1 Apr 2020 18:03:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304edxcfxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 18:03:50 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031M3ebE110961;
 Wed, 1 Apr 2020 18:03:50 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304edxcfx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 18:03:50 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031M2Q2U019257;
 Wed, 1 Apr 2020 22:03:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 301x76w6me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 22:03:49 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031M3mv953084544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 22:03:48 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0534C6E661;
 Wed,  1 Apr 2020 22:03:48 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6F826E667;
 Wed,  1 Apr 2020 22:03:47 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.16.235])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 22:03:47 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/2] hwmon: (pmbus/ibm-cffps) Add another PSU
 CCIN to version detection
Date: Wed,  1 Apr 2020 17:03:38 -0500
Message-Id: <20200401220339.2006-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200401220339.2006-1-eajames@linux.ibm.com>
References: <20200401220339.2006-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010179
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
Cc: bjwyman@gmail.com, Eddie James <eajames@linux.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There is an additional CCIN for the IBM CFFPS that may be classifed as
either version one or version two, based upon the rest of the bits of
the CCIN. Add support for it in the version detection.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Link: https://lore.kernel.org/r/1583948590-17220-1-git-send-email-eajames@linux.ibm.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 27593b723d74..7d3720665ad4 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -33,9 +33,12 @@
 #define CFFPS_INPUT_HISTORY_CMD			0xD6
 #define CFFPS_INPUT_HISTORY_SIZE		100
 
+#define CFFPS_CCIN_REVISION			GENMASK(7, 0)
+#define  CFFPS_CCIN_REVISION_LEGACY		 0xde
 #define CFFPS_CCIN_VERSION			GENMASK(15, 8)
 #define CFFPS_CCIN_VERSION_1			 0x2b
 #define CFFPS_CCIN_VERSION_2			 0x2e
+#define CFFPS_CCIN_VERSION_3			 0x51
 
 /* STATUS_MFR_SPECIFIC bits */
 #define CFFPS_MFR_FAN_FAULT			BIT(0)
@@ -489,11 +492,14 @@ static int ibm_cffps_probe(struct i2c_client *client,
 		vs = (enum versions)id->driver_data;
 
 	if (vs == cffps_unknown) {
+		u16 ccin_revision = 0;
 		u16 ccin_version = CFFPS_CCIN_VERSION_1;
 		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
 
-		if (ccin > 0)
+		if (ccin > 0) {
+			ccin_revision = FIELD_GET(CFFPS_CCIN_REVISION, ccin);
 			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
+		}
 
 		switch (ccin_version) {
 		default:
@@ -503,6 +509,12 @@ static int ibm_cffps_probe(struct i2c_client *client,
 		case CFFPS_CCIN_VERSION_2:
 			vs = cffps2;
 			break;
+		case CFFPS_CCIN_VERSION_3:
+			if (ccin_revision == CFFPS_CCIN_REVISION_LEGACY)
+				vs = cffps1;
+			else
+				vs = cffps2;
+			break;
 		}
 
 		/* Set the client name to include the version number. */
-- 
2.24.0

