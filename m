Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AB97B806D
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 15:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0wBH0K4Kz3cDg
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 00:13:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0w9s22zPz2yDt
	for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2023 00:13:35 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo1gc-000752-RQ; Wed, 04 Oct 2023 15:13:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo1gc-00B2hg-DD; Wed, 04 Oct 2023 15:13:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo1gc-008zCo-3P; Wed, 04 Oct 2023 15:13:10 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH 11/21] EDAC/npcm: Convert to platform remove callback returning void
Date: Wed,  4 Oct 2023 15:12:44 +0200
Message-Id: <20231004131254.2673842-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
References: <20231004131254.2673842-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9elwnacy4hC51ienj2Z+Us36weEmvKfpBXTgQQ+HOVA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlHWSoRSWmM+3hSszD29TcULhrXY9FdJYJ6VvqT 9fuIDTZMdeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZR1kqAAKCRCPgPtYfRL+ TnWHB/9mCD0nPuvxj1FdGxP1d161RTZjGuin2+lSXOh0ky5nwM0cbu0UPdlq6hWl/CIHXnbLhgE QMcUeiyA/ERmTe3O8AQgNmtMpCQGa+U6a2mtrHv3Y6+rsMV0E5vikf+EK44zTPWKa6L8OqUcQCG mhhhzfQ5NjWY5Ry9OdrbmRIOmNPi+xedSWOiuNrT8Un7d/ilQgU7hqHvSQ2ConDzSdf2U8HzKd0 cNs7uqpIF6LYJSM93kZXE2s+Um7Ku4v43Lk4BKenPlUd3KcT4CQs0fZGzFWAE6goC4MBip0Gios 6mXWpdWwMTiamaNfOkPS91hVkNV9YIsIIfBgL3kUafA/iKwn
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
Cc: Stanley Chu <yschu@nuvoton.com>, Robert Richter <rric@kernel.org>, Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tali Perry <tali.perry1@gmail.com>, James Morse <james.morse@arm.com>, kernel@pengutronix.de, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, Tomer Maimon <tmaimon77@gmail.com>
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
 drivers/edac/npcm_edac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
index 6d15c1550263..2e2133b784e9 100644
--- a/drivers/edac/npcm_edac.c
+++ b/drivers/edac/npcm_edac.c
@@ -410,7 +410,7 @@ static int edac_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int edac_remove(struct platform_device *pdev)
+static void edac_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
 	struct priv_data *priv = mci->pvt_info;
@@ -426,8 +426,6 @@ static int edac_remove(struct platform_device *pdev)
 	regmap_write(npcm_regmap, pdata->ctl_int_mask_master,
 		     pdata->int_mask_master_global_mask);
 	regmap_update_bits(npcm_regmap, pdata->ctl_ecc_en, pdata->ecc_en_mask, 0);
-
-	return 0;
 }
 
 static const struct npcm_platform_data npcm750_edac = {
@@ -533,7 +531,7 @@ static struct platform_driver npcm_edac_driver = {
 		.of_match_table = npcm_edac_of_match,
 	},
 	.probe = edac_probe,
-	.remove = edac_remove,
+	.remove_new = edac_remove,
 };
 
 module_platform_driver(npcm_edac_driver);
-- 
2.40.1

