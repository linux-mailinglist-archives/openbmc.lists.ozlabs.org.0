Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDCF4B1BE0
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:05:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvxlM4MKtz3cC5
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=T9zVFLJi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::714;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=T9zVFLJi; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxc05vZDz3bVK
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnJqiKChrBkpS9ACpyWh6EvJJQ/X5C+u+z1LM4r3IskPeaoMl8ttqx8r4NgWKnSghsiGO8qFiM+O/aAWp2hp8n/i4cQNoHOOEhKBaQAuYWz2Pfs92u+H89bGGw5cDhUnq1EjdoSuH+lG6H5YR0DA5EeABRa1CZjr6v45/oS8wZsqVLzYzhwWC/0OIF1QUrV81vu77WZkDDIUB0ZjUOek313vRfVEpFbfY8PtxkUbOGztE95iY+rpt4iEThcXsQYWadL6byqOkClVFCAx2fvVVG3vmxCU26mTpALfy2hS9FWqXXlHy8DOpIGrwoah8Kv8XFKNd1KWZl6nUGKvUMGWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+PhkdPbF9OOYJcM+200PXMui6uN8XsO2KXH8pDU/qU=;
 b=Iq6pylqZt6P6w6oSsYv5YfiCQZL2xRfZRR8U0MwD1lIk4SAsksl4D3vbg0fjgHUjRpD4bwoPDM8214c9Rz6aDKrh/9zAIMXoWUJ7SYrGisemagGM67AiLXIkNYFEgkMk8m3boM2FQzUzFatnLSlvxqCAhTHs9eis+S5/9Kct06luWRUdavIqrkWobZ5LKKVK4ar83YTSMu7dJHuukRNMhm64j2EP5hbK32XeqSYHSOk/ZSLGumqUXGLjF5obNOUT7+umC2gidR7fZM/EygT9Z75LVkWA++UguRKbQ3rxS44WmSU7p28vSoxHeNMrA0O8WY1QUqTe3apYW9lW2n1l6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+PhkdPbF9OOYJcM+200PXMui6uN8XsO2KXH8pDU/qU=;
 b=T9zVFLJic9Zi+hxmR76TUV9df6howbDX4p4hlPno7pN1HVo9QhGnw7kyYZXMnDvNrtGfeIwjgvfhE6SOXDYUJsTjzC+bFKHoNEPmQs3bT00H1LWuxMLgdL7ibE33K3TJ66pIgPBatTZHd+f39uClzDDKS6XR3sPZl4zPaATG2fc=
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
 01:58:17 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 09/10] arch: arm: dts: bletchley: enable mdio3
 bus
Date: Fri, 11 Feb 2022 09:57:54 +0800
Message-Id: <20220211015755.27644-10-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb02196d-5fa5-4e19-dfb1-08d9ed01f7ab
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB40153300275249F55EBDC1B58E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdCEBbvnfdPjVt1Zxyjf16QvAXwfOG1ZcVB1FAbyau3v0Qv508DcXVk7yLiTN7jFRVcvP8Qpqm6lUvlQ1AXVCA3xKP5rHGbU/Z6lLQGjizXPS5sgiCxYtW8FAIdUl7HjKfKlZkmiWyTr4YVap2In5Jsb/Mg+pJGoF9NlWkqg0V//JUz+7q5RKQn2t4pnaLqnjeEGzT/gZSraUbODhcvyPImrpr9KY8z5qOr8Mrsb6WvKIglD5cJtUCsvzO8x8dsUAfgbcbOGbUQZbC9THjv+Korp5tid/3CdkuKK8HfqeSzkHtc+CvjWqVSklK4dV6HZM34VzRTrKlstpUMEJajwo9EGP1FieuvZptEivgrjxjSpkX/1vGxabsbC6x5YgBb4CLahOr9yNI5Fbdp75z1d00oULvQBLTtwlLLGkBLptpEnPKE0L1GqjR37I6OpYkCHyUok9B0nc0mrbqvzHAQYcvbFmltY8xclR+sfDm5EsUSPWIeScze6RL8iMSo1U+/tuG685BknDN0eFKqN9tm9hO2q1iOVfdsdsFVePSDimMulBTP75n72IjmvtRRAsBfBNoKIBXvmLu6YfPAEoo2+4saTVT5iHa7BFyFKIcoQgztSg1luqr3HIWXjIAKgw4oCTx1t5jL/MCdMKd0O0ICYKqmUgo6v+5tqiOxbX86QGIxfeCOtzOj5HMFk7uV9SfiO4RUhpdPbBDh66QCa+WDs3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(4744005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9JS+kaTW9V+KvN2xyV9bXoWDa3W31uWGg8fK5BL9Wm1Q/dS3bz2XwGCnjngV?=
 =?us-ascii?Q?9Ox8BqAwk0WC7ZZAr2SNk3RbWXUBl5lGOMF05Ts6V3X4/3gD5peiao33gn89?=
 =?us-ascii?Q?YH9eUsDS+52yVbTk/uMiY40nvGgzajcAwqsJ1hMUtoKcsOVKlhsNXk03078Z?=
 =?us-ascii?Q?afdGTmQ1oEfYv+ze5r1w3+R50+bacLpyuJPE+RcDIGxAq2+HdqLTwbZWidoT?=
 =?us-ascii?Q?P5NXu3WDqdtKz2B4BLOOW0UufG005W0nZvwlb5TuAfU/h1gvKlqIWf79/FVk?=
 =?us-ascii?Q?EvEE64I9eypvTZTJdUmVJD2MHy97x+3IpRKoOqWqFuw1bdYvvWzjRYAH8e/t?=
 =?us-ascii?Q?ne9QSijEXZX9gnnkyEwO9RkXFcYhS+NnzBPt6yOJ2gEQr+vANH8yeikvSg3R?=
 =?us-ascii?Q?mhQ0dEr1Vfl/S/j6fWVU7E43+uCav/byFbBoJ5cfL/aBzXERBI0tm7reX1dp?=
 =?us-ascii?Q?SXM+1fCuBkjHfsKNkZB042yrtC11UJlih6qA3X3s/vs4D1W+hKW7GzmPTEH1?=
 =?us-ascii?Q?n8B+YwYFrYc2cmHu/+IhCyaNsirjIQ5+UKuxzItKW4DMd0quMo+on8grDNy2?=
 =?us-ascii?Q?TD6Bgvs1i20Nk/s/iqGtKv0nYwnWDrdlNdUItd1sM3CQsouL2BTNu9sw3woa?=
 =?us-ascii?Q?D2527+h7Hiu9QarocnuZmFGqdA28W/9GXQXM3DRMES0wQsh12w5cKTO/WIRD?=
 =?us-ascii?Q?Lqeto4Pp/IAbOVmrAlykRMMwhVG62joy2DGpDMd8MmoTi3gQjsKIAnVIze0c?=
 =?us-ascii?Q?kF2OwPXdxpSHFOwxKL8DeiWkYBVpQsAlAtVXeKOdjMfjiZM/KacoKWe3uOCr?=
 =?us-ascii?Q?UPDUPagCM0Xf403pB7maK8cQvdDd6FDluxFyEYIahWxsoPIPYxdZ63mFQ7ZP?=
 =?us-ascii?Q?6lkEbhvVJmz1WYK4qWFVH2RLNtf5tyFpuW5p0n7ovGeQMEgSmbrd79MA2oO7?=
 =?us-ascii?Q?tM6RbhZGWXJ7t6qRSYZCUc0/1iP79wrBxvCyYQsFJEmxfM/BlpSYnW0MwJGl?=
 =?us-ascii?Q?ZkrENgq2zOyQlBPpa5Dp+M0u1pPaBqgy+TUovCmcQ9v1rodtL5Se+3WbvhHw?=
 =?us-ascii?Q?I9lWjGH9GOrtk057hnKKxxdqVN54z4Y8IOF4N977frCa8Yhr785vQEiFlkGV?=
 =?us-ascii?Q?scIynvK7RB2n7V6fUGavz+RpFcHUm42RIpQdogT9dgzqrMdC3p02ldE6+J2N?=
 =?us-ascii?Q?UTVIfu8n97s5KYqq6iF3vBmH+IibYnJdt46d6cR2rpLb68z8+y2oXS5/JMDM?=
 =?us-ascii?Q?qrxKYkesyRCD7DoYDOpBaPOnyZKMwJAT+u/bo9te4Mta13G6XyPwpUcDmxQb?=
 =?us-ascii?Q?QLVkxMKI0OET0W6JtjNDbsw8LCKWPJVlD3s00fDGgEAQoxXSQ66vM1nV4WiC?=
 =?us-ascii?Q?8PRj8UwGgvL9K2tMZkP9I2KLlhgOXo3pdFJSissFJir2E/FuOS7zxphg4RMz?=
 =?us-ascii?Q?8NOdlIivFy6A3dk5P0XjpbFJn9b0ePMdDjCtGNkz4xSTzJFGZ9DCvtJ2y7De?=
 =?us-ascii?Q?YBKb8D+rRuo9SluhgW3/3omSXSOsmL+/TNqcdREwUkNReZn77w+IeYkI3PJv?=
 =?us-ascii?Q?V+0aAXVCnGbmdZDYQeitKM5+PVA7tyoDNGlqZfpHDAdGw8w5gh3hIw0tMAIq?=
 =?us-ascii?Q?f44gBFqhNIz75Uh9K25i/sE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb02196d-5fa5-4e19-dfb1-08d9ed01f7ab
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:15.6715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Phm5hD5ig/tdK4pOsnCt1o1gimFo3I2r7dP19Iqoa+8UmLJ/vFffB+Yrgy/NWau8cFf8987b7cRNgUl22OmOQ==
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

Enable mdio3 bus based on EVT HW
So far lack of c45 support in mdio-aspeed, at least can access mdio bus
by read/write register

TODO: Add Marvell PHY 88X3310 and mdio-aspeed driver c45 support

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 8c8fbfcbb257..946107bd8bc7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -841,3 +841,8 @@
 		&pinctrl_adc12_default &pinctrl_adc13_default
 		&pinctrl_adc14_default &pinctrl_adc15_default>;
 };
+
+&mdio3 {
+	status = "okay";
+	/* TODO: Add Marvell 88X3310 */
+};
-- 
2.17.1

