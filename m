Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086F92BF0A
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 18:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJQlx55Fsz3fmZ
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 02:04:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJQkZ2XTbz30Wb
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 02:02:59 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 469G2pne031002
	for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2024 19:02:52 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 19:02:50 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 00:02:47 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 00:02:47 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 15CDA5F5E7;
	Tue,  9 Jul 2024 19:02:46 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 16B12DC1BAA; Tue,  9 Jul 2024 19:02:46 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1 2/2] spi: npcm-pspi: Fix transfer bits per word issue
Date: Tue, 9 Jul 2024 19:02:42 +0300
Message-ID: <20240709160242.1921541-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709160242.1921541-1-tmaimon77@gmail.com>
References: <20240709160242.1921541-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: cpchiang <cpchiang1@nuvoton.com>, Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch fix transfer bits per word issue by avoid polluting SPI
transfer data, as it may be reused and alter the transfer length and
tx/rx buffer (e.g., tpm-spi).

By default, use an 8-bit data interface mode.
However, change to a 16-bit mode when the transfer length is even.

Signed-off-by: cpchiang <cpchiang1@nuvoton.com>
Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 7961b5442082..726e6dc01c7d 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -160,6 +160,7 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
 				     struct spi_transfer *t)
 {
 	struct npcm_pspi *priv = spi_master_get_devdata(spi->master);
+	u8 bits_per_word = 8;
 
 	priv->tx_buf = t->tx_buf;
 	priv->rx_buf = t->rx_buf;
@@ -172,15 +173,14 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
 	}
 
 	/*
-	 * If transfer is even length, and 8 bits per word transfer,
-	 * then implement 16 bits-per-word transfer.
+	 * If transfer is even length, change to use 16 bits-per-word transfer.
 	 */
-	if (priv->bits_per_word == 8 && !(t->len & 0x1))
-		t->bits_per_word = 16;
+	if (!(t->len & 0x1))
+		bits_per_word = 16;
 
-	if (!priv->is_save_param || priv->bits_per_word != t->bits_per_word) {
-		npcm_pspi_set_transfer_size(priv, t->bits_per_word);
-		priv->bits_per_word = t->bits_per_word;
+	if (!priv->is_save_param || priv->bits_per_word != bits_per_word) {
+		npcm_pspi_set_transfer_size(priv, bits_per_word);
+		priv->bits_per_word = bits_per_word;
 	}
 
 	if (!priv->is_save_param || priv->speed_hz != t->speed_hz) {
@@ -339,6 +339,7 @@ static int npcm_pspi_probe(struct platform_device *pdev)
 	priv = spi_master_get_devdata(master);
 	priv->master = master;
 	priv->is_save_param = false;
+	priv->bits_per_word = 8;
 
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
-- 
2.34.1

