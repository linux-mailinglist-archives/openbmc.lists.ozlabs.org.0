Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B64C6012
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 01:06:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6LKB2lDLz2xDD
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 11:06:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TU25iR8e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=TU25iR8e; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6LFF0XX2z30MH;
 Mon, 28 Feb 2022 11:03:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSfOKkNEa1XLMehppxx5qAQVZnfDdTnI0IdbdOIc3Ha/yjSa/IhO9Hl10+oDsFRG5MfFrRirNgi7T7F5fcYzZyI8LOjakSBKSZ0lAIVKXDszOw1dVp9cLmg6bXtHEI1agply5ubLw6NLOL7LcQDCk5zeLdUwMv8UTMdnyS4xO8EmvEq/FyNvi/7DgEQb8GTadYg0H6A29AcWr/tnPETU2dZdQOHN5kgw0F7LMvQSmXP5Pchxrlsm1zoSTU3x6cEjS+ZPLXxibNti0f92OdiPlwyjvjP0zCP8auX8n6cIGNmWw44pHg5cUaoAJt7bZzzAsrd6ytEbTJe5W7RpbynTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxBHcP3EI1//yF/EZi96SVE0Lz9wdaxcLBrprHn/SKY=;
 b=EXwbKFnYo+AuwJsEyLSpNZqXCIuUkoJ3jGp4M7/0a5UtxjioxQjfaqt25sDC6eyqBg8WU7phYoyfHfaV7Z1MwspmnzR/k5SiMnKlnBVGohnioSlAsriUXjrWvNMr6b8YXzU0cdAemTkHIMlcus58td1WzPuSH00i0iuSWyg3XnB2/Tnn/EOOiA7per3ymWqBDNSxpHChDpMfU1pzMvqAKPl4IJM2c25lT3sPJCF+I17f6E8HfeFe5mpIGLxgounDpNrepRtERpNc87BLGA9zOsyo5kOtnbGu30YXorf/qA15RDFmLsvb3bI2aE1pepMnLBkcsJ5ppbVqr123IiNJ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxBHcP3EI1//yF/EZi96SVE0Lz9wdaxcLBrprHn/SKY=;
 b=TU25iR8eheUqwA6nlUrxb7i+dS7wDirmzLHkOg+jWBh07WoJsvSu3pc3VBuFHCAI60AQJYRftqBtxB44AgRpGUK3rw0EXOiAdCl2jUNGAEfjM7pW0syUUJlf3ckSUtT7k3Y11mzgIOPb6gDMXlf/mOA25DeJwyKk8BhjtdGS2PE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH0PR01MB6184.prod.exchangelabs.com (2603:10b6:510:14::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 00:03:17 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 00:03:17 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 5/5] ARM: dts: aspeed: mtjade: Move all adc sensors into
 iio-hwmon node
Date: Mon, 28 Feb 2022 07:02:42 +0700
Message-Id: <20220228000242.1884-6-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220228000242.1884-1-quan@os.amperecomputing.com>
References: <20220228000242.1884-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 261b7ede-8af2-4303-2793-08d9fa4db8e8
X-MS-TrafficTypeDiagnostic: PH0PR01MB6184:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB618438FE78ED4E2710B1ABDBF2019@PH0PR01MB6184.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JFhWVMa1dCnNTMvFGbe1iCIGCGcZnfW43fp/Jfaer/jNyCLUq+LM43DgNvDKqGIuH4mztdJv2e0uvCF7IZ8pNtkKuf8f0VsMP5CDhYyJffoiN4hmyiR+S/9YHWgZ6PK3stRjaGHr/9+TK2SRMukVS47dP9/8vC/HPD8vM2xCkAYWgCr87/AUDKMxvHCDtDqyGC81uMBkhmKlbNqqMxVnpDtJNvgdIeOlk0YbbfUpqv65xZkoh4b9jEkPjeoksTgKPxjllL1k+L772rc75F7CqoWlweIPqachDK4CE5wEKGtHnASLZ9hgE5Nm3NEQuDLcZhoAt5NBhCR7GnaME20z8N/kPQb17s3GXSJVqAep02HAxYhP3USux7sIhEX+OzDjW/8u0S7TL/k39BHgdKkbNg22Y0qBTHuBEEOPsSyV+aH4BradOLLjR+0mAp3eurzkGiFmHlvw9H1+3u7+LKK1vzaLgCU47XiulJ0xgysV2IQDYiq9zVtBPmKvBm/eNEDlfEYePoackzGe9WEsJV/xO/T4AsvztHCbnVcg8ZMtehTr2U1F0j1y9stjXNsNzpaa5b2aui0GJCi26V8W7io4Ve4sYIxtblNIG5st1VMTEJLDk2fI2c7KkNvFCHFjGY86ILs1KWY3ps+8rI8/XRa3528Bfn9rxASFXNbE5E4r/JQLjnEPyt8SuvTKsBK6/NV7HQtU3WsHIyzcteP/96YZZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(66476007)(2906002)(6512007)(186003)(54906003)(26005)(38100700002)(38350700002)(110136005)(1076003)(107886003)(2616005)(8936002)(66946007)(52116002)(5660300002)(66556008)(6506007)(4326008)(6486002)(316002)(86362001)(508600001)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LBjGZ5WyQfuS/7B3WOe5PS/d/+cDXjQvH2dh/ihIBWuze3cPy6ymagaUa9I/?=
 =?us-ascii?Q?3QcSOyfBhlQwlC4t5ez3aK0IAAFOphfIIMcxcRrBYpoRTUdXp2gU0k/4uJrL?=
 =?us-ascii?Q?co1iO9hVN+QAzbzFDQ6E5d6622jqUws2J/QA12+bElCs/xpRX0RCFi/KciCy?=
 =?us-ascii?Q?+XzubdPKzs+7gvqknHN78Yo2fs4Hh3rfhVbUuEFFZCa5x+f5Xh00OaU+pt0D?=
 =?us-ascii?Q?JddPxyXBmGj2Srgk8YWNYVarsRFrJ/kNJckIXE9F6BT0VgSOZyYLFYAa7twn?=
 =?us-ascii?Q?3zhC+Vcj2uS8uhd8S/C3bHajjMLH2X/YCZepyBBVA9yGO0ZxoKpHjMdfVEt1?=
 =?us-ascii?Q?QkevSlS4MooyKn0s22m64KnLrm68CHWJ1zDuVwXj5S9BlS3Tyh/9auYJQSG5?=
 =?us-ascii?Q?CwlGwgB/yvysk9iiTqIlcEVEq5t7m2UMgj7Ym0Ea0WA3BHpOJWVjb2qswd7+?=
 =?us-ascii?Q?TfJERFAq4dZXrDdbbV9TRSMqr4K721hY2EzUkQpNpbNOBEwC9hvQDDxt/Ht/?=
 =?us-ascii?Q?WvSTGjSXhZfskoSLewoN/NJ9FdjJiIiLH7vIf3gif0gZ0Vhy8WH7bKDXdE9g?=
 =?us-ascii?Q?2/hnkeOdxTWPaOPGa7ISTrLyXprkTRhD0ZxVxFK/tS5bSrmGlsdD9ho1fb3Z?=
 =?us-ascii?Q?uRl+4B53HhHhyZvkUGHHmtVcz5SRfu8QavImlwR+Nfx5rZ6k3DTwUfzmQbwU?=
 =?us-ascii?Q?vOlrrkUWPKiGfL0oy3Hm2TFS9ZCz6E1nvzbizWGEilDFVxF1Wbqb079JgJLE?=
 =?us-ascii?Q?YFa79F0H2PnXUM1tG6N6pZatrKFXq7F2PPtcv7wMU+zNnP2HrWqUG+NRYks0?=
 =?us-ascii?Q?XMFvzTEvnebr3/OoYGQgWgs4zymTWdnTQU+HC7U2PiJdN0Tl2FRqgkOcQKNZ?=
 =?us-ascii?Q?JcHZWJNI/I651y1AjQR55p4DxIQFyC76EeSiAN+qN9aBPyhRIEh4s9LpNelp?=
 =?us-ascii?Q?lXck+XOnyq1ysVlQwTO6xTwNm/tYYc2gBYWt0hH3OrQZ1fQyucRyepFYSJ82?=
 =?us-ascii?Q?WS36CmfO/4TRDxRk/7/KMmGvBDVigbUlz4FE2dYFsMWvyvjFeTgRr5l5izPq?=
 =?us-ascii?Q?rO/AnZb6q0o2333PezQZdleqrJ8dLDbPhM0qnUP1QZp1R2tzTfVc2Bqpqh9/?=
 =?us-ascii?Q?iEMofRjck9kR0MNBfyb1Iv6j/x5TZT9aNtzFIbtxrZWX2/3XHuBkDLGZotXV?=
 =?us-ascii?Q?P9mNXcPhTH/4S+PlejT70RDy1/ARdVFDFnqj4QIhXSfNAq9QJol5NC8puchV?=
 =?us-ascii?Q?0HYVCRreaweWWSzLdLo2wU1zjG42Uc2VWICOS8BVgLGc2KTR89Gik82GpUfe?=
 =?us-ascii?Q?A2OFOjpdyaZeUDNjybLi2MJKjozLiPASORk5/TIOhelFRoucsMbq0EBomybE?=
 =?us-ascii?Q?XWSpHJWWtf7AmkohdZ/dXgBJr5MTiXqZvgfxUYnRyfohL3ZXBuwwiK6TvSBf?=
 =?us-ascii?Q?usmE5BYSlKGctq+wxRfF9aUySCc5y9WVz6GmtNkHzr1TafdKPFh3W9Y4dd5e?=
 =?us-ascii?Q?u5sxGyKrXP6mULb8Iz1D86Wp4ZDcZ1JAhYOq7QM66yjHUoxsXrRJOlx5jg8D?=
 =?us-ascii?Q?GQW0ONIepeIlfe+sUDUWm6MLO2E6q+oknsN2ofjI1K/G0e0HotGM3Q23U1gG?=
 =?us-ascii?Q?F70GNnCn+Q4XDKXekfuCQBf8rNaYRdk8zSZQfSi7T71pgmNmDh19lvFVzhqm?=
 =?us-ascii?Q?AnzGv6ZvvS3RcknXbGI5hFOSnDM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261b7ede-8af2-4303-2793-08d9fa4db8e8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:03:17.5045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KM4WhP0v7fA9mahWs1h8zOseuyUKr7jP5x1cmSWluPeXQAZgLEjZ7r1hCQXTVHx+4A2dIXGb+g18muMalnVpolPIIs623Of+dj0wzH9vYXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6184
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Move adc14 and adc15 (battery sensor) into single iio-hwmon node to
correct label to be read by single application for all adc sensors.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
---
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 60b0e650957a..1b2e7ad37566 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -339,17 +339,8 @@ iio-hwmon {
 			<&adc10mux 0>, <&adc10mux 1>,
 			<&adc11mux 0>, <&adc11mux 1>,
 			<&adc12mux 0>, <&adc12mux 1>,
-			<&adc13mux 0>, <&adc13mux 1>;
-	};
-
-	iio-hwmon-adc14 {
-		compatible = "iio-hwmon";
-		io-channels = <&adc 14>;
-	};
-
-	iio-hwmon-battery {
-		compatible = "iio-hwmon";
-		io-channels = <&adc 15>;
+			<&adc13mux 0>, <&adc13mux 1>,
+			<&adc 14>, <&adc 15>;
 	};
 };
 
-- 
2.28.0

