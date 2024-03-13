Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4960387A501
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 10:29:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvlZV14f3z3vXq
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 20:29:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvlZ54g2fz3d2S;
	Wed, 13 Mar 2024 20:28:37 +1100 (AEDT)
Received: from TWMBX03.aspeed.com (192.168.0.125) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 13 Mar
 2024 17:29:19 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.125) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 13 Mar
 2024 17:29:18 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Mar 2024 17:28:10 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <linus.walleij@linaro.org>,
	<joel@jms.id.au>, <johnny_huang@aspeedtech.com>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
	<Ricky_CX_Wu@wiwynn.com>
Subject: [PATCH v2] pinctrl: pinctrl-aspeed-g6: Fix register offset for pinconf of GPIOR-T
Date: Wed, 13 Mar 2024 17:28:09 +0800
Message-ID: <20240313092809.2596644-1-billy_tsai@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

The register offset to disable the internal pull-down of GPIOR~T is 0x630
instead of 0x620, as specified in the Ast2600 datasheet v15
The datasheet can download from the official Aspeed website.

Fixes: 15711ba6ff19 ("pinctrl: aspeed-g6: Add AST2600 pinconf support")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
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

