Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 090C877547C
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 09:54:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rpkjA5R7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLMlQ6ZMfz2ywt
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 17:54:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rpkjA5R7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLMf313cMz30Ng
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 17:49:46 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686b879f605so4616199b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567383; x=1692172183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eha5Glm3YkSLjtxIJYSrA9yQFW164wadMBbkpeaWWlg=;
        b=rpkjA5R7AIdFT5cazlF4npDy/q1/o35elNHZ2tb8EnseD6sHrXmrs7Va0S4/Y4GLmY
         MSzUW7hh/m96PG1FmbHkr5LyvvZbPyxIZ7e3W3FSflipne83cnR38mVSYKW8mUBxYeu5
         4gJ3bKDngnPn03QXohP3qkpaAGBb9Qz9nbqv8pwq8WfVeLLs6MU8rVq34KhVuBAxcMrz
         fcs7BipcQtL+ZMN/d+Dtr0JFb7ukGqNOQIeur9HhkBqWm10UApZgwXtzFBds/b+q/peP
         ipTxV2F6CsLmSFhwMvI4ZM8IHZnLsqLLN0ECjJJkVlB1gBfUn436y+C/VxFKnGFMTU1s
         vUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567383; x=1692172183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eha5Glm3YkSLjtxIJYSrA9yQFW164wadMBbkpeaWWlg=;
        b=NSznFWT2JV86Uq/f27TqKaxaQBpbIVBdlAkzhJPWRUiirs517jKrPpkGDwMwWiGlEJ
         GorylwNfR7RZgQy/hbtf5dxKtSb8fHKBzi9gBtnDhDqaesES+h/qoVA39BhVS6f5RqrO
         8Gpfl7EkbKT1KsWvES8v8HnlL64U5VFIhMLGZ/foyk1J65PTfgt64j0FQZex3DJ8Lijb
         TUWVpVaVyAcVJ2lIjtkqMJvuOp9XQPFWBSefGvQLiH0acHiLWUFFzuBaTzstX7TedpmS
         NkBIga099G+NAKvtthy9Pu0+LhYSyfabXzN+Cz4x6w1B3JezANsR4m5FE3Db2tGxqdGU
         jPZA==
X-Gm-Message-State: AOJu0Yy/VyeuO+2Z4b3/Wx2i46VlvdOTfA82U7U1OklJvrQpc0hRKIzM
	dPAiO5gse+2p4mqDEX56X8luRqP8ux0=
X-Google-Smtp-Source: AGHT+IEifSI+IdMc75tRFMpFaBcwzZf2QTzQfh4A8locCbLdXFJmID1ejJTfanFfSVWrn+EXdMFgYg==
X-Received: by 2002:a05:6a00:1a14:b0:66c:6766:7373 with SMTP id g20-20020a056a001a1400b0066c67667373mr1747366pfv.23.1691567383091;
        Wed, 09 Aug 2023 00:49:43 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b0068285a7f107sm9620603pfn.177.2023.08.09.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:49:42 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-6.1 v3 4/5] ARM: dts: aspeed: everest: Reorganise FSI description
Date: Wed,  9 Aug 2023 17:19:20 +0930
Message-Id: <20230809074921.116987-5-joel@jms.id.au>
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

From: Eddie James <eajames@linux.ibm.com>

Use the P10 quad FSI CFAM description to reduce duplication and add the
I2C responders and associated engines.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1712 ++++++++++--------
 1 file changed, 1003 insertions(+), 709 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index c6f8f20914d1..632e4219a853 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -12,38 +12,6 @@ / {
 	compatible = "ibm,everest-bmc", "aspeed,ast2600";
 
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
 		i2c500 = &cfam4_i2c0;
 		i2c501 = &cfam4_i2c1;
 		i2c510 = &cfam4_i2c10;
@@ -113,22 +81,72 @@ aliases {
 
 		serial4 = &uart5;
 
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
+		sbefifo500 = &sbefifo500;
+		sbefifo501 = &sbefifo501;
+		sbefifo510 = &sbefifo510;
+		sbefifo511 = &sbefifo511;
+		sbefifo512 = &sbefifo512;
+		sbefifo513 = &sbefifo513;
+		sbefifo514 = &sbefifo514;
+		sbefifo515 = &sbefifo515;
+		sbefifo602 = &sbefifo602;
+		sbefifo603 = &sbefifo603;
+		sbefifo610 = &sbefifo610;
+		sbefifo611 = &sbefifo611;
+		sbefifo614 = &sbefifo614;
+		sbefifo615 = &sbefifo615;
+		sbefifo616 = &sbefifo616;
+		sbefifo617 = &sbefifo617;
+		sbefifo700 = &sbefifo700;
+		sbefifo701 = &sbefifo701;
+		sbefifo710 = &sbefifo710;
+		sbefifo711 = &sbefifo711;
+		sbefifo712 = &sbefifo712;
+		sbefifo713 = &sbefifo713;
+		sbefifo714 = &sbefifo714;
+		sbefifo715 = &sbefifo715;
+		sbefifo802 = &sbefifo802;
+		sbefifo803 = &sbefifo803;
+		sbefifo810 = &sbefifo810;
+		sbefifo811 = &sbefifo811;
+		sbefifo814 = &sbefifo814;
+		sbefifo815 = &sbefifo815;
+		sbefifo816 = &sbefifo816;
+		sbefifo817 = &sbefifo817;
+
+		scom500 = &scom500;
+		scom501 = &scom501;
+		scom510 = &scom510;
+		scom511 = &scom511;
+		scom512 = &scom512;
+		scom513 = &scom513;
+		scom514 = &scom514;
+		scom515 = &scom515;
+		scom602 = &scom602;
+		scom603 = &scom603;
+		scom610 = &scom610;
+		scom611 = &scom611;
+		scom614 = &scom614;
+		scom615 = &scom615;
+		scom616 = &scom616;
+		scom617 = &scom617;
+		scom700 = &scom700;
+		scom701 = &scom701;
+		scom710 = &scom710;
+		scom711 = &scom711;
+		scom712 = &scom712;
+		scom713 = &scom713;
+		scom714 = &scom714;
+		scom715 = &scom715;
+		scom802 = &scom802;
+		scom803 = &scom803;
+		scom810 = &scom810;
+		scom811 = &scom811;
+		scom814 = &scom814;
+		scom815 = &scom815;
+		scom816 = &scom816;
+		scom817 = &scom817;
+
 		spi50 = &cfam4_spi0;
 		spi51 = &cfam4_spi1;
 		spi52 = &cfam4_spi2;
@@ -2413,23 +2431,15 @@ &emmc {
 	clk-phase-mmc-hs200 = <210>, <228>;
 };
 
-&fsim0 {
-	status = "okay";
-
-	#address-cells = <2>;
-	#size-cells = <0>;
 
-	/*
-	 * CFAM Reset is supposed to be active low but pass1 hardware is wired
-	 * active high.
-	 */
-	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+#include "ibm-power10-quad.dtsi"
 
-	cfam@0,0 {	/* DCM0_C0 */
-		reg = <0 0>;
+&fsi_hub0 {
+	cfam@4,0 { /* DCM2_C0 */
+		reg = <4 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		chip-id = <0>;
+		chip-id = <4>;
 
 		scom@1000 {
 			compatible = "ibm,fsi2pib";
@@ -2442,36 +2452,260 @@ i2c@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam0_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OMI01 */
+			cfam4_i2c0: i2c-bus@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;	/* OM01 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom500: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo500: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OMI23 */
+			cfam4_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;	/* OM23 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom501: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo501: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c10: i2c-bus@a {
+			cfam4_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom510: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo510: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c11: i2c-bus@b {
+			cfam4_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom511: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo511: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c12: i2c-bus@c {
+			cfam4_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <12>;	/* OP4A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom512: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo512: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c13: i2c-bus@d {
+			cfam4_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <13>;	/* OP4B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom513: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo513: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c14: i2c-bus@e {
+			cfam4_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom514: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo514: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam0_i2c15: i2c-bus@f {
+			cfam4_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom515: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo515: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -2481,7 +2715,7 @@ fsi2spi@1c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam0_spi0: spi@0 {
+			cfam4_spi0: spi@0 {
 				reg = <0x0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2497,7 +2731,7 @@ eeprom@0 {
 				};
 			};
 
-			cfam0_spi1: spi@20 {
+			cfam4_spi1: spi@20 {
 				reg = <0x20>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2513,9 +2747,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam0_spi2: spi@40 {
+			cfam4_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2530,9 +2764,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam0_spi3: spi@60 {
+			cfam4_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2554,7 +2788,7 @@ sbefifo@2400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ0: occ {
+			fsi_occ4: occ {
 				compatible = "ibm,p10-occ";
 
 				occ-hwmon {
@@ -2564,21 +2798,21 @@ occ-hwmon {
 			};
 		};
 
-		fsi_hub0: hub@3400 {
+		fsi_hub4: hub@3400 {
 			compatible = "fsi-master-hub";
 			reg = <0x3400 0x400>;
 			#address-cells = <2>;
 			#size-cells = <0>;
+
+			no-scan-on-init;
 		};
 	};
-};
 
-&fsi_hub0 {
-	cfam@1,0 { /* DCM0_C1 */
-		reg = <1 0>;
+	cfam@5,0 { /* DCM2_C1 */
+		reg = <5 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		chip-id = <1>;
+		chip-id = <5>;
 
 		scom@1000 {
 			compatible = "ibm,fsi2pib";
@@ -2591,36 +2825,260 @@ i2c@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam1_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OMI45 */
+			cfam5_i2c2: i2c-bus@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;	/* OM45 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom602: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo602: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OMI67 */
+			cfam5_i2c3: i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;	/* OM67 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom603: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo603: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c10: i2c-bus@a {
+			cfam5_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom610: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo610: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c11: i2c-bus@b {
+			cfam5_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom611: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo611: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c14: i2c-bus@e {
+			cfam5_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom614: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo614: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c15: i2c-bus@f {
+			cfam5_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom615: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo615: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c16: i2c-bus@10 {
+			cfam5_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <16>;	/* OP6A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom616: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo616: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam1_i2c17: i2c-bus@11 {
+			cfam5_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <17>;	/* OP6B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom617: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo617: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -2630,7 +3088,7 @@ fsi2spi@1c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam1_spi0: spi@0 {
+			cfam5_spi0: spi@0 {
 				reg = <0x0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2646,7 +3104,7 @@ eeprom@0 {
 				};
 			};
 
-			cfam1_spi1: spi@20 {
+			cfam5_spi1: spi@20 {
 				reg = <0x20>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2662,9 +3120,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam1_spi2: spi@40 {
+			cfam5_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2679,9 +3137,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam1_spi3: spi@60 {
+			cfam5_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2703,7 +3161,7 @@ sbefifo@2400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ1: occ {
+			fsi_occ5: occ {
 				compatible = "ibm,p10-occ";
 
 				occ-hwmon {
@@ -2713,7 +3171,7 @@ occ-hwmon {
 			};
 		};
 
-		fsi_hub1: hub@3400 {
+		fsi_hub5: hub@3400 {
 			compatible = "fsi-master-hub";
 			reg = <0x3400 0x400>;
 			#address-cells = <2>;
@@ -2723,11 +3181,11 @@ fsi_hub1: hub@3400 {
 		};
 	};
 
-	cfam@2,0 { /* DCM1_C0 */
-		reg = <2 0>;
+	cfam@6,0 { /* DCM3_C0 */
+		reg = <6 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		chip-id = <2>;
+		chip-id = <6>;
 
 		scom@1000 {
 			compatible = "ibm,fsi2pib";
@@ -2740,36 +3198,260 @@ i2c@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam2_i2c0: i2c-bus@0 {
+			cfam6_i2c0: i2c-bus@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0>;	/* OM01 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom700: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo700: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c1: i2c-bus@1 {
+			cfam6_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <1>;	/* OM23 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom701: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo701: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c10: i2c-bus@a {
+			cfam6_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <10>;	/* OP3A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom710: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo710: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c11: i2c-bus@b {
+			cfam6_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <11>;	/* OP3B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom711: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo711: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c12: i2c-bus@c {
+			cfam6_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <12>;	/* OP4A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom712: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo712: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c13: i2c-bus@d {
+			cfam6_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <13>;	/* OP4B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom713: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo713: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c14: i2c-bus@e {
+			cfam6_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <14>;	/* OP5A */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom714: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo714: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam2_i2c15: i2c-bus@f {
+			cfam6_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <15>;	/* OP5B */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom715: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo715: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 
@@ -2779,7 +3461,7 @@ fsi2spi@1c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam2_spi0: spi@0 {
+			cfam6_spi0: spi@0 {
 				reg = <0x0>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2795,7 +3477,7 @@ eeprom@0 {
 				};
 			};
 
-			cfam2_spi1: spi@20 {
+			cfam6_spi1: spi@20 {
 				reg = <0x20>;
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2811,9 +3493,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam2_spi2: spi@40 {
+			cfam6_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2828,9 +3510,9 @@ eeprom@0 {
 				};
 			};
 
-			cfam2_spi3: spi@60 {
+			cfam6_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -2852,7 +3534,7 @@ sbefifo@2400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			fsi_occ2: occ {
+			fsi_occ6: occ {
 				compatible = "ibm,p10-occ";
 
 				occ-hwmon {
@@ -2862,7 +3544,7 @@ occ-hwmon {
 			};
 		};
 
-		fsi_hub2: hub@3400 {
+		fsi_hub6: hub@3400 {
 			compatible = "fsi-master-hub";
 			reg = <0x3400 0x400>;
 			#address-cells = <2>;
@@ -2872,11 +3554,11 @@ fsi_hub2: hub@3400 {
 		};
 	};
 
-	cfam@3,0 { /* DCM1_C1 */
-		reg = <3 0>;
+	cfam@7,0 { /* DCM3_C1 */
+		reg = <7 0>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		chip-id = <3>;
+		chip-id = <7>;
 
 		scom@1000 {
 			compatible = "ibm,fsi2pib";
@@ -2889,635 +3571,263 @@ i2c@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			cfam3_i2c2: i2c-bus@2 {
+			cfam7_i2c2: i2c-bus@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <2>;	/* OM45 */
+
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
+
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom802: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo802: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
-			cfam3_i2c3: i2c-bus@3 {
+			cfam7_i2c3: i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <3>;	/* OM67 */
-			};
 
-			cfam3_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam3_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			cfam3_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
+						scom803: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-			cfam3_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
+						sbefifo803: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
 			};
 
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
-
-	cfam@4,0 { /* DCM2_C0 */
-		reg = <4 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <4>;
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
-			cfam4_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OM01 */
-			};
-
-			cfam4_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OM23 */
-			};
-
-			cfam4_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam4_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam4_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam4_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam4_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam4_i2c15: i2c-bus@f {
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
-			cfam4_spi0: spi@0 {
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
-			cfam4_spi1: spi@20 {
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
-			cfam4_spi2: spi@40 {
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
-			cfam4_spi3: spi@60 {
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
-			fsi_occ4: occ {
-				compatible = "ibm,p10-occ";
-
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
-				};
-			};
-		};
-
-		fsi_hub4: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@5,0 { /* DCM2_C1 */
-		reg = <5 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <5>;
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
-			cfam5_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OM45 */
-			};
-
-			cfam5_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OM67 */
-			};
-
-			cfam5_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam5_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam5_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam5_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam5_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam5_i2c17: i2c-bus@11 {
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
-			cfam5_spi0: spi@0 {
-				reg = <0x0>;
+			cfam7_i2c10: i2c-bus@a {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
 
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
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam5_spi1: spi@20 {
-				reg = <0x20>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+						scom810: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo810: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam5_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam7_i2c11: i2c-bus@b {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
+
+						scom811: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo811: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam5_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam7_i2c14: i2c-bus@e {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
 
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
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			fsi_occ5: occ {
-				compatible = "ibm,p10-occ";
+						scom814: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
+						sbefifo814: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
-		};
-
-		fsi_hub5: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@6,0 { /* DCM3_C0 */
-		reg = <6 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <6>;
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
-			cfam6_i2c0: i2c-bus@0 {
-				reg = <0>;	/* OM01 */
-			};
-
-			cfam6_i2c1: i2c-bus@1 {
-				reg = <1>;	/* OM23 */
-			};
 
-			cfam6_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam6_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam6_i2c12: i2c-bus@c {
-				reg = <12>;	/* OP4A */
-			};
-
-			cfam6_i2c13: i2c-bus@d {
-				reg = <13>;	/* OP4B */
-			};
-
-			cfam6_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam6_i2c15: i2c-bus@f {
+			cfam7_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <15>;	/* OP5B */
-			};
-		};
 
-		fsi2spi@1c00 {
-			compatible = "ibm,fsi2spi";
-			reg = <0x1c00 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam6_spi0: spi@0 {
-				reg = <0x0>;
-				#address-cells = <1>;
-				#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+						scom815: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo815: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam6_spi1: spi@20 {
-				reg = <0x20>;
+			cfam7_i2c16: i2c-bus@10 {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <16>;	/* OP6A */
 
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
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-			cfam6_spi2: spi@40 {
-				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
-				#address-cells = <1>;
-				#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-				eeprom@0 {
-					at25,byte-len = <0x80000>;
-					at25,addr-mode = <4>;
-					at25,page-size = <256>;
+						scom816: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-					compatible = "atmel,at25";
-					reg = <0>;
-					spi-max-frequency = <1000000>;
+						sbefifo816: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 
-			cfam6_spi3: spi@60 {
-				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+			cfam7_i2c17: i2c-bus@11 {
 				#address-cells = <1>;
 				#size-cells = <0>;
+				reg = <17>;	/* OP6B */
 
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
+				i2cr@20 {
+					compatible = "ibm,i2cr-fsi-master";
+					reg = <0x20>;
+					#address-cells = <2>;
+					#size-cells = <0>;
 
-		sbefifo@2400 {
-			compatible = "ibm,p9-sbefifo";
-			reg = <0x2400 0x400>;
-			#address-cells = <1>;
-			#size-cells = <0>;
+					cfam@0,0 {
+						reg = <0 0>;
+						#address-cells = <1>;
+						#size-cells = <1>;
+						chip-id = <0>;
 
-			fsi_occ6: occ {
-				compatible = "ibm,p10-occ";
+						scom817: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
 
-				occ-hwmon {
-					compatible = "ibm,p10-occ-hwmon";
-					ibm,no-poll-on-init;
+						sbefifo817: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
 				};
 			};
 		};
 
-		fsi_hub6: hub@3400 {
-			compatible = "fsi-master-hub";
-			reg = <0x3400 0x400>;
-			#address-cells = <2>;
-			#size-cells = <0>;
-
-			no-scan-on-init;
-		};
-	};
-
-	cfam@7,0 { /* DCM3_C1 */
-		reg = <7 0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		chip-id = <7>;
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
-			cfam7_i2c2: i2c-bus@2 {
-				reg = <2>;	/* OM45 */
-			};
-
-			cfam7_i2c3: i2c-bus@3 {
-				reg = <3>;	/* OM67 */
-			};
-
-			cfam7_i2c10: i2c-bus@a {
-				reg = <10>;	/* OP3A */
-			};
-
-			cfam7_i2c11: i2c-bus@b {
-				reg = <11>;	/* OP3B */
-			};
-
-			cfam7_i2c14: i2c-bus@e {
-				reg = <14>;	/* OP5A */
-			};
-
-			cfam7_i2c15: i2c-bus@f {
-				reg = <15>;	/* OP5B */
-			};
-
-			cfam7_i2c16: i2c-bus@10 {
-				reg = <16>;	/* OP6A */
-			};
-
-			cfam7_i2c17: i2c-bus@11 {
-				reg = <17>;	/* OP6B */
-			};
-		};
-
 		fsi2spi@1c00 {
 			compatible = "ibm,fsi2spi";
 			reg = <0x1c00 0x400>;
@@ -3558,7 +3868,7 @@ eeprom@0 {
 
 			cfam7_spi2: spi@40 {
 				reg = <0x40>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3575,7 +3885,7 @@ eeprom@0 {
 
 			cfam7_spi3: spi@60 {
 				reg = <0x60>;
-				compatible = "ibm,fsi2spi-restricted";
+				compatible = "ibm,fsi2spi";
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -3619,22 +3929,6 @@ fsi_hub7: hub@3400 {
 };
 
 /* Legacy OCC numbering (to get rid of when userspace is fixed) */
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
 &fsi_occ4 {
 	reg = <5>;
 };
-- 
2.40.1

