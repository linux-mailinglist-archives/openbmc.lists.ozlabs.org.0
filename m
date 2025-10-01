Return-Path: <openbmc+bounces-704-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B70BB0228
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 13:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccCL72QD8z3cfT;
	Wed,  1 Oct 2025 21:26:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759317983;
	cv=none; b=WnXc/HAdNafTajjaWlWZFPiEWwPKgaIIJ81b3yt5AjQMfFI4WzmvDKC4cvwqxuF3FmJHYawnb1/AHlV6ujtRSeslxqT8JuzK3vkdNCjteSObyPI9U1QMIjltcjXm0cliTH6YuMRTrzoIMCR2b2c97L1/mhbXE++huLHOp/pRp/RnWTSciohXH85k9N1fIfHNTE6dqcDyeetOUeFUQwwJsuD9Qid+6QMPQV7d0roz5HuGIgDcaPi8f7XgkwdeaUstcix4wkoptLDzZ5dIh60fYsAM7MKI7PyguBK/SfNipJ/lb4lydFRHo4vWujFH7utBkzCK+S1Meg+t62g1trqbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759317983; c=relaxed/relaxed;
	bh=a8s6HxRRd9vC8JP9kc13Y8TE1AoRzpQQbSPEkVOZ6ug=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kgsl/FHvYPlqxvrXqsarmqwfpYyrV3+9YDg3jQ+0QMUc2IcRW1AIHyH6ai2caiPuvzVL5srEjz7+xHh+tKlDaLyetrZpXNgWqw+TpYbNiShKKKl5N8GkjeTNAx2bW4dEncbHDf/dflpL56Gg1E1w3XHUOD32rwtTMun+X33PvqIKbjv8/9MS7e50f2NaspiPwR+GquyYwTJ6MAMMy1kr6dMuSXaNdIhgeoSAIk5AzXcbYEk9sZmtFXXFN5Fk08mIlE7meiSgGZjpXZZdXKUn8sn/gOlDcyj4Cak9gM2rL2rJWXlTsB7MLUJQXoMAJ+oock7l3oR1neX35rO01F9vbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccCL635KXz3cfL;
	Wed,  1 Oct 2025 21:26:21 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 1 Oct
 2025 19:26:05 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 1 Oct 2025 19:26:05 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/6] spi: aspeed: Improve clock, timing and address decoding logic
Date: Wed, 1 Oct 2025 19:25:59 +0800
Message-ID: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
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

This patch series introduces several improvements to the
ASPEED SPI driver, targeting better stability, compatibility
and, flexibility across multiple ASPEED platforms.

Key changes include:

* Clock selection strategy update
  Improves fallback logic when timing calibration is skipped or
  fails, ensuring reliable boot behavior.

* Timing calibration enhancement for AST2600
  Replaces the previous "first-pass" strategy with a more robust
  algorithm that selects the optimal timing point.

* Default address decoding assignment
  Ensures each chip select (CS) has a valid decoding range during
  probe, avoiding detection failures due to missing or incorrect
  bootloader setup.

* Centralized address decoding management
  Refactors the decoding logic to centrally assign address windows,
  preventing improper trimming and improving layout flexibility.

* Per-platform decoding adjustment
  Introduces platform-specific `adjust_window` callbacks to handle
  platform specific hardware constraints for address decoding range.

* Selective memory mapping
  Optimizes memory usage by mapping only the required address window
  per CS to avoid exhaustion.

Chin-Ting Kuo (6):
  spi: aspeed: Update clock selection strategy
  spi: aspeed: Improve timing calibration algorithm for AST2600 platform
  spi: aspeed: Force default address decoding range assignment for each
    CS
  spi: aspeed: Centralize address decoding region management
  spi: aspeed: Add per-platform adjust_window callback for decoding
    range
  spi: aspeed: Only map necessary address window region

 drivers/spi/spi-aspeed-smc.c | 644 ++++++++++++++++++++++++++---------
 1 file changed, 489 insertions(+), 155 deletions(-)

-- 
2.34.1


