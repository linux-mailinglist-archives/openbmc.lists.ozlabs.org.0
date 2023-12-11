Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940080C112
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:00:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Rk8KBdAc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWLP53CWz3dT8
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:00:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Rk8KBdAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::606; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWHw5Jrdz2xbC
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dptz4LflbZXFNy8iMJB6qh/kBW9V+ovvH69DsM7G6KGjDWrrCvUIfzNA3gH9cfA40kx6oJ5b5UvIcuNk5fDlYlbEF11K3x1LBcEd6txNJDo93NeKsqza2PvcWm7fCBZ9iaDwtOqtk+Iz/jvLZJ/WCF0NhAz4Lzhf38Q2Ng9V9aJjflSwX3Kz8LtX8djKNjpjU5jQSzEHT5Dxn6F8Yfo15IZonVbL5OyeVuu5+g4AmQAo1JDewGnysLZ0Mq24c21KULqevRaTLBXE0Saf80xIYjlBfH41KJbjeOZksw0bWWrA86966U+fAf2VQQE9yPl/eIKJFeoez5+B9SK6gzU+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=YzX99yjSFYQSJGgcsp05LvOcV3viGuAyI/W0nIjTBs23aptxqOIiaZCNKb9/UTOX3iURA66h3z8LSIr2jUAup9w8TlY6WtX4tPG8JlUr5MDVpyMdLlKFNFqsopqPVJRvlIw/koK5xGEWpveU2AOeX+1ioI8TWfqDQwaEzCrDcV7Ds56DMQY76tUnB4qCgtsrssaDjVJ5L/z++jjwbjKZiKcWjCMuqjc9fOTnnkfAlTt78T5DMaLpSLPbPfHk8woKLVkhporls2U5buEl2LMqoAlgjefwUk/jv5FrPKzzy9am3goBTCU6mH0+bY/2chdj4LuunTtw92P/YPxfdL/fVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=Rk8KBdAcqPQvQ7gRvV45m+gFr7CtIWU4IRoE5YTJ26UcCQb0i9kHBhtuQQyeH/yYNfnjlZpLk1Th65UAq3ufzSMNPdy0g7NWESBRER5rZ9MW3fbJkuNNKICiXGTlnd/IFbZFezj/56Gvi92iDgal9xmubAk8e1RscjmUsUikRsXqKEvO1utXkbv1n6VycMFUvBjSM+V310ymDvbZDV8W9AbtGVH2kqAx3SBXJWWfH/S6bRSGq1XC51a4Zzdv3aE9RZ1Dw57i78eCrzJ6S5jczcJtM8tdnywMWPeOd5eoBLTVKcNvsSsbAQTXiYPZpNH/GarcjiFmle5ebpvzyRzg6Q==
Received: from SG2PR06CA0238.apcprd06.prod.outlook.com (2603:1096:4:ac::22) by
 TYSPR04MB8339.apcprd04.prod.outlook.com (2603:1096:405:bf::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 05:57:45 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::a4) by SG2PR06CA0238.outlook.office365.com
 (2603:1096:4:ac::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.29 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:44 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 02/14] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Mon, 11 Dec 2023 13:57:26 +0800
Message-Id: <20231211055738.215773-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TYSPR04MB8339:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 568f614d-78d8-474d-b807-08dbfa0e188a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NpjnPh5/vbaSgOWOtHcXitn1daMN0SMxrMB8jUC3y6xe7s83HchwsdVIIrY6P/rFzRe6gKBePNsoEWZAU2oW02iVbhoPOsAVG7TwBKTZP8SCbo0C7sE+QwnqGN3u4Kn7QuVeERVmaDJhAf4U4JFBZFTRt9cbpKhg2kEf6iSjt157306mHXWWRMCcgtWvaRFtWLFk7LzcOHlUpL9O5aWiJ9Rt4lvN4w7Rk11Ly17/vALatjC6n5TL0Nmo8ROPy1mAysOfTWqXhE594a2iHyA1y4CERwwMf9WTfT9VQtuJtH4hLMVlsQD6ZOTXT08cv5Etoh2F20SjFJN3HsKrPt7VGXR59jBbiMeXvIGjyNtKzJLFuhtr9tus024WO82gBK5wxVlGUpmLjsfgE/8eTZa27MVwgIqS9fvKStDqnf96RfMSasDwmLVoT2gm95SkoiE8ZwNkRdCwt/Z5+xyELNLUX/biJbodTIlpkBG/wBvQmAwaIUSdXF7p/8K8ukq9YBR5TzIJ5y1obvh0FiDehLGKw/m0KA5j/+jdAK4t/fk4WATw5+w80wAXzSMIP5pMG2JzPAlqR3RylrUiVX/e6z+dht58IPvkrD1u1VmfKSp8zZ2ePOzX4pEcmYdkRDoYdb7LimTQK5M45KfPTimZtiz3003SYxTeUro2VuWWA2m5x7aacH6ZrEH2ScJUDlTqF4mV0ytsUCapkcsSXmqbHcVwpQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(46966006)(36840700001)(6512007)(6506007)(36860700001)(5660300002)(1076003)(47076005)(336012)(26005)(2616005)(956004)(107886003)(36756003)(9316004)(70586007)(70206006)(6486002)(40480700001)(2906002)(83380400001)(82740400003)(81166007)(41300700001)(356005)(478600001)(86362001)(8676002)(8936002)(4326008)(36736006)(316002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:44.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 568f614d-78d8-474d-b807-08dbfa0e188a
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB8339
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

Enable Yosemite 4 adc15 config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index a5b4585e81e6..c32736fbaf70 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -51,7 +51,7 @@ iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-				<&adc1 0>, <&adc1 1>;
+				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
 };
 
@@ -920,10 +920,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 &adc1 {
 	ref_voltage = <2500>;
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
+	    &pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1

