Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C03C161C33
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 21:17:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LwHy3DTHzDqg9
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 07:17:02 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LwHJ4xnszDqHn
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 07:16:28 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HKECtS105477; Mon, 17 Feb 2020 15:16:23 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y6dq69r4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 15:16:23 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HKFCuS026766;
 Mon, 17 Feb 2020 20:16:22 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 2y68969htp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2020 20:16:22 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HKGL736357724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Feb 2020 20:16:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 644B9124054;
 Mon, 17 Feb 2020 20:16:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC87B124052;
 Mon, 17 Feb 2020 20:16:20 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.85.232])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Feb 2020 20:16:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4] fsi: master: Add link_disable function
Date: Mon, 17 Feb 2020 14:16:19 -0600
Message-Id: <20200217201619.16713-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_12:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=1 impostorscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170166
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
Cc: andrew@aj.id.au, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The master driver should disable links that don't have slaves or links
that fail to be accessed. To do this, add a link_disable function and
use it in the failure path for slave break and init.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-core.c          | 13 ++++++++++++-
 drivers/fsi/fsi-master-aspeed.c | 30 ++++++++++++++++++++++++++++++
 drivers/fsi/fsi-master-hub.c    | 22 ++++++++++++++++++++++
 drivers/fsi/fsi-master.h        |  1 +
 4 files changed, 65 insertions(+), 1 deletion(-)

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
index f49742b310c2..7ce5d9eb6c78 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -299,6 +299,35 @@ static int aspeed_master_write(struct fsi_master *master, int link,
 	return 0;
 }
 
+static int aspeed_master_link_disable(struct fsi_master *master, int link)
+{
+	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
+	int idx, bit, ret;
+	__be32 reg, result;
+
+	idx = link / 32;
+	bit = link % 32;
+
+	reg = cpu_to_be32(0x80000000 >> bit);
+
+	ret = opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
+	if (ret)
+		return ret;
+
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+	ret = opb_readl(aspeed, ctrl_base + FSI_MENP0 + (4 * idx), &result);
+	if (ret)
+		return ret;
+
+	if (result & reg) {
+		dev_err(aspeed->dev, "%s failed: %08x\n", __func__, result);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int aspeed_master_link_enable(struct fsi_master *master, int link)
 {
 	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
@@ -491,6 +520,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	aspeed->master.write = aspeed_master_write;
 	aspeed->master.send_break = aspeed_master_break;
 	aspeed->master.term = aspeed_master_term;
+	aspeed->master.link_disable = aspeed_master_link_disable;
 	aspeed->master.link_enable = aspeed_master_link_enable;
 
 	dev_set_drvdata(&pdev->dev, aspeed);
diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
index def35cf92571..26617fd5e2de 100644
--- a/drivers/fsi/fsi-master-hub.c
+++ b/drivers/fsi/fsi-master-hub.c
@@ -77,6 +77,27 @@ static int hub_master_break(struct fsi_master *master, int link)
 	return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
 }
 
+static int hub_master_link_disable(struct fsi_master *master, int link)
+{
+	struct fsi_master_hub *hub = to_fsi_master_hub(master);
+	int idx, bit;
+	__be32 reg;
+	int rc;
+
+	idx = link / 32;
+	bit = link % 32;
+
+	reg = cpu_to_be32(0x80000000 >> bit);
+
+	rc = fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx), &reg, 4);
+
+	mdelay(FSI_LINK_ENABLE_SETUP_TIME);
+
+	fsi_device_read(hub->upstream, FSI_MENP0 + (4 * idx), &reg, 4);
+
+	return rc;
+}
+
 static int hub_master_link_enable(struct fsi_master *master, int link)
 {
 	struct fsi_master_hub *hub = to_fsi_master_hub(master);
@@ -228,6 +249,7 @@ static int hub_master_probe(struct device *dev)
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

