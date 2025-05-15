Return-Path: <openbmc+bounces-45-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3475EAB7E61
	for <lists+openbmc@lfdr.de>; Thu, 15 May 2025 08:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zygxj3F2Dz2yvv;
	Thu, 15 May 2025 16:57:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2418::610" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747292233;
	cv=pass; b=SqmAWN98+ylTK8asJW8LumffJjveCxWSdzhSxYw0XYGnzHluLnRi4CQCLw5hPAXwlQb9G4jJgINZI8odw9apzvVDX0XZIamq9gzh3WvxrVV1EE82h9PguqFpglhpuAkMV4MyP985wFsrSGW3uQIeUO1ge+d6MS/H6opqrlC79GK8xxvru8ZA3GEisOxJiMHosr72B1COr5fQV6qa6jz6uXjdkX4qxttgR4iCnWoIAL7TLm70NJ6OTiybn2OkBUHUR0ESKYHqPZPRLqZmwAu3eRbypmXryJoAw+jf4X0RZYJ3EHirGKm2XqI38jx0BoCHqIQRUq6Cwl9wmS6/Ab4hpA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747292233; c=relaxed/relaxed;
	bh=5iSVPeeWzS++vnjA762cbIftqTbpzugpf08NA+xQl2c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FxbH6g4rLwuG07yYI23tz+dMQK1eI+AjojZPgZjx29z2S0Em1vHhM+JLznobXbRBl1wvn0uGBN1ir6rsZBRZBJ8zviBhvRlNprNdqsL009CU3XsWfrp2k/pPibb0pdPK5G/xWIuAUgATYmSJCU0ddxQ+5Bh5HtBFRAYGn6ucF6wHj6Gk7JV7Crio50E91DnNQ1ezWAd5nJ7FrDS8xaEa7mq4G/psBJKI/S3f3qIBHloMYm8+mzebjkrQjsoue6E+ov7jJVk/w0N30s4yw1awTlgCQLq/WCQaSHIrTg2cGjTsLTWsXLimW7c4CoV93zPv03MozYT3HUDHDC4Bxs+gFQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KZZ67O6g; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2418::610; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KZZ67O6g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::610; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=wthai@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::610])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zygxg4vfRz2ySY
	for <openbmc@lists.ozlabs.org>; Thu, 15 May 2025 16:57:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p98vgs8I9beL2kVWVd4mFsQ5pGmu9zWyQEVdckwAJIoYaJf9g8vY0NRpo/98VMHqJW332eh+wumXd2hXVw6DPavsyzqVBmvvrBvKO+23/LsPCHh3mSyxq0M9PT1cQrGVkc0upfR9qoTTvME3k4o5xUaDjWZ/OAbaajKT5YW/ZW/G0DE+xTf7R1lxdsqSDcl54DBo5iwTsic9i+Obm74FG+f9EO9X2L3uqgmSV6VkphrPBZ5TMMmYGys5R4xdXfRhXdBwKdcVUoaXiUP/EdxhsLVo+K3hvsLd+pA2RVLXzEK0kEnoOyP5RhMS06RZU9DYWI+IywL8dLnEipN2dA2bJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iSVPeeWzS++vnjA762cbIftqTbpzugpf08NA+xQl2c=;
 b=eMQ4ntpU+0Gdh8u+a9sciKvLS4cooKSZiDwpiLnpEty9Ed9RFRRwfDrrDrxXo/jB8bRmXsb/V46l9SwGG5XeH30/fGCMdWeoXY/T0T2JYuPjCixdudaFqLcx78r6oMqv0eLZfObL76Lk0URjWzU9yC4hPeBHdrZrEj34QMo2RItX3OXQw/oKM7LuRMyddTbF6OJhxkXhKoxIsxj2VNYhKjeWLJ+XYge/TYgvKkr8ZVLQSQc3xps2G/HT1AZIni8e1Wf52aL/zgZERXpxHlQDGk10WvVMQWDSCLil0W893XzMV6ZcVvjJJ8BuGKdvDAtkce4rf+KjjH53O8BaHoA4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=jms.id.au smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iSVPeeWzS++vnjA762cbIftqTbpzugpf08NA+xQl2c=;
 b=KZZ67O6g8dllvtmhzro5rt4OSyz1/iToNiSSbUUgSOrFX0L88c5ytT97qOflcmSL3/FKSC57qy39WS8L+ZTXHL+/g0P8tVZAec/oyh4Fhp2xoY/uhgN42g2V7pCjPDPnYCyFoCy8EfvYe+uNkylqrRPAYduYUlr7cGyqLPVWswWjfBAOd8BujH1S25ZUsXbbYalcxobSevxqQfkU5+joxMKLcaU39wgYuHXl6sJ2A0Id4DFLBYCAABoVqEzSEL34TyLCG63HsMr52V041hEpUE979Y1jk+gGOBA2WSWJ6ZmEqkCZi4qaG34C5uVfKt4wNVndABgH9gAK8zMY0BTywQ==
Received: from PH8PR21CA0004.namprd21.prod.outlook.com (2603:10b6:510:2ce::11)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:56:45 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::d4) by PH8PR21CA0004.outlook.office365.com
 (2603:10b6:510:2ce::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.5 via Frontend Transport; Thu,
 15 May 2025 06:56:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 15 May 2025 06:56:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 14 May
 2025 23:56:29 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 14 May
 2025 23:56:28 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 14 May 2025 23:56:27 -0700
From: Willie Thai <wthai@nvidia.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<openbmc@lists.ozlabs.org>
CC: <wthai@nvidia.com>, <leohu@nvidia.com>, <tingkaic@nvidia.com>,
	<dkodihalli@nvidia.com>, Ed Tanous <etanous@nvidia.com>
Subject: [PATCH u-boot v1] ARM: dts: aspeed: Adjust Device Nodes For Nvidia's GB200NVL BMC
Date: Thu, 15 May 2025 06:56:25 +0000
Message-ID: <20250515065625.685064-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c1cc7c-b02a-439e-2460-08dd937da7c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hha9gduo9XHvVa1et8j75HuDRFh/qnnYlybclaTLGSE8++0q5y2vHNsyp0pM?=
 =?us-ascii?Q?lk1evsWCJRCr73pJHA0fAHMqAIWDkWrtm15w4jFzSx4+U60TtaDEboVOsUtp?=
 =?us-ascii?Q?PRKkBG0BAtY7v9xtZ0nZ51Lh/N3BqntOs1JUVs9dgqn+J5b0rcUYJR+9AMJd?=
 =?us-ascii?Q?MveHDJNwF8RjErq/2Lug3yy194vCzYDZ+6u9njbiBinYOc2EoBsfh89l1EAK?=
 =?us-ascii?Q?BtyitZOybSMTYSC28YRhxsv1CrVtuLt8MgGIbTNYurvS28D2kRPCR+NX+w0g?=
 =?us-ascii?Q?xBFTw0j4R+Gti4I5/S7eWEeYZkxYLEuIzDM36yR0mhi8cCOF9PbYA8lK4RE2?=
 =?us-ascii?Q?OnSEj3lQlewUiEsZO21QrRTd34qHalzJujr29f8qfYbSlf4P8PwoBq7gDZiW?=
 =?us-ascii?Q?P51YfFizpZqngiO9ypcfgf/gVdnrILKuo6S0BXe+6kR47LrNWCID0/e5MNyX?=
 =?us-ascii?Q?PTjchwvydigBz0hUbOS111uKCT8KXJocjmpRdUDS0Wcc3ZFGUmSBF19wqyee?=
 =?us-ascii?Q?b5Gher/c5CISjnNZUqtTf3bXjuZyAHBmrz065lRVzcUSfsKhAeQ9fOK1FUrz?=
 =?us-ascii?Q?0i2hAmWz1wUvKas4EUTP4JFV2ZLQ0F9+CQmvpY5jtaHzLuwpZj6R0z75sI31?=
 =?us-ascii?Q?t9gBolxe+KzBJMpsNJ4mX5rKBaDOlPruH8wwyO58cweaBVE1+5hYJeEyuQJ4?=
 =?us-ascii?Q?7W68yJ3P+68kQ+lLzAXte43p5T3wgzylHrxAu29NWq6+OLWqoXElcnGQ/THx?=
 =?us-ascii?Q?kC7WGlH/FBGewhJp6tVWnWbCq54j4CVFNycN9gey7QHGifxYumAhvXOczb7/?=
 =?us-ascii?Q?4qwy/poVP2AROQJJo0AIgXX/57BnaAUgfyo46NU040i9XrdmT0vcglzv4FJj?=
 =?us-ascii?Q?Lg5UG4JdfWoMicHRceLDT1PW6xAjkNG2GVKu9l+/fiYsxanIXDB+qA96w3zs?=
 =?us-ascii?Q?4Ww5b72/GExa2HASjqt+Dmh8IZehdVTqustejK1JruAPrKusETmnb3dk4Sly?=
 =?us-ascii?Q?vDlkzKK+e+IhsrVz61b8DeisyWLuUR4S3aFR1sNcJCO6Xlx+NUsFTxZSLejf?=
 =?us-ascii?Q?5fDdDfuG2t6PIJJKHutR1NlmXSXNkJm3XOsDb68mC31NouXXV4VuVyoT3unw?=
 =?us-ascii?Q?M7WVFasIplEkPb2R+9o4hD6R1UqDG7c//9rrOgprS1moAryvvYpf4Cxusagk?=
 =?us-ascii?Q?b5V1ALUHK14UbDsaIP5HTkZTsJTZxP9oUccaHvnmd62VK7jx2FGkAMQPFk9G?=
 =?us-ascii?Q?zvpiFbf+1o2jShB6kc92iD8ZcRN1W0kmJHiBypwNqXzb8m3J4q+82FWPcRW6?=
 =?us-ascii?Q?XavZ0fyni5G+5E0H9fYy9LLUb6uZm9xJDQKD384Pf7SRUXbyrq6NBECCp8cM?=
 =?us-ascii?Q?vpormJls1ZgQc1gNvyjYofX2E3z4LtHczYxBZu10PJXxStaK5O+rwxJNXrOo?=
 =?us-ascii?Q?baBi/1WEnT9zjgvNaUj82xT0D7uyuoMIrpN2sZ05JeJ1EYVqVgTGrIXDd6tf?=
 =?us-ascii?Q?h9PpgQ6p57au0qucOMirZnXxyaapwcOgeFTW?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:56:44.9880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c1cc7c-b02a-439e-2460-08dd937da7c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563
X-Spam-Status: No, score=-0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unnecessary mdio0 and mac0 for the latest version of hardware.
Enable HACE and ACRY engine.

Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
Signed-off-by: Ed Tanous <etanous@nvidia.com>
Signed-off-by: Willie Thai <wthai@nvidia.com>
---
 arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 34 ++++++--------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
index beac18cfcb..1bed579c1e 100644
--- a/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
+++ b/arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts
@@ -46,8 +46,6 @@
 
 &sdrammc {
 	clock-frequency = <400000000>;
-	aspeed,ecc-enabled;
-	aspeed,ecc-size-mb = <0>;
 };
 
 &wdt1 {
@@ -61,27 +59,6 @@
 &wdt3 {
 	status = "okay";
 };
-
-&mdio {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = < &pinctrl_mdio4_default>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-	ethphy3: ethernet-phy@2 {
-		reg = <2>;
-	};
-};
-
-&mac0 {
-	status = "okay";
-	reg = <0x1e660000 0x180>, <0x1e650018 0x4>;
-	phy-mode = "rgmii-rxid";
-	phy-handle = <&ethphy3>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii1_default>;
-};
-
 &fmc {
 	status = "okay";
 
@@ -115,7 +92,6 @@
 
 &spi1 {
 	status = "okay";
-	num-cs = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_spi1_default &pinctrl_spi1abr_default
 			&pinctrl_spi1cs1_default &pinctrl_spi1wp_default
@@ -216,6 +192,16 @@
 			0x08 0x04>;
 };
 
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
 &display_port {
 	status = "okay";
 };
-- 
2.25.1


