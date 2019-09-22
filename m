Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DECBA2B2
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:41:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bnBj3j0lzDq9s
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:41:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="D3XVQMlj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BrgyWpFN"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4v1Ws8zDqLh
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A181521240;
 Sun, 22 Sep 2019 08:36:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=X0tNDnU/r3W54
 sgxPYsd0sE8L1c+6bS2X6q2oGWr2FY=; b=D3XVQMljrTuM/Fjefw7WJnW+elGzm
 oa8ZewGUP5Mw7nIWfkaPn917wR4Q8TryvfYpPYaNCcjhnqebW1RWOrNV+higjgIR
 qGvxWKkLc8E7VYGToMuSzC1WfQoHYVNRthwmn/YNrsDxgrluaAALmboea9cxTlGL
 M+8qespRB7jhQ9v09AD1wxq3tm/PytnC5viH99xkUSG7p+VzYlRDoirdvOZZ85f9
 L5Ne7zCZqdbJuIKwB2TsBPivJnDHnclz07jCaVmi2iaGUcUb0rr9jw7Nq8CRd7iH
 BjwUyNpiAbPdYaqLB6T5E4DusNn95MTy/kwWpER5GotRp0izVvmsK4ZyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=X0tNDnU/r3W54sgxPYsd0sE8L1c+6bS2X6q2oGWr2FY=; b=BrgyWpFN
 sQj+25LW3JUFIJ4sZNq7q/YmTQg8rWzAR+/hjCjmswqFqEQgna3ogmTs1zyYElH3
 mHoGgJNRAURUJPostC6prwbhudvYMKuNmUYUiAJy1HCgfiutHNITugWSRfPj5HhO
 1hALQoYDezTpGFTzDeqP86wzE6djqe9a/9Hzkzd2zsEQg6f9s73FolEkh69uZEMS
 +XBWp7jWKTxOjYY4Hp16GMKAo1DrgMlvZF7y5h7JH2TRLkuDT+BwJi8CYi+mJ65O
 hNiyqE3jIyQ+9sJkASi+68wzNelUl/477uJzrc54vVUM9JwwVHUlUwzbhp3PzJVq
 xbRassxBCbdT+g==
X-ME-Sender: <xms:zGqHXZiihhQ6RpwOCX9nh4a8Khr9PKak8JI1p0GsRxi9F3RzOC8rnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepud
X-ME-Proxy: <xmx:zGqHXVbnxNC-aXmZVrqKtdaEVVVNOlRMlQJB1cGnjkcyftZTjioycQ>
 <xmx:zGqHXSCSFPAM0wTkuyGyeDcIM2Bb7oNJGpcHQehm_CVeboKsAV3OJQ>
 <xmx:zGqHXc5jOipXhuHJ-0dTdoRZWuj1IAHv_bq56qCMSI9iev6YEIMhTg>
 <xmx:zGqHXXA0VuXGc-0roIb7ShItr0j09AN6V4xHO85lJlLljQnbXa4mmw>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC0F680059;
 Sun, 22 Sep 2019 08:36:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 4/6] clk: ast2600: Add RMII RCLK gates for all
 four MACs
Date: Sun, 22 Sep 2019 22:06:58 +0930
Message-Id: <20190922123700.749-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922123700.749-1-andrew@aj.id.au>
References: <20190922123700.749-1-andrew@aj.id.au>
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
 drivers/clk/clk-ast2600.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 1c1bb39bb04e..45531495391c 100644
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
 
@@ -494,6 +497,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_MAC12] = hw;
 
+	/* RMII1 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "rmii1_rclk", "hpll", 0,
+			scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC1RCLK] = hw;
+
+	/* RMII2 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "rmii2_rclk", "hpll", 0,
+			scu_g6_base + ASPEED_MAC12_CLK_DLY, 30, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC2RCLK] = hw;
+
 	/* MAC3/4 AHB bus clock divider */
 	hw = clk_hw_register_divider_table(dev, "mac34", "hpll", 0,
 			scu_g6_base + 0x310, 24, 3, 0,
@@ -503,6 +522,22 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(hw);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_MAC34] = hw;
 
+	/* RMII3 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "rmii3_rclk", "hpll", 0,
+			scu_g6_base + ASPEED_MAC34_CLK_DLY, 29, 0,
+			&aspeed_g6_clk_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_GATE_MAC3RCLK] = hw;
+
+	/* RMII4 50MHz (RCLK) output enable */
+	hw = clk_hw_register_gate(dev, "rmii4_rclk", "hpll", 0,
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

