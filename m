Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797EF64697F
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 07:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSQ4m2Nl0z3bZV
	for <lists+openbmc@lfdr.de>; Thu,  8 Dec 2022 17:59:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=g+BIKH7T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::71c; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=g+BIKH7T;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSQ3F6dGGz3bfs
	for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2022 17:58:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGEv5Qpb6RcNpDbq0X4kEtTYtu5F5Vt3ELgmpdimrzrsv4/6wjLB/ENCjy7L5ihTcwPvmESvjg1neW8hF0GhTG+lVDCpp+8bmc0+QJrlVkyX5NDynmO/AZa5+wq+nGfgiEZzY8CiFNBE+TTtxp0CsuJ6EBKJ8DfWIvEyWMEhMLPQTRDnkCk4scgiAcazBnKkKYFVkyjhaTmZCUbcUj/4xx5p8nb6kOv7hGuzgOG+VAy9/d9wpGsTQQOA8PDZmu4gYvzk+7AzB0V1uGNlOUGu76bRSO62HGY9Qo2bmRS6JRCRbIxidFN2MszOCyGSA4rSkiTO9R5kNF+MdX3AOa0tcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAWNRSxNn/W+jDn6yeKjHzbFcK87/3thSknpteZwmoI=;
 b=IKiXnrlE2KWBdErUPlnOHQgVPUvm3c4j/JWCrhJt1qmtuV1t37CmpbkAP+xEzWh+w71wc4Hb9EwmWxJwhro7nVfiaer+lKJFvdu6tRHuUQ8f9AD/HBqUOW6j1bmwVi1GdCZ1QMShi22ow9lLvidvCAkjEemE+HVxdu6dUbGtDb6sESwlQsbrao8pkXtIa4RYFUW1XK/wlv4Nald37uOSKD3RBAdPJvFPFWJ7XRr9+rQP0eI188AuCoXLUFgtxUEBkbwiCGjxy+u0+uT0kcUg0BnthfeiZyB/Wvy7252ES0SHTxGdWhvMpQEHAee5djwV4jNSZwsk8zJcW/UpKAzoXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAWNRSxNn/W+jDn6yeKjHzbFcK87/3thSknpteZwmoI=;
 b=g+BIKH7T8F6yWZHdntIMNbtoHgiwkINRDmZxFoPznPwv44VTKfZwG1+Yoig7kZKT1i8XQx/4Ajis74Z4WvErN9N4xQXnboGhg17leuCmD1/LgADbyl5qk1gmyxX86ZLHj1VS4iejJjJxn/PCoH4Ez4r62SeUdoJbkTkSRBtNZlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SA1PR01MB7358.prod.exchangelabs.com (2603:10b6:806:1f9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10; Thu, 8 Dec 2022 06:57:59 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5bc2:68ec:263:8993]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5bc2:68ec:263:8993%6]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 06:57:59 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org,
	Zev Weiss <zweiss@equinix.com>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add Ampere's Mt. Mitchell BMC
Date: Thu,  8 Dec 2022 13:57:38 +0700
Message-Id: <20221208065738.814805-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0226.apcprd06.prod.outlook.com
 (2603:1096:4:68::34) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SA1PR01MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: 1990fdca-25d3-4b25-5a01-08dad8e98aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tX8nWA1CdnvR7J5GuB+OGJI2apim85Shd1p0/j/Ax2+EBmi62brakSuYJWcm70DnEhyvfLfllOtfjNrnmBuA2qb6XGQLR2xeEkDFahy8NqfCLEkrcoFnKYK8XCMAMe8bDcMZDM/AD7eY97mK60E4LBXTNiciXFf3uKqGrazyloaAPGDhyFxPPfjLvE3XovZLOwFgJH7aH8KMPsxmEMAcl9tk/ENSoIVrkHGjmxR+2P3GQRe8rAC53GmIupB9uVMMK1e4VpI6zCqCIkLc+SIO9sKLFnv0RXSWQtd2ICzfLRneMuyg669sWl5+9CDVIOqtPWRymj2ZGUzaJ7KMejp3rcILGixnLDy9tNqA2OH1cLVilzgIxhGQrw6grHyqg1BZAruoHZQuBLVwLE4WLY2zpLaxTfxvyp2kYHgh3u6yMrYwRgdWPDVpUgXDS8b9VYdnv7l66n/nbQurGXlC8w9uRuHVcMDYmSzkIktlf6LZCYD9zNwglQL1LOCGyMH1hqFNBcvNv4i/u3HEfgUBtZwspWNblmvTQ8bSLpOKRQ8dCHmQvOOTnbpS5eetzoP36St+JSqa81JRS8znXcgY2kvVnZs+cCx4sVuB+jdyW4YhCPUK9DdBgrUP8tjnJp7AZ6FgAw+G1PArkMI35T7+KIpyuIz1kVxtn0BXqf83XNlH93SW0qeMYBIR2p4fZrhw2QLh
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(451199015)(83380400001)(38350700002)(86362001)(4326008)(8936002)(5660300002)(2906002)(54906003)(8676002)(1076003)(186003)(52116002)(6512007)(6506007)(107886003)(6666004)(26005)(66946007)(2616005)(110136005)(66476007)(316002)(41300700001)(66556008)(6486002)(478600001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7YdrMcS6oLZudHnjzEf/tTpZXTrepJw/6RQLCTcISd49BsPEInBhiggfmkpx?=
 =?us-ascii?Q?/4mVdJuXS19h61hjgk0j/v8I8uu14aYkORkrd9hT6BzzWUbuaJtD7rac6DjQ?=
 =?us-ascii?Q?hUkVWRwFOKDs+VYLptHSWD6m3hKxWF+9bxUYOmoJzS3TwiB45o3C+dcIv4o+?=
 =?us-ascii?Q?IjASzYjOjObx/NK+7vKuY2OvU8aWjet1WlKGVZVVBvhJdFs4CR+JMvgux9/B?=
 =?us-ascii?Q?E2ZcaLGyqkPzuU8/cDJ6PPNX6M+RQ9BjJxXvPBPVNHmuMpKk+vOfbMQfmJzk?=
 =?us-ascii?Q?vOcLNoJZhufRQAFRRdWfK4ITiF6L6Kw/E8cf4/ANAMV7qYkyZY8eXS7pcpen?=
 =?us-ascii?Q?t8DiAMoU/ImNq3WxoRmXc63Tiay3QIZ8Kcm8iF1XuCmKAQH+j9s3WMqJ2AHk?=
 =?us-ascii?Q?tr/FTDlCWZz0/Nc7cn7dvp2cfTaFODrbE16kWcWumTst7OwWAFkB0tSs+cqk?=
 =?us-ascii?Q?tpkkomrOSWK9SejynpPOzdeSyISPJ2VGn3CNpvcapuMvEjLFQds9Ki4DMMcD?=
 =?us-ascii?Q?6nLSGfnJC/5OpjX+nklqOF07kBPN57QnSbK21X0n3Np+8KCGad+o7Zp7uQho?=
 =?us-ascii?Q?CDIgQUeU9+qJ+bXHCbb/wBwP4Rch1ixVTv0kQ+kZPNaYoWR0CspAySP5XmUh?=
 =?us-ascii?Q?M5ymer6Wew1aagrfVWIQEz4X5467yqyDvkLgtu82PxUAqJxG/zUE1eF3adM/?=
 =?us-ascii?Q?l1aAvLH4cHSp4OxQbWSgVzXLma6XMGEYL03a5SkYb3loNBhjmpodnW1FTbQE?=
 =?us-ascii?Q?qGr+/UFTjNN3+u7Clmi3tUWcQlWoekpf2PL3HpN6OnaDViM65CHXkAmsdqb9?=
 =?us-ascii?Q?SZGugCvySvcguZWvViYENgSk2Zw1JL3KGxVPIu0jeaGC8ReLRt8ujf9Ei+jJ?=
 =?us-ascii?Q?hpBZv+AtGxQXiAYj0So1buUQufH2j8p2F0fXo36TcAsQA88whnP0r1/ltTno?=
 =?us-ascii?Q?dV5JR+Ggwf/IqfE5nhDnYcPDY/YOoaOzdcVkyLZ5mkVYUdsqh6Ql/TGlE9E9?=
 =?us-ascii?Q?SEPENAGRS6Wh88CRCA+JnE5kTTfP3KPVxxw9zGC80fuFdW6R9G4QKL4VkKuk?=
 =?us-ascii?Q?0emdpxEp0x9mWc1fONGpNSgvS4HcZ5CQbh1KcmEYRs6wygHo2X7d6+2YiWoR?=
 =?us-ascii?Q?UlkzT++TtrPL2jD51haUyI+JKjjeFi4+2Ol8oHlyoWadwoTRN934tn6CbHl1?=
 =?us-ascii?Q?qXFKamsr0FiCV1SBcoEp+gLTdEtTcavO3Zknw/XHm0M1zAp1LP9lQDhF9bsR?=
 =?us-ascii?Q?2hCMnAJluVnkdnMaRb1yjCKDF34n96xk687OlGdDzJsguT4v3d8Ib9S0EVDK?=
 =?us-ascii?Q?JJqmvRuIqhNf36Wvi+yc3ZGg+lLMYQ6v6XJe+iaP/oFRc3sdJ3qtZaokvSoX?=
 =?us-ascii?Q?gHCYJkkJhvphB7Me6NleJGyfGB1SNzRGspbYEmMlxHI9nVNBk3h8iB5jO17a?=
 =?us-ascii?Q?Ei5P23VHbb2r8ZmvQTmtj5ab5jf8BHhxo+x1lzhYuuanmW9H8TjN6iWGMYBs?=
 =?us-ascii?Q?b0MQK8QTdMPaVjLd3JmHYEL1RVwZ9VY9peNyLpbKt6tjQcDH8frFE0QQCYC6?=
 =?us-ascii?Q?IsCyPOzz1gNg9vSx7tN5/Jw3gJVE269CGTl/h5OCXF12x1He9lNCwSpUMTXI?=
 =?us-ascii?Q?SgEq77w18AvUqsYLtetYeTc=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1990fdca-25d3-4b25-5a01-08dad8e98aa1
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 06:57:59.3030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC992BGzHeMLPVmf82My6/DucEalnfk9qpJO6g99ztzMR2kr25uR2Bj8wF5YZboSEM2bXh0ABt+1eaYVAvGNE/tgutb/Wj3gFLLY8L2uRl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB7358
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
Reviewed-by: Zev Weiss <zweiss@equinix.com>
---
v2:
- Fix tab issue                                        [Zev Weiss]
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
index 0000000000..ad95be43da
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
+	pinctrl-0 = <&pinctrl_mdio1_default &pinctrl_mdio2_default
+		     &pinctrl_mdio3_default &pinctrl_mdio4_default>;
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

