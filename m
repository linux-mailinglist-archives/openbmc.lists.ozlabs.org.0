Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480BA7BEC8E
	for <lists+openbmc@lfdr.de>; Mon,  9 Oct 2023 23:15:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GXEcZDA6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Bd36V1sz30MY
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 08:15:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GXEcZDA6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4BcT2tvmz2yps
	for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 08:14:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 532126140D;
	Mon,  9 Oct 2023 21:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0C1C433CC;
	Mon,  9 Oct 2023 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696886067;
	bh=bcVRBerKLN3z3a+n5ySbsO9a5UW+yPFpaZA09Z5pSJk=;
	h=From:To:Cc:Subject:Date:From;
	b=GXEcZDA6r/rvEEam379V7bL2vQA6BSnMY/2ii+6JzoSKwAZ7fCq4dvF2giTpe2LgD
	 dRHLvHwuzHOHW0qi1/g923ZkJLX6U8xVJMm+3YBYtnzq+1PvH1mg0gzVP75oQN95hl
	 UIRGfg7IUGUqcwXrY9FEKK9huJzVdjBlk0hiSJgDFPUt14CQztmQ+JpUUXTkY6padr
	 qMype6Kyk8Lin20Tm5giIT0/q3jqVLFSLocLdRMRzJ11/VoKNeYQll+KSKnLoOcnKg
	 iVrOQrGhzcu75mrrpWLJowrpSc8ax9RluLmdXcq9+UYQB83go3Hnb+r4LZSUQ63+uG
	 eg4CwyTfHiQxg==
Received: (nullmailer pid 3246090 invoked by uid 1000);
	Mon, 09 Oct 2023 21:14:13 -0000
From: Rob Herring <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH] reset: Use device_get_match_data()
Date: Mon,  9 Oct 2023 16:13:41 -0500
Message-ID: <20231009211356.3242037-11-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/reset/reset-npcm.c       |  5 ++---
 drivers/reset/sti/reset-syscfg.c | 11 ++++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index f6c4f854f2be..8935ef95a2d1 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -6,8 +6,8 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
@@ -351,8 +351,7 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 		}
 	}
 
-	rc->info = (const struct npcm_reset_info *)
-			of_match_device(dev->driver->of_match_table, dev)->data;
+	rc->info = device_get_match_data(dev);
 	switch (rc->info->bmc_id) {
 	case BMC_NPCM7XX:
 		npcm_usb_reset_npcm7xx(rc);
diff --git a/drivers/reset/sti/reset-syscfg.c b/drivers/reset/sti/reset-syscfg.c
index c1ba04f6f155..2324060b747c 100644
--- a/drivers/reset/sti/reset-syscfg.c
+++ b/drivers/reset/sti/reset-syscfg.c
@@ -7,10 +7,11 @@
  */
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/types.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 
@@ -183,14 +184,14 @@ static int syscfg_reset_controller_register(struct device *dev,
 int syscfg_reset_probe(struct platform_device *pdev)
 {
 	struct device *dev = pdev ? &pdev->dev : NULL;
-	const struct of_device_id *match;
+	const void *data;
 
 	if (!dev || !dev->driver)
 		return -ENODEV;
 
-	match = of_match_device(dev->driver->of_match_table, dev);
-	if (!match || !match->data)
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
 		return -EINVAL;
 
-	return syscfg_reset_controller_register(dev, match->data);
+	return syscfg_reset_controller_register(dev, data);
 }
-- 
2.42.0

