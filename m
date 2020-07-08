Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B70219164
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 22:25:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B29mc0w1JzDqgs
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 06:25:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B29lh4fFbzDqfs
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 06:25:03 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068K664X112543; Wed, 8 Jul 2020 16:24:58 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kt79ytn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 16:24:58 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068KJwF3001644;
 Wed, 8 Jul 2020 20:24:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 325k1v8swt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 20:24:58 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068KOv3m48759266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 20:24:57 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65D54AC060;
 Wed,  8 Jul 2020 20:24:57 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E880DAC05B;
 Wed,  8 Jul 2020 20:24:56 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.88.162])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 20:24:56 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 1/2] clk: AST2600: Add mux for EMMC clock
Date: Wed,  8 Jul 2020 15:24:53 -0500
Message-Id: <20200708202454.21333-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_17:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 suspectscore=1 impostorscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007080121
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

The EMMC clock can be derived from either the HPLL or the MPLL. Register
a clock mux so that the rate is calculated correctly based upon the
parent.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/clk/clk-ast2600.c | 49 ++++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 35f53956c762..bbacaccad554 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -131,6 +131,18 @@ static const struct clk_div_table ast2600_eclk_div_table[] = {
 	{ 0 }
 };
 
+static const struct clk_div_table ast2600_emmc_extclk_div_table[] = {
+	{ 0x0, 2 },
+	{ 0x1, 4 },
+	{ 0x2, 6 },
+	{ 0x3, 8 },
+	{ 0x4, 10 },
+	{ 0x5, 12 },
+	{ 0x6, 14 },
+	{ 0x7, 16 },
+	{ 0 }
+};
+
 static const struct clk_div_table ast2600_mac_div_table[] = {
 	{ 0x0, 4 },
 	{ 0x1, 4 },
@@ -390,6 +402,11 @@ static struct clk_hw *aspeed_g6_clk_hw_register_gate(struct device *dev,
 	return hw;
 }
 
+static const char *const emmc_extclk_parent_names[] = {
+	"emmc_extclk_hpll_in",
+	"mpll",
+};
+
 static const char * const vclk_parent_names[] = {
 	"dpll",
 	"d1pll",
@@ -459,16 +476,32 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_UARTX] = hw;
 
-	/* EMMC ext clock divider */
-	hw = clk_hw_register_gate(dev, "emmc_extclk_gate", "hpll", 0,
-			scu_g6_base + ASPEED_G6_CLK_SELECTION1, 15, 0,
-			&aspeed_g6_clk_lock);
+	/* EMMC ext clock */
+	hw = clk_hw_register_fixed_factor(dev, "emmc_extclk_hpll_in", "hpll",
+					  0, 1, 2);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
-	hw = clk_hw_register_divider_table(dev, "emmc_extclk", "emmc_extclk_gate", 0,
-			scu_g6_base + ASPEED_G6_CLK_SELECTION1, 12, 3, 0,
-			ast2600_div_table,
-			&aspeed_g6_clk_lock);
+
+	hw = clk_hw_register_mux(dev, "emmc_extclk_mux",
+				 emmc_extclk_parent_names,
+				 ARRAY_SIZE(emmc_extclk_parent_names), 0,
+				 scu_g6_base + ASPEED_G6_CLK_SELECTION1, 11, 1,
+				 0, &aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	hw = clk_hw_register_gate(dev, "emmc_extclk_gate", "emmc_extclk_mux",
+				  0, scu_g6_base + ASPEED_G6_CLK_SELECTION1,
+				  15, 0, &aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	hw = clk_hw_register_divider_table(dev, "emmc_extclk",
+					   "emmc_extclk_gate", 0,
+					   scu_g6_base +
+						ASPEED_G6_CLK_SELECTION1, 12,
+					   3, 0, ast2600_emmc_extclk_div_table,
+					   &aspeed_g6_clk_lock);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_EMMC] = hw;
-- 
2.24.0

