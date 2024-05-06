Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8938BCCEB
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 13:37:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Z3Fqq61q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VXztD5Vb6z30Vq
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2024 21:37:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=Z3Fqq61q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60b; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VXzsg3xwnz2xPW
	for <openbmc@lists.ozlabs.org>; Mon,  6 May 2024 21:37:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icQWBE6SIke6WpB4CHqcUWqfGgl6fOwIiFomxx8yDbAGi8iszfh6jC17p7SF4b2iQQa7q5PtyWrwR8vamYNWhZEwJiwxknKfOAiBCu1lrcw80LZQI3Dq25St7xLPHj4ilCyGIMMNhu2M7Atn3NjwJf4VW2l9MN+dReuFMvbYt3Ay/aj0gT5gueCGjZog6LHy+9o1cVxdUcZtWAoDu1Ya/xHbSEbhKHwHc8MaV/2lqAmO8304zIg59qgCjoKLoOWC295MUgjCjMV58IgjFF/Ml0lxoGfaFLAKHQBSSGH4t2aTFoNsAT/EwmxUhyeIStPXLK60WqnqlF5EJqr3t4WrjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikJ0GuV44FFJJUgx5eF9Ly1JljL1zb1DRYvysSyfjsw=;
 b=bRiVLYaEs6BWycIQZnuuc5TocOAj0xbbs2yxQT6XOqqNJq5bMxHoB5vxQqMQnRyUd4V+elYuv/1yW8DrEmWDKd+rsuefqOJbwC/1dHtmaeYz/ohFZdqdw/Il8xiYl+LppOJdrLHewpxEeA1j2i4BLYe4UpWQl4NPX2yO1+Z6naphwqFto/TGCB0M9BIwitKWq0VEWd3Sjv7ptqSFG93ze8sncFCuQTd969MRFPV+4jTzNAa4JmRIhFCekp8TXZA2zFwe+6a1VzoHlVsQh/wdL+AA/39NczEjrKhFIF7G7mVLyhlT3GMcGLkItEmfjGFWLRR7JJweiifV2nvqHtFXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikJ0GuV44FFJJUgx5eF9Ly1JljL1zb1DRYvysSyfjsw=;
 b=Z3Fqq61qWGNjv2fwxxxKSkRxEuUL01N3ceLinN4X9/yvfX710h6g1BhZbUnaqxzqBRAnTOlxKWn6xLrBFaj0Qj6VDnlJRz5AuHy/4VVn4z8j+pqGxOiMneMHf12YIok/njpzixeZAwqrvpeULvAAljrO08iZ8IKyWE1yPHa8dWU8yZ2S04CQR183P9uQXokrAhcauMbOoc/8t86HXRBOQwO3iqJPGi9EeIWjxK91ZBCSRkNfZ53IstGrvUWH80uAiAEcwGnlImYQMo8ONwarqWGUMd5KN+ILrCSOfxKM9AoA4jCVSJwIgL4VjI2h16rQxqJ6H4ez4t0M6483QVCrAA==
Received: from PS2PR02CA0001.apcprd02.prod.outlook.com (2603:1096:300:41::13)
 by SEZPR04MB7988.apcprd04.prod.outlook.com (2603:1096:101:232::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 11:37:05 +0000
Received: from HK3PEPF0000021A.apcprd03.prod.outlook.com
 (2603:1096:300:41:cafe::c8) by PS2PR02CA0001.outlook.office365.com
 (2603:1096:300:41::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 11:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021A.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server id 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 11:37:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH dev 6.6 v1] ARM: dts: aspeed: yosemite4: add I3C config in DTS
Date: Mon,  6 May 2024 19:37:01 +0800
Message-Id: <20240506113701.1285315-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021A:EE_|SEZPR04MB7988:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1f2496b4-1763-4791-4d21-08dc6dc0d9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?wWANxZTPmc1qvx20R7SxjvDumAwNbUj5nxs/JSzJzisJVsvmtJWdenNy6cel?=
 =?us-ascii?Q?YoUCPdiVQU3HT3Z87rBlJkLN442WPhnzlOT+ZVrqqE5/RT7Du4Xsxb5N2OVZ?=
 =?us-ascii?Q?3YzUQSkt/c46A2zRgoARAG0wzQkN1eCpN6SrvKCk274Ki0RXNIlIK8MKhCM5?=
 =?us-ascii?Q?QQ8rwGP9ghXnIt9yOo9NowqurBb3JOYcKOZozomcsj8/FWE+6ZMoLBJMKjul?=
 =?us-ascii?Q?rLJAHI9CgSQtX3Yxo1KBVGHaNqKtP4yDi5yB/DhlMtkhiOdVQgtQ4KQnG6B3?=
 =?us-ascii?Q?w23RAnUGpHKziX1OAeq+XKb6XVnsFL89FQuCXhe5Oo9KRUeDPobjTPSSBJwL?=
 =?us-ascii?Q?upVgCwx22N9ZIr9jgFv0RDugcAB54MKqiuf07T73M+yjtaAx9C5QDSZOmEaS?=
 =?us-ascii?Q?qDu+wKJusrkBAOkm6fJAog6nBHCk00fvHJkR92SYLmCtc14hIMponVlqRtQk?=
 =?us-ascii?Q?PiM+MqLx00LhPPdfNySAZzbtL47h8ta8KmOLxFAvWVDhOPE1SWGEoYO4Efgo?=
 =?us-ascii?Q?SNjNJK6bJtv/Nx9G+flkeuhrlYE3strSJKTiyoQtOokLQU+6eanzImzY1CPa?=
 =?us-ascii?Q?+qeC2PTbyWBK1pMw6dYK9kXYxtgdB8qcNp6htVrtei5x01j+kZ3Uu5ynwbX4?=
 =?us-ascii?Q?6VszS7BgrJ9yI6qbicISPSm6cHcfm2InTHR7WTrtqZdZJJrzAGGgMaqPz1we?=
 =?us-ascii?Q?j4iZUtbHH9kVtlD0yVRLZRFLB0RxoACctYmyWbj8VOWcPIT1IyJdaRR3zNP1?=
 =?us-ascii?Q?1WH/PZmtozEIlYes8YwYDxV7c4rJy/nLJ64kwj5KVzvaPpKrwqUZWN9gEmyY?=
 =?us-ascii?Q?sT6VibIBhD+nD8nuhNQITpYEQefktqXJ+ezpT8/bJITXF65VNT6Lf9j+sElC?=
 =?us-ascii?Q?7iVFpVEVc6eW6zFubRavgvUdoZ5zwmRrh4wxp1XcNdmVuAmXjTklAE1w9p4l?=
 =?us-ascii?Q?ux8/wDhejLGIacKHeU1iOQg7Jaz1OYZJ73gJ4uhxopc3hliI7s+cz1Mw6zRa?=
 =?us-ascii?Q?RcZG3/lDqkWNWuSEfJFMlQw9D4OuN1kSIqYSX6updU3MJn1g6fRs+t+QFzQG?=
 =?us-ascii?Q?JZxI98Zsqy48REValIwfPYww2CSG3pAvZYq7cTfcTHjYiD/yS53VTZhkoI2/?=
 =?us-ascii?Q?Nx1zcssY1fePzPUiIxEk9ZIPn5nqUVd/Sf0Xsj7YNAf4uVOzUnyhtphOBzyl?=
 =?us-ascii?Q?ayzTBZaUBdapSMz18IcibF3pMjEfLmjFz+W0Cedu/7gpOvhP8guIhjzcO3NI?=
 =?us-ascii?Q?3k3PgndovyUiZECHFLKIdSoG9hFm7tkHSMUYn/faUhIFyfqgt5nHtJ2/ZEEA?=
 =?us-ascii?Q?Duo/VAVY0QQgunCzZhVfcNPAu2G11D6GYwG/7BdWaXDGu0x3G0UwDSef5Kc7?=
 =?us-ascii?Q?iC3bGNVRzBWOJ8Gm4JRNBRa0kSWw?=
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 11:37:03.3630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2496b4-1763-4791-4d21-08dc6dc0d9c6
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	HK3PEPF0000021A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7988
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

Set I3C config in yosemite4 DTS.

Test plan:
Tested pass with aspeed I3C patches and I3C hub driver.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98477792aa00..f9f39e1eec0c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -602,6 +602,92 @@ i2c-mux@72 {
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
 	status = "okay";
 	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
-- 
2.25.1

