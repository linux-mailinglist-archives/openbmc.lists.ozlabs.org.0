Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1546119FDFF
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 21:21:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x0lS0wQlzDqRC
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 05:21:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x0jJ6k2LzDql2
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 05:19:48 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036J4n4M007636; Mon, 6 Apr 2020 15:19:45 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306n24mass-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 15:19:45 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 036JEo5h008112;
 Mon, 6 Apr 2020 19:19:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 306hv6abqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 19:19:45 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 036JJifs59375952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 19:19:44 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C1406E04E;
 Mon,  6 Apr 2020 19:19:44 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15B336E050;
 Mon,  6 Apr 2020 19:19:44 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.59.134])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 19:19:44 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/3] fsi: master: Remove link enable read-back
Date: Mon,  6 Apr 2020 14:19:36 -0500
Message-Id: <20200406191938.31156-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200406191938.31156-1-eajames@linux.ibm.com>
References: <20200406191938.31156-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_09:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=1 lowpriorityscore=0 adultscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060145
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

Both the Aspeed and hub masters read back the link enable register
after enabling the link, but this is unnecessary, so remove it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-master-aspeed.c | 11 +----------
 drivers/fsi/fsi-master-hub.c    |  6 +++---
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index fe2da6f90590..0c04656208a6 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -306,7 +306,7 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
 	int idx, bit, ret;
-	__be32 reg, result;
+	__be32 reg;
 
 	idx = link / 32;
 	bit = link % 32;
@@ -319,15 +319,6 @@ static int aspeed_master_link_enable(struct fsi_master *master, int link)
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-	ret = opb_readl(aspeed, ctrl_base + FSI_MENP0 + (4 * idx), &result);
-	if (ret)
-		return ret;
-
-	if (result != reg) {
-		dev_err(aspeed->dev, "%s failed: %08x\n", __func__, result);
-		return -EIO;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index def35cf92571..f89c25d68b5a 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -90,12 +90,12 @@ static int hub_master_link_enable(struct fsi_master *master, int link)
 	reg = cpu_to_be32(0x80000000 >> bit);
 
 	rc = fsi_device_write(hub->upstream, FSI_MSENP0 + (4 * idx), &reg, 4);
+	if (rc)
+		return rc;
 
 	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
 
-	fsi_device_read(hub->upstream, FSI_MENP0 + (4 * idx), &reg, 4);
-
-	return rc;
+	return 0;
 }
 
 static void hub_master_release(struct device *dev)
-- 
2.24.0

