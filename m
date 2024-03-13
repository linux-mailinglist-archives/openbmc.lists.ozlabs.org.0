Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29787A1B9
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 03:43:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ooXevoVx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvZZK0KDvz3dRp
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 13:43:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=ooXevoVx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::620; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvZYb3xDdz3bZN;
	Wed, 13 Mar 2024 13:42:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU2Ru2pTFlACRp50PAOQ1nACEv5CXPims4UexZSSNPZhEbAAbvRo/PCKde70j+A54s+W3lcAJQK9+nyX+gLbKzY63jB69KAGs9IToJoxpsOrxN6ao/joPcQT0shVySTDwODMePX5gNorygXjMjsec48Ng+EKqza7JofgNG4sJhOv4hQQFEqv92nUph+Qv5k9c4EX550FApjYl22ICEl2uEXq1bKwF7KsCnDlBtbekhaacMAQ1Q5sIFPJ0FaDI/d/heqZ4a+G/i4m0dD6QW05inpPFlTnaIA2RtleGsLw9OwRg8RA8m9JBs/XjaAL/YQHTP8VD2ylNBJMWh2mtqO06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TW3Lfg28Nu7zLIyIVqNz+ndBJZNbcytAHk0U0JB2VSc=;
 b=kEVhYn1yjVpexqtGVefFKo5jbdnoPZFQ59XPDefa6BhpujZITFa8kFWjbGA2hP4TUHeEUG6qsix1jO//1MNDz/pbjjCsdgcXpauNU1DG4zs/gb2+nenkewSk3Wffb4xr9d9Yv+W92YhWakhZ/H+9/Xrmy95spotgCACGEf7cnLmxqxt/vZydTNyKuWUPB64n9BC+4UDBxoeGR8mNNhqjyBJECJHjNlQudYZi6TWY8UGbm+J22YLF5u0z3od2G0eO8YwHA0GarTgJ+XH81YYB+YUtKFCElVs+KfkJJyOOYq1Yb+rQfsvGUWoJYZISZxPWhUKrjbLQZATPP3h74Cfo0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TW3Lfg28Nu7zLIyIVqNz+ndBJZNbcytAHk0U0JB2VSc=;
 b=ooXevoVxQrcILK+eaSQJI6vc0w9cIo7tGmnq3x3BvbNtYwA8mc4u3uEjH+g6bULpHev01HNwD5hxJarLQmdDmawkG35WzCVbKA+JG9bA1TsvOElK/6LKnKWzB/1dvsiMG/bobMAUz5mM8HXTmZZa7nuB8jBgE5aX3FhhpI/OmCUhG+NY99Plu56ZPX5Nvec39vWToaa8QWkrSvpFOcgfG0DrcSJH4NBxwWcHZN2Jxt7ETYHPEr/fy1AlWUpBe9TYjTm9Q+IBk6/Udk+VBofGpOSISK4gq0yYuIU9j0hBdQUd3UmTMZ9KNykzRDQ/zQE+izGr3TiGh38z6H7D/f9Scg==
Received: from SI2PR02CA0022.apcprd02.prod.outlook.com (2603:1096:4:195::23)
 by TYSPR04MB7714.apcprd04.prod.outlook.com (2603:1096:405:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Wed, 13 Mar
 2024 02:42:14 +0000
Received: from HK2PEPF00006FB0.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::94) by SI2PR02CA0022.outlook.office365.com
 (2603:1096:4:195::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Wed, 13 Mar 2024 02:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB0.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server id 15.20.7386.12 via Frontend Transport; Wed, 13 Mar 2024 02:42:12
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v1] pinctrl: pinctrl-aspeed-g6: correct the offset of SCU630
Date: Wed, 13 Mar 2024 10:42:10 +0800
Message-Id: <20240313024210.31452-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB0:EE_|TYSPR04MB7714:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2fbff89c-6ee3-4525-5767-08dc4307300f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oaSuPh/Z17boEIZKsqtTRtXIQ1cQr3gU/6fIG5ckwfV+qwoKJxPxf1AsDrYPjNiVPmYD8vHJ+Q2aTlKji3jg5l4Hlg9P7tbFDf6uVNnp0pi7xylsNM2n4m6n4TFFmMNqL54bBYig6ED4rki0AjZpEFS4SZZp2meWty5Kj3nRLpV4bJxABCAOzdjIz1BP7V7zsME98sjgiTm5Rlz1UvSOljD67ByAG9nKFwJqDzZgzBdkBiTcA0yQcrWQSeM77EnRG9gYpufMI4PjX81t6bB4exgFBJ4La5C9Rvgd+cFo5rURT9RsNRltfbg9h4cppzE/cB7HWR1b9sIOgBrCR65TArQuxk+m0uIDjkV9U+J84FODw3dXEGtg+93VN4RH3lu+eQH5ZQ5r51vyrtvuoY60Tr8QYOL/RR6gYykEmbq0P6FVm3TRieH9EbG8qv2l6wBYZLP9ZnjaFwGlqhSFoR+QMMgfAY4OozGhBcYIr8blxAVKP6MPa/S0yG5MSyRUjXgjeQPmu5s9lSRWQS2swys/yC3GjPMHb+EAjcuhdRZPXtZ9AruptUW4yRSDniwmPaq8BqLjVw0ABuxQLBz4X89mFQfOFkSbgnBGSYRT6bDKNSbXUbw58RcAa4f+aF2r0JyAA3AKWFShm7xUUyWrWHjty1sCbuqHzzFemWQH9JqmocI5vDLylN20rELRJsvlFwfIHoEndgKdhBPXq/MjlZwDZ9LJY1knaQOqIqMaZjp+X32MCWrqrNFkcD/C453XeJcI
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 02:42:12.8035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbff89c-6ee3-4525-5767-08dc4307300f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK2PEPF00006FB0.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7714
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Description:
Correct the offset of "Disable GPIO Internal Pull-Down #4" register that
should be 630h according to the AST2620 datasheet.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 34 +++++++++++-----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index d376fa7114d1..029efe16f8cc 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -43,7 +43,7 @@
 #define SCU614		0x614 /* Disable GPIO Internal Pull-Down #1 */
 #define SCU618		0x618 /* Disable GPIO Internal Pull-Down #2 */
 #define SCU61C		0x61c /* Disable GPIO Internal Pull-Down #3 */
-#define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
+#define SCU630		0x630 /* Disable GPIO Internal Pull-Down #4 */
 #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
 #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
 #define SCU690		0x690 /* Multi-function Pin Control #24 */
@@ -2495,38 +2495,38 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
 	ASPEED_PULL_DOWN_PINCONF(D14, SCU61C, 0),
 
 	/* GPIOS7 */
-	ASPEED_PULL_DOWN_PINCONF(T24, SCU620, 23),
+	ASPEED_PULL_DOWN_PINCONF(T24, SCU630, 23),
 	/* GPIOS6 */
-	ASPEED_PULL_DOWN_PINCONF(P23, SCU620, 22),
+	ASPEED_PULL_DOWN_PINCONF(P23, SCU630, 22),
 	/* GPIOS5 */
-	ASPEED_PULL_DOWN_PINCONF(P24, SCU620, 21),
+	ASPEED_PULL_DOWN_PINCONF(P24, SCU630, 21),
 	/* GPIOS4 */
-	ASPEED_PULL_DOWN_PINCONF(R26, SCU620, 20),
+	ASPEED_PULL_DOWN_PINCONF(R26, SCU630, 20),
 	/* GPIOS3*/
-	ASPEED_PULL_DOWN_PINCONF(R24, SCU620, 19),
+	ASPEED_PULL_DOWN_PINCONF(R24, SCU630, 19),
 	/* GPIOS2 */
-	ASPEED_PULL_DOWN_PINCONF(T26, SCU620, 18),
+	ASPEED_PULL_DOWN_PINCONF(T26, SCU630, 18),
 	/* GPIOS1 */
-	ASPEED_PULL_DOWN_PINCONF(T25, SCU620, 17),
+	ASPEED_PULL_DOWN_PINCONF(T25, SCU630, 17),
 	/* GPIOS0 */
-	ASPEED_PULL_DOWN_PINCONF(R23, SCU620, 16),
+	ASPEED_PULL_DOWN_PINCONF(R23, SCU630, 16),
 
 	/* GPIOR7 */
-	ASPEED_PULL_DOWN_PINCONF(U26, SCU620, 15),
+	ASPEED_PULL_DOWN_PINCONF(U26, SCU630, 15),
 	/* GPIOR6 */
-	ASPEED_PULL_DOWN_PINCONF(W26, SCU620, 14),
+	ASPEED_PULL_DOWN_PINCONF(W26, SCU630, 14),
 	/* GPIOR5 */
-	ASPEED_PULL_DOWN_PINCONF(T23, SCU620, 13),
+	ASPEED_PULL_DOWN_PINCONF(T23, SCU630, 13),
 	/* GPIOR4 */
-	ASPEED_PULL_DOWN_PINCONF(U25, SCU620, 12),
+	ASPEED_PULL_DOWN_PINCONF(U25, SCU630, 12),
 	/* GPIOR3*/
-	ASPEED_PULL_DOWN_PINCONF(V26, SCU620, 11),
+	ASPEED_PULL_DOWN_PINCONF(V26, SCU630, 11),
 	/* GPIOR2 */
-	ASPEED_PULL_DOWN_PINCONF(V24, SCU620, 10),
+	ASPEED_PULL_DOWN_PINCONF(V24, SCU630, 10),
 	/* GPIOR1 */
-	ASPEED_PULL_DOWN_PINCONF(U24, SCU620, 9),
+	ASPEED_PULL_DOWN_PINCONF(U24, SCU630, 9),
 	/* GPIOR0 */
-	ASPEED_PULL_DOWN_PINCONF(V25, SCU620, 8),
+	ASPEED_PULL_DOWN_PINCONF(V25, SCU630, 8),
 
 	/* GPIOX7 */
 	ASPEED_PULL_DOWN_PINCONF(AB10, SCU634, 31),
-- 
2.25.1

