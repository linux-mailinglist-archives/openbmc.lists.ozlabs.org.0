Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F7872443
	for <lists+openbmc@lfdr.de>; Tue,  5 Mar 2024 17:28:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tq1Fb6KZMz3vjb
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 03:28:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tq1FJ39lXz3dWW
	for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2024 03:27:46 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdc-0003Tu-PZ; Tue, 05 Mar 2024 17:27:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdc-004aQQ-AU; Tue, 05 Mar 2024 17:27:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhXdc-000BLr-0j;
	Tue, 05 Mar 2024 17:27:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Corey Minyard <minyard@acm.org>
Subject: [PATCH 6/6] ipmi: kcs_bmc_npcm7xx: Convert to platform remove callback returning void
Date: Tue,  5 Mar 2024 17:27:03 +0100
Message-ID: <16144ffaa6f40a1a126d5cf19ef4337218a04fbb.1709655755.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2011; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=6BojaJx0o86nvxymZyJUgXFT9pCZmy7I6WYLjizDsSQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl50fYrb33YIR2AYYD4oMtv8b+EFdySFh7vvuX8 zSMz9fCVyeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZedH2AAKCRCPgPtYfRL+ TiQSB/9tmMSHdmWxhpT3OAJ3xiZ8KvmE5bdZ7E2LJWyTOayQ0g7WWgO3e9eOJYJTWuvzlcx0sDs bUz/JybC7YlfSFM5L7C2f2vWKkXFEwmxivKwybbSHv7gP1tP8TKKTNeRinVSFFbcojXrw83a9zo ju8zCM3cyYJjijDiM7fLtADyFxFV25jFakiBC9uSRxGDjXwTdhNwMgTK8vKq9dFO7d7GtjprZ75 WQ5Pz6ALIHRQ8DaR8aFZ01ZWDo+3w84R+ONj8n7zXC1kkN+aYlkl04TnU1lcvU5IMKq/XUU22fe IbAGYqFKoLGTNPKW0PVZlLRJEacyDlAAsmriOgIwvjzpRZpJ
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
Cc: Benjamin Fair <benjaminfair@google.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, kernel@pengutronix.de, openipmi-developer@lists.sourceforge.net
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
 drivers/char/ipmi/kcs_bmc_npcm7xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_npcm7xx.c b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
index 7961fec56476..07710198233a 100644
--- a/drivers/char/ipmi/kcs_bmc_npcm7xx.c
+++ b/drivers/char/ipmi/kcs_bmc_npcm7xx.c
@@ -218,7 +218,7 @@ static int npcm7xx_kcs_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int npcm7xx_kcs_remove(struct platform_device *pdev)
+static void npcm7xx_kcs_remove(struct platform_device *pdev)
 {
 	struct npcm7xx_kcs_bmc *priv = platform_get_drvdata(pdev);
 	struct kcs_bmc_device *kcs_bmc = &priv->kcs_bmc;
@@ -227,8 +227,6 @@ static int npcm7xx_kcs_remove(struct platform_device *pdev)
 
 	npcm7xx_kcs_enable_channel(kcs_bmc, false);
 	npcm7xx_kcs_irq_mask_update(kcs_bmc, (KCS_BMC_EVENT_TYPE_IBF | KCS_BMC_EVENT_TYPE_OBE), 0);
-
-	return 0;
 }
 
 static const struct of_device_id npcm_kcs_bmc_match[] = {
@@ -243,7 +241,7 @@ static struct platform_driver npcm_kcs_bmc_driver = {
 		.of_match_table	= npcm_kcs_bmc_match,
 	},
 	.probe	= npcm7xx_kcs_probe,
-	.remove	= npcm7xx_kcs_remove,
+	.remove_new = npcm7xx_kcs_remove,
 };
 module_platform_driver(npcm_kcs_bmc_driver);
 
-- 
2.43.0

