Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5DC5B474
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 08:04:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ccK24bjNzDqT6
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 16:04:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="edH3qpft"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ccGd0Z9gzDqTK
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 16:02:32 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q10so5987873pff.9
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2019 23:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3mn9Th6Id4GJH4l490x09GUi/BKqiy1GCSQQSORFQk=;
 b=edH3qpftg3Gl45b7IzTO8q+4op+TTb7Yp/A3BB+MmcWnsk4saLF64hY9sxBr3vXkUA
 7N7Mu8AmVpu/3AimS8h6+jhtPjB2QOoXpDy8bqBj4KH0ET3g/xkx3lXfErmjzRGyyUc0
 iofoOq9OaS2bifuhlimJXyJb+yHonRS6po9Wou5yZ5m7Az83/JcnwXautIjE8Y8iGqG2
 evOCHs3RyJRMT+0tyPGv6LJnZEgYUeEiALyp5+RrCWdbdR7fmt9IsnBeDNuPwZNBXT8n
 j/RUm6FBm7aIGKAZvA/X/XbfG+EkPLx/mn09mY9ItAAWm0HQPXhh5p6W64LWEiZkpL/E
 4eyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3mn9Th6Id4GJH4l490x09GUi/BKqiy1GCSQQSORFQk=;
 b=uLF7C/LdIT2ibXAPCXA5YBk7lEslic4zFjCdbnlUbz5t8ACYUG/rM3gsuG3jT4WiuE
 Y1FcZXL4Livzaf+JSP/aJTNQlzPg3/FAfFzC6gFqTENzE3vBFVnekDcFyzFnkYx9hSlm
 Q4IAY4AJZ+Lno1EaIuFaPCrbQh0GptIJzVDUzYG3eSSmnc8vuSL0oduCk5p68Obeq8PD
 qOmAnCt6L+QOQFFqSkTE0FMvaMkSoj67UHX4EO0VcngX+QMk6VH5CPUSL858g/BkZN81
 Vt/4ulOx4FTHZFG9rXWfN9Oloe9ATBDlittf+wMc7IbD7zEUfZo1cmv3Su6H66EsDfxU
 XxwA==
X-Gm-Message-State: APjAAAVOzcxLv/lxw2MYwUTUUS/CKbUmbepMA6xf3t+6lVi53CzZDJGW
 gB5orPxuX6ugYkQZwJZHCGc=
X-Google-Smtp-Source: APXvYqwim2W5zebWuocYpy/bJMomtg2QbRY/+XXm5oqOn3JIG0/BR8Te+l8LrlwDWIowavfjfFIjQQ==
X-Received: by 2002:a17:90a:9903:: with SMTP id
 b3mr28939360pjp.80.1561960950333; 
 Sun, 30 Jun 2019 23:02:30 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id w14sm8672127pfn.47.2019.06.30.23.02.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 23:02:29 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.17 v1 3/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc:
 Add i2c nodes
Date: Mon,  1 Jul 2019 14:01:34 +0800
Message-Id: <20190701060137.22116-3-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190701060137.22116-1-chyishian.jiang@gmail.com>
References: <20190701060137.22116-1-chyishian.jiang@gmail.com>
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
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 232 +++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index bcd7f1063399..b7d3b4d83f0d 100644
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
@@ -269,6 +283,224 @@
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

