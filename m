Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B86C7DDF92
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:38:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sp3FDnp6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3QK2Mjfz3cc5
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:38:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sp3FDnp6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BR15nKz3cRc
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mRrLTWHQkf8sldDaUvujaDDZ2UDKAw05qws/Nub1vgFpNV8duPhcfVw+kXD9QbX5v1UiXfL+ijjJMe27pRJkJQow/hFPATpcAr8QoWIG6cxE81Q572QjlqUE8pncSkPmJeLO4dGijz/JRayW+2KtHeP0Fx9Mka/lidZ3sV6RB1LALrmP+dv61r4qWYlQgCPOuvgalgGLTN14eA9dVrmgVtKO72RNLFp97/GRovenKYETSUbkIRpMPvyI1ofjPUlHtVVqfGe5TsCXd6nxQVAJTgqmuuEOPhDKpVGBjBXoH4SpZSxdbp5Cq/jS4Jv4xf8yLw3QTpPmRxVhOPy1H1kDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=mJ6tYOJyLujDiGovANfFJ/VvH83XSpWNhWMK7iT5yZ/AoUV/4uKVtJceBuY8vIiIyxYkze6b0fTf31/V27/k7UPfkAuxX3KmS4/d364hqCHli/qWgSdhuSW/QETIp4K8xNB+TODzwz1IkQOganxP6HD6DV3oq+nAphJp1Hcy7Ty4CxWuCK5cKCq0OGvCRWDE1LxkX32HmoQryaZBlwr4srZVQDINclPNj7cC+HxHZBkaMOZbdTQF0bguN0MJFAkVJCvIHE18z49SyJoES3ZLBhn2uI76l6E94bKYYlLu/Pd3Ztu08QMrQnbmj5aWTesd2knJ5M/4Zv3a5BazmD6Rgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=sp3FDnp6GM2l/qOA+KR1T8SKooCHIIIfl4hA8JSnJcJKz7exKvF1F6OPK6/ykMFnm2qS9Dwh0MFQ1KlDWvMZJNnxZqWIGlhZF5+WabZWgetZt99smJtHrQoLqyXhArc5CR7fN+uRyWb2l7QREvw+QUV/M1zgn7SFcg162E2tXO+dmbdcI8SbJ1Zs9sOXLTrsPNW/tmSj8IieRrSo28lqqL/XjIQRb3xVWDA3yijAaUEEO5HHxyWiIFDQ84/apCKzGw5F/9qu5RSSn6Kr64/PT2CrDi5+JOcFY3EeIstYDJWNhtPRuHzlwOUbtNsNeGa/Ju/8w/517O8Z74sC6YfvWw==
Received: from SG2PR04CA0189.apcprd04.prod.outlook.com (2603:1096:4:14::27) by
 SI2PR04MB5919.apcprd04.prod.outlook.com (2603:1096:4:1ee::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 10:28:12 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::49) by SG2PR04CA0189.outlook.office365.com
 (2603:1096:4:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.31 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:12
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 10/11] ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
Date: Wed,  1 Nov 2023 18:27:37 +0800
Message-Id: <20231101102751.2538864-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SI2PR04MB5919:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e09ac83-0ace-4b71-d333-08dbdac5406e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rGy95mah5QW5Yc2vajRGobHsJyJmWlBaBSbhPHdjrZyy7nGZ081EUgWh7RIfBjb3lcZqwNl32P9veoeiHP1Z+44Dr0uKBPjGFlIWjayQCCKd/vH9IgJPOL2IzmgzkxSA3AXrxbYczNCm5P0+m/W/hY2/4HDzfUCVrGAuu962Z1TuRayD4kCzxLpSMCTK9H7wqFWcPgVJBNvq+3iiYZFcNKHSd/pOD6hYNgcmNz7Jzxe0erab0aYyj92edmWO63AyuWEkg9wwAxgGC5/2e5DkRjIX/psoS7TfXGwUgNe5huubjXtwVOqwTpr+HU1n9AMQ+A5KgV0n0sSWHJTLR8azM71/a6591fBiEpIT07w6ee+68xuIG8cBd7ERikY7JqYCGKI1O3K2VQQk6oFat9WNmMKs7/keY2G0NPK9n0rwDFAwIPCt9e+J4cuUlpvho59xxrk4pzkjC9kIds1PEjBz03+IvUKswJOkXykT9XvupUhGtkxmnflZSS1x+He9C2NOpPQqfDAGdzWE5L1AEg7o+Tb6FqyPVQ2YT8xBVMhc7G+fXBQ69Wi+HIfAtXrlGFyuNeUxrWmeK4TaDv7PcflJ1WYImW+XhfJaki9Ja2WTspNQqH7EY0bvIdWVQnHRJUQ0/uQVDF00sGo7364CTlnKKyWBFzBF96C052NkjArWvV2pVQYY+aYctwZ8x8ifyDBDqDVP78lnCbGAvvdSqENzRA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(346002)(39860400002)(376002)(136003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(1076003)(2616005)(26005)(6512007)(956004)(40480700001)(81166007)(36756003)(86362001)(82740400003)(356005)(2906002)(70206006)(83380400001)(478600001)(6486002)(8936002)(6506007)(4326008)(9316004)(336012)(36860700001)(36736006)(47076005)(6666004)(107886003)(8676002)(316002)(5660300002)(41300700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:12.4661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e09ac83-0ace-4b71-d333-08dbdac5406e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB5919
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

