Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA26A9D7A
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 18:22:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSvtY3767z3cBk
	for <lists+openbmc@lfdr.de>; Sat,  4 Mar 2023 04:22:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSvrt2fQTz3cJv
	for <openbmc@lists.ozlabs.org>; Sat,  4 Mar 2023 04:21:18 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95V-0006P2-0S; Fri, 03 Mar 2023 18:20:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95Q-001bio-Fa; Fri, 03 Mar 2023 18:20:52 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pY95P-001ti2-KO; Fri, 03 Mar 2023 18:20:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 03/87] spi: aspeed-smc: Convert to platform remove callback returning void
Date: Fri,  3 Mar 2023 18:19:17 +0100
Message-Id: <20230303172041.2103336-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=o5sJFUxoNT7gwytQoziVYIAoannDkz/5r4cZ/QJwJjk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAisW7UH+01oobN1QWAUpph1uqBXyOJkpZ0nOy DUyy4zqZLmJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAIrFgAKCRDB/BR4rcrs CVMZB/9QkIFFT+vICGEx1YNlTkfjJVHM2QBt+NJNDA+HWzdkKDRW887iFtRGjsWRE9BbDDMkdP7 pUvFIYAZp+H13c8zm+6MujgtilCOebLnxM+rB1tZWKrsONWuAEJMo3QAofdSv/QnHWqaM6saL2L 5B54oAhsa13wvLhOso6pteb1zacagtz6GwAN+L2lgWDf/rCWobpodrdf8oq7WPjyB2GHOBED8xR 17oUoJcLxpNIPvs6raYkbYKRTFY2z7dgYJKGg1gapaqJvnZsC/VY056kJnhA10Fd07y+dj4cxFH DHibwpa3DL752UFe8mGEYBxFceANuh4Jzs2Jv6cjw3c6hWch
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-aspeed-smc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 873ff2cf72c9..3f2548860317 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -787,13 +787,12 @@ static int aspeed_spi_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int aspeed_spi_remove(struct platform_device *pdev)
+static void aspeed_spi_remove(struct platform_device *pdev)
 {
 	struct aspeed_spi *aspi = platform_get_drvdata(pdev);
 
 	aspeed_spi_enable(aspi, false);
 	clk_disable_unprepare(aspi->clk);
-	return 0;
 }
 
 /*
@@ -1201,7 +1200,7 @@ MODULE_DEVICE_TABLE(of, aspeed_spi_matches);
 
 static struct platform_driver aspeed_spi_driver = {
 	.probe			= aspeed_spi_probe,
-	.remove			= aspeed_spi_remove,
+	.remove_new		= aspeed_spi_remove,
 	.driver	= {
 		.name		= DEVICE_NAME,
 		.of_match_table = aspeed_spi_matches,
-- 
2.39.1

