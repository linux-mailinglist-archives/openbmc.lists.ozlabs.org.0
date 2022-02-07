Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D55184AC4E9
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:09:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsrgn4KBgz30QS
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 03:09:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=NOMTnpp5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::700;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=NOMTnpp5; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::700])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsrgH483Wz2xKJ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 03:09:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbsNMDKGzBPC9UdxUA1CSCNR2OovpPPAqhvpxaudljRnzYVvsiZbkKj8FWiSvPIY7nfJm9OTOp5v0ut1VcXUMW42PbPN4sLmAjPH6DeTolyDNr8y5jGEUtEYEvPBpZ9ATxmtqMFabniDCe7v/Z6Gw0FV19i4KPf5HWKBp83rgccrUCFwHnq/A4j1TSEzJBOb2LiidTT2R3/lkdMW6c+V+ZoHYa+otF9zZfS6UJ2p0AYUuproAOj4ssSQTOnkivfMLb3eJBgHbSHrN5BPy+nyRcyUoDdpbMtIh39ErlYdUY3/yFV6S4B4xjOtAdVockwVs8UzHVUm8hH0jRnB++OzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzPkrfpvJ1p2VRZh8IZIY0ZjRbIpknKir2zC4h4sIFs=;
 b=VD1dVNLEAeYaQI7ZE1u//iXR/VfYgthWlipL8frX4O+aTueTvN9Ixx9x29gLVwN8LmqEfiDiiQEqCfN6iJh+mfJOHhvoBYcfEa2aF/YmB6sEu31i0MxVzk+GUsKCZC0PxkjzifOdGhZ1I7YlAbu3F2Ed53Sqpl8JK54a42cr/lIgnf1hfKqC2qSM+T8bRVgm3ZejnsAQrL5w7ltLEPT5nBH1eiZvp5DeUH8agsVEIt5yIlMiEinV18VKcmaqlhRLAUNSN0GQSldxEwBDu+7toHNWKVE8VLESyDVoCNbEcZgqV3all7jY0S4xVmQNScfegO1E/ot7BSTo5EMZGhPGBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzPkrfpvJ1p2VRZh8IZIY0ZjRbIpknKir2zC4h4sIFs=;
 b=NOMTnpp5ZXTUS2rxYr/Xnave6wmD4m2RpmNz+dQcSL5iZ99tqU9yJfzd94mM4hGqARr9TZ6359mV8Y8kApFWXtvT+8ZZkBvvJSA3swcUPPTDfPVqHsp3up/jD/nv1djx72ty4g5qg7hGcE0khlCtJpbWJtSuZnhMcHAI1ag2dd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SL2PR04MB3066.apcprd04.prod.outlook.com (2603:1096:100:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 16:08:48 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:08:48 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Patrick Williams <patrick@stwcx.xyz>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [u-boot,
 v2019.04-aspeed-openbmc v2 1/1] arm: dts: Aspeed: add Bletchley dts
Date: Tue,  8 Feb 2022 00:08:17 +0800
Message-Id: <20220207160817.21102-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff4b956e-4d16-4d9e-ca6a-08d9ea541fe4
X-MS-TrafficTypeDiagnostic: SL2PR04MB3066:EE_
X-Microsoft-Antispam-PRVS: <SL2PR04MB3066F0C496CD66E6BECDA4C68E2C9@SL2PR04MB3066.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lk8SQjkaXHkerl1eDRvIW5GRYjHlGnJc3h3T1G67yWt8VE9lYBQJjRr252brGB5PIXjrq7410IT5dUTiBEV2N+RdgzkibDF7wTP6p+Q1uJy9qjyxY8qaHrgDlhgUaGGQe/tBZ2blwLysVnaa5C5BB3Dhu2JAM8JXQsgE/YrcJuZDkT6hcOw1BaFTKuT6keCjZCVXaYst4N5Az68gYUD0hg1O4872O/hgHcTWQ7veQgi44sU+5zPT1E8aCfgeHxoWSTnWMHbKK7GZLgEzWcRMqIeiLVYs/SHKUSMoRxeHF4GVazN6o1Om79X0iQlNuSPdS1LkxBbAWy1/FB0u5l6rtDPGYK/KsthOmUDgo17n+SuRKIvbWjsfwQAiy2ynIV3nxNCXg9eYnxGQ7idfZUmH2nWi+FUCrPUcWTPvYvrFZQtLwvmTBuo1awu/Rujxni2ymZdVrAr675LezzK9/UAOoPwHuJnGMekrbrecJuJO4EsieVSiWZ9qPTZbjhJh61CD5r2+c2i+Uj2XoeLWirL8TEBhmpiy+JnSYriY/49UsLlcWLPCoVkbEB+E/80Zarf2OyjnC80lD76nfoKf4S9CVGWVkSZZIocqUPlxY8AUZdoRNatt++gR9XrGPl+QS/tIcj5fsFI2fKmxAzN3DBAYPeUvuoKoywhKSOBXAKou2RY88ZPNaEEDPinubzclWT+wFH1bG5hR16PIFXsaJU8HSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(508600001)(38350700002)(52116002)(38100700002)(83380400001)(6486002)(86362001)(6512007)(5660300002)(6666004)(66946007)(316002)(66556008)(66476007)(8676002)(4326008)(8936002)(110136005)(36756003)(44832011)(2906002)(26005)(1076003)(186003)(2616005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ceCjGS/AmtV642iQ5A582TH3g9KBz7DqU2UvA1L5KcnZVF1YQledPg+6m44I?=
 =?us-ascii?Q?tMhSRPSUtPXbxGxD2Jhpls63O7C08zDFMg2i+DTV9Sqn/W1C+MTXgnDM6Hy4?=
 =?us-ascii?Q?Sw1b7gevzCo6+vyIBWKym+Uk5KF9b6qw8uDXhm3/gW86u/KZbc7SjTENdTf1?=
 =?us-ascii?Q?2TnJAkFeXewfr0FhgzgtfjSbJqvFrB4ph/8Hgr8BkTk4Dz5lvNTRXaFkDGvp?=
 =?us-ascii?Q?rnddyKT4o3vFf+voRJK5JLNdFMtjnLCeU1up+sQ2l0tZIDJeunSACiJSRZ2h?=
 =?us-ascii?Q?Or2JLcN7hPWEY4J5sUvOtEReqv7ajHEnGGnHTvMRv1qYsNdmWE9xbJcd0fs4?=
 =?us-ascii?Q?MasXe1tEi70G5LPD3bP5uzb9YQtRn8gQU8e+OkRrlIxuf04VSzQ5htJRdhQt?=
 =?us-ascii?Q?B42fSzHjlESYOcRyK7tI6OFzkmttn5O90gGby0EgfoeyRE6vGWhbmzZuwneP?=
 =?us-ascii?Q?Yu9GhX7BvzUdt27G1XEtIZqtMo7zl98ZWYiSRcJZMCbg5TiWh908FJkoLr11?=
 =?us-ascii?Q?ZfLQasj4q7wA7VzG7nUuZwAckOHnXvdTbcHjO0goWCFjrk4i4X8KTRP4348L?=
 =?us-ascii?Q?sVC1HloRYvOi6JIYQAAI1z4a1WkxvWqGGaHFhAzbIGY/bNRp/OfJhELuOtta?=
 =?us-ascii?Q?7M5mRiXbcREe2axz09OTbkGR2de8/cOYW2kcdXjzWbweJEvOubm3nSpPsR6K?=
 =?us-ascii?Q?TbGU2fkwu3M6C46R19p6ty96gD9sg8l8BS4Psb/N7ZnvE5XIxQQ4hbWJulDi?=
 =?us-ascii?Q?sB5fsGuhl+iVUFrftwUY1fqTekfyJbt7r17/qXeAb39/2J3uuJt4RYh1ZOUn?=
 =?us-ascii?Q?Iob6I119k7DWQSTvO6J18pz2skrQWGEfgOQxY/u+WlDjxrb7oTtZsyso94Bp?=
 =?us-ascii?Q?OHUDvQWCN6kQpe9OCZwCTXgyETgnQ8TVISqD9HpAZaxqqOjuPUGHDh7hNi2N?=
 =?us-ascii?Q?ygz34pkq+xjDHld9wjsCMfVkQm8M5xui0r4QBC70EgHJUpnNlm7KKt+UZuvS?=
 =?us-ascii?Q?aIge8U+J810hxeFr0CjWQxYHMA1bTdyQHztHfyUwHSFgKHxTFqd2U7nv2njY?=
 =?us-ascii?Q?SUXFR8Cb2E2KERtIX0OJDoOiv9LKbmkBbsHhcgTsBYgJ/XSpt4x+f8Tuwuwl?=
 =?us-ascii?Q?V44xv13Wiry6ZKfwdwBJs2YHAYU1oTgqGMS00G8ebW22cJVb8NpuX/0HZUu1?=
 =?us-ascii?Q?XBijqhwGUNhyxIK+OobVINGZAc2fi7e0xkJ6w5Ni8B+qpE0t9Z1XucE93m2u?=
 =?us-ascii?Q?eioardV9vh78vUXsXweDCnU1mQ+C4KkZOaUjLTQr9I2fPvqfxlHKlu8p4zTl?=
 =?us-ascii?Q?QtQWFOImOrKYPfoJTmIPU9fyEo1rZLM2F+vdU03sHMkqtQMMvayB5LwJ/sbE?=
 =?us-ascii?Q?yeUU//ToRGC7r7QnwBp58rPj4tvE82FvSWxAiTFJuWqjwEElHtMzLfbXauDo?=
 =?us-ascii?Q?3H78hgzZRI66avsxwyjKqY44KQLzQ5sKU0q0lot3ybdfIG5GS5emWNsh5Q+b?=
 =?us-ascii?Q?jYuNgfW4xlPtXgfUVGtmjcOxoQ2NtstZOTkpXQpU5GuMwXTc58p/saq6Z5Nj?=
 =?us-ascii?Q?1KeNIKloUL4ELcUeRE4nHzDCgCJ27CyNKlpLfV5U61qX3Xy+EXGq0W3CGcGG?=
 =?us-ascii?Q?GYMDpJk36IElBcMM95fIKxM=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4b956e-4d16-4d9e-ca6a-08d9ea541fe4
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:08:48.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avBVUBlYNe9csF6I+Xa5/X9/2HjJyTv17HClo9AeeKvSFKEabbITMqWUo2qM9j7DHMZHx0VrbDakjnRAtRKjiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3066
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

change v1 -> v2:
* sort Makefile alphabetically
* add licence and copyright
* update model name
* remove the nodes not using (fsi, emmc, sdhci, ehci, pcie & display_port)
---
 arch/arm/dts/Makefile              |   9 +-
 arch/arm/dts/ast2600-bletchley.dts | 223 +++++++++++++++++++++++++++++
 2 files changed, 228 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/dts/ast2600-bletchley.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index df844065cd..ac93a89c07 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -677,15 +677,16 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2400-evb.dtb \
 	ast2500-evb.dtb \
-	ast2600-evb.dtb \
-	ast2600-ncsi.dtb \
 	ast2600a0-evb.dtb \
 	ast2600a1-evb.dtb \
+	ast2600-bletchley.dtb \
+	ast2600-evb.dtb \
 	ast2600-fpga.dtb \
+	ast2600-intel.dtb \
+	ast2600-ncsi.dtb \
 	ast2600-rainier.dtb \
 	ast2600-slt.dtb \
-	ast2600-tacoma.dtb \
-	ast2600-intel.dtb
+	ast2600-tacoma.dtb
 
 dtb-$(CONFIG_ARCH_STI) += stih410-b2260.dtb
 
diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-bletchley.dts
new file mode 100644
index 0000000000..2417c95f00
--- /dev/null
+++ b/arch/arm/dts/ast2600-bletchley.dts
@@ -0,0 +1,223 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2022 Meta Platforms Inc.
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+        model = "AST2600 Bletchley";
+        compatible = "aspeed,ast2600-bletchley", "aspeed,ast2600";
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

