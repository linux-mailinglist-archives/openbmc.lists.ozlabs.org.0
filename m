Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCF4B40E4
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:35:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxrxF346gz3bSk
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:35:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=y8VRQQS0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::72d;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=y8VRQQS0; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrq12Ykdz3bZW
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvA/cZF8beRNK8Iglok7XvWsHrUNgzOjV4jhvcnokDv6Nu50mFDJpHdMh0HsoIXQJeL//ENfsFNPd4JKurr4NixVuXUCayBMrL4KenSVD5hFKCB9Ap/n8AIINg74YBYHh5A9bt5th9zpP63NsA1a7I+Rm53nbB5Tz9iOOJLL+EDk2G697CHjsfr2bnkbMIxAcsG//o6hdxdu+Cho1Zos3N5jq/yw9cPWhzoZfDxSGLAQ4Jyo44be2Dx7HIDzujxw1fs9lFOsHKphsy/yLcxz9qFivzIZWCouKkfdQtBEnY7qzOvz9mTnTeAZAeYHhtZZDMmVHq1YbwyWedHF322afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U+qZMiEYQuuwUYthaqKiZ4rPo5rYgpYTpz5r6aqttg=;
 b=UmtkOsJfuIIYRqq0KBTSDkevbHitP8+3xlMTSXeEsUHv0hytl5Z20x4NQ/OQkb9LhnPAS7F8+zc1MgFZjA9EaLpRMENnvgrW9pPoMW1o41rLOGDbEGgQALBoGYlnhykaYJ9rWo9QmvZAUYn7+1HN553Piadq01CEWcbhoOhfwotDlhY0VMKRu1XeY203o5UJeDOs82jCfWS0AaTWwvxItOkTNwTS//EoKAwnjSnaXOeMfVKu/NRjUqJihXYjUBoMFIpW7aadtfMMnAnkqlcBGq+GSd8GQdQSCFpaoViuBLalx8OE7xahE7/byMqBAqdek4cTrnaxJKK+wIlFnOqnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U+qZMiEYQuuwUYthaqKiZ4rPo5rYgpYTpz5r6aqttg=;
 b=y8VRQQS0Jtgz0+VJit5AjfWjk7FYhkzpdWV2a1v2RZY9prfEOhIc6Iu18kMqJKJ6zdRpcysJXoy33fzG9MEqQo9QdRjdgDZRzC+/DvhKvKezKsbodP2bl2sR52jQvJK/RxzAUBCIQqLd/tiHaDHxs6BihPfJteRb+zjMja2rWi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2292.apcprd04.prod.outlook.com (2603:1096:203:4b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:30 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:29 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 08/10] arch: arm: dts: bletchley: add INA230
 sensor on each sled
Date: Mon, 14 Feb 2022 12:29:10 +0800
Message-Id: <20220214042912.14584-9-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44f19aa4-d8d9-43d4-000e-08d9ef72974c
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB22924FCAAD4D9B027F837BFF8E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BPUTYdU770HGgsf2jfA1giVCpvmJJiqSKa4bYIqZ7g8P08G4X/jRAlCro3APg1uFHb5wZyDjreCJO4Rb+QVdxiBA+WEVWcrLW38yeeFB78U3EzJJVFn66XXfxJrJ7e28lLraODnCAiNykMNBsfqxmT58jIL2L8kYIfiNbedrQevJugK6UMDM+fkUkoE1OK8KPjRzHx2EAf1OZ/lYdtTNcbbH9fpxEkMLOrpCGXcdTVNsS6zXYZBtdT62WX6TTUYlYl/81ffmM80fCKsO+vApA0WzkNdmcGSg4cwoTKvBuHMoODpKAOyhGisZep3GQZRaN/WyjV4EwXYF1HIbk/ELzxaQTjUVqqpUOqmFppb3h5sb9M1A4xdV2AtVMD6IJFqurGHdM81i++SIqnhxjcv79cke7XmQD7O37Bxx5Fc47poum5Kr0BEYH3xIyooUcouvkAdSddSXeyJ+7LGSoIbun41VcEa0Rl6zxAbZbpwRYUKs+I5jLCnIb9f6IpQasAE6v5PjlnAQDhik/OD5Myt9MZXrc1a/KVSr0vRsZoc4OMNy3/cDGq/SjJ02V1N9SktC6VJSf3BFL4VNtzBq8Ub/o7TkTumVAUapHoJ+kMTeR1jyKkanGDBrByVQqc6/krAzoF/TJAcKCEOHFX+j973FYy0PFvy+KqGCNdjgvSCVN35/v/0IvGe+EcMaTXNaCTAoFKUkCpNf2Wb1zn23Byn9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(83380400001)(5660300002)(1076003)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UrD4sDLOQd3Bgc3QvJSzTK8N3fqSRbx/nKJ/sXdARzypTUVuiSS20GaQy4Ik?=
 =?us-ascii?Q?MMCXRqev/AP1QIFZ2z+HOpyN4gHSykbnozCd+a6mC04TR6I6C1N307YQgsR7?=
 =?us-ascii?Q?cP/RsPqIaPkno+Ur8qYSiRVCn33lYc3oPRFt71EmVi7+nXD14NdO08h1G7RJ?=
 =?us-ascii?Q?c8eDldr523JbqTs6+QhtCKf6xD/vrupWUG0vKhf77DSNOQHNfS4EEsdDvsCq?=
 =?us-ascii?Q?I7ukQCesOtAAzTbDtd0+5VDFGbTbwyCojmTTTLdMNUupsxFMPSKkZt1d+BHV?=
 =?us-ascii?Q?0DY5MylnPsrJGTdcLjfpDYQgmi343GMA7uWmKJpmIEQIcolATNrMl7n/Ggsn?=
 =?us-ascii?Q?zKvqiNH+u/uO+8EOcsRB0ScoZuODHYXd/W2dLKjvgqQZ4PorlCiECyZtGxlo?=
 =?us-ascii?Q?3A7cna437H42lOAj12C0xhszI+oWm2+Gt6rOwpjRqhvXvHyMKcQbJULq6z0S?=
 =?us-ascii?Q?XHE1BszvS58zBT96tTsfW0+n9IJoSJPV3VYi6CFKHtUzn2HbE+sjuJYEWKXz?=
 =?us-ascii?Q?3A+CW/oO9ybQWIccPC7wtJ3H5oU05U+OiHQJ87cHiiPr0b7pk53h6gti4dcZ?=
 =?us-ascii?Q?2WTfAi/2bhxlLCvAR7TQIq8Do6ueXN9wloCQ/YScp4QbRLbE9BFZ/IlkrYHz?=
 =?us-ascii?Q?nUKd0Pin+JWcTJ5OlpKMN0RaL883s+E6kgIXLXZfSGZLsU9lc5AGea42kz/+?=
 =?us-ascii?Q?1SpoC8etJvHQAIzQdEm3cEG1oZJrsziUM3Ze13aR8EO6wsGyxI7Y/tZOYUyO?=
 =?us-ascii?Q?POz7Pfq2NJ0fZMXrR8VcSa400ehV19KnbcKRCDa4Hnknse1Jr6WJLLqbOZs9?=
 =?us-ascii?Q?grFgvTz0oDoWybtqMC4Vu4en5dYS4oZ2pozy9kB1in97Y6BOoWSY404jkrum?=
 =?us-ascii?Q?j/23DSiK+Wrs6YgVnC9O/3hrlXEcmikvLpx8Wridiz0GF1u/RVg2IJ3oghnU?=
 =?us-ascii?Q?d+Vl24SUmj7+lyvUoBDz4Ld5e6QFPk1GJfkjUIg46iXTs/aiwy48v8+56zvX?=
 =?us-ascii?Q?JDstPoZJxeH2Acn1Jsh+hhz21WpuNBjQG/W0SPuEo/miqnRkiO+p1zg/RYX7?=
 =?us-ascii?Q?vJQxTaTt520/oMnY6Vtu8jtpvAOicecOW8yhXr0PM3at31XLjTkanEe81Uc5?=
 =?us-ascii?Q?BYWWLeBlAb5MxGTLXNCsjnaVN0Ih8sWVtio1vYGXHHUTJSnJBF4hbgifNWLh?=
 =?us-ascii?Q?m2t2MR23MiGJvNKg+Iid7x4y6UCTgI1l3IyQpR0nVLsRlovVn/J4/oHz6eI3?=
 =?us-ascii?Q?ZFbCkFIWGXATDo+Av4/+ZtRK7aFrexrU4NrWWuVNHR3bCaEATUshkPyKFvBN?=
 =?us-ascii?Q?y3A05rhw5MPOt4uN+s/j3fPfxOcJY7JsP1FvVdQEu0OGEjvfcpLO/RjtiRjs?=
 =?us-ascii?Q?mBYELBqr79Zhc1DqnoUU0qRRRT5Kts4ioFBZv5rK7e4fo03sxGC0vq6w+5KL?=
 =?us-ascii?Q?QMelnjpMMFb/11wUyQsVfoKSbDovJA2Xfw2OKpGk+qVn8LAwIJnN4VT5wkJ1?=
 =?us-ascii?Q?tAsKmWEXBPqTKYVF+wDspmxgrvIT3i9L5Ng+QgYWsY7QfBSoX2cPJaqcqx95?=
 =?us-ascii?Q?Dljf20DFYLKv/omvtU+qoU7gFrM6v1WQoqhoOtGabxXMr0OXE0vaPhjvr+jD?=
 =?us-ascii?Q?713RNMs+Xo411a5mPQ4yr9s=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f19aa4-d8d9-43d4-000e-08d9ef72974c
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:29.4848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVwqP+HC1ymUptd2aKUTuGXOvIbEdt/QqUN/axBeuqlFFFEg+IR4y+dMhLhJRgzll1CQG4iir6quSiRK278Vhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2292
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
Cc: Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

add INA230 node on each sled base on EVT HW

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 36 +++++++++++++++----
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 76c086ea7b71..8c8fbfcbb257 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -249,7 +249,11 @@
 
 &i2c0 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -315,7 +319,11 @@
 
 &i2c1 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -385,7 +393,11 @@
 
 &i2c2 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -451,7 +463,11 @@
 
 &i2c3 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -517,7 +533,11 @@
 
 &i2c4 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
@@ -583,7 +603,11 @@
 
 &i2c5 {
 	status = "okay";
-	/* TODO: Add ADC INA230 */
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
 	mp5023@40 {
 		compatible = "mps,mp5023";
-- 
2.17.1

