Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAC4A3C72
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:28:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9SK6FZrz30NP
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=iECD4D/h;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RfavmZ+1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=iECD4D/h; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RfavmZ+1; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Pm3CWXz2xsY
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:20 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 735945C00F8;
 Sun, 30 Jan 2022 20:26:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 30 Jan 2022 20:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=HVzBxeFpzvE6wCKGgGQrnwhzEj3CAy
 UlyiX1edYCefs=; b=iECD4D/hp9kqJyKx9f9U2MA++mxZZNX2X17iyNipTthG31
 fPMwn3P9Tj5lYGv7+uo9OQG3SCg7bBNdiPebY7CiKgld3AQahfp8EO0XyQDMre6U
 q+Skz1sBc1Oafgug5CsV62CvbkNwHDvCCFuV6JegFmVhs2wNJjVd/o/WSEgUPk/h
 aH6ZCohbMnUSi1ys1dmqVl01dIDb2dJOzn9zvl1KLj20zLVtLqlzqIpmM30q8P4L
 wgKzskf+OX9EjQM/mt4HI3WL7nrQbHWfjdzTWR5YgB1k4yqXQOAxGpkmING4CUyZ
 ZMc8QhxmYYOnVPu/w8ZOjZU7EnBYmUAo+XgyQ/4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HVzBxe
 FpzvE6wCKGgGQrnwhzEj3CAyUlyiX1edYCefs=; b=RfavmZ+1NDtm0lcNU3XR5d
 +j12HT9m2RR/wWq6K4SfXGH2l7p/0cqlYxtPqrn65xMT33kpHzfa3X3Ekwt7IhoC
 xT1Qi2LnD/hsbPXcQvQ6I3o2sYY2FlNclrjiv8iOolVwEr3TB1UpF5vF17BcuolD
 4PUARrm0o7c+57jVVd5hhfkbYZ6Z8R7luEocbD2dc1iAi07S9TbqUfTdTebpopvu
 wWrRpC2AZUztdOmiLqjEHZIdiVVfsIUqweoRwUet5QQ53ixl63rraWsjU9k/4z05
 hsPSLT7lGdVRhgS43pAX/yhUaFizm0XrSoBiUW9khvTpWhH7oJtGyJ01uqLMxmVg
 ==
X-ME-Sender: <xms:ujr3YR_Ccb3l57gE_qXpvsSxYE1fgRJKOQTEe0TXhPyOvsGlSdmA8g>
 <xme:ujr3YVudYfwxNtssmwB_X0dWUbbD1fLhMWTNpizz-bEPi24vTWDd77p0_lp3rU1o9
 egpyPMAAqlsDtcbgA>
X-ME-Received: <xmr:ujr3YfAZNBogCWmc4uVSe_j2S847SQQgpCVwexESVODP7qA4gmL7SKxQqFZfBDZMEIMfvBwEUfoeUKldqApQKrOwIZx2Js_YanzZvulZaD9aZuS3NJuip9epqrL5Y60d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ujr3YVcXoEVPRc0x7J8VM96KkoqHBuejf4czI5MylUUfxIB2-mmspA>
 <xmx:ujr3YWPemaxqIf5DdeLc-IMSPCIAKre87-shU7z4FmOAP55H41W-sw>
 <xmx:ujr3YXk-exkkILX-NCmiFvTOYVVJBd1EE0e2glJT4EQgcQZ7bZrMYg>
 <xmx:ujr3YY0WDOxIuovMPD_SHzqDNM0NLCNvLRAzlv8kRqNqS5ku7OJXhg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:16 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/6] ARM: ast2600: Control FIT
 uImage signature verification at runtime
Date: Mon, 31 Jan 2022 11:55:35 +1030
Message-Id: <20220131012538.73021-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131012538.73021-1-andrew@aj.id.au>
References: <20220131012538.73021-1-andrew@aj.id.au>
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Implement support for disabling signature verification of FIT images at
runtime by sampling the "bmc-secure-boot" GPIO. If the line name is not
provided in the devicetree then secure-boot continues to be required as
if the feature were not present.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/mach-aspeed/ast2600/Makefile      |  1 +
 arch/arm/mach-aspeed/ast2600/secure-boot.c | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm/mach-aspeed/ast2600/secure-boot.c

diff --git a/arch/arm/mach-aspeed/ast2600/Makefile b/arch/arm/mach-aspeed/ast2600/Makefile
index d07e8c737cfe..70b7ae11df56 100644
--- a/arch/arm/mach-aspeed/ast2600/Makefile
+++ b/arch/arm/mach-aspeed/ast2600/Makefile
@@ -1,4 +1,5 @@
 obj-y   += platform.o board_common.o scu_info.o utils.o cache.o
+obj-$(CONFIG_FIT_RUNTIME_SIGNATURE) += secure-boot.o
 obj-$(CONFIG_ASPEED_SECURE_BOOT) += crypto.o aspeed_verify.o
 obj-$(CONFIG_ASPEED_LOADERS) += spl_boot.o
 obj-$(CONFIG_SPL_BUILD) += spl.o
diff --git a/arch/arm/mach-aspeed/ast2600/secure-boot.c b/arch/arm/mach-aspeed/ast2600/secure-boot.c
new file mode 100644
index 000000000000..ced353686387
--- /dev/null
+++ b/arch/arm/mach-aspeed/ast2600/secure-boot.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// (C) Copyright IBM Corp. 2022
+
+#include <common.h>
+#include <asm-generic/gpio.h>
+#include <dm.h>
+
+static int aspeed_get_chained_secboot_state(void)
+{
+	struct gpio_desc desc;
+	struct udevice *dev;
+	int secboot;
+	int rc;
+
+	rc = uclass_get_device_by_driver(UCLASS_GPIO,
+					 DM_GET_DRIVER(gpio_aspeed),
+					 &dev);
+	if (rc < 0) {
+		debug("Warning: GPIO initialization failure: %d\n", rc);
+		return rc;
+	}
+
+	rc = gpio_request_by_line_name(dev, "bmc-secure-boot", &desc,
+				       GPIOD_IS_IN);
+	if (rc < 0) {
+		debug("Failed to acquire secure-boot GPIO: %d\n", rc);
+		return rc;
+	}
+
+	secboot = dm_gpio_get_value(&desc);
+	if (secboot < 0)
+		debug("Failed to read secure-boot GPIO value: %d\n", rc);
+
+	rc = dm_gpio_free(dev, &desc);
+	if (rc < 0)
+		debug("Failed to free secure-boot GPIO: %d\n", rc);
+
+	return secboot;
+}
+
+int board_fit_image_require_verified(void)
+{
+	int secboot;
+
+	secboot = aspeed_get_chained_secboot_state();
+
+	/*
+	 * If secure-boot is enabled then require signature verification.
+	 * Otherwise, if we fail to read the GPIO, enforce FIT signature
+	 * verification
+	 */
+	return secboot >= 0 ? secboot : 1;
+}
-- 
2.32.0

