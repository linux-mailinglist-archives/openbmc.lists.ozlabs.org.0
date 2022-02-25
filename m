Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB04C3BE8
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:48:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z3G58qjz3bTH
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:48:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=pOdzFaAx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::707;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=pOdzFaAx; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::707])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywh3Y2hz3bP9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:43:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNv+2oXCZedAPNdhbjDdWBYYLY3gm2J8pU1u4luguAaIPD297CtV8UXBzKaUvXRjnV04BO26J4TfTzgubZtgUw7/vzLIATKCc0/s7xL9Fm1VljamHcVqMd5HGC8WPxh2PYRgrx+AydBmlK8Z9ptL4dU5aDX35Md/Ui2MpDBX4iyc3VJlLIrb7PYmSfRqv4miaTDqJzpm8Ht5nQyr8++7PvSDhCft+Tm/3GpPOBbkwtAvcQskLnqg9oL0bltlS46kXLbBQluGnQJudhoE8tFxt4PjApN2mnohK3XDT9s9hMQ7Iv/5dBKRWY3Vyc89eIox+f/2HNuyMruIDGWXkryN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4dcPyEmkB8QYlopQrzW6yan/+Cw/9oSveU99Rwmx+U=;
 b=KKIN8v5AOb1NXNWaS1qMY5pdTPEYfIK6B9nqCLH2Kq1Mfl8NpUIslgdd9IbgxmdaVudQpyUOHAkk0o3YZ6lUYVzXmGrt7M3Ew3GeY5qRR2YDN45lyFQb2eaEGq0h3BnJVz7DPcNgla7TnSOn6GNoStGi5ZbITzrf9sIWnz0QVXeJ+c/A5lmzqXBvnCqJS4jUbPEN4Bj7byBHK2DIF9DEd1s8umNCqQOLbYdsz0JnNbgUpsnsDeaDMuFvevoc9Xkb0ogHgMMOzwE4X9K52AG46ps2hiLlia1BO8Ydlen9XqaBrSYpAvNmzgM9CaoTfNInD3X6rNtz61Vu9zbyKHy3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4dcPyEmkB8QYlopQrzW6yan/+Cw/9oSveU99Rwmx+U=;
 b=pOdzFaAxP8ziMMEc3dqb8CCn+RZO128qC/G3gvhvIZSUHh2+lfhOyrINq/KSw6YS34JVROzkFJQI/db9Bu1XERtCtifiVEf6arj5NPi8OOygjkVahnF1dTuK+V9IHHhzA5Dmj4clqrhRWMkUIFd/++FydGlMGLGXmEwJI+Moy/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:40 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:40 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 09/26] mtd: spi-nor: xilinx: Use manufacturer
 late_init() to set setup method
Date: Fri, 25 Feb 2022 10:42:04 +0800
Message-Id: <20220225024221.19422-10-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da9cea5c-092a-4281-01b1-08d9f8087cfd
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45079B7D6B7D12EA57C99FE78E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ozw9qdUUpxhnqsmWcS3mZJAbEUl/hOh8/sXHb9WeXduKXt+NKVbT8vIMbCpjdB0qJGinUc/zQ2ZMf1IIQ1wqqFvST0ocqjlhR5rWszK4zbK8QIAdBfT98n6LPxhJqpJNxCHyJ42Hkhe7dPuiLJaqcN+jmhh3vYpKJTvrES2vdvyY9gEOZBsTV1GZl9CtzWv/oUs2YmNDdLhnJ7QEDixaaUEKDGnCWFSyvCelAZ4Wydc35xaOCi+qpEwaC5rrPhf7uJ2xWFSeVY04kueG6hgDXEEqLYV8kHFEgG3O3T43oDZwZPQp5rkc3Hzz1aKGRK6LWINYS3M/CKzdVmFQteZVF+eWQRJ3vvkBNoAQkAtLIBVyUh4xg6O1hb653P0s7ggAlbfydAHfqeW/zaMbAcvatpg3f0+MtEzEoCIDH/CY+8XDomugAhr7KQy6aBzGh4kEyddZc0hzJIG9C6+xDPVfprlR/j/zCcUimpKZPHiV40lxSoL6Zk6DBAhWeyulBKTvch0tWS/hTad5tDDWIWQnDuPfBr8HE6/LmJ2ktmOppIGfeYoPatOSqJpfy7GcItT67akxbdpE+eyVmi5fUfdNQjGTX+b2zvR6YOCBXtEoj+u3po7V7i0H5KOmGaMAKlDjX70gENqcUif7iFSVQ8pmBPdpSxNqaGz/fr1SUejrORycK1S3Ouz8tRCU/1qiYSEgvhS0t4p25Rm2g6rkbo5zRSly9PeeyLfs322Ibqz9pX6TsEpIcUR3qDL5n8a1T7X9BGlQR++3BmN8fnq5eZJM/p+OvEPVWD/qzkYkAHF3NpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n8yiEG2UKht16RnfV2tBeth69TG6/NZx9lKUJZ4UFFrMZNmx9PDFdwl45U3Z?=
 =?us-ascii?Q?Dzvs6u8R4r2fbkScx6Aik/wGoxcm2lGwWkwoB3P1a7hGwCCV+3hZFYQQuIa6?=
 =?us-ascii?Q?rzcsJW21J/hsKzggJLvtD4KAL8oaozX/20iJRtKqeJqX/d4qfITLT1gwqIJU?=
 =?us-ascii?Q?usYwID0tQUjeyCjSMqcMrsQJ5DC4MTe33FV6c0IMVfS2wPSdVocPDL2CijEp?=
 =?us-ascii?Q?4Qswmfdxwc57tD81btm0+wKV7eYgEn64uHLQFNq0fwFWSUXOBFRqagyPYmhO?=
 =?us-ascii?Q?83zI/brbm79QI0dwEt00b6WFOrDmKonHu0i2q/NqTVMlBeAzW4PHbolqSkFI?=
 =?us-ascii?Q?AW1Rjtrdsmc9mXqNa/vMLaNNFIFPKuDaF5yetoh4vlfvj8Gq/sywZxAxLbje?=
 =?us-ascii?Q?vP3xR+DjgZ3spUIClxUDopskSCZh/FwiJX0MRAFxNoddK3qNxo7oniOgXwgy?=
 =?us-ascii?Q?n5sf3oZm3vOu/glosYqVCuU63nNNKcs3jOlYEyrS8CHZJ3nHS1dul+oNQiBU?=
 =?us-ascii?Q?+HJu492RKcd8h5OFPvN29P8xbKrs8hGZ/z0g3qMoOcPK4EH/HsBTFQekEQZD?=
 =?us-ascii?Q?+oXja1GgK2o69YPaa2ADBQO6ve1CtxGc5lWjJJwv9+A9N6GjFOzlnQoviQ6Y?=
 =?us-ascii?Q?j4ANAzHeifR3RQincsaoa2vYHs0MKmQfdYAxp2O8BRc0q9OQNxOY5HuI8nte?=
 =?us-ascii?Q?qHulWBlcH6ai2ZvcvXWM8iNFR4Uj7SUX5jxMDoCWGZslyuuV39qdYKSpEZJU?=
 =?us-ascii?Q?c9Hl7PTCPmkrSwFsH8aaMOz0xSxVEXC4ya3vc+fUd8NDwZcE7PAvCII3g3Wi?=
 =?us-ascii?Q?Xwj/wr1Wy+6Ahlmk/39Juyx0VpfJuE6lLnIfPXrRaijcs/NScOa4jfCTYZCF?=
 =?us-ascii?Q?RVdv4ptGM6QUuOEkFOmOY6DGT3cTgheJJIfCEKE3e5Y206zLUtcmuK02/LzW?=
 =?us-ascii?Q?i5MTezKCDd0XU2OnEmJEbro1wgQPpwTT6RrLidKwA/LGPvptieeB0vw7/ezA?=
 =?us-ascii?Q?dkNlx7JZ0W9vB4BCYNNdWMrsT/wXplXEJVVYtRRXq0CS1nfGXk6lWGV8ESAS?=
 =?us-ascii?Q?6pXTRbKRpdyvsC3opQZ9QpiaP4hpM3ZIls1xFKIvybHEKY1Wdc6coAIelZOL?=
 =?us-ascii?Q?nfijbG6Wlr667sn/HKXCxaDQCwXxODb/cKshUbU9D1WM5sO0isiJ2qQY+AQU?=
 =?us-ascii?Q?s81kYlj+YHV4pqDBl37iFhnbnJfVUb9taKSitvYA/u6qOX0XvoKdWn0+FSin?=
 =?us-ascii?Q?vDIyQgK6Y4xMFbGy0ZkX5OKom/uw6mNg6w8vsNxcYY00t/zdH/e7+QBE+ihY?=
 =?us-ascii?Q?zFBMVS/MPCQVafGZMmk5bMH/60j9Vug+dhAMicLPsEKgqL2mKiur+DHZ0Tuv?=
 =?us-ascii?Q?F1rnIMkyd0qU0PGziwgf4dGR0l7jkDH26+yb/elnHtWPIrHfOo/XJIh3C/Es?=
 =?us-ascii?Q?hSkhIJoYPyrfXEEh2Al3YARv0rTED5Gay/4cNr5zUL9zABXBo8RhqSTZX7Ou?=
 =?us-ascii?Q?DkBlEZHnzuULG4YoKPfocvnHgeMwKCg5fYxMM/rH3tZWEzwSJw+Ie008tM8C?=
 =?us-ascii?Q?1fgYVSp4HykboP3YIbbITDYtGPmcpsN9kkaGDhrT0TkM0pNAta52nGUMJ0GI?=
 =?us-ascii?Q?3dV7HgEnhUqWoPDjzTIEANw=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9cea5c-092a-4281-01b1-08d9f8087cfd
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:39.1737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCwMHvZMV8SdAg7qfoMqndO8KnZ0b/eMktoJduq4eSYtBUNX4VEupAAW+Dl/Wg1B6ZOf3EjdVRJEvu5wVao6NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4507
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

post_sfdp was misleading in this case, as SFDP is not supported by
xilinx. Plus, there's no fixup here, just setting the correct
setup method, as required by xilinx parts.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-10-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/xilinx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 0658e47564ba..7e970ccf7903 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -80,13 +80,13 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	return 0;
 }
 
-static void xilinx_post_sfdp_fixups(struct spi_nor *nor)
+static void xilinx_late_init(struct spi_nor *nor)
 {
 	nor->params->setup = xilinx_nor_setup;
 }
 
 static const struct spi_nor_fixups xilinx_fixups = {
-	.post_sfdp = xilinx_post_sfdp_fixups,
+	.late_init = xilinx_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_xilinx = {
-- 
2.17.1

