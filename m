Return-Path: <openbmc+bounces-879-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E926BC565FF
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 09:53:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6YwG5Wqzz2yvv;
	Thu, 13 Nov 2025 19:53:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763024030;
	cv=none; b=PtUpFyjeHFpH445DW11HeSYkgA9Fj/vd1Ruv07pVuBTdJQYWhk2IP9e/n6yd0/13KokPaKWICLhVajy0Mxk9FMxoVT4wXpbo86S0bnCgQ8Jx/+b4S1HBxhDYFo6YiENDVJqNsUZy2muFH8I9Ffv2OwJ5wdhnEL4v1FfQme5TFFPPZgGG9qd9/q+svIMNytOoHI0f2oB67IGHUgFuNppm9Fbv9KJpjs0uspGUiMzDU6rh5J6PJFvz7bk9jGVPUa88czuBHTKviesIB6bXdhn/tUX+V2GYGOjYY8ObYNkdEKP1UzYPrqQxkXeGT2YjNuo1LV1553JOKOXsQC2HAdRTFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763024030; c=relaxed/relaxed;
	bh=4/QhMm6cQEsf97law7i0DvmF8IobIzkeG2umGfTg0+A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z1obikAHF5pDvHY/eLH57Sw89utmnxloafswsMRpu75lAlSnXtKbBb3HNTq5+oWWTJRstqX0KSkIJ7nlaQyJw4tmW8te08otB13IuL2JWdUD9jFJKJUSaqs46+0PWloNun8143g/Ipttk5NNwgPaWsf/JoasNyWk83XI59fM2xGuL5jaIho/BCewf+lPUxq1GoW+lg2I+BAIotyYRXzW+9dxJHYvCK2zKUkzb3C5KDJ5w9IYc6aBTt9KeYN/pZfaV3rqVmePjkhdG5e9jIu218ZL5z/an0oTjFYO/+gdEAf3IQfZWtM9Vxs7mUxY1UlPVDXtq/5wp7zMBE9i2Nv8mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6YwF6KKgz2yvd;
	Thu, 13 Nov 2025 19:53:49 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 13 Nov
 2025 16:53:33 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 13 Nov 2025 16:53:32 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/4] spi: aspeed: Add AST2700 SoC support and Quad SPI handling update
Date: Thu, 13 Nov 2025 16:53:28 +0800
Message-ID: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
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

This series adds AST2700 support to the ASPEED FMC/SPI driver and
bindings, introduces 64-bit address compatibility, and improves
Quad SPI page programming behavior. It also implements AST2700-specific
segment logic, where range adjustment is not required because the
AST2700 SPI hardware controller already fixes decoding issues on
the existing platforms and adopts an updated scheme.

Chin-Ting Kuo (4):
  dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC support
  spi: aspeed: Enable Quad SPI mode for page program
  spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit
    platforms
  spi: aspeed: Add support for the AST2700 SPI controller

 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   4 +-
 drivers/spi/spi-aspeed-smc.c                  | 107 +++++++++++++++---
 2 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.34.1


