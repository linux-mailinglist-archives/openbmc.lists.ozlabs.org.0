Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2253179E66
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 04:47:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XxXC5wkZzDqHV
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 14:47:23 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XxWY2mWTzDqHV
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 14:46:49 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0253d1TI046199; Wed, 4 Mar 2020 22:46:46 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhhy7fm48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Mar 2020 22:46:46 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0253kL0Y019819;
 Thu, 5 Mar 2020 03:46:45 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 2yffk7a575-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 03:46:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0253kit538404430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 03:46:44 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70158B205F;
 Thu,  5 Mar 2020 03:46:44 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFD88B2067;
 Thu,  5 Mar 2020 03:46:43 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.146.17])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 03:46:43 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2] fsi: master: Add link_disable function
Date: Wed,  4 Mar 2020 21:46:40 -0600
Message-Id: <20200305034641.11426-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 suspectscore=1 phishscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050017
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

The master driver should disable links that don't have slaves or links
that fail to be accessed. To do this, add a link_disable function and
use it in the failure path for slave break and init.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - Drop the delay and read back MENP0 to check link status.

 drivers/fsi/fsi-core.c          | 13 ++++++++++++-
 drivers/fsi/fsi-master-aspeed.c | 15 +++++++++++++++
 drivers/fsi/fsi-master-hub.c    | 15 +++++++++++++++
 drivers/fsi/fsi-master.h        |  1 +
 4 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 8244da8a7241..d81ee9f582a5 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1154,6 +1154,14 @@ static int fsi_master_write(struct fsi_master *master, int link,
 	return rc;
 }
 
+static int fsi_master_link_disable(struct fsi_master *master, int link)
+{
+	if (master->link_disable)
+		return master->link_disable(master, link);
+
+	return 0;
+}
+
 static int fsi_master_link_enable(struct fsi_master *master, int link)
 {
 	if (master->link_enable)
@@ -1194,10 +1202,13 @@ static int fsi_master_scan(struct fsi_master *master)
 		if (rc) {
 			dev_dbg(&master->dev,
 				"break to link %d failed: %d\n", link, rc);
+			fsi_master_link_disable(master, link);
 			continue;
 		}
 
-		fsi_slave_init(master, link, 0);
+		rc = fsi_slave_init(master, link, 0);
+		if (rc)
+			fsi_master_link_disable(master, link);
 	}
 
 	return 0;
diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f49742b310c2..12e48f6a0874 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -299,6 +299,20 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	return 0;
 }
 
+static int aspeed_master_link_disable(struct fsi_master *master, int link)
+{
+	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	int idx, bit;
+	__be32 reg;
+
+	idx = link / 32;
+	bit = link % 32;
+
+	reg = cpu_to_be32(0x80000000 >> bit);
+
+	return opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
+}
+
 static int aspeed_master_link_enable(struct fsi_master *master, int link)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
@@ -491,6 +505,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed->master.write = aspeed_master_write;
 	aspeed->master.send_break = aspeed_master_break;
 	aspeed->master.term = aspeed_master_term;
+	aspeed->master.link_disable = aspeed_master_link_disable;
 	aspeed->master.link_enable = aspeed_master_link_enable;
 
 	dev_set_drvdata(&pdev->dev, aspeed);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index def35cf92571..6034e8fd8d3b 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -77,6 +77,20 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
+static int hub_master_link_disable(struct fsi_master *master, int link)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	int idx, bit;
+	__be32 reg;
+
+	idx = link / 32;
+	bit = link % 32;
+
+	reg = cpu_to_be32(0x80000000 >> bit);
+
+	return fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx), &reg, 4);
+}
+
 static int hub_master_link_enable(struct fsi_master *master, int link)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(master);
@@ -228,6 +242,7 @@ static int hub_master_probe(struct device *dev)
 	hub->master.read = hub_master_read;
 	hub->master.write = hub_master_write;
 	hub->master.send_break = hub_master_break;
+	hub->master.link_disable = hub_master_link_disable;
 	hub->master.link_enable = hub_master_link_enable;
 
 	dev_set_drvdata(dev, hub);
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 6e8d4d4d5149..7ecb86a678f9 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -130,6 +130,7 @@ struct fsi_master {
 				uint32_t addr, const void *val, size_t size);
 	int		(*term)(struct fsi_master *, int link, uint8_t id);
 	int		(*send_break)(struct fsi_master *, int link);
+	int		(*link_disable)(struct fsi_master *, int link);
 	int		(*link_enable)(struct fsi_master *, int link);
 	int		(*link_config)(struct fsi_master *, int link,
 				       u8 t_send_delay, u8 t_echo_delay);
-- 
2.24.0

