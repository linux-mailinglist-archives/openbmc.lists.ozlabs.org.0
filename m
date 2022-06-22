Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E036A5544EE
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 11:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSdjt5QRQz3cFH
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 19:43:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSdj62Js2z2ynx;
	Wed, 22 Jun 2022 19:42:50 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdj60YbKz4xZh;
	Wed, 22 Jun 2022 19:42:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdj25Vydz4xZb;
	Wed, 22 Jun 2022 19:42:46 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-spi@vger.kernel.org
Subject: [PATCH v2 1/2] spi: aspeed: Add pr_debug in aspeed_spi_dirmap_create()
Date: Wed, 22 Jun 2022 11:42:32 +0200
Message-Id: <20220622094233.3681843-2-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622094233.3681843-1-clg@kaod.org>
References: <20220622094233.3681843-1-clg@kaod.org>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

It helps to analyze the default setting of the control register.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/spi/spi-aspeed-smc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 496f3e1e9079..ac64be289e59 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -558,6 +558,14 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
 	u32 ctl_val;
 	int ret = 0;
 
+	dev_dbg(aspi->dev,
+		"CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",
+		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
+		desc->info.offset, desc->info.offset + desc->info.length,
+		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
+		op->dummy.buswidth, op->data.buswidth,
+		op->addr.nbytes, op->dummy.nbytes);
+
 	chip->clk_freq = desc->mem->spi->max_speed_hz;
 
 	/* Only for reads */
-- 
2.35.3

