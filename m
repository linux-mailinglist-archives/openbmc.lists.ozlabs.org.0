Return-Path: <openbmc+bounces-64-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2DAC4596
	for <lists+openbmc@lfdr.de>; Tue, 27 May 2025 01:50:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5sv91w9dz2yGZ;
	Tue, 27 May 2025 09:49:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748239680;
	cv=none; b=cvWfE+0U+htDpQzN13VHQS9/wTnyWqUqLhI2XJgxN+81YyV/aDSHplwpyBXOsvheSzYRTu8qozR5jSu0QSwcYnklHR1mQzwntOt233solj3uEvNA4wJiAXT/nx5KHn9TRzUIIEFXqZBIPDFyBUFhpIRpiQjHE0efuEdnp1a3NitjV5qlJQXPDimgrucxz94c8NfLrJEkwvr8/9I5FxGftasvH1e2RNfAQB/m1KKv/mX234Ib/Bv2Qci5zwIqI1P5Ba7SLJ4tdW7DG4XJp3WYBuHnmz2STNgaoqDbB0MFceUYzrPXKLDr3irPn+WS7n4/3XcqC4njXoJf7g9oHqGT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748239680; c=relaxed/relaxed;
	bh=jieKD5whVjEFze7ksypEaPkc8cXZ5rK+Tg6DOtn3rpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYrSrHSmB02yzB4HuTKAEJbgFE5fwKfB1FXKoNrHGKTr0voRqxsZ1wpjF7Hg5/fU37+K7CKEIjczQ7xZRVtBexSd6IWKRQeuKmi1HhYhTjBMQVeQSf2/eKOepwmWZFmVDq4/uiCLPXrFIL/Bo7nQXdcoEP1lzw5vWHoo2F20QmWJz/PIXGs/5QGBojzmEMhj9wKF0FAvsioAYjEaeOIfY1uPzlpctcOGtxigVDiyKg/oFZfSG0rdz+fpM1Ct97uU+gHZO0wv/9KODz1iaN9o7JFsjODMD1RlWjgcui+SMedsBoasxFIK0ForJREHGcz7OkMMPMpZhynr5nIIs8/ouA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org) smtp.mailfrom=loongson.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=zhoubinbin@loongson.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 78 seconds by postgrey-1.37 at boromir; Mon, 26 May 2025 16:07:59 AEST
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5QKq2b7gz2xfR
	for <openbmc@lists.ozlabs.org>; Mon, 26 May 2025 16:07:59 +1000 (AEST)
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxmnHpBDRop4X8AA--.13576S3;
	Mon, 26 May 2025 14:06:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMDx_MTmBDRoQwTyAA--.30214S4;
	Mon, 26 May 2025 14:06:32 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-mmc@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 16/34] mmc: sdhci-npcm: Drop the use of sdhci_pltfm_free()
Date: Mon, 26 May 2025 14:06:20 +0800
Message-ID: <90cdcef16878a15f60283cdbc928554961fe54c7.1747792905.git.zhoubinbin@loongson.cn>
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
X-CM-TRANSID:qMiowMDx_MTmBDRoQwTyAA--.30214S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF4xuF4xWr17Kw4kCFyrXwc_yoW8XF13pF
	sxJFZIyryfGa1rG3y5Jw1DZFy5CrWSgayUKay8Gw10q39xKrW5trnIyFyUtFWrZFWUWF13
	CF4jqFWUuas8AFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2
	xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
	ZF0_GryDMcIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26w1j6s0DMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jsTmfUUUUU=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the devm_mmc_alloc_host() helper is already in
use, sdhci_pltfm_free() is no longer needed.

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


