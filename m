Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC112382339
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 06:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk56p70n6z302G
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 14:01:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=UHjZ4DJJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.223.118;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=UHjZ4DJJ; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2118.outbound.protection.outlook.com [40.107.223.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk55s1cC9z2xfn;
 Mon, 17 May 2021 14:01:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPM8vu9iWHBxrVPIlCBGptQwYGTg2e4SrzWjefZLL8Jjq22CSmOaChYja5ErxcpCLPBo9ZNiQbd0u6U6DNyinjmu9D6H7XncYXxTCgTAdxuznW4aZ8vl49QFUEC009zVjnrBmHWSDVNTWQvjBX81z1ie7rkD+Q17n0YhCBFA+HRWcBRv85MjfBnOn8hPkYLHkWtlabVzzNW4VcMapbsojaOfGk1AwXZ4jZLp+cjEzXuAsPM/ql+uKN2xSQ3SB+tIWh7NLXrcEjUXfWUXOdyKG8DeheBxZrL7SFfepiICMUjgGPYiLhp7h1lxqF7joV/rXDpQILS1kJsc26aUTwdypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxwq4oV3WadOVJ2HrnLTaA7UqUKeT+pg5s/vvLE/8c8=;
 b=QwYGhLx+rXniFxFCGcpU5D11JM+ktCx8aFqOZqcAZ8/fwq7eqC742jntpeYFR6hceaB7gtw5OoEPXPEipspDgN2qOjMuRrqyjVSXOvP7ReMV/qH0BQlGmKiNDBokbRL/bdGr1YJVW/dcWXMVulIRUVpkYHhvfcuGv3FoEy72Nuv0zBbX1s9LsXcbcg/y0vqpenwbpE5edCzq3GMaI9ugNAByIrpKSH29tPv2lgDJEDDArUHsHRSsAt/Zqd46hUhycByoG51ZujOZ1116iz3dvDWbCqzf9H4kLwxhyEMnLjl+6Klm3KNUd0j5IxnBQ7KV8R5cFSzUOn3+6TBwSzgJqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxwq4oV3WadOVJ2HrnLTaA7UqUKeT+pg5s/vvLE/8c8=;
 b=UHjZ4DJJS7OgkLTMEg4Hrcpqs5wwfgq6rt7c/TBYx9GaeJ9ugHyJFbb+wyOeUgZoXDUG3NKTyo65gd3/oiheZ/ZFX1UZjeeOQpRE8rQmECX8Qc/5luldZ/Qwd+sYnII8pPPXo+bHegfDUHqQlvM+OxC17QuiFySKBeg7rgbAfqU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2007.prod.exchangelabs.com (2603:10b6:102:12::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Mon, 17 May 2021 04:00:59 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 04:00:59 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: aspeed: mtjade: Enable OCP card support via
 NC-SI
Date: Mon, 17 May 2021 11:00:34 +0700
Message-Id: <20210517040036.13667-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210517040036.13667-1-quan@os.amperecomputing.com>
References: <20210517040036.13667-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [118.69.219.201]
X-ClientProxiedBy: CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49)
 To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Mon, 17 May 2021 04:00:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d99c0487-fa6a-4a2c-31b4-08d918e860a5
X-MS-TrafficTypeDiagnostic: CO2PR01MB2007:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB20074D62BC1840ED9213001AF22D9@CO2PR01MB2007.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5RsFbZmjt4pPU+flXkZ7osxHDPhF2EwhyUHKgJCgGC7wF+BQhcBC59o/F0oLMDWml3tKbkqMdWnSTxGdNwgQCDNE8jVXDlYMwq+wYaeGtCsy36qNsrIhSI3C/8z4GW33SmYlUI2H6wKZ2MzbOGy8Hqd9SHojB0TTQZcnEYBBmGVickbC/iF02Ju5eX/TzSw8di3OE8SugIgkI+Ww4jy0y0g190hXQwNsLdvMMqiiNvHtqAO1WhGAV7uDASM/ux1IG0hBnaEfIMyDkXe5LCLze00ijY0PwDCaRTaZPq5hXwahGvAANbRr2evHfojx2iF0nO+SYLHOOkBaYSJCm9VJA/sBSln9XbvDvNZkkEyLxeBu8P4oo6hEX+PsrXiH85hCvASWWF6Ph3DLkfd3FrXkxZJH4Xn83EdeS+IES3yu6k7KP1x48L0LH05o7wHJR7I3orBLH4CGuyEMfuJyXDhaNQm8YuMqoWri/YUzcHup6zzCXwaDYb2ZKxrizNRISx4y/TT8guXXGt8p4TD9T21RhlhYFQCInPb0ntViaRyHureDL5Z6JrPkTPks5/XLRHyneF68LzeXYakQEHLUO99JPJiyaAuKWuhcnE2g4RQNi9lgQAFQ4Qh54fFqUPGqcPNUxZ0S65ohxJ84NlXKhzgKjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(2906002)(8676002)(1076003)(38350700002)(66476007)(8936002)(6486002)(66946007)(83380400001)(52116002)(26005)(6512007)(4326008)(956004)(66556008)(2616005)(186003)(16526019)(478600001)(107886003)(54906003)(110136005)(6506007)(316002)(5660300002)(86362001)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4iWuwHlU6k6hLQ+BBsONver/AGbJC4WfZtnWkMi0ZQoqlpVFtHinVMziaK9a?=
 =?us-ascii?Q?w6cWcL8J9IlawWQ3MBlLo/5XJfxhtLHv3DrWLOyIP5dvlT8YfVA9G3RG4Dcq?=
 =?us-ascii?Q?T31N4cEcbNh9JKvpKY5vKlCOIdUz6bz1nDnmmJDq15pFwVPazrnUNC5MAlW3?=
 =?us-ascii?Q?Aq/omyGMgdZPwQo2FdkcQPmYruaNyD0aqzrY9dQ5erYTOh9MeJZSNZQELI7k?=
 =?us-ascii?Q?7chRIKN8R9PuFVHdwyja1dk95nlN02eSd1iYDmSyq+aG+rJzkfAfBLFUXzwZ?=
 =?us-ascii?Q?YGs0xtDYvVm0z1m5oYZgAKGWlfnv3HuYpmV2kgAgiVgj84OcibWM8L6LC2Y1?=
 =?us-ascii?Q?v5HS4mPs0LWQcB1zt3nf9D3U55CheNTJFM+gD6sPa8N7Lehf+UUSUlFxEFp9?=
 =?us-ascii?Q?kZMCga1jex+cCmv/wQvnK2Xi1obmQfjPJPWXLviYKuK6UG3pBWKU0rkjF0yK?=
 =?us-ascii?Q?Dz1VmcwUYZg6bz4UeB9qtIY2u/Yg7RN4cAobA8KmQpkpjog3C0KJX+0BGejL?=
 =?us-ascii?Q?hr14IBAaor1rDhvBvSatpjXdIZ9uJfK/VaGop5uRhzHO+w0LZh69ZebjzwsQ?=
 =?us-ascii?Q?Gte+Se76MkyQzXYU7r+kNh5i87mhznzPTOIwWm2zUxqKcyO6yVjzvnfDDiS2?=
 =?us-ascii?Q?21mAuerJCyfSVl2OVVPgnR+IslXpnglJ0cFq+d4cpzh/4s6QJg9pG86/PhV1?=
 =?us-ascii?Q?dEKSkScSDXEL3OPyGZ2pgwgHX7X2RQkXaDWD2Z0L/eSbheVl5MzQ1QXfXdHA?=
 =?us-ascii?Q?LTEleREHsM4w4MbciYN526VcQwhysWKyry4HcZapJuVl2YT4bS60sEzFe0Pv?=
 =?us-ascii?Q?HU8mZN7YngcBH5vuPMHR6hR6oUE7JaBI3NEr2fi38Wj8vDbCDLNQOB1MhwKj?=
 =?us-ascii?Q?VBs9K4CpFRPYJKGDWLE4hnoN32TbBf5I9dVZRG5TWF7P6ZTW0kcPMWHn/tvy?=
 =?us-ascii?Q?Q3TIchBKfa/6uWhrJteg1VaI6H0kVN3OvEVr1Yb05w900E11Y0vsC9F+2jOV?=
 =?us-ascii?Q?gAjAMWaPQzpXfkDL0FILVRt+m/lItLI+bn/ROSp3+fwsnW+5DZTOtfvkylRv?=
 =?us-ascii?Q?3k5BYbBIc3tdPLV9z/qS67VW1JKMaqi167UTs3vNEBkn0P2wgKxCwgwTI9Xw?=
 =?us-ascii?Q?OLvgUYMkJnE11D8i933VrZ5PmglbKGpZlNyYusSO+4PGaFzC1xSxk+O1Eg69?=
 =?us-ascii?Q?nHWcUNX1CAsw7lf71IIeXkc0dtx2AS6Q/jIVMVOzTdYWTE/L6vCl39kYZyGX?=
 =?us-ascii?Q?5SKZxwXGViVinrqpYDKytp3TtjHhDqxSQJanLUxicymKz7orDxKzz8FA1Xvn?=
 =?us-ascii?Q?UMXxxIpjcRGTQc5G5kYYYBQf?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99c0487-fa6a-4a2c-31b4-08d918e860a5
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 04:00:58.8440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzMk8E79YpV/7pInOyJvJ8sxCiTUSpDIG5CF6SUTTpjW2xPYD1wp+BKelwk3K2or0SPrfNnzggkIB9F+YuZY2pXoPNi3QOYjxjtVKFAcxj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2007
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
Cc: openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable OCP card support on Ampere's Mt. Jade BMC. The Mt. Jade BMC is an
ASPEED AST2500-based BMC for the Mt. Jade hardware reference platform
with Ampere's Altra Processor Family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 8f5ec22e51c2..282e901092a6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -332,6 +332,16 @@ &uart5 {
 	status = "okay";
 };
 
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii1_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
+		 <&syscon ASPEED_CLK_MAC1RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
 &mac1 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -540,7 +550,8 @@ &gpio {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","","","","",
 	/*Q0-Q7*/	"","","","","","UID_BUTTON","","",
-	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","","","RESET_BUTTON","","",
+	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
+			"OCP_MAIN_PWREN","RESET_BUTTON","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-- 
2.28.0

