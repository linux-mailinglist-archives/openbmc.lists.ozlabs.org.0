Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5419447F1
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:18:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SMdOCZxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNgN2DlLz3dLW
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:18:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=SMdOCZxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNYh01Qbz3dSG;
	Thu,  1 Aug 2024 19:13:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhwfLs7xCARdDt4N8utHcQnME3USA06kdz0u7zv7Yjat1SoH4ruv7Kxa04nY7DyUUYDM00e20XrqhvLBCJaOK6AO16WVeA6Cwe2rpeA82r4BlaNNta0V3m87Cxq5KPj9qiL8v1vJV208zZDbLLsaJ7jkUqKIk8wtDAu7USzgJYisV48/YkjpgUj/u3XjMjH5kABId4YSYfqrlq3tNJdQlh1Bxm7aa6QpOSTuBNplrkEjLFfEPohjwCrhalZkkUISBPpEP33UDvEWgbzZg5xzyyGaNclle4B6UNzRp6NMm6MKbI2kbd6aqdx8FPLzb+9m9Qa8b9QF47UqtDn5V1MvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IyCcqeey3/GYM3KxVJiuA8Bate08JQiFrzuKF4pa0uM=;
 b=LTh6kbSApsjhK+UmBMD2/QZW88n1WtgTEnrmB2Xao+jFBoiVxW1PbquEk1TcziAvkWjSnI4mn9geLlcyp3tEgXwxUJPQKJDwpv2Ub9IS5dWguFZdhQOBwlvta9GJZK3Hbi6PjgW4muCBDa1Cg9xOSmhg9WBSVWwx76zd6TM8Tl3PUlzZd6icjGcxNGtBV/pMtfWOdslkTKwnj14K18SzT+iBjB1EOUMDCj1UxzpeMArPbeA7C/KAtg3NJdfIPV1LcfAMRJwuvQUeIhdcZ2O/tYU462PHAcwmaCnOdsoIVtfZtCNFK6G93s3BdpM1itiuDX6kiOU3j2A4zIH48ov5Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IyCcqeey3/GYM3KxVJiuA8Bate08JQiFrzuKF4pa0uM=;
 b=SMdOCZxLgUH7VxV28g9AZNCDo86jaXT8KyQjvcd7/MUaJ/TegLQqPM26vwBnb53jgvUGv/4xRuD16RM43Ubus5UJt2LUkOURB/cqkvZt7mUmJQH9qdV/so/KWu4MAuGlZKucWfLu0TlEdkMEYFWJ5vl1/zBgs4KtVBF2xd76uZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6640.prod.exchangelabs.com (2603:10b6:806:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:13:31 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:13:31 +0000
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
Subject: [PATCH 5/6] ARM: dts: aspeed: mtmitchell: Add LEDs
Date: Thu,  1 Aug 2024 09:12:15 +0000
Message-ID: <20240801091217.1408809-6-chanh@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f23cfe0-c978-4632-6e04-08dcb20a368b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?03PI/hzl/fPLXYNsF72Z14ASL3GNtOo6ynI4Vg+1SRATtZgsAL30Ejp8A8TS?=
 =?us-ascii?Q?MIL5ROPtg8e72K5jAlzu+H5arWzEEGcw2Brg1CQEOymvY6KUEN4fWPFP+5Os?=
 =?us-ascii?Q?/cGOuN+wADEsMOAgwQtgV0syZv+9wsrAZsEGgvah4PGKLf4DuSUUrtmFUM57?=
 =?us-ascii?Q?yDF6jaYBh1rc9/1m5HnvrD9P8k9FYuMs6NpOF/9NM8PMwIWHei3Vt9TzwF+W?=
 =?us-ascii?Q?9M7+Kk7PkFDT9unyJZiqypTucsYb7uJoajV4jYtS026oHQ/1ds4qonenRVcP?=
 =?us-ascii?Q?u+VaWio4/NFM18WYaeBh020G3PRC/Folo/VkA1GpB4gMvCS/qqaortcwUmU3?=
 =?us-ascii?Q?ne3ryHxf02LGeVWHR4urPP5wZUXapKlgnsyDASbl3zzDfD7Cshpkmj+z1xE5?=
 =?us-ascii?Q?y3Z4zZnQKSObQioTjr7Ij0c8BlG+mhLq3qjHlQx7+oIpl3MdqkhK+946xiOB?=
 =?us-ascii?Q?Pci7z342vDW/VvKWFR8sWQfdf12VWYLYRPZkD+v5EWzpOCkNiw+W/bZYg983?=
 =?us-ascii?Q?3BnCmdQQw6ixv70pWZm6krh6bgvmuR7DSoMKbs3pNR57gU0IYhPXe4vD8DxH?=
 =?us-ascii?Q?bmFJEHoz36eI3DlB6FaqTmvky5zdpShAqxeVSM487Y2thilN80XbHInFqO6H?=
 =?us-ascii?Q?3vTOL7z6+voviVZMyznBguHQjttTan9lKhbgqurCgcB7sWhYM4Kcxb5GadA8?=
 =?us-ascii?Q?PlVHmiUJEeqbWEJbP5SkqAm1NyWMlBFCq+kQg66txn8nUGRa8kAXK3bfnR6g?=
 =?us-ascii?Q?kNFzenIl3RjJ2TZph4Se0beLy76NZVDFWphjgn4InNj+EXy4frDx1580+/r8?=
 =?us-ascii?Q?Wm67E3AZ89iiNQcTJ/T1L06VdvsixPd03GunD/PTpGzjCrgj53CM3GzzZUv9?=
 =?us-ascii?Q?JuS6YX+KXgl3oHS5emlXc056u+lGIKnLzmygDvuXaILuwZk1lBYpK3SrgLuY?=
 =?us-ascii?Q?tq0wZWxACnELiXSXcK9d7QzVqqAamq8g+XFf8BzFZ3BHYUw+ZQbpbzXMJOhD?=
 =?us-ascii?Q?7VRbmaMsP7W20zBBxtz0WFOY/jbfbNxIHuU3zBcCPHK8IFAvYP+exL71AkXR?=
 =?us-ascii?Q?41H5lNlowJdvVzgP5rttB9friZc1DctHp13MkTmFRgdmRCqoVtRcm5v4ETJX?=
 =?us-ascii?Q?Kmm9mUY+JO752c0CSvhuryXhmgJMnF7/0+FBSnAaODiPAOLH1It0g5ApfQf/?=
 =?us-ascii?Q?+YxwcHjicpyu86stshIAeH+p33zv8UOMZXYmuUJAN4wBsbrksbmsMjksSrzI?=
 =?us-ascii?Q?QDjYlZB98xBmCU2aoOP4H0+D+O3C0roFhILPf8ywYes99/tT1qL1bmv9NZSN?=
 =?us-ascii?Q?fJWGJHjG1/YZh1Ew4fyAjz6LhpRu6A5cI0zdKQZ288qjVM/49zGceoNTWaLl?=
 =?us-ascii?Q?aSRD8SWjRoQd48lLRz2VZS7ZsKIs6WKhysWS2avPsuFqBmIV9JDHQUzjMRyC?=
 =?us-ascii?Q?ClJgheVLlTQ=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0put3qPj70wD5wIUZIoi9e1RDXYDaJStpZz9F3Xe1y2Soi2ET+gmCdLkFMLw?=
 =?us-ascii?Q?OvlQpG2J77JHvzYXGbhSbaA4eHbjN6/2F6HuKtEE3ZssVrRajIsrV9giUrYh?=
 =?us-ascii?Q?dCGRZG4yGSNO+z5VYeMttQqP6Tvha9yjQvtlxA50TYtd42e2Kd8R/2o1aHTz?=
 =?us-ascii?Q?tC4nsrs93IBkyr1iT2zw07qkCj9E64ER/AwjOtQuA4xXYkdnCp7l0I18opBt?=
 =?us-ascii?Q?HoMg8k/KDaiZ+2EeH3m2eGU6xhG/m6IxmW7HTUBzKtbiHiEUAb914nTwyH4R?=
 =?us-ascii?Q?Ni15vUqVdRRCgDeCJKSTud4/ZRWu6p2a3+668/IUZS44OuSEgmnHfMnCx9iV?=
 =?us-ascii?Q?0WhKjK/h2PZDh3AoI5o2hhcR1GU9oM4ydxvRDfzhh5A4y0ujP8xJjYWm8Erf?=
 =?us-ascii?Q?UxoQJry+vcUFKMG2M6nBR7Thz0zG+831MQy9u9Jfdo1uG8Fl5rG46J7a2Kpr?=
 =?us-ascii?Q?Ror7tiWwh2bNab2FsNPQ3OrCaD7r9Oe/WAiZw9CMOwAUa7D3aywXjYpB2v15?=
 =?us-ascii?Q?w0A5CBM9mFsjQ458O6/o1RGWrMwoFWVk08SlVOvffZLQPACLI74e63Y7xf1R?=
 =?us-ascii?Q?ak6FLOz6syHXcrequLxAvS/HQ6Iks/Xu85g4fZAvRmLVopNWT0n/hnu6UMrP?=
 =?us-ascii?Q?qTz/NBrNr1bUwPg5k6IKpxTHPZRa+tyGzKhqLQS5tdgnsz6zONz6C8m+Nf0i?=
 =?us-ascii?Q?jF/fSc7D5FCB2MeqOMRLm8LRzhwXgYW47z9r75mVZ90kaOuTXabcVcQLsw4o?=
 =?us-ascii?Q?lQ9aev+OFqkJG2zbSwRPrjzOg8miBfZAmZ2fOPz7Ev0/suQUALcKXRjlU8b6?=
 =?us-ascii?Q?1y8SQlJN78uS3G3yKxDXbyHV6F3j7LmZkeJl6KUiEWWiwN0y553pfrCGb5IG?=
 =?us-ascii?Q?VxvZYdLmOteOJJEHp7PlDlU2Otc3r25JqCohkv1bEiMsC/1ePvz2vb4H+msx?=
 =?us-ascii?Q?1lSLiJM3dYGhcpu66Wk0EAtSTG64/y0g4XRiaMUas+/gU2XDdL+vXDC6q8Xm?=
 =?us-ascii?Q?7ZVkfs/w56FOkxlsYkg9CXSgo1IYTPYdkTqR4ARKttJi9HE88ww53K8qoq5F?=
 =?us-ascii?Q?bZJq+aGrWKoGk6/4U6GiWTVh9M2srYbl6prdNVQZ1yuKZ0iQ//2NjLO9LmUf?=
 =?us-ascii?Q?ndIihC3q+DjrnYtfF348eULU76N60KFmft5pfGbN5p6vrVKqu+DN41JHkcvT?=
 =?us-ascii?Q?VrvkoOhzsLpMnwpCKh2bdg6deQqVfQsGjsWGJzcMEK4hV45HR/O9dny5rnW4?=
 =?us-ascii?Q?cRZOdH29gytxSmDkBeKZIYdY/hv8N5UqXIyjQoZ5C0yt8zn6se+vtoDCDmkR?=
 =?us-ascii?Q?uPSmEcx8MPG8ZJHAnM8ugz4TivkeUVKajLuFeCI9YlJ6AICeAkAO8jXlGQq8?=
 =?us-ascii?Q?JykpTIiiES+2jyuKwtL5FYXCdZLu8Okrgvr2i4qArw/TY0uv8NLrrZsMDVuh?=
 =?us-ascii?Q?FIDrku09jYeiPjMVF8V16zSc/4wIIlls1m9btObJnB/wIMTillFwEyaVW7be?=
 =?us-ascii?Q?PxAk3B0et00uS2nhaIzfx4lJN4Sm2CMjbHnh/i9HuS4IdW5lEM0dZ5au/2vv?=
 =?us-ascii?Q?uAzNQ9zYGCOruowFT5K+kW85PTKLm+G0vVJ8PaC9e2yQyhR/UVGJIaRTtfez?=
 =?us-ascii?Q?bjH5k3ee1lce/GH/m9ChgPQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f23cfe0-c978-4632-6e04-08dcb20a368b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:13:31.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oy7u7OdYptnFboKL8/RzVfsbLmz1wMys2xHs48Vbsc5u5yQwE+4DSHwNQwFKTQaBxsxYWlPVFkZeLjk0+3bBw9Txp25p1kc31V9Av4VanjG0LtN0FcYdGsg1LkUOge4y
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

Add LED nodes as the gpio-leds devices. They are led-bmc-ready,
led-sw-heartbeat, led-identify, led-fault, led-fan-fault, led-psu-fault

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 119e82637023..093b746c010f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -113,6 +113,37 @@ vga_memory: region@bf000000 {
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		/*
+		 * Use gpio-leds to configure GPIOW5 (bmc-ready) pin to be reseted when
+		 * watchdog timeout.
+		 */
+		led-bmc-ready {
+			gpios = <&gpio0 ASPEED_GPIO(W, 5) (GPIO_ACTIVE_HIGH | GPIO_TRANSITORY)>;
+		};
+
+		led-sw-heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(N, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-identify {
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-fault {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
+		};
+
+		led-fan-fault {
+			gpios = <&gpio_expander1 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-psu-fault {
+			gpios = <&gpio_expander1 1 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	voltage_mon_reg: voltage-mon-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ltc2497_reg";
-- 
2.43.0

