Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7266000FD
	for <lists+openbmc@lfdr.de>; Sun, 16 Oct 2022 17:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mr4XN2r82z3c75
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 02:57:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mr4Wz1nlmz2xf7;
	Mon, 17 Oct 2022 02:57:35 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Mr4Ww3Gvfz4xGp;
	Mon, 17 Oct 2022 02:57:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mr4Wq65Brz4xGG;
	Mon, 17 Oct 2022 02:57:27 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH] spi: aspeed: Fix window offset of CE1
Date: Sun, 16 Oct 2022 17:57:22 +0200
Message-Id: <20221016155722.3520802-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The offset value of the mapping window in the kernel structure is
calculated using the value of the previous window offset. This doesn't
reflect how the HW is configured and can lead to erroneous setting of
the second flash device (CE1).

Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com> 
Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 33cefcf18392..b90571396a60 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -398,7 +398,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
 		windows[cs].cs = cs;
 		windows[cs].size = data->segment_end(aspi, reg_val) -
 			data->segment_start(aspi, reg_val);
-		windows[cs].offset = cs ? windows[cs - 1].offset + windows[cs - 1].size : 0;
+		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
 		dev_vdbg(aspi->dev, "CE%d offset=0x%.8x size=0x%x\n", cs,
 			 windows[cs].offset, windows[cs].size);
 	}
-- 
2.37.3

