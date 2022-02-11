Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525144B1BD3
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:02:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxh96JqYz3cCG
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=m/rcT7eJ;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=m/rcT7eJ; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxbz1GhYz30QR
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RApDe0ufVjxiCGghXbYneHbgGd6AZ8PVd0g54x0zl/WdKvD6h5vsRQUF6fmQ1ad3dot4cXcdxkE4EHzgYu88cs3ODjLUu0hxV9h70JmikoPrHDCTLjRnpfrsAqy61s15jLNkKK6MW5+SHMzDO62AgkKrOlojHEQEeJ0vrMCHHpNvjODKweFvt7UZRoVGJPzzM+9u2WsowykYZj/ZjUM3QTKG/uF9pqqgHq8LNIm/aJYU+3XM3aLHz9j02X3q4+FtvpdtbunUubyVz6xcoi/hzR6/xAhSiqHoDlAvARW9kO5JKRjPwjcgTPPJxsiQnL2a0QWFRMRtOr5xp7O6uAlnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP5HXQWNQDu0kPu93Qi/cyxG6HflqgTsAz3rl/SoNIU=;
 b=IWmDAzpcWryGbeb3QstvbG0pagxqsKZ+QEQ9SRrNgaQl8mZdyfkSt6QxK1fl2x86GZ3S9LFjppVCv++/dXlHDKOz8iTErybwCF4C73lpCwLC3blDauKrAlE2xWGB4saGXHUL8i+Lfxb4O2swSPC5eFLihyH5TmZcezkMdz7bjlY/EQyJiABkXUeQGFQaxIt2I+PfmvHWL2xxKCLXEhUG99XOTUuc0lL3RmJRWVyhYNJnJwQ+ujm1ylTMzfB8EeJCNQI6Dd3W4qOPU8VIfkL9qg5ORobx2gRKvSxRwWgK49aTPGzSL1gus9rolbtOIEfWNIFBIv0KGq24LUdhjtcRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP5HXQWNQDu0kPu93Qi/cyxG6HflqgTsAz3rl/SoNIU=;
 b=m/rcT7eJwsUETzwOmQD2c7EcuB9FD+tM1GYT9rwOpS+G/FpoWHYjof/9tl/UnByryFpc6grsYrSyRY/K5YJ+fA1Kg6ZKYhLv8HNxdck5k6rsszkqEnBalQfBa+49in9//hALC4K86cibyeuKUbssJ2kmmUrxODpow5e4kAxQ2o4=
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
Subject: [PATCH linux dev-5.15 05/10] arch: arm: dts: bletchley: switch to
 spi-gpio for spi2
Date: Fri, 11 Feb 2022 09:57:50 +0800
Message-Id: <20220211015755.27644-6-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af4277b1-41d8-4c7d-8efc-08d9ed01f692
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB4015EE970B5742C0E9FB49268E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gckhFntOM0T5YFuWiBQRswr9i+2gbe7kMYBFEo2IZ4Ewyj8hWt8AWV0dp6snLgVxtlwhcMYXXVHcnCK8zFnLNv6PbvtJBjYW7F0VQxtk6yELreH5c7Eq8WzTl4VaS3PLaZU6lJvJYB0qssVse5da4zI+irkk+0fKJBTOQDX38F0WL/K/QGd3CVxBs15k4YbWu8ubBLJhP7Dn78UjmsvJo4wCyJUxqyS24SKGUjO1pJveummGs7VxU66PTQ9fBCFNhf1YQLNMVPL0+n0+ax4fkkYSE6JAu7oQz0LCX835Oi1PTyuZokPE/iZz7XgKccpHOMRW5JiKky2hbxtIJ4d3TaQ9V6zpmdYtNScM4buZ3+ZXbry2/vuGKSwJHQ+x4vD9HE8CKHlyXZEvRn/fYXKOTI5mjHexc8DSQuy0BUT8X4kAvHr83AezpFeJ9Fx6Sr+zANBHmnMF7R42tAfp7I6DTcOK8CFa+klTlSVlIicx6jWSTYcq7+3qk2rwutlzUrH9tbFFDwdNJMN87ZiJHzCqVKdeImyPrpjhGHklTEsx1d5jgBrA8kvrzh3HV7pbWX/OphJhkdL+1ykNwSgpxhaPCQKLcKLsVzd/s4XLGuY8v6KkYC9IqPtLC68DxeCwa0YoRAOqEBY3+RjFE8Jo6GdBuk8s7f9hYBRAkWu7AjTFC6/peidGZ3X7A6ifN6QPnydGYy65XpopavyJgiqnbubcdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(4744005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tz/fEYr4LPdjoZvjornHCKV1yqaWiWt292nWCVeDJaIRi3V5fNpxBukvigCZ?=
 =?us-ascii?Q?khb+8Q+QeTxmb1lSYPtEu5Awc7qUlJ1VQ5y4PSxup7Qx8PsRJIbQPYlCh3WV?=
 =?us-ascii?Q?7nUV8LPgNEeEv73wbnnIBjrAAVVQ4SCvcjNhrRDV6Ibgf2I5YmeHi8A7EswL?=
 =?us-ascii?Q?w8rUPx7zc7SoMSO8A/1QHsQ7W4kdPwLRiO1Kjv1F9rLB7rYBRTqTLvpXmMcR?=
 =?us-ascii?Q?kP3xdlJTYAoFO4TjWvI/s7r81bIbaFt3flan0j2DzELbNVjour8xaZbONo1q?=
 =?us-ascii?Q?OweEgf7QpbNKohda99AcJB0ndaB0jL+ZPiKuXyXlfCLKd3HLPcHf1UwuAHFp?=
 =?us-ascii?Q?vaJ3nwmKlXxbzxVCfiYsPkhsc0ZnwMidO+vgjAmb6RwUeD9d5zT1OSOAYDnA?=
 =?us-ascii?Q?x9cpXelL639WG5uVmpuwIKSkfqTkedPvW67RYXjW0zOBSc/JBXKH1rzPOVsO?=
 =?us-ascii?Q?6WS8cyYXD8370dCyL8MVUdGOxuo693uKGD9Eqq3II6sbXMyD6IHTFSZzOaVb?=
 =?us-ascii?Q?kpzYge1r/7swUfOzb5k8J4MKCDhNtU1zq2OyuQiw0KV+Lrxe/NvqBBjrAg8S?=
 =?us-ascii?Q?Ld6KSxSxrj04A/tZLyOKfGBgRVsBtgxLACZ/cCvsd1JMgM5ztK5uBg2sUgMj?=
 =?us-ascii?Q?1X1rwAFNGtGpbifkT1TwUZwbBq/4pP7Rl8fGtws3qmBslVv4psCO0ntekTaY?=
 =?us-ascii?Q?QVCBViWSb1bDSLbDTPo7iOwb+UxZ8R15JdBAgAcHMOoVqBUfvTkTcEDbq0Bq?=
 =?us-ascii?Q?Nxk2W0MFUz3LCN0p9W3Uvc1Z2wyAossfiuleXl6tVO9qpeGYpzn6+qHDm0g9?=
 =?us-ascii?Q?BdOKFELIp0MWqnGAiF918pCUF8Ho80ZM1GV0fu6shjSe+eh30hLCEnnA7asK?=
 =?us-ascii?Q?/URbAKMDhgz1cfDwblIvVVHV48KXOjRn88CjuL05o61edHdlgkeq8LIbBwBC?=
 =?us-ascii?Q?0tf3S/+xO1PkFdTYe9dicddZLdbZoiSE395C/TgLbMh4r2fkNnd0RcxkJCcw?=
 =?us-ascii?Q?JWpaqiRonbc+xfDw9DjqQQd6kQwNgQlMqUd1PXl7nTEMghm6yf/zuIW/INSI?=
 =?us-ascii?Q?EV7Kv/BRBwaQphw7kytr72qQboNxH6160Z/YA/5Mmg2ep2S/w9EEDqvtOsm4?=
 =?us-ascii?Q?nzzd5JnrBjDGoGptDpyWZbNj981twTI8IjeJZWS/EMjQqfKyauq10qYoJ0uj?=
 =?us-ascii?Q?6rgIJzdoeetCZezuNCQi3sNPHq1MEC4ZlD/Tal19ZVoWgE7VzjSXz/1fM8q9?=
 =?us-ascii?Q?M62ljefBYHm5VLP7zcZCb6yA5xFLVrZylbMkNu4pphPxx/znVx95+hyJW15S?=
 =?us-ascii?Q?LGKsozu0WhkhSA9ZaviahGjpdfWy2d0P+J/1ol+K+FWD9D4pyNab4WDhDAXB?=
 =?us-ascii?Q?VCJURNeQ1ZfFXbFsdVffXTazC9U85v4kh9cggJQ2OEdimWLPo2Q40DZ5gP+a?=
 =?us-ascii?Q?vkRJYwOoX3ldbyDZEOwA4MiJsMThzJrsHo2PhbpOgKQL948rdZsW4HwRh1YK?=
 =?us-ascii?Q?s75Hioi7JOn0XfIrvQHEA5X4vrUxd5XXPQt16E3AZ9uUfyihRzXEKpou86DG?=
 =?us-ascii?Q?7/cGKwIJ/8Zus93KT8wKHjGMFmOMbTTz1HAqVyMU36GulZsvlL+X+Ca14GFG?=
 =?us-ascii?Q?Cxr+ydMT6ev9e0UYWwvsjM8=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4277b1-41d8-4c7d-8efc-08d9ed01f692
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:13.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vMczwr90DAw4tYhf9CWqya9SqWnCdt7T5k6mGm2yEoW6jPQMs0tY5ifOfqasEejQL3G+PIipmO0rlDlJvklOw==
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

Switch to spi-gpio driver to avoid unstable signal issue with EVT HW

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index b01f1e7adb81..3c54e4a892c9 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -227,8 +227,16 @@
 
 &spi2 {
 	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi2_default>;
+
+	compatible = "spi-gpio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
+	gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
+	gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
+	num-chipselects = <1>;
+	cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
 
 	flash@0 {
 		status = "okay";
-- 
2.17.1

