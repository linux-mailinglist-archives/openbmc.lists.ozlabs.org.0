Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0E80C12B
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:11:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jURAGe5z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWb95SLgz3w0b
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:11:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jURAGe5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJG6Nggz30gG
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtQKeJiJDtzZH4+/5UA5ITeB/XalY/b8bxU0hDWst///xDh7Z2dsHOrwLrKsr1iVodU2mOrJMJv0qhgm4bRjNB9zc+qpS/ALzxleOhU3tX8BH7FWE2JodHVyp1HipqcXuD4LAxi03nJlfvX/t/6uC3kdBB/F5i8eEtU5VcoVV/rxzQc3McN5Hm/L7IvKYCW0hV6NVW3k5gybAI3GSpGcgEKdL1qKd6YSpZ88EsYn2uecNj7GjppLymevKNp7dIZttAVVkg5/GRgXBpFUG2NfqlRMwoecEVVzPktFlWKE3kQk8L2w7HPoSNFhtpmg67GgGChBOHt8eODXoWxB7Ba3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ngrZal1T5zKIoze4a9wDrSNcGDO8QNLgbJOqp4+OZ4=;
 b=cT6KXBKby480Q6kE7yNyPcjSvByJHyhnjQBd8ncFDRI9fiecUDz+Cpxmo0qvsfLDqGqcgD2D3CrwpxMR40a5JfrAbe5IHNPY/25tNc4VoSqp/1El8tUyy3lyvPDkmmh/umkYXXSgu102oApISwUqNah2VIEisQfGE/kxwwFOZVZkTBhFit+1KrQwfo3TALs0VgikQmrCQHXBeRrlK3Jv1cye7IPlMLz3TWkDahJ4Gx914W5Z0aJKZoai5IfOIN5FuhmWyTmaZAX8yP/h5f0o/1V5AGHC32BBrgK6VL5yqj6Foe7Pmaei1qPf/y62V7clX0xcz6ox2SjKGkioxVPRYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ngrZal1T5zKIoze4a9wDrSNcGDO8QNLgbJOqp4+OZ4=;
 b=jURAGe5zAHS7uF1ZotrJIDNlf2KmxIdDY7vbhc/vGlAQrUp79tfxNlFFQ6Sap86t5O5OJ3T5k0aSuEY6yIStBZym3Yu1aSn/kUh2vb8nyhoIkHFkIF8CH6ByB2oXCguNjfSUBuDZFHBKmaqPapI9hStPmpuG3P+F8vcruuo+K/fH10yv1sBbtraSmY+UolgYMSX1cAkNcvuoigmKelXe5Y9BI3WpCFewnVNhA20OyiqWC+9fsOCPYG5BocAVafjyx8YxHspFlzORHpTILnqCkrfbLe+RxE3YNwtd996JGtcMsOJ9dNsKf+m7EgANV7LTduteEW3HHxHD+4p6INg42w==
Received: from SG2PR06CA0245.apcprd06.prod.outlook.com (2603:1096:4:ac::29) by
 SEZPR04MB7606.apcprd04.prod.outlook.com (2603:1096:101:1f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:58:05 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::29) by SG2PR06CA0245.outlook.office365.com
 (2603:1096:4:ac::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Mon, 11 Dec 2023 05:58:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:58:04 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 13/14] ARM: dts: aspeed: yosemite4: support mux to cpld
Date: Mon, 11 Dec 2023 13:57:37 +0800
Message-Id: <20231211055738.215773-14-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB7606:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 617b5f27-284e-4921-c41a-08dbfa0e2414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HTxndmzrZzee0zlH6uqpOvcQkptk1M3bpjwgNAUerjpx6NKiYUye/dxVUxdBuZQ5Dz7JnweAnYBXADdpNb7xSWiQRPCFU/8wJkPik2sdDOH47rAXj58kFeHNFZawOq2ESSziblwCw76Ntb2UrGPX/GhClSOwB4nneKaX93fw5jl+znBH3X7Pi9iR0WTgX9LlV9UwZ1F1fq4BmWdYQ9fNfGx26TkJ0MIXHoBWdkTek+43UeDRV8/SHox84o1JHYOTJmZJ/czaOnzpyU0IFt5KEuX+MGSa/qvWVKO/azfwPs9kBDvDnCbM6oDooqOp6t23RyjULN4+hJ7qnmWqsGQQQVWtVEVrUaD0GZ3IGcrJ7XHEWMfD/VVQo7In+P99iMvopQ2Ae8TiiDpl/4xZatp+AXDMlOv5lUZitRkMPKfVpLMwgodrXVGKxcXLfAEjx9c8GobfyfneXDaFd/DqpSTxPzAi5OJ9ZL//HX+W46yDTlwjNoa1yURUk40gdpNmPsmce8ohiUC3esGHl4CKJOva7q1tJsrcfz4G2J2Us1Q17HfB15bIHKDZgxPCyKXc8u1GDCzshR64b5Z4RiKsZglbuTeKo2fTCYyjmCwLNbrdWXsr0NQ3ll2+1qN1M7I0WhcYkAnivSuzhm1+9fRDiB3C3koAz/sqvSNYEO9GNd1XAjvh3k54jPOtAr+IsSr2aHSxEMnUl7M1uegnEnmcAqWCnQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(39850400004)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(46966006)(36840700001)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:58:04.1758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 617b5f27-284e-4921-c41a-08dbfa0e2414
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7606
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
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Mux pca9544 to cpld was added on EVT HW schematic design,
so add dts setting for devices behind mux pca9544 to cpld

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 64 ++++++++++++++-----
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c8e3a85b7a11..fdc33bffd467 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -36,6 +36,10 @@ aliases {
 		i2c31 = &imux31;
 		i2c32 = &imux32;
 		i2c33 = &imux33;
+		i2c34 = &imux34;
+		i2c35 = &imux35;
+		i2c36 = &imux36;
+		i2c37 = &imux37;
 	};
 
 	chosen {
@@ -951,24 +955,54 @@ &i2c12 {
 	status = "okay";
 	bus-frequency = <400000>;
 
-	temperature-sensor@48 {
-		compatible = "ti,tmp75";
-		reg = <0x48>;
-	};
+	i2c-mux@70 {
+		compatible = "nxp,pca9544";
+		i2c-mux-idle-disconnect;
+		reg = <0x70>;
 
-	eeprom@50 {
-		compatible = "atmel,24c128";
-		reg = <0x50>;
-	};
+		imux34: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
+			temperature-sensor@48 {
+				compatible = "ti,tmp75";
+				reg = <0x48>;
+			};
+
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
 
-	rtc@6f {
-		compatible = "nuvoton,nct3018y";
-		reg = <0x6f>;
+			eeprom@54 {
+				compatible = "atmel,24c64";
+				reg = <0x54>;
+			};
+
+			rtc@6f {
+				compatible = "nuvoton,nct3018y";
+				reg = <0x6f>;
+			};
+		};
+
+		imux35: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+
+		imux36: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		imux37: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
 	};
 };
 
-- 
2.25.1

