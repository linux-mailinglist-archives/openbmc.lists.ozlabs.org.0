Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95B775472
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 09:53:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LjihnHrn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLMjn6Rncz2ywt
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 17:53:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LjihnHrn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLMdy2PQ4z2yVk
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 17:49:42 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686f1240a22so6254339b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567380; x=1692172180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JI4OXIunQBjNxAuBWiJmXnUU72Yj1E+oarad2J/qAqg=;
        b=LjihnHrnS8n8lEFvfBbyEXnsEYBlrOdqssE68+V/2ki805R0pu9YFHcQteaW4oJxY5
         X1hMnJQM2oJh95Rtb1etZOD44afDeJGcwgfyO7bKUSXiI/uVeMmqIHo1LMBoRrWQrBPw
         sWySyXs4vonGUJGGWnWSc39Xx7qCuhs7xHCxYTnq9D9pD0tkRRW1YRdoI8coDLJ05tgX
         RxZchc67by8Oht4/v25mQQ/XdaaUbrDhGqY3KOOmtECwGfeOMaIjAHo+cS5I6C4oZ/hL
         2nKncUNZ6VTCpI2DchRnc4j53KTOO5pr7Lca458+41rhHsw7CMeSuojBfAwuThV3QyZW
         x39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567380; x=1692172180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JI4OXIunQBjNxAuBWiJmXnUU72Yj1E+oarad2J/qAqg=;
        b=h1roaGUHTdkDhocYQ+VdR/DthqKA/Y/x3QqNxRTkuiyCFSbmJwdN4NWqBQVsM7adDL
         KqetjmAXPa01aYn9i7xj5ukqhrH/B2jVu+C4/H4B41azxLV4q1FV7FujJ5J9cN+ljviE
         LHSdMJgnNtZlgb//Fu9bA4AhMwIBXOYEV7jFs06YvAwfL1tE7/WPtPJXuf1NPMRmeshE
         WReca0zH96Wb6UG2qxFEjGJOimQCYVQWyT66L/hLUgJppqGgmY+5CbZ4cwe16Ak+WbS8
         lhz7VlyzHO/KvKs+/gr/idOy1+ldA8NF2napsjwt+ocUiPifYb5W0Cb13tzhaFFGc1f8
         +upA==
X-Gm-Message-State: AOJu0Yya09tyeExeQJdY9AdhcsEhXxzAsoOf/io8HS8ozcsAWbIX8wKY
	u0kCaDZRH27hTMpz1CfR5J0qgrE0sNE=
X-Google-Smtp-Source: AGHT+IGXT5d5/ATfinBfm4c8n8V9fmIN3nBjT6+V1L1v+1kGCZXvKXiRRA/eDoY81jcM1qpMbKFzHA==
X-Received: by 2002:a05:6a00:198e:b0:680:2b80:8479 with SMTP id d14-20020a056a00198e00b006802b808479mr2002853pfl.19.1691567379963;
        Wed, 09 Aug 2023 00:49:39 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b0068285a7f107sm9620603pfn.177.2023.08.09.00.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:49:39 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-6.1 v3 3/5] ARM: dts: aspeed: rainier: Reorganise FSI description
Date: Wed,  9 Aug 2023 17:19:19 +0930
Message-Id: <20230809074921.116987-4-joel@jms.id.au>
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

Use the P10 quad FSI CFAM description to reduce duplication.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 678 +------------------
 1 file changed, 2 insertions(+), 676 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 8dd94cd478fc..2566d26f6714 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -12,39 +12,6 @@ / {
 	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
 
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
-		i2c300 = &cfam2_i2c0;
-		i2c301 = &cfam2_i2c1;
-		i2c310 = &cfam2_i2c10;
-		i2c311 = &cfam2_i2c11;
-		i2c312 = &cfam2_i2c12;
-		i2c313 = &cfam2_i2c13;
-		i2c314 = &cfam2_i2c14;
-		i2c315 = &cfam2_i2c15;
-		i2c402 = &cfam3_i2c2;
-		i2c403 = &cfam3_i2c3;
-		i2c410 = &cfam3_i2c10;
-		i2c411 = &cfam3_i2c11;
-		i2c414 = &cfam3_i2c14;
-		i2c415 = &cfam3_i2c15;
-		i2c416 = &cfam3_i2c16;
-		i2c417 = &cfam3_i2c17;
-
 		serial4 = &uart5;
 		i2c16 = &i2c2mux0;
 		i2c17 = &i2c2mux1;
@@ -61,23 +28,6 @@ aliases {
 		i2c28 = &i2c6mux0chn3;
 		i2c29 = &i2c11mux0chn0;
 		i2c30 = &i2c11mux0chn1;
-
-		spi10 = &cfam0_spi0;
-		spi11 = &cfam0_spi1;
-		spi12 = &cfam0_spi2;
-		spi13 = &cfam0_spi3;
-		spi20 = &cfam1_spi0;
-		spi21 = &cfam1_spi1;
-		spi22 = &cfam1_spi2;
-		spi23 = &cfam1_spi3;
-		spi30 = &cfam2_spi0;
-		spi31 = &cfam2_spi1;
-		spi32 = &cfam2_spi2;
-		spi33 = &cfam2_spi3;
-		spi40 = &cfam3_spi0;
-		spi41 = &cfam3_spi1;
-		spi42 = &cfam3_spi2;
-		spi43 = &cfam3_spi3;
 	};
 
 	chosen {
@@ -301,632 +251,6 @@ &emmc {
 	clk-phase-mmc-hs200 = <180>, <180>;
 };
 
-&fsim0 {
-	status = "okay";
-
-	#address-cells = <2>;
-	#size-cells = <0>;
-
-	/*
-	 * CFAM Reset is supposed to be active low but pass1 hardware is wired
-	 * active high.
-	 */
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
-			};
-
-			cfam0_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam0_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam0_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
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
-                };
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
-                };
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
-
-	cfam@2,0 {
-		reg = <2 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <2>;
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
-			cfam2_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OM01 */
-			};
-
-			cfam2_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OM23 */
-			};
-
-			cfam2_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam2_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam2_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam2_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam2_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam2_i2c15: i2c-bus@f {
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
-			cfam2_spi0: spi@0 {
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
-			cfam2_spi1: spi@20 {
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
-			cfam2_spi2: spi@40 {
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
-			cfam2_spi3: spi@60 {
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
-			fsi_occ2: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub2: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@3,0 {
-		reg = <3 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <3>;
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
-			cfam3_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OM45 */
-			};
-
-			cfam3_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OM67 */
-			};
-
-			cfam3_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam3_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam3_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam3_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam3_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam3_i2c17: i2c-bus@11 {
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
-			cfam3_spi0: spi@0 {
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
-			cfam3_spi1: spi@20 {
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
-			cfam3_spi2: spi@40 {
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
-			cfam3_spi3: spi@60 {
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
-			fsi_occ3: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub3: hub@3400 {
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
-/* Legacy OCC numbering (to get rid of when userspace is fixed) */
-&fsi_occ0 {
-	reg = <1>;
-};
-
-&fsi_occ1 {
-	reg = <2>;
-};
-
-&fsi_occ2 {
-	reg = <3>;
-};
-
-&fsi_occ3 {
-	reg = <4>;
-};
-
 &ibt {
 	status = "okay";
 };
@@ -2413,3 +1737,5 @@ &kcs3 {
 	aspeed,lpc-io-reg = <0xca2>;
 	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 };
+
+#include "ibm-power10-quad.dtsi"
-- 
2.40.1

