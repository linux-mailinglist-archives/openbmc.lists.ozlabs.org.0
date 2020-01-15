Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358B13CA5A
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 18:10:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yYjT0pvZzDqQG
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 04:10:05 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yYfd0Nj3zDqT5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 04:07:36 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 00FGN3DI021574;
 Wed, 15 Jan 2020 18:23:03 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D85536032F; Wed, 15 Jan 2020 18:23:03 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com
Subject: [PATCH v1 2/4] spi: npcm-pspi: improve spi transfer performance
Date: Wed, 15 Jan 2020 18:22:59 +0200
Message-Id: <20200115162301.235926-3-tmaimon77@gmail.com>
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

Improving spi 8 bit per word mode transfer performance
by using 16 bit per word transfer and receive when the data
length is even and larger than one.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index c74611abe2a9..eac7ba18b4b9 100644
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
2.22.0

