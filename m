Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B801D4B1BE1
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:05:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvxm82nSsz3bV9
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:05:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=Iy26vdu1;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Iy26vdu1; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvxc13MRkz3bVK
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 12:58:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYXNHbadvFnji9XtliuCzXxWczxK0M4KZVkO/O+yQ/o3ojHFIkAwJgKa23fex/f8+sPSOyXj3R38s5h/KPScgTveM1LTfo4u0MCKyyBoBYZ6pWu09e7UNRRPj59rTtmf6MEroloezAF9dsBoCybN+mXyvw8XO3p42zNFIVeYp0xH5e8q+9JdkLw4WQiZVt9NclKmALzAx2G8yRNQJon7sQhCWILFTpF8Q5B8YySpzuvUOFbTDOtA9g57p2ZNj4Jx/IMKBtoW1gRlvVXrdPk8gjInE3esWhQnmvSq5vYcDG2OSjBsflwDkabnsYkQ3yZ29AkLxlLG1kNZiMAWW2Njvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0989AQrgtAi+w58RU2gYi9NJlJnSHgb/LxQ+6jxmXo=;
 b=oLgQhMeJ0ak3B9t63Ic4nQHOfGdMLL0CizVFIwX/nL9sCk0goLRov3D2e2Epxt451nBIZy212LErzsMXjz2ECXDwWRS1VMuI1e5Gr55SQ0zJxOShpLFeUWd3dI2UdLNXEmqbInNqVFvKdIGfO0qH4lto0f+Rgl/CxMwzJkw9hUlHbrZKRqPKM5YU73je8I6MY53TFBEMFcX5Dzqa6cXAnli/sm4TqC2ZYBOFOztqz3XIMqPPB70WAmnjcjvpVyI/dz2w4Wn7eq7P/O5AAtqui1DHwah7stFqk7wSpaq81x8GcBLT79beQEMmkjuN6lp13/iMDjsl8ZN0BJ6P9H65qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0989AQrgtAi+w58RU2gYi9NJlJnSHgb/LxQ+6jxmXo=;
 b=Iy26vdu1woW6CaBP+9IJ7XY+XpwHsOAEsA4JdGNwnR8OvanqaO3zDnN3JiQ7oRARZx+t4FFaTwCqFDweDUEcIvZGBOrSZfvJ9L67ZMDNNRopNgcTQqQjrANfk8ptm8oRsc/FVhhB7EHAk7i/LC/20tzNgKbnbgBBOT5+5lVEqYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB4015.apcprd04.prod.outlook.com (2603:1096:404:8005::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 01:58:18 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 01:58:18 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 10/10] arch: arm: dts: bletchley: cleanup
 redundant node
Date: Fri, 11 Feb 2022 09:57:55 +0800
Message-Id: <20220211015755.27644-11-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211015755.27644-1-potin.lai@quantatw.com>
References: <20220211015755.27644-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02b07d7d-1a42-4d7a-a064-08d9ed01f7ee
X-MS-TrafficTypeDiagnostic: TY2PR04MB4015:EE_
X-Microsoft-Antispam-PRVS: <TY2PR04MB40159B8F4F7D2AC6566D88818E309@TY2PR04MB4015.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGT0m0qyqx/1wSxiyzbxVZXOHb9CaH9gOQB7UZLUaidxlGkPNeeh2WA+w/Z1xzNfocz32wwTd6BqeOtV+uQF7mrlarP7K4Wm2Khho0zqpjcmrRk8GGbMhssvoSTrsvYC2+Kz7gHcoxQUUtyBIQyV/u7A8J8poOvSzcvRYylcfXQqgHgKeJhHurqTeK/kMrbp0Y3ZMPpN4etRbIAzgmQpmC75Ms5AJg4crtDpFVUwrxX3A35DukLUqA2BnDgNg/pGDv0wqebJ7nR6WBEeC8unI1LiQaHLhYkJmSMWy1gP47vHZTtzzabn6RmhAA52+85zBD+tjAhxsLn9YnqK/bDtl1NXRg8mJ/1cMcSuzWmXsDpi0GrC5m5ETCZmlVnLC6TowATrNjVHuIP63+wFkDkWMpi4WUoiYM/CG07XXAEi+/ZV5O/WyQ1YHekaM9+kDwfz5aj+zc1UYifMJq8ANTiR3fIsPF8bOaVIcbtuZxe/FYoRWwO8oIBVwsJnIdamZVQuP8dZtRXk0xbRwSnx6qDAN+3fwLu5E2vxxX7jU34RiGzQSCohEs1Mleo0s/CWyuAz6sOus1BozFI5RkmItuRuS+wOy67UXQb98c/jz+hsykJlPV0OPDmZojYWqgyn0GNTR13JAH7IJNAGU9JzzcMdl4qHf4H+snpwxz0DrFLp/T6IxL08O8+zJejkASwFOTbrPF4xhM0b4UZG11Fe7Ppwhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(52116002)(66556008)(4326008)(66476007)(6666004)(6512007)(38350700002)(8676002)(8936002)(38100700002)(83380400001)(5660300002)(6506007)(316002)(508600001)(86362001)(6486002)(1076003)(186003)(26005)(4744005)(44832011)(2906002)(107886003)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3rtPAlYJj5bIjmpfFBuQeOqkYeaxnSPYsVXK6fGg+x99A/SdDjnkWUOpbfr8?=
 =?us-ascii?Q?BZDeYjLzovyyO/npeiGtacrHNYNrAdMWYO9V1yHkzBQ5j2YU+UunRRCdwIGL?=
 =?us-ascii?Q?LT2JJegzynUOsAOIsq24OdtNaN2adrW5MDg212zYImebleJ3OEyd7h6hxBOc?=
 =?us-ascii?Q?kByoboeISwjBqSyeplZkg4s4fUpdn9pm/V/ZzssJn31/vQBaW1MuH8+7YQn9?=
 =?us-ascii?Q?EYTo9zSJhpr9AZLG9MZL15DYAbazvE6IQDtSvYgZ0zeMroWxy3kYnFPb+K5y?=
 =?us-ascii?Q?y+lVAapiRdtw15wQ0gG65sJPz0710ABPLRbfHz5y4z4Ce4yNayPXR5v3D1Xg?=
 =?us-ascii?Q?he9L/uInzcxBZejtAvzmRjjQkLBDt8yTGQuFIxLqKvam/4z79F7V06yFTkk9?=
 =?us-ascii?Q?s62WqUmxGayptpvtnYRMx4wWxjuX3XL+ZWct1QkV1f+3o98ypTmjzOHe/mVo?=
 =?us-ascii?Q?iBuD473CKiwzk78fwS8M1eaeJJasecuM2eWkopdoZrLdEINdx1+M9JtL1mS7?=
 =?us-ascii?Q?ZrFCrDOulh3+27gxy7gt2D68hkU67/MUwIGKvkFGYCGz7xooa7nekgbD2PoA?=
 =?us-ascii?Q?kfKENaXs7jUXQrQdFtSD+Y0nxm0/tlEoYS947ins/JzNhJcamEzPIEtHnZpM?=
 =?us-ascii?Q?lYiaXymUE9kbf8SO+ZdE6W4r+3v9U2N0JDuR8k5VQAMnKcFpbTXMiL4TjoVP?=
 =?us-ascii?Q?SVm5E+Sb/ek4FQBrEVbhFVPL6yMuBnrEOE3bkQwKuW+gc3Ea9jmQgYi/LI+h?=
 =?us-ascii?Q?Li4Xxy7zKKwVclZNPYWs955snMJHe//SHluONkgSlxvoUoE94hfS5BdAWAzS?=
 =?us-ascii?Q?zYxpGifDkrsm7IiDj89O97OhvR56oH+pDJmZbKthrkE2ixWJMkWM8w1Lk5Z4?=
 =?us-ascii?Q?7PUHSX0MFc74gFJNRMkscbcRV109P6Fr6EX3WcI+nlFFJDwqpaoHFRbEi39x?=
 =?us-ascii?Q?13j0P0oslzrmujFAtqhMCpbWbzKAgK5F+530G9isWABPYt3yv4WE2J2kxMk0?=
 =?us-ascii?Q?HHCOqwKr0AaYAV7MD5IZxTmXKHnc4AwK8IicYLhlsTPnNWNi9NEh+lvDsQgR?=
 =?us-ascii?Q?uATQwmylN2jJ4AD+UC88AYQsA/9IdbznmUYTsIFZzJgLT/NbXAhg4kcDKxx/?=
 =?us-ascii?Q?Uoi7yY0CVYa1hFK6hJ+SW+IjlmGd8XSrNKAjuh9M8rFz1egeaJykTjv78Y8Y?=
 =?us-ascii?Q?4gTZ+HadfFmUrnYJdPWoFFp476JgYvQLKxjltCQtXvzfNZCBUZmO7awBPw8P?=
 =?us-ascii?Q?fCbtA7/4mRBmvMvCVVB++UoIgRIfCfdZEWoWG2I0KNLasM4IlYGFO8n7FG4q?=
 =?us-ascii?Q?T/mJX+4KGpuinRbdqs4E4yty3w+KAZHdf59z6/SRIIpotkG+laSMYFZXmauf?=
 =?us-ascii?Q?SsFEZFWIP34c9RwZzH0KNC3SZCsWjHz2/E/JxWuGg/G/iweRgPIR2m6K3qhq?=
 =?us-ascii?Q?oXa+KGmvr/EXPnyEiKA8DqW/7aaNrRmZMWlcIKytttveLVj5AImZwKNTSqY/?=
 =?us-ascii?Q?rnLCXbDnWEJzNldF8X/UXnj+IUBVKJ5kbj1hXdT3iIkQ5tuIMIFQH2Qt3ZxE?=
 =?us-ascii?Q?Nbn6jO3rzm8RH5QDwI1pZYaglXmDNUTVnivFa5l0y83cwcC1eC4gqzfEHHSF?=
 =?us-ascii?Q?UvQiEj/QbuCX8wSVwlad35I=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b07d7d-1a42-4d7a-a064-08d9ed01f7ee
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 01:58:16.1246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9RPzbAZ5YMha4SRO6Op95EtR6R8K2XbvbEso2sDNtznzv4fZ61iAmjF7UJhAKR7Jjnyz7CLGj/4/tSghSVEJA==
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

Remove redundant i2c1 node.
Disable in-chip rtc, use external rtc (pcf85263) instead.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
index 946107bd8bc7..fb62a67cfeed 100644
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
+		/* in-chip rtc disabled, use this external rtc instead */
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
 	};
-- 
2.17.1

