Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B39004C2AB
	for <lists+openbmc@lfdr.de>; Wed, 19 Jun 2019 23:03:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tcq81lYXzDqst
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 07:03:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=107391e0c1=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="OnjqZJrL"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tcmr1wtVzDqsG
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 07:00:58 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x5JKwoZa030674
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 14:00:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=WXpeq58S6dL6eDCTC/2yGs+1ISto/uWnTCwAmoTfh00=;
 b=OnjqZJrLiJuEM9YuXGenPVTHIKLFEsb8VkAlWd4NClMjiVIQiJ3qsMix9leys+TeNh7G
 ZJqEkXRQq4hW2Po+y/95XFmPMGdY1YVf0hnec3HJZgQmJ7vBzx6ZJdu59XBt3ZYdSvho
 rVgzbmSGxfQrFlGn/4VftszsaXpJNQy4yVc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2t7s8xgrwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jun 2019 14:00:53 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Wed, 19 Jun 2019 14:00:52 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id B4D83164B5271; Wed, 19 Jun 2019 13:50:10 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Brendan Higgins <brendanhiggins@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,
 <linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Date: Wed, 19 Jun 2019 13:50:09 -0700
Message-ID: <20190619205009.4176588-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190172
X-FB-Internal: deliver
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
Cc: Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some intermittent I2C transaction failures are observed on Facebook CMM and
Minipack (ast2500) BMC platforms, because slave devices (such as CPLD, BIC
and etc.) NACK the address byte sometimes. The issue can be resolved by
increasing base clock divisor which affects ASPEED I2C Controller's base
clock and other AC timing parameters.

This patch allows to customize ASPEED I2C Controller's base clock divisor
in device tree.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 48 ++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 6c8b38fd6e64..e4b1c4c71b62 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -145,7 +145,8 @@ struct aspeed_i2c_bus {
 	spinlock_t			lock;
 	struct completion		cmd_complete;
 	u32				(*get_clk_reg_val)(struct device *dev,
-							   u32 divisor);
+							   u32 divisor,
+							   u32 base_clk_div);
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
 	/* Transaction state. */
@@ -778,9 +779,10 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
 
 static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
 				      u32 clk_high_low_mask,
-				      u32 divisor)
+				      u32 divisor,
+				      u32 base_clk_divisor)
 {
-	u32 base_clk_divisor, clk_high_low_max, clk_high, clk_low, tmp;
+	u32 clk_high_low_max, clk_high, clk_low, tmp;
 
 	/*
 	 * SCL_high and SCL_low represent a value 1 greater than what is stored
@@ -809,10 +811,12 @@ static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
 	 *		((1 << base_clk_divisor) * (clk_high + 1 + clk_low + 1))
 	 * The documentation recommends clk_high >= clk_high_max / 2 and
 	 * clk_low >= clk_low_max / 2 - 1 when possible; this last constraint
-	 * gives us the following solution:
+	 * gives us the following solution (unless base_clk_divisor is manually
+	 * configured in device tree):
 	 */
-	base_clk_divisor = divisor > clk_high_low_max ?
-			ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
+	if (base_clk_divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
+		base_clk_divisor = divisor > clk_high_low_max ?
+				ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
 
 	if (base_clk_divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
 		base_clk_divisor = ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
@@ -843,35 +847,49 @@ static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
 			   & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
 }
 
-static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor)
+static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev,
+					   u32 divisor,
+					   u32 base_clk_divisor)
 {
 	/*
 	 * clk_high and clk_low are each 3 bits wide, so each can hold a max
 	 * value of 8 giving a clk_high_low_max of 16.
 	 */
-	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor);
+	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor,
+					  base_clk_divisor);
 }
 
-static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
+static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev,
+					   u32 divisor,
+					   u32 base_clk_divisor)
 {
 	/*
 	 * clk_high and clk_low are each 4 bits wide, so each can hold a max
 	 * value of 16 giving a clk_high_low_max of 32.
 	 */
-	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor);
+	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor,
+					  base_clk_divisor);
 }
 
 /* precondition: bus.lock has been acquired. */
-static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
+static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
+			       struct platform_device *pdev)
 {
-	u32 divisor, clk_reg_val;
+	int ret;
+	u32 divisor, clk_reg_val, base_clk_divisor;
+
+	ret = of_property_read_u32(pdev->dev.of_node, "base-clock-divisor",
+				   &base_clk_divisor);
+	if (ret < 0)
+		base_clk_divisor = (u32)-1;
 
 	divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
 	clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
 			ASPEED_I2CD_TIME_THDSTA_MASK |
 			ASPEED_I2CD_TIME_TACST_MASK);
-	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor);
+	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor,
+					    base_clk_divisor);
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
@@ -888,7 +906,7 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
 	/* Disable everything. */
 	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
 
-	ret = aspeed_i2c_init_clk(bus);
+	ret = aspeed_i2c_init_clk(bus, pdev);
 	if (ret < 0)
 		return ret;
 
@@ -989,7 +1007,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (!match)
 		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
 	else
-		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
+		bus->get_clk_reg_val = (u32 (*)(struct device *, u32, u32))
 				match->data;
 
 	/* Initialize the I2C adapter */
-- 
2.17.1

