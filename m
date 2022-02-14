Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D734B40DD
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:32:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxrtT3TpNz3bTS
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:32:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=HuXksj5g;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=HuXksj5g; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrpz3H6wz2x9b
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOHVaRA5yURFBKfCe8JiN9lyOZCJcFpJjPGrOLyS1NUwwSi61hNtgMKl42jzvbo6qcAL+0wy5sEtkDwQTiMuzkvly5Hgg9YunwD9X8p2bFJv9zMw20bIw7Y8d07SPLQX/C8HQMzpsgackl+rbp2repugiOk1UqC8cYFNtmbTQYV4Tg7dJ235L8h7AlftUiSyeIgP9rpLHTpq+Bc/PDVS0URMDWHCpqjJAM+IfBBVFKV2lnBOWwWc5/A1f4qTD42887b7OiUEQYuA2RQwjFxIw83LNgXDOYCKsJEa0p4sBMiMq8g67ZtUN1z3PjxMTTlBgu6D4/Md7n6qnR19tcWpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRvFQ7lCwiX8nBe9hFQbKw9ddkl0U+5j90hDCU8eHCU=;
 b=ObJEqWd5IWPbrmB3C1lG7JBrTsfm16/yg2VKkDBhfbNalFfujB8S9YeNYTLkjSibhv06htEfpS/3a8ea/elnWH46uTZtP9L0kEyhRWrEt+kcEUjzEfkCwUYs3Wx2hhOCeMkQKZWOdERqdCi+nZUbSPDt8v4b81gYU7W2C1tImC0O9CO9bUE/JovAhNjaKHZkDJ5Ad9Pg6jmkKgRHIcgEiQ/NzUwSRPapj/FI5HtfaaiJs8Ksy7yvM/sAhDlstuzCX7I8efZiVaqHyRT7DOtnT98AQbjN93GZpK2CeUNta+JcK0oQmMisC0FVRLhEq0t3NXAeFndQfrxGFzttcjEeJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRvFQ7lCwiX8nBe9hFQbKw9ddkl0U+5j90hDCU8eHCU=;
 b=HuXksj5g6bs7pTxlJh5qBGPGD4oYRbKj9Bc76ijsQDN48vqRXd+7dJBxYh/5qIrjNyhNQlReXJUf6MG3u9Q7mWO0vnIm4XSsJxoXe4SVMHBXRaYk+ZRfTqupkerXl2WxIcpkTLYFAGmid6/OnG2623t3P/Y2Mp/OHwOvXX139+k=
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
Subject: [PATCH linux dev-5.15 v2 06/10] arch: arm: dts: bletchley: add
 interrupt support for sled io expander
Date: Mon, 14 Feb 2022 12:29:08 +0800
Message-Id: <20220214042912.14584-7-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5846e25e-8aaf-4bab-46cc-08d9ef72968d
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB22927D072EE747A161CC558A8E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTwzUb4yX17M+nuhwK/bzK0hy6s7jlkzSdxGr1L+OFYQGgbSoruO1IcL8D6Q0IwiOEHoQ7DOl9Ngkr3Hsh4gEdLpgkqOjY2dWVril4s0XPs29AfsUG1TZnGE//BBQ475D0GJzwKdQYjkiDNhJOn+OBMGQHNOlDZCSdpE3rO67OkO6WXSTTvW1m4d2ohSwkV7iIHLWgkUgyIocSys0HiA/mcezhhbP5OrujHg4Ghm5Wfn6DkxFvZ1au5VK1Rx7KfD2nRHZKkV1Z86CMAzwruioBgybVAMtFX9vxf2dZx/bTmdOv3cDn2Rm0HXhRbJ9ceuCJYbq7aqiP2MbaitopRpcRXnWZgBtLGwlGhomWP4yAFK6GLjgl5zRNOZbwOu1YViBM985nyqSRtj/7xZ8pAa6G7aEEEiCirmCkqsPllwg8hnzncI4caiLWADrye2FQV3W4uT4xwEru9chlqHDiu1SSVrnrPkGCAoou0b3DQqGBfLC5VN4yLSfYvQnswEa8bkNmyg4iApar7H4xCE3cwNBaLehfoGeNOBUKdLuBF0FDS0C/2HYhtXgt6q8EMwc3n5Hys65gs2t2FRZOsGQ54EwFSw3qFXsgr5XOqv0A1bQyuNbtJRxRNDhbtuaFG96/7FLrZxWH6uR/ssTGQgSQ/MMyKeM0HCaBnB9yH7TJ+zo6XIdbzCFPCDc8yrZ8nueENNHlxKTWqBI3DlaygmaDN0mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(83380400001)(5660300002)(1076003)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dWVW49OiBmqSBN6Fd7NkdHkE6CyPKwLehNh/1W2MOav1sXuYwRSiFFu08Wqh?=
 =?us-ascii?Q?Od3Fe2vulc41oR0weLf4qNAC7KFMu50sil686+XyY3XVANK87R4z5HMZxA+X?=
 =?us-ascii?Q?LyOPdt8VVHroYNYwAn2lRjl0AbVB2SpkFjfme8R+Ww6tS8CjUUyj8+Pm1pbG?=
 =?us-ascii?Q?d91n6ziAuQoKwFFwWomLuezldkPW7SS1mGS8jrHZlWdTg5ey68FOHMWRPseN?=
 =?us-ascii?Q?+TCBQW/Be7+JJ8EG143jXBIGsnNbvXdRVSv/SV3PCZ82cZDNRvJ5NUr6454i?=
 =?us-ascii?Q?hmb3V8tvk94vwRThtcPZNN6gP7sMld/4QThxrtBeXFyXes6chZ7ouJ0hYIbv?=
 =?us-ascii?Q?DUv/FIPuYEPtXqDLREqv2XUPzPxyNORn8bkz7CX614+zS9KWHo+F82kvAbhm?=
 =?us-ascii?Q?PphYiz7yd1sNVyXaf3ADdZPdK6rm6dBrW2eIlE1//wxnBMMNpCjKdz1qTKIJ?=
 =?us-ascii?Q?jpbOpCb5/CRlRuEZJyL7K0VPsqjdFXsaO5iLgZwuYzMVwtafZEnYtTs9u2Nn?=
 =?us-ascii?Q?ON0EmF1AOY5i3srjT6dZVzpQJOZtcj2+G/f7GWMkFQ0TUeSaDtjAVE6hFWvt?=
 =?us-ascii?Q?DFMcbWQwT8OjQK7TMp1BjRyuKcambvweDaB53bo27cVWFtzzdaEOLqf2iMvY?=
 =?us-ascii?Q?Ck6NaKyrKP2KUestffu4REeTN9ZZvKHoveIGaG185rlKT9lOtLQvlE+0Cd38?=
 =?us-ascii?Q?N0tiJ6eB2o+m/kCdo3Fq9YMxexfGJCkXhANRgAh8K3YQ9iFD1b+tdm3I/itV?=
 =?us-ascii?Q?aG86X0essB6Tw3RBIx9UCj+Fsn70ZsLVCxA6kS57VPbOI6S3UNkWx87ls0Zy?=
 =?us-ascii?Q?mlH3UQCnZvit/cMG4u4oVQl9lvYpwLqczYq+xON4NLUXzI+guET/B0gc/MYT?=
 =?us-ascii?Q?KunxLONRUyoFQo4b0cSxjKwq9xdllvKoM94xG280f9wK2nOULvwtYoZSsIX2?=
 =?us-ascii?Q?fdQKr3Yag8LUTo28lIuZM8OfTdP8NF9dIEJCoXfHG3YwyiRcWQlSWemsUoWb?=
 =?us-ascii?Q?r4hIZ14S/qMcp6afZyqps2qFir/eqmjAVn9tSPrq+WZ2zr9x22LPtzcpjanF?=
 =?us-ascii?Q?C0M4m8NMYvFj9Y5gEdRVPgLog4ykI4jm8IwHSJuBczacryUnXY2XdjlBxp2Z?=
 =?us-ascii?Q?kC2x1KcXmpI9i6KLg5DHeybnGSHlTItIFPR6Q9mlFs6YG1radAzyAb6xocQT?=
 =?us-ascii?Q?APJbYc78PqvOl5zH5KPUfh/LLjH7TcUWaJJbYwmxihD3MY2A04nb3k+OR8Ud?=
 =?us-ascii?Q?XM1MbDzvzqJSy3nGUbrEr8HioRl68agAThd7tbqcUlk0L9BH1HdWL3wSG4Oa?=
 =?us-ascii?Q?FqM9bcEEdcjfPG2BsIBqYC/fh5LNI5iHc5sgED3a/Ekg/2F5K+T/wtG+zSvO?=
 =?us-ascii?Q?khmJ+g9PMiO1a1+ycyHW6Fbt+KLHUNAVpvJb+qE+R1UHBkPem50PfXQKcoGb?=
 =?us-ascii?Q?HuPCkGhQ3zSO16pLr0pMnX5jTNnC0GxzmoaWips8Pp3bu7j/kZI8RvzvGXst?=
 =?us-ascii?Q?KgMZXRgLq4rwmJfsbRfx5fU6SXh1edOtrLPPpK8ei5kFq40kHB6Vl/Mmnhou?=
 =?us-ascii?Q?FOrO0yW2x6AV/ekiD9XAM0XfCnwj6BH/LuUqr0MkkWJM5fLC92H9738cRTI4?=
 =?us-ascii?Q?3NtfRBY9frEAXLAEoaq0nF4=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5846e25e-8aaf-4bab-46cc-08d9ef72968d
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:28.3443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovdI7TWtVwIDJWOUmIRvrlctvm/79Zqtc+vdUKLonAuL725kL29hDwcfWj8cPqCzjBDln71mXwTXuvAq11xEWw==
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

