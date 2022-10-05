Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF905F5093
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 10:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj6Vz5bXjz3c5G
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 19:02:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj6VW2Bscz2xrK;
	Wed,  5 Oct 2022 19:02:08 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2957dWlm053427;
	Wed, 5 Oct 2022 15:39:32 +0800 (GMT-8)
	(envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 Oct
 2022 16:01:10 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <chin-ting_kuo@aspeedtech.com>, <broonie@kernel.org>,
        <joel@jms.id.au>, <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
        <openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
        <steven_lee@aspeedtech.com>
Subject: [PATCH] spi: aspeed: Fix typo in mode_bits field for AST2600 platform
Date: Wed, 5 Oct 2022 16:01:04 +0800
Message-ID: <20221005080104.175769-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2957dWlm053427
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Both quad SPI TX and RX modes can be supported on AST2600.
Correct typo in mode_bits field in both ast2600_fmc_data
ast2600_spi_data structs.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index a334e89add86..33cefcf18392 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -1163,7 +1163,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
 static const struct aspeed_spi_data ast2600_fmc_data = {
 	.max_cs	       = 3,
 	.hastype       = false,
-	.mode_bits     = SPI_RX_QUAD | SPI_RX_QUAD,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
 	.we0	       = 16,
 	.ctl0	       = CE0_CTRL_REG,
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
@@ -1178,7 +1178,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
 static const struct aspeed_spi_data ast2600_spi_data = {
 	.max_cs	       = 2,
 	.hastype       = false,
-	.mode_bits     = SPI_RX_QUAD | SPI_RX_QUAD,
+	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
 	.we0	       = 16,
 	.ctl0	       = CE0_CTRL_REG,
 	.timing	       = CE0_TIMING_COMPENSATION_REG,
-- 
2.25.1

