Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3145ECBC0
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 19:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McS2v2Rd8z3c61
	for <lists+openbmc@lfdr.de>; Wed, 28 Sep 2022 03:55:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=geI5VjNs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=geI5VjNs;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McS2P3b5Yz2xGn
	for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2022 03:55:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664301310; x=1695837310;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kPvU4iuGositvq8mxsAQnuUACK6BvgZwdiD8bZlXAwc=;
  b=geI5VjNsRRvVlYLJEF7ctuzClHPKUTGjZnvfWf1ZMXyJia7jYqN2hVIl
   y6HMmjQywqJJmFRyN2XB5+ppftz4wlHbc5+aQ0BehOKDjilZzD78rcz7k
   HqKRuUbNU0OciKHQq08QQx0agtWI3otUXw3FU3VPht5R+ARKcCz3A290O
   aVS+HhDcNb66Q4ej46uF3HbFEK5ZNdXQd6fweiDiRLcStD9K2r9u7PSjN
   UmII4OBFCnw+trkZRdW/BqWg9tlO86PiTYDroAT3IUji16WvmxG6qZBUV
   jXgrgQnbwFK6LgdWiX7K0XOxvYGVS1Zy/nyaHWPg/bWhnFyvn4Y3zGChh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="281105962"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="281105962"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 10:54:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="599265534"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="599265534"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 27 Sep 2022 10:54:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 41BCF7C; Tue, 27 Sep 2022 20:55:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get() return value check
Date: Tue, 27 Sep 2022 20:55:09 +0300
Message-Id: <20220927175509.15695-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

fwnode_irq_get() can return zero to indicate IRQ mapping errors.
Handle this case by skipping the interrupt resource.

Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: amended commit message (Jonathan)
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 0dbeb91f0bf2..8193b92da403 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1081,10 +1081,13 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 
 		girq->num_parents = 0;
 		for (i = 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
-			int irq = fwnode_irq_get(child, i);
+			int irq;
 
+			irq = fwnode_irq_get(child, i);
 			if (irq < 0)
 				break;
+			if (!irq)
+				continue;
 
 			girq->parents[i] = irq;
 			girq->num_parents++;
-- 
2.35.1

