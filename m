Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406BE3CB98F
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 17:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRFJx0jMwz3bVN
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 01:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fzu/Nx2U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fzu/Nx2U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRFJZ6jglz2yNf;
 Sat, 17 Jul 2021 01:19:10 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GFJ3Bh108840; Fri, 16 Jul 2021 11:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NaztiW8y0zbEM5BnHti1Gp6mOCctl7zpEXezAiyDpPc=;
 b=fzu/Nx2U9BMGyPnIa5m9PUkNRS/ptVWjxq96+EcYZyB+eB6n4SACTqPkEauTOUaAcatt
 JrecwOy38LkCjUxVdeaDX2FoWvAKBYJkML25P50wDnzfzYCqzW94NwyVRp3Fe4BmXnh/
 Lc0KOfrhf7r4keDvHOuCiy+KUb8nb00SF93dJFFGqa4x6O3cVWl/UtbXUM43C2CENtmK
 +WUATWNidsajWk2Zxg6K+4ot4y/nQx+OFSNyoOcuDELXQbzYZZvHeq1ENm9R3u8JrNmb
 aK9lc9UDTPiWGDyNPlecXuBqhuKop7/bNCvYu3hfM4X4qIXa0vxQ4dvI3bKqYCtVr5hw 1A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tyncnbfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:19:07 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GFGfJS023509;
 Fri, 16 Jul 2021 15:19:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 39qt3ewur7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 15:19:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GFJ3Gi10027486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 15:19:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32B5BC6059;
 Fri, 16 Jul 2021 15:19:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB58CC605D;
 Fri, 16 Jul 2021 15:19:02 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 15:19:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] fsi: occ: Add dynamic debug to dump command and response
Date: Fri, 16 Jul 2021 10:18:50 -0500
Message-Id: <20210716151850.28973-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716151850.28973-1-eajames@linux.ibm.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3ZpwZuyjX5mctZig_Fom-bhIZ3K76wJ3
X-Proofpoint-ORIG-GUID: 3ZpwZuyjX5mctZig_Fom-bhIZ3K76wJ3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_05:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160092
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
 Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
 linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use the dynamic branching capability of the dynamic debug subsystem
to dump the command and response with the correct OCC device name.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index ecf738411fe2..641a6869b9df 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -21,6 +21,15 @@
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
@@ -359,6 +368,20 @@ static int occ_putsram(struct occ *occ, const void *data, ssize_t len,
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
@@ -556,6 +579,27 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
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

