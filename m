Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BA7BF45B
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGWj0jm5zDqVk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:49:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gG6KM0WJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="NUY/OILo"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGCB1FC8zDqkX
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 07E06719;
 Thu, 26 Sep 2019 09:35:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=qnROCP20YhDOq
 W5/LYGQ3KyeGdyNuD5rmQO6ny/CAgE=; b=gG6KM0WJmOaqbBwP/+BnNHb+4mFnX
 mw0ZVNFHQPWs41LBjIUJyLzlvk5h+VaxFosOfNI7AZTDa/hQPgPiyTKLlP8P/06p
 r8L/tRWS0U6YlohSs9wFlUgBGQiGXbPXkBChIg8yqCP/U2feho/q47zU++Ju/6OZ
 Z7TgR1RApH92CaTR/SS/LxBXKuseQP7sQJmI+UN0LS4OPbigUYvRKVKAoMyMgrnu
 yf35iBqSTClEiWGjf5CgfxYr/K8ZYB0UpOIAE6HCMpUMPt0eMY5D6IVLgu65iczn
 nL+d2WwjPlRVbTpjDrVnP/0WA55FMfvxYLz4pr4jkbZM5RlpnaSQil+Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=qnROCP20YhDOqW5/LYGQ3KyeGdyNuD5rmQO6ny/CAgE=; b=NUY/OILo
 afnkbnTnCTRbxZMlzwMekHMcoSOj4aFNFPgvl4nvLqCbqPcjX9pPrgQRvJOBjd0z
 RzNwqT/MLr/Wu8jA314tM5wEmc7CATR33Hxj9oPGBFLDpXEkNLcv8ERPYAlfXPz9
 SCPeE0tXxpNtHbuJs/DGlYJg2+YeGC1baJjUjSUglYQHzNHGu/m3x0gJZ5zaX95e
 oD4NteOj/N9VbL5TnM1o4nmjsgsSGUBY/E5LESearizgic0KnHew4fWqAOroyVv/
 kAVeH7kzWIriaUxwwCPmuK9qffnqVmR3VI/DMLOm6J9iSXyUw6NfZRJeg8nwNsAN
 k4cD/qXAY4RU4w==
X-ME-Sender: <xms:o76MXSGGAvNvX14X2aIpmewPthiHg1h6WdvPqQ867AMvchHPTeZWMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgephe
X-ME-Proxy: <xmx:o76MXYVfJkdAl6vN2uoYx2LUXYjPRlFRU78xZlxPb_X2Sjo_JFr5kw>
 <xmx:o76MXdDwMEXsivtUCVMctggwxbLwb6WOltbBPEAoPeFCmz0px0zrhQ>
 <xmx:o76MXR2sr6II-fD_G1KI0kJenBK4FibijGxvUQbtKavk75yq-4484g>
 <xmx:o76MXUsZ3ABFiM798fnipTP3lwGCRUykBU27wYECen62VbhCOXDp6g>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id A32BCD60065;
 Thu, 26 Sep 2019 09:35:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 07/15] pinctrl: aspeed-g6: Add support for the
 AST2600 USB pinmux
Date: Thu, 26 Sep 2019 23:06:00 +0930
Message-Id: <20190926133608.30566-8-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Johnny Huang <johnny_huang@aspeedtech.com>

AST2600 has two USB ports, A, B:

Port A supports 4 distinct modes:
	1. PCIe EHCI to Hub
	2. Hub to PHY
	3. BMC EHCI to PHY
	4. PCIe EHCI to PHY

Port B support 3 modes:
	1. USB1.1 HID controller
	2. USB2.0 Device controller
	3. BMC EHCI port2

Implement pinmux support by mapping each ports' functions onto a single
pin group for each port.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 69 +++++++++++++++++++++-
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  1 +
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 49fc4824ccee..22e6c07149c3 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -26,6 +26,7 @@
 #define SCU430		0x430 /* Multi-function Pin Control #8  */
 #define SCU434		0x434 /* Multi-function Pin Control #9  */
 #define SCU438		0x438 /* Multi-function Pin Control #10 */
+#define SCU440		0x440 /* USB Multi-function Pin Control #12 */
 #define SCU450		0x450 /* Multi-function Pin Control #14 */
 #define SCU4B0		0x4B0 /* Multi-function Pin Control #17 */
 #define SCU4B4		0x4B4 /* Multi-function Pin Control #18 */
@@ -36,8 +37,9 @@
 #define SCU500		0x500 /* Hardware Strap 1 */
 #define SCU510		0x510 /* Hardware Strap 2 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
+#define SCUC20		0xC20 /* PCIE configuration Setting Control */
 
-#define ASPEED_G6_NR_PINS 252
+#define ASPEED_G6_NR_PINS 256
 
 #define M24 0
 SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
@@ -1562,6 +1564,58 @@ PIN_DECL_(AE22, SIG_EXPR_LIST_PTR(AE22, I3C2SDA));
 
 FUNC_GROUP_DECL(I3C2, AF22, AE22);
 
+#define USB2ADP_DESC   { ASPEED_IP_SCU, SCU440, GENMASK(25, 24), 0, 0 }
+#define USB2AD_DESC    { ASPEED_IP_SCU, SCU440, GENMASK(25, 24), 1, 0 }
+#define USB2AH_DESC    { ASPEED_IP_SCU, SCU440, GENMASK(25, 24), 2, 0 }
+#define USB2AHP_DESC   { ASPEED_IP_SCU, SCU440, GENMASK(25, 24), 3, 0 }
+#define USB11BHID_DESC { ASPEED_IP_SCU, SCU440, GENMASK(29, 28), 0, 0 }
+#define USB2BD_DESC    { ASPEED_IP_SCU, SCU440, GENMASK(29, 28), 1, 0 }
+#define USB2BH_DESC    { ASPEED_IP_SCU, SCU440, GENMASK(29, 28), 2, 0 }
+
+#define A4 252
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADPDP, USBA, USB2ADP, USB2ADP_DESC,
+			SIG_DESC_SET(SCUC20, 16));
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2ADDP, USBA, USB2AD, USB2AD_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHDP, USBA, USB2AH, USB2AH_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A4, USB2AHPDP, USBA, USB2AHP, USB2AHP_DESC);
+PIN_DECL_(A4, SIG_EXPR_LIST_PTR(A4, USB2ADPDP), SIG_EXPR_LIST_PTR(A4, USB2ADDP),
+	  SIG_EXPR_LIST_PTR(A4, USB2AHDP));
+
+#define B4 253
+SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADPDN, USBA, USB2ADP, USB2ADP_DESC);
+SIG_EXPR_LIST_DECL_SEMG(B4, USB2ADDN, USBA, USB2AD, USB2AD_DESC);
+SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHDN, USBA, USB2AH, USB2AH_DESC);
+SIG_EXPR_LIST_DECL_SEMG(B4, USB2AHPDN, USBA, USB2AHP, USB2AHP_DESC);
+PIN_DECL_(B4, SIG_EXPR_LIST_PTR(B4, USB2ADPDN), SIG_EXPR_LIST_PTR(B4, USB2ADDN),
+	  SIG_EXPR_LIST_PTR(B4, USB2AHDN));
+
+GROUP_DECL(USBA, A4, B4);
+
+FUNC_DECL_1(USB2ADP, USBA);
+FUNC_DECL_1(USB2AD, USBA);
+FUNC_DECL_1(USB2AH, USBA);
+FUNC_DECL_1(USB2AHP, USBA);
+
+#define A6 254
+SIG_EXPR_LIST_DECL_SEMG(A6, USB11BDP, USBB, USB11BHID, USB11BHID_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A6, USB2BDDP, USBB, USB2BD, USB2BD_DESC);
+SIG_EXPR_LIST_DECL_SEMG(A6, USB2BHDP, USBB, USB2BH, USB2BH_DESC);
+PIN_DECL_(A6, SIG_EXPR_LIST_PTR(A6, USB11BDP), SIG_EXPR_LIST_PTR(A6, USB2BDDP),
+	  SIG_EXPR_LIST_PTR(A6, USB2BHDP));
+
+#define B6 255
+SIG_EXPR_LIST_DECL_SEMG(B6, USB11BDN, USBB, USB11BHID, USB11BHID_DESC);
+SIG_EXPR_LIST_DECL_SEMG(B6, USB2BDDN, USBB, USB2BD, USB2BD_DESC);
+SIG_EXPR_LIST_DECL_SEMG(B6, USB2BHDN, USBB, USB2BH, USB2BH_DESC);
+PIN_DECL_(B6, SIG_EXPR_LIST_PTR(B6, USB11BDN), SIG_EXPR_LIST_PTR(B6, USB2BDDN),
+	  SIG_EXPR_LIST_PTR(B6, USB2BHDN));
+
+GROUP_DECL(USBB, A6, B6);
+
+FUNC_DECL_1(USB11BHID, USBB);
+FUNC_DECL_1(USB2BD, USBB);
+FUNC_DECL_1(USB2BH, USBB);
+
 /* Pins, groups and functions are sort(1):ed alphabetically for sanity */
 
 static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
@@ -1582,6 +1636,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A24),
 	ASPEED_PINCTRL_PIN(A25),
 	ASPEED_PINCTRL_PIN(A3),
+	ASPEED_PINCTRL_PIN(A4),
+	ASPEED_PINCTRL_PIN(A6),
 	ASPEED_PINCTRL_PIN(AA11),
 	ASPEED_PINCTRL_PIN(AA12),
 	ASPEED_PINCTRL_PIN(AA16),
@@ -1686,6 +1742,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(B25),
 	ASPEED_PINCTRL_PIN(B26),
 	ASPEED_PINCTRL_PIN(B3),
+	ASPEED_PINCTRL_PIN(B4),
+	ASPEED_PINCTRL_PIN(B6),
 	ASPEED_PINCTRL_PIN(C1),
 	ASPEED_PINCTRL_PIN(C11),
 	ASPEED_PINCTRL_PIN(C12),
@@ -2046,6 +2104,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(UART7),
 	ASPEED_PINCTRL_GROUP(UART8),
 	ASPEED_PINCTRL_GROUP(UART9),
+	ASPEED_PINCTRL_GROUP(USBA),
+	ASPEED_PINCTRL_GROUP(USBB),
 	ASPEED_PINCTRL_GROUP(VB),
 	ASPEED_PINCTRL_GROUP(VGAHS),
 	ASPEED_PINCTRL_GROUP(VGAVS),
@@ -2257,6 +2317,13 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(UART7),
 	ASPEED_PINCTRL_FUNC(UART8),
 	ASPEED_PINCTRL_FUNC(UART9),
+	ASPEED_PINCTRL_FUNC(USB11BHID),
+	ASPEED_PINCTRL_FUNC(USB2AD),
+	ASPEED_PINCTRL_FUNC(USB2ADP),
+	ASPEED_PINCTRL_FUNC(USB2AH),
+	ASPEED_PINCTRL_FUNC(USB2AHP),
+	ASPEED_PINCTRL_FUNC(USB2BD),
+	ASPEED_PINCTRL_FUNC(USB2BH),
 	ASPEED_PINCTRL_FUNC(VB),
 	ASPEED_PINCTRL_FUNC(VGAHS),
 	ASPEED_PINCTRL_FUNC(VGAVS),
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 08c70ea5b582..31d903953c68 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -737,6 +737,7 @@ struct aspeed_pin_desc {
 #define FUNC_DECL_(func, ...) \
 	static const char *FUNC_SYM(func)[] = { __VA_ARGS__ }
 
+#define FUNC_DECL_1(func, group) FUNC_DECL_(func, #group)
 #define FUNC_DECL_2(func, one, two) FUNC_DECL_(func, #one, #two)
 #define FUNC_DECL_3(func, one, two, three) FUNC_DECL_(func, #one, #two, #three)
 
-- 
2.20.1

