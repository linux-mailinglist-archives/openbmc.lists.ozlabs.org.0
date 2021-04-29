Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2689736F1EC
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 23:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWT4T0mV6z302S
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 07:23:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GTkmkpll;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GTkmkpll; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWT4D2P0tz2y6C
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 07:22:51 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TL2wNX121319; Thu, 29 Apr 2021 17:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3D7rqW2u9u2mHrd2VOckr2JVl9pTQECnwzWOydJOOI0=;
 b=GTkmkplliT+COvwnRu6JHkI3O8CtocQ/ZJP1pFbka8ZEsEVnqxCOTyJ+sF6OzWzW5oM6
 iF/PHVmAHG2shZJ66u7qfLKHQpKUp0zdWlhLgrOKh0L5/xSlgrFm0Br+X7vtMJhMf/Ns
 tDNvAgfz13bkCkMknJP5b8u5Z3oTjUc7P9rai5CKYzDAhJODNtcyfViD7fuD9ZK1IOYb
 PKwFnmPwKBuET7kZRAjgnJhpDEPJmJQk01OBg5yuRCiraGGmGhQvfX98TW41Y+VGKzaH
 tqnui3dj3tkwElVS5EaOcBJVL65tVTXTEZk884GaLb33zuQoxQulsZ3c4+ut1kQaRMNA dg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3883sr18a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 17:22:48 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TL7HCO004577;
 Thu, 29 Apr 2021 21:22:47 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 3882p7gnkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 21:22:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TLMkVu15794638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 21:22:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A7F3C6059;
 Thu, 29 Apr 2021 21:22:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B6D8C6055;
 Thu, 29 Apr 2021 21:22:46 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 21:22:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] hwmon: (occ) Fix poll rate limiting
Date: Thu, 29 Apr 2021 16:22:46 -0500
Message-Id: <20210429212246.71729-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QHr3scssVw6HnqIzFCVg24LVFms65mdt
X-Proofpoint-ORIG-GUID: QHr3scssVw6HnqIzFCVg24LVFms65mdt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_11:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290135
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

The poll rate limiter time was initialized at zero. This breaks the
comparison in time_after if jiffies is large. Switch to storing the
next update time rather than the previous time, and initialize the
time when the device is probed.

Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 5 +++--
 drivers/hwmon/occ/common.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 7e98ed2e4739..e2a69514e7dc 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -217,9 +217,9 @@ int occ_update_response(struct occ *occ)
 		return rc;
 
 	/* limit the maximum rate of polling the OCC */
-	if (time_after(jiffies, occ->last_update + OCC_UPDATE_FREQUENCY)) {
+	if (time_after(jiffies, occ->next_update)) {
 		rc = occ_poll(occ);
-		occ->last_update = jiffies;
+		occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
 	} else {
 		rc = occ->last_error;
 	}
@@ -1157,6 +1157,7 @@ int occ_setup(struct occ *occ, const char *name)
 		return rc;
 	}
 
+	occ->next_update = jiffies + OCC_UPDATE_FREQUENCY;
 	occ_parse_poll_response(occ);
 
 	rc = occ_setup_sensor_attrs(occ);
diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
index 67e6968b8978..e6df719770e8 100644
--- a/drivers/hwmon/occ/common.h
+++ b/drivers/hwmon/occ/common.h
@@ -99,7 +99,7 @@ struct occ {
 	u8 poll_cmd_data;		/* to perform OCC poll command */
 	int (*send_cmd)(struct occ *occ, u8 *cmd);
 
-	unsigned long last_update;
+	unsigned long next_update;
 	struct mutex lock;		/* lock OCC access */
 
 	struct device *hwmon;
-- 
2.27.0

