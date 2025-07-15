Return-Path: <openbmc+bounces-347-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAC6B06A1A
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 01:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhbfP3xGnz3bgV;
	Wed, 16 Jul 2025 09:55:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752551026;
	cv=none; b=nQWH9QraTST8MLgHHMCexrxGhJ2uEYxGGN21wou+FD7OjRNnRpaEvvpGP0XCOsq5GTomRT2mxhVQD/c4IFzuYfljyU7OY2GNPrIK22inOeV4IO2ItX1Ud3xRunFppRt8TQhW8BYKFXyOy5kvLi8e2Rt0bRlT/JuMcW31sUNfbGoO6qQje/p5pmvRinxSWT2OIQ0wDhcw8nyuMYFRTQOqmvb9GzPcmxBdsuOpsS7nQIO74SPaDORzHMushvpl7zpC++ONcq2Zs1wI1cO4OIWNAY54lVV14mUF1aMoSmElIgfFOxQKaHa3xrI+VN+IwnxuzM+2192aN+t655pTTrvxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752551026; c=relaxed/relaxed;
	bh=swSRdx9zR+J1418w7glofiamCTii68f6kYuZdnX7Vk8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEf1RVaQ9Ak32GDt2zExQXJgfarxDSZl+ci6PmVK6zeysq/G/PB2t9lFyGJzN1Os2v1jUNe39FXHMsB9Z3a4OA6skw11yUQlrDz0sBXtvtQqGQ+rABiv5LnRbCTtNNAcI04eK8mJ2K8RkpIBQ7xvPYz4ZWdNRfTvxcLc5FD2GlHh0y5gul8e7AfNAsAhDhdmazLGrcslM5fCkOBM8mVXRz7mrzLg1NUpGP5maHvaRFzw3DjWKooRPCG+X3zmFEOeqf6+nOcAZmaXGHckmVzPD3wM/3myex+q04O7TKYG2DNH3Lyz3t5mPwc2HPe/1MO7L5Y34io0DZrEPds80k1F7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bh4mL0JzFz3c3x;
	Tue, 15 Jul 2025 13:43:46 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 11:43:21 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 11:43:21 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
Date: Tue, 15 Jul 2025 11:43:17 +0800
Message-ID: <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
to output.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 5a7cd0a88687..c751703acdb9 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -17,6 +17,7 @@
 #include "../pinctrl-utils.h"
 #include "pinctrl-aspeed.h"
 
+#define SCU040		0x040 /* Reset Control Set 1  */
 #define SCU400		0x400 /* Multi-function Pin Control #1  */
 #define SCU404		0x404 /* Multi-function Pin Control #2  */
 #define SCU40C		0x40C /* Multi-function Pin Control #3  */
@@ -52,7 +53,7 @@
 #define SCU6D0		0x6D0 /* Multi-function Pin Control #29 */
 #define SCUC20		0xC20 /* PCIE configuration Setting Control */
 
-#define ASPEED_G6_NR_PINS 256
+#define ASPEED_G6_NR_PINS 258
 
 #define M24 0
 SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
@@ -1636,6 +1637,12 @@ FUNC_DECL_1(USB11BHID, USBB);
 FUNC_DECL_1(USB2BD, USBB);
 FUNC_DECL_1(USB2BH, USBB);
 
+#define D7 257
+SIG_EXPR_LIST_DECL_SESG(D7, RCRST, PCIERC1, SIG_DESC_SET(SCU040, 19),
+			SIG_DESC_SET(SCU500, 24));
+PIN_DECL_(D7, SIG_EXPR_LIST_PTR(D7, RCRST));
+FUNC_GROUP_DECL(PCIERC1, D7);
+
 /* Pins, groups and functions are sort(1):ed alphabetically for sanity */
 
 static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
@@ -1806,6 +1813,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(D4),
 	ASPEED_PINCTRL_PIN(D5),
 	ASPEED_PINCTRL_PIN(D6),
+	ASPEED_PINCTRL_PIN(D7),
 	ASPEED_PINCTRL_PIN(E1),
 	ASPEED_PINCTRL_PIN(E11),
 	ASPEED_PINCTRL_PIN(E12),
@@ -2073,6 +2081,7 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(SALT9G1),
 	ASPEED_PINCTRL_GROUP(SD1),
 	ASPEED_PINCTRL_GROUP(SD2),
+	ASPEED_PINCTRL_GROUP(PCIERC1),
 	ASPEED_PINCTRL_GROUP(EMMCG1),
 	ASPEED_PINCTRL_GROUP(EMMCG4),
 	ASPEED_PINCTRL_GROUP(EMMCG8),
@@ -2314,6 +2323,7 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(SPI2),
 	ASPEED_PINCTRL_FUNC(SPI2CS1),
 	ASPEED_PINCTRL_FUNC(SPI2CS2),
+	ASPEED_PINCTRL_FUNC(PCIERC1),
 	ASPEED_PINCTRL_FUNC(TACH0),
 	ASPEED_PINCTRL_FUNC(TACH1),
 	ASPEED_PINCTRL_FUNC(TACH10),
-- 
2.43.0


