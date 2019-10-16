Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB28D8608
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:49:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tGwk6Qp8zDqq5
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 13:49:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H4fxg7dX"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tGw34BgPzDqj4
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 13:49:06 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id v4so13723532pff.6
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 19:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2mp6IUCpj4WZi9c1IjrpNX0bUPO+hffzjEfaGdWNQC0=;
 b=H4fxg7dX2DT1GhUtlh3dbpzQfYVphwTIkXii/p/B4Dy8pezuBZoIG3deP2B8WwXG58
 yQ1noETSAQko3a9jFx7+95zRe88KUXKcdqSaOXQ+g1xnLxamyMN8U3OTfCejmAsoh1w6
 TtoeWMNlES6/BXr57W/wGvo4BSNlTamhtwiNvvMyq7Q1WQ+7I/5RGEybisg/XkkYe1fp
 WgYLhIYHlTiyoArlBgjPzEkLSGPG5eb2qRCVjn0hMnDEJGFZPgz97QA3Xje0wD6onZti
 Um+KOvKsw/oQv4iMCLMp4A9LCs3cN12dGjVf+m+lyC58Z/ee8rKqq5er1AeMSn9Sk+GN
 qR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2mp6IUCpj4WZi9c1IjrpNX0bUPO+hffzjEfaGdWNQC0=;
 b=HSk7Oi70tMP9vK5TgXbF3scIqbHALBmCjthq5VxMF94s4geGbUhZuhk/f8YG9dXJzW
 0+dhc+ttLJrvfScErZcFi8K+ijOGzpRVwG+9XWn1mce1EFrWBJfqOO+F3frcybNYBm4n
 LkT7VB81ApV0Jm0KSMEcmDGCvGf+aatn6BQBPZ++G8Gz7MKSXZ4wXLGINykzc0ucuFGf
 ayPBh1amOgbCPFoe7Gn3PQYtbWmaLepKyMA7/1p4b4kolSlOxn+9kaVYd5lIXwkan/1X
 boQvpAhoH/GVbxk0k3w/Ko7sZYcwQm/hm26X3mERF+FKUyTCPw5wkm631MN2FlahXKAw
 ZPCw==
X-Gm-Message-State: APjAAAXosfSUCff76tPhhY6DUVYDRdNnyQ0rDpqKMnwObqLhVh6xu1YQ
 4hVXkBGavSzxdS3HfIkPLwgdICGy4t4=
X-Google-Smtp-Source: APXvYqyBwZrIBMlO9jQLfd0Qsj/n4sl4Wk2BfRa2R7VRphn9y9gB12wG5OWcaPPhveT4ypoyOZPJ3Q==
X-Received: by 2002:a62:6411:: with SMTP id y17mr42405184pfb.24.1571194142964; 
 Tue, 15 Oct 2019 19:49:02 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id 30sm615563pjk.25.2019.10.15.19.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 19:49:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed-g6: Fix i2c clock source
Date: Wed, 16 Oct 2019 13:18:57 +1030
Message-Id: <20191016024857.16251-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
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
Cc: Andrew Jeffery <andrew@aj.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The upstream clock for the I2C buses is APB2.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 8ac435b3dbde..16dec4e08d8f 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -530,13 +530,13 @@
 #include "aspeed-g6-pinctrl.dtsi"
 
 &i2c {
-	i2c0: i2c-bus@40 {
+	i2c0: i2c-bus@80 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		#interrupt-cells = <1>;
 		reg = <0x80 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -551,7 +551,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x100 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -566,7 +566,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x180 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -581,7 +581,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x200 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -596,7 +596,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x280 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -611,7 +611,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x300 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -626,7 +626,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x380 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -641,7 +641,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x400 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -656,7 +656,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x480 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -671,7 +671,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x500 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -686,7 +686,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x580 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -701,7 +701,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x600 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -716,7 +716,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x680 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -731,7 +731,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x700 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -746,7 +746,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x780 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
@@ -761,7 +761,7 @@
 		#interrupt-cells = <1>;
 		reg = <0x800 0x80>;
 		compatible = "aspeed,ast2600-i2c-bus";
-		clocks = <&syscon ASPEED_CLK_APB1>;
+		clocks = <&syscon ASPEED_CLK_APB2>;
 		resets = <&syscon ASPEED_RESET_I2C>;
 		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 		bus-frequency = <100000>;
-- 
2.23.0

