Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5280BFDD
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:26:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4RurNbh6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRwb4w2nz3cXN
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:26:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4RurNbh6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRg20zD3z30Qk
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrPKuRPOUkVuG0uuLFhliBlilMebIedUHS+rp6fiY0aYfU4Tiit1fllxqlNfeHsJVwfqFVR8B/+YpIT2SxHlj6HVt+4rY2JViHNBDYGnQ6gT5PTU+U/dvcIS9URqV2PQDwSe7KtaulHX0Z24tedRS663bEHZmjt43iNk9RJfRPELEzloQQdxOy7wbj44bb7kUkzOUCOQJ54DQmgVsqUGBw7/hDPcCzUTB4VMUgFc7s1oSYpsOx//DKIQ3Kdp+9sybj7mrKcXGVMU2vGu2eECC+BXBR2JKRIN7fZGBSqQVSeFJ/UAMYOud4wA8LNbZ1JRgy/ozCRoFsVqrgISx7q5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+UpWNUGnfnGFVWbnYEkwYvz1pI0nsqIsPgu2I6N7Oo=;
 b=I8LuRCr69XCqkIjmdOZVH2VPBu67h9gMIysdNZP6i5VCEEM2kOev3bktay+T0Bh9WvChGdT7cs9WfthH1Z5fqDTVFFTeEBRe/O3ctu/6jIn/k5ybeTNMZPKyu53VtCayAYL39ozISV671+tN556lC4cwfqyO6NKnDjJ5mzkv0sp50L/w5rrMcJ/KeUQg5KRnc7uiQMF0F3w7GNNON2PO2N2JFWyV0ajGnVcCorxeEbUG+C+1j/P1q4UxmpSk0iNHcqtOIWs/HKACyPnNiFB2UrRfjIyiGitIZmJq9ugwqdhnqOxQ+1hM44rn9+ARydHo2ZZQkYDoKbEtwD8YgiYTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+UpWNUGnfnGFVWbnYEkwYvz1pI0nsqIsPgu2I6N7Oo=;
 b=4RurNbh6DvGaqzT1fl1p0DX+mbMPc3N3MWi8aNecF4D1fhi2g1HAF1nDUvkii5A9VQez9xZZ9lesExaSz485UnKgCjT6Yyr2ESmj7qDYPiSuhDQVQnGa1O5E0vbVvFfqTq5sCW3c/HVrENB2uQZpBPs+1BURvQmu9ZKr3EA5xPW3/k8/5l+1wFDVqS6s24bp9WdFayi/CypvkfjIN0OaTlYjrsm3t6Fuw1uJ5FSUIAEPpfRZYdIT36vYUoxLIfp6nkrCePRm8AL8lhp8Jo0oNXwcXJiVGi0h5QBEPCABfzP8MIwly8WwTqPrth2PIGtqjZFOKglPMsACZ717ixcPiw==
Received: from SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18) by
 KL1PR04MB7161.apcprd04.prod.outlook.com (2603:1096:820:fc::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:14:04 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::ad) by SG2P153CA0031.outlook.office365.com
 (2603:1096:4:c7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:14:03 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 14/14] ARM: dts: aspeed: yosemite4: Revise gpio name
Date: Mon, 11 Dec 2023 11:13:37 +0800
Message-Id: <20231211031337.4165619-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR04MB7161:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ce4101bd-7e6c-47b3-4a17-08dbf9f73add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	polNWqtojgpCxum6rBma+7EIBmk/LnxlKf67cS0KFBAfMTPXDlIfN5SPs7wzdqh6B+hKhYEMUgMgnz8HLJKth7CVRTqgz193Zn3KkLiON9kJe5TkAnEusik4ev73iVocZ7FMXxCfJkupbCmOT0q/V22Y+FvEK88eJmeWq8L01c3J5CYKEpQhGnHVdDUeR/3NZmroDyw7j59Uay5Wd7IAtiRrOyfqx7asgEzGNqW0QmZ5VUwXPEo6s/nNkDB/Fs+Qd25wN1FItpA71FVvAdmBgtPMNsxVUvNTDwvZ6gcOkPesXQYWE98wPu74eAu7aBaH1HxNnS/i4ZcWs2zpjOkAMrgLhwfOUpDqVzURIb5y3T6Zyg13rlIEFlVHV+NKfsztmqYFUna0FNmKYg166iHNEbl7n3y4cHhEpzGWR2bncnMSwFIoH+N/T6APFRZocH2K6sOz5cEFaWCgr5V2Km0G8/FcRkEJvjlv90mO5kEoEPPZ0UCGy9afmFhoFueUp8KZjbW6hDFTgtedFlts0ASTzUAMpITXi2Dm/qZXKdn9EIYVtFAG82LUGUHPrS9bv7Es7334Yq/Kb9MH+HPJtlhh0QNk05wfjRobPANAUYydKkbDZ+cYa6taCO2aX1MWD9cpFiPEkfFi3Ce8nZFpbxLjTAcV/3rzI8oBrSSNbEWFmsUQlmf9Z32RD8WTqwKkiYV3OdXyhu9quMzRG+M0AuXNtg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(39850400004)(346002)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(46966006)(36840700001)(40480700001)(1076003)(107886003)(6486002)(956004)(336012)(26005)(2616005)(6666004)(47076005)(478600001)(6506007)(6512007)(82740400003)(81166007)(356005)(86362001)(36756003)(41300700001)(9316004)(5660300002)(70586007)(70206006)(2906002)(36860700001)(83380400001)(8936002)(8676002)(4326008)(36736006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:14:03.9907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4101bd-7e6c-47b3-4a17-08dbf9f73add
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7161
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

Revise gpio name for EVT schematic changes

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index fdc33bffd467..53e54e71e7dc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1414,7 +1414,7 @@ &pinctrl_gpiu4_default &pinctrl_gpiu5_default
 	/*B0-B7*/       "FLT_HSC_SERVER_SLOT8_N","AC_ON_OFF_BTN_CPLD_SLOT5_N",
 			"PWRGD_SLOT1_STBY","PWRGD_SLOT2_STBY",
 			"PWRGD_SLOT3_STBY","PWRGD_SLOT4_STBY","","",
-	/*C0-C7*/       "PRSNT_NIC3_N","","","","FM_NIC0_WAKE_N",
+	/*C0-C7*/       "","","","","FM_NIC0_WAKE_N",
 			"FM_NIC1_WAKE_N","","RST_PCIE_SLOT2_N",
 	/*D0-D7*/       "","","","","","","","",
 	/*E0-E7*/       "PRSNT_NIC1_N","PRSNT_NIC2_N","","RST_PCIE_SLOT1_N",
@@ -1432,16 +1432,15 @@ &pinctrl_gpiu4_default &pinctrl_gpiu5_default
 	/*K0-K7*/       "","","","","","","","",
 	/*L0-L7*/       "","","","","","","ALT_MEDUSA_P12V_EFUSE_N","",
 	/*M0-M7*/       "EN_NIC0_POWER_BMC_R","EN_NIC1_POWER_BMC_R",
-			"INT_MEDUSA_IOEXP_TEMP_N","FLT_P12V_NIC0_N",
+			"INT_MEDUSA_IOEXP_TEMP_N","PRSNT_NIC3_N",
 			"INT_SMB_BMC_SLOT1_4_BMC_N",
 			"AC_ON_OFF_BTN_CPLD_SLOT6_N","","",
 	/*N0-N7*/       "FLT_HSC_SERVER_SLOT1_N","FLT_HSC_SERVER_SLOT2_N",
 			"FLT_HSC_SERVER_SLOT3_N","FLT_HSC_SERVER_SLOT4_N",
-			"FM_BMC_READY_R2","FLT_P12V_STBY_BMC_N","","",
+			"FM_BMC_READY_R2","RST_SMB_NIC0_R_N","","",
 	/*O0-O7*/       "AC_ON_OFF_BTN_CPLD_SLOT8_N","RST_SMB_NIC1_R_N",
 			"RST_SMB_NIC2_R_N","RST_SMB_NIC3_R_N",
-			"FLT_P3V3_NIC2_N","FLT_P3V3_NIC3_N",
-			"","",
+			"","","","",
 	/*P0-P7*/       "ALT_SMB_BMC_CPLD1_N","'BTN_BMC_R2_N",
 			"EN_P3V_BAT_SCALED_R","PWRGD_P5V_USB_BMC",
 			"FM_BMC_RTCRST_R","RST_USB_HUB_R_N",
@@ -1459,9 +1458,8 @@ &pinctrl_gpiu4_default &pinctrl_gpiu5_default
 			"","ALT_P12V_AUX_N","FAST_PROCHOT_N",
 			"SPI_WP_DISABLE_STATUS_R_N",
 	/*T0-T7*/       "","","","","","","","",
-	/*U0-U7*/       "","","FLT_P3V3_NIC1_N","FLT_P12V_NIC1_N",
-			"FLT_P12V_NIC2_N","FLT_P12V_NIC3_N",
-			"FLT_P3V3_NIC0_N","",
+	/*U0-U7*/       "","","RST_PCIE_SLOT3_N","",
+			"","PRSNT_NIC0_N","",""
 	/*V0-V7*/       "FM_RESBTN_SLOT5_BMC_N","FM_RESBTN_SLOT6_BMC_N",
 			"FM_RESBTN_SLOT7_BMC_N","FM_RESBTN_SLOT8_BMC_N",
 			"","","","",
-- 
2.25.1

