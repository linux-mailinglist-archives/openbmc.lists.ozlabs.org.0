Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C7140EC9
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 17:18:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zmSl3nPczDqtR
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 03:18:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sirena.org.uk
 (client-ip=172.104.155.198; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.a=rsa-sha256 header.s=20170815-heliosphere header.b=Wu4Px26Q; 
 dkim-atps=neutral
X-Greylist: delayed 1900 seconds by postgrey-1.36 at bilbo;
 Sat, 18 Jan 2020 03:16:11 AEDT
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zmQM6LJ2zDqDM
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 03:16:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YZm/5f9wodQfID90hCH6kdu/JpRhW+QGeHbLTu7g0DM=; b=Wu4Px26QUDJX
 9BBVnJdZiujoKJDRPmgP7URAGeeMyS/2vWCDgNjtat6R+Jn/iNX6uDYsbaQoX2FpFED4ivBh0ykiy
 gWthDXylaQc0TVOl5Co7tjBTBLMpbclsVxl9c6jd3o8B7cq+SFdcTwtX8Hix9hiS2VevtxOixKqYe
 /084o=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnM-0006ua-JB; Fri, 17 Jan 2020 15:44:24 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4C87BD02A2A; Fri, 17 Jan 2020 15:44:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Applied "spi: npcm-pspi: fix 16 bit send and receive support" to the
 spi tree
In-Reply-To: <20200115162301.235926-2-tmaimon77@gmail.com>
Message-Id: <applied-20200115162301.235926-2-tmaimon77@gmail.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:24 +0000 (GMT)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, benjaminfair@google.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, tali.perry1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The patch

   spi: npcm-pspi: fix 16 bit send and receive support

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 47416a5f27be0a0e815ef5f9f2f06618ae5e0470 Mon Sep 17 00:00:00 2001
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 15 Jan 2020 18:22:58 +0200
Subject: [PATCH] spi: npcm-pspi: fix 16 bit send and receive support

Fixing NPCM BMC Peripheral SPI controller 16 bit
send and receive support by writing and reading
the SPI data in the right order.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Link: https://lore.kernel.org/r/20200115162301.235926-2-tmaimon77@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

