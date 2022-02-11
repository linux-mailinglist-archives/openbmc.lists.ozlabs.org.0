Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1F4B1BD4
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxhz55bHz3cBH
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:02:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=NUXK0gIf;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=NUXK0gIf; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxbz62jPz30QR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwDQkoD0m7MvhEldk5D+YlVMci9U67ILN3gBhh8i62kckRxVHuUQsUdgrxuEfOih7ojS+S1NC5Qk/WPRoIyeHZqBfdCVRWd9q45eqy3PF3N6AFV2foo2SnqTvKD3noEA9WGRPglLvurQJEXZXwuH3+3wpOXfxOB7ehVuOH1ouPbvvL8jq1RWz4/4VIKa0n6W/vKIn01VB5p85yq0D3RvOAQhYnGulbMx1i22AjKuj2yY+1Pxf4NpWVBO9HR6yNBeP2SUbjqybhO1j2NoQhFKLY+icITD/QWhJ+6IB0F9jrjKgwhuhOF/PWQgIGw1E/7WzPNosq7R1ouNgGxhrFL+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRvFQ7lCwiX8nBe9hFQbKw9ddkl0U+5j90hDCU8eHCU=;
 b=jVhEYQKi96wfnXnsTy2B5kjlkdpk5lAMnTR6QY2Tj5hFhieTZ3BbeDlXKqGSC90oNR0tfTwkgx5LDvsAEZvutYAU+P0QIJ+j9Ti7oeHt017Xl+8g5bNdsRe/6+70rE17wUQGxNJRb9eo0Gjv2sHhlRHvov2mNKnSLBM1INlAVwH1IhXD71Gz3Z+qUJZfyjo+ORcJUI/UnURYtwTEFQbi2vNEXUC5E2H6futY5SsruqTE9v3EBrI1hC+D8RacXl14BsVKuAL62u4oQ5zlIRqJkP7hD6XeC+QiW++pytgq36AFhd/7j09164oecStwitz1vEux5SyDHxJZBMoTFKWPkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRvFQ7lCwiX8nBe9hFQbKw9ddkl0U+5j90hDCU8eHCU=;
 b=NUXK0gIfV6qAb6cZNnP4mjRH0Hw23z2dYSkygvBYGBWMGBjh8jJ0TO+vqBWJ6qpCc9inChem46NjnldWFFU589XnRfHCzzD//mihAeVYYjNmvtIrXNBIuS9+2NmFqJWtHwvxdnJlsYhvvgCS45CY5r5DqJ2e/5cAgdT3zRxp5bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:15 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:15 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 06/10] arch: arm: dts: bletchley: add interrupt
 support for sled io expander
Date: Fri, 11 Feb 2022 09:57:51 +0800
Message-Id: <20220211015755.27644-7-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9168f108-8f4a-468f-b1f0-08d9ed01f6d7
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB4015C6ED7688BA6BF4E323898E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJ328VdHm8IinjdtD5pZbGCHHUBg7F56pDcE3lOfgKZBfBWZCEhHSpE/EHTYrsecGbb1XMUX9NcZqMSvXCHA4hP6PGU4yUcAex9vFDNI8/WBJ/GcndR/KV3SnAxooEJfvxwYB06pjq+N4zwUso3CYl3mi+TE3f02xttqN1hg6onMNS33zviDBJRP31Nkcu+IR5Huf+YlOeBHIJ2bXcoZXkhxcwnKLkjSbKw8hkAkXwMjKBLukfZwkYR8iy4cJZX/pTwTgOJbw/IEuZo2kz7vqc/9vofIhWYivgyUiwNxMRQ5iMWD05fkuDFEubEOUBaKASULPP2WVsWZFdYlfjTxZysE+caMgWKe7sT1RPFmmuhEUUsK5pdN/Du1RQ5YyizNNqMvK8ybs9RN6IFhi9RaNz9GzkYRWV1V8qwW9TfqK8offqfTdmflN/xo7Nx1HmcYVLec2ClGr2OdDsb9u7nMc17sLDTaQwE6CbVrVyEZKC98z6ULVVSN9IcfHMVhZ8cCoGjY8pF4lz0+Zv5PiYiwQuq59wpVjgXIIr0toRxEotRTuwPQpdwwaBRtjZVdWbhtYoeKAh923We5NthHd409zxyl3wKccE3EU/P05rLGEfT+rUB/572wp14w66Qr5DvTnTOSXnXta9IfEBD48DoYOzTOefCd7Ty2EMBOaI+JAIAX7svmFntOfOIIW6qSWNEuh3+0ZzKUQGFnaBy5eQsQhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9ATAYHpR5sGiz+WwxzTC6MTqmiZP5/E4ZK380Za4zDKoGfuf8Ru0cci60rYO?=
 =?us-ascii?Q?1t8bJLzDbDLptD99b1c940ml3xaYr4AZBEq73MWBlVTFQca2sYm5rUGTrb9X?=
 =?us-ascii?Q?YZIqEycyhY0HzGxF13c1tr84YZ1jV9vjzNZX4fWt8KiahHIzL0VqWiI9EUiA?=
 =?us-ascii?Q?xj0nUiMIURjaIoHs+kCwWVsbdI4hr4ugoj25YLl4c71UyvFvMFm1840Zgzgt?=
 =?us-ascii?Q?7tfoOD9T9Ev7k2E5PvK/QMIayDEsOLGE28mI26IKt5Koeakx9xZL5vfYJVTs?=
 =?us-ascii?Q?D2OC6lovlvK5F/rC1Cb+haOacObfM695dnu0mPiiOXZbUHKbFJAWoQzzWJsW?=
 =?us-ascii?Q?5R2DYm3uFqpGl8m8XcXyUSxvW91cDKRyrl9lgHni8n3I1xDIcx65WApEt3a3?=
 =?us-ascii?Q?9uziTPqplMNh6bhmH0M2Eijj1xU+wRS1l1upqs9IGnygD1KKHVRsM4E6eZph?=
 =?us-ascii?Q?3NXIktQ5zIjWCZ9tOP5x7/rf2zRuv73Zn5SlRqwo3qXD58A8W2n2pnSncPUA?=
 =?us-ascii?Q?FGl2BBotIwvkvJjJ5GKQfeA7EBbfzE22lOWsPXFD9gthXesHJhricbR8Ekao?=
 =?us-ascii?Q?XL6r4C3NsL+ALK4r9JaakCPpDsHjIcnVEB2yCveiMVCEwXf54JgQ9VhN5EBO?=
 =?us-ascii?Q?F79Qb7xtNaNkE8mckyyVAQ7FlFCcKXjh5CpoANBwiWe/UVF47LgTfqeqjUe3?=
 =?us-ascii?Q?1WIj8IPcIDEdG5ZLj8SfrSv5JB/e+pE1k7f3K3SUhRpmAKaTSG4E+tpdDwqL?=
 =?us-ascii?Q?odbzBFV7L4Rs7QxlwEtu4p8qmNnPVH1gPhTBD96CswkLG25wKzNrW67WKNGM?=
 =?us-ascii?Q?3LpLH5OS2MC4gd+HLF+v9ad7yqeIuDEcsWnfwB3KvjvWYeD8yHUVDAsfi6lm?=
 =?us-ascii?Q?2+htpLRi4QreS7JnI/uHfYreel9GdWw/QyFVfWlawOtROBW8BddYQcHiZNo7?=
 =?us-ascii?Q?O8RpIVnC+whhHEjahT8G9MaydgpnaOxMkTi8PQlqbSN+WWtSMcVHIHEyyDdr?=
 =?us-ascii?Q?s9PXotJGe1FDfiUXG9yoz0EuxSa5L0NstRqkIqiMpt1L2ow1TwAFiPdtzdh/?=
 =?us-ascii?Q?hCORhBJNanXhsfKuRSwZq7QNugFTUmLOLF87ldL+EO/35LOG289MXiqyKrDk?=
 =?us-ascii?Q?ys+GuPsKagDolzZwEibES+kLG+PtWMA0xjo/xeYJtdqiD+ej7Gbx4YWOIqAA?=
 =?us-ascii?Q?bgE/OaRab8J9y/PSzCU5GxuJWKKC3Sy+6MBwlw8DjZCjdHoRaIQVOuK82E55?=
 =?us-ascii?Q?87fdpmThH5DpxFOGXqcg3W3UwbWJjlbl3Vtj1IfOeMaJPB+9BuIxv+aZHcRK?=
 =?us-ascii?Q?hsa8jL41XBYYchMicfsPJgV1Yhn+PupWPvsSyCMjzbVQWwjOrnttXb3/lnI7?=
 =?us-ascii?Q?4eeih8TTLZZycqEmdp3kmnSFstbp76yMk65v6KLwZKowYc4nNoKmgVt1ZRv2?=
 =?us-ascii?Q?Cm+QWaXlgfJpCu0dAmqc1I78WgYhZLBk3UQdggskU7cBXbHaO2HW/bGfL5YW?=
 =?us-ascii?Q?SElz3fGSlepThvlQq7IxUOoeb+u9XWwBY2mtd+0ORvqHRRcHmga7u88Jf3I6?=
 =?us-ascii?Q?v/He5ObXQSFDeYgpazftoDuDCFD01tbFvfrO84R+yPJGixp0/+OwBluk9/Of?=
 =?us-ascii?Q?ukR9vxvnRNMzzo6Vc0Gc3/I=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9168f108-8f4a-468f-b1f0-08d9ed01f6d7
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:14.2810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jRiIIq9qgm+hgUFrj0V8WfS5fj7pQ8I6to368rHRqEiFogYDl74yMG6NtmmK+OC3l1mFosS2VEvUYRDQDy4EA==
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

Enable interrupt support for all sledx_ioexp, so userspace can monitor
gpio from io expander by interrupt

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 3c54e4a892c9..8afaa8f52c38 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/usb/pd.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Facebook Bletchley BMC";
@@ -268,6 +269,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
 		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
@@ -331,6 +335,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 1) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED2_MS_DETECT1","SLED2_VBUS_BMC_EN","SLED2_INA230_ALERT","SLED2_P12V_STBY_ALERT",
 		"SLED2_SSD_ALERT","SLED2_MS_DETECT0","SLED2_RST_CCG5","SLED2_FUSB302_INT",
@@ -398,6 +405,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 2) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED3_MS_DETECT1","SLED3_VBUS_BMC_EN","SLED3_INA230_ALERT","SLED3_P12V_STBY_ALERT",
 		"SLED3_SSD_ALERT","SLED3_MS_DETECT0","SLED3_RST_CCG5","SLED3_FUSB302_INT",
@@ -461,6 +471,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 3) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED4_MS_DETECT1","SLED4_VBUS_BMC_EN","SLED4_INA230_ALERT","SLED4_P12V_STBY_ALERT",
 		"SLED4_SSD_ALERT","SLED4_MS_DETECT0","SLED4_RST_CCG5","SLED4_FUSB302_INT",
@@ -524,6 +537,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 4) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED5_MS_DETECT1","SLED5_VBUS_BMC_EN","SLED5_INA230_ALERT","SLED5_P12V_STBY_ALERT",
 		"SLED5_SSD_ALERT","SLED5_MS_DETECT0","SLED5_RST_CCG5","SLED5_FUSB302_INT",
@@ -587,6 +603,9 @@
 		gpio-controller;
 		#gpio-cells = <2>;
 
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+
 		gpio-line-names =
 		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
 		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
-- 
2.17.1

