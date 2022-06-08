Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F425427A5
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 09:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHzlP4jbbz2yK2
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 17:44:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H8QHFsIR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H8QHFsIR;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHzkz6rW5z2yK2
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 17:44:27 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id a10so17854807pju.3
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RhOgxYanWiuMXl7U7wesTwmLviaxw4mtkTb6hHoQXRs=;
        b=H8QHFsIR1a6HT1Fkbewfs7pD2o9HjOe10s2ZWWaLGyuNQPIHvgGU+7xAr/m3U8E5xb
         FPNGqcdyPQ7iwezbdwkabZxVLAkyesPyN0Gd//alvfJRp/EwzAMuCXKhbNIuJfaFVDp6
         iBio435zFi7fzM8g8O+S2rXwgotCWGxnJMf2HJCicQaxaU9o2zazOUCfNIYHwyfjJU/q
         tyoPUqVsXP4hesafg/b5Z0m9zQS7+WW3X801AdydZh6lqlAA8R15bu11pFGL63HHnM4v
         ssXLIIDEbB6qlxJ8ZPsgtmaexvTfHwIAr7Solslt5ymcZJKqkXVyd4E5ufeWZG18DEPQ
         pmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RhOgxYanWiuMXl7U7wesTwmLviaxw4mtkTb6hHoQXRs=;
        b=Au/uan1u/uGH+sPAiv5+7ohQdRnnDDO/eIICVhCwHEnZ3J/8rYhLdJm1B33SoOLDYj
         sTSubYCxBdvy0Hr4ke5KbYLAr6+nLVj548Vw9vqhqnI0OcNRuCaeNlb0pN+OqcAb8qZm
         tlkwe4zDQkkVVWpygQwg2vmwDA1mnGTP8A5So9Ng0G4fBYqIHNXMZXYt6T1CyAHbXclY
         CI9+wt2Ig6suPH30/lHlliv9YriXXEmTiEWtiFHH+Zgjw85s/0Oh6+oc+amyEqUohqsH
         fGaD21zv1l1QfP6AXJ5NlmNrJKKy+RzH3HWw9AXVVaXIKrDnZdEaVpmV2LfpS82RsXT7
         RGaA==
X-Gm-Message-State: AOAM5335d5yi6RFxfw+3/fG2lO63Un1GN0u97LJZ4iLXaCgpIJcDozhn
	Aixzikw7TfqM7g/H1XFS9z3gRcR1vCI=
X-Google-Smtp-Source: ABdhPJxJJPnLbyYmz5xeIVjfwbDzDwhw5W9N7c61o/Yqw8C/uDEcWJKKQ4+INQ4KxbR/sY9zEg8fjQ==
X-Received: by 2002:a17:90b:314a:b0:1e8:5362:5620 with SMTP id ip10-20020a17090b314a00b001e853625620mr23589750pjb.9.1654674264728;
        Wed, 08 Jun 2022 00:44:24 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b0016362da9a03sm13955693pla.245.2022.06.08.00.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:44:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/3] dts: ast2600: Consolidate A1 device tree
Date: Wed,  8 Jun 2022 17:14:00 +0930
Message-Id: <20220608074402.1876079-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608074402.1876079-1-joel@jms.id.au>
References: <20220608074402.1876079-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600A1 EVB device tree is the same as the AST2600, except for the
tuning parameters for the MMC and SD devices.

To reduce the maintenance required, include the AST2600 EVB device tree
and modify the nodes as appropriate.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Do these need to be different for the A1? If not, can we remove this
device tree altogether?
---
 arch/arm/dts/ast2600a1-evb.dts | 301 +--------------------------------
 1 file changed, 2 insertions(+), 299 deletions(-)

diff --git a/arch/arm/dts/ast2600a1-evb.dts b/arch/arm/dts/ast2600a1-evb.dts
index 42c6b8abe896..a28478b90ac1 100644
--- a/arch/arm/dts/ast2600a1-evb.dts
+++ b/arch/arm/dts/ast2600a1-evb.dts
@@ -1,313 +1,16 @@
 /dts-v1/;
 
-#include "ast2600-u-boot.dtsi"
+#include "ast2600-evb.dts"
 
 / {
-	model = "AST2600 EVB";
+	model = "AST2600A1 EVB";
 	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
-
-	memory {
-		device_type = "memory";
-		reg = <0x80000000 0x40000000>;
-	};
-
-	chosen {
-		stdout-path = &uart5;
-	};
-
-	aliases {
-		mmc0 = &emmc_slot0;
-		mmc1 = &sdhci_slot0;
-		mmc2 = &sdhci_slot1;
-		spi0 = &fmc;
-		spi1 = &spi1;
-		spi2 = &spi2;
-		ethernet0 = &mac0;
-		ethernet1 = &mac1;
-		ethernet2 = &mac2;
-		ethernet3 = &mac3;
-	};
-
-	cpus {
-		cpu@0 {
-			clock-frequency = <800000000>;
-		};
-		cpu@1 {
-			clock-frequency = <800000000>;
-		};
-	};
-};
-
-&uart5 {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-};
-
-&sdrammc {
-	clock-frequency = <400000000>;
-};
-
-&wdt1 {
-	status = "okay";
-};
-
-&wdt2 {
-	status = "okay";
-};
-
-&wdt3 {
-	status = "okay";
-};
-
-&mdio {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <	&pinctrl_mdio1_default &pinctrl_mdio2_default
-			&pinctrl_mdio3_default &pinctrl_mdio4_default>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	ethphy0: ethernet-phy@0 {
-		reg = <0>;
-	};
-
-	ethphy1: ethernet-phy@1 {
-		reg = <0>;
-	};
-
-	ethphy2: ethernet-phy@2 {
-		reg = <0>;
-	};
-
-	ethphy3: ethernet-phy@3 {
-		reg = <0>;
-	};
-};
-
-&mac0 {
-	status = "okay";
-	phy-mode = "rgmii-rxid";
-	phy-handle = <&ethphy0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii1_default>;
-};
-
-&mac1 {
-	status = "okay";
-	phy-mode = "rgmii-rxid";
-	phy-handle = <&ethphy1>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default>;
-};
-
-&mac2 {
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&ethphy2>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii3_default &pinctrl_mac3link_default>;	
-};
-
-&mac3 {
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&ethphy3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii4_default &pinctrl_mac4link_default>;	
-};
-
-&fmc {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_fmcquad_default>;
-
-	flash@0 {
-		status = "okay";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-
-	flash@1 {
-		status = "okay";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-
-	flash@2 {
-		status = "disabled";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-};
-
-&spi1 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
-			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
-			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
-
-	flash@0 {
-		status = "okay";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-
-	flash@1 {
-		status = "disabled";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-};
-
-&spi2 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
-			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
-
-	flash@0 {
-		status = "okay";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-
-	flash@1 {
-		status = "disabled";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
-
-	flash@2 {
-		status = "disabled";
-		spi-max-frequency = <50000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
 };
 
 &emmc {
-	u-boot,dm-pre-reloc;
 	timing-phase = <0x000700bf>;
 };
 
-&emmc_slot0 {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-	bus-width = <4>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_emmc_default>;
-	sdhci-drive-type = <1>;
-};
-
 &sdhci {
 	timing-phase = <0x01084747>;
 };
-
-&sdhci_slot0 {
-	status = "okay";
-	bus-width = <4>;
-	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
-	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sd1_default>;
-	sdhci-drive-type = <1>;
-};
-
-&sdhci_slot1 {
-	status = "okay";
-	bus-width = <4>;
-	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
-	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sd2_default>;
-	sdhci-drive-type = <1>;
-};
-
-&i2c4 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c5_default>;
-};
-
-&i2c5 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c6_default>;
-};
-
-&i2c6 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c7_default>;
-};
-
-&i2c7 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c8_default>;
-};
-
-&i2c8 {
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c9_default>;
-};
-
-
-#if 0
-&fsim0 {
-	status = "okay";
-};
-
-&fsim1 {
-	status = "okay";
-};
-#endif
-
-&ehci1 {
-	status = "okay";
-};
-
-&display_port {
-	status = "okay";
-};
-
-&scu {
-	mac0-clk-delay = <0x10 0x0a
-			  0x10 0x10
-			  0x10 0x10>;
-	mac1-clk-delay = <0x10 0x0a
-			  0x10 0x10
-			  0x10 0x10>;
-	mac2-clk-delay = <0x08 0x04
-			  0x08 0x04
-			  0x08 0x04>;
-	mac3-clk-delay = <0x08 0x04
-			  0x08 0x04
-			  0x08 0x04>;
-};
-
-&hace {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-};
-
-&acry {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-};
-- 
2.35.1

