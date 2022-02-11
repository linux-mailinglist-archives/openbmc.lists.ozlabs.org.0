Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DDD4B1AC3
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 01:55:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvwBr2b5Wz3bTs
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 11:55:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=i5n/EYhu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::705;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=i5n/EYhu; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0705.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::705])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvwBR39kQz2xvW
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 11:54:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klCZ7iAcPcnruUyje3qWhtvdg6T8aXzeJXKcdWtyhCujcpdDi2qf/Sxj5fFI7XwRgPJ+yHQwxGZfzEecD8lYe93/pDwAOWRZwLXJH/OXPdzm3ZhWHsuI+xFhWfaamGIc6xkTzfdBvy9oWh6iOP5eRD3hlRdG3qbWSr9aCu9hNVphH6it89AsGxK3rfCpyh8kG1loOa0oJF1JrwFHPOtUTa1hqHPkeOciAwYturySuKOzF4AerYrF35jSi9xCSGIE3InroAmK+R6vOamMkD5/Pp9mHeMoTQQUdDpvB8eeihA1dSs2cFWnlRsr0jkE9aTDaGhcps+1ef8o+oaOqDXYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=to0Jw+6+7y00bbTrDFq9kBHMuFbJN4n+MbcfEDIj5Q0=;
 b=T3OdZl5+QsSgCfKbUmT9Ju++sYa9MCMRV1ImA3aqGAGwkSZ897enexmCkMrUoAFys4AWBSCy3gQt/KiofrRYuJiQrMFVxDZr6/dMS766rewkcpcC3qqUolas1th1zJhPqjh3vWjuLYuR2R9Hrst6oxGW9uJk4zMPdBhyq/so/HeWVHNjF83KkNtxnMRNLdSVsm8JUgUo5hg2T79twhC0EveGLPEgEYrArbaOz1OJrtnbWrxpuZ03K1ODtbX522IV3AWI2gnRlFVusUIH4GTkCQal1PnAxWndUBy1s3ZMuLJubHtsurk5/5gJJBx+UtH35EU48+KstCUxcgGQRVOoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=to0Jw+6+7y00bbTrDFq9kBHMuFbJN4n+MbcfEDIj5Q0=;
 b=i5n/EYhu9DPpWvaYgj6a35meuIV4kZwk3lhdM/VwfhXdHZl2wTRD3wVyste83Ez1Vx0YzuAc2VxJyUDs5WJDXCEzt7+jw6aU93gcnDhvlgrnsOmLEzJy4Y4LWr7aJybM1wTtmgdiz6trs0gO0Xwe6i8VyKrb1y/StG7MuRFffeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB3919.apcprd04.prod.outlook.com (2603:1096:404:8008::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 00:54:33 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 00:54:33 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au,
 Patrick Williams <patrick@stwcx.xyz>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [u-boot,
 v2019.04-aspeed-openbmc v3 1/1] arm: dts: Aspeed: add Bletchley dts
Date: Fri, 11 Feb 2022 08:54:19 +0800
Message-Id: <20220211005419.14454-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a496526-c055-474d-2719-08d9ecf9114d
X-MS-TrafficTypeDiagnostic: TY2PR04MB3919:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB39199F66D59D63785260C6488E309@TY2PR04MB3919.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DhhV0YU2kJtKjysB16xWGf074Ri2DTu3WGB57Zed8rKLhhzUAQ6vpC3Z9M5lJrwPZqvV8o7PSsiI59hYJi0cdiCntD/a0fZnChzfGImw20ixlRcW+s26X8dxDlZ13/ZfRduXHobbe/X5dU0e+s7v+0OOs7jdBMhTB0204mj/9uR6ZOdj08BaBiF8qZyA4wy08RJU2Pp6Fu44y2adINYspy7pbPuZpwQ8RLFLbuR4F5ZKM8ls4SNzmz2oPBdOeuX+841nOdyZhYnptfER2LmIk+IPfF3+vABTrnBq8J2PT9BlE1fey2CFLiYRol5qjpYzGxHeWANTbSZWdPuJkyIVKMDv9BjN1iw5bNE+f9p267Z7U3NYYe8zJVr3IqVFWE3FaWNNLfdaVs1nrqyiE1gBeEtcanndxCTyLqJ82U5be00pngIV4NdNuD/IQ9gSghuUEbngLK4oAhrfq4St6JQGVqBIw4EFoAXIW1vyZDDhUiQsqNGi8haSVETOXa/g51BU/dkBQPmdpSbYBcsPbZUOwCFyuv1O7EipRIVOLX8eSggen7TAgQne6R/moMhlvOzL9kDhdyfVtKI4i61N+WpW2WqRJILMIoIKhDHAj9zJuZSEYlbqPYkDL5/heQ7cpVdvI1kYDaaGqtHfYeqOIKFgyG2kHcYglnB/tEYltCsOGP4HnfNHE0FcK6b0eenVLejPrsOdzArWQR+7SjJ+jAKx3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38350700002)(508600001)(6486002)(38100700002)(5660300002)(86362001)(8676002)(66476007)(52116002)(8936002)(44832011)(6506007)(6666004)(316002)(4326008)(6512007)(1076003)(66556008)(110136005)(107886003)(26005)(2906002)(186003)(2616005)(66946007)(83380400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BN03P2mmRdBcOKu4ioy63R2T+ezRy6zD6xaIc2imw7e0lDO3DL6sXEHWwfg2?=
 =?us-ascii?Q?sj+baezWgAvWH/tRffSCVx1RzkFpgVAgRBb319UU7ETZqU3bqLHjg0vaCpzk?=
 =?us-ascii?Q?yrbzbu8Bb0k4/fIOYcrqiCESWIJJFtLMgbkfrAtC4kqWNzxcn3Zc0ZE5H8ZG?=
 =?us-ascii?Q?pZYY8WAz40ENYVQAM6HC150YuN0yrg0iRne0vCcJeHlyPCButt+UFGHU1tZp?=
 =?us-ascii?Q?M39m5NTGrXBNBbbepP5i05XMzQkx19j45DBEqxyTsXPDz9TfqqjZlvDbdJNU?=
 =?us-ascii?Q?CkILQV1NC31/abpR5qGMxfYrlWGtDPFDAj0Q5nE7vKejJQPrBAxDnKRuvxzg?=
 =?us-ascii?Q?l9x0edDU58vYlek9NhCmd/UH6M6tgjLyw7xfsvmpjkx28BoLqwT4uMNJy0sT?=
 =?us-ascii?Q?stoEB+jKFd+oPiEsYMBcISOXk27sgxGkw+JNmlwDB406r6AlutTeVFl5DeOy?=
 =?us-ascii?Q?RDdpr95yKJxptHYwaLRT38rt377vjngGj1ckiTn6FuCt0OPBwDNrun4lL7xo?=
 =?us-ascii?Q?NM9YKHcyQF7QKEZkkT8S2BP1cIHz9QDQmhx6+3P1nzSG73TINHET+DFdO4Ws?=
 =?us-ascii?Q?59sLQA9zb86e6Y5uTWwETkCvKtAT5lx1Z95/2TF//IzFmk3WIywO/W89d9Zu?=
 =?us-ascii?Q?CQZn688u8xlzXtjW3Dums1HhppUIO2gTOlUnjy4oH5rIpw83ocbllAc8uvSJ?=
 =?us-ascii?Q?D5S2bpQd/vcqGw2+MsKKs0QO5fumbxPWg/XOIa7XANKH/xPwEcR3pMs3cE/g?=
 =?us-ascii?Q?weuRqss171biq8CyTHc9ekKfr2bY8Dyv2EXZTxt2XfHxCnxwgfoKL1sIPH9U?=
 =?us-ascii?Q?ISEhhzW42j3vh/HMdClqVM1KMQv2RzavfdiYaDkD8oFG9ut4e5XIyERLGD/2?=
 =?us-ascii?Q?jGLNlg5jJUbTz8uvjQdELXyGIfJkZUl25u3489OY/WElo8tAFLRdSbFYLORZ?=
 =?us-ascii?Q?Vv+WxVYxd8jXOdiH049wK+UQAU4gGwsqw+Bk3hel78xIj1u1/xFCYZ2TAf/I?=
 =?us-ascii?Q?fnTgpgRO9mUzHwPB5Lj5AwZ4wota00ShTGjVTEHI/riexzdivG2a2x3d9fmz?=
 =?us-ascii?Q?VOyCObbs+WC+4n/8n0tmNZ7YD+ff0JDImAxT0PTol3d3ZObQnlS9w+u0qVno?=
 =?us-ascii?Q?rGWDra8Eex4FH736vl2gAZLN0Ib6FK1SLKyRP4nb4DTZ6OrG7ItPB6+WcMgP?=
 =?us-ascii?Q?aTwcizzsSzye54d4XlmnbvILyy66A/iO/WGabtX2G8nCTotEnNcirviXfSJ8?=
 =?us-ascii?Q?Hgpp5ozPlrO/3dYmMFRCShZXrxRIHn5HUyYG1fiCxk7BEokPjXQXuxRKZP1D?=
 =?us-ascii?Q?ncoCGC+qor6u7KgHuilZS9+s+puFFGyoVLrCXE6nn0awNNRWgulZQTVfQe/n?=
 =?us-ascii?Q?Kwzyvsx7796jZkHzttUedGaReCKNknXeSXzhhu/ww3a4alBj8XIrBe02aBft?=
 =?us-ascii?Q?nCjxZNKEz2N/AGSn28rAMHvO4yccfH0GjEKwujKKyWbmg03M0fy2MpYKPAQU?=
 =?us-ascii?Q?/HFvuPzTh5HF6DhCZMwfUm5x/2c3ctmAktyrgGBn2WBCCDBiIkS4nSN/yI+S?=
 =?us-ascii?Q?K/iSDRIbPLUa2tHGwAo+dkN/JAQ/lbfcATGc82h8A2VV+fZpMxXugR2zYSFP?=
 =?us-ascii?Q?ErYmk4lCCw/TGeqvVVNZ3A8=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a496526-c055-474d-2719-08d9ecf9114d
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 00:54:33.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXEKpTGDeg6ObMaZcWzgIVb1kOx2M9MWsfJFX/r5en9TnCHbqeuu9PqPSQH4vPjod3jBe/Aci3se8irQEG2tEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3919
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

change v2 -> v3:
* update model & compatible to match with kernel dts

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
index 0000000000..57ca845b94
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
+	model = "Facebook Bletchley BMC";
+	compatible = "facebook,bletchley-bmc", "aspeed,ast2600";
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

