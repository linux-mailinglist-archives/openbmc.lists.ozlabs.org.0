Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BA7DDF86
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:35:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=g2nuKSHP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3L65hyTz2xm6
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:35:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=g2nuKSHP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BK2GhRz3bwL
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLlCDzRjKUS/Pzt/nujIMSwcEIxk/2kMB3iNOrq7aq85TK8T0eVCT0YFSDcFYCfCwZFgo23X74hb4IKKLQ8xzXCG07PE7n7lKw+NTItCHblchq6fVl94HsDgyDXOVywE5PSxy06nLIgBVUswnCcwKy7hNWaJEKKoBblYJ50A5dKjHlykX+PB/R4Eg2QuBtPqD4YDpJ3vvA2sgohNuOxDYLVjwgFXm8TDsG4Jf4gCTcpxjpObqKrIfKvTwOFhkJjtUH2Ud3gZSqjDA46l1vm3Z98o5xqZuCRjw8TxicCJw+5xZrYhzqxw5XOLg8+Wu0t7Nz9cPqgd9bxie0hWhR02GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=O6Q8wgv6Y2tTI5iUbWdF3k7jQmw9WkBI6JeqgwslUbVdBUpUUFLluqWSmM7NGN+6cIAvedTlsyABpqSMVymLaquEJGJ75fr6nDfDU6PapAEIqEVLWJjKf2RUVGwvPg4tX4Q7pfnu0IVam09Ds8AWE0AX7wUdRLfgKlzM+4Tuz2fcGnEbYdEUS9o10yh+2J8GaqhMao3T2UyMQ+Uz2C8/4YtutFZqIuZxaEnlQNk41fmn6r3zm3MzUKbCYzR5ojSjFnxmLfhlfG3sf3BO7V2udp9bMgEee80DxZ6JtuaTuw9z8P23C75H2xmFnJPzDT1YayygBvB5pI2ts/GwViORYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=g2nuKSHPLCQcd96IlgFNgC9gP7nR9Ow2urPN55BtO23MgS2msBQfJy6QWp6zYO7L54Cew9h8k88r8kcLpzCwiUvJDy+PtV0i+9grw7ciry2s0KAa1doJDzOvzDQBow+XpEdd9RCvSoB6LTs5zHDgHXs+cYq7T0tbtxK9P2wSo2Z64Xyn8NCo4j53EX6B59QV3yv9TtIrmnI2CyX9P2IjeeqR4adMPq8CcavRfZPKNB5vISr3zBhqTYcBTwji+Lh3oUQ8ymAxSR2rzfkIeAFgbprX4V4GvLdyg46Yqomjsc46F4vIjIkuXyuGeO0jnMIjICDYzNsakFd/6g6X1fHy/Q==
Received: from SG2PR04CA0198.apcprd04.prod.outlook.com (2603:1096:4:14::36) by
 TY0PR04MB7376.apcprd04.prod.outlook.com (2603:1096:405:19::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 10:28:05 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::b8) by SG2PR04CA0198.outlook.office365.com
 (2603:1096:4:14::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:05
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 06/10] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Wed,  1 Nov 2023 18:27:32 +0800
Message-Id: <20231101102751.2538864-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY0PR04MB7376:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 19adc1ca-ae81-443d-4047-08dbdac53c0e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kqWULIkHxJElts9BS+Zd7ZD7qMp30pnaN27HGaXK4PX7WHQX8q/uc7QdYAC/JXjgRUezAvGS3lQsvo+UAxXNH28zeRHcgu3OYvU7U7zuvbiTABfSMD24wNaDJYtB4hcSi+jZ1mRY0x6aDyFaMavlhZHGOlQusUyDN4RjI2FMhPnvEm759vstLxZPC193K6X3BYIJkYB4cdopzr+dO0bHOVsYWYOgH264ypHFO06xVxW6TL3cPjQ8QHor/Q8jkEMF+bgWzl7Jsy/7fZRSVWMrqbSng5hEFHddEdc0EkeGN+KGdVOpVId6a6K5FBfSy/s++9iM2yEWHxHYCp12Rkl2hnwe1oHBq93Fl6YpW2u/xTcIW8V6KY1ngRaAps9wjS/4o1VmPmwWlZ96M31T5s2Cmc4KWwivgwDxW7O6O/hY9d8c6HNmV2XX7CXb4qMPZqkUM5PABmVy9j9cpMDaSm6MiQvcz7gMQfl8cd3ZzOoTn5Tg2FU86tIKLMd5cpqpo+HXLKTMGqyHpS7ms2J2OWW1xdGx6Fck9Thg9cw9wS6tx2c8g1BGVKBRI7F8x45nSOLjn81d7kBvSzXUu26LZm9vQziU+0FZlqaGKpdwInogVT0GI0DDQskhIVlwDE+24e/zDUyX2sItAquMm+1I4PFSLjyU6rz1pKUlBYtGCx0uOHmpJC3UvLqR5VJZFw4qx4jDLlf+nFXpnNkfBeUM3uuF9w==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(46966006)(70586007)(40480700001)(36736006)(70206006)(26005)(956004)(2616005)(316002)(2906002)(83380400001)(4326008)(1076003)(8676002)(8936002)(5660300002)(36756003)(41300700001)(81166007)(356005)(47076005)(86362001)(36860700001)(82740400003)(107886003)(336012)(6512007)(9316004)(6506007)(6486002)(478600001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:05.1224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19adc1ca-ae81-443d-4047-08dbdac53c0e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB7376
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

