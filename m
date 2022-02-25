Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D874C3BE7
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Z2S64rtz3bYh
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:48:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=cSNLx8qP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::729;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=cSNLx8qP; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywg5qVnz3bP9
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KylIoRGM0Vz++edb7q4OgnTaGJKuEzlmqknQfb5UprcthIK+HYG3ZTtqTdvZmMeQ4Z4th6rA/RyejkHromi0EnBeq9ZCnrq36uE0jT0Jdr9rdlzo3o6JDvZXkZskmvAdPHR+wsDaWLfznZo9jPb4FFQFmYfUcBdgwUCGAOQQ+HRqugTiGgUfPOK7GuTtgyMFNQZg/QPLJq7GZh/+Ev7ad0zeFVKyvA2628jOQ7E/5w55gdii5Yimx/jMr36WDs43f+6UMhW7s/IoLKFWI/xNIS/XC0rSbRnDaZYKtJXE3oIr4kJzBlH9ysJKunYw1WMwGQWTV42CjUm4gIguDI+nnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lLiC9ku/QcgnSXYJ8vBXU4C95DgLsyCx7jWa1YloZvM=;
 b=PhgBZZFutgBH/0cmQeh0L24eyjVtO39mPKQXnz68diXWqJ+9DYEZ1ZbT87SJzIU1+qYK2RwU6ipD2F3kkgaaSON2PCQ1Q/YcBu/EjsXxLVpymh7rpkdgxV3nE2v9aeUuZdaZQrGI76zDjuk61uTLxjsU6FBhNkZ1LVKbNR/czGVk4uppMNctSMqo3Ki85069D6HZTSCC8dS1EDhDXO0M/vmiWCNYBYv2mkKssvKYdp7WPEZ0tdw94e7cLyIsjSsv38Vb1afiBUP5j3vpdeI4/j5LtCv/Vf1rtyyA1Q0J0AjKeT4U7YuKvMkfScze/TounDHsf2UdjGh4EUiMqjS/Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lLiC9ku/QcgnSXYJ8vBXU4C95DgLsyCx7jWa1YloZvM=;
 b=cSNLx8qPjpgl7xK10E9tUhks9MiXVAHinu1BEa4DdizAXWlBXGye8c8MKUo41iwmhCsqo3rptiHCdz8mN0Y5viYiyOPMRwsHPWqZHOED9l5xNFx6tDVwMBFKEO/pEzbeTJWIg9QPD8JBzig26XyLQX1BnYmegG3xoYAsn2YtUV4=
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
Subject: [PATCH linux dev-5.15 08/26] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
Date: Fri, 25 Feb 2022 10:42:03 +0800
Message-Id: <20220225024221.19422-9-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39ef5902-e98b-4ed2-8eff-08d9f8087cc8
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB45077FD6F21D4F1EA233C7398E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxVJ8IxwA40+8toMtZ5Oex5cRGC/GFaARtMMyPacMQamskHyV1y26YIXnC4Eh5FB/QOS4zQoNpU/OCXdM/Fku8Ieg/3U0q7Y+eSPgL71yE7lzv1+vCAAz2pCNOFx30kfylcrfp6z2rkYKiHAoAAHeTXNJro1hMyMtCkIXfmkc42RdQ/033BIJg2QFC0WT5ctHQY5o5n7MPhwiMZxZKQRgNRMQ3yd1xsS4SVR1MjwNsM6MPj2D2JPwvM3A0uuzpBNlsW2RdMKbGgoZAWbIf5jjna4Oq7ZBW8OS/bsIEBLtpD19pWRIMu7lidWK2JVhV/+ljXg1SQTxvlIpGz9ablpGuMLQ9bywvulzf7i6cphh9WdrauK4J6EascrcbFr2aq9vKlInkFWWCeR+u/Ysh73xvmJBE7j4oNbC1fVXWGooMU4VPcBeZiAz8mMO/qy09Ihgt6Q7wYcPWhK7i8E5teTqlLO1m+R8PasmU0qNa5XpTYfrE4DVGaIyFp5A4Z8EGCd+TneC8rNHjhBMBa0Tt8rKPKP6jcVqRjZHbQlMsSxppUSv4We7J9IUbNDetDxRRI7qjhIvBDLc1FrHEwCwF4NVnKMxnPZeCFq1X2pqmJmMNVSlQNl9mOnOWGDT0a/HE+ziMJVu7DThEwoWluv7S3zC1YRJdxVOPYKp5VQ7QsevBy1oN2sHhLk2+9Tnw90Rlvy1F/WsJ0ncl6gwwSYsb6w+Rgl9NwXW2eWFg0nHbofsjYE3rvcDaKgAzA37sqzybnnHIFgk2bbVck2KQRBH3/7YQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DMeELTLEno6gCPiGIEgFIOn3cN8E2tvnn80U2DvPUEvIliHSMe+C144npWNv?=
 =?us-ascii?Q?W91JLHSwmrK0usW4H/1OIjZvgov8voqShrbIpqGqAgkpLwaeEF3GaCRNCzs/?=
 =?us-ascii?Q?Dy0/MFzQrGbrtcSKYn9lOyKm1MoTkT4GX8/kQDC1d1CcurvaljId4f8XLNDN?=
 =?us-ascii?Q?wdyBToCngyHALJb2UZvj+NW8Q5+ks2oPni2Iaco+wSxMSJv3n0hfad0dE5zY?=
 =?us-ascii?Q?MvJll6wwbdO1V0GxRFThlHRxd1HWPhgB6Y6dbk1y840YYqFDb4JzbjQOcVSG?=
 =?us-ascii?Q?ZVqYLAgijoTFJs7vmO+/h7iVIxJUBqGpeiJHxWw3N5mKrFh6KsLNbOS1VMEa?=
 =?us-ascii?Q?ZVSuqft8560NjvM5GpqJP3ipIY/E0uMS/Z3v0IE8gvyc3OehJvMRX4OwWyNs?=
 =?us-ascii?Q?e8mQOtyjT1cw4j4EbTivmD1rxMi8oIjnxkrnYiCvzONw45Ferdx9tzhkHwK1?=
 =?us-ascii?Q?XzlVbIioBc74xFYEs7bh2R0RxGflpqENf2xgnnBej31rf+xhI3qfHs01gVtt?=
 =?us-ascii?Q?8miPeI8Rvv5IY5E1nDAIFAo7dovsF+2F43RdotxZjkkm1LUNDDPJxKs5xcMZ?=
 =?us-ascii?Q?JG9hCyopCuxVWNSEeGTNt+OK03ps7FZ43j8V0Pg1QSJtmiB5rzRLsVh5P9Hm?=
 =?us-ascii?Q?8qOx6CsdJ5UYlp5/z5LLMG0pGZqPSmqiuxmEzs7wR35QN4j6vaFZF7uyYC/N?=
 =?us-ascii?Q?ZSweAI2aI9WE9rKlU4WF28VIqZpElw2Ca2J3v4M2c5dCDh1oLOu7MU/gNDT9?=
 =?us-ascii?Q?f4ixWHtzbeK4dU/oksWGLF9EBseJW6EbBmCoE1LguypfVdqECLXX5pytIiwB?=
 =?us-ascii?Q?gqBQ400a5Jffr64qT6bfuvbepW3xvQBhsMKstkjFPMVDgJBzBhECwIMetp/M?=
 =?us-ascii?Q?siQoMqewzBP2KRIF3TEQZldnP9yt1VtzCbyGJHTHJkinRNE3ZGNQC6mtbLOn?=
 =?us-ascii?Q?OYEvQmoF+0esXoIal9XOh5Wpmr1OBrJebKFg4RDmRSJqLDS05G6/epIsLRhw?=
 =?us-ascii?Q?HGG2k+OmwYTCSDykb3cz8eV64UScO6TNvySECUhYEUeTRRMwUZz4pxGVIx9L?=
 =?us-ascii?Q?PJc1tSVnrvIx0Szbccq4ArJAA1k5f2jeaMe/t6FCPhzZOL0oLUR/ATmJBd7V?=
 =?us-ascii?Q?YmMEBkgBnZauCpbLq568SepzgdJrzv6byOyP34ndG9uRrzDOliChZhUGydsS?=
 =?us-ascii?Q?sKky/Yq9wAalDe0uFf3NJiMbBvZBdPrYfcdY3KzXrfAsqVlUcd4OOqslGZiB?=
 =?us-ascii?Q?HoQRDMQ1qAbJ+q5Un/ma8JY9Qs7ATLt2oTW+VX24Flui04tZ1rse/M91L5ej?=
 =?us-ascii?Q?y1LiFir3HteZuz/qrKfZlANL8uCYWuKy6iIvFzciShEs8HscER7hFK3uTvhb?=
 =?us-ascii?Q?1iyd1ZfYrZbKRhdR8kZvYTHfvqjsyi5mmvOQpfJfAr6LjC/LMdDyjHtCPm4t?=
 =?us-ascii?Q?1Mf1nM/f65leVUwBOBlyMto7Z3orBqujiyPWmjf77Rj6ozhZ/2UGfXGITgkP?=
 =?us-ascii?Q?0S+GA2ag4+XqWiVMO/ML51KCMvUgFUcwtAyinC8xBMwYE7Hv7BiFVh6hCVUh?=
 =?us-ascii?Q?EEHt3Hmxgm4JMpBzMA/WWXd37eUIa0LuC/iqNAmFRWHF/axkKynF3+UVPxE0?=
 =?us-ascii?Q?SkL1dg3c3oF3/hztgFhbUaw=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ef5902-e98b-4ed2-8eff-08d9f8087cc8
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:38.7518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpFrT4vQx6U2Vn6GhfxKFNWdlADEFreIE4vwiUm0r/MDna+2E59RGCVJGP2XYznBtLl3LzZYmrBl+wTAog9/Tw==
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

OTP is not described in the JESD216 SFDP standard, place the
OTP ops init in late_init().

We can't get rid of the default_init() hook for winbond, as the
4byte_addr_mode is SFDP specific and will require to have all
flashes at hand, in order to check which has the SFDP tables defined,
in which case there's nothing to do if the SFDP tables are corect,
and which of the flashes do not define the SFDP tables in which case
each flash should declare a late_init() fixup.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20211029172633.886453-9-tudor.ambarus@microchip.com
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index c783ab4ba1e4..f0f73e1cc403 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -149,12 +149,17 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
 static void winbond_default_init(struct spi_nor *nor)
 {
 	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
+}
+
+static void winbond_late_init(struct spi_nor *nor)
+{
 	if (nor->params->otp.org->n_regions)
 		nor->params->otp.ops = &winbond_otp_ops;
 }
 
 static const struct spi_nor_fixups winbond_fixups = {
 	.default_init = winbond_default_init,
+	.late_init = winbond_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {
-- 
2.17.1

