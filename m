Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69162189181
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 23:31:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnvs4G9gzDqFF
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 09:31:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnWM1pptzDql9
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 09:13:51 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HM3X6t049320; Tue, 17 Mar 2020 18:13:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ytb221stw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 18:13:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HMA643024114;
 Tue, 17 Mar 2020 22:13:48 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 2yrpw6jp0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 22:13:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HMDl1M49152484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 22:13:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7039D112067;
 Tue, 17 Mar 2020 22:13:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DD15112069;
 Tue, 17 Mar 2020 22:13:47 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.52.216])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 22:13:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 16/16] soc: aspeed: xdma: Fix BMC PCI device
 class and revision for AST2600
Date: Tue, 17 Mar 2020 17:13:36 -0500
Message-Id: <20200317221336.19973-17-eajames@linux.ibm.com>
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
 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=1
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The A1 revision of the AST2600 changed the register address of the BMC
PCI device class and revision, so take account of that when setting it.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/soc/aspeed/aspeed-xdma.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 525214ce2c8b..5d97919d38cf 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -30,6 +30,9 @@
 
 #define DEVICE_NAME				"aspeed-xdma"
 
+#define SCU_SILICON_REV_ID			0x004
+#define  SCU_SILICON_REV_ID_AST2600_A0		 0x05000303
+
 #define SCU_AST2600_MISC_CTRL			0x0c0
 #define  SCU_AST2600_MISC_CTRL_DISABLE_PCI	 BIT(8)
 
@@ -53,7 +56,8 @@
 #define  SCU_PCIE_CONF_BMC_EN_DMA		 BIT(14)
 
 #define SCU_AST2500_BMC_CLASS_REV		0x19c
-#define SCU_AST2600_BMC_CLASS_REV		0xc4c
+#define SCU_AST2600_A0_BMC_CLASS_REV		0xc4c
+#define SCU_AST2600_A1_BMC_CLASS_REV		0xc68
 #define  SCU_BMC_CLASS_REV_XDMA			 0xff000001
 
 #define SDMC_REMAP                             0x008
@@ -797,9 +801,21 @@ static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
 		}
 
 		if (pcie_device_bmc) {
+			u32 addr = ctx->chip->scu_bmc_class;
+
+			if (addr == SCU_AST2600_A0_BMC_CLASS_REV) {
+				u32 silicon_rev_id;
+
+				regmap_read(scu, SCU_SILICON_REV_ID,
+					    &silicon_rev_id);
+
+				if (silicon_rev_id !=
+				    SCU_SILICON_REV_ID_AST2600_A0)
+					addr = SCU_AST2600_A1_BMC_CLASS_REV;
+			}
+
 			selection = bmc;
-			regmap_write(scu, ctx->chip->scu_bmc_class,
-				     SCU_BMC_CLASS_REV_XDMA);
+			regmap_write(scu, addr, SCU_BMC_CLASS_REV_XDMA);
 		} else {
 			selection = vga;
 		}
@@ -1042,7 +1058,7 @@ static const struct aspeed_xdma_chip aspeed_ast2500_xdma_chip = {
 static const struct aspeed_xdma_chip aspeed_ast2600_xdma_chip = {
 	.control = XDMA_AST2600_CTRL_US_COMP | XDMA_AST2600_CTRL_DS_COMP |
 		XDMA_AST2600_CTRL_DS_DIRTY | XDMA_AST2600_CTRL_DS_SIZE_256,
-	.scu_bmc_class = SCU_AST2600_BMC_CLASS_REV,
+	.scu_bmc_class = SCU_AST2600_A0_BMC_CLASS_REV,
 	.scu_dbg_ctrl = SCU_AST2600_DBG_CTRL,
 	.scu_misc_ctrl = SCU_AST2600_MISC_CTRL,
 	.scu_pcie_conf = SCU_AST2600_PCIE_CONF,
-- 
2.24.0

