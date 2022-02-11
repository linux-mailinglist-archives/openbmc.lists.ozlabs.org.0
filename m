Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A9A4B1BD9
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:04:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxkZ5crNz3bVf
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:04:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=dIfBYQCQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::718;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=dIfBYQCQ; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxc04jMyz3bV9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Piy/BjSFaZ0/9T/NSjobq5kaSW4KcycX9y8xQgzf5iYulTgfhHOC7XW4LaOC3CJaydVn/9uUUq/BF0wTDevGYZM6sFfQ97v5drmSGHZ2HiJNX/DgNhAyNTrqWjmMeREx5y9GCibS7ro5pvhqJ5TV2bXFF6sPh/QavWzbXFafpPCCmKk8/dBfXBZnuOgN+umclIpsWVKgINWGSMtZ/ZDK8spxr9DE0T0i5UIl9rEkgYvR/PC87cGrRCCVeStU5IseXafaEeo39a2gZNFBuuZA+24c8L6y70O0vnP7Hy6NoMjHUHdIWXp1FAkG9rNfoAGHmtrcz4iyezePpOxHMDLC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1U+qZMiEYQuuwUYthaqKiZ4rPo5rYgpYTpz5r6aqttg=;
 b=ogdJTVsxOPbUhUy1mgPG0XpDkCuSV9x8rMT4vcq8CdDIMSQHtBP1Vel0dcUZ8My5iTQeAlvfscCaIFiJCVhf+JhEsQXekj3UheAnm88ZV8LRBoFQQBaJNUkjVZS3IHfu0HJM+dHNQp+ZvmexHtLrIz6aNDkVmL87N8sRCtV4Y9Y5y4r7a7ikckQSmeuQTgciH+4BnVIZm4cnvO9hqxZyXmIEqI8il7E+ZHQ9Mk1gpn6W2vqIUqnN/lTciudXKbSFF2/r2tt1YrBOVmMXJovj4W8NZuonUXKHDuQoOgAoLVAi748v/GX0HlvfOvwlExTxgIRSrsqxOr6bArnVjizTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1U+qZMiEYQuuwUYthaqKiZ4rPo5rYgpYTpz5r6aqttg=;
 b=dIfBYQCQkvQneIwdb7nHnTpu2bNSJHaGwt1qeGPPfn0lqMuLxhf3YbYoPMgxJCT+OUEFGqYhq1GhqIm+OUm2v9+Bx2wPznMLMmxPh2iPCAOVn7YBe5rpr5d7ca8JY8UKXwqt/e2xNgv09riMV6Tv3h8rxoyAX8tXg22JwIhbrSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:17 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:16 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 08/10] arch: arm: dts: bletchley: add INA230
 sensor on each sled
Date: Fri, 11 Feb 2022 09:57:53 +0800
Message-Id: <20220211015755.27644-9-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d47a68c-62e7-4d64-97b0-08d9ed01f740
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB40153608CC8D4A3222A262268E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMTsD6b9Gvbs1R1ZauDR+DoFZGMGyS9yaTeSikoHB8210PgKEmoznRxDADXpRz204Mz3zmXIDZyGBqK1jxXu6iSApVgKgmyDt/iowaqzDpn32ye9qV8ZZZCVTElmq+Cvx6B90B5VM5mDgYAEzrJjNZa5UYhgQ/R1oPtHoTs5UfqSwdDYOfeFeEginKseAenEFX4b+rnair7772sUJkyvJFRqA86lNFWSo6zDdIci/J2W2BTKf0qHa3+AG5Qqow/HC+frsEyaXq2Pu55IE30ri1yNJIcGwKWh/MQHAYyg8tc6GUwhqQrSIrZlQ93DQNNGeiwrJ0Jccrl0nWTJAmvzzq5Sacxf7QN3PqWa8QC9BRfSiy6SmtnDeDhoTiJNtu7O3CgL1DQ4h5q+Zc+Pt1Tilq+KgboWTfxPmk3CsLqppAgfJfsVhFuiW34wDKzuNki+o4TpUui6mK+2h9S+qbuGo8h9ArChuTvKL+KzSuo/GU8QcbWSb0+CE39r9ZsTItUMVc/UnBDuvcr4tOJeFY4gQV+UmjbG/K3ViYeJFDUaVp9CKGWiESdeQce7y/AZECVB/hsyzTXn42VL9m7Dj+1bMTOSplKGamxsZO6ANwBHsfUyl8kEp/YSwXFIoYZj5Y/mdTwU+ckpnL4niTvoqin8YX7uBua016GttdKncay/kDLlvPJvd1jIlYxqvaniQWEBI+ip3+Vtr8SA1prUzwbRbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDoLx3wWfvD++D/9kGxjzn6egEMeHJIQJofQR372ccU90wvMPqU9eIIOPnU6?=
 =?us-ascii?Q?CZS2XreY+zgLM74u2DQzzqBoi5R/n31W8URjKXi9AG1XteVeZDH16I8Cv1B+?=
 =?us-ascii?Q?J1G32bronU2zmCHqurXMsggo29qV/6ELnpUOmKmQ+MXs9DCZqqShD+RJqeBD?=
 =?us-ascii?Q?bVMSDL6XTGKJ+KQJg6hgopHUIX5YuXhUqFtUlTTcPztKI3oNEUAf2x01Dd9Y?=
 =?us-ascii?Q?VvMFpVN0cmUFje+s6SusVjesoGNKNW7OHenyEOL6o4dUGMoUDwMHQqaSPjHZ?=
 =?us-ascii?Q?SecufNj+7M6skKA0GYX1y5BPXEQU+Zk9Wg3hjyXgL6roCT7N8g0nn5Tp84Zt?=
 =?us-ascii?Q?YfEKpYyKEtSZZBhbW0rt0qVWrKRE5xLIOkXLUX9Ky0IjoH98I/+P9hA1bwfH?=
 =?us-ascii?Q?KooIoai+mHe685fFxnlHLX9fH6irXoViI4NCIZRHH9iUHDBz7A6PLcTsihPv?=
 =?us-ascii?Q?9MGEvLQC1hCLOmZHIGvKjnfg+gzBFJrCznlNMEfLkepSQr4wvyQk/tkWOSSQ?=
 =?us-ascii?Q?UH0c9+hsMoNaWYuqHLVe0jPQ5XGPLIwugr0Baa/bvfgaKMno3320zC/IU0Ve?=
 =?us-ascii?Q?F4ePxuW3ySIBOvpmU5FlONiC35ZXuFVm1szM/GxleHPuW2zRNcvfZ4BwV6pF?=
 =?us-ascii?Q?IgLP9BtlGLd2YTNUVeCAX1qCMeXSfQuLIql9esYNZGVDZ4u8eY74FGKdGe+9?=
 =?us-ascii?Q?6oBzYbHpm7TWesMGOZtICBKvmY6yM8dWl1evQekkEJQB+u3JWomsKCmjbCnC?=
 =?us-ascii?Q?Q476+HezkLT+XZNk4+ZVHBMxUKussD7vQoYnFlcBMUpXmhBQDySvatKb4j11?=
 =?us-ascii?Q?5aieqfJb88XXroEcS3iBAza0BaWhSWETsbH7iunQIT1aQnHCJxZGz0z4QUhz?=
 =?us-ascii?Q?PbMBJhEhX11fTK50a7GW/mKI2p00RIXsymQii7/agH7Z3LrPoXFzr6dwOmg4?=
 =?us-ascii?Q?GpC+ouzfd0O12sofbWuJt6HvZFqO/Gh/v3QG3vomAXBtlRvSeCuMxpFVz31W?=
 =?us-ascii?Q?WR8aZLmyIEAMxw6J5IKaZR8BFu1VLo0C/g05lSjLoYUhv7ArdAxfowWHA4BW?=
 =?us-ascii?Q?nc0Zk7eewr0VWqkOymbkO+p+ylb6+FkmGnNp/D7qJHBuZOAbCadE9mNyf5os?=
 =?us-ascii?Q?GYQo+u8U2YYciZntR6vp7f1hOrpwHW15s0IVEuZE5S2WEdi9j6Q1GwvVu0vq?=
 =?us-ascii?Q?cpeBur9vKtegtbDCp1LYL8paqkA/Pfkz7smocdsK2OI/vmIEEgVZU4mw9hkl?=
 =?us-ascii?Q?iFGq9sA66d02IUULcbWe0wrtexEtNLeXu1pE68VVjwSAm3UrpGQFWjADjtLk?=
 =?us-ascii?Q?L/6PtjDrq2XbHOtMSFucAnuN79UGJtJlRytzsv29ICJcuR9ACMVYGVauA/FN?=
 =?us-ascii?Q?9TEZuExAY+0E+fWc3WsYQUhAU2nKpJPYA6i08KaooupZlJ8eDH3Bi4alkrox?=
 =?us-ascii?Q?dFMKBGovCMXk4qQJxD0tjT5kOxxSzA77y3eIM6BMlXybq8S3Yjb598jenHyM?=
 =?us-ascii?Q?rLIKeJWdnaaH0qVuLSWLUakbyFCLfPQfNEYnpXzz7dRs5HL8/PegmU5NJ9/u?=
 =?us-ascii?Q?sTq/8nCDSDhgAqgyDZK3jQcKdofrx436b1amCWuNFclb/RBs8D/yAFFRLII0?=
 =?us-ascii?Q?aGH35xKSGtA/8loMysZuIi4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d47a68c-62e7-4d64-97b0-08d9ed01f740
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:15.0778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K82GkMWYEN+rCs+/62g/n2mVD7KMOozaSmD0WPco5PHtSmQD4bXwHwrRH6fDbONuBjZDm2POg0hPvFJd5yZo2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB4015
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

