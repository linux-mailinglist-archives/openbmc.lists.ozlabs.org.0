Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B1A35B929
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 05:49:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJZVP6R7Jz30Ml
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 13:49:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ecO0rNs9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=ecO0rNs9; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJZSR2nPBz30CF;
 Mon, 12 Apr 2021 13:47:35 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E4052729;
 Sun, 11 Apr 2021 20:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618199253;
 bh=/9Diyf4/VzFqW/JMu88ZYy2oWKINc/XukFJCIzq+LVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ecO0rNs9JS+7hUjnX8izr9hiCWWttkrflKbD1ivNG60uqdg/DxrZgG+EivCSGixRr
 BUnC1E69/NkaaEdyoR9npIxT5gtIC9ELEVweQTlHgxTjXRVOoSFWCVWIKrJyNAeqYe
 4ST0qkve2xCGkUZ13+BG4IoyINslkXjwG34cVBiY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v6 3/4] serial: 8250_aspeed_vuart: add aspeed,
 lpc-io-reg and aspeed, lpc-interrupts DT properties
Date: Sun, 11 Apr 2021 22:47:11 -0500
Message-Id: <20210412034712.16778-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412034712.16778-1-zev@bewilderbeest.net>
References: <20210412034712.16778-1-zev@bewilderbeest.net>
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These allow describing all the Aspeed VUART attributes currently
available via sysfs.  aspeed,lpc-interrupts provides a replacement for
the deprecated aspeed,sirq-polarity-sense property.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 51 ++++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 8433f8dbb186..3c239d98747f 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -28,6 +28,10 @@
 #define ASPEED_VUART_ADDRL		0x28
 #define ASPEED_VUART_ADDRH		0x2c
 
+#define ASPEED_VUART_DEFAULT_LPC_ADDR	0x3f8
+#define ASPEED_VUART_DEFAULT_SIRQ	4
+#define ASPEED_VUART_DEFAULT_SIRQ_POLARITY	IRQ_TYPE_LEVEL_LOW
+
 struct aspeed_vuart {
 	struct device		*dev;
 	void __iomem		*regs;
@@ -386,6 +390,18 @@ static void aspeed_vuart_auto_configure_sirq_polarity(
 	aspeed_vuart_set_sirq_polarity(vuart, (value & reg_mask) == 0);
 }
 
+static int aspeed_vuart_map_irq_polarity(u32 dt)
+{
+	switch (dt) {
+	case IRQ_TYPE_LEVEL_LOW:
+		return 0;
+	case IRQ_TYPE_LEVEL_HIGH:
+		return 1;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int aspeed_vuart_probe(struct platform_device *pdev)
 {
 	struct of_phandle_args sirq_polarity_sense_args;
@@ -393,8 +409,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	struct aspeed_vuart *vuart;
 	struct device_node *np;
 	struct resource *res;
-	u32 clk, prop;
-	int rc;
+	u32 clk, prop, sirq[2];
+	int rc, sirq_polarity;
 
 	np = pdev->dev.of_node;
 
@@ -501,6 +517,37 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 		of_node_put(sirq_polarity_sense_args.np);
 	}
 
+	rc = of_property_read_u32(np, "aspeed,lpc-io-reg", &prop);
+	if (rc < 0)
+		prop = ASPEED_VUART_DEFAULT_LPC_ADDR;
+
+	rc = aspeed_vuart_set_lpc_address(vuart, prop);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "invalid value in aspeed,lpc-io-reg property\n");
+		goto err_clk_disable;
+	}
+
+	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
+	if (rc < 0) {
+		sirq[0] = ASPEED_VUART_DEFAULT_SIRQ;
+		sirq[1] = ASPEED_VUART_DEFAULT_SIRQ_POLARITY;
+	}
+
+	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "invalid sirq number in aspeed,lpc-interrupts property\n");
+		goto err_clk_disable;
+	}
+
+	sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
+	if (sirq_polarity < 0) {
+		dev_err(&pdev->dev, "invalid sirq polarity in aspeed,lpc-interrupts property\n");
+		rc = sirq_polarity;
+		goto err_clk_disable;
+	}
+
+	aspeed_vuart_set_sirq_polarity(vuart, sirq_polarity);
+
 	aspeed_vuart_set_enabled(vuart, true);
 	aspeed_vuart_set_host_tx_discard(vuart, true);
 	platform_set_drvdata(pdev, vuart);
-- 
2.31.1

