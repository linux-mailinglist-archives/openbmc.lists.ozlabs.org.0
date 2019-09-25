Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB90BE183
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:40:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dj1Q636XzDqWc
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:40:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="DWDV+WJv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Hd7ASn8f"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtq2ssyzDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:27 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2050F504;
 Wed, 25 Sep 2019 11:34:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=eM3oLQqt6HiP3
 hDNIEv+QW5Fo4DDJbMJH/DpqqKGGiI=; b=DWDV+WJvuvK8NfYjtsQL4huPjm768
 59jrAwVCRUE6xrmZ29OW9oCT6h8QnwC9uYh1VsZtUS6usaHE1Qc/vYkJ3nPzEZu9
 wPV0Pf4JOuMPG4Xl16EI08MON9mhk3m6zWFwMMj2wKlxP9z1M1Qa3aKiVvMLyiJj
 qjgwJHHgcmQXhClDbuySBM6Shxrqzyu5PTHbrA1afDziusoVMaeReH+2Tm1+ufIf
 MS6dfWQxo5dfDBKOCzB8w9POcna3C/4vqR4jRDV1YRH5hd4G07cqiTQPSeugov4B
 7ckkDGF8LD04HJUl3O4zIu5J02CYwG9rKicJjww5TphcP6t0kJeNMa0LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eM3oLQqt6HiP3hDNIEv+QW5Fo4DDJbMJH/DpqqKGGiI=; b=Hd7ASn8f
 VOSsoiYvreGr69XqWWqht44FR3btgOiQzPjdeJCQUyAVsnz4wn22+ODpwuB+VWfx
 970Sr26Gc8+FawQVMTmlryNgkUwUEGh8dJUR6qIneZxJk+JWpEz50JKOZpam0HSu
 4eJmhBSRTXzUPsYKgkhGibwa9M8gUs5G56F01YTBf5G4N+WlLkXSi9Z3Gag2nAOI
 G/AwJfXnJlVh7F4x1DmJLq7eRz+F2YBLBRqHpizis2s9KLWWO2Gn12LRjxsN88nG
 D1S6lmmX3kRQx3rrSoj6VWa0L6hbKsUOdiO+zNTXk3W3gh3o1OIO43iXtd+j/QJK
 RGhy0NYuU6PUPg==
X-ME-Sender: <xms:AImLXdllkTUOpZuIkX40-xro-mIhXdvZlmbCpmmhjIr3dDIiK-nGfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepfe
X-ME-Proxy: <xmx:AImLXU-eU40z_axuw2v1S-rkNtgcX8mw0Im_eJ6r_5v4h2cO6G8p9w>
 <xmx:AImLXc59_nxTeaOJbEMtfg_SIRQKLI2GFO7MPUnxX5g_zWZp75G71A>
 <xmx:AImLXcoJLs8Y4eUSlnxKaOYhDjnuwvOD9OiHducqf1UFb4SvL1Dq_w>
 <xmx:AImLXZfo_zHqNMCPb6vbdtmtcznAB-n-L7ghV40DtbRiJDPYJGKLeQ>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21AE1D60057;
 Wed, 25 Sep 2019 11:34:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 4/8] clk: ast2600: Add RMII RCLK gates for
 all four MACs
Date: Thu, 26 Sep 2019 01:04:35 +0930
Message-Id: <20190925153439.27475-5-andrew@aj.id.au>
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

RCLK is a fixed 50MHz clock derived from HPLL/HCLK that is described by a
single gate for each MAC.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/clk/clk-ast2600.c | 47 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 1c1bb39bb04e..63558d5e9f36 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -15,7 +15,7 @@
 
 #include "clk-aspeed.h"
 
-#define ASPEED_G6_NUM_CLKS		67
+#define ASPEED_G6_NUM_CLKS		71
 
 #define ASPEED_G6_SILICON_REV		0x004
 
@@ -40,6 +40,9 @@
 
 #define ASPEED_G6_STRAP1		0x500
 
+#define ASPEED_MAC12_CLK_DLY		0x340
+#define ASPEED_MAC34_CLK_DLY		0x350
+
 /* Globally visible clocks */
 static DEFINE_SPINLOCK(aspeed_g6_clk_lock);
 
@@ -485,6 +488,11 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_SDIO] = hw;
 
+	/* MAC1/2 RMII 50MHz RCLK */
+	hw = clk_hw_register_fixed_rate(dev, "mac12rclk", "hpll", 0, 50000000);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
 	/* MAC1/2 AHB bus clock divider */
 	hw = clk_hw_register_divider_table(dev, "mac12", "hpll", 0,
 			scu_g6_base + ASPEED_G6_CLK_SELECTION1, 16, 3, 0,
@@ -494,6 +502,27 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_MAC12] = hw;
 
+	/* RMII1 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
+			scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
+
+	/* RMII2 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "mac2rclk", "mac12rclk", 0,
+			scu_g6_base + ASPEED_MAC12_CLK_DLY, 30, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
+
+	/* MAC1/2 RMII 50MHz RCLK */
+	hw = clk_hw_register_fixed_rate(dev, "mac34rclk", "hclk", 0, 50000000);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
 	/* MAC3/4 AHB bus clock divider */
 	hw = clk_hw_register_divider_table(dev, "mac34", "hpll", 0,
 			scu_g6_base + 0x310, 24, 3, 0,
@@ -503,6 +532,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_MAC34] = hw;
 
+	/* RMII3 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "mac3rclk", "mac34rclk", 0,
+			scu_g6_base + ASPEED_MAC34_CLK_DLY, 29, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC3RCLK] = hw;
+
+	/* RMII4 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "mac4rclk", "mac34rclk", 0,
+			scu_g6_base + ASPEED_MAC34_CLK_DLY, 30, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC4RCLK] = hw;
+
 	/* LPC Host (LHCLK) clock divider */
 	hw = clk_hw_register_divider_table(dev, "lhclk", "hpll", 0,
 			scu_g6_base + ASPEED_G6_CLK_SELECTION1, 20, 3, 0,
-- 
2.20.1

