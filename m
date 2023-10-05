Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 101247B9A99
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 06:03:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qxwKeer5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1HwM05zMz3vZ5
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 15:03:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qxwKeer5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::716; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20716.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1Hms4KCcz3cVy;
	Thu,  5 Oct 2023 14:56:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sm+xbPSJUBqs8KtC4aQUToTKR9KlhqrTgZbJkS68g9e5VuhMCm95Kg0BD1zL1tQAc8LUlSeFdmzVhEu9Fjosw0UokX1b0KamFiz6tVY+OS1a2y9YrZufG3S8rK9Bu/ndlFQTwrwcY7JjHG33wzYzwjqGvExXov43+pmKIm6vmKniR1aDHCn9LfuSq/o3GSrTm9UKLT78asGdIksxEQXfstg3m8Q4qF8USEIAaRUDf8rGqrGCioGP9i9OjpzakB0PakMFgqHEy8BqOpTFz5kH2GtL5A4/QXz8Q+FmKoItvRPTAtMCPKA7mKkZ4rcINh3mhL3fwe40xYHYbaygfDAFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1bFe8HgBZ4oGvC85h6BomkBpGH1q/XxlN3k1A/OGew=;
 b=n7hT3zNwNuShjys+DFaoZ8SwOKEqKYUBLNyQJC2OLVJ0Z/QPk/IEewHGfoVDJVUjsR/+KNnOI98QgJXgH4lGVJWEivgsgE0n36ggO0vqIsfsTUpbrHYKwH0xBx8TWYqbqVa+cck3LTAtE+VLZTOVxi5MbDVAhcGlcn2N4PQnHNMXn4upGTRNKLk9rkuWJ3YT2aF1D4uaSy/RNBcjzx3WJ2c/O2NuzLl+2NlSNBOBN4VRxo+FNPO0Wf76NQ2uQC0VnIYy/AoIMzyLQrwdQzup1bc5HFnKFCNQdcP3q/PR4BrRrmcKCo2mFpBovjZlRx9Kfv2N6TTu0EUPV3nyx12KuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1bFe8HgBZ4oGvC85h6BomkBpGH1q/XxlN3k1A/OGew=;
 b=qxwKeer5tLWeCtbSLKNggmj9jBWOVJOgpf7b94qagoL+GjW0E8ad9rjbUoicO9aPQ+WqhLHUsX3Wv3Zoi0avEWUk98Xnm94v9H20dvXyE5XNXfg34F91LCyBXzqSZUxZ1Z8fiudDBDYNdntP7rStNbPBpGjtfrf/kcH+nNDshA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 BL1PR01MB7649.prod.exchangelabs.com (2603:10b6:208:394::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.25; Thu, 5 Oct 2023 03:56:36 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 03:56:36 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
Date: Thu,  5 Oct 2023 10:55:24 +0700
Message-Id: <20231005035525.19036-7-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005035525.19036-1-chanh@os.amperecomputing.com>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|BL1PR01MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b36c5fb-7d47-4f64-ce22-08dbc557120e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	f2iOyqU+q1l15RnI5CNUh0GvIrRumFGYip82+qx42oIoVZk3uzJ/OereqhzFREbZrRvcWXxM6kBYbSd3BkrFMhGSMy4Z9WqKFy1jWbiD2C4/y7PVJYGyHhcDJDbjeB3S5mYGDR4lNGm3QrEbLlzlIM1WrYQj4XGdVh61lVaEHu71J//pbbPQ2e5uRBub6C+gh2pLjZ5SqNfptXTatuxQtieCvwqKParweNkYrOCkZAXDKd7el94sToq9KyrQz0hhZWB1qYtTpH94FdBdXM14rUSwAALOklzxejFxSyvTVlu+gyrbIbPxW7ku7FVx4/fzev+MRZoqI8yWQiUzQvQ0Xfvdq4M+z5hxqnqccP7JvnezSaavVnJKyknFnyllNPt5YX3kwBHNPPdxFGcufyyuLuIAe3jpBCbizo+wG5AhxQ12h9M5RFH/eYo4VjGyMLpzaU4K9ztYdZE2KttMKK3qOuubaji7Aq/63GCV43dw7bBSBnb1J1S63nOTfByqRD9gM1nFtzXe+uasx8EoulFtewVjnfE5iMZ84Mf3EiT61nWT7Adfu8z00Ox160MlwnqiXyIuV3Y5DT4OhCzGZXh8bwczIzPlCMespCz6+BSmr5bQlRJAdQPsDINBi3tnX+rm8nmqACJ+C5EosFq2Al3Nsw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39850400004)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38350700002)(38100700002)(6666004)(478600001)(83380400001)(6512007)(921005)(6486002)(6506007)(52116002)(7416002)(86362001)(8676002)(4326008)(8936002)(5660300002)(26005)(316002)(41300700001)(66946007)(66556008)(66476007)(2906002)(110136005)(1076003)(107886003)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?z4HYJ930fdzY+BOevpcCIpAd04YORS7UYK02NMdnKy/nWkNvl980LUvJNLp7?=
 =?us-ascii?Q?abMnKYCQBe1A2qJTyfnwRr4v+YjsWR0An3GUBhNpT0aJk3aiEwNRZgzOG9G4?=
 =?us-ascii?Q?oooxeHuGFIYKDQxWPXYN6PULyVZoGFLmEeaPsZZE8nrrx4pacH/0yTHI2l+t?=
 =?us-ascii?Q?VY7rxWwceNnqiVrJ78b3Ga9/PgEbSuO0zintN8WMu0+nUqI7YA5dY/uEmuSW?=
 =?us-ascii?Q?xQTwvp/m3M6LZPcUiJ2vPYmgKB70fJi/D0mGPPomNh6HX1WZoy556q/mG5oo?=
 =?us-ascii?Q?2WRucZNyz0TU1KBQZOjBu5n2vtOuRfKsx6NRcHi5pdrZWDu/DncefDphc1Dq?=
 =?us-ascii?Q?nbAacAIbSWrZ9MjEncRn9lX8qj1jLh2PKXHY+qy2I5CELPk3mey00eIvJ4Po?=
 =?us-ascii?Q?uNn0fm1oXkDJ5lTrPQ2QTqxhqtGqnPkQNi8fDAFrJPFxlRuvE7OjyRHaPNoI?=
 =?us-ascii?Q?kYJ8dtk3hntaj5Zt+mYCxjhed+p8GnOsYlbJ6bOsHFwYJ1Qtmp+0fZC+4WjE?=
 =?us-ascii?Q?CAWV8OAylqBoT3cyr9uRKqSMCwfrfDGG8Htl29mNqr44F8MoQNgGDrCg3VtE?=
 =?us-ascii?Q?e4zcmRfV5xEUzxlHMA8bZQByO9oAjkpXIn5ustJ5Eor5N5VIJ0QKz6vqiTcl?=
 =?us-ascii?Q?PXdcCkeJHSt/w5fitbdRZArNKlXkEAMgt2UMGxOLPhXmGmGsANo/tjzg7G6F?=
 =?us-ascii?Q?YwSEWkjzfROfqBHphP5AyXtGPGQCgPirG7eeKCyrIHtSvHVqw4+m+h/pVRp7?=
 =?us-ascii?Q?C3hII5Z2r+ppORwPdWMWg7FeFeA+gYGPMhBtfdKZ339yimA5oz71gv+9OCbf?=
 =?us-ascii?Q?N3lOGJf0sWx5vKT42K9/YKscuit9O7ZKgDg7kZ0kQESd0iTNpPDtO2Dpu9Gj?=
 =?us-ascii?Q?QxFwBA3mAg2jxQQBzJXe66c+IafDQ1Ie0sQmuIAPySmeoaLKXDw0w/hRVm8F?=
 =?us-ascii?Q?ENWcC/b/do0GJeYGExC7fTA5TYOU1P4nFSXoCX4o2xSVHCP8LPZlDZrceYQi?=
 =?us-ascii?Q?Y13PeojU7zXmqXXfai+I7pm9758maQN3pTpHobPRR5ojqEwcb6CmZmBGbgw1?=
 =?us-ascii?Q?tS2ciXgZjBKgO4MJXO9fN2B31I+Siyy18Wz+pMwgohXVzUsoyIt/m4PfaQMn?=
 =?us-ascii?Q?KDwG4eFEfxrlQaQ2KcruJT1PiVxtM41twIiMfz3hNORBSqIWfufbKe9vId3j?=
 =?us-ascii?Q?0GVTvG/Gd5/eFpK0snr+OWPyAI46uE9KQkLOx0+OrKDD4+8pDrua32IcY39k?=
 =?us-ascii?Q?oFTnJjVJQqKbX+147nWqn8zc0+EDUbSs2X5SWbw4Djj2hHh/0i13kY42sKMw?=
 =?us-ascii?Q?85sDXCfQPwJGMvk2sJUfQ298tjCNzfX9cXwqZMcsjyL49gjYQBBIloAm5jap?=
 =?us-ascii?Q?yQy82zTjgLiKr290VIow5+MsIeZv3RsQxI/qOFYx0t6oTp42C3fhacpw8yRq?=
 =?us-ascii?Q?LWX7+SICV+odzgFF2zRb0FXxc0ieyFc6mQ90wJvjVOdWohvJvWmt3JwGIeu4?=
 =?us-ascii?Q?Pb5/L8A9UzHG8CEgk9ONpZgExGQZwGaRnFFOFFFAfXz1HH6mbfusFSAcG51m?=
 =?us-ascii?Q?yJQ2ou263AoIXOS/KkYx1zuHhl1ppIPk62fc15SRND1AUec8KWAsu80U96q0?=
 =?us-ascii?Q?iJbfDUbvaKkiMPXrxSg3Dsk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b36c5fb-7d47-4f64-ce22-08dbc557120e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 03:56:36.1967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKaIaONV1jd5XPzdWfwgMrPjUQqyg6zlv/KS+RKsWiHJy1Y4p+KTA97hbf9iHSls1G+m0dmnwL6/avuYKvrw87z8P4tjzKKMyqUKOjbDV1jQtpQ2VIZBOMOOVpfukz8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7649
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

Mt.Mitchell DVT and later hardware do not use adc1. It only uses
adc0 with channels 0, 1 and 2. This commit removes redundant ADC
configurations.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index c676172f0dbf..eb8d5e367276 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -564,20 +564,7 @@
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
-		&pinctrl_adc2_default &pinctrl_adc3_default
-		&pinctrl_adc4_default &pinctrl_adc5_default
-		&pinctrl_adc6_default &pinctrl_adc7_default>;
-};
-
-&adc1 {
-	ref_voltage = <2500>;
-	status = "okay";
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
-		&pinctrl_adc10_default &pinctrl_adc11_default
-		&pinctrl_adc12_default &pinctrl_adc13_default
-		&pinctrl_adc14_default &pinctrl_adc15_default>;
+		&pinctrl_adc2_default>;
 };
 
 &vhub {
-- 
2.17.1

