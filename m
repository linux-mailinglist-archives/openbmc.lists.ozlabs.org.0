Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D23A83A44
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 09:08:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZY9rB3dc1z3cVY
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:07:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744268870;
	cv=none; b=WtIdlsGwvy53p8R3Nyu05RdSM2hj7tRDGgYNbziyBwCbCx3+sKvgb1o9G9wD8/uVccM3PAXdwu6oGVCPzSkVGul/F9uE1r6IYxNNLFZOKlhHTFv5pJkN7zcYNdCjzIVTK4BvGJ/xosgIl4O4x5A5ePGYI/nintPi3TKHD/M+qWvXXjArNuQ/IQPAx0i4OEcGKs+VFz0ikMPVGBzwsB8Tjy6vN5P3w8APC4Y+UpSPReBfhWldnkNpo5EIp4NmTbWH1OqtwAW3OGQZ4uZj5D6gwCs9oQmEbrwiqjO/F+iqxzcTTqJejHEZd0W3jza3EbzTQleYjp8RmaGjKo/8U6J5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744268870; c=relaxed/relaxed;
	bh=vyRnA4Q+yFbS2ZBT7zMPT+jHN8phVJhU2QuGyNS6f34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QUTqcbR2I7wbTTgt5j1mIup0/Eo4YVs2BoumIIX9Zh66a4vU+wLVicF/H0AYkZi8OQC3k4lPFNyY2dTNQAPxDNlNKBfB1vYGlZnzAWYVpyXG/nY+eJidj01EiAnXo+2yBfPnJo7PI7Gc+htXMoH56K9qAtfgTzgWu9k15g9vUViMgTJBTEsq5osRt4bY3HCfzOVjM9hBRRGY2JqoywQUSaRaNIaDVjQPRpduuq9U1z66yf8qU3PmxHA8P2ddkluJwrDrLsFt84CR3XTQ2HXS7GtaBl5+BRSfJzmQEeo49xBHMNzh05z+w/Nub8DcW+6+QZjkNyHayc8aWmdid2iH4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RCmryPUs; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RCmryPUs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 10 Apr 2025 17:07:48 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZY9r40CMpz2ySc
	for <openbmc@lists.ozlabs.org>; Thu, 10 Apr 2025 17:07:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268868; x=1775804868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eVtQY8JBtI7OBFxIa1E1PA3pS0GE/8DYWFULSp6JaHg=;
  b=RCmryPUs22LVMoTr4+huvoDBSzgtYAuFSgFn76LS4yl89b/IB5X9TGDj
   qJJhOpDAVd9mdmIn0LFvQ2ZQ36DNztjjDf+Zq5kplzI7oxNgI7KVPzcoL
   YYQRik8YUrAYu8bJHCzXWNiUWLGnUnHYTt1GZQQh5616Md6KTdRTJWWCu
   zky+dZp4RAbalXyEKFaEAN84s5od4fXF/Y2IlcUFanRnUQPGI872L36bU
   hoJERSf6Ym3Z2ntD7UqFCdZqP7HTVsLOjUjdugzuMzRBiUrqa+nc2bmsr
   gxq8y51TWJVUSkI+RSBUIJPK8qxCoePKU63cqZUoQDtDjD4uNdWpnyn0U
   w==;
X-CSE-ConnectionGUID: ffzuthswT6ysG73CAQX0NA==
X-CSE-MsgGUID: ockwFiNmT9qyk6/dsVaPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484788"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484788"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:39 -0700
X-CSE-ConnectionGUID: kVTH2jZVTbeS/zX/rcXnvA==
X-CSE-MsgGUID: BorZ3DaiT8GsjoUcY7tKvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791501"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AAD2D11FA2F;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQT7-28;
	Thu, 10 Apr 2025 10:06:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 1/3] hwrng: atmel - Add a local variable for struct device pointer
Date: Thu, 10 Apr 2025 10:06:21 +0300
Message-Id: <20250410070623.3676647-2-sakari.ailus@linux.intel.com>
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
 drivers/char/hw_random/atmel-rng.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 143406bc6939..5192c39ebaeb 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -56,12 +56,13 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 			   bool wait)
 {
 	struct atmel_trng *trng = container_of(rng, struct atmel_trng, rng);
+	struct device *dev = (struct device *)trng->rng.priv;
 	u32 *data = buf;
 	int ret;
 
-	ret = pm_runtime_get_sync((struct device *)trng->rng.priv);
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		pm_runtime_put_sync((struct device *)trng->rng.priv);
+		pm_runtime_put_sync(dev);
 		return ret;
 	}
 
@@ -79,8 +80,8 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
 	ret = 4;
 
 out:
-	pm_runtime_mark_last_busy((struct device *)trng->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)trng->rng.priv);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 	return ret;
 }
 
-- 
2.39.5

