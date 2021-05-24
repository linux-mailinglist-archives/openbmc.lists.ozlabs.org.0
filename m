Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD94038E536
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 13:15:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpZPq4Zj1z3bwN
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 21:15:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=steven_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpZNg1L7dz3bT7;
 Mon, 24 May 2021 21:14:27 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 14OB0qgP024993;
 Mon, 24 May 2021 19:00:52 +0800 (GMT-8)
 (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 19:13:46 +0800
From: Steven Lee <steven_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/3] pinctrl: pinctrl-aspeed-g6: Add sgpio pinctrl settings
Date: Mon, 24 May 2021 19:13:37 +0800
Message-ID: <20210524111338.16049-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524111338.16049-1-steven_lee@aspeedtech.com>
References: <20210524111338.16049-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 14OB0qgP024993
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
Cc: billy_tsai@aspeedtech.com, ryan_chen@aspeedtech.com,
 steven_lee@aspeedtech.com, Hongweiz@ami.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
Current pinctrl driver only define the first sgpio master and slave
interfaces.
The sencond SGPIO master and slave interfaces should be added in
pinctrl driver as well.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 24 ++++++++++++++++++----
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  9 ++++++++
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5c1a109842a7..d0e9ab9d1a9c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -46,8 +46,10 @@
 #define SCU620		0x620 /* Disable GPIO Internal Pull-Down #4 */
 #define SCU634		0x634 /* Disable GPIO Internal Pull-Down #5 */
 #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
+#define SCU690		0x690 /* Multi-function Pin Control #24 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
 #define SCU69C		0x69C /* Multi-function Pin Control #27 */
+#define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
 #define SCUC20		0xC20 /* PCIE configuration Setting Control */
 
 #define ASPEED_G6_NR_PINS 256
@@ -81,13 +83,17 @@ FUNC_GROUP_DECL(I2C12, L26, K24);
 #define K26 4
 SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
 SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
-PIN_DECL_2(K26, GPIOA4, MACLINK1, SCL13);
+SIG_EXPR_LIST_DECL_SESG(K26, SGPS2CK, SGPS2, SIG_DESC_SET(SCU690, 4));
+SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4));
+PIN_DECL_4(K26, GPIOA4, SGPM2CLK, SGPS2CK, MACLINK1, SCL13);
 FUNC_GROUP_DECL(MACLINK1, K26);
 
 #define L24 5
 SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
 SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
-PIN_DECL_2(L24, GPIOA5, MACLINK2, SDA13);
+SIG_EXPR_LIST_DECL_SESG(L24, SGPS2LD, SGPS2, SIG_DESC_SET(SCU690, 5));
+SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5));
+PIN_DECL_4(L24, GPIOA5, SGPM2LD, SGPS2LD, MACLINK2, SDA13);
 FUNC_GROUP_DECL(MACLINK2, L24);
 
 FUNC_GROUP_DECL(I2C13, K26, L24);
@@ -95,16 +101,22 @@ FUNC_GROUP_DECL(I2C13, K26, L24);
 #define L23 6
 SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
 SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
-PIN_DECL_2(L23, GPIOA6, MACLINK3, SCL14);
+SIG_EXPR_LIST_DECL_SESG(L23, SGPS2O, SGPS2, SIG_DESC_SET(SCU690, 6));
+SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6));
+PIN_DECL_4(L23, GPIOA6, SGPM2O, SGPS2O, MACLINK3, SCL14);
 FUNC_GROUP_DECL(MACLINK3, L23);
 
 #define K25 7
 SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
 SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
-PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
+SIG_EXPR_LIST_DECL_SESG(K25, SGPS2I, SGPS2, SIG_DESC_SET(SCU690, 7));
+SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7));
+PIN_DECL_4(K25, GPIOA7, SGPM2I, SGPS2I, MACLINK4, SDA14);
 FUNC_GROUP_DECL(MACLINK4, K25);
 
 FUNC_GROUP_DECL(I2C14, L23, K25);
+FUNC_GROUP_DECL(SGPM2, K26, L24, L23, K25);
+FUNC_GROUP_DECL(SGPS2, K26, L24, L23, K25);
 
 #define J26 8
 SIG_EXPR_LIST_DECL_SESG(J26, SALT1, SALT1, SIG_DESC_SET(SCU410, 8));
@@ -2060,7 +2072,9 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(EMMCG4),
 	ASPEED_PINCTRL_GROUP(EMMCG8),
 	ASPEED_PINCTRL_GROUP(SGPM1),
+	ASPEED_PINCTRL_GROUP(SGPM2),
 	ASPEED_PINCTRL_GROUP(SGPS1),
+	ASPEED_PINCTRL_GROUP(SGPS2),
 	ASPEED_PINCTRL_GROUP(SIOONCTRL),
 	ASPEED_PINCTRL_GROUP(SIOPBI),
 	ASPEED_PINCTRL_GROUP(SIOPBO),
@@ -2276,7 +2290,9 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(SD1),
 	ASPEED_PINCTRL_FUNC(SD2),
 	ASPEED_PINCTRL_FUNC(SGPM1),
+	ASPEED_PINCTRL_FUNC(SGPM2),
 	ASPEED_PINCTRL_FUNC(SGPS1),
+	ASPEED_PINCTRL_FUNC(SGPS2),
 	ASPEED_PINCTRL_FUNC(SIOONCTRL),
 	ASPEED_PINCTRL_FUNC(SIOPBI),
 	ASPEED_PINCTRL_FUNC(SIOPBO),
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index dba5875ff276..125df796af36 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -730,6 +730,15 @@ struct aspeed_pin_desc {
 			SIG_EXPR_LIST_PTR(pin, low), \
 			SIG_EXPR_LIST_PTR(pin, other))
 
+#define PIN_DECL_4(pin, other, high, medium, low1, low2) \
+	SIG_EXPR_LIST_DECL_SESG(pin, other, other); \
+	PIN_DECL_(pin, \
+			SIG_EXPR_LIST_PTR(pin, high), \
+			SIG_EXPR_LIST_PTR(pin, medium), \
+			SIG_EXPR_LIST_PTR(pin, low1), \
+			SIG_EXPR_LIST_PTR(pin, low2), \
+			SIG_EXPR_LIST_PTR(pin, other))
+
 #define GROUP_SYM(group) group_pins_ ## group
 #define GROUP_DECL(group, ...) \
 	static const int GROUP_SYM(group)[] = { __VA_ARGS__ }
-- 
2.17.1

