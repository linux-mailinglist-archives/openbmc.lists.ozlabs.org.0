Return-Path: <openbmc+bounces-228-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738EAADA4A3
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jv1t3Vz30VV;
	Mon, 16 Jun 2025 09:21:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960227;
	cv=none; b=OGv4BJd/H4bwymO+KxCLZMQ1e8YmS8J0OnXEK8tvtZbbtDOS9JPGUK3bsS4wUO+DI422yMUqW35w/7CzjK2v8XMzpShTtBBxoKhKbPNpwry5YVNYwGAj7+GIYGg80u6LlHn0kBQhbGHGmXzTDRr1qirjc/fkr/xfnjtaUioiAEm7DIjwPBY1qEKVrZwz+vGD7pR4ILTCMAscnclAwni37CXlhxJDHIZw9e1JEeT839A/MNPk9MYUCqswtvtR7iHAblwx9ZRK3TcFWhAKhg0QoJwSOCIUMm2eLpYBvfJ3O0Vk6o8LA5HlyyoxnyydLcs0MusEi0vlNJSyU/2pcfho0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960227; c=relaxed/relaxed;
	bh=riNJCfLsCpG+ZXEQyizH4dM9JJQUu6bLADOK0GpAsts=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqDemVTVl7Nf8WUmtbRS/Oe59O5Jq8jvd17i4pDl0gO9n4T5gvh+k37HOFfdYaGTiIqyJtJF9yPrvnOVytVLVzmvmOGfdP1ZlswWc39bo11YptFIjKXAocZ5Nh+mJXk6soBTnpzPNneqxcrtnT+XQW3FEacWY1U+zGw2ozX4nWt0mBlQQWgaK6UrdMMI3GGNj7GN5pM0ZFciI91f1bVgHzC63ijj/6UdJvYnQjctdPjtbbWpHSwoQK8CDHByzfn5CY7g5VH/TP3VWfU/QY44yRRB8zjp2fDb4qVvU/7+r3rJFh0IX437WWdyhD6vZ23k4DAah5AB8ID1WA9l+Iw+QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdH0Wmdz30T9;
	Sun, 15 Jun 2025 14:03:47 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 15 Jun
 2025 11:58:04 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 15 Jun 2025 11:58:04 +0800
From: Cool Lee <cool_lee@aspeedtech.com>
To: <andrew@codeconstruct.com.au>, <adrian.hunter@intel.com>,
	<ulf.hansson@linaro.org>, <joel@jms.id.au>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 8/8] mmc: sdhci-of-aspeed: Add sdr50 support
Date: Sun, 15 Jun 2025 11:58:03 +0800
Message-ID: <20250615035803.3752235-9-cool_lee@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
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

Add support for SDR50 mode in the Aspeed SDHCI driver by setting
capability shadow register.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 365c02215273..ec6833295b6a 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -41,6 +41,7 @@
 #define ASPEED_SDC_CAP1_1_8V           (0 * 32 + 26)
 /* SDIO{14,24} */
 #define ASPEED_SDC_CAP2_SDR104         (1 * 32 + 1)
+#define ASPEED_SDC_CAP2_SDR50		(1 * 32 + 0)
 
 struct aspeed_sdc {
 	struct clk *clk;
@@ -427,11 +428,17 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 	sdhci_get_of_property(pdev);
 
 	if (of_property_read_bool(np, "mmc-hs200-1_8v") ||
+	    of_property_read_bool(np, "sd-uhs-sdr50") ||
 	    of_property_read_bool(np, "sd-uhs-sdr104")) {
 		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP1_1_8V,
 					       true, slot);
 	}
 
+	if (of_property_read_bool(np, "sd-uhs-sdr50")) {
+		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR50,
+					       true, slot);
+	}
+
 	if (of_property_read_bool(np, "sd-uhs-sdr104")) {
 		aspeed_sdc_set_slot_capability(host, dev->parent, ASPEED_SDC_CAP2_SDR104,
 					       true, slot);
-- 
2.34.1


