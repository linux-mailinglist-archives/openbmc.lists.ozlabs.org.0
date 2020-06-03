Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 201911ECC9D
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 11:33:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cNxh2YQQzDqbw
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 19:33:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=wistron.com (client-ip=103.200.3.19; helo=segapp02.wistron.com;
 envelope-from=ben_pai@wistron.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=wistron.com
Received: from segapp02.wistron.com (segapp02.wistron.com [103.200.3.19])
 by lists.ozlabs.org (Postfix) with ESMTP id 49cNwn6B6bzDqGS
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 19:32:23 +1000 (AEST)
Received: from EXCHAPP01.whq.wistron (unverified [10.37.38.24]) by 
 TWNHUMSW3.wistron.com (Clearswift SMTPRS 5.6.0) with ESMTP id 
 <Tdf87a67628c0a816718a8@TWNHUMSW3.wistron.com> for 
 <openbmc@lists.ozlabs.org>; Wed, 3 Jun 2020 17:32:20 +0800
Received: from EXCHAPP01.whq.wistron (10.37.38.24) by EXCHAPP01.whq.wistron 
 (10.37.38.24) with Microsoft SMTP Server 
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 
 15.1.1913.5; Wed, 3 Jun 2020 17:32:19 +0800
Received: from gitserver.wistron.com (10.37.38.233) by EXCHAPP01.whq.wistron 
 (10.37.38.24) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 3 Jun 2020 17:32:19 +0800
From: Ben Pai <Ben_Pai@wistron.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.4 v1] ARM: dts: aspeed: mihawk: add aliases for
 i2c and add thermal sensor
Date: Wed, 3 Jun 2020 17:32:17 +0800
Message-ID: <20200603093217.2762-1-Ben_Pai@wistron.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
X-TM-SNTS-SMTP: F72871529A6EDBC9DBAF2AA6A1F68F017BB2D2A8FE5E9224816BF9DF3988F9872000:8
Content-Transfer-Encoding: 7bit
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
Cc: Ben Pai <Ben_Pai@wistron.com>, claire_ku@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

1.Set the bus id for each mux channel to avoid switching channels
multiple times
2.Set smbus_en of IO expander to 1 in order to be able to read tmp401
sensor
3.Add 8 tmp401 thermal sensors

Signed-off-by: Ben Pai <Ben_Pai@wistron.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts | 449 +++++++++++++++++++-
 1 file changed, 444 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
index f7e935ede919..78451b283d93 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
@@ -7,7 +7,52 @@
 / {
 	model = "Mihawk BMC";
 	compatible = "ibm,mihawk-bmc", "aspeed,ast2500";
-
+	aliases {
+		i2c215 = &bus6_mux215;
+		i2c216 = &bus6_mux216;
+		i2c217 = &bus6_mux217;
+		i2c218 = &bus6_mux218;
+		i2c219 = &bus6_mux219;
+		i2c220 = &bus6_mux220;
+		i2c221 = &bus6_mux221;
+		i2c222 = &bus6_mux222;
+		i2c223 = &bus7_mux223;
+		i2c224 = &bus7_mux224;
+		i2c225 = &bus7_mux225;
+		i2c226 = &bus7_mux226;
+		i2c227 = &bus7_mux227;
+		i2c228 = &bus7_mux228;
+		i2c229 = &bus7_mux229;
+		i2c230 = &bus7_mux230;
+		i2c231 = &bus9_mux231;
+		i2c232 = &bus9_mux232;
+		i2c233 = &bus9_mux233;
+		i2c234 = &bus9_mux234;
+		i2c235 = &bus9_mux235;
+		i2c236 = &bus9_mux236;
+		i2c237 = &bus9_mux237;
+		i2c238 = &bus9_mux238;
+		i2c239 = &bus10_mux239;
+		i2c240 = &bus10_mux240;
+		i2c241 = &bus10_mux241;
+		i2c242 = &bus10_mux242;
+		i2c243 = &bus10_mux243;
+		i2c244 = &bus10_mux244;
+		i2c245 = &bus10_mux245;
+		i2c246 = &bus10_mux246;
+		i2c247 = &bus12_mux247;
+		i2c248 = &bus12_mux248;
+		i2c249 = &bus12_mux249;
+		i2c250 = &bus12_mux250;
+		i2c251 = &bus13_mux251;
+		i2c252 = &bus13_mux252;
+		i2c253 = &bus13_mux253;
+		i2c254 = &bus13_mux254;
+		i2c255 = &bus13_mux255;
+		i2c256 = &bus13_mux256;
+		i2c257 = &bus13_mux257;
+		i2c258 = &bus13_mux258;
+	};
 
 	chosen {
 		stdout-path = &uart5;
@@ -630,6 +675,55 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x70>;
+
+		bus6_mux215: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		bus6_mux216: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		bus6_mux217: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus6_mux218: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		bus6_mux219: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		bus6_mux220: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		bus6_mux221: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		bus6_mux222: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
 	};
 
 };
@@ -644,6 +738,55 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x70>;
+
+		bus7_mux223: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		bus7_mux224: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		bus7_mux225: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus7_mux226: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		bus7_mux227: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		bus7_mux228: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		bus7_mux229: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		bus7_mux230: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+
 	};
 
 };
@@ -684,6 +827,68 @@
 		i2c-mux-idle-disconnect;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+
+		bus9_mux231: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus0 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus0";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus9_mux232: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus1 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus1";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus9_mux233: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus9_mux234: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 
 	pca9545@71 {
@@ -695,6 +900,68 @@
 		i2c-mux-idle-disconnect;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+
+		bus9_mux235: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus2 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus2";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus9_mux236: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus3 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus3";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus9_mux237: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus9_mux238: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
@@ -725,6 +992,68 @@
 		i2c-mux-idle-disconnect;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+
+		bus10_mux239: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus4 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus4";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus10_mux240: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus5 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus5";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus10_mux241: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus10_mux242: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 
 	pca9545@71 {
@@ -736,6 +1065,68 @@
 		i2c-mux-idle-disconnect;
 		interrupt-controller;
 		#interrupt-cells = <2>;
+
+		bus10_mux243: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus6 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus6";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus10_mux244: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			tca9554@39 {
+				compatible = "ti,tca9554";
+				reg = <0x39>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				smbus7 {
+					gpio-hog;
+					gpios = <4 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "smbus7";
+				};
+			};
+
+			tmp431@4c {
+				compatible = "ti,tmp401";
+				reg = <0x4c>;
+			};
+		};
+
+		bus10_mux245: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus10_mux246: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
@@ -796,7 +1187,7 @@
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-		i2c@0 {
+		bus12_mux247: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -807,7 +1198,7 @@
 			};
 		};
 
-		i2c@1 {
+		bus12_mux248: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
@@ -818,7 +1209,7 @@
 			};
 		};
 
-		i2c@2 {
+		bus12_mux249: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
@@ -829,7 +1220,7 @@
 			};
 		};
 
-		i2c@3 {
+		bus12_mux250: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
@@ -857,6 +1248,54 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		reg = <0x70>;
+
+		bus13_mux251: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		bus13_mux252: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		bus13_mux253: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		bus13_mux254: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		bus13_mux255: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+		bus13_mux256: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+		bus13_mux257: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+		bus13_mux258: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
 	};
 };
 
-- 
2.17.1


---------------------------------------------------------------------------------------------------------------------------------------------------------------
This email contains confidential or legally privileged information and is for the sole use of its intended recipient. 
Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
---------------------------------------------------------------------------------------------------------------------------------------------------------------
