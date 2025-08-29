Return-Path: <openbmc+bounces-525-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFEAB3B1CB
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 05:53:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCkrb0Sswz2ykc;
	Fri, 29 Aug 2025 13:53:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756439598;
	cv=none; b=fmj6I2bpQIphTBPlFPKnd4E9YpTa0Zuj7mdCL9+qpN9XzBo7g6V/5YLJY7PZ41Bnggc28yu/CBKVkvMFuKD6fsIEZ9hkd5ADHulOUT7UpShsfXAch89L4xo/dnJMGwrkApHcVlyc8Dfm2iNUneOgcF8GmTEN2XcgZg4M36xjkeFdtpUxheKbUjxhtBTwOQKdlSSgLgBsW9ONPdGIHnCD64D1QzinS93Ig2Lvh60UvNK7597DzIB+gvbWXK7b6J9wr4jTL1YZJ6YGrKx9/p/IQT8QcjYm59zpjLD95BZHawF0jiKXZLcqH7qNP04w5HIXAaF5kT6z8idZIDIpW9TfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756439598; c=relaxed/relaxed;
	bh=+TTlKQgRf4WErIngbri9YjcHmdQJ+dt9CT8SEhRhttU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=coPqRRk1HMvLdBi18rwu49BIqP4WeFS9KMbfTF0shC12EJoEpWKPjf6/LPFFiXlgve7lbro6Zcnk+CEWiKWsb3+lU+6emnIzhh2zJWF0e+uZhw0z9urNWI8uEb1HAtRZE2dbLkf6Xd2Sti/XpF25jzChLznqzKlbh4AfNQJbZ2AxWv7GP5oMcHWXmrN88qc0yfQ7DiMThOUyl89h3LTl9ib7ooEgWNMj0F+3iDiKaNyH9GgrHWVdsWMxwyVHIUsCnxp3Guagajtpot2yqy74pQj4hWxQJvz62l+wneosICg4U8o8QbHlXMYP3USqqipIfFEbE1Q8n47VCJSbJMnaHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCkrZ1ZvJz2xlQ;
	Fri, 29 Aug 2025 13:53:17 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 29 Aug
 2025 11:53:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 29 Aug 2025 11:53:01 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v10 0/1] media: aspeed: Allow to capture from SoC display (GFX)
Date: Fri, 29 Aug 2025 11:53:00 +0800
Message-ID: <20250829035301.2697535-1-jammy_huang@aspeedtech.com>
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

 v10 changes:
  - Fix alignment check.
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


