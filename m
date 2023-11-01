Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03D7DDFB8
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:47:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sJ0H7MZp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3ck0tMGz3cVf
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:47:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=sJ0H7MZp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bm5SSRz3bv3
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVIbeOMTEmicnG5f8Zs7jU4b2DACozVoQ4e1RDngl0FF/cB91+0wzeF6TIv7Cy1Z7bGZfL6wwj5cCVRrU6FNFPPu9/qOWXdOmYCnGcSn9LxIdPMKFNS45FyvBcQeyc5u7LllNiXqaCLeBLGLyYFZmCRA5eYwtguZ91VWualU4iH4U5EUxv56zQszdH+9dAUfuHxC9tVywG/g3y9mWoAOcjvqjF9XF6M73PuDtXSv5waUjXKlzOkofQieB+FNf87ziN1/9S676lO8tD3W2vqSdOYm+ptEbapA9DMEPsKL4kSsD8COe0gIhyAPKDn66KBdlhoGNNVzoKQZqMCxF2dAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=UelNBt7FSNdG6WrrydoK8nZB5Wdxc6nFXwDdOmUxQtvSpPZ3PrCSsNTeJ8IwUupGwUHhT1XQx5dpujMN8I312P7fkWVRnpgAQv6qre01BohRIBHjcO2IxC6xedaTlZTleZMOnKE4YzyPTfJR7hmKRdp3b85fzXv+Y/fTFFJmDW9xkmcjns8CHUpnWpH4MrLq4hbyEZR/OYkm4ixo3//zvbK8AFZTSWhgE6UmWPUliWAfo+01FJh64PKHGo4i2tGyaaeEoOhzF5wd4EBNRXp3aLEA2IpM6ohu+fsi0GM/FGKkAoVAy0+erCpcZpKOSSoXnuR87AhKJo/KU28aCY1flw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=sJ0H7MZpKCcRQRGh3dG1cfj1tParzkZy94gTN61/+AbxpTZFIoiNF0hi1X2UkMaTuFUzOAQXLzr0OzFJ0m6AYeB6RBGY3/pazCYj2at8/pTqPyx0TVym03zh2WNruWamGUT6sOWKlfmoCowzPrAAc7yoScfdpwzi2h3Yh8PLSZbniTlc6A2NVZZwx+oO01hm/ApXX0t593NvvwjCFzVdW2KhLsOInyopoaRDTNIX/NPsd1imFV505TpwQN9cPh5AUcmLOzqhRAPXT7uysowQT/oYEey1d7sZrHOZTc88C33YXPO7WRZksIwwmZFnFrOOrt5mVb4xIItHDQx2GotsYg==
Received: from SG2PR04CA0184.apcprd04.prod.outlook.com (2603:1096:4:14::22) by
 TYSPR04MB7663.apcprd04.prod.outlook.com (2603:1096:400:469::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Wed, 1 Nov 2023 10:28:30 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::3b) by SG2PR04CA0184.outlook.office365.com
 (2603:1096:4:14::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:29
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 06/11] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Wed,  1 Nov 2023 18:27:46 +0800
Message-Id: <20231101102751.2538864-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYSPR04MB7663:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5aac548f-693b-4e11-c023-08dbdac54abb
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iZ/EHVRJm2LDCGqTFMLOp14jgYxHDHBNLyD9NSrkwxcUlbJR4ntt6POckgHNvD+FoF0xrXaBcikH2R0H+vGS0qYAuAd0BUMd4It+pw5s7zlWWp9towPHxFeimeHzlH5OpZkIfTI415MQuP2HlZcuBHCdeBaNhmT4NJccsRWZVMLq7ORvWuJgUeOAaVHSEi4Q6id2QS61znD8QmH5cg7sm07zBmYwqGb4nMDzbCA4thxfwzNyMoSGGd9un0qkLtfx/lO05CaS9sXRUKX3Tf8d4UMFAE3TD2PIT96sRpSx6XpQ2GY2VArAolzkbzBO1GXi+IQ5XOGN2aBk4Rza4T29EI/UzyAOZrpx/Qq6Lx2TNLDacOh4vB1WGsfn+c0Ye4fGc31x8xpcBnXc/G3Q7XCOMaF5cWN+fj7MYpMwFM8M+cHy5EbFGytJU8tFN4vEyEWQe6Fx1wqkSJSvgx2HbVN5kupm3vDUaZng3yFVw+AEzo9J6mdz4/XUjZLlU8vp2b+14aDGWmnHztYphF53N5RaOgn6qcik3HO4o9eM47ZNX5nOddZO/VCNVrHbUDgK0a++NZyeuYYeqVrPUNFTF74gHUXYVBNF2/dtczme7s1TJZqfSScYS7p7A4v7jfa3wMZAdoo4ibqNcvzlL2qcSfWVPhVF93aQ2+Ge44AsouW+82qZn7d4NLLOG7ziEGijqskwAw8SSD4ZmZl8J9XwrxgU7A==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199024)(1800799009)(186009)(82310400011)(64100799003)(46966006)(36840700001)(1076003)(107886003)(956004)(26005)(6512007)(6506007)(40480700001)(2616005)(9316004)(47076005)(81166007)(82740400003)(36756003)(356005)(36860700001)(83380400001)(336012)(86362001)(5660300002)(41300700001)(36736006)(316002)(70586007)(70206006)(6666004)(6486002)(478600001)(8676002)(4326008)(8936002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:29.7475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aac548f-693b-4e11-c023-08dbdac54abb
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7663
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

