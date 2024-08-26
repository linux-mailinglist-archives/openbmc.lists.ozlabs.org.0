Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719095F2B2
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 15:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsrp822v3z3c3n
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 23:18:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724678284;
	cv=none; b=XARQiAJD7tixlH2M3Crpc0smGGt+k8It4yg/4IOCTVJCwItROlULKrrXSa9RZaNvm3qX3TVoAdtphOaxQepisNersWz92cuxbjvleTmcbYMzeuyBawumcT/TjnaYCq62RWKNwUG7i9nIKooVyRFK6roYK+nI5ZVK+7pBcDcTXQyLGCIVFQHrljT+MVI5htyQZNkW1C9zExB6RZbby+WAiITY/WkILIGr+U6ZlMwpFO+uMAQSr317KK195bCLIY8FZMdvPdbfsVCLRUWjF/Vtt3WAG6EiaOgKPVCdBsCB97KyYLdVJkkRpFLcKlmVEMqQkmweZO1itapgr1fiynGjtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724678284; c=relaxed/relaxed;
	bh=FLgMPlT18vMHNwAJwa4QXxj7aZe8AMBSnrfdEkudAYE=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=O/usNOHmwImf9cD/7vM8MudD80mU1mf1J6NqaKv3a8brcCKWM0giM68ORlXn8EFq3PP1gIP8eVoObmm0vAhqPNglRN6q9cf4M9TrtTNMYUPb18GLEIk5g8I9d87AyY6diScbr69JCMzmYeMChLyaomSYaAiebJSdE4HZUbYBpwTTh4EVrKbQ+Wkns39gHf3P/lcqPZNFOyMRD9VSWfyMNDo3uLxK+QvQqBrfpMsIUx1Kq6FfTn+bYv/wmwnuUN2F7GzR9xXBbGB2mLAxEDytnquefm0RVwM6sDI0eaU4gdJRFcmj77r6yznddc4tK1VBiSSGPFgqynPwLBEQhVXNlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsrp36QJ1z2yVv
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 23:18:03 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Wsrld1FG8z1xvrl;
	Mon, 26 Aug 2024 21:15:57 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id EDC2C1402E1;
	Mon, 26 Aug 2024 21:17:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 26 Aug
 2024 21:17:53 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <j.neuschaefer@gmx.net>, <broonie@kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 1/2] spi: wpcm-fiu: Fix uninitialized res
Date: Mon, 26 Aug 2024 21:25:43 +0800
Message-ID: <20240826132544.3463616-2-ruanjinjie@huawei.com>
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

The second platform_get_resource_byname() can not be replaced with
devm_platform_ioremap_resource_byname(), because the intermediate "res"
is used by resource_size() later.

Fixes: 3bf2a5359b0b ("spi: wpcm-fiu: Use devm_platform_ioremap_resource_byname()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/spi/spi-wpcm-fiu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
index 47e485fd8f84..05c10b3e6515 100644
--- a/drivers/spi/spi-wpcm-fiu.c
+++ b/drivers/spi/spi-wpcm-fiu.c
@@ -458,7 +458,8 @@ static int wpcm_fiu_probe(struct platform_device *pdev)
 	if (IS_ERR(fiu->clk))
 		return PTR_ERR(fiu->clk);
 
-	fiu->memory = devm_platform_ioremap_resource_byname(pdev, "memory");
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
+	fiu->memory = devm_ioremap_resource(dev, res);
 	fiu->memory_size = min_t(size_t, resource_size(res), MAX_MEMORY_SIZE_TOTAL);
 	if (IS_ERR(fiu->memory)) {
 		dev_err(dev, "Failed to map flash memory window\n");
-- 
2.34.1

