Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF381318EA
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 20:55:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s5pl6rpxzDqGv
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 06:55:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s5kz6nXCzDqG1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 06:52:26 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006JqN4W024457; Mon, 6 Jan 2020 14:52:24 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xb93jn45g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 14:52:23 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 006JppVU004222;
 Mon, 6 Jan 2020 19:52:21 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2xajb6mtq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 19:52:21 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 006JqLBo50528632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jan 2020 19:52:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F46C124053;
 Mon,  6 Jan 2020 19:52:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2623124052;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.41.103.158])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jan 2020 19:52:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 2/3] hwmon: (pmbus/ibm-cffps) Add the VMON
 property for version 2
Date: Mon,  6 Jan 2020 13:52:18 -0600
Message-Id: <1578340339-15125-3-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578340339-15125-1-git-send-email-eajames@linux.ibm.com>
References: <1578340339-15125-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_06:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=1
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060165
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

Version 2 of the PSU supports reading an auxiliary voltage. Use the
pmbus VMON property and associated virtual register to read it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index a564be9..b37faf1 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -28,6 +28,7 @@
 #define CFFPS1_FW_NUM_BYTES			4
 #define CFFPS2_FW_NUM_WORDS			3
 #define CFFPS_SYS_CONFIG_CMD			0xDA
+#define CFFPS_12VCS_VOUT_CMD			0xDE
 
 #define CFFPS_INPUT_HISTORY_CMD			0xD6
 #define CFFPS_INPUT_HISTORY_SIZE		100
@@ -350,6 +351,9 @@ static int ibm_cffps_read_word_data(struct i2c_client *client, int page,
 		if (mfr & CFFPS_MFR_PS_KILL)
 			rc |= PB_STATUS_OFF;
 		break;
+	case PMBUS_VIRT_READ_VMON:
+		rc = pmbus_read_word_data(client, page, CFFPS_12VCS_VOUT_CMD);
+		break;
 	default:
 		rc = -ENODATA;
 		break;
@@ -453,7 +457,7 @@ static void ibm_cffps_create_led_class(struct ibm_cffps *psu)
 			PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
 			PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
 			PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP |
-			PMBUS_HAVE_STATUS_FAN12,
+			PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_VMON,
 		.func[1] = PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
 			PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | PMBUS_HAVE_TEMP3 |
 			PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT,
-- 
1.8.3.1

