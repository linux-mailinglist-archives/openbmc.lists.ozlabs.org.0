Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C080C121
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:06:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HHpSrj3C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWTJ16Tpz3brB
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:06:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HHpSrj3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::608; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJ83HrGz30MD
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJNocJGGWJWRJ0BOhOh4ZMNjR5DhDo80gXlYjfu36yrPoBNsf3ZaYkHqF9qJ9is13E8ZeM/McmhTumtRJ6TDq7zdKVzE6o918zZ5lqOkQ+BayfCIV+7uyB5inPZhYPIdVZXxmu1VHgI3sp0Y/Ejas2GrytQ5G6AoPEuUxBCrBXWh1l27sLW5IcV1hf1Ryp6JJiz/APY8+GkG39u/3jm6dwkbZNr2H+GFbezuCrGRqAVHk60qhOwkph6x4S8JrVmxhgQV+Pko3fzGwl+X1VWBQ4U2LmrkXeS9tFzjV+hftqZXo0SI1YZgI82XPuXrXPjZQE9/H6GN+k0dZ+GKYlCMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS46iyiX5VqcZeS2QC5nTFB8RgeTDUaf1C1vb3s+wjU=;
 b=BLmdkFkew+oM560sB3RVU3AYaxtk3EF9sl9BYkYq7tH2L6sOP1w59DCJUi5iYAe5ii/yza+Idma2Z8dOqhINaI5SQO4Ms23b/yGLoIypaiFFJMrC6sSULhIReDTzygl5slhZKlbr8nmqyQ4q6SPGc0sgczgXC7fI5HFTkeftlQwGHy9F9AQ7ChJV206k+LdfQVFfYu28II71BUr48u03qJA/OCpEM6LbDaR7IiIDxuks6tVpT1Qx2lXntvAXV3dFmT+hC3ym2GFqM1kom0pS/JP8Klv8o4XBc0lHB4CuBD7M0JM3qKiQTqyZ+z0TQ+rGSnwydYwtKwy2q0lF2cbWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS46iyiX5VqcZeS2QC5nTFB8RgeTDUaf1C1vb3s+wjU=;
 b=HHpSrj3C0XNyX+OLJpWRgcwjEere9hUxjdWFS3Eyz2ezmhEeIbzQsg0MQzPDd0xayYffw+RjVGSt4iGEOuow2En3QvAXikcL/exCE+b8THxqU3UsKs6LB2aUJdTcmjP+0O2SMmpum2j7YH7Jljz44VVvbiwdfD8TBxVhZA1hYacJXUcR3sz8piobqQHTBaIyOElWaGlC0lV0y80bWeOarOjxVAJ9/IaO9ElanbJ8zwP3YKpMc2vL6F7HMAH57+iLYoOgZcQCrFDsLiQyhOlqs3tiX+71aZaZv0Y/EEYbDAwkMJgzkCZ1EFsYBJ1mjn/z5XhadzpOyNM1NhBAS+hb6A==
Received: from SG2PR06CA0235.apcprd06.prod.outlook.com (2603:1096:4:ac::19) by
 PUZPR04MB6607.apcprd04.prod.outlook.com (2603:1096:301:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:57:56 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::43) by SG2PR06CA0235.outlook.office365.com
 (2603:1096:4:ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:55 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 08/14] ARM: dts: aspeed: yosemite4: Revise i2c11 and i2c12 schematic change
Date: Mon, 11 Dec 2023 13:57:32 +0800
Message-Id: <20231211055738.215773-9-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|PUZPR04MB6607:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a0e2fca3-2b94-495a-993d-08dbfa0e1efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YmktA5BPXpQwtgIEXW4kslncXEgSiy1CMT0fhFDDvKGDmtuRt+OaWhjt8HbF8o3D0o4v4yXsIlzNKHfPhnsne5Qfp+l8IdoeHHIvryF0Q0Fu9nEKU9eex+XZWfJt0ErxSY0pEhiqk1/K3KUObw7HT3n5jfB7XrZctRcNfpPxnBMM0vcU7KEf7G6xOMmDXHYKf3xwQdArHp6k1TJySR0aXrsZS53YWnno6HVgIJUHVB2I7MFpz5d3oUlJeHqO18fQxNnOtsL9q9Vid7tCs9+BLOtVQOEUcTCeddHzcB9ZvoiNvA0dqQT0qJtTAcT5+0TZt8yMoDgDKDecH6AmYO7vtN0XYW/zynjja3J8i2E04xXDdL5eY33tTcaeIQb7JNZ0nSw55/Pd5CFvh/KO5vsDBX7oIKNY5rmog65MwDrgc44ytS3F4zImWycbzF3Ew8Nlq3dxRBBI3L+NKWy+UfeJwNJq3k2G9lE+h/PHUC9BNFGF/ox1h9EfL62HdtQMVzVI9ue3ro+1KYWcJ2W1AuyyWGak5mBSoTmG5JvDkRz1NSDNECBrdEjbRKSxRi9pjjWvku6f/at9GSnO1b2RSCOxNR67f6Y5Ostcz8HdZw0JSZ06/sDa7DkEmZYrvotDvp2if52jg8x/z3Bwuh7OyNAyuzxI00j/Y7a80laEaLK2S4eTeqLDOMID8ddmt+yintvX8xzH2uzhM/N8szE0HnKHPg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(376002)(39850400004)(346002)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(36840700001)(46966006)(6512007)(6506007)(36860700001)(5660300002)(1076003)(47076005)(336012)(26005)(2616005)(956004)(107886003)(36756003)(9316004)(70586007)(70206006)(6486002)(40480700001)(2906002)(83380400001)(82740400003)(81166007)(41300700001)(356005)(478600001)(86362001)(8676002)(8936002)(4326008)(36736006)(316002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:55.6289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e2fca3-2b94-495a-993d-08dbfa0e1efc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6607
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

Revise i2c11 and i2c12 schematic change:
- remove space for adm1272 compatible
- enable interrupt setting for pca9555
- add eeprom for yosemite4 medusa board/BSM use
- remove temperature sensor for yosemite4 schematic change
- add power sensor for power module reading

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 118 ++++++++++++++----
 1 file changed, 93 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index da413325ce30..ccb5ecd8d9a6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -821,41 +821,94 @@ imux29: i2c@1 {
 &i2c11 {
 	status = "okay";
 	power-sensor@10 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x10>;
 	};
 
 	power-sensor@12 {
-		compatible = "adi, adm1272";
+		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
-	gpio@20 {
+	gpio_ext1: pca9555@20 {
 		compatible = "nxp,pca9555";
-		reg = <0x20>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
-	};
-
-	gpio@21 {
+		reg = <0x20>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"P48V_OCP_GPIO1","P48V_OCP_GPIO2",
+		"P48V_OCP_GPIO3","FAN_BOARD_0_REVISION_0_R",
+		"FAN_BOARD_0_REVISION_1_R","FAN_BOARD_1_REVISION_0_R",
+		"FAN_BOARD_1_REVISION_1_R","RST_MUX_R_N",
+		"RST_LED_CONTROL_FAN_BOARD_0_N","RST_LED_CONTROL_FAN_BOARD_1_N",
+		"RST_IOEXP_FAN_BOARD_0_N","RST_IOEXP_FAN_BOARD_1_N",
+		"PWRGD_LOAD_SWITCH_FAN_BOARD_0_R","PWRGD_LOAD_SWITCH_FAN_BOARD_1_R",
+		"","";
+	};
+
+	gpio_ext2: pca9555@21 {
 		compatible = "nxp,pca9555";
-		reg = <0x21>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
-	};
-
-	gpio@22 {
+		reg = <0x21>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"DELTA_MODULE_TYPE","VSENSE_ERR_VDROP_R",
+		"EN_P48V_AUX_0","EN_P48V_AUX_1",
+		"MEDUSA_BOARD_REV_0","MEDUSA_BOARD_REV_1",
+		"MEDUSA_BOARD_REV_2","MEDUSA_BOARD_TYPE",
+		"HSC_OCP_SLOT_ODD_GPIO1","HSC_OCP_SLOT_ODD_GPIO2",
+		"HSC_OCP_SLOT_ODD_GPIO3","HSC_OCP_SLOT_EVEN_GPIO1",
+		"HSC_OCP_SLOT_EVEN_GPIO2","HSC_OCP_SLOT_EVEN_GPIO3",
+		"ADC_TYPE_0_R","ADC_TYPE_1_R";
+	};
+
+	gpio_ext3: pca9555@22 {
 		compatible = "nxp,pca9555";
-		reg = <0x22>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
-	};
-
-	gpio@23 {
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"CARD_TYPE_SLOT1","CARD_TYPE_SLOT2",
+		"CARD_TYPE_SLOT3","CARD_TYPE_SLOT4",
+		"CARD_TYPE_SLOT5","CARD_TYPE_SLOT6",
+		"CARD_TYPE_SLOT7","CARD_TYPE_SLOT8",
+		"OC_P48V_HSC_0_N","FLT_P48V_HSC_0_N",
+		"PWRGD_P12V_AUX_1","OC_P48V_HSC_1_N",
+		"FLT_P48V_HSC_1_N","PWRGD_P12V_AUX_1",
+		"MEDUSA_ADC_EFUSE_TYPE_R","P12V_HSC_TYPE";
+	};
+
+	gpio_ext4: pca9555@23 {
 		compatible = "nxp,pca9555";
-		reg = <0x23>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		reg = <0x23>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <94 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+		"HSC1_ALERT1_R_N","HSC2_ALERT1_R_N",
+		"HSC3_ALERT1_R_N","HSC4_ALERT1_R_N",
+		"HSC5_ALERT1_R_N","HSC6_ALERT1_R_N",
+		"HSC7_ALERT1_R_N","HSC8_ALERT1_R_N",
+		"HSC1_ALERT2_R_N","HSC2_ALERT2_R_N",
+		"HSC3_ALERT2_R_N","HSC4_ALERT2_R_N",
+		"HSC5_ALERT2_R_N","HSC6_ALERT2_R_N",
+		"HSC7_ALERT2_R_N","HSC8_ALERT2_R_N";
+	};
+
+	power-sensor@40 {
+			compatible = "mps,mp5023";
+			reg = <0x40>;
 	};
 
 	temperature-sensor@48 {
@@ -868,19 +921,29 @@ temperature-sensor@49 {
 		reg = <0x49>;
 	};
 
-	temperature-sensor@4a {
-		compatible = "ti,tmp75";
-		reg = <0x4a>;
+	eeprom@54 {
+		compatible = "atmel,24c128";
+		reg = <0x54>;
 	};
 
-	temperature-sensor@4b {
-		compatible = "ti,tmp75";
-		reg = <0x4b>;
+	power-sensor@62 {
+		compatible = "pmbus";
+		reg = <0x62>;
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c256";
-		reg = <0x54>;
+	power-sensor@64 {
+		compatible = "pmbus";
+		reg = <0x64>;
+	};
+
+	power-sensor@65 {
+		compatible = "pmbus";
+		reg = <0x65>;
+	};
+
+	power-sensor@68 {
+		compatible = "pmbus";
+		reg = <0x68>;
 	};
 };
 
@@ -898,6 +961,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1

