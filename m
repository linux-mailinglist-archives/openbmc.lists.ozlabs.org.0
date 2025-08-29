Return-Path: <openbmc+bounces-522-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDA5B3B07D
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 03:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCgcm4ZPSz2yqc;
	Fri, 29 Aug 2025 11:27:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756430872;
	cv=none; b=HMmtEYcW8RnHfOnuGi2HRu+0v/4BGaazzflVFvYghxvRz8SFV930W+36+Rphh2bDKOMBxLzjSkEvwkx7g1iruJQ7S8Wfg9QB8xgUn3cYuI6MRQW2f6gPsYCTBZmuDLpiu7W6iwTWhlCb9T+BOXs9yvH4b3+EOtgkCzMwbuPlh82i+7Xj4i9N27EgWvzpTRPL0eyDZ3w8O0GIYB+VekkBOt99gQH174VlLnLnbgAs6YUUUtXl4Es5kKeBFNN8MrP+FbILG7QHT06LB9uxx83G428zMdim85ywuZcQ/qH8nCHnrI5Li6Kzzo8BhzeAOeBP4koXq5zyeu6ILhrCdwYwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756430872; c=relaxed/relaxed;
	bh=6+FZUb6sz4PUOuyXzmv/O8pwSOINVliDooRSBJd0hrM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fq/nzgdloYmrhj0pp+QY73UsHtxqFE057YihTiQi2wgUC2Ui3xBj7dAyyFjTr1BB4tWyADGAjgBJSmaoEGS0sbaTTxOwLDPYHCQq6vNRK+F77LrWpBSPFFd7D02UsIJmx6D3luaQd5GT0zCY/zP/9uyVDdpHS7IMEKcTMlalUT9ME6PP4u/pxpsLg6TkXd3nS1p+vk0UXf7g8LlnPAzRvMuPyG5nl2dU50rMaNQp5bRZikn+Xk3YZQ7HNoBNI/SwepizpRKEuCcii0EduggncRkPJoX5DyAGfwM9oxz8KDubEENWEy0CTfJpvvRRC9GeZsmwFtsAO5fTjWawzkLONw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCgcl4HVnz2xWQ;
	Fri, 29 Aug 2025 11:27:50 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 29 Aug
 2025 09:27:29 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 29 Aug 2025 09:27:29 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/1] media: aspeed: Allow to capture from SoC display (GFX)
Date: Fri, 29 Aug 2025 09:27:28 +0800
Message-ID: <20250829012729.2677665-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

 v9 changes:
  - Fix line length WARNING.
 v8 changes:
  - Add check in aspeed_video_set_input().
 v7 changes:
  - The change for Documentation is moved to a separate patch and has
    been accepted.
 v6 changes:
  - Replace aspeed-video.txt with aspeed,video-engine.yaml.
 v5 changes:
  - Remove dts.
  - Add doc, aspeed,video.yaml.
  - Simplify aspeed_regmap_lookup.
 v4 changes:
  - Use scoped/cleanup to make aspeed_regmap_lookup simpler.
  - Update dts
 v3 changes:
  - Update for enum_input.
 v2 changes:
  - Update patch subject and comments.

Jammy Huang (1):
  media: aspeed: Allow to capture from SoC display (GFX)

 drivers/media/platform/aspeed/aspeed-video.c | 199 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 2 files changed, 178 insertions(+), 28 deletions(-)


base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
-- 
2.25.1


