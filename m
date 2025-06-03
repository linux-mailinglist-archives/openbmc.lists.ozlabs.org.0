Return-Path: <openbmc+bounces-114-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39889ACC07C
	for <lists+openbmc@lfdr.de>; Tue,  3 Jun 2025 08:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBLvp5hLqz2ySQ;
	Tue,  3 Jun 2025 16:51:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748933462;
	cv=none; b=VjFwskBRNy4f4unZCK97pHjoXRvehh6Q912MPaRmLFFlXHM4qOBQzm6LAWkrVAM/RmFe1dZqgmcNzn2RBvh/xSTS5n7/cA96w2RHVPkntF8D1GAEgpQfMaLpjAQqhUYgMBLqTLeXel5YBVqnTSb3ZOQ8BahePwdHD+3qWHu6x4w2aa1dESQzkl4rtHRnmvrGDT14LjENPTLzpzFqCg+OAV1b+dNa81kDfBnyzDQuG2Fnp86y0gBKCgCkrLHAPMTbzTaeh6zrh2EQ7KnZhzJ5gl8U6VW9MPrauTJxfh+O8eUSzA+1LF5epJuO4LGTQ46WjdCXylovLEXlLUfStbSXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748933462; c=relaxed/relaxed;
	bh=O9fwEHk24Gk7JqhoAEbm9cCh88yuT30vIwdNJrnrt88=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ewMZEKDCm4ny24xkjUOCVYB4EfDirDDlaeXY96vuFftlXHd1HtalF8+tSQwSRmp5c6OpSJVD7jsGQBUONQe5LxDfyL8gOJdgjug6wHPn7afsbivnVHsCDouMLXebVJ72/yyY/TMHn76pssRaWUby7wnMnvFIO4PmhClwy6T4L4ZoW94xcbA3TXSuh5lHTItCw5NuND9KGcm3IlxEkwVdiIvor7bGnktf/vXzSJgaYwpJ5xID5AXWKH+91cIAOs4ipqTOafqVSB16d0qpv7+Fw/oOd6bsUg3+VzpK2HIamRbFCujQI9yBzlozFckq5ulMdtiDXT23T45slvZq1a2AGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 318 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 16:50:37 AEST
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBLvK2c85z2xpl;
	Tue,  3 Jun 2025 16:50:37 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Jun
 2025 14:45:00 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Jun 2025 14:45:00 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/1] media: aspeed: Allow to capture from SoC display (GFX)
Date: Tue, 3 Jun 2025 14:44:59 +0800
Message-ID: <20250603064500.94048-1-jammy_huang@aspeedtech.com>
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

 drivers/media/platform/aspeed/aspeed-video.c | 189 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 2 files changed, 168 insertions(+), 28 deletions(-)


base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
-- 
2.25.1


