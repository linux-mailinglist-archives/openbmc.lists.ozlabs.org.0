Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BE7E60D9
	for <lists+openbmc@lfdr.de>; Thu,  9 Nov 2023 00:08:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=QFLHml3D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQgkL5dzrz3cJN
	for <lists+openbmc@lfdr.de>; Thu,  9 Nov 2023 10:08:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=QFLHml3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQgjm6xgbz2yQL
	for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2023 10:08:12 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A7CB0D8B;
	Wed,  8 Nov 2023 15:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1699484890;
	bh=GLESeumA2sTSmTxyTQjWMTy8SnMTteI54UvZ/NVDX6w=;
	h=From:To:Cc:Subject:Date:From;
	b=QFLHml3DvsJDpKbW4SstNy6TnpzwucgvdSldnbFRulpNnhWLQ6fZP3wybRHLk2ijq
	 8jy62COJmt144lpR3LyvErepNV7PlQRlhDP/0lMWHW1eJCHbi6JBYBGuQavRxy9kWj
	 nGkJ3XjgDH7plDkGgMdVemB56s+BnxsiiWvwvoX0=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH linux dev-6.5] pinctrl: aspeed: Allow changing SPI mode from hardware strap defaults
Date: Wed,  8 Nov 2023 15:07:55 -0800
Message-ID: <20231108230754.17064-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
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

Some platforms unfortunately have their SPI mode selection bits
strapped incorrectly (such as being configured for passthrough mode
when master mode is in fact the only useful configuration for it) and
thus require correction in software.  Add the SPI mode bits to the
GPIO passthrough bits as the exceptions to the read-only rule for the
hardware strap register so that the pinctrl subsystem can be used for
such corrections.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Link: https://lore.kernel.org/r/20231005030849.11352-2-zev@bewilderbeest.net
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
(cherry picked from commit d875d6ccd36f5eed25829d483b12df6ed826f9b5)
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 19 ++++++++++++-------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 19 ++++++++++++-------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index bfed0e274643..774f8d05142f 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2563,15 +2563,20 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 		 * deconfigured and is the reason we re-evaluate after writing
 		 * all descriptor bits.
 		 *
-		 * Port D and port E GPIO loopback modes are the only exception
-		 * as those are commonly used with front-panel buttons to allow
-		 * normal operation of the host when the BMC is powered off or
-		 * fails to boot. Once the BMC has booted, the loopback mode
-		 * must be disabled for the BMC to control host power-on and
-		 * reset.
+		 * We make two exceptions to the read-only rule:
+		 *
+		 * - The passthrough mode of GPIO ports D and E are commonly
+		 *   used with front-panel buttons to allow normal operation
+		 *   of the host if the BMC is powered off or fails to boot.
+		 *   Once the BMC has booted, the loopback mode must be
+		 *   disabled for the BMC to control host power-on and reset.
+		 *
+		 * - The operating mode of the SPI1 interface is simply
+		 *   strapped incorrectly on some systems and requires a
+		 *   software fixup, which we allow to be done via pinctrl.
 		 */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
-		    !(desc->mask & (BIT(21) | BIT(22))))
+		    !(desc->mask & (BIT(22) | BIT(21) | BIT(13) | BIT(12))))
 			continue;
 
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 4c0d26606b6c..5bb8fd0d1e41 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2742,15 +2742,20 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 		 * deconfigured and is the reason we re-evaluate after writing
 		 * all descriptor bits.
 		 *
-		 * Port D and port E GPIO loopback modes are the only exception
-		 * as those are commonly used with front-panel buttons to allow
-		 * normal operation of the host when the BMC is powered off or
-		 * fails to boot. Once the BMC has booted, the loopback mode
-		 * must be disabled for the BMC to control host power-on and
-		 * reset.
+		 * We make two exceptions to the read-only rule:
+		 *
+		 * - The passthrough mode of GPIO ports D and E are commonly
+		 *   used with front-panel buttons to allow normal operation
+		 *   of the host if the BMC is powered off or fails to boot.
+		 *   Once the BMC has booted, the loopback mode must be
+		 *   disabled for the BMC to control host power-on and reset.
+		 *
+		 * - The operating mode of the SPI1 interface is simply
+		 *   strapped incorrectly on some systems and requires a
+		 *   software fixup, which we allow to be done via pinctrl.
 		 */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
-		    !(desc->mask & (BIT(21) | BIT(22))))
+		    !(desc->mask & (BIT(22) | BIT(21) | BIT(13) | BIT(12))))
 			continue;
 
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
-- 
2.42.0

