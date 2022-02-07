Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2154AB36A
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 04:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsWmh3cFqz3Wtp
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 14:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=J92/YuN8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=J92/YuN8; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsWmB66hJz2xX8
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 14:27:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTKe+9wrrFxqhaifeUqTs1UVoKhCHIhIoI/wKHWMj3+0SxkinpWKNdd497JOCPt65BjXBQtQJAZV6WftjGqPn1jwKqPAUll7uYozDAsRin/G68ki5VAozhzPNBYPoJ+JwBkAn7wNRepWvIzA8mlgmAhcGj8wVeou5dP6uKKJI3ZnJ4NfSzTsPhqM06m/gPkg7DiJ69w6X9th9r3/A4Vqw+YhZmEYOvR5vsCaGHES4oxLeIgehsSrjTP+S+L59NAPORaQ55bE/O/to2bJ4CAYYxtoauZk2AxjLAK3521FRbvX/9A3QHwW+ZB6ZOGDlbpO3e1XUxIHs1GtCpq56VPbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko7VV8iVoGdtoMwhSyz2iUFnNfVegCff1qozo6bhwkQ=;
 b=inVOH/o6tikbypwUId8M099a8/TtocSbgmXZT7C6RItm5DjfMRf2kg6keyvdpSFfb1getPZrTw8x9lv122Iy/WOSsVbe+vkjRkPGbMHIOPapoi+2A0EDTJqH5WZkV2Bqdesvuv/DbrCiVv2VQIe7VyPGwyXoN6fsNKVIBIHLHR+/0tmg0fFk/KW9D2dqf63EQYebrKaPknwML9op8gQndRuFXb8icsb/vgMPZfo0FWn8QAGsTMv9lzbix7FesepqQ7T7QEj1Iw7clIbg3a5PLhvFY2gXu9JeiQXurfnfYaV2t6lI+8E/UoO1ZdVTr8uXsby4kL9G9v4L2p6Y0TV58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko7VV8iVoGdtoMwhSyz2iUFnNfVegCff1qozo6bhwkQ=;
 b=J92/YuN8Hmr5mUX42Smp5zMwW5GrlaxYJofBVEk6fdNG3uAQgVrTO6Ou+Mr+qnBPiX8Jmjbmql30b520vQ2mIdOTDz+EciYdtAWPRpj8iY6DVTQIenkfHPsma5vQCZ39SPDUK7IZzAuIcQ2om+tDpN8p5Rc+PVU/KqY5PkkI/ow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TYZPR04MB5038.apcprd04.prod.outlook.com (2603:1096:400:12d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 03:26:57 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 03:26:56 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [u-boot,
 v2019.04-aspeed-openbmc 1/1] arm: dts: Aspeed: add Bletchley dts
Date: Mon,  7 Feb 2022 11:26:41 +0800
Message-Id: <20220207032641.17889-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16cfda09-6a0c-4554-f1c6-08d9e9e9b169
X-MS-TrafficTypeDiagnostic: TYZPR04MB5038:EE_
X-Microsoft-Antispam-PRVS: <TYZPR04MB503817F270DB68E54983392D8E2C9@TYZPR04MB5038.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2HC6rGpZQt2vym2xSHUAtdtjH/4ltPWosg7bC38CXtRz/+QBkEQ6mbp0UwhCZ7wCjLxUW66Nf/ecOBXuFL5U8C/G9/dQ/WzRVTrW3/kgj56wWyo4p+hO7UqYjLI3oNrPyJxtomKDVdN6UPlsWT1MW/NvE8zdrTU93gFNxAudczkC0MI2KcnXBrchqoSg7whRxeQRgT02DxSs0tOOivz5thTjUOBRYAtGNUYMQ144sIRr0wqYxNfDe513ha/HsOQPH3Z1O+xUMZlupmd+5tIn5MEftL8fC6hxMYO0ihmqEpXmW7+TQPWrZprPRf2EidtZ+7NfJkoom4WgF2R7tb1p6UHkka4lsBHKtHEut9n3VP+4ydIRUUG5R6AxK+zc4RsybHGTLVK3Z3yu+CsA2Tqs5YAkoD1Vn4pv4L2JD94xDdeFLF8Vc/cXG+Kbnz3h7QJOs5F22Kl4uepwpkZFCjyRUoVRK2En0I+LfvkLVVl2rDOnYk9wK3z7dTVyJmt04K2YCn6/3j6d9lFy48SWzrb4yZFi3dOKBkBJsC/YtO7M7PMUhlofuApMoxbEp7YdERyMjO73/4LNa6aP8HPuI8Jjst8Ut+xwSSIqD4J1yBb6b6jEl4RiPxANMeO85xAZSVHfy1Bo/ve1JhViPlru83JyNBIEoQrfDQAwrHQjoTtvh0clOtgPRncD8+m4zaOFzQleYZZghB+nxNHB9GUps4wPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(2906002)(54906003)(107886003)(83380400001)(1076003)(66476007)(44832011)(5660300002)(26005)(186003)(2616005)(36756003)(66556008)(66946007)(52116002)(6506007)(6512007)(6666004)(6486002)(8676002)(8936002)(4326008)(38350700002)(38100700002)(86362001)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CMdfzK4fc8bZobyncTdFGywD7kdu+7IMh9YH2kK5DjE+lkCE9depBBBHtuuC?=
 =?us-ascii?Q?C9Jwci62Be37GJqIuIoYi0SBH5c/FR+aitP4t8fC1LsPNtXdH78JxyKNP1Tt?=
 =?us-ascii?Q?gYI5Z+EGjpFPX7qy+2hsyWZcNiJnrLq0K0as2/HeOTtB13IjqmAF6j+ijLjF?=
 =?us-ascii?Q?xNnHEPTAh3UHvl2Ny52+pR5XOfLZCdCLWmAOcagB59YV4GZr9M1bTbyXAbZI?=
 =?us-ascii?Q?WT/rmKUXNhead61I0YDpmNajc1eNabArXPiLhN9FOqjEq5t46PdBwhgTEnYc?=
 =?us-ascii?Q?4i+SXEP+QhGpOEZ5YI//hrobcWvrQZ31pYJjlRCcLFnSEG3OYkHHQMCQyGy3?=
 =?us-ascii?Q?5SH6jP4XJyp3fBXw4popS2TR9ySha7C7MaxqEdrynypZoN1RFb4MNNYICYnt?=
 =?us-ascii?Q?DMPMGYUr1aN99F1CGg2Mj+HnKnNrcVvsHI0FJfY6WAJs6D7Kpue53eU+Kden?=
 =?us-ascii?Q?BQMgyVJRYU/v8rYklxZy3GlYMUSayeHCDlFl4T1jSfneccqytX2tCsH3Y60A?=
 =?us-ascii?Q?kFE903Dm1x+RGcscu3se7yka0IZ2Y9576hijsEq6BmYoeGgdMumcWrgk6Zgo?=
 =?us-ascii?Q?ihgTqi/nOKJCGNg0kSyVAZa6IGZFW4/2FHeD5kP7EtjUgW4NGHzv1H9KASAr?=
 =?us-ascii?Q?2W1RMvN3SvHodNvPRb/YRTVp8ZIgtdbN15IgsosxHfP7+cxVn29rhXfT8qJq?=
 =?us-ascii?Q?b58mcqboqN+9CZIL59Z6AsQp3rKAhMCFaDSQsJCOcC0xAzFjiSC1BAJPCO9F?=
 =?us-ascii?Q?k28i26JPMkMdDLftCOe88J4yyYj8ZCBKmbAe5xeVdwueyLXTKQXZnxyrrTjW?=
 =?us-ascii?Q?olv7LZdGWODM96UEJxbVV43QBGy/oooRAJnZJzS29znDVWLk1IzsoqYeuWeF?=
 =?us-ascii?Q?mGYWiuexx66wYJcmXhQHaAZausPrNTwYSCN9yGBuxZ1/I9g3c1JAhpKbZ9xO?=
 =?us-ascii?Q?rTZtnR3bRsziczzfGHLv6FHvPqeyhjLC3X/wI9eFbpYIqDqxFqFdyXDCF7cm?=
 =?us-ascii?Q?y8pkqmocuN70h68pnxl3evM1tkCJ/iIxc1jN83U//Kbl7rACXnFzfG5zCjB2?=
 =?us-ascii?Q?6W9IZhwFS9qNri7xFTyB9FLO5J8lFLAjk0SLxsdgnM9uMBzzSg5bzyFTBnqS?=
 =?us-ascii?Q?2IV+Unz2/oeW9Isy9JcRfQmMxov20lWm8hjPOi3xB078/bbDDa8f7U1pUXue?=
 =?us-ascii?Q?16Pv/hn2kevgqHiCn1oofZRTLQjncdwyyu6sWsl0/5/gKukr9ps62rq5ElM9?=
 =?us-ascii?Q?RTFBY2Ge7gR8ZjaiVz0LLqqDgITPi/+IW/NXvt5vbOdMgYq1JI5owHQB3rSc?=
 =?us-ascii?Q?ZNU+YTY/DVj8h1FuTv/J7CGc5j3/VK3LeFvMHCTrwc8BbGfPWMQxqzPtRflJ?=
 =?us-ascii?Q?btzSG8AsFoFGOAYXt+kn0A+CJyvvbKtzmUcGCyw5v4ePr5PlgWZ4eB5ObHoQ?=
 =?us-ascii?Q?fHpMkQPavcpSlxQyI9w9poNK/t05ohUUT90+hG/qIqYyNSuwbjutv6TaCKU/?=
 =?us-ascii?Q?YoGb+YFiOD7v7uMvAxxWB9BLfAnUKjGDAISvttZzJ6OlMqkOv8qrlgnN3ox8?=
 =?us-ascii?Q?SQuAjQoGtSujaXtMUTcFdM+IlKHzgDjxLV2X2kQxGMTouJ/iN9C+g20nh/uC?=
 =?us-ascii?Q?WIlj1S+jgVDaiO/XBrKD7DU=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16cfda09-6a0c-4554-f1c6-08d9e9e9b169
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 03:26:56.5610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxhzPXgVLNry1ihEERBVMAxEKbhik4dm6cyl674pdv45wU4QHWx3QcQa3n8VaGSXw2MCV0WxEyWR5TrgB733UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB5038
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Initial introduction of Bletchley equipped with
Aspeed 2600 BMC SoC.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/dts/Makefile              |   3 +-
 arch/arm/dts/ast2600-bletchley.dts | 285 +++++++++++++++++++++++++++++
 2 files changed, 287 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/ast2600-bletchley.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index df844065cd..a172a9f8c6 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -685,7 +685,8 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-rainier.dtb \
 	ast2600-slt.dtb \
 	ast2600-tacoma.dtb \
-	ast2600-intel.dtb
+	ast2600-intel.dtb \
+	ast2600-bletchley.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
new file mode 100644
index 0000000000..ec14898400
--- /dev/null
+++ b/arch/arm/dts/ast2600-bletchley.dts
@@ -0,0 +1,285 @@
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+        model = "AST2600 EVB";
+        compatible = "aspeed,ast2600-evb", "aspeed,ast2600";
+
+	memory {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = &uart5;
+	};
+
+	aliases {
+		mmc0 = &emmc_slot0;
+		mmc1 = &sdhci_slot0;
+		mmc2 = &sdhci_slot1;
+		spi0 = &fmc;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+		ethernet2 = &mac2;
+		ethernet3 = &mac3;
+	};
+
+	cpus {
+		cpu@0 {
+			clock-frequency = <800000000>;
+		};
+		cpu@1 {
+			clock-frequency = <800000000>;
+		};
+	};
+};
+
+&uart5 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&sdrammc {
+	clock-frequency = <400000000>;
+};
+
+&wdt1 {
+	status = "okay";
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&wdt3 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+};
+
+&mac2 {
+	status = "okay";
+	phy-mode = "rgmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii3_default &pinctrl_mac3link_default>;
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+
+	flash@2 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&spi1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
+			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
+			&pinctrl_spi1wp_default &pinctrl_spi1quad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spi2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2_default &pinctrl_spi2cs1_default
+			&pinctrl_spi2cs2_default &pinctrl_spi2quad_default>;
+
+	flash@0 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@2 {
+		compatible = "spi-flash", "sst,w25q256";
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&emmc {
+	u-boot,dm-pre-reloc;
+	timing-phase = <0x700ff>;
+};
+
+&emmc_slot0 {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_emmc_default>;
+	sdhci-drive-type = <1>;
+};
+
+&sdhci {
+	timing-phase = <0xc6ffff>;
+};
+
+&sdhci_slot0 {
+	status = "okay";
+	bus-width = <4>;
+	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_HIGH>;
+	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+	sdhci-drive-type = <1>;
+};
+
+&sdhci_slot1 {
+	status = "okay";
+	bus-width = <4>;
+	pwr-gpios = <&gpio0 ASPEED_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
+	pwr-sw-gpios = <&gpio0 ASPEED_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd2_default>;
+	sdhci-drive-type = <1>;
+};
+
+&i2c4 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c5_default>;
+};
+
+&i2c5 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c6_default>;
+};
+
+&i2c6 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c7_default>;
+};
+
+&i2c7 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c8_default>;
+};
+
+&i2c8 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c9_default>;
+};
+
+&pcie_bridge1 {
+	status = "okay";
+};
+
+&h2x {
+	status = "okay";
+};
+
+#if 0
+&fsim0 {
+	status = "okay";
+};
+
+&fsim1 {
+	status = "okay";
+};
+#endif
+
+&ehci1 {
+	status = "okay";
+};
+
+&display_port {
+	status = "okay";
+};
+
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+	mac1-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+	mac2-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+	mac3-clk-delay = <0x08 0x04
+			  0x08 0x04
+			  0x08 0x04>;
+};
+
+&hace {
+	status = "okay";
+};
-- 
2.17.1

