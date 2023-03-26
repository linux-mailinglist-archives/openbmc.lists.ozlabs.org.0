Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC03D6C956B
	for <lists+openbmc@lfdr.de>; Sun, 26 Mar 2023 16:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pkz2Y4NYKz3cdR
	for <lists+openbmc@lfdr.de>; Mon, 27 Mar 2023 01:33:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pkz2468wqz3cKv
	for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2023 01:32:58 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQA-0007qX-KM; Sun, 26 Mar 2023 16:32:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ6-006ra3-7V; Sun, 26 Mar 2023 16:32:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pgRQ5-0088Ut-7N; Sun, 26 Mar 2023 16:32:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 017/117] media: aspeed-video: Convert to platform remove callback returning void
Date: Sun, 26 Mar 2023 16:30:44 +0200
Message-Id: <20230326143224.572654-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KutP+Y7ggmovOkH+OeVwSMF2KZqCIcZODewIzhblqao=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFab2ufSfDado4VWw1jF8GYECshQZd+1a/zYg l4extXNT1OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBWmwAKCRCPgPtYfRL+ ToulCACHe8Da4FGG6yr9pXEmGcObel9MPRf1adnzUFyvkzR6IwLKPCgsOK11dGO2PnKVGe8zk61 FO+ohs1dSvLOM3MYJK1qZGCOn1fqXYBVeEkFGBeZBNeQkjVIvGi26NHIvqWuT+2nAQf1BinQzVy afjG1+u8rDvbDemgkbYniZrmNr/bYzmAgC7zcDX6emS/Qd0yyjid3+JIFXrtJaTnwSqAG7tKssB aC7AZ6XbOMypiGzO1y1rnJm2svskBsEECXiCm3gKh842J+BBctxlRgYJHQRHpRMT5zl8NBFd/Fn 3TttGRDOLyBGmP8RZOA3TbM0P+DU++97B6D/AM2ySH1Gh2pE
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
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
 drivers/media/platform/aspeed/aspeed-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 794d4dc3a654..374eb7781936 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2206,7 +2206,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int aspeed_video_remove(struct platform_device *pdev)
+static void aspeed_video_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
@@ -2228,8 +2228,6 @@ static int aspeed_video_remove(struct platform_device *pdev)
 	aspeed_video_free_buf(video, &video->jpeg);
 
 	of_reserved_mem_device_release(dev);
-
-	return 0;
 }
 
 static struct platform_driver aspeed_video_driver = {
@@ -2238,7 +2236,7 @@ static struct platform_driver aspeed_video_driver = {
 		.of_match_table = aspeed_video_of_match,
 	},
 	.probe = aspeed_video_probe,
-	.remove = aspeed_video_remove,
+	.remove_new = aspeed_video_remove,
 };
 
 module_platform_driver(aspeed_video_driver);
-- 
2.39.2

