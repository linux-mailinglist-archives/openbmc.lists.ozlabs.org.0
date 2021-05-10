Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E159378C95
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 15:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff1ht4H1Zz307B
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 23:13:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Mon, 10 May 2021 23:13:28 AEST
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff1hS3rWvz2yxB
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 23:13:28 +1000 (AEST)
IronPort-SDR: cPx1DsJohE0DnXhDOzF61oeyq5M296bXR+dYBpSOuuTq6gfKxhIFM2wq+T0qJJkdUnfmcOCoSQ
 GtSvtfNEDzbQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196097988"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="196097988"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 06:12:12 -0700
IronPort-SDR: 8cq4xdeItGeJtjcaNXc/GLgNpMLgVbQgOorFy/ktICqTUna/9qzT4szFJTTALAuqPSM/5np71L
 kJAgbte4tPNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="624279388"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 May 2021 06:12:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1E1CB1D2; Mon, 10 May 2021 16:12:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 5/7] spi: omap-uwire: Use SPI_MODE_X_MASK
Date: Mon, 10 May 2021 16:12:15 +0300
Message-Id: <20210510131217.49357-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510131217.49357-1-andriy.shevchenko@linux.intel.com>
References: <20210510131217.49357-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Tali Perry <tali.perry1@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use SPI_MODE_X_MASK instead of open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-omap-uwire.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 71402f71ddd8..ceb479f5c88f 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -330,7 +330,7 @@ static int uwire_setup_transfer(struct spi_device *spi, struct spi_transfer *t)
 	if (spi->mode & SPI_CPOL)
 		flags |= UWIRE_CLK_INVERTED;
 
-	switch (spi->mode & (SPI_CPOL | SPI_CPHA)) {
+	switch (spi->mode & SPI_MODE_X_MASK) {
 	case SPI_MODE_0:
 	case SPI_MODE_3:
 		flags |= UWIRE_WRITE_FALLING_EDGE | UWIRE_READ_RISING_EDGE;
-- 
2.30.2

