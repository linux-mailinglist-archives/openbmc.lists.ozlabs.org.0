Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCEAA847B4
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:24:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYNrz4rD9z3frs
	for <lists+openbmc@lfdr.de>; Fri, 11 Apr 2025 01:24:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744298649;
	cv=none; b=brvnNyeShBEAQerZyAM4GjdzrprJG3QlF1nGoNXbnsGPmuqMMOIjvTzNsF7jzedjWrJHcLxSbcaAp6E72+aKOGarjTMC7CIrdLPIPlxFtBnlwsdrzDr6kHUnQPadYfRXupYu8EhKlzur8p4mAuOwAEN35rQ9wsxgwMfKjLECbIej9mLSZvUHhDimEL45EY5l+1efatPb/9cukRjJqqJNMIr1LBCeqdNxGKQTPXW1Cmm4Od9JiLWUbQF/hGoogvozd09HdtCg94rbkoQaqC6V1ymafF2yaZJO4eL4oU9YiyCjsOeKgzNqmcn16TSkvbsWnIgfkx7iWeG1Dx5uCqoRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744298649; c=relaxed/relaxed;
	bh=5hfVBN0wzaSeUQg5uDnoDTlQwoorDCBq715xUx2HVbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VA4/HtJA3bnLUZjKFw0mvSFgSR6OOrPm2ycfkO8sfJYh6nBl/yotMsggk9UfXu3iqh9I7K9VfiF/dj8a5664yJjw7SfegscdR525hbtIlnhCYBlQbr3bRi3X8jpW9jBvm6LkGLHfa8VGoBathpiYzdH4HohGhW6ea7wixZ5wOkxV/YAgKjjv6BzMcjmGS/Q7MtG2k33bfLt6L1AFMx3sA4rSqXMD2XVrVbe2J0zfGYEZi/xcIB0/cEWHpiOkXVoI8H/Us6d9JVszmYdZaeMSi9k92cHkMysO1tLhJgP11dJyKieltNJ+JU4wGveTbZvtQiqCPDDA4TJnsaMeRuN3fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LxgbJyBf; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LxgbJyBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYNrj6SVRz3bp7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Apr 2025 01:24:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298646; x=1775834646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2nEmXOWj61EFby8lltYJVgmKKKLIgiCDNpDNWcMK21o=;
  b=LxgbJyBfKKZ0gsYKO4sVeFvc8aaELbMLvBu4EKE/1e8GgQa2PpH06pza
   R3a05rbgXkB/5f+IhU8Xpye8+DQAAE9Bz8e0l4KLLHt5AfgjO5hPfQtvV
   cST13yCn7zQhBUglXyd/ADSonZWyoKyUVpMzWjnn4gMUnexd57Xw81Ksw
   ORMejFWeAVY5Tsqf2BWSFea4Y+hWpFoy9LgH0vb99eQ4oK4XFR2vq/08t
   dWTUKbt+HIFxVXL2Aupy74bjNfKX33PwVgwvl35USHbLTw7sxcvCDCRCD
   qJ2KdGIGztYJwFYKOAhKmdOeW+mEsEp4QBdrbg9BYPW8onv+yUwGV6q9v
   g==;
X-CSE-ConnectionGUID: vqYSdlQmTGe3LgqGLBO2Uw==
X-CSE-MsgGUID: H5HIRUesRQKKQzN7Fx4krg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716287"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716287"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:56 -0700
X-CSE-ConnectionGUID: xwrGhn4bQV2XQcBYOS31NQ==
X-CSE-MsgGUID: 7SLwaDhESOSRn2bA8q196Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108201"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E27B411FA2F;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HObz-2s;
	Thu, 10 Apr 2025 18:22:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 1/3] hwrng: atmel - Add struct device pointer to device context struct
Date: Thu, 10 Apr 2025 18:22:37 +0300
Message-Id: <20250410152239.4146166-2-sakari.ailus@linux.intel.com>
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
 drivers/char/hw_random/atmel-rng.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 143406bc6939..d2b00458761e 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -37,6 +37,7 @@ struct atmel_trng {
 	struct clk *clk;
 	void __iomem *base;
 	struct hwrng rng;
+	struct device *dev;
 	bool has_half_rate;
 };
 
@@ -59,9 +60,9 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	u32 *data = buf;
 	int ret;
 
-	ret = pm_runtime_get_sync((struct device *)trng->rng.priv);
+	ret = pm_runtime_get_sync(trng->dev);
 	if (ret < 0) {
-		pm_runtime_put_sync((struct device *)trng->rng.priv);
+		pm_runtime_put_sync(trng->dev);
 		return ret;
 	}
 
@@ -79,8 +80,8 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	ret = 4;
 
 out:
-	pm_runtime_mark_last_busy((struct device *)trng->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)trng->rng.priv);
+	pm_runtime_mark_last_busy(trng->dev);
+	pm_runtime_put_sync_autosuspend(trng->dev);
 	return ret;
 }
 
@@ -134,9 +135,9 @@ static int atmel_trng_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	trng->has_half_rate = data->has_half_rate;
+	trng->dev = &pdev->dev;
 	trng->rng.name = pdev->name;
 	trng->rng.read = atmel_trng_read;
-	trng->rng.priv = (unsigned long)&pdev->dev;
 	platform_set_drvdata(pdev, trng);
 
 #ifndef CONFIG_PM
-- 
2.39.5

