Return-Path: <openbmc+bounces-895-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14F3C5C797
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 11:11:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7CZs5chjz3069;
	Fri, 14 Nov 2025 21:11:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763115061;
	cv=none; b=G9eOg0bfSq73GXggmRUzinesv1bsMj01Mkak1tB9DfqaIPirn4ZcYeFG1ubQYngkb1cpbZoH5IL5lY45tzKHdV7hkyyzcndr7WgmMxmEJ7i1QYi+YFiZNVNll7kO58GrAcdKTZq/KsJEyVXSfFNqjMmeTZGnFqDKnfjuPq+esMs+IT/mRpRCiQVRc2T5s+wkuVYwk+Ph+yQDSoEyYNhkdpBZ2d1O26Mz066zYpN2t77ZtxNNbM1syUQDkTH6kzY5lD/vML29ni47mB9xDCUfbakmLeGPEhnH8ApNVwgEw0RFu7AUZJ20M8hvImPWrRbOB+di1RFl4Ou5sHcGAApwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763115061; c=relaxed/relaxed;
	bh=BuW+sdY1C4lswXtWs+z6u/laoEDvEqvaAzIN+qWV53Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsMlUeWskHWkbWmkJhkw4+JtiUGngsqby0QpFYrVwu/LNN5yUpZS4ArSYco0ikJdK0yA8Yvz2ZI2Ky5MXIK7JCV2aYMDRPBMpCJUwdDwHbLrvN4Z9+WKoXeVi5qtZd3cxVcINAckaOphW/Uy1IrEX6nRTNifoelyhfUsXqa2UJVZP3LOLlXr2OP7nasTZtt9mKZGDpMgNPZK+jJjodzKUM+C8KB3il4hu+9gPjh63LKRzUmreyd4wKIn3NZH142L/vGUsZ63JWFDlRhPq8jsdiWcy4lbZP+JuPBAI7SSDeWBQKgeuumOyMhXP38/aAeGF233JM79BlvbUinQNqRbzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7CZs1N9Hz3046;
	Fri, 14 Nov 2025 21:11:01 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:42 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:42 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 2/4] spi: aspeed: Enable Quad SPI mode for page program
Date: Fri, 14 Nov 2025 18:10:40 +0800
Message-ID: <20251114101042.1520997-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
References: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Ensure the controller switches to quad I/O mode when
spi-tx-bus-width dts property is 4 and the Quad SPI program
opcode (32h or 34h) is used. Without this change, high-bit
data will be lost during page programming.

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 179c47ffbfeb..4163632fed8b 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -263,11 +263,15 @@ static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
 				     const struct spi_mem_op *op)
 {
 	int ret;
+	int io_mode = aspeed_spi_get_io_mode(op);
 
 	aspeed_spi_start_user(chip);
 	ret = aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, op->addr.val, op->cmd.opcode);
 	if (ret < 0)
 		goto stop_user;
+
+	aspeed_spi_set_io_mode(chip, io_mode);
+
 	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out, op->data.nbytes);
 stop_user:
 	aspeed_spi_stop_user(chip);
-- 
2.34.1


