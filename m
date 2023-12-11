Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198B80BFD5
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:18:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iyeVTO7+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRmC4KDyz3dWw
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:18:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=iyeVTO7+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::601; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRfn52Rlz30PD
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME4Rrax7QcMTLeZZJvkj7pI45/91ZEhggIS3ChwSR75CJR7akRLQ0EVNYGfYV8yPu49PfNWzA7gpJY6MQjCe2EJ2u6sSeP4Ew6t96TWplNCLWzaxgpooYw8OpGEGepI74rDkkQ4cxpVXqhtpzjAP16XE82CxT8rideoXkIGPJ2qNCQ5bLAF7xIXq5fVOUG+DM8thZu7zuEM7alSOjyWeP3Qcv6+x204EPC3a6RidF/0fA5NuId7Rk9/Vx8x4h6NmfPXvE5lhD27BhzYpNG3hx2lR2koeBUEjXqzSRY2lgVKUR8RPJ7WIe1UXDxBVK6bjbp8Ds02D72m8qkS18cspsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=Au+GuaJ52DdypxV50ng13em8XP/ujFVadlUDwQVKr3zlBd4LnCDY7tYg+vegoaD00EF8RW4SdZH7ttjTa+UgrN9wfFPHlwqK8AX11fHkIlzpbVbd8y/LDumF3vhHUu1u3k2UVQbdw2lt1bfbWBtsw4BhwcAntLF0Svk0IVYcvBhqvEQvp7U/Odh7eMJlE/Q8L5W2CA8rxTI0UllNSWkNAw1s7ed9Sm2kbvH5auvP10tHx0/qrqrMP6y93tJpf7Cy5Fz0bAZ968MOlhlKfAaTSJZamsHUh4deq8NmhOi4LmfrEu9PBbq2n52Cnuryxo2AopsIUvVBwbPi89oZhWPtlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=iyeVTO7+7NjY5nXLDU5dt+rZ4QQLvFVXs6eGErBZN4cUxvvAkVypMm6pwVkYlNltenXZAcYCr97tCghTzvxfdp2JgUdu1CO2ipIyyhCKsM1fH0qHeWrlthiTcvUV6ysca/f8yy0jEBlAXl/X99bVuEe0J1Fn366wU1VOEFGaPg2jmL50H2rCAED/EVTrwS3ZQUXEmVm/A4vzsRihkXizQeDfmO6A7Op0l4P1oyNn0u7Km1flbSZHpkHVM8Qg8+n3EyrdjhJUbwnpA8qt4vNGTL5x5LCTT28ULfDim+QEn2q2XLYV/uAcCKor8rjKK8LIdBUx8Juu1IiJ6gGQ+qNdng==
Received: from SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19) by
 KL1PR0401MB6466.apcprd04.prod.outlook.com (2603:1096:820:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 11 Dec
 2023 03:13:49 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::23) by SG2P153CA0032.outlook.office365.com
 (2603:1096:4:c7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.4 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:49 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 05/14] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Mon, 11 Dec 2023 11:13:28 +0800
Message-Id: <20231211031337.4165619-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR0401MB6466:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0ac11196-aaaa-46a8-aa8a-08dbf9f73206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xaVisn8wCHffI/H+/9P22TrCQMvmwRGxEHhfJUwt4ePPb99yRaRmMm8yz6Y5c+mROLiHYM293G5U/Bo2mqaEr313BQAJOyyzZ0ek1P3Fxuk0o9yVdMTIk+SmfJYsSeOWPtzK352GVEYF2UWdgYhcz6oC84+2ZgiSQNOZcXe41Shvt/VAO1PSzy9Dea13f0SUWIDEykakkr6Q2sVmuRvS+zPicgLAxtYlRbOoTdgW7l7KXODLOeRE2uHJhDLTADm4jfpTQWACsBEqAGpUdE+/QTUqoMFBoqr4iUPaxe3JCeyneDlhg5EKVkxFho1srskyC6TY70GC3guDGfCOuEJmrIx/+Rhksnr1WxhXNCliEH2hKjmf4+Q82WHJDKVgsimGNADZpfC5NLWMPpmbA5ppRXnrjRFzkZ9mfeFV0Xss1bEcJnXInASN4oqw7N041nJKwyz1sbimp0vQSNcQNKUFxHL16klR4CPg/DSNuYovcjwJUvl/8bF2TPX4VpFyle6IoCaOqv6rGl7gfMUtnktgyRe+3Yo5mrPGt7qPsxBKgobMLuv2HxGu9lFDagRJY1tao1ZhUuNnzTv8xw64fKjnZvpN2wLT3281L9DG05srcThc2Cx7aFMMiV4YpqB7nceHqd0yDiPIrd67U7ryDj/kuvoYgF8IVgwqYu1pqb3wY3rNPvTyu2cfcej/GPEKCrcmXDaDigodgvbbBqHurXvpCQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(46966006)(36840700001)(82740400003)(40480700001)(356005)(36736006)(36860700001)(956004)(9316004)(8676002)(70206006)(316002)(70586007)(86362001)(4326008)(2906002)(5660300002)(6506007)(6666004)(2616005)(6486002)(41300700001)(1076003)(6512007)(478600001)(107886003)(47076005)(81166007)(26005)(83380400001)(8936002)(336012)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:49.1155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac11196-aaaa-46a8-aa8a-08dbf9f73206
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6466
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0e9095c83a59..7fe80ad271aa 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

