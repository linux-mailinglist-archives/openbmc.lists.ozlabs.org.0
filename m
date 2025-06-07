Return-Path: <openbmc+bounces-129-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C4AD10EE
	for <lists+openbmc@lfdr.de>; Sun,  8 Jun 2025 06:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bFMN66Bypz305n;
	Sun,  8 Jun 2025 14:22:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749281879;
	cv=none; b=mZLczYEIN6tCENXEnHFNgWYOjFWWhsWePHkTmvLSldAQ0J6b3JrzGuAaeNQP2ugR0aHOUm11rZ0N3CgWbZZ8ysNphzx04FGYEtYiJiFuSTG6USuexJer7iNluBckJ9cnQVuum6Jv7zvDGFsqjRnpZhHgUbBUVhcU/DD7DpQkqEXDX2al64Z7b3SX2TKttcX+m+jD4X8EyhOhLjOf3CMnlb38dn+Y7MTRYAQAkblq7b1YOlGwYbR21z1/ep7s2OKdf3xrjO/49H/33oz3/N6U2IbsYLjfCQTt1EYfeb8FhugKmY7O6eBJNpht6ihzuDKi60A639Jo67grECUhvxWEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749281879; c=relaxed/relaxed;
	bh=/s0UdGoTMbAabNd/DfguRvsdr3zu1m/YOmJRUZPLZXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnDxUyhC6ktHnYBk8OC9ng153EhhEEGJ69apPNQ1pKEWzQ28T8CKKaSPUv5qOQmtXy6RinjYt8uWVuEwtS1HawN9alxUWlVT7aqfEGg1G34PcYVCkmtIrBgWldipFF6F50rUM8MVON7zdjaR1cMHv901de3Xou1YR8beGCwutTP9SOHj8KbXYMb+kGZ3ZGGS++ehnImvHFAs27vLf52yMdbHVClacjveis1SWArZVRTXGVHptt04xnYwmGZeyVae5qoab1AbyLHVOVwkuhS264+VRlBR7qarLW2qqZtsE1JEuW6q6++1gg1nEeU/ugkKRh9buOXoj23aa5SdDWaP/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDqm63Ywyz2xnM
	for <openbmc@lists.ozlabs.org>; Sat,  7 Jun 2025 17:37:58 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxCGpU7ENodhYPAQ--.40997S3;
	Sat, 07 Jun 2025 15:37:56 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMDxvhtN7ENomp4OAQ--.58650S4;
	Sat, 07 Jun 2025 15:37:55 +0800 (CST)
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
Subject: [PATCH v3 16/35] mmc: sdhci-npcm: Drop the use of sdhci_pltfm_free()
Date: Sat,  7 Jun 2025 15:37:40 +0800
Message-ID: <08f9a1f6c2a1ad908baaf01623cd9670bf540aa3.1749127796.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1749127796.git.zhoubinbin@loongson.cn>
References: <cover.1749127796.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMDxvhtN7ENomp4OAQ--.58650S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4xuF4xWr17Kw4kCFyrXwc_yoW8XF13pF
	sxJFZIyryfGa1rG3y5Jw1DZFy5CrWSgayUKay8Gw10q39xKrW5trnIyFyUtFWrZFWUWF13
	CF4jqFWUuas8AFbCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVW8
	Xw0E3s1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y40E4IxF1VCIxcxG6Fyj6r4UJwCY1x0262kKe7AKxVWUAVWUtwCF04k2
	0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWDJVCq3wCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUYyMKtUUUUU==
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


