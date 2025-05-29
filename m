Return-Path: <openbmc+bounces-103-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C47AC8735
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 06:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7qRY6MMFz2yhb;
	Fri, 30 May 2025 14:06:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748523620;
	cv=none; b=kivknYI6jvzj1n/o12XwnNSTeWCJeyTbhqEu37VirH+ScXQn6N08hATyzogcI8wTyZSj1S+ICSJJL9ymrLprES9og1+O1Dg2A2b10VKGgacrcQv/n5QC85oATZL5SimQXkjCwl1+5hsuPzkHwQwHfQ53tRWMr6tq029Cd24oSUOaHypmPgIKpo7qvXduoCUxztlJIGY+xdsEmt1ejH2DsmxWiXA/LvfqvayBm4WB6mn5GCcyN2iFszk61yob894TTiIbsit4qugCGg0Fy29SsuOLEfZNhvNk5388lzngpAf7xJJEqboecGAoMz2w6PkpBX6dhn6bdH5PAws8l3xQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748523620; c=relaxed/relaxed;
	bh=WPE7h8SihYSwUvVGcaz3/AkA8wVnF35lGJPPT/a2nOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nVQiIou+TIhun4eEyJHNtxVqwMD5YcqiJs86itHVmILKyLxyM8iZ9vB1Plj5UwF+577pKfbxtFwQ5fsLnKTAOUhjkwokEIilLmbvR7Bja5tkr6breWnv5nTNRxVYTCJvYOi5OvSg9ykDjaZb9TBt+GpYvuiC3MqAi43/1ZfC6xM6iWFoubSZvosTVpB5z+NAI17JQKHdyHIETe/Xg6FXxb8dnTqTDWTrFxDqdBQu87T8/3GSFSR9OtaeWVrdpuligWegZZ/i50tvj1vcqZ/ZwKB7DICv5SdQwmSuHgLDGVfetOfXsunxQzies+aEiQ/Hf0QKWJ/KcCdbhT93pnhrKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7RLB53w1z2xCC;
	Thu, 29 May 2025 23:00:18 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8BxnnNgWjhomCsCAQ--.52135S3;
	Thu, 29 May 2025 21:00:16 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMCx_cZcWjhomLP6AA--.61136S2;
	Thu, 29 May 2025 21:00:14 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 18/35] mmc: sdhci-of-aspeed: Drop the use of sdhci_pltfm_free()
Date: Thu, 29 May 2025 21:00:01 +0800
Message-ID: <39dcfd913bd2105674b8bbfe34cd2f27c92b3693.1748515612.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1748515612.git.zhoubinbin@loongson.cn>
References: <cover.1748515612.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMCx_cZcWjhomLP6AA--.61136S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw4Dtw13WF4kZry5tr1UArc_yoW8Xw4fpa
	9xJrWrKr47GFWrKrZ8J3Wqv3WUJw4a9ayxKrWUGw1kW3y3KFyYqFsrCFW8tFs5XFy0gw45
	XF17Jr48Ca98AabCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUm0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Gryq
	6s0DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IY
	c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
	6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r4UJVWxJr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07b3iihUUUUU=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the devm_mmc_alloc_host() helper is already in use,
sdhci_pltfm_free() is no longer needed.

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


