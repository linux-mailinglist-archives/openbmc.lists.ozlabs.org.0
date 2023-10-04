Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 538207B7882
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 09:17:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hadfSUMf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0mGj6Qydz3cHN
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 18:17:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=hadfSUMf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0mG61Jsxz30P0;
	Wed,  4 Oct 2023 18:16:46 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id DAF71DD9;
	Wed,  4 Oct 2023 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1696403803;
	bh=yFCKItcXGPE1Q+oFb43qALwVs7ooi/Pj1fioqFcF6gw=;
	h=From:To:Cc:Subject:Date:From;
	b=hadfSUMfsGJ2vkIP/x8ARWUdzgF/1O22W2p3kl7aFETYKCgQYjqWYD8dd+u5IMAAb
	 QwIJfiO2YOrAUYq9LkkngRKjaINpWN+x9ECkRf7URPtuomY/zTeiNAxm2O2wvooZcE
	 b7E7qQkbbCzfQW+29dD3HVZmiKypiBPXXo7HwIbY=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] pinctrl: aspeed: Allow changing hardware strap defaults
Date: Wed,  4 Oct 2023 00:16:06 -0700
Message-ID: <20231004071605.21323-2-zev@bewilderbeest.net>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Zev Weiss <zev@bewilderbeest.net>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Previously we've generally assumed that the defaults in the hardware
strapping register are in fact appropriate for the system and thus
have avoided making any changes to its contents (with the exception of
the bits controlling the GPIO passthrough feature).

Unfortunately, on some platforms corrections from software are
required as the hardware strapping is simply incorrect for the system
(such as the SPI1 interface being configured for passthrough mode when
master mode is in fact the only useful configuration for it).  We thus
remove the checks preventing changes to the strap register so that the
pinctrl subsystem can be used for such corrections.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 21 ---------------------
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 21 ---------------------
 drivers/pinctrl/aspeed/pinmux-aspeed.h     |  3 ---
 3 files changed, 45 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index bfed0e274643..7ecfe3e4280e 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -2556,27 +2556,6 @@ static int aspeed_g4_sig_expr_set(struct aspeed_pinmux_data *ctx,
 		if (!ctx->maps[desc->ip])
 			return -ENODEV;
 
-		/*
-		 * Strap registers are configured in hardware or by early-boot
-		 * firmware. Treat them as read-only despite that we can write
-		 * them. This may mean that certain functions cannot be
-		 * deconfigured and is the reason we re-evaluate after writing
-		 * all descriptor bits.
-		 *
-		 * Port D and port E GPIO loopback modes are the only exception
-		 * as those are commonly used with front-panel buttons to allow
-		 * normal operation of the host when the BMC is powered off or
-		 * fails to boot. Once the BMC has booted, the loopback mode
-		 * must be disabled for the BMC to control host power-on and
-		 * reset.
-		 */
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
-		    !(desc->mask & (BIT(21) | BIT(22))))
-			continue;
-
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
-			continue;
-
 		ret = regmap_update_bits(ctx->maps[desc->ip], desc->reg,
 					 desc->mask, val);
 
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 4c0d26606b6c..3e57e76c2eb7 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2735,27 +2735,6 @@ static int aspeed_g5_sig_expr_set(struct aspeed_pinmux_data *ctx,
 			return PTR_ERR(map);
 		}
 
-		/*
-		 * Strap registers are configured in hardware or by early-boot
-		 * firmware. Treat them as read-only despite that we can write
-		 * them. This may mean that certain functions cannot be
-		 * deconfigured and is the reason we re-evaluate after writing
-		 * all descriptor bits.
-		 *
-		 * Port D and port E GPIO loopback modes are the only exception
-		 * as those are commonly used with front-panel buttons to allow
-		 * normal operation of the host when the BMC is powered off or
-		 * fails to boot. Once the BMC has booted, the loopback mode
-		 * must be disabled for the BMC to control host power-on and
-		 * reset.
-		 */
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1 &&
-		    !(desc->mask & (BIT(21) | BIT(22))))
-			continue;
-
-		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP2)
-			continue;
-
 		/* On AST2500, Set bits in SCU70 are cleared from SCU7C */
 		if (desc->ip == ASPEED_IP_SCU && desc->reg == HW_STRAP1) {
 			u32 value = ~val & desc->mask;
diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index aaa78a613196..e9068acd5879 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -16,9 +16,6 @@
  * bits. Some difficulty arises as the pin's function bit masks for each
  * priority level are frequently not the same (i.e. cannot just flip a bit to
  * change from a high to low priority signal), or even in the same register.
- * Further, not all signals can be unmuxed, as some expressions depend on
- * values in the hardware strapping register (which may be treated as
- * read-only).
  *
  * SoC Multi-function Pin Expression Examples
  * ------------------------------------------
-- 
2.42.0

