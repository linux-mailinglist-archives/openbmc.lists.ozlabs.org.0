Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194AB92BF08
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 18:03:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJQlR5MCsz3fSB
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2024 02:03:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJQkZ2Tw2z2yvv
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2024 02:02:59 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 469G2n7o030997
	for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2024 19:02:50 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 19:02:49 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 00:02:46 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 00:02:46 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id B0E295F5E4;
	Tue,  9 Jul 2024 19:02:45 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id B1A38DC1BAA; Tue,  9 Jul 2024 19:02:45 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v1 1/2] spi: npcm-pspi: add full duplex support
Date: Tue, 9 Jul 2024 19:02:41 +0300
Message-ID: <20240709160242.1921541-2-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The NPCM PSPI handler, on TX-buffer not null, would perform a dummy read
but did not save the rx-data, this was valid only for half duplex.

This patch adds full duplex support for NPCM PSPI driver by storing all
rx-data when the Rx-buffer is defined also for TX-buffer handling.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 75 +++++++++++++++----------------------
 1 file changed, 30 insertions(+), 45 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 64585c2a25c5..7961b5442082 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -195,22 +195,22 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
 static void npcm_pspi_send(struct npcm_pspi *priv)
 {
 	int wsize;
-	u16 val;
+	u16 val = 0;
 
 	wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
 	priv->tx_bytes -= wsize;
 
-	if (!priv->tx_buf)
-		return;
-
 	switch (wsize) {
 	case 1:
-		val = *priv->tx_buf++;
+		if (priv->tx_buf)
+			val = *priv->tx_buf++;
 		iowrite8(val, NPCM_PSPI_DATA + priv->base);
 		break;
 	case 2:
-		val = *priv->tx_buf++;
-		val = *priv->tx_buf++ | (val << 8);
+		if (priv->tx_buf) {
+			val = *priv->tx_buf++;
+			val = *priv->tx_buf++ | (val << 8);
+		}
 		iowrite16(val, NPCM_PSPI_DATA + priv->base);
 		break;
 	default:
@@ -222,22 +222,24 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
 static void npcm_pspi_recv(struct npcm_pspi *priv)
 {
 	int rsize;
-	u16 val;
+	u16 val_16;
+	u8  val_8;
 
 	rsize = min(bytes_per_word(priv->bits_per_word), priv->rx_bytes);
 	priv->rx_bytes -= rsize;
 
-	if (!priv->rx_buf)
-		return;
-
 	switch (rsize) {
 	case 1:
-		*priv->rx_buf++ = ioread8(priv->base + NPCM_PSPI_DATA);
+		val_8 = ioread8(priv->base + NPCM_PSPI_DATA);
+		if (priv->rx_buf)
+			*priv->rx_buf++ = val_8;
 		break;
 	case 2:
-		val = ioread16(priv->base + NPCM_PSPI_DATA);
-		*priv->rx_buf++ = (val >> 8);
-		*priv->rx_buf++ = val & 0xff;
+		val_16 = ioread16(priv->base + NPCM_PSPI_DATA);
+		if (priv->rx_buf) {
+			*priv->rx_buf++ = (val_16 >> 8);
+			*priv->rx_buf++ = val_16 & 0xff;
+		}
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -296,43 +298,26 @@ static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)
 	struct npcm_pspi *priv = dev_id;
 	u8 stat;
 
-	stat = ioread8(priv->base + NPCM_PSPI_STAT);
-
 	if (!priv->tx_buf && !priv->rx_buf)
 		return IRQ_NONE;
 
-	if (priv->tx_buf) {
-		if (stat & NPCM_PSPI_STAT_RBF) {
-			ioread8(NPCM_PSPI_DATA + priv->base);
-			if (priv->tx_bytes == 0) {
-				npcm_pspi_disable(priv);
-				complete(&priv->xfer_done);
-				return IRQ_HANDLED;
-			}
-		}
-
-		if ((stat & NPCM_PSPI_STAT_BSY) == 0)
-			if (priv->tx_bytes)
-				npcm_pspi_send(priv);
+	if (priv->tx_bytes == 0 && priv->rx_bytes == 0) {
+		npcm_pspi_disable(priv);
+		complete(&priv->xfer_done);
+		return IRQ_HANDLED;
 	}
 
-	if (priv->rx_buf) {
-		if (stat & NPCM_PSPI_STAT_RBF) {
-			if (!priv->rx_bytes)
-				return IRQ_NONE;
-
-			npcm_pspi_recv(priv);
+	stat = ioread8(priv->base + NPCM_PSPI_STAT);
 
-			if (!priv->rx_bytes) {
-				npcm_pspi_disable(priv);
-				complete(&priv->xfer_done);
-				return IRQ_HANDLED;
-			}
-		}
+	/*
+	 * first we do the read since if we do the write we previous read might
+	 * be lost (indeed low chances)
+	 */
+	if ((stat & NPCM_PSPI_STAT_RBF) && priv->rx_bytes)
+		npcm_pspi_recv(priv);
 
-		if (((stat & NPCM_PSPI_STAT_BSY) == 0) && !priv->tx_buf)
-			iowrite8(0x0, NPCM_PSPI_DATA + priv->base);
-	}
+	if (((stat & NPCM_PSPI_STAT_BSY) == 0) && priv->tx_bytes)
+		npcm_pspi_send(priv);
 
 	return IRQ_HANDLED;
 }
-- 
2.34.1

