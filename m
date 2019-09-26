Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889DBF457
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:48:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGV4665lzDq9j
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:48:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="i3v/qRGz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="leOPpxPr"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGC75mGYzDqrF
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7CF6B711;
 Thu, 26 Sep 2019 09:35:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=jlWllcUTVv5SX
 2RtZ9JYjgUykmxfyTIbsbM3/crA7Bk=; b=i3v/qRGzbRC9dH7tG+y7SRw6m+QFj
 JpG+qHPin12PX1ueTehyaeruE8aKXoyrNPNpL5hjFjlhggBAakWnms5dmITbCpB6
 NFkxhNZ5/CJYB/kl1os5Xllu3Aqr0giIMK25oRfB7Gcjt/mPE0C74/PtfsJ7CI9E
 jUya2gcMOckVoULFrongo/6Dxx6+7UyolCCUYPfQpFoo+dPMToveQnDHGBixeMf7
 pXdFG9rIFM4eDRRZldmm656vGS038lpWB1YlsQtth7ABBT3uMbEwN5UKD9rsD3ya
 d87Kik8m6u4MiFjyzUWjPCq+TnY7fB9l4s81YVr1UqKw0fYGqu0ebJD+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jlWllcUTVv5SX2RtZ9JYjgUykmxfyTIbsbM3/crA7Bk=; b=leOPpxPr
 sEjJhn+UlDFDzu7KeSjKgnmx19KJpTD7ySU6cLQfbdrivR9CFkcI3A8OCwjX+PD3
 QnO65J5SmBVAcS/MBMLlmQCn9qFPf7QoSRfSi+vWh7UjOBWIHaMoEYQaemM6cg1e
 r/2sk1RS6LLWWUFVG835jH2Ehu5kKrhsEVWlfdqNTf4HfCZNxJNfTDP28pi02xsL
 uGhJxuKvbPuwSetMlYa4fGrENzrd3RzvyN3O6PmB8l93FoeyRigl62fsDzdUzVt+
 SZL4RA1iEcL7FhraFWELko0Ujp9eOi9CGA7oU4Vp2r9lCUUXaxvtbUf69xPQ4++6
 +o89dPk4tQPplg==
X-ME-Sender: <xms:ob6MXaAjkts5EY_3NLqiHVFepJX6XFBMLLYaPY0nXDRBaMSTM3iH2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepvd
X-ME-Proxy: <xmx:ob6MXYzg3wH-R13roUhFNfKoJxb9r9FRKXCgrUlxoMPMaindWtkVQw>
 <xmx:ob6MXYlQyxrqYaGzhCQPQthaZmaHiUmFByhhvB5HOrIZuP_HYHwtow>
 <xmx:ob6MXdFpNy7Q08hfeRDWdzn2d96ToxR6PEeodc-iOWRqKoy3mR8fSQ>
 <xmx:ob6MXWSqr_1-YZPtkigOJ0wqTm_hHCBQfXBNwWCtOUjHq_8HJmYuYw>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3367CD60063;
 Thu, 26 Sep 2019 09:35:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 06/15] pinctrl: aspeed-g6: Add AST2600 I3C1 and
 I3C2 pinmux config
Date: Thu, 26 Sep 2019 23:05:59 +0930
Message-Id: <20190926133608.30566-7-andrew@aj.id.au>
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

These pins only expose a single function but are not fixed-function as
their I3C capability can be disabled.

Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message, sort pins list]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 30 +++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index c6800d220920..49fc4824ccee 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -37,7 +37,7 @@
 #define SCU510		0x510 /* Hardware Strap 2 */
 #define SCU694		0x694 /* Multi-function Pin Control #25 */
 
-#define ASPEED_G6_NR_PINS 248
+#define ASPEED_G6_NR_PINS 252
 
 #define M24 0
 SIG_EXPR_LIST_DECL_SESG(M24, MDC3, MDIO3, SIG_DESC_SET(SCU410, 0));
@@ -1542,6 +1542,26 @@ GROUP_DECL(I3C4, AE25, AF24);
 FUNC_DECL_2(I3C4, HVI3C4, I3C4);
 FUNC_GROUP_DECL(FSI2, AE25, AF24);
 
+#define AF23 248
+SIG_EXPR_LIST_DECL_SESG(AF23, I3C1SCL, I3C1, SIG_DESC_SET(SCU438, 16));
+PIN_DECL_(AF23, SIG_EXPR_LIST_PTR(AF23, I3C1SCL));
+
+#define AE24 249
+SIG_EXPR_LIST_DECL_SESG(AE24, I3C1SDA, I3C1, SIG_DESC_SET(SCU438, 17));
+PIN_DECL_(AE24, SIG_EXPR_LIST_PTR(AE24, I3C1SDA));
+
+FUNC_GROUP_DECL(I3C1, AF23, AE24);
+
+#define AF22 250
+SIG_EXPR_LIST_DECL_SESG(AF22, I3C2SCL, I3C2, SIG_DESC_SET(SCU438, 18));
+PIN_DECL_(AF22, SIG_EXPR_LIST_PTR(AF22, I3C2SCL));
+
+#define AE22 251
+SIG_EXPR_LIST_DECL_SESG(AE22, I3C2SDA, I3C2, SIG_DESC_SET(SCU438, 19));
+PIN_DECL_(AE22, SIG_EXPR_LIST_PTR(AE22, I3C2SDA));
+
+FUNC_GROUP_DECL(I3C2, AF22, AE22);
+
 /* Pins, groups and functions are sort(1):ed alphabetically for sanity */
 
 static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
@@ -1633,6 +1653,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AE16),
 	ASPEED_PINCTRL_PIN(AE18),
 	ASPEED_PINCTRL_PIN(AE19),
+	ASPEED_PINCTRL_PIN(AE22),
+	ASPEED_PINCTRL_PIN(AE24),
 	ASPEED_PINCTRL_PIN(AE25),
 	ASPEED_PINCTRL_PIN(AE26),
 	ASPEED_PINCTRL_PIN(AE7),
@@ -1642,6 +1664,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AF12),
 	ASPEED_PINCTRL_PIN(AF14),
 	ASPEED_PINCTRL_PIN(AF15),
+	ASPEED_PINCTRL_PIN(AF22),
+	ASPEED_PINCTRL_PIN(AF23),
 	ASPEED_PINCTRL_PIN(AF24),
 	ASPEED_PINCTRL_PIN(AF25),
 	ASPEED_PINCTRL_PIN(AF7),
@@ -1855,6 +1879,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(I2C7),
 	ASPEED_PINCTRL_GROUP(I2C8),
 	ASPEED_PINCTRL_GROUP(I2C9),
+	ASPEED_PINCTRL_GROUP(I3C1),
+	ASPEED_PINCTRL_GROUP(I3C2),
 	ASPEED_PINCTRL_GROUP(I3C3),
 	ASPEED_PINCTRL_GROUP(I3C4),
 	ASPEED_PINCTRL_GROUP(I3C5),
@@ -2087,6 +2113,8 @@ static const struct aspeed_pin_function aspeed_g6_functions[] = {
 	ASPEED_PINCTRL_FUNC(I2C7),
 	ASPEED_PINCTRL_FUNC(I2C8),
 	ASPEED_PINCTRL_FUNC(I2C9),
+	ASPEED_PINCTRL_FUNC(I3C1),
+	ASPEED_PINCTRL_FUNC(I3C2),
 	ASPEED_PINCTRL_FUNC(I3C3),
 	ASPEED_PINCTRL_FUNC(I3C4),
 	ASPEED_PINCTRL_FUNC(I3C5),
-- 
2.20.1

