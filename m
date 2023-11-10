Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA667E75DD
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 01:19:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GwVpqZfb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRKFG3ShQz3cVM
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 11:19:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=GwVpqZfb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRKBb6xJqz2yts
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 11:16:55 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6E0B14272;
	Thu,  9 Nov 2023 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1699575409;
	bh=pU6UE+Qk2zX40oDS9XVXtRtwwYioZf7z91p1xBGiaSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GwVpqZfbuExTanPTlQhfMJJz9y3tUA1R17tG9TBiNRICBnncwgrTW/FCangI3GzuJ
	 K0jkZYNKIiius3N4m52TGzaltZMNSq7H8fFnTyFFDXsvXky4ufk165/aN6R7hcGYnD
	 5jO6u6kDHxQwAo9e1RNLfUQ5Z61KaB13HpTvfPfo=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH linux dev-6.5 2/2] watchdog: aspeed: Add support for aspeed,reset-mask DT property
Date: Thu,  9 Nov 2023 16:16:37 -0800
Message-ID: <20231110001634.6638-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231110001634.6638-4-zev@bewilderbeest.net>
References: <20231110001634.6638-4-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This property allows the device-tree to specify how the Aspeed
watchdog timer's reset mask register(s) should be set, so that
peripherals can be individually exempted from (or opted in to) being
reset when the watchdog timer expires.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20230922104231.1434-6-zev@bewilderbeest.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
(cherry picked from commit 6a6c7b006e5cd55cce0fc4e7be0e7bb3a94b064b)
---
 drivers/watchdog/aspeed_wdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b72a858bbac7..b4773a6aaf8c 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -79,6 +79,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
 #define WDT_CLEAR_TIMEOUT_STATUS	0x14
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
+#define WDT_RESET_MASK1		0x1c
+#define WDT_RESET_MASK2		0x20
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -402,6 +404,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
 		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
+		u32 reset_mask[2];
+		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
 		reg &= wdt->cfg->ext_pulse_width_mask;
@@ -419,6 +423,13 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 			reg |= WDT_OPEN_DRAIN_MAGIC;
 
 		writel(reg, wdt->base + WDT_RESET_WIDTH);
+
+		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
+		if (!ret) {
+			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
+			if (nrstmask > 1)
+				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
+		}
 	}
 
 	if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &duration)) {
-- 
2.42.0

