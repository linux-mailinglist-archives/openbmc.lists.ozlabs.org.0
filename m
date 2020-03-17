Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF218915D
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 23:27:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hnqc0493zDqmT
	for <lists+openbmc@lfdr.de>; Wed, 18 Mar 2020 09:27:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hnWL17lxzDqf3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Mar 2020 09:13:49 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02HM5nYJ021990; Tue, 17 Mar 2020 18:13:47 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yru54v8x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 18:13:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02HMA7ef011078;
 Tue, 17 Mar 2020 22:13:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2yrpw6jh50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Mar 2020 22:13:47 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02HMDk3855312874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 22:13:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C63C112070;
 Tue, 17 Mar 2020 22:13:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFC7511206B;
 Tue, 17 Mar 2020 22:13:45 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.52.216])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Mar 2020 22:13:45 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 14/16] soc: aspeed: xdma: Add root complex reset
Date: Tue, 17 Mar 2020 17:13:34 -0500
Message-Id: <20200317221336.19973-15-eajames@linux.ibm.com>
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
 clxscore=1015
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
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

The PCI root complex must be taken out of reset in order for XDMA to
work.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi |  3 ++-
 drivers/soc/aspeed/aspeed-xdma.c | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index cb511e0b1046..a22287186079 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -344,7 +344,8 @@
 				compatible = "aspeed,ast2600-xdma";
 				reg = <0x1e6e7000 0x100>;
 				clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
-				resets = <&syscon ASPEED_RESET_DEV_XDMA>;
+				resets = <&syscon ASPEED_RESET_DEV_XDMA>, <&syscon ASPEED_RESET_RC_XDMA>;
+				reset-names = "dev", "rc";
 				interrupts-extended = <&gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
 						      <&scu_ic0 ASPEED_AST2600_SCU_IC0_PCIE_PERST_LO_TO_HI>;
 				pcie-device = "bmc";
diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
index ad29fdf30b06..6bc1357445bc 100644
--- a/drivers/soc/aspeed/aspeed-xdma.c
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -207,6 +207,7 @@ struct aspeed_xdma {
 	void __iomem *base;
 	struct clk *clock;
 	struct reset_control *reset;
+	struct reset_control *reset_rc;
 
 	/* file_lock serializes reads of current_client */
 	struct mutex file_lock;
@@ -863,6 +864,12 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 		return PTR_ERR(ctx->reset);
 	}
 
+	ctx->reset_rc = devm_reset_control_get_exclusive(dev, "rc");
+	if (IS_ERR(ctx->reset_rc)) {
+		dev_dbg(dev, "Failed to request reset RC control.\n");
+		ctx->reset_rc = NULL;
+	}
+
 	ctx->pool = devm_gen_pool_create(dev, ilog2(PAGE_SIZE), -1, NULL);
 	if (!ctx->pool) {
 		dev_err(dev, "Failed to setup genalloc pool.\n");
@@ -902,6 +909,15 @@ static int aspeed_xdma_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
+	if (ctx->reset_rc) {
+		rc = reset_control_deassert(ctx->reset_rc);
+		if (rc) {
+			dev_err(dev, "Failed to clear the RC reset.\n");
+			return rc;
+		}
+		msleep(XDMA_RESET_TIME_MS);
+	}
+
 	rc = clk_prepare_enable(ctx->clock);
 	if (rc) {
 		dev_err(dev, "Failed to enable the clock.\n");
@@ -973,6 +989,9 @@ static int aspeed_xdma_remove(struct platform_device *pdev)
 	reset_control_assert(ctx->reset);
 	clk_disable_unprepare(ctx->clock);
 
+	if (ctx->reset_rc)
+		reset_control_assert(ctx->reset_rc);
+
 	return 0;
 }
 
-- 
2.24.0

