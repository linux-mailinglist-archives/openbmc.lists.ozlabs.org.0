Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56A47DDF87
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:36:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iXYgkS9W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3MB49Lfz3bt2
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:36:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iXYgkS9W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::603; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BL3Pxpz3cRc
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHxW4/9feAU/63YCksMCvTIPdCaD4OD63Ok9hF8jt4zPOHdSXRRu9nfkrpHvJ0w/DOe1CPyC9Vyw2XnnVtKeQRetwvuicjEx7iigeWIOw+h5eIsZpd96xeo82gW8I5QNxtO0sYJ7suZ1X8rlx2NGmdmvYoroZTRZmyNpUf3Fk2b1vW0ettmd7HIQOgEuglK8M/14XB4MXK6/XTQbxn+MyrygSpX7nZpZ9zrA3KmuQ4vQKOeW4d719pC4svefgyi4tijSR61Df4eMl4CmoLivm8EGTj6RzyPZdiOlk5S9Q7R9Iy1rvoY1aO6C5T+DB5SKwA0OkeD+IiInBoMZtfuhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=X9hJ3+Cvx3F+/WxjIAwDHakA0/nU1K0Ezd4Is55DK0E6YKqUZ/mJYGyPY/ypLCTL/tyDqKrYkDfA+RQIW3D77szo3VGEYSXPbYgoaI5xGqA5h0U6hfPoujMinRg3oZ7BXJN7RdYdxx91s83CSPXzEbMWtCbE+G1umC4N2OOfAnAST2Va1jFjPXwGHux9kAHKCD1GzbhvCV0U9Q2ziYsBSc31SMMYvbT0y0AcL0b45kcV3Ur72NDJRxML4VCTwswgWCCX8untH1Xvt49jOW9HPJpITe2pzNYrt1TLPCv9pZpjCfi93DPMGn8JDvEd0aS57mf58sY5T6fYZ3Fy8HOYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=iXYgkS9WM8CDdt3Sf3bU4CXUFE6222OLjCXC4Pz6qv15X9oWYRoDm53SLHxdDkvgOVCDddwuonO2+M5Aw6egbOAagQUiUisWp03FM7VdgN+2GbFaecmklwE1S2BEWKnSEOnyo4U86G955Z9j1lSwjlEWwHN7fvOofYXxUIwyfV9hdTHpGbyscS8W49ZHCmAEI4VXEjkeVxy4GYswrswQ0pDTx73/D6MQRo83M2dPBPHDkQgZZ39rS5AUlqd6ass/FgZmWVvR35t8TPZ11dSENiazoCcFBPPuT1GyJnZZbHY2vfELj4UTmv1HFcs5UDkVUQmQfhqULNW+nWPvULEqaA==
Received: from SG2PR04CA0182.apcprd04.prod.outlook.com (2603:1096:4:14::20) by
 KL1PR0401MB6305.apcprd04.prod.outlook.com (2603:1096:820:9e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.25; Wed, 1 Nov
 2023 10:28:08 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::c7) by SG2PR04CA0182.outlook.office365.com
 (2603:1096:4:14::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:08
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 07/11] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Wed,  1 Nov 2023 18:27:34 +0800
Message-Id: <20231101102751.2538864-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|KL1PR0401MB6305:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8b7e61d2-4cd7-479b-b66c-08dbdac53dc9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WFrxCtq5ZYHbqYhWH056BqbgA0x9S+7kczke239XuCANG4+/Owd1q4YdMH+NExheZxUu+nDlAS1+r3O2AcuYOrjDwVkZRQKIra0mvKMm6BFWCfFr2bmCL1X+psv3dGHJfp/BKD07CWosPTdv6Ss5hR3ohLw7846CUIVsYcA5iR0943rGw8OtPvW8sa8Xte0Wk/PaMHZLccGFQnNcVK15dgwmKsF/d/JNLPSfPI66nIR83VaMs0XOI+Ttig2HWXAW+JC0w4HjSjKLonWIWmH7wkkenHgsiNFtRxmi3PCw5IfCItJM1O4Gq9+a0nHBElWWQb6JaQysetOUQFyr+mb6SC/PUeLVT8nLcHmm3x8zIADSs6NgU7m3L0I0BnuFkTJ/zkzvS2C3Wwhev145AATghoxPVsMtXkg9EXzRLMf01uJYypcDtixyD3uVoayI5enZPCNt/53/EpA882HfJLa8Hre0+1XhWLPHxhVamFT7uM//XBrB4RnTN8a2VvADpMajTNnk0pUm2P8US7VmDS5nLkPf/Ipx6bKgQ6E/scqnRGgANkUH7vU++aRynhtooi6IJwZr0CcbmNDjd8oNswlCxEHW0SGImRLlsbBZEXp7UjB53UKBaqPxSw8xNW6juaDWO87qMrrYtt8ZP6XgDh57dPg6B/h4oOsYoAlp4uUe+q26nbpXB4/U/rA7J+QOZpPzJJhePWcDo1KWoLjcuxRutg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(136003)(376002)(346002)(396003)(64100799003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(9316004)(2906002)(5660300002)(41300700001)(86362001)(8676002)(4326008)(8936002)(36756003)(40480700001)(107886003)(1076003)(316002)(70206006)(83380400001)(356005)(70586007)(81166007)(36736006)(47076005)(82740400003)(36860700001)(2616005)(336012)(956004)(6512007)(478600001)(6666004)(26005)(6486002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:08.0286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7e61d2-4cd7-479b-b66c-08dbdac53dc9
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6305
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

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7fe80ad271aa..7f0134fcee57 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1

