Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 136A080C11B
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:04:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=klq/3qf0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWRJ3wFvz3vqL
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:04:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=klq/3qf0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::607; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJ56NQmz30hQ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SjAZtWMfpySM5DWXRJDmL5SkNXj6lvZLJ67B4rdOXRTtPn8+btsNc/6CMiVSZOG5V757TBXn/caX7L9mnnLdsmDdOePc97r7wquU9mjhu3LwybKjMYRAoxaqFQHopXvlgC046U6p/iKjELhEjRZYp9W+cYIPYAB5cR6hGcG9hYy+OyPGvhFHcVo550zydp237UU1Wy6qCoMIqv3KD0on4FGssPwGA2ybkijDHsew+KRd+gf4fzcm8FsQVuhaUOmqYs3tDcjfKvgd7ewwlMm0DZOmCEjHgTfjuk7VYpK45p/KCqFEfqBDcih8iYRan7iUqYSdCUEbAnbCKnkusekpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMd6HYaAsmF5z7kcGL9OkN6HPkOFiqEArjYVw3SCJWM=;
 b=BzHKzD3HMmOLnHW2AWQlCm4cW83ar7SK0KUv3stXM9JmlBo2LO+biXyN+SrrwJDqP8CP/Ubn+kzKzF+FVPa/kBaC9mkgu4HQa5fDxv/bMQCUV1lakZTxkTQpoitHcjy/T02fLdJgjScXJ0poei4+/e8RD/xfKLdVmP9vXZNMN8A3p013MXjtGAQmuPlUq7CGQYDty+jMuqh4KzePqkiR6Vct5mH7Ve77w+qlIuy5NN1YqdWHXy5K4g98yi4gpIPVOmO+ibMJ79i9WyUdtBMQ5vxxtSL8oJfqX3XOfC/JWF36ZDGi173Tl7ppvhBtnrFW6s5/b8sY51jU0YmcHbT9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMd6HYaAsmF5z7kcGL9OkN6HPkOFiqEArjYVw3SCJWM=;
 b=klq/3qf0mk5a3GWKAVC7RmvktIyJesCpTIYedHEqIXPfWq6xk/8SvDxDNFca3GpC9mGyCoTB/2p0rO+9KvaROr9tMWlYOFoNKDcqOgb7yOwuDekBpqwWdR3qlbghfCFdE2eJ1KcMgcaGuzAx4vrLkgun4PtWFPAxZRZMxcAGYxPYocXhOPL/NAuJfczWK/UC8UsTCocalbZKEFx2Izdj3zhOhixkbnuH+2WP0k4pt6NnYmK9wgrSeoMg78bMi9jgugWcx8oeZ5IArELvDinzCYN3ssAP0nbDeKktytsa9/kByfI4LbqIJLqdXujwUqOOgs/Clt9k5762grOfKChYJg==
Received: from SG2PR06CA0233.apcprd06.prod.outlook.com (2603:1096:4:ac::17) by
 TY0PR04MB7373.apcprd04.prod.outlook.com (2603:1096:405:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:57:54 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::b7) by SG2PR06CA0233.outlook.office365.com
 (2603:1096:4:ac::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:53 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 07/14] ARM: dts: aspeed: yosemite4: Add gpio pca9506
Date: Mon, 11 Dec 2023 13:57:31 +0800
Message-Id: <20231211055738.215773-8-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TY0PR04MB7373:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1c4a27af-1ac0-4d47-a52f-08dbfa0e1de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gV9HNElpqsOppFD7n/eGUlBfVonCc9U1spm/T+e3FI7ZScGc6V5vyuq1ArttmmUad4lpz8PLZgWM9ygY0Lh16N2de+ptDPOudQOII0ELnR/xRjN+99lKCeen07duJd+ZpUiRr0dSSq/02hyGiOwj364KVjin/HX2ALwDhcyX+FNpIV1GeZEV+5pyty3T7LyjwUkIIMNdwsXvkvAVweq4YcF7SEBfytx1pA4lQ7xptOXnTUIwpJGPw6vYZ6WVBKk9nhrBpxRp+T7cUebQmViAbXfLrxYWOPUvAZhDPWJIAiiEiD1NUsRzuBAO9VmflQGot4pAq4pgws3s1vZp4S2A5sUZY8KFjgPCWGtbdmCMq7wY2zkiytC8cUKub9fIya9IilLrGndpAkgu6phuGJpp3aBIUge3NfWQL/+RHduEX0buypWwUIIpi9IinxiUPITKdU40Q4Zyuiplw3YYklKti7Tc8PO182GDpxeysnh8qC+bNWsQBRbIaItPV3dOtDLdeXglcq8VNTLyO2Mc6XpC/ym4gwMFMryJ41ObvDkxNFWDD1DBIqVaVnbmcUX/ISRs4XMZZ8R3OMXES5ZJVii47h5ZbIzz9XLN8N2w90oBhXnxLj6s4DuTzlVTQ6+GF10WfeJ2i8PiqyPTohcaqkcvuZxAD5Pv7R96ggj+/JUdyDwfZTxjmzoP98dLQCFdIK4d5QkiQCoZXs2eajITfwMXKw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(396003)(39850400004)(346002)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(46966006)(36840700001)(41300700001)(5660300002)(2906002)(9316004)(6512007)(6506007)(107886003)(956004)(2616005)(1076003)(6666004)(36756003)(478600001)(6486002)(36860700001)(47076005)(81166007)(82740400003)(356005)(336012)(40480700001)(26005)(8936002)(8676002)(4326008)(86362001)(316002)(36736006)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:53.8163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4a27af-1ac0-4d47-a52f-08dbfa0e1de5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB7373
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

Add gpio pca9506 I/O expander for yv4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 251 ++++++++++++++++++
 1 file changed, 251 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 7f0134fcee57..da413325ce30 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -175,6 +175,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -193,6 +221,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -211,6 +267,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -229,6 +313,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -247,6 +359,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -265,6 +405,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -283,6 +451,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -301,6 +497,34 @@ mctp@10 {
 		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
 	};
 
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
 	power-sensor@40 {
 		compatible = "adi,adm1281";
 		reg = <0x40>;
@@ -683,6 +907,33 @@ rtc@6f {
 &i2c13 {
 	status = "okay";
 	bus-frequency = <400000>;
+	gpio@20 {
+		compatible = "nxp,pca9506";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@21 {
+		compatible = "nxp,pca9506";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@22 {
+		compatible = "nxp,pca9506";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	gpio@23 {
+		compatible = "nxp,pca9506";
+		reg = <0x23>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &i2c14 {
-- 
2.25.1

