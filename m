Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F916577E0C
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbRm2xDkz3c31
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:56:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cFVdC5ux;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cFVdC5ux;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbQg2xkVz2xKw
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:55:39 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id 89-20020a17090a09e200b001ef7638e536so17514598pjo.3
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KJ6i0PtKjIaFU87xSgWB0nyKQUt/3TSs5WSfQO0PzeA=;
        b=cFVdC5uxLlAjMRb61uAvAL41tgTPe1A97ywiHvtJTYuuD1lkLKhQfdeLaaKH/pVais
         5kKcPCm5tPJJoTq3eS8bWUNezz51dtIH6weDuQXuTkTS65PswgaC/MKCGJFtZ/vSq1+v
         uLYosqzy/h0JrrBl09YUO/q5PIvh2jnzmuKuOv4TCh5Zh/cmraqcjdqIdLhmUvVcdByh
         yvQ56zGazKHVamU7jhsF9LKcXkGeUFM6y/iJV0BcxN5LUtSP70kySv6jdQKiZ3PidbUL
         3LpKpecT1gBcm8kLJJEqKEa3WfpeTqExHqfZvSgslDTyJ/avxBgE3+GSzjwuZ9IH4opf
         WNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=KJ6i0PtKjIaFU87xSgWB0nyKQUt/3TSs5WSfQO0PzeA=;
        b=jJAX5+k0aiv2RqlJFWrZvLzvoJt/JMQ40vZgQ1FmVZS9rNVQ+AoE2EhkDTRz6vR8eC
         HjzdpIqopoBRAkMysI8a9QmyQ2zhbEq5wb/bOyf8SypOPpcF343TZnod7UqvpPcOqcmM
         GNNb3COIbpEeI03BYZdylSmctHa3rg4oSH1qrEyzdfGhqTgcj52T8x8qvvFj19TQZknj
         2hE/SaVGHNSF38s5BDWgjpXEoR6G3B6CYvT0AMrvupbHnGW+HI2aw3eGpftk7wa4A0MB
         hVlmCvTyt6vYPjsm7CAmzS9v044BOdgA3g3+yYyl8snzcR3woW9rWKRSoYXrCYOsNDIr
         3vbg==
X-Gm-Message-State: AJIora8igRm+lSPBQBG2Mohwj06UVKuzfNAYyOIN8oL8O0Ymhq+LOY4W
	NDY8PLgwymnbNUUAh0sVddIWt5kCEIQ=
X-Google-Smtp-Source: AGRyM1tqyPhX8NMVZB2ZOREAiI8TZtXH8wrT70UymGBXj8xIeXSF9mvWlgIiGr5eFUFJ6CymRUxrxQ==
X-Received: by 2002:a17:902:d405:b0:16b:f1ee:27c0 with SMTP id b5-20020a170902d40500b0016bf1ee27c0mr26586427ple.10.1658134536778;
        Mon, 18 Jul 2022 01:55:36 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b0016c5306917fsm8750575pld.53.2022.07.18.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:55:35 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ARM: dts: ast2600: Undo I2C hacks
Date: Mon, 18 Jul 2022 18:25:22 +0930
Message-Id: <20220718085523.1140566-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220718085523.1140566-1-joel@jms.id.au>
References: <20220718085523.1140566-1-joel@jms.id.au>
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The device tree matches Linux, and shouldn't be changed.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/ast2600_i2c.c |  2 +-
 arch/arm/dts/ast2600.dtsi | 32 ++++++++++++++++----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/ast2600_i2c.c b/drivers/i2c/ast2600_i2c.c
index f1aebe0b733f..5eda2909c661 100644
--- a/drivers/i2c/ast2600_i2c.c
+++ b/drivers/i2c/ast2600_i2c.c
@@ -385,7 +385,7 @@ static const struct dm_i2c_ops ast2600_i2c_ops = {
 };
 
 static const struct udevice_id ast2600_i2c_ids[] = {
-	{ .compatible = "aspeed,ast2600-i2c" },
+	{ .compatible = "aspeed,ast2600-i2c-bus" },
 	{},
 };
 
diff --git a/arch/arm/dts/ast2600.dtsi b/arch/arm/dts/ast2600.dtsi
index 7b39bbbd20b7..72f21c834bf0 100644
--- a/arch/arm/dts/ast2600.dtsi
+++ b/arch/arm/dts/ast2600.dtsi
@@ -796,7 +796,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x80 0x80 0xC00 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -811,7 +811,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x100 0x80 0xC20 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -826,7 +826,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x180 0x80 0xC40 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -840,7 +840,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x200 0x40 0xC60 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -854,7 +854,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x280 0x80 0xC80 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -868,7 +868,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x300 0x40 0xCA0 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -882,7 +882,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x380 0x80 0xCC0 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -896,7 +896,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x400 0x80 0xCE0 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -910,7 +910,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x480 0x80 0xD00 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -924,7 +924,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x500 0x80 0xD20 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -939,7 +939,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x580 0x80 0xD40 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -954,7 +954,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x600 0x80 0xD60 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -969,7 +969,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x680 0x80 0xD80 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -984,7 +984,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x700 0x80 0xDA0 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -999,7 +999,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x780 0x80 0xDC0 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
@@ -1014,7 +1014,7 @@
 		#interrupt-cells = <1>;
 
 		reg = <0x800 0x80 0xDE0 0x20>;
-		compatible = "aspeed,ast2600-i2c";
+		compatible = "aspeed,ast2600-i2c-bus";
 		bus-frequency = <100000>;
 		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&scu ASPEED_CLK_APB2>;
-- 
2.35.1

