Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D530C80C124
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:08:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YBh98Ck6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWWl2Q42z3vdV
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:08:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=YBh98Ck6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::617; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJC4KLwz3bYQ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auTMEsOxAb6vI7U5Qu4mXwjooYMckvOX6C5oLBP2SPglA6VOzWLUGDSFxGKQIUBaJVCLz3LmmEPDeVRlIO+QNz3PT73JSICNTy98qsWHI/2VpblkM8XZpg033Jglf3mmdq/NcPL9r4Sj/URHha+hoEw6lcoKa7bdbtWsC2gxlIo7gzG1tVKc9Y4MHEQZOIfXZ0Gifxv/7MN6nVaTiFoL6kstnV4VkHqTNK6ErGbuhO9DtUYt7t1imhFkswk3omf+N7SjNy7yHzlLhkvZtUEtyJs/yraVeP/fk33K2EWEfooKzMJl0eO9EFdjbD9R8KkEJT+yUy86W+QxvsBA4EGIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=Q/OlQuif1oi2tGddDZzP9wnyfnQzMgF6Tx43V2aJNOYSkomHhuh2B5EsosFxaalg0rG44KGKeSLE+tjV4CHJvtQF2OI1qSVG67MZKpx3eZR7wtI4pIQPBt8JBRCG6u5OPWW+Z62ziTMoD/TH+JElDcCxlB1BveD2yhho8y53NnR1y+D0P2OmxUXdO7ELePEP9Nphtxh3/AsM102TzDUq7L9fvq9iwcJb5pylmtv8VojtTQBIrCGMtnGr68+2yJ07kKYiwMwETW6W2MYhg4tj8TYGeOstYLZSeUedo3od9h2B0K3/Mgac4BfgL4iW+iey1uga0FXP1z2+94tYq/e/FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83g37U5JYMWUOI9fyNbhOqOvY47pyGOSPX4Hsoy3xvA=;
 b=YBh98Ck6NjtXDSYc74ahEij+sfjlpzsQz//muLhDEqaUiJpdsPa3rnFMQn/25gemwT6NfhGfG9VvSAxgLXuNfAPcpWkfHanO51u4jBYX9j6qfg2tcbUuVFxw0kZDuxM7TvFEVAS1CxlzvuHqTKDWJvUHAs9nFeXAS2YrmsnLMnFUu9t1pzD4q/pUb8UBjyTiG/znLHPFNm00dyMvPmLaWlafcnKrUlosIWjVcocpqFNmydhIBHWrXU1296nbtT3/ufglKKeWzdZR1gSWr2xLXb04WPlULaHsEaCY13cGycVvPoCKJvCiF0iqH7W0X2od+nx/xwku3Jr+l/lRIuiWMA==
Received: from SG2PR06CA0246.apcprd06.prod.outlook.com (2603:1096:4:ac::30) by
 SEZPR04MB6456.apcprd04.prod.outlook.com (2603:1096:101:9e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.25; Mon, 11 Dec 2023 05:57:57 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::cc) by SG2PR06CA0246.outlook.office365.com
 (2603:1096:4:ac::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:57 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 09/14] ARM: dts: aspeed: yosemite4: Revise i2c14 and i2c15 schematic change
Date: Mon, 11 Dec 2023 13:57:33 +0800
Message-Id: <20231211055738.215773-10-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB6456:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bcf120b8-7f2a-4c2e-8ea0-08dbfa0e1ff4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wI1BBi3nl2OnTjMcvfCzjCgiH5NMQ+wOqxVsoGNtEzeTlIHVaQxJX2tFLxlwQyMc1G6YThw0C2/4uPW8XfKh6a1VnLZ7gScjuZAbRy4pUlSmv/6Z+b/j8g5pt0dPlR+YKobWsT9TIQEEh5hRcv/SqotMt6jJCMvxEay+FPLUHcIzhPdCm9V7WpyayVrLWrAu+k7hXf+hiSAyyE6y4qTes0aNk7Sd4MffUBPhsLaiOctuUsb9NszlRSa8gA7N15EA6UyHK+SD/QkkCUFIqY7PgGdL0F0Gj3SWiExD86qpBDbY4mpDGGh9TvsRsii+4BsN12LGam5xsGH/Cr7n+tjnm6WSxE04kpTzzMUIn01gTtSQWwwqtT0s/yy3tmeyAPFzfUQXIUvF+Qk8EkG7zpz6S1Qv+9Q/0/S4qpI37n0MGSWLlWSSRs53D9yZ17VFYW2/yzwD/9QtFqEfYQ5hKB/niVLgUtdMU+iYReGuyECtArS95ifeuj+hfXcuPT4lviPDk4hnKYpOGCUZUizS4y8weWChkq9Wg9gEfM1eDno27Jmo2JSL7gmac+wt76P1VOud0R0vm6CSGduq0aaNJGXXzoGbN5Ia9YXt6mzSZkAOXCi2IU3DJyhH4UIdQ6xuFppfL6d2+gDajaYVNYkY09cDqoYTuOcT+NzoIHpLKZOcHgvqLzj7P2JscFEwUs3mRblueRQ9Aoh4R81AJFrao7V76A==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(36840700001)(46966006)(47076005)(6506007)(86362001)(36860700001)(40480700001)(26005)(83380400001)(336012)(356005)(81166007)(82740400003)(2906002)(6666004)(9316004)(5660300002)(2616005)(1076003)(956004)(107886003)(6512007)(4326008)(8936002)(8676002)(36756003)(41300700001)(316002)(478600001)(70206006)(70586007)(36736006)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:57.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf120b8-7f2a-4c2e-8ea0-08dbfa0e1ff4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6456
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

