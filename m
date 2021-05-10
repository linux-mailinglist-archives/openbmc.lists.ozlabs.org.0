Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E24378C98
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 15:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff1k82DjTz3bwW
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 23:14:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff1hX1fHSz303t
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 23:13:32 +1000 (AEST)
IronPort-SDR: 19pQhxWXO66UgnEBQ/c+DA4/Vkuj7XobcjLgBGt7T9MwdLmwaywtlFOcx4fCY6gyQqx41w2bTa
 HtHETy3F0Tfw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="197206773"
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="197206773"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 06:12:29 -0700
IronPort-SDR: SEBoGOsd7HXGOK7sM3x2GPA4qSj8lyD5tn9LcErORMjswRKOZx6rTJNkTWPONTmR8JmYPkViGo
 u8daIbcG3TWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,287,1613462400"; d="scan'208";a="470793122"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2021 06:12:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2A2AA202; Mon, 10 May 2021 16:12:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 6/7] spi: ppc4xx: Use SPI_MODE_X_MASK
Date: Mon, 10 May 2021 16:12:16 +0300
Message-Id: <20210510131217.49357-6-andriy.shevchenko@linux.intel.com>
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
 drivers/spi/spi-ppc4xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ppc4xx.c b/drivers/spi/spi-ppc4xx.c
index d8ee363fb714..cb6aaad73f63 100644
--- a/drivers/spi/spi-ppc4xx.c
+++ b/drivers/spi/spi-ppc4xx.c
@@ -235,7 +235,7 @@ static int spi_ppc4xx_setup(struct spi_device *spi)
 	 */
 	cs->mode = SPI_PPC4XX_MODE_SPE;
 
-	switch (spi->mode & (SPI_CPHA | SPI_CPOL)) {
+	switch (spi->mode & SPI_MODE_X_MASK) {
 	case SPI_MODE_0:
 		cs->mode |= SPI_CLK_MODE0;
 		break;
-- 
2.30.2

