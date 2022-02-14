Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 842654B40E5
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:35:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxry3069gz3bTy
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:35:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=mu8imsoh;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=mu8imsoh; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrq211Mpz3bbl
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=des3WYMaIk3Qz/LjmdphyTYcVlhUdob4sh/vYUBzeQTudFtvx68jHoch0rps4eQJKdOxfO42FMdqaYw0LVbrgg2G6RG9jpnIPJiE1PeGDEsIr3eM5v0CEBhsgrdAg+0kFqQ7pu4UYOLcXiXZbJz8PcYxUAJ4YB0KezgKKZnQ7elnhlCaZQkF9qsYNtdlLqcGFVEDJgvglEjDadTM0FmRRG9DBotEu3tQ9nA5uLXoNF5ittDbps+i1H7W0p6nvJHK2PXZT5O1HEpw0cGRxGjqHXFGiBId5TPk/rkIStxNl/ZUIGsVRG/wJScw9zeSWW0uPKH18ZayZlkS4k8o3KszAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+PhkdPbF9OOYJcM+200PXMui6uN8XsO2KXH8pDU/qU=;
 b=fJISUwTXHrYHGImyuQ4M/B1afxnkXRWUnaK3cJsEybhaoxIvNmeOR30egHTuP066vnbwe8ii+m1h8a1zsFpdtaszTgFstkGYkEpkTerNUmiaQvofpiJOVEzy11+GUMzfXkitgvnCJKjdlk1NIPMgF83KQy4X56EbR95Ntiu+mkKYXoJTwpz9eAYPzF73ns4UmsvSbiHaH6d3rrVu5E11knS7XifbIpK7jNbmQLQml05CB3Eltb/riHfYUKEs8TjhDqIu9g9F2G0bvKJ+BQbz0j2Vr/5wrl1AWmxcKM/tGwAqq9ec8F2mxbdh/CEVdbm5vfu5QKU9LAgFxb75YfGM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+PhkdPbF9OOYJcM+200PXMui6uN8XsO2KXH8pDU/qU=;
 b=mu8imsohGROAolYCVEUmO2hunZ/zL0cZzTsPCcLIJxNMqlhuGYtaiKMwNuaRlSE57L8J0gw9GkN40gxZnv+fBzy2gaCabw4PGQinvatkd9X4x8zAfFjXCbRS/PSB10Y9ZMvUm6Z43yblqDgk0wgR/spK2SpRDiHtuDSXSKEr6dk=
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
Subject: [PATCH linux dev-5.15 v2 09/10] arch: arm: dts: bletchley: enable
 mdio3 bus
Date: Mon, 14 Feb 2022 12:29:11 +0800
Message-Id: <20220214042912.14584-10-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c7fc1b0-8b81-444f-2149-08d9ef7297b0
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB229291C1D1FEF656F082DFCD8E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SKUSJlD1k62P9blN5DkvkSQYtRr6YMZU0O/JIk/nNzFlDb21nnmofTnP1i8N9Eub+vnWQTB5nPERcG9+l2fBW1zUHFHZyy8ixbsCyG5Z4yxeDu1Rm8xUOEfag4L1YRAlWKO2byjpBww0O46oYBWhh4LckDdRBWoqwgdupwrP3knUP/QlXZBsEnLwyCGON8uwFzQZX5gU6sUHgS3gKXrlKiJ9hwgZXonvTOV4+hDXeMcd1ETYQRUTW4Vzt6Y1sUq3U/bMY3Flc/IiCS9pDQH+07nf1lUDrujNwXZnApCW5n2h0vYFRU/9yvKBWgqS+/z+K+OG+vwN4qWmjjESy7ofbitKXco6bkJecbY3Lc6y4yrMu7rMHJ/SDEjP/rGJrVbvF+YTmoHxUU4tralf/+O8j6PIkl1ACPfcZUtfPLpBpljCRYuovw1eM9QeEmYgH6Cuga4OW8Yw7Eudp7K5WYTmzBCFREg/0Nfk7DeiRAI7NLfIhwdZEL0vSaLSUNsdAx4b2AQaOaoffFXo5IXQ48m8cmTjN4KJ6NXzmkJZWvi435Uj/Or/h6hxYpPimPZ2wjFxjMqaGMwfis9t8r6dstFW4T58HD0rqoJHhpu5c4+wB2HTsXcEVQD3YI+I6oRo/zbXlxhkom913p1gAiebIyHvoPg+rOACEJEPrtGiO3z8hs8zHReFHAEHoHCaVKAK160SX5scjazvLHK3jsR54BybmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(83380400001)(5660300002)(1076003)(4744005)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8f7Xb6qr6rbqvpco1Q9olQNardPwaZa+tdgiovIldW4GZI7C4EP79FIOzzG5?=
 =?us-ascii?Q?1tsbS82dMwR6X82FDFzTXpexoIT9+HLO4OlBLKgIjo8cQMb8EPW+5QgYahZb?=
 =?us-ascii?Q?UDkqbcK6//2d5Rrg3ORlyAhhDNJhq09xFp9ihZO/EQJWHQKDntYbXnvzD/iy?=
 =?us-ascii?Q?VY1ct1OnrKweqTARFQfbfwdmSKF9qauWD597/K73TXE9pJGMNPDU7AgR2neQ?=
 =?us-ascii?Q?YVLTHBDOS1T1LPHoNxzUPPGlk8fO/KLlccerYYpKBYgyO/BjiPCQZll8eRQU?=
 =?us-ascii?Q?xnpN0gFnLch7mFhwE137JJYZfmt5zSKsQMW1mBiqnjY+AWgyx4k1aWNIn9PN?=
 =?us-ascii?Q?VomgIxTua4QPW1KXHHMi84TH5pz1OjqF8KbbzmlXu0X7PxCr0A6/7wMqS4P+?=
 =?us-ascii?Q?tv4jl6TBebUHgju2+o/b1qoFsgo5FqrhgmeF3HHPa8gAxro84tdQmnCujoWS?=
 =?us-ascii?Q?4WeQVZpSsC8ElglHJW530HSMNjYNJKKA3FlDv8OCdbf3fqRph4murRAIEwCe?=
 =?us-ascii?Q?DCr+s0pjbg8thBRXT8bXULj8awF6TQ8XPB6nEwvUS/7mORO7JJXdRgg9UF1j?=
 =?us-ascii?Q?fskYbkNNaTTN/rSZ/sKghjwDTdADXUSIE4Hp0qnzZ54awEs3VZJn1DKp4D4u?=
 =?us-ascii?Q?1ioQ2aXitg1kcUtSET8JNWOUqp+oXpXbDptajUNbYu5+zCbAlf0FXgwZLnyq?=
 =?us-ascii?Q?78ah5h1K3sV0qGUG1jNyGZLeWdQQ/sGg1NgkcYZHDJsjs1c0cYT6cBWzjjfs?=
 =?us-ascii?Q?7Bdq8v6QgFMsNaKss6I387FvsOd0/qSlVOCv6tRAjBcu9QutvgaD6oFlDByO?=
 =?us-ascii?Q?7PQ+cC+mVdHSaN0FBbXKLY+eQthf2Et6FmIHm+cwUssswpPl60lMOinGp3rE?=
 =?us-ascii?Q?TLCls3CToL/7xEBYDoDY1roNpa44USPnsjRdIYTy7jKFG+jaF05mPQvpwxkm?=
 =?us-ascii?Q?RGiAhQvN3OrwU3e9b1VLXHBuB6xLS5EHWzUEDc5sPfCo1/Fxr9+2hkqDGzdG?=
 =?us-ascii?Q?4Agfvk9JJYMNJEDAE02KR2FbAD5owEspiH20MeS4s6uaCsMcVohl9NlNzY9s?=
 =?us-ascii?Q?h8ZX8zPxAGXAnLgUKIBXKiwqC0xrdoHvxrHu926+S3gB/tHbRQUQ0j6+Qcm+?=
 =?us-ascii?Q?cAmA/rBWG+jO/WKmNk/hiFSXjZNATfFyqOi6eNBiMd52u8Q04XGxAj9CW1LD?=
 =?us-ascii?Q?xhhVD0lcrMzVfKpkT1uzclsnWiE62jSpZApCOs/VQKCoDGl3BlLcCcWsdy8c?=
 =?us-ascii?Q?Pn0emDnqkUofSxruFhtonjF7cq5ODXx/XbHGZhXoJdMCccCSC0UVNMDOTwVM?=
 =?us-ascii?Q?U6r8avYLMAl0DAmjhv2Pt/E86paVA33iUNT0LX1sHRX5HCb7x6iv+UaxJID5?=
 =?us-ascii?Q?mpnn7EjaWLYk7uwJp/5+P7CvH7Wl25tkhl3cA1cc/8mOZogxP22yygVoUnWM?=
 =?us-ascii?Q?MD9pmS68AtVjL/Qd3VHF2wKA00x+bjaFqtS5JMIb0mNK+3feAwfqcDyNjyc0?=
 =?us-ascii?Q?9O/0seJO0qjc0KFVcoxE44XhixMdYEtgpfvrt2h1NfA3yKFbwpmXw42DPCYo?=
 =?us-ascii?Q?qAORgpdc8dovwVc+zS0KFPuHNLQAtsX+jzBdD5ZpdwgEsACxWdXiAvmcAov/?=
 =?us-ascii?Q?6ymdJokUafTqd9m/ZoJ4SgE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7fc1b0-8b81-444f-2149-08d9ef7297b0
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:30.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJ/1Q3uvMfNZxM2Vzn1UdYt0eO1gVeR3BADDwQsx1/zyMd3DyE3D6s2+pjm2RawwD2cA5zmEgoD4LixYnYJUWw==
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

