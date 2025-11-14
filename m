Return-Path: <openbmc+bounces-893-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA69C5C780
	for <lists+openbmc@lfdr.de>; Fri, 14 Nov 2025 11:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7CZr3GD0z2yw7;
	Fri, 14 Nov 2025 21:11:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763115060;
	cv=none; b=RMwc7X3JXWlGQB9s+VPtIeKvNe9/QobVduWSdyD4W4oMZOeZckm5D/iYpjoOKvRoGvXTvsr1stvs3q3p6F7UO91NUyp5Okhg/CA/7Agyt0Y0oFdRhudOxxht3QVnZeWnrAo8jDXREXIMR/fCGr7uvIzWkpBzdgFAEo0IrKwWzGOYHALM0mAtOH7/Fo9tJGRfte0nqubsr1Kpm3ON7yrIl7845v4rXT5nfRdv3IWWU7ECauoQG9cI16M04Puwh74EWVWQA4+A2+lsmxHTOhg03Nuqt0rLqop4m+Sb561Au5laHaHlye0OPU4hWaCQ2F1lU2TIBfWapJTFhwQTXEYVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763115060; c=relaxed/relaxed;
	bh=gahU7OKPUSXUdIJKf0Jz5vsdbMRo85Fx6sGduurApik=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aKQboU2lf+VGrNAt71gn5Firl4EJIG81H8PBQMPcFLhjZ1cuPDWfI8S7nqIcRcjDKOLsuJr2/TYctKP0UBxTVxqVvUBZbII8W0Ug5cPleI7zUyFzLLsieb+449B+u3FJK6JktuHhpMoO+hoPnl3/l2ccmgUrlAx1UEbVfBRDUeQebpiWfnFNcEew8IdH+c9jWeoqFzXobvJNxaFtRbySvJdFxi3FwpEwazqS5o8/Lrb5GF1avr8lGKtBINCBP+UEF/gWcSZRpfecI57dDOGbqGbANOBruQEwX62Dui4+JdIrafmhsZ3Wy5X+9YXit+2rW3YAgrRR/q8glEyd6xPs0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7CZq4YJpz2xnh;
	Fri, 14 Nov 2025 21:10:58 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:42 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:42 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/4] spi: aspeed: Add AST2700 SoC support and Quad SPI handling update
Date: Fri, 14 Nov 2025 18:10:38 +0800
Message-ID: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
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

Changes in v2:
  - Some differences between AST2600 and AST2700 are described in
    commit message of the dt-bindings patch.

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


