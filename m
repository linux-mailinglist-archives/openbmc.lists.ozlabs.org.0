Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18830260C68
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 09:51:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bly550RqszDqQF
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 17:51:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=crapouillou.net (client-ip=89.234.176.41; helo=crapouillou.net;
 envelope-from=paul@crapouillou.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=crapouillou.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=tnYD6IS4; 
 dkim-atps=neutral
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhz741kvYzDqkc
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 21:27:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599132384; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TQYLxc3aHxXcFDX5qciZlfYToGuHk7NHkGdcnudwus=;
 b=tnYD6IS4snnHJrlJyjB0BhU2Y/BNORywG/8Sfqgkjf31/Cy4M08Lt84RUw4tdSFSBZEYNu
 wfXt8hsktCQiQYAsXl8BVqtqjHbOxuVdH6NI4gHmY0iUyY4RsQ8r0fjQOY9a19Cqpxz/T3
 yUCZWhbC7JHjcKvR2k1SabcdznHa1ig=
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
Subject: [PATCH 08/20] usb/misc: usb4604: Use pm_ptr() macro
Date: Thu,  3 Sep 2020 13:25:42 +0200
Message-Id: <20200903112554.34263-9-paul@crapouillou.net>
In-Reply-To: <20200903112554.34263-1-paul@crapouillou.net>
References: <20200903112554.34263-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2020 17:47:23 +1000
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
 drivers/usb/misc/usb4604.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/usb4604.c b/drivers/usb/misc/usb4604.c
index 1b4de651e697..2142af9bbdec 100644
--- a/drivers/usb/misc/usb4604.c
+++ b/drivers/usb/misc/usb4604.c
@@ -112,8 +112,7 @@ static int usb4604_i2c_probe(struct i2c_client *i2c,
 	return usb4604_probe(hub);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int usb4604_i2c_suspend(struct device *dev)
+static int __maybe_unused usb4604_i2c_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct usb4604 *hub = i2c_get_clientdata(client);
@@ -123,7 +122,7 @@ static int usb4604_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int usb4604_i2c_resume(struct device *dev)
+static int __maybe_unused usb4604_i2c_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct usb4604 *hub = i2c_get_clientdata(client);
@@ -132,7 +131,6 @@ static int usb4604_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(usb4604_i2c_pm_ops, usb4604_i2c_suspend,
 		usb4604_i2c_resume);
@@ -154,7 +152,7 @@ MODULE_DEVICE_TABLE(of, usb4604_of_match);
 static struct i2c_driver usb4604_i2c_driver = {
 	.driver = {
 		.name = "usb4604",
-		.pm = &usb4604_i2c_pm_ops,
+		.pm = pm_ptr(&usb4604_i2c_pm_ops),
 		.of_match_table = of_match_ptr(usb4604_of_match),
 	},
 	.probe		= usb4604_i2c_probe,
-- 
2.28.0

