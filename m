Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061703D16DF
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 21:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVQ3t64xqz30Gx
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 05:04:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zqj0t/LT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zqj0t/LT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVQ285GVjz300J;
 Thu, 22 Jul 2021 05:02:40 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LIiaVf161742; Wed, 21 Jul 2021 15:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5IvjcOj259HEtQZTVgIU1isdo2v0xtwkHBcRBlTVp94=;
 b=Zqj0t/LTxtzdxPhV+rKBamHSDN92XfK5BL7jqG5AvJeQo/fgTdUgFYqHyEPp8xrH6DP3
 xpSdsXz5WgBXRV0z6gEjWCoe87mkaVxwSCRoX+5L3zm9uC0V3uEZYWireH+ZnLNXUQoq
 gtE/6dgVEao7oozflVlNRsx866M9DuIziFmeJBJnrit01mstEb7hS6m/ZU2xVwLmAPhJ
 RKcEVW8e1kHI5wUuMEp3YXtem5ZexecaZEfZIwjPQ6VVbJgyZSm4drXvjsdRfUHbi4DT
 Fat1GuUBSbXNP52bFN/oJ6p6GNQ/XrkHZTpJSfxN/3OI7orjvjoRhYMwOqtK2fBNjlnn yw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39xs4j8e8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 15:02:37 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LIvJOf024665;
 Wed, 21 Jul 2021 19:02:36 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 39upue3tnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 19:02:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LJ2aiE42533216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 19:02:36 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E538228068;
 Wed, 21 Jul 2021 19:02:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 005082805A;
 Wed, 21 Jul 2021 19:02:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.68.240])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 19:02:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-fsi@lists.ozlabs.org
Subject: [PATCH v2 3/3] fsi: occ: Add dynamic debug to dump command and
 response
Date: Wed, 21 Jul 2021 14:02:31 -0500
Message-Id: <20210721190231.117185-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210721190231.117185-1-eajames@linux.ibm.com>
References: <20210721190231.117185-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -CO4dprFmbMcVejaZhyFrI-q1z96Zcey
X-Proofpoint-ORIG-GUID: -CO4dprFmbMcVejaZhyFrI-q1z96Zcey
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_10:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107210109
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, openbmc@lists.ozlabs.org,
 eajames@linux.ibm.com, linux-kernel@vger.kernel.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use the dynamic branching capability of the dynamic debug subsystem
to dump the command and response with the correct OCC device name.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - include dynamic_debug to make sure the dynamic branching stuff is
   included on all platforms/configs

 drivers/fsi/fsi-occ.c | 45 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index ecf738411fe2..2bc53ea8f54f 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/dynamic_debug.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
@@ -21,6 +22,15 @@
 #include <linux/uaccess.h>
 #include <asm/unaligned.h>
 
+#if !defined(CONFIG_DYNAMIC_DEBUG_CORE)
+#define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
+#if defined(DEBUG)
+#define DYNAMIC_DEBUG_BRANCH(descriptor) true
+#else /* DEBUG */
+#define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#endif /* DEBUG */
+#endif /* CONFIG_DYNAMIC_DEBUG_CORE */
+
 #define OCC_SRAM_BYTES		4096
 #define OCC_CMD_DATA_BYTES	4090
 #define OCC_RESP_DATA_BYTES	4089
@@ -359,6 +369,20 @@ static int occ_putsram(struct occ *occ, const void *data, ssize_t len,
 	byte_buf[len - 2] = checksum >> 8;
 	byte_buf[len - 1] = checksum & 0xff;
 
+	{
+		DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_cmd, "OCC command");
+
+		if (DYNAMIC_DEBUG_BRANCH(ddm_occ_cmd)) {
+			char prefix[64];
+
+			snprintf(prefix, sizeof(prefix), "%s %s: cmd ",
+				 dev_driver_string(occ->dev),
+				 dev_name(occ->dev));
+			print_hex_dump(KERN_DEBUG, prefix, DUMP_PREFIX_OFFSET,
+				       16, 4, byte_buf, len, false);
+		}
+	}
+
 	rc = sbefifo_submit(occ->sbefifo, buf, cmd_len, buf, &resp_len);
 	if (rc)
 		goto free;
@@ -556,6 +580,27 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 	}
 
 	*resp_len = resp_data_length + 7;
+
+	{
+		DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_rsp,
+					      "OCC response");
+		DEFINE_DYNAMIC_DEBUG_METADATA(ddm_occ_full_rsp,
+					      "OCC full response");
+
+		if (DYNAMIC_DEBUG_BRANCH(ddm_occ_full_rsp) ||
+		    DYNAMIC_DEBUG_BRANCH(ddm_occ_rsp)) {
+			char prefix[64];
+			size_t l = DYNAMIC_DEBUG_BRANCH(ddm_occ_full_rsp) ?
+				*resp_len : 16;
+
+			snprintf(prefix, sizeof(prefix), "%s %s: rsp ",
+				 dev_driver_string(occ->dev),
+				 dev_name(occ->dev));
+			print_hex_dump(KERN_DEBUG, prefix, DUMP_PREFIX_OFFSET,
+				       16, 4, resp, l, false);
+		}
+	}
+
 	rc = occ_verify_checksum(occ, resp, resp_data_length);
 
  done:
-- 
2.27.0

