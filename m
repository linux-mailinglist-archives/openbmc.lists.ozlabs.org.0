Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7A2948A07
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 09:22:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mxJG9NS7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPs05HPwz3cmV
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 17:22:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mxJG9NS7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPn96dghz3cXd;
	Tue,  6 Aug 2024 17:19:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOVbBBuoAbTxonCzml6IR2JFiH3ZjKXY52IiUFVrwdFZzvlBnoGey9LadOtmvSTYS0NCfMprn6mZsK6sMtbOYuqbCgOERoY/BIKl+pAtqny5JYLNBWMTboLQRaE44A/eKyBUNwj3RXuX/hBgsw5w5qiiqtP+Fg/VxQgsZwXcMkyPt+IJVl8GbzVvopsKUPlZRb18o3EaFs53M4X6MfvR1LwfubnzO5KMllp7UJ8sO/f7nhZLBAp28uACS/l6dL6euXCFXyi3KjEGCsuOC55eKsq1Y5ThhTtJO/nqTbCY2N88THquw3uSr1eENsVQMXkb/GJdyuM9MgdfZnTCiOMEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRZKqcl1toruNPDzCU8GLaE4ll72KY0ZpUOmMmsJ6+4=;
 b=jDU80OqRWsPx8rJP2Ccz2UTTWrBKD2iqA/4wf8hQ1mx7qV9+NmAmvVHvm/42Hv976nDXTyM+ZIlA7W+i6wsyIeeK1Z0FrhpTff0PENfLRx/IuXfAm7LD14cKyZr9FDv9MCUE7ilpby2OhHWim+6nf6OxRyhk2xYpd/1Yhmxli2EdbqL0N30lyngf7yPvAJCtUgbeOMYmY+CNo37R9BpMak0x51Qms64QQrxPpCskGL5fKvahBeJluIXV5ZHE0QzEP8/oX67jkkkXEgBmKXdlgpojXbzUS4V6eQdMnDG074hUCbsgQpBXWwJnPbOFj146A9D5+e4zxj7s4nKeclGReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRZKqcl1toruNPDzCU8GLaE4ll72KY0ZpUOmMmsJ6+4=;
 b=mxJG9NS7y5bIy0OgVhhXVtCbWhcFidIpxr97mwoq9teZLk66cabYaPh4LYJS5aV+7O9BDUDwTxdh55JyoLOH9+RsJOkeI/wBechMBVzWkPDl53fjw1lHHU13KYApC89W+088OkVONwIYMlCQN51jetQ5g2fr2ui4CHCkz/6jFmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL1PR01MB7770.prod.exchangelabs.com (2603:10b6:208:399::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 07:19:01 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:19:01 +0000
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
Subject: [PATCH v2 3/5] ARM: dts: aspeed: mtmitchell: Add Riser cards
Date: Tue,  6 Aug 2024 07:18:04 +0000
Message-ID: <20240806071806.1666550-4-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
References: <20240806071806.1666550-1-chanh@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0026.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::13)
 To BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|BL1PR01MB7770:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dad33e6-59a2-4712-9c74-08dcb5e80b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?0VZhBFLJmcUXy8y7Omwz6rm39NYhAGRT3X3R39lq+UsnFVFQjbgQrNz2F0Mm?=
 =?us-ascii?Q?kAGlqqcPnXjg8HA21AKfSElvgwMr326ThfgZmRsRgxXfgXRp/n+29zCbluzO?=
 =?us-ascii?Q?NbyR5LgrmoW48Aq6IIxhFcetyTGXpmD7C6oO1U5rVo6zphZBWT93KZl8UTSN?=
 =?us-ascii?Q?k4eTOtChfQpOFM6NhzAtVLj+TRTdCqIIfZWxBIIMXn4GXE4Wcb0GVq7E7SOw?=
 =?us-ascii?Q?kR5rVPWfbm3jFwmz2Wg+i04JqNx54dmrv5azP8dZ0c1d7B4+geMla3mzL7Lb?=
 =?us-ascii?Q?IbYyUmPRv9FwcJSvWGiR1SOmGNn/yK+NScfUEK6o1pewQaYdsy0iBfOPyOTM?=
 =?us-ascii?Q?tqB5BUul8/tAG+Ou39dLAEuQK7Z3nb9b5kpTDoxre1JLxJ4xRMKcPBMdO2Yk?=
 =?us-ascii?Q?/oKSPTXuPNKS539FYsd2dxMB2fxs63Fhy3ykzhiUow6IF6JPkPs7AqZtaQ/L?=
 =?us-ascii?Q?VyFnObLiVMqS1CigAzcAHal7/7TcFygPCAc4E7AeM+1niXe5QIFdPILa2QlL?=
 =?us-ascii?Q?6BPLN6hfaX9i3qsfL1N7I/v/MqnF16ItRU1tuPodur5voUvv02VUu5i1Zb5v?=
 =?us-ascii?Q?u283pkKJlKLRd9J0ae4qSUhQCZ48/9IAmLsxw9WrN5i/MpjrvexWSYwsy4fs?=
 =?us-ascii?Q?UoQNh6//BhJE9u3Kasld5SL+TCOSPQsePXTjwn/qKqElfyPb28ZC1wnsHUoo?=
 =?us-ascii?Q?AYcEN33aobUMD0rycn0cwHApE7bH3Tz7ScDCPEaLl+3jHcx4GPV2IsI5RhXg?=
 =?us-ascii?Q?xb6meIwnZu3iLrcIPL9I6g7DCuGb61/nmwcFjyDtaDeNPPat0wG+l1uy+EsF?=
 =?us-ascii?Q?gV3pOlzBeUQrk4lG9waH2pZgqbkThk3FC3tvU6HHF4hH1/AnLJJJdV28nNv+?=
 =?us-ascii?Q?w+pbdfVtlJLM9VRLN0UICckX8RFd8QtZrgL0yrLv+F0eItUDsR8ZX7W7xQTA?=
 =?us-ascii?Q?34hSLad9Vyot8ZOmICQYLVrO916qBlFH7/EGmFjDZ72bdrwzWPsf/Ev2cSCb?=
 =?us-ascii?Q?BzOdBDUelUu5He24p/sA3GKLflBhzO3wyIbirSZw22M/ieNnB2qppAEeu4Fp?=
 =?us-ascii?Q?ejtXFvVutFk9V21SvG4dzjOg6l/t1uheVrJgrDDmC6lqGxfrsutXu9jwfLHc?=
 =?us-ascii?Q?f6VFiHooI2iAu70GOSYUS/WPt7CbiBnggyDtnQNlKDRL5LP1QGqpzWDFLlTT?=
 =?us-ascii?Q?XrSlRKexrhdsczaKtyiaw1pA72oBQMeCeOo46i5b8SLiPnB2254B3CEe9TXj?=
 =?us-ascii?Q?yLD4nxTRYs3O+ZfbH1aZOE/AwFdvYrC0TSBciny4b5AWG1zzzL1K12+1rHdt?=
 =?us-ascii?Q?pksAR8EkVIoTRqhGdgUXix8CtMxVGA6OhireUG//eKicLjgGY2M3+LBT3cvn?=
 =?us-ascii?Q?xzknvU/eobMH3e25ViOOwLSw3DNFhoQYQh3qRmDUY7mHG8bc016qLH7cAqPo?=
 =?us-ascii?Q?T/aNXor0MKc=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5hwM8lUWPahjpuxD128xhfulOVdknEa8AgovOb4w9NoaKnXHNDPGqtOgImrf?=
 =?us-ascii?Q?SlNCwCjY4jbnRjkTysvgQvJ+A6AaXbWgfvyFJVBnnw9s3DHDjKxiN14O1fMn?=
 =?us-ascii?Q?B9ot0qvN2Ggm6JHmn1f/WCOjTOQgRobhm+nBRv8tAVE3n2fn0KNoCkH+k4qg?=
 =?us-ascii?Q?HNLj7vgQcIVKbBOZdWQGTdS2Nmtv2EE2noSNIy6hTHUser8k/lFuRz/gr1fd?=
 =?us-ascii?Q?/k3WqlblDbnA2l7ClNhKTprJE2+lmumMbkO/CB2XexRBQoRiC9BtfnA0njBZ?=
 =?us-ascii?Q?C11QGYhHEAUIm0Nsuxx+LClXPhJJM/HbAD2Bj1snfv6CrLg+zyUG/us789QN?=
 =?us-ascii?Q?9PoJkYKsiB1UCJQfiq38fj90mqsNcKCfNhyvxg/OjDY/EN3xzPDPal7K5k3X?=
 =?us-ascii?Q?qeugWaTU/95V77jQ2KeN8aYQgQueL63oFcdBUEGEHHt9orEZ6+fblN5GTnNt?=
 =?us-ascii?Q?Gb9u5rTRsei9tLif3veFF+V3qcpXcnRwCFkNLSVqON5kSwuBcwOsX6W+M3Tk?=
 =?us-ascii?Q?hpw7fw4xMpksc5Oz66IuVPUQEGaW6+0Oj1PR71/jPBVwjhxq4VcGoJgBw000?=
 =?us-ascii?Q?brXN5Bw4m9JL2fxzPp+Dw7AVZGrpo5FvY+V8BrVhG+2KLYs68QtMOVuNk3i9?=
 =?us-ascii?Q?AqSOcy+ntc6OrbKeNKiHwc3f20oprLzTvZXsQu4ClaLH0PQd4Mdvk+68Zd5K?=
 =?us-ascii?Q?lnacriGzHOHOdqkiWswWjJ490M+NdCCJuoz2Rm323sQkMau2AN5XzusPt+pW?=
 =?us-ascii?Q?uUmU05edtH5itilApVbJaJJIendvFzgyQan0HsYa7D7Ned3sBwvFfxzZCfsk?=
 =?us-ascii?Q?5sC8k0zOEz3z8D4m/jZBQG1w98ZLpDcORRSaKO/Kh5sqXUY6GUtzhMkbo7qF?=
 =?us-ascii?Q?+wkoWmRYZ1ryqbOasDxALZVf5MJ6SaH+VSGn6BNwCX+1iKbH5jWO3Q+eiBkG?=
 =?us-ascii?Q?ljTceH5Nrkev8bpQ/irovfEqHuOnbdbZ3Z4V9gTkRT8xWHx250hkp+cF71TO?=
 =?us-ascii?Q?ln+g0X92+tNx+/zc8RPtyeY4rLmsO+/Dm2b5RJpGiWtBU+++3zB02GIDPh1q?=
 =?us-ascii?Q?h/kswE3RFC2aLUKEP2Jd50wYJftQsgTPSSIx5WE0ohnXhoAXq3YYIu3a3Sow?=
 =?us-ascii?Q?2HgENDB2l9eUwcE9HGrhZuI2qmNzLNdAceooO0W2sdtwpujRlP/7pUI00aA8?=
 =?us-ascii?Q?aCVnrcm+Zf09gvor/gsYOp6mou8CyoepfuEfDUM9qEgaZn4eqW1kyv0vHFXX?=
 =?us-ascii?Q?cuJt9nDKOs8r8DbypH3GDwCg7AIi7k/CcHMBpSmFck8xvIUC5YIQd3n9Nbff?=
 =?us-ascii?Q?piq9lHJCvgzssYNGV4YiRmmJqm5hOjbEseY9o0H5O/6Jb1uvULMJaNPj1S6l?=
 =?us-ascii?Q?9jwwehbY8aTT+MDPOFkMag04K1mtiFaxmQ+ZYrQpUIKj8oqRv3Ha9wL0avBf?=
 =?us-ascii?Q?3M4NrLEPfzKUdNUlvsviF+jg31V8BKouGlWMwUzkdHy5pstsR5L6SgqROvGK?=
 =?us-ascii?Q?lcHA2ATsUud65sIwYH8eY7zdgHSdFSg/U3xHFgYFt86k0ouY8TIYjKt0nzgU?=
 =?us-ascii?Q?mwFCm1Bbsk2r4ZrPgiyZfZaFH47uPbMklFTXnqYsfSqBLSyS2evVItOl49Ci?=
 =?us-ascii?Q?G+0dGjAN/mrvTcRMokA60Tw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dad33e6-59a2-4712-9c74-08dcb5e80b96
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:19:01.4676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kf2FX9iVLjkY3VGxFqt00z3Ubf+QVqCx3+abJZ/z9oe1uaAWRRBUFuamt+Pfgt3J/gOSNqkvrZY3Zrzn4G++a3/3KpZL7TzDhH4QOA9WCGTCs0aPya7rWbk0kJ8CuT0F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7770
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

Define the I2C alias ports for the riser cards.

Add the i2c muxes to switch to the i2c alias ports and
the eeprom nodes to read the FRU contents on riser cards.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
 - Add eeprom nodes to the riser cards and update commit message  [Chanh]
---
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 1679911e4fd8..4d2f6e5348ce 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -29,6 +29,18 @@ aliases {
 		i2c30 = &ocpslot_0;
 		i2c31 = &ocpslot_1;
 
+		/*
+		 *  i2c bus 32-33 assigned to Riser slot 0-1
+		 */
+		i2c32 = &i2c_riser0;
+		i2c33 = &i2c_riser1;
+
+		/*
+		 *  i2c bus 38-39 assigned to FRU on Riser slot 0-1
+		 */
+		i2c38 = &i2c_riser0_chn_0;
+		i2c39 = &i2c_riser1_chn_0;
+
 		/*
 		 *  I2C NVMe alias port
 		 */
@@ -551,6 +563,58 @@ ocpslot_1_temp: temperature-sensor@1f {
 				reg = <0x1f>;
 			};
 		};
+
+		i2c_riser0: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x2>;
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9546";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				i2c_riser0_chn_0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+
+					eeprom@50 {
+						compatible = "atmel,24c02";
+						reg = <0x50>;
+						pagesize = <16>;
+					};
+				};
+			};
+		};
+
+		i2c_riser1: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x3>;
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9546";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x72>;
+				i2c-mux-idle-disconnect;
+
+				i2c_riser1_chn_0: i2c@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x0>;
+
+					eeprom@50 {
+						compatible = "atmel,24c02";
+						reg = <0x50>;
+						pagesize = <16>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.43.0

