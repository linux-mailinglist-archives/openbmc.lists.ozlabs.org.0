Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A750885AE64
	for <lists+openbmc@lfdr.de>; Mon, 19 Feb 2024 23:28:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SXF2lZu9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdxyH3QPGz3cSL
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 09:28:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SXF2lZu9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+forbidden405.outlook.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbByB5hgTz2xHb;
	Thu, 15 Feb 2024 22:03:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 048096130A;
	Thu, 15 Feb 2024 11:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6C0BC43601;
	Thu, 15 Feb 2024 11:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707995023;
	bh=n4py1EhWX0oNnPUMNmVfMXX4K5sOwffFDxOi1Kexbgo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=SXF2lZu9vYOX3WZwI3h4qQrc0Z36NPKcn98kEN8vWKLJMJDF3RogWv+WYQHbi2Oaj
	 QDQYoMg/LnnfOqEEGSKPP03KmHAjJ8ndcrcefAwVTPNC4LUx0J45lzjWtDXhUYxtTd
	 k6CxuBA17RtYyJF1LfFTD9LoVYMYprupQl1oWZdg/HI/pJAblbeG/DtgNeRAckKiV/
	 E/M4HWzha5whRrNp2GLM2gf9HKlQ/qO//6V2KO8ok15upOBszzEDJ12BQpc5i1W+m8
	 O1h2MhrSVzuqOoths9PjtsTX9DsXsSrutOInJCB+6MuxWGExrstBHTibKxTlTc6+/0
	 3oWXi9mkxlE1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFAAC4829E;
	Thu, 15 Feb 2024 11:03:43 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Date: Thu, 15 Feb 2024 19:03:38 +0800
Subject: [PATCH] mmc: host: replace 1st argument to struct device * for
 mmc_of_parse_clk_phase()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
X-B4-Tracking: v=1; b=H4sIAInvzWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDI0NT3dzc5PiCjMTiVF0js1QLU1NDQyML0xQloPqCotS0zAqwWdGxtbU
 A1mWPUlsAAAA=
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707995023; l=2554;
 i=forbidden405@outlook.com; s=20230724; h=from:subject:message-id;
 bh=E8eEoUOznWoG1XHCuFnDDwgMO4G3lT0ppUfJJ7smvRQ=;
 b=L5KCIMmpyT/8YxYu5mHnK+ltMpGOyE3LWJytG6jl/UKpRQXxOmnVMJ5QsFQMj8EAw44T65kRA
 8xuTe6TaDO5At8ix6sd4Zmcy94iE3yft9C1kkFFb3tLRJawGvXxwWzL
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=qOD5jhp891/Xzc+H/PZ8LWVSWE3O/XCQnAg+5vdU2IU=
X-Endpoint-Received:  by B4 Relay for forbidden405@outlook.com/20230724 with auth_id=67
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
X-Mailman-Approved-At: Tue, 20 Feb 2024 09:27:24 +1100
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
Reply-To: forbidden405@outlook.com
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Yang Xiwen <forbidden405@outlook.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Xiwen <forbidden405@outlook.com>

Parsing dt usaully happens very early, sometimes even bofore struct
mmc_host is allocated (e.g. dw_mci_probe() and dw_mci_parse_dt() in
dw_mmc.c). Looking at the source of mmc_of_parse_clk_phase(), it's
actually not mandatory to have a initialized mmc_host first, instead we
can pass struct device * to it directly.

Also fix the only current user (sdhci-of-aspeed.c).

Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
 drivers/mmc/core/host.c            | 4 +---
 drivers/mmc/host/sdhci-of-aspeed.c | 2 +-
 include/linux/mmc/host.h           | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index cf396e8f34e9..8b2844ac5dc5 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -234,10 +234,8 @@ static void mmc_of_parse_timing_phase(struct device *dev, const char *prop,
 }
 
 void
-mmc_of_parse_clk_phase(struct mmc_host *host, struct mmc_clk_phase_map *map)
+mmc_of_parse_clk_phase(struct device *dev, struct mmc_clk_phase_map *map)
 {
-	struct device *dev = host->parent;
-
 	mmc_of_parse_timing_phase(dev, "clk-phase-legacy",
 				  &map->phase[MMC_TIMING_LEGACY]);
 	mmc_of_parse_timing_phase(dev, "clk-phase-mmc-hs",
diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index 42d54532cabe..430c1f90037b 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -435,7 +435,7 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 		goto err_sdhci_add;
 
 	if (dev->phase_desc)
-		mmc_of_parse_clk_phase(host->mmc, &dev->phase_map);
+		mmc_of_parse_clk_phase(&pdev->dev, &dev->phase_map);
 
 	ret = sdhci_add_host(host);
 	if (ret)
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 2f445c651742..5894bf912f7b 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -539,7 +539,7 @@ struct mmc_host *devm_mmc_alloc_host(struct device *dev, int extra);
 int mmc_add_host(struct mmc_host *);
 void mmc_remove_host(struct mmc_host *);
 void mmc_free_host(struct mmc_host *);
-void mmc_of_parse_clk_phase(struct mmc_host *host,
+void mmc_of_parse_clk_phase(struct device *dev,
 			    struct mmc_clk_phase_map *map);
 int mmc_of_parse(struct mmc_host *host);
 int mmc_of_parse_voltage(struct mmc_host *host, u32 *mask);

---
base-commit: 9d64bf433c53cab2f48a3fff7a1f2a696bc5229a
change-id: 20240215-mmc_phase-26e85511285d

Best regards,
-- 
Yang Xiwen <forbidden405@outlook.com>

