Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E06C13CA8A
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 18:13:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yYmp0VNfzDqTj
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 04:12:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yYg02NM0zDqT9
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 04:07:55 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 00FGN3ZW021573;
 Wed, 15 Jan 2020 18:23:03 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 5EDF16032E; Wed, 15 Jan 2020 18:23:03 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v1 1/4] spi: npcm-pspi: fix 16 bit send and receive support
Date: Wed, 15 Jan 2020 18:22:58 +0200
Message-Id: <20200115162301.235926-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200115162301.235926-1-tmaimon77@gmail.com>
References: <20200115162301.235926-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Fixing NPCM BMC Peripheral SPI controller 16 bit
send and receive support by writing and reading
the SPI data in the right order.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index fe624731c74c..c74611abe2a9 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -195,6 +195,7 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
 static void npcm_pspi_send(struct npcm_pspi *priv)
 {
 	int wsize;
+	u16 val;
 
 	wsize = min(bytes_per_word(priv->bits_per_word), priv->tx_bytes);
 	priv->tx_bytes -= wsize;
@@ -204,17 +205,18 @@ static void npcm_pspi_send(struct npcm_pspi *priv)
 
 	switch (wsize) {
 	case 1:
-		iowrite8(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+		val = *priv->tx_buf++;
+		iowrite8(val, NPCM_PSPI_DATA + priv->base);
 		break;
 	case 2:
-		iowrite16(*priv->tx_buf, NPCM_PSPI_DATA + priv->base);
+		val = *priv->tx_buf++;
+		val = *priv->tx_buf++ | (val << 8);
+		iowrite16(val, NPCM_PSPI_DATA + priv->base);
 		break;
 	default:
 		WARN_ON_ONCE(1);
 		return;
 	}
-
-	priv->tx_buf += wsize;
 }
 
 static void npcm_pspi_recv(struct npcm_pspi *priv)
@@ -230,18 +232,17 @@ static void npcm_pspi_recv(struct npcm_pspi *priv)
 
 	switch (rsize) {
 	case 1:
-		val = ioread8(priv->base + NPCM_PSPI_DATA);
+		*priv->rx_buf++ = ioread8(priv->base + NPCM_PSPI_DATA);
 		break;
 	case 2:
 		val = ioread16(priv->base + NPCM_PSPI_DATA);
+		*priv->rx_buf++ = (val >> 8);
+		*priv->rx_buf++ = val & 0xff;
 		break;
 	default:
 		WARN_ON_ONCE(1);
 		return;
 	}
-
-	*priv->rx_buf = val;
-	priv->rx_buf += rsize;
 }
 
 static int npcm_pspi_transfer_one(struct spi_master *master,
-- 
2.22.0

