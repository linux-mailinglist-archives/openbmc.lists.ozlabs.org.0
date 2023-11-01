Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B157DDF96
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:40:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=htX7WHLh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3SP2jSXz3d9B
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:40:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=htX7WHLh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BT3fcvz3cT3
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSYrdahJkmlhubng9IhdOcV4XcsrbUzhp6nQofiOIHy8H5aPTelXoQtKhh3TLBdqJe2VXHEQwjvN60VCTnlD/ZlNp1QYwHQPpry8EvPjswj9VDQmht2ybw/oJRIV5lcOOlF8I9b6zrE4bugFw5nsiazJ8UcW0ehfteZc5jZ3cAaLJpbFo+EKp0Ikqcy2bkDq7bpbvRb5A4KbKFja2wXE1od4I1puap2N9DhhbPec8a4noMt2AAo7bybUKGRpQvNEs2wgetYYnQAT7yc4xj61PobR2X14QKVcbz46vJMnZUAeBInpc2brnSE/hhVNLhkBIzBCVKnsSDeGTvLkGOqXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=JR3DwhofZ+cbuT+JeYpojLVD7mO+z6/tym8olFEFXbGPdW12WkSTVJayGuS0NT/Du3J13+mv+U+0/UKun1CZFNXo3Ncuq+KlHKM6MsMMjLjgH5J0JuYxREf0AVhezu3gC/TBNQg0r6Y9ciLkFcgoF+ZZpFPdJsx5l8fQvP08UIblicJuKk0LW14xXQRHn8GtZwycLApqSSmqKWQSBvniEw15RVXm0VNAUGx9+bvxfTHnYyLy7HZASn3cqKv+qAYQWi0CydShv4JFpmmnWqKh1mXzlP7qhm+hnVNdWsr6YbWY3uPQhvZyCePAZmsoMyMFY+54ZE+PfITmgwtMalhBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=htX7WHLhRgD4tmpB0PBQfKmK/msEM2/WCOvFL3Y53tconG72Tg7qLSWDm8RIMG9zcSeTHtNsJ8j3VMKcc6qJgIXZVib9ylMQGETXinSPVnHFJzCjXod9L3QRn1FVOZOOt16cc8hgQQcDD5dih9HmmDAL5Av7IqrWXcTbQLANlj0Xv03s8hAFaCxtcp830pr3vnDdBc2uW702KeBx2VKd/b0Pohr6LYaVl8GiReS+OT65QJql3PisrGTIRmlvpNkhflqNUuSfVFSzmMU/5PGZQniG2GqtBmh0JNO9NkxhDsBQivNSwxKAgdho1/wqSofFriO0TTP73b7iKsbVGN+jWA==
Received: from SG2PR04CA0186.apcprd04.prod.outlook.com (2603:1096:4:14::24) by
 TYZPR04MB6087.apcprd04.prod.outlook.com (2603:1096:400:25d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 10:28:28 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::6) by SG2PR04CA0186.outlook.office365.com
 (2603:1096:4:14::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:27
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 06/10] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Wed,  1 Nov 2023 18:27:45 +0800
Message-Id: <20231101102751.2538864-20-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYZPR04MB6087:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7989a19b-1100-4a6d-f4ec-08dbdac5498c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vacu+h5ZeTmiG7elrlme4T+91gH/4VbMB8ezBL1rv2vSLvP1SuYdSzv1bL+pXPEHXEsab+R+gsA1wCjwTg6ZhvUOiIJbYaG+wUXbOmUXBW8jPi56OQHor1Jew85Mno/yYP+4N/9/Fu0+Dk3S9wODEOhVOgajn2BdsPy/VHZjZ+dQc4rh4kbtyWVVyjjhr5s8T+9ASjRNPQT6M+MYFTshd10LWeEQmvbGtwrW2r1nBxQB8pxyV7Skju4wz6Wai10HHyK79QsMHYVeOGfRom5Sfn1Q+8mQo5ToG0KPtPiKkqwVWWngCsfSKEpOsYmcbUyPkBuKOi6d3G3WCw3qIAq1XfobuLxAPRArwQpH14yQP87i0c/csAptZZjeeK8elJLUsU4COsKWpvYyfbAyML9hXNx2FML1iEQczAQ2JATetmB4FEndcyeog7X/YP7s4bptitBKs826cmJTI51HszKWON+zi7oyfD++jEdcnb38FuaDlVRkxlzlnVbQ+P/d/itqLKaMYJ/UsI1Wm6PmbFIjXWKjnu4NC5fOS9iWp2eiZ31cLJzw24oAiZx7Pbv2Q0bNIFjoJnqcvguxJF9bVr/9kZnhSTBM0JGehhd985jgWZxcOEPqUsJeQlNVQT8n8sTbDXAIlPSLP91LZgsMzxzsrbEAqnXyhNIwYT62iFI8ZuYc2uuIQ5w4Y2Vaih2+SgjC26pcU1uItioBkkt3PQ32rw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(346002)(376002)(396003)(136003)(186009)(82310400011)(64100799003)(1800799009)(451199024)(36840700001)(46966006)(26005)(6512007)(1076003)(107886003)(356005)(2616005)(82740400003)(86362001)(36756003)(40480700001)(81166007)(956004)(336012)(83380400001)(2906002)(36860700001)(6506007)(47076005)(478600001)(6666004)(8936002)(9316004)(6486002)(36736006)(8676002)(4326008)(316002)(41300700001)(70206006)(5660300002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:27.7631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7989a19b-1100-4a6d-f4ec-08dbdac5498c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6087
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

