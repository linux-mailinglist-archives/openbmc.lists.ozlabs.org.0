Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E937BE1A1
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:51:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46djGQ2sffzDqMk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:51:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="lsP9NY4W"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ovIyAP81"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhtx4n1mzDqZ9
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:34:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 72C624DB;
 Wed, 25 Sep 2019 11:34:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=VrOAEo8fPhIsF
 bZtqUbj1skBfTPYiCz0Pda7Yzm4W+M=; b=lsP9NY4W513Ff/GfNF8Q3I2RMnYgc
 hupaXrbLkqY9tW7fXLKJfI9N6Ljs5TKboPCgOniMPVLB5IhPo+9ldHYP/MNl9P0K
 8bJKiVp0DS5CmgUSEngpTJjR/3rOF8xe6KxV5cSgDeZ5PaQiCcCYSrEozBRBMYVP
 0S9osdReMegh0ij9pyLivBNlYgsZ1AL+RlvjAjtnwvxk2+mwG8bAu1jLujAAsDBq
 Bxb3OIasT5bEKIMKy5xqdchK/k5NicQyNLEt6ZVIZlaupgiZyG85UYUaJgRY0ELt
 pxApgFFUpAjAR3BAKwaA4K1N5a20rifdpsJbIwophWP/N+Tej0jvboldQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=VrOAEo8fPhIsFbZtqUbj1skBfTPYiCz0Pda7Yzm4W+M=; b=ovIyAP81
 dvl7RJy+4PWvOVAW9wXbomrFn8UaggpSoIp+TtLWqnnOC4KikK52LFHmgcvj4Hpn
 Usj+s4VyoToFXP72vj8gmWcPOrG+j1WriFQIRS4sn4IVnESPyUYh750WvfpCYoRs
 +zYR2Tb5EiI1+/AQL3MtxsPKxZVJiTLwzKz4muabPKQYyLUy5il7iAMbB+iZfDcm
 fV2GlX5m0hoL2nJ5YsK0UUV38qc+YIROHmn3O81Sb1aVsUD40vP7+6QEQbOVk14w
 yeVA2poXTxmS3WGlrMQNR9uB9IIsxmQaYkwIVSPX7byqsn9EUJN5K0fRSuYQ6Rht
 sMio5XCw58mcYg==
X-ME-Sender: <xms:BomLXbjmEvKAh91vOytXMhe_ImwkDjcv8J8nEqL7TRM3Ao5GdpPFFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepie
X-ME-Proxy: <xmx:B4mLXf9C7FJYm9U0DxaRF-5LdA3AP6ek-k83SPFHaMT_HES9PVIJfw>
 <xmx:B4mLXSSqg41bLw8fOd-ulbd_0bBe74hLRo7Aejp-vaXq_zU4KamLlw>
 <xmx:B4mLXesm_7EWLQaIEoe3v-z9kV_LXMg_YMTp6HME2jTZW4UTKR-PgA>
 <xmx:B4mLXTQjcXZLgw_rQYis7Sw4yN6bYo1qlM92Dp21rB10dD26nmS6ig>
Received: from localhost.localdomain (203-57-215-178.dyn.iinet.net.au
 [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6D324D60062;
 Wed, 25 Sep 2019 11:34:29 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 7/8] net: ftgmac100: Ungate RCLK for RMII on
 ASPEED MACs
Date: Thu, 26 Sep 2019 01:04:38 +0930
Message-Id: <20190925153439.27475-8-andrew@aj.id.au>
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

The 50MHz RCLK has to be enabled before the RMII interface will function.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 35 +++++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 9b7af94a40bb..9ff791fb0449 100644
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
@@ -1718,12 +1721,14 @@ static void ftgmac100_ncsi_handler(struct ncsi_dev *nd)
 		   nd->link_up ? "up" : "down");
 }
 
-static void ftgmac100_setup_clk(struct ftgmac100 *priv)
+static int ftgmac100_setup_clk(struct ftgmac100 *priv)
 {
-	priv->clk = devm_clk_get(priv->dev, NULL);
-	if (IS_ERR(priv->clk))
-		return;
+	struct clk *clk;
 
+	clk = devm_clk_get(priv->dev, NULL /* MACCLK */);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+	priv->clk = clk;
 	clk_prepare_enable(priv->clk);
 
 	/* Aspeed specifies a 100MHz clock is required for up to
@@ -1732,6 +1737,14 @@ static void ftgmac100_setup_clk(struct ftgmac100 *priv)
 	 */
 	clk_set_rate(priv->clk, priv->use_ncsi ? FTGMAC_25MHZ :
 			FTGMAC_100MHZ);
+
+	/* RCLK is for RMII, typically used for NCSI. Optional because its not
+	 * necessary if it's the 2400 MAC or the MAC is configured for RGMII
+	 */
+	priv->rclk = devm_clk_get_optional(priv->dev, "RCLK");
+	clk_prepare_enable(priv->rclk);
+
+	return 0;
 }
 
 static int ftgmac100_probe(struct platform_device *pdev)
@@ -1853,8 +1866,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
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
@@ -1886,8 +1902,11 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
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
@@ -1909,6 +1928,8 @@ static int ftgmac100_remove(struct platform_device *pdev)
 
 	unregister_netdev(netdev);
 
+	if (priv->rclk)
+		clk_disable_unprepare(priv->rclk);
 	clk_disable_unprepare(priv->clk);
 
 	/* There's a small chance the reset task will have been re-queued,
-- 
2.20.1

