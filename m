Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4447F948A09
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 09:23:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=COpMedOc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdPt21L5wz3dDM
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 17:23:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=COpMedOc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdPnB319rz3dBq;
	Tue,  6 Aug 2024 17:19:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nA9dDy3TXEiNrmhON9JBw0P+FJj9IQjBCLUNJ08MT0MHI4oRJ1s5bDKnSNkgUac11dxgIO4XV613KiXs0Q128YteuJAlWO/htpk7inysGx+drvYqCAHQ+lY06a/0yWmW1fttAbe6KQ76K11wGUe8jkA+vXXTsjVREtJi6zMj4FF76iTf7EWuJ4cYE81DnGxUYyA69MmrpM0VJyaCUIDBkxbaYE+I3UqZB77Srsm9RuxOdR0WAcZBo2tiZcec6T3Y51eIdSwNd1kcbsUWM0EM2M+jVMgNOGwJIIg37YoWwdJNIMAL+8lLfo7wf0wPdxVlwE0USwzBjGWEuXidSBGyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACeujd4hVsAXohzRwGgsWDFhkxGWEIWPCVCXbd8fTso=;
 b=LORi2iE9Jm7DtqIAPl0gfhp3ouKXIkmvNf5esEaAAjRlpP24FrrC+d7aBcAsArIXiD7uN0u6tLDGvM/MgbWkFGC7N0Ong51HBjAh0VJEYksJwBzdmBuDsQbGOHhKRtnrOTo3rTM4c95lwEofyExUtqYM9SwqdSIiiQIlAJlzqSVpSuoIa/UydtUV8AVcgjYfoEPOTLHH8gDlkmtW+iFbIV6fpzXtFHPxAJ6Phj0PcIjUXhZqYBYd4LkGxOdM3mWaPmdGiV3ORd9MOlFGLNjHv/TWwxeU6xV3chMJzfKamVVYK5+fwUjlDAR3PP8GFYPc0RZe1I0v8feqED2Efzc+6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACeujd4hVsAXohzRwGgsWDFhkxGWEIWPCVCXbd8fTso=;
 b=COpMedOcU2zN4LJypnm8rtFEIC5YJTh0ZdALrh4kzCpB83aD8M8M/vEXcrYkYxPQShp+CEoKNyffQcIfuG/9MZyQJPdgAE3kV9XRycf1hszGR1eBIKAj3FBWjOh//uTayRstJUtQaOozpAbYq2t3aZulpZG03cTcfQrt7aYa0Nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 BL1PR01MB7770.prod.exchangelabs.com (2603:10b6:208:399::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.25; Tue, 6 Aug 2024 07:19:07 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 07:19:07 +0000
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
Subject: [PATCH v2 4/5] ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
Date: Tue,  6 Aug 2024 07:18:05 +0000
Message-ID: <20240806071806.1666550-5-chanh@os.amperecomputing.com>
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
X-MS-Office365-Filtering-Correlation-Id: 98c14a19-69dc-4642-5bfc-08dcb5e80f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?0SLAvVDvGqUVFUBDbpLBecHIh/5IMc/RxsuXZfOO5OfM2f24sm9c8mQZi0vx?=
 =?us-ascii?Q?3BHnT5r4ag5sqk8hmDzezG4gMVnJSWemkjtK+NS2TDoCBQUy0ZAY6nfv09nu?=
 =?us-ascii?Q?Q5Wloyh1nyszai0VtOxvzyZHULYYJmgh9Ccw0oVCKQwbtFvSqhbc/Iz7IWme?=
 =?us-ascii?Q?MbSBMDWWSkt0ULQSjK07WLjS4I60isv/9jOBurYCSBWrtfWLMP4uGd7jfnob?=
 =?us-ascii?Q?QdQYtMT4+RBvpE7q3/HZQ6xToOYuAh5Cs1e4cfXtVSp/ID/VquISDfbC5UtN?=
 =?us-ascii?Q?Kr0ueNUA2bJ55PegDKNbjIq4DJB2ICwmiwgWbyOv67MVnYqXaJh4JrCUzmQi?=
 =?us-ascii?Q?qnPq/d/+RK9I8tIi5UQkGW0XG3vyS7o8MDJmvF2zc5cYUWS6ejwMLMCvYnJo?=
 =?us-ascii?Q?qbczc3o+1Wg9taez3Xj+Q5+QZshMqBjGpx8ypUaIV5Aj076YYYwddm3nKSF+?=
 =?us-ascii?Q?XQZcdVRIv99NEiqz8fa5pPBAgo3mXMRmQx1h5Vqer79eu4dbl+TVnsuCyODM?=
 =?us-ascii?Q?7fRR15EvfbHbEiBZWK3fGjPJfzEouLbOOs9VGpTi6iD4t1PeSwLBEbzSWBuQ?=
 =?us-ascii?Q?j2goEonuOrFmBD9RYGTBwIKw//APDmAAh/xo3R7ciW+bg+O3xkG/32ssoRwh?=
 =?us-ascii?Q?5dgCvlZ1/PLDqXAZXsGJJ+sqfKjqJ9nQLAdg+FvyE9QiU+jAWsJ1lJvk9G5X?=
 =?us-ascii?Q?O+2OTUgPT2z3ag2T8co/Pc406evkeozp5eoz7HxjskXh2uNF2WsiPKTqLNy5?=
 =?us-ascii?Q?k126fNwToz44GuR83kv68D3VGeo4fx9D+Ed9tArjmTIGqHMjEBhNf7eZEnAR?=
 =?us-ascii?Q?ZT/VZ/fvkurB1b8Aa2O2lBIm7kNmUBvXsufalSmVTgT8QNvNv75iYo17IbId?=
 =?us-ascii?Q?uvukFxgpZfg+peaMz7ohtcdu5y4kHHJ8OJzRF3zfETvyWH+2LatLusDC0A7O?=
 =?us-ascii?Q?aVI5er4AJND8/bRkIhc9ov576uschxzpfBR7cBi9dNoNb4srW7IGQCSGNmS/?=
 =?us-ascii?Q?il27dCOyTcGCXgqS/jZE2LojQj7RbKT1QQmCbC3mZDCkkiAk/h/JqsjoBSve?=
 =?us-ascii?Q?lS4rZSQbxIiH/U8fUu0Nk/n4JKDC7NLxWf3R0zaKLbLsMBrBfZsJQGFr+hDK?=
 =?us-ascii?Q?HEC8ceNg8PlbQxdpj+1AizWiM/cpwQiaxlaAAFxGK3yIYqc9x+8c7FYLdOTT?=
 =?us-ascii?Q?jHedN/dA0I6A6hTNFSAT4rzAso5bPwH/kadbKHdzCJh+UyWvtZbHLh71akna?=
 =?us-ascii?Q?HA6muOw6eBM+mHIjbCrovw2pPvo1m3eiPTUtKaYNHYX58tm5OyR8BLAQlN1q?=
 =?us-ascii?Q?bw77AFwETOpXO9ZF9zQT1FMsOJfGz8Vn9hBpgRYvWtn6gDbSzRBgTJomH3Iz?=
 =?us-ascii?Q?lLM9XvFaPbJrBfiXUDiZE5Wxw+cCXuM6COiyEelYwm4Recz+4TJNQ42csI6Z?=
 =?us-ascii?Q?VdreMsBxNTs=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Lfy/nQlrQHVnmoppfjNNfr+s0drZ1yU661NB3t9FnYy0dC/jJE74BVtB0kho?=
 =?us-ascii?Q?/dwa2Msm4WvtL724aEka51cQY8x0S9oxaA7NKuUuaAbu5FaCy+zCIGupvpf4?=
 =?us-ascii?Q?sVm5xGWn8b22I7dvVHZDm0kW9vGiMfzSPK6Q7VySfCQjj6OEvBT6VKioBdA7?=
 =?us-ascii?Q?ZQA9SR/nOpymm/j/gRln4PFAnYhoq0eTVZpHZAT40Vust4EeWGxexzvVhrxZ?=
 =?us-ascii?Q?N0ooLsa+0rMlitiRVcVDLxhHvT6OOOj/SPCp6QMDDclElclcitQ+lYLy/6NF?=
 =?us-ascii?Q?DWLkm3R8n3x22X3tAqlVwzY+nmM4oVWGO9/GJNa3SL8/YQEPbYRzTHJol2Et?=
 =?us-ascii?Q?jEU1VV+vt8BaGAe0BK7Ox2JNVGfgpVjS2VVicdkbvoR/4LNOhhaeM2st8yIg?=
 =?us-ascii?Q?F7rN1IrzU1Z4zkdKWAgP4WihlYDhmQtL/eNpH5TYmKTn1HTCML7aVbLlbE13?=
 =?us-ascii?Q?IpQquMDJtMxvWHr04hPgakpp2mdr/PVCp4bErKultxYDA5V3M0pyJIkoFNZb?=
 =?us-ascii?Q?JsRRh8734ORFDc3FwBmjyXmo4fzbxC3eGnLM9nus5CJcU/Duucr2WEhABYf/?=
 =?us-ascii?Q?3YI2x4lheRjQbWMwdxOisaJUXetF1blgiGwp5lM/KaR70xvgpXuzYG51xvbx?=
 =?us-ascii?Q?Ku1lBHk3HeprfOQ/z3xvccZVJxYyjpCSYw7QNBZzkCs94xo1vYe/SZjf5THO?=
 =?us-ascii?Q?zZJ1iGFaYZSOJeJrHgLzxLQLNF2M/J9FJcea/kdAtfghX6oJPcsW9NHJpi2N?=
 =?us-ascii?Q?mgBaq3S5Lr/Hdal+3K2VcsUHo1K13hqjbGLa4DOgOV27DQwBv8miMzBYKHtI?=
 =?us-ascii?Q?58SJzb2fRkqDBNAxxWWQnzEkBPc6je4mqiXvtSEFOlp8vghYfQe3USc8aO1j?=
 =?us-ascii?Q?BbdZn8ZS8kW5V66/If29b9YZzr+x4tN+piNWWyd+gYx92YX+D8fPhbSCB8sO?=
 =?us-ascii?Q?hOIbmaoaSPPk/db/YAKP2U8MOyCQ/q/2Zky/mNEpwQFNz62ay3AkJuMHtguO?=
 =?us-ascii?Q?mICyf4sBAo86/CiP10AhJtdT2C75CEL8SW4RISLw7MW99cOt+L9yZ60dEGIr?=
 =?us-ascii?Q?mow1ODKA6UnY53qPbjMV218/TprWX7+4mmfX0P2VCQQI/U834NWtU/jAF1rH?=
 =?us-ascii?Q?yDhb6icEycLKVJ2eSQXeVhrHqcxIiyRlMxayhOra0cz2K3URag2ry/wPV44w?=
 =?us-ascii?Q?FBS5NiL6E19JusZGjQ0TF70oIS/Ve5k14H/qGTqldkTWJlknn4vAcMep3XLu?=
 =?us-ascii?Q?Sls6DP3LfnOexlsUubhTB1ERrc4mPzQeh8QaFkDIP/Ibh8EAVEfG8ZEHJnrY?=
 =?us-ascii?Q?/5vsPAlSuMnxpdlcsnESwccs56I2Ilt1Xf4sCH76Cwhp/pJyPWw3k00b7BR/?=
 =?us-ascii?Q?GCogmh+dXFAEfw/56FHm1o06MZVKTcKgFAWBBvJLvj6F1kSjdPJ3cz6P48Nq?=
 =?us-ascii?Q?srMTOpnuV445jrxhGKBdWSgJtftH9IEEnAcboUcyWKdObFGQcH5Z/lNngPnB?=
 =?us-ascii?Q?PXOGEnzjD5Bctt2q10iQsEi+zwgyemrVLOVnYYcWLvj3gKZ9I5V9ucflSFRV?=
 =?us-ascii?Q?7MeZtV4YuNwchuiYkIS1IzJFFfCiEjIMHIDBxwrWJ2e2ysE5nfx5HJBTF39L?=
 =?us-ascii?Q?MiUJjP7usqNSCL0mu5nhJKE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c14a19-69dc-4642-5bfc-08dcb5e80f1a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 07:19:07.5043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BERRhw9VebnYFErJcJ6SfRg97JGopepM4BxBW0HCJD3tZYJVj+WftpxZKPg1RlYMdcDWkuoDd76iYgNfvV0pHHVjQ92TGH4oHSctwov/UcEa1prLJG7rTCUrAHPTluJ
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

Enable the BMC I2C10.
Enable the BMC I2C15 and add the GPIO Expander as a child node.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
Changes in v2:
  - None
---
 .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
index 4d2f6e5348ce..3111f23e56dc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
@@ -890,6 +890,10 @@ nvme_m2_1: i2c@1 {
 	};
 };
 
+&i2c10 {
+	status = "okay";
+};
+
 &i2c11 {
 	status = "okay";
 	ssif-bmc@10 {
@@ -912,6 +916,25 @@ bmc_ast2600_cpu: temperature-sensor@35 {
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

