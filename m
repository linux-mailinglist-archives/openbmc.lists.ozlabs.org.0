Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2448BCCE4
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 13:34:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=LZsM1VWx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXznt1Xt1z30Wb
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 21:34:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=LZsM1VWx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:c401::; helo=sg2pr03cu006.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from SG2PR03CU006.outbound.protection.outlook.com (mail-southeastasiaazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c401::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXznD40nNz30TG;
	Mon,  6 May 2024 21:33:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUm7ZaxVpO3BfDtCYlX8Y48Flgt/Q9RHxV08VMBMeanaMd2a4xm3GrWWRXSfZ0eZYfjiG+NDwJ1LklpyPxnarTGfGxVQlC2cXl9J+LhLEN+KEDTMTh8AtbLQIkVftSpqPzfTFeD5zPNw0pl005rd3y0OGN3VKTXQq8MuNqoHzFtgTMbsb5ZZUtZu9Ux+ebbJYfUagQeljlDL1UwoemqBRrNlqUoFBWjLHQmacukrlE+Eg/rSkg2bk+yPqvdjUbgwdok7g9daq3R1tu3gKrurlcgg82MFQU8caLIke4MMPGq5BDGO/apfKFhauWdmKrf9iTyntLTuitqkFDrNU3Kpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+VhU7puhYgqEcuUhg9nsZCbl1KlM3fOVeMhyFy/JOU=;
 b=Git5sYLeWGcM049RzqSKMJn2j502M6vuhIf9/auV8WSGfvPpJIBh+lNGMjdG1ligrJvI5f/LlO/jqatmsuSjMJ0c6xbi1g/wiSW1BBr8kn6DBW6tWDNlFJdI3beLx5v18104oqExK4RmEA+zD3pSrIZwLW8swzoAxd7hRxWRU2kWAPwuJzDhJUvINwOQsyHlG88MFcGYaDC12E0qVGEWp7lRXutpeuN2zSgfivEUKSmu/hUyiBLokRSbV3MdMHPiTMPhwKCgQP5n1t18mmRsT+P/MTPHNwDaCxUgtANrWneB6gW4smlcGYlZs+8ECsGR4kw1wXEMMgNYVifthG2pFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+VhU7puhYgqEcuUhg9nsZCbl1KlM3fOVeMhyFy/JOU=;
 b=LZsM1VWxDabrBuAMtHomb0vLctKAG+pF22rKhU26CBM+k1k+ntiWP6o+DkigOAdOojIKTd0oiNtR3+m9mJ00K8NsrS2hJA52cyrrCH7FGFtTvj1TuxcOjhrfR/yJwud8WDxhP/2Nr+QLm16HmsfR9pjiyaQIlqXRMEx2bmhrrSjh7hi156qHCQkvTPzOe/KYhFqmo2/P6C1eFODqgwWeh5i3AshEHowX5RftEr4QZwW61zydVKwaRjWL6gJwL6MyCLQn/F7jgomBraSZCbe8ad5jD+7fHIdtc6ScRrxPKqiMJEXhwas5hPAVNqDk7EjRD5gDGKWqPc7DwgUG2QSf+g==
Received: from SI2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::15) by
 TYZPR04MB6768.apcprd04.prod.outlook.com (2603:1096:400:341::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.39; Mon, 6 May 2024 11:33:11 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:190:cafe::82) by SI2P153CA0030.outlook.office365.com
 (2603:1096:4:190::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.7 via Frontend
 Transport; Mon, 6 May 2024 11:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server id 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 11:33:09
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v1] ARM: dts: aspeed: yosemite4: add I3C config in DTS
Date: Mon,  6 May 2024 19:33:06 +0800
Message-Id: <20240506113306.1283179-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYZPR04MB6768:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de0e3922-721c-4800-8359-08dc6dc04ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|36860700004|82310400017|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Te/F4hcnI0xx2OOGtCpli+2Suw9/MsNwO2QXwViOpTWifylikxeDarZ/xkqw?=
 =?us-ascii?Q?DreXWHYnk4EkiyFTuBz3lbE4/xw06P8g0jp0ixPDbRTyYKULlvaszW8PVMru?=
 =?us-ascii?Q?l9/FkI1mFzdWjmOtfTxYlvoHx/DpgCwfPRgeqEILc7OPX4QIlw2nIfx3ez1B?=
 =?us-ascii?Q?V3hG+p2FoE8x5rczfiuIHF19CT+bNGEH/OqGZmD4TM7cIXCtemCVDk4qhgXc?=
 =?us-ascii?Q?MKAuT6W/Ig7+DsVLc5b4jQVf1SfoxyJ3fmj87p2RdZPQxYFoOYwhnGQ/8E5X?=
 =?us-ascii?Q?OhKXBwrOVNbRGpA3CXGA6rBoZ+iyh18Y1hNi2nLiPRKoTHMlw2i/mvzgLqHF?=
 =?us-ascii?Q?DASxdgO7Jn7+RS94r9AEWwT/vxzK7M20ouwArzeMdBwWeuZmpdlK+B8Cp/pY?=
 =?us-ascii?Q?QR+GLgx6IwkuJ+tPaKvIVp2mI0DDpcY3FVhEbnRGyug+t42HLq3jMJNM/M8Z?=
 =?us-ascii?Q?Tf5YyGkUJDzULiU6B8Npnc2xlRs0EozT1hsHcueSoKvrokOTUHZED9lN+Jze?=
 =?us-ascii?Q?CScgbcrRQLC17sCEUn3IWLuc/gqfP6n4vxvbRE6g8TCtLeCw7RbsIaH4r6bz?=
 =?us-ascii?Q?NTukFPeP37UtRwGjNE9O3X/UiumzszTd7zumfu+S7wF8xtqa1mldhTgSLw0w?=
 =?us-ascii?Q?/Rs7AUlSnwwW6kotaPf9015C0cy8fkF4lezg5fRGVrWkKBQLmfWHpYDSxHQk?=
 =?us-ascii?Q?IGgMyWP5luDbFfsM1DPmdyAIzhNXuTdcDY/DEDCzIS+1Kt1k3miDi9wq2PKT?=
 =?us-ascii?Q?K4BUpNC4Qa6InXP9jh3cZVnrMwdZMYPacQcbL2q6/ww4EetAINi03K355Srd?=
 =?us-ascii?Q?QuTUT2tMyAmgC2VaQIY7Io2ifQ/VCMuKItopWsgh69DmzrkMcobaEwzO1gwT?=
 =?us-ascii?Q?V5p0LRysQckeVxTJH20PjIqpyhoNa7GLwwXRMcQMWTtan0dqLh2G+OvG8vM8?=
 =?us-ascii?Q?AOJ/WXS8gZn6sg0PAhjtY2ydmtiOnf0wfRknwAQjV8Te0HEzhku7ZsFMA2q0?=
 =?us-ascii?Q?5gJXv95VBlAcx/CVppmhJoZyRD6A4gIA1e9PGhMwtLsXK6sW6SVMbLGoN3hB?=
 =?us-ascii?Q?PCbt3gfbO8H+ics7rBuYzZfjBYl9+geO6VlkPT0ycnW18TFEZwq/fodwjKHv?=
 =?us-ascii?Q?Qkc2y1SZMl5ZllJ97xB9xtYNuc16Hs8n3updZCEsyLzMZcrckb5BvN6ciERZ?=
 =?us-ascii?Q?tdC++9n7//sPxmUr6wVZOAYH0yOFJK00/Dttv5Mn9eH4quARjh1HmnhMJDL9?=
 =?us-ascii?Q?lvXs99N3aQr0iWFHrtK5k63b23mObBnySvEjtqFxhpOri2eFtI9qybvmENcC?=
 =?us-ascii?Q?gFSvQznz/O7FpOk4xm9PRvqka34nQUtyj0XXLdoQbQu6HYG2AC7LWP7Nj8sv?=
 =?us-ascii?Q?luwZfTXYElgsSPMPjQV+BGtivrHY?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 11:33:09.3511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0e3922-721c-4800-8359-08dc6dc04ea5
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6768
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set I3C config in yosemite4 DTS.

Test plan:
Tested with aspeed I3C patches and I3C hub driver.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 64075cc41d92..6a30c424d745 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -595,6 +595,92 @@ i2c-mux@72 {
 	};
 };
 
+&i3c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i3c1_default>;
+	i3c-pp-scl-hi-period-ns = <40>;
+	i3c-pp-scl-lo-period-ns = <40>;
+	i3c-od-scl-hi-period-ns = <380>;
+	i3c-od-scl-lo-period-ns = <620>;
+	sda-tx-hold-ns = <10>;
+
+	mctp-controller;
+	hub@0x70 {
+		reg = <0x70 0x3c0 0x00700000>;
+		cp0-ldo-en = "enabled";
+		cp1-ldo-en = "enabled";
+		cp0-ldo-volt = "1.2V";
+		cp1-ldo-volt = "1.2V";
+		tp0145-ldo-en = "enabled";
+		tp2367-ldo-en = "enabled";
+		tp0145-ldo-volt = "1.2V";
+		tp2367-ldo-volt = "1.2V";
+		tp0145-pullup = "2k";
+		tp2367-pullup = "2k";
+
+		target-port@0 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@1 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@2 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@3 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+	};
+};
+
+&i3c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i3c2_default>;
+	i3c-pp-scl-hi-period-ns = <40>;
+	i3c-pp-scl-lo-period-ns = <40>;
+	i3c-od-scl-hi-period-ns = <380>;
+	i3c-od-scl-lo-period-ns = <620>;
+	sda-tx-hold-ns = <10>;
+
+	mctp-controller;
+	hub@0x70 {
+		reg = <0x70 0x3c0 0x00700000>;
+		cp0-ldo-en = "enabled";
+		cp1-ldo-en = "enabled";
+		cp0-ldo-volt = "1.2V";
+		cp1-ldo-volt = "1.2V";
+		tp0145-ldo-en = "enabled";
+		tp2367-ldo-en = "enabled";
+		tp0145-ldo-volt = "1.2V";
+		tp2367-ldo-volt = "1.2V";
+		tp0145-pullup = "2k";
+		tp2367-pullup = "2k";
+
+		target-port@0 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@1 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@2 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+		target-port@3 {
+			mode = "i3c";
+			pullup = "enabled";
+		};
+	};
+};
+
 &adc0 {
 	ref_voltage = <2500>;
 	status = "okay";
-- 
2.25.1

