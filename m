Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC961EB61
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 08:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5Mv34Mlcz3bb0
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 18:15:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rKZaH4sR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.112; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=rKZaH4sR;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2112.outbound.protection.outlook.com [40.107.94.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5MtN6nzFz3000
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 18:14:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHWOfHKEkc3vF4oYpWGWphaPtz2D0VCXDCmrQOptckmQOr45f6GSiv28IxjBPs7OH9q7yBFeqQRiUrm5C7Eo7hvvAdPC5zvEhPCiTfR19xOKShSKyMqQCJ4H9VsT6u5vHueHId7PzIee8U55SA1IzDcOMZzXVIo73Zesb8f12z5FWM9oZiKFcU8v8Z0l4Gt/fKfY+jHE1CBG3PviPQ3JbZOjAhnnqSlJJMnhTJm4eE0UqWQQJ0yJZTL9Az1I1DT+ICaw9EXeVwIM36SXS1NeWTKJqzCfe8AWTdEPjJU/x2Tf/CwzzOh6ddezoxfzM2KU/DkuLtI8x1QAoME6Ic+cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8TBgsIkOWf4Q6lNwa0kdpN1moA8/RWO5dKCBt/IBDI=;
 b=mfo/+5sbGitw/hLcb07tLkwzl7sOasRkfPaAWguyfU1uA9WBWE+6XD0Z7tT6hPuh+Tr3+aEgDr8UC1lUz1P71lUSShGCEZqWI95LYTK3kue4HMJgREJeieBxVjMnr43TH1+utRWOFxnL6uiNtCaGt3EhMdk77HPdkbNMlvxvq7sAkjgYMt6kQLjlPy691a62+93TIxrhNVzE03Dd3LlVeYWNFUKTG1/sjdlYJz2k99BloWs39VZ0gO2nFPeBqZ8OmaYnf5nzU7K8HhaZi6ds5DJbohYR1YItnz7WH9/+bmL3qQM7kuDddNwW6drMIW2VlXRQXVY80I4MWgGCeeXU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8TBgsIkOWf4Q6lNwa0kdpN1moA8/RWO5dKCBt/IBDI=;
 b=rKZaH4sR6i17iAd6+9ZHOCmq7bbwwUjorr1JrumrurfihMrTYWJ15fehJA6Wpp1uKJLZytwQjE0bPeTcUeA4swxcRB6iiekmfxbxV6srv8IwGMk7HIYg9pcrnwK5hvRXUuf8ZEVI3rkPJR5PKEKZ4B7xDUUlbBZNOrPJVM+leaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SA3PR01MB7941.prod.exchangelabs.com (2603:10b6:806:316::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.24; Mon, 7 Nov 2022 07:14:14 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::c57b:879a:3f7f:843]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::c57b:879a:3f7f:843%3]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 07:14:14 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add Ampere's Mt. Mitchell BMC
Date: Mon,  7 Nov 2022 14:13:48 +0700
Message-Id: <20221107071348.3996144-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SA3PR01MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: f29f9317-d983-4f9e-c237-08dac08facfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xvd15bMcVjVWHUVV4sBQswvPqZDUCR/U+NX+Jjd+R+DRUGi7tp8jGZgTYG8/HtCDTrILfxdKlcBEBMHJtDuuktK/jYSVLhYFeIcnucrA9npuKAOMtqwSkMBuX0JV13TvAuNw7g3QlkuxZLVm6PdeIxi6jTIlJiURR9VpvmXayeFVR8ZSCmoYFJ9kxhNl03pLfBykDKxF75vfCALIzxPJt+IHyIjZndy66s7abWHFyDsSFg1Lejcg0grNt2Iv6+iiN6dmQQ1er/Zy5EZHBP0zuPaqzFeRkyMDM534yJYjnB9EAtc3rQPjBtKtDz86HACzLLkRGIn/DCudH9NjgmaGOl2sWyp+oAVcQBSO5K+oQSdrGLzFNK5Jvp4zIJfIENJPvXjQbVBDIBk7xuPvek4bWiD1qOgboZq+PwXhuGac3C6g+PPhSkb/LEouDClZPipy3g+M/j4Q9M5EAbGAE31zdXe9U7NrAX1bM+/Fsp9DMMHQaQZQRb5Z0mgCtifBBIospmR9fCGAKFMzWQBUK6K5v5MaxXdF+hKWHCgy/w5DIEq5c3Ob6xUj6X9MvP//6Tw0YKXrxmn+nRXtppma0f08t+j61fYJb1pKuBcMa3HnpXb5t7sOFvNGctoZMGAdAHFjdZkbMYMQRfMnIrrk/Gjt3sjyc9MRIzRXFOX4hIecy1EJNq7D1MbEaniDGoK22Z5jkbdWPy9SyZl4Q5gakctUJpTgvAckLH+/0bFOnKlz4IAGsMfu8OV57BR3v8ciBeC9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39840400004)(376002)(346002)(136003)(366004)(451199015)(186003)(66476007)(8936002)(54906003)(316002)(5660300002)(41300700001)(6506007)(52116002)(66556008)(66946007)(8676002)(83380400001)(26005)(1076003)(2906002)(4326008)(6512007)(2616005)(6486002)(478600001)(86362001)(6666004)(107886003)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?r/VNbP+YhLTVHw7OGhiYe14O2/pqdePWRJHCVLkrkN4xdupME/K5maCzjwan?=
 =?us-ascii?Q?Mk1Q56HnOCofn5FOQkUOo9V/b3MGb2GsxEgnOLkapiUZiC3UaJH9NJEtBhY6?=
 =?us-ascii?Q?0LSoSNakxVFzOAJX+d9a1jbdQf2REEIIo9/6atetxhGnu6hS+LZQ1awyjhGW?=
 =?us-ascii?Q?E7mxH7wC2aL7gn8ysR+CuQxeLDBebgqJFDLN/wXaYH6v3R8iuc0CPrkklI79?=
 =?us-ascii?Q?a1z223GMMSx+IMNP7LwrzmrNA7ezeOn17A0CW0wS8SqDSbwwWsf3DcsXJpsz?=
 =?us-ascii?Q?HVoGyLW53COVqRBitCeSlU4Z5e7zccQyxtq8bdgg1VUY2ebnHeknIEOq9lc4?=
 =?us-ascii?Q?kiSOBCDHHW7Z/vFPgnoF4NEIoLdpkDNwIdrGkK22/LIhjk4BedZvqHXM75n9?=
 =?us-ascii?Q?K7INCrifpGkNTCIBUv1qslyLCT5zUSIG6wEtZw+gR0ieIZme0p3mNyFgdrpi?=
 =?us-ascii?Q?M1NWVdebkm/515mrkPUbir2JewT4WM84UZzd98b4hXZxE0TRTvS3o+JiKwq1?=
 =?us-ascii?Q?KK/3g9fwVZ5Gk+487E4MwCMeaI2Kdk2IUSGVzvzNj4e4S3u06sFoOtxlB44i?=
 =?us-ascii?Q?QeBaolPe3A6SsOUwqr6RJs9hhYul41kp/3mjbDFbaGctXeqoq/18ucN1UU2f?=
 =?us-ascii?Q?90Z7SqdvXdTJKD9CHK+bqZIM4XMFfTi2tvmR9GPf7+MngbxIM3L8+RK2B2Zt?=
 =?us-ascii?Q?mN3CX7lbd8QSXUv5RIg4XQ54V0SD8Mbk0zEa6uqzNMoj3fRAJ88/pWjXluSe?=
 =?us-ascii?Q?cPJb8grcLSWTHI2un5t6S5hY61RASapU7SRKC+9dKo9J/xIfwUAnc/pkEKvX?=
 =?us-ascii?Q?8lBfCYLjWUGfuJwfI6SWWQgiPLxCG4Q/wI8f6TXgnY/fAGECu1JIznhsb2J1?=
 =?us-ascii?Q?FmAsS/AIGSrDCjKx5aXOCqfPp03GpVqJPATHYIOJMaE/U2iAzh18UwKErD30?=
 =?us-ascii?Q?X0+1fLhG+jn0KaUiRKLyRSdvodxG5d+L0ppPuE/zcwzQOm4c396KJEPVJuG3?=
 =?us-ascii?Q?2Adxv2BvrpgWkNJKmzEU1TRKF7AmXJoOw/1RfWEz8NxVc44kxfILS8gpCOB5?=
 =?us-ascii?Q?AiPIcs3Zg1Z4v1MJvVIAB9fFDZnqQlSIbnJBXT/ddLCCErbmzbZ4iJiD5GN9?=
 =?us-ascii?Q?B0aCZj43aWpCU1p5nj1iQD0WB1PDK7/Zax8VWF9vssje1QsHECKOrfZ/KRT2?=
 =?us-ascii?Q?bylzq2kBZ0B3bWKCEHgBeGMdL5YD0rECe8EqO80tqCTiMIFdDtLRzVBi06OF?=
 =?us-ascii?Q?0pV4ztGRaSpViU53aMSct1t0N5/RmlurgKsz/hvAO/+bHFQ7LCZGtBJIJguA?=
 =?us-ascii?Q?h7En6Euf4fS4oA22Z7/vABTRGDfOirHNsTOa+yKKKewnrARkqSLBBsLK8dS3?=
 =?us-ascii?Q?fekMCVhkMFrvOxrWeny6SK+ktGf4XVjhyqfjKqxD8vSvanhAqM/wZdHQLfQk?=
 =?us-ascii?Q?3/fNB24aGQW1ZhIM16zy5Hx71ee5s9F1BfbP5sHV8cSu9WvOdEE07SFa+5VT?=
 =?us-ascii?Q?/NPbFeK385daf/sg46V9bLcP4+VpeECjCaV09gWZ/RPWwtcOrOtpUwvHRxNG?=
 =?us-ascii?Q?D3zPKEbMbzksGC/6Wiv43KcuY9YF0sEvJMn4SJbmxNX36M78kqfxXSV8RyTh?=
 =?us-ascii?Q?CmKAMwYtw2BXVukzjp2JGp0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29f9317-d983-4f9e-c237-08dac08facfe
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 07:14:14.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnPcddA0qZ4NAIpR708qsUQjbIfwZTE03h0rfk9vhqYpCFAkKgdYyG6HgTbv67Mb+Te/buChnEbKOkmMzrukPkbL/U5dNVcA/8ue0PC4ZxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7941
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
Cc: Open Source Submission <patches@amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial device tree for Aspeed AST2600-based Mt. Mitchell
BMC found on AmpereOne's reference platform.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 arch/arm/dts/Makefile               |   1 +
 arch/arm/dts/ast2600-mtmitchell.dts | 114 ++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 arch/arm/dts/ast2600-mtmitchell.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 6c34b83336..b6f9df21fc 100755
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -687,6 +687,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	ast2600-dcscm.dtb \
 	ast2600-fpga.dtb \
 	ast2600-intel.dtb \
+	ast2600-mtmitchell.dtb \
 	ast2600-ncsi.dtb \
 	ast2600-p10bmc.dtb \
 	ast2600-pfr.dtb \
diff --git a/arch/arm/dts/ast2600-mtmitchell.dts b/arch/arm/dts/ast2600-mtmitchell.dts
new file mode 100644
index 0000000000..69ed0c5fbc
--- /dev/null
+++ b/arch/arm/dts/ast2600-mtmitchell.dts
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2022, Ampere Computing LLC
+
+/dts-v1/;
+
+#include "ast2600-u-boot.dtsi"
+
+/ {
+	model = "Ampere Mt.Mitchell BMC";
+	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
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
+	pinctrl-0 = <	&pinctrl_mdio1_default &pinctrl_mdio2_default
+			&pinctrl_mdio3_default &pinctrl_mdio4_default>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	ethphy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
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
-- 
2.35.1

