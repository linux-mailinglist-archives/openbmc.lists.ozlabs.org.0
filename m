Return-Path: <openbmc+bounces-843-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF14C34907
	for <lists+openbmc@lfdr.de>; Wed, 05 Nov 2025 09:50:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1fCl11r9z30Qk;
	Wed,  5 Nov 2025 19:50:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762332611;
	cv=none; b=mlXc0JWWN4mkPH1APvvUfepc91Rk0b96W/d79xQtbo/CFKIH9Z2tOffrAKyog9lUMxjPnK0yQR6KD9EpriS0NLqkTs+iOvV9thBNbdyhZdvEujg9HDef38J/NM7RBZXxW+pmQ+552uIXsPq7tUcl+6Kl12YOJJsZaY4x5KTRkgRpD5OY9WGpOmi9rn2zrsMI1+2AdZtA4XEiL71JSqRMgDzNRRUCwkPzAIRHlmuEWP7zvBzI2R0VzbsjUhmOA+ewdnN8ePPmYmgmJgSv+DVc2MDr4i2npRvILLpN5jniSGH6Y4/Xd0iCS8HYW4kU6tbuocs04Xy0ExRlSlYjX4QMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762332611; c=relaxed/relaxed;
	bh=/zCTST0bESMEFvYHRpyaJiuyoIF8q3N35D0BAZZT2EA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hgc3VXakt9PTPREzZUIVTKsywBdXfscly4CAmtXRWkXhEOFRa3Cj12BYJ7HAVjUJiBSmi+eL/U6a8M0ZxhkGYlhtZa7yNeJTy+/yOuf/s3oT3ERu/FfZH74pC9DkYsUkC4n4n/dk/XOhseOLST3HQOZbE0VNj9Qu+sq1/cLkOGr2m+SUtiHJnwA7jF/bLnlC82OSyTgWVY4sSdnNJPyEozR31bzLJSjO8ypA/jg/AmKc0NzdcdHrqQnxaZeTyGfMvy8uNVQGy01rwBIDKbxZVQ/GTppXClDC002peVUEeOsEdaZzJXre9htodl+jBR5T4kq1Y6yy+2o6TAUVW0ecjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1fCk1CMzz2yrT;
	Wed,  5 Nov 2025 19:50:09 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 5 Nov
 2025 16:49:52 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 5 Nov 2025 16:49:52 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<broonie@kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>
Subject: [PATCH] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap() memory
Date: Wed, 5 Nov 2025 16:49:52 +0800
Message-ID: <20251105084952.1063489-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
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

The AHB IO memory for each chip select is mapped using
devm_ioremap(), so it should be unmapped using devm_iounmap()
to ensure proper device-managed resource cleanup.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510292356.JnTUBxCl-lkp@intel.com/
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index e8bd8fe6c4e7..179c47ffbfeb 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -396,7 +396,7 @@ static int aspeed_spi_set_window(struct aspeed_spi *aspi)
 
 	for (cs = 0; cs < aspi->data->max_cs; cs++) {
 		if (aspi->chips[cs].ahb_base) {
-			iounmap(aspi->chips[cs].ahb_base);
+			devm_iounmap(dev, aspi->chips[cs].ahb_base);
 			aspi->chips[cs].ahb_base = NULL;
 		}
 	}
-- 
2.34.1


