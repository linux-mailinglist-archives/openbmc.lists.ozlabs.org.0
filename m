Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31B80C116
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 07:02:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=vmWeeKhB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpWNs511jz3vgC
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 17:02:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=vmWeeKhB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feae::60f; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=lists.ozlabs.org)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpWJ05Rktz3bZ6
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 16:58:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgRLlgRgLkpqIqgW1FT0TXLBpOWOewuDL4XOblauOSl5IjiiVZ86CEqwzv47qBZxV1DSpcmWwmqhmAklsY0PqKNRxw9sth0P5rQemI5dkIOae+8PsrBZuXj3wFrvJc+7d/qDx2BIBDUCtb+pRY98ZxcfbP1h629t9Af5IdaEqdd2xB8DLQZJMhP2H82Un7oMMVtuqy/597uclilHy3F0QUbpuTmHG+9i7EPcAqU0ogUAVISSaKQIov+PA+rcdhUis2y5DF6pLe1I7WNUegEt59rSwdBxJAzI9tZYxOZdaHbFWfoxt1iTUGlGp54wIDizmyouuzFR3GbU8seJiyt8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=GB0RGHekqX0qOfXGUj7R+6k2O4y+kbhCg/TxZ/8YXi5JEPLa+U3b0KVq3u+DEfCU3jHgGJ0RpbsaylwmPIpndXFMdjMlkTi0/OQNbsi9khtua6rJ4Obyz/EzZhNfAMecYwcLKrmkB3wiJpC91BOi7fqzvQ9Or5rNEqAKpOytAJhpsOiq8VJzxySoYNwjh/pUZv5tCtH0ZVpKwiem/Mb89ZcC4WkxJwIUQL0C23FBCyMEMmpcdNOBx5SMC8PKYnnTSXlDgTPynIhhNpwYJ6FsOwD3Kqe+2O5x7O4ZxW3vQGFEqNaF+TfT+O00GVRiOnakBneKY2gZRHKMa3uy42Grvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9hJP4cxinrgJgR2dHN8WewCHihh7cN0JE99FmSA1C0=;
 b=vmWeeKhBvX77PjZ0ki7it2UIJrJEHYNznF6vkDPWRnWT/Zsj5veW1+lNKDUJ8HjfxrNpE7X//91RCpqpmtwETrwbQvN3CDZfRxIthKJRi+2JWjeI898WWXZxsSmsUhv0QUresujVs6/nZREv4zGmZeVT3UZQDdz+EJpP9deRlHDK95d8jeM2NuC6MeV079FCGZVG6HdmREzfirI6PkOMqAAamHhdzmqGAX413NKLnR0xiQUDytUVYg/WFDSJY8pjhNelz7KzfWPde4LZ/xtL/h7jZdIVHXxx+y3xF3KZroswWEnWFsNa1tQo1ICuu1FUlEuJ/rcGT4OwxUghqUPWKw==
Received: from SG2PR06CA0248.apcprd06.prod.outlook.com (2603:1096:4:ac::32) by
 KL1PR0401MB4372.apcprd04.prod.outlook.com (2603:1096:820:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.30; Mon, 11 Dec
 2023 05:57:51 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:ac:cafe::7f) by SG2PR06CA0248.outlook.office365.com
 (2603:1096:4:ac::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Mon, 11 Dec 2023 05:57:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server id 15.20.7091.18 via Frontend Transport; Mon, 11 Dec 2023
 05:57:51 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 v2 05/14] ARM: dts: aspeed: yosemite4: Revise quad mode to dual mode
Date: Mon, 11 Dec 2023 13:57:29 +0800
Message-Id: <20231211055738.215773-6-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
References: <20231211055738.215773-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|KL1PR0401MB4372:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cb7d689f-d464-442d-2cd6-08dbfa0e1c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xP+Q46p80wHJl2bWDAE3RPU+pyatcF6dbTDp6LMwDoTJBD+U813ZEfVbTAJGwwk5SFHLFMaiSyV3JtTz6lATaMXDB6AA7jABllwt6E2sRVvAMkO3Vg+nTy4wMEj8EOT5EFnwpo5GbE2ljYDHTD36vtGHOto+ZsaCyWhKw8Me4OIbkp8Moio94hotNdtwSbVz5k/nFxWxvcJeHJnlOT7kASY5lpB0dLLoaDmHmLdA7u6t9oiWMlJv/JnqUac3SaxI3UzWdgCpifXRDuhfhwoPr9UWcxeIr5PPqvkA8QtYrZntQbWygfEfeiBhSSaenehT5Z57PNbt/d6WckTLsiPxAAhRs19XxRfWf+/Gg9eljaOOZDAk48FEgwue3+Xl4vxM4bP69MsO6imeQE5D3KqFkaX3TmmVqVab0xBDESl2TEToNO/MsJ5j+ZtE/X9jwXpLweNunTwOA5+FvxPdcUmO/JkfVdJ3GVX7PEwgyH8TlFANOFK65A5jJE2WHpuyLFwTjPP2W0ur0D1kN5OKNx5ia3L+ecaIaRpKQ+1PYGbhssEEmTGCcwdV7Wvs+VIO9WNAvPQSwb5/WTQQS16zi1kM40NwgCU/iOlsxKiXBRaljJ+W2o2tN3ZrwGJsuUVRVsfgFt5FfdSlJyNqMUTCg3fuC4IJl8HGik9sg/7TCT4XLR83+x4GvBaMAB6OFpdGVHoTiKzwImGyqDWpGgnGi2kiFQ==
X-Forefront-Antispam-Report: 	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(6069001)(4636009)(396003)(136003)(346002)(376002)(39850400004)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(36840700001)(46966006)(6506007)(6512007)(6666004)(2906002)(70586007)(70206006)(36736006)(356005)(81166007)(86362001)(36756003)(316002)(8676002)(8936002)(4326008)(5660300002)(40480700001)(6486002)(478600001)(41300700001)(36860700001)(47076005)(107886003)(82740400003)(26005)(336012)(956004)(1076003)(2616005)(83380400001)(9316004);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 05:57:51.0975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb7d689f-d464-442d-2cd6-08dbfa0e1c49
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: 	SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4372
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

Revise quad mode to dual mode to avoid WP pin influnece the SPI

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0e9095c83a59..7fe80ad271aa 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -149,15 +149,17 @@ flash@0 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-64.dtsi"
+#include "openbmc-flash-layout-128.dtsi"
 	};
 	flash@1 {
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc2";
-		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
 		spi-max-frequency = <50000000>;
 	};
 };
-- 
2.25.1

