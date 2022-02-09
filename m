Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0254AEF17
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 11:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtwmN2Bfwz3bV6
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 21:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=fZLGDd3D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::70a;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=fZLGDd3D; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtwlt250Xz2y7J
 for <openbmc@lists.ozlabs.org>; Wed,  9 Feb 2022 21:16:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flQIT2d7GaGogmrzW6t5sWUb7T0T0DJPc8LH0nmyAUBtJJ15fbf6n1YdW/Q3JyVLVGOGyi0J6eflJFzrI17fvnNdI3Uci5OkUy1TkBOqJusCClqPXd3f3SPQjHeEV1jDbUGhmPVZhQXz4XAxAVI3RW+WxnJbJP6UFEX3yneiJ4yZ3U7gayvSRFarV8rUwc/t1qqpQC4mA6ifTEkATr7pb9FXif8UK62M+8Ukm8v6/r9YQDpd7+2jr1eUVi3wfNCvrsQ7pL9V6qOMitjBd8OFcBar6ytsUvrS9w12SbZNtDw9QjAzFm4fVwq8E52EWiM3rF83qfA0AEwOtrCtuUShLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2k30+GyrG3ttOYM3rnEPeCgZ6we0To8b8YKWkm/4t8=;
 b=mqBtS166j7EGBkpXGWLbEOcnZ/L0EfYhfvxGaUKtu1MwVKaVDHRknmFpkLzboKTOs46KnNK+ypyZKoWe28Ojs8k1XKlNW2S8GgFt2qBWcFc6JJSgrvFOSP57AwDpT8DbPa8RxBAecwxf8SSaTK12Y/ZvPHVl8nSWIFAr7K7D3gOsoAP1sQGK+7Iv6ZFYfWrcSPgQHmo0iwVrmtsJrLkmCgln6LdZwerQvy5OgbXmvJz9dGe/DmRiatBjMe5aKDp32luSjm0q/o9S3f7wG5tApGOfGB5YEkIyPkccf6jnZywrENqxYgb8hBQenG0Jtpt7I4n1v/xPtGLH9wdUh+f9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2k30+GyrG3ttOYM3rnEPeCgZ6we0To8b8YKWkm/4t8=;
 b=fZLGDd3DclwPeLKf/FH7UMPkJ2YzSLkVMMiU9pplrjLb0xFhKfeJ8I+kwDYtuhKgI2Aq/VRE8LRv7zOtE8LcF+eGjAIxeqpf/I/uSTY9pMGl3A3E7vdiwunUCYV+JqzOK7Hn4cG5uqQf0DVWe/kwXQl3Oy8WsPME65BEZZ6CrR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from SG2PR04MB3285.apcprd04.prod.outlook.com (2603:1096:4:6d::18) by
 TY2PR04MB3295.apcprd04.prod.outlook.com (2603:1096:404:a1::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.19; Wed, 9 Feb 2022 10:16:32 +0000
Received: from SG2PR04MB3285.apcprd04.prod.outlook.com
 ([fe80::8d13:6b06:f7ea:c084]) by SG2PR04MB3285.apcprd04.prod.outlook.com
 ([fe80::8d13:6b06:f7ea:c084%6]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 10:16:31 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v3 1/1] arch: arm: dts: update bletchley dts
Date: Wed,  9 Feb 2022 18:16:18 +0800
Message-Id: <20220209101618.23984-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:202:16::11) To SG2PR04MB3285.apcprd04.prod.outlook.com
 (2603:1096:4:6d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cbf7917-ee9a-4b33-65ba-08d9ebb53dd4
X-MS-TrafficTypeDiagnostic: TY2PR04MB3295:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB3295497CCE334B42CF1B8A7C8E2E9@TY2PR04MB3295.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WnIaQ+kpTxKnGu6Z3fSIeWVhjf3qF1/tV3Sxv8osYXnxHw3VWC++OG1tJNetcUNMFN9Ge+V78JYcCBeu352uSctEbMRCM8u8DrSLqskTfVzJ+gkESZjhr1VZ7536lgZxyaiYAktEXZnyqPPu3DreR/UF/OXr0wixJtLzokrno0fy5h+PUo6Yii7eDBOgnNmjUzMc2vPh3wstkGl+6ANrdrAwmXQP8sXaGL1V3lt6lWnJcT8bAmopQ9Lo55ESZKZ1J3RlcRG3/mWO5gw0kD05pt1oQ7gKIq9twhT+fQpeJy+XVHAUANqmTaoW7TuItj38SoK+nzmeay+BO3dnTlsHCja6HyFj+ESWK9E8PcjzJC80V17tpQ81gKqiD2dfxhfEhr9ImvaFxlf4FEZlshK0Cj8sUgG0HkjDyFM7R+2E0VikKMMZ+ADzMBvcdGW1d3G6AJJIiDWSW3P42bQG6Wl4Rkyp0RYnOffx8s8QVcF6t6Q9bU+b+HhnhzwMi+s8FnHXp3zHdtoteKTZX3SHXu/YprGER7cm5rGXZBU6k7bbITz34FwjprXUnOk0y48RDE8Ky2MsgOp+utdsarBBy8gw6+cdBEoUHejlWiqmVBFgJ12NJ1Jv5TR/mxSOkC7gF7vQKDLumquksncAb71oHfCP2izlDV3XdtbPaDh9iqFlVdQntvviR25zbbLeHSCGoNprGxBkidxGIoQWmGLCzKr4ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR04MB3285.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8936002)(316002)(8676002)(36756003)(30864003)(5660300002)(66946007)(66476007)(66556008)(44832011)(6666004)(6506007)(38100700002)(38350700002)(2906002)(86362001)(83380400001)(2616005)(15650500001)(54906003)(508600001)(52116002)(186003)(6486002)(6512007)(107886003)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?448RAymSdE+C+XQhkzbm+c2FH/CWJvei/OklrooxpJNGXvVkS9+TNxpvKLEw?=
 =?us-ascii?Q?TC26O0vNfoOD3SuioO+xKAF6ia4O+Y/ARJ9fBxEFVVdBh3RJ0Sg1rGt83VMw?=
 =?us-ascii?Q?QTQgeTQtqFTRjW/+kGXloCHv0Oh5nQLlWh8ZSZYrrgAjgGALVk5QJQXZQ1fg?=
 =?us-ascii?Q?183p4ZXRVb4DzpdedOW8GFClH5SL6NSoEnk+aW1G7mQQoGm5dtAIG4cjfIGm?=
 =?us-ascii?Q?5u4NOvgO+QnedTSYhDdMdxPG6imr1c6P6nJWyJpKQJm2sQMvHRovN+mn827X?=
 =?us-ascii?Q?nEpfLYBhCqDTqcuclPNUksK+fkCeh3SFWTu1EQTEsNyvcyxCFwbOh6O4mP22?=
 =?us-ascii?Q?Tl6+LuKLOlgEvre4x1qfRKMGobBsFnIoftEwdd9Cbvx6e47m7HUjh9wCu8jc?=
 =?us-ascii?Q?h0GVvnN1oNw7GRgYDt+JZirWzcya4VPzWgYi0JE5poFrtoLkagwHXzIslUVl?=
 =?us-ascii?Q?VqBbgP+8JsUYd8oQ3Zu98goDd2kSnDUQ1X7BbJidHL39HmhZwiTQqE+Ww6TM?=
 =?us-ascii?Q?brl3+fn+ELoycO8IuLBH1pWIv/5NNpruDI8xTmAD0jrKsW5X15aTC299ziOM?=
 =?us-ascii?Q?IA/JfW2Fk/eQukmMH3bOhfVa546lSDJ/I0dn6EeOXYb2rl/yDrvzG7uL34Ch?=
 =?us-ascii?Q?VlLgIy1ra+QVOwupCGx8bEPYGuBDEI3ldkkiJzQE18g8A0Fl9aqmRA4BJxG5?=
 =?us-ascii?Q?OmauRiutP7ERclbpCbEes3Rugs93u4tp6cVVdneP+4PVb+/qvafmTU+xICQJ?=
 =?us-ascii?Q?DWTrDcgzh0a8BQ2HNx5epRIgL97D1thmrtiPbSHDTWx6G+A/LlR97j4xqUFm?=
 =?us-ascii?Q?7V/XgyPTO29Uq2cw20440PJEva/Tig27vs0+L+R5EvIrYjj1zRfumJF7sHaz?=
 =?us-ascii?Q?1PAkcwj5aoLSnoXhtdYKCWMDlnFJuFvya632/9J53QxzudtHMhGNZt3Fic5L?=
 =?us-ascii?Q?SgSx1Rugvg16qvKLhR+Zrka5Qxb2GuhjGk8F7J09yClwVOQpA5D7GzjZQ5v4?=
 =?us-ascii?Q?BRdOzVb5S1b0VWv6r13Q8wLcjOtiEjEDg9SrHg3BoyZ0e1/QdsoMKA81rSmT?=
 =?us-ascii?Q?PB23A+wlZUpTANgHMwx46uwe4C+CD+MqHNzndH2b3eNoFd5RnWimHfVWCjat?=
 =?us-ascii?Q?F1l+nNkgT+DYnvkKkY0LAVM/VKFthpBiHwQ41GxC0j722wxqODh1vzVjILR4?=
 =?us-ascii?Q?3L/IlQ/cc4SOiTupNSHXxF3GWm7PzBWRQaZhWru0yGFSKOA/sEEY29bD0vqj?=
 =?us-ascii?Q?JXjv1YcOhNjwJ/4sXVQIrzQQ9wcCZWx3AFL3UUaQywEN9vxiyBbWeXWNDwqM?=
 =?us-ascii?Q?WY1gGawtInbvsap0okxDx1F+C4dhzCtB3nXTKtytA0r/vMWlEIDGZubq3/pT?=
 =?us-ascii?Q?yl/P2z2oPieuS2mD3sSJvn5Z98mKLGBjc3VwnzLTN5l6fpNqD1ZhS6AQ4EGL?=
 =?us-ascii?Q?zo1RpO/KezSVlZ/m4RCb06sCaD9dX9tAJ/WFM6KgydQ5qeNwRBkBCz33PmN5?=
 =?us-ascii?Q?4HHA6ezDmhrBTIFncaLolBtZ38iblilY+SXMMwgjmZZ7/8myetoKHR607s+Y?=
 =?us-ascii?Q?xbGXcoLyNrOhIGQh2n4zfBc5RMVBFOs6+7giI00/nh2B0qON/DkCU6DkjT63?=
 =?us-ascii?Q?WmjVpGyIvawoKxN2ZvfC7pk=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbf7917-ee9a-4b33-65ba-08d9ebb53dd4
X-MS-Exchange-CrossTenant-AuthSource: SG2PR04MB3285.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 10:16:31.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPaLYj297jgaqF+4SjMbyigiogKdChbn/qGQTucxyUrVK4+BRo9x3Im138axlDtdtMXK0l2SA7/KWBquja+qqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3295
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

updates:
* seperate leds into multiple groups
* switch sled numbering to 1-based
* disable inchip rtc
* add flash1 in fmc
* switch spi2 pnor using spi-gpio
* update gpio-line-names
* add interrupt pin for each sledx_ioexp
* enable mdio3
* update ADM1278 shunt resistor (300 micro Ohm)
* add INA230 for each sled

Signed-off-by: Potin Lai <potin.lai@quantatw.com>

---
Changes v2 -> v3:
- enable mdio3
- update ADM1278 shunt resistor (300 micro Ohm)
- change sys_log_id default state to off
- add INA230 for each sled

Changes v1 -> v2:
- add interrupt pin for each sledx_ioexp
- remove duplicated i2c1 node
- remove all PCA955X_TYPE_GPIO (default is GPIO)
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 362 ++++++++++++------
 1 file changed, 235 insertions(+), 127 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index f973ea883b97..d0017bca86ad 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -5,6 +5,8 @@
 #include "aspeed-g6.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Facebook Bletchley BMC";
@@ -53,113 +55,139 @@
 		// Fixed link
 	};
 
-	leds {
+	front_leds {
 		compatible = "gpio-leds";
-
 		sys_log_id {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&front_leds 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			gpios = <&pca_front 0 GPIO_ACTIVE_HIGH>;
 		};
+	};
+
+	fan_leds {
+		compatible = "gpio-leds";
 		fan0_blue {
 			retain-state-shutdown;
-			default-state = "on";
-			gpios = <&fan_ioexp 8 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 8 GPIO_ACTIVE_HIGH>;
 		};
 		fan1_blue {
 			retain-state-shutdown;
-			default-state = "on";
-			gpios = <&fan_ioexp 9 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 9 GPIO_ACTIVE_HIGH>;
 		};
 		fan2_blue {
 			retain-state-shutdown;
-			default-state = "on";
-			gpios = <&fan_ioexp 10 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 10 GPIO_ACTIVE_HIGH>;
 		};
 		fan3_blue {
 			retain-state-shutdown;
-			default-state = "on";
-			gpios = <&fan_ioexp 11 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 11 GPIO_ACTIVE_HIGH>;
 		};
 		fan0_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&fan_ioexp 12 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 12 GPIO_ACTIVE_HIGH>;
 		};
 		fan1_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&fan_ioexp 13 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 13 GPIO_ACTIVE_HIGH>;
 		};
 		fan2_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&fan_ioexp 14 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+			gpios = <&pca_fan 14 GPIO_ACTIVE_HIGH>;
 		};
 		fan3_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&fan_ioexp 15 GPIO_ACTIVE_HIGH>;
-		};
-		sled0_amber {
-			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled0_leds 0 GPIO_ACTIVE_LOW>;
-		};
-		sled0_blue {
-			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled0_leds 1 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_fan 15 GPIO_ACTIVE_HIGH>;
 		};
+	};
+
+	sled1_leds {
+		compatible = "gpio-leds";
 		sled1_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled1_leds 0 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled1 0 GPIO_ACTIVE_LOW>;
 		};
 		sled1_blue {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled1_leds 1 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled1 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled2_leds {
+		compatible = "gpio-leds";
 		sled2_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled2_leds 0 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled2 0 GPIO_ACTIVE_LOW>;
 		};
 		sled2_blue {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled2_leds 1 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled2 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled3_leds {
+		compatible = "gpio-leds";
 		sled3_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled3_leds 0 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled3 0 GPIO_ACTIVE_LOW>;
 		};
 		sled3_blue {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled3_leds 1 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled3 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled4_leds {
+		compatible = "gpio-leds";
 		sled4_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled4_leds 0 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled4 0 GPIO_ACTIVE_LOW>;
 		};
 		sled4_blue {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled4_leds 1 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled4 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled5_leds {
+		compatible = "gpio-leds";
 		sled5_amber {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled5_leds 0 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled5 0 GPIO_ACTIVE_LOW>;
 		};
 		sled5_blue {
 			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
+			default-state = "keep";
+			gpios = <&pca_sled5 1 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sled6_leds {
+		compatible = "gpio-leds";
+		sled6_amber {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca_sled6 0 GPIO_ACTIVE_LOW>;
+		};
+		sled6_blue {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca_sled6 1 GPIO_ACTIVE_LOW>;
 		};
 	};
 };
@@ -178,7 +206,8 @@
 };
 
 &rtc {
-	status = "okay";
+	/* Use nxp,pcf85263 (i2c 6-0051) instead */
+	status = "disabled";
 };
 
 &fmc {
@@ -188,26 +217,48 @@
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "flash1";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
 };
 
 &spi2 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	compatible = "spi-gpio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+	gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+	gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+	num-chipselects = <1>;
+	cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
 
 	flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "pnor";
-		spi-max-frequency = <100000000>;
+		spi-max-frequency = <12000000>;
 	};
 };
 
 &i2c0 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -219,7 +270,7 @@
 		reg = <0x4f>;
 	};
 
-	sled0_ioexp: pca9539@76 {
+	sled1_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -227,14 +278,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		gpio-line-names =
-		"SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
-		"SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB302_INT",
-		"SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
-		"SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-host0";
+		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
 	};
 
-	sled0_leds: pca9552@67 {
+	pca_sled1: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -243,13 +299,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled0-amber","led-sled0-blue","SLED0_RST_IOEXP","",
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled0_fusb302: typec-portc@22 {
+	sled1_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -270,7 +326,11 @@
 
 &i2c1 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -282,7 +342,7 @@
 		reg = <0x4f>;
 	};
 
-	sled1_ioexp: pca9539@76 {
+	sled2_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -290,14 +350,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 1) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		gpio-line-names =
-		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
-		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
-		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
-		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
+		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
+		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
+		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
 	};
 
-	sled1_leds: pca9552@67 {
+	pca_sled2: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -306,13 +371,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled1_fusb302: typec-portc@22 {
+	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -331,13 +396,13 @@
 	};
 };
 
-&i2c1 {
-	status = "okay";
-};
-
 &i2c2 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -349,7 +414,7 @@
 		reg = <0x4f>;
 	};
 
-	sled2_ioexp: pca9539@76 {
+	sled3_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -357,14 +422,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 2) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		gpio-line-names =
-		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
-		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
-		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
-		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
+		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
+		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
+		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
+		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
 	};
 
-	sled2_leds: pca9552@67 {
+	pca_sled3: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -373,13 +443,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled2_fusb302: typec-portc@22 {
+	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -400,7 +470,11 @@
 
 &i2c3 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -412,7 +486,7 @@
 		reg = <0x4f>;
 	};
 
-	sled3_ioexp: pca9539@76 {
+	sled4_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -420,14 +494,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 3) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		gpio-line-names =
-		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
-		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
-		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
-		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
+		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
+		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
+		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
+		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
 	};
 
-	sled3_leds: pca9552@67 {
+	pca_sled4: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -436,13 +515,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled3_fusb302: typec-portc@22 {
+	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -463,7 +542,11 @@
 
 &i2c4 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -475,7 +558,7 @@
 		reg = <0x4f>;
 	};
 
-	sled4_ioexp: pca9539@76 {
+	sled5_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -483,14 +566,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 4) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		gpio-line-names =
-		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
-		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
-		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
-		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
+		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
+		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
+		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
+		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
 	};
 
-	sled4_leds: pca9552@67 {
+	pca_sled5: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -499,13 +587,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled4_fusb302: typec-portc@22 {
+	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -526,7 +614,11 @@
 
 &i2c5 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -538,7 +630,7 @@
 		reg = <0x4f>;
 	};
 
-	sled5_ioexp: pca9539@76 {
+	sled6_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -546,14 +638,19 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		gpio-line-names =
-		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
-		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
-		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
-		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
+		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
+		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
+		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
+		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
 	};
 
-	sled5_leds: pca9552@67 {
+	pca_sled6: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -562,13 +659,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled5_fusb302: typec-portc@22 {
+	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -632,7 +729,7 @@
 		reg = <0x40>;
 	};
 
-	front_leds: pca9552@67 {
+	pca_front: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -655,6 +752,7 @@
 	adm1278@11 {
 		compatible = "adi,adm1278";
 		reg = <0x11>;
+		shunt-resistor-micro-ohms = <300>;
 	};
 
 	tmp421@4c {
@@ -667,7 +765,7 @@
 		reg = <0x4d>;
 	};
 
-	fan_ioexp: pca9552@67 {
+	pca_fan: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -700,36 +798,38 @@
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
-	/*G0-G7*/	"","SWITCH_FRU_MUX","","","","","","",
+	/*G0-G7*/	"BSM_FRU_WP","SWITCH_FRU_MUX","","",
+			"PWRGD_P1V05_VDDCORE","PWRGD_P1V5_VDD","","",
 	/*H0-H7*/	"presence-riser1","presence-riser2",
-			"presence-sled0","presence-sled1",
-			"presence-sled2","presence-sled3",
-			"presence-sled4","presence-sled5",
+			"presence-sled1","presence-sled2",
+			"presence-sled3","presence-sled4",
+			"presence-sled5","presence-sled6",
 	/*I0-I7*/	"REV_ID0","","REV_ID1","REV_ID2",
-			"","","","",
+			"","BSM_FLASH_WP_STATUS","BMC_TPM_PRES","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","",
-	/*M0-M7*/	"ALERT_SLED0","ALERT_SLED1",
-			"ALERT_SLED2","ALERT_SLED3",
-			"ALERT_SLED4","ALERT_SLED5",
+	/*L0-L7*/	"","","","","","BMC_RTC_INT","","",
+	/*M0-M7*/	"ALERT_SLED1","ALERT_SLED2",
+			"ALERT_SLED3","ALERT_SLED4",
+			"ALERT_SLED5","ALERT_SLED6",
 			"P12V_AUX_ALERT1","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","",
 			"","BOARD_ID0","BOARD_ID1","BOARD_ID2",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","BMC_HEARTBEAT",
 	/*Q0-Q7*/	"","","","","","","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","BAT_DETECT",
 			"BMC_BT_WP0","BMC_BT_WP1","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-	/*V0-V7*/	"","RST_BMC_MVL","","",
+	/*V0-V7*/	"PWRGD_CNS_PSU","RST_BMC_MVL","","PSU_PRSNT",
 			"USB2_SEL0_A","USB2_SEL1_A",
 			"USB2_SEL0_B","USB2_SEL1_B",
 	/*W0-W7*/	"RST_FRONT_IOEXP","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
-	/*Y0-Y7*/	"","","BSM_FLASH_LATCH","","","","","",
+	/*Y0-Y7*/	"BMC_SELF_HW_RST","BSM_PRSNT","BSM_FLASH_LATCH","",
+			"","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 };
 
@@ -754,3 +854,11 @@
 		&pinctrl_adc12_default &pinctrl_adc13_default
 		&pinctrl_adc14_default &pinctrl_adc15_default>;
 };
+
+&mdio3 {
+	status = "okay";
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id002b.09ae";
+		reg = <0>;
+	};
+};
-- 
2.17.1

