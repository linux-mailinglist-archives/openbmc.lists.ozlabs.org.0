Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D037D876036
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 09:52:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trg0S42Fsz3vb6
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 19:52:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trg0664Hzz3bwX
	for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2024 19:52:04 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxH-0006zY-QM; Fri, 08 Mar 2024 09:51:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxG-0056Nl-Mn; Fri, 08 Mar 2024 09:51:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1riVxG-00246D-20;
	Fri, 08 Mar 2024 09:51:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: chipidea: npcm: Convert to platform remove callback returning void
Date: Fri,  8 Mar 2024 09:51:18 +0100
Message-ID: <91311e53e9432ae84d5720485c3b436fb7f06227.1709886922.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=UND3LN2cxUflw7dQF4s+C69E5KDxmztIpomMK2CtFqg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl6tGLzeOg4w6Z5Ct9P5xdIpqSFWK5xjUq8lifW Tin4bDyCfeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZerRiwAKCRCPgPtYfRL+ TnELCACpUSdK/UC2Id2ldrUSo5k8ta2kYi8yCD76nX2Wy3e4aUb3QumJQpMSX7pyOD0qrECpV1m YLWa65U7wDCsCv0QyiQbTkuEKl0TySQIyHRY1wzY9hexDKMmVy1ZreCMZOqzsSu0yloG0V3c3vQ PpFAVyL2bbr5WJnowgocAlIsZMpkJUmEjPj/J0h848GOXiVym93IGBglbppEiFl4qfpBkQLnfbv J95BQYekOVrmKkJxBgQjRFQmHHU/zgBWt2aFU1fCp4pMO890W08cDoP19rJn03ZHDIWtJZkCAyR uzC00sFPq9ptUia6dl2GIWeexvm2PV3vqmduVEZ5w4Itp0PF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, kernel@pengutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/chipidea/ci_hdrc_npcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_npcm.c b/drivers/usb/chipidea/ci_hdrc_npcm.c
index e4a191e02ceb..b14127873c55 100644
--- a/drivers/usb/chipidea/ci_hdrc_npcm.c
+++ b/drivers/usb/chipidea/ci_hdrc_npcm.c
@@ -80,15 +80,13 @@ static int npcm_udc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int npcm_udc_remove(struct platform_device *pdev)
+static void npcm_udc_remove(struct platform_device *pdev)
 {
 	struct npcm_udc_data *ci = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
 	ci_hdrc_remove_device(ci->ci);
 	clk_disable_unprepare(ci->core_clk);
-
-	return 0;
 }
 
 static const struct of_device_id npcm_udc_dt_match[] = {
@@ -100,7 +98,7 @@ MODULE_DEVICE_TABLE(of, npcm_udc_dt_match);
 
 static struct platform_driver npcm_udc_driver = {
 	.probe = npcm_udc_probe,
-	.remove = npcm_udc_remove,
+	.remove_new = npcm_udc_remove,
 	.driver = {
 		.name = "npcm_udc",
 		.of_match_table = npcm_udc_dt_match,

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0

