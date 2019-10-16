Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AF9D9045
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 14:01:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tW9l5QZ0zDqn1
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 23:01:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dhlWL6AQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tW783ZzJzDqkw
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 22:59:32 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id q15so11159289pll.11
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rphwc6/dZ9EfKAvmGqYi3E7ziUPs/VTxdMKyJnBQAn0=;
 b=dhlWL6AQzFT4oocpn7en+HfybkXsiQroOr7UQEnn150ZrDX8lC8arF/dLKYKxfG021
 iaBJzf/Sq7Mhm4mKL1N64WaPPnbSAp6Vwq8i3K73YeimJYLojgyj9Vmo6aMrfLsyKVIq
 +bP577+IqmWohv0yWgCa1mh4rEwXSVAlU/Aa+nq0BUljp6bf2TfQLzIsmKEyuwIZ0BBJ
 cQrqa0b2twr/IRq+t78kAdDQxxj5jEXi//WYtXdTBy+uNMMWTw4LsoEAZX3A23M3o2dH
 DP9dY8svUrz2aabJv5IY/qdc28dEQ/uytciNuIocr4I044umKjuKQfpYOZ2YfA4DyanL
 42MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Rphwc6/dZ9EfKAvmGqYi3E7ziUPs/VTxdMKyJnBQAn0=;
 b=d8ZUNviCkLtgONRXPRaZozAxHzRGqAKvP7FFUE8PvcrqVDoAegO0ZL9E9Z8r3Ig0iM
 aJT+8XZUIfnu0fyAozY1DJzWxc/bK5D4t0W+Vc7xoTDrfQu0mxQI1KBFTI9YYJBrxrn3
 +TiP8rKaV5r45NaoqFPH7uOCFaMjeQk1/OmvXzjVwtOhl8nIRGPjp9NO3F2OGc8OhikT
 3Bll8zgEdHbImU2Nv/pCcKUhy2bKnyDugA/9nUoT9zNwWgLlPWDDxIrSIbrKWGN5fzML
 GnYN13yPr1wkWhlo5PUBbI66dh5aQSA8yxSkf5xiLDBsKD3vI/1MqWUx1VaWM1v5omAZ
 umrA==
X-Gm-Message-State: APjAAAWkpCu4j08SPb/mGEuaLif9IOZr2oOKfB4RBGCoSqCSWpfR7+HS
 nawPfRj6zo2M3g4XVzP3Y+sp2e/YNpI=
X-Google-Smtp-Source: APXvYqxMAR3pFLW6Wg9R+82EA9JmEHWMMPGg/+ptfTBCAM4+mTP7TvxG4F9Ca4ilk1Ra6JZ1mZjtug==
X-Received: by 2002:a17:902:b210:: with SMTP id
 t16mr39345424plr.250.1571227169055; 
 Wed, 16 Oct 2019 04:59:29 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id d19sm2561396pjz.5.2019.10.16.04.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 04:59:28 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 1/3] ARM: dts: aspeed-g6: Add remaining UARTs
Date: Wed, 16 Oct 2019 22:29:01 +1030
Message-Id: <20191016115903.24663-2-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016115903.24663-1-joel@jms.id.au>
References: <20191016115903.24663-1-joel@jms.id.au>
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

The AST2600 has five UARTs. Add UART 1 to 4.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 16dec4e08d8f..6db29ee769d5 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -28,6 +28,10 @@
 		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		i2c15 = &i2c15;
+		serial0 = &uart1;
+		serial1 = &uart2;
+		serial2 = &uart3;
+		serial3 = &uart4;
 		serial4 = &uart5;
 		serial5 = &vuart1;
 		serial6 = &vuart2;
@@ -306,6 +310,20 @@
 				status = "disabled";
 			};
 
+			uart1: serial@1e783000 {
+				compatible = "ns16550a";
+				reg = <0x1e783000 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART1CLK>;
+				resets = <&lpc_reset 4>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd1_default &pinctrl_rxd1_default>;
+				status = "disabled";
+			};
+
 			uart5: serial@1e784000 {
 				compatible = "ns16550a";
 				reg = <0x1e784000 0x1000>;
@@ -497,6 +515,48 @@
 				status = "disabled";
 			};
 
+			uart2: serial@1e78d000 {
+				compatible = "ns16550a";
+				reg = <0x1e78d000 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART2CLK>;
+				resets = <&lpc_reset 5>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
+				status = "disabled";
+			};
+
+			uart3: serial@1e78e000 {
+				compatible = "ns16550a";
+				reg = <0x1e78e000 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART3CLK>;
+				resets = <&lpc_reset 6>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
+				status = "disabled";
+			};
+
+			uart4: serial@1e78f000 {
+				compatible = "ns16550a";
+				reg = <0x1e78f000 0x20>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&syscon ASPEED_CLK_GATE_UART4CLK>;
+				resets = <&lpc_reset 7>;
+				no-loopback-test;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_txd4_default &pinctrl_rxd4_default>;
+				status = "disabled";
+			};
+
 			i2c: bus@1e78a000 {
 				compatible = "simple-bus";
 				#address-cells = <1>;
-- 
2.23.0

