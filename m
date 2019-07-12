Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95266721
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 08:41:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNcP4kRXzDqnK
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:41:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ET2VE2QQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNVr37H0zDqYn
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 16:36:36 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c2so4263644plz.13
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FcdwE5r7PA9ZLsC5GQJ6nTDgwaCGkLA1qEx1AWaJTyQ=;
 b=ET2VE2QQmMuPXXAUIkLRjDfc2CJMJoeXJuIMW5R59s9P7j15dqwnsiiPWZRtHW5mPb
 yHSaxBGNkBY4j+bRh/djD1Fpidx/c0tQGpMU4DSI5vmByRQSEohg6Fsm+FitnQg4Xk4M
 AaZw0zISuQjHQhgftVeXPbahzook4RaDpK8KW7ief7Evjn7O14A7Z3Q0Tya/jQ6QVy7t
 YCh0i0GEd/0r9sc6Ud7XL/ch/jHhzE8VFuehvskG31fgH85I0/sSCslY95/e4MVUBeeN
 IooE5T1P9HGhLtoYqlBMfiKAF/8Wz0JT3hxQZhiS1b52Ec1nydg4vplvMUezevGm5Chx
 ApdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FcdwE5r7PA9ZLsC5GQJ6nTDgwaCGkLA1qEx1AWaJTyQ=;
 b=eTbAR/cDcow+P8af8ARVHO6iirdAwTlEQiA7bpdM+3bG2ItvPe63s9Eh43yqyf1STB
 CZTgMXnXhUiTq3OIvGk9tJ3en8FZ+NXJ2Hnlxzzt/WDSL959/8MGFZHSNHoLKUgigHUT
 FYKh+ztchqqV8Y90l/dJtHWK/1mU3pM7DfvRx00GoMLQdGM03WWl2JzaN5jrx8h+VFtE
 aplBPfO8KVm81yFOhETbLqCCX/c1j1YHNhG/7N3ugz5H62NGgV5+Cc10RSlC9umMA6XS
 gmKD+57z6H0DpYXJf3p2N8Lugs0MdhtqzIqCEhwtb7mst2nO2rY/61C3aIpTS2Htf/VF
 XcUg==
X-Gm-Message-State: APjAAAU1E+4ahVq+O2NHMr7WDib4XRcqIo1e8LMwwdVA5F2Qx3cpuJYU
 oiEMEDqHHC5BySRd3hHzq70=
X-Google-Smtp-Source: APXvYqxERdvcaM8A1Gq8vWFIdxpXbetvaThpyWeNw3A1FyteDRHxaONOlpv4+2hj2go+oRzazQ+FOA==
X-Received: by 2002:a17:902:583:: with SMTP id
 f3mr9374588plf.137.1562913394724; 
 Thu, 11 Jul 2019 23:36:34 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id z19sm6610488pgv.35.2019.07.11.23.36.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jul 2019 23:36:34 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.2 v2 4/7] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: Add
 i2c nodes
Date: Fri, 12 Jul 2019 14:35:09 +0800
Message-Id: <20190712063511.96268-4-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190712063511.96268-1-chyishian.jiang@gmail.com>
References: <20190712063511.96268-1-chyishian.jiang@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <Samuel.Jiang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

update nuvoton-npcm750-runbmc dts i2c nodes which includeing:
1. ADC
2. EEPROM
3. i2c-switch
4. temperature sensor
5. ADM

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 257 +++++++++++++++++++
 1 file changed, 257 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index 90210217d54c..e46015c56d24 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -27,6 +27,20 @@
 		udc8 = &udc8;
 		udc9 = &udc9;
 		emmc0 = &sdhci0;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
 		spi0 = &spi0;
 		spi1 = &spi1;
 		fiu0 = &fiu0;
@@ -249,6 +263,7 @@
 			};
 
 			adc: adc@c000 {
+				#io-channel-cells = <1>;
 				status = "okay";
 			};
 
@@ -277,6 +292,248 @@
 				};
 			};
 
+			i2c0: i2c@80000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@81000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				i2c-switch@70 {
+					compatible = "nxp,pca9548";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x70>;
+					i2c-mux-idle-disconnect;
+
+					i2c_slot1a: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_slot1b: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+
+					i2c_slot2a: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_slot2b: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+
+					i2c_slot3: i2c-bus@4 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <4>;
+					};
+
+					i2c_slot4: i2c-bus@5 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <5>;
+					};
+
+					i2c_slot5: i2c-bus@6 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <6>;
+					};
+				};
+
+				i2c-switch@71 {
+					compatible = "nxp,pca9546";
+					reg = <0x71>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					i2c-mux-idle-disconnect;
+
+					i2c_m2_s1: i2c-bus@0 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <0>;
+					};
+
+					i2c_m2_s2: i2c-bus@1 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <1>;
+					};
+					i2c_m2_s3: i2c-bus@2 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <2>;
+					};
+
+					i2c_m2_s4: i2c-bus@3 {
+						#address-cells = <1>;
+						#size-cells = <0>;
+						reg = <3>;
+					};
+				};
+			};
+
+			i2c2: i2c@82000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp421@4c {
+					compatible = "ti,tmp421";
+					reg = <0x4c>;
+				};
+			};
+
+			i2c3: i2c@83000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c4: i2c@84000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				eeprom@54 {
+					compatible = "atmel,24c64";
+					reg = <0x54>;
+				};
+			};
+
+			i2c5: i2c@85000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c6: i2c@86000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				ina219@40 {
+					compatible = "ti,ina219";
+					reg = <0x40>;
+				};
+				ina219@41 {
+					compatible = "ti,ina219";
+					reg = <0x41>;
+				};
+				ina219@44 {
+					compatible = "ti,ina219";
+					reg = <0x44>;
+				};
+				ina219@45 {
+					compatible = "ti,ina219";
+					reg = <0x45>;
+				};
+				tps53679@60 {
+					compatible = "ti,tps53679";
+					reg = <0x60>;
+				};
+				tps53679@70 {
+					compatible = "ti,tps53679";
+					reg = <0x70>;
+				};
+			};
+
+			i2c7: i2c@87000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp421@4c {
+					compatible = "ti,tmp421";
+					reg = <0x4c>;
+				};
+
+				adc128d818@1d {
+					compatible = "ti,adc128d818";
+					reg = <0x1d>;
+					ti,mode = <1>;
+				};
+			};
+
+			i2c8: i2c@88000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				adm1278@11 {
+					compatible = "adm1278";
+					reg = <0x11>;
+					Rsense = <500>;
+				};
+
+				adm1278@12 {
+					compatible = "adm1278";
+					reg = <0x12>;
+					Rsense = <500>;
+				};
+			};
+
+			i2c9: i2c@89000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c10: i2c@8a000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c11: i2c@8b000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c12: i2c@8c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+			};
+
+			i2c13: i2c@8d000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				bus-frequency = <100000>;
+				status = "okay";
+				tmp75@4a {
+					compatible = "ti,tmp75";
+					reg = <0x4a>;
+					status = "okay";
+				};
+				m24128_fru@51 {
+					compatible = "atmel,24c128";
+					reg = <0x51>;
+					pagesize = <64>;
+					status = "okay";
+				};
+			};
+
 			pwm_fan:pwm-fan-controller@103000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <   &pwm0_pins &pwm1_pins
-- 
2.20.1

