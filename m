Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE1378C93
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 15:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff1gW0PTLz307F
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 23:12:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff1gJ5wnQz2ymV
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 23:12:28 +1000 (AEST)
IronPort-SDR: 3B18MOAMzeQal0mv05hS39fe1LLj8XCpHL6QOvlV1xWsE6ujEm1ZY5gmeJKgc2MUHqlhv4EyPg
 t93es3Kahz6g==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179455506"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="179455506"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 06:12:16 -0700
IronPort-SDR: crr0PTD/wqg0xrIajIR5THwsMYJDeciaOCujFPoUOsxt9UYSNWFPAGgXObKqV02E0UiuaaaKih
 uCtpejFevx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="436139440"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 10 May 2021 06:12:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3665B501; Mon, 10 May 2021 16:12:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 7/7] spi: uniphier: Use SPI_MODE_X_MASK
Date: Mon, 10 May 2021 16:12:17 +0300
Message-Id: <20210510131217.49357-7-andriy.shevchenko@linux.intel.com>
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
 drivers/spi/spi-uniphier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-uniphier.c b/drivers/spi/spi-uniphier.c
index 6a9ef8ee3cc9..8900e51e1a1c 100644
--- a/drivers/spi/spi-uniphier.c
+++ b/drivers/spi/spi-uniphier.c
@@ -142,7 +142,7 @@ static void uniphier_spi_set_mode(struct spi_device *spi)
 	 * FSTRT    start frame timing
 	 *          0: rising edge of clock, 1: falling edge of clock
 	 */
-	switch (spi->mode & (SPI_CPOL | SPI_CPHA)) {
+	switch (spi->mode & SPI_MODE_X_MASK) {
 	case SPI_MODE_0:
 		/* CKPHS=1, CKINIT=0, CKDLY=1, FSTRT=0 */
 		val1 = SSI_CKS_CKPHS | SSI_CKS_CKDLY;
-- 
2.30.2

