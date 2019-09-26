Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C24BF42F
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:38:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGGX5pGkzDqnD
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:38:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ku3ksd8x"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="SIoD9min"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGBw1BvzzDqjJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:20 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CE1436D0;
 Thu, 26 Sep 2019 09:35:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M6CdlY9WjEBXg
 l7K1ZF2GhMiCG6h+wPB9CjXBLMviWo=; b=Ku3ksd8xJUO0eFl3xMCnRVUUYQm50
 feAgZ5V6LUow/mZ963YQD9UpKgir+7yxQ3RuENiq9AgchjRH27/1V79WQByVS1A1
 dzLwUn1rwBZLTAk+ZbTEBiuH7/Dkdxz8M5o9J9bZt+MjntN6k8mYX29AFOQDbFHL
 WILpzHUmR2fTeoocM+gHBvP00/WDzt1dUkaGqCFYj4zPdLA2BlzVd/5+1Hjk5Aib
 XjT0dbHJMlpqNb/2snUgWY1Jll/JDQA6oxCxlPcRtGs85TEYlb3atkHNQPJr0Fxn
 F3OqMWp0N0Wcwda2NQt4YZRMH7140H8BMofIoKrbZxypzt9RugVTNcWew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=M6CdlY9WjEBXgl7K1ZF2GhMiCG6h+wPB9CjXBLMviWo=; b=SIoD9min
 EAWMl/QxtRDFiQGxHqvtEbx+UCP3MQW2rgQ3CS53AKgzSDai2SvpFguNuDUuQQof
 b/OZ6EjVhH3EYofZj/FmjghyuxjV4x1jIb/N9bcJQdA41tL3m+6sSP3V6DXaH9f3
 PabZZNbrdCmIf4TuZSM2HLBbD404GQBf0EVIo1NC8deeC/ICTfRZPhJjN/a9tgVz
 29hG8T3YVoPurM+uqKVgZFD9KDl3oGr0kvtbnoTgTzS+KO+j4A29/ajpAbVel6gj
 KoP4x6VvJ+ClYb54VD8opxpvlGEIdvnKgagH30SUjG7/IRCv+o2FrnuWP8vCYY7j
 DygpDZf+3QUE3A==
X-ME-Sender: <xms:lb6MXRONJaq7YPJ4mCNH8zxuJaXYQPn5fndVkVkXCAPw6bZ52RFU1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:lb6MXe5BcEWKQJFNmtqhoIdKg08BSfKCwmoL_2d-2q5FVzU_GJ1rYg>
 <xmx:lb6MXfRceKWhT4mORNwfEilduAHdApWUm3CnhUYz2tnBJxlDGERAKA>
 <xmx:lb6MXTDQgN9IR1zgCuMaVi7DVazYKI-Wt7VmL9Gfx4fSaiPeNpiqFA>
 <xmx:lb6MXfCAmFyaCHNpa7ueE7MxW7NVZ1PlY2vxG7vVjKjFrqY_5DgLVA>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9F487D60063;
 Thu, 26 Sep 2019 09:35:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 01/15] pinctrl: aspeed-g6: Sort pins for sanity
Date: Thu, 26 Sep 2019 23:05:54 +0930
Message-Id: <20190926133608.30566-2-andrew@aj.id.au>
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

Some pins crept in that weren't ordered in the list.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 648ddb7f038a..ff208b7c75a8 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1574,6 +1574,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(A3),
 	ASPEED_PINCTRL_PIN(AA11),
 	ASPEED_PINCTRL_PIN(AA12),
+	ASPEED_PINCTRL_PIN(AA16),
+	ASPEED_PINCTRL_PIN(AA17),
 	ASPEED_PINCTRL_PIN(AA23),
 	ASPEED_PINCTRL_PIN(AA24),
 	ASPEED_PINCTRL_PIN(AA25),
@@ -1585,6 +1587,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AB11),
 	ASPEED_PINCTRL_PIN(AB12),
 	ASPEED_PINCTRL_PIN(AB15),
+	ASPEED_PINCTRL_PIN(AB16),
+	ASPEED_PINCTRL_PIN(AB17),
 	ASPEED_PINCTRL_PIN(AB18),
 	ASPEED_PINCTRL_PIN(AB19),
 	ASPEED_PINCTRL_PIN(AB22),
@@ -1602,6 +1606,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AC11),
 	ASPEED_PINCTRL_PIN(AC12),
 	ASPEED_PINCTRL_PIN(AC15),
+	ASPEED_PINCTRL_PIN(AC16),
 	ASPEED_PINCTRL_PIN(AC17),
 	ASPEED_PINCTRL_PIN(AC18),
 	ASPEED_PINCTRL_PIN(AC19),
@@ -1619,6 +1624,7 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AD12),
 	ASPEED_PINCTRL_PIN(AD14),
 	ASPEED_PINCTRL_PIN(AD15),
+	ASPEED_PINCTRL_PIN(AD16),
 	ASPEED_PINCTRL_PIN(AD19),
 	ASPEED_PINCTRL_PIN(AD20),
 	ASPEED_PINCTRL_PIN(AD22),
@@ -1634,8 +1640,11 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AE12),
 	ASPEED_PINCTRL_PIN(AE14),
 	ASPEED_PINCTRL_PIN(AE15),
+	ASPEED_PINCTRL_PIN(AE16),
 	ASPEED_PINCTRL_PIN(AE18),
 	ASPEED_PINCTRL_PIN(AE19),
+	ASPEED_PINCTRL_PIN(AE25),
+	ASPEED_PINCTRL_PIN(AE26),
 	ASPEED_PINCTRL_PIN(AE7),
 	ASPEED_PINCTRL_PIN(AE8),
 	ASPEED_PINCTRL_PIN(AF10),
@@ -1643,6 +1652,8 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(AF12),
 	ASPEED_PINCTRL_PIN(AF14),
 	ASPEED_PINCTRL_PIN(AF15),
+	ASPEED_PINCTRL_PIN(AF24),
+	ASPEED_PINCTRL_PIN(AF25),
 	ASPEED_PINCTRL_PIN(AF7),
 	ASPEED_PINCTRL_PIN(AF8),
 	ASPEED_PINCTRL_PIN(AF9),
@@ -1792,17 +1803,6 @@ static struct pinctrl_pin_desc aspeed_g6_pins[ASPEED_G6_NR_PINS] = {
 	ASPEED_PINCTRL_PIN(Y3),
 	ASPEED_PINCTRL_PIN(Y4),
 	ASPEED_PINCTRL_PIN(Y5),
-	ASPEED_PINCTRL_PIN(AB16),
-	ASPEED_PINCTRL_PIN(AA17),
-	ASPEED_PINCTRL_PIN(AB17),
-	ASPEED_PINCTRL_PIN(AE16),
-	ASPEED_PINCTRL_PIN(AC16),
-	ASPEED_PINCTRL_PIN(AA16),
-	ASPEED_PINCTRL_PIN(AD16),
-	ASPEED_PINCTRL_PIN(AF25),
-	ASPEED_PINCTRL_PIN(AE26),
-	ASPEED_PINCTRL_PIN(AE25),
-	ASPEED_PINCTRL_PIN(AF24),
 };
 
 static const struct aspeed_pin_group aspeed_g6_groups[] = {
-- 
2.20.1

