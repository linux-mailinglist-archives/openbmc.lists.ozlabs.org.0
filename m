Return-Path: <openbmc+bounces-310-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC79AF8A32
	for <lists+openbmc@lfdr.de>; Fri,  4 Jul 2025 09:55:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYQsj737Gz2xQ4;
	Fri,  4 Jul 2025 17:55:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751615721;
	cv=none; b=GrWaUtmxV3iYQ98sKdSPb5oJTyne05kUUMUASTBljXM9JSw9iAvehB5ZEB11icPvAnfYO8nHaTgWFcQ86fVADbI4BV7L0TqYA3bl/LaBeSUTm4p9duW9MDjM3GBkbODBvHYHBwqVkMN91++CX94xG2BUhobo6vcD93RQKSa4HiyZSIWCLn6teQKrvOs2WE7lyl0iDoSAU/VsGZ2LV7tDYVMOwHeUYhmVa8qHHSPBWObPxnJ7z4zaErdNqbMOfUaoh3l2ZyivWxput1vagt+3Rk8G06Ho15SsU/FbqcImmNtPV2n720eT8cGgyQaxVGCBLv8fH9C64HRnR6B0yQumHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751615721; c=relaxed/relaxed;
	bh=jpBAcyCN4P10EAu/CJbWGD95dsGLpgeNcWvqA8BQ/SE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DD3RSwKSjsmjbBr3Hx0grTM8za/keRHhr3JGwxYfA4mpQlkOGIOfHb3N6K5pUeK2ul9xHLYcmnnhzjWXHDQC0sZc5Yba86NLRbrszKUixgyxmYxOM6XFOlIuJLIgcDAxrNIwkg7BLc8mshUe2dWkStz5tW+RB3q8jTHKHJUSEcpsCoV7E/qQXOb0K7QbARoBU2xL/AaXXrxolzKWJL3CjGImeLmHe+TFuE1uSDbU29CffVConC8SQTa7X/EcJos/TM8nJeu3jhTCQLS9bUu2cFIBGuoTPFddduolyIejDTmw9BDY0I4sXhH/kE9n1LlYOyTgW1QxfD3x5osTv3jIGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ReLwTQng; dkim-atps=neutral; spf=none (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ReLwTQng;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 04 Jul 2025 17:55:19 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYQsg3LxDz2xHZ
	for <openbmc@lists.ozlabs.org>; Fri,  4 Jul 2025 17:55:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615719; x=1783151719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IxQt0PoKk8BTvmWimbOLB4rG5iTXBM6oigomry2CjPY=;
  b=ReLwTQngRWcsHntI8heUez1gpMSEg1fFl/sGPEdKWAQ90fm6ZOwzM15Y
   RfBzy33+GXw0w7uguJjSQkmWBTJy6nkJCL8XkOg5Qd6W2NIfMSJrNUHXY
   0eKFwPOlJeqNQFYwSNePO8ncIxH3lFBjk4UXMoss1DmqAk0EK8SexqTZ5
   Te7nIIvKmTI4qUjQudjDXen6Kdm63gy5lQgQIxThaOyKWbGDl1fULQC59
   FP4SGWYBdfZEjH+JSgkdirjtyITC6ZY0B9rP5oW59jXWabOVMimDuavlA
   j63yllggmFfWwGC9aegTwZxcYqNIMXO2UnBNA2zwXgSYzE3gmwAgjyxDa
   w==;
X-CSE-ConnectionGUID: waOreKT3ShioYipwncXzkA==
X-CSE-MsgGUID: 9JsLafqNTC2MFrBaXt3tCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494524"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:11 -0700
X-CSE-ConnectionGUID: TZWybnM3T2OaX6AYFlRSrA==
X-CSE-MsgGUID: EyGJEJv5SXuqPS0vZtHSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924166"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:02 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 18CED4445A;
	Fri,  4 Jul 2025 10:54:00 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Hadar Gat <hadar.gat@arm.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Marek Vasut <marex@denx.de>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 05/80] hwrng: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:59 +0300
Message-Id: <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
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
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/char/hw_random/atmel-rng.c     | 1 -
 drivers/char/hw_random/cctrng.c        | 1 -
 drivers/char/hw_random/mtk-rng.c       | 1 -
 drivers/char/hw_random/npcm-rng.c      | 1 -
 drivers/char/hw_random/omap3-rom-rng.c | 1 -
 drivers/char/hw_random/rockchip-rng.c  | 3 ---
 drivers/char/hw_random/stm32-rng.c     | 1 -
 7 files changed, 9 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index d2b00458761e..6ed24be3481d 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -80,7 +80,6 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	ret = 4;
 
 out:
-	pm_runtime_mark_last_busy(trng->dev);
 	pm_runtime_put_sync_autosuspend(trng->dev);
 	return ret;
 }
diff --git a/drivers/char/hw_random/cctrng.c b/drivers/char/hw_random/cctrng.c
index 4db198849695..a5be9258037f 100644
--- a/drivers/char/hw_random/cctrng.c
+++ b/drivers/char/hw_random/cctrng.c
@@ -98,7 +98,6 @@ static void cc_trng_pm_put_suspend(struct device *dev)
 {
 	int rc = 0;
 
-	pm_runtime_mark_last_busy(dev);
 	rc = pm_runtime_put_autosuspend(dev);
 	if (rc)
 		dev_err(dev, "pm_runtime_put_autosuspend returned %x\n", rc);
diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index b7fa1bc1122b..c89171df7635 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -98,7 +98,6 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max -= sizeof(u32);
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 3e308c890bd2..40d6e29dea03 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -80,7 +80,6 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max--;
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
diff --git a/drivers/char/hw_random/omap3-rom-rng.c b/drivers/char/hw_random/omap3-rom-rng.c
index 8064c792caf0..aa71f61c3dc9 100644
--- a/drivers/char/hw_random/omap3-rom-rng.c
+++ b/drivers/char/hw_random/omap3-rom-rng.c
@@ -56,7 +56,6 @@ static int omap3_rom_rng_read(struct hwrng *rng, void *data, size_t max, bool w)
 	else
 		r = 4;
 
-	pm_runtime_mark_last_busy(ddata->dev);
 	pm_runtime_put_autosuspend(ddata->dev);
 
 	return r;
diff --git a/drivers/char/hw_random/rockchip-rng.c b/drivers/char/hw_random/rockchip-rng.c
index fb4a30b95507..6e3ed4b85605 100644
--- a/drivers/char/hw_random/rockchip-rng.c
+++ b/drivers/char/hw_random/rockchip-rng.c
@@ -223,7 +223,6 @@ static int rk3568_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	/* Read random data stored in the registers */
 	memcpy_fromio(buf, rk_rng->base + TRNG_RNG_DOUT, to_read);
 out:
-	pm_runtime_mark_last_busy(rk_rng->dev);
 	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
@@ -263,7 +262,6 @@ static int rk3576_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	memcpy_fromio(buf, rk_rng->base + RKRNG_TRNG_DATA0, to_read);
 
 out:
-	pm_runtime_mark_last_busy(rk_rng->dev);
 	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
@@ -355,7 +353,6 @@ static int rk3588_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 	/* close the TRNG */
 	rk_rng_writel(rk_rng, TRNG_V1_CTRL_NOP, TRNG_V1_CTRL);
 
-	pm_runtime_mark_last_busy(rk_rng->dev);
 	pm_runtime_put_sync_autosuspend(rk_rng->dev);
 
 	return (ret < 0) ? ret : to_read;
diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 98edbe796bc5..9a8c00586ab0 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -255,7 +255,6 @@ static int stm32_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
 	}
 
 exit_rpm:
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_sync_autosuspend(priv->dev);
 
 	return retval || !wait ? retval : -EIO;
-- 
2.39.5


