Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA767DDFB9
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:48:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RFhupOZf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3dn11B0z3cSS
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:48:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=RFhupOZf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61e; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Br10MVz3cPS
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:51 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfAIUsutguzMY155HLAaMIEcvsO+YiFjprSii2zT+BE9ZYrox9YwXdd5jNutiXMwaSX+hlcZUfv761nj1kh/d9QRLlMUxcj29bsJfrw0yDyCN48bQs5klvHOvLssIhXLOSJI8gSZEg6rmfLfHy5a+/qGO/uku3p4vhP+BJDmEk628ZsKT3SDLZBXVSxN0OhHtVMjgGQvovHX3cbNkKrxHK+Kvg7qMg1PiQX+CwYQxheY/0//CD5x/ylZia8INZJAoiXTyDLrLtXVWfWa9T1vzvaT8Rta0B2EW7ySc8kHkc9krn0cNqBb156YhNBZgAbNyQay7wNzvXWpCaEjMpPBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=SQgHG7/RD6VQ7i4rPZL7E7Dew/+7tYyHbIx9aVZ0Fgz2XbvltfQ8aacjAJ99QMhRK7KpEJsBCdawxMtOGKgccuwa3SRxumasuxGmWDUkSnAcEv1q2Yg7jWumtDfLajFfYAq5kKgcMF6LylVSJ/087NBE1EFRjNJWhSFglcCXuZ2jAwOYzaP7Jz2pzjr4QsADb4paYWpw/ZCaj4rMtc08iBifhxZMEXXdNpUQ2YCfG8Z5EedWpctb+MAdRKEyginXEpbtq8L/3i/3uacLnp7aecJlKJOImq1sDf3/ty+aqSEQy6CFUjAOvAVX0ztui4cV0XRMB7PscaltHQLdOJz1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=RFhupOZfoZRTbjRLX3TLUzKEw3gtxxp7ocMi01vYgCsXz8FEflP5ET4Vidjwv2cBHCqjt2zBqNMjRzkN42SLFIefbfAhLVrUIi8U74y7Cxyrm2f3VMAKHCRUZztJ4Szw+LYC5eSmknluEW7dR6r+n0fHtFOpHE4h8KmzUvfvpLz4gyuwFSHyBKLr/m7rDjxCtITC+wtLqEF+OH0F1bmBTIifzbCLh+wTyhLZ41sAaYqnHkaENNCApxaPL6LoNhILiq2Oc+qHnfE/GXMmADfuv2EZiUhaI0NVyOlvJkJg3O6uCFMmRLz79ZTqy14K0ZzOn02rmWLzvIGbBotcYrN+JA==
Received: from SG2PR04CA0186.apcprd04.prod.outlook.com (2603:1096:4:14::24) by
 TY0PR04MB6376.apcprd04.prod.outlook.com (2603:1096:400:32f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 10:28:32 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::6c) by SG2PR04CA0186.outlook.office365.com
 (2603:1096:4:14::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:31
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 07/11] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Wed,  1 Nov 2023 18:27:47 +0800
Message-Id: <20231101102751.2538864-22-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY0PR04MB6376:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 47d05742-fa8b-43c0-514b-08dbdac54bd0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8Ap5D+FC/ScduFaYaiTOaaOvHgRa1iRyJYDGrBG7kL58R0VXGudqugotz5AGehMwFlF7L2Nc/SJpcoonl7GMoxTi8ph6eUPZ8B76tUTA5ZfHi1CbHKGPtQayBCbmQhyc4ja2x0NSnFTCYTsVOpBtn35bPgiLglq1Yo4hDlJdan6Q7VQvNQPp8n33mBpKTbBCfGxSY43TcYNBNKQ0DaRIZ1/Awyxr/TlCHCuVQhJPrOfBGcnkbHx9cRAKKW1vqa7X15Jsr7ogUQlOZRUmIjsmDB/+CfYaDTopNxS7jLLX/PWD0mrZFJRLOiKHTXUFZGFhlqXgZCcJYx9I6gHCztv/xvbZAwYnwvfMQWdmnWJQMA39d3XfA1vVh/oV1ZGngTHuRLf/MIv1E14QOAvE/d/epuVsbfOzrKGPN0XSYU1kf7kNVd1qnVY3p8e1/Ad15dvVOhWaWd9GSwVs0bSQyroYL175OxyLSOGG+oU3j0GdKTm+FL50I3VCD5MIdJcxDrbYpU2yiyax0vctyI5tjNiqBU4oMiLv5YXovHbbIuMlmLA5ys+pGsMi7+3vsnRG/RsrXKXrER285LQr+GjqnQINTOSJIcRxm/moIQi35lqTqusBA6MCo/VshCh0MXfSvdvBahaSCFp6WSC8AK6Np8cmyVQfOpjawzM+34KuX+qkl79kN75PmQsUjieJoWzqPtEbHDpqjoEiMjop1jlVTnX96g==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(346002)(39860400002)(376002)(136003)(1800799009)(451199024)(64100799003)(82310400011)(186009)(46966006)(36840700001)(1076003)(2616005)(26005)(6512007)(956004)(40480700001)(81166007)(36756003)(86362001)(82740400003)(356005)(2906002)(70206006)(83380400001)(478600001)(6486002)(8936002)(6506007)(4326008)(9316004)(336012)(36860700001)(36736006)(47076005)(6666004)(107886003)(8676002)(316002)(5660300002)(41300700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:31.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d05742-fa8b-43c0-514b-08dbdac54bd0
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6376
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

