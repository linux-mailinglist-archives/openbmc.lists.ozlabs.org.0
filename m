Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBED80C120
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:05:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=m4HwVmdX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWSJ4FV4z3vv6
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:05:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=m4HwVmdX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::624; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20624.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJ56lkJz3bvX
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Do2IHUhmeWpP7Ub2Fo8AW7wKVAm0vspDok1oOYJwXcK0J92Gt4vXuyGZtYUNcBpuxEKRLQ2GDXyegTRWReQ9ta3pLiFCUWmpz8vKFNbcufjDm928LWR0xoo0RIDx4KIHnT0K3yXBBayKH2ljYuRK24v3PFFxgOcBRE4eYJja5PgSsHRRbrQ62N3pUe8q8UoBOgMj7BGiYwxYXoaQpxG1y5j4dxOJ+G+PzyHvJJMY9RD1ju/VpV87kTrPrrnmLHQNqo3DkxwR/JW6fYHMHxpbwMhXsIcMQ3eRvo8IDHRUuM0ZC1A0MjatnzALFzw7dfpvE1X9ij1QgeTKwCXffthuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=VoEtGYnq5hBG+HpTC4Y+oOx7OB3J5vHVOOgPrEcPxbNnUU2FBvhIz6FbolMBZEH40s2K0wGjhhDHoEBLY5e+5GHw/ofPxvHIvA+zXolyi6mS+HxdDvxETnsDKwzP7fdJuSOg84gNVgz7X7l/lkX03g+Zzh2T4xvF2QR9T2hPdB8k/+7mJoY46SLTkPo9ZXFQQpKULdk6BLElIgztSBVUUAkwkqLiGkw8ASSn65c7wTC87WZaqULQsiAKeCPRoGcITGUNxHYkokk4O9XhHl3UV3d0DE/q3diAn3I/TmRSCl3/acUitHfZUBD0L1z4keXtHImy+BURJwC55RNke89tnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S68zvDbwuc+EpYmRfn5ns/lT6xUCcZUwkslYayui3bY=;
 b=m4HwVmdXa4OEvI00ZwMdTlTKdd+gZk6Y0H+KGIUwBUnNkuVZ2IZ/Nd7fFL9vNZk9NYhb91J7TqKhbV5h425EUduEEoUTyyIyuuA5aivM3NEY5T2YcFpqrtHQUG3vLQL9mILS7H5l8+nBTYbWSZ1z9yCYCIOiRZkGVWYk//kUDcPcetKygA1+J84ir+8/6W5tSvBYsGhgb7ysTcOflTk6w9NTaa9BjFrC72EcTHn4kZDzld5lMzsodGP2TG7mE8p4GOtok8oGdlF4VecynUqMc+GQPPIzexPYnnqwVTkS16YmTxvZgAAs7W7irlymMRoH/pbdOLf+FsQnkcx9pPcpmw==
Received: from SG2PR06CA0233.apcprd06.prod.outlook.com (2603:1096:4:ac::17) by
 PSAPR04MB4422.apcprd04.prod.outlook.com (2603:1096:301:2b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:57:52 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::b7) by SG2PR06CA0233.outlook.office365.com
 (2603:1096:4:ac::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:52 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 06/14] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Mon, 11 Dec 2023 13:57:30 +0800
Message-Id: <20231211055738.215773-7-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|PSAPR04MB4422:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 19705eec-a81e-40ef-3941-08dbfa0e1cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	J2Qpgl7/8+2Gnoj40W3P9ZDhQWGlIZjOP1xmRp87ftjUrc2pC9jS3e/zgtVD/WtXVTrUBftHrzSY+SMVRNRFnMMmz874R9ck2lJIhhJy3Mjv62sBSC4Xhqs/DgP/6U2oVsAan1BZH6Qn45RC2A2rSAn+4Set2bnPZvuN9ScQBjOIxaE9HoRV2dV9NV/XLCOWtJH44HhBuEp6DIPYe9veVvffR7niK9+KlR+NROGLQqi19lh1arj25HU7ABk9GRsru1ntapx9vF/BclrWrcCwe8jirx9NN3rQVl9zIyMLLYsXQjaBmq1W+JV6RdzxS9mF8nVgXjcmuqxGH7VbclXI26h3qFuqG1MYtiFMtVJH7ftFZ2XUIulef14pOTtAD0KlFiVHR92yo6w0DM+fLexLUZK5umjEhaqhKMyXnG90dNOjbfPMU7UzBZbqHcS++NRuXnzFdAHdKc3j7pjG8896kwwFn3HyOXgBt7ap79Iue3KqAU8l3OUz1f6uHEozueEbEUHklVRQTAR7xLbLNtPo/RyQlTqNTflXfAy2Ul0yacbegtjwUGyFJ/C/k3JeGNYRQd7kdiVFu1GVmEsNa8Qhzl++7BP6dCGUHKDBBFYAwPq5yqNF6FfJa0NqQLo4RPRalIX5G5LEw3WVETZ61HjZmAr/acN/+2KeIthqS+HU/yyx3eWTUNWVF633RIOLKzhLPw4XE12hA867tuwmFZFZhw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(46966006)(36840700001)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(2906002)(4326008)(9316004)(478600001)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:52.2382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19705eec-a81e-40ef-3941-08dbfa0e1cf7
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR04MB4422
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

