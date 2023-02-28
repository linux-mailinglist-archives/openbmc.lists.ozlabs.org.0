Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A356A56C0
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 11:29:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQtsN1bZJz3c9Q
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 21:29:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HhuYpTK1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::714; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HhuYpTK1;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20714.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQtrf1cP8z3bTS;
	Tue, 28 Feb 2023 21:29:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKNZFeXHXf+lVbXNzx78auIeLU74ruPeeJDMvy5pkNyXJolatCCnFbv6S535RfoHl3E8Xn9CP+fPiMDyVismykNnfKKwwNTfS+KwoSECSz1gGqh3La8vZkFYr8l5mkKHQGCRV6mZv08J4/CksAjxrA8GfedKo9GW4DjyZoFMhQnNcZa8j/ao15QC8GGMx8zAzHEgHj10rLtnkFsun85+QhJuQetaXxMRKdnY31W0jIvaxBEIPvmIQTVAdbonF1fX8HDU+y5EcN+4YZE3l+tJIQlBLJ1ivyEm+jNT+7cNTbKvpsleZi57jKaG9JBmplxLdZ1z3BTrplVtbz45KEnK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtU5KrXMAak+luSoccNhFtyihRo4Ke/yaUKzymOrtb8=;
 b=XuzpX9pezWgrjSt6gnJ0bTZ2w6W1/BPxu3A3oY1HHdWBVHrW+t5dwSCMgcLEMaZ33mAA5YjI8CX/Nx7kGrNwNYkjVXsrewLSQjW13U1PaT4SxRFeCGWngRvGSNPdPdbGzjk9beCFjaVIk1MEEOPqZS1O/2x74JDdWAX3HhBoVLeSn9lJy3r4Sv6f0Tf4Coc3fSU1wIXpLPOzoz5jShpXvbebm3ToY30SQw/BotZBppTWfx1lg4dZDtfBz4z+roWF7dcvoJqo4mzNhAtk1cYrSOgDUlm7RPZdyhaEXr1DUsUYGlJVUSx58+b1eIe4d8yZ1fsk3WCb5UG66j/JlnFkAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtU5KrXMAak+luSoccNhFtyihRo4Ke/yaUKzymOrtb8=;
 b=HhuYpTK1DVxC62r6mvnG0Q0yDWkzmIuZYytXQm9dJhrwJujdLViwOZT5UjCmJfahYXy6E9wTn4oSqS4DoadcdcU49cq/QTV9d+EOl9c6sCRZ7wHGVYoezTKiVpK5RkICyot9bIejrNxnKL0VcTn9brMpkRulgT/DxK7JO3Yha4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 SA1PR01MB6703.prod.exchangelabs.com (2603:10b6:806:1a6::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.30; Tue, 28 Feb 2023 10:28:43 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::a807:4f38:56ee:b079%6]) with mapi id 15.20.6134.025; Tue, 28 Feb 2023
 10:28:43 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: aspeed: mtmitchell: Enable NCSI
Date: Tue, 28 Feb 2023 17:28:20 +0700
Message-Id: <20230228102820.18477-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|SA1PR01MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be8fdfb-7961-4263-79d3-08db1976913e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	h7xM1aBDdz1hNugzGGdQ6DzivkDgmHdHHf1UfHzWKe7T/RHDyXMutr2sW3qE62njvhnLa1j6Sf9/GEx6pK6vBwbTPyZ8og8atrwHx8AHXEl3ZmisQGrS4DObUn0AcpnmmWmIrrVkXrH82y7ooJC1w6tcCG2Xr8SNo8PdYRr1Q8AA6dDzFtB4Likg1TfpPrEL+xIHi1af4oygEyFQvQ72F6+w9bW1cfsE+ZS2u7yFLBOgOBSRLkg3DCm/rXMzQ2bHB18HTfMJWwSFdDV9aGeU8HhoRdnS4eqOr2v49nMTS1G++bPQdOryrudVn0gKpdjZknPbLgMWrXy6yuIovjyjQ+alMaoHRPhyYUuiN5RgdVhWNzB9FXUVg1iW6RXrVUNceiLjuntoY4zG+G8JL6QqwI4x0vvIIfgw0SWnMAtx8SVhQeXSwhJDgWr0Dc+Lwq3GMXsiWdtxz3QekbS4pGWDkbfQxy8UQxmXOBoBV5vhL5XX6J82KLtI8/hrZy0OGVJTd1zQk6ZDsgZYGgwY0YoCtqi6oNNILR4EEgVspOVkWtUPixN8JlskO879PGAHA+AQqSHDwO0JwEuMQNu8ewHElpr7EI7VFfpiIML0jkp3eqbx8pGjoxOF0jfY2SIUruevt+cvm96O9dhFrtmK2nzop4nVDwYLasjwoXBJqgWt6imWVR/6rNp7SQFiWqdElRgrwYOoo6fBihT1cT6EK83iQ+Ij99Lyv24nsBsQygfJYa4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39850400004)(376002)(366004)(346002)(396003)(451199018)(6486002)(83380400001)(6506007)(1076003)(107886003)(6512007)(26005)(2616005)(41300700001)(6666004)(186003)(52116002)(66946007)(86362001)(2906002)(4326008)(66556008)(8676002)(66476007)(8936002)(5660300002)(38350700002)(38100700002)(478600001)(316002)(110136005)(449214003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Qanpld+8sPZENtfjR0v+3ds6OEfSrrlluLsD2kbeSfsOuiIZs2k2baY8iA2N?=
 =?us-ascii?Q?Ys8DHcaI8DnOl6x9Eqea/XznvsAHKbsfOBA635+x7peuBIcwGLAFYedD1zmw?=
 =?us-ascii?Q?BIipWB1cSkahdcI9IAHrk1OMLItWNX3fqb7TVm79zOehW7uUAHS8B56Gapek?=
 =?us-ascii?Q?4kHbVXEf0SVNan5IjcbbwbS6vug3jP/V8rFkJWQ0XxnfjUptODrTTiSkSWLs?=
 =?us-ascii?Q?CWBFHHjFcB7/F34E8Hwjfb2hShvF49a4SNB7vPem+BWRFJn/9fQzM5Z38/G/?=
 =?us-ascii?Q?2xL+gmAZJJ1Ek3G0Vr4QaCpJzShF6wDUoC3dngSoTkTb1XbgoiJ+pH52jI5w?=
 =?us-ascii?Q?kTFXXcS6qpEFK7YKM2UGIueVNHlTBLAkMttzc1rtKVuuadU7V2ZL/Yicz+cP?=
 =?us-ascii?Q?4swYN2ZnAuB4N41O1/yCOOoMgYADfr16TsJU+Qe2iOUzd5e+vMIxXJoQQXTv?=
 =?us-ascii?Q?KZCbRm5VFDfdCFGKhxM6DVexj3gZMjSVeAmEHQbVef9WR67V1nzIh2i+Xf91?=
 =?us-ascii?Q?nHyVCLLJXgWyUFHRC2v+PPxeBTsnqJG85xycxri9btH0SOZS4u+fE/aCitm7?=
 =?us-ascii?Q?Sab5o3kPeaU3hlJng8PaBOXkL+5Cu04RF7+hCm2wORx3DyDuDopO6RxdrGcm?=
 =?us-ascii?Q?uz5YP1jrh/6D1hNW1HwAIiu9tO1yhkOGr/Z7cWzF5SGfpP5hyXckBnxFmcbp?=
 =?us-ascii?Q?vHFht9qndfzCvR40jv/erltlYMlWSTFzAi1VW7JCsvdH1mQ05ngW/D45mfI+?=
 =?us-ascii?Q?9hgeZW0uTxphjRkn7CVO1Tk2wlK1bc14HsUcOUMvzkB8u+otfI4gAlRH5eln?=
 =?us-ascii?Q?G8PWv0ERCVm+W4DrMcShzmKqVmla6M6MsqmL//JSp4Oy+yv6bKaRN4+CsZWK?=
 =?us-ascii?Q?jEEuChNeBbJaWI3+A8V9u/wWSZ8qTW3wnSTn0K3NzxVibZ1vts0JVn/zTTjj?=
 =?us-ascii?Q?xTQX6vLUgIhO09TBo8waPhdsTZZjwnnE8Oy2JS85gEnXq/KNp0HmKnb32IpM?=
 =?us-ascii?Q?ISZka3177F6l3TOdxQKQWXi+9NU/IIT4/iQL9nzb490qho+b2gLf7onT1s+z?=
 =?us-ascii?Q?sGvlN8viLrEhVIrNIUO1sIjOP6Cc4alYiKvpzJZE9LS/A4yzSrNHiMgZ437z?=
 =?us-ascii?Q?dCF+0UaM0EE1ia1dcNWaRRrdKdIN+zco1W8WDRDadNSOmQ1VSNyPYKnAGb+p?=
 =?us-ascii?Q?4loAuA4pN/0uOg6lrWUt95tvBtv3k6HrfcOMOLeE8+6uX366vNJebeg/O2LJ?=
 =?us-ascii?Q?xpToZpv0foEwEUWn0/8rPJVmlYSh9IuJjN+CCiwvR/NKu1FmowHRf+3gh+8B?=
 =?us-ascii?Q?7jmR7qNHcVPV94b1mKkNqa8eTkKOOBuVy0kVLzsooHt7k6c2J+c2X/SpEw05?=
 =?us-ascii?Q?cF0h4cffcFcc73koDhm3WigQ0nEj7kf1w2rXJtGd5sFl7pkCc2HigRvW0E8/?=
 =?us-ascii?Q?uAswXlbJuX2xIwguc6kHN2vtULqOxmyFCEQg6cjo+d0Qd7y8wnErS0elxH8z?=
 =?us-ascii?Q?QQaiue5r8lST+Te6lMMG65v3J5vD4svxj2iro2dl+DxAZD7kXWfc1nKCrW6h?=
 =?us-ascii?Q?sHFHdS4xbpPFjjwNf4NPVeCdVxZTaohXsqet+dhSEcNV6iLPQC5xqks1K3Q1?=
 =?us-ascii?Q?w6WeIiReT/e4AfKDed3If1k=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be8fdfb-7961-4263-79d3-08db1976913e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 10:28:43.8089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKvFNl7Gdnd1m5S02Rqx9IRgT52VTYJqMRVgbqzCl7GTJ6+FsA7xdRVOEHyYfNgOm7poCcl2Wk99zBzQ5jO9ATmvVMywUFELkDzaA9+d5aaPTh9lD3DvylXB1sZ5wMZl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6703
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support the mac3 (RGMII4) as an NC-SI stack instead of an MDIO PHY.

The OCP slot #0 and OCP slot #1 use a common the BMC_NCSI signal,
so we use only one of them at the same time. The OCP slot #0 will
be enabled by PCA9539's setting by default.

Also, enable the OCP Auxiliary Power during booting.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
   - Change PCA9539APW node name.                     [Krzysztof]
---
 .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 37 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index 4b91600eaf62..1e0e88465254 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -251,6 +251,14 @@
 	pinctrl-0 = <&pinctrl_rgmii1_default>;
 };
 
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -439,6 +447,26 @@
 	status = "okay";
 };
 
+&i2c8 {
+	status = "okay";
+
+	gpio@77 {
+		compatible = "nxp,pca9539";
+		reg = <0x77>;
+		gpio-controller;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#gpio-cells = <2>;
+
+		bmc-ocp0-en-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_LOW>;
+			output-high;
+			line-name = "bmc-ocp0-en-n";
+		};
+	};
+};
+
 &i2c9 {
 	status = "okay";
 };
@@ -530,13 +558,20 @@
 	/*V0-V7*/	"s0-hightemp-n","s0-fault-alert","s0-sys-auth-failure-n",
 			"host0-reboot-ack-n","host0-ready","host0-shd-req-n",
 			"host0-shd-ack-n","s0-overtemp-n",
-	/*W0-W7*/	"ocp-aux-pwren","ocp-main-pwren","ocp-pgood","",
+	/*W0-W7*/	"","ocp-main-pwren","ocp-pgood","",
 			"bmc-ok","bmc-ready","spi0-program-sel","spi0-backup-sel",
 	/*X0-X7*/	"i2c-backup-sel","s1-fault-alert","s1-fw-boot-ok",
 			"s1-hightemp-n","s0-spi-auth-fail-n","s1-sys-auth-failure-n",
 			"s1-overtemp-n","s1-spi-auth-fail-n",
 	/*Y0-Y7*/	"","","","","","","","host0-special-boot",
 	/*Z0-Z7*/	"reset-button","ps0-pgood","ps1-pgood","","","","","";
+
+	ocp-aux-pwren-hog {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(W, 0) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "ocp-aux-pwren";
+	};
 };
 
 &gpio1 {
-- 
2.17.1

