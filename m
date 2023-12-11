Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FDA80BFDA
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:24:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WR0aT1yI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRtc3WdQz3vjj
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:24:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=WR0aT1yI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRfx5fZCz2xl6
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwkLBu8PR4Q3/bBlu5vOk6APPwYoQpfsh/vlBqvNPjsIgBu+psYyS+Z902hSgeSjIGkpLq3T1aUC+BAtHkESWwm7PWTa0RDQB2YBoR6xv5dMORWeR4uDnGSUtOIDplO/iTTGkIQt1YiFU/UF2kQmHFkYLHxu3uzsWqsXhAF9pQyzfgxKyDxQZL2mILFqw2ByF3UD2CZDg+OGQfirfOgBIigqAkUSdZoUfX0i7w8TvcbEkpHFVNhclf/2RKqqdFEWxXGzrV66Aavn2zovq5gMGclKDO38gKEdnvr+6PPHbjKr/xPWctZv6niecf3RvtMWW8CA4Il4pXdAxVX15EKVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=Nd6qGpyz+kTz5S1tfcEJeEPdAfWVDxaFBpO4C9fdjMigFsDNF/os2gFa22f8FUHNydEBRHiaNQ9OfW1Q50QMMox6hxhZOEpacPWWWk5d8V0SVu5WPqo77jR2csCoDusWNMK6Bmsy1TZZbvWru1/YYAYLiZ4iJ1ft3RTd9g+/l/IBPu7UNl0luNcIn+iCqgeGl3YTcCTbsCEBXR++Nwu1QX0L4AK4kLnzH9YYM04XZzu5AqpqbCoJB8tScxSfvcVDDCfHjKkAytpNumVX8I5zD4eIJoYjeBepEks7VqQoprdkIN4J9Jdt4vtYSCKgdOBcsM/+j+6EmW9AZ2bnxpwLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=WR0aT1yIpUWX638t9TuugpqRbb2C90Ze9+EsA2bAzGH3iEdaO5j/d1EPvv6AkqdhRQkpdZjRHIAEsWD1eMswcZDKffNAT+oa0roxc2fyKXIVMJ9V2NeU+5T5ptHFdxM1Bz9/1VIxOMSnFfWvZyYPBkVhUXl4oROKNIafEAeAt3ugbShyCyYZZP12fdQRiaAAbpbTrKzRK1acWmAtBrPeKnGxRSDvze3Ro+gVcgorZ9Y0NjjAH3rKqMatrB2eqkhqfeZgrK9R92Idkt29/evpAvj7ckrDGByJfbSKZ9NVp3/5CxagTvTk+XCzT+tvM83cFwg9aa6HQT2IqMnFCWzS/g==
Received: from SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21) by
 SEZPR04MB6273.apcprd04.prod.outlook.com (2603:1096:101:a0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:13:55 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::f3) by SG2P153CA0034.outlook.office365.com
 (2603:1096:4:c7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:55 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 09/14] ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
Date: Mon, 11 Dec 2023 11:13:32 +0800
Message-Id: <20231211031337.4165619-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB6273:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e37db742-ef1b-4433-ab3b-08dbf9f73590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2/LLYnIiaOZISI0azqdxxxydnWdf5DQ1vC6x3QdTxlHpZp20ZOERIJ59fjcgNjikmzyCdO2BifPmlVcg16IW/VPy9GeE0TYjJkUUnL0kf1hx6f8dRdzwpcBwOq9ba7MsuBQoRWQP0oLF6Cn9mCnalxN1cvxb+mlsoCpfXl9CGa0i0JDLRlbKINSRdAOdVX4HxH37tCLjpel0LVSGlUNmVdviDfFGo3hkxdc3t3xdTVJ+KNkr7sLGfg0Fx4svR517lZcVEPL8N1RjRWcgsEOWt3zmYbXSetB5jWWACnr2FcssKQKtyWVrq0qwoPwZ0Q7ATypP8i9a6EDGS4t7dIkw8dDeJYXk3MyV8xNQI2cNSHL8YqA1MCBNIaUxWvgbt8Om2dYgZtV7Ob2wa3N9VQWVSKy4rEWzk3JE5hmnGCPtgCBd5eegQ6j6A7FbM9v/h6Jgk5B1qae2OUAcDrpSzdnM98VqnQABXho+n3vz5B6mdvNYmfcAogRjFxazHYGWhJtBNdpJob6tI9c9JB+I4g4xm5s9GMXaDj/eKurgv7DIBBrMTkECiiVhq912QXT/FCuiCYSHLuQafkLYUwSkQihjcJtGRdmKYsSm+RpA/FSINipE2nUSwVs/CSHAQRx95229V3RLHPBqnlu+iGtc8VUriXbO9mWGSd9rQ+fXxoZy9j8QIg2APDS381jJGg3u/rE9qIFRobPRDDcp4QqxanuVhw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:55.1000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e37db742-ef1b-4433-ab3b-08dbf9f73590
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6273
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

Revise i2c14 and i2c15 schematic change:
- Revise adc128d818 adc mode for yosemite4 schematic change
- Revise ina233 for yosemite4 schematic change
- Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 31 ++++++++++++-------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ccb5ecd8d9a6..ed2b1200603d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1010,44 +1010,54 @@ &i2c14 {
 	adc@1d {
 		compatible = "ti,adc128d818";
 		reg = <0x1d>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
-	adc@35 {
+	adc@36 {
 		compatible = "ti,adc128d818";
-		reg = <0x35>;
-		ti,mode = /bits/ 8 <2>;
+		reg = <0x36>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	adc@37 {
 		compatible = "ti,adc128d818";
 		reg = <0x37>;
-		ti,mode = /bits/ 8 <2>;
+		ti,mode = /bits/ 8 <1>;
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x40>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x41>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x42>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x43>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina230";
+		compatible = "ti,ina233";
 		reg = <0x44>;
+		resistor-calibration = /bits/ 16 <0x0a00>;
+		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	temperature-sensor@4e {
@@ -1217,7 +1227,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1

