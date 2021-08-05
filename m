Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945033E1EB7
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 00:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggjwj3LGXz3d8s
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 08:30:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aOcpCuuQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aOcpCuuQ; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggjtq2t6wz3bWn;
 Fri,  6 Aug 2021 08:28:35 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id a8so12450992pjk.4;
 Thu, 05 Aug 2021 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lw6gEfo2Nw0mBe3S5xni2/OM/VRr81Ls+EqynsWDkMc=;
 b=aOcpCuuQ0oZecIVFgmbyx/nUvanBWvhzq2rfR/nVSM0vyTA3cNp7Z8RlCAWGJ7c9zg
 xuZ371oGoGa3EfR8yul5t/RSNzV9G11LIBo4G7oR892flIJExRxaU4rJRbrcFXgDMmdm
 KmgJv2gfQ+P8AURFIwp+ZphhLAwFhf/HbISR2u8yUAkNkHnDxQLqO5wgkCNOyQFe8do5
 5aUfD1+gaCN7gveWCB16RT+f/Oiu+xknX5OlyIX7vcgE5O9Gknr6gMih+FHiVOfNQ931
 dSsAmE8PHrWH6TXla+tkxw7+OSyZ6noX3ogHoBRG33VJIfi2jkQwpgZgXg35N8bhBIsO
 7Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lw6gEfo2Nw0mBe3S5xni2/OM/VRr81Ls+EqynsWDkMc=;
 b=RW+8FvHnp82DC0uRyVwPZRf3DFt2A6PsMA/gERqj0mDjRrEZJEBQgo91zklIB3WXVy
 3cauFsZH6RYPhLI0LAtqZh4Fhhl2N/OL77m8O+/4VpBpUYcjeOS8QmwMsKbW2uVeGn5g
 5LzEy6kdDP+H31WOXpEefu3S1tjd1NA1I365ndeD1EFogGQQxF+RrP61u3JMBKGeja6F
 1qbwvcaBo/3uI/GaeroGQdo0BCu9Z+G/3JSsBQaYmi0b36PfVOcSjncL2nL3489kLfvL
 ZMJcaeqxSwqEyu9MK1ID59Cz+pudvd4oqQKPsm3LXS3Mv1qPtGCSKVW17STODk3dTnir
 /F+Q==
X-Gm-Message-State: AOAM532e83EW4iu3oeuYN4Ue829IuulIz3m7P/OQbB/s+vYVbc/t7CbT
 6BLsowQyp3rDNF/ChiDE3sI=
X-Google-Smtp-Source: ABdhPJzOXA2xJb3hzf499cQvBTj3sFISjd2xApvkTjWJm88fkqrqkVChquuhHW4AnYTQa+r8MGVViA==
X-Received: by 2002:a62:36c5:0:b029:32b:83fa:3a3e with SMTP id
 d188-20020a6236c50000b029032b83fa3a3emr1603833pfa.52.1628202512620; 
 Thu, 05 Aug 2021 15:28:32 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b26sm8082292pfo.47.2021.08.05.15.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 15:28:32 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 3/6] ARM: dts: aspeed: Common dtsi for Facebook AST2600
 Network BMCs
Date: Thu,  5 Aug 2021 15:28:15 -0700
Message-Id: <20210805222818.8391-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210805222818.8391-1-rentao.bupt@gmail.com>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

This common descirption is included by all Facebook AST2600 Network BMC
platforms to minimize duplicated device entries across Facebook Network
BMC device trees.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
  - "mac3" is removed from the dtsi (moved to platform dts files).

 .../dts/ast2600-facebook-netbmc-common.dtsi   | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi

diff --git a/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
new file mode 100644
index 000000000000..051de5bec345
--- /dev/null
+++ b/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2020 Facebook Inc.
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	aliases {
+		mmc0 = &emmc;
+		spi1 = &spi1;
+		spi2 = &spi_gpio;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,9600n8 root=/dev/ram rw vmalloc=640M";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x80000000>;
+	};
+
+	/*
+	 * GPIO-based SPI Master is required to access SPI TPM, because
+	 * full-duplex SPI transactions are not supported by ASPEED SPI
+	 * Controllers.
+	 */
+	spi_gpio: spi-gpio {
+		status = "okay";
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi0.0";
+
+#include "facebook-bmc-flash-layout-128.dtsi"
+	};
+
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "spi0.1";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			flash1@0 {
+				reg = <0x0 0x8000000>;
+				label = "flash1";
+			};
+		};
+	};
+};
+
+&spi1 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c5 {
+	status = "okay";
+};
+
+&i2c6 {
+	status = "okay";
+};
+
+&i2c7 {
+	status = "okay";
+};
+
+&i2c8 {
+	status = "okay";
+};
+
+&i2c9 {
+	status = "okay";
+};
+
+&i2c10 {
+	status = "okay";
+};
+
+&i2c12 {
+	status = "okay";
+};
+
+&i2c13 {
+	status = "okay";
+};
+
+&i2c15 {
+	status = "okay";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&emmc_controller {
+	status = "okay";
+};
+
+&emmc {
+	status = "okay";
+
+	non-removable;
+	max-frequency = <25000000>;
+	bus-width = <4>;
+};
+
+&rtc {
+	status = "okay";
+};
-- 
2.17.1

