Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F0A83A4F
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 09:08:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZY9rR3BjVz3cZ6
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:08:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744268874;
	cv=none; b=BGXCLG71WLq+MUk6rNwm5+RJF6pz+61bNqWESBVwniHflfFBH1Ylv+uZKpqW6gY+9FHDbvUCOf5momPF1ka88CUWIISHXdWA18SZrxwVH6FL1bngrFWstEn75DUlkee/BFFEXDWgN8lTzQ/wVvywkpTzSGXDs9lY9GmCyC95pzvZbaF0rXWKxUSrRh53S5V5QyOwgHHQ3t/oE3O7UOiyxsfAc4vjXpxRJSPhSJRWyN5ECS4ECPzys5o3CU2vEZLa9NFFXEfIXTCRWrqBjnEYBqQPak2j1ams6ZPKG6xyFUaLGdCkLmLaqnlVbjt4FmX77dHJQeIiVSPCJDUqAEXjKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744268874; c=relaxed/relaxed;
	bh=6DooyLKKYj3wKO7vJaSrsdZC2t9Wx01KgJ5YQqX5GS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JTIOpXVQluPyMUac/mzywnQlxirAdkoNqNZFnnPfwiG2N8KfszzeEQ7BKuJsW1AFJSwUsjdYAt0S5WkDvgAqm35DQHX/jFweMx4J7okX1baGEOJWSpOjP9LNgoDtoEpevcy88/v7nRBeczSiNsXGz7vdW49uwI99+kK5aPKZMhulfOOacL59wddL9uSFoJ6Cb1TYRi2sxiT3347fOrmHB9NbNodjHnR53qSqbAx1w5uP6pr6uHYRdpDRkpXfI5HidG79bGe7HpBLx7TndIrp+y4zC8XKJWuIwy5xfzduwX3OF3ImBCRsLZRbyZbgkDYxbdQtSeMtqjN4QFUxbSH49w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YLMxFZul; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YLMxFZul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZY9r73Bygz3bm3
	for <openbmc@lists.ozlabs.org>; Thu, 10 Apr 2025 17:07:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268872; x=1775804872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eTuV2CyB5vjAJ0CZ1BcbW4eb89Fsn/ZCIyYBD5yo6Ow=;
  b=YLMxFZulE4v7EyfIi2Lh92KKQPdi82z1l9MASIJlyz5GFMkm79xFjhso
   hMZnHEC7zBSENmJI824k6ACMo/PjmtnJMKQYZv0S+u7U8Pao1owLo/b5o
   pf1hyS/LaV2HSH/BPYfIOGi9HffNDFLey5IG082RoRq3H5NkkRfuks9UD
   TNLTOgLCRNZtg1F3EmEuh5o2eW8w7XC+jk+Y1xncNTInuKlMJ0dDA7Zcj
   exSpiAHVPLP/xr2M5OAxpXpbGzD9kd8W1g+rsFaEdZPm/GTpnyhoeMuTH
   +kkiU1dvOlKNow4g11MBL0ZMQGxSBM/i3+LjllBF/X4EjtS/t6KPB8IsI
   A==;
X-CSE-ConnectionGUID: 0P8iX+5DR7637zrAvu+kAw==
X-CSE-MsgGUID: 2BSxPrD+Rrae0wgyaROMmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484818"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484818"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:40 -0700
X-CSE-ConnectionGUID: /9qgZoukRT2V3k+E473utg==
X-CSE-MsgGUID: eCd3L+qyRjqOTOU2EOJUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791505"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B0BBE1203B9;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQTF-2I;
	Thu, 10 Apr 2025 10:06:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device pointer
Date: Thu, 10 Apr 2025 10:06:23 +0300
Message-Id: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
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

Add a local variable for a struct device pointer instead of obtaining the
hwrng priv field and casting it as a struct device pointer whenever it's
needed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/char/hw_random/npcm-rng.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 9ff00f096f38..beec96391af7 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -54,10 +54,11 @@ static void npcm_rng_cleanup(struct hwrng *rng)
 static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
 	struct npcm_rng *priv = to_npcm_rng(rng);
+	struct device *dev = (struct device *)priv->rng.priv
 	int retval = 0;
 	int ready;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(dev);
 
 	while (max) {
 		if (wait) {
@@ -79,8 +80,8 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max--;
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 
 	return retval || !wait ? retval : -EIO;
 }
-- 
2.39.5

