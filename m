Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66D775471
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 09:52:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KHANlvt6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLMhj6VNTz304l
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 17:52:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KHANlvt6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLMdw5HLmz2yV8
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 17:49:40 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-68706b39c4cso4608113b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567377; x=1692172177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsWWW2dAaJ7zPs4uBsg8XzwWQnYRH4J6kh0jfCGM8Uc=;
        b=KHANlvt6W78U7QDDkKh1rDeD4SbitTOBl+YPllNHHQpuCJC9AATrovBy6XGbcSzaPn
         51FNDiEKWsOpLDhzqd6xIxjYPzTUeh0S/wltPhvWCFVlo9tCIp9x/EGalSouJmcJmQix
         0bheT3cRz4AGBdxc8uP3qUoDFE5+apDCnXarINWRTIGF6FrSfhdPaPJvIbc0OyTP3Vv2
         oXj/svgfmvu0Pi4qX/T0MOutMemi73ATaY6RZ/0Qdny39YTkicV91JnRltIzo9zolQQh
         Wn50xbcoCJnLyrqFUq1SWLSds5VHs/zE6a+OGWUTUPOsEFyoVcAVwb0TdQ+QT0ME4m90
         /bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567377; x=1692172177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xsWWW2dAaJ7zPs4uBsg8XzwWQnYRH4J6kh0jfCGM8Uc=;
        b=g98ZOgTGFzw494AIQBWik/FT+TeNejh23ZtM6KiFeI0608LWfCPR8Sflu5sGpEYfzN
         CmU5OVfkxkg8eVx06Ux7/ty/Y79OcjGRbs1OqLeZqENR5Nj/oYjgiarJfNFHmYu6Tueq
         BzgmLeGah2TsIQoAqKgVJZdEm6/enWSO6C5VjkaokkHhi3oYZXpN8XArECVLxomc8/kv
         jtgtF2FJYQoFMNb2pEX2cux36tOVAL14xU8GPdV2fnZaAgkCkEEpRhVKA2LowvLfctvz
         yL9jmb3qyZ7Ij5iAkulTojhyixaXGWvrv3MsJSRPp9IQhD6JXoMoD3BkKqumvuV2e//n
         JlVw==
X-Gm-Message-State: AOJu0Yz6qaGEWCYYddKggvw+zuNPnS/mfGXfhOOf1vRwcPpso3BtETW9
	NLceEoKm1msOiFaVIEw7dm6i9+UIa1Y=
X-Google-Smtp-Source: AGHT+IEnotvqsCH24Ybpnb+LYkchXgzuW3TzFwz9WZlBdFzA0pzbBDulYpNPWK5iA/26TIvvAwIeEw==
X-Received: by 2002:a05:6a00:1397:b0:675:ef91:7922 with SMTP id t23-20020a056a00139700b00675ef917922mr2074838pfg.4.1691567377324;
        Wed, 09 Aug 2023 00:49:37 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b0068285a7f107sm9620603pfn.177.2023.08.09.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:49:36 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-6.1 v3 2/5] ARM: dts: aspeed: bonnell: Reorganise FSI description
Date: Wed,  9 Aug 2023 17:19:18 +0930
Message-Id: <20230809074921.116987-3-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230809074921.116987-1-joel@jms.id.au>
References: <20230809074921.116987-1-joel@jms.id.au>
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

Use the P10 dual FSI CFAM description to reduce duplication.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 384 ++-----------------
 1 file changed, 30 insertions(+), 354 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index ae02491a4c7a..cad1b9aac97b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -12,38 +12,11 @@ / {
 	compatible = "ibm,bonnell-bmc", "aspeed,ast2600";
 
 	aliases {
-		i2c100 = &cfam0_i2c0;
-		i2c101 = &cfam0_i2c1;
-		i2c110 = &cfam0_i2c10;
-		i2c111 = &cfam0_i2c11;
-		i2c112 = &cfam0_i2c12;
-		i2c113 = &cfam0_i2c13;
-		i2c114 = &cfam0_i2c14;
-		i2c115 = &cfam0_i2c15;
-		i2c202 = &cfam1_i2c2;
-		i2c203 = &cfam1_i2c3;
-		i2c210 = &cfam1_i2c10;
-		i2c211 = &cfam1_i2c11;
-		i2c214 = &cfam1_i2c14;
-		i2c215 = &cfam1_i2c15;
-		i2c216 = &cfam1_i2c16;
-		i2c217 = &cfam1_i2c17;
-
 		serial4 = &uart5;
 		i2c16 = &i2c11mux0chn0;
 		i2c17 = &i2c11mux0chn1;
 		i2c18 = &i2c11mux0chn2;
 		i2c19 = &i2c11mux0chn3;
-
-		spi10 = &cfam0_spi0;
-		spi11 = &cfam0_spi1;
-		spi12 = &cfam0_spi2;
-		spi13 = &cfam0_spi3;
-		spi20 = &cfam1_spi0;
-		spi21 = &cfam1_spi1;
-		spi22 = &cfam1_spi2;
-		spi23 = &cfam1_spi3;
-
 	};
 
 	chosen {
@@ -202,333 +175,6 @@ &emmc {
 	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
-&fsim0 {
-	status = "okay";
-
-	#address-cells = <2>;
-	#size-cells = <0>;
-
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
-
-	cfam@0,0 {
-		reg = <0 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <0>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OMI01 */
-			};
-
-			cfam0_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OMI23 */
-			};
-
-			cfam0_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-
-				eeprom@50 {
-					compatible = "atmel,at30tse004a";
-					reg = <0x50>;
-				};
-			};
-
-			cfam0_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-
-				eeprom@50 {
-					compatible = "atmel,at30tse004a";
-					reg = <0x50>;
-				};
-			};
-
-			cfam0_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-
-				eeprom@50 {
-					compatible = "atmel,at30tse004a";
-					reg = <0x50>;
-				};
-			};
-
-			cfam0_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-
-				eeprom@50 {
-					compatible = "atmel,at30tse004a";
-					reg = <0x50>;
-				};
-			};
-
-			cfam0_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam0_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam0_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam0_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ0: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub0: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-		};
-	};
-};
-
-&fsi_hub0 {
-	cfam@1,0 {
-		reg = <1 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <1>;
-
-		scom@1000 {
-			compatible = "ibm,fsi2pib";
-			reg = <0x1000 0x400>;
-		};
-
-		i2c@1800 {
-			compatible = "ibm,fsi-i2c-master";
-			reg = <0x1800 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam1_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OMI45 */
-			};
-
-			cfam1_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OMI67 */
-			};
-
-			cfam1_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam1_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam1_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam1_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam1_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam1_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
-
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			cfam1_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-
-			cfam1_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
-
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
-				};
-			};
-		};
-
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			fsi_occ1: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub1: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-};
-
 &ibt {
 	status = "okay";
 };
@@ -939,3 +585,33 @@ &kcs3 {
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
+
+#include "ibm-power10-dual.dtsi"
+
+&cfam0_i2c10 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
+
+&cfam0_i2c11 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
+
+&cfam0_i2c12 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
+
+&cfam0_i2c13 {
+	eeprom@50 {
+		compatible = "atmel,at30tse004a";
+		reg = <0x50>;
+	};
+};
-- 
2.40.1

