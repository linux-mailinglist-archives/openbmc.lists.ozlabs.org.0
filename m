Return-Path: <openbmc+bounces-881-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68493C56614
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 09:54:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6YwJ02r8z3054;
	Thu, 13 Nov 2025 19:53:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763024031;
	cv=none; b=n7b5SydjTUmfdDJIw9wy4eUz+KBFUjRgza8QP5jA51FXFn05l/t4EYtjqQqNXh5fygwwJ11XwJn28rWhtZw7JzCB+4KXrBfblKETQLXWO603mW4j2e6bX2KxY4UZb4jisPGe8Y8k1RZ95DhiHElCRV69dqMsgc2yWx75Vz68isJ43hgXB2DRUriyvny1BLF0Fbl8ehDXqm/iv4YVG/hVwy0ahcl/kY/n3uur/2vZzgLtL7CIXUO+Kn3SOb7C4pMROfnlWSBh1UM0/KP5Uq39xVRJUBMZpE1HZw545/4Kjr5ujxk39ZnEO5999dgnpLTZLVmuBR9aZblmR5hm7rYubA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763024031; c=relaxed/relaxed;
	bh=BuW+sdY1C4lswXtWs+z6u/laoEDvEqvaAzIN+qWV53Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCPL53rwyHy2p24c/NlQW0RVEIzwS6+XebN3n5U36CY6/i+weJsUET7A1Nbcrg5ZzZyBENbxpc4dijEXukuS0Jip9ECmTfTh1vgiQJGYhnDXSqyF4MuI09XJgSrHoTHmp9IFOISYnW1FgJr9Jz1sAdaE9DBdTrsqior7HynbKkBCKpLFeEmst3qcUlbFHoY2xcLrYIX/7/lBQ+CQK9TXlkoAFUm+C8Byg6Qn0FxlyWxThccn6It/JP9QT6R528o2AbSFXwG105YmZ4UsgHjBkg9CC06E18cO6T9jO1LfF36c/+guLGalFgC1byKQmVuEAnIhYOCv8V3iqzai3L9x3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6YwH3Pvgz2yvd;
	Thu, 13 Nov 2025 19:53:51 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 13 Nov
 2025 16:53:33 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 13 Nov 2025 16:53:33 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 2/4] spi: aspeed: Enable Quad SPI mode for page program
Date: Thu, 13 Nov 2025 16:53:30 +0800
Message-ID: <20251113085332.89688-3-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
References: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
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


