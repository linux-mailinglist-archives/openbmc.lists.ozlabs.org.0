Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C42260D22
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:12:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlyZ42N5RzDqM1
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 18:12:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.41; helo=crapouillou.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=FxZYS6z3; 
 dkim-atps=neutral
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhzLp5X5dzDqsZ
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 21:37:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599132370; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ruSiYGMYEYwNR6DS0j0tVkBt7LK6N4xlExna60GJosA=;
 b=FxZYS6z3pPyZLRrUjh2dW2tB5f2tjvTCsiK/chiWBa/qXenSG+eYjMmtI66CraPCt3V2Ar
 fu+8Mhe20Q9WGLKBy/kMAeqWTuvZ1iEf8F9CITOWigjXBmDiXsNDu9Vn6QAjG47KG6l3T6
 VqobcZ0NBnJeO4Bg5XZ946SGd9K0G7Y=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <Peter.Chen@nxp.com>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Felipe Balbi <balbi@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Alan Stern <stern@rowland.harvard.edu>, Tony Prisk <linux@prisktech.co.nz>,
 Bin Liu <b-liu@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH 03/20] usb/host: ehci-npcm7xx: Use pm_ptr() macro
Date: Thu,  3 Sep 2020 13:25:37 +0200
Message-Id: <20200903112554.34263-4-paul@crapouillou.net>
In-Reply-To: <20200903112554.34263-1-paul@crapouillou.net>
References: <20200903112554.34263-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:47:25 +1000
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
Cc: Paul Cercueil <paul@crapouillou.net>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Use the newly introduced pm_ptr() macro, and mark the suspend/resume
functions __maybe_unused. These functions can then be moved outside the
CONFIG_PM_SUSPEND block, and the compiler can then process them and
detect build failures independently of the config. If unused, they will
simply be discarded by the compiler.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/host/ehci-npcm7xx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index adaf8fb4b459..6b5a7a873e01 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -37,8 +37,7 @@ static const char hcd_name[] = "npcm7xx-ehci";
 
 static struct hc_driver __read_mostly ehci_npcm7xx_hc_driver;
 
-#ifdef CONFIG_PM_SLEEP
-static int ehci_npcm7xx_drv_suspend(struct device *dev)
+static int __maybe_unused ehci_npcm7xx_drv_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	bool do_wakeup = device_may_wakeup(dev);
@@ -46,14 +45,13 @@ static int ehci_npcm7xx_drv_suspend(struct device *dev)
 	return ehci_suspend(hcd, do_wakeup);
 }
 
-static int ehci_npcm7xx_drv_resume(struct device *dev)
+static int __maybe_unused ehci_npcm7xx_drv_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 
 	ehci_resume(hcd, false);
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static SIMPLE_DEV_PM_OPS(ehci_npcm7xx_pm_ops, ehci_npcm7xx_drv_suspend,
 		ehci_npcm7xx_drv_resume);
@@ -183,7 +181,7 @@ static struct platform_driver npcm7xx_ehci_hcd_driver = {
 	.driver		= {
 		.name = "npcm7xx-ehci",
 		.bus = &platform_bus_type,
-		.pm = &ehci_npcm7xx_pm_ops,
+		.pm = pm_ptr(&ehci_npcm7xx_pm_ops),
 		.of_match_table = npcm7xx_ehci_id_table,
 	}
 };
-- 
2.28.0

