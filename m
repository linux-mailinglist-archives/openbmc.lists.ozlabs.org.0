Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC080BFC4
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:17:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qVqAY32v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpRkD6QhLz3cYb
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:17:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=qVqAY32v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::61c; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRfl70qyz2yMJ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:14:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AO+BKIHP44lszoXw8hVZ05svnibFKB/fqEdmZDFOmCy2sVB0BrCGw4xILoTVY97widDlzNR6xq0rIXk1uko+tQW7EchZfQe2SrSVkmx5/jkudP5Xr+1pqVuPfpQ7eBjrDphFd3B6yxAP263h0jvDybY4aoBCAyHg78YF6LlnGztONtBGodihFtm33DBhfL/3WfXVfZBPSRxBSjEgKsXE83OmpxjmBvlivOfclPbnCy78dP+uhMayWQouMBl+m0jjO17p9SmPRPr3Fpr+NX1l/cJZif76ejlE116PZDve0CxKaGgtoyjp3h5Mrp6eSQtYUMwxgKYYEDKf+LxJjYJ6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=nxHSkB98zGZLPukc3yoVehm+/KSquagUYEdnonJkT1EP2+Xs6Ay+Jh6lYQPCOySErsuYn3cRUsrK5+6pvz8bQBdipJasamB+qGzWZ+0yaD6TCxe52yJIFP0JT++eVsFQosNuhC1W9FzIv+yrY+N6RjmnMR5nMVLmIqtNj0K8+CTztCSNibEzQFXaFsPwtRjUWA+O/z3qVae3uGxOJlxQnwPiVKu7flA8TkPunbqBSfwA07owLOmDv0IqtUNgewv0CtliVvgrLb48CYK7YnOB0pLji2B2/cOTfA4sfQgdXp+36ndgIlm0X65MAnFB2HkbzHXTHhRQmIgb1XuGQucRkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POU9qli8Y0G3IvdZsP/n3F+xvU76du76ssEtkRE+ao=;
 b=qVqAY32vKw67VHKHN6ic1p6H17EExX9tXPmfuSilkJIbysVQKCwZSq3fbKeEK7Q6c79MtgjfI9GjE79YLLjEVhBpPzdzgcr3xRsLtTuiakldX5/P17Kc5vbKINDNo/kz2dzYaViZVtWEXM8bflgS7LMqkTPtdIs0Y0pCrHdTvsM39NtaAsVVLW2STqJHzLRl9JGjbdPbEbZQvOmmW3oOjwow/kplYqKNIIpqyFxo8SMMsTV3wwgs57U1Ul1zOQMtwVUzGtiAp3IY1f5PThg7P5LppmKRNvCh9c4sy0HEMg0vZQSfeDptiAkPlvpTMMeUmTaSXBR2TjrN3pYPrUzZ/g==
Received: from SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12) by
 SEZPR04MB7949.apcprd04.prod.outlook.com (2603:1096:101:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 03:13:45 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:c7:cafe::d) by SG2P153CA0025.outlook.office365.com
 (2603:1096:4:c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.3 via Frontend
 Transport; Mon, 11 Dec 2023 03:13:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 03:13:45 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v1 03/14] ARM: dts: aspeed: yosemite4: Enable spi-gpio setting
Date: Mon, 11 Dec 2023 11:13:26 +0800
Message-Id: <20231211031337.4165619-4-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211031337.4165619-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR04MB7949:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 010a5859-82f1-4182-d657-08dbf9f72fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	h/QyiOm4J7hiOcP5yCQvyJP3pkcr+IabtPJJbavxHUq1cZzyoj691vkqPur7ms4nUggijgnWeoY87QM6gEmpDqi3p0ZwLvqcsXtD58EW3lQP9k/ERfSCO3tz/m6K6D4IDybTymD0r7s78GP/s9EI+IYDQWQrsAKdbicYged9LW7hdlhJe37EamMw7wih6zRW/HJnGZZmK2lOgmc7ujKRPSeNdNa5KE1sqZBMXw77h8qhQ86npqZCIp88OWcTl/CBoT90bzgZJ9Y7+wZpRvk++b82KJA8OmzelsLGWMxjHFCIsYhoyArsLd2sxYByyngxXFtNTTKEyWNIeNJHxS9Ez9JOFSEXCNd1JHibxWYZCR5mBPssfvVTqi/yH72gUKdwApmO/SLrUecI+JTydvcAIv9juN93HnqwZHt4AxBEUvFWLtKHv2mX/y5MW5n26wvmi/Yy389mv9w+VivE7G8poKZ+MiDFMa+Zg7jrmjzni5M+LFEP2Bo4YIyLJnXw5cSvMx1C893g4z8sHdwLwNDaGk2D3CuAtYgwip27NEk7SIYPNwWNNlXqKTq3nyA/4IH7F0xpAfyelC5plgMXZuBYlag/cXrR5wDbqZuoFg4qMFzqB3NZW/3cF2yeI/5afXs3vb6VltMO+FRKR0OMLW/tAE5ekrgwHB7Ob16Y7Uyh69TgF9eJNUYcQ2k6atRH6tsP4OHi9rDnRrl2HPdUKcuDKQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(136003)(39850400004)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(36840700001)(46966006)(36756003)(6506007)(478600001)(2906002)(6666004)(1076003)(26005)(336012)(6512007)(956004)(2616005)(107886003)(6486002)(4326008)(8936002)(8676002)(5660300002)(9316004)(70206006)(70586007)(36736006)(316002)(82740400003)(81166007)(40480700001)(356005)(86362001)(47076005)(41300700001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 03:13:45.4280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010a5859-82f1-4182-d657-08dbf9f72fcc
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB7949
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

