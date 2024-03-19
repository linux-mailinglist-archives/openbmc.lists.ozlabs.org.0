Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D387F845
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 08:23:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CeO0X681;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzNVR4ks0z3dHV
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 18:23:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CeO0X681;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2418::700; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzNTr54Brz3c4C
	for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2024 18:22:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk8BKhGKckejmnL3kSqbw+vSis7eBaGmlD30UVx3nVmQbfXuVc6w5lrv0BziBn1HWMBm3PGSO/e7ZDHtWF4DRpNT/pBYVmXCQH2CvsaZyA+mq4w/Z3KwQ/TWZGKfWY24Q/qSBL5W25//5qpzNaHtTveaU1VhfUjDmOHjL09UGmMRx9ZV+dKtNpFRN5k42h6JOBnz62x/cupgIa2nStKBXk3PHAa8kNbCvq/t5GkCe/y1WN7kvk9MN9uYbgo1U41tXnbVBzY1ifqXbO6aADzSma2D/oAkwvDMQ/gUhrUY9OyAMhgRvcx+bcmVWszUeJHMaVEIYDtAmFu9fokkAc85pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzxui+mDnOJo5yjcYaI5f2a/ZtCYAiJ7blCkvgdH/RI=;
 b=Z8zU/Xw7uiGNaoVBNAdLLEjF8FVheJojnRiRSNEpqlQxGOVbqZSmt8PnfwajrEoZ/h88MyVagjgYoobdi1U8v9ONc2rvc6QQIMU0i5TPK4FSSMgLUehVMULgJbT/GRQUlUm67+D5tUeSW4T1BW+GBPnKW0MwXdnsOKRVEAlFYBDHOujblv4h0H1kE0IwuGmi9+E6zfDmdrRIqSsNWVFfIQJ0ivoYt0AHEaVwvsmG8+hhlP8FwPftDBRU8vm+1n8fR46poowr7xXATIohTpbjSbYO86a1KYmLNeEGqpvb+UAn55nUlGdLvQ7tPSo0ByowKjZ9YbFlw740WkMaOlwqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzxui+mDnOJo5yjcYaI5f2a/ZtCYAiJ7blCkvgdH/RI=;
 b=CeO0X681v7TnxkgYVi/ei12X1JuZT1NV8v4Y5QdZ2lh4O5EpwiBk8XHWhnOFLMQESlKeGMlv4zTkJwOC84PsGO2cgNfQ6IQSgNvuOxtEXR81wIN3z6rlI8tRXP049w0wRecuDTJdp/99rOuVFlWwxmNA+IrtM4kSOJn4t/e5ya8=
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 DM8PR01MB7205.prod.exchangelabs.com (2603:10b6:8:f::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.27; Tue, 19 Mar 2024 07:22:13 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7386.025; Tue, 19 Mar 2024
 07:22:12 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: u-boot@lists.denx.de,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Joel Stanley <joel@jms.id.au>,
	Zev Weiss <zev@bewilderbeest.net>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Dylan Hung <dylan_hung@aspeedtech.com>,
	Graeme Gregory <quic_ggregory@quicinc.com>,
	Eddie James <eajames@linux.ibm.com>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add Ampere's BMC platform (AST2600)
Date: Tue, 19 Mar 2024 14:21:37 +0700
Message-Id: <20240319072137.16695-1-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:54::14) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|DM8PR01MB7205:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	snynIWfUZRevWzxqtwmHDGntLwhVMIDp32/oM9AbguBIILXvJv/ASqgIspgbJwbyhresKhxg4oNyTdkoVvF2n4ui73N8KrBO+SCK9nYE4IKgcsUD04p63SNELw6Lr1KJC7vuYbiTJA1TdUP9Z3btfo8eBJY64GXor/StlhJaHZj9p5KJ0+GVK77HCgD0XwxLwOJgwM0wg8FfzJ7Kd3MJ5CGc1skhbujWw6u1dO8MWmJ1B87MWB9fgqBiG/EC4gUyrunKppmnt3+9vqKwHkRMF1pEOLb7ksjHOrDCN54yTEdTv6ptgxPlMXcmRTWaF4tLVVdEHVFDfeJ3qDzbFWNc8khBY2I5HKON4NuNVzjoWX9pJ9Cd2dyFtuNsprWlhNuy+liDW9bh3+j2B4DjUTe6+CYCc6swQedoR+3Ix3NOwIUDvCtS8n3HqPABHbCa4vSBN/oI2AW6Sp9PB7nylIqxwq2bc1AamWa3f4bup1XqNkIK9Fg6L+dpw/M5uq7wHgh80lgDmht2mJ/uU2Cg344mFW86ckgEndnBfO9L73OK/o1CAdnAOvZjMBCH+cRbuIvGuGsD0dIIo4KC5sC5NNwO2x1nPQuTmFEYKCblxwFtdfsgFPQEB1ffGiQ/v8DppSDnN09aF+7KoaGaUPy6W8+i2gTFm5Y6nEgRdVbdrSK2jbhhKeIRTkxskijBrKWTytcj1U1ZAxOmZPzGYWUOG0aC85AgqNrTOfYwODfNgpwrqhs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(7416005)(366007)(376005)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?RHo7i2JM4gO+2vv9DrAur/0lG0/fMK/oPK7VJjen/JEh9XybG+/bDLaWkq7t?=
 =?us-ascii?Q?lr5E6A5Xv6Okts50N9jxkbcsKCuCB8PMt+DeQxjoQ5z/JL0xhfo9ezQbRV/I?=
 =?us-ascii?Q?PmzbJbCaXjkIOOW193TomIF4r4+MIUUBywswdAhJAiNYG1pxiJZSIqMdm5Lm?=
 =?us-ascii?Q?Wn+We7kI4VnZB4IsTBRXMnNpCnZUPZklCNmB5UUAaIdWw1aGZidLOvlMbt9r?=
 =?us-ascii?Q?qo9XdoZT+X1mg+km3tFvp/s/oCB6jgm12aybWBE4Jfss7KzR4agbKS45IRS2?=
 =?us-ascii?Q?FLVJXsVOQjvJj+T070o7Lol+6SmWUntowmnfF5UJhfzXu7rbP52ZNQP/+tUL?=
 =?us-ascii?Q?sDuKPFpDubh0CIPuGlKXqbqLZppfzItMev7peeOY3BYPHF/WG3/781wLw8Cs?=
 =?us-ascii?Q?gPfMtqFXhXvGnZz9f6Mqebgph2l8brMdHG6NOV8wjcFE40Q6D7n6Srv8g3So?=
 =?us-ascii?Q?sww7DmOzSh5VYNlZW0w81wd8FYVo6aqXRniTh5xJjz9VdKrvC7KRRZO9GO+o?=
 =?us-ascii?Q?azXtIBkHgvXYIG/H4hnXi9bcDqFT89hei3TaXZ8KSGp2ZJNp2SRYbll2iuXH?=
 =?us-ascii?Q?kxbIDpYqxoEu+mgypBeuQ9UEH2KOxPT7GLwoQSqbo7Fs/u+t+7joVOgPYy/h?=
 =?us-ascii?Q?+EJIBzasGo73tdcaTIcfjZ1C+uX8R9c9iK7rCGp00yCKJyM/9ukpzT0pLtTn?=
 =?us-ascii?Q?JpiPR+xb+AUybUfp1szrkMCEOMR+C5TNt+8Z7JVI4avlM+NXNcDWVkJKTYaj?=
 =?us-ascii?Q?havJUZ4J8rIjjYrjzTfNhQQpfTqSZqpvivYJVDzmQavTn6/9ETd/7R6DhNjc?=
 =?us-ascii?Q?6KqTLvqubpE2IbF4YQMjuTyWLFGAGcNnGqnfzx9x8kaVR3JX4Vdw7oZi878G?=
 =?us-ascii?Q?0Sc0UA5JtWIjVMl4nHg+incnZOXx/nlpqZ2+sFGYbYFxPLpM0/DSj9e6GC9/?=
 =?us-ascii?Q?0W4n/YBt4doTSmsGoHL1xy03/lyt1pkhSGtrFwWTbRe3xprWowkg/bVoYwAe?=
 =?us-ascii?Q?Tf27Cn3+A8lksvCCONcjTdQRWTrEUj6YZG0uK6cHx/yqSKG0ddbaoUKC9UYa?=
 =?us-ascii?Q?j17CpvPfrZjzrAD8NMj3ee8CXsYoNYDryuzFIOKWa91AnZHU0ryjTslgcDWZ?=
 =?us-ascii?Q?Jy5wNDscAXEL3MYHM2vhcxITUP30vFiL2ske+Dt87XP/CvFoft2s7rEwcvnV?=
 =?us-ascii?Q?37AKux5fisa4N455YWsDtVTQnR6ROyL+Rdnhc7aA0YyKKAnh0msYPqD/yT1Z?=
 =?us-ascii?Q?h9jnwhUB6bmsyoz/MgHGvUDADdtxAzMU8Zr7reE/TK8TAZMIXCnQ1PzMnTjO?=
 =?us-ascii?Q?3NylRHF2nXQw9UaqZMAKnd4ZXi1T5MIS+i1kdwPov1xC14AUfTmteHbBeCBt?=
 =?us-ascii?Q?p8CZnV+a6YDQhcOkOmgYr55r4CBLFuKi9wdDuxnBjp4vRZ73M3ZbcefEIfMG?=
 =?us-ascii?Q?jGobY+KYVyC0WJIEMVbDNGo7zB9VRq2pFyRd1FBGUIw7XPbI7l4dUOZDKJPP?=
 =?us-ascii?Q?2GMkg9wECYHwSesFJw+avvY0MyJ231dvCFIzrWp0rLZueivUsS9qyXMw1No4?=
 =?us-ascii?Q?o9bKCibI5HoYEyoHIIVjffmvLOXRewpFrNvMV3i973DoyuDVLUW9z1Ll/NHf?=
 =?us-ascii?Q?jAKTbVTJiPxjKBlK1rO7uXE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0194b9-f050-42e9-fdc8-08dc47e54ac6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 07:22:12.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yK4g2K0s9h+TEZe25SfJj9Pm1kj5A6yx0Y84LMCQNNKCsNpbltHYh2fjYR8AP931JUqeZvJf/gme/ouNuXXYhCS3TXzFpgcQBbnxiaKlKPHptHNtsD/FXbuKV/Gnl0gb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR01MB7205
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the initial version of the device tree for the Ampere BMC
platform, which is equipped with the Aspeed AST2600 BMC SoC.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/dts/Makefile           |   1 +
 arch/arm/dts/ast2600-ampere.dts | 113 ++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-ampere.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 37675a3277..3642d59c89 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-greatlakes.dtb \
 	ast2600-intel.dtb \
 	ast2600-ncsi.dtb \
+	ast2600-ampere.dtb \
 	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
 	ast2600-qcom-dc-scm-v1.dtb \
diff --git a/arch/arm/dts/ast2600-ampere.dts b/arch/arm/dts/ast2600-ampere.dts
new file mode 100644
index 0000000000..63088703a7
--- /dev/null
+++ b/arch/arm/dts/ast2600-ampere.dts
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (c) 2022, Ampere Computing LLC
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "AST2600 Ampere BMC";
+	compatible = "aspeed,ast2600-ampere", "aspeed,ast2600";
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
+		spi0 = &fmc;
+		ethernet0 = &mac0;
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
+	pinctrl-0 = <&pinctrl_mdio1_default>;
+
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&fmc {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fmcquad_default>;
+
+	flash@0 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+
+	flash@1 {
+		status = "okay";
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&scu {
+	mac0-clk-delay = <0x10 0x0a
+			  0x10 0x10
+			  0x10 0x10>;
+};
+
+&hace {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&acry {
+	u-boot,dm-pre-reloc;
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&i2c14 {
+	status = "okay";
+};
-- 
2.17.1

