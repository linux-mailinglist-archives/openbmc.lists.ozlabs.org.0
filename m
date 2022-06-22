Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F55555126
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 18:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSpSh1hX7z3dym
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 02:17:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSpRV1g9Rz2yLX;
	Thu, 23 Jun 2022 02:16:38 +1000 (AEST)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSpRV1JNBz4xZp;
	Thu, 23 Jun 2022 02:16:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSpRQ2DLzz4xDK;
	Thu, 23 Jun 2022 02:16:34 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH v3 2/2] spi: aspeed: Fix division by zero
Date: Wed, 22 Jun 2022 18:16:17 +0200
Message-Id: <20220622161617.3719096-3-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622161617.3719096-1-clg@kaod.org>
References: <20220622161617.3719096-1-clg@kaod.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Ian Woloschin <iwolosch@akamai.com>, Ian Woloschin <ian.woloschin@akamai.com>, Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When using the normal read operation for data transfers, the dummy bus
width is zero. In that case, they are no dummy bytes to transfer and
setting the dummy field in the controller register becomes useless.

Issue was found on a custom "Bifrost" board based on the AST2500 SoC
and using a MX25L51245GMI-08G SPI Flash.

Reported-by: Ian Woloschin <ian.woloschin@akamai.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Tested-by: Ian Woloschin <iwolosch@akamai.com>
Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index ac64be289e59..3e891bf22470 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -582,9 +582,11 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	ctl_val = readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
 	ctl_val |= aspeed_spi_get_io_mode(op) |
 		op->cmd.opcode << CTRL_COMMAND_SHIFT |
-		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
 		CTRL_IO_MODE_READ;
 
+	if (op->dummy.nbytes)
+		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
+
 	/* Tune 4BYTE address mode */
 	if (op->addr.nbytes) {
 		u32 addr_mode = readl(aspi->regs + CE_CTRL_REG);
-- 
2.35.3

