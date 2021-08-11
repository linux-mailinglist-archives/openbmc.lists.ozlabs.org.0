Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6F3E9514
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDr1201sz2yfb
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:53:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SEvKUhsT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SEvKUhsT; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDc35jN0z3bNm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFXx9e132650; Wed, 11 Aug 2021 11:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DKGz+00+xXVy7WcRP8tY9JXtDZ86yHpkHtprekw5byg=;
 b=SEvKUhsTZZEsSUeauXufVIHq3T4P+d8SpLaJWDmqRome+7v3neG/s3VH/sw6OQvBLa+j
 hoCqKhtIQ1/0we6Tam7rz0PgUCncOQDblKU51x+lSE1REpdB/WrJj3V7QHOp4qc7BrKn
 oHbLwyQBOCO/3diOu5N0IT55b1z0O1tsX+c0fkl/2aU/6qwrRI7yl1MXCpFRSj8PPPnc
 vvzPXRQXRuf3yiNiX5XplLCu9aXNxE5i/DAKdDMKq+/30Cs1QsFL0TUJynuMufkZWqbJ
 7Rvi/VNF46Ual4/kV2wWstJrkYnCxdDRLGokRO/RIOAUCieohi9suBkfD1w7j3YFOF+h Zw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abt97tsr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:57 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFgixg005501;
 Wed, 11 Aug 2021 15:42:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3ab3yab7wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:51 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgcZa30081362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1DE86A051;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFC4B6A04D;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 13/14] fsi: occ: Add dynamic debug to dump
 command and response
Date: Wed, 11 Aug 2021 10:42:31 -0500
Message-Id: <20210811154232.12649-14-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g6DCkdhq0KZUEG5qahf2OSqVIij36Eap
X-Proofpoint-GUID: g6DCkdhq0KZUEG5qahf2OSqVIij36Eap
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110104
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

Use the dynamic branching capability of the dynamic debug subsystem
to dump the command and response with the correct OCC device name.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index 90795325b7d9..b0c9322078a1 100644
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

