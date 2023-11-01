Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B07DDF6E
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 11:31:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jOTidJF5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SL3Fv6ZVZz3cRK
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 21:31:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=jOTidJF5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f403:2011::600; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2011::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SL3BF0CD4z2xZG
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 21:28:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go1i68EAdgiQl7aTP/lg50sdBBcFHTjwosEg3+rezp/6vCdAk6PUjPUHkmelc1PK1lsorI9Aiuk9VXuWD5YbqStOnKAIO0sR1VMoi6vGMQyULD1MG1dcV6/zeiMV3bTWWVxh2nOtluvP9mcstFT4ofqkOqJaHw/Oi6mQKa8uOnhFfCPwFwAHD+zB9d5EgfD25Ikl+ixiV602tR5upAINQJc6Okn15RHQoe7+m3IyBlSVvch0IObNNjW7CRoa3Yd3vtLFig2sGktAs9ARogIV4DNizq71f1xqLJ8yHnysItt4UvtZPnSUHdRfAauRnrwHB7uChKmf7tF9FuK1AMnIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=hNxfZrEjvJzyCvgfPNoKsS5f9CQL9A5v8dcmtuokOX+JKEJhke/7JoW7RfO1Mo2Ej7GzlnnKUG6EqrkC0sBhqx3uJSq5/BRbTCP8d2S7WWmMvzLqiY4OgVXc/OOJoSLpHDD2616571jrBCtdcr5xJByqk6J+gsE+iRQ4tS7VF8sUdm7C3lbQmbbs4rbksDDWrL1xPy1ohZr2vEs6ug22w0wgrlb4Vh33DJ8849yc+mKTSLRTZJib2qGOm0tkPUT8MlDFjLCjczrH6mfiganJtuIYo+K3Y1FRq2Q4T8jPe65zJh3VVz6OaJbjm8joAx870JY/JlujFepJW1zlwvYDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=jOTidJF5TMxo+Mp+GTEC3TziuyR967TbHvewwGSpiUEX6u8v/u926iGrKBMn+NI+JzfMLlTY2q7ploLCJPnNG+1QYX1QzjIlLhM68oDwGgLS8CrDYKU+9kGFfWy9hTt/hKN3qP5kSavGATafZLYI2XHjBkcETFVbO1s6jvpNMIc8+zdegW7J4SlSfT7bUJcCimbTuQ/aROtxErgWLe1OqUJLOdFauuRF8ESczC30BO+WKV8jFOp9EWzrVSXuKQ0csLGN/vPeXWZS+4H5HSjWNVIfB2eHEGILXzX9cHYTgwySZqrl/hIoKL1VLj4cmO2q04IWOE7UrYIjt179zVvf1Q==
Received: from SG2PR04CA0180.apcprd04.prod.outlook.com (2603:1096:4:14::18) by
 TYZPR04MB6686.apcprd04.prod.outlook.com (2603:1096:400:339::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 10:28:02 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::c1) by SG2PR04CA0180.outlook.office365.com
 (2603:1096:4:14::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 10:28:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server id 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 10:28:02
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 v1 04/11] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Wed,  1 Nov 2023 18:27:30 +0800
Message-Id: <20231101102751.2538864-5-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231101102751.2538864-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TYZPR04MB6686:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 609e578f-509d-4beb-5505-08dbdac53a3d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	COeFuI1v+aQzBOpqaOer3kQFqMeCG6rGGPFcv0smz1t8K5TKTAw9hLKU2ePFUw6asSLk/WNfJsyKFcogMx84S4paI6DtgDPNEMXbozlOy9RAYfObTdz9+OgtVWxhSQMqVw4c2p2ooMi3BNg5zU5Ar4QxD+FK58g/8QmyQgH4qnG+EQT0Uve6hN8UQRSlLmTkWDu90dEhKdxbLSI9cePQgQj/sSzbI3Xn+fVh0BQX0SEwAWhZKCR4KaCDV7vB2vXXmvayq3D42ApHJZaHQbWOolpysErD8Hk5fKOvhjv0+nLtxVutO4UUZ89U1qJCXp/MFHvC61q7nqPGDh6neabQDza3ZbEWbZi725myDL/inzy63eTaqEa1iG5T25Jqml4laGdSZXfpoF4gC+szcAVYmKrJ7wPyaNQThyUmDvYwlKPxWliyezHKVl5or9AA/mr7hCciZLEUaOfWgvOBfWo/v9xIcV2Oeri1TAE6ca0sYpfP6bMPMDub3DxaF0CKXh4GjRSf20XHE5CaD6vS5owgfOeYgvA2w3j20yzo3tB1gv/BITqbu+/Ca0sFp0j2vQtC4duFDIciQkik9XuetbP7nIByV50pEXPP2MUuSzo2BG1RbsFQY8VExUdguA5YoaoJ4/ECSiFdh1jiT8WoJSBK4TvOQUWw/QwT/7S0U8356cYcnbp4ydxRvYLdVFSgpIDR7n8VJokhJdz0spZ5sQb/iA==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(346002)(136003)(39850400004)(376002)(396003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(36840700001)(46966006)(6506007)(6512007)(2906002)(5660300002)(1076003)(41300700001)(4326008)(8676002)(8936002)(478600001)(40480700001)(70206006)(70586007)(47076005)(956004)(6486002)(107886003)(2616005)(6666004)(316002)(336012)(26005)(36860700001)(36756003)(36736006)(9316004)(86362001)(356005)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 10:28:02.0755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609e578f-509d-4beb-5505-08dbdac53a3d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB6686
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

