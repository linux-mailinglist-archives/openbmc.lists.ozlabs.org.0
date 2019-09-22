Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D87BA2B3
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:42:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bnCw6DLQzDqB9
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:42:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="oQKboZXj"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N8NpKQTB"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4x3zVKzDqLh
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CF73320AD9;
 Sun, 22 Sep 2019 08:36:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ffgxa6UncA20W
 GAFiY5KLL05wbrG6ykK/S8dWiDYcno=; b=oQKboZXjEN1tLPiGHCvFETbifDLY4
 88/1iuCMYRuHX3wSMj8AeN4Tm5bX374Zz5uH/To8kQH6dZfJW6b+7UkWHVm2JFnG
 vAb4rb2++wQ+edYLSzyqneIaKM7z2fkaMOFjKCaESB0j7DLM+jdRykfp2wviujMf
 odT2Wi/hAXjdO8kQSPjkA8liNVuufTF5EnrKKIjRQOQbt6EY6iEE7RqGb1CQw1E8
 W9OWo1MJ97YjLf8ddal85Borw8c72ylUVTH6NBJ5s+wazjORIOpjfgxUDfAKCKwW
 /fBPZuVzi8Jf+zfu33KNF1ekoIS0IvBP6YdgpY8wAqIi9h/GFPFgHmwcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ffgxa6UncA20WGAFiY5KLL05wbrG6ykK/S8dWiDYcno=; b=N8NpKQTB
 8Lc3a5IkCqgw87ZhB9dz/q3BUm0hr/le3aRtxlVDtsi7TkxPLgPg4GA90mWClFlx
 AsGZ7yki+UlVIARDq5/et+hsSaTBUeyqpgKm/tRJeP83YjQIkY+XMiVBhMnb8y+v
 6BPl4+exScOMCpz02t3mAeeQKYmyqC7TpRlsHKvHuDAOle9enu2KhFRufkQJ7cNi
 e7BYN9SlUbOvNplf/Fe/SisjIS0o3EbvcU4j8nvwEp8+83/XJr8urqwifWXgJ07q
 s/XxhYrNnj1jcys5wWzXK1pbEQDFPqyyZnMfQw/KD/w7/hVk72zymyYkVLm/r5C8
 2zdBW8JzpQNEaw==
X-ME-Sender: <xms:zmqHXeeFPccR67z3aHguUpFAChHXzAO20bonXES0n-lMntZx1ZHuiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepge
X-ME-Proxy: <xmx:zmqHXceCmH-Gluc7L63sSGDtOOkYUrjdNLKEAmLwzg7jX55f1jFgUA>
 <xmx:zmqHXahljTxe6Bng89GEe3XCfHWOBPJ6maQIzWh-qxCHWJ3XjjolqA>
 <xmx:zmqHXQRCaEfB141-JoKcmAUNf3hT6sQCywiVa9XLaq1P3NHeyvMeQg>
 <xmx:zmqHXVS1CSVvwLPgqHw287Oy5PswCdECOLZ8mz14YjLQotPe_rOGDQ>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id E875080059;
 Sun, 22 Sep 2019 08:36:28 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 5/6] net: ftgmac100: Ungate RCLK for RMII on
 AST2600
Date: Sun, 22 Sep 2019 22:06:59 +0930
Message-Id: <20190922123700.749-6-andrew@aj.id.au>
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

The 50MHz RMII RCLK has to be enabled before the interface will function.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 43 ++++++++++++++++++++----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 9b7af94a40bb..21a58aad1a19 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -90,6 +90,9 @@ struct ftgmac100 {
 	struct mii_bus *mii_bus;
 	struct clk *clk;
 
+	/* 2600 RMII clock gate */
+	struct clk *rclk;
+
 	/* Link management */
 	int cur_speed;
 	int cur_duplex;
@@ -1718,11 +1721,27 @@ static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
 		   nd->link_up ? "up" : "down");
 }
 
-static void ftgmac100_setup_clk(struct ftgmac100 *priv)
+static int ftgmac100_setup_clk(struct ftgmac100 *priv)
 {
-	priv->clk = devm_clk_get(priv->dev, NULL);
-	if (IS_ERR(priv->clk))
-		return;
+	struct clk *clk;
+	bool is_ast2600;
+
+	is_ast2600 = of_device_is_compatible(priv->dev->of_node,
+					     "aspeed,ast2600-mac");
+
+	clk = devm_clk_get(priv->dev, NULL /* MACCLK */);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	priv->clk = clk;
+
+	clk = devm_clk_get_optional(priv->dev, "RCLK");
+	if (!clk && is_ast2600 && priv->use_ncsi) {
+		dev_err(priv->dev, "Cannot ungate RCLK");
+		return -EINVAL;
+	}
+
+	priv->rclk = clk;
+	clk_prepare_enable(priv->rclk);
 
 	clk_prepare_enable(priv->clk);
 
@@ -1732,6 +1751,8 @@ static void ftgmac100_setup_clk(struct ftgmac100 *priv)
 	 */
 	clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
 			FTGMAC_100MHZ);
+
+	return 0;
 }
 
 static int ftgmac100_probe(struct platform_device *pdev)
@@ -1853,8 +1874,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 			goto err_setup_mdio;
 	}
 
-	if (priv->is_aspeed)
-		ftgmac100_setup_clk(priv);
+	if (priv->is_aspeed) {
+		err = ftgmac100_setup_clk(priv);
+		if (err)
+			goto err_ncsi_dev;
+	}
 
 	/* Default ring sizes */
 	priv->rx_q_entries = priv->new_rx_q_entries = DEF_RX_QUEUE_ENTRIES;
@@ -1886,8 +1910,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_ncsi_dev:
 err_register_netdev:
+	if (priv->rclk)
+		clk_disable_unprepare(priv->rclk);
+	clk_disable_unprepare(priv->clk);
+err_ncsi_dev:
 	ftgmac100_destroy_mdio(netdev);
 err_setup_mdio:
 	iounmap(priv->base);
@@ -1909,6 +1936,8 @@ static int ftgmac100_remove(struct platform_device *pdev)
 
 	unregister_netdev(netdev);
 
+	if (priv->rclk)
+		clk_disable_unprepare(priv->rclk);
 	clk_disable_unprepare(priv->clk);
 
 	/* There's a small chance the reset task will have been re-queued,
-- 
2.20.1

