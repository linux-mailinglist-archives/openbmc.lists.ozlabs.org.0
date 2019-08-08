Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C685686480
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 16:39:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4649xK465XzDqtj
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 00:39:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hz5UL/ya"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4649qF1DY2zDqW4
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 00:34:01 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m12so5011222plt.5
 for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2019 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZeMCC2yGJViBcdY1VURznMMeyB8+2Tl2+O52eDL+e+c=;
 b=Hz5UL/yaLCUMlGgOwScWH/W4ALmh6n80lE77mZDDuUFSKYsjU8YFZ5/DvrB6wfMS1M
 BLrOetW7b/9BuDcs0hTIYbHTGrhIVuIdnE6MxyF8l9u9mQ88C3TZB6lApRDCKuSxXsTx
 xoHYJWnLbnakkLOh+pOvU3oLKAaul8CWSG6EZK/niWF8ykiFofwW+oA6zEfb9CrqO6JC
 ap8SQK9Iho5PWxA1G3ZvnExgKbvjrZCVs04EJpCCBpIHR8U5RUSz0dq1zoHqI1xQxhj/
 TJmmPXwHb1gAb9c/dwaG2x2HnxZfpc/RHHgPoZKCIOcvFgVnwD9afxa3vYNdtEFIEMNs
 ptNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZeMCC2yGJViBcdY1VURznMMeyB8+2Tl2+O52eDL+e+c=;
 b=GL3KCbxR6ywGegigTPUMT6UHVkt1YhSeBhdY2ANb0fQWwPs1xv/VQaWhTquNqJe/+C
 hQHeAGbWDwLqVAPpSgRkQzi5sxqtzlDPKarP9W3J6tVuj23JPdQDesePEuhs7vGUjyVR
 keyQ7bPgWhX9MfWEWJt9kRbehZgHsxNZJyRYoUKuOBGDCcqJf4nIRlhtiV09p0Q0rqx8
 HFFjHl6PvC7Q7l57hw/nMchd09xCJ7Hp2I2FatWAQRPRmaxyWj2rA/Ty1qsgBOWX5N9K
 h5zAJmyKQyC6ajBuNbaBT/AJppiyh6dSbF8zxlI+HC+D5TDmzOn7Lj2n4kRAiF4d4sV0
 ZyRQ==
X-Gm-Message-State: APjAAAW6M6y7E8vZu2PGlKpBW5Z0X64s6IlqcSoLotUDMxzG3MjOex3M
 7OgP33W+2uYbfWYtsKOTz0/x3ID0
X-Google-Smtp-Source: APXvYqzli1Zn89EN+8XdWH7Te0DaDn6GTfcGB/lSwtk6Taju+voy8oMbD9UnFfWR9ZYk6TDcATijAg==
X-Received: by 2002:a17:902:7887:: with SMTP id
 q7mr1485138pll.129.1565274838239; 
 Thu, 08 Aug 2019 07:33:58 -0700 (PDT)
Received: from voyager.iht.com.au (210-10-229-158.cust.static-ipl.aapt.com.au.
 [210.10.229.158])
 by smtp.gmail.com with ESMTPSA id c35sm27554972pgl.72.2019.08.08.07.33.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:33:57 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2 2/2] Revert "ARM: dts: aspeed: add I2C buffer
 mode support"
Date: Fri,  9 Aug 2019 00:03:42 +0930
Message-Id: <20190808143342.27779-3-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808143342.27779-1-joel@jms.id.au>
References: <20190808143342.27779-1-joel@jms.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This reverts commit 0a3231c83471b2ceca1fed916547d702c425236f to disable
buffer mode support. It is not supported in Qemu, which means this
change cannot pass OpenBMC CI.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g4.dtsi | 61 ++++++++++----------------------
 arch/arm/boot/dts/aspeed-g5.dtsi | 61 ++++++++++----------------------
 2 files changed, 38 insertions(+), 84 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 7eaf6a549436..fd857be397bf 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -404,21 +404,12 @@
 };
 
 &i2c {
-	i2c_gr: i2c-global-regs@0 {
-		compatible = "aspeed,ast2400-i2c-gr", "syscon";
+	i2c_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,ast2400-i2c-ic";
 		reg = <0x0 0x40>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x40>;
-
-		i2c_ic: interrupt-controller@0 {
-			#interrupt-cells = <1>;
-			compatible = "aspeed,ast2400-i2c-ic";
-			reg = <0x0 0x4>;
-			interrupts = <12>;
-			interrupt-controller;
-		};
+		interrupts = <12>;
+		interrupt-controller;
 	};
 
 	i2c0: i2c-bus@40 {
@@ -426,8 +417,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>, <0x800 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x40 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -443,8 +433,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>, <0x880 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x80 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -460,8 +449,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>, <0x900 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0xc0 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -478,8 +466,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>, <0x980 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x100 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -496,8 +483,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>, <0xa00 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x140 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -514,8 +500,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>, <0xa80 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x180 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -532,8 +517,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>, <0xb00 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x1c0 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -550,8 +534,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>, <0xb80 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x300 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -568,8 +551,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>, <0xc00 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x340 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -586,8 +568,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>, <0xc80 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x380 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -604,8 +585,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>, <0xd00 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x3c0 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -622,8 +602,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>, <0xd80 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x400 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -640,8 +619,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>, <0xe00 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x440 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -658,8 +636,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>, <0xe80 0x80>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x480 0x40>;
 		compatible = "aspeed,ast2400-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 44a1a0123a8a..dc58eb8c6969 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -526,21 +526,12 @@
 };
 
 &i2c {
-	i2c_gr: i2c-global-regs@0 {
-		compatible = "aspeed,ast2500-i2c-gr", "syscon";
+	i2c_ic: interrupt-controller@0 {
+		#interrupt-cells = <1>;
+		compatible = "aspeed,ast2500-i2c-ic";
 		reg = <0x0 0x40>;
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x40>;
-
-		i2c_ic: interrupt-controller@0 {
-			#interrupt-cells = <1>;
-			compatible = "aspeed,ast2500-i2c-ic";
-			reg = <0x0 0x4>;
-			interrupts = <12>;
-			interrupt-controller;
-		};
+		interrupts = <12>;
+		interrupt-controller;
 	};
 
 	i2c0: i2c-bus@40 {
@@ -548,8 +539,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x40 0x40>, <0x200 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x40 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -565,8 +555,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x80 0x40>, <0x210 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x80 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -582,8 +571,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0xc0 0x40>, <0x220 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0xc0 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -600,8 +588,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x100 0x40>, <0x230 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x100 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -618,8 +605,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x140 0x40>, <0x240 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x140 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -636,8 +622,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x180 0x40>, <0x250 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x180 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -654,8 +639,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x1c0 0x40>, <0x260 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x1c0 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -672,8 +656,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x300 0x40>, <0x270 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x300 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -690,8 +673,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x340 0x40>, <0x280 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x340 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -708,8 +690,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x380 0x40>, <0x290 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x380 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -726,8 +707,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x3c0 0x40>, <0x2a0 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x3c0 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -744,8 +724,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x400 0x40>, <0x2b0 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x400 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -762,8 +741,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x440 0x40>, <0x2c0 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x440 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
@@ -780,8 +758,7 @@
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 
-		reg = <0x480 0x40>, <0x2d0 0x10>;
-		reg-names = "bus-regs", "buf";
+		reg = <0x480 0x40>;
 		compatible = "aspeed,ast2500-i2c-bus";
 		clocks = <&syscon ASPEED_CLK_APB>;
 		resets = <&syscon ASPEED_RESET_I2C>;
-- 
2.20.1

