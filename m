Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D24A34D1342
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 10:23:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCVJ14ryWz3bTQ
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 20:23:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=CgEOdWxW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feae::715;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=CgEOdWxW; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCVHR1Jp1z2ymb;
 Tue,  8 Mar 2022 20:23:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKzFGQrApDlpLkl/WyAIVc9F5OCr7vzSI6Dt1OTgTgRyotXGU21e2CMrZOcaCqHvMxoxCx/GO6wpmNBqhjYoApO4Nks3o0caCAcErqESa4hw4aqlXUjQNCFDtyHJ4onTtY2kmEqSySTbYFZ1fsISRVKnoEpYDMHSIQ282mczA4CQoZuuIc6hifTixVzs9/f7EoNhiE/w23yt5AlQr6NS+/BrJW2olv5jYHB4N0rOK0MqkvIGg2HNeZ0Y/yMK0eigE7/QYd4R3vKSX/Yg3JyiMlbJhl6Nt1AAiP9fiSXrVr5QzZK6ZCsOL8xpiBk9Pj4wUFHE7RetICf8VHkOwedvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC2w7DMnS86RxCpDlb8R4qIxlLyZBo2ymKFWoAh4NCc=;
 b=DfNENECuhkHqBSGElUu4cTfnQ06MOkkJiEre/Mo7cCAnY0oMXfcfDxvdP4pDQkzDDLC/fZqL7G95zyZ6E9/eviip0StY1oWdRIDStX+9KAcep8GRMnaHLI7BxbjX+Tq2sftheXTqPbRXqa26nDpsGN24loPPXTyLTu8/z4m5SZg3FKzEAQ1zsOXqJayc6qTVJ8lvjC3mVNGQx1+UpPB7ws2cEAYVyYsZ1uFKkJJ/Fu7gCLwrubK56W4EK/H7ZBqwVP3uDCT/S88zJxXDT6h6RlVNB+M8YcD3Ksv24xOOOvu8bsAd7vfRf5glaAGuIoXUJdnamNqJTI8j2w/u7xL+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC2w7DMnS86RxCpDlb8R4qIxlLyZBo2ymKFWoAh4NCc=;
 b=CgEOdWxWHeT3H91vfdTkI4Z/Y9XbU/MWKQkhoICLrDzAsMFfcXh1fYInAWGTcKKQZh/Of/TMF5AbLY5E+t38KrKZps0CTt1Yu1OuGGpigdsLCcNAVtWh0z99kqD5jXM4tYNbWAcxxz7hjlb0tAcp10WU1rFEjB5Bfpf46S93rD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK2PR04MB3620.apcprd04.prod.outlook.com (2603:1096:202:3c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 09:22:53 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::78b6:1b99:df59:4982]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::78b6:1b99:df59:4982%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 09:22:53 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: Joel Stanley <joel@jms.id.au>, Cedric Le Goater <clg@kaod.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v2 1/1] mtd: spi-nor: aspeed: set the decoding size to at
 least 2MB for AST2600
Date: Tue,  8 Mar 2022 17:22:34 +0800
Message-Id: <20220308092234.5186-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e882cf04-275e-4d74-d202-08da00e53944
X-MS-TrafficTypeDiagnostic: HK2PR04MB3620:EE_
X-Microsoft-Antispam-PRVS: <HK2PR04MB3620C5CD1F669C8C95310ACF8E099@HK2PR04MB3620.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Fn7WO1Ag8R8GmsirFEcukXBJK5P3rRLkRpNjObvIqRdNmgAED7dkzgztKkdl5PTMQW+bDBrnM3UdP1QQ95+SVMGbr+FzLqbxNUfFcWNr42ucgXHAOggqheXFH47aLBZ94tHL/A0rSHVspXdQNwb9hyc66/AWC9DQBKlSZFaBsLiBguaNMy3RDVcQf9gH1wvQjebjREX/Wxwi+khqmkeSWzyqyJCBRYgHW4riv2nizDruoZ01H+FrCG7eFh+We1FNknXCacY3+O7kqfurvmgmxuJtqZhgAFYcBEzBrioOCEuaEUymO7RxMnJOCi8OAiwUpxys7qKSUHsuzyeZttsXHUgtKW2ZaO/gY5qJ9Ydfbr5Xh/zHuTSvw++Lvlkl6Is6ZS/GS5YM60PU+Oz0LwG+X02ysrZIZ+UMnI2V2aInkllEGgCUuJ04LtJP88t/LiLPdQc3ix5JZkGLz1hVber2KKIQtD9BTpOiZ5plN/L2YxTkcOK3woUtl7eBPtPnA6ajguO40bQITHhDYk2+JRHoiviPEOS2dKfoXxZjVYJKv7niBQSu6trMryKcWf4N6iZLSg6XKFwdUTfX/ECo2J31UhmqP1iODMUVN5egGKno04HjQuVmw2lzTcdlVVekyY8IA8wwLiOeRcB4IpRxrs7AngXrIPJXSHMJYT5ViIo36jsbH4zJsYyYFf1h9QFB7+xvH8DkRh5auA0C8A502HuR0Rpysa74EG673R8ZUCB1oT4zhcxMwxbcEBKWsvElaTKbB3LpB3gDtLtm/TQybRqRu00oK4Ne4qzNQ1sOZZ7oik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(66556008)(66946007)(8676002)(110136005)(508600001)(86362001)(966005)(6486002)(5660300002)(316002)(66476007)(4326008)(38100700002)(6512007)(38350700002)(52116002)(6506007)(186003)(26005)(2616005)(1076003)(107886003)(8936002)(36756003)(2906002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZJe+SWTA4i3CCEac66bI5ukSSyDxa2eM9+1lxMugi1UvwzuTJ1xye3I5gRLt?=
 =?us-ascii?Q?xqAQePB9lO9kXg8CLQsgpLZJd8Y/RPVVR2b5XaKMPmKjoJ09MbjSJsN/RIOu?=
 =?us-ascii?Q?/qdRayx11h+tYxqlEvj+KiLHTcsvxV6vDA5Bs2SzxTmeVgD1xf1088tSIQvE?=
 =?us-ascii?Q?BiNVnTz30AptdvGyWCPRB8QsEVcc5poY5X+YzePvYyWp/LJjw3Szwef5Eyaz?=
 =?us-ascii?Q?7v+IK14f/jcqxgpyPFFbmQFuXeoZHA8RWcFEFVHct+Nv3Kaar37nA5SAzV7Q?=
 =?us-ascii?Q?XLq6LgMW6QV5t23UhYXqF1w2eUidG8uljb6sjfiKvqJ95cOmLXxv+pbP+5Px?=
 =?us-ascii?Q?7m2SQgnSKZJRzFcE+pRtluwox0s8ghxJjyu0Y9jOTereCzgzJasbyHzlAohZ?=
 =?us-ascii?Q?K7hMPk0P4fmVH5HyZfZG6QmhNldgN2OqjQg+N8ikoZI7rhdFZ5TdrsFfGZWh?=
 =?us-ascii?Q?6cseOeVhqKNbz0pWi3M08gIv57T10xYYVuvtlQkzZIOyHpXVGNDIJuka38Ub?=
 =?us-ascii?Q?CEgi13naxQ3zu2irN7GwJALT4J+wlTFd5n1EI9mAzbL7kVF4j6//CwWfIx2+?=
 =?us-ascii?Q?0XmDhd0hfSzImwb8s/08hQncLyYPKVC7tBzbcg7+4g1fRUtoa1dqxlkwFALR?=
 =?us-ascii?Q?VmjNHfr4Bsvmy2xg7Qatigk5Z/Fqcws453BWPJWb6gEJ8jesrw+DdySgse7+?=
 =?us-ascii?Q?TJBC1bfLWACvlYroFMNWWHkbRncarPpHDVYHC9tv3pT/0/wp1C2H7BRth1BP?=
 =?us-ascii?Q?eVsGibIBl9ENpwAumHKboMazs6zC9rsSZ+ycK4NCP2LeV6PrgofldXHjMqcj?=
 =?us-ascii?Q?GxNwHJ6f+AWmtY4X9itxLEOxpRG4ICThcNKCJ9MKCUB9AShpUYZzx5pI08MQ?=
 =?us-ascii?Q?fWRb+7koXS56HrtbB2UH976tVIPdpKE+71tl3WQdxPb+lkvkM0jkr51IaqGz?=
 =?us-ascii?Q?UQLh5F+5aYp+n4P8kgLjpGwN3YEUtnZ96k0geUg+i64zDmXrwC+ZV95XaJKu?=
 =?us-ascii?Q?E0aX7dFm4yhhkFwtIBMH5EpSE4e6YHk93avP861yoj8yw1Q7t10vo5rM3awE?=
 =?us-ascii?Q?ALbEDURkS42bknJo7FRiM1BVjQlypiR+RxJe2mE0C96FC4Yy6auW3amSvolj?=
 =?us-ascii?Q?1Mg1iZWkUFQFbRK9sG3GNO+VrRdKeahK8cTAZFo1wy0mLdn+kh9l0RvkFhEP?=
 =?us-ascii?Q?hfMqzuHrkX/KWGLoFNNOushCaoXzDSsi3qUDJ//qQ+gyeHrX8JitK0msWQZh?=
 =?us-ascii?Q?qI5Vl1qCoXBQ3QZzIoK2Ee54cERM/+7zOtPm9SMwe7M8MqDeaZgfyBqz+Zt+?=
 =?us-ascii?Q?ASNdKJObWRCKwFVHuoPjexcUyhWin8QBPQLutY13cVHTUgIX07bKAHrZq4w2?=
 =?us-ascii?Q?xHu/B1K1d9jmrLiSHATE437m8Yjn0Xd3tEx/lFxEujKwBRGaQQAOBJvnLak4?=
 =?us-ascii?Q?BA2qann+Ms6u7ytNDhToYlZapSvbPhICMyjdJV4RdR2/o4ngm1xSvFhJ4rgw?=
 =?us-ascii?Q?RiktWI2gvaPcE0Fr+wIzdL0x/5ipz/oHY4bmXkDanIYE6BttIN5MuONCgqjj?=
 =?us-ascii?Q?KTP4gwXYlidQRreGo/VUd5em5jhL8zVxdCln4rWmaKFjLQCo+abC4gb+SxBl?=
 =?us-ascii?Q?w0pZ9Ent6E+8D6+78zmnqN8=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e882cf04-275e-4d74-d202-08da00e53944
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 09:22:53.6699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2pKLUe8Mf/xe6c/fUW9yxJRX9x7BPLxuwz+yYCRunZ1hKEUQgyscRRQ0K695AzoK8H+GpnlxehxAQg2SHC7Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3620
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

In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
address offset is set to the acctual offset - 1MB. If the flash only has
1MB, the end address will has same value as start address, which will
causing unexpected errors.

This patch set the decoding size to at least 2MB to avoid decoding errors.

Tested:
root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
[   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST2600 Decoding)
[   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200000 ] 2MB
root@bletchley:~# devmem 0x1e631030
0x00100000

Signed-off-by: Potin Lai <potin.lai@quantatw.com>

---
[v1]: https://lore.kernel.org/all/20220304170757.16924-1-potin.lai@quantatw.com/

Changes v1 --> v2:
- add fmc controller into decoding range resize checking
---
 drivers/mtd/spi-nor/controllers/aspeed-smc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
index 416ea247f843..74fa46439246 100644
--- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
@@ -781,6 +781,18 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
 			 chip->cs, size >> 20);
 	}
 
+	/*
+	 * The decoding size of AST2600 SPI controller should set at
+	 * least 2MB.
+	 */
+	if ((controller->info == &spi_2600_info ||
+	     controller->info == &fmc_2600_info) && size < SZ_2M) {
+		size = SZ_2M;
+		dev_info(chip->nor.dev,
+			 "CE%d window resized to %dMB (AST2600 Decoding)",
+			 chip->cs, size >> 20);
+	}
+
 	ahb_base_phy = controller->ahb_base_phy;
 
 	/*
-- 
2.17.1

