Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30864B1BC8
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxfk4b83z3bVy
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:01:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=m0h3Xynj;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=m0h3Xynj; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxby2T9bz30QR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARcC6DhztXGf0GUxxb6iSZ4d8QBQChlAatdBXpw15PXWo4SMd+xGpTWEP63Q2aj8uddyihAE7dDKuKzKU89tXWq7rWXkkYaXsEreFoQgycBOq6GNQWQ1HVbBfxgLS0/QztA3ooMRwLvFZQkr+QiV5g4hg2tOEyCPptLzsAmDi9LmzhI3ztBliLBcxANs5sllFIb/4Wd565xXn3tTn1wufP5qPr1xRn7tEaqVsyWAFOgLmau33jtWOE97zVzL58o5kD8aZCYy2EmWhlsSkFv0M8+B8YAxjYS/YejwhxnOWfTBPBsFB16T7HQHg7bov5OYg1gv6BcUdLGIGs7KwmE6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ODo0f6OUqSBY8DdOCRYNU7UQbznWvJKWHIANZng0y0=;
 b=S0Pem2K10KFP9UEfp/2hFoLcQ0ugIj2+hFWsqh2eawiJ5JWOgjwZbWzlBkDOIfEoB3pHnjgVaVPjk9PF47qkDzrSJEnbrKMOFh8ra4Zvu4wglvk2LXx+nQEkwx81I2yTmgoNTtmQi3p+umnoPK7uUvM6K+wG39pmxakvjg5KJIQaExBfEhWc75t0kZxb45Ktl87X/cgVepwWwwTdDp9AvFvje5NIt+Ti06oqKkTajGFOBWHaNSdvz9posg7YuHPykczD/kklNGIymoFms9Ue2Um5uXzPgZsqywNJfGJFWNvNdxEEqiz/Ol2a59inImb8EPNELZ+FpCKJvPU5EzG17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ODo0f6OUqSBY8DdOCRYNU7UQbznWvJKWHIANZng0y0=;
 b=m0h3Xynj8ZtldVZHI1eZXHAJ8Q1ME3Cv58cWqOxvQ+9tnuENGH3bUvuKopHxvMOTp9z2Xkqp/Y65oSzDYNllM/Oqub5lgszkQBY8IhpmJVqzVA0xAyDJ7bg0rZhfNqpmc5biFhc2hcdS8se4SPdUyaAQTcKFeqItf5jeQNN1I14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:13 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:13 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 03/10] arch: arm: dts: bletchley: update
 gpio-line-names
Date: Fri, 11 Feb 2022 09:57:48 +0800
Message-Id: <20220211015755.27644-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73b03220-7062-4561-200a-08d9ed01f620
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB401529F25DC786A7CA23D4548E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WS/9MQUWEnTaU6SZaeD4N2WdCtskIagzqzclALNDy7+xg14Q+438k7YdupNODL0FX8i086YJXr/AYseEnABwzg5SL4Ofxn1RofO1+0nCT2IterPFga2BT36e9nGhP+CT3RBBX+bD/1tz0BV4yFZzey09ay6J2eNXN6N5y+uG/AkuZY8k6K7jQFn6QtbeLYWxxuo7O0zBSMWQcNCHM5isg5kZLr8DJqxn7EW8IyprZNw9ePLC7lDvbxDm1LMDQuLgTImVI4Nu/wgThlXMfXgR/Lm5/iVaGMWD1NaLxAC48k+kHQryfs4M1eowtjoCn0RPxpgoeGUzyK3NjXSilGQBsCHrw4gUaP9aDKnQX7oDvzFW4k/mpWd3/x3m3ixbBh1IJy8eRxpAQwIprJRaZKJEVwASWtSYZKG4jmNlZI3sSgSfhXbcbVTh5/UPyNM2B0zKCcabvsOU2G21TdSTo9yhNGMThO9lDmOfE+nMgWgOoprNYCq4yjv6sduGjfYwi/syVJ45y9g4BbC44w3MKcWMwXERb6/8U+AJiyrWyhcDefUkMjYzCkAAzXY3gnfz3lBxYVkCq4e504BK76Cgo2HBxPkjUvu4uKargqRwpuyEo8RV1Q/7/jDWmwMW8NyV5vSe7r3oxNWaZmKuyyU8siAgopr2hgDSh7onVXdjr7rj2MNFl/sv6Zf09bzxhDyhEOj/yWs+VrZTO7KKx/OPRU77rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(44832011)(2906002)(107886003)(15650500001)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEi1tSKH+HPq7GDGbwWtui1OvvN36cOZ2NOMdfewjoY1811UazG56uIQtALc?=
 =?us-ascii?Q?smEbaPOe5wnYPGoioXlVTlBE0+oyeS2mGqxGzilWDhhurz1GD1TRYT3u5YSU?=
 =?us-ascii?Q?P37TGSRRc97H8/AvCZINcb/OVkkOoqhn1w6XwMXnbvh50KfgzSBQXEu/O49X?=
 =?us-ascii?Q?Ggp/iWyaHwuzdGtTju+rKfGm+9p05gB+lpGS/StVSDKev2okH54FQjkQRD/1?=
 =?us-ascii?Q?btV0PM2FWc4ebLa1f62wAGvEPuZlB59jIURG3yvDL9iHNKHV5ZHJ/9x2Ag5A?=
 =?us-ascii?Q?Xr0jzvy2Y0tZrXikYsAmOV8XsfkdRLAQSesGSIdT9905j1Y5SQdmDSFLHugG?=
 =?us-ascii?Q?hfitxbr6gnVw/0qZw1jZTynNP0UfvDEHE3Wa0chqMNU7cg8NGWV1DHvogOwM?=
 =?us-ascii?Q?UUlKLSafH+qB1U132vakCRC5rMcPAyZj9pJ1HiqeOFVwi8DMs7CbmSjSVZ4q?=
 =?us-ascii?Q?tPs5a2uEugvtlZmRhAAUxeHCZRKObAvQTh8Jj/Sc/C6zAy7TCuiCqrkEIIJ3?=
 =?us-ascii?Q?t6Q/AhxrUlAy0CLg6snxS0Y6AL+NDVe+WWfMB10ltcFk5FvMH0+JWUxSIvcc?=
 =?us-ascii?Q?OssuZaqvS3Y7oYlaOI1uVHjZ8ZT/dE7ky4MnYgtrmbPB0YzOUXQICsT7kpYA?=
 =?us-ascii?Q?ILQbGE1BauaCAskdcKC8RpgqMRSzc71vHheSZyYsnZM5fU4ybjbYuEPpo58m?=
 =?us-ascii?Q?jp7oTSdi+aMbrOrzTAGAYs1Mn+QnNIYxHPFzeVtLy9vCuH3ev+2HBQJPTQC1?=
 =?us-ascii?Q?0nxQ1g64Xt5ONiW2TOX65oLpsJL0xBDkA4Q+Roxskc11juozORXiftZGGJVJ?=
 =?us-ascii?Q?OcsZGo0dyhkzLZU14THcWJL5fCdwVKz7jHC07O1YDnMDi88JlhMXIaEyjfA+?=
 =?us-ascii?Q?h/9aM/yLIBgxJeJgCYDt0GbYDR6rHsxZZQx1yIfTYdGoTpsW4Y7JflSOPbpe?=
 =?us-ascii?Q?SogTyiNY+NwqHKaFF77aPbaCHrvJz6J6KHINrArJFsVAPBxmBNDyQGH2nv2x?=
 =?us-ascii?Q?HL8xFCXX0oLMRSYHeBm/b5zyt7naLqFU40DDyFnucMUrqM7El73OVGSaJwMd?=
 =?us-ascii?Q?EeRTiAnK1uLCCfMV3n/nNXx65sB21ptwk78mn4OeR/Qac7SaOre3if9bsxXK?=
 =?us-ascii?Q?kQYS3bDpWAk3MnYSPqSD2qO+SSDXi6pnmHqU+UqlwLJ7BDm15Fb4A+Bh0kH8?=
 =?us-ascii?Q?21R39NeXlqcwEFM5qNlKS58pMGl5jFGLR0G9pQ3AcekTqV2YE014JJ/XeEWA?=
 =?us-ascii?Q?QtXyoHsblRKPXm37IyEuynomPGNo9iViRFIVXDgrOvVlcMnVSyqZaIQ9YMMa?=
 =?us-ascii?Q?PXqaqHRsri4bPYoRpvBvE+CYU68LD9Gqy+7Es+Q83k/bs2gZGTY75n6t/lqJ?=
 =?us-ascii?Q?TELSdDZg6YqOb1bkPmONJcCGqhZdEj/r1gqdN9jZTLGq3wJ1/FgQefYYxLzR?=
 =?us-ascii?Q?12wM/A9QM4Cc5ATiknMScHp/EW/N0eK8aoyxbHAR+iXxbHWWyTakYCqo7If/?=
 =?us-ascii?Q?c9u2AG4IMbIj3BkIU9QXaWUeMtvO6NEIQTSCpmyS28RiYIhlGTOXuRrhMzA6?=
 =?us-ascii?Q?Lb9VyhFZrA0DkL24Np903zd7aQvEqRWPJgxm5jRjZwkzbahC+31fn6B2/g1H?=
 =?us-ascii?Q?gl4epTDExUfyquVjo5CHow8=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b03220-7062-4561-200a-08d9ed01f620
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:13.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHlnaCeLg2K1QsbHt1iLxCxQLtJB/wMKMhCo5Uc4StFO/J6+Ay1RtzKzGwnWem+/MqyrKVa50+ipMWs9zOUrIA==
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

update gpio-line-names for gpio0 and all io expander

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../dts/aspeed-bmc-facebook-bletchley.dts     | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index ebd2430a3bdd..fc0690ccdb0a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -270,7 +270,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","",
+		"led-sled1-amber","led-sled1-blue","SLED1_RST_IOEXP","SLED1_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -333,7 +333,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","",
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -400,7 +400,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","",
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -463,7 +463,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","",
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -526,7 +526,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","",
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -589,7 +589,7 @@
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","",
+		"led-sled6-amber","led-sled6-blue","SLED6_RST_IOEXP","SLED6_MD_REF_PWM",
 		"","","","",
 		"","","","",
 		"","","","";
@@ -727,16 +727,17 @@
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
 	/*F0-F7*/	"","","","","","","","",
-	/*G0-G7*/	"","SWITCH_FRU_MUX","","","","","","",
+	/*G0-G7*/	"BSM_FRU_WP","SWITCH_FRU_MUX","","",
+			"PWRGD_P1V05_VDDCORE","PWRGD_P1V5_VDD","","",
 	/*H0-H7*/	"presence-riser1","presence-riser2",
 			"presence-sled1","presence-sled2",
 			"presence-sled3","presence-sled4",
 			"presence-sled5","presence-sled6",
 	/*I0-I7*/	"REV_ID0","","REV_ID1","REV_ID2",
-			"","","","",
+			"","BSM_FLASH_WP_STATUS","BMC_TPM_PRES","",
 	/*J0-J7*/	"","","","","","","","",
 	/*K0-K7*/	"","","","","","","","",
-	/*L0-L7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","BMC_RTC_INT","","",
 	/*M0-M7*/	"ALERT_SLED1","ALERT_SLED2",
 			"ALERT_SLED3","ALERT_SLED4",
 			"ALERT_SLED5","ALERT_SLED6",
@@ -744,19 +745,20 @@
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","",
 			"","BOARD_ID0","BOARD_ID1","BOARD_ID2",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","","","","BMC_HEARTBEAT",
 	/*Q0-Q7*/	"","","","","","","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"","","","BAT_DETECT",
 			"BMC_BT_WP0","BMC_BT_WP1","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
-	/*V0-V7*/	"","RST_BMC_MVL","","",
+	/*V0-V7*/	"PWRGD_CNS_PSU","RST_BMC_MVL","","PSU_PRSNT",
 			"USB2_SEL0_A","USB2_SEL1_A",
 			"USB2_SEL0_B","USB2_SEL1_B",
 	/*W0-W7*/	"RST_FRONT_IOEXP","","","","","","","",
 	/*X0-X7*/	"","","","","","","","",
-	/*Y0-Y7*/	"","","BSM_FLASH_LATCH","","","","","",
+	/*Y0-Y7*/	"BMC_SELF_HW_RST","BSM_PRSNT","BSM_FLASH_LATCH","",
+			"","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 };
 
-- 
2.17.1

