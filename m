Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45A250B79
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 00:13:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb5wY1Jt2zDqQC
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:13:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mebu4Fo9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb5tG1lWwzDqPQ
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 08:11:01 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OM6Ncr045161; Mon, 24 Aug 2020 18:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kpz/XsXTelVRnJvM0w0HxO0bceAGHJmCQ9695QB9ozU=;
 b=mebu4Fo97QB26qib90W6ArOK90WV1S2z+gVurih+9V8DEyhW74gmeo+m4oMUpJ4xTuUp
 +zK+wBWm435sEH1YLjHpqHGqe3N9sCG1jig1kd68lqh8yg8/3yEaZws8Z76UE9HxPeE7
 /x/47mOI1k70YFSxphnytkt85Bc0g/XhjKb1rah2rR7LXLdHWUHaZOGxN3MYZmAig8IM
 aypD1Xl2jnkT2g98sEJE4BN1noQ1uSVmBMUIZ7Z4VbcS+vgS9mmySe4z1xsp3Qj0y5Pb
 XLRRFBIjM59FokfrxQNI+taXFk53THAQ6i8Rnwy6dc8sCvcaNNL9XWMAnWOxNt1XVgQc lQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334mpmtcu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 18:10:55 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07OM2Sfu018533;
 Mon, 24 Aug 2020 22:10:54 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 332utqmmqu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 22:10:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07OMAr3830015752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 22:10:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BE8A12408F;
 Mon, 24 Aug 2020 22:10:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A355124088;
 Mon, 24 Aug 2020 22:10:53 +0000 (GMT)
Received: from SHADE6A.ibmmodules.com (unknown [9.211.49.145])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Aug 2020 22:10:52 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 1/4] clk: ast2600: Add functionality to the APLL
 clock
Date: Mon, 24 Aug 2020 17:10:48 -0500
Message-Id: <20200824221051.47972-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824221051.47972-1-eajames@linux.ibm.com>
References: <20200824221051.47972-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240174
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Register a clock with it's own operations to describe the APLL on
the AST2600. The clock is controlled by an SCU register containing
a multiplier and divider of the 25MHz input clock.
The functionality to change the APLL is necessary to finely control
the FSI clock.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/clk/clk-ast2600.c                 | 177 ++++++++++++++++++++--
 include/dt-bindings/clock/ast2600-clock.h |   1 +
 2 files changed, 166 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index bbacaccad554..975677491f09 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -4,6 +4,7 @@
 
 #define pr_fmt(fmt) "clk-ast2600: " fmt
 
+#include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -15,7 +16,7 @@
 
 #include "clk-aspeed.h"
 
-#define ASPEED_G6_NUM_CLKS		71
+#define ASPEED_G6_NUM_CLKS		72
 
 #define ASPEED_G6_SILICON_REV		0x004
 
@@ -31,6 +32,7 @@
 #define ASPEED_G6_CLK_SELECTION1	0x300
 #define ASPEED_G6_CLK_SELECTION2	0x304
 #define ASPEED_G6_CLK_SELECTION4	0x310
+#define ASPEED_G6_CLK_SELECTION5	0x314
 
 #define ASPEED_HPLL_PARAM		0x200
 #define ASPEED_APLL_PARAM		0x210
@@ -116,7 +118,7 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	[ASPEED_CLK_GATE_UART11CLK]	= { 59,  -1, "uart11clk-gate",	"uartx", 0 },	/* UART11 */
 	[ASPEED_CLK_GATE_UART12CLK]	= { 60,  -1, "uart12clk-gate",	"uartx", 0 },	/* UART12 */
 	[ASPEED_CLK_GATE_UART13CLK]	= { 61,  -1, "uart13clk-gate",	"uartx", 0 },	/* UART13 */
-	[ASPEED_CLK_GATE_FSICLK]	= { 62,  59, "fsiclk-gate",	NULL,	 0 },	/* FSI */
+	[ASPEED_CLK_GATE_FSICLK]	= { 62,  59, "fsiclk-gate",	"aplln", CLK_SET_RATE_PARENT },	/* FSI */
 };
 
 static const struct clk_div_table ast2600_eclk_div_table[] = {
@@ -187,24 +189,166 @@ static struct clk_hw *ast2600_calc_pll(const char *name, u32 val)
 			mult, div);
 };
 
-static struct clk_hw *ast2600_calc_apll(const char *name, u32 val)
+/*
+ * APLL Frequency: F = 25MHz * (2 - od) * [(m + 2) / (n + 1)]
+ */
+static void ast2600_apll_get_params(unsigned int *div, unsigned int *mul)
 {
-	unsigned int mult, div;
+	u32 val = readl(scu_g6_base + ASPEED_APLL_PARAM);
 
 	if (val & BIT(20)) {
 		/* Pass through mode */
-		mult = div = 1;
+		*mul = *div = 1;
 	} else {
-		/* F = 25Mhz * (2-od) * [(m + 2) / (n + 1)] */
 		u32 m = (val >> 5) & 0x3f;
 		u32 od = (val >> 4) & 0x1;
 		u32 n = val & 0xf;
 
-		mult = (2 - od) * (m + 2);
-		div = n + 1;
+		*mul = (2 - od) * (m + 2);
+		*div = n + 1;
 	}
-	return clk_hw_register_fixed_factor(NULL, name, "clkin", 0,
-			mult, div);
+}
+
+static long ast2600_apll_best(unsigned long ul_rate, unsigned long ul_prate,
+			      unsigned int *out_div, unsigned int *out_mul,
+			      unsigned int *output_divider)
+{
+#define min_mult 2ULL
+#define max_mult 65ULL
+#define min_div 1ULL
+#define max_div 16ULL
+	int i;
+	unsigned int bod = 0;
+	unsigned long long rem = 1ULL;
+	unsigned long long brem = ~(0ULL);
+	unsigned long long bdiv = 1ULL;
+	unsigned long long tdiv;
+	unsigned long long bmul = 16ULL;
+	unsigned long long tmul;
+	long brate = -ERANGE;
+	unsigned long long trate;
+	unsigned long long rate = ul_rate;
+	unsigned long long prate = ul_prate;
+
+	for (i = 0; i < 2; ++i, prate *= 2ULL) {
+		for (tdiv = min_div; tdiv <= max_div; ++tdiv) {
+			tmul = DIV_ROUND_CLOSEST_ULL(rate * tdiv, prate);
+			if (tmul <  min_mult || tmul > max_mult)
+				continue;
+
+			trate = DIV_ROUND_CLOSEST_ULL(prate * tmul, tdiv);
+			if (trate > rate)
+				rem = trate - rate;
+			else
+				rem = rate - trate;
+
+			if (rem < brem) {
+				bod = !i;
+				brem = rem;
+				bdiv = tdiv;
+				bmul = tmul;
+				brate = (long)trate;
+			}
+
+			if (!rem)
+				break;
+		}
+
+		if (!rem)
+			break;
+	}
+
+	if (out_div)
+		*out_div = (unsigned int)bdiv;
+
+	if (out_mul)
+		*out_mul = (unsigned int)bmul;
+
+	if (output_divider)
+		*output_divider = bod;
+
+	return brate;
+#undef min_mult
+#undef max_mult
+#undef min_div
+#undef max_div
+}
+
+static unsigned long ast2600_apll_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	unsigned int div;
+	unsigned int mul;
+	unsigned long long rate;
+	unsigned long long prate = (unsigned long long)parent_rate;
+
+	ast2600_apll_get_params(&div, &mul);
+
+	rate = DIV_ROUND_CLOSEST_ULL(prate * (unsigned long long)mul, div);
+	return (unsigned long)rate;
+}
+
+static long ast2600_apll_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	return ast2600_apll_best(rate, *parent_rate, NULL, NULL, NULL);
+}
+
+static int ast2600_apll_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	u32 val;
+	unsigned int od;
+	unsigned int div;
+	unsigned int mul;
+	long brate = ast2600_apll_best(rate, parent_rate, &div, &mul, &od);
+
+	if (brate < 0)
+		return brate;
+
+	val = readl(scu_g6_base + ASPEED_APLL_PARAM);
+	val &= ~0x7ff;
+	val |= (div - 1) & 0xf;
+	val |= ((mul - 2) & 0x3f) << 5;
+	if (od)
+		val |= 0x10;
+	writel(val, scu_g6_base + ASPEED_APLL_PARAM);
+
+	return 0;
+}
+
+static const struct clk_ops ast2600_apll_ops = {
+	.recalc_rate = ast2600_apll_recalc_rate,
+	.round_rate = ast2600_apll_round_rate,
+	.set_rate = ast2600_apll_set_rate,
+};
+
+static struct clk_hw *ast2600_create_apll(void)
+{
+	int rc;
+	const char *parent = "clkin";
+	struct clk_init_data init = {
+		.name = "apll",
+		.ops = &ast2600_apll_ops,
+		.parent_names = &parent,
+		.parent_data = NULL,
+		.parent_hws = NULL,
+		.num_parents = 1,
+		.flags = 0,
+	};
+	struct clk_hw *clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	clk->init = &init;
+	rc = of_clk_hw_register(NULL, clk);
+	if (rc) {
+		kfree(clk);
+		clk = ERR_PTR(rc);
+	}
+
+	return clk;
 };
 
 static u32 get_bit(u8 idx)
@@ -630,6 +774,16 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_ECLK] = hw;
 
+	hw = clk_hw_register_divider_table(dev, "aplln", "apll",
+					   CLK_SET_RATE_PARENT,
+					   scu_g6_base + ASPEED_G6_CLK_SELECTION5,
+					   28, 3, CLK_DIVIDER_READ_ONLY,
+					   ast2600_eclk_div_table,
+					   &aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_APLLN] = hw;
+
 	for (i = 0; i < ARRAY_SIZE(aspeed_g6_gates); i++) {
 		const struct aspeed_gate_data *gd = &aspeed_g6_gates[i];
 		u32 gate_flags;
@@ -710,8 +864,7 @@ static void __init aspeed_g6_cc(struct regmap *map)
 	regmap_read(map, ASPEED_EPLL_PARAM, &val);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_EPLL] = ast2600_calc_pll("epll", val);
 
-	regmap_read(map, ASPEED_APLL_PARAM, &val);
-	aspeed_g6_clk_data->hws[ASPEED_CLK_APLL] = ast2600_calc_apll("apll", val);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_APLL] = ast2600_create_apll();
 
 	/* Strap bits 12:11 define the AXI/AHB clock frequency ratio (aka HCLK)*/
 	regmap_read(map, ASPEED_G6_STRAP1, &val);
diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 62b9520a00fd..a286d63de399 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,6 +87,7 @@
 #define ASPEED_CLK_MAC2RCLK		68
 #define ASPEED_CLK_MAC3RCLK		69
 #define ASPEED_CLK_MAC4RCLK		70
+#define ASPEED_CLK_APLLN        71
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.26.2

