Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE35427A7
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 09:46:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHzml5lfhz3btp
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 17:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nXjC5Wr7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nXjC5Wr7;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHzl25T7gz2xn8
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 17:44:30 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d22so16918983plr.9
        for <openbmc@lists.ozlabs.org>; Wed, 08 Jun 2022 00:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KVm16Zmb3zcn++NUDdA1b0TN/kxtnE0dRfEgjhX/geo=;
        b=nXjC5Wr7sopwG3jRPa6IPqPJYGSQX81/4tRq5NP3iuObsrj7g8f+HWVid4Qw2Io3IS
         Uv4ebtH3Xw+W5gQqejxTELuUuAy7YECzg87U17M9EQ39qgBa7vuP2qWgFxvJ1TrXfuo7
         VFbiWX5myAsIfjbLCLJqvTGh+bVcwneWyu7t7vpGVqsB+G2nqHWim0dayyCFEayyZkrY
         TLz75OD9hhBjRP+jggeq0/LLOl9GWq0KOKDqLnKBLWrPrP2eMZaN2jRQNllTnyIBv5KH
         pYRxT4MigsGRWBHND5C/Fx++vOR/1T67X9/keXz5AF8KAEWYKOExJM7FWeeGxvmWmBEf
         UqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=KVm16Zmb3zcn++NUDdA1b0TN/kxtnE0dRfEgjhX/geo=;
        b=M+tKXCDkIRnfoyKgShuGx5QMalgcEKdv3F9cDzHlHORuuIyZAlDJaqopOrgviN7/Bq
         MStVbLNE4HfDVoDHSswLe/fxJmYYb77wdcHr1hYjllxLRanYYpVFgamMR5CGtRI5B2FX
         WFIhpv1N29i/OfWDZm0/zXQle5UkukmbukHjLGGBnkE7cSQqEZBJXVYPP/JSJ3K3CBd6
         1kAHM5IScvQ4EdaVxGuEJnfaEq3/4XUPaiJzJkVvw5MgOpNYisiAnOM1Ue/yXSPiKIQR
         QeA01zy2B1YA0AD76qfy8rN9Q0Bgo7w6DjcVC2nB+XIT9JeyisRwSEOcV/qoIBswwD/w
         2Wfg==
X-Gm-Message-State: AOAM530kBP9+0PbWxMNK7GfArTLEbDqfgXUMlOTepbrdYfYZpUwOXG1Y
	41HdmmkdAv3TgCgBcKzKfOf+21LHy9U=
X-Google-Smtp-Source: ABdhPJztfRbGIXDbGsqw46AmYo4jsfjoYEptL4gVBQqEsf8w9UzehWg5E6C+DhdpALZ94zeTMSHusw==
X-Received: by 2002:a17:902:bd05:b0:15f:19a0:95ed with SMTP id p5-20020a170902bd0500b0015f19a095edmr32667278pls.31.1654674267783;
        Wed, 08 Jun 2022 00:44:27 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i13-20020a170902c94d00b0016362da9a03sm13955693pla.245.2022.06.08.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:44:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/3] dts: ast2600: Consolidate A0 device tree
Date: Wed,  8 Jun 2022 17:14:01 +0930
Message-Id: <20220608074402.1876079-3-joel@jms.id.au>
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

The AST2600A0 EVB device tree is the same as the AST2600, except for the
removal of MAC0 which is broken on this revision.

To reduce the maintenance required, include the AST2600 EVB device tree
and modify the nodes as appropriate.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600a0-evb.dts | 264 +--------------------------------
 1 file changed, 5 insertions(+), 259 deletions(-)

diff --git a/arch/arm/dts/ast2600a0-evb.dts b/arch/arm/dts/ast2600a0-evb.dts
index 49fd4f29df1a..b940d26087dd 100644
--- a/arch/arm/dts/ast2600a0-evb.dts
+++ b/arch/arm/dts/ast2600a0-evb.dts
@@ -1,271 +1,17 @@
 /dts-v1/;
 
-#include "ast2600-u-boot.dtsi"
+#include "ast2600-evb.dts"
 
 / {
-	model = "AST2600 EVB";
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
+	model = "AST2600A0 EVB";
 
 	aliases {
-		mmc0 = &emmc_slot0;
-		mmc1 = &sdhci_slot0;
-		mmc2 = &sdhci_slot1;
-		spi0 = &fmc;
-		spi1 = &spi1;
-		spi2 = &spi2;
-
 		ethernet0 = &mac1;
 		ethernet1 = &mac2;
 		ethernet2 = &mac3;
+		/delete-property/ethernet3;
 	};
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
-	u-boot,dm-pre-reloc;
-	status = "okay";
-};
-
-&wdt2 {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-};
-
-&wdt3 {
-	u-boot,dm-pre-reloc;
-	status = "okay";
-};
-
-&mdio {
-	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
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
-
-	ethphy4: ethernet-phy@4 {
-		reg = <0>;
-	};
-};
-
-
-&mac1 {
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&ethphy2>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mac2link_default &pinctrl_mdio2_default>;
-};
-
-&mac2 {
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&ethphy3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii3_default &pinctrl_mac3link_default &pinctrl_mdio3_default>;	
-};
-
-&mac3 {
-	status = "okay";
-	phy-mode = "rgmii";
-	phy-handle = <&ethphy4>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii4_default &pinctrl_mac4link_default &pinctrl_mdio4_default>;	
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
-&emmc_slot0 {
-	status = "okay";
-
-#if 1
-	bus-width = <4>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_emmc_default>;
-#else
-	bus-width = <8>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_emmcg8_default>;
-#endif
-};
-
-&sdhci_slot0 {
-	status = "okay";
-	bus-width = <4>;
-	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
-	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sd1_default>;
-};
-
-&sdhci_slot1 {
-	status = "okay";
-	bus-width = <4>;
-	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
-	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sd2_default>;
 };
 
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
+/* MAC0 is broken on A1 */
+/delete-node/&mac0;
-- 
2.35.1

