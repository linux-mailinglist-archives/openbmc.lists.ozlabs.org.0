Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C4F1DBC86
	for <lists+openbmc@lfdr.de>; Wed, 20 May 2020 20:18:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S1Fl3VWBzDqdV
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 04:18:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S1Dr6zFSzDqMd
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 04:17:15 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KHXvRN122499; Wed, 20 May 2020 14:17:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cqpphhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 14:17:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04KIEOYF029964;
 Wed, 20 May 2020 18:17:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 313whb58ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 18:17:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04KIH9vP51446058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 18:17:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D19FAC6055;
 Wed, 20 May 2020 18:17:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9875BC6061;
 Wed, 20 May 2020 18:17:09 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.2.51])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 18:17:09 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] fsi: core: Set slave local bus ownership during
 init
Date: Wed, 20 May 2020 13:17:07 -0500
Message-Id: <20200520181707.9235-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_13:2020-05-20,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=1 lowpriorityscore=0 clxscore=1015 cotscore=-2147483648
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005200142
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

The driver ought to claim local bus ownership of the slave it's
communicating with.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8244da8a7241..48424b672295 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -50,6 +50,7 @@ static const int engine_page_size = 0x400;
 #define FSI_SMODE		0x0	/* R/W: Mode register */
 #define FSI_SISC		0x8	/* R/W: Interrupt condition */
 #define FSI_SSTAT		0x14	/* R  : Slave status */
+#define FSI_SLBUS		0x30	/* W  : LBUS Ownership */
 #define FSI_LLMODE		0x100	/* R/W: Link layer mode register */
 
 /*
@@ -66,6 +67,11 @@ static const int engine_page_size = 0x400;
 #define FSI_SMODE_LBCRR_SHIFT	8		/* Clk ratio shift */
 #define FSI_SMODE_LBCRR_MASK	0xf		/* Clk ratio mask */
 
+/*
+ * SLBUS fields
+ */
+#define FSI_SLBUS_FORCE		0x80000000	/* Force LBUS ownership */
+
 /*
  * LLMODE fields
  */
@@ -981,7 +987,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	uint32_t cfam_id;
 	struct fsi_slave *slave;
 	uint8_t crc;
-	__be32 data, llmode;
+	__be32 data, llmode, slbus;
 	int rc;
 
 	/* Currently, we only support single slaves on a link, and use the
@@ -1052,6 +1058,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	}
 
+	slbus = cpu_to_be32(FSI_SLBUS_FORCE);
+	rc = fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SLBUS,
+			      &slbus, sizeof(slbus));
+	if (rc)
+		dev_warn(&master->dev,
+			 "can't set slbus on slave:%02x:%02x %d\n", link, id,
+			 rc);
+
 	rc = fsi_slave_set_smode(slave);
 	if (rc) {
 		dev_warn(&master->dev,
-- 
2.24.0

