Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C245427BE
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 09:46:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHznS0QMBz3bn5
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 17:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WE84D5Cz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WE84D5Cz;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHzl55vxRz3bl5
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 17:44:33 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id w13-20020a17090a780d00b001e8961b355dso5863363pjk.5
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 00:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9jRirq9eagzpWvFgkxNnqKOUce9E8KvkK0W6kIY+xw=;
        b=WE84D5Cz2HgaqvNrlM9M9sCJuZiarWXpnFF9ucte033cs2nU7rmvvTbY6boMhGRYDc
         OipblbrV2nDC1Vt11kQLfrfe4/WdmxlC/Ib3jabFcXjZw4xNsRdqzRAi0CIQbyHg+mqk
         XTQis6G+qB6Reqrx7AnMtggHqsGfwGYG/3AY/F3BaQ3QaD0foDYtgekbbFaBxUu+DH48
         C82nC9RQrIMZJJi/Nu43qmF8bhxIA+RPIYp4ilRwyW/dWJuvkZZV87nFl+KGaGU5uRJs
         CyJUEXL3mxFqZynxdtIkt1tX7snW5bHefKpxDfIDwSd4AzdvDlTrGShj/RuOguz8k3CB
         GCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=h9jRirq9eagzpWvFgkxNnqKOUce9E8KvkK0W6kIY+xw=;
        b=eNVUW8ds5oCliduOn85UW3gDEXMZ7posZ8izM3oK6uYCUWKbALUg/iDy2EvA80XHAp
         jCnzChEpvfgReoGguF1Fi7082TPQtVTd1OXbSRAAimP8GpTlm3h8wl63aDUPKkqmYcUS
         6NWlsucWgpyQx4w6Ak0QqkHfxjXqhgS3uS+yLluCTcqon0VS0ne+iwi02EBsRYGkxphM
         ZVPOGuiYtrj1qGhoHFkyjS/b+1rax89mKYicGa8AEXM2y4I9OQf2kPP3iOtIm8iuzv9H
         6og5XO6uf84lJhAL4uBek9LXIQSnmKvhRqKVzjWwu6QBB/HREfpk66FTYgY6sfyG4J4b
         SGvQ==
X-Gm-Message-State: AOAM530oR6FHX2XBBXjs45aGA5DgZX1uWDVJEsE0he0rreDSP1ZkGgJE
	KPwDsrPL2hPByY8hGgT8Lhp0SATtH/E=
X-Google-Smtp-Source: ABdhPJwXgcWmCCoR93lqWjZjLR24yR9Nu0tgqCnEpLb81r9o+chkOsDuK1d21egYhCKx+CZ5y7jyfQ==
X-Received: by 2002:a17:902:e788:b0:163:73fc:5140 with SMTP id cp8-20020a170902e78800b0016373fc5140mr32604871plb.88.1654674270865;
        Wed, 08 Jun 2022 00:44:30 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b0016362da9a03sm13955693pla.245.2022.06.08.00.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:44:30 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/3] dts: ast2600: Consolidate NCSI device tree
Date: Wed,  8 Jun 2022 17:14:02 +0930
Message-Id: <20220608074402.1876079-4-joel@jms.id.au>
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

The AST2600 NCSI EVB device tree is the same as the AST2600, except for
the configuration of the network devices.

To reduce the maintenance required, include the AST2600 EVB device tree
and modify the nodes as appropriate.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-ncsi.dts | 294 +---------------------------------
 1 file changed, 4 insertions(+), 290 deletions(-)

diff --git a/arch/arm/dts/ast2600-ncsi.dts b/arch/arm/dts/ast2600-ncsi.dts
index 4bb1dcf5dfb3..57890bbc5e89 100644
--- a/arch/arm/dts/ast2600-ncsi.dts
+++ b/arch/arm/dts/ast2600-ncsi.dts
@@ -4,102 +4,10 @@
 
 / {
 	model = "AST2600 EVB w/ NCSI";
-	compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
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
-#if 0
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
 };
 
-&mac1 {
-	status = "okay";
-	phy-mode = "rgmii-rxid";
-	phy-handle = <&ethphy1>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default>;
-};
-#endif
+/delete-node/&mac0;
+/delete-node/&mac1;
 
 &mac2 {
 	status = "okay";
@@ -107,6 +15,7 @@
 	use-ncsi;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii3_default>;
+	/delete-property/phy-handle;
 };
 
 &mac3 {
@@ -115,200 +24,5 @@
 	use-ncsi;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
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
-};
-
-&emmc {
-	u-boot,dm-pre-reloc;
-	timing-phase = <0x700ff>;
-};
-
-&emmc_slot0 {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-	bus-width = <4>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_emmc_default>;
-	sdhci-drive-type = <1>;
-};
-
-&sdhci {
-	timing-phase = <0xc6ffff>;
-};
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
+	/delete-property/phy-handle;
 };
-- 
2.35.1

