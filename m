Return-Path: <openbmc+bounces-850-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46744C39C96
	for <lists+openbmc@lfdr.de>; Thu, 06 Nov 2025 10:19:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Gpx1ZTRz3btw;
	Thu,  6 Nov 2025 20:19:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762420761;
	cv=none; b=IHpGUi7lXfx3UxZSmRZ/RrSHAkFLQn18uz+j/p9n8SnWLxyloxDvms0toKM6SsZbysUNC5I+Cfcjv3EKaBRZyWzUVN0QjAvANnFeBOgHm3owZohlS+JvzpA9s58kcqrYrP96x0bMt8apGY5akJDXsHcQNiJE7/9p2Zj5L0yV9jsrJtd0d+SCkVv8q5k2VAI9pLH3sfnSAjjV4wxFYarnNFBfiye/aqSsBky+WjABB14GaO8rIklaCxhWkkwbuaZqaorkE2uZ/eXEczAJ2BMKn5yMK1Z6hqgfFhanoetRVx7Htx9v2qNi5sxbfMRqIQ+CdkKAWVdxnkvvxf7M+jYKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762420761; c=relaxed/relaxed;
	bh=R1e+n2STAIZSlmEJ0HT7X+M8eC3OwmeptdqDHQ1pxSo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=obfEug1+Qn7ds9eXKIGa68A0Hkc2qzC0hjZic8LLBnXbqgd1+RPkD1q4jyRCmnQOCYNtk/EDKsbxHyZ2fzw+AMIb4pX0ESVaqzLMImcPPtNULnpnU0cuaQsUX9h05X3V8DYPnq12tA9C1SXGBpLuRi9LtjhOwbNnmvduDwSycEorOfFQRmRX6HevTGhwHTSmSP+Ipa3lUlnqbbGd749YVIxk0VHFxRKeJx7eSXHCGhiR2Dz1jZWjzhgAV89Lgd5jDLUvIo8fnK2OqUhcaV8qQzAh8sF1p9ICu0nP2yS84K8JPNGRfuNIPNt3fOgwlQPh4if7EI+nqxB5aY+fQaolAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2Gpw2lTjz2ySP;
	Thu,  6 Nov 2025 20:19:19 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 6 Nov
 2025 17:19:03 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 6 Nov 2025 17:19:03 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<broonie@kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
CC: kernel test robot <lkp@intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v2] spi: aspeed: Use devm_iounmap() to unmap devm_ioremap() memory
Date: Thu, 6 Nov 2025 17:19:03 +0800
Message-ID: <20251106091903.2800981-1-chin-ting_kuo@aspeedtech.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use devm_iounmap() to unmap memory mapped with devm_ioremap().
Thus ensure proper cleanup of device-managed resources.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510292356.JnTUBxCl-lkp@intel.com/
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
V2: Refine commit message for clarity.

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


