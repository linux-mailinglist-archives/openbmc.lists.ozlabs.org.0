Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA6A83A4A
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 09:08:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZY9rM0CKkz3ftT
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:08:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744268872;
	cv=none; b=MsQES6tS+TaC4HSA4fxDbhAm0wIoDvSD/bXpabo+bcHBiRqjlV10oefoVhEcXFWwNTFP/VxwQzbGj2d3YDchPwvR7U2/w6j3/xNDJZ/vmSCyVnC7/lE6IzT/MAhmRu7e3SVVqwxIKAItY4EYIzbdIhaDvSa2cUim9Yz/hNweLj0EEJhZ2VsnV2ABxOnVjxlvrhR92oXHYebmBlxP1tvOne+2ZLrf/0lvXZdIjGlvpuuvQd0Fg39Nk9uJbF4XPYfNXbImTNmbYVyFEupL6lSRSoW3O/nscVbCIoGnV632KG8HHlBtRWm0abKlKVDEOJ1xI7dMWg4X9/YM1fha3HC0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744268872; c=relaxed/relaxed;
	bh=snR33B7zczTC3bN8IdXkOLcUmwroMI60wHKgyBtLUdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ChfaSqhx0u6WlD+FtkYi1Acd8B5i8+Scdi0l1h9UrutUZWMQVoQrLmeqbOkxxqIKEowIrXRB9yQg9vtX9nPnumIW+STy5zryLnz8TRiNENYdI/iWiMAtus78SnxJu3J/I6Y00nPrU48LImSpzEqS1dtjIF/4EOQbnYaOXyIVHWkMjf0Nc8io6sXPPvzE+5QrCsQf1oC4GPMSvgapxGZjJwaqfi8xqxdxyWzaBjPlUFVrFZrp9ZlPJ4u1lYPTOJaTBqIfJHpg2WrejnMXlzYf83oEwAP5csCBQI2xByFndSepGDSTzzBXjIe2d+5hsfZaIyKHcIhAsfuYiHac6yQExQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UmSZpYxL; dkim-atps=neutral; spf=none (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UmSZpYxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZY9r70wnFz3blk
	for <openbmc@lists.ozlabs.org>; Thu, 10 Apr 2025 17:07:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268871; x=1775804871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BwgGI6MZYv2vNydtUJb8sY2UgwkVT1/xfezAVPOvL2k=;
  b=UmSZpYxLABp7CyKm7V3qHluazysSgcBdmndEZIgBUjs/sRj+1AHfiNiI
   Cf9IqGSLFYb/U57ucpK1+BTVJttzWYtM6hj49fV0ARnbF0AIFhmlHyuB4
   +kGHL3TqgmGt6lH808ukwrgbNqPR5607u4lNffKC2O7h/2EfbemOp+qZz
   YL37V/LFmCrIKEqdLFaGiTqBN9rVLX+MNR8DPrz5hJb/Qr9qcLaWbX48Y
   LS9mDFjCM5/r7J2Ub93o+gzBY23NG8lAcamWBhzKT5nRy0k9dPlY1qSHJ
   go3W2NYzrXK/RdCYlR7+ov0tBA4Eo7qXFqCQ9uJyQ3pgLOsyF/uhR4oWn
   g==;
X-CSE-ConnectionGUID: /iizzi+yS1CsMtUyLoebHw==
X-CSE-MsgGUID: qKLF1+B7TdurfjGjRaRa/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484808"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:40 -0700
X-CSE-ConnectionGUID: dc0X+vL2S5ioxsxxRhI0SA==
X-CSE-MsgGUID: 4vsCeVDXRH+kGFuW1sc24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791503"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A9DBE11FA2C;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQT3-20;
	Thu, 10 Apr 2025 10:06:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 0/3] Use a local device pointer for hwrng drivers instead of casting constantly
Date: Thu, 10 Apr 2025 10:06:20 +0300
Message-Id: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
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

Hi folks,

Clean up random number reading by adding a local shorthand variable for a
struct device pointer used on multiple Runtime PM functions. The changes
are very similar in all three drivers.

Sakari Ailus (3):
  hwrng: atmel - Add a local variable for struct device pointer
  hwrng: mtk - Add a local variable for struct device pointer
  hwrng: npcm - Add a local variable for struct device pointer

 drivers/char/hw_random/atmel-rng.c | 9 +++++----
 drivers/char/hw_random/mtk-rng.c   | 7 ++++---
 drivers/char/hw_random/npcm-rng.c  | 7 ++++---
 3 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.39.5

