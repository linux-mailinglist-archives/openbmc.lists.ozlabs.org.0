Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39E7DDFAD
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:44:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=13IiXlOX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3Y54MZ5z3cVl
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:44:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=13IiXlOX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::601; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bf0gC6z3cQ7
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1tE2d1hI+RFb4Ta+O4xnmM+JcqEG3Ed7TKgJTnLzvp9Qe2T2P7c8Neo3w/qS0tH7LKXROMOpFtsZyf0h7xRyWOGkCe7BxfnORHQ/9rMLiwCt5dGotCn+ibnRVy3lFU6jyC2Y3aSwD94/+SIQG1LciDjVcZpAl4QQO3MYKXgHnDSrhDcmpmCemj3EQzDQu5OyooloBlAkLYMG5ZtAVl56tVG43p0FMKODu2bFV9hUEPZqPUe8SSyeM1C/+qq0lqLCTABVmxbL9GjJ5tboBj6u+ygSd1auXjcAwRvWY7QW5fhxxR9ikIIh83jId/3r6+1FC1QxiYcCwYgBIJoy2QD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=JazGOZcygJBQMrIuItS5UOG2ipvgXI4CZpGangPBbsIxkjONo2e8uSUmV88sYtO2ZH6X77yG1kcjxm+x9TRVUEKukxVeHG4+5HrWbX5vlpAeWY6nG6YrrkjLupjoDeVhisVwDlXHcEmK9dIu33itTvLfI2yxPz0RXhfs/8YiE17u7q41hBzKsMun5kc5/SCVOVV0r1FLdVaBGeXPDTUfBef0HjoOskaLlt/LVcXGKhfLg7HhRLu8rq2s3nCb7lj6hbFch4x4cSz5N+wIjmxyrks0lAoJfW0zQfhSnQHxj7DYbcsVflx6ljQMPTzJZQAPMAXYsfEefa3uqM8w+Q5WHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=13IiXlOX1iPEnwyhEmboQnC8Kx51tklkMb76gXezRfXmqZ6q/KRPExK6MJl3fO1MsDwu6gLMNwUssY2CKSYvyVyrhkiXXinGWhNxPXEwAks7hyP2Rk5vDJqZSmznzHYEMHs/DnYwk4uHkfu/szZN8EZiAxmB4JuCOVInLes4KTe5LQmijN7ZxQe+UsJZBwDidZRh6LlDYCZxGKAKR5VCl9Hh3iRua+Dz9BodXPfBftx8C7yf8EO4N/LhJpZ/wcd/nBfDP+UxJFTRHY8We4vfdobMdmQH9w6GtBv/1eDNTdHkde50j/GGpvMaAoc+4yUJ1XBVmb3UI3JsKvmox3OLSQ==
Received: from SG2PR04CA0196.apcprd04.prod.outlook.com (2603:1096:4:14::34) by
 SEYPR04MB6822.apcprd04.prod.outlook.com (2603:1096:101:dc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 10:28:22 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::6f) by SG2PR04CA0196.outlook.office365.com
 (2603:1096:4:14::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:21
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 03/11] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Wed,  1 Nov 2023 18:27:42 +0800
Message-Id: <20231101102751.2538864-17-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEYPR04MB6822:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91a90c9a-e990-4f85-ba8d-08dbdac54607
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vy52LTCzSJgEMrVT2bbkGISUvBgufLuWQc/hF8apDPks7GgRGP1Ur21OcCw/vJGjQnkbUPfj0z6ikuymr1aciuHL4MbtncmEwa7gjcONOrxOgrauaW/yYXQd55fXQgKGpXxmOUoqjEarcmu6qDaX+gzxgUMECiK/7ryCg+2+G1bnEGO4dLlkky58QJjqP5894QqrdZm4r5g8D3wxuUK200XgI5Sih6UtT9FnfsGd6Si0pmYCA8m46GYF1hoV1eeumXlDKlGoRr6sYXbE/lnHm/4Y2dmOPJQp9K1r/I10WIxMSXcONTlqI2lKvP8j7hIAnMud85PP9zCpRQ7EwaBI9wmduuTOZv+cqnZIf5tRfeEmT8CoSu54PDSSupL1s2g+C6PB76lAOQv+keSuq5hw/tGouQpbi/Ym8g3r/ST6536PkI/DCFORzv0DPB+A9H2xoB0Wa+xjCMUZHLlcCzhoCfcNAagMoASvFwAZHJ7g/uycgakoP8A0tb3pKuaJYQ6o2KzGdUpBuA5WjSC6IswnVjjBX8JKIoqzMBDGL4rAqBg62S8NFNwpOYigV4FZ60sC4CFJdCkHcdlEw8Za4vlDy2JqaNEGjN97fRj8kJZwdqCCn7g0tO0OmdmcSCgp1B50k2WQEoj63StWeUgsvL3gRX6jaDX+/EZmiFJfhTz+MYO+pjpeoCMU3SxCoVxq4FnDk3wRbvpShgQDGbEDdKWEAg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(376002)(346002)(39860400002)(186009)(451199024)(64100799003)(82310400011)(1800799009)(36840700001)(46966006)(356005)(81166007)(2906002)(5660300002)(4326008)(8676002)(8936002)(6512007)(6666004)(47076005)(41300700001)(6506007)(82740400003)(9316004)(40480700001)(83380400001)(86362001)(70206006)(70586007)(478600001)(6486002)(1076003)(107886003)(26005)(336012)(2616005)(956004)(36736006)(316002)(36756003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:21.8568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a90c9a-e990-4f85-ba8d-08dbdac54607
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6822
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

