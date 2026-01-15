Return-Path: <openbmc+bounces-1208-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66218D25266
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 16:05:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsR9h4kKnz2yFm;
	Fri, 16 Jan 2026 02:05:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768489512;
	cv=none; b=boDC47r37OUsbDndPjEOSK1DwD+jkQzATnJ4P/JGkotaNm6iCkjm4/SwCd+bkDk37nUqJLx11zjDqL2rwyZzpHMokDOLBWr8DPu59gfcgG9ys7PGYgsHASpjfEkiwfQvL+aKtyY1/euzBSvRusj62g4X9nkeZ748iMxSIN5pH/XXD7dHh62RD/FKn2xtAIia76PtI8u56NyHPMWrGM2OyzTXqag33p8RDSaR/SEgOUcp4R9JZqMNW/zt6iS46hKjt/wOszKniwIjVVFR6D3wM6n+U1E2nIBtNp1Rhu46jPrWwxfAAXpOPmTv8Kh8PzMW/pyQ8+IjynqJ0MhCLotmyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768489512; c=relaxed/relaxed;
	bh=UhOAWYmKwYDaDnnY95gO/WT/b7X/7NRzpKlaY1ccYnI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S9ocXGxPIAIqw9oqCa660AjgAt2pbzfMNomu5TlYKNxsAjfpkrQMLPJapUAlybevjDkwvuEFCYb+KDzFJNE0lN0K00HT4EugCG4KMjNvCc3Cr5Q7gD9ilurRe/AxFDJTwvpNH+ghHYJZQDre3A46hnZ/6drFkprO1uFpidzVgMO+SnuP0V/wJmaR60qHKQDMPWtB94B6RTJskv3DzGaJdxnAcoZrG/c17OgTA4kBJ53hslQVtggjxxD0j8fVNXRu3oLSgbe8PkGInMkRfVQMfH7QMS7cQhixdX0oarqKrD8FDIN/JUmJJQN98lt/yOUmUV4jd0sCa4/n6hH5uOCjtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsR9g5PPKz2xNg;
	Fri, 16 Jan 2026 02:05:10 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 15 Jan
 2026 23:04:54 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 15 Jan 2026 23:04:54 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <boris.brezillon@bootlin.com>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/2] spi: aspeed: Improve handling of shared SPI controllers
Date: Thu, 15 Jan 2026 23:04:52 +0800
Message-ID: <20260115150454.1575970-1-chin-ting_kuo@aspeedtech.com>
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

This patch series improves handling of SPI controllers that are
shared by spi-mem devices and other SPI peripherals.

The primary goal of this series is to support non-spi-mem devices in
the ASPEED FMC/SPI controller driver. It also addresses an issue in
the spi-mem framework observed when different types of SPI devices
operate concurrently on the same controller, ensuring that spi-mem
operations are properly serialized.

Chin-Ting Kuo (2):
  spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
  spi: aspeed: Add support for non-spi-mem devices

 drivers/spi/spi-aspeed-smc.c | 121 +++++++++++++++++++++++++++++++++--
 drivers/spi/spi-mem.c        |  11 +++-
 2 files changed, 125 insertions(+), 7 deletions(-)

-- 
2.34.1


