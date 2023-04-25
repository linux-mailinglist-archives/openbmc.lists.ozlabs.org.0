Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3146EDC03
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 09:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5CZ344vqz3cK6
	for <lists+openbmc@lfdr.de>; Tue, 25 Apr 2023 17:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=WMtkWWXY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::726; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=WMtkWWXY;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20726.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5CWW3Vqtz2xbC;
	Tue, 25 Apr 2023 16:58:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFXeVE0fqh7P2Dr4GEMVw/ezJ75Rr47Cwa6NS32Z/qwkQQfJOh1zl29hne9aMTEsXFnp6/+K+UaH4jF0J02UfNmUDdbHDUsyjswrK6O+lS/FesBwFRbGc0G7F7Wk/T/72rQcLNySGYXKXqvPTsK+Hv98snNmrZcnR11/tyXlJFNOPdwQdoPk9zpWFH7GZEc4oG6txc9a9tOWXEb/6sXE3DzHW8RkFOkEsrQjLZG/EATrjE3rMRc/eBWpTTUxWpayTYw7cevcxiGyMLckL1lanXrM1Rq+kmtMcEWIlrh+70xSKTBPxQ8cQJS6g2VoUMQKr22I5SpCRE4SbHDhaJITRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg+cMoirJ2FrVqpGHaVNOdkm/zS+vXiFXl3xcs9AUMc=;
 b=LDpY0h0ygzA00JLJFcGj686BXkMkMu90qS4I5ayO3ZiRFeRPy1nXI9t0twKiu93FwTn7mYL4lzA68YlbvbMUL9xB2xe2WkRpYzOwN7GVNAgt5uotBI/0bFAW19sTnP/gtatJiCHMckr5Pv1QAr5fu4NgMe9slbHd2AVUpanwWeDHNDkr+gZc1KLq2mrYKS/xnOoKryx6kMKO0waljRhAbF+G7Vd5oXtcsYGKSisoXX2hkZYSOLZbYuxJH3E0JtA49N1pRF9OzUNwS1cnQP5iUygez1VdJOELGSckl124wh40k27p0bObypzKmZXOYnOJVB0r3Bda+QbaNIKpI3LjrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg+cMoirJ2FrVqpGHaVNOdkm/zS+vXiFXl3xcs9AUMc=;
 b=WMtkWWXYO/SNAlweBTtVcvZHo+IOC9XWQv3592ICOOJx+SJ6x5OcxYHypOCHPEaFf4M9FhVSTy29eayDW0iFOGB0t7hFjXgSNd1mtRhXpQ6QHodzdysUIQPXRPn15LEDP8r2fIVGzfQAoCXzTflGdrX6wgDG0IxUX5TeYZUV9JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BYAPR01MB4966.prod.exchangelabs.com (2603:10b6:a03:7e::28) by
 PH0PR01MB6504.prod.exchangelabs.com (2603:10b6:510:b::14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19; Tue, 25 Apr 2023 06:58:12 +0000
Received: from BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3]) by BYAPR01MB4966.prod.exchangelabs.com
 ([fe80::46c3:3b44:d2f8:4c3%4]) with mapi id 15.20.6340.019; Tue, 25 Apr 2023
 06:58:12 +0000
From: Chanh Nguyen <chanh@os.amperecomputing.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: aspeed: mtmitchell: Add I2C Fan
Date: Tue, 25 Apr 2023 13:57:13 +0700
Message-Id: <20230425065715.21871-3-chanh@os.amperecomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230425065715.21871-1-chanh@os.amperecomputing.com>
References: <20230425065715.21871-1-chanh@os.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:54::15) To BYAPR01MB4966.prod.exchangelabs.com
 (2603:10b6:a03:7e::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR01MB4966:EE_|PH0PR01MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ef7d1b-cdf7-45aa-c6d4-08db455a6f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MFUnOfrwP+ZxdqXfZdnuG8wmnGkYv6A4d4gFIC9M4IVH/L+K3Mql0msGjv9Inv1nJi6MDRrHMjy16Bgk2r1zFO68rLIrhmUGTTpTX1yycqENuWHherHERUgSH4EASgrDeKeTKx04efCQNQJw6xalSahjjh+Vu4OkZ8Uedkrd4P4i+/kFePAqOt71Yzdrzn6NXpb8Zsb9GD7L1r7dvjr+sKiChfPqZRvh8nucW79+yyTh/7ujRQ/0Dq5AGS3NAn4vrJKYWmO1i4/s30u1qSrqqWkosmhHvokpzKmCav/70f/K7djUv9rK7y2nfuPpBXRGyi35j53JlS50+mgm5cZnuKc+f+2JpWG7v8P6cvtvHjKwRzzaefyQFPlVGsOzD+Uo3K9kGoJWUrwV/zvYz2qVymmNrl9X/k5lTne0jnLaaeCKHM3+qzhyemBuZRzBhaCgPqX/+cOCeXIT7mQLzLhW8zsBVNtdw1VaDR9sepfMflG9fjg8th/+hLoQ4h3frc7Obg5eJfNA5ojTVXTibO3Y3naNw3sZRe3sb+NjEFpvNl4PeZg6WA2bgC3LrXLppE6Pfnz1QKaaO/J1pNM24M6hl3a2j8wG63kCv/CAW/Y8wpfb1dZIUJV47qqO9fs8JeW9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB4966.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(451199021)(107886003)(6506007)(1076003)(26005)(6512007)(2616005)(186003)(38350700002)(38100700002)(66946007)(478600001)(86362001)(66556008)(66476007)(8676002)(8936002)(110136005)(5660300002)(52116002)(6486002)(41300700001)(2906002)(4744005)(4326008)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DlUK6GN+sFpbmIhBR4vS6n4MCAYAk2gP8sx07yk2LcYy6+1lKDZApybFnUv2?=
 =?us-ascii?Q?7VXrc4ILgZ63xc93sClRvxLEyRxwxMAf9AFDwrXy798GHtK/PdMNBBnoaIg+?=
 =?us-ascii?Q?a3pSrs/E7WfjFb27NtdtGaktZlJOMkuZz4m9QKf/PUva6Ii2uRRsTLJLaD6o?=
 =?us-ascii?Q?u5GkIHMOqqLwWnpIe6iYjP3FLxgXzPJoY5pJQv1L94ARmarpujGNaJk7HhLb?=
 =?us-ascii?Q?XTOQcFO3odhJ2o352x9W+LdYqJESl0n08/ceisFej3QTpnuVjrKZnJOWBKip?=
 =?us-ascii?Q?HLYYrnb3SR9peJh1SgFPEfYdkvTZXTapzfepbBi4gbXJxvbP6EyEd1tia8U6?=
 =?us-ascii?Q?vltlEChzSdOtSdR2wFafWh6d0wNE1kXb7N1fUfxjYtb+zsZuM/iB3SprD7z+?=
 =?us-ascii?Q?v3FAccRv7HSr++IJJPuMcmGAUPNXV/x6Oi0Uc1PuA0VNEko8U1EcYCzfZGVp?=
 =?us-ascii?Q?Twg1bf9EoZJqA6boPLrCjZr6eGXW6UVRTn8Ay/hoCMXwl5/zFXJKpaBv0nGy?=
 =?us-ascii?Q?n11XP/EVZODVfYDM1BKfTuH/Sxw36a2bM++4dmFLcqFtP/7QnIZR7SGeBkw8?=
 =?us-ascii?Q?ADU+e4mbJ8/J6XzLE935ldFHvKudFCDB1hCPj578Kg90nUdQgQuD/XSvgwN9?=
 =?us-ascii?Q?NGsQz0KnbVLTaI2TwUMK645aQ9rB5RVlG9qKeoNCnROWrmRWThy9mnximnyN?=
 =?us-ascii?Q?vRyYMClPq6d8A0y6wneicizCh7dRmieYunJbqAVqHymklVw/6gU8mnnaMME8?=
 =?us-ascii?Q?1Ecqz9x80wUoKNwG8eM7ElgpICQNjByp3IvgE/y31/i/SSu+z7ZSDQK6V6iv?=
 =?us-ascii?Q?CVHgBzskPR/QYXBnLQCr0GNvXpfrnoxcRVbHQ/lRReAf4t8HyJUYzoaUY3NK?=
 =?us-ascii?Q?xZbY7aDUWMb2+I8VQKUc1tUXZpEaTT6UEykhN9wjykAZVBZ+kH5CSSqCwOt/?=
 =?us-ascii?Q?+uLu2SDlyKjUKJt7v5GLVMtqfZDgLT89cjWvj7haRvr3CIILuz9wt7PiMR5y?=
 =?us-ascii?Q?TUWDaFf/SNxYnVoix7ALl75ir0sSzFUf31gk5kYSlbLx5E1YmpH9NVuOuB5v?=
 =?us-ascii?Q?kY/BnxhyOel3nYSvAuRN5VjEkmeOYehYYBcBbvcFuFsfzRDbDMfjdVn16l5v?=
 =?us-ascii?Q?OnY8FTlDqHp1skpII93PyL4hguSFsBN+Zbrfr5JGwI6EIP2coPQVc4ro2wwT?=
 =?us-ascii?Q?3d/DZ4w1yWUElbeil3RZ7Xt8F9JuTplYsrHU2he9PBNv03yX2rZWntpaAATm?=
 =?us-ascii?Q?r8bJvRLvkIf4JEpBprVhBHDEl98lFt68fkEm65WY2NluEeGKyHFi3MZvycN+?=
 =?us-ascii?Q?B48GjarSw5ZOJVz4C0c4BdraIpwcsgvYPLm3YyQeHG4D+IuqckNLLVVaPy7I?=
 =?us-ascii?Q?MV7EaCTLyd6tdArmxYbGJYNSQS/pRwySjLzq2515O6UABU/WozKfJ/ZmGAyn?=
 =?us-ascii?Q?sSizNi/1iU33aZ/NgL7BlbRZtxjuUSCw9AKt2fZmC2iBKnOETHh8902NtJxL?=
 =?us-ascii?Q?TxgxjsHa//ppWZV03Ko/EpF9kCi2OPWzt8/FEOsc7sXMPWrrY6n36Iclnou6?=
 =?us-ascii?Q?HYNIUQaqczq6+WOT4sOPaW/7yX5RvoFNvu2NAyp6IMHd19Xrun2nlgrwqs1n?=
 =?us-ascii?Q?1xHU8yDgUFMtDlZIW7DaMp8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ef7d1b-cdf7-45aa-c6d4-08db455a6f86
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4966.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:58:12.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5f9z9hWhPNzCY1F9dXHzw8eSTz6gGcW5eKlJbFoEHbK5he2QiSt9PyFMWVwVN+GxCJ6YccXDGWLUF1hork/4b+MKxa9GKfytB/PaY2bDOyqKWdr+yzYRaTd9ifPyH7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6504
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
Cc: Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the MAX31790 node as a Fan I2C controller. It controls the
TACH and PWM for Fan Mt.Mitchell system.

Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
index e79f56208b89..6455cf80da0e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
@@ -477,6 +477,18 @@
 			line-name = "bmc-ocp0-en-n";
 		};
 	};
+
+	max31790@20 {
+		compatible = "maxim,max31790";
+		reg = <0x20>;
+		pwm-to-tach = <0 0 0 0 1 1>;
+	};
+
+	max31790@2f {
+		compatible = "maxim,max31790";
+		reg = <0x2f>;
+		pwm-to-tach = <0 0 0 0 1 1>;
+	};
 };
 
 &i2c9 {
-- 
2.17.1

