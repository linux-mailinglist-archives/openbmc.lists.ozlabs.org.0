Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A929A847B2
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:24:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYNrt4q06z3fSn
	for <lists+openbmc@lfdr.de>; Fri, 11 Apr 2025 01:24:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744298649;
	cv=none; b=JpJ/CMzwNR+cdTVhULjCncPRxOQp2HwsWTC/HaXzTrTNj+mayecpxBAzf4AVl4NTJDdpKPWM0lY4Ccq9oVAKD5A/qdefY5Gwg/E/gSF4p4y4VOYG0NaXp7oN9NwU73ewx2+NLMad/QQ1AkiRvDBVYMB/TFUOaxSy1x22teKVBNq1sl9KzQ08QzPVW2sFZI8cWwj9Hw49qyFQM58DZwNkt+9d62W/lphwrSGh6OAo2rd5t2R0Z90i+KXD8jU+yEtLMhUoSHlJ8Fjkt2y0O2+UAvdt5QHYKlFl15W4oKWfKfUhcPEZ8nqQ6lc2NWQtb7ppdqo75keYJT8ykV0qF2P1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744298649; c=relaxed/relaxed;
	bh=k7hmDPcJtVnNvWJU40XvuloBaC9FfHDf4pXbcMxM9Jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LHUNsPiI3EJgJYxAVBKjhc9WvVYTdvdUqIPyXXd+/Q60soCkrj+SCQHUqvAxSdqrvXyRPo7MLrWAd2HLAFnufOXc1xvn+qdPMG436UumY5/01t2JbCWd38lYmf+wGIDn4xcUL31U+z28KfVi8f4COtzpwVSK59Ph1qrSivNJs87GECBBwNP1vXLkWOBRBHBmjfUtco7tHSEmipk2S2PwpG3yf4MdJJUx55PVTAqdLOm+FipZCVqkP9BRCLieQWkxW/emjuaZ+xBqGgwSmlEzMfCLTnNY1ukAIgZZzbVeAMfTS+aB5jSqLUIsNYyPzb5NtRYA5Ti5PCwvrzXI13V0rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMTqoldw; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMTqoldw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYNrj4pFjz3bm7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Apr 2025 01:24:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298646; x=1775834646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Y6uk1OKDMurXHr6lYHInLtlxGOoJuYbcOgABgCGhk4=;
  b=IMTqoldw3nj9KTVhwzDCXxGgrtVhqFxNRr0bbm0i/1q0iKkemmpqwx3M
   icudm0pL54kglmZ/jFgK1tC/3AUAAe0hQB1Lfk0ZyKd1ZC50wkVpPm3V+
   JIbWJAcJjzi9HNdZa0Nj58cIs0oLrgYWTJndfIpUcCQvbgRm5P4UOAotY
   JOBMKCOCb5W54HK+uAaQ3j2kRCf9srJ5PW8SfJ7uaveWkbQsanFqbhyVV
   7Ohf5BcQQ+YaWj7nGtmMHHqLX51u1DNDm5X4YzAboRFdugsg993I4vnQT
   D7d5vRsibxta34bty9uHW7UkA3CxREGEeTT3+N8dgsxQOp4ztB+V2vCph
   A==;
X-CSE-ConnectionGUID: AQJcpc+iRbC+2GVpUT8RZA==
X-CSE-MsgGUID: wqAsIQDlQ2+S1zcQMksYmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716279"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716279"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:56 -0700
X-CSE-ConnectionGUID: lXZBb65zRtqhhZOoXu2Bbg==
X-CSE-MsgGUID: EKcd0ndITDqagjO31fW8Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108197"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EC2AF1203B9;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HOc9-35;
	Thu, 10 Apr 2025 18:22:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 3/3] hwrng: npcm - Add struct device pointer to device context struct
Date: Thu, 10 Apr 2025 18:22:39 +0300
Message-Id: <20250410152239.4146166-4-sakari.ailus@linux.intel.com>
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
 drivers/char/hw_random/npcm-rng.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 9ff00f096f38..3e308c890bd2 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -32,6 +32,7 @@
 struct npcm_rng {
 	void __iomem *base;
 	struct hwrng rng;
+	struct device *dev;
 	u32 clkp;
 };
 
@@ -57,7 +58,7 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	int retval = 0;
 	int ready;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(priv->dev);
 
 	while (max) {
 		if (wait) {
@@ -79,8 +80,8 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max--;
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(priv->dev);
+	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
 }
@@ -109,7 +110,7 @@ static int npcm_rng_probe(struct platform_device *pdev)
 #endif
 	priv->rng.name = pdev->name;
 	priv->rng.read = npcm_rng_read;
-	priv->rng.priv = (unsigned long)&pdev->dev;
+	priv->dev = &pdev->dev;
 	priv->clkp = (u32)(uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	writel(NPCM_RNG_M1ROSEL, priv->base + NPCM_RNGMODE_REG);
-- 
2.39.5

