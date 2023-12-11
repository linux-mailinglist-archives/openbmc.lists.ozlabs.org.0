Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE180C12C
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:12:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=M/ynM/Ii;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWc86JX5z3w3G
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:12:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=M/ynM/Ii;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJP4pbCz3bqD
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyKMgVZRtI+/hgettBVO5YbKsEeOll1DlFQGyH3pM15tVZVE2bGzZGvd+nJmY5q2XUQ/Zfa3D86nb5QElegSmIVNaF5OTqEn/NMrc78FeLdGai3pnoqwWs6PHP7X1OJpRhYxmeebBowZaMb07D7gur5WPjuc4JIg52EdOBqqonkK4Qg4Kkg9q3sDQNpd5bWDkCTwu2IOgU8IbQOZiPO/bgnGPzsBZ9ZJJxr8UfeQwfJ17n3ukXybye+uRiNZhOyba+gc5Bl2I8X1pT8gbftStEPAjCmJJ6MxXiepvwSYQV7uaF+FTSp09hiT4xew9w54kr4xVLBYSt2+3GVvtliEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMJpX1dgtX7BDF5rFZk1s18qD/6HVo1vuUG1hyWe+AA=;
 b=MuzMUaK6KMutXYW8qFpeIUg9CoswM4ZyReLcVhif2Uy843NTz67j3SiM3m8N7iHmILOiHFlguLVlAGpaeH9h5+ONLgX577gYiUg/VqpWqpZzH6XfAiKy7rv2abY80x/mSnQR6QT3VLgbyPuG2q2pWVDWaeCyLlHCpGFxMDKSVa1wVzIftAqK5hvuQwnUze9C57DMOwV1ayNHzqQfgcVSrA5Bib73RS7ZZDBNe/7ay8rr3WQ9QY7jgZnco4i4DcwPnqX/8wvy+5d0+oPj+2ha7itrXXvr7ptdqdeixwA4NCZc2hU2MlPr/v9in5EAiOTLuCcEpKeTlPYbLiR2zJhvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMJpX1dgtX7BDF5rFZk1s18qD/6HVo1vuUG1hyWe+AA=;
 b=M/ynM/Ii+zX0YfLX+sqyD3IHaWbjbIjmeCQ2f7glUcqGMaFbw7o4GfQ+YiS11AjZuImpsxqmc8mGtq+pHh7c81dJbRmvNj4M8RHUBYtZ6BL6PKrNxj1tAfYQKG2a69/5Lg4exeRHw2tJso1+mKTWBIcygg9rl9l6cOUf4g8N760cK0po8buMljwlHDHTBsLPuWOFui+2stPgdYVGdkXxnoZJB/Yve8tAj8KFt0ig6l+1BKbK3v1PZMPzdP4fjPY7kHINiOudN3DQFw3HF/T7K50IT48T6BpdqR2VJBbQvwWKgFum7VUacre4VGuU3fKc8tU0enN8XeaXE/NVnWc7Zg==
Received: from SG2PR06CA0234.apcprd06.prod.outlook.com (2603:1096:4:ac::18) by
 PUZPR04MB6216.apcprd04.prod.outlook.com (2603:1096:301:ed::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.29; Mon, 11 Dec 2023 05:58:07 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::54) by SG2PR06CA0234.outlook.office365.com
 (2603:1096:4:ac::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:58:06 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH v2 linux dev-6.6 14/14] ARM: dts: aspeed: yosemite4: Revise gpio name
Date: Mon, 11 Dec 2023 13:57:38 +0800
Message-Id: <20231211055738.215773-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|PUZPR04MB6216:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2651999c-4269-41ff-16c0-08dbfa0e258b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l+rQfbsBB/mK+WUPNk/JopJgHxwJRWX0lr429ldF0kHBTHbAsrT4jfx6mm1lh6y4KiseM1dH0su6VMK07PkElT4h8813gJHkjiFCHSQ3i1wM7v9Nst7ZOuw/INKRhnj5oYLJPXrFUf+Vj0tPgtdHMVwtWq+VLJQGlLHs0i2HgHlLRjKkJDRCMG5By01I2rD/qvt6CG0UzzI85C21FgN2dSmP0Ii1M6YKAwK/XhBP9ngFTg+AWXzGNqkI4CNiGIW0gVoukv6pAoqBQn7H33qbyazG12IV01SvhU+/I7LLhu/Xu3HkzfO07TQsoe1Nda8OmwJos5vkPl1KjIG3Lp53hysZPjaE48CQAqG0CTpWNUOPGzCrtQ+nUYhzeBkcXFx6vg1G0jXQ56z2zh5YeLUEfTY/RclvupZ7DHaI+U3qKfriBvGtMtNyFvDYPjMOsdMscDy82R9g6stIgtw/oGDQ1xTDa/LkAOOP3H5kMt6ZgFfLf6hgPLKMcBHZ2tHQ0r2G5g492X8r/raTC7e0+ize8TEBDTcy71+MnxH3TdGaGTlWnbvh9TfyszIdNexOdVqR0ZD/ehHQdSeC0XbDP8V5USlBFLRqZhpKoee8kF7XklX7oDNyVN62HlN1lA9+NtpHvng+kirlkG1dXRUDDGFjYSYNiuA2bzsNrrudcAOQLda7BYoobEcX9JEiJY2LWc0Ci/t3LxvdSowgkgrbEC8p/w==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(396003)(136003)(346002)(39850400004)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(36840700001)(46966006)(336012)(956004)(2616005)(26005)(36736006)(6506007)(107886003)(6512007)(1076003)(36860700001)(83380400001)(47076005)(4326008)(5660300002)(8936002)(41300700001)(316002)(2906002)(478600001)(8676002)(6486002)(6666004)(86362001)(70586007)(36756003)(9316004)(82740400003)(81166007)(356005)(40480700001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:58:06.6446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2651999c-4269-41ff-16c0-08dbfa0e258b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB6216
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
Changelog:
  - v2
    - Correct patch for revising gpio name
  - v1
    - Add patch for revising gpio name
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts   | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index fdc33bffd467..15a3bdcfc861 100644
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
+			"","PRSNT_NIC0_N","","",
 	/*V0-V7*/       "FM_RESBTN_SLOT5_BMC_N","FM_RESBTN_SLOT6_BMC_N",
 			"FM_RESBTN_SLOT7_BMC_N","FM_RESBTN_SLOT8_BMC_N",
 			"","","","",
-- 
2.25.1

