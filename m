Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C87DDFB2
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:45:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cCReJLTN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3Z748sQz3cjf
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:45:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=cCReJLTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3Bf3xFXz3cQD
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyUE/t//Wfohp5q2taAZrLrgtxyqUXLTduMbEkJLNEe7E9zh74nIKm5ttGvvbqiapq8O7heouE2jzwjgQcohq3QPB32Oa3YfOFQREyWvQ06eXab7ZoQ6aPftVl+iOVhE/fJJkj1dE9LWBSU47Bk0/1wYTtMKvYYarj7sHRIyTUcwGd4OKDZMLWP57cTOcqxI86clxhVjkxmbDKn+XbfPamVI38dR7uq8dHaAJP1B9Tykz4DjK90OROGVDApfj6/dFzDUANQDE1v0JwBaCHkLdiqhN1w6f5/vNaVW31fhOSuVWKrWbPCnTdYIc71+f76fm3Ei+FtfYiTxguusTnaZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=g+Kh0uDlSC7nc1NRjyTTe4wvP8WchpyzPeK7CAw8o0p7gzjvNBjFCbZNnO8bJPWudRdjaFyK1kC2wLEALKnhX2mmI2AHb45PhQYaHw0/Ho5LKkcpgFCviToEHA2IDAy4H3IzDG4lFbTTnvdb0CUnrr76vBtQ9PmUj3cRP/T619Lh8QOS97AptW2Bnsbj8zbZ636FucnK30vfBGdu8X4HvTaEs0sqtP0Dmo/9VJ3QBgaL9a3A7SRKIcJRLi+FCWBH4Ix/r1GfAQlKhquAf+HCUNff2TJzRkHNJzKXZwr7IXRWzuQH1Q5snpTdN0YL4yKAKFt45yuavdGFcbT/sBp2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=cCReJLTNG2PoHWz4E304igd3u4AioCTnnpK79dUqu6i4+UlG24ut8272Ry5V+Sa12VM4V7EfqhmuNgcy6izk7cDppSA18C00X1zJ2HSwGeCV/lHIOTMXu7HxQnSiePP6brljLmwYq1rkH5gCWSunEUsOqb23i7cvy8+PvmiOMIo51YFeeXRZ1rfD2m5HHJFRCOL/owvAt8y7y90di+siYP9hq0Z0HH0/wjGhSAPXA1uEOY9IVYkBUinEm4tfFLYgiZs/aVkMcFsaYPmM4pXA4djt3yj0gV53fY0wynitSOYBCvugRNAmfM0Ppm1TGNK6HNGhuIx3eD01HsLgyGlb2Q==
Received: from SG2PR04CA0188.apcprd04.prod.outlook.com (2603:1096:4:14::26) by
 SEYPR04MB6797.apcprd04.prod.outlook.com (2603:1096:101:d2::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.31; Wed, 1 Nov 2023 10:28:24 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::72) by SG2PR04CA0188.outlook.office365.com
 (2603:1096:4:14::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:23
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 04/11] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Wed,  1 Nov 2023 18:27:43 +0800
Message-Id: <20231101102751.2538864-18-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|SEYPR04MB6797:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cf34ce6c-486f-476b-eaee-08dbdac546fa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	sxZ7g/I19EiM7EP0dX9RgACWN4rkQOhjlLd1KHrEOoFjvKtAgWTpeLrUFcS9mNJ+XCvBqTcuLy+Y6n1W7zTj8x7OoIJLa1qTJ3yNyksGqXVa+pyRfB766VqzlEuTmhiOX3wfkcdjv6P8kIEdXO3FU/LTr5hUtZoqIbHIHRJT1DeWewP8GvtTRSKvjyB14K9dVFBzM0adpMdq9yMxF680IS0BpT4unQrh5tsmNI978kYHUliEvhN27N61gAq6/5nzd1rg3yZ3vq3OEqs/O4rcTPmGkV2JoRDdKMpY+lH2acjO28c5tNPExtUnNqzEqg00SdNOlTlYsIxQfOYUWnaYOOH53b+KeNGVZf2Bsc0uTiKQltf/1LYO3lwodUsLdDksa5vSLHx2g7wKJoLqac89bpM5OE+AUL6DW9IYXHX7VOsIHZO4dLIpRYQcSTzIrsKn+K4rdykZmr6O+KjmbXFzZmeX1Y/7xgm5IVP5ZekBDRbehCOrC+H/Y7xBYdf5ZYvibWw+gIjKUY8paWTeEr6OMqC9xGmDZoNU7v3f3xBK0UdnAMi6mwMgR4Se37FPladKAx1Pw7HbQ8wK58EiSLnohLechQLrD8i8GJD9wZrIi3w/czGsM5zmLLhZIt5xhJIsEXEAZrOcWpUCqU2Fgd97eOmxsy5/U5+o8QbelPxcQIad9PaZE3rUc4wJXlNGBzRA36hYyNONeTt7KhYrh4s6dg==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(39860400002)(136003)(346002)(376002)(1800799009)(82310400011)(451199024)(186009)(64100799003)(36840700001)(46966006)(356005)(107886003)(2616005)(26005)(336012)(956004)(1076003)(6512007)(6666004)(6506007)(82740400003)(47076005)(6486002)(478600001)(81166007)(70206006)(70586007)(316002)(36860700001)(9316004)(41300700001)(36736006)(36756003)(5660300002)(8936002)(8676002)(4326008)(40480700001)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:23.4506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf34ce6c-486f-476b-eaee-08dbdac546fa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB6797
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

enable spi-gpio setting for spi flash

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index c32736fbaf70..0449a7e36ff6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -53,6 +53,24 @@ iio-hwmon {
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
 				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
+
+	spi_gpio: spi-gpio {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+		gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+		gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+		num-chipselects = <1>;
+		cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
+
+		tpmdev@0 {
+			compatible = "tcg,tpm_tis-spi";
+			spi-max-frequency = <33000000>;
+			reg = <0>;
+		};
+	};
 };
 
 &uart1 {
-- 
2.25.1

