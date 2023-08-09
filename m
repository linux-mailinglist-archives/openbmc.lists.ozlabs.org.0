Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934A775470
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 09:51:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=US0gozjf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLMgb6vh9z30PJ
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 17:51:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=US0gozjf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLMdt5qrvz2yVc
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 17:49:38 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686e0213c0bso4728163b3a.1
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567375; x=1692172175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyfHsXrHuWetRlmzERKwU98xWH0YUtnvYHB7801NyFs=;
        b=US0gozjfZTiMQre5WKq2oCW/WMQMCxKaAcKTMSpLjxgOUlvmRoA9kCf4ADl2Awk+Pk
         g5vdbLScy97NAsc8kQnkasz5E8UJ74vVoaEI0xHSU8CcEy89znmnUVJBO7HQoji4Iou0
         1syniexB/ittHPkRYV/OB8aU6vli5WfJpOm1KtMr43xZTrPjqVil+NQrQdhZh58WvDxV
         7cBfCc4932w552tUiigmtrii8lanx1Ad4cFGj5YR+RJyw+xYhu6DeFzoX1o00t2RiW5N
         GpnhKX1Yg5p5MGH8qNL+G+iN/HjOYHyyjsepOx9LoWA1N6HyEXf6gp+KY3OIAiKTAJ2L
         wV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567375; x=1692172175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XyfHsXrHuWetRlmzERKwU98xWH0YUtnvYHB7801NyFs=;
        b=VzA+ouZmBbDD5yBUsZqZc3Ri07n1gISOunax7pOJPNJhS6EEGyMfuajLf07QmWJh2Q
         WPzhnkBFRurg7N/nATBEhAn2JTxGktRWPhvep3qP56GFYniV/7CucD7YSAUg9XkpK3Dt
         qVyDu/g/OGlHhMg49rLuzMtOYpKfnenh4hXP8qap+p6YmGWX84CWIRygLm3CnTFCE02P
         DPLOdckw4NJZzhAKSdqAZ1y3LJS6wYzejsfrTCP50MFLl2TzmCg5oIhOEecE59mRyiLE
         qNBsbQLfdQ9ZoHrjDI9VMG3Si6okuCJDDBShvv8mB8fb9DgnQyBcG/6uOeSNCNibkqYH
         WJcQ==
X-Gm-Message-State: AOJu0YxG2NGMI0noTRAjTu810Xg4MpOjq0ULu9vqX5iXhkXAoCrYTL+d
	ztvexlwNmE7mzZGXlgdo4ENkRckQXLA=
X-Google-Smtp-Source: AGHT+IGDw4WAMdu1xtHK7spVRJLJOicJqySm6kZkI94P1fA5QpMb3FCgJCFl1NEKgihDPh8K5zrotQ==
X-Received: by 2002:a05:6a00:399e:b0:668:69fa:f78f with SMTP id fi30-20020a056a00399e00b0066869faf78fmr1926459pfb.1.1691567374621;
        Wed, 09 Aug 2023 00:49:34 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b0068285a7f107sm9620603pfn.177.2023.08.09.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:49:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-6.1 v3 1/5] ARM: dts: aspeed: Add P10 FSI descriptions
Date: Wed,  9 Aug 2023 17:19:17 +0930
Message-Id: <20230809074921.116987-2-joel@jms.id.au>
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

These will be used by BMCs attached to a IBM Power10 server CPU.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/ibm-power10-dual.dtsi |  380 +++++++
 arch/arm/boot/dts/ibm-power10-quad.dtsi | 1305 +++++++++++++++++++++++
 2 files changed, 1685 insertions(+)
 create mode 100644 arch/arm/boot/dts/ibm-power10-dual.dtsi
 create mode 100644 arch/arm/boot/dts/ibm-power10-quad.dtsi

diff --git a/arch/arm/boot/dts/ibm-power10-dual.dtsi b/arch/arm/boot/dts/ibm-power10-dual.dtsi
new file mode 100644
index 000000000000..cc466910bb52
--- /dev/null
+++ b/arch/arm/boot/dts/ibm-power10-dual.dtsi
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 IBM Corp.
+
+&fsim0 {
+	status = "okay";
+
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+
+	cfam@0,0 {
+		reg = <0 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <0>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_i2c0: i2c-bus@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;	/* OMI01 */
+			};
+
+			cfam0_i2c1: i2c-bus@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;	/* OMI23 */
+			};
+
+			cfam0_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam0_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam0_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <12>;	/* OP4A */
+			};
+
+			cfam0_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <13>;	/* OP4B */
+			};
+
+			cfam0_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam0_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam0_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi2: spi@40 {
+				reg = <0x40>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam0_spi3: spi@60 {
+				reg = <0x60>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ0: occ {
+				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi_hub0: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&fsi_hub0 {
+	cfam@1,0 {
+		reg = <1 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <1>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_i2c2: i2c-bus@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;	/* OMI45 */
+			};
+
+			cfam1_i2c3: i2c-bus@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;	/* OMI67 */
+			};
+
+			cfam1_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
+			};
+
+			cfam1_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
+			};
+
+			cfam1_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
+			};
+
+			cfam1_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
+			};
+
+			cfam1_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <16>;	/* OP6A */
+			};
+
+			cfam1_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <17>;	/* OP6B */
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam1_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi2: spi@40 {
+				reg = <0x40>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam1_spi3: spi@60 {
+				reg = <0x60>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ1: occ {
+				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi_hub1: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ0 {
+	reg = <1>;
+};
+
+&fsi_occ1 {
+	reg = <2>;
+};
+
+/ {
+	aliases {
+		i2c100 = &cfam0_i2c0;
+		i2c101 = &cfam0_i2c1;
+		i2c110 = &cfam0_i2c10;
+		i2c111 = &cfam0_i2c11;
+		i2c112 = &cfam0_i2c12;
+		i2c113 = &cfam0_i2c13;
+		i2c114 = &cfam0_i2c14;
+		i2c115 = &cfam0_i2c15;
+		i2c202 = &cfam1_i2c2;
+		i2c203 = &cfam1_i2c3;
+		i2c210 = &cfam1_i2c10;
+		i2c211 = &cfam1_i2c11;
+		i2c214 = &cfam1_i2c14;
+		i2c215 = &cfam1_i2c15;
+		i2c216 = &cfam1_i2c16;
+		i2c217 = &cfam1_i2c17;
+
+		spi10 = &cfam0_spi0;
+		spi11 = &cfam0_spi1;
+		spi12 = &cfam0_spi2;
+		spi13 = &cfam0_spi3;
+		spi20 = &cfam1_spi0;
+		spi21 = &cfam1_spi1;
+		spi22 = &cfam1_spi2;
+		spi23 = &cfam1_spi3;
+	};
+};
diff --git a/arch/arm/boot/dts/ibm-power10-quad.dtsi b/arch/arm/boot/dts/ibm-power10-quad.dtsi
new file mode 100644
index 000000000000..57494c744b5d
--- /dev/null
+++ b/arch/arm/boot/dts/ibm-power10-quad.dtsi
@@ -0,0 +1,1305 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2023 IBM Corp.
+
+#include "ibm-power10-dual.dtsi"
+
+&cfam0_i2c0 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom100: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo100: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c1 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom101: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo101: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c10 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom110: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo110: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c11 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom111: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo111: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c12 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom112: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo112: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c13 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom113: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo113: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c14 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom114: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo114: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam0_i2c15 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom115: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo115: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c2 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom202: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo202: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c3 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom203: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo203: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c10 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom210: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo210: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c11 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom211: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo211: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c14 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom214: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo214: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c15 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom215: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo215: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c16 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom216: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo216: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&cfam1_i2c17 {
+	i2cr@20 {
+		compatible = "ibm,i2cr-fsi-master";
+		reg = <0x20>;
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cfam@0,0 {
+			reg = <0 0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			chip-id = <0>;
+
+			scom217: scom@1000 {
+				compatible = "ibm,i2cr-scom";
+				reg = <0x1000 0x400>;
+			};
+
+			sbefifo217: sbefifo@2400 {
+				compatible = "ibm,p9-sbefifo";
+				reg = <0x2400 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+};
+
+&fsi_hub0 {
+	cfam@2,0 {
+		reg = <2 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <2>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam2_i2c0: i2c-bus@0 {
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
+						scom300: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo300: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c1: i2c-bus@1 {
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
+						scom301: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo301: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
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
+						scom310: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo310: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
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
+						scom311: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo311: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c12: i2c-bus@c {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <12>;	/* OP4A */
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
+						scom312: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo312: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c13: i2c-bus@d {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <13>;	/* OP4B */
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
+						scom313: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo313: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
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
+						scom314: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo314: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam2_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
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
+						scom315: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo315: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam2_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam2_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam2_spi2: spi@40 {
+				reg = <0x40>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam2_spi3: spi@60 {
+				reg = <0x60>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ2: occ {
+				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi_hub2: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+
+	cfam@3,0 {
+		reg = <3 0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		chip-id = <3>;
+
+		scom@1000 {
+			compatible = "ibm,fsi2pib";
+			reg = <0x1000 0x400>;
+		};
+
+		i2c@1800 {
+			compatible = "ibm,fsi-i2c-master";
+			reg = <0x1800 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam3_i2c2: i2c-bus@2 {
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
+						scom402: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo402: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c3: i2c-bus@3 {
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
+						scom403: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo403: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c10: i2c-bus@a {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <10>;	/* OP3A */
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
+						scom410: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo410: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c11: i2c-bus@b {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <11>;	/* OP3B */
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
+						scom411: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo411: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c14: i2c-bus@e {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <14>;	/* OP5A */
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
+						scom414: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo414: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c15: i2c-bus@f {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <15>;	/* OP5B */
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
+						scom415: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo415: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c16: i2c-bus@10 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <16>;	/* OP6A */
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
+						scom416: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo416: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+
+			cfam3_i2c17: i2c-bus@11 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <17>;	/* OP6B */
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
+						scom417: scom@1000 {
+							compatible = "ibm,i2cr-scom";
+							reg = <0x1000 0x400>;
+						};
+
+						sbefifo417: sbefifo@2400 {
+							compatible = "ibm,p9-sbefifo";
+							reg = <0x2400 0x400>;
+							#address-cells = <1>;
+							#size-cells = <0>;
+						};
+					};
+				};
+			};
+		};
+
+		fsi2spi@1c00 {
+			compatible = "ibm,fsi2spi";
+			reg = <0x1c00 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cfam3_spi0: spi@0 {
+				reg = <0x0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam3_spi1: spi@20 {
+				reg = <0x20>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam3_spi2: spi@40 {
+				reg = <0x40>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+
+			cfam3_spi3: spi@60 {
+				reg = <0x60>;
+				compatible =  "ibm,fsi2spi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eeprom@0 {
+					at25,byte-len = <0x80000>;
+					at25,addr-mode = <4>;
+					at25,page-size = <256>;
+
+					compatible = "atmel,at25";
+					reg = <0>;
+					spi-max-frequency = <1000000>;
+				};
+			};
+		};
+
+		sbefifo@2400 {
+			compatible = "ibm,p9-sbefifo";
+			reg = <0x2400 0x400>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			fsi_occ3: occ {
+				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
+			};
+		};
+
+		fsi_hub3: hub@3400 {
+			compatible = "fsi-master-hub";
+			reg = <0x3400 0x400>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+
+			no-scan-on-init;
+		};
+	};
+};
+
+/* Legacy OCC numbering (to get rid of when userspace is fixed) */
+&fsi_occ2 {
+	reg = <3>;
+};
+
+&fsi_occ3 {
+	reg = <4>;
+};
+
+/ {
+	aliases {
+		i2c300 = &cfam2_i2c0;
+		i2c301 = &cfam2_i2c1;
+		i2c310 = &cfam2_i2c10;
+		i2c311 = &cfam2_i2c11;
+		i2c312 = &cfam2_i2c12;
+		i2c313 = &cfam2_i2c13;
+		i2c314 = &cfam2_i2c14;
+		i2c315 = &cfam2_i2c15;
+		i2c402 = &cfam3_i2c2;
+		i2c403 = &cfam3_i2c3;
+		i2c410 = &cfam3_i2c10;
+		i2c411 = &cfam3_i2c11;
+		i2c414 = &cfam3_i2c14;
+		i2c415 = &cfam3_i2c15;
+		i2c416 = &cfam3_i2c16;
+		i2c417 = &cfam3_i2c17;
+
+		sbefifo100 = &sbefifo100;
+		sbefifo101 = &sbefifo101;
+		sbefifo110 = &sbefifo110;
+		sbefifo111 = &sbefifo111;
+		sbefifo112 = &sbefifo112;
+		sbefifo113 = &sbefifo113;
+		sbefifo114 = &sbefifo114;
+		sbefifo115 = &sbefifo115;
+		sbefifo202 = &sbefifo202;
+		sbefifo203 = &sbefifo203;
+		sbefifo210 = &sbefifo210;
+		sbefifo211 = &sbefifo211;
+		sbefifo214 = &sbefifo214;
+		sbefifo215 = &sbefifo215;
+		sbefifo216 = &sbefifo216;
+		sbefifo217 = &sbefifo217;
+		sbefifo300 = &sbefifo300;
+		sbefifo301 = &sbefifo301;
+		sbefifo310 = &sbefifo310;
+		sbefifo311 = &sbefifo311;
+		sbefifo312 = &sbefifo312;
+		sbefifo313 = &sbefifo313;
+		sbefifo314 = &sbefifo314;
+		sbefifo315 = &sbefifo315;
+		sbefifo402 = &sbefifo402;
+		sbefifo403 = &sbefifo403;
+		sbefifo410 = &sbefifo410;
+		sbefifo411 = &sbefifo411;
+		sbefifo414 = &sbefifo414;
+		sbefifo415 = &sbefifo415;
+		sbefifo416 = &sbefifo416;
+		sbefifo417 = &sbefifo417;
+
+		scom100 = &scom100;
+		scom101 = &scom101;
+		scom110 = &scom110;
+		scom111 = &scom111;
+		scom112 = &scom112;
+		scom113 = &scom113;
+		scom114 = &scom114;
+		scom115 = &scom115;
+		scom202 = &scom202;
+		scom203 = &scom203;
+		scom210 = &scom210;
+		scom211 = &scom211;
+		scom214 = &scom214;
+		scom215 = &scom215;
+		scom216 = &scom216;
+		scom217 = &scom217;
+		scom300 = &scom300;
+		scom301 = &scom301;
+		scom310 = &scom310;
+		scom311 = &scom311;
+		scom312 = &scom312;
+		scom313 = &scom313;
+		scom314 = &scom314;
+		scom315 = &scom315;
+		scom402 = &scom402;
+		scom403 = &scom403;
+		scom410 = &scom410;
+		scom411 = &scom411;
+		scom414 = &scom414;
+		scom415 = &scom415;
+		scom416 = &scom416;
+		scom417 = &scom417;
+
+		spi30 = &cfam2_spi0;
+		spi31 = &cfam2_spi1;
+		spi32 = &cfam2_spi2;
+		spi33 = &cfam2_spi3;
+		spi40 = &cfam3_spi0;
+		spi41 = &cfam3_spi1;
+		spi42 = &cfam3_spi2;
+		spi43 = &cfam3_spi3;
+	};
+};
-- 
2.40.1

