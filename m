Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A2432E03
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYNrk3SxSz3c5C
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 17:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Vo2/tuhD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.137;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=Vo2/tuhD; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2137.outbound.protection.outlook.com [40.107.244.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYNq869Bhz3cMQ;
 Tue, 19 Oct 2021 17:18:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLsNn+3aJXpi5De3l5K7lMLu4IzAlFoa39vF0JZeKB90n8OvdOdB2rfwP0duqrFReUSgDFQiMuULnWRcfL+mxwsNGBNtMMCTqKb86w6w2v0fC9Br5HSisk35X6r6rFYLueuQfOVGvXNn5CGmpxZAmqcd9Eend64QzWGLGyK3fu7AEqnNuV51q2/pwlxze68zEKcPNchxGxEKWqC4WhfJR6KBAfmC5IRq37p1ZDsZYM4hlHWXGAEwjvm6wjHxXmIgZg+zOLNmimjmJEXvrGenU64jhFASh2+3JHu/YqvfVfP+5hFM0rcD363Ae9Pzq7a2aokLWgdL0B+8Op/8dlAT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+pHeM5v9LBmTpc1CWSZ0bvBn8uFwJmBmWPVsn0LOSE=;
 b=Xo5eSRoKY7m/DnGySKjkh1IcCsPfyR/CHFO17tfMfWLO+U74mBGCJVoLEM1k4jRPbLBrtJdItBKvOvEOcSxWDsG5b+sWPKp7yyQHgj1Bccu/Wwve6yQaqMBInGlh5d2w7v6e9Wi3fn2wuPzaUNYq3p/smrhtjCxwpM44t+ZZgUhwejTYMUPZdRu/r12MWmTnfuyjXfmYsaogWOGOKUDkcjhhSGLAfzGKzhMQyYfphncOau0W7dwr6WarGStY/lGSl12RsNOvxGgUZeqcUVYEhOesomXJla+aHpt9n3Bos0K2wQqkdHRw9dkAqYMxi3eDuOYr86dC9j8Zz42X87Hpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+pHeM5v9LBmTpc1CWSZ0bvBn8uFwJmBmWPVsn0LOSE=;
 b=Vo2/tuhD3JU+kGqjmMFgjdPOfH9GzTZCDl1boDEfda3fBpN6fBtOxWC13r+VzKe/1MkWqUuTJcfu6l+dUCEWim1oRfhwN+3v9NzKVAS61uK0qlVf6zGndvFyAap8kddkcnJ3ODuspFMa0UVqSX0ZBEOnPMG2gbfRs2FW2pETcew=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BYAPR01MB5062.prod.exchangelabs.com (2603:10b6:a03:7f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 06:02:18 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::f14d:21a9:9ebf:2924%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 06:02:18 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v2 1/3] ARM: dts: aspeed: mtjade: Add some gpios
Date: Tue, 19 Oct 2021 13:01:53 +0700
Message-Id: <20211019060155.945-2-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20211019060155.945-1-quan@os.amperecomputing.com>
References: <20211019060155.945-1-quan@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
Received: from hcm-sw-17.amperecomputing.com (118.69.219.201) by
 HK0PR01CA0059.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 06:02:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f555f56f-5ba4-4007-e86d-08d992c601d8
X-MS-TrafficTypeDiagnostic: BYAPR01MB5062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB5062904F616B30D5345DD6C8F2BD9@BYAPR01MB5062.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhYl7qgwBiN2UuPB+4qjV7Pg9fE4mWm/xTVxRWH62AzNflpPLN9RmpNYeMs0aqR6HIh16juZYnNUXAIG+zUTolgGfAUNb01Ze5zr4IHY16Z3I8C1xqb3SnRtY1YvcWIoKdTu/A3p1hL+M3+y8KQped7LZfYmmwc5II7ga49dA2M8ouuYszFTYG49Sjylkl+VGKzE/f7+H1IAauuROnukj0njSOOnoXohkkDgczcerMxiNrmgHeEER71v5LPueR3hN+vMyobGxmDellZgZlqki0pF38zuqMUTmqOYIC30OvRmUZz2MXShuZVJn0S2NZS9BikPIOE7hjOX9J9MJgGjIcX7Ms+dv5SfGz1kgbmPzH6id8cTMm+falE+RzDt7Tkyugjdvbc6AZImSzSKyLBU2FSnS3K+YSzaUITfHGWCFimx9Pyw7hqDvDRURShGCfiRRoaNyPlqid5hTZ/8YQ9jpEVGUqC71OB86582m4IqfKVHfkz98ZaypEGGRiq2sRnbYtRQstl37SIa2mS4TMM9W4OL8j0Rym0e4YpdvTCfsf/XpxUUxbRkOkn4+fz9fgWoSQEjfQ7H9pBbeJggpXuq7ctVCVgmQ7fyiTyq1cKoNtiT28B+OViS1GVD+qkIFQOf4ZlzvQl0Bzifdq0bWqH9qQx1XYa1RDdrBdMkyXcTeVkfDWHddGbgTSJdg5Bw5ZW/gkNhA8KxXuAOEAxEBP0bIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(6512007)(110136005)(956004)(2616005)(508600001)(66946007)(5660300002)(107886003)(66556008)(6666004)(316002)(8936002)(2906002)(52116002)(38350700002)(6506007)(38100700002)(86362001)(6486002)(83380400001)(8676002)(186003)(66476007)(4326008)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HXNDnYBZS/a0rXqdRdq5gz0mrvS8XVOGzokDM1pmXpPXXwfStUmUttd3Sd8J?=
 =?us-ascii?Q?ma6cUApj2deSnOGkD3h+1PMml4aAzHeqJX71/cEh9a/8DiFyMLr3OBeb3VbG?=
 =?us-ascii?Q?M2DwNmHu5zP7vXymG1EIrpLMvVM2cOJQmwuh2xLAhMiIkl2qyPmZUPpncBIL?=
 =?us-ascii?Q?KCwXMQjo9nybWbxlfRxZOzhtLUkk2l/aRG59b6D6sjGtsgbPzizZvHip9LoN?=
 =?us-ascii?Q?2PYWM8bBXhwxvHKS15AuUSxQg/49V2zsi4wDLP+sjnte9QmeXwaw/clR04wg?=
 =?us-ascii?Q?jV9xTn8bVrxw+KJDabgUFRcez0ZWdtz5s/9eVnpW6cfPQj/cdxmBU4pN58j4?=
 =?us-ascii?Q?XJ1SG1QM/wBHzym6kfqEFkwnMv0bzscMdn5n+65YiV7i9Kxnc083bY5+0sd/?=
 =?us-ascii?Q?8HTf8AJt6vQChbzo6S3JGDv6kYkDh2kq2Zwd85fgUtLRPv289T+WvAIWjGqo?=
 =?us-ascii?Q?dGHLhIoEd7GdZhMiSbcy2mJnVePX3r0aaPBkg9JWvRz5Yp/q1mBE0AuYtakX?=
 =?us-ascii?Q?+qK6FFMekdxpPvhI5pKg8fnR/mkSsPBfgBQCOYTaSev1BK0vx3IlWmEEwUHT?=
 =?us-ascii?Q?Fvt6zJqFdyo8RffxA7TM//qZXHl6VJWnw30aDV838IrwkEhiYZ1i0HhEmtEK?=
 =?us-ascii?Q?Ztm9i4Lqr46DdF5RhRRMJ/1VIrTDhRWQhYn7nfj/761xhDSkmp/RI3uelg0Q?=
 =?us-ascii?Q?olHU/jIBxGJazyefwN0uyE/X4klnlLKunV+uZzrlWhm135iG52djz9YOSpBm?=
 =?us-ascii?Q?at9T8a+q1URKRhfr2uLqFFjzXbrVK8UbfcD4xNXe8PkoX1/1xr5xKJy/MVts?=
 =?us-ascii?Q?QDrZ4fdRBuA0t1/N2WL0PUlVQonl0a8PVDec2cKuWufRTSuHBiou9fFQpr6u?=
 =?us-ascii?Q?djXjRNiX6BEUwg3aY8f64ES6cKWKEQDIP8UhSqQk0vaylR4XSORRisVxTt0C?=
 =?us-ascii?Q?i/EpClpSuono/cg9vbA1x07X+OPkXEWf90Vgjh+ll6zVchQ4BYwKDcvivHla?=
 =?us-ascii?Q?whJW1iU554o3i5oDg3CeZUN80awN756GFGtkqU51NdMHM7pZMkbiyhuVrOq0?=
 =?us-ascii?Q?2jCBtENb46hwuXTVfgyZSPQpUqZr2etaj+87dQ/ly+sVVnslfc93Z1vbyrUB?=
 =?us-ascii?Q?3kU7YAqKVFkd/VsLtNHYssyKza78VABgQrjRpfE8sd0XF6PBVgwW1XzOy9eO?=
 =?us-ascii?Q?1vC6T63aq5nuuTen+ILJlzHRMoI3B2fsTFNIkXV6Zy2t8lgnl8wRVW78zGPY?=
 =?us-ascii?Q?lTZGzKz668E7O887RUVFwOxO02cKCd8oNLFojuqoiTCtR62hXlXiqpPdomKj?=
 =?us-ascii?Q?grn4B5tfFE9xDyY0K4rwi+1E?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f555f56f-5ba4-4007-e86d-08d992c601d8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 06:02:18.4237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TShy+pGIHUJ8wUxB8zqbaQ5CBMNASVyMbFII3PqXK1nDwCYH/6fNg/N3l7x1cNP8l4sKV22AhF9HDLBy3tfhMxzC0Z2geqjWxTWm1Ms0Fqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB5062
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

Add S0_SCP_AUTH_FAIL, S1_SCP_AUTH_FAIL gpios to indicates firmware
authentication fail on each socket.

Add gpio RTC_BAT_SEN_EN to enable RTC battery adc sensor.

Add BMC_I2C4_O_EN gpio to go high at boot to enable access to I2C4 bus.

Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
Signed-off-by: Thang Nguyen <thang@os.amperecomputing.com>
---
v2:
  - None

 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
index 57b0c45a2298..3515d55bd312 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
@@ -86,6 +86,18 @@ S0_cpu_fault {
 			linux,code = <ASPEED_GPIO(J, 1)>;
 		};
 
+		S0_scp_auth_fail {
+			label = "S0_SCP_AUTH_FAIL";
+			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(J, 2)>;
+		};
+
+		S1_scp_auth_fail {
+			label = "S1_SCP_AUTH_FAIL";
+			gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(Z, 5)>;
+		};
+
 		S1_overtemp {
 			label = "S1_OVERTEMP";
 			gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
@@ -590,7 +602,7 @@ &gpio {
 	/*Q0-Q7*/	"","","","","","UID_BUTTON","","",
 	/*R0-R7*/	"","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
 			"OCP_MAIN_PWREN","RESET_BUTTON","","",
-	/*S0-S7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","RTC_BAT_SEN_EN","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
 	/*V0-V7*/	"","","","","","","","",
@@ -604,4 +616,11 @@ &gpio {
 			"S1_BMC_DDR_ADR","","","","",
 	/*AC0-AC7*/	"SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
 			"BMC_OCP_PG";
+
+	i2c4_o_en {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "BMC_I2C4_O_EN";
+	};
 };
-- 
2.28.0

