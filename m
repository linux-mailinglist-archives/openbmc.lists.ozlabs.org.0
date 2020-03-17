Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B840A189161
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 23:28:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnrg6GsJzDqDc
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 09:28:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnWM05RqzDqf3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 09:13:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HLpd0S003861; Tue, 17 Mar 2020 18:13:48 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ytb3q1t0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 18:13:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HMA7lG024312;
 Tue, 17 Mar 2020 22:13:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2yrpw6jp0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 22:13:47 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HMDk1r53674244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 22:13:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCC9511206F;
 Tue, 17 Mar 2020 22:13:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7707911206E;
 Tue, 17 Mar 2020 22:13:46 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.52.216])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 22:13:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 15/16] soc: aspeed: xdma: Disable PCI AHB bridge
 during probe
Date: Tue, 17 Mar 2020 17:13:35 -0500
Message-Id: <20200317221336.19973-16-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200317221336.19973-1-eajames@linux.ibm.com>
References: <20200317221336.19973-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-17_09:2020-03-17,
 2020-03-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=1 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170082
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

The XDMA engine cannot function unless the PCI AHB bridge is disabled,
so do so during the probe.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 6bc1357445bc..525214ce2c8b 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -30,6 +30,12 @@
 
 #define DEVICE_NAME				"aspeed-xdma"
 
+#define SCU_AST2600_MISC_CTRL			0x0c0
+#define  SCU_AST2600_MISC_CTRL_DISABLE_PCI	 BIT(8)
+
+#define SCU_AST2600_DBG_CTRL			0x0c8
+#define  SCU_AST2600_DBG_CTRL_DISABLE_PCI	 BIT(0)
+
 #define SCU_AST2500_PCIE_CONF			0x180
 #define SCU_AST2600_PCIE_CONF			0xc20
 #define  SCU_PCIE_CONF_VGA_EN			 BIT(0)
@@ -188,6 +194,8 @@ struct aspeed_xdma;
 struct aspeed_xdma_chip {
 	u32 control;
 	u32 scu_bmc_class;
+	u32 scu_dbg_ctrl;
+	u32 scu_misc_ctrl;
 	u32 scu_pcie_conf;
 	u32 sdmc_remap;
 	unsigned int queue_entry_size;
@@ -798,6 +806,16 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 
 		regmap_update_bits(scu, ctx->chip->scu_pcie_conf, bmc | vga,
 				   selection);
+
+		if (ctx->chip->scu_dbg_ctrl)
+			regmap_update_bits(scu, ctx->chip->scu_dbg_ctrl,
+					   SCU_AST2600_DBG_CTRL_DISABLE_PCI,
+					   SCU_AST2600_DBG_CTRL_DISABLE_PCI);
+
+		if (ctx->chip->scu_misc_ctrl)
+			regmap_update_bits(scu, ctx->chip->scu_misc_ctrl,
+					   SCU_AST2600_MISC_CTRL_DISABLE_PCI,
+					   SCU_AST2600_MISC_CTRL_DISABLE_PCI);
 	} else {
 		dev_warn(dev, "Unable to configure PCIe: %ld; continuing.\n",
 			 PTR_ERR(scu));
@@ -1000,6 +1018,8 @@ static const struct aspeed_xdma_chip aspeed_ast2500_xdma_chip = {
 		XDMA_AST2500_CTRL_DS_DIRTY | XDMA_AST2500_CTRL_DS_SIZE_256 |
 		XDMA_AST2500_CTRL_DS_TIMEOUT | XDMA_AST2500_CTRL_DS_CHECK_ID,
 	.scu_bmc_class = SCU_AST2500_BMC_CLASS_REV,
+	.scu_dbg_ctrl = 0,
+	.scu_misc_ctrl = 0,
 	.scu_pcie_conf = SCU_AST2500_PCIE_CONF,
 	.sdmc_remap = SDMC_AST2500_REMAP_PCIE | SDMC_AST2500_REMAP_XDMA,
 	.queue_entry_size = XDMA_AST2500_QUEUE_ENTRY_SIZE,
@@ -1023,6 +1043,8 @@ static const struct aspeed_xdma_chip aspeed_ast2600_xdma_chip = {
 	.control = XDMA_AST2600_CTRL_US_COMP | XDMA_AST2600_CTRL_DS_COMP |
 		XDMA_AST2600_CTRL_DS_DIRTY | XDMA_AST2600_CTRL_DS_SIZE_256,
 	.scu_bmc_class = SCU_AST2600_BMC_CLASS_REV,
+	.scu_dbg_ctrl = SCU_AST2600_DBG_CTRL,
+	.scu_misc_ctrl = SCU_AST2600_MISC_CTRL,
 	.scu_pcie_conf = SCU_AST2600_PCIE_CONF,
 	.sdmc_remap = SDMC_AST2600_REMAP_XDMA,
 	.queue_entry_size = XDMA_AST2600_QUEUE_ENTRY_SIZE,
-- 
2.24.0

