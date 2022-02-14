Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E04B40F3
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:36:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxrzD6hSwz3bTQ
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:36:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=Q6/NQaz1;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Q6/NQaz1; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrq25y5hz3bY0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRHl8YvOOqkL8dSHA+cwLFmTQf99FNlezTdgG+wZZbclkQ/mLOiuxhsZ92ADdLNBbDcApyT53MalYyENhbk3ZACDXQLi5uvaD53f/bEBi9eR83c3lbiwmVYWwg804wdUN+st6OwGrbVob9mrJ2JAvog//a2uXuYiwujRFCLGQp4UMb+opIU+Ns5CZahyaXW4bfzBqi4dR0K4RH6uC133Nac9UcZUWpabXwOE9todRanghst5npVH2aaslS+kCYPO2MoqcrqZJU3G+sKalzFfMdafHxyHgE9uaYrimc4jG59oOo4HEcsPdw8RefQEadkdTwwHzXkpOsF+86J10l8yFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPOUxLPkgIHvneNPO+vh1qiWCiUwAAPBBO5un89I9W4=;
 b=clw/g07VFjkBIzoOJinGK9pDJlCp//Oa2eNyjhVhABZYw4qcf5s9UaAHA5ype5MiqW4xPamM6WvNXMcSUJ/KDzxI18GdbG1N3/BuyhcUT2QinRJoZ/ZF0k4dvaS9WKq2P1sAQLkg+5OBYq0K9oU7Ha6Hxb06tLPWRfXi6bK/rIe0SEAI22q9DYeoSAwwb2iw7cVBFikRk1KR+4BSVgJSb9p0bIOPsnMlS7EzLv/Nn8dszjFmp1hWKJilbpVlSL2mceuToFEhW8hh49/2up3EDjjd1X8PZo8sOqPbSohGoLpwvADi3bLvnqZKVpYXP8HKcu/CAt055p5EjyNpaFTMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPOUxLPkgIHvneNPO+vh1qiWCiUwAAPBBO5un89I9W4=;
 b=Q6/NQaz1cAELnZ97Uw3I78VACQAQN1QGqn98dnkJHL9BDQY+rKRXKqDEike2xnrKdUm+YTxGs7B2ei61qscQWc8PnOgCCu4fJU9ID3FbSCaoCZXGkFgUDcaJuLIHuzpUmKj+0ZbdliChEtiqqbm61hWkyg9VfOb9K3qXwZNle/8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2292.apcprd04.prod.outlook.com (2603:1096:203:4b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:31 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:30 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 10/10] arch: arm: dts: bletchley: cleanup
 redundant nodes
Date: Mon, 14 Feb 2022 12:29:12 +0800
Message-Id: <20220214042912.14584-11-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eff6fdb3-e3b2-4b4d-b93c-08d9ef72980a
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB2292CDF2F11ADDFC6451D3468E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OHnfFFocTHtNitJbQL6A0OWonlg8EWBUOPRGxHFHC3LKVidOdywjux8uuji1AFAqdf5Ilicaf4ttM0zhE+mnhdFL516y/S4z7FNmFnCaOVapaJ3JP5RYswY+NoryJJnDpA8XDLjOCa9CtX/zltog2QsLBaIKLmZ1etPwLrU8E4USOZmVyvlRJNIRG6pOt4D3bsr1pPFSVIYtzIH88Em+GLbZn507v0boVwjSm3meZEblsnMrIpY8GDrSM/FuKq/5t3Hkcz0BjCtYFQERi4sEsmg6NK3yWm4e5mWJio0fPG8pteTdrEQMGa+WV51X3L8EMJ8b4cGtQs5gsHmd8aooR6GQyWgBRMxs0iPFnkNjBPm2BCs0C1c+Baq3P7JECMOPrQWbsZ18jfGbF1V5yo9sjjDde3sVPogWiBCSvCBhlMlcOftolQhDjtgNEZddMDsJwyCAj+VFa7p7LXcqzWBklDloKPDlG/rVfEaxl9ExS6RAA0ljZDKjFL8QESP19xoPmjKogH1rfk8xdWCdfSnVddoAgq8nPeKC3oJ3BePfIpb8JUPvDQUV8Kj3dIXpV7rOy7TolxRO0aEdTFs8s4cLwdS13NqUGgC9rfqbYZTs1fOShLd960AWD2pCYj7QbSO2+scyfvnt2B9mXS3nYglSRAzK+WCBSP/wvpkxQR6gVs66yl0dqh8X19BBykDb+/Guo39q1FANAbhmKSq91/TYpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(83380400001)(5660300002)(1076003)(4744005)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/28LvvyZn00fcZ37ISa8tH/rZ6exelpNu8ZBBGhcQ+gp8qHQFcyp3yZYc1B?=
 =?us-ascii?Q?mzG81/S90pwydU2MdTIOA/Wl6pCRia/fEwSvBE222rdm7x3TRNfzq1Sm2goF?=
 =?us-ascii?Q?9ZEDvXDoC6QJ43WNd8baPzmqrWBoGOKiqTWjoVR3Qy1ipGW0r59iUVo1006S?=
 =?us-ascii?Q?KdfCCYeloBcOHyPOrpvAgiZHZXo0cBSdRiJjMqKpEwaWf287IjUzcdNO5pSc?=
 =?us-ascii?Q?vfxJRzKZ6+OYViS8v3FIAxjsYlCPnvcRZ/C6ljluvip/QU1jdOwwIOhk98jB?=
 =?us-ascii?Q?gf+iMP7P2UNrjM+Lp6V7Wgh61hV/GO+K9nLzc23riXR+oUaJI7rP2E7ocZkk?=
 =?us-ascii?Q?y6otPtPR2uzdWeGzwB9sZ72t1b24AyD8AM42JyhObwdJGFmJecU05mtSx+le?=
 =?us-ascii?Q?t3i3t8bwneRYKHbQCsZaDDWx00VlNPrVRjvbzE1FjQ+7FFQF58TMYsid2tOd?=
 =?us-ascii?Q?Hil3eeqMVh/4I1KGjvoiVKPTd2ZZk7cYTX4rH5Crw9N0UtZb09fbdwvh/BK0?=
 =?us-ascii?Q?tKBmJBoDEDO5XbQRwPctxHoEMghzRl0d1AA6BZr1HLkwa2R3ZujlBJ+APfd2?=
 =?us-ascii?Q?/P+jNfq1doBp4yb3yoD5Mk6iR7dZJHTe2MACAYRq1XsEq97E5Vt6wjAPE34R?=
 =?us-ascii?Q?mR+1ifuuz9xjXDKxuOMNuaSCimxhQ3vYdJsi0OIiVVEuyRfw+zSf3JMAx+tr?=
 =?us-ascii?Q?xGW12XtyYAsn162NawyAywAT1bI/Aila3HpQ0AnzwsnsQm8NlFwz9wlEUTmP?=
 =?us-ascii?Q?uWZ8B6dnTwF1tM7O14bzS8SFxrWLUzaT72dgxJGcjV0SbL/bITNLpyqESLzC?=
 =?us-ascii?Q?RzBnqHfveWWwF8tXbBxbRLv/yDbt/SXzqiyqdsBABQzurYaO2V/vucrkJPGA?=
 =?us-ascii?Q?dPq9WeCiTXvDIUi8PhKwfiWtUBlhTiKFnUEy+35WhgZr1tdW0s5eWTGLgjiu?=
 =?us-ascii?Q?tlaXsRJ1kRB10vDhDUcoCFZx2xjFzkPQU7bb1eaJRx3SbSKN25fy4H+pCXv5?=
 =?us-ascii?Q?dawkKGLZmC15d0tlyOLhR/2c+mqgqr+7WMrHxK8xMXDXVGTltXqIjeuMOLMj?=
 =?us-ascii?Q?VfvDWip62YdoUCzRgP9AkCUM1PKNeW+vPGQT4y78iKfDPlMDqOGAsdzLmPmX?=
 =?us-ascii?Q?UlhTNn4FdY4DRbycPhSsNJ3LSvzJpy/xP6vi/REVmpEwm2cXumeXTrFvggH/?=
 =?us-ascii?Q?NEpCVxhJU7hRajSE5gT+5ag853APSqkjhv/6glZkcowyA5jckZ9JtiOd/GXV?=
 =?us-ascii?Q?eGZChGngSjy7xTTDgQ095uiJ57wjJAOiQf9QG5FnIYOik6GjDVHTudahX70D?=
 =?us-ascii?Q?1UrgJOqz+XxTCMcnycrmhegYR62s01sWv04xh27KEPUY1KJWPVKMBbbQ09w9?=
 =?us-ascii?Q?FeYVCkNpE45iTkFabQOm8UylgrNtEJn9lRg3rwcTETVOyYmwcss7Tmplj6Sc?=
 =?us-ascii?Q?Off77R9EBEyCmlT5+5aH1V4vjt2JRLty4C9NCFQ6kWFXWkmCzaNgWLrmAgxa?=
 =?us-ascii?Q?6OVZnMUKhIsKXxCA8i6cMkGGqRPaJ4Tv9zXgUk1bf6/MUd28V1NWnoi6103p?=
 =?us-ascii?Q?9hKWtVYDD0c0DYIjV6iHmnUDz1pgCwctAz2IKXzlzA4GRRfvSuGP/nfZDf3A?=
 =?us-ascii?Q?XPMJjXejFwVdq/0QdQ9wg08=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff6fdb3-e3b2-4b4d-b93c-08d9ef72980a
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:30.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mxz7jbDT8Qs3uPWAbU5FueFneoBsErtmrXvpbFwqrd6UxTMpXC+KNuNaKGKH7sGhJCR7jJbh0O67wHHKKg0csg==
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

cleanup following nodes

1. Remove redundant i2c1 node.
2. Disable in-chip rtc, use battery-backed external rtc (pcf85263)
   instead.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 946107bd8bc7..52201c6a69bc 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -205,10 +205,6 @@
 	};
 };
 
-&rtc {
-	status = "okay";
-};
-
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -387,10 +383,6 @@
 	};
 };
 
-&i2c1 {
-	status = "okay";
-};
-
 &i2c2 {
 	status = "okay";
 	ina230@45 {
@@ -680,6 +672,7 @@
 	};
 
 	rtc@51 {
+		/* in-chip rtc disabled, use external rtc (battery-backed) */
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
 	};
-- 
2.17.1

