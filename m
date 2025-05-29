Return-Path: <openbmc+bounces-105-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60949AC8737
	for <lists+openbmc@lfdr.de>; Fri, 30 May 2025 06:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7qRb48Y4z30BG;
	Fri, 30 May 2025 14:06:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748523673;
	cv=none; b=I2BrxQctQ9VMksX3PnNiUSeaiXbLk50iRvH1Z7dNO2mYZoSC490sO+Sx8QX9YHq2iBYhVUN6Srndp0kGn8jwRFwIQpJhyNMSe8NGbcRCiyzGD9yiE5kb+1x1dojLkO7vN32W2ecksNqcFULRU3aBsG6QqpiHg3bRMAy0WbOP9eYhxBWBLof0j5Fh/3G6CzVZIlE/lfWfuNlmArwCSoQzqHKkRXWYM0aNo6py+0YkZdGQNNFB7Gn/SYKYqxf5AkVZzUmglbiraTa7HZAC4hJkenU5At2LQexQ+bsCeHHnA+x1fCmlemcK2xOpr4kVM1KBgOcO2UN4RB4pNOpZZ1Fm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748523673; c=relaxed/relaxed;
	bh=/s0UdGoTMbAabNd/DfguRvsdr3zu1m/YOmJRUZPLZXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lo0YXjzfkARUw+AjJTkFgf/c56OarlMFm+Zv/EF24fuF79FwupYcnefJDpYAAksLNWcqGwuwcQan3NTwebDKUrowsZzm0yEaaA/bOjm0SAekqhG833kIEtY/RLs2EGWU9mtOwRLLGpFpmygzJcaUAt6CwMAcncAe+IhFdCwWBDlVjdPaAE7cxnkTYotEnJtZ3Vf9SIqXKRiYxTLUzl7Un2vk3n4GOir85GTFvSxURPHmM9WRr8a3Oj2SmAu77tSSb0nBU4NRdqia6EJh34uIgQgDwfTD4GUDyK7dBVcjiBAjz+ofjbq7KhV/z+HL8oB/aEsm5Fo8s2TEK36LOThb/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7RMD3mhNz2xCC
	for <openbmc@lists.ozlabs.org>; Thu, 29 May 2025 23:01:12 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8CxyuBRWjhoZisCAQ--.22258S3;
	Thu, 29 May 2025 21:00:01 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMBxb8dIWjhodrP6AA--.53585S4;
	Thu, 29 May 2025 21:00:00 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 16/35] mmc: sdhci-npcm: Drop the use of sdhci_pltfm_free()
Date: Thu, 29 May 2025 20:59:43 +0800
Message-ID: <bbe5c5f5770eb2ef8555cad20781980aff89e7aa.1748515612.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMBxb8dIWjhodrP6AA--.53585S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4xuF4xWr17Kw4kCFyrXwc_yoW8XF13pF
	sxJFZIyryfGa1rG3y5Jw1DZFy5CrWSgayUKay8Gw10q39xKrW5trnIyFyUtFWrZFWUWF13
	CF4jqFWUuas8AFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
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

Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: Patrick Venture <venture@google.com>
Cc: Nancy Yuen <yuenn@google.com>
Cc: Benjamin Fair <benjaminfair@google.com>
Cc: openbmc@lists.ozlabs.org
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mmc/host/sdhci-npcm.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/sdhci-npcm.c b/drivers/mmc/host/sdhci-npcm.c
index bee0585ba5c1..71b635dfdf1d 100644
--- a/drivers/mmc/host/sdhci-npcm.c
+++ b/drivers/mmc/host/sdhci-npcm.c
@@ -48,8 +48,7 @@ static int npcm_sdhci_probe(struct platform_device *pdev)
 
 	pltfm_host->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(pltfm_host->clk)) {
-		ret = PTR_ERR(pltfm_host->clk);
-		goto err_sdhci;
+		return PTR_ERR(pltfm_host->clk);
 	}
 
 	caps = sdhci_readl(host, SDHCI_CAPABILITIES);
@@ -58,17 +57,9 @@ static int npcm_sdhci_probe(struct platform_device *pdev)
 
 	ret = mmc_of_parse(host->mmc);
 	if (ret)
-		goto err_sdhci;
+		return ret;
 
-	ret = sdhci_add_host(host);
-	if (ret)
-		goto err_sdhci;
-
-	return 0;
-
-err_sdhci:
-	sdhci_pltfm_free(pdev);
-	return ret;
+	return sdhci_add_host(host);
 }
 
 static const struct of_device_id npcm_sdhci_of_match[] = {
-- 
2.47.1


