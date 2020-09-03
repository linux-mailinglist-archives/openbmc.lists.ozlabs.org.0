Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA26260D1C
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 10:11:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlyXl6FQTzDq5f
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 18:11:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.41; helo=crapouillou.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=FOTskssg; 
 dkim-atps=neutral
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhzLd2GXGzDqkV
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 21:37:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599132378; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VitADMM0fnVC5UEnlJQqBbjbeuxkosY7PKciS9JCWhQ=;
 b=FOTskssgTXu613ZyXQFH73GPSn4sAH4YrP0JV6oEP+WsASxewPFIop8x6uA55dH2X0sPIU
 nYurhrftzHdBnJRaCPCA6k8tDEyO3YMnmeLEyHvxrjcjUS+VBt6Ymr6jWUZnVt/N1mci+7
 cxpnf7I+HG5vzL5cT8vb59uEQPISUYA=
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
Subject: [PATCH 06/20] usb/chipidea: core: Use pm_ptr() macro
Date: Thu,  3 Sep 2020 13:25:40 +0200
Message-Id: <20200903112554.34263-7-paul@crapouillou.net>
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
 drivers/usb/chipidea/core.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index aa40e510b806..af64ab98fb56 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1231,9 +1231,8 @@ static int ci_hdrc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 /* Prepare wakeup by SRP before suspend */
-static void ci_otg_fsm_suspend_for_srp(struct ci_hdrc *ci)
+static void __maybe_unused ci_otg_fsm_suspend_for_srp(struct ci_hdrc *ci)
 {
 	if ((ci->fsm.otg->state == OTG_STATE_A_IDLE) &&
 				!hw_read_otgsc(ci, OTGSC_ID)) {
@@ -1245,7 +1244,7 @@ static void ci_otg_fsm_suspend_for_srp(struct ci_hdrc *ci)
 }
 
 /* Handle SRP when wakeup by data pulse */
-static void ci_otg_fsm_wakeup_by_srp(struct ci_hdrc *ci)
+static void __maybe_unused ci_otg_fsm_wakeup_by_srp(struct ci_hdrc *ci)
 {
 	if ((ci->fsm.otg->state == OTG_STATE_A_IDLE) &&
 		(ci->fsm.a_bus_drop == 1) && (ci->fsm.a_bus_req == 0)) {
@@ -1259,7 +1258,7 @@ static void ci_otg_fsm_wakeup_by_srp(struct ci_hdrc *ci)
 	}
 }
 
-static void ci_controller_suspend(struct ci_hdrc *ci)
+static void __maybe_unused ci_controller_suspend(struct ci_hdrc *ci)
 {
 	disable_irq(ci->irq);
 	ci_hdrc_enter_lpm(ci, true);
@@ -1277,7 +1276,7 @@ static void ci_controller_suspend(struct ci_hdrc *ci)
  * interrupt (wakeup int) only let the controller be out of
  * low power mode, but not handle any interrupts.
  */
-static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
+static void __maybe_unused ci_extcon_wakeup_int(struct ci_hdrc *ci)
 {
 	struct ci_hdrc_cable *cable_id, *cable_vbus;
 	u32 otgsc = hw_read_otgsc(ci, ~0);
@@ -1294,7 +1293,7 @@ static void ci_extcon_wakeup_int(struct ci_hdrc *ci)
 		ci_irq(ci->irq, ci);
 }
 
-static int ci_controller_resume(struct device *dev)
+static int __maybe_unused ci_controller_resume(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 	int ret;
@@ -1332,8 +1331,7 @@ static int ci_controller_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int ci_suspend(struct device *dev)
+static int __maybe_unused ci_suspend(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
@@ -1366,7 +1364,7 @@ static int ci_suspend(struct device *dev)
 	return 0;
 }
 
-static int ci_resume(struct device *dev)
+static int __maybe_unused ci_resume(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 	int ret;
@@ -1386,9 +1384,8 @@ static int ci_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static int ci_runtime_suspend(struct device *dev)
+static int __maybe_unused ci_runtime_suspend(struct device *dev)
 {
 	struct ci_hdrc *ci = dev_get_drvdata(dev);
 
@@ -1408,13 +1405,12 @@ static int ci_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int ci_runtime_resume(struct device *dev)
+static int __maybe_unused ci_runtime_resume(struct device *dev)
 {
 	return ci_controller_resume(dev);
 }
 
-#endif /* CONFIG_PM */
-static const struct dev_pm_ops ci_pm_ops = {
+static const struct dev_pm_ops __maybe_unused ci_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ci_suspend, ci_resume)
 	SET_RUNTIME_PM_OPS(ci_runtime_suspend, ci_runtime_resume, NULL)
 };
@@ -1424,7 +1420,7 @@ static struct platform_driver ci_hdrc_driver = {
 	.remove	= ci_hdrc_remove,
 	.driver	= {
 		.name	= "ci_hdrc",
-		.pm	= &ci_pm_ops,
+		.pm	= pm_ptr(&ci_pm_ops),
 		.dev_groups = ci_groups,
 	},
 };
-- 
2.28.0

