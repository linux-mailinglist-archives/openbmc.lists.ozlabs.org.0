Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD0D4C3C13
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:59:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4ZJ14t0rz3bVt
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:59:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=HnXRrnRx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::708;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=HnXRrnRx; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywq1jNnz3bcW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adtW2Vxn4QurVWrf4J/MRK5C4gGI1VPvUS22RrF/KxdjT1rcHsCL7Q/V4JLkZ9WOxlJIf5anlO1OiO+KQq4chzgCOcRdra0q4JpQMkax+7KuYSs8911dLCMQqAQjDdPhhCiMRyJ+hte/rW5vIAsY3bUmgQ/Io5CixRamcbymfDZk2GR03v9VTfH2Lu447HT4vFzkKFg+0OpIx/bXVsMiaZn2DiwBq7f1fmGKtHrE9tda6I1s9EL+oSlNs0JY/X2hNaHSegKflahB85bN62jJm+z8NrL3WxzM9hjKHWp0lASqVdRPYxyeRLCA+b6L6BGaA/4mxYUk170A8xyeLgrq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Eema2smL0aEXNIZ5dV1w9kJv161qYlcyqrk56TALLM=;
 b=hEcML00OmGxAJIzh/fdmyR02q0noQapLqkSZBVuv0+X7p71RUVZupUTqUAL7DiuqcPTsXKltsMSxncYX1jEhtJ/XShMG6EaBi3WUzE3TiuInNZoAZbrcsodVPJqsCZIoWpJYIXIWLOJAFZGiw2hDg9jx7jwJhsMS4UzRuWIJBeiplztxcvj24AujQSpGCD8DEn0kbheIG9eFjMHuTOxQPxXrleJ6f2+gNSrz5ISKXmE3YptOsxpR1blvy7uUdEoz0PkXR/UhMHp9v+LSBmDD2cqYn6GMg6nEYC/UCwdphIU3HWBo/AqKSwLezSVH8Qye2l0fqlK/Uk9I+8lSsgpCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Eema2smL0aEXNIZ5dV1w9kJv161qYlcyqrk56TALLM=;
 b=HnXRrnRxy8y7165U1pzgaLj2DLCe7odYD2fzmY8BdbMltmp4gKo8w6xcRyUDsnoP1bdJRcRmll9ZJCI3FjFhHFb5YpACqTsn2IQpXynGNKX/WCjUKhmjTCEKw3XC0MhCl3Hktkte2zulC86fUDtlbog8i8bzKsegGP52L5oX68E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SEYPR04MB5644.apcprd04.prod.outlook.com (2603:1096:101:51::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 25 Feb
 2022 02:42:49 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:49 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 23/26] mtd: spi-nor: spansion: s25fl256s0: Skip
 SFDP parsing
Date: Fri, 25 Feb 2022 10:42:18 +0800
Message-Id: <20220225024221.19422-24-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5917da02-26a6-4342-c23f-08d9f80880bd
X-MS-TrafficTypeDiagnostic: SEYPR04MB5644:EE_
X-Microsoft-Antispam-PRVS: <SEYPR04MB5644A81A793F234773ACFC4E8E3E9@SEYPR04MB5644.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DeHh+iVVJQxGXk7sebAy46L7Mr1pkLXt+IQ7RSqb8KFuW12D6d5Q14qbHBd9RWQZU/h5JoO/qCrDezNibLtozGyOty1ao31Lee2p/U3UJQhTH3om81Ad7zNqQlmS8IcOgtXjebE30nwJoHILt0/8tKP79/NAVAV/C9Rx2z3Adu8duQQb8DhyYtjLNfRGSoH5Yr7Uzt08hQyaqAkTG5st2BuGnRtEw3HhNGnVS62gHuLzXgQvK8/ImNZBmcsC8G6mFwkdn0Z5egtVrxFfIOU1RJqZcRThiG7/kFXuimHO2RPxj1g8ZPCR1daZyxX0A74i+xUlIe8tK9eP/3B74d+aGDBhTJT3FGm5XLbimyGS1qsG2hgXwnakfxON+AFbhsqdsx7dr0Zv1o8QZVmIZovPSLTSViTdL8DZpe3+jUNctRrLfI0uVeuKXujn8M/hdW/zsby1RA40e5WgqwGCSZKOCfvXn9VxkRfzRA8Z/8iqDVodcsFuEe34aeu71VpmmlqqO06hFIX9gCwpHI1U25smzpbDTv4UP9iWxwZtAiPNOqME9lq0bVxtFV/1Rv4PE7XRia7TMx+hMSkB2dcD68di3HeImBvag1DTP1vmvk+jh8lJCvVj/91PQHXAUtsKM/1i5yhA+7dVK8WjkKWOEgBSgFYNSP5U+R3aucdltHi8obDu6xLACmAwnc8BiEPxrLeBPc++eG27fsXwt1CTehOHrxjuHeGeS9PySy2Eij1VzIbjg1e0YAREuOM7/lhM6DL7p7guSuS2rIGAD3jsshH+atk2sHvHLGOWFO1QeLFeux8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(44832011)(36756003)(54906003)(2906002)(6512007)(316002)(86362001)(6506007)(6666004)(6486002)(966005)(186003)(38350700002)(52116002)(5660300002)(8936002)(2616005)(8676002)(66476007)(66946007)(66556008)(26005)(38100700002)(508600001)(1076003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?reu4XIsvZEiJimaPl/SsEbSdzYj0mqvido+VhjgYk7/wC5cdcxGV6M0ERUKF?=
 =?us-ascii?Q?4Iy02g/NCl28When6UR7YVOTr/LaRlHCeviFFQ0XxihCndM2Mcq8HYAvML+I?=
 =?us-ascii?Q?T76sGpYuLKXXJ5De3Ogf/ABFc4bG9K3Zwd0rnTlbd0+fZBPEWyhtnXN+I5Uj?=
 =?us-ascii?Q?8ZE/h36L2u0moLZZwhSNNFHZ63Yl+SNIRuWW74SbgO3lkj7z8b6jRqMR/GAh?=
 =?us-ascii?Q?nrpFwjVvaEtv74GhPrICw4G1AfgeujfWLD5X299HUOJobw+KLaeidjZtpODn?=
 =?us-ascii?Q?+kYQTOeYw7/4vp3zVjY2W07PjjO6hbwGLB1i98bMQM65CwatYSp8HDcX0FT/?=
 =?us-ascii?Q?2Dk4Ga+/V4sH2U20WxWInNgXLZPSkvQnpevGKAOX1nQCCNpdyoXxtquTPN0d?=
 =?us-ascii?Q?SSrujj9DK8fU0pRhIdEm585kU7AFnLmiJeMyzSDBicdHySQdawB/vZs2Y734?=
 =?us-ascii?Q?8gOcY9AmzcN4Tt/3ezXIZHF53vtgttaXtg1hxUzGzGWKAOtip2rE9THFSoTg?=
 =?us-ascii?Q?SBp4KLWPF6GnDTJl/O1U8HEiAM+1JlPShPeRNS7rvj46SAPhz0f6vv8SIwkY?=
 =?us-ascii?Q?ryQ6JexT2WZ75fTidD3o9NKoR3Apoj/rqX7samB1w84q9WFYwsAk4i95LzP6?=
 =?us-ascii?Q?3Am0pmHYRSrLMJ4WBlrH1FS1k8aO7b7xXS9ZfPznbHYOXVNhuI1sgLqxHPoX?=
 =?us-ascii?Q?18U7dYzN8fNwhrR/FJL28MAQA1fYs4NECC6GIyhmwsDkbn4AOf1KwHgkY3Wo?=
 =?us-ascii?Q?VuTSH8nzAW9wUXfPaWmtRCUvguAZpzFSk0Rd4GtA7I/VeOEazIvM7ueW8xA+?=
 =?us-ascii?Q?2VDOeWW02WbL57gfux+coBSyM3c58BH0wPbsmIsc6ZWD7vkEBO6rO5c+PVo0?=
 =?us-ascii?Q?46AucCOXoB7lU9Ur4AymMBhdYFH+pO8lQZLZ61XY8w1oVK99ts94i2ufRyQA?=
 =?us-ascii?Q?ekQoV8bdoJbfAvRbPSF+ktcOv3vX6vmIG6XmSp7AfEv9D3w3PMM3sPBpD2Ty?=
 =?us-ascii?Q?iSIh1cAzqVb8c86ogpG0EKumTPm90qzpBESASfnrIgVarjn41B+XNPaIkYNr?=
 =?us-ascii?Q?AIulb+tNDFkmLdUoXidZKDFJ5EugmbiVrECG+K1ph0N6WaZJo5Uk7TrdsqWa?=
 =?us-ascii?Q?mESqp8FjS2xNu6o0CMEfxrvR4bTisXvhLgEGgmGQd8yahx3vh5v5ZKU2cBQW?=
 =?us-ascii?Q?cP168xcFF7bIld7CmupC9zqVN0Fh1iXgEOvFwMp/TfT2kvFgSPtp/Muup+ya?=
 =?us-ascii?Q?Z5a6+ZkmLeMdTb5HMmOIDjG/+rivkrz3TNvM7n9C4MljO1jUUNamXpBlxdXU?=
 =?us-ascii?Q?BVSuDKdMjxci69rQKSIjTUxlmQz1iA+AooG6AMdusTJeJZKVvwWqgZMeVQtl?=
 =?us-ascii?Q?GJPBLI7+gPsjg3PYMH3fkI1YlRaeJhh/kZuOII6wV8YFZRcIV2wus4zucwjD?=
 =?us-ascii?Q?tfGiPa0Fdp6U0u1nVvXCXWLjMA3VeQzvjG6MYrI8lxxaCFVL8PaeQDuEjUGz?=
 =?us-ascii?Q?rOSjeUZcOT/mjbt9t4ENAaQUfYoqlY4ADcsenjETpQVYg49qLvj/sVKdD9WY?=
 =?us-ascii?Q?skFfzhnylFzLF3QTh7ST1zo396SahYymRxMLP2GxZYnpCSIqAdeMREIWdtEG?=
 =?us-ascii?Q?y5dxLLgSr1jgry6/C2Bu4ow=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5917da02-26a6-4342-c23f-08d9f80880bd
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:45.5013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDzauhMCvQ3sId8uN6un8PXkzDBZX2py6ZKoRgrz7cj9f5xboQxoxL9s89A//CNoR9Fi+t5DnPTxTNsqzFXpJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5644
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tudor Ambarus <tudor.ambarus@microchip.com>

s25fl256s0 does not define the SFDP tables nor implements the
RDSFDP 0x5a command. Skip the SFDP parsing in order to avoid
issuing an unsupported command to the flash.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Link: https://lore.kernel.org/r/20211207140254.87681-13-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/spansion.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index f2a2995a7718..f44401287811 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -210,7 +210,8 @@ static const struct flash_info spansion_parts[] = {
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
 		FLAGS(USE_CLSR)
-		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+		NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
 		FLAGS(USE_CLSR)
 		NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.17.1

