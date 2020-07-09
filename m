Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69121A7F5
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 21:43:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2mms4z9WzDrCW
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 05:43:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2mkv13vkzDqXg
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 05:41:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069JW1Ha066757; Thu, 9 Jul 2020 15:41:21 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325kgy5wud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 15:41:20 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069JUoTP008400;
 Thu, 9 Jul 2020 19:41:20 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 325k28arc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 19:41:20 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 069JfJiR46662116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 19:41:19 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ED4A124055;
 Thu,  9 Jul 2020 19:41:19 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D8B124054;
 Thu,  9 Jul 2020 19:41:18 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.54.227])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 19:41:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.7 v2 1/2] clk: AST2600: Add mux for EMMC clock
Date: Thu,  9 Jul 2020 14:41:12 -0500
Message-Id: <20200709194113.12119-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200709194113.12119-1-eajames@linux.ibm.com>
References: <20200709194113.12119-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_10:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 suspectscore=1 bulkscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090131
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

The EMMC clock can be derived from either the HPLL or the MPLL. Register
a clock mux so that the rate is calculated correctly based upon the
parent.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
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

