Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B77DDFC5
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:51:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=K35zJBzD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3hM6N31z3d94
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:50:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=K35zJBzD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bx20TQz3cTY
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrRfglIVHaybGRE63jgci+jp3UpEQpMlmtMkDVqS6MgRqUuWl1RA6A/i7mOi1OyhtVktkLB/S0+lcgC88vJ568cstwCS7m70Z9Zaf03RkWmT13kVYoKCxKTuW6M09fEfO+/wPG2nLYn8bqrZYbxYSUG6ULR2pZvq5bFXkf4kIviGmmlfuVuh6PMr8Z7BpAYVWfZf+nNgngmbeZSxX5ONj1d9UTymu6odwHcmxJvuhOagIq51rgucYtQ6WrjaztmyHFMrkLMn94Lm6/CnC2YKC0wW8FBePRv/RD6/pMWECE71TuRDiM60uUbNI+PiS0lPBEWlWeVGvOrscYUY0rPGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS46iyiX5VqcZeS2QC5nTFB8RgeTDUaf1C1vb3s+wjU=;
 b=hYjW0cWes9w4Ze2uE2K89BtmJU3FKdw5tIZHSxXeHERp3dEi3BhsQhK2047VlUSa5X7nF0dn7V3Hsc7ZTlxQeEJVz51o9s3eNRqL8Fx83BMV0+4EL7/3WyhRzRG86jYuUM8Di7IjonMQFfFuTOt2UIQekdBIyXhgfRsrMTbRljFicswbkm3VF/DVRcwezZNYjGpL+1C7alVLR6Jebwbbco45DcSO6OEbNUF7v8Nrhlh1/F+9hePPWimCB++t62sbbFTAzME9aZcQJaXIaMwr+Yh5HG1a9o1EatIVR1CtQROQycNpv72Tpkl0hSAIOcgubhCyTEOJDDIqX/XIH4rSJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS46iyiX5VqcZeS2QC5nTFB8RgeTDUaf1C1vb3s+wjU=;
 b=K35zJBzDTSUH5TU3IrIJ3M6kvMyAhGvPV8zUjkTCkl2RJPBXGH65Cqw+0600M+MBs4jgFma4NNUHDrNvLuCdgdXpcWPW6XpSg6HpBn9ZIfGLsUK4A8UuCVm6I4fgLJ1GouJ0dtnuwU3i7paaGyyQHrJjRjZxbopQAkQi7Xlw8PyVvR4WC8D6oNBhMfqHny+bj1zpdkETXApw+e/fQlQNQb49B9fKEqrTupDZa5R/2fo/psSHcbVw5Gy+bzGvsk637bUVNUIqSvV8NM2/KNfP6Eg9D4UWD6W7xkZJJ5dD+Lmkt3Cm5afUt5/o24iy4r1+7Z5Dg1dgiIbJTneCQ1nkVw==
Received: from SG2PR04CA0193.apcprd04.prod.outlook.com (2603:1096:4:14::31) by
 SEYPR04MB7027.apcprd04.prod.outlook.com (2603:1096:101:166::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.31; Wed, 1 Nov
 2023 10:28:36 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::f4) by SG2PR04CA0193.outlook.office365.com
 (2603:1096:4:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:35
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 09/11] ARM: dts: aspeed: yosemite4: Revise i2c11 and i2c12 schematic change
Date: Wed,  1 Nov 2023 18:27:49 +0800
Message-Id: <20231101102751.2538864-24-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEYPR04MB7027:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f815be1-34a7-40a1-aefe-08dbdac54df4
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Lssy/hXO2JuurnRIBFpfQFgq6OhEVoW/ciqnSr6SB7YfiWLTJ/LSkESkoErUok1MlkbWq5FLFvt+fjf6rbfjoQH+xDu3Kp0aYeW+ZPpZkm5ZYdLNrNQtlc0Lb2BfeRW0XhdkgjLIONkA76f0QZI2x+1cmnODR8OK7lWYqa9a1iTPa72p5PZclkCshH+I+Dmgnrkc7CWDKDpzyEdo3MxX6kNi9TafsfXTByqsN7R5teGcDPzOWoZXtqjn4TuhR7bEekANhQI9ylEJD3FyRnwuMID02La00Y+vI/gA5JuN7BmgCpVF0Ln/VXE5FSsqC+LQwGHv0iJiUqRzmihZCASzfwhLUIKI5j9MSVV4Z3uZkjDXdvwISMvHiGlI/SN5HzyBnW7TKxQXUrrCEZscQBLBKE3Xy0Klij06uPJzZ6ee9skrBoHp8JjehN9Pm13Nef4j0qANhJhvP/C9sZ6XkJ4Ka4JOGI8xM5PLek/TRGnmdKS9MroSvUIndXIV4jyUrToQ88LfiatVAvuDmDVHDiPnWsOZz9C1rejZbwqgLDyf/4hxuOqWQv/N5z4WRJ3MLRZnmSh6MuJog1u/9YZQYl3ZLbxI0BDvEgVZpFSzkqDVt73JKzzm10X+TSerqsqPepoW8POH9H7h+BUgP5Yi9PypOIJPqjHuu/QiDuhCwdCjtz/H/j6cqC/gPJv/s69G0Wz+WQ92bShkxMVsPvOLqNr2YA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39860400002)(346002)(376002)(396003)(136003)(186009)(82310400011)(451199024)(1800799009)(64100799003)(46966006)(36840700001)(47076005)(82740400003)(81166007)(36860700001)(356005)(70586007)(6512007)(2906002)(70206006)(36736006)(41300700001)(316002)(36756003)(8676002)(83380400001)(4326008)(26005)(86362001)(336012)(1076003)(107886003)(40480700001)(5660300002)(956004)(8936002)(2616005)(6666004)(6486002)(478600001)(6506007)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:35.1538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f815be1-34a7-40a1-aefe-08dbdac54df4
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7027
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

