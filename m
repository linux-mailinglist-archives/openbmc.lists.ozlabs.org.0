Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DEF7DDFB7
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:46:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SbudXEt/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3bg3Rztz3cVJ
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:46:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=SbudXEt/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::629; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bh5JRLz3c03
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3syOvA7d60DzMcFYFD1lpW+2r5Uv/6GLaaNoFWo72/UiXqu7BvM1K1KhDzpx766PXurE4XDamofQmuZJLSUzBzEXnEYTSV2g5q1znGiwJRqTlDnOQ+CQ3xkXx7nqeuBAcwYUq6Ix96Zf918cuT7N1vOknazaRcj/TaS0XqyJu5DTgn7SSSovmaThdQFVVSuQTHOSw70yAk0NDu8y59BttF27RNZS3RGm0roV1QYY1VLPa41jihE02DVtzoT2KHImWYE7z//AG7uocbI+SGZ6OM4ovQ4Oh4sm8ts/grM8AXiNDnKoaxKbKNsYpPSiA6ma/0Aiqd4tnlzjHscvp2Isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=WsLvGUNfA9Inj3w2ALRgcHMzBgb1kpJsBe5BQPu+RN8N5nJ6AbDOk7R4mxR27VhmNhEMR9PN4KzwSkJolns+n/CcMv9n+EOVp8dBoNAtfbO+AEXJN5+jHP81RlGP54UVG0z7BzX7PhmnXAsW3T836O0wfrWOAsYWd/eRiJzPJtjgwIgghano6bn8VMXjF8AcoD6PsaPcVVOdhLxxiAJA/3Ajh/aNHuSzORAMBEeN0+E5jme/yoCF3SEEs38r0rjEQza4SYAndDpD7Pv8/W4CDNIpCRtMXAENFzePPGbG02rtVidxYKEP27SkLK0uw+MD5OvEUyB5KTAdnYkxjOd3ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=SbudXEt/Ly+FjFs/glUJymWaPRScmts+14calSbogy3/3VuF171jarhHRq/mqzcrftOrwJJpryozejBQWfLaqdskTyGZP5c83OXpaMqgL8Xq1D5txF3yHf0bKZiqajo/h6YrJmsT1/ELpXJOlGMO0auMnFB7pmhtOsRsw4s/BfJk3u8rXM5v9ekvByhPF9ZvnhSgYea1XEUBDP83l3XepHiz3EXwqWbznf2kLu+8ivzeUPzxbHf7pRwamxTtMI0B1wL8uHfN9b24iojZhUPTKuGh+2kbC5ymYKvEHxXmGTW1zgG8+psrE3nXDsGfq4IyVihIyGs4t2SACP3GXr78sg==
Received: from SG2PR04CA0190.apcprd04.prod.outlook.com (2603:1096:4:14::28) by
 SEYPR04MB7473.apcprd04.prod.outlook.com (2603:1096:101:1d6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 10:28:26 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::d5) by SG2PR04CA0190.outlook.office365.com
 (2603:1096:4:14::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:25
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 05/11] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Wed,  1 Nov 2023 18:27:44 +0800
Message-Id: <20231101102751.2538864-19-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEYPR04MB7473:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f7469afb-175b-41e6-5239-08dbdac54846
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	L2OYXETMwPgYlxuHwU4wozATeWFXqQFXmKG+8P7Sf2WZsiCM3xh1DrggxFn4yKEFPe/kPNSz6wMCmUYXMZwF+12b/GiI3AVZtGZggHrYmqNEraCDpQ8ufWDbowbL4MrB/GMWXGtk852tG3TQUWsZd7o7tGtYOZU2EPkVaWOB3J3w+TmCrxCST5n6BS8s0YeMZAhO46VizLya016WE6j8H3EqdlvZHrJgcZNFOVFFs/mo9Vud1sc/KLwW4XtDoqpWXDOHURlJclJBYhwmcy7v29FzaQ0o6koCV6iLxZgyYhQ4r1s9RaOzWEL8z8Ct2pUOlakyFu9uUNYteTtCvlQf6kabH1Cu4fM9+Cb0m0BGcTalgGMqMmsOHDfpcjvxLRy2/TJHKA1HXG38oHNKDcf7IUe8sTl7nD9GjFBY5jcx4QimXXL9cIrtriPwl/AcNthfDjfoAbT1H8JBII0GTQ0t/6qVQ9oUuccd5sLBLPJLCvVR1cbWSRb5/IPUNMOQpUCRv68uCkk0WY+rVlUC/RVAz4clkzXi5rWjUknEUgc+mWFQF+GfqwyYsGHgisrD3szLpYYZreGR3dwn9eyh8OCJaCugaUPaGsBa8mlE5gPMaA9Vpof7kvyBo07O8W/KJ5z/6hZFba2cr1chzi4wadtzjD6O61F112YkZp2BWmq2uKXAO4/N9791NDLzXc66aEJjt5vivdDWjHnSUYeKh9MUZA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(376002)(136003)(396003)(346002)(39860400002)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(46966006)(1076003)(26005)(6512007)(2616005)(956004)(40480700001)(81166007)(36756003)(86362001)(82740400003)(356005)(4744005)(2906002)(70206006)(478600001)(6486002)(8936002)(6506007)(4326008)(9316004)(336012)(36860700001)(36736006)(47076005)(6666004)(107886003)(8676002)(316002)(5660300002)(41300700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:25.6225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7469afb-175b-41e6-5239-08dbdac54846
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7473
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

