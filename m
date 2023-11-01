Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA827DDF59
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:28:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=P8iTxDHl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3Bn1mTDz3cNY
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:28:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=P8iTxDHl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::622; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3B83CsNz2xYk
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGeINAQ4N0tb4AsqsdAmZJAC3/GaskjNk2aRmvQTnJWRkvG3RIj2/9a3YX091azxnhuLyfMvPFqyGF+bH9mjO32lhJ6fTS8JRtJ509nFUrCl4oXaAkPnn1imNc7jKNmqeXDQsvkvxyF7zZyKcbWp3TEJD68LyaNi+J9XMv3nq0HwkEM4hqUEW0YgrsGn18s2RY4195heY8X50W1i99Uy6BnoabJNIxePxlU/qgcPPKh8EtcpHb8FLcWoZ1x/J+tR79TdV697judhAaICGUy1b2UysSWV0XLHCJ33CgjpX4pniAEq4RWm9eDYEk2QSam8ySstDi3mJrWQQw7Q1vj77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyHW3sqHJjkHWiDmJFLuBAqc6M8e+XLWt7SfBxA7Q9k=;
 b=A89jyBWQNDadsA3zWpkRmwCd4EURrqTWuCUr6KQCWaMPYZU2RzYEm4rLPZtauA9lu5jcSUXlF+8ZqA1bNw43rttucBjeGKaDXW0vLKsyvyQWtuAxSb09j08uDUts8brKJqTA6Oei8LhS5fa1Om/QF6ViAE+QOJa5SToO0CiDYOqpGQkT+40AD/b50Q0qVr045mh4AidLrbqErIgplejYFn+X5u0ALtSgHq27Ury6bp2egL7k7UdnmGue4XXFoMz+/DtEyO/fIpLk+97eUO53JI80vapeuHrpqLbY5aNNXriXcPxK3FYO6JQnG1Y2lLCasEimr+wxSDJNqgedSRy5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyHW3sqHJjkHWiDmJFLuBAqc6M8e+XLWt7SfBxA7Q9k=;
 b=P8iTxDHloxs/VrC1r8dE+Dee6EEMaQCn4Zy9UU3aOAaqtT2q7Eb2mujxbsN3L5Blw8QIo0YR0OlMjZE2ayNDGOVHgzG5qNkUbSW+H0PMN4at3xYnc0HatQceZLbFdX14AuG8WfSF08/ySk4EtMUG9Dpx3Xla/LibfHTWF8FF5Ai23dZm8d8gMX3qyrkL87IC+bG64dT9Zpvk5HGFyMDLZmRUOw8nG5mkoFHdXSVNPHVbdBkf2vWTDplic8UPCmjYxo6VL39Lrv1sE/07XCbbp5fyPaA5E1kgX7WukPmv9abVNum6dPDXZ6RiJxorhHqhJfMgxsBsld/JOElffrAiZQ==
Received: from SG2PR04CA0185.apcprd04.prod.outlook.com (2603:1096:4:14::23) by
 SI2PR04MB4172.apcprd04.prod.outlook.com (2603:1096:4:fb::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19; Wed, 1 Nov 2023 10:27:57 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::a7) by SG2PR04CA0185.outlook.office365.com
 (2603:1096:4:14::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:27:56
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 01/11] ARM: dts: aspeed: yosemite4: Sync to torvalds kernel
Date: Wed,  1 Nov 2023 18:27:27 +0800
Message-Id: <20231101102751.2538864-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SI2PR04MB4172:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f16be214-e267-43c3-6496-08dbdac53723
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	w2JwuC1TPE0QonoK79rDgk9C1vwVhQsbzq9NFfV4A9Mu3G+KVLle/+KriQMXltdPAfj06WNgUeB2XdlJOAdrqmCuOjvxPF+GP1uWqRZJ3HW9XPK6ntVZp7NnuKvXJtBTgokHmh6bEe3l6MxR4ViYUDY5bAJSL24D/TiQHLhvxLa3CIoVI9yLTEH4DWOcQRqPu9G5/vlzie60lFOZE93DOZbwWnd/PvFD14CMvk/ac5+fi+EgjL631EqZ1D9qJbkPaT59UcTPeEfe9hDnSpDWgRgjsMF9IQ+EBFLuYhE1J3aN8Xud70ngtb+vsP/Fz31UcbWirc+lEAPIR6aGvDuSEJxubd5hcN8v6WYun0IWbvxJ/xD1U51MLK0iW5BhZFio1VJPQmZ6mnxZh+WFR/hNfeGUivUc8mqBb7Id0XPIzpT7AK5IJ7nmMrqete4lzPVItGcMNPvs4oxNhP7NdJo4sU8EMR5WIRsa1atbSvWcynpCmQ4AZsoYwtfW8MAQ6tJSD/GRALacVzRuOG7D//dthX5uQkcFzlUmqAk3AxH225EkuFjHnJorlVi5MIW9T4+RIECf5pXIPymi+dFcxs3E22WTrQlwfuk1ps7Bltewte8wE/ygSdKLullpcaN9JVAq3vCGxZmn6nYGuhj8U1EbZSsUPg9hsbb9MD5cEC4NPDM8rXlbiiDk5J2Vjkp6c/dulGnRc5fI7hWvqvX5OTg0Vg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(39860400002)(376002)(346002)(396003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(36840700001)(46966006)(6666004)(6512007)(2906002)(40480700001)(6486002)(478600001)(9316004)(107886003)(2616005)(956004)(26005)(1076003)(336012)(82740400003)(36756003)(81166007)(47076005)(86362001)(356005)(83380400001)(36860700001)(6506007)(8936002)(8676002)(4326008)(5660300002)(41300700001)(36736006)(70206006)(70586007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:27:56.8567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f16be214-e267-43c3-6496-08dbdac53723
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4172
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

