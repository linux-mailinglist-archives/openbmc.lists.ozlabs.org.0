Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA77BE16E
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dhw36TlDzDqKg
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:35:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="KRkpwR5k"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mahuh7Ap"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtn35YMzDqZx
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 15D614E8;
 Wed, 25 Sep 2019 11:34:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=I9CYFeXfdbu3p
 l5cQusBW/0glswCNw5t3sUyF3z1kpM=; b=KRkpwR5ksdsPs1xuVUizQHX0rt89k
 FFJ2syAfvRdXoBmZgoLMQ5PawYF4Nql/06rnXrSTip4PnNIJuIH3vOLThrfjrYEw
 IamAglzdCTkhhZjEo3QozAKjP1jX5fg87L7iiuuxQZnjh3ptz6GdZYPfAR9Rszm5
 ja9BSwv8c/Kb+fdLZWDNWfuB2W4oEfyJ1XLJHrg7xf8K/GEqa8UYTQz10qkiiPzl
 Exw9VB6HCF+EGIDNS8JDJjV6B0+T8YsI/LxrRwGX8oA6hxD0ZOMRwjC3kmIYPtP1
 tu+Cet/uWP042pEx/5ykQRJk/GfSBrCK+DXVr4S93Ytpk/q1tmTJ1hdgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=I9CYFeXfdbu3pl5cQusBW/0glswCNw5t3sUyF3z1kpM=; b=mahuh7Ap
 FC7bMTXo9Mf2dEFa8i7R+OH+wMbYS5y/GHXllO9mKdi+2pYiE0fu+hjcl1FZFyIb
 WaabyPuU86HefIpr5sXu820K5gNQsUzmn1FQ2vlB43qGKf41ApOeXBt5ubrFzxul
 4ABylKFY1erfHkqLtADXTR0mh3bAIp3I4eO+71LaenI3LteVUM9rRLEoEMibEaaG
 T2WQAyGdhNOSt/xBEKK8yWiz41sn9RwqBnnISXhju1YHGA+e0wJC5anDwLMk0Ciz
 yWoXvBTpLaZO35gPwVPMPfOB2Fu+vmXh4JTgy5KJcdfuIKtL9W9Iivg4WR5t/yEM
 DFDUlUiT9zF4Qg==
X-ME-Sender: <xms:_oiLXauDc3013zggjdK3W8PN9sSQ6q2_MD1pnlf4Wz2IgtpQ7ODjzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:_oiLXZ4AXxFocwfe0bNXpJvi4AfneLb3YOd0PMriNdGfjrx72jBE9Q>
 <xmx:_oiLXWNl0nanG6fkANLL6k0xUYHUmMgASnLXUcUjrCIBJrNbyKAzCw>
 <xmx:_oiLXXbXOCQuKEOxw3o5EqbPtcsQf6mS0kiS9j_Sv1eaT837HSFC3A>
 <xmx:_oiLXXlpZGxOP9CQTjBtKLCwqERbBufsINiBIFIlJRWkeUih88ItGQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id F1742D60068;
 Wed, 25 Sep 2019 11:34:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 3/8] clk: aspeed: Add RMII RCLK gates for
 both AST2500 MACs
Date: Thu, 26 Sep 2019 01:04:34 +0930
Message-Id: <20190925153439.27475-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190925153439.27475-1-andrew@aj.id.au>
References: <20190925153439.27475-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RCLK is a fixed 50MHz clock derived from HPLL that is described by a
single gate for each MAC.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/clk/clk-aspeed.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index abf06fb6453e..9bd5155598d6 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -14,7 +14,7 @@
 
 #include "clk-aspeed.h"
 
-#define ASPEED_NUM_CLKS		36
+#define ASPEED_NUM_CLKS		38
 
 #define ASPEED_RESET2_OFFSET	32
 
@@ -28,6 +28,7 @@
 #define  AST2400_HPLL_BYPASS_EN	BIT(17)
 #define ASPEED_MISC_CTRL	0x2c
 #define  UART_DIV13_EN		BIT(12)
+#define ASPEED_MAC_CLK_DLY	0x48
 #define ASPEED_STRAP		0x70
 #define  CLKIN_25MHZ_EN		BIT(23)
 #define  AST2400_CLK_SOURCE_SEL	BIT(18)
@@ -462,6 +463,30 @@ static int aspeed_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_clk_data->hws[ASPEED_CLK_MAC] = hw;
 
+	if (of_device_is_compatible(pdev->dev.of_node, "aspeed,ast2500-scu")) {
+		/* RMII 50MHz RCLK */
+		hw = clk_hw_register_fixed_rate(dev, "mac12rclk", "hpll", 0,
+						50000000);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		/* RMII1 50MHz (RCLK) output enable */
+		hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
+				scu_base + ASPEED_MAC_CLK_DLY, 29, 0,
+				&aspeed_clk_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		aspeed_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
+
+		/* RMII2 50MHz (RCLK) output enable */
+		hw = clk_hw_register_gate(dev, "mac2rclk", "mac12rclk", 0,
+				scu_base + ASPEED_MAC_CLK_DLY, 30, 0,
+				&aspeed_clk_lock);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+		aspeed_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
+	}
+
 	/* LPC Host (LHCLK) clock divider */
 	hw = clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
 			scu_base + ASPEED_CLK_SELECTION, 20, 3, 0,
-- 
2.20.1

