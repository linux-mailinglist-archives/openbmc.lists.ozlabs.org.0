Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F564B40E3
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:34:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxrwT68mdz3bTn
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:34:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=TsIbHfAD;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=TsIbHfAD; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrq05QyVz3bV7
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9dkl+5lctiK82SSsNJKjBmt0fqRMrp9LLnqfhHM2JX1QnA2SO/xbdpc4I0UIkr04tECJR0FNeyN+0+xPQ7x9GOpKQHtYSbAylt5seq7gxq13xpwW9iGMlWJfyyqATEuL8bHzLuIbJHmaQIfx9wlRXdjrXK5k2pSJsBfKlZIvkn6Vh3Zpp7s2AFaeNTTSsG3szCQ1eAiDem2T0mMoRq2dQdenUCultp631OcsCzWFD2ACvs3hbURz2nGswAHodWlPetXv2rdF33dNnb8STvmjhzIrfmcGGV/g4TlNOwwCoBFsXhf60TRMfPow1cPV47Mu4N/gj1368wwtduAirVtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Lt3iNPXKIzzi2xs+5EMghw6HXh2oB6hYycNYkBAYNo=;
 b=k0CiJvhnAI9/hdJX7VWix02XejT4PDoyQgb6AlHmmdb3ZvzCycjOvYnt4bsg2tSbmxkiuuhfB0HqneVMEHtzGaU4y0lQ0r95wy1EszM7dkAtfLHVfjis8S+akJ0ncQmKgZCpVTsZlhLaW+CDuabUGVaP68Hdjbq8A3DPR1s5zzmMU9Ua+zdXCccotfMf85cgt0CSBv+lFp/2ZIurD/tIL149LExRQ5sQmwTWdONL4BhhJ4Vkt/v0es+14O78AkBZmKM7aCp9xXoXyiq3erHnB9OSDtR71czTYQyjQaOHZBGa9MD6RV/Bbno/dDnBrAzrRHPJjJCHa7QDwYbn0k+haA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Lt3iNPXKIzzi2xs+5EMghw6HXh2oB6hYycNYkBAYNo=;
 b=TsIbHfADGG18lElXUNxwNHgszhbSU0GINVMESzo2BR+9UzG7yDL90gjOJvC8mFkz6DbG9OFkwIbqnFZ5QWURYWl6W+wjNbW4UDl3EMir6RCwWeJyUXs/tDDYUPXgCy5djC9yHD4nueZuJ0m0U4CeEJgMQ/SQy2ibvMzBulZBZio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2292.apcprd04.prod.outlook.com (2603:1096:203:4b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:28 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:27 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 04/10] arch: arm: dts: bletchley: update fmc
 configurations
Date: Mon, 14 Feb 2022 12:29:06 +0800
Message-Id: <20220214042912.14584-5-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7330236-2bd0-4d70-c523-08d9ef729607
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB2292B8F51EF8B5188100691D8E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjOy4ZYgqFW0LBsxOQpeGFPXDjQF/ixsaz1uBQSY17xETQr/y5CQGlq2eHhGlLrL61PJNFC1Yqunou0v5VtBZsk7XF2NJ2L9623EypDiP7tu7Bf+vYGpDT3drXDMdEMzpsKnb+4lZc9WYeu/J7grTrb4haAWxhcMhb4K5/eFeu8lGmC6gwX6LEoDwAkR6MWAVj4pRZtgETiTK1NL8Cf47RlXhv4palE9fiHEZHZogMkS0TXVJTJJ1dxd6S8VeAcOgAsrknyIrBbcABs/Q0sTRp17kHUWxZzPDrmfaBI+WAIWWGxlx5TXCOVDM1yx9pLhWHqUEe/5Lm7wyV1aChiMSwXpJrqnh/RnoAOG/EqBRcXeTHBsJ0hZWg8m0z6QhVxLrC3UNP6Q77cVHhK/NJApvT24lcX7muy+rNUNgelsgMxNcaNLguK/6/iGgGbgF5abNQkrG72wIiYf2rwmdd0BBdO237JTdar8wQtnM1VeFv8+t09rZ/JprfkeYwBrG+Bo9HtNG6wXcbIrb8oyt122iayj67DYktTiIseHGorb96xVby6jZLT9i+Z559lsg/gAMPaPGeNRcCuAmdXK5c3YAjSNKsfwbgCBNZsJhXF06CLyH1iqt2hT2+JpL7eabu4EcM3J+Fjx9qeJm0vCDJekYPB78LbMQsYEcZHNGaX8uFeSa8ICYMXOnqnh2pJw/OpP2af/Not7oCMSHFfg+GeRLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(5660300002)(1076003)(4744005)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UGuOjD65oZFpTlHAAFXlyRqnQ0t0V1Ef7ejKnMTFiY0f1tuclPsz7ossbqnM?=
 =?us-ascii?Q?mUqLhckTtAcHNDwM1CzKTjzeW6Qy3SeLAS1Ows4PweDLYnPHX/6ynn3KOObQ?=
 =?us-ascii?Q?DcnQvfHSSBwwAdzLQhc5rlXiNchukuIXDjNA7oYmnlMiP9slzax5X/b0jmRx?=
 =?us-ascii?Q?q2C2VI80K7JPBuZtrqMmT6AHgt75HhhtTFVT8bxKW4ogPpITbhx8fstQWDzS?=
 =?us-ascii?Q?NKWuI69gGAq63Yn3KM110aOgqbHLlbP2KYoKsffX1LyZh705hcV3WV5EO0Wz?=
 =?us-ascii?Q?WKlHkr71tHQrgjPiHVO3JFpEfVe0Fx6zRgLSUJetVQrmCxBpneNdpy0P476g?=
 =?us-ascii?Q?pwkr89vjQKnQvHE5XVQ/cNqUn2+wCaLCpIjjld6bb1iNgmZQkyZ6TQ8JSF1+?=
 =?us-ascii?Q?nsXJjDFl0v4ipzsMxnbv3GbNxJaXfZDCOiVmhmkWhnTz2GKF1nUHbXx52grS?=
 =?us-ascii?Q?yNGD1v6q5u8HK8XG80htjNiSky5zPCRSUtmixzZoY761Sf+3rAt4wibOmH7L?=
 =?us-ascii?Q?TX56fM7SVCAuORQP/xvdhul70BJlihl9crE50aEYKLn/xSH+3jwsA1E/Vhfj?=
 =?us-ascii?Q?aZsWz5D4y3DaY8N1deqOvzcO79RIEQbyWX01XPWMuHjmpjvoz0ydujv4gF36?=
 =?us-ascii?Q?XMel+5cOxW9tTX19KrpqVqVTohjtaJ/WHI9YIsCvJcfasngR60G7t/I7DfqL?=
 =?us-ascii?Q?P8IR8yVTxu8pe0Chz8xmqpRsato4lnmhrAsuk7guWtS4QshFo6qfMZ3ucpfi?=
 =?us-ascii?Q?fOig+aSBvzxvJ+gGyJNkDj+kaLAPyNaxukZcpY99jFDColOu2grz+UppFzwR?=
 =?us-ascii?Q?8+ndW/gLUPoL3GIeEjaUqh2UYi2n0WYleU4Zn1cE2y1auufReuAKkIjA7O9O?=
 =?us-ascii?Q?0C+E1iFYHZYlrk9yiduIcwJy3GxV2tU04almI1O9Ay3S6Et3ZKFRQz6ohHFl?=
 =?us-ascii?Q?dtE3cm7JZrEM73R3AxEBJZ6H+/GqC3n8hWW60svO7UNlt+1xj6zXYIrdcC2E?=
 =?us-ascii?Q?UlgDngYbz3E768fc34Xa10l1z0D9k7KUhWGZEnAg+8sO46J12jzbXS0+9h1y?=
 =?us-ascii?Q?DbiEB+JXn7AlQjcUSa79juraYIGK+yZXxaWBPpvSnhONkV6hO8BlH9ZFDRSQ?=
 =?us-ascii?Q?4bLf9S+ZUIXz790bgC0q5lBIlOpCykWAcqSHTXNELZEoPqHP3sYjVdxrFwUl?=
 =?us-ascii?Q?4NzKphoUZpyts9gHbStf6jXOaWh0QwcMc4Lj22J0wdPlOTjnnpXk5AEMEUW7?=
 =?us-ascii?Q?NDi8SVy/bygR28ywXKiKaRYj6LgAlEcV3122hporHq6DGKELgx85edANI9hZ?=
 =?us-ascii?Q?uTYfsi7eYGAdYopgJs5nAhezyeM5DmrJQgVEd+ugyhQLcjic2AOiXGoLQUa1?=
 =?us-ascii?Q?jbGBKV20tNy8IK9Y1AYylxTvg3Fg77I7A0YxLES/BQip+RE0khdjOX6G2s5a?=
 =?us-ascii?Q?aqbwgqAjE1q59gbiGYNwE1TyJqFOLC7cKgOeV59Ud3zrCEkpsCynvZKCYiYe?=
 =?us-ascii?Q?PB7BBTHnE3d0RuTFH3zO+h89BE3ZGxHWHruDkt4KJYx4UWcx57IS4HQ6yQJA?=
 =?us-ascii?Q?KGjEzpX5QqInUdgfa8CjQc5zyzRq4n2Mc07ZRPYVkNokrHja/e4WndEchr4u?=
 =?us-ascii?Q?iBT6HODWeJbfCfAA7pOlb9Q=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7330236-2bd0-4d70-c523-08d9ef729607
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:27.3443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0PFACoEppZ96eNmUAQKOHL70gMC8ZewfAqfge48oPScqzin8mkr38aWaKI9iRP9egmkJgH00FLpKsniA5Kgaw==
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

add flash1 in fmc to support dual flash module

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index fc0690ccdb0a..b01f1e7adb81 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
@@ -217,6 +217,12 @@
 		spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-128.dtsi"
 	};
+	flash@1 {
+		status = "okay";
+		m25p,fast-read;
+		label = "flash1";
+		spi-max-frequency = <50000000>;
+	};
 };
 
 &spi2 {
-- 
2.17.1

