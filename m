Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8E7DDFCA
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:51:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eJzryqm2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3jQ4Pv6z3cZn
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:51:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=eJzryqm2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::618; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bx2TLFz3cTg
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf/IJ5uvW01CcKS9v8of8G6o4Mmr5v8LsdQSh4HQOW4CRu8E+dJibG1pjT1E0xQ1YcXuIDN9p4nTmjbHbUEFtSQGuGoYmk801a00o5bXzfM7meEvlbm+QfREYoU2/GehyA5mJfwTgTApGAmj0j44wtHtiaSTWaOEZg0E0q4cPhS2YTQt4Tj4G3YwWCJ+rueJ99395EypkwuUjhWpipiC26SkP1gL5hveA2wKevLTY6v5w7SrlKwe7yCqEMHW5dIkHu0hzcKEbBApIBkz/Jizk+ndGQ/6A4fud1SjdC3vX5JpSLjr7fFpgLh6iY/qk2qRsN2WwmnNMlQ5Q8AL45ag/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=G/YPTesBLCET1/XKGekKYdPldM8f28i4sKSph9IrCfTCoef/X1bFIR1AF4uGxrsqIKaXrxkSm83Yg4oFF9YpYTFxZrhpnr0Q99U8Tt4G3P50FTiSEdoQ+SA+d7YHc6wKYEDlaDj2sErwHlThGSwUQUEXuBjrPNRW1DUQEJZiy6FR+Pn63+4OATu1UDsn8G0IPwXQ4sxnipt/02rkihtjYBCwJR25oy2BdQGMnoYQomg/Et+2jIAuWMDlLgd57TFW2JcN1nT143IJ/N6R8VWfrfH/6fI4KgTAnHKVx8R7SA3UUTHauzA0wV97qS5t8yP3WpfZGMjSFPafbDxBhgmhAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=eJzryqm2aRZF3xLxk+O1//nY/bw+PdwJD7P0myONKulu2/apMFyPQCTGLvvxcySpSFkgqHZf7VEoiAd6UfTNKIY0TYmQmjjijbxWMH1EN9hXrumQWbWBPWspmzAkgvaEMm0lWfXp2+HOJjMr37qUhLsSFEfcGL6ejaeg22Q0WmWkoRedeWF12iQoSHLkZnSDeNwYlMHxulsecbdjiRFueS9tU8Y//iOWdCi0iAqDCqaZWDCGkL/tdXWoR6Ddnkd9Zi87HxGA/YAbScrwqaAPq1xJtB8NeV2OxAL5redz5chZ9xqrE7VQdNAauVx2exGYQ+vtEWM1utk1fwkDCa9fmg==
Received: from SG2PR04CA0193.apcprd04.prod.outlook.com (2603:1096:4:14::31) by
 SEZPR04MB5699.apcprd04.prod.outlook.com (2603:1096:101:3b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.31; Wed, 1 Nov 2023 10:28:37 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::11) by SG2PR04CA0193.outlook.office365.com
 (2603:1096:4:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:37
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 10/11] ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
Date: Wed,  1 Nov 2023 18:27:50 +0800
Message-Id: <20231101102751.2538864-25-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEZPR04MB5699:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 29e12ccd-991f-4e28-b3e3-08dbdac54f3d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DNwGEjt32oBb7mdHvfxluZUsLqy4lzUolIgjCApQokHC2loC12N3LMF1DS3oHg20lhH8U49jYJ83Sl4HWaf5EnqFBojJkP5V612Qmzoy84LYd9qDGNHZV3R0RSn8zvXOFsoRnTgAA/ObeD8dfst8IotJXq8hPfe6pH/RyZlaxcZXCKIW+VqSVPyxS0U2zYArwMjEK7vOZ4zyK82/FsXZqnpkHtbWnvPYp6Vv0p0PMAswybiln8r+mqlS1Um6I4QJSc5GIpExzHh0cd6CF2D7NiPMjbIOpSDZwlkijJzoZcjHb0QsCYCpmdIbvTy2kw78bMia4s2fTrzAXEOKCIHOI29X6fts+WgIAeJz1szoO7PuTSwLoreYZyn2XJX9qz7KMZhu4j1spBDwTKMmqjV/tejnBwiBWPbUfiws+Tiz3Vl6VPa1TYUjsbE4KcHzSK8pLesbgseNE8dozMocAx1viXa3wcIk3Dr5tIijOZspSDumU4MP4LfDlnLCLQpNvweVpt6mCqGFbmNa/mkSX1u9OTke7LvTirqUV0a23PMm2lgzrNjdz6HupvSUc8U0pteKbLHm4OzNnDnyk9eXbHO9wVn7AeJ4F8CRxlKxeTzwomi/Yvr8CozAp3UHaRQ2LMF5EzE41Jaf9nukFi83lR6oBddiLI4ERb33rQP3R8ZdSR1VRA98g50+q7cpAcKLd3PJnKIycf7pdIp36GBe8MITnw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199024)(82310400011)(186009)(64100799003)(1800799009)(46966006)(36840700001)(41300700001)(478600001)(6486002)(6506007)(6666004)(4326008)(336012)(83380400001)(40480700001)(8936002)(8676002)(36736006)(47076005)(36860700001)(5660300002)(2906002)(70206006)(70586007)(26005)(316002)(86362001)(6512007)(2616005)(1076003)(956004)(107886003)(82740400003)(81166007)(356005)(36756003)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:37.3100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e12ccd-991f-4e28-b3e3-08dbdac54f3d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB5699
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

