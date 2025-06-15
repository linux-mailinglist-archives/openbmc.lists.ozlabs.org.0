Return-Path: <openbmc+bounces-226-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA26ADA49B
	for <lists+openbmc@lfdr.de>; Mon, 16 Jun 2025 01:22:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL8Jq66WMz30Vl;
	Mon, 16 Jun 2025 09:21:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749960225;
	cv=none; b=hnsviyUEB6tnLJuORlEprrT61lCYuqKn6haPDTXBGBKcc1fxPjuZNeTGKnD0ZzVNb4cfNuCr4qqD0nVctWCEkPDf5RdPWXoFBJaw2u0x0jaPbEg1jgQKbXDlM8YH3lSqeSgr/PWSoZDqBn1LbPqBgP+KFVdItdDtb4ZHyZfDyO588Pa6f0ES7xwEsTMgE6YsxKcN3JXF2jMp7Z32+RCEHdmJXMA/86O9p7G4j1ovtlr3FoEaTtV75OlYNVwg1ig6+k3umhX2KmKtjs3TBYaJf0kXcGJ/Z8aQPCJMfgaGcu78snK6bXptBBatfezfT2cfoYvnOTZQqkI1e8qHaf+Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749960225; c=relaxed/relaxed;
	bh=R4C7Q4t/AU34WzARp/njtbql1AFFLroVS9AUe++T/xw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezy2oQWaADLqTWj7vn4i2q503pQeezMP8thsSurYln6Fupp1BpLN2LsTz/05alYJH5cwhezapHDCkn8NmOK0O1KPeyrOojkDgY4OE4ZBwTjdSbWper6XgwX2lPuhN9+tNxvvgUZv/NZsgz5L0AUx62eHvesEMqbMELfl+iBBBRF+9OykVoduaCEF+cxjD8J9k0GIOui3MWetz7DsOYx06PE0+B5WTij+uMfyW/4vM02qemXckdhAJBWX8fqxQDp+KHkywbe8uZQNYzy6MPUKp+5QS0QgTfPql6D6c17hmVY6/yZBwWNzrUgIyumtrmb0g9xhMXxYG6FcU23pWy3OJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=cool_lee@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKfdD5r5Fz30WQ;
	Sun, 15 Jun 2025 14:03:44 +1000 (AEST)
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
Subject: [PATCH 5/8] mmc: sdhci-of-aspeed: Fix null pointer
Date: Sun, 15 Jun 2025 11:58:00 +0800
Message-ID: <20250615035803.3752235-6-cool_lee@aspeedtech.com>
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

Platform data might be null.

Signed-off-by: Cool Lee <cool_lee@aspeedtech.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 2bdd93a3f91f..22dde915e51b 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -241,7 +241,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	struct sdhci_pltfm_host *pltfm_host;
 	unsigned long parent, bus;
 	struct aspeed_sdhci *sdhci;
-	int div;
+	int div = 1;
 	u16 clk;
 
 	pltfm_host = sdhci_priv(host);
@@ -257,6 +257,9 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	if (WARN_ON(clock > host->max_clk))
 		clock = host->max_clk;
 
+	if (sdhci->pdata)
+		div = sdhci->pdata->clk_div_start;
+
 	/*
 	 * Regarding the AST2600:
 	 *
@@ -273,7 +276,7 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
 	 * supporting the value 0 in (EMMC12C[7:6], EMMC12C[15:8]), and capture
 	 * the 0-value capability in clk_div_start.
 	 */
-	for (div = sdhci->pdata->clk_div_start; div < 256; div *= 2) {
+	for (; div < 256; div *= 2) {
 		bus = parent / div;
 		if (bus <= clock)
 			break;
-- 
2.34.1


