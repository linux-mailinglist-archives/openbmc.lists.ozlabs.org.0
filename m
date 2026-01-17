Return-Path: <openbmc+bounces-1216-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F471D38EBC
	for <lists+openbmc@lfdr.de>; Sat, 17 Jan 2026 14:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtdFP66xWz2y7c;
	Sun, 18 Jan 2026 00:42:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768657353;
	cv=none; b=PxKz+G7IyLgMAOvAFjcxRWIOG3wn7tU2CfPipEATgPHF/mLb1F9LH1qY972WK8+h9MVPh3i565peWKXO6yWpyFLj80VFBE4/FfCSUgA8QKMzH7TMH2VZvJOmRDezAkAmRraT6fS0TQvfL86A0B3NPQrWYH9hFC6J7dTJvznYtgLs7VA+BSGErwfC0385L42uj/NHyXWVf3DT7b4ABg0AX3kPH6Wqi+A568FIjQh9rFlPjRKg2J0LU2tPuAN2a4WgowKeG+RQsCbKx1kV4tdkQeGdbym5o77NFHPCv0F0EVsI+T8xexlTfz9Vh7vedit4tjDx6+y1CE7/FSO01CRokw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768657353; c=relaxed/relaxed;
	bh=nohVo+Xwr/wuM3e14RaGUPRh8OAEPa/KgOoV/uOC7Lo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IefeeLiQGnC8uvkoPO6kiDA/sYvCXHzayCxVg+ExNafQMLCJ9cjx4y6ibrfE3iWdQ4okQro4xO4kQTvJAHGExlWdHTSNPz7/zX3iglns50+RwHFGd+JDUWnlMYjUXc1KJHYOqVMeDHQuPrYuDaaYcNod9YfZkwctcVca8VhAvZF5LYkY5jEA/IDaxqiUc+bL+a5GdsBKIvzDedDBPFi05MZ5m9mda59BFlUaGxZNsz2VnkmVqn+rmF6pPUjTcbnGmaqnHKT2cdOcx9wmLpyzOV+9GapmX354f5/S3BfdYzpDYxgh7gM4wBXztx8+WBLZWnprLm28qpUalE/M9FASww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtdFN3kBXz2xQC;
	Sun, 18 Jan 2026 00:42:31 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sat, 17 Jan
 2026 21:42:16 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sat, 17 Jan 2026 21:42:16 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <boris.brezillon@bootlin.com>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/2] spi: aspeed: Improve handling of shared SPI controllers
Date: Sat, 17 Jan 2026 21:42:14 +0800
Message-ID: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
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

Changes in v2:
  - Separate transfer_one_message() function implementation into
    transfer_one() and prepare_message() in controller driver.

Chin-Ting Kuo (2):
  spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
  spi: aspeed: Add support for non-spi-mem devices

 drivers/spi/spi-aspeed-smc.c | 134 +++++++++++++++++++++++++++++++++--
 drivers/spi/spi-mem.c        |  11 ++-
 2 files changed, 138 insertions(+), 7 deletions(-)

-- 
2.34.1


