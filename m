Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2963080BFD3
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:18:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uRsJ+z2v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRlD4c0Mz3dSn
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:18:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=uRsJ+z2v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRfm0XCPz2yyT
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdlp9BhQxx3nvQgjZ+s3ur6d6cXADgSypx4n59HCCTUAND51R0JISEQCX+uHivXqjr2668cHZSjF0IbLkzA0VT7p2upE96CTzOOlbcbwFXPyX3v02iWb0+zBcyyWyIW8P67OuiYJCeV3rN2/bruKiDGH22XUWX9uZK03xy3e/3Bmm0rwYcyBwTRQyIAtKinO6SLo1u6qH+RbgQuv1HbtPvyfMPE3sliF63pZMzGQr70z6QDnxdnS+KB2Ow9JGy8FwuMNjjbgwk4dQhBTCrwJxcKOEXdMPMfYvSVO5/A6iDB+gXEqqP8l+d9rTEiMoaXPsYdPkpXSMl4dylXLHueeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=cB8qQnHcZ5dNI2yiHEf1rkefUT4SLeOqdqleOP4BQlRxlF0gs4Tpmyk+zwNFK0XBWMvZ/DxO+KsntfmXbQ0KEqQ8dEf2+smWImhfCa76GLK1CwM7yN7kdg4D7vsOCZJasGhmCDTtZCXZuOx6rUaSSdx2wtDw5Bx7eAiDTzETv9ePaHfg8+vFk4LK4DZZW258IEQotfpkTnvOonfG4EFs3cVL2DryybUtM3oOrKorRWSqduckpX9gx4Z8hafQgc0Hq2eCHh4K02hmQheXpQyYoIEvSYrXCQpHAmf/FQs1oLtE05NWxMXv0Is+r98LGGdrRcu5/0gCcX7zg3/1q/tH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=uRsJ+z2vXIecasGGMOaBFC9wJUfKx+d/uoKuOwUBxvuVKsYWnJI2RlyqTL89jKiPf5XHbFWsxvUcow0r574VilXpSYXhAxiIeUQuNLWVjS7lLloxQs0ROoWk3e1GkCNTyxkP+Nv4hbCZPwgQX9Z/fU6zl8IHRr5UQKU6OUKWPH3t5ZU22BBfHok+kHR9okcsQii/hhFTuPhRdq+JWGj6xyXJKsSXVyFlefm1p5Aztqnkkbn2zIFUm87fUYnKFF8uthMioJhlmMaLH6ZdIME/t9FoItUgeBQmEbdkq222UC23mC+7kimuET3333HeKAlkp5ztJ734u2SvsOVIWHMRMQ==
Received: from SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19) by
 SEZPR04MB8484.apcprd04.prod.outlook.com (2603:1096:101:23f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:13:47 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::ba) by SG2P153CA0032.outlook.office365.com
 (2603:1096:4:c7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.4 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:47 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 04/14] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Mon, 11 Dec 2023 11:13:27 +0800
Message-Id: <20231211031337.4165619-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB8484:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 856cba86-19ea-490f-5410-08dbf9f730ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XmNy4H34YnEwzSLYGoWpATruGFkgFQq8E7jngUO8Jy5Tp9bx9eXufEPa/QGUQGQSezkWumSfyRzfpQdENGcreZPC+q3DL/Wu9Bj3f9I6e6tySKqcTPhlGAk1pWQSBKuHuOEH7O0Wjzuo5ZRyCSX3Q6DdLm40fZV4nIDCiqIlAzmbGvTe11lPsUsaI0284bc5n4o8x0PPxqns7FVQacRVyuUs/9rv5bdUuEGprLPAN1IeCGwRTHFYPtG8OtCDsQIDs9W/m1eazfO+wzvFytd5C6KGGzCbkC/QgKTxzkfuU798Dx+moP8j2XxZH7Df5UrVNRVi+7qjwRgRoA6zFBeTFEhlbhw2YWYv0OL8SVOaSDATK6uQOi0eZDW/22T+iH220QLWO9HIWI6JihIo4rlOoKVA4HXIN7aEHSZOwTZcevUiLkt/u/Sb4tApqUt/Ip56kk0qz00SDEumN5tHmNHtz+a+SFOnAGReI1AwOdTemTS6v56UMF/EE+gbPGcEzqoQur3q51upUNkFJTtJLpXJyqIF6QNNxSB//VjwMyqR6Pwn2r+CynSLEbDdBwyw8cBvN+OOLyIgc9/CZF4osQGlxbb+LLDOopVDoY8EFJeJOteLG+/edhzfB2WjiyLLAgDeGnTEmw9w8twSTG8hRBL4GSVUZA07kd2MxfA+6ldOMjwlqhK8iUt558BduF6uHmbRTXlvK3PMyfqaXOKPw1wVtw==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(46966006)(36840700001)(6512007)(6506007)(36860700001)(5660300002)(1076003)(47076005)(336012)(26005)(2616005)(956004)(107886003)(36756003)(9316004)(4744005)(70586007)(70206006)(6486002)(40480700001)(2906002)(82740400003)(81166007)(41300700001)(356005)(478600001)(86362001)(8676002)(8936002)(4326008)(36736006)(316002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:47.3186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856cba86-19ea-490f-5410-08dbf9f730ed
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB8484
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

enable watchdog2 setting

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0449a7e36ff6..0e9095c83a59 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -120,6 +120,13 @@ &wdt1 {
 	aspeed,ext-pulse-duration = <256>;
 };
 
+&wdt2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst2_default>;
+	aspeed,reset-type = "system";
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.25.1

