Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B238233C
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 06:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk57P5BWnz3022
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 14:02:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=u5PwCwDu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.101.139;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=u5PwCwDu; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2139.outbound.protection.outlook.com [40.107.101.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk55y3vdbz2xfn;
 Mon, 17 May 2021 14:01:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afSvOsYQQN8XvW7N9Wt5FpDjHMQ7Eh/9G6iH9jUSwfk+c/zTpKIrff1BLPEYBPxshesWq6QGuxq6U94f99Zad4pOUDi4qH3K8/e9DA0k+6uSsHjPlKxXsnXqX2+4xwNrQ5oqdjqqjJme+fw/jT6sBEZzrFFAyPE59iuojZnJBQ3uYWh0GiTcRVbtO+REjofMzuMf4HI23PMTX2NYDrzdnsEb0sbbqxV5UJTC+xHwmEqUgLhJQZwAaut076aJGfpZlsHOqsd1u2hkmFDLDkhjsyjzbEu+w93WJG7N8rmeNIFKtIcucZBRbGZ3P3WHam3L7vdl6mPZYaa4ySqxv2M4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raKqyYrrBoYm4tY0PAxkXyvncJemEiN0cwbyzumDRNE=;
 b=PkqcJuOg2EBrbu+b1HDez7T+94GCPyBOXx6ws/VeskZOPCbzrXRolh9T8+5xCibXpLQB3KVuKVgMhhXOZa3OGCfpOII0kKNSRQkf7ivg7xlige1DFSA0JDIaqnt71fxUHRVNL0xRjBivujgUWjShSL8AtbIrcIWmF6AmwUMi97TkctaQoTiQBkWG7O6p/OfwsAEtoWF0EavSl0jU1SnSN6dcHQ7LEQ5GxYpI4s43v8bN0qEtIU0wwWfzbuaMNOEDwr1BZ0YtOZV2xQg5Hw2SUB1QAEDElT+Wcn0sfi1WE1Khx62GFTA9PNKMm9juv//ObUORqOB9Y6t1+qCgFKcj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raKqyYrrBoYm4tY0PAxkXyvncJemEiN0cwbyzumDRNE=;
 b=u5PwCwDufX6rPh0iP18Yn0WzwtVyHvvAGeNVcpFHUW4wfXNrCfRfI2FO7LTCk+TVaI46vi0oyKX02hKwQTX4ztNG4Jtp6jDgd0lMLFjDAAkLxAqM59hibp+azU37l/th8h+VuQFM3ngNzJQ8AnfgQT0tdo1Ptu+alcXelKE4txk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 CO2PR01MB2006.prod.exchangelabs.com (2603:10b6:102:9::12) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Mon, 17 May 2021 04:01:03 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 04:01:03 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: aspeed: mtjade: Add PSU support
Date: Mon, 17 May 2021 11:00:35 +0700
Message-Id: <20210517040036.13667-3-quan@os.amperecomputing.com>
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
 15.20.4150.11 via Frontend Transport; Mon, 17 May 2021 04:00:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a291c21-faa6-488f-f2ae-08d918e86319
X-MS-TrafficTypeDiagnostic: CO2PR01MB2006:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO2PR01MB20062D3C1631BF77A17857D4F22D9@CO2PR01MB2006.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: plE83HbFAa1TsgIuOMdg7/ieHDLZHlljNxa8S/JY9uxluKycUhjd01QXPStHDdIUf93iE4J6Qv56rLiGyz9CQYSaCoV6DKIqoF/h3c/LmkApVU8dFFXThsIAvgRQ4acDzxICTSnNKHiVsFMBqCls2AHWlo0+z6ObOGeGHcLbRgRB1KgRfpfnUYPXQYgILyNMIQFfJPuZ1Yd/NTisIxdcy1/y4QA8iqV+mgC0o9nLCeCo2+0rX66HcKMLkcjFpSiS2gK3CfbvJ4Ayej0uU+rfRIQnsVG1VHad3sM4dub8oJMYlpkd8U7n3Pq5TtodUc1eRe1BAvl/Wx36YpVs0s737no6eCeHsjvU77pAaQQ1C1S4wH7Fc2f728nQvF/hVv8acv/Pj9+n46vOR2N0KX9zSCUcvDscCdN+Jt30d58//FXz+obLuLfTmU+zK/0EP7RhjeibndaZ7oZFdpLmXXp6BxMOpx2mHAPE9ZJUnbn9NAbNoJS2VGNFWWXyfyl5qVm8U2g7CXttTjX7n8EZR5o5cA8Oiit5jnmZ0ICyHR9m4GlyLciFLL7eGiUWGiGKQnGq9r8WdspCnjHCflNSQGY2FILGiLzU+jK6soRtGcvEpYzlHxBLeMoShngR40DzuXQ9j82a/Hl96BVxzoFgQE11Ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(110136005)(1076003)(86362001)(38100700002)(16526019)(186003)(38350700002)(52116002)(83380400001)(316002)(956004)(26005)(107886003)(2616005)(8676002)(54906003)(5660300002)(6666004)(8936002)(6506007)(4326008)(6512007)(66556008)(66476007)(66946007)(478600001)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LhAnEceo9W4dCC+LS+uK/j0raZ6D59SxkwOvKaPYXbyCeJMlkC98wzoiQs5E?=
 =?us-ascii?Q?gfEdDaN68EklPONyhDCcFk5Gswza7R/A/y7TxWpf/UBtNoa4IUU9zDcK30t8?=
 =?us-ascii?Q?W2e85qQ6xffwDYrQ/kkW5nWSiKDQmTOhts8gGFmS6FrsJ4eUkdUpAk+Pz9bN?=
 =?us-ascii?Q?8muq2nMHq0/mCOSvjBJTNGvYBtrzP2bQRQFaDL/JXO64fQReuJE+cLBdlElJ?=
 =?us-ascii?Q?xZ66Qf/wVU3lo9WEbkWb3a9KEbZ81H8HKLasn9rQGycK8JMr2iQvbPukOqWx?=
 =?us-ascii?Q?azc17/DBBi4m54PSzWBL5B7toE97+iLXmyy9etbOmvqLN4BOYyqutji7YVsi?=
 =?us-ascii?Q?uA/sXIyrFvc1lLDO/YGd5vOJdzoTjDYHaRE1Rw2vrc9plcmow/nTBen4Fxye?=
 =?us-ascii?Q?7vf5fhAGfxZEkADnYiD9MLCSTSiI1V2cEsyeDOgHy7qMT0dNpyTaX83dF9LE?=
 =?us-ascii?Q?odIyYnj/jFjKKbPtpcpEMHfBlD8RPhe0FG2ojvKm5l7hFJ15C884vzhIF0yh?=
 =?us-ascii?Q?cJV3EGDIvABcMuYfP550X9tazIfC0/YkT//kVvwgJ7Xf9JvapxKTY9bcIA3E?=
 =?us-ascii?Q?kLb1P7ujcejDgiv5Nn2kwgbwzhKzZjQDFdWBjl9dSDmkOpaczzU/solb+wjC?=
 =?us-ascii?Q?q7bVSG8wQvca2VDjsYtaDwAilk0VeVkBIWlY/BKzAPFGXrTMuO4ygQx4dHnx?=
 =?us-ascii?Q?+GsQq9k+bq08mmXdZOJAoFY1zfd6j/ykDHAUm0JuyJDZazdx0DD7hXNaBZcJ?=
 =?us-ascii?Q?ZGt2Kb1GrOpnoit6Vxokz9RdKFfHzsvGhVZGUSsCsFXH/8p5+BpnEI/He9EW?=
 =?us-ascii?Q?FufxPnkxPzbOMmhaBJnckv02BCEb0TX1icBVyAJsNmryXo00aUlR/6816jGr?=
 =?us-ascii?Q?xErnEWsyb0aW67WmU7NPHql5QfZyxV//l6wpuOOitwDVFPRyBlTe1hxykPY/?=
 =?us-ascii?Q?0S6SfmO6f/PZ6itNMpiIYrsE6uW7bbJqNTMEQBhhi7KeKvSi/YShvNDz86ZJ?=
 =?us-ascii?Q?h2wG7XQ8jM7wdauS6EFYdmeuSijmPfUm546+SCr29jontUkPsXcu2uzD6Slw?=
 =?us-ascii?Q?fAglyGcXBHRpHMDN3Mb2dDIDsyvGxRr4ysOfIvXR3PSUZgOpIAeoprA5RMAA?=
 =?us-ascii?Q?GlWYl3jmt9yP4ZCKh++RUKLEiXMalhH4IlG2ddofPvTNNXfzbfkoHSp5n0cL?=
 =?us-ascii?Q?DPOnvj5l1RkBSzepwjtbCbiiP+0/0ZuK8WbxPO2XZqXnCuFkAvHq7plCSz+E?=
 =?us-ascii?Q?HFeqI2iRblXgo1Lr0rX95QQWwBsxVI+ICvutzCgqB2MyHaMyrirBAxqBxVgH?=
 =?us-ascii?Q?DYhEYey1O5XeaijL9exX23ch?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a291c21-faa6-488f-f2ae-08d918e86319
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 04:01:02.9526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUdaHPGyRJmMl2zOR5WUiWABc8JD1H7GY6QNwWuLsJqgRxFe0myU8lQhom7mUifIf2skDdv6+oAJuCqkctrIORiRlLBburCucDfgDJGAZC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR01MB2006
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

Enable PSU support on Ampere's Mt. Jade BMC. The Mt. Jade BMC is an
ASPEED AST2500-based BMC for the Mt. Jade hardware reference platform
with Ampere's Altra Processor Family.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 42 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 282e901092a6..364293e6ca76 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -110,6 +110,30 @@ id_button {
 			linux,code = <ASPEED_GPIO(Q, 5)>;
 		};
 
+		psu1_vin_good {
+			label = "PSU1_VIN_GOOD";
+			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 4)>;
+		};
+
+		psu2_vin_good {
+			label = "PSU2_VIN_GOOD";
+			gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(H, 5)>;
+		};
+
+		psu1_present {
+			label = "PSU1_PRESENT";
+			gpios = <&gpio ASPEED_GPIO(I, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(I, 0)>;
+		};
+
+		psu2_present {
+			label = "PSU2_PRESENT";
+			gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(I, 1)>;
+		};
+
 	};
 
 	gpioA0mux: mux-controller {
@@ -436,6 +460,19 @@ &i2c9 {
 	status = "okay";
 };
 
+&i2c10 {
+	status = "okay";
+	adm1278@10 {
+		compatible = "adi,adm1278";
+		reg = <0x10>;
+	};
+
+	adm1278@11 {
+		compatible = "adi,adm1278";
+		reg = <0x11>;
+	};
+};
+
 &gfx {
 	status = "okay";
 	memory-region = <&gfx_memory>;
@@ -539,8 +576,9 @@ &gpio {
 			"S1_DDR_SAVE","","",
 	/*G0-G7*/	"S0_FW_BOOT_OK","SHD_REQ_L","","S0_OVERTEMP_L","","",
 			"","",
-	/*H0-H7*/	"","","","","","","","",
-	/*I0-I7*/	"","","S1_BMC_SPECIAL_BOOT","","","","","",
+	/*H0-H7*/	"","","","","PSU1_VIN_GOOD","PSU2_VIN_GOOD","","",
+	/*I0-I7*/	"PSU1_PRESENT","PSU2_PRESENT","S1_BMC_SPECIAL_BOOT",
+			"","","","","",
 	/*J0-J7*/	"S0_HIGHTEMP_L","S0_FAULT_L","S0_SCP_AUTH_FAIL_L","",
 			"","","","",
 	/*K0-K7*/	"","","","","","","","",
-- 
2.28.0

