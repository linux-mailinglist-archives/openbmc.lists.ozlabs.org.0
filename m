Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453DE65BD4D
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 10:39:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NmSPF0rhmz3c8c
	for <lists+openbmc@lfdr.de>; Tue,  3 Jan 2023 20:39:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NmSMX461tz3bby;
	Tue,  3 Jan 2023 20:37:57 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 3039R8HP072914;
	Tue, 3 Jan 2023 17:27:08 +0800 (GMT-8)
	(envelope-from ryan_chen@aspeedtech.com)
Received: from aspeedtech.com (192.168.10.13) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Jan
 2023 17:37:09 +0800
From: ryan_chen <ryan_chen@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, ryan_chen <ryan_chen@aspeedtech.com>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH 1/2] pinctrl:aspeed: add miss pin and function
Date: Tue, 3 Jan 2023 17:37:01 +0800
Message-ID: <20230103093702.2613574-2-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.13]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 3039R8HP072914
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

Add pin: A7,D7
Add function: qspi, secure i2c, pcie rc

Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 341 +++++++++++++++------
 1 file changed, 239 insertions(+), 102 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 80838dc54b3a..cf9554f0911f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -17,6 +17,8 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-aspeed.h"
 
+#define SCU040		0x040 /* Reset Control Set 1  */
+#define SCU0C8		0x0C8 /* Debug Control  */
 #define SCU400		0x400 /* Multi-function Pin Control #1  */
 #define SCU404		0x404 /* Multi-function Pin Control #2  */
 #define SCU40C		0x40C /* Multi-function Pin Control #3  */
@@ -31,6 +33,8 @@
 #define SCU450		0x450 /* Multi-function Pin Control #14 */
 #define SCU454		0x454 /* Multi-function Pin Control #15 */
 #define SCU458		0x458 /* Multi-function Pin Control #16 */
+#define SCU470		0x470
+#define SCU474		0x474
 #define SCU4B0		0x4B0 /* Multi-function Pin Control #17 */
 #define SCU4B4		0x4B4 /* Multi-function Pin Control #18 */
 #define SCU4B8		0x4B8 /* Multi-function Pin Control #19 */
@@ -48,19 +52,23 @@
 #define SCU638		0x638 /* Disable GPIO Internal Pull-Down #6 */
 #define SCU690		0x690 /* Multi-function Pin Control #24 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
+#define SCU698		0x698 /* Multi-function Pin Control #26 */
 #define SCU69C		0x69C /* Multi-function Pin Control #27 */
 #define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
 #define SCUC20		0xC20 /* PCIE configuration Setting Control */
+#define SCUC24		0xC24 /* BMC MMIO Decode Setting */
 
-#define ASPEED_G6_NR_PINS 256
+#define ASPEED_G6_NR_PINS 258
 
 #define M24 0
-SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
+SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0),
+			  SIG_DESC_CLEAR(SCU470, 0));
 SIG_EXPR_LIST_DECL_SESG(M24, SCL11, I2C11, SIG_DESC_SET(SCU4B0, 0));
 PIN_DECL_2(M24, GPIOA0, MDC3, SCL11);
 
 #define M25 1
-SIG_EXPR_LIST_DECL_SESG(M25, MDIO3, MDIO3, SIG_DESC_SET(SCU410, 1));
+SIG_EXPR_LIST_DECL_SESG(M25, MDIO3, MDIO3, SIG_DESC_SET(SCU410, 1),
+			  SIG_DESC_CLEAR(SCU470, 1));
 SIG_EXPR_LIST_DECL_SESG(M25, SDA11, I2C11, SIG_DESC_SET(SCU4B0, 1));
 PIN_DECL_2(M25, GPIOA1, MDIO3, SDA11);
 
@@ -68,12 +76,14 @@ FUNC_GROUP_DECL(MDIO3, M24, M25);
 FUNC_GROUP_DECL(I2C11, M24, M25);
 
 #define L26 2
-SIG_EXPR_LIST_DECL_SESG(L26, MDC4, MDIO4, SIG_DESC_SET(SCU410, 2));
+SIG_EXPR_LIST_DECL_SESG(L26, MDC4, MDIO4, SIG_DESC_SET(SCU410, 2),
+			  SIG_DESC_CLEAR(SCU470, 2));
 SIG_EXPR_LIST_DECL_SESG(L26, SCL12, I2C12, SIG_DESC_SET(SCU4B0, 2));
 PIN_DECL_2(L26, GPIOA2, MDC4, SCL12);
 
 #define K24 3
-SIG_EXPR_LIST_DECL_SESG(K24, MDIO4, MDIO4, SIG_DESC_SET(SCU410, 3));
+SIG_EXPR_LIST_DECL_SESG(K24, MDIO4, MDIO4, SIG_DESC_SET(SCU410, 3),
+			  SIG_DESC_CLEAR(SCU470, 3));
 SIG_EXPR_LIST_DECL_SESG(K24, SDA12, I2C12, SIG_DESC_SET(SCU4B0, 3));
 PIN_DECL_2(K24, GPIOA3, MDIO4, SDA12);
 
@@ -81,7 +91,8 @@ FUNC_GROUP_DECL(MDIO4, L26, K24);
 FUNC_GROUP_DECL(I2C12, L26, K24);
 
 #define K26 4
-SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4));
+SIG_EXPR_LIST_DECL_SESG(K26, MACLINK1, MACLINK1, SIG_DESC_SET(SCU410, 4),
+			  SIG_DESC_CLEAR(SCU470, 4));
 SIG_EXPR_LIST_DECL_SESG(K26, SCL13, I2C13, SIG_DESC_SET(SCU4B0, 4));
 SIG_EXPR_LIST_DECL_SESG(K26, SGPS2CK, SGPS2, SIG_DESC_SET(SCU690, 4));
 SIG_EXPR_LIST_DECL_SESG(K26, SGPM2CLK, SGPM2, SIG_DESC_SET(SCU6D0, 4));
@@ -89,7 +100,8 @@ PIN_DECL_4(K26, GPIOA4, MACLINK1, SCL13, SGPS2CK, SGPM2CLK);
 FUNC_GROUP_DECL(MACLINK1, K26);
 
 #define L24 5
-SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5));
+SIG_EXPR_LIST_DECL_SESG(L24, MACLINK2, MACLINK2, SIG_DESC_SET(SCU410, 5),
+			  SIG_DESC_CLEAR(SCU470, 5));
 SIG_EXPR_LIST_DECL_SESG(L24, SDA13, I2C13, SIG_DESC_SET(SCU4B0, 5));
 SIG_EXPR_LIST_DECL_SESG(L24, SGPS2LD, SGPS2, SIG_DESC_SET(SCU690, 5));
 SIG_EXPR_LIST_DECL_SESG(L24, SGPM2LD, SGPM2, SIG_DESC_SET(SCU6D0, 5));
@@ -99,7 +111,8 @@ FUNC_GROUP_DECL(MACLINK2, L24);
 FUNC_GROUP_DECL(I2C13, K26, L24);
 
 #define L23 6
-SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6));
+SIG_EXPR_LIST_DECL_SESG(L23, MACLINK3, MACLINK3, SIG_DESC_SET(SCU410, 6),
+			  SIG_DESC_CLEAR(SCU470, 6));
 SIG_EXPR_LIST_DECL_SESG(L23, SCL14, I2C14, SIG_DESC_SET(SCU4B0, 6));
 SIG_EXPR_LIST_DECL_SESG(L23, SGPS2O, SGPS2, SIG_DESC_SET(SCU690, 6));
 SIG_EXPR_LIST_DECL_SESG(L23, SGPM2O, SGPM2, SIG_DESC_SET(SCU6D0, 6));
@@ -107,7 +120,8 @@ PIN_DECL_4(L23, GPIOA6, MACLINK3, SCL14, SGPS2O, SGPM2O);
 FUNC_GROUP_DECL(MACLINK3, L23);
 
 #define K25 7
-SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
+SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7),
+			  SIG_DESC_CLEAR(SCU470, 7));
 SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
 SIG_EXPR_LIST_DECL_SESG(K25, SGPS2I, SGPS2, SIG_DESC_SET(SCU690, 7));
 SIG_EXPR_LIST_DECL_SESG(K25, SGPM2I, SGPM2, SIG_DESC_SET(SCU6D0, 7));
@@ -143,12 +157,14 @@ PIN_DECL_2(J25, GPIOB3, SALT4, LHAD3);
 FUNC_GROUP_DECL(SALT4, J25);
 
 #define J23 12
-SIG_EXPR_LIST_DECL_SESG(J23, MDC2, MDIO2, SIG_DESC_SET(SCU410, 12));
+SIG_EXPR_LIST_DECL_SESG(J23, MDC2, MDIO2, SIG_DESC_SET(SCU410, 12),
+			  SIG_DESC_CLEAR(SCU470, 12));
 SIG_EXPR_LIST_DECL_SESG(J23, LHCLK, LPCHC, SIG_DESC_SET(SCU4B0, 12));
 PIN_DECL_2(J23, GPIOB4, MDC2, LHCLK);
 
 #define G26 13
-SIG_EXPR_LIST_DECL_SESG(G26, MDIO2, MDIO2, SIG_DESC_SET(SCU410, 13));
+SIG_EXPR_LIST_DECL_SESG(G26, MDIO2, MDIO2, SIG_DESC_SET(SCU410, 13),
+			  SIG_DESC_CLEAR(SCU470, 13));
 SIG_EXPR_LIST_DECL_SESG(G26, LHFRAME, LPCHC, SIG_DESC_SET(SCU4B0, 13));
 PIN_DECL_2(G26, GPIOB5, MDIO2, LHFRAME);
 
@@ -254,102 +270,123 @@ FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
 #define F24 28
 SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
 SIG_EXPR_LIST_DECL_SESG(F24, RGMII4TXCK, RGMII4, SIG_DESC_SET(SCU4B0, 28),
-			  SIG_DESC_SET(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 28), SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(F24, RMII4RCLKO, RMII4, SIG_DESC_SET(SCU4B0, 28),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 28), SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(F24, GPIOD4, NCTS3, RGMII4TXCK, RMII4RCLKO);
 FUNC_GROUP_DECL(NCTS3, F24);
 
 #define E23 29
 SIG_EXPR_LIST_DECL_SESG(E23, NDCD3, NDCD3, SIG_DESC_SET(SCU410, 29));
 SIG_EXPR_LIST_DECL_SESG(E23, RGMII4TXCTL, RGMII4, SIG_DESC_SET(SCU4B0, 29),
-			  SIG_DESC_SET(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 29), SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(E23, RMII4TXEN, RMII4, SIG_DESC_SET(SCU4B0, 29),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 29), SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(E23, GPIOD5, NDCD3, RGMII4TXCTL, RMII4TXEN);
 FUNC_GROUP_DECL(NDCD3, E23);
 
 #define E24 30
 SIG_EXPR_LIST_DECL_SESG(E24, NDSR3, NDSR3, SIG_DESC_SET(SCU410, 30));
 SIG_EXPR_LIST_DECL_SESG(E24, RGMII4TXD0, RGMII4, SIG_DESC_SET(SCU4B0, 30),
-			  SIG_DESC_SET(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 30), SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(E24, RMII4TXD0, RMII4, SIG_DESC_SET(SCU4B0, 30),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 30), SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(E24, GPIOD6, NDSR3, RGMII4TXD0, RMII4TXD0);
 FUNC_GROUP_DECL(NDSR3, E24);
 
 #define E25 31
 SIG_EXPR_LIST_DECL_SESG(E25, NRI3, NRI3, SIG_DESC_SET(SCU410, 31));
 SIG_EXPR_LIST_DECL_SESG(E25, RGMII4TXD1, RGMII4, SIG_DESC_SET(SCU4B0, 31),
-			  SIG_DESC_SET(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 31), SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(E25, RMII4TXD1, RMII4, SIG_DESC_SET(SCU4B0, 31),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			  SIG_DESC_CLEAR(SCU410, 31), SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(E25, GPIOD7, NRI3, RGMII4TXD1, RMII4TXD1);
 FUNC_GROUP_DECL(NRI3, E25);
 
 #define D26 32
-SIG_EXPR_LIST_DECL_SESG(D26, NDTR3, NDTR3, SIG_DESC_SET(SCU414, 0));
+SIG_EXPR_LIST_DECL_SESG(D26, NDTR3, NDTR3, SIG_DESC_SET(SCU414, 0),
+			SIG_DESC_CLEAR(SCU470, 16));
 SIG_EXPR_LIST_DECL_SESG(D26, RGMII4TXD2, RGMII4, SIG_DESC_SET(SCU4B4, 0),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 16), SIG_DESC_CLEAR(SCU474, 0),
+			SIG_DESC_SET(SCU510, 1));
 PIN_DECL_2(D26, GPIOE0, NDTR3, RGMII4TXD2);
 FUNC_GROUP_DECL(NDTR3, D26);
 
 #define D24 33
-SIG_EXPR_LIST_DECL_SESG(D24, NRTS3, NRTS3, SIG_DESC_SET(SCU414, 1));
+SIG_EXPR_LIST_DECL_SESG(D24, NRTS3, NRTS3, SIG_DESC_SET(SCU414, 1),
+			SIG_DESC_CLEAR(SCU470, 17));
 SIG_EXPR_LIST_DECL_SESG(D24, RGMII4TXD3, RGMII4, SIG_DESC_SET(SCU4B4, 1),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 17), SIG_DESC_CLEAR(SCU474, 1),
+			SIG_DESC_SET(SCU510, 1));
 PIN_DECL_2(D24, GPIOE1, NRTS3, RGMII4TXD3);
 FUNC_GROUP_DECL(NRTS3, D24);
 
 #define C25 34
-SIG_EXPR_LIST_DECL_SESG(C25, NCTS4, NCTS4, SIG_DESC_SET(SCU414, 2));
+SIG_EXPR_LIST_DECL_SESG(C25, NCTS4, NCTS4, SIG_DESC_SET(SCU414, 2),
+			SIG_DESC_CLEAR(SCU470, 18));
 SIG_EXPR_LIST_DECL_SESG(C25, RGMII4RXCK, RGMII4, SIG_DESC_SET(SCU4B4, 2),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 18), SIG_DESC_CLEAR(SCU474, 2),
+			SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(C25, RMII4RCLKI, RMII4, SIG_DESC_SET(SCU4B4, 2),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 18), SIG_DESC_CLEAR(SCU474, 2),
+			SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(C25, GPIOE2, NCTS4, RGMII4RXCK, RMII4RCLKI);
 FUNC_GROUP_DECL(NCTS4, C25);
 
 #define C26 35
-SIG_EXPR_LIST_DECL_SESG(C26, NDCD4, NDCD4, SIG_DESC_SET(SCU414, 3));
+SIG_EXPR_LIST_DECL_SESG(C26, NDCD4, NDCD4, SIG_DESC_SET(SCU414, 3),
+			SIG_DESC_CLEAR(SCU470, 19));
 SIG_EXPR_LIST_DECL_SESG(C26, RGMII4RXCTL, RGMII4, SIG_DESC_SET(SCU4B4, 3),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 19), SIG_DESC_CLEAR(SCU474, 3),
+			SIG_DESC_SET(SCU510, 1));
 PIN_DECL_2(C26, GPIOE3, NDCD4, RGMII4RXCTL);
 FUNC_GROUP_DECL(NDCD4, C26);
 
 #define C24 36
-SIG_EXPR_LIST_DECL_SESG(C24, NDSR4, NDSR4, SIG_DESC_SET(SCU414, 4));
+SIG_EXPR_LIST_DECL_SESG(C24, NDSR4, NDSR4, SIG_DESC_SET(SCU414, 4),
+			SIG_DESC_CLEAR(SCU470, 20));
 SIG_EXPR_LIST_DECL_SESG(C24, RGMII4RXD0, RGMII4, SIG_DESC_SET(SCU4B4, 4),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 20), SIG_DESC_CLEAR(SCU474, 4),
+			SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(C24, RMII4RXD0, RMII4, SIG_DESC_SET(SCU4B4, 4),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 20), SIG_DESC_CLEAR(SCU474, 4),
+			SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(C24, GPIOE4, NDSR4, RGMII4RXD0, RMII4RXD0);
 FUNC_GROUP_DECL(NDSR4, C24);
 
 #define B26 37
-SIG_EXPR_LIST_DECL_SESG(B26, NRI4, NRI4, SIG_DESC_SET(SCU414, 5));
+SIG_EXPR_LIST_DECL_SESG(B26, NRI4, NRI4, SIG_DESC_SET(SCU414, 5),
+			SIG_DESC_CLEAR(SCU470, 21));
 SIG_EXPR_LIST_DECL_SESG(B26, RGMII4RXD1, RGMII4, SIG_DESC_SET(SCU4B4, 5),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 21), SIG_DESC_CLEAR(SCU474, 5),
+			SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(B26, RMII4RXD1, RMII4, SIG_DESC_SET(SCU4B4, 5),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 21), SIG_DESC_CLEAR(SCU474, 5),
+			SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(B26, GPIOE5, NRI4, RGMII4RXD1, RMII4RXD1);
 FUNC_GROUP_DECL(NRI4, B26);
 
 #define B25 38
-SIG_EXPR_LIST_DECL_SESG(B25, NDTR4, NDTR4, SIG_DESC_SET(SCU414, 6));
+SIG_EXPR_LIST_DECL_SESG(B25, NDTR4, NDTR4, SIG_DESC_SET(SCU414, 6),
+			SIG_DESC_CLEAR(SCU470, 22));
 SIG_EXPR_LIST_DECL_SESG(B25, RGMII4RXD2, RGMII4, SIG_DESC_SET(SCU4B4, 6),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 22), SIG_DESC_CLEAR(SCU474, 6),
+			SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(B25, RMII4CRSDV, RMII4, SIG_DESC_SET(SCU4B4, 6),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 22), SIG_DESC_CLEAR(SCU474, 6),
+			SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(B25, GPIOE6, NDTR4, RGMII4RXD2, RMII4CRSDV);
 FUNC_GROUP_DECL(NDTR4, B25);
 
 #define B24 39
-SIG_EXPR_LIST_DECL_SESG(B24, NRTS4, NRTS4, SIG_DESC_SET(SCU414, 7));
+SIG_EXPR_LIST_DECL_SESG(B24, NRTS4, NRTS4, SIG_DESC_SET(SCU414, 7),
+			SIG_DESC_CLEAR(SCU470, 23));
 SIG_EXPR_LIST_DECL_SESG(B24, RGMII4RXD3, RGMII4, SIG_DESC_SET(SCU4B4, 7),
-			  SIG_DESC_SET(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 23), SIG_DESC_CLEAR(SCU474, 7),
+			SIG_DESC_SET(SCU510, 1));
 SIG_EXPR_LIST_DECL_SESG(B24, RMII4RXER, RMII4, SIG_DESC_SET(SCU4B4, 7),
-			  SIG_DESC_CLEAR(SCU510, 1));
+			SIG_DESC_CLEAR(SCU470, 23), SIG_DESC_CLEAR(SCU474, 7),
+			SIG_DESC_CLEAR(SCU510, 1));
 PIN_DECL_3(B24, GPIOE7, NRTS4, RGMII4RXD3, RMII4RXER);
 FUNC_GROUP_DECL(NRTS4, B24);
 
@@ -545,12 +582,14 @@ GROUP_DECL(UART12G0, D17, A16);
 
 #define E17 66
 SIG_EXPR_LIST_DECL_SESG(E17, MTCK, JTAGM, SIG_DESC_SET(SCU418, 2));
-SIG_EXPR_LIST_DECL_SEMG(E17, TXD13, UART13G0, UART13, SIG_DESC_SET(SCU4B8, 2));
+SIG_EXPR_LIST_DECL_SEMG(E17, TXD13, UART13G0, UART13, SIG_DESC_SET(SCU4B8, 2),
+			SIG_DESC_CLEAR(SCU418, 2));
 PIN_DECL_2(E17, GPIOI2, MTCK, TXD13);
 
 #define D16 67
 SIG_EXPR_LIST_DECL_SESG(D16, MTMS, JTAGM, SIG_DESC_SET(SCU418, 3));
-SIG_EXPR_LIST_DECL_SEMG(D16, RXD13, UART13G0, UART13, SIG_DESC_SET(SCU4B8, 3));
+SIG_EXPR_LIST_DECL_SEMG(D16, RXD13, UART13G0, UART13, SIG_DESC_SET(SCU4B8, 3),
+			SIG_DESC_CLEAR(SCU418, 3));
 PIN_DECL_2(D16, GPIOI3, MTMS, RXD13);
 
 GROUP_DECL(UART13G0, E17, D16);
@@ -581,114 +620,144 @@ FUNC_GROUP_DECL(SIOSCI, A15);
 #define B20 72
 SIG_EXPR_LIST_DECL_SEMG(B20, I3C3SCL, HVI3C3, I3C3, SIG_DESC_SET(SCU418, 8));
 SIG_EXPR_LIST_DECL_SESG(B20, SCL1, I2C1, SIG_DESC_SET(SCU4B8, 8));
-PIN_DECL_2(B20, GPIOJ0, I3C3SCL, SCL1);
+SIG_EXPR_LIST_DECL_SESG(B20, SSCL1, SI2C1, SIG_DESC_SET(SCU698, 8));
+PIN_DECL_3(B20, GPIOJ0, I3C3SCL, SCL1, SSCL1);
 
 #define A20 73
 SIG_EXPR_LIST_DECL_SEMG(A20, I3C3SDA, HVI3C3, I3C3, SIG_DESC_SET(SCU418, 9));
 SIG_EXPR_LIST_DECL_SESG(A20, SDA1, I2C1, SIG_DESC_SET(SCU4B8, 9));
-PIN_DECL_2(A20, GPIOJ1, I3C3SDA, SDA1);
+SIG_EXPR_LIST_DECL_SESG(A20, SSDA1, SI2C1, SIG_DESC_SET(SCU698, 9));
+PIN_DECL_3(A20, GPIOJ1, I3C3SDA, SDA1, SSDA1);
 
 GROUP_DECL(HVI3C3, B20, A20);
 FUNC_GROUP_DECL(I2C1, B20, A20);
+FUNC_GROUP_DECL(SI2C1, B20, A20);
 
 #define E19 74
 SIG_EXPR_LIST_DECL_SEMG(E19, I3C4SCL, HVI3C4, I3C4, SIG_DESC_SET(SCU418, 10));
 SIG_EXPR_LIST_DECL_SESG(E19, SCL2, I2C2, SIG_DESC_SET(SCU4B8, 10));
-PIN_DECL_2(E19, GPIOJ2, I3C4SCL, SCL2);
+SIG_EXPR_LIST_DECL_SESG(E19, SSCL2, SI2C2, SIG_DESC_SET(SCU698, 10));
+PIN_DECL_3(E19, GPIOJ2, I3C4SCL, SCL2, SSCL2);
 
 #define D20 75
 SIG_EXPR_LIST_DECL_SEMG(D20, I3C4SDA, HVI3C4, I3C4, SIG_DESC_SET(SCU418, 11));
 SIG_EXPR_LIST_DECL_SESG(D20, SDA2, I2C2, SIG_DESC_SET(SCU4B8, 11));
-PIN_DECL_2(D20, GPIOJ3, I3C4SDA, SDA2);
+SIG_EXPR_LIST_DECL_SESG(D20, SSDA2, SI2C2, SIG_DESC_SET(SCU698, 11));
+PIN_DECL_3(D20, GPIOJ3, I3C4SDA, SDA2, SSDA2);
 
 GROUP_DECL(HVI3C4, E19, D20);
 FUNC_GROUP_DECL(I2C2, E19, D20);
+FUNC_GROUP_DECL(SI2C2, E19, D20);
 
 #define C19 76
 SIG_EXPR_LIST_DECL_SESG(C19, I3C5SCL, I3C5, SIG_DESC_SET(SCU418, 12));
 SIG_EXPR_LIST_DECL_SESG(C19, SCL3, I2C3, SIG_DESC_SET(SCU4B8, 12));
-PIN_DECL_2(C19, GPIOJ4, I3C5SCL, SCL3);
+SIG_EXPR_LIST_DECL_SESG(C19, SSCL3, SI2C3, SIG_DESC_SET(SCU698, 12));
+PIN_DECL_3(C19, GPIOJ4, I3C5SCL, SCL3, SSCL3);
 
 #define A19 77
 SIG_EXPR_LIST_DECL_SESG(A19, I3C5SDA, I3C5, SIG_DESC_SET(SCU418, 13));
 SIG_EXPR_LIST_DECL_SESG(A19, SDA3, I2C3, SIG_DESC_SET(SCU4B8, 13));
-PIN_DECL_2(A19, GPIOJ5, I3C5SDA, SDA3);
+SIG_EXPR_LIST_DECL_SESG(A19, SSDA3, SI2C3, SIG_DESC_SET(SCU698, 13));
+PIN_DECL_3(A19, GPIOJ5, I3C5SDA, SDA3, SSDA3);
 
 FUNC_GROUP_DECL(I3C5, C19, A19);
 FUNC_GROUP_DECL(I2C3, C19, A19);
+FUNC_GROUP_DECL(SI2C3, C19, A19);
 
 #define C20 78
 SIG_EXPR_LIST_DECL_SESG(C20, I3C6SCL, I3C6, SIG_DESC_SET(SCU418, 14));
 SIG_EXPR_LIST_DECL_SESG(C20, SCL4, I2C4, SIG_DESC_SET(SCU4B8, 14));
-PIN_DECL_2(C20, GPIOJ6, I3C6SCL, SCL4);
+SIG_EXPR_LIST_DECL_SESG(C20, SSCL4, SI2C4, SIG_DESC_SET(SCU698, 14));
+PIN_DECL_3(C20, GPIOJ6, I3C6SCL, SCL4, SSCL4);
 
 #define D19 79
 SIG_EXPR_LIST_DECL_SESG(D19, I3C6SDA, I3C6, SIG_DESC_SET(SCU418, 15));
 SIG_EXPR_LIST_DECL_SESG(D19, SDA4, I2C4, SIG_DESC_SET(SCU4B8, 15));
-PIN_DECL_2(D19, GPIOJ7, I3C6SDA, SDA4);
+SIG_EXPR_LIST_DECL_SESG(D19, SSDA4, SI2C4, SIG_DESC_SET(SCU698, 15));
+PIN_DECL_3(D19, GPIOJ7, I3C6SDA, SDA4, SSDA4);
 
 FUNC_GROUP_DECL(I3C6, C20, D19);
 FUNC_GROUP_DECL(I2C4, C20, D19);
+FUNC_GROUP_DECL(SI2C4, C20, D19);
 
 #define A11 80
 SIG_EXPR_LIST_DECL_SESG(A11, SCL5, I2C5, SIG_DESC_SET(SCU418, 16));
-PIN_DECL_1(A11, GPIOK0, SCL5);
+SIG_EXPR_LIST_DECL_SESG(A11, SSCL5, SI2C5, SIG_DESC_SET(SCU4B8, 16));
+PIN_DECL_2(A11, GPIOK0, SCL5, SSCL5);
 
 #define C11 81
 SIG_EXPR_LIST_DECL_SESG(C11, SDA5, I2C5, SIG_DESC_SET(SCU418, 17));
-PIN_DECL_1(C11, GPIOK1, SDA5);
+SIG_EXPR_LIST_DECL_SESG(C11, SSDA5, SI2C5, SIG_DESC_SET(SCU4B8, 17));
+PIN_DECL_2(C11, GPIOK1, SDA5, SSDA5);
 
 FUNC_GROUP_DECL(I2C5, A11, C11);
+FUNC_GROUP_DECL(SI2C5, A11, C11);
 
 #define D12 82
 SIG_EXPR_LIST_DECL_SESG(D12, SCL6, I2C6, SIG_DESC_SET(SCU418, 18));
-PIN_DECL_1(D12, GPIOK2, SCL6);
+SIG_EXPR_LIST_DECL_SESG(D12, SSCL6, SI2C6, SIG_DESC_SET(SCU4B8, 18));
+PIN_DECL_2(D12, GPIOK2, SCL6, SSCL6);
 
 #define E13 83
 SIG_EXPR_LIST_DECL_SESG(E13, SDA6, I2C6, SIG_DESC_SET(SCU418, 19));
-PIN_DECL_1(E13, GPIOK3, SDA6);
+SIG_EXPR_LIST_DECL_SESG(E13, SSDA6, SI2C6, SIG_DESC_SET(SCU4B8, 19));
+PIN_DECL_2(E13, GPIOK3, SDA6, SSDA6);
 
 FUNC_GROUP_DECL(I2C6, D12, E13);
+FUNC_GROUP_DECL(SI2C6, D12, E13);
 
 #define D11 84
 SIG_EXPR_LIST_DECL_SESG(D11, SCL7, I2C7, SIG_DESC_SET(SCU418, 20));
-PIN_DECL_1(D11, GPIOK4, SCL7);
+SIG_EXPR_LIST_DECL_SESG(D11, SSCL7, SI2C7, SIG_DESC_SET(SCU4B8, 20));
+PIN_DECL_2(D11, GPIOK4, SCL7, SSCL7);
 
 #define E11 85
 SIG_EXPR_LIST_DECL_SESG(E11, SDA7, I2C7, SIG_DESC_SET(SCU418, 21));
-PIN_DECL_1(E11, GPIOK5, SDA7);
+SIG_EXPR_LIST_DECL_SESG(E11, SSDA7, SI2C7, SIG_DESC_SET(SCU4B8, 21));
+PIN_DECL_2(E11, GPIOK5, SDA7, SSDA7);
 
 FUNC_GROUP_DECL(I2C7, D11, E11);
+FUNC_GROUP_DECL(SI2C7, D11, E11);
 
 #define F13 86
 SIG_EXPR_LIST_DECL_SESG(F13, SCL8, I2C8, SIG_DESC_SET(SCU418, 22));
-PIN_DECL_1(F13, GPIOK6, SCL8);
+SIG_EXPR_LIST_DECL_SESG(F13, SSCL8, SI2C8, SIG_DESC_SET(SCU4B8, 22));
+PIN_DECL_2(F13, GPIOK6, SCL8, SSCL8);
 
 #define E12 87
 SIG_EXPR_LIST_DECL_SESG(E12, SDA8, I2C8, SIG_DESC_SET(SCU418, 23));
-PIN_DECL_1(E12, GPIOK7, SDA8);
+SIG_EXPR_LIST_DECL_SESG(E12, SSDA8, SI2C8, SIG_DESC_SET(SCU4B8, 23));
+PIN_DECL_2(E12, GPIOK7, SDA8, SSDA8);
 
 FUNC_GROUP_DECL(I2C8, F13, E12);
+FUNC_GROUP_DECL(SI2C8, F13, E12);
 
 #define D15 88
 SIG_EXPR_LIST_DECL_SESG(D15, SCL9, I2C9, SIG_DESC_SET(SCU418, 24));
-PIN_DECL_1(D15, GPIOL0, SCL9);
+SIG_EXPR_LIST_DECL_SESG(D15, SSCL9, SI2C9, SIG_DESC_SET(SCU4B8, 24));
+PIN_DECL_2(D15, GPIOL0, SCL9, SSCL9);
 
 #define A14 89
 SIG_EXPR_LIST_DECL_SESG(A14, SDA9, I2C9, SIG_DESC_SET(SCU418, 25));
-PIN_DECL_1(A14, GPIOL1, SDA9);
+SIG_EXPR_LIST_DECL_SESG(A14, SSDA9, SI2C9, SIG_DESC_SET(SCU4B8, 25));
+PIN_DECL_2(A14, GPIOL1, SDA9, SSDA9);
 
 FUNC_GROUP_DECL(I2C9, D15, A14);
+FUNC_GROUP_DECL(SI2C9, D15, A14);
 
 #define E15 90
 SIG_EXPR_LIST_DECL_SESG(E15, SCL10, I2C10, SIG_DESC_SET(SCU418, 26));
-PIN_DECL_1(E15, GPIOL2, SCL10);
+SIG_EXPR_LIST_DECL_SESG(E15, SSCL10, SI2C10, SIG_DESC_SET(SCU4B8, 26));
+PIN_DECL_2(E15, GPIOL2, SCL10, SSCL10);
 
 #define A13 91
 SIG_EXPR_LIST_DECL_SESG(A13, SDA10, I2C10, SIG_DESC_SET(SCU418, 27));
-PIN_DECL_1(A13, GPIOL3, SDA10);
+SIG_EXPR_LIST_DECL_SESG(A13, SSDA10, SI2C10, SIG_DESC_SET(SCU4B8, 27));
+PIN_DECL_2(A13, GPIOL3, SDA10, SSDA10);
 
 FUNC_GROUP_DECL(I2C10, E15, A13);
+FUNC_GROUP_DECL(SI2C10, E15, A13);
 
 #define C15 92
 SSSF_PIN_DECL(C15, GPIOL4, TXD3, SIG_DESC_SET(SCU418, 28));
@@ -983,9 +1052,9 @@ FUNC_GROUP_DECL(ADC7, AE18);
 
 #define AB16 160
 SIG_EXPR_LIST_DECL_SEMG(AB16, SALT9, SALT9G1, SALT9, SIG_DESC_SET(SCU434, 0),
-			SIG_DESC_CLEAR(SCU694, 16));
+			SIG_DESC_CLEAR(SCU694, 16), SIG_DESC_SET(SCU4D4, 0));
 SIG_EXPR_LIST_DECL_SESG(AB16, GPIU0, GPIU0, SIG_DESC_SET(SCU434, 0),
-			SIG_DESC_SET(SCU694, 16));
+			SIG_DESC_CLEAR(SCU4D4, 0));
 SIG_EXPR_LIST_DECL_SESG(AB16, ADC8, ADC8);
 PIN_DECL_(AB16, SIG_EXPR_LIST_PTR(AB16, SALT9), SIG_EXPR_LIST_PTR(AB16, GPIU0),
 	  SIG_EXPR_LIST_PTR(AB16, ADC8));
@@ -996,9 +1065,9 @@ FUNC_GROUP_DECL(ADC8, AB16);
 
 #define AA17 161
 SIG_EXPR_LIST_DECL_SEMG(AA17, SALT10, SALT10G1, SALT10, SIG_DESC_SET(SCU434, 1),
-			SIG_DESC_CLEAR(SCU694, 17));
+			SIG_DESC_CLEAR(SCU694, 17), SIG_DESC_SET(SCU4D4, 1));
 SIG_EXPR_LIST_DECL_SESG(AA17, GPIU1, GPIU1, SIG_DESC_SET(SCU434, 1),
-			SIG_DESC_SET(SCU694, 17));
+			SIG_DESC_CLEAR(SCU4D4, 1));
 SIG_EXPR_LIST_DECL_SESG(AA17, ADC9, ADC9);
 PIN_DECL_(AA17, SIG_EXPR_LIST_PTR(AA17, SALT10), SIG_EXPR_LIST_PTR(AA17, GPIU1),
 	  SIG_EXPR_LIST_PTR(AA17, ADC9));
@@ -1009,9 +1078,9 @@ FUNC_GROUP_DECL(ADC9, AA17);
 
 #define AB17 162
 SIG_EXPR_LIST_DECL_SEMG(AB17, SALT11, SALT11G1, SALT11, SIG_DESC_SET(SCU434, 2),
-			SIG_DESC_CLEAR(SCU694, 18));
+			SIG_DESC_CLEAR(SCU694, 18), SIG_DESC_SET(SCU4D4, 2));
 SIG_EXPR_LIST_DECL_SESG(AB17, GPIU2, GPIU2, SIG_DESC_SET(SCU434, 2),
-			SIG_DESC_SET(SCU694, 18));
+			SIG_DESC_CLEAR(SCU4D4, 2));
 SIG_EXPR_LIST_DECL_SESG(AB17, ADC10, ADC10);
 PIN_DECL_(AB17, SIG_EXPR_LIST_PTR(AB17, SALT11), SIG_EXPR_LIST_PTR(AB17, GPIU2),
 	  SIG_EXPR_LIST_PTR(AB17, ADC10));
@@ -1022,9 +1091,9 @@ FUNC_GROUP_DECL(ADC10, AB17);
 
 #define AE16 163
 SIG_EXPR_LIST_DECL_SEMG(AE16, SALT12, SALT12G1, SALT12, SIG_DESC_SET(SCU434, 3),
-			SIG_DESC_CLEAR(SCU694, 19));
+			SIG_DESC_CLEAR(SCU694, 19), SIG_DESC_SET(SCU4D4, 3));
 SIG_EXPR_LIST_DECL_SESG(AE16, GPIU3, GPIU3, SIG_DESC_SET(SCU434, 3),
-			SIG_DESC_SET(SCU694, 19));
+			SIG_DESC_CLEAR(SCU4D4, 3));
 SIG_EXPR_LIST_DECL_SESG(AE16, ADC11, ADC11);
 PIN_DECL_(AE16, SIG_EXPR_LIST_PTR(AE16, SALT12), SIG_EXPR_LIST_PTR(AE16, GPIU3),
 	  SIG_EXPR_LIST_PTR(AE16, ADC11));
@@ -1035,9 +1104,9 @@ FUNC_GROUP_DECL(ADC11, AE16);
 
 #define AC16 164
 SIG_EXPR_LIST_DECL_SEMG(AC16, SALT13, SALT13G1, SALT13, SIG_DESC_SET(SCU434, 4),
-			SIG_DESC_CLEAR(SCU694, 20));
+			SIG_DESC_CLEAR(SCU694, 20), SIG_DESC_SET(SCU4D4, 4));
 SIG_EXPR_LIST_DECL_SESG(AC16, GPIU4, GPIU4, SIG_DESC_SET(SCU434, 4),
-			SIG_DESC_SET(SCU694, 20));
+			SIG_DESC_CLEAR(SCU4D4, 4));
 SIG_EXPR_LIST_DECL_SESG(AC16, ADC12, ADC12);
 PIN_DECL_(AC16, SIG_EXPR_LIST_PTR(AC16, SALT13), SIG_EXPR_LIST_PTR(AC16, GPIU4),
 	  SIG_EXPR_LIST_PTR(AC16, ADC12));
@@ -1048,9 +1117,9 @@ FUNC_GROUP_DECL(ADC12, AC16);
 
 #define AA16 165
 SIG_EXPR_LIST_DECL_SEMG(AA16, SALT14, SALT14G1, SALT14, SIG_DESC_SET(SCU434, 5),
-			SIG_DESC_CLEAR(SCU694, 21));
+			SIG_DESC_CLEAR(SCU694, 21), SIG_DESC_SET(SCU4D4, 5));
 SIG_EXPR_LIST_DECL_SESG(AA16, GPIU5, GPIU5, SIG_DESC_SET(SCU434, 5),
-			SIG_DESC_SET(SCU694, 21));
+			SIG_DESC_CLEAR(SCU4D4, 5));
 SIG_EXPR_LIST_DECL_SESG(AA16, ADC13, ADC13);
 PIN_DECL_(AA16, SIG_EXPR_LIST_PTR(AA16, SALT14), SIG_EXPR_LIST_PTR(AA16, GPIU5),
 	  SIG_EXPR_LIST_PTR(AA16, ADC13));
@@ -1061,9 +1130,9 @@ FUNC_GROUP_DECL(ADC13, AA16);
 
 #define AD16 166
 SIG_EXPR_LIST_DECL_SEMG(AD16, SALT15, SALT15G1, SALT15, SIG_DESC_SET(SCU434, 6),
-			SIG_DESC_CLEAR(SCU694, 22));
+			SIG_DESC_CLEAR(SCU694, 22), SIG_DESC_SET(SCU4D4, 6));
 SIG_EXPR_LIST_DECL_SESG(AD16, GPIU6, GPIU6, SIG_DESC_SET(SCU434, 6),
-			SIG_DESC_SET(SCU694, 22));
+			SIG_DESC_CLEAR(SCU4D4, 6));
 SIG_EXPR_LIST_DECL_SESG(AD16, ADC14, ADC14);
 PIN_DECL_(AD16, SIG_EXPR_LIST_PTR(AD16, SALT15), SIG_EXPR_LIST_PTR(AD16, GPIU6),
 	  SIG_EXPR_LIST_PTR(AD16, ADC14));
@@ -1074,9 +1143,9 @@ FUNC_GROUP_DECL(ADC14, AD16);
 
 #define AC17 167
 SIG_EXPR_LIST_DECL_SEMG(AC17, SALT16, SALT16G1, SALT16, SIG_DESC_SET(SCU434, 7),
-			SIG_DESC_CLEAR(SCU694, 23));
+			SIG_DESC_CLEAR(SCU694, 23), SIG_DESC_SET(SCU4D4, 7));
 SIG_EXPR_LIST_DECL_SESG(AC17, GPIU7, GPIU7, SIG_DESC_SET(SCU434, 7),
-			SIG_DESC_SET(SCU694, 23));
+			SIG_DESC_CLEAR(SCU4D4, 7));
 SIG_EXPR_LIST_DECL_SESG(AC17, ADC15, ADC15);
 PIN_DECL_(AC17, SIG_EXPR_LIST_PTR(AC17, SALT16), SIG_EXPR_LIST_PTR(AC17, GPIU7),
 	  SIG_EXPR_LIST_PTR(AC17, ADC15));
@@ -1116,43 +1185,50 @@ SSSF_PIN_DECL(AF15, GPIOV7, LPCSMI, SIG_DESC_SET(SCU434, 15));
 #define AB7 176
 SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU434, 16),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16));
+SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AB7, GPIOW0, LAD0, ESPID0);
 
 #define AB8 177
 SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU434, 17),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17));
+SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AB8, GPIOW1, LAD1, ESPID1);
 
 #define AC8 178
 SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU434, 18),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18));
+SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AC8, GPIOW2, LAD2, ESPID2);
 
 #define AC7 179
 SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU434, 19),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19));
+SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AC7, GPIOW3, LAD3, ESPID3);
 
 #define AE7 180
 SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU434, 20),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20));
+SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AE7, GPIOW4, LCLK, ESPICK);
 
 #define AF7 181
 SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU434, 21),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21));
+SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AF7, GPIOW5, LFRAME, ESPICS);
 
 #define AD7 182
 SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU434, 22),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434, 22));
+SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434, 22),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AD7, GPIOW6, LSIRQ, ESPIALT);
 FUNC_GROUP_DECL(LSIRQ, AD7);
 FUNC_GROUP_DECL(ESPIALT, AD7);
@@ -1160,7 +1236,8 @@ FUNC_GROUP_DECL(ESPIALT, AD7);
 #define AD8 183
 SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU434, 23),
 			  SIG_DESC_SET(SCU510, 6));
-SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 23));
+SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 23),
+			  SIG_DESC_CLEAR(SCU510, 6));
 PIN_DECL_2(AD8, GPIOW7, LPCRST, ESPIRST);
 
 FUNC_GROUP_DECL(LPC, AB7, AB8, AC8, AC7, AE7, AF7, AD8);
@@ -1201,7 +1278,7 @@ SIG_EXPR_LIST_DECL_SEMG(AB10, RXD12, UART12G1, UART12,
 			SIG_DESC_SET(SCU4D4, 31));
 PIN_DECL_2(AB10, GPIOX7, SPI2DQ3, RXD12);
 
-GROUP_DECL(QSPI2, AE8, AF8, AB9, AD9, AF9, AB10);
+GROUP_DECL(QSPI2, AF9, AB10);
 FUNC_DECL_2(SPI2, SPI2, QSPI2);
 
 GROUP_DECL(UART12G1, AF9, AB10);
@@ -1236,15 +1313,21 @@ FUNC_GROUP_DECL(SALT8, AA12);
 FUNC_GROUP_DECL(WDTRST4, AA12);
 
 #define AE12 196
+SIG_EXPR_LIST_DECL_SEMG(AE12, FWSPIDQ2, FWQSPID, FWSPID,
+			SIG_DESC_SET(SCU438, 4));
 SIG_EXPR_LIST_DECL_SESG(AE12, FWSPIQ2, FWQSPI, SIG_DESC_SET(SCU438, 4));
 SIG_EXPR_LIST_DECL_SESG(AE12, GPIOY4, GPIOY4);
-PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
+PIN_DECL_(AE12, SIG_EXPR_LIST_PTR(AE12, FWSPIDQ2),
+	  SIG_EXPR_LIST_PTR(AE12, FWSPIQ2),
 	  SIG_EXPR_LIST_PTR(AE12, GPIOY4));
 
 #define AF12 197
+SIG_EXPR_LIST_DECL_SEMG(AF12, FWSPIDQ3, FWQSPID, FWSPID,
+			SIG_DESC_SET(SCU438, 5));
 SIG_EXPR_LIST_DECL_SESG(AF12, FWSPIQ3, FWQSPI, SIG_DESC_SET(SCU438, 5));
 SIG_EXPR_LIST_DECL_SESG(AF12, GPIOY5, GPIOY5);
-PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
+PIN_DECL_(AF12, SIG_EXPR_LIST_PTR(AF12, FWSPIDQ3),
+	  SIG_EXPR_LIST_PTR(AF12, FWSPIQ3),
 	  SIG_EXPR_LIST_PTR(AF12, GPIOY5));
 FUNC_GROUP_DECL(FWQSPI, AE12, AF12);
 
@@ -1289,7 +1372,7 @@ SIG_EXPR_LIST_DECL_SEMG(AF10, RXD13, UART13G1, UART13,
 			SIG_DESC_CLEAR(SCU4B8, 3), SIG_DESC_SET(SCU4D8, 15));
 PIN_DECL_2(AF10, GPIOZ7, SPI1DQ3, RXD13);
 
-GROUP_DECL(QSPI1, AB11, AC11, AA11, AD11, AF10);
+GROUP_DECL(QSPI1, AD11, AF10);
 FUNC_DECL_2(SPI1, SPI1, QSPI1);
 
 GROUP_DECL(UART13G1, AD11, AF10);
@@ -1519,8 +1602,9 @@ SIG_EXPR_LIST_DECL_SEMG(Y4, EMMCDAT7, EMMCG8, EMMC, SIG_DESC_SET(SCU404, 3));
 PIN_DECL_3(Y4, GPIO18E3, FWSPIDMISO, VBMISO, EMMCDAT7);
 
 GROUP_DECL(FWSPID, Y1, Y2, Y3, Y4);
+GROUP_DECL(FWQSPID, Y1, Y2, Y3, Y4, AE12, AF12);
 GROUP_DECL(EMMCG8, AB4, AA4, AC4, AA5, Y5, AB5, AB6, AC5, Y1, Y2, Y3, Y4);
-FUNC_DECL_1(FWSPID, FWSPID);
+FUNC_DECL_2(FWSPID, FWSPID, FWQSPID);
 FUNC_GROUP_DECL(VB, Y1, Y2, Y3, Y4);
 FUNC_DECL_3(EMMC, EMMCG1, EMMCG4, EMMCG8);
 /*
@@ -1528,14 +1612,18 @@ FUNC_DECL_3(EMMC, EMMCG1, EMMCG4, EMMCG8);
  * following 4 pins
  */
 #define AF25 244
-SIG_EXPR_LIST_DECL_SEMG(AF25, I3C3SCL, I3C3, I3C3, SIG_DESC_SET(SCU438, 20));
-SIG_EXPR_LIST_DECL_SESG(AF25, FSI1CLK, FSI1, SIG_DESC_SET(SCU4D8, 20));
+SIG_EXPR_LIST_DECL_SEMG(AF25, I3C3SCL, I3C3, I3C3, SIG_DESC_SET(SCU438, 20),
+			SIG_DESC_SET(SCU4D8, 20));
+SIG_EXPR_LIST_DECL_SESG(AF25, FSI1CLK, FSI1, SIG_DESC_CLEAR(SCU438, 20),
+			SIG_DESC_SET(SCU4D8, 20));
 PIN_DECL_(AF25, SIG_EXPR_LIST_PTR(AF25, I3C3SCL),
 	  SIG_EXPR_LIST_PTR(AF25, FSI1CLK));
 
 #define AE26 245
-SIG_EXPR_LIST_DECL_SEMG(AE26, I3C3SDA, I3C3, I3C3, SIG_DESC_SET(SCU438, 21));
-SIG_EXPR_LIST_DECL_SESG(AE26, FSI1DATA, FSI1, SIG_DESC_SET(SCU4D8, 21));
+SIG_EXPR_LIST_DECL_SEMG(AE26, I3C3SDA, I3C3, I3C3, SIG_DESC_SET(SCU438, 21),
+			SIG_DESC_SET(SCU4D8, 21));
+SIG_EXPR_LIST_DECL_SESG(AE26, FSI1DATA, FSI1, SIG_DESC_CLEAR(SCU438, 21),
+			SIG_DESC_SET(SCU4D8, 21));
 PIN_DECL_(AE26, SIG_EXPR_LIST_PTR(AE26, I3C3SDA),
 	  SIG_EXPR_LIST_PTR(AE26, FSI1DATA));
 
@@ -1544,14 +1632,18 @@ FUNC_DECL_2(I3C3, HVI3C3, I3C3);
 FUNC_GROUP_DECL(FSI1, AF25, AE26);
 
 #define AE25 246
-SIG_EXPR_LIST_DECL_SEMG(AE25, I3C4SCL, I3C4, I3C4, SIG_DESC_SET(SCU438, 22));
-SIG_EXPR_LIST_DECL_SESG(AE25, FSI2CLK, FSI2, SIG_DESC_SET(SCU4D8, 22));
+SIG_EXPR_LIST_DECL_SEMG(AE25, I3C4SCL, I3C4, I3C4, SIG_DESC_SET(SCU438, 22),
+			SIG_DESC_SET(SCU4D8, 22));
+SIG_EXPR_LIST_DECL_SESG(AE25, FSI2CLK, FSI2, SIG_DESC_CLEAR(SCU438, 22),
+			SIG_DESC_SET(SCU4D8, 22));
 PIN_DECL_(AE25, SIG_EXPR_LIST_PTR(AE25, I3C4SCL),
 	  SIG_EXPR_LIST_PTR(AE25, FSI2CLK));
 
 #define AF24 247
-SIG_EXPR_LIST_DECL_SEMG(AF24, I3C4SDA, I3C4, I3C4, SIG_DESC_SET(SCU438, 23));
-SIG_EXPR_LIST_DECL_SESG(AF24, FSI2DATA, FSI2, SIG_DESC_SET(SCU4D8, 23));
+SIG_EXPR_LIST_DECL_SEMG(AF24, I3C4SDA, I3C4, I3C4, SIG_DESC_SET(SCU438, 23),
+			SIG_DESC_SET(SCU4D8, 23));
+SIG_EXPR_LIST_DECL_SESG(AF24, FSI2DATA, FSI2, SIG_DESC_CLEAR(SCU438, 23),
+			SIG_DESC_SET(SCU4D8, 23));
 PIN_DECL_(AF24, SIG_EXPR_LIST_PTR(AF24, I3C4SDA),
 	  SIG_EXPR_LIST_PTR(AF24, FSI2DATA));
 
@@ -1592,9 +1684,10 @@ SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADPDP, USBA, USB2ADP, USB2ADP_DESC,
 			SIG_DESC_SET(SCUC20, 16));
 SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADDP, USBA, USB2AD, USB2AD_DESC);
 SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHDP, USBA, USB2AH, USB2AH_DESC);
-SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC,
+			SIG_DESC_SET(SCUC20, 16));
 PIN_DECL_(A4, SIG_EXPR_LIST_PTR(A4, USB2ADPDP), SIG_EXPR_LIST_PTR(A4, USB2ADDP),
-	  SIG_EXPR_LIST_PTR(A4, USB2AHDP));
+	  SIG_EXPR_LIST_PTR(A4, USB2AHDP), SIG_EXPR_LIST_PTR(A4, USB2AHPDP));
 
 #define B4 253
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADPDN, USBA, USB2ADP, USB2ADP_DESC);
@@ -1602,7 +1695,7 @@ SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADDN, USBA, USB2AD, USB2AD_DESC);
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHDN, USBA, USB2AH, USB2AH_DESC);
 SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHPDN, USBA, USB2AHP, USB2AHP_DESC);
 PIN_DECL_(B4, SIG_EXPR_LIST_PTR(B4, USB2ADPDN), SIG_EXPR_LIST_PTR(B4, USB2ADDN),
-	  SIG_EXPR_LIST_PTR(B4, USB2AHDN));
+	  SIG_EXPR_LIST_PTR(B4, USB2AHDN), SIG_EXPR_LIST_PTR(B4, USB2AHPDN));
 
 GROUP_DECL(USBA, A4, B4);
 
@@ -1631,6 +1724,23 @@ FUNC_DECL_1(USB11BHID, USBB);
 FUNC_DECL_1(USB2BD, USBB);
 FUNC_DECL_1(USB2BH, USBB);
 
+/* bit19: Enable RC-L DMA mode
+ * bit23: Enable RC-L DMA decode
+ */
+#define PCIERC0_DESC    { ASPEED_IP_SCU, SCUC24, GENMASK(23, 19), 0x1f, 0 }
+
+#define A7 256
+SIG_EXPR_LIST_DECL_SESG(A7, PERST, PCIERC0, SIG_DESC_SET(SCU040, 21),
+	   SIG_DESC_CLEAR(SCU0C8, 6), PCIERC0_DESC);
+PIN_DECL_(A7, SIG_EXPR_LIST_PTR(A7, PERST));
+FUNC_GROUP_DECL(PCIERC0, A7);
+
+#define D7 257
+SIG_EXPR_LIST_DECL_SESG(D7, RCRST, PCIERC1, SIG_DESC_SET(SCU040, 19),
+	   SIG_DESC_SET(SCU500, 24));
+PIN_DECL_(D7, SIG_EXPR_LIST_PTR(D7, RCRST));
+FUNC_GROUP_DECL(PCIERC1, D7);
+
 /* Pins, groups and functions are sort(1):ed alphabetically for sanity */
 
 static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
@@ -1653,6 +1763,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A3),
 	ASPEED_PINCTRL_PIN(A4),
 	ASPEED_PINCTRL_PIN(A6),
+	ASPEED_PINCTRL_PIN(A7),
 	ASPEED_PINCTRL_PIN(AA11),
 	ASPEED_PINCTRL_PIN(AA12),
 	ASPEED_PINCTRL_PIN(AA16),
@@ -1801,6 +1912,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(D4),
 	ASPEED_PINCTRL_PIN(D5),
 	ASPEED_PINCTRL_PIN(D6),
+	ASPEED_PINCTRL_PIN(D7),
 	ASPEED_PINCTRL_PIN(E1),
 	ASPEED_PINCTRL_PIN(E11),
 	ASPEED_PINCTRL_PIN(E12),
@@ -1916,6 +2028,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(FSI2),
 	ASPEED_PINCTRL_GROUP(FWSPIABR),
 	ASPEED_PINCTRL_GROUP(FWSPID),
+	ASPEED_PINCTRL_GROUP(FWQSPID),
 	ASPEED_PINCTRL_GROUP(FWQSPI),
 	ASPEED_PINCTRL_GROUP(FWSPIWP),
 	ASPEED_PINCTRL_GROUP(GPIT0),
@@ -1953,6 +2066,16 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(I2C7),
 	ASPEED_PINCTRL_GROUP(I2C8),
 	ASPEED_PINCTRL_GROUP(I2C9),
+	ASPEED_PINCTRL_GROUP(SI2C1),
+	ASPEED_PINCTRL_GROUP(SI2C2),
+	ASPEED_PINCTRL_GROUP(SI2C3),
+	ASPEED_PINCTRL_GROUP(SI2C4),
+	ASPEED_PINCTRL_GROUP(SI2C5),
+	ASPEED_PINCTRL_GROUP(SI2C6),
+	ASPEED_PINCTRL_GROUP(SI2C7),
+	ASPEED_PINCTRL_GROUP(SI2C8),
+	ASPEED_PINCTRL_GROUP(SI2C9),
+	ASPEED_PINCTRL_GROUP(SI2C10),
 	ASPEED_PINCTRL_GROUP(I3C1),
 	ASPEED_PINCTRL_GROUP(I3C2),
 	ASPEED_PINCTRL_GROUP(I3C3),
@@ -2066,6 +2189,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(SALT9G1),
 	ASPEED_PINCTRL_GROUP(SD1),
 	ASPEED_PINCTRL_GROUP(SD2),
+	ASPEED_PINCTRL_GROUP(PCIERC0),
+	ASPEED_PINCTRL_GROUP(PCIERC1),
 	ASPEED_PINCTRL_GROUP(EMMCG1),
 	ASPEED_PINCTRL_GROUP(EMMCG4),
 	ASPEED_PINCTRL_GROUP(EMMCG8),
@@ -2193,6 +2318,16 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(I2C7),
 	ASPEED_PINCTRL_FUNC(I2C8),
 	ASPEED_PINCTRL_FUNC(I2C9),
+	ASPEED_PINCTRL_FUNC(SI2C1),
+	ASPEED_PINCTRL_FUNC(SI2C2),
+	ASPEED_PINCTRL_FUNC(SI2C3),
+	ASPEED_PINCTRL_FUNC(SI2C4),
+	ASPEED_PINCTRL_FUNC(SI2C5),
+	ASPEED_PINCTRL_FUNC(SI2C6),
+	ASPEED_PINCTRL_FUNC(SI2C7),
+	ASPEED_PINCTRL_FUNC(SI2C8),
+	ASPEED_PINCTRL_FUNC(SI2C9),
+	ASPEED_PINCTRL_FUNC(SI2C10),
 	ASPEED_PINCTRL_FUNC(I3C1),
 	ASPEED_PINCTRL_FUNC(I3C2),
 	ASPEED_PINCTRL_FUNC(I3C3),
@@ -2307,6 +2442,8 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(SPI2),
 	ASPEED_PINCTRL_FUNC(SPI2CS1),
 	ASPEED_PINCTRL_FUNC(SPI2CS2),
+	ASPEED_PINCTRL_FUNC(PCIERC0),
+	ASPEED_PINCTRL_FUNC(PCIERC1),
 	ASPEED_PINCTRL_FUNC(TACH0),
 	ASPEED_PINCTRL_FUNC(TACH1),
 	ASPEED_PINCTRL_FUNC(TACH10),
-- 
2.34.1

