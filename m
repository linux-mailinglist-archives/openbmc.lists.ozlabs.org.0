Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530AA847B5
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYNs42zXkz3g0b
	for <lists+openbmc@lfdr.de>; Fri, 11 Apr 2025 01:24:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744298651;
	cv=none; b=YQc6ttcSsuYujtzrLcmr/qGljBsOV1xlJaKWoEmZchbjrBtWnMHxeodrAj8ZPk8na+KGRfOsPkpwGmfKgZU4JXTp7WvNmkoTKZF0kqbs5o/oQy+9y/teMPMKYb7chIp7doagfVo6ZGpRw1pLOZBHFYlM7IhEXCLhC7DRYsCjHbD45DYzUZGqyanDw33CxAdAjH5UxLUPBqeyt4FNsD2wNBGAfvxYqSlX6zG8Hn+tF+fjTKMTw4Gk2KT6cldwWOlTxaB2CU6yOsZlJPsc8d9+ZsN4sMARJxERbI+O1BkCRYnIJbvD6Fbyd7IrMttr8TKvP6/sW/9wciApmO9YI+63GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744298651; c=relaxed/relaxed;
	bh=ciTMixDWtrmvfuyXx2qtE4AIaIJcXyTH+sbQarjhKAM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b8sBYKOdlwiIM3SXBX7LKYdVLcvFYFObs0O5spDbyksit+tZw+y9a9T0xV0A60wcsKZGB93dDoCw13XnPlCnZliKdCxStRuoToCCTBYWjS+1wgcv5IYhzc7MvSLlSlz6AhZP+EZgyoIRe4bsTbScMByl6RjVqoFfCtnRblrcnTYWHe9ANQZgVI5GWiS5XdCvdOAlHE5MxAF+eB2hWgQzuCskR/N0xQDA86sWjLm+3JH9SyDV8OoQTR97iwNhZ71w8+zCiiwHY8R22IJV4h86r/s/vLyDF5FnFzvXLsvgBqvTUj2r3v/DT/kutpvkSdOiQwEXMJ4ld07XZIl1vyCJvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FU5djkx5; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FU5djkx5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYNrl6QLhz3cGb
	for <openbmc@lists.ozlabs.org>; Fri, 11 Apr 2025 01:24:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298648; x=1775834648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rmJxpqqkGXBWjcPvpAAKCZLWRdEQASHVQu+D1tpj9E=;
  b=FU5djkx5ldSqJnYMcsD+ObPmraY+5dXOzLmIQfFksvoz5EpJKKGzP+u1
   Xa7AkoHvuubsHsPJonw0FGcwXjgCg6JhraDzmAAQMoUg7P6V2LfyqNe9t
   HCbMPObzsdog5mMlBI6JBFJNF9ulOsh/u8FBR0+4IHHs6OBn/h1KE0UhI
   Gm7PW3NV3tX1Dj53i5Uugs8P2wEDdXCyeLHuTDGwj0eSOwHEeU+lqBenL
   fi0OCqjhvaLKNW9EcxQGgM6eTnYruKOww0iNSna6WbAIBX9+rhzDKf/x6
   yUD1JOcZW7O6bUhnS9THdxdz39yGthUfOxkFwkkSV8L5JRq7cbbGWTMi/
   g==;
X-CSE-ConnectionGUID: 1vCNeljETaK0GgGcvvb3Ww==
X-CSE-MsgGUID: P+tKvOwsQ22uF9Cmkxcddw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716298"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716298"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:56 -0700
X-CSE-ConnectionGUID: bC5JV7arSSy41yOILBG4rA==
X-CSE-MsgGUID: VvkIrii3SNinWOPC6+RzqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108199"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E87D411FB1F;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HOc3-30;
	Thu, 10 Apr 2025 18:22:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 2/3] hwrng: mtk - Add struct device pointer to device context struct
Date: Thu, 10 Apr 2025 18:22:38 +0300
Message-Id: <20250410152239.4146166-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
References: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Sean Wang <sean.wang@mediatek.com>, Tomer Maimon <tmaimon77@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tali Perry <tali.perry1@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Olivia Mackall <olivia@selenic.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a struct device pointer field to the device's context struct. This
makes using the unsigned long priv pointer in struct hwrng unnecessary, so
remove that one as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/char/hw_random/mtk-rng.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1e3048f2bb38..b7fa1bc1122b 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -36,6 +36,7 @@ struct mtk_rng {
 	void __iomem *base;
 	struct clk *clk;
 	struct hwrng rng;
+	struct device *dev;
 };
 
 static int mtk_rng_init(struct hwrng *rng)
@@ -85,7 +86,7 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	struct mtk_rng *priv = to_mtk_rng(rng);
 	int retval = 0;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(priv->dev);
 
 	while (max >= sizeof(u32)) {
 		if (!mtk_rng_wait_ready(rng, wait))
@@ -97,8 +98,8 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max -= sizeof(u32);
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(priv->dev);
+	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
 }
@@ -112,13 +113,13 @@ static int mtk_rng_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->dev = &pdev->dev;
 	priv->rng.name = pdev->name;
 #ifndef CONFIG_PM
 	priv->rng.init = mtk_rng_init;
 	priv->rng.cleanup = mtk_rng_cleanup;
 #endif
 	priv->rng.read = mtk_rng_read;
-	priv->rng.priv = (unsigned long)&pdev->dev;
 	priv->rng.quality = 900;
 
 	priv->clk = devm_clk_get(&pdev->dev, "rng");
-- 
2.39.5

