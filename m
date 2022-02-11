Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8B4B1BBD
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 02:59:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxcP0KJfz3bdG
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 12:59:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=mYmDcVkt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=mYmDcVkt; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxbw74Jlz30K4
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDH9yaTz0YjHEl+n8ps0bxxcMRiItWGe/DQTXlHXja4rmywP0UmrgimQiDukfq5JeU+j7QUmE+xUs4OSlAwa0eob+Ng0NnT0Y+yulh0bbrm9aRUPfqEb/NUKqA9ktitZQdv6P8ncclRNPtOg32JZQFJyjvlSse5+18FATK4WbCxS1jHsiHtHKXs9Go8ybx2Q2FPA3zDQs9T++w+sjLwODAAcGCwQoYjYd8UXC/ShPDJm3gdi5b/SNUC8xwnrCfycra0h68tNJiUOxMHWbWHwf0j+/zO7QipaFQ1DmmoLwHPqb7zuhxuX3W/kneN0505ck6B0mimLUblMzMpf9BJJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym26i91zXYG3NZ5T+ENx691CMP+Yj4da2kmQwEnVa7c=;
 b=I9H0+O/zcizBO+wHn0Z0fOBk5UapT+/Mxw9Y7aFLKLu3HvTqKHHVkIFiTbii5nBh2FY4ITvj7+zFUZz7xrJ8J4GiPQxYUCjQHXg23wJO/osssVG3+sUx/R7Rv1h3y9SPtuvb0eQ7u0FeC9RdFMfPZeBNYqXeO5ONcGvGCmyXf4yvzHYYlm0Ccd2/McfucHG2ArSH8aspGiY0GHJuIjM6l1LzyhDflOWAak4+ojpQ2MOz8Ouf5noG18t4ZSQgMGwrB6qMJoaa5TzryXzX/zbq7z5ET5+LENSUxdyCjMDZFAJqHn0wPPD6md6uARBvNI729hyjHL0TTWi3TBVyy2rZuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym26i91zXYG3NZ5T+ENx691CMP+Yj4da2kmQwEnVa7c=;
 b=mYmDcVktvy/ZoM+4+rjVtZKDg31HWc0LsRHryCcFTGLAmVu0gUYEV2xq+ckuD0vnp45Rx8cnDB/XU2AxQUvUqDEAthSFt+qV2IyaSc5TA/zcd9JwQllq4rti7q1HRtIwhmgABlZgmqkwKwZij9ShkgTJaklCjoO0Dr3JwGtFnzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:13 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:13 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 02/10] arch: arm: dts: bletchley: separate leds
 into multiple groups
Date: Fri, 11 Feb 2022 09:57:47 +0800
Message-Id: <20220211015755.27644-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d738fb8-6cd5-408c-e87d-08d9ed01f5e6
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB401547E0D4A630613C76CE318E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6sGYhrUB2Y/iNaYi0mkuWHCmFXPi/Q0HQTh1okF+vYQ6ryEf4JjrpQl3LZKaNnkibR0WgXQGfklVGFjCkaEEVpPT8Me/UjMwafEJPLclsaSCERthtV1JEnYeuoxH5x+54u6nCFJMIIzG4i0ZGWnFj/tkOdNbEbN9aCCOCB6BpJFKFVNrb8sn0RC078atDzBciSh4ZRSk4MpLJdmNaK4rQXu63SnTsU8egmOP3nzpW8c6skMNraQvWTCWGaNkWMj7jHySyDCJDaMV5tOcNho/SbnBkvxbcnopMpCupYKvBQYKPUcZXjWUYt5MmP4aRukBDKbLonQmCVGxa8ZK8iOSSnogRxIfs/dJr1ak8S3rOIHQoK15lxfUox8jGTBPeNGitQ+dGW69nkLLweS8ArQ3kT6iTZ5PFX40lC21iK+hAZD5I28nN7BhOQArjklWDfTEk3lk9p+ZcZ9xtvVboNbEGHoINXwrF5skKrXCbRuM8sI03fec3iCwIPAno1iwWfzuyK6YOl6/lOG3F3bzhVjVTrg4yAWW2WvcQiO9qWwa2dHslS13IgNienUjSXzkVn2bv+MwwrUQenMXaPrk07o/SR4grEmVxZK1HRfSlDw3J6S6qEQ9uK0Kzls/h+S6V4tWeKsJgqldyLLjCv1xkROzNV32ai11nkbkeWZZ8L+jtFznw0S4hU3s8KGjjE6yOMrOy92EiKmtQHBcHhM7xFOUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GbEcQUwsr00HIkXhiMYLAh8wnHBRktmr+ffi7Xb+sFhBSR/RLGstrEm0/JCV?=
 =?us-ascii?Q?ozyTPHjgYfIbVcedsmkUel7BYwn68KyffWZooWgzPcEcN5ys+TCWPUOcsAjt?=
 =?us-ascii?Q?6e5vwNAy26EGD2lWrD4+eQwalO4f96rtvvxRSEfZtwINd19gZFhZwUTjMWbk?=
 =?us-ascii?Q?YhGhagCxp44+OTXiUAVpxS/zEy2wG4Dl06/kEDDGKOZhfsrzxF4Wf4j6eRSf?=
 =?us-ascii?Q?sPsRKwTbHZZmVcQr+Rf3AMMHJP1Oy/e5QSZHpXTEMP8DEcCjpgTPqlZ9awDD?=
 =?us-ascii?Q?lWKNr4HXiNSFmRx2VLdmVeP4bJuzAzyUECvNwaBGNT4TXe8M+O5XvQBY7VT0?=
 =?us-ascii?Q?m+2+tKCDLnTET763dhghUK3aHK/JfWTlzkZ5eVKfTJadtGj9GvqBZzPYvjeh?=
 =?us-ascii?Q?8Zks50MB451VJQUjbSDOvRTrO+Islsbou6t1q7OtwEZYF5hWl6UEtOniYbXx?=
 =?us-ascii?Q?IIyHZ1V/CeWa+01t8AJ9taw0DgUheLxoGvpds8Kc7RU9WK/nBQFKF4zMg+tp?=
 =?us-ascii?Q?N4BtZX+mLmU5/SR64wrDJ38kwbePxE5XY80xFiUDTWeOB6te4IXlY67ZyVc9?=
 =?us-ascii?Q?EfVVMe0kR28K6iZ4jf2oYOamS05p2Y1ZfVXojlH80gJSQgzn8WI7E8CYnr6c?=
 =?us-ascii?Q?okvu4QBrvLHjoQl6CUh225LTA8ZbwISjrTThxFpTXrvOEb0tEiveunbL4vZl?=
 =?us-ascii?Q?YkUEYB4li4CJHSQkcWEraDNm4PJrfWzhZ/q3h00WeVvjobYA2nltrwrIQOpa?=
 =?us-ascii?Q?rH0hMaB77j3fAoy6KtbY09cEFFWxtFTfU7rNxMXbqH7q7qsx8SWy/FeFGp3H?=
 =?us-ascii?Q?5gVMTyCtnT32/mng29joEHzaDzb9ura87zLyDsky6PImyL/BMVhEy/ppHGbq?=
 =?us-ascii?Q?jpLkINiouuE1sbt+oCzco1IJexKyrrb4/PWIOfM5FwBZnQTHbMfz48qJirMk?=
 =?us-ascii?Q?h3Lc+foMSSQi9hnknqR8bTFxjOoMD2zp/rMoycGKv/es76nptn4bMq9Z041G?=
 =?us-ascii?Q?aXa9Cn/tewn3zTdgljgMyfnLxXEf5Cvo42IY9FI2cl9GXY4EEnuHfaLU/6DK?=
 =?us-ascii?Q?RRVFy6Ai0PBVke12uUrf2x5yT8nnEQxUKoXmHPqFYxVOI1VDZJtohvKmN+q9?=
 =?us-ascii?Q?k6CO/Ix1pKchSzX+YEfsUOAdTu0zpfyXjGIIcVFTTRK1fUWj/J0mfdv72UQ4?=
 =?us-ascii?Q?IVAOLDcsfURMrelWL4gyX+pxStmqXiSO+Cde6AbacYAUKWr/t1fnkldQXM/J?=
 =?us-ascii?Q?enT81eSCsWanPAkcEIj8cENoEaJojKLdh1pV4Y8KdSma9UtPXKW/YnD2Q+0W?=
 =?us-ascii?Q?U9ZICPHLxzCFME6lqNPwgJwawx7mHT2KAo9IWL1/seDv83ZEqouGkKNRPzJ0?=
 =?us-ascii?Q?657z6LLb7F47o+s/LmoBQQ0Nf/ZPWdjfylS/YNt/0ZtpjwoxsX9xfuHYNXj+?=
 =?us-ascii?Q?yYGnP1q0cxQGn/Sg8aEio9bD2EHQg2wd2BDph3810+0TPawxYguwgyIttdgn?=
 =?us-ascii?Q?87qhAaEDkFH+sgMKFp16WoSJ3eLQAmc8moXTxQS4JyrhfwxpK61P+4dAHelm?=
 =?us-ascii?Q?lcROPcvrslmblaPteXlnWEMyHS7GakuaCotKIHqbO9kiFk+AnHl8h5jrM+xI?=
 =?us-ascii?Q?PMbjsX9Bm02EaE8t4ZSqBTI=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d738fb8-6cd5-408c-e87d-08d9ed01f5e6
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:12.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4nixilqvEGHIJtneA0P6fFntJtT4zx+bDh5eKd9WCsi6jSke1zhYStwxGmxi3LVTp+WDKAQ4nEgMp9D0JZkvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4015
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

