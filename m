Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 732937DDF83
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:34:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DqvggONF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3K42Z5hz3cRK
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:34:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=DqvggONF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::610; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BJ3ZH4z3cQ7
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJRoekaj1KjvyYKUe1VCOYJ543N+a56tEU6/8eQ0dyuy3hEbBStTwwa6SSZzJELlrAcHQsLI1A0WRmNlVk+N5609n/BB7VfCTNtisyTdl48kKxJBWjR/RX07Rn2oNZNPe/dNs9kKqMnss0CYj5n9dwm7+NQ0nitXpMGkZzm+FnPwNNWfkq9v276o3tQHNzW9OkCS8TcbfgHyZBcqwzJDlcUhEpxUEXBE1e5T9Tz9zlbWVb2lUeKt/2S5ePUlSzG0PSM8zSADM+lU1XEwNDqB01vqrFUiNoHIOHRWZBIJefQfEfPFquwjy3G16WfdNgTQLC6rgDBbjK9iLz8vh6N/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=U5T7uwn54XqPGhrppiA0RI9slJTMYE9SlREgYIyk5U0TIbsw2Z5XnNrWBFtBXMeyJdfzY+PG+Y/PvWeWnKXbZOZLBFM+0sHOmB1VyffQeTVJQ70EYziOyGaAcVkyqMurIFC9KOqpz9leGH7Qd/9tjHiOBCE2gawCKBKooE8LUwXctdAoznX+4Vei+sMDzJ6lVZQQtwQ1mA9zs0X8HJSYqqAJzsehGnx2XzI6bVFl2LP6CjiiwPHZv9+AwalmHsUfYm9+irtNdM/MhoaFpBRoBkdoOGaTGYYodnTobjZlwlbTvj0A41/rs6llxHELcD65T0lXEoYREW5JGI5wLx06BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsmK47O4uAWeM7dDfAnIa4yPQrzYmWUcPGa4gFr5YYk=;
 b=DqvggONFDc0M68YLWZtWzQnHLaXMtciM5wZEHW99kKMtuPdL38TFetOMPAgqcSlXscAr5vrb2RTJMoxu9OdW+44yuR6cK0pXze7RY80W1+gh8pZbU/SQS6ej5tXfFLaUpRc7mBxsxom/JHxZLkIcBfF2cmQJQv9yyBur5c5uXIJ4ndlg0c2OEwTKuTdEuP901/aBhHWnw7A04OB37Exg3w+ktxpgkc1k7RqgB0i7I+CQquJzqk1s3x9+iGQKUCFgQZiJIBKzyKauua4V23KnPdZqFwZwqzEbvr5BvH9j+qjX7FI6WglCAgfeCIBx6sN/jBxEOA2JmvQ68jymAPSkQQ==
Received: from SG2PR04CA0177.apcprd04.prod.outlook.com (2603:1096:4:14::15) by
 SEZPR04MB7052.apcprd04.prod.outlook.com (2603:1096:101:186::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 10:28:04 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::a6) by SG2PR04CA0177.outlook.office365.com
 (2603:1096:4:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:03
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 05/11] ARM: dts: aspeed: yosemite4: Enable watchdog2
Date: Wed,  1 Nov 2023 18:27:31 +0800
Message-Id: <20231101102751.2538864-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEZPR04MB7052:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2be74124-71b2-4973-5e2c-08dbdac53b29
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	17glrFlBC9yCPxk6CntXHQ22M0g6fVT49GX42w4s/9GNzb+SNRJ6dok2TA1DQrC4MextRweaGe+/RhpqAMAmpRO/N3SLscTd6Unq3MMeKoDhVjh+UA7EsjTv3yDyC9XSGZyVSSl02ci4YSwsAXvnET6ep/LmJlvwYlUFOxG7xLt8ofqzuZg2cqfOIdYw7wvfu0yhGWpp2AHv5IAEZWGRRkyYrDb/w1fHTWpXFozrI3WRX3i/HucRy6aWZ1e3KqzxncFKxEe5dnBcBfOOEtKqraqRvn5m2aeDxSurNrX2hTwF92+1vLfKostw1S4YwinM6G+n3SqE8HBgp3agB7J5+6b/KbPkQhFO2pCYfmqobf+xvJVrIXtP3O8mBDBJ7z9qaq808T0HbjTWQe2g3932D4U2dU+dVlsLOL2XCtKsjQzKw+s2aHRldfpjYc7HnOEZNJDM7rY/EXnJkKwmnuRmrwyCZeVqG/KKRcCTr3R8etL+4/r+9ckUNCxzy0CzIWOFduDB9URSFuYofrcupljZzXDehlB8NptWG9zZeEJc9jNnJqTVcluxPn0PykylamQAu+5LhNFntSzKHPU5Tzpxgg5ON9CuKKatpgxr01wsT/NfxDhZOf/hUOMnhvgIk9i+qQRN2XEqG4HIrvzhtt0H4/j3byoO+5+MdpoWFFEjWb8ednP7qLdH1dwFkZBFsCxdTKZ/PYXVkppIdxJfr1Ul8A==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(376002)(39860400002)(136003)(346002)(1800799009)(186009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(9316004)(82740400003)(36756003)(86362001)(40480700001)(1076003)(6512007)(478600001)(41300700001)(4326008)(4744005)(6506007)(8676002)(8936002)(6666004)(956004)(107886003)(26005)(2616005)(356005)(2906002)(6486002)(70586007)(316002)(47076005)(36736006)(5660300002)(70206006)(36860700001)(336012)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:03.6223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be74124-71b2-4973-5e2c-08dbdac53b29
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7052
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

