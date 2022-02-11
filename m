Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C01B4B1BBE
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 02:59:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxdB6cvxz3bcK
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 12:59:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=emZvbOiT;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=emZvbOiT; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxbx00vZz30QR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJSnBpwCLnZfU2WOH0JR+EqX3MX+ap5SEvRtMTkNwYlabD8PUH40PetpSM8VnL2WuBflBkqRrUrlD09Qx7qBBa/yC61kV7xGXeWVMqZgvKZ6QsOrzWN/zdOAqW3ss6BW0yWiCSqJlsrPRJYOqxgAkLbOymqZerx8xGrd2PH8RpO7XlFfyGlEgslnhFPZpRTe6CWR9Fc8AttlPJdtLrFerLK5Y1+eHn6V9c0G1wu26y/pfFjTXdM0f6BDaoGwN5xABDZYIgYBtc8V7fkKZnpWORgKwV3iVu7X5at6g2JAk/T2sQrJJRTfZ5eHMZidkVnMZ174JJUKLWgVBtM6btX7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMP2YqBHAlWOGkvGdU94kNAJu/iajJTp9mhP6z85si4=;
 b=O3QWnGSfkpwwO/MX8OE7WkfHD13Q2itZj6ufy0JkhgIDpVwUtWvYwh4zXs7ZV6yyRIFvNYlMl3uLMGJ3oGVV0h9EQdc7Ylq8q4VwWBe2A3t5r5I1QKl5/euMQ4XZGWEQTYOxNOEhwe6uGae2Qf3zzvtS9qerftK+AkDT5PlQKu+4XowxILGly6rVWrUpyZdQTSCxMNqx75Ih/pRyd/isYTQ71Bp2gbP52ojAcwmLthtbC0SXHWRZrG0FZHH9UwybAHchsrFcEP35yBqWFBeuO0G7c0UKcJN4HkHwwdMEP6/6583IbdqbK9EQKsyfaKgO/y7xopS/XrtMQHCQNi/j/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMP2YqBHAlWOGkvGdU94kNAJu/iajJTp9mhP6z85si4=;
 b=emZvbOiTItx8Vj9xHD1+HbGN16fsB3rbi2P6NlbLbcv5meHpdi4ThnDCQwt0/98u4TdlIrKAJBVW0KAt5nhVb19GHTfU/F0hX1VAQStHm2oURMM7A/s3wO4Arr9FqJXbJv47MX1GCtY8OLtxatBVByTxhchnpC/dCkUL4nLN520=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:12 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:12 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 01/10] arch: arm: dts: bletchley: switch sled
 numbering to 1-based
Date: Fri, 11 Feb 2022 09:57:46 +0800
Message-Id: <20220211015755.27644-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2231fd5d-72f1-46e0-4ebd-08d9ed01f5ab
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB4015040A3181FA0268A9D7D18E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ba/B8hfB3x11VhG+Pwyrhv+schy/bR/ZOfVfO3l3Dhm9qLOgO+DYRQb4+F2VDwwGteCWhBGdpMl4Kuc7yO9Lu8k64q924clWTn5NoGgXTSESXj+ISCVaqehYNiBKGA8REEO6JITrj3+ZU/P/1OUiWQn+M4Oud0yFatxRe+k9andmIu6hEaiGBHD8vgYyZzWL2bdYa6AmNzD50UDMxlGdxAV+g0S6NUcPQAnJgsBdulOEY81zypl2UQDnGuM5rC3ZqTsJylfyfFzCtps+ze0pzv/vbvkUYMRzTozlfzY4b6mXyY5TWWxWPLDhP8PfK7ToI5Yp5JYm+fhpmGBIrC3Rp9JJ9UG4W9AE0DfWgj6mV4eShwx/55Ml2DnXJrbObxVxQHHPareNN0hMpCpXHDYPXwvqUWPCXjTZAXBWPU+SeVY08S/xJRUX6dK6HMfwXHUc0+cZQsa+PsiKjdfFCtqYsubbQyDhUf5f3zwvmtIOZf4TxNpfWXZs9xOhPH6ZBuNW2ipSez4zu4eEiNv8PJQtOox6jqZb+PBGGgNvnXWC6JHl7p4A+6agIYSWTQSxgDIQvAmc1/M1Z/Ytv1aQw/D3q711f2TXrF5EQFFP2GiETN3zaT/wcoN4IR4eQl45m1yrMlO8JVS0DpWJApnnHKGuYXyIaGKY68SIQHMpaNFsEm5AHbS4omFq6kCgbGmYSkX8KQmKGtpTSW+ng1HAvWJ/cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6qoQPjeDC3kBz8CB7tbEt+qS3yuAwJ4XuPwwRlNacDZPDIOpzvbwJVtWUbgU?=
 =?us-ascii?Q?42FsOWSLuYrv3RkFv494R16iJLztgXbYamfqFhRMk4yyL/S29tc3Dnu179d3?=
 =?us-ascii?Q?wTQ3YxfN/sIMowl1Q9H7v56EfGikL4FWmOINC4fbZFCrln29qliLmz6rL9Kg?=
 =?us-ascii?Q?2CpkNL8O0BtGIBZkd/cOaqYzfWby1nUnF56R5SNb9ZdDUoiVRmDWfoU9Q+gJ?=
 =?us-ascii?Q?vfijKaqoCT6PA5h/2lk+pLT31b1R68kCqT4mETaz8W3RfRw7K05YhvHTGIyS?=
 =?us-ascii?Q?35sJeL26xKowubfeY18WUhXBcgx9iudprSDEVBWAGpkAnkBqRZ+snatCMXc7?=
 =?us-ascii?Q?KTMmCePVltAim1vSZI9o33Dnkx46FYMoPN9IUoOt5CzNgRbwH/ZNinovrNis?=
 =?us-ascii?Q?aelI1SQ3dQqdHXEYG+PXnnEaeGbbLqqN7fueV4B7pD5CUhsWqFe5NxDNv/7C?=
 =?us-ascii?Q?vi/Lo67YfnmSEQ7s06MuvfmO+Aerh4bya4rg9MN82VaOcuXy4Ai18SHcjxG5?=
 =?us-ascii?Q?Df3VLEqmyvXTftvNNnisKfiV+Dh7YgZW7hg0fAiaKIYvmSHfcmSRfIq/KkEQ?=
 =?us-ascii?Q?yNMvL6D1Z6eo7iWhXu9WzYo8ceXRY3xl19XulkfwBiSpjYkGdf71cdRRVfNm?=
 =?us-ascii?Q?gGdvHj9nEBMWnZoJUKeASBL/l4LiG0pqpwBQkzv/70sOaA8wEDCHKlKuAwQo?=
 =?us-ascii?Q?JtCuXmuqv+Hb5VaLCgXtjwIGBVS4jJlFVPvHR6sYZmYyOIQ16LIc4mJqOtau?=
 =?us-ascii?Q?W9EYw2YKEA6+0jtFFbZfALvpe8ZLg8/gbTZn1lOT0YNFEH5Ux2I8tH9GUX0O?=
 =?us-ascii?Q?i7gFmd3J5a/+l1lDc2SO+WbOlfkUXRHVG7/k5aqYW6+zZAd4n5Vpq816+Dw2?=
 =?us-ascii?Q?UHnYz+bDlusyrl2Od4SsbNGBbysRK09PVy4rkNvhOxljDTLn283ArFjg66me?=
 =?us-ascii?Q?94Qjhh2zkrY3N6OZXM57BZkukb/mnBRteUJQa+9BhwIcNhywE0f63I7pTe+S?=
 =?us-ascii?Q?O/i7poRI/3+4q53cMNw+Hzrm+rVvLcfq1D0ZjkWTsovdY49xsso74aUa46rZ?=
 =?us-ascii?Q?CIk04jq3kvA5RhDVeGyYq+AmFycrmp+Ue8lRWUGvX1JilqKd9bA53a1oBU2d?=
 =?us-ascii?Q?OGFZ1R1woAanBNkv7qmcHBtMxjQcuxr7FHQsRURzHK1EjhCZ/fVMyHb7AIwR?=
 =?us-ascii?Q?xEZUwROyowM1OHs8YWMEzfyjsITEN1HGxuONiF9rPHV1OApkgynRZREmN0zd?=
 =?us-ascii?Q?tUN3xoUL/auFnbZfYynLL8YxCaob7GKjazjIj5DdvctjVYFJ32LgDX4DzJU+?=
 =?us-ascii?Q?wUyZ5Uu4ogevwAWaEoUxj3S/u7883fa/fua7dNMVjiAL18/CzInj0xNQ6pm9?=
 =?us-ascii?Q?+Ep4uhWct4iSbX80u9Y4UWjhtcJjbSdYvXBhdQys2svnKqz0Q3a5OH1T0s88?=
 =?us-ascii?Q?Bdz5weJmfwVzSLVIGE2xh/rGgWJ4fB0j+zH3aOP2BOQCsDSp/vKxkJMvCj3w?=
 =?us-ascii?Q?ae0Ef7a/Dd8ukG7c4j5Wdkvb7cV4bD2xOSisXO3dVRa5yivcc0Wcj+nxCi8w?=
 =?us-ascii?Q?cyl0egMCo60dee8Egg7BcXZMPXDaEf1ztPuGzutfnin2E2il+wX87eSESikP?=
 =?us-ascii?Q?IOznt2FNhxhlNruW8TgSxZ4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2231fd5d-72f1-46e0-4ebd-08d9ed01f5ab
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:12.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyKsX3db1gXXLNa619RdisbnCROBAFtzkQo9g9rO4CmYdzMj+mq+XCjKAC8S5OFPPIII4He5faxJkpbdrBffVg==
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

Switch sled to 1-based to meet OpenBMC multi-host numbering rule

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 128 +++++++++---------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index f973ea883b97..e77736ed5c4c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -101,16 +101,6 @@
 			default-state = "off";
 			gpios = <&fan_ioexp 15 GPIO_ACTIVE_HIGH>;
 		};
-		sled0_amber {
-			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled0_leds 0 GPIO_ACTIVE_LOW>;
-		};
-		sled0_blue {
-			retain-state-shutdown;
-			default-state = "off";
-			gpios = <&sled0_leds 1 GPIO_ACTIVE_LOW>;
-		};
 		sled1_amber {
 			retain-state-shutdown;
 			default-state = "off";
@@ -161,6 +151,16 @@
 			default-state = "off";
 			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
 		};
+		sled6_amber {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled6_leds 0 GPIO_ACTIVE_LOW>;
+		};
+		sled6_blue {
+			retain-state-shutdown;
+			default-state = "off";
+			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
@@ -219,7 +219,7 @@
 		reg = <0x4f>;
 	};
 
-	sled0_ioexp: pca9539@76 {
+	sled1_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -228,13 +228,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED0_MS_DETECT1","SLED0_VBUS_BMC_EN","SLED0_INA230_ALERT","SLED0_P12V_STBY_ALERT",
-		"SLED0_SSD_ALERT","SLED0_MS_DETECT0","SLED0_RST_CCG5","SLED0_FUSB302_INT",
-		"SLED0_MD_STBY_RESET","SLED0_MD_IOEXP_EN_FAULT","SLED0_MD_DIR","SLED0_MD_DECAY",
-		"SLED0_MD_MODE1","SLED0_MD_MODE2","SLED0_MD_MODE3","power-host0";
+		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
 	};
 
-	sled0_leds: pca9552@67 {
+	sled1_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -243,13 +243,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled0-amber","led-sled0-blue","SLED0_RST_IOEXP","",
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled0_fusb302: typec-portc@22 {
+	sled1_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -282,7 +282,7 @@
 		reg = <0x4f>;
 	};
 
-	sled1_ioexp: pca9539@76 {
+	sled2_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -291,13 +291,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
-		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
-		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
-		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
+		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
+		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
+		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
 	};
 
-	sled1_leds: pca9552@67 {
+	sled2_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -306,13 +306,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled1_fusb302: typec-portc@22 {
+	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -349,7 +349,7 @@
 		reg = <0x4f>;
 	};
 
-	sled2_ioexp: pca9539@76 {
+	sled3_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -358,13 +358,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
-		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
-		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
-		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
+		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
+		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
+		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
+		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
 	};
 
-	sled2_leds: pca9552@67 {
+	sled3_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -373,13 +373,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled2_fusb302: typec-portc@22 {
+	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -412,7 +412,7 @@
 		reg = <0x4f>;
 	};
 
-	sled3_ioexp: pca9539@76 {
+	sled4_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -421,13 +421,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
-		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
-		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
-		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
+		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
+		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
+		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
+		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
 	};
 
-	sled3_leds: pca9552@67 {
+	sled4_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -436,13 +436,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled3_fusb302: typec-portc@22 {
+	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -475,7 +475,7 @@
 		reg = <0x4f>;
 	};
 
-	sled4_ioexp: pca9539@76 {
+	sled5_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -484,13 +484,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
-		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
-		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
-		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
+		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
+		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
+		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
+		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
 	};
 
-	sled4_leds: pca9552@67 {
+	sled5_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -499,13 +499,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled4_fusb302: typec-portc@22 {
+	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -538,7 +538,7 @@
 		reg = <0x4f>;
 	};
 
-	sled5_ioexp: pca9539@76 {
+	sled6_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
 		#address-cells = <1>;
@@ -547,13 +547,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
-		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
-		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
-		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
+		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
+		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
+		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
+		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
 	};
 
-	sled5_leds: pca9552@67 {
+	sled6_leds: pca9552@67 {
 		compatible = "nxp,pca9552";
 		reg = <0x67>;
 		#address-cells = <1>;
@@ -562,13 +562,13 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","",
 		"","","","",
 		"","","","",
 		"","","","";
 	};
 
-	sled5_fusb302: typec-portc@22 {
+	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
@@ -702,17 +702,17 @@
 	/*F0-F7*/	"","","","","","","","",
 	/*G0-G7*/	"","SWITCH_FRU_MUX","","","","","","",
 	/*H0-H7*/	"presence-riser1","presence-riser2",
-			"presence-sled0","presence-sled1",
-			"presence-sled2","presence-sled3",
-			"presence-sled4","presence-sled5",
+			"presence-sled1","presence-sled2",
+			"presence-sled3","presence-sled4",
+			"presence-sled5","presence-sled6",
 	/*I0-I7*/	"REV_ID0","","REV_ID1","REV_ID2",
 			"","","","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
 	/*L0-L7*/	"","","","","","","","",
-	/*M0-M7*/	"ALERT_SLED0","ALERT_SLED1",
-			"ALERT_SLED2","ALERT_SLED3",
-			"ALERT_SLED4","ALERT_SLED5",
+	/*M0-M7*/	"ALERT_SLED1","ALERT_SLED2",
+			"ALERT_SLED3","ALERT_SLED4",
+			"ALERT_SLED5","ALERT_SLED6",
 			"P12V_AUX_ALERT1","",
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","",
-- 
2.17.1

