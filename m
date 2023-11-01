Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4897DDFA6
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:43:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4ZLxfs94;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3X33qk1z2xQ9
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:43:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=4ZLxfs94;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::61f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bb0Q1Yz3bwL
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5fJobT/Z39ICHpedoSoxL6IWPzKbLxoJQkobs38Xg4TApwJPNlPxqhVkWtuWMSy1zad9Hm9lsPk2Ja/XaLmJ5j0NE8GntREHfZPpV69hqIfD8FuxKY5Lmuq8ZAMTtWma+hexfaF7+gZbaxAKfrpK21aXBGVwae0D3JC64oqSJ92SWq33GciQgm4qtVWug5sfzkv4vfu7GOB4qbHn0NuCPmV25tshCF7+thEQQZhzQTWsGSDkJziOifix2ao1fs4mzPvQWSn15PQLH/EvE5igybz80Cyj4xjjBcY6yNX5tJVc2D3Ps+nIlwONVdckOr2Z8rvSchTMPGiFSuffkOCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyHW3sqHJjkHWiDmJFLuBAqc6M8e+XLWt7SfBxA7Q9k=;
 b=HBZipdgKMzT1gyaQ7kSiwsafRivHFbAsCP+DBAudqIqVYvL/E8G2Lsf57HZ10PsoRibgGNw5j7h/vHn/6AL8drXr7MHjoaY2CW9bdw4tukEoHlu3cem6PSIFMcx6J67JM2bgmTCbwdEzW1vtQZc20ZniUHZtZW+Cu5k6l0Ji2a53ae96ECStCRdCyqpAV6OARYkfuarl1cmB1J6Hyp55AKad7UUnZAW9L+DrXkr5tTPMdlFw7/Ch4X+GM2Eb6pEnemfQlx1j/I/aJGaICyc6wmdvaMLbiM831oF14leV7NnmPEwXvTjoOTdbSZhiNXHKG3fgr6n+ELHIx1/YIfAmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyHW3sqHJjkHWiDmJFLuBAqc6M8e+XLWt7SfBxA7Q9k=;
 b=4ZLxfs94p2tUmPurdueGIHpw5DonMMj0pvwFR686CJwfIb0KLN0pqR1Xe+jNUaDbMNxzqAv+LHJWnkdj/Ot1WKi/nEMD4zV3IVAk49U221f9jmsxuaC8HP30pLMWiVRcsB1prNj8dLrv69pkfuUATIYeJV6GuMY+YNGlFZwJQgSY3ZL2qC1Rqnjr9WtBsPHWSpUTO95QHntMeFJsZLmHrw0KTIbLSQWwFlOt6HBfJcSxqRUEEiSJP4j6nCGPIoXOZigGwyFH0lV6OUXOD/8bzboQMOReKS1wFFFUKAuZJiAD5xrvNiXSafQHUlV1V28CGdypI/Rhq3QUmf9w42BAjg==
Received: from SG2PR04CA0176.apcprd04.prod.outlook.com (2603:1096:4:14::14) by
 TYZPR04MB4191.apcprd04.prod.outlook.com (2603:1096:400:24::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.25; Wed, 1 Nov 2023 10:28:19 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::e3) by SG2PR04CA0176.outlook.office365.com
 (2603:1096:4:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 01/11] ARM: dts: aspeed: yosemite4: Sync to torvalds kernel
Date: Wed,  1 Nov 2023 18:27:40 +0800
Message-Id: <20231101102751.2538864-15-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYZPR04MB4191:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a55a124-de84-43e8-b9eb-08dbdac54461
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6Uw9cXfqzDGomdgP2NWYV1jnaYYGhbFOynwUUVw119pcXGk1v5ZPnyTZ2qPYAH0SlGMZCjIILj7KHlgxn5TMgcNGc8MoK06j6Zt1qlI8vwx2V2GV/BkCdoHPb2NBGlz/bASJI0CYNc87Odo8wVZEJ0uuQjCwYVWAU9WVRu+TwDNRJFOWgsGL2+raarEfoEAwd2zjnRDkKoTf4SZPG4ps8Jd2OhKQYiMTesNbOGU2dykClicfMblpy2j/pY+zswlRHTdLThKO55SgPStEiYGnJo24RJOMCw+B5A1O48IVWnWcMrsVzX7M+itLAoufZDDMfy6MX/g8SRpWDo9On8lGU6XY7n8OgQC7V8z1NCfpToKXaRFq/BND50rSBhXZ4nkilQ8nThKD/2oR0rYswiHXPPoahpe0VMV3FVqobNYhli9rQfXEZITmYycTxqJwUbTJ/FXMc4YleIycEVeussR7gmjihazo59Cc5GYEbswxjClWI0TUM2YKHpwpH7ygubwzPeWjGuBqwbcABYuN8HHXSs3+eat/n3Ic2i99xr0QGuX7n4lfOfDkUXZpk7xhUfx7Z1cUi7MhYHdiTmH8htx6yzmED440fyw2TMKtOiwIjMjEptft8YQ/fxSbE5HHFKzwSZYd9xcUoBLrqBVSPzTdhFACudT2jNZ5dWZQxSbb0pmDJnxBy2oRXwv3nWgsUiGSg2ZXcrVvVZv/k1oa9hf2OQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(136003)(346002)(451199024)(1800799009)(64100799003)(186009)(82310400011)(46966006)(36840700001)(40480700001)(2616005)(956004)(6512007)(26005)(1076003)(2906002)(86362001)(36756003)(356005)(82740400003)(81166007)(47076005)(5660300002)(107886003)(41300700001)(83380400001)(336012)(478600001)(6506007)(6666004)(8676002)(36860700001)(36736006)(8936002)(9316004)(6486002)(4326008)(70206006)(316002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:19.0756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a55a124-de84-43e8-b9eb-08dbdac54461
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4191
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

Sync to torvalds kernel

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index a6777efc78b8..64075cc41d92 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -87,30 +87,16 @@ &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii3_default>;
-	no-hw-checksum;
 	use-ncsi;
 	mlx,multi-host;
-	ncsi-ctrl,start-redo-probe;
-	ncsi-ctrl,no-channel-monitor;
-	ncsi-package = <1>;
-	ncsi-channel = <1>;
-	ncsi-rexmit = <1>;
-	ncsi-timeout = <2>;
 };
 
 &mac3 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii4_default>;
-	no-hw-checksum;
 	use-ncsi;
 	mlx,multi-host;
-	ncsi-ctrl,start-redo-probe;
-	ncsi-ctrl,no-channel-monitor;
-	ncsi-package = <1>;
-	ncsi-channel = <1>;
-	ncsi-rexmit = <1>;
-	ncsi-timeout = <2>;
 };
 
 &fmc {
@@ -297,7 +283,6 @@ &i2c10 {
 
 &i2c11 {
 	status = "okay";
-	bus-frequency = <400000>;
 	power-sensor@10 {
 		compatible = "adi, adm1272";
 		reg = <0x10>;
-- 
2.25.1

