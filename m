Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2239447C5
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:15:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=cY8Wnntk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNbp0q2cz3cVR
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:15:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=cY8Wnntk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c112::; helo=cy4pr05cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNY85gVbz3cjX;
	Thu,  1 Aug 2024 19:13:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BECTJpJDsGLxGfcNeKwNdfUkytODixQzR8aikbR2m7BS0iw4Xvv5QTzc6E+TU9IXYq3ZdFtd/aa+4tJv11hKwOLfzVvcPwqSt4btceWuoopUmHaGJXMYAEmGZYlzce592qtD5o95I15U1z0HBM3PTAe+OYaeJEiuR2JJv2Gn2WwIpAvYc+F9LrDHWb1FybxmTSuCWKzPLjvviqTNwSMjm1skzzrzqkJ3sUKN4XW6kvxsACwlAd9i7ZzTnranDgxN69EkjhjjDPxM+AFYOiQx+xQRElCGyFDO+eoNnzhpKWWvXVdR9CoiFt9/WmZZfCTbFhNmABTEbBnUiNW++sRymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2cG5/l28GcvEsPNyOU4yn6mhhEg3Q64HdNLcRY3/hM=;
 b=dBpkBBqmM2seKxfvO/RwOPsEqToiQeRpptgwlt009jvkVEX0LR1yjxbNpVZn0KzULtnBoTEkNOs/A4dM/gKCoRbeGicvK5faDwH18fvdoTPtPTNZi8DrGLH1aO4JlnR0+sTIPgsVtv3E/mefo+Gw4eH/tv9fYEZIDjSBbkTwLChQeIHvTKAsAxvcHFv1KLVuFSwMqPaR2zCZ/DAtBj2TogsVxMVfInEpUFdhliJqGAuy8vGgHjTzmRQU2y4tuSYeA5K5t9HEofZXJBTfpKj+97O925xxxxEq8R6IhU9f5f3AfmS1mwWFAAbvBlpSUnpdR/lcXwC9WUkLL8I+4+3XNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2cG5/l28GcvEsPNyOU4yn6mhhEg3Q64HdNLcRY3/hM=;
 b=cY8WnntkIlLEK32ULRY3gO96+Et/3YMMz7ELikOrjKpPy1oac+I+wkD/igX/psQhDGHqtvgq5oyXAsrTKa69b7h9yQymZvgHMYyv8t/Ept8ihvgQyPNNigT95GYAFVZQiyckh/bQZsyIk8Y7CrVFH1ZWgcce7Gz2V1tZCVYryQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6640.prod.exchangelabs.com (2603:10b6:806:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:13:11 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:13:11 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Open Source Submission <patches@amperecomputing.com>
Subject: [PATCH 2/6] ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
Date: Thu,  1 Aug 2024 09:12:12 +0000
Message-ID: <20240801091217.1408809-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
References: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0105.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::21) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|SA1PR01MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: d04b03e2-98a0-46c9-d1f4-08dcb20a2a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?2Vjhyp7sLpXZo4+4iIyssFsl5oc9TdQOJkKSV6JSMVcHNl/ARpgPoHRnSY1T?=
 =?us-ascii?Q?G6LqLgA+wuO7DxYOXuQ++q4lpPI/0EGQnfD5QnUnGGObl6/eHAguYl0/cZ+P?=
 =?us-ascii?Q?QKAw08In5Ss2ziS2zbBedSd+SsJ7QIq6RE//qJAiHno2qfFQs44VvK9lOzOi?=
 =?us-ascii?Q?uQmaUewQqRNc7FNbeyVs0Tp2FVjiLupybCob8g4awNvcGAoDoeZVqYK3ldor?=
 =?us-ascii?Q?Z9bpz7S4K8IP6RqUPHSO5cT8zhVrztCweQ3GjBxAXjBJIOIdq7mJG7WaVqLJ?=
 =?us-ascii?Q?BSofvrebrv39VXCrbXiEhFoPP1q0HXnzAgpaggcDGu5nS8r+F+fpsybVt6DN?=
 =?us-ascii?Q?5F8fVCxSZYLvD8dElmV3+XVNdWZG5Bvf+CzMhcMU0pqZJ8pNGZGXDWz9rCr6?=
 =?us-ascii?Q?8I5bYp0ypQEoRCPcz8WeBsPXm4f4P+jOtO8VoSUdeodZihy3iRcZTuKsDIsm?=
 =?us-ascii?Q?QTAQxrYcED/c7ERCYE2uIBypIGb4TbbiJkbCsTnCJ2w0Eq9BinnuOJoxRDLu?=
 =?us-ascii?Q?hA3nt4f9ExIGvhOyQ6lYLCm+AmIi52onmMlfk7IEnndIkLB+ESrR4wi0Gnir?=
 =?us-ascii?Q?wD5pZyfSZOGZukHmSiAJQukg2lIdiDmEn2m2qNzz1/yy8+wbJbD+PZCJL499?=
 =?us-ascii?Q?8JKRAsGiZ6o1rMIfQ1MY0yixNJFI5vsMGsXgWIT4d6LlnVhWERHdzwh7qsyP?=
 =?us-ascii?Q?+XG8J+R7UGXL0qJYjjyhmKcDCj8gQDGupAGBeiSl8Cz8zP8s4n6PV9u5eUk3?=
 =?us-ascii?Q?7pPkuY/Edj38yHQsql9SyEnP9PA4DsF9cRzO05MK+dElkHNZ/3QR5fTPg8Cb?=
 =?us-ascii?Q?qKDvsReLQE7kdvfrSoIb3XtVonZlFMAEPCsFSXilajdYLVNpXD8B6rTHjZt5?=
 =?us-ascii?Q?Oo0FG/VJsruUSkSyzzaiu0dQyWQyQ1S5zxiGzvrdeUL66gMn4ze0ONQL0sMh?=
 =?us-ascii?Q?Ry+/ERT7KXO/YKydfyNj4rd6PHg4UyPesHPW8Hf1qhPHEG8eXimzjsL+UbOm?=
 =?us-ascii?Q?iyazL+XDtU5waZXd8jLiXukVEqs+//mCDswU3AK33oyVEgAl0C8JQvqFkpmr?=
 =?us-ascii?Q?/MnYYhffbA68HqUR7j9rgzTUMTdpXiYksqcF+SuRrV85Ij+oDDhJnzLkqCgy?=
 =?us-ascii?Q?jC4rqtS1geXmVsIkAzzprzi7L8tgClpGoxsltgKVz1DzrFDTdmx5BP/bEtM5?=
 =?us-ascii?Q?lk34rYFgRQTzYiMAedJElGrxeYHfqW3j9NL3c4cIBy2CE0VOiYZ/qLrXse5i?=
 =?us-ascii?Q?TbOG8ldjaw17pYe40V9FsogxWIgdYy3JZGrSn067oETlsJ7ErI8sgP3cbnv4?=
 =?us-ascii?Q?uNA1irfB9I5pdGJ7uDb+v6EwGal+lBSOzyQElnoq0/VPWFdCWc9Y0MIRBQl9?=
 =?us-ascii?Q?Y4wrhEMnC5YhmtSmqRqZP0q05sU/aaHamBOM/krdUccsn4exLqZbNkJfK8lY?=
 =?us-ascii?Q?gOnsoVcincw=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?g9UhenPremTC0rmKcSdoTLKYfNIy2bC4nEoYukFHJATv6207sNYI/ejPz+yE?=
 =?us-ascii?Q?MfXRsC+KzUXk84FgFaxaejVow+A06NcZwKUsMYWw9OXabbJnDIEoK8j+U3bZ?=
 =?us-ascii?Q?H6PLwuzsoQzUrYJderB6we0rSdqINjpc3JCSJGf7f8lR+D1B1dnUblYkWp4S?=
 =?us-ascii?Q?wXNDgSWmvrO4tsMDo/rxut5e8Y7qkZX5M4e44+pKpe6CaC85HSp6aTmjsaaw?=
 =?us-ascii?Q?PdjmYlJBiH29Lo8/5fsxUUa7DcZ1XOAi2p2HgNH4jrzhtI0zTrddd+LnCHeJ?=
 =?us-ascii?Q?pHG9gBIJpxSqwLhC2kJhoj8IHg7K24SiwkrNonxGPHEu0Sf12/wowpWE7CLY?=
 =?us-ascii?Q?7YkkRNZC596uD3gziq7NUpLFTtvA1MQaw1dzDM7GVrFObDs/FVcu4X5sKk9V?=
 =?us-ascii?Q?zHZ/y4gX9PjSTAIAWf41vJO2ZiBTuY2HHM5y/pOnJ335rNn6lJtrnkv1jW7R?=
 =?us-ascii?Q?ZZLmpza8aA9Xkchp/KaXPUE/x7pVbfxs+uvHoHVuBQ60YFQNJoOXPSGnH7SY?=
 =?us-ascii?Q?CP5qncgrcxfOIoVpXHFoJm5iXXrNWXSPCPLwp1XzS2xVFgWtLDGBPHA3SeKN?=
 =?us-ascii?Q?Mzjb7CjtUvSjFIf92Hfo+PF0vQpmts9ulzX0IQoPmS61MvSORy92xU7U5Ywg?=
 =?us-ascii?Q?vGMg307hjvEEvBDMXhOufdXNC4sh60x3FcdqC3pQKdycXW/THSMZCbF88xaK?=
 =?us-ascii?Q?Dj004Etr+WRxJFb38YbYDw3EaXRvA+A54Q5h9K4liOEGEgYrOkHrqkRo4dmo?=
 =?us-ascii?Q?iCVmzyfWjG6BbvMUv3z5Ksfz6hCV73pNQP5Hx4EFKyqzcdFLnIwzIuc1K1ho?=
 =?us-ascii?Q?9zwuTJD5lAmA/8RfWatwWJdhiGB7tTRg6dkQgUCPr6X9k4mjwCTpLMqP8W/E?=
 =?us-ascii?Q?T9i9t7wESthwHVNk7WKl34k+Rxd1Ck0h8GJYIDHBD02o+mPY4Q8ftN/pc+vX?=
 =?us-ascii?Q?mVIhqJpTFa2HoXxLQMNAfj2cjM9WYVYRY1oYYs7W1zmK4xZW5FTyk5a1S4ce?=
 =?us-ascii?Q?uZ5qYVSLmGntwTj7O/Ncles2R9Nr9FP6tcMMr+EjrSwrVvSUmEx+qD1aFjP7?=
 =?us-ascii?Q?1AGB93VNw7umTIx3wgbWHcxv3XvCe9HTA0q8RPOyOU4iHMZod4dRS931QoOL?=
 =?us-ascii?Q?OaIvqXLkDwaIKThlHJWi4tV68QwjLaiq6tuUZeEiC1d3cZPTN8WDvCxjwLrl?=
 =?us-ascii?Q?C4NlE8QhReD89ycoj7y8yGpdhqZkLTEPEV9ZqbX3yBUC8D1z3JDisQYyq59v?=
 =?us-ascii?Q?WiCpQkevG2axGZNb1yOxiAd0/DJ5jQePG7BLlyVsJhxRPCWPZM587U+kv1bw?=
 =?us-ascii?Q?0VOG4/GB11wM/N0ICtEVd5k5X1Wr4XGOPAd4PfpLbqxSo4MEWrX7u06hOnEx?=
 =?us-ascii?Q?+KMqJuu3cAb2XiyehbQkZZZoCKeU+V/cO/qF+SLf85uBTIwLILuWSVTqjy3Y?=
 =?us-ascii?Q?NienFwocH3k2vfaLk4uH0AEOM8EbiQcsHJFTowemFssPZveSkOdxXHaaAkk1?=
 =?us-ascii?Q?WqMAundd4t5LLKeS7D//Oe/3gfDSPBtCcNmt9FZvIPqmfe3xdrcAVHGWMlz+?=
 =?us-ascii?Q?wZNp2ytwmJa51dwvoOxuICai23TdRCrCdjBHnI3zQBAAwOLJ8SkHLqG99ydS?=
 =?us-ascii?Q?Mlo3vPkHVcBEbencMVIFfQg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04b03e2-98a0-46c9-d1f4-08dcb20a2a15
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:13:10.9477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGO0lTi4CZd3FQ4MjAnRBBmoQPG0Hrrold7KE3FY6rFA0wJyQNgK+B1AMbClkGwkelP8RNmk3k1HB/7jn3+EjCwMV1fhagQj+cWxOTN4nX4E4usB8FrPb9qyZko87i1D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR01MB6640
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

Add the I2C alias ports to read temperature sensors via channels
of the I2C muxes.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 3a97e88278d5..1679911e4fd8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -15,6 +15,14 @@ aliases {
 		serial7 = &uart8;
 		serial8 = &uart9;
 
+		/*
+		 * I2C temperature alias port
+		 */
+		i2c20 = &i2c4_bus70_chn0;
+		i2c21 = &i2c4_bus70_chn1;
+		i2c22 = &i2c4_bus70_chn2;
+		i2c23 = &i2c4_bus70_chn3;
+
 		/*
 		 *  i2c bus 30-31 assigned to OCP slot 0-1
 		 */
-- 
2.43.0

