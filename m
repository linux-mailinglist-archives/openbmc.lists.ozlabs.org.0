Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EDF80BFDC
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:25:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qCwHfKtj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRvb34Ymz3cWR
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:25:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qCwHfKtj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::62d; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRfy2V83z30g7
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgmD/JLilRLNnAfKKYtkDLBMgrd2+VOcpf2vcZ48UcviE5Bxas1ZTjvWU8t8mTrk2gcdPLitTevjwEJgajgR+SrPL0RPsU1ituvM3TFBlo42HOLFMApaber/J7nWDxg2iei5/hZLKa2sXa28wGeFXw6++IvGvBsnGsm5ohSJ98bVd+sBVjuXLDFpog88GspCuEfLNWRubTWtWCa9yrFZida5yrFcItheI51nSRd92YtZz9SytCdKB3w36/CRVzgmU9EgEc87s+CTDRIFGphRQo4Q8DBnnZFf4f+qn08HAXZH75/5R6HhpfiC5ro1hhUe4Lj3II29PNM2InhRxtf7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGTire1khymAurDE24N2Ga1RZMcRUKvih7zqhbJUcjI=;
 b=MeOWKnbC/eAWU1oSwWWoGs3FxPGOLq/q61kLRSdQMJt1c/ORFOnvpeexXFy3B4bwK3pWcUj6Gk3LOrBzw3sWhMj5X1SWRznJxpNjAJG7qMuYScD+tHWw5yhBbmlS7sBtGysN22pb85XuosqaNmk7FD1v+WLNOkx+JY5Iqmp8CLn2MgWlxfOg1EV91KnpcVaAr1JnSyo3CBh9XqDtBUHpJJk9nUS65+c7BgdI1BPKRaPm9b4khBILhbKaXj7o7SHLcy/xnFFkQcJYet1IaH7D+fG8neya4E6W8+2xrnMhFIXOGX6P7W1I/1qeqCPbIVkRUtLWLL3A0T4s8SMsODAbtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGTire1khymAurDE24N2Ga1RZMcRUKvih7zqhbJUcjI=;
 b=qCwHfKtjllw5TKRieyCX1OHdHZxVJi+6hzofv4/80dBHpNOtr5fXNEePMCr79WQGYkOOZbjXhbD4nEeG0QTaxkTR6+6LdLGedamxCdthCfNQ5XlyXNrvJfqeE2DshqCY1BspENTivnm3T3rFONrWGuyDtGnDtzX67bjfxJjmyQg8FbsVQ4+9vvXT7f742xBgySYnauzo8KImyPwQjDLks5sAKt+A08lG5gF1+O8rNV4euzGhTKR0BVkVUqts2IkWJZDWYqc5D4LwM/pfo3cCeS6eky0wD4T+ThJ0yNV6mChyS1Xk0E4x0Mk73QGMJVMZgR33xEHkbHWhrkwrxd9OlA==
Received: from SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11) by
 KL1PR04MB7769.apcprd04.prod.outlook.com (2603:1096:820:13a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.31; Mon, 11 Dec 2023 03:13:59 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::9f) by SG2P153CA0024.outlook.office365.com
 (2603:1096:4:c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.4 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:58 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 11/14] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Mon, 11 Dec 2023 11:13:34 +0800
Message-Id: <20231211031337.4165619-12-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR04MB7769:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bc031f33-18b5-46af-4561-08dbf9f737b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EC20HrcxoLrVS7d4+cWbZ+kz9Hx7qHTXTEI4uFkwnKUPnH+7JLqhPcRP/8SP+0u4iqngJ4lik0YNuGY7RYncTlTIZwpn8nTWndmjVKXaiw9DXcHxTp/AZ5x41q/iygm8NsWIGxodFHWKAJO6zWNnWsqFCrsenC/YsTVCeNmVCQPMgGI27J27pZNgJcSTZSojzEOOCCU665ui9d3pS5BEG5+g6OnVQWHymf8OmU9eAe3rbTZAyLYgR3H7AgD+8n5OmgJhzn0hAOXSmKyu9If9Opm1HMGEVnSJBhbXlZ0vhP5foDuZPp1JSsZE9TX96HCbd33hqaTWBg7QONHxXUFS5YXGe7F788vEeDkZ4PWfOFiC5MFfjj/uzdAalFidYEkUO34VBS5J2hVbN6ZI3IBJp93XGooR+CNk33TpH3GHjlPDzoXafDedfUJ/ZvGPW5uUVPKzXnKqO9dLN+BVd2eCBc2Hzd9XKwUnyamAdRHXm+2hL90CsJE/EJ1O+63s++mY+oS4I58tm2Y/iJz7PdmX6ntI/6QuBpEOyEXfx5VSVf5jr9LFIaearxFwDikfCrirV31gbVwvQuF6AElI/p9xROxOfGiaWnpgQggyxuA9na7CNDRSCpQEB1T5FtPH4PEtudv9Gto0NOOtbi7B8GUaTIxBhGO9uEw0iC/MfvRP5AQ/5dUJDtVX/x1TVWi1CX30rMh03bpWMJshN7wuA0QcvA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(346002)(39850400004)(396003)(376002)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(46966006)(36840700001)(40480700001)(1076003)(336012)(107886003)(26005)(2616005)(956004)(81166007)(82740400003)(86362001)(356005)(36756003)(47076005)(83380400001)(5660300002)(6512007)(6666004)(6506007)(36860700001)(70206006)(70586007)(6486002)(9316004)(8936002)(8676002)(316002)(36736006)(41300700001)(2906002)(478600001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:58.6625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc031f33-18b5-46af-4561-08dbf9f737b0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7769
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

Revise fan tach config for max31790 driver change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index eb3687bfd632..073f27f1e35f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1095,8 +1095,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1108,8 +1118,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
@@ -1145,8 +1165,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1158,8 +1188,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
-- 
2.25.1

