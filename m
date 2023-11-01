Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8947DDFD0
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:52:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=F0OootlA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3kV18Cvz3cc0
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:52:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=F0OootlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bz0pkPz3c40
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTbxxL/0fmBWqn3gd2aFzvhUVtERZiTpDzXUDGiynsCbTtbSaKXz7erK5RsrnfTxMEo9z8rAFWKeIKgoMuIeLljyLqzywcUPP3JNoSRX0MDBuT2mt3zYjrPXMZGEUEI0rlfYpz0pJXTDhwDOOldCGtKbh1IDbARMGAH3EN2cbmZXRE/JhVpPU/U838YdzIWWREmklXcETGXZh96pSX/pZcL2LswYlDY6uUnLjpkY3VwVgQTZc+ks6ixYmL47iqo0TUQgUU6EjqJbVCoTl6FDA9+85Oa9LJZq6mBNsH8ofj4xUYVcYcM1dm7wMYXCoNvxIj2FuDrhJ0/kQQ/H/HYFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RT7eWbwHAS1T1daYy+jvNSSRuMDYgWfVCuzjnJCeekw=;
 b=loeYiHsuDU58xv/8vZBaWFTE6g3LifQE16Vn8xI9iAoq+BxbKwzuJV2b2lyY4KUX5DWJj8L0PRRpdhAE1FDyqkTOoBWX3QrR93YSRSWRxtMubXgWWEM03nPGF5DKMuvsBocqyw8ytpLgRZ+rLUaqJRekS6eOBP9dHipwppAnmjf3P6HF7TwHNcUvyIcp/8dJWl0QRO/q0CKcooyRVXQla5xLk6QQB0ndmgB6lCw9hlXX2F3MDr8Avq63Z4dxX9iyGhnTDsvWkKqR5NjkIMvc/E83xWASC15FLKh2SEbADSM2J5SAOpmZtRwQPat6s6Pa0tbBc2XVnQwlKcInR3eBWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RT7eWbwHAS1T1daYy+jvNSSRuMDYgWfVCuzjnJCeekw=;
 b=F0OootlA5GEfJHn947GeztDinSG8i4xMWWQK46H+739febtu9LidAT775je+PcimBsNAp26KCITuJ234bHPcNNMKhxzMOs1DpL+Ae5fmrr7XC2EsRWUUko7XTE9+vKJ51O+//8OQZ6dBAuT1HUCW7faew65Ny9nc/pQo10gz36yGGVDG37G3S1O3ljHHsxpKBUwQz6ycCxxuuq12S5BcoAP2/Q4Kkbr293pS7/feOcuEk0dtJaU9wiGiuDASi1uzkbebtw459pDIFAhK6//45f7wDRChV5oDk6vlBQrebGRCt64D/TctvKZWPWqS0WIG+cUFEiOKsWRa6C5Gkp4yow==
Received: from SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) by
 TY2PR04MB4016.apcprd04.prod.outlook.com (2603:1096:404:8010::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 10:28:40 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::5b) by SG2PR04CA0190.outlook.office365.com
 (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:39
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 linux dev-6.5 11/11] ARM: dts: aspeed: yosemite4: Initialize bmc gpio state
Date: Wed,  1 Nov 2023 18:27:51 +0800
Message-Id: <20231101102751.2538864-26-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY2PR04MB4016:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab7c243c-6f2d-47e5-0704-08dbdac55095
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7J/mdPSKI+8/PUfeMf6x8GdcaoOT5w9VyQE9PlBhYin/9Ul1hts3oHkfIilNR9+IttOq72s/mRNSA1ld8bqFzLxNhB/82Da8abSqssjJu+AlopPFxQGPdfc1C33Tz6onH79jP+cPjKMwZbApAYPvElMcgJeSDHKkNN+l7y2MhnfO4/o6uEem8XIRYYt2RHdyuPjhk9rIqB4K2tVEAb+b4oWCUKXB6ViPUpEEt1FbILe9lyDmVa6LO4zLdKhN3SNG+Cb4twEZxF/EgiCGhQvmsZlTsj5QiMeXQ04d/LRfvf4VraieneRjhuiEO3weR3gdSFLGIoh8c/lr6F+PTo/u6cyDAeLC8T7he7rhYcGn/GP4uvycqBhzaXkWtE7a95dAx9wv9Uh4+ExSDJpDSugcvyufB8IjId4aXLxDyY+K1LTKdKtpsR5Nt3caBgc+I6YrYQMHCFseBas6rsXEpy6R6+NWf69qanFAm3wXWZ9hd7Yg5Tk5dTToX0Bxyesuc2TEz+8FLs3PfwAI5WN+w/Jd7PfuiXHtDqS9wPKehzkJSVRchFvIUNzvVxDVeuuiRiAcJuKeDxG440H4aa2nPVpADVr5iQGFAMZ+K7drgRXdxrWhpyG1ur2QxpGeTd6U6IEPO3dkPkPbUBjIlw2OO4B4k6u5IpUSteZJ5IePWQ6S3WMJNXUXjBTC+B2mRAlGWFe9Yumvo+BS3VGb+xURhjCoGg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(346002)(396003)(376002)(136003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40480700001)(1076003)(107886003)(956004)(26005)(2616005)(6512007)(36756003)(86362001)(356005)(82740400003)(81166007)(2906002)(5660300002)(83380400001)(9316004)(36860700001)(478600001)(336012)(47076005)(6506007)(4326008)(6666004)(8676002)(8936002)(36736006)(316002)(6486002)(41300700001)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:39.5601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7c243c-6f2d-47e5-0704-08dbdac55095
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4016
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

Initialize bmc gpio state

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 195 ++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ed2b1200603d..eb3687bfd632 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1271,6 +1271,7 @@ temperature-sensor@1f {
 	};
 };
 
+
 &adc0 {
 	ref_voltage = <2500>;
 	status = "okay";
@@ -1298,3 +1299,197 @@ &ehci1 {
 &uhci {
 	status = "okay";
 };
+
+&sgpiom0 {
+	status = "okay";
+	ngpios = <128>;
+	bus-frequency = <48000>;
+};
+
+&gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpiu2_default &pinctrl_gpiu3_default
+		     &pinctrl_gpiu4_default &pinctrl_gpiu5_default
+		     &pinctrl_gpiu6_default>;
+	gpio-line-names =
+	/*A0-A7*/       "","","","","","","","",
+	/*B0-B7*/       "FLT_HSC_SERVER_SLOT8_N","AC_ON_OFF_BTN_CPLD_SLOT5_N",
+			"PWRGD_SLOT1_STBY","PWRGD_SLOT2_STBY",
+			"PWRGD_SLOT3_STBY","PWRGD_SLOT4_STBY","","",
+	/*C0-C7*/       "PRSNT_NIC3_N","","","","FM_NIC0_WAKE_N",
+			"FM_NIC1_WAKE_N","","RST_PCIE_SLOT2_N",
+	/*D0-D7*/       "","","","","","","","",
+	/*E0-E7*/       "PRSNT_NIC1_N","PRSNT_NIC2_N","","RST_PCIE_SLOT1_N",
+			"","","","",
+	/*F0-F7*/       "FM_RESBTN_SLOT1_BMC_N","FM_RESBTN_SLOT2_BMC_N",
+			"FM_RESBTN_SLOT3_BMC_N","FM_RESBTN_SLOT4_BMC_N",
+			"PRSNT_SB_SLOT1_N","PRSNT_SB_SLOT2_N",
+			"PRSNT_SB_SLOT3_N","PRSNT_SB_SLOT4_N",
+	/*G0-G7*/       "","","","","","","","",
+	/*H0-H7*/       "","","","","","","","",
+	/*I0-I7*/       "","","","","","ALT_MEDUSA_ADC_N",
+			"ALT_SMB_BMC_CPLD2_N",
+			"INT_SPIDER_ADC_R_N",
+	/*J0-J7*/       "","","","","","","","",
+	/*K0-K7*/       "","","","","","","","",
+	/*L0-L7*/       "","","","","","","ALT_MEDUSA_P12V_EFUSE_N","",
+	/*M0-M7*/       "EN_NIC0_POWER_BMC_R","EN_NIC1_POWER_BMC_R",
+			"INT_MEDUSA_IOEXP_TEMP_N","FLT_P12V_NIC0_N",
+			"INT_SMB_BMC_SLOT1_4_BMC_N",
+			"AC_ON_OFF_BTN_CPLD_SLOT6_N","","",
+	/*N0-N7*/       "FLT_HSC_SERVER_SLOT1_N","FLT_HSC_SERVER_SLOT2_N",
+			"FLT_HSC_SERVER_SLOT3_N","FLT_HSC_SERVER_SLOT4_N",
+			"FM_BMC_READY_R2","FLT_P12V_STBY_BMC_N","","",
+	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
+			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
+			"FLT_P3V3_NIC2_N","FLT_P3V3_NIC3_N",
+			"","",
+	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","'BTN_BMC_R2_N",
+			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
+			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
+			"FLAG_P5V_USB_BMC_N","",
+	/*Q0-Q7*/       "AC_ON_OFF_BTN_CPLD_SLOT1_N","AC_ON_OFF_BTN_CPLD_SLOT2_N",
+			"AC_ON_OFF_BTN_CPLD_SLOT3_N","AC_ON_OFF_BTN_CPLD_SLOT4_N",
+			"PRSNT_SB_SLOT5_N","PRSNT_SB_SLOT6_N",
+			"PRSNT_SB_SLOT7_N","PRSNT_SB_SLOT8_N",
+	/*R0-R7*/       "AC_ON_OFF_BTN_CPLD_SLOT7_N","INT_SMB_BMC_SLOT5_8_BMC_N",
+			"FM_PWRBRK_NIC_BMC_R2","RST_PCIE_SLOT4_N",
+			"RST_PCIE_SLOT5_N","RST_PCIE_SLOT6_N",
+			"RST_PCIE_SLOT7_N","RST_PCIE_SLOT8_N",
+	/*S0-S7*/       "FM_NIC2_WAKE_N","FM_NIC3_WAKE_N",
+			"EN_NIC3_POWER_BMC_R","SEL_BMC_JTAG_MUX_R",
+			"","ALT_P12V_AUX_N","FAST_PROCHOT_N",
+			"SPI_WP_DISABLE_STATUS_R_N",
+	/*T0-T7*/       "","","","","","","","",
+	/*U0-U7*/       "","","FLT_P3V3_NIC1_N","FLT_P12V_NIC1_N",
+			"FLT_P12V_NIC2_N","FLT_P12V_NIC3_N",
+			"FLT_P3V3_NIC0_N","",
+	/*V0-V7*/       "FM_RESBTN_SLOT5_BMC_N","FM_RESBTN_SLOT6_BMC_N",
+			"FM_RESBTN_SLOT7_BMC_N","FM_RESBTN_SLOT8_BMC_N",
+			"","","","",
+	/*W0-W7*/       "PRSNT_TPM_BMC_N","PRSNT_OCP_DEBUG_BMC_N","ALT_TEMP_BMC_N","ALT_RTC_BMC_N",
+			"","","","",
+	/*X0-X7*/       "","LT_HSC_SERVER_SLOT6_N","FLT_HSC_SERVER_SLOT7_N","","","",
+			"PWRGD_SLOT5_STBY","PWRGD_SLOT6_STBY",
+	/*Y0-Y7*/       "","","SPI_LOCK_REQ_BMC_N","PWRGD_SLOT7_STBY",
+			"","","EN_NIC2_POWER_BMC_R","",
+	/*Z0-Z7*/       "EN_P5V_USB_CPLD_R","'FLT_HSC_SERVER_SLOT5_N",
+			"PWRGD_SLOT8_STBY","","","","","";
+
+	pin_gpio_b4 {
+		gpios = <ASPEED_GPIO(B, 4) GPIO_ACTIVE_HIGH>;
+		input;
+	};
+	pin_gpio_b5 {
+		gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
+		input;
+	};
+	pin_gpio_f0 {
+		gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_f1 {
+		gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_f2 {
+		gpios = <ASPEED_GPIO(F, 2) GPIO_ACTIVE_LOW>;
+		input;
+		};
+	pin_gpio_f3 {
+		gpios = <ASPEED_GPIO(F, 3) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_f4 {
+		gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_f5 {
+		gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_f6 {
+		gpios = <ASPEED_GPIO(F, 6) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_f7 {
+		gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_l6 {
+		gpios = <ASPEED_GPIO(L, 6) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_l7 {
+		gpios = <ASPEED_GPIO(L, 7) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_s0 {
+		gpios = <ASPEED_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_s1 {
+		gpios = <ASPEED_GPIO(S, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_v0 {
+		gpios = <ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_v1 {
+		gpios = <ASPEED_GPIO(V, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_v2 {
+		gpios = <ASPEED_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_v3 {
+		gpios = <ASPEED_GPIO(V, 3) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w0 {
+		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w1 {
+		gpios = <ASPEED_GPIO(W, 1) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w2 {
+		gpios = <ASPEED_GPIO(W, 2) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w3 {
+		gpios = <ASPEED_GPIO(W, 3) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w4 {
+		gpios = <ASPEED_GPIO(W, 4) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w5 {
+		gpios = <ASPEED_GPIO(W, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w6 {
+		gpios = <ASPEED_GPIO(W, 6) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_w7 {
+		gpios = <ASPEED_GPIO(W, 7) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_z3 {
+		gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_z4 {
+		gpios = <ASPEED_GPIO(Z, 4) GPIO_ACTIVE_LOW>;
+		input;
+	};
+	pin_gpio_z5 {
+		gpios = <ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
+		input;
+	};
+};
-- 
2.25.1

