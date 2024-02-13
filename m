Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4646B85271B
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 02:53:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cm+vuK/f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYkqs1Lvzz3cCr
	for <lists+openbmc@lfdr.de>; Tue, 13 Feb 2024 12:53:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cm+vuK/f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYkpS68kJz2xwD;
	Tue, 13 Feb 2024 12:52:00 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 07BABA15;
	Mon, 12 Feb 2024 17:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1707789115;
	bh=EU+GYVFoVSrVPFH+I5Rq0CxlWwOPwFjuP4K4HYrpXM4=;
	h=From:To:Cc:Subject:Date:From;
	b=cm+vuK/fGnBwBPyf2B1dtsj6Fmbr2traTegxGV8HfYLApU+8uRoVk+CP30oURWfcS
	 LPkpSr8LYDvy8geca9x+pCT47R8ELbeZVUASM2AktntmXpnVDJ1fyg9McwLcVPw7US
	 TavtV6qXQn+rSnvkc32hJBHfDlsT7lnRJXRNgE/4=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: asrock: Add BIOS SPI flash chips
Date: Mon, 12 Feb 2024 17:51:36 -0800
Message-ID: <20240213015138.12452-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On e3c246d4i, e3c256d4i, romed8hm3, and spc621d8hm3 the host firmware
flash is accessible to the BMC via the AST2500 SPI1 interface with an
external GPIO-controlled mux switching the flash chip between the host
and the BMC.

The default state of the mux GPIO leaves it connected to the host, so
the BMC's attempt to bind a driver to it during its boot sequence will
fail, but a write to a sysfs 'bind' file after toggling the mux GPIO
(along with whatever other preparatory steps are required) can later
allow it to be attached and accessed by the BMC.  It's not an ideal
arrangement, but in the absence of DT overlays or any other
alternative it is at least a functional one, if somewhat clumsily so.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Note that this patch is based on Joel's for-next tree, since the
e3c256d4i and spc621d8hm3 device-trees haven't been merged in mainline
yet.

 .../boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts  | 12 ++++++++++++
 .../boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts  | 12 ++++++++++++
 .../boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts  | 12 ++++++++++++
 .../dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts     | 12 ++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts
index c4b2efbfdf56..557ce20e305d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dts
@@ -68,6 +68,18 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		label = "bios";
+		m25p,fast-read;
+		spi-max-frequency = <25000000>; /* 25 MHz */
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
index 263fcc8106ff..bf752ff8204f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
@@ -69,6 +69,18 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		label = "bios";
+		m25p,fast-read;
+		spi-max-frequency = <25000000>; /* 25 MHz */
+	};
+};
+
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
index 4554abf0c7cd..8dff2cbf042b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dts
@@ -56,6 +56,18 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		label = "bios";
+		m25p,fast-read;
+		spi-max-frequency = <33000000>; /* 33 MHz */
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
index 555485871e7a..54b40776c7e3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dts
@@ -66,6 +66,18 @@ flash@0 {
 	};
 };
 
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default>;
+	flash@0 {
+		status = "okay";
+		label = "bios";
+		m25p,fast-read;
+		spi-max-frequency = <17000000>; /* 17 MHz */
+	};
+};
+
 &uart5 {
 	status = "okay";
 };
-- 
2.43.0

