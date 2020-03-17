Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46404189157
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 23:27:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnpS2rPVzDqDc
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 09:26:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnWK6N2wzDqcT
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 09:13:49 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HM1hDN187574; Tue, 17 Mar 2020 18:13:47 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ytb4v14f3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 18:13:47 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HMA7lE024312;
 Tue, 17 Mar 2020 22:13:46 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2yrpw6jp07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 22:13:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HMDjji48759264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 22:13:45 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B425B112069;
 Tue, 17 Mar 2020 22:13:45 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53618112067;
 Tue, 17 Mar 2020 22:13:45 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.52.216])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 22:13:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 13/16] soc: aspeed: xdma: Add memory controller
 configuration
Date: Tue, 17 Mar 2020 17:13:33 -0500
Message-Id: <20200317221336.19973-14-eajames@linux.ibm.com>
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
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=1 malwarescore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003170082
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

Performing DMA requires configuring the memory protection register.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g5.dtsi |  3 ++-
 arch/arm/boot/dts/aspeed-g6.dtsi |  6 ++++++
 drivers/soc/aspeed/aspeed-xdma.c | 16 ++++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 1a6a12d2a489..6df572b4d88a 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -49,7 +49,7 @@
 	};
 
 	edac: sdram@1e6e0000 {
-		compatible = "aspeed,ast2500-sdram-edac";
+		compatible = "aspeed,ast2500-sdram-edac", "syscon";
 		reg = <0x1e6e0000 0x174>;
 		interrupts = <0>;
 		status = "disabled";
@@ -270,6 +270,7 @@
 				interrupts-extended = <&vic 6>, <&scu_ic ASPEED_AST2500_SCU_IC_PCIE_RESET_LO_TO_HI>;
 				pcie-device = "bmc";
 				aspeed,scu = <&syscon>;
+				sdmc = <&edac>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index e2a429a3a396..cb511e0b1046 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -289,6 +289,11 @@
 			status = "disabled";
 		};
 
+		sdmc: sdram@1e6e0000 {
+			compatible = "syscon";
+			reg = <0x1e6e0000 0xb8>;
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
@@ -344,6 +349,7 @@
 						      <&scu_ic0 ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI>;
 				pcie-device = "bmc";
 				aspeed,scu = <&syscon>;
+				sdmc = <&sdmc>;
 				status = "disabled";
 			};
 
diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index 8c6408ff253b..ad29fdf30b06 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -50,6 +50,11 @@
 #define SCU_AST2600_BMC_CLASS_REV		0xc4c
 #define  SCU_BMC_CLASS_REV_XDMA			 0xff000001
 
+#define SDMC_REMAP                             0x008
+#define  SDMC_AST2500_REMAP_PCIE                BIT(16)
+#define  SDMC_AST2500_REMAP_XDMA                BIT(17)
+#define  SDMC_AST2600_REMAP_XDMA                BIT(18)
+
 #define XDMA_CMDQ_SIZE				PAGE_SIZE
 #define XDMA_NUM_CMDS				\
 	(XDMA_CMDQ_SIZE / sizeof(struct aspeed_xdma_cmd))
@@ -184,6 +189,7 @@ struct aspeed_xdma_chip {
 	u32 control;
 	u32 scu_bmc_class;
 	u32 scu_pcie_conf;
+	u32 sdmc_remap;
 	unsigned int queue_entry_size;
 	struct aspeed_xdma_regs regs;
 	struct aspeed_xdma_status_bits status_bits;
@@ -805,6 +811,7 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	int irq;
 	int pcie_irq;
 	u32 memory[2];
+	struct regmap *sdmc;
 	struct aspeed_xdma *ctx;
 	struct device *dev = &pdev->dev;
 	const void *md = of_device_get_match_data(dev);
@@ -884,6 +891,13 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	sdmc = syscon_regmap_lookup_by_phandle(dev->of_node, "sdmc");
+	if (!IS_ERR(sdmc))
+		regmap_update_bits(sdmc, SDMC_REMAP, ctx->chip->sdmc_remap,
+				   ctx->chip->sdmc_remap);
+	else
+		dev_err(dev, "Unable to configure memory controller.\n");
+
 	rc = aspeed_xdma_init_scu(ctx, dev);
 	if (rc)
 		return rc;
@@ -968,6 +982,7 @@ static const struct aspeed_xdma_chip aspeed_ast2500_xdma_chip = {
 		XDMA_AST2500_CTRL_DS_TIMEOUT | XDMA_AST2500_CTRL_DS_CHECK_ID,
 	.scu_bmc_class = SCU_AST2500_BMC_CLASS_REV,
 	.scu_pcie_conf = SCU_AST2500_PCIE_CONF,
+	.sdmc_remap = SDMC_AST2500_REMAP_PCIE | SDMC_AST2500_REMAP_XDMA,
 	.queue_entry_size = XDMA_AST2500_QUEUE_ENTRY_SIZE,
 	.regs = {
 		.bmc_cmdq_addr = XDMA_AST2500_BMC_CMDQ_ADDR,
@@ -990,6 +1005,7 @@ static const struct aspeed_xdma_chip aspeed_ast2600_xdma_chip = {
 		XDMA_AST2600_CTRL_DS_DIRTY | XDMA_AST2600_CTRL_DS_SIZE_256,
 	.scu_bmc_class = SCU_AST2600_BMC_CLASS_REV,
 	.scu_pcie_conf = SCU_AST2600_PCIE_CONF,
+	.sdmc_remap = SDMC_AST2600_REMAP_XDMA,
 	.queue_entry_size = XDMA_AST2600_QUEUE_ENTRY_SIZE,
 	.regs = {
 		.bmc_cmdq_addr = XDMA_AST2600_BMC_CMDQ_ADDR,
-- 
2.24.0

