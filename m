Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E78140EE1
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 17:25:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zmdC2hKWzDqxs
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 03:25:35 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=20170815-heliosphere header.b=uS47EFmE; 
 dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zmQs38ppzDqw4
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 03:16:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=aNhfz5xSnBJuJUs9Nvc6bIIqDmzUTd5NmPbncOiwvWE=; b=uS47EFmEcy6v
 6VUGZtKkE6CLNVfKOiGdJ4Y+D3FKbQLqDXkvL/whTBUbIhZb56/s10W2LYkw9AlzH/OUb9+9ednIJ
 ZY8D7Hx+SwZ63UH0EMXbYLDUcp2j2HZqAR4zoONL6QKrukQoohacqjVjAjmaUJE6EnyfHy1YBl61M
 6ZhTo=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnM-0006uW-An; Fri, 17 Jan 2020 15:44:24 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 062EED02BD9; Fri, 17 Jan 2020 15:44:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Applied "spi: npcm-pspi: improve spi transfer performance" to the spi
 tree
In-Reply-To: <20200115162301.235926-3-tmaimon77@gmail.com>
Message-Id: <applied-20200115162301.235926-3-tmaimon77@gmail.com>
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

   spi: npcm-pspi: improve spi transfer performance

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.6

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

From b4adf5b27d59cdefff1e6fcba99151edea65a9f7 Mon Sep 17 00:00:00 2001
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 15 Jan 2020 18:22:59 +0200
Subject: [PATCH] spi: npcm-pspi: improve spi transfer performance

Improving spi 8 bit per word mode transfer performance
by using 16 bit per word transfer and receive when the data
length is even and larger than one.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Link: https://lore.kernel.org/r/20200115162301.235926-3-tmaimon77@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-npcm-pspi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index fe624731c74c..d224aa63dbce 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -178,6 +178,13 @@ static void npcm_pspi_setup_transfer(struct spi_device *spi,
 		priv->mode = spi->mode;
 	}
 
+	/*
+	 * If transfer is even length, and 8 bits per word transfer,
+	 * then implement 16 bits-per-word transfer.
+	 */
+	if (priv->bits_per_word == 8 && !(t->len & 0x1))
+		t->bits_per_word = 16;
+
 	if (!priv->is_save_param || priv->bits_per_word != t->bits_per_word) {
 		npcm_pspi_set_transfer_size(priv, t->bits_per_word);
 		priv->bits_per_word = t->bits_per_word;
-- 
2.20.1

