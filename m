Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE09447B3
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:14:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vJNFYNx+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNZh0vM6z3cLl
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:14:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=vJNFYNx+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c112::; helo=cy4pr05cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNY82XmQz3cjX;
	Thu,  1 Aug 2024 19:13:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofe7HhceEVVrDwxBUQh2VArDzB5E5mi9L29blWyF9oFxrcxcVZPMnxv3qnLj6QTBXRtBTkv3d02b5quN4/n86mNkuyeKUxAveWaEBsOzuq3Ym+KiN/Qupr1jw410pO8CW+XEatjCvbcOGJ0Gk998ZxeXdp452A5GPPUJcUlwPpH8yGX3Ij5cqhfcQvgRsYd8B98hubW0lW9CG+N+gKBNF7+B/TvK+Pie3VaLnooZP7GwpaVDkpC6IFZ7SPvTyOWVVc4kjYCHGOl8aEpBn2GM1O0VwdkDKWLtZxteklx1/MYOUCBuJocpiQ3drg3qEhHccUkyym7Z9+tza+Av1Stiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lepgMtzYwEzEMD37nLWPujz3Rl7I6dpjLG3jeX2qi8A=;
 b=xvxHahSHAvGCeBAowjKYO7i3FmgEdTNMDq/7mErxrTc0Pec5PKautHcJd4p6cgrsMFpapHgHQQKq02zToYHAL8zUttmQ8u+AqvF3zRE+wLbB6EjYbXMD8oCTERqk87Z1HLrARw4yfxe3oSdNBHYHwoiNtBa7JhZLhAVfKi/4zUni+uANgwazDpaHwbO4KkIIIX/ZcVLn1MRoo0Wz1ini+tamY4K1tECLHfgognQdB6I2f9CfSCOUM56P99ylqXs1dC15E8QkZK6Kdv9wvBV5XedpugEgo7IwK4clrVFRf6cgW9Uc6h4Ifahd3zW38shgHfDyvl8uY4k0kOVNL0U7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lepgMtzYwEzEMD37nLWPujz3Rl7I6dpjLG3jeX2qi8A=;
 b=vJNFYNx+u4S/TjYwYOSohlfOI37JlNZz/C5AQXAhGIdYuYfzU/0mzW87Imvwo1O2XktSv9G4dogQmAuEVeDLh0Bog9kMfG1KSCGbg94rv1NWDekym8fLvrqOo3p9zQia2TJSygFOENgA4Ktx1Hh/QrM6wAdbtJicfpXFevSF8gs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6640.prod.exchangelabs.com (2603:10b6:806:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:13:00 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:13:00 +0000
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
Subject: [PATCH 1/6] ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
Date: Thu,  1 Aug 2024 09:12:11 +0000
Message-ID: <20240801091217.1408809-2-chanh@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 70e8009d-9ac0-4b1a-6cca-08dcb20a23f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Envy13s2Cl3Ftb8fmttqj4mM4L5BUC2JN4ulNBL/yd3/hKs0m9NUddXFV7cU?=
 =?us-ascii?Q?FSn0q+zbhEaOynRD7xacNMr4mKys1reae32RTJvS40RIsaRRLQR5AyGqcaG5?=
 =?us-ascii?Q?iQlZ3Hov8B+tD0INCoXhZcpkjxeYWBRnu06Vq0t1gy9xeR/Lt3TjtZ7ZJMXG?=
 =?us-ascii?Q?a/jtqkWYbrFZ73EHe91eRGsXvM0lai31VzJH1WqsYv+ip7HoTwNtwabc45d1?=
 =?us-ascii?Q?C8I8sOv88vS8/v6O8iKv3irTroOj1wg5Qip2Gsdqzm4uv1O91LLQSJKr9ctT?=
 =?us-ascii?Q?ANH3C7hx/pen0eCbHXEr77aOoXV1ObovfxyL+QosVIJmgf0gCoXW19r52dKC?=
 =?us-ascii?Q?VxvMIFd20RRGknESSNR/Wv8F0GX7mcbcN7CDW0KYrbfCLF34Pl87X+micAPd?=
 =?us-ascii?Q?ONuTlxShasTL2XiGREbzejpL8zsMQxvUGFOW6Oxr9INfcLrTeHlTKCT1HKG8?=
 =?us-ascii?Q?/7e/4bZCDbp5/aVeMQWfCVLLpcroZDDOcXuat07btF2oAxLWzsOaiqMKZl59?=
 =?us-ascii?Q?Ti5nzSpidWjN2C9PfhuInHEgqMeBfb9n5b+dECt5i55Jyt/huFWrCusKdiBD?=
 =?us-ascii?Q?Ql+3TBwXwryEEGwAn8QYxh8ZaEf7BrqNJyW1sZ854l+qya1gBHcCXBf76rWL?=
 =?us-ascii?Q?uHeViId+ZH/WGizLPoeXJxZYXPWUhoBk0DpZoZMNMqAU55fl05cSzvxqzW6G?=
 =?us-ascii?Q?xE0kf9RV4T4ijfe1z5pBGp34SgnF+7F9+oIVRz06+NonvkVx3rkEgRu1o3Wg?=
 =?us-ascii?Q?ixRjv+xTliNLTYDAQkV6c0E80bYgEo4Y2BMT9JY9IIf/3YXRlbtWYVgUkuzR?=
 =?us-ascii?Q?ptv3IEX+Oljjpq043+W73hw5zk/Nd082vrTLguIxGDrVMOB+sGlEOEYE8G6T?=
 =?us-ascii?Q?z8MgtZgO44A6yiksZ3kucunwc2SX4VGTvHirHlcumQlpAOg54houn45gfZDZ?=
 =?us-ascii?Q?rRgnU/b5yT5mgvFzrcA359hh8VFTeiJX2x0+T6aUl1bqrO0+GNq89OBL+P0y?=
 =?us-ascii?Q?GrlTMrnQYOocFiAn1ccNjOV+s12HDBWsuaQ99b0qXyjaakZRYgxm0Ge07TGE?=
 =?us-ascii?Q?iMrRL0tVhLBmtsAPPInvnMFOZ+voPQP5BhXPeVR46JW5r9UxVQbHzkIz5vSH?=
 =?us-ascii?Q?OfaCTqaZ1kvuAnWUJiReVzk9r4LL8Vs5uYA3nndG8/TTWZwEE3qhM0stev85?=
 =?us-ascii?Q?6QJNGjkYidWVD65IdrWEU858HSxxAzZ4eJu5W5nbyImNoboTsaWS9SeOW1cl?=
 =?us-ascii?Q?8IYt4sDjDC15JCght9AMrTiB/PyKzyOCyweC+Qtx5cZgtJHkAUm9biCP/61c?=
 =?us-ascii?Q?KktykkpSp04D9MsAeu1Q691ey7XFkUVQ6QVtPJ/OgEMO/WJi0yRjt2BBoN8D?=
 =?us-ascii?Q?remVfvvfSq7CYGnUHUgOHRnWJNI+bDk+VfF9PEA3S9fJbBm9BXIHuuHZ8HYq?=
 =?us-ascii?Q?ShnuWMWub88=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?y8gMMveHY4q8GzWpq0OJusU3unIfal6jPxQ3W8AGLv2piUP/M23AdoII98LO?=
 =?us-ascii?Q?W6PzkmF3yS2EWemo4KRPKsq0w9g9S037sZ1Fw9x+TmJL5GoG+4NZgqydjDxe?=
 =?us-ascii?Q?C6W+H+jR2SRL/9hETOi/OWkYP/JpRhD2spVJScUNWLBdbTHIzPANx17hkWrr?=
 =?us-ascii?Q?NFXJryYc7cDf2tLeuneyVHlBYrfuffxX8F0P7Wwr1BLzUYec7fzOLWVunwCI?=
 =?us-ascii?Q?5IO0U6eggYK9M/xnUbtipWr4kWeG4psUPMtLiFkO/Q6x3KkdrRY53GfvwR/c?=
 =?us-ascii?Q?ZXPMb30paVffWT4HioPcs0eipmNAi1mk8Yh2Bcs7KBmmtXxD98EHbjIScnKz?=
 =?us-ascii?Q?Pqc9LhW+lHl4mlO2Sq845XsLf/o7+e//q8Q1zT/b+ajZskaB378sRSvZ1nzF?=
 =?us-ascii?Q?cPlwF5kvhskVLXLfEB5LrSF5a5CanKFon9eWNFe2vAZOEz4QRnY8u6HzNkWi?=
 =?us-ascii?Q?OKggnq4VUr01gxz/rPrQNw1AF7n1Ijzj8QVGPSAk4MxLzQSO4g/QzjnhkO46?=
 =?us-ascii?Q?aMPBmPc1WB/xaaEbkhUMI6rwv1ZNEbbiwIGw0BRFgu4LD6qzjnR0X8v78Iog?=
 =?us-ascii?Q?yQ2skK7DfUubCkiNPTQGi8T2B8gQdUCt8ve4mJeXveXluYIMhcEmAWYtbKDR?=
 =?us-ascii?Q?VfpIvQuBbqpDhpLZwkp4e9cSf8ALBMHEQgp0KjqcEXbZeo3LjDfupAMnVrZ5?=
 =?us-ascii?Q?iCswLpIjEFe492xav3hfc7LbJGoP1dz7AM+LX3+uVctQv6/lrjdcFdGHvoFv?=
 =?us-ascii?Q?kFD47GrfxM1VpUe3hbBKqNhtobvo9pJ05h4A+UG23U6cA9m2cWmV5N25NfZa?=
 =?us-ascii?Q?KIyTV9kSZ9CwwAi1WeiJhYIZpcJJxveMwWhCxLsz5ee9i8Rzt/KVkxMV92ln?=
 =?us-ascii?Q?gYTnCnVIvt8//TsTGGDoRpZGJG/XfKCKAuJc3ofr+JQJ5ReoGnNuQbVhrlPT?=
 =?us-ascii?Q?e16Qwp77QbaPjGc2dDfi/ydfYvGEYbI2lV1y/sNd6juLCA3O9ggfxARLtrfz?=
 =?us-ascii?Q?2r7WgYZDZq3vLlHrpyNhkF01vnAa6+eHJthvXi4MNJ/XmMU4E+6vr1o5jpgs?=
 =?us-ascii?Q?ObYJvNj8gZBlOMM3cSi75rYZXNLW4b+ARTKG6OH1ThB3AR8djMQj3Wi5HRCe?=
 =?us-ascii?Q?PNdsMAPOazHqXtH1Upv51kNkIcS3y62vcjxTdFL/FevPNToGF+QI7Ti+o8xp?=
 =?us-ascii?Q?1VJUMSwmjMhly/d96S46fe4FOKTggdmZijplsm9Gk92LWW2C3ELw6U3xg1p8?=
 =?us-ascii?Q?THS8cyFKWvyKDZAwj49GMvaAdCZJcNj7OR/QMLgUXBrP9SfNhMiHnIYzGd9X?=
 =?us-ascii?Q?9yCsCF/9wCi2djGt6tIn14W+fC7K5Dt4lonzJo5XvPjypd7KXrgsxwJ+r3Wu?=
 =?us-ascii?Q?ncjwHO3rc2bnrWdocW56qMg8mohMl8IbNbyaO2Au8V83kdAgR+wmLyFA30y9?=
 =?us-ascii?Q?kOLUeyqM1N7rkGPGfHVKgZDn/cRK+kdt3PkmXZPmibNN/LsqBOmHbLAw/u+2?=
 =?us-ascii?Q?junQ8ouoFH/QXNvDxbVDxFIwNs9TAMHHOdVAuXSpbSy61xXlvQxt5S0WOQBE?=
 =?us-ascii?Q?DkUgg1vx4+IZ3scKmiuhi5oC/4Ttx1/R7gKNzddZgyX20Pv/YXtYw4TWpbku?=
 =?us-ascii?Q?kOZbmxuASkhFT17lvrbGFT0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e8009d-9ac0-4b1a-6cca-08dcb20a23f2
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:13:00.6175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3h9E0IXAtcz3aexkUg7/B3D847LJaZtEi+KeAakdECSRVZpU5eU4DzhTMzO43hMFyOdf5ODrzyywMupz8sqENl+BumirlijPbr092QVNu3EEaa7asAabxB/IXPvQdKq
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

Define I2C alias ports from I2C Switch 0x70 at BMC I2C5.

Add the tmp421 sensors via the I2C alias ports as OCP device
temperature sensors.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   | 16 +++++++++++
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 28 +++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
index 8ab5f301f926..8102f41d1d15 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts
@@ -49,6 +49,11 @@ aliases {
 		 */
 		i2c80 = &nvme_m2_0;
 		i2c81 = &nvme_m2_1;
+
+		/*
+		 *  i2c bus 82 assigned to OCP slot
+		 */
+		i2c82 = &ocpslot;
 	};
 
 	chosen {
@@ -420,6 +425,17 @@ i2c-mux@70 {
 		reg = <0x70>;
 		i2c-mux-idle-disconnect;
 
+		ocpslot: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			ocpslot_temp: temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
 		nvmeslot_0_7: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 3c8925034a8c..3a97e88278d5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -15,6 +15,12 @@ aliases {
 		serial7 = &uart8;
 		serial8 = &uart9;
 
+		/*
+		 *  i2c bus 30-31 assigned to OCP slot 0-1
+		 */
+		i2c30 = &ocpslot_0;
+		i2c31 = &ocpslot_1;
+
 		/*
 		 *  I2C NVMe alias port
 		 */
@@ -515,6 +521,28 @@ i2c-mux@70 {
 		#size-cells = <0>;
 		reg = <0x70>;
 		i2c-mux-idle-disconnect;
+
+		ocpslot_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0>;
+
+			ocpslot_0_temp: temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
+
+		ocpslot_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			ocpslot_1_temp: temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
+		};
 	};
 };
 
-- 
2.43.0

