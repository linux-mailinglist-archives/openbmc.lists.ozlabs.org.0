Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148334B40DF
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 05:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxrvh3xRVz3bPT
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 15:33:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=lb82NbZ+;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=lb82NbZ+; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxrq011fgz3bTP
 for <openbmc@lists.ozlabs.org>; Mon, 14 Feb 2022 15:29:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXIwBJ9UXbKeQQNkEhgZvSrAqZ+XSbnnpqxeV2pME29n0M1EISlWQaWZLo4bZ077a+yj/iqVOcdmh30sp29Y5i3MPm5wAWlWZbBQhS197g1ddx7qUH9J0M4wlolmX2ZLFC0t5mPEFjZXnc+pZyb902xycH4tNlFe4bEICm3Dd5Y34w3BxBKykN9oIQtn8PZ9sQkgHaFIbR7QCdO+UVbQo72RwIiSL9+sbC4RcuNGRIVR6VeY8qfDsGD3TzwzYPE2ZLCMWP90qWZoiPK2WROPXF7d4yIiSxQoMi6gutTwT8Qku8BBnzVrh8hB21Qo7UzW9j/gQcdvECVA01RB8wThNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP5HXQWNQDu0kPu93Qi/cyxG6HflqgTsAz3rl/SoNIU=;
 b=g5YxDhX0VHxta+DCXhdExlXavHM+Jc5AZF+3sOKPjWThaA+gdltQKCVh7mhUYaOfUHFQHO+XcP5cp4Wjf/eB+tq4rYsFpdQWrrFI8IFZgy8+eTAb4asEPEvoDCNCzaENWJbIR9QqKHdm5Tyg724gHRhvcGhbV6YDp9wSvYvHLy/JsXfJptfefj3Z86HtscoumjIOTgfCQiCoKFLmrm/4WZn/NBV/YHTMvP3Mxr7aMRdJNsthZiJvv0A75Lx4AUK+9jF1YBhSd0wayqyoADw3SBjZBsc8DQVsZADQnd84lRmFhFPmfZ82eE2PsqLGHD1jYAM4M8ue8jd14ZNyu4/+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP5HXQWNQDu0kPu93Qi/cyxG6HflqgTsAz3rl/SoNIU=;
 b=lb82NbZ+SKWRynucUykzPNIhBgo5eYkh7Dwjn1z3ILdlX11gcAvJbXBY6/7mpAfeNB4xNeZM6Km5AMoX1/savvodOEvy0sWFFW7G9Tsq2gNFrBXAfigPBad8VqL2cC6PLlJQoS5ATSCYUD7T12Gixo14Vqrxgd3oLfJH4NeQROQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2292.apcprd04.prod.outlook.com (2603:1096:203:4b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 04:29:29 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 04:29:28 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 v2 05/10] arch: arm: dts: bletchley: switch to
 spi-gpio for spi2
Date: Mon, 14 Feb 2022 12:29:07 +0800
Message-Id: <20220214042912.14584-6-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220214042912.14584-1-potin.lai@quantatw.com>
References: <20220214042912.14584-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc954708-0d7f-463d-85f9-08d9ef72964a
X-MS-TrafficTypeDiagnostic: HK0PR04MB2292:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB2292D08613053D97038CCDB28E339@HK0PR04MB2292.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxiBFE6KESrL4a2/9ajDmogBKyo1AXtoVlfUTtfkOX/SiS7auK/SOU226mBdQXjkMJPMIiBpVwBsdIagIshfaWaCt0BQB6KfgSOFN9c26jsEUhBACIfXmuvZ4073LqNOiy6e5lx5FmDMS/WvEOj2/klRTJXijvlmzrRxOidGd71c7WuyhwIyrPJISC5Bw6yz14MVtDZQoCqQRwwaoQlXAQZIiS/nFxylYVkdZgwfutslpVm8/v6IRNGZw2d3zs9LGWsyxoikHtkRkth+8U6po1694MLq3i0fGDtYCS1SUmJWSM6vgNzYmDyOCMOwnOX3qqmuxtgJfxDZirJ6mm4zAUHVho7NhN49YTFv1ShwuxBD7MrM7EzHeS5sYqcr9Bn5Z50BrC7yIwxYij4Luvk8WdTNs4BnK9pjj48jWJU+AImPLGYhDtxoVB5WK0VxP1wRDn9qePjF3wUwQKcOX/WXE7C6U9YQucqzkWpOLbgvyFKkOTCg3qNSJUfu8xfGOd9jlFhrYJb3zUWQFOqXfb0Ki7N8Vr7nGqa/iHmgpkird0ndCtmf6P8GPvSwmf49asE9irRSIE0AsAZ2pWfUnKNd7Dbpm5svtHEMOD5nHTMVpUCGIFE4lDloSyweqZFQy2WQ1rSYtPX5KROZGf+VEdsEwtSN1I66x/q5MUwl41i55TjOR8k321KR4I2PE9WQo3w9dn+X/8Yao2n8Ua/EShYdAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(52116002)(36756003)(2906002)(44832011)(508600001)(38350700002)(316002)(38100700002)(8676002)(186003)(66946007)(4326008)(66476007)(66556008)(26005)(107886003)(6666004)(8936002)(2616005)(83380400001)(5660300002)(1076003)(4744005)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?drlvV5Ee4Dqh3ftZIKNSocChhz09P6PP0bMwTm3N2LRu2OoEQJh4EpWsRJnN?=
 =?us-ascii?Q?cv7N/XwQf/yf3nlVjGHop2uCPH2SvswJLwTLVidFPsdR+xyyU5+f+8QjkdW9?=
 =?us-ascii?Q?fCOoa6o+rjmhTW+LPNP4KWZSAX1rwWDhPQzYC0h6znBOI6MT8BxpBcX5pAVl?=
 =?us-ascii?Q?xR1HRkGmevZNqOjaob/YuiaGfwjN1MO9+HGHOQFFpOJkajSta74MdlQTMeXZ?=
 =?us-ascii?Q?bwcbbz4kr0EgnSyr+hq6mHRW9Yq19vNvIXw4PbZPaWzCyKgz8Ys3tLgqGAYg?=
 =?us-ascii?Q?4Xf1us9Plk5ONtxOXbIQy3aNpJ5hWEzc1Hl0dEG4sQmlOpz4gARVi9bQGfGu?=
 =?us-ascii?Q?9G7+Lu5UPWNmh3Mi5N35K1JHtDR8XTXz5btmZG1q4fdnptxF9kNFdZZbKqDb?=
 =?us-ascii?Q?1uFeSAXvVYF7IRXPZFJJPdigGbaZsEpjSkm06SL+KR9uXPhk1RAbvWLfRZYj?=
 =?us-ascii?Q?aND+oep6pkhaHR0m7lCuaQR+8aBTJ965hb3lXwHliDwvUA2SrfN0NIvOP57o?=
 =?us-ascii?Q?/Ichf0hYH9BKdDy2ykuydcBdgKNuQj2IAfB6FBGQtHRd5k5NLDuH/NcJ0tze?=
 =?us-ascii?Q?L3iDA1euP466lsHd/1TQ0sWDaNMAFfRUY686q77eXKKsERv8w1D4eAry44gA?=
 =?us-ascii?Q?j+y+fUHzvvk3npkv5kVeTprNJrYpnHnCmk1lYLCb6Rhru9EjGNAjIoVpkkEf?=
 =?us-ascii?Q?ljeehLHXI2NX75P9CosTqTsvj7NLLLD9C1FS1JVB+cqOfqu1/IdKhbKv5z82?=
 =?us-ascii?Q?+cvWnAsRSNCc5nHBSDoiQ0UbNuFUOGUCRZUBFQLZvh1vsrpBP7d4G5PKOgNm?=
 =?us-ascii?Q?RghdhkpV5dEOf7foWhUK+Amf9Sw8lRHl3WBPeGZIS66Fu/4YNP6R/O9NFCB3?=
 =?us-ascii?Q?C9iWtdt7IL95lsSg9Pv6bvyqyRClm+RKywF7aiqF9uMWdDbY0jL9pzVT+yBw?=
 =?us-ascii?Q?U4J4uWEfZV+yJ3VkzJqUoCxZmBIpdIesV2JjOce3AHM5kdZxN7ZljsksOecL?=
 =?us-ascii?Q?vKqFhMDsu1sOmGHm9KpEGOECKg73hexj4aC8h4Rj+9Uc2v4rehPULbEixcFO?=
 =?us-ascii?Q?Gh3rfT047gRCnVVZ3P+CynZMttdYDRRNmKcDnk5dDvhA0d6z2l5j8ivp8q8B?=
 =?us-ascii?Q?NOIK1v37gru6fAEcFmZA4amwRDUyC4eCpUgFuk2xHdsDXsHuDoHzmvSL83Jq?=
 =?us-ascii?Q?PmZOpmXbBcToPJvRMTbVb5ZX5taxTLiSjfA1aLgNHuO0rEC3wrv2QALGoB50?=
 =?us-ascii?Q?guv+4XXhFaslesIRAcb9kMmcvbNBBn78t29xl9xWFRF88yFvMOZu+XJZJSgN?=
 =?us-ascii?Q?SbmRjp5mC0EEf98GymizReMOUfJtO9LABA2ucrwSo2m1VtzhWitaxMZuhwCk?=
 =?us-ascii?Q?vF1eylDr29NMpyUbc3aMaxeFMPpVL264d7YeeJ4+/wZLMIgNg6KwNs5e36Lm?=
 =?us-ascii?Q?6G94u+euR0FDvg5s+fciRkbRvLn6PU1JqnG7zaFi0gSfbQHXvDgs6y9qq4rj?=
 =?us-ascii?Q?/7iqOHAVd5zDWldTsCPrU5bJ2hrHIHx2BywfMAirkwe0YPLMLa1mx5RAr2Yi?=
 =?us-ascii?Q?KdFwAJ2S7kpEfUEAQZ0VXJR7H4wDuzyfWHHZxL5vU1+qF8isRWnAqk4Px+HI?=
 =?us-ascii?Q?MHF3sH/Gl1Luk5mBkE2wp3Y=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc954708-0d7f-463d-85f9-08d9ef72964a
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 04:29:27.7662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXKs388pBFvP9ftTj4dycWEIoDYx/qw76h9ZwuaIWzmEvDRkt2P+RxvgytPdWd0vm3nWqVQ3TexiNGLSXnznog==
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

