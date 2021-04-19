Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF481364A0A
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 20:46:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPG426NXdz2y88
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 04:46:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=FIIcorp.onmicrosoft.com header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-FIIcorp-onmicrosoft-com header.b=LIbFvD09;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-na.com (client-ip=40.107.220.57;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=mohaimen.alsamarai@fii-na.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=LIbFvD09; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPG3k2HJtz2xb8
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 04:45:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRVDo9w1YWjGSa9Lx0OXlVtgo704lSJC2o0F1MS0CLWHROU+9VOi5z9HNstvcMp+CSCq6kYfStTq2i6dfryaWB2hRVz5GPWFp9DMYFC49a3YUn7fjE1sZetfqcMpyh00hQaFgbEpNXAfS/JPCu2Ax5DxKJpX7yPVCI9eoR6nx2KaFLVQr0Cr2caNTUgF0Lg0pNDs25FMlNnqOiOLZPb6BHkPOXPCwiEYHJ90gMM+ysmqVu9y8dyK5GhBuPE9wypNEYKqokNsEe+2TMvPJTi/Ltxd+DRgPxkWkaB2jGjxB5FurxkeH1aKJhVX1tmwkckg3SAsrOhU8cpo0m/oci/dsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drN3PEfqHbBlaBu8IzXbaMGC9Pnvockqyv8dZTs/zj4=;
 b=Y6hrDGNy83Yzrw63Kc9Mlf5RriXfZdmxPApcSiSRQXBoehD3CZQMqZ8q2wNFG2QmCC/SrFjklaUBgxMYpy8W2KPcmu2x4ZGlRXvVjwodszRnHWbLpvWMRKt6euCGwjf2s6BzNlXEDMFUS2oMlPkoUp3qRNKwmcgUMTbAixBuW8f07A+Da5CcAZoxd1EanqnRy7FmPLxfOWGcZavjzHDPXIGf/tVeANWH787dbeuOqrmW0SOqb+K06ERAhbXgBBsH2nIv/3oYfEGuUMaqMu985jG6jol02kv3my0BCmLhtMOJXrVQ3mnZDnYTnWYzBEc7fEFfAP9htr8unE1GmuYuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drN3PEfqHbBlaBu8IzXbaMGC9Pnvockqyv8dZTs/zj4=;
 b=LIbFvD09Gfa2z5agAVuaNKUI7HUE708ovgbqfQrYYS8jmao70Isu3qIKicMmeukEKFPuN2JnKfu7pKnvu7/WZqHVxigKZRVnlhJrk3fipNxP1YZqC+FS0VzJMPUGdo+x93VIPWNCikODT5EmOzdmTbcYClK3y9f4hYSleaJ3qBUtXQk7qzQbj8mGDLMcPW1t+l7Gs2sn6FsH5Bxd9tYY4pQTmYZQSRviIu37ok1xEEjyFicyTOAtu845bHiI1NWUY7davvqH3Mg5dFuuW65DZWKhiyVhIPJjSClZeMNnAa/KHVPgR9G8sU5zMN1TUSV/iMiAyImz71Y2WgZsJN62Dg==
Authentication-Results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fii-na.com;
Received: from DM6PR08MB5883.namprd08.prod.outlook.com (2603:10b6:5:152::18)
 by DM6PR08MB6252.namprd08.prod.outlook.com (2603:10b6:5:1ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 19 Apr
 2021 18:45:44 +0000
Received: from DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::f427:75bb:e9b3:7919]) by DM6PR08MB5883.namprd08.prod.outlook.com
 ([fe80::f427:75bb:e9b3:7919%6]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 18:45:43 +0000
From: "mohaimen.alsamarai@fii-na.com" <mohaimen.alsamarai@fii-na.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Benjamin Fair <benjaminfair@google.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Mustafa Shehabi <Mustafa.shehabi@fii-na.com>
Subject: [PATCH linux dev-5.8] Add device tree for the Kudo BMC. Kudo is an
 Ampere (Altra) server platform manufactured by Fii and is based on a Nuvoton
 NPCM730 SoC.
Date: Mon, 19 Apr 2021 13:45:33 -0500
Message-Id: <20210419184533.4058-1-mohaimen.alsamarai@fii-na.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [216.63.87.86]
X-ClientProxiedBy: SA9PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:806:a7::35) To DM6PR08MB5883.namprd08.prod.outlook.com
 (2603:10b6:5:152::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from OpenSystem.houston.foxconn.com (216.63.87.86) by
 SA9PR10CA0030.namprd10.prod.outlook.com (2603:10b6:806:a7::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 18:45:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c75598-c606-47cc-2612-08d903635604
X-MS-TrafficTypeDiagnostic: DM6PR08MB6252:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR08MB6252189DB2E8945AF9F8D335B2499@DM6PR08MB6252.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5HLa4oU2Z7OGHV4abagPY1gI9HHaoA9xd//4X5EfPQGGbIOaIQCo1R5lSREnFsfAWQ08mUxgJIaewC4izvWN1d7vFCMyGndA69tuadQDm5OTWFignVyMcNU5daviqkZCHjW+zL8/h7oyCwdmo6LdP6HUfhokowSNhQrkxa8XP50Up6ppk2JNovW6v+Q18vn7WlbTZmC7FyqTPRUCEOTXSaaSuDQWNDo2KEDQ6xEhaogB5X43lt2SCl9dZZ/TnZqK+Pr14AWAMF0y6tZ8VmNV8CFapBVwbPHg3Vnb8XzUUL1fo1ZUykROXEZbo5GrrTSgaB6d+0PdNlfPRqT0AP09FSo0fyO8nNYwsYBvNcTaUVgTX3Ojq0ZOaunsYBICKTZ3cThui2BzZVwGAqB4n/E9GVCV3QfNf4t5BeiccRGGIBx4Mb5xrWVjezD1FL/OUXNeNzvY7LCcS0Csl7ecUR7s8sgjjoAYWO2J6X5BQR1g5HvvBFzbfK8MEHGpYe/rmSiQLGcDpZuIpDpjoE+Wztr1YhwfG/ZF36JM0GhluiHPPr/YEyZxdFr11m40ONLy24dQRKi+1GDu20TXACFcdbY/fPrVdkziYJehvjf35qVKYOoQFPvr7jq7GCUfBa5XohNeiLgyxL+K042V9lrXrpt/cg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB5883.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39850400004)(366004)(346002)(376002)(396003)(30864003)(6666004)(1076003)(107886003)(83380400001)(38350700002)(54906003)(5660300002)(66946007)(2906002)(66556008)(66476007)(6486002)(6512007)(316002)(956004)(2616005)(52116002)(38100700002)(8676002)(26005)(86362001)(36756003)(110136005)(478600001)(6506007)(8936002)(4326008)(6636002)(186003)(16526019)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6WkWjQMxHWgRmS/GE9uDpb4GFyicvxSlRqOCcrNN6Hnzc6qOl30cLZds0IqA?=
 =?us-ascii?Q?AOUaSp7y2oLuxuPjoCbuLu/T5eWviE+D1Nj6urXAbMSxzJkjawoppFM5XuRQ?=
 =?us-ascii?Q?S/yPEtSM1I3+iUVWrTPQKY+3HzK+KGaQkoOf2ZIrCg1arupQOouS1eUO06aH?=
 =?us-ascii?Q?qHGs6lHuIAn1rsWnol3Mf29mRQppLT7RssgAjLWsoNBSguJT3Vk58SJDVpZ6?=
 =?us-ascii?Q?uaESGnp+JCpqfJLsB2cvUADCvZklsxd127sYbIRekcBJZbqtILOCZnm3NM69?=
 =?us-ascii?Q?a+CH9PCot40mhjZ9OM4m36ttIVLSvL4UJu38JAjbNy8fgK7Byhh5jqNah54G?=
 =?us-ascii?Q?vFHh5H59NygLi/lkpetSV0tFfLw2FsTZK78ok+wFgqqWRVTmtong4TORrW/a?=
 =?us-ascii?Q?uql1P8qPS4cPMfiphIxdcQfq1SN7HXbHiaANLjibcFznacFpBNPaIb0Wey/L?=
 =?us-ascii?Q?kcGofhRcVOATPNuhkd3IqUg/SLalQc/n/NsyBVys++1pgb+sBxtndXtWm5yG?=
 =?us-ascii?Q?VFRUoCn0pNx9vhNotzPmaJvPikCtKeIZpTcujEfr6ilw+cJtYkrE8F2WIecU?=
 =?us-ascii?Q?nOWPI7hXV+PLueofOoyz4n4JIPkEqJ2WVKE8321Z3jmniXQpSOq/CRA5oGkM?=
 =?us-ascii?Q?A046WYWvHe6izBUwReLUtpfeYaMrFs2fJpatnLcp7Rsi2vBmZ8X88lftzEFj?=
 =?us-ascii?Q?0jmHfBpLPlFAMfbgwp7JGUAHSsIIGQYjvofRdZ9kpFwTBe+kjphbUa3kqXYs?=
 =?us-ascii?Q?Hn7mgp3FoAaCbOfJGCOTXSgn4+Tfuj+flGYtyCBqP21kuvjS5lU17hxLCaGq?=
 =?us-ascii?Q?uVIn7NH9ju1nX3AYy2T2LURkOOBEejtZThj8ROaK6LmPWaY5Urm8rtjSXFAQ?=
 =?us-ascii?Q?NZsSnjMaSYXhpYK15PUv8zM0JD6SZoQ9oIAW5ASz72WgSUnUSg5qVztZnzVz?=
 =?us-ascii?Q?Pd63NI8i/DgAG1+BuFMwah2dLl3ViUWA2Dvr7PxLcpQioAreZkAlXHQ+p/RD?=
 =?us-ascii?Q?h0OBVfLPOoJ8czs/yrflH7Dboc9RlCkeVU/c9OYciR4LDvYeP1TvJ4O/loWR?=
 =?us-ascii?Q?pYZY9XRLhhW4wpJBXlIhyPicEiIIqvwVpk7Tqckiz2AHfR4/K3yVbEr8GH+5?=
 =?us-ascii?Q?8vXfEWHUWq3qKXeiZQEwwIKme+cnmIGQIRcUMpKLX8pmAeUceVAfx09rAAWg?=
 =?us-ascii?Q?ycvZ5/7VbQ1IoqWp/UNKXfiENh2lCQM82k5tlFezkbMed1/CH5qPLRRMlsXb?=
 =?us-ascii?Q?dRCZMvFAv15BLUJwWh25pMwhZ5HIStOvJjGiq1jksirv5BXd4v4JR3XG6nuR?=
 =?us-ascii?Q?S4HePuoDbkW6dk6oHgZJfh7t?=
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c75598-c606-47cc-2612-08d903635604
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5883.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 18:45:43.6439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3BHku0g+/P9o0hvIIdfaxxCw2lxctnMXn+TUL6+Hq/G2UDWWBFz03QEeLP8iCkGdDEYmyNwZ/GymXe3QZaitWEAfWBK+D2za9dxiFpl4JU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6252
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
Cc: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>,
 "mohaimen.alsamarai@fii-na.com" <mohaimen.alsamarai@fii-na.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: mohaimen.alsamarai@fii-na.com <mohaimen.alsamarai@fii-na.com>
Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts | 1720 ++++++++++++++------
 1 file changed, 1257 insertions(+), 463 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
index 82a104b2a65f..9e133989bdcd 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
@@ -4,18 +4,23 @@
 /dts-v1/;
 #include "nuvoton-npcm730.dtsi"
 
-#include <dt-bindings/gpio/gpio.h>
-
 / {
 	model = "Fii Kudo Board";
 	compatible = "fii,kudo", "nuvoton,npcm730";
 
 	aliases {
+		ethernet0 = &emc0;
 		ethernet1 = &gmac0;
 		serial0 = &serial0;
 		serial1 = &serial1;
 		serial2 = &serial2;
 		serial3 = &serial3;
+		emmc0 = &sdhci0;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		vdma = &vdma;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
@@ -31,14 +36,50 @@
 		i2c13 = &i2c13;
 		i2c14 = &i2c14;
 		i2c15 = &i2c15;
-		spi0 = &spi0;
+//		spi0 = &spi0;
 		spi1 = &spi1;
 		fiu0 = &fiu0;
 		fiu1 = &fiu3;
+                i2c16 = &i2c16;
+                i2c17 = &i2c17;
+                i2c18 = &i2c18;
+                i2c19 = &i2c19;
+                i2c20 = &i2c20;
+                i2c21 = &i2c21;
+                i2c22 = &i2c22;
+                i2c23 = &i2c23;
+                i2c24 = &i2c24;
+                i2c25 = &i2c25;
+                i2c26 = &i2c26;
+                i2c27 = &i2c27;
+                i2c28 = &i2c28;
+                i2c29 = &i2c29;
+                i2c30 = &i2c30;
+                i2c31 = &i2c31;
+                i2c32 = &i2c32;
+                i2c33 = &i2c33;
+                i2c34 = &i2c34;
+                i2c35 = &i2c35;
+                i2c36 = &i2c36;
+                i2c37 = &i2c37;
+                i2c38 = &i2c38;
+                i2c39 = &i2c39;
+                i2c40 = &i2c40;
+                i2c41 = &i2c41;
+                i2c42 = &i2c42;
+                i2c43 = &i2c43;
+                i2c44 = &i2c44;
+                i2c45 = &i2c45;
+                i2c46 = &i2c46;
+                i2c47 = &i2c47;
+                i2c48 = &i2c48;
+                i2c49 = &i2c49;
+                i2c50 = &i2c50;
+                i2c51 = &i2c51;
 	};
 
 	chosen {
-		stdout-path = &serial3;
+		stdout-path = &serial0;
 	};
 
 	memory {
@@ -48,334 +89,754 @@
 	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
-			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
-	};
-
-	jtag_master {
-		compatible = "nuvoton,npcm750-jtag-master";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		// dev/jtag0
-		dev-num = <0>;
-		// pspi or gpio
-		mode = "pspi";
-
-		// pspi2
-		pspi-controller = <2>;
-		reg = <0xf0201000 0x1000>;
-		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&clk NPCM7XX_CLK_APB5>;
-
-		// TCK, TDI, TDO, TMS
-		jtag-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>,
-				<&gpio0 18 GPIO_ACTIVE_HIGH>,
-				<&gpio0 17 GPIO_ACTIVE_HIGH>,
-				<&gpio0 16 GPIO_ACTIVE_HIGH>;
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>, <&tla2024 0>, <&tla2024 1>;
 	};
 
 	leds {
 		compatible = "gpio-leds";
 		heartbeat {
 			label = "heartbeat";
-			gpios = <&gpio0 14 1>;
+			gpios = <&gpio0 7 1>;
 		};
 	};
 
 	pinctrl: pinctrl@f0800000 {
-		gpio61oh_pins: gpio61oh-pins {
-			pins = "GPO61/nDTR1_BOUT1/STRAP6";
-			bias-disable;
-			output-high;
-		};
-		gpio62oh_pins: gpio62oh-pins {
-			pins = "GPO62/nRTST1/STRAP5";
-			bias-disable;
-			output-high;
-		};
-		gpio161ol_pins: gpio161ol-pins {
-			pins = "GPIO161/nLFRAME/nESPICS";
-			bias-disable;
-			output-low;
-		};
-		gpio163i_pins: gpio163i-pins {
-			pins = "GPIO163/LCLK/ESPICLK";
-			bias-disable;
-			input-enable;
-		};
-		gpio167ol_pins: gpio167ol-pins {
-			pins = "GPIO167/LAD3/ESPI_IO3";
-			bias-disable;
-			output-low;
-		};
-		gpio95i_pins: gpio95i-pins {
-			pins = "GPIO95/nLRESET/nESPIRST";
-			bias-disable;
-			input-enable;
-		};
-		gpio65ol_pins: gpio65ol-pins {
-			pins = "GPIO65/FANIN1";
-			bias-disable;
-			output-low;
-		};
-		gpio66oh_pins: gpio66oh-pins {
-			pins = "GPIO66/FANIN2";
-			bias-disable;
-			output-high;
-		};
-		gpio67oh_pins: gpio67oh-pins {
-			pins = "GPIO67/FANIN3";
-			bias-disable;
-			output-high;
-		};
-		gpio68ol_pins: gpio68ol-pins {
-			pins = "GPIO68/FANIN4";
-			bias-disable;
-			output-low;
-		};
-		gpio69i_pins: gpio69i-pins {
-			pins = "GPIO69/FANIN5";
-			bias-disable;
-			input-enable;
-		};
-		gpio70ol_pins: gpio70ol-pins {
-			pins = "GPIO70/FANIN6";
-			bias-disable;
-			output-low;
-		};
-		gpio71i_pins: gpio71i-pins {
-			pins = "GPIO71/FANIN7";
-			bias-disable;
-			input-enable;
-		};
-		gpio72i_pins: gpio72i-pins {
-			pins = "GPIO72/FANIN8";
-			bias-disable;
-			input-enable;
-		};
-		gpio73i_pins: gpio73i-pins {
-			pins = "GPIO73/FANIN9";
-			bias-disable;
-			input-enable;
-		};
-		gpio74i_pins: gpio74i-pins {
-			pins = "GPIO74/FANIN10";
-			bias-disable;
-			input-enable;
-		};
-		gpio75i_pins: gpio75i-pins {
-			pins = "GPIO75/FANIN11";
-			bias-disable;
-			input-enable;
-		};
-		gpio76i_pins: gpio76i-pins {
-			pins = "GPIO76/FANIN12";
-			bias-disable;
-			input-enable;
-		};
-		gpio77i_pins: gpio77i-pins {
-			pins = "GPIO77/FANIN13";
-			bias-disable;
-			input-enable;
-		};
-		gpio78i_pins: gpio78i-pins {
-			pins = "GPIO78/FANIN14";
-			bias-disable;
-			input-enable;
-		};
-		gpio79ol_pins: gpio79ol-pins {
-			pins = "GPIO79/FANIN15";
-			bias-disable;
-			output-low;
-		};
-		gpio80oh_pins: gpio80oh-pins {
-			pins = "GPIO80/PWM0";
-			bias-disable;
-			output-high;
-		};
-		gpio81i_pins: gpio81i-pins {
-			pins = "GPIO81/PWM1";
-			bias-disable;
-			input-enable;
-		};
-		gpio82i_pins: gpio82i-pins {
-			pins = "GPIO82/PWM2";
-			bias-disable;
-			input-enable;
-		};
-		gpio83i_pins: gpio83i-pins {
-			pins = "GPIO83/PWM3";
-			bias-disable;
-			input-enable;
-		};
-		gpio144i_pins: gpio144i-pins {
-			pins = "GPIO144/PWM4";
-			bias-disable;
-			input-enable;
-		};
-		gpio145i_pins: gpio145i-pins {
-			pins = "GPIO145/PWM5";
-			bias-disable;
-			input-enable;
-		};
-		gpio146i_pins: gpio146i-pins {
-			pins = "GPIO146/PWM6";
-			bias-disable;
-			input-enable;
-		};
-		gpio147oh_pins: gpio147oh-pins {
-			pins = "GPIO147/PWM7";
-			bias-disable;
-			output-high;
-		};
-		gpio168ol_pins: gpio168ol-pins {
-			pins = "GPIO168/nCLKRUN/nESPIALERT";
-			bias-disable;
-			output-low;
-		};
-		gpio169oh_pins: gpio169oh-pins {
-			pins = "GPIO169/nSCIPME";
-			bias-disable;
-			output-high;
-		};
-		gpio170ol_pins: gpio170ol-pins {
-			pins = "GPIO170/nSMI";
-			bias-disable;
-			output-low;
-		};
-		gpio218oh_pins: gpio218oh-pins {
-			pins = "GPIO218/nWDO1";
-			bias-disable;
-			output-high;
-		};
-		gpio37i_pins: gpio37i-pins {
-			pins = "GPIO37/SMB3CSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio38i_pins: gpio38i-pins {
-			pins = "GPIO38/SMB3CSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio39i_pins: gpio39i-pins {
-			pins = "GPIO39/SMB3BSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio40i_pins: gpio40i-pins {
-			pins = "GPIO40/SMB3BSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio121i_pins: gpio121i-pins {
-			pins = "GPIO121/SMB2CSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio122i_pins: gpio122i-pins {
-			pins = "GPIO122/SMB2BSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio123i_pins: gpio123i-pins {
-			pins = "GPIO123/SMB2BSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio124i_pins: gpio124i-pins {
-			pins = "GPIO124/SMB1CSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio125i_pins: gpio125i-pins {
-			pins = "GPIO125/SMB1CSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio126i_pins: gpio126i-pins {
-			pins = "GPIO126/SMB1BSDA";
-			bias-disable;
-			input-enable;
-		};
-		gpio127i_pins: gpio127i-pins {
-			pins = "GPIO127/SMB1BSCL";
-			bias-disable;
-			input-enable;
-		};
-		gpio136i_pins: gpio136i-pins {
-			pins = "GPIO136/SD1DT0";
-			bias-disable;
-			input-enable;
-		};
-		gpio137oh_pins: gpio137oh-pins {
-			pins = "GPIO137/SD1DT1";
+                /* LED Pins*/
+		gpio7oh_pins: gpio7oh-pins {
+                        pins = "GPIO7/IOX2D0/SMB2DSCL";
+                        label = "LED_BMC_LIVE";
+                        bias-disable;
+                        output-low;
+                };
+		gpio24ol_pins: gpio24ol-pins {
+                        pins = "GPIO24/IOXHDO";
+                        label = "BMC_FAULT_LED";
+                        bias-disable;
+                        output-low;
+                };   
+                gpio169ol_pins: gpio169ol-pins {
+                        pins = "GPIO169/nSCIPME";
+                        label = "SYS_ERR_LED";
+                        bias-disable;
+                        output-low;
+                };
+
+		// JTAG Pins
+		gpio17_pins: gpio17-pins{
+                        pins = "GPIO17/PSPI2DI/SMB4DEN";
+                        bias-disable;
+                        input-enable;   
+                };
+                gpio18o_pins: gpio18o-pins{
+			pins = "GPIO18/PSPI2D0/SMB4BSDA";
 			bias-disable;
 			output-high;
-		};
-		gpio138i_pins: gpio138i-pins {
-			pins = "GPIO138/SD1DT2";
-			bias-disable;
-			input-enable;
-		};
-		gpio139i_pins: gpio139i-pins {
-			pins = "GPIO139/SD1DT3";
-			bias-disable;
-			input-enable;
-		};
-		gpio140i_pins: gpio140i-pins {
-			pins = "GPIO140/SD1CLK";
-			bias-disable;
-			input-enable;
-		};
-		gpio141i_pins: gpio141i-pins {
-			pins = "GPIO141/SD1WP";
-			bias-disable;
-			input-enable;
-		};
-		gpio190oh_pins: gpio190oh-pins {
-			pins = "GPIO190/nPRD_SMI";
-			bias-disable;
-			output-high;
-		};
-		gpio191oh_pins: gpio191oh-pins {
-			pins = "GPIO191";
-			bias-disable;
-			output-high;
-		};
-		gpio195ol_pins: gpio195ol-pins {
-			pins = "GPIO195/SMB0BSDA";
+                };
+                gpio19ol_pins: gpio19ol-pins{
+			pins = "GPIO19/PSPI2CK/SMB4BSCL";
 			bias-disable;
 			output-low;
+                };
+		
+
+                /* Mux Pins */
+                // UART Mux Pins
+                gpio167oh_pins: gpio167oh-pins {
+                        pins = "GPIO167/LAD3/ESPI_IO3";
+                        label = "S0_UART0_BMC_SEL";
+                        bias-disable;
+                        output-high;
+                };   
+                gpio161oh_pins: gpio161oh-pins {
+                        pins = "GPIO161/nLFRAME/nESPICS";
+                        label = "S0_UART1_BMC_SEL";
+                        bias-disable;
+                        output-high;
+                };   
+		gpio177oh_pins: gpio177oh-pins {
+                        pins = "GPIO177/PSPI1DI/FANIN17";
+                        label = "S1_UART1_BMC_SEL";
+                        bias-disable;
+                        output-high;
+                };
+                gpio198ol_pins: gpio198ol-pins {
+                        pins = "GPIO198/SMB0DSDA";
+                        label = "SX_BMC_UART1_SEL";     
+                        bias-disable;
+                        output-low;
+                };
+
+                // I2C Mux Pins
+                gpio87oh_pins: gpio87oh-pins {
+                        pins = "GPIO87/R2RXD0";
+                        label = "BMC_I2C0_MUX4_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio88oh_pins: gpio88oh-pins {
+                        pins = "GPIO88/R2RXD1";
+                        label = "BMC_I2C1_MUX1_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio89oh_pins: gpio89oh-pins {
+                        pins = "GPIO89/R2CRSDV";
+                        label = "BMC_I2C1_MUX2_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio91oh_pins: gpio91oh-pins {
+                        pins = "GPIO91/R2MDC";
+                        label = "BMC_I2C4_MUX3_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio168oh_pins: gpio168oh-pins {
+                        pins = "GPIO168/nCLKRUN/nESPIALERT";
+                        label = "BMC_I2C_BACKUP_SEL";
+                        bias-disable;
+                        output-high;
+                };
+
+                // I3C Mux Pin
+                gpio12oh_pins: gpio12oh-pins{
+                        pins = "GPIO12/GSPICK/SMB5BSCL";
+                        label = "I3C_MUX_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+
+                // JTAG Mux Pins
+                gpio218oh_pins: gpio218oh-pins {
+                        pins = "GPIO218/nWDO1";
+                        label = "BMC_JTAG_MUX_1";
+                        bias-disable;
+                        output-high;
+                };
+                gpio164ol_pins: gpio164ol-pins {
+                        pins = "GPIO164/LAD0/ESPI_IO0";
+                        label = "BMC_JTAG_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio16oh_pins: gpio16oh-pins {
+                        pins = "GPIO16/LKGPO0";
+                        label = "JTAG_TMS_BMC_MUX";
+                        bias-disable;
+                        output-high;
+                };
+
+                // CPU Mux Pins
+                gpio84ol_pins: gpio84ol-pins {
+                        pins = "GPIO84/R2TXD0";
+                        label = "BMC_CPU_DDR_I2C_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio85ol_pins: gpio85ol-pins {
+                        pins = "GPIO85/R2TXD1";
+                        label = "BMC_CPU_EEPROM_I2C_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio86ol_pins: gpio86ol-pins {
+                        pins = "GPIO86/R2TXEN";
+                        label = "BMC_CPU_PMBUS_SEL";
+                        bias-disable;
+                        output-low;
+                };
+                gpio120ol_pins: gpio120ol-pins {
+                        pins = "GPIO120/SMB2CSDA";
+                        label = "BMC_CPU_RTC_I2C_SEL";
+                        bias-disable;
+                        output-low;
+                };
+
+                /* Control Pins */
+                //gpio10oh_pins: gpio10oh-pins {
+                gpio10ol_pins: gpio10ol-pins {
+                        pins = "GPIO10/IOXHLD";
+                        label = "MON_BMC_ALIVE";
+                        bias-disable;
+                        output-low;
+                };
+		//gpio69oh_pins: gpio69oh-pins {
+		gpio69ol_pins: gpio69ol-pins {
+                        pins = "GPIO69/FANIN5";
+                        label = "S0_BMC_OK";
+                        bias-disable;
+                        //output-high;
+                        output-low;
+                };
+                gpio94ol_pins: gpio94ol-pins {
+                        pins = "GPIO94/nKBRST/SMB5DSDA";
+                        label = "VIRTUAL_RESEAT";
+                        bias-disable;
+                        output-low;
+                };
+		gpio203ol_pins: gpio203ol-pins {        
+                        pins = "GPIO203/FANIN16";
+                        label = "BMC_PWRBTN_OUT";
+                        bias-disable;
+                        output-low;
+		};
+		// graceful shutdown trigger
+                gpio70oh_pins: gpio70oh-pins {
+                        pins = "GPIO70/FANIN6";
+                        label = "S0_SHD_REQ_N";
+                        persist-enable;
+                        output-high;
+                };
+                gpio90oh_pins: gpio90oh-pins {
+                        pins = "GPIO90/R2RXERR";
+                        label = "BMC_I2C4_IO_EXPANDER_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio196ol_pins: gpio196ol-pins {
+                        pins = "GPIO196/SMB0CSCL";
+                        label = "BMC_JTAG_DAISYCHAIN_DIS";
+                        bias-disable;
+                        output-low;
+                };
+                gpio197oh_pins: gpio197oh-pins {
+                        pins = "GPIO197/SMB0DEN";
+                        label = "FULL_SPEED_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio14oh_pins: gpio14oh-pins {
+                        pins = "GPIO14/GSPIDI/SMB5CSCL";
+                        label = "PE_THROTTLE_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio66ol_pins: gpio66ol-pins {
+                        pins = "GPIO66/FANIN2";
+                        label = "S0_PLIMIT";
+                        bias-disable;
+                        output-low;
+                };
+                gpio67ol_pins: gpio67ol-pins {
+                        pins = "GPIO67/FANIN3";
+                        label = "S0_RTC_LOCK";
+                        bias-disable;
+                        output-low;
+                };
+                gpio125ol_pins: gpio125ol-pins {
+                        pins = "GPIO125/SMB1CSCL";
+                        label = "S1_PLIMIT";
+                        bias-disable;
+                        output-low;
+                };
+                gpio4ol_pins: gpio4ol-pins {
+                        pins = "GPIO4/IOX2DI/SMB1DSDA";
+                        label = "RST_POST_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio5ol_pins: gpio5ol-pins {
+                        pins = "GPIO5/IOX2LD/SMB1DSCL";
+                        label = "JTAG_MUX_R_EN_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio46ol_pins: gpio46ol-pins {
+                        pins = "GPIO46/nDSR1/JTCK2";
+                        label = "ROT_CPU_RST_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio187ol_pins: gpio187ol-pins {
+                        pins = "GPIO187/nSPI3CS1";
+                        label = "BMC_FWSPI_HOLD_R_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio165ol_pins: gpio165ol-pins {
+                        pins = "GPIO165/LAD1/ESPI_IO1";
+                        label = "BMC_JTAG_SPARE";
+                        bias-disable;
+                        output-low;
+                };
+                gpio166ol_pins: gpio166ol-pins {
+                        pins = "GPIO166/LAD2/ESPI_IO2";
+                        label = "BMC_JTAG_SRST_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio77oh_pins: gpio77oh-pins {
+                        pins = "GPIO77/FANIN13";
+                        label = "S0_DDR_SAVE";
+                        bias-disable;
+                        output-high;
+                };
+                gpio170ol_pins: gpio170ol-pins {
+                        pins = "GPIO170/nSMI";
+                        label = "BMC_I2C6_RESET_N";
+                        bias-disable;
+                        output-low;
+                };
+		gpio175ol_pins: gpio175ol-pins {
+                        pins = "GPIO175/PSPI1CK/FANIN19";
+                        label = "BMC_FWSPI_WP_R_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio206oh_pins: gpio206oh-pins {
+                        pins = "GPIO206/HSYNC2";
+                        label = "FM_BMC_FRU_EEPROM_WP";
+                        bias-disable;
+                        output-high;
+                };
+                gpio219oh_pins: gpio219oh-pins {
+                        pins = "GPIO219/nWDO2";
+                        label = "BMC_I2C7_RST_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio15oh_pins: gpio15oh-pins {
+                        pins = "GPIO15/GSPICS/SMB5CSDA";
+                        label = "PE4_BRICK_EN";
+                        bias-disable;
+                        output-high;
+                };
+                gpio139ol_pins: gpio139ol-pins {
+                        pins = "GPIO139/SD1DT3";
+                        label = "HSC_A_FAULT_N";
+                        bias-disable;
+                        output-low;
+                };
+                gpio141oh_pins: gpio141oh-pins {
+                        pins = "GPIO141/SD1WP";
+                        label = "PLD_SYS_RST_BT_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio202ol_pins: gpio202ol-pins {
+                        pins = "GPIO202/SMB0CSDA";
+                        label = "BMC_SYS_PSON_N";
+                        bias-disable;
+                        output-low;
+                };
+
+                /* Monitor Pins */
+                gpio192i_pins: gpio192i-pins {
+                        pins = "GPIO192";
+                        label = "BMC_PWR_BTN_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio199i_pins: gpio199i-pins {
+                        pins = "GPIO199/SMB0DSCL";
+                        label = "BMC_PSU_PG";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio13i_pins: gpio13i-pins {
+                        pins = "GPIO13/GSPIDO/SMB5BSDA";
+                        label = "S0_RESET_OUT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio25i_pins: gpio25i-pins {
+                        pins = "GPIO25/IOXHDI";
+                        label = "S1_I2C9_ALERT_R_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio59i_pins: gpio59i-pins {
+                        pins = "GPIO59/SMB3DSDA";
+                        label = "SATA0_PRSNT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio60i_pins: gpio60i-pins {
+                        pins = "GPIO60/SMB3DSCL";
+                        label = "S0_SCP_AUTH_FAILURE_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio6i_pins: gpio6i-pins {
+                        pins = "GPIO6/IOX2CK/SMB2DSDA";
+                        label = "IRQ_SMB_AGORA_MAX34451_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio11i_pins: gpio11i-pins {
+                        pins = "GPIO11/IOXHCK";
+                        label = "S0_I2C4_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio162i_pins: gpio162i-pins {
+                        pins = "GPIO162/SERIRQ";
+                        label = "S1_BMC_SPARE_R";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio163i_pins: gpio163i-pins {
+                        pins = "GPIO163/LCLK/ESPICLK";
+                        label = "S0_BMC_VRD3_P0V75_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio37i_pins: gpio37i-pins {
+                        pins = "GPIO37/SMB3CSDA";
+                        label = "S1_BMC_VRD3_P0V75_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio93i_pins: gpio93i-pins {
+                        pins = "GPIO93/GA20/SMB5DSCL";
+                        label = "FAN_FAIL_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio64i_pins: gpio64i-pins {
+                        pins = "GPIO64/FANIN0";
+                        label = "BMC_S0_GPIO0_DDR_ADR";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio68i_pins: gpio68i-pins {
+                        pins = "GPIO68/FANIN4";
+                        label = "S0_I2C3_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio71i_pins: gpio71i-pins {
+                        pins = "GPIO71/FANIN7";
+                        label = "S1_SLAVE_PRESENT_BUFF_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio72i_pins: gpio72i-pins {
+                        pins = "GPIO72/FANIN8";
+                        label = "S0_OVERTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio73i_pins: gpio73i-pins {
+                        pins = "GPIO73/FANIN9";
+                        label = "S0_HIGHTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio74i_pins: gpio74i-pins {
+                        pins = "GPIO74/FANIN10";
+                        label = "S0_FAULT_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio75i_pins: gpio75i-pins {
+                        pins = "GPIO75/FANIN11";
+                        label = "S0_SHD_ACK_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio76i_pins: gpio76i-pins {
+                        pins = "GPIO76/FANIN12";
+                        label = "S0_REBOOT_ACK_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio78i_pins: gpio78i-pins {
+                        pins = "GPIO78/FANIN14";
+                        label = "S0_PRESENT_CPLD_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio79i_pins: gpio79i-pins {
+                        pins = "GPIO79/FANIN15";
+                        label = "S01_ALERT3_SALT3_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio80i_pins: gpio80i-pins {
+                        pins = "GPIO80/PWM0";
+                        label = "S1_GPI2_SPECIAL_BOOT";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio81i_pins: gpio81i-pins {
+                        pins = "GPIO81/PWM1";
+                        label = "S0_BMC_VRD0_VDDC_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio82i_pins: gpio82i-pins {
+                        pins = "GPIO82/PWM2";
+                        label = "S0_BMC_VRD1_VDDQ0123_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio83i_pins: gpio83i-pins {
+                        pins = "GPIO83/PWM3";
+                        label = "S1_BMC_VRD2_VDDQ4567_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio144i_pins: gpio144i-pins {
+                        pins = "GPIO144/PWM4";
+                        label = "S1_BMC_VRD1_VDDQ0123_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio145i_pins: gpio145i-pins {
+                        pins = "GPIO145/PWM5";
+                        label = "S1_BMC_VRD0_VDDC_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio146i_pins: gpio146i-pins {
+                        pins = "GPIO146/PWM6";
+                        label = "S0_BMC_VRD2_VDDQ4567_FAULT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio147i_pins: gpio147i-pins {
+                        pins = "GPIO147/PWM7";
+                        label = "S0_BMC_GPIOAC5_R";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio160i_pins: gpio160i-pins {
+                        pins = "GPIO160/CLKOUT/RNGOSCOUT";
+                        label = "RST_BMC_MB_MAX34451_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio231i_pins: gpio231i-pins {
+                        pins = "GPIO231/nCLKREQ";
+                        label = "FM_SYS_THROTTLE_LVC3_PLD";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio9i_pins: gpio9i-pins {
+                        pins = "GPIO9/LKGPO2";
+                        label = "FM_SEQ_BMC_PCIRST_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio38i_pins: gpio38i-pins {
+                        pins = "GPIO38/SMB3CSCL";
+                        label = "BMC_SALT1_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio39i_pins: gpio39i-pins {
+                        pins = "GPIO39/SMB3BSDA";
+                        label = "BMC_SALT8_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio40i_pins: gpio40i-pins {
+                        pins = "GPIO40/SMB3BSCL";
+                        label = "BMC_SALT0_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio92i_pins: gpio92i-pins {
+                        pins = "GPIO92/R2MDIO";
+                        label = "BMC_SMB_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio121i_pins: gpio121i-pins {
+                        pins = "GPIO121/SMB2CSCL";
+                        label = "S1_OVERTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio122i_pins: gpio122i-pins {
+                        pins = "GPIO122/SMB2BSDA";
+                        label = "S1_SCP_AUTH_FAILURE_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio123i_pins: gpio123i-pins {
+                        pins = "GPIO123/SMB2BSCL";
+                        label = "S1_FW_BOOT_OK";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio124i_pins: gpio124i-pins {
+                        pins = "GPIO124/SMB1CSDA";
+                        label = "S1_FAULT_ALERT_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio126i_pins: gpio126i-pins {
+                        pins = "GPIO126/SMB1BSDA";
+                        label = "S1_HIGHTEMP_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio136i_pins: gpio136i-pins {
+                        pins = "GPIO136/SD1DT0";
+                        label = "S1_PRESENT_CPLD_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio138i_pins: gpio138i-pins {
+                        pins = "GPIO138/SD1DT2";
+                        label = "CPU_BIOS_RECOVER_JMPR";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio140i_pins: gpio140i-pins {
+                        pins = "GPIO140/SD1CLK";
+                        label = "PLD_BMC_SRST_N";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio142i_pins: gpio142i-pins {
+                        pins = "GPIO142/SD1CMD";
+                        label = "ROT_CPU_RST_AUTH_N";
+                        bias-disable;
+                        input-enable;
+                };
+		// fiu3
+                gpio188o_pins: gpio188o-pins {
+                        pins = "GPIO188/SPI3D2/nSPI3CS2";
+                        bias-disable;
+                        output-high;
+                };  
+                gpio189_pins: gpio189-pins {
+                        pins = "GPIO189/SPI3D3/nSPI3CS3";
+                        bias-disable;
+                        input-enable;
+                };  		
+                gpio190i_pins: gpio190i-pins{
+                        pins = "GPIO190/nPRD_SMI";
+                        label = "S0_GPI2_SPECIAL_BOOT";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio194i_pins: gpio194i-pins {
+                        pins = "GPIO194/SMB0BSCL";
+                        label = "S0_FW_BOOT_OK";
+                        bias-disable;
+                        input-enable;
+                };
+                gpio195i_pins: gpio195i-pins {
+                        pins = "GPIO195/SMB0BSDA";
+                        label = "BMC_CON1_SEL";
+                        bias-disable;
+                        input-enable;
+                };
+		// CPU Reset set to high after BMC OK
+                gpio65oh_pins: gpio65oh-pins {
+                        pins = "GPIO65/FANIN1";
+                        label = "BMC_S0_SYSRESET_N";
+                        bias-disable;
+                        output-high;
+                };
+                gpio127oh_pins: gpio127oh-pins {
+                        pins = "GPIO127/SMB1BSCL";
+                        label = "BMC_S1_SYSRESET_N";
+                        bias-disable;
+                        output-high;
+                };
+	};
+
+	ahb {
+                udc5:udc@f0835000 {
+                        status = "okay";
 		};
-		gpio196ol_pins: gpio196ol-pins {
-			pins = "GPIO196/SMB0CSCL";
-			bias-disable;
-			output-low;
+                udc6:udc@f0836000 {
+                        status = "okay";
 		};
-		gpio199i_pins: gpio199i-pins {
-			pins = "GPIO199/SMB0DSCL";
-			bias-disable;
-			input-enable;
+                udc7:udc@f0837000 {
+                        status = "okay";
 		};
-		gpio202ol_pins: gpio202ol-pins {
-			pins = "GPIO202/SMB0CSDA";
-			bias-disable;
-			output-low;
+                udc8:udc@f0838000 {
+                        status = "okay";
 		};
 	};
-};
 
+        pcie-slot {
+
+                pcie0: pcie-slot@0 {
+                        label = "slot0";
+                };
+                pcie1: pcie-slot@1 {
+                        label = "slot1";
+                };
+                pcie2: pcie-slot@2 {
+                        label = "slot2";
+                };
+                pcie3: pcie-slot@3 {
+                        label = "slot3";
+                };
+                pcie4: pcie-slot@4 {
+                        label = "slot4";
+                };
+                pcie5: pcie-slot@5 {
+                        label = "slot5";
+                };
+                pcie6: pcie-slot@6 {
+                        label = "slot6";
+                };
+                pcie7: pcie-slot@7 {
+                        label = "slot7";
+                };
+	};
+	
+};
 &gmac0 {
 	phy-mode = "rgmii-id";
 	snps,eee-force-disable;
 	status = "okay";
 };
 
+&emc0 {
+	phy-mode = "rmii";
+	use-ncsi;
+	status = "okay";
+};
+		
 &ehci1 {
 	status = "okay";
 };
 
+&ohci1 {
+	status = "okay";
+};
+
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&spi1 {
+        cs-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&gpio17_pins &gpio18o_pins
+                &gpio19ol_pins>;
+        status = "okay";
+        jtag_master {
+                compatible = "nuvoton,npcm750-jtag-master";
+                spi-max-frequency = <25000000>;
+                reg = <0>;
+
+                pinctrl-names = "pspi", "gpio";
+                pinctrl-0 = <&pspi2_pins>;
+                pinctrl-1 = <&gpio17_pins &gpio18o_pins
+                                &gpio19ol_pins>;
+
+                tck-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+                tdi-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+                tdo-gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+                tms-gpios = <&gpio0 16 GPIO_ACTIVE_HIGH>;
+                status = "okay";
+        };
+};
+
 &fiu0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0cs1_pins>;
@@ -397,42 +858,29 @@
 				reg = <0x0000000 0xC0000>;
 				read-only;
 			};
-			u-boot-env@100000{
-				label = "u-boot-env";
-				reg = <0x00100000 0x40000>;
+			image-descriptor@f0000 {
+				label = "image-descriptor";
+				reg = <0xf0000 0x10000>;
+			};
+			rot-update@100000 {  	
+				label = "rot-update";
+				reg = <0x100000 0x100000>;
 			};
 			kernel@200000 {
 				label = "kernel";
-				reg = <0x0200000 0x600000>;
+				reg = <0x200000 0x500000>;
 			};
-			rofs@800000 {
+			rofs@700000 {
 				label = "rofs";
-				reg = <0x800000 0x3500000>;
+				reg = <0x700000 0x35f0000>;
 			};
-			rwfs@3d00000 {
+			rwfs@3cf0000 {
 				label = "rwfs";
-				reg = <0x3d00000 0x300000>;
+				reg = <0x3cf0000 0x300000>;
 			};
-		};
-	};
-	spi-nor@1 {
-		compatible = "jedec,spi-nor";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <1>;
-		spi-max-frequency = <5000000>;
-		spi-rx-bus-width = <2>;
-		partitions@88000000 {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			spare1@0 {
-				label = "spi0-cs1-spare1";
-				reg = <0x0 0x800000>;
-			};
-			spare2@800000 {
-				label = "spi0-cs1-spare2";
-				reg = <0x800000 0x0>;
+			rot-mailbox@3ff0000 { 
+				label = "rot-mailbox";
+				reg = <0x3ff0000 0x10000>;
 			};
 		};
 	};
@@ -440,27 +888,58 @@
 
 &fiu3 {
 	pinctrl-0 = <&spi3_pins>;
-	spi-nor@0 {
+	status = "okay";
+
+        spi-nor@0 {
 		compatible = "jedec,spi-nor";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		reg = <0>;
-		spi-max-frequency = <5000000>;
-		spi-rx-bus-width = <2>;
+                #address-cells = <1>;
+                #size-cells = <1>;
+                spi-rx-bus-width = <2>;
+                reg = <0>;		
+		label = "bios";
+/*
+		label = "BIOS";
+
 		partitions@A0000000 {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			system1@0 {
-				label = "bios";
-				reg = <0x0 0x0>;
-			};
-			system2@800000 {
-				label = "spi3-system2";
-				reg = <0x800000 0x0>;
-			};
-		};
-	};
+                        compatible = "fixed-partitions";
+                        #address-cells = <1>;
+                        #size-cells = <1>;
+                        system1@0 {
+                                label = "bios";
+                                reg = <0x0 0x0>;
+                        };
+                };
+*/
+        };
+};
+
+// emmc 
+&sdhci0 {
+	status = "okay";
+};
+// USB
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&vdma {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&vcd {
+	status = "okay";
+};
+
+&ece {
+	status = "okay";
 };
 
 &watchdog1 {
@@ -492,6 +971,10 @@
 	status = "okay";
 };
 
+&otp {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 	i2c-switch@75 {
@@ -501,31 +984,37 @@
 		reg = <0x75>;
 		i2c-mux-idle-disconnect;
 
-		i2c@2 {
+                i2c16: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+                i2c17: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c18: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
 
 			// Rear-Fan
-			max31790@58 {
+			max31790@2c {
 				compatible = "maxim,max31790";
-				reg = <0x58>;
+				reg = <0x2c>;
 			};
 		};
 
-		i2c@3 {
+		i2c19: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
-
-			// Mid-Fan
-			max31790@58 {
-				compatible = "maxim,max31790";
-				reg = <0x58>;
-			};
 		};
 
-		i2c-bus@4 {
+		i2c20: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -536,20 +1025,20 @@
 				reg = <0x5c>;
 			};
 		};
-
-		i2c-bus@5 {
+                
+		i2c21: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
 
-			// OUTLET1_T
+			// OUTLET3_T
 			lm75@5c {
 				compatible = "ti,lm75";
 				reg = <0x5c>;
 			};
 		};
 
-		i2c-bus@6 {
+		i2c22: i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <6>;
@@ -561,12 +1050,12 @@
 			};
 		};
 
-		i2c-bus@7 {
+                i2c23: i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <7>;
 
-			// OUTLET3_T
+			// OUTLET1_T
 			lm75@5c {
 				compatible = "ti,lm75";
 				reg = <0x5c>;
@@ -580,35 +1069,101 @@
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
 
-		i2c-bus@2 {
+                i2c24: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+                i2c25: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		i2c26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
 
-			// STB-T
+                        // STB-T
 			pmbus@74 {
 				compatible = "pmbus";
 				reg = <0x74>;
 			};
 		};
+
+                i2c27: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+
+                        // 48V PMBUS this is a Generic PMBus Device
+			pmbus@1f {
+				compatible = "pmbus";
+                                reg = <0x1f>;
+			};
+		};
+
+                i2c28: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+		};
+
+                i2c29: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+                i2c30: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+                i2c31: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
 	};
 };
 
 &i2c2 {
 	status = "okay";
 	smpro@4f {
-		compatible = "ampere,smpro";
+		compatible = "ampere,ac01-smpro";
 		reg = <0x4f>;
+		hwmon {
+			compatible = "ampere,ac01-hwmon";
+		};
+		misc {
+			compatible = "ampere,ac01-misc";
+		};
+		errmon {
+			compatible = "ampere,ac01-errmon";
+		};
 	};
-
 	smpro@4e {
-		compatible = "ampere,smpro";
+		compatible = "ampere,ac01-smpro";
 		reg = <0x4e>;
-	};
+		hwmon {
+			compatible = "ampere,ac01-hwmon";
+		};
+		misc {
+			compatible = "ampere,ac01-misc";
+		};
+		errmon {
+			compatible = "ampere,ac01-errmon";
+		};
+	};	
 };
 
 &i2c3 {
 	status = "okay";
+        pcie-slot = &pcie0;
 };
 
 &i2c4 {
@@ -620,64 +1175,125 @@
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
 
-		i2c-bus@0 {
+		i2c32: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
-
+			
 			// ADC sensors
 			adm1266@40 {
 				compatible = "adi,adm1266";
 				reg = <0x40>;
 			};
+			// ADC sensors
+			adm1266@41 {
+				compatible = "adi,adm1266";
+				reg = <0x41>;
+			};
 		};
 
-		i2c-bus@1 {
+		i2c33: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			
+			// SKM sensors
+			skm@55 {
+				compatible = "atmel,24c64";
+				reg = <0x55>;
+			};
+		};
 
-			// ADC sensors
-			adm1266@41 {
-				compatible = "adi,adm1266";
-				reg = <0x41>;
+                i2c34: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+                i2c35: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+
+		i2c36: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+
+			// gpio expander
+			pca6416@20 {
+				compatible = "ti,tca6416";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
 			};
 		};
+                
+                i2c37: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+		};
+
+                i2c38: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+		};
+
+                i2c39: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
 	};
+
+	mbfru@50 {
+        compatible = "atmel,24c64";
+        reg = <0x50>;
+    };
 };
 
 &i2c5 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie1;
 };
 
 &i2c6 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie2;
 };
 
 &i2c7 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie3;
 };
 
 &i2c8 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie4; 
 };
 
 &i2c9 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie5;
 };
 
 &i2c10 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie6;
 };
 
 &i2c11 {
-	status = "okay";
+        status = "okay";
+        pcie-slot = &pcie7;
 };
 
 &i2c12 {
 	status = "okay";
 	ssif-bmc@10 {
-		compatible = "ssif-bmc";
+		compatible = "nuvoton,npcm7xx-ssif-bmc";
 		reg = <0x10>;
 	};
 };
@@ -691,128 +1307,306 @@
 		reg = <0x77>;
 		i2c-mux-idle-disconnect;
 
-		i2c-bus@3 {
+		i2c40: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <3>;
+			reg = <0>;
+ 
+			// SMPRO EEPROM  gpio085 Gpioset 2 21= 0  
+//			scp@50 {
+//				compatible = "atmel,24c64";
+//				reg = <0x50>;
+//				pagesize = <32>;
+			// };
+		};
+		i2c41: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			rtc@51 {
+				compatible = "nxp,pcf85063";
+			        reg = <0x51>;
+			        quartz-load-femtofarads = <12500>;
+			};
+
+		};
+		i2c42: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
 
 			// M2_ZONE_T
-			lm75@28 {
+			lm75@48 {
 				compatible = "ti,lm75";
-				reg = <0x28>;
+				reg = <0x48>;
 			};
 		};
 
-		i2c-bus@4 {
+		i2c43: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <4>;
+			reg = <3>;
 
 			// BATT_ZONE_T
-			lm75@29 {
+			lm75@49 {
 				compatible = "ti,lm75";
-				reg = <0x29>;
+				reg = <0x49>;
 			};
 		};
 
-		i2c-bus@5 {
+		i2c44: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <5>;
+			reg = <4>;
 
 			// NBM1_ZONE_T
-			lm75@28 {
+			lm75@48 {
 				compatible = "ti,lm75";
-				reg = <0x28>;
+				reg = <0x48>;
 			};
 		};
-		i2c-bus@6 {
+		i2c45: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <6>;
+			reg = <5>;
 
 			// NBM2_ZONE_T
-			lm75@29 {
+			lm75@49 {
 				compatible = "ti,lm75";
-				reg = <0x29>;
+				reg = <0x49>;
 			};
 		};
+                i2c46: i2c@6 {
+                        #address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+                        
+                        tla2024: tla2024@48 {
+                                compatible = "ti,tla2024";
+                                reg = <0x48>;
+				scale = <2>;
+				#io-channel-cells = <1>;
+				
+				channel@0 {
+					single-channel = <0>;
+				};
+
+				channel@2 {
+					single-channel = <2>;
+				};
+                        };
+                };
+                i2c47: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+                };
 	};
 };
 
 &i2c14 {
 	status = "okay";
+	// ADC sensors - DC
+	max34451@59 { 
+		compatible = "maxim,max34440";
+		reg = <0X59>;
+	};
+	bmcfru@55 {
+		compatible = "atmel,24c64";
+		reg = <0x55>;
+	};
 };
 
 &i2c15 {
 	status = "okay";
+
+        i2c-switch@72 {
+		compatible = "nxp,pca9545";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x72>;
+		i2c-mux-idle-disconnect;
+
+                i2c48: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+                };
+                i2c49: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+                };
+                i2c50: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+                };
+                i2c51: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+                };
+        };
 };
 
-&spi0 {
-	cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
-	status = "okay";
+&gpio0  {
+                gpio-line-names = 
+                /* GPIO0 */
+                "", "", "", "", 
+                "", "", "", "",
+                "", "", "", "", 
+                "", "RESET_BUTTON", "", "",
+                "", "", "", "", 
+                "", "", "", "",
+                "", "", "", "", 
+                "", "", "", "";
+};
+&gpio2  {
+                gpio-line-names = 
+                /* GPIO2 */
+                "", "RESET_OUT_BUTTON", "", "", 
+                "", "", "POWER_OUT_OFF", "",
+                "", "", "", "SHD_ACK", 
+                "", "", "", "",
+                "", "", "", "", 
+                "", "", "", "",
+                "", "", "", "", 
+                "", "", "RESET_OUT", "";
+};
+&gpio6  {
+                gpio-line-names = 
+                /* GPIO6 */
+                "POWER_BUTTON", "", "", "", 
+                "", "", "", "",
+                "PS_PWROK", "", "", "POWER_OUT_ON", 
+                "", "", "", "",
+                "", "", "", "", 
+                "", "", "", "",
+                "", "", "", "", 
+                "", "", "", "";
 };
 
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <
-			&gpio61oh_pins
-			&gpio62oh_pins
-			&gpio161ol_pins
-			&gpio163i_pins
-			&gpio167ol_pins
-			&gpio95i_pins
-			&gpio65ol_pins
-			&gpio66oh_pins
-			&gpio67oh_pins
-			&gpio68ol_pins
-			&gpio69i_pins
-			&gpio70ol_pins
-			&gpio71i_pins
-			&gpio72i_pins
-			&gpio73i_pins
-			&gpio74i_pins
-			&gpio75i_pins
-			&gpio76i_pins
-			&gpio77i_pins
-			&gpio78i_pins
-			&gpio79ol_pins
-			&gpio80oh_pins
-			&gpio81i_pins
-			&gpio82i_pins
-			&gpio83i_pins
-			&gpio144i_pins
-			&gpio145i_pins
-			&gpio146i_pins
-			&gpio147oh_pins
-			&gpio168ol_pins
-			&gpio169oh_pins
-			&gpio170ol_pins
-			&gpio218oh_pins
-			&gpio37i_pins
-			&gpio38i_pins
-			&gpio39i_pins
-			&gpio40i_pins
-			&gpio121i_pins
-			&gpio122i_pins
-			&gpio123i_pins
-			&gpio124i_pins
-			&gpio125i_pins
-			&gpio126i_pins
-			&gpio127i_pins
-			&gpio136i_pins
-			&gpio137oh_pins
-			&gpio138i_pins
-			&gpio139i_pins
-			&gpio140i_pins
-			&gpio141i_pins
-			&gpio190oh_pins
-			&gpio191oh_pins
-			&gpio195ol_pins
-			&gpio196ol_pins
-			&gpio199i_pins
-			&gpio202ol_pins
-			>;
+                /* LED Pins*/
+//                &gpio7oh_pins
+                &gpio24ol_pins
+                &gpio169ol_pins
+
+                /* Mux Pins */
+		/* UART Mux*/
+                &gpio167oh_pins
+                &gpio161oh_pins
+                &gpio177oh_pins
+                &gpio198ol_pins
+
+                &gpio87oh_pins
+                &gpio88oh_pins
+                &gpio89oh_pins
+                &gpio91oh_pins
+                &gpio168oh_pins
+                &gpio12oh_pins
+                &gpio218oh_pins
+                &gpio164ol_pins
+                &gpio16oh_pins
+                &gpio84ol_pins
+                &gpio85ol_pins
+                &gpio86ol_pins
+                &gpio120ol_pins
+
+                /* Control Pins */
+                &gpio10ol_pins
+                &gpio69ol_pins
+                &gpio203ol_pins
+                &gpio70oh_pins
+                &gpio94ol_pins
+                &gpio90oh_pins
+                &gpio196ol_pins
+                &gpio197oh_pins
+                &gpio14oh_pins
+                &gpio66ol_pins
+                &gpio67ol_pins
+                &gpio125ol_pins
+                &gpio4ol_pins
+                &gpio5ol_pins
+                &gpio46ol_pins
+                &gpio187ol_pins
+                &gpio165ol_pins
+                &gpio166ol_pins
+                &gpio77oh_pins
+                &gpio170ol_pins
+                &gpio206oh_pins
+		&gpio175ol_pins
+                &gpio219oh_pins
+                &gpio15oh_pins
+                &gpio139ol_pins
+                &gpio141oh_pins
+                &gpio202ol_pins
+
+                /* Monitor Pins */
+                &gpio192i_pins
+                &gpio199i_pins
+                &gpio13i_pins
+                &gpio25i_pins
+                &gpio59i_pins
+                &gpio60i_pins
+                &gpio6i_pins
+                &gpio11i_pins
+                &gpio162i_pins
+                &gpio163i_pins
+                &gpio37i_pins
+                &gpio93i_pins
+                &gpio64i_pins
+                &gpio68i_pins
+                &gpio71i_pins
+                &gpio72i_pins
+                &gpio73i_pins
+                &gpio74i_pins
+                &gpio75i_pins
+                &gpio76i_pins
+                &gpio78i_pins
+                &gpio79i_pins
+                &gpio80i_pins
+                &gpio81i_pins
+                &gpio82i_pins
+                &gpio83i_pins
+                &gpio144i_pins
+                &gpio145i_pins
+                &gpio146i_pins
+                &gpio147i_pins
+                &gpio160i_pins
+                &gpio231i_pins
+                &gpio9i_pins
+                &gpio38i_pins
+                &gpio39i_pins
+                &gpio40i_pins
+                &gpio92i_pins
+                &gpio121i_pins
+                &gpio122i_pins
+                &gpio123i_pins
+                &gpio124i_pins
+                &gpio126i_pins
+                &gpio136i_pins
+                &gpio138i_pins
+                &gpio140i_pins
+                &gpio142i_pins
+                &gpio190i_pins
+                &gpio194i_pins
+                &gpio195i_pins
+
+                // BSP RX/TX
+		&bmcuart0a_pins /* BSP RX/TX */
+                // BU1 RX/TD
+		&bmcuart1_pins /* BU1 RX/TD */
+                // TX/RX D2
+		&uart2_pins /* TX/RX D2 */
+		// Set system reset to high
+                &gpio65oh_pins
+                &gpio127oh_pins
+		>;
 };
 
 &gcr {
-- 
2.17.1

