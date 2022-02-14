Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2770A4B40DB
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxrrr5Q10z3bTp
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:31:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=H+soTksG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::702;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=H+soTksG; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrpy3PGXz2x9b
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcBwaN6idv9uB1KaHMQQexbB8bPcsBeVmT8VjG/R3lBoB6QDdVI3LEBs3/zQDnmT+AVUbgz3wbwBk9dzHMEKneylePdF2fdllPedmoc8r1f5xEI4Zmc7RFPPE2M4THaeRw2lL3r1GMpYFuYSPQFq8JpY9aiEm4XX9yiXKLldnTN96iF7BLXVvBQL2bmlHSxOCaH79XL/jTbNa+SBrJXvjDurEphrmt5CQzThe25BQic/WD5qZErfeqfYNyqU+Gbi+XH6eVTFAoVdvWQRa7U9BCr15wpsWmR6pH1Z2XeJgPx437oIW+qIXYWYBKtq/aiIa7P9d7T3oUYMm1ujJlHRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym26i91zXYG3NZ5T+ENx691CMP+Yj4da2kmQwEnVa7c=;
 b=j6vHOmeQVXTOWQapN/3ghVkuRW2C6YQp0RRn3FH4+ne4XlPhFjbD1F4yNjGMZdp5vHVBsqGin9gV/NOoA4P5JIynhQOWInviy1uK8l0aVqz0V2d46mN4cPp88rLPszNW+ILJkL0apsMu9jE0x+PsdGXSgCk9/2fHIP5K7GYLyAUGHem+fKt2T0zd6hBqfnrip/r5x/ThwXSS+2Katwb6ZnwQcnhrTWEq+gKuzqGKmI5t+YRguXxG2iuIXTebctcJWf4ObqVE+ROvIQ3oPgnffBIH1wIIhT3NHoObv4eABh4BhI7dXTTeKE8Y03aNkNHc7q7T53e9AmsWPvlEWd5Slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym26i91zXYG3NZ5T+ENx691CMP+Yj4da2kmQwEnVa7c=;
 b=H+soTksG1AIYoRqGM9GSFRxKnjGG2+uIH2AdBielnLb8KNcabN5jIIRvisQuHi4pbxlAPTXFPaTAc7x8ythff++wLsJ35KlrXN1PozewMesYBR6uwd8Zko12/NAkRQWeTpKR/XW6Gl/vKC+s2sB4HTjG5RR3up1ZU5wXntMSX4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB5916.apcprd04.prod.outlook.com (2603:1096:4:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:27 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:26 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 02/10] arch: arm: dts: bletchley: separate
 leds into multiple groups
Date: Mon, 14 Feb 2022 12:29:04 +0800
Message-Id: <20220214042912.14584-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af7db0c5-11d5-4f1c-59cf-08d9ef729557
X-MS-TrafficTypeDiagnostic: SG2PR04MB5916:EE_
X-Microsoft-Antispam-PRVS: <SG2PR04MB59165832ED0584C8D337E6BA8E339@SG2PR04MB5916.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J7pLGjKgrtftnuAnOm3+s9YqqkmfVZS0y7p8Z/h0P+DIOi+YyhTzQ7kUMFzUQH/hngC+5saZodSbh61+ii34NRq6jZkger3O+l0UxENB2m2t5K42IQ5gwbkOpj8G7ICU922K7VdtRillguEBAAwuoTrQDMjEKXVn8tZDGlReTQP7TA89sCz2vEVVo7CmmKC/Rna560aJt2pY39D6UfKKveq+/DzM5E94Rb2W+iLZ7rBJ3liryUJwGtQ7Ujnpd52YK9RYzhTUaAaeyA9Xu1ZyfuBYCbZ99Pm36CrWtDQ+TsdwGtEzlJ2IOHa7cSbu6y9KFY7g+fe07AK+72FCsT5o4ge8RqB9CrNNmOJcoX0vxkpPFVwFAHYXbMqqniA6/UIM/T6vN/ilQ8wQMYij8WRRFrF8SH8ks2PfsSNksuuwyIubkvPQJx+DnFVkZYl9dCNgnntLy5326SeluN8Qgf6ootZNAIBAEAxMjCwf2+k20G3uECJJyaSM9RYtz8zebbe1E/y6wwGbcDTwCuhaBkWW6niIH7rA2G4kOkKjyyrJS5oF9S158FPEtadkYmrcMYkAiFjVzMsdkiMUSsFuoFeO0trm4KuavVZl8lrYdtPZnAq7xtLyKfWosBqrP2Wz7VzVmFjaR8Ya6yBGzqjwMRTXASxLL8h3eS0LPmS7x3Lv98oGBbsAJvcOCO4P0K85q9VvrAGr1qnmnRq46RlDS70HCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(66946007)(66556008)(8936002)(5660300002)(83380400001)(66476007)(26005)(2616005)(186003)(1076003)(44832011)(4326008)(316002)(86362001)(38100700002)(52116002)(6512007)(508600001)(2906002)(107886003)(38350700002)(6506007)(6666004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Si6gObqtNonU7ACON+yjL/pCBsEC2/HCDNMyNtevVHrhcxdx1q97yVb/Sqxz?=
 =?us-ascii?Q?6kAs+ysCuxI6DRsp9w12SbL3N7Rpk5O+VW0Of9Zja088Uw+L7OqWkJ2bw+hw?=
 =?us-ascii?Q?Qq53BgKlceK83SEron6c+dPSh74djAJ4i/8WkJNRqaKRCXSdZtVJpLN8mDrG?=
 =?us-ascii?Q?KLFT/+fNPN1WBgNYzvxSt6Ow6C6VPVrW8AfTFHUrdyS20QhKmoeRK3kULrtC?=
 =?us-ascii?Q?65TSKeeFKN4VZRgWQ/o/Umq6XB3wkcenXl9YhyT8Vo2Ahr25M0GNaJOoC/sM?=
 =?us-ascii?Q?9DfNAnQ1vkZgFs2DGuUZXUWnJVWafzjgpiZINz5A5eiwgjTaIo+YFId1/CXf?=
 =?us-ascii?Q?bP8AitwUu/5itzkBPR6dntqwEiE0mHU6H4Zu5cuOLVfLCPjJiwBRuk/jJe57?=
 =?us-ascii?Q?kMQNTGPLm73ghUEMe4rDNRbaDJ7Y0a2Jw7qC5Txjtv53kxMnTXPehjrxVlHh?=
 =?us-ascii?Q?qmv1hPymGRdwU9FG5GSornDMAXmk5yfGjCBkprsAVmmatbh2P40JXMzheZ4E?=
 =?us-ascii?Q?efzYtJGEKxPa/xLDycp8PXS82lp6KyMI5o1geVtOwlh4bQbkBJCv3GAwtHRs?=
 =?us-ascii?Q?Wab8S9tcQtvJfwXgckrKi+fwWMAkEfaQ/9/Hhmh2ApEXy+irkcixLWV14uiM?=
 =?us-ascii?Q?EOfaTWK7KbzNMKobgFHuVEhHvi+uk9WTglyQBoqCGUKrBw89mo7U4WGdt8S/?=
 =?us-ascii?Q?9tu2AXqIPHxROHYs/n4onL7llBQh18dpuT5AahrVmI+XtrWEO5HMMOryK/nA?=
 =?us-ascii?Q?gm8qW4TDtlVacLt47d0F2EYQN67F4Apua/V8xh/lokTe1rT82EFAJ9U/HBtp?=
 =?us-ascii?Q?zAlTQs0oxh8ru2Zz3VoXP+ko3bs+CbD7ZtPzzdRM/rY0mnhgEroQkbAenzy+?=
 =?us-ascii?Q?funuRGsk21hqmD05kcj6YY09YRXXV5yn2CGfUq5T4iF5bMWRHyfNO5dOCTnv?=
 =?us-ascii?Q?BbTiAGPLcj0c7mly4uEiicvQFGLmoW41T55/QmoZQoqNB+b7WVpWa50wnd4H?=
 =?us-ascii?Q?5uey9xyuubszVWDlcaWZ1uXPZ7ecI/WDa/1Rht7qalb/3ePnOljcRXg6FzPl?=
 =?us-ascii?Q?llycedek9NzyNnqTyNRvu4+v73QBBe8LMA2OxQky2HBdwOoGgAz8BZwDmgOd?=
 =?us-ascii?Q?dKlgkSrkkt2ZKvSLUu1Jkf9OnmK+CsJFJcGg9X4S9yYJOcaSrhHasqb4pwQx?=
 =?us-ascii?Q?wQAZ39zz2/988Oyy15GN+/vTB6meQ7JKduFTvoLY6rjPlDnVqT2M38WUwagj?=
 =?us-ascii?Q?qRqb4kEEpHRYoGLDUdipX0xgQsv2GyxlaEkEPYXO2JzsKtP5mqYP5OX9GZW7?=
 =?us-ascii?Q?yMFehmPWkA7xcQmAPioLRDO+3TuJrXbOYmyR+rKNzR8CDC+SB4QI64MP1X6K?=
 =?us-ascii?Q?SAOkGgaP81SERt/NX2bSMRVeQOzGr1eB/M4Lk7zvJbEs/E0j2orUFNl0fDjO?=
 =?us-ascii?Q?erkDC0bKKCzXF5zrq08wYPY/6RUUeuMhRc8XfOkSgSyxXVbig/TW6zweMGFg?=
 =?us-ascii?Q?ikio8hwgPAKUtjGVfAsTCfRCNvmZ4xes0JJk6No/rD95h39Z/K8Fv1CXean/?=
 =?us-ascii?Q?LGnj2L8k7AXt1Sv/P4mqRG6vl3WmL/FFy/3HcaCgnwHhnhMoRpZr6dG9dvvh?=
 =?us-ascii?Q?rAjg17aZJ1pVmog7Et0CI94=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7db0c5-11d5-4f1c-59cf-08d9ef729557
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:26.1882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: no0YkPLy9xgj1UxG9QutErgp8Ta5T0vlX4k2Cuygp4f7+DYGWUK+yyE6J33Rm2tuBmRCv6l1cGuek2/D26ipig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB5916
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

Separate gpio-leds by each io expander chip.
To avoid entire gpio-leds bind failed due to single chip not available

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 77 +++++++++++++------
 1 file changed, 52 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index e77736ed5c4c..ebd2430a3bdd 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -5,6 +5,7 @@
 #include "aspeed-g6.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/leds/leds-pca955x.h>
 
 / {
 	model = "Facebook Bletchley BMC";
@@ -53,112 +54,138 @@
 		// Fixed link
 	};
 
-	leds {
+	front_gpio_leds {
 		compatible = "gpio-leds";
-
 		sys_log_id {
-			retain-state-shutdown;
-			default-state = "keep";
+			default-state = "off";
 			gpios = <&front_leds 0 GPIO_ACTIVE_HIGH>;
 		};
+	};
+
+	fan_gpio_leds {
+		compatible = "gpio-leds";
 		fan0_blue {
 			retain-state-shutdown;
 			default-state = "on";
-			gpios = <&fan_ioexp 8 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 8 GPIO_ACTIVE_HIGH>;
 		};
 		fan1_blue {
 			retain-state-shutdown;
 			default-state = "on";
-			gpios = <&fan_ioexp 9 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 9 GPIO_ACTIVE_HIGH>;
 		};
 		fan2_blue {
 			retain-state-shutdown;
 			default-state = "on";
-			gpios = <&fan_ioexp 10 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 10 GPIO_ACTIVE_HIGH>;
 		};
 		fan3_blue {
 			retain-state-shutdown;
 			default-state = "on";
-			gpios = <&fan_ioexp 11 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 11 GPIO_ACTIVE_HIGH>;
 		};
 		fan0_amber {
 			retain-state-shutdown;
 			default-state = "off";
-			gpios = <&fan_ioexp 12 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 12 GPIO_ACTIVE_HIGH>;
 		};
 		fan1_amber {
 			retain-state-shutdown;
 			default-state = "off";
-			gpios = <&fan_ioexp 13 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 13 GPIO_ACTIVE_HIGH>;
 		};
 		fan2_amber {
 			retain-state-shutdown;
 			default-state = "off";
-			gpios = <&fan_ioexp 14 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 14 GPIO_ACTIVE_HIGH>;
 		};
 		fan3_amber {
 			retain-state-shutdown;
 			default-state = "off";
-			gpios = <&fan_ioexp 15 GPIO_ACTIVE_HIGH>;
+			gpios = <&fan_leds 15 GPIO_ACTIVE_HIGH>;
 		};
+	};
+
+	sled1_gpio_leds {
+		compatible = "gpio-leds";
 		sled1_amber {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled1_leds 0 GPIO_ACTIVE_LOW>;
 		};
 		sled1_blue {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled1_leds 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled2_gpio_leds {
+		compatible = "gpio-leds";
 		sled2_amber {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled2_leds 0 GPIO_ACTIVE_LOW>;
 		};
 		sled2_blue {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled2_leds 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled3_gpio_leds {
+		compatible = "gpio-leds";
 		sled3_amber {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled3_leds 0 GPIO_ACTIVE_LOW>;
 		};
 		sled3_blue {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled3_leds 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled4_gpio_leds {
+		compatible = "gpio-leds";
 		sled4_amber {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled4_leds 0 GPIO_ACTIVE_LOW>;
 		};
 		sled4_blue {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled4_leds 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled5_gpio_leds {
+		compatible = "gpio-leds";
 		sled5_amber {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled5_leds 0 GPIO_ACTIVE_LOW>;
 		};
 		sled5_blue {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	sled6_gpio_leds {
+		compatible = "gpio-leds";
 		sled6_amber {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled6_leds 0 GPIO_ACTIVE_LOW>;
 		};
 		sled6_blue {
 			retain-state-shutdown;
-			default-state = "off";
+			default-state = "keep";
 			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
 		};
 	};
@@ -667,7 +694,7 @@
 		reg = <0x4d>;
 	};
 
-	fan_ioexp: pca9552@67 {
+	fan_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
-- 
2.17.1

