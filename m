Return-Path: <openbmc+bounces-65-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2718AC459C
	for <lists+openbmc@lfdr.de>; Tue, 27 May 2025 01:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5t2M5t0hz2yF0;
	Tue, 27 May 2025 09:56:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748239681;
	cv=none; b=BqpoPnzgBmn3py2yX+jWw5uzdqJPEV14WLVouuxxGn9NXW1Z2+K/5uHRMTGUhMQ+SXZN2p1mReG1UN6E7fJdk0bILEVlFOHpCRFxNVRjnbve46EHH6u0x7oi3hsZWVv6jqFcwwR0StnORV5qErWCn1pcqyDpudEDObIV8GowbBiKvgZx20RYwu5tvwb1NBUy4M/OXc2nqiM55TmZTO3mJAhLiZELmONMBWzpTVYYCiPZSIB0u7TmqvKu1sHFvcjqNbakAIF1w3SfyXc1wpcbqAfxWH0vQKSPaTf1whHDwSuCWMgJvGnWDMg9QbZtJnn8Od25WdVLsN59vu84sv5Pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748239681; c=relaxed/relaxed;
	bh=Ha1Gpc6VX8YaJYKl7MSWWB7wR2LzilH6yf28zj2SPTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPkex2Us+AfHg9lOTX4hVCgthfb1HZZkFdoZGR+zsyozA+ggU/QpuC3cPePeB1T3T/cZDtwyCrbcIglQI+tRiG7hU5Lm1eVZCOFfYmL4kNE8Q3W1JQPBq8ZhtlYyL3ZlWLkVBei0EDvbADlwnKaEv+EuiSk67aA2uJ2o9u/KL8bPpwnRAmCGX986nK1uNqK2IRz3BFPft2aM9C3qTiCRge/ZSDRrrYr29GGKz34GRFBKchxKbopLE4A1vUHm5qHqKxzqTLFg7nDgJMqEWT7lhYdO1zyz3pacDxW8nzHQkDjNkR0DZaDwckz8fx+Tl9Y2d6ZHVoEBsCjyB+e0LF9xlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 71 seconds by postgrey-1.37 at boromir; Mon, 26 May 2025 16:08:00 AEST
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5QKr0gXcz2xgQ;
	Mon, 26 May 2025 16:07:59 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxmnH1BDRouoX8AA--.13577S3;
	Mon, 26 May 2025 14:06:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMAxj8XyBDRoXATyAA--.34620S2;
	Mon, 26 May 2025 14:06:43 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 18/34] mmc: sdhci-of-aspeed: Drop the use of sdhci_pltfm_free()
Date: Mon, 26 May 2025 14:06:32 +0800
Message-ID: <dfc7e01a6134e421ae3aa8da3221f67d59706d0d.1747792905.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747792905.git.zhoubinbin@loongson.cn>
References: <cover.1747792905.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMAxj8XyBDRoXATyAA--.34620S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw4Dtw13WF4kZry5tr1UArc_yoW8Xw4fpa
	9xJrWrKr47GFWrKrZ8J3Wqv3WUJw4a9ayxKrWUGw1kW3y3KFyYqFsrCFW8tFs5XFy0gw45
	XF17Jr48Ca98AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUm2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	ZF0_GryDMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bOfHUUUUUU=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the devm_mmc_alloc_host() helper is already in
use, sdhci_pltfm_free() is no longer needed.

Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: openbmc@lists.ozlabs.org
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index d6de010551b9..ca97b01996b1 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -425,10 +425,8 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 		return PTR_ERR(pltfm_host->clk);
 
 	ret = clk_prepare_enable(pltfm_host->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "Unable to enable SDIO clock\n");
-		goto err_pltfm_free;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Unable to enable SDIO clock\n");
 
 	ret = mmc_of_parse(host->mmc);
 	if (ret)
@@ -445,8 +443,6 @@ static int aspeed_sdhci_probe(struct platform_device *pdev)
 
 err_sdhci_add:
 	clk_disable_unprepare(pltfm_host->clk);
-err_pltfm_free:
-	sdhci_pltfm_free(pdev);
 	return ret;
 }
 
@@ -461,8 +457,6 @@ static void aspeed_sdhci_remove(struct platform_device *pdev)
 	sdhci_remove_host(host, 0);
 
 	clk_disable_unprepare(pltfm_host->clk);
-
-	sdhci_pltfm_free(pdev);
 }
 
 static const struct aspeed_sdhci_pdata ast2400_sdhci_pdata = {
-- 
2.47.1


