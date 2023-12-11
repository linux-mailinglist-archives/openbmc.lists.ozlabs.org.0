Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD880BFC1
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:16:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4ZnH5PiD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRjG2Dqjz3byl
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:16:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4ZnH5PiD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::625; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRff2fhpz2yG9
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8FhHG3s4DgnifB1YrO8qUJi6iuGfP/am6ZLq7g4oewswRdH5EMZATxngfzC5syVL7vMpAZmmxWCh9/C7xU1xWGTZ0o1N2cVXaFo+66Pj6fU2UaNLwdh3/JAOK2hSVUjGhu8cz3qeq/LGv15+4dihuwP16VGctRLYJWG/t8IPqO6iZyiKUkSDw/OmaUYCtqY3Tlrx+YE+2mvXA0Hj39Gn+c979kqXzGWv5JbrGT4rjxXbH4+MS5In8LUWEzEOyChB0vtEFda1F4JMpNdbDZtWxTlXHHV/rNRC/Tb3hicfoBO+FrYzc6tgq8E6IeLUO5gHxZIcygPbR5mBPstTglK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=O62TVN4dLiCZwmo/SGG7WQMWQGA1J8sSjBqNpXGzS1p+yvFq/81TJxcz5uAB0gbXC0jCjRVGqCnufYE/EGhyrwtjHy9ntpekFAfN8sZI4uuiN312YQJVWEzpezxewI+tQYrftRUT+kF0Xq2S5ptGCgCkJuDexA0BFYmeJ6DBoo1TYXbZ0PmHZU4/fIZ3jg6TBr3JJFg0g5EnvXzEQHEHTTzKaehyeQwdMPne115uvW1ykcy44uo4ZZ8xBO+DvpupWhWfQAZoiWBA8zlS8HysVLIDJM4RUY3nu9UXaHn2vEvAlJGIRpHBfcS0F4zez2XTLnr7mEUcEQwZGRDc/BYgYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTdra8Q6Ty+kafVG+eRTSPVcdelb5hg9red0Vwq21ms=;
 b=4ZnH5PiDggLkrGNJkQL/ivfCsSEKBUa4OHUkGqnWAdrWNURDCSADY9JDkJt2Ra5CplqcaY6LMxrUIkznomDvaEqZjSAki3GUnaUWPc3JYwjUmWOyRUdFH7wJzO7jo2NPwccQihxQcry1YTJS+wZrRObLopeesHRQ8+9Go9vmsz4pTc08+qgktjAkhdUqQ1cybac+rOrVo21ALuas7dZ3mB5LANgEc8ytFABG2yvUEL/ls3TFTuB8Ks/sHSWCJIF4+9McpYTy3xe6y6Efc1+ov40i8+lTkqo42ZjO6OiEp6b6gM/NMgpMlyuGrP37lg5b6pi1PBPJb8tuIKPwTlRKJQ==
Received: from SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11) by
 TYZPR04MB8019.apcprd04.prod.outlook.com (2603:1096:405:ba::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 03:13:44 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::8d) by SG2P153CA0024.outlook.office365.com
 (2603:1096:4:c7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.4 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:43 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 02/14] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Mon, 11 Dec 2023 11:13:25 +0800
Message-Id: <20231211031337.4165619-3-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|TYZPR04MB8019:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3659d9c-5078-4aa8-2ef7-08dbf9f72ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Pzo/ATLU0VsaxQe40cLhFyBBjtmxvFbMaGSx16ArVKtvObsG0CeXQvgls3b52S0ytLgfGMirjZXm3E5sCCuEqXDtJFMkTTQ1Aend2gsLS3Q0ycYcOn9FOqsVXVh5wbdbWVpa2hZVps6xDsdDnSkTT5O14Jf7DtNs4rXRJ2oeoSzpY/ePOzQuMgbIQxB4A+x3RnCDf5qMqURe3muRXej+tCBpM2XqHW46Nl5jSuQ6gQ8sTsx0O7ZHyB2uRGNol+A4xsGwFVmA2K5zmmcW/Yd9eXCI8jm62SGKGQ6yCJwLuOjzdwNg/RtLi0PeX/NX7LNBhAYkunuAnnEeDAQVE49i8aRIXjwJPVIX7TzVYfm1xsg10D7HE1v25+qjhWIleVT+F2Zpuc52gZVvFFY9PGHJC0HBK2U/rViVUiuDwXYynW+S0GL8siugTuAuMPvIfo+rf1klJgCd2g/7zxyQJKUM1nkAvr9B2MllA5xaU1LEaUI+MVsdLI3G7m21LJQMOIjHvwUwyBaScqvn8ZrzsM4zpQ4jGX5sIMICuT/1slfdHFTyFAjsq3VmkxykexSAWN2nF0wyCgZ8X4xQbz+F+RHaBY0pQp/5/IHGS4eFdI6P83sw658ZWFKwN8kU1cqGJ02tmTxqeeaIWFnrzvCinE/6npacdDrT6Mlm7K+NIgLKKmYIQ9ves0AQ4VfM9BG8VrKrYlqwV3SheMijsvMZjl8tOQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(39850400004)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(46966006)(36840700001)(1076003)(26005)(107886003)(956004)(2616005)(336012)(6506007)(6666004)(6512007)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(2906002)(4326008)(478600001)(9316004)(6486002)(8676002)(8936002)(70206006)(70586007)(316002)(36736006)(82740400003)(81166007)(86362001)(356005)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:43.8967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3659d9c-5078-4aa8-2ef7-08dbf9f72ee3
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB8019
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

