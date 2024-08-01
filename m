Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC819447E6
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:17:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=PdLgwphb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNfG56Chz3dKG
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 19:17:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=PdLgwphb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNYg4BJjz3dSG;
	Thu,  1 Aug 2024 19:13:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtIFFA9xl1fOPNVTBHApItL3BVFsLiAVURUEr5Tf/ixk6hr5n5pgA/FZsCjGo2FuTya2HNGL2MXHT+jhVlGq7YK9Dla2j/acrni1uplgyTqcjtsz+hZttGdQCfDhCM/u+8I1zdsxk9pH4/bBjISbDbjJEnybp+HqZFZlPYwf7hutrmmxJQEItyv34nNbiAR54TDV5p3I8Op10Mhbzj2mzo595c6mygiKkqdmFxsWBJaCHoL2SR4r72WWUVci8ee9i9GPdfN42dCvR72jk5hTA45iJHJV7kz+m0jtYYLn/RERD04qK4IJ1BLUVF/GIeffwFGMLov7e3J+FkYlMX9rKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEAMIZSt7FrVaixxyF9pUvNAKZr4WBobZRYkXKGkH+Q=;
 b=HnulbP86xxALkqeEfyN1PjVP4r3ROhs9fSUsWRztNmp7BvlIsSzMHeU2zWD8iLaTPylPUUFdKQuTxMZcpBQz+anBzu3IsZPuFCI9oY0aTpvzPYQrwt4gXNd7mAUu2yS27xIesSbpTrc4v9PjkWKipY4D0TwwluUY5GMAU/DvWPypE5HP5QGaxnPeFD99ni3oYfEvT2dql+wFs8stmvb9PXNenP3LsmLCkwVyM1YeJa230daxM0gj+Mqjoo5Qc/8XOAON49wXkcyCr3P4eBbeC/BqBflkge+8a2IYAUBp3uoWctwxcqzQwzYYozhRRvn18P0f5WI1N7XEW7u1JTHcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEAMIZSt7FrVaixxyF9pUvNAKZr4WBobZRYkXKGkH+Q=;
 b=PdLgwphbXvPkmrWbp+/LE0x8O5ldPyY3ILODvDZnTaXiVPR1jDaHQxgl4vZVCB1MjWdrBalWe1ZvN+oqE/6UJLZu+guwD0NXxMlcGEoGHiWDngbjqIjq+r67yOHMgjoFNwfuByDULZDBrsD6CnP4ROYQHxzBsgJrTeoY7cGOZMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 SA1PR01MB6640.prod.exchangelabs.com (2603:10b6:806:1a4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Thu, 1 Aug 2024 09:13:25 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 09:13:25 +0000
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
Subject: [PATCH 4/6] ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
Date: Thu,  1 Aug 2024 09:12:14 +0000
Message-ID: <20240801091217.1408809-5-chanh@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5b841f42-98ed-45da-cfab-08dcb20a3276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?GlEV83d9120gQoARlTTxnWZY8UdQUtXoaQUlUldUOVeMyd3WY06hpOKzk++e?=
 =?us-ascii?Q?UVN1Xb7OVC/qyXOZDTTfp8EhiFGf/imhOE2OF7el8CJV3weZSlvbpgeDq1wJ?=
 =?us-ascii?Q?Pxdqlss51wCVEIlhGVF4O2Med5vGBDTMlPHfxP+oabVb+m9c7TQ7NeAhgfdz?=
 =?us-ascii?Q?5VCQ0GJjzW8EjLVQIZcQHWaXS2Y6AO63n9sBjYHpE/el2GOYGOZpDD2Xr85i?=
 =?us-ascii?Q?yp43GuXpX8/OepNwJXPBqkvxZLg1Wx49OWYQkGfic00q0EAHbTGkOsJYr1lP?=
 =?us-ascii?Q?4XqJvHUznweXnb9REMOhwwh0z+YF1xINfXNpearnInrEYmR73FasMJYPyRE0?=
 =?us-ascii?Q?UAD/I+0iJ1HGBhpQkBPsmmHEcSCkeEMAcT8ViSe09X4+ig/uNf9NlTC4AHQT?=
 =?us-ascii?Q?+wc4s5ctMPnhMAcdZhZB/waC5g7PS7gpFlmbbBaQxL9yQYFbfJTpRbX58QFU?=
 =?us-ascii?Q?Eh+mDqAJT73DxLfNxaEjdGf40Sd9AlYeh1xph8N0VO6d5WFL+rNsn/72JDr4?=
 =?us-ascii?Q?2uwK4bq2CLsU4GFu9IQZ2kZoPci0u/mE7UdYNPjyUZl03ZdU2cOfKmpvMtyI?=
 =?us-ascii?Q?S6cqqcxwPmaNW4EjZcBcqJoS3PCzb/9FQ/Rq0h7E6fK2vXmc68x7gxR/kxTV?=
 =?us-ascii?Q?V6jStac2J7kAUtp/pl+M41Hq83VFKx53MW/dXas4UAedW07jT2Mn4xNHktyA?=
 =?us-ascii?Q?HotQTfZyYvQ/ixfx1FNcm0b73VpaeWXNCgp+/VHj9ZXajngK+tR9KTAzZAwz?=
 =?us-ascii?Q?EmvMNecKKBOEEYYTVMCs7yu7RAVRWiuPAEM/hSEsakuN9mMYGKCf00nJ3PfJ?=
 =?us-ascii?Q?bEQ7ZN1SDJLfaWYI+f0RFp+rMYlbbfXVO6qBKZBjK+gziet6KSv+Dvp2Oc8K?=
 =?us-ascii?Q?n9cG6UT8AVdEGenKNTGDtstH4WCpqpW/7eJBibccFYbAQysnKcC2vgePO9D6?=
 =?us-ascii?Q?03A3zDE6Rp9Z8thiJv6WiL7KxftvymjFkS2UJ0lcD2uM3DuYlRBQplc3B/ao?=
 =?us-ascii?Q?Lk4Y1HLH2FjO49ztb2igAIJ9UWc+X35t6Pd7Oe7QzP4owvV+YW8XtZV4Md1A?=
 =?us-ascii?Q?FoUQ04uq2pcg67CBJVTJvi4fT7txApUBV7Cu3DqLgD2ef93ifZVPCRK18PVZ?=
 =?us-ascii?Q?mHPK2+4C/s/HEvhsMwYCAF6kSZdMXkETROkSG/AxVkfoIY7yddPayR86XyLr?=
 =?us-ascii?Q?F3QDgfOwAn6AObsjszlRNFyCYgZChHsXjEQEUbzms85rgTxgGERNDZ8IG6FK?=
 =?us-ascii?Q?TcJVKXJ2vAyzeXHopTacOTMJ+tUSj72/BwLVxgckRGlgja667egFsWr8rtC4?=
 =?us-ascii?Q?GgefDXTdNUnDEJ7+kGt5DeMQE2B01uzNgQ0grHCbyJnMaDLGxs+fmX8NloDO?=
 =?us-ascii?Q?OR7hHnzF+TNhA76MuOfTDBECpsFc5GH8zvUa5od7Bp4LaWx860vxVPRV5Rrr?=
 =?us-ascii?Q?H/KfaJGWhWI=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vAOIFQh+VG7O1maeswumn3CzZAwS/1v4T2wfC2I8BbpzUCnj70Mh2oVpqv1z?=
 =?us-ascii?Q?NOY70WLqKKqL0EuE9jcuRoo3kCvkvljtT4hxiwqfL2Ver5K2ZjKgqsLL6Wjw?=
 =?us-ascii?Q?B9qFLmtC1NaVLJDirQ5LwOZudjFz87fjse4ym1gQEtrLHlUdg6l4z5mazrVY?=
 =?us-ascii?Q?LW56C6qfQDSh7F9Vu3h4WpEbhAat7GuStT8g9IcapgV1RiJA75VOPy/WqlMC?=
 =?us-ascii?Q?LGL3OJB5k3owO6nKrfZ1RTc8H9MrHiaXg1xRDg+U93tJ0EmqRZ2vJICwvjA5?=
 =?us-ascii?Q?UTE9lIlI1gX1mNQJP8cnlS0JLWp9HlIGiOjwWVclnrn3YsFoy+q1S44yb18C?=
 =?us-ascii?Q?EGvBEyhz7ScjpZl+RdmtRtJG2habuClNOEDdYlcjUcyp/peEto1DWUqK8XHF?=
 =?us-ascii?Q?chwPQt+HV8NJdytceKOsmd97IvAcP6LPyRx2f17OW3VpcfMOaDzvDfVf6ZLW?=
 =?us-ascii?Q?nI1EGhhER0zChhPvaCteoSqrdCrOQvXJbHiHt8B9Vczo+GGYl2VPhuJQoGER?=
 =?us-ascii?Q?00l/2a1uAlfGoiI8s5KiuyjI0og4wmi5zHON9gImJGtZ7Jjt0qGq4KTR6zZX?=
 =?us-ascii?Q?wWCwD7FPML16wuGN5Uiu/Lg4L8O+fL3X5HS+37bCP68cIaIz4IJkq4nd+FlI?=
 =?us-ascii?Q?EwFgfrrD5q6hsSCAWN+DQSuQboHG8bwsx2w3WPuEViiFq9uXwjGV8RqlsbwP?=
 =?us-ascii?Q?3gNFYekr2gvhQptmAtWzjsbfD35Xb5C6JpfSDCuo0RIbLmMhascKc6DvCA89?=
 =?us-ascii?Q?6qhvz54p54rrT2nEjLXXwIVvqbDdJvBFA6ACFKHqiC7/2k/aDoqMB9u5rT2o?=
 =?us-ascii?Q?eCY277OWR4wtHiHV4yBZC1PB1TlpKsNzhHM5xJSQLFUahyZ4eHk5MYceauT7?=
 =?us-ascii?Q?LnmZJotqFwNzlvpfOpmX0OutKgdTIvyHUz8JoeO2udFuYmULDmgHH5yNQVMW?=
 =?us-ascii?Q?SH76wCfrcTFybnbCae24ZOS5KMRQZOJ7p0F3V0Kob45XEBGUou/4NGejUcv7?=
 =?us-ascii?Q?sHPRen28mbLzT+Lw+9bW2uosottWokYtd2VcdkHg9orUeHt3RHGVhOdBEkPF?=
 =?us-ascii?Q?PIaHw4KZgOoxVYiHD3uH4M9v8htEOdEZPVbqgSRA+N7NhYAE5Ni6K/sTHUry?=
 =?us-ascii?Q?xYG7p46XusiAOAWI5Dh+RbF+mbIuKaFIFSMSuLrYLNHfpKxRBTfntltp8baz?=
 =?us-ascii?Q?//Vm6wDTPRvqN6/ljJpTU5qKN17+RuSzBiOkClq19e6mfbt3c1XJF/Yy/t3z?=
 =?us-ascii?Q?E+kchqw5xwVjp8EwXvUckCh8Hc2C7kQN4gqR8KYX1EywvHmOZ9N+LeDMiwQW?=
 =?us-ascii?Q?SgAAnGysO/kZX/8KhdwTLZw3OGRS/KDXFumxvdm8xHEkP0+jz+ox7SPNYsMQ?=
 =?us-ascii?Q?VPUl8wsYbPdzpEDn1o+uVU110p0SCsYcal9evJP2B2VTziC8xn+XWDqZ2Yl7?=
 =?us-ascii?Q?OtdN+3+3ubFjqhoOn1yIRZ41i8VUH8dFuzclAbtMM1j067Er9fMqZClwgpsF?=
 =?us-ascii?Q?K571N59RzR53X+tLWYntQf7ggSSjy5q+g8uwPnwFfGdJYMZQRzHmkv9CfulO?=
 =?us-ascii?Q?0Yq+v7CVdRoipuaEatRo1v+Q+RCTJMG7ciCQNxLGbtBzdwpAWokpuDNHgHyi?=
 =?us-ascii?Q?ZGo+/Fbv4lwe5j5wdraiAm4=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b841f42-98ed-45da-cfab-08dcb20a3276
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:13:25.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OlSda4sbVjkQZxzUgSaE6RwcHJpalvusJovJFWD8Frs9/SM7k8rIiOZnJhdEHdVtI4pIARlKoai6LWcDuujHWWf3zK2XnYJwXChsFs5NaVeKgLziTMH9Hib1FzvL8EL
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

Enable the BMC I2C10.
Enable the BMC I2C15 and add the GPIO Expander as a child node.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 0703b77e438b..119e82637023 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -878,6 +878,10 @@ nvme_m2_1: i2c@1 {
 	};
 };
 
+&i2c10 {
+	status = "okay";
+};
+
 &i2c11 {
 	status = "okay";
 	ssif-bmc@10 {
@@ -900,6 +904,25 @@ bmc_ast2600_cpu: temperature-sensor@35 {
 	};
 };
 
+&i2c15 {
+	status = "okay";
+	gpio_expander1: gpio-expander@22 {
+		compatible = "nxp,pca9535";
+		reg = <0x22>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"fan-fault","psu-fault",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","";
+	};
+};
+
 &adc0 {
 	status = "okay";
 
-- 
2.43.0

