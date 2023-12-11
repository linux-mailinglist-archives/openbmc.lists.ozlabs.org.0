Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9E180C115
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:01:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HcHv/5Jm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWMs53Rqz3vXg
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:01:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=HcHv/5Jm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::616; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJ02FYLz3bWr
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJVQNEDm6wupd0nJ405Y39jouNoMJgFSjeReq3Kpeehm3lpbxXw/OJpfHsOwTFEjLZtBcrL3MZsh2fHJGOerPkccuqewRlz5K++p+EWDijqnqUhSA3q1Ae7AdIR9yoTp5kqjoPsC9apoV7A7Z+sij41gmDel9iiwkSRt2JQZrFd+im4euJUskEC1EXB514CRVIA+Gtq0eM1UdEUrZ43/JccYroB9Q4s0J51nCcjDgG4bKimZ4bjd4kDUCFFrwVHK6FmoyHqpjUbhJVVLMjHpZeKnEqDkc7kFssutM46G8IexKrZX/+IWvvs5YW5sOYbZS3/a2jLQ3W0JYzv6CYlUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=DudVoM6fHKalDEYESDZUrHXcKGONFEA6QK485cm0rpItNFg+OQVnXWFOaJUAmr9b2rFNYFIpSkNlHlhbrf7tP3ED15mvKoyZM9cP565bBfeO6VxA1NhPXC9NZQg9ZirmRmWU3vb+5nKNUB97U4DbHUbQvefpUmVtoRVOqtchsf2GzO43gDCiDEbeLSMGBdBhb1+0J5KVO3TAZr/666K7OIepBPJf4Iy/dB/NuyGif5ssLWmw5bW86KZabwKrSgT8lLWVMI0KeCpRqUuxjGnVjPrHjg75eeU2gAixqFfiDTZYqw8SSBlV5yBrctJ4P9MrOlX7fLVGGHsW36cOtspFaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=HcHv/5JmPHXYOPww7TsE9t4foizPp/YEp5RrFDRsup/cv5Z6ZvlAM0a8Q0XEU3oJ1c8rNMfa9ATlPDfA4FJTTAQ+B9Cz63R6lktIzmd18+OByK6bgk//Xr5zxz3B+O05f7MI1tNi1/Ej7tgF1MWr5x6zsX8mQANIazd285AigT88e+lhINUSDI2SrX6MPGkWBkFvQfoOaB0aNzuBEv9fc6DbnVX2dMsOCn3NutWixC9XYz25OMzLTWlJ4iV3qLLvlJcg0aNnlOfPdLKdLbI0AnsNE/QK8Btlhtc+2p2cOGNStwQCKoLoPNBRmVCJQryY1Yv0E7EKQOg3MzAVfemJtQ==
Received: from SG2PR06CA0247.apcprd06.prod.outlook.com (2603:1096:4:ac::31) by
 KL1PR0401MB4355.apcprd04.prod.outlook.com (2603:1096:820:30::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 05:57:50 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::e6) by SG2PR06CA0247.outlook.office365.com
 (2603:1096:4:ac::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:49 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 04/14] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Mon, 11 Dec 2023 13:57:28 +0800
Message-Id: <20231211055738.215773-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR0401MB4355:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d36f473a-4378-4e53-349e-08dbfa0e1b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LcywLe1Jimuoz5ggdxm2npTMNyusrEww5zdf3A5zc+hhklYy6MfIUuturPT5hcVSyFMxg3fEEdP9t/v8tuAtEGY2c0wRdRE8k0b/fWzWeGmbXusiKXsdVrp7cqYV32s0eTTP0QnIX8HocpUQ21z9ywEMnGFgyKpyGqDNt25gJWZ5pdrTYF+0YY50SIDlI5jyrtxPZCRpNJIzssQ/oKaQ2O9rTPj/0BWOfWK1tL3s/mIC/kxw/Z0smVeP0+vvssnv2VtBTj7e58xVR0VPTeTGsmSGHZgLNtIaiFiC4Dce0Qw86Z72Eg1jVh6jKnaLEfSQeXhkZAJM310gL30MpMCwBRxDODuH1EyWnxmCLeH0njYabnyyAcZP5HUNpQN3QQeGVoZ5XFTciE56la1h9laE7rjzLZ746C7/cZjNHffzrkat+YpSvtpIkG5XIS+OUufVNW0Pe3O5M30Zcr6jyAubkr4nES8F/UDdr/52kRyYaxO8H8cWfQ5H2sSCK6xJXTIZswLRE5JrJ6ITZeFj6Ebmw75uHNkxGyzL4bzKTQ3Xod43PjIw7ASeKcsdERbfTdaDmp85W8zMYL3d6AFUNkMxxWUE50uyycBV+u3Xd+SuBwr39nQ8DHqVjryIrBY25pqa4LjpH8yhj4zFRcaqetYbrk27HO7tc6vndBW85RzcScLAGlCgJTqtaBUcuG7qkP06AN9z6ZgIdLCAuE9rh0P6vQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(82310400011)(36840700001)(46966006)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(47076005)(5660300002)(41300700001)(2906002)(4744005)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:49.8788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d36f473a-4378-4e53-349e-08dbfa0e1b8f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4355
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

