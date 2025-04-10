Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0CA83A46
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 09:08:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZY9rH00YBz3fSs
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:07:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744268870;
	cv=none; b=cH/jpJF/CXIH7e7ppLZOKpFxemv3HfE3A74rrcMfpCjs+DRJNMkabehSHGGWhSmtUhicULMD13tDgwgZbF+LBO3NYJ9j0eewpxjW9SxiPzy67ah3goBEClozV2uw29MesKcjyFNCTLXVnVDId+VAirDlsHM/CxsTAitX9LtirhTv7pRCj8qJXXpl4HYkerlhM8XgBUZkH2iTdSkeX1Idxn5+BLCBed9smqHavSGvpDpS2wZMvb7DPyHIeu3MaMX9jpuBljbyExa9umJy+zcwVjvyarexnwAJUo4xfYGWD+5vzNjsBYzhDZh1I3MdDMOpaYwMT/MDqmXX5ei2zkyHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744268870; c=relaxed/relaxed;
	bh=jfUlxwjGKe77HUkBbiN8Rkt83wqiY42TkZNrzsfTj9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JA4XoNFlQRuiP+up02Bu3TWdDEc6zDc42lCqWkHMcawZyS4DfPsxmw9ZeIfPFPGWPGk2dTwVgsgwINZaQdMchFOb2GhcuSHV60bu5/x6XyhqypMCqrpkiQbwbNu3uRCqjunRt44SN9LoFrDIHKzhNOSuSYXNasHHR1qBxq5owi0/InkRm09ufxp1tx7G7Rl5s7IfLKF1uqwbsMgsAE1gGJYAXq0YqeCkL9RFHzlrG2Lb++yYQKhFe6SC1YdlLe48N7UCcjYVUCwHmHIqiS1ZjYINb4g8k/1mES4KCAqQFFJY75RVCUl0TDHMsdRq4zx+53VMtv1RKTJrIIAHtGCJqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iHdXb3ez; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iHdXb3ez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZY9r60YB7z3blk
	for <openbmc@lists.ozlabs.org>; Thu, 10 Apr 2025 17:07:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268870; x=1775804870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TE7iAMTJLA59sZpWYVqvYbWng+qFOuV9FpYpZVf3SEg=;
  b=iHdXb3ezqGLnUtyNp67kw7hd/pBFZAhr4ay6bC6bk2aNPH1NnCmP6zAV
   akziSOC7mRRKdHHBLB7ZCyJ0QzoJptPZqBj3kox3Tf1mqypN+KMNKa/cR
   paovKQWSp/90rQKJ4hmdYV9iS2GNzATfDVrWsvDUYiUd8YuMYkc/U7CaB
   IvOUnPmuoGY78PWGuwbS14GHpj0Wc59oGoyluJTr9Xrt/Ag0aWSyJbzmt
   t2frYA8M+RFQCnR1OcaHGYMvRhRg83NNcwGG/CfJZASD0G1hEZH3GHN34
   mJbmyBjy1U/CaxIneRlRE7xy7MDdKx6KnrdnREMcEdurOg2JE18axl41z
   g==;
X-CSE-ConnectionGUID: st1tbPJ8Sr23r+WK94tzwQ==
X-CSE-MsgGUID: TrNm+3QgSmugCcYPY+0liA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484799"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:39 -0700
X-CSE-ConnectionGUID: jcRV1cD5T0GwUaoEVA8YeA==
X-CSE-MsgGUID: RLnB8c7VT5SfdPnsXZyizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791502"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ACEFF11FB1F;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQTB-2E;
	Thu, 10 Apr 2025 10:06:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 2/3] hwrng: mtk - Add a local variable for struct device pointer
Date: Thu, 10 Apr 2025 10:06:22 +0300
Message-Id: <20250410070623.3676647-3-sakari.ailus@linux.intel.com>
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
 drivers/char/hw_random/mtk-rng.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 1e3048f2bb38..38e57900080a 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -83,9 +83,10 @@ static bool mtk_rng_wait_ready(struct hwrng *rng, bool wait)
 static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
 	struct mtk_rng *priv = to_mtk_rng(rng);
+	struct device *dev = (struct device *)priv->rng.priv;
 	int retval = 0;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(dev);
 
 	while (max >= sizeof(u32)) {
 		if (!mtk_rng_wait_ready(rng, wait))
@@ -97,8 +98,8 @@ static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max -= sizeof(u32);
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 
 	return retval || !wait ? retval : -EIO;
 }
-- 
2.39.5

