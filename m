Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3289F95F2AC
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 15:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsrp45zBsz30VV
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 23:18:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724678282;
	cv=none; b=WMe7dE/DrCNDpzBvftqtqEFd4PWbm+ySaoxoHMcNX8bh7gWtwZ5LnOKyTMopNQKoHZG3X6rK3rQFUEDKpAAwWtm/czOOmUiqKRBe/oQaJTjPWIRiYtqOiy69c9odrbpYwOnp8hPEB4ltCUkNICqiz4f4XQ2EPrhm4GxHXs9b76Pcju85IRMTWKC8mKppsU6fJf+oBpyEaR+sz2QibCZmjkijaMPOK0DzhUSnGXFOisvvMXQUMPA9zeiRgLj5SrrKEoNYQpaqpV8L6NS+gmyai9RD8X1wsc5fu2chu/OaAGE0FY/8ZzzVLQkZInh4RzWcNiL3ff5sV/vmIQKON386Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724678282; c=relaxed/relaxed;
	bh=Xwr7lb51qtRZg96SThWQpi/dx4/CWFu2Tab+qaVE1zA=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=QLNQOJ5S3deB7jbJ/8zyS2zFZL6YjURqne55x8y4Ez59s7rs1f/lyWIGvJwzZshlLIa3701e5BEpBH1pY+9RCIH4O1TBf7kCTx2sj7VjOxECt8U4x53Ii4vp9VMu2atTB16K2UyYE4hqdHkmSc+i1RWw7r4R4f/v00VvI3WRyIF26x0Eb4TmsaLsQUf3W7cb7zZUW5yqQgFpIAQ4hFy9QiR4DzoABMNg2ciAaZ3riRM5PLOtV5Lxjz7RSbe57blavpVvmk2MYqjPUy+AIPV1udRYOW0JyHAa8F8WZJ7Z0NuVdJkn6JJwmp8GMzgTm0aZnCT6JUZe72WINTypIOVIHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsrp15yxsz2yDt
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 23:18:01 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WsrhL4CvRzQqj1;
	Mon, 26 Aug 2024 21:13:06 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 45A7B1401F0;
	Mon, 26 Aug 2024 21:17:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 21:17:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <j.neuschaefer@gmx.net>, <broonie@kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 2/2] spi: wpcm-fiu: Simplify with dev_err_probe()
Date: Mon, 26 Aug 2024 21:25:44 +0800
Message-ID: <20240826132544.3463616-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826132544.3463616-1-ruanjinjie@huawei.com>
References: <20240826132544.3463616-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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
Cc: ruanjinjie@huawei.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless error
is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/spi/spi-wpcm-fiu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
index 05c10b3e6515..a9aee2a6c7dc 100644
--- a/drivers/spi/spi-wpcm-fiu.c
+++ b/drivers/spi/spi-wpcm-fiu.c
@@ -449,10 +449,9 @@ static int wpcm_fiu_probe(struct platform_device *pdev)
 	fiu->dev = dev;
 
 	fiu->regs = devm_platform_ioremap_resource_byname(pdev, "control");
-	if (IS_ERR(fiu->regs)) {
-		dev_err(dev, "Failed to map registers\n");
-		return PTR_ERR(fiu->regs);
-	}
+	if (IS_ERR(fiu->regs))
+		return dev_err_probe(dev, PTR_ERR(fiu->regs),
+				     "Failed to map registers\n");
 
 	fiu->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(fiu->clk))
@@ -461,10 +460,9 @@ static int wpcm_fiu_probe(struct platform_device *pdev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
 	fiu->memory = devm_ioremap_resource(dev, res);
 	fiu->memory_size = min_t(size_t, resource_size(res), MAX_MEMORY_SIZE_TOTAL);
-	if (IS_ERR(fiu->memory)) {
-		dev_err(dev, "Failed to map flash memory window\n");
-		return PTR_ERR(fiu->memory);
-	}
+	if (IS_ERR(fiu->memory))
+		return dev_err_probe(dev, PTR_ERR(fiu->memory),
+			       "Failed to map flash memory window\n");
 
 	fiu->shm_regmap = syscon_regmap_lookup_by_phandle_optional(dev->of_node, "nuvoton,shm");
 
-- 
2.34.1

