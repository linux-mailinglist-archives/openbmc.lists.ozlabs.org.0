Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFF3A847B1
	for <lists+openbmc@lfdr.de>; Thu, 10 Apr 2025 17:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYNrm5XKnz3cXD
	for <lists+openbmc@lfdr.de>; Fri, 11 Apr 2025 01:24:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744298645;
	cv=none; b=gNRqwjEWtdvSEnnGMbR3+cSg8FnIc6uGP7rsJRIgabVgo2yUZQrhPC7ZLJefaVdEDef4kzFeLyE3SR8k1s07XCxw26p8NAwNdnW9tQMmeh55VzPDLKEEx/YIlehXS1XazEtYA9rs5QyhN36NTNw0IFMJONbbL9+NH3mOZogEMwygWI+NnCefGt6sRpQ8UWvAxWk9PgwebzCcPqRNSlPy5hT1ke123cdkiRByrPJbMlgQmXoFmy0IJrm0dIb0YLX6CWE4hFh42ayfxUHb+vSivLd9SIwQmtK53c36ipcKTD1mDU/fRFGrjIoUlNW/GEqkhQkPk7OuhlZWLrRT+3eoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744298645; c=relaxed/relaxed;
	bh=1aD3H5SmNlfRhw7KUYgaAyaJqkhSNgnVmYp8u5QpgpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jiCg582iOUkPsBM5y0CyQtnmojaiLSyn+JWyTBjmIyQKvg4S7+89CqrvDY09JjpiHiPxSmPWqUfLhVzUi8HtBCgsXV1TBt8UZKP/viU9yOMXbpAnNsPQg5+N9w6I+WqnwYMK20+3rtIByPCV1ybcEmTMLxs9j7EuUMncomHrluplZdHoqHBgoxY9QqJqo8jsmEtfotLN1jF1Zv9ItQhSj5RJ01NKZO/WG33baRwD+bpjGCmUtpN5GSc7BcFVen32x4fSoStRG6wCkbiig7s5VG5qz5Ktfi1SDKORgT9koE2v9VtSOtWT1/ps6UE7cseLpismrjBY6xhHDTaz4sQ3vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmx5S10A; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmx5S10A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=sakari.ailus@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 11 Apr 2025 01:24:02 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYNrf3ysRz3bm7
	for <openbmc@lists.ozlabs.org>; Fri, 11 Apr 2025 01:24:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744298644; x=1775834644;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kVA5MpLBMU4IYqfLgN92o9IEr4g+jq3spidVJHcMb6o=;
  b=cmx5S10AnTrVFKvixTa+4/ApPZhHKIoZr/IKyeaWCALnhZevZXSRKKTV
   dJeJ5pbhOJqGaXrwaiC87smweSn4XUNIrQRLvPxh7qM1Y55lTggBj3u1t
   Je7HYgLQbP025mAvqlY7klroQPv5oJSG1GVPOAC052E+YrAVRUDHyfIA7
   Tk6x3XBJ+/Fhlo3hb8IJkwsAeHSM0P0+UyTktm2qZXtIe/ke3JHElgf1e
   981gvbSmG1nT8seIsGtgNPk5ANx/iGTkoOdDOku+TU8YvLhVeSCZ4ht/i
   7Ir61alWRlsxH2jbZj4YS8iyzDTtTdaOdiKEDLrFwIXP8lsFrSYAh4NVm
   g==;
X-CSE-ConnectionGUID: lYNPYL+9RVGs5XpjIvbqzA==
X-CSE-MsgGUID: KNDRHnlpRNeV3pjsqiZSkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45716266"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45716266"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:55 -0700
X-CSE-ConnectionGUID: 3j6bmGJiRKOZWNowD2NzRA==
X-CSE-MsgGUID: ew/RyzT9RNy/1OP0CZJiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134108194"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:22:52 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DEA3A11F74E;
	Thu, 10 Apr 2025 18:22:49 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2tjt-00HObw-2j;
	Thu, 10 Apr 2025 18:22:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 0/3] Use a local device pointer for hwrng drivers instead of casting constantly
Date: Thu, 10 Apr 2025 18:22:36 +0300
Message-Id: <20250410152239.4146166-1-sakari.ailus@linux.intel.com>
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

Clean up random number reading by storing struct device pointer to device
context struct. The changes are very similar in all three drivers.

since v2:

- Add a struct device pointer field to device context structs, don't use
  struct hwrgn priv field for the purpose anymore.

Sakari Ailus (3):
  hwrng: atmel - Add struct device pointer to device context struct
  hwrng: mtk - Add struct device pointer to device context struct
  hwrng: npcm - Add struct device pointer to device context struct

 drivers/char/hw_random/atmel-rng.c | 11 ++++++-----
 drivers/char/hw_random/mtk-rng.c   |  9 +++++----
 drivers/char/hw_random/npcm-rng.c  |  9 +++++----
 3 files changed, 16 insertions(+), 13 deletions(-)

-- 
2.39.5

