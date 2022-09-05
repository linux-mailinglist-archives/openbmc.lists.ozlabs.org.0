Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 011635AD975
	for <lists+openbmc@lfdr.de>; Mon,  5 Sep 2022 21:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLyr3680zz30DP
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 05:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SGiy0xGA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SGiy0xGA;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLyqb6jYRz2ywr
	for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2022 05:14:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662405244; x=1693941244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ATRm0xw22WfFaEoiYkPnoJTK/cXHL3nSucFclcwn+Ac=;
  b=SGiy0xGAL9pafnWMOiPmqKSjrlSOnk0OmH6tQXV6SOhWNjxFxt+YTt8A
   1j6arxz+vXQ3mzWLEs7J0el5uRWVYAZ8fsOJFzr30FSWHTqTZ3pjfgEZd
   Uvcw53vbSKuYwQqeJTPadpphrT1t93a5+oz+sHiSlRZPKCSwd5B0L7Zd0
   A7YTXizijrWK0YTnH5NDN6sxzx6yc5MP3BziQseOzmA+r6FGGWqchm5hj
   MuUKVcG6RqSzdiwicJPY0VrzOnCBmPRsZcYYTpsUthfyuHLPRWuiYPF0H
   elr+WGGEMx033w707kiQbH2eq9Aq/fAbNU7vpAuj8BJWlQghhzgUuU49c
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10461"; a="295180850"
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="295180850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2022 12:13:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,292,1654585200"; 
   d="scan'208";a="609738990"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 05 Sep 2022 12:13:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 92687101; Mon,  5 Sep 2022 22:14:13 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] pinctrl: wpcm450: Correct the fwnode_irq_get() return value check
Date: Mon,  5 Sep 2022 22:14:08 +0300
Message-Id: <20220905191408.73794-1-andriy.shevchenko@linux.intel.com>
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

fwnode_irq_get() may return all possible signed values, such as Linux
error code. Fix the code to handle this properly.

Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
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

