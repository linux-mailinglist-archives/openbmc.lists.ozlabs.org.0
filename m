Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D24C3BDD
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 03:43:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Yxl01kxz30Q9
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 13:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=SiNx6OKc;
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
 header.s=selector2-quantacorp-onmicrosoft-com header.b=SiNx6OKc; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Ywd70XWz2y7M
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 13:42:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbLGrpOhwGXua9I8VJnRgWYUIkSPyTx1iBskApbylS1HpDDJVI+BcIzeTj6zbhIYIPZK+rWIfbtRCL6QzDqbRjTy1Ar66qYA4oAmcMl4zb3DN3Q8f1eaFPydqfmqAXRrsuwHEZMwvjfFbURRpUp3bw3aNTpQGFm0FSU7V/smQzQJjOTlnkz7C6jKHquA9ucPxSIKreYhPh523S0nGSoPAU2gbEgUAwPfjsidEykOUtIsCjhIowROa4HpoB5HQPYNIOEw3Ec8/8ykANxZug1RSxdCC029px9QBZ9TzQd7TnFmUYXm7VtDC/qO8cVdm/XkXXzEIdH4Qx5wmLSOnXHpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCKclv3rgRshVTlckVMXEZEgKKzC5/yPTj6YIxKFdFY=;
 b=HaZhWPz3k9pmTSAp2TBn+fkXaCl1qsszD+RDV8SVJXAhaCj6a12SUHt7DYGWPVQ2WA1WaqRptkMKhaHv2ABhL6eGN1baLssV4EetDwM4n5HZSPSPXXiohZQnmHczNB3xeAnYZVWMBJQ6cTPZEdrj+0SSJFuXunWNsKAY4FmukhnZ+csgTtL0gLECQHchWXJB04+C5aYvhP6U4Xel9TWunC4Me7tPFvpmT/PU/B7WBz+a7VraMJeUbQg15goAMlXocllVHrEW/uxLoJ1pqNYnIfHca7x07/A/NoL1wwklXpix/MXefshsMflDt6vGASGgiqnrDl1Wuf2F5siHM/toeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCKclv3rgRshVTlckVMXEZEgKKzC5/yPTj6YIxKFdFY=;
 b=SiNx6OKc6kdjBUYsTxmZlhxqdXYNsDQKFzeck5Dic9CNHLuOSlD8Ls51nzrDrUUiv9JPb+wrOwjyD4aDj5pv8ICHBMQfdfm7snsgEwmo0IZt1HNTUCkVMgyO1wa9rK59p06OpdXxyQxXScxOo91nXlL/KGDPSzeeEawB1WtKd64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SI2PR04MB4507.apcprd04.prod.outlook.com (2603:1096:4:122::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 02:42:36 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::ec21:c033:761d:3e03%4]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 02:42:36 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 01/26] mtd: spi-nor: Enable locking for
 n25q128a13
Date: Fri, 25 Feb 2022 10:41:56 +0800
Message-Id: <20220225024221.19422-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225024221.19422-1-potin.lai@quantatw.com>
References: <20220225024221.19422-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:202:16::19) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47d3013a-1ab8-4747-4964-08d9f8087b14
X-MS-TrafficTypeDiagnostic: SI2PR04MB4507:EE_
X-Microsoft-Antispam-PRVS: <SI2PR04MB4507CB06353C801F8F3D21388E3E9@SI2PR04MB4507.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B7KJlUruZUJgVvLw5NZto/S3wgrHIiv5nfkRilXZvBanyx7Kn7jGAMUYiP56F/Hv9me+77NVC2S3u1TpIQtOrqiJMpQyIG3aY9f7tvDytw1Tp275S3+IbYGIfORaMfJRucvz4RWkTNHV9RfgDKTyGBWfm1+Kky+5FqNh+5uAsz0luyHGdU5WrdanZ4OygL5d66h/9Ob8wMWr2eJjdKliuNyDGntI5Ym+9l9MMXYabjahP4oCE+ohmuZLkglU2h2f+wUbbXo2zPCdE+mKP2jRElMvRU82Bn7uc53un9VrDQPlmU5DcusR/T48E2wHqYO/Mnylpn82zHgOipHTni1/PlFxlAYHyfY7pYSJoTpobjXrHukHQYqSW0BN62xPmd0K3E7V2RZk23vAJi6/IR+i9+Ah5Bi8Xp0QIf2ZqKd6KbasN0pUgirPb7//EpaYxk/xqskecwOQb7ZjQ1KldKsMwWRVahHUe5HhNaMa17hnnlr32+r6dykBfIa+cGdtm8YHXAGsE0Hn4Xzj2HqoC7c9mUx4JFzHgYDLpDP2EyLnVyzMuagFiVwrHPJnKDbfpmjQkb6cesKuQGsJUQAG43MVeufa/uNl/TNt82Q10EnPnuTOb0UTxEqbeQK5GNuNsBYA+ofwnt7zNZbZ9+agTXK42GmqGYUaqj9c/OPBeBJGXvMkZkBu0sDCHWEqiuhF6geV7zA/JdcbgU5mrrJS1eVTbLJKT4sssVOwnR89CWLCeDVzYCyiXEisThncg4VbyTXvVhuh7a1qz3BUlPYRh5SWUq/On3yD3yPZ862mVhRvXzyzFpe8wCeM5aoUWRGssuz/dllBf9nM1ueAG4PYbsEDxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(26005)(186003)(36756003)(1076003)(6512007)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(4326008)(6486002)(966005)(508600001)(8676002)(54906003)(66476007)(66946007)(66556008)(5660300002)(6506007)(6666004)(52116002)(44832011)(316002)(2616005)(138113003)(98903001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zu7YPkhsZkoy3iJOTwHgtcmJrNDK0nN4w9zibSkTip1YWIYTkY+cKFEnwcgb?=
 =?us-ascii?Q?C9TMve0O5IbIvlnLHfHCG27rB/MgQ2JplHhLJR2aMvEFnHYs1aOsCX852zol?=
 =?us-ascii?Q?0QByPps/fEJzbPMFi7n92y39dVYbrdRB5OJmlaVzghV5Vi6SlDGB12MxE4tG?=
 =?us-ascii?Q?ghydg9XQapQwn+7lWB/TVX6fwRwRACYtEiHqNtuQxnDFG2Thk7pNf3Hgn7yb?=
 =?us-ascii?Q?3e04f2ei3j6YpJiK+tIEvGhssI/H6eZWr1sM0P/myhK68Y3YQmvP3AK0v43r?=
 =?us-ascii?Q?9VoyBPRSkFCx2PDtep+pV3Yxbz5MSVKaVrY31kwchfQnT5yIefH9npruE8jK?=
 =?us-ascii?Q?fu3Mv42JSNf6RtK7MISuitO6Z3nmjI4i4l71ssmqcS2My6CNBiXwt++nKrL8?=
 =?us-ascii?Q?27JSVf2wa3NUJn21OUWyTd1o83hwQCnaPY6ddgz4umsVc4h+0Yvj2OQ1wOrR?=
 =?us-ascii?Q?+tFtMhKsPMUDWeCi3gx0l20rGa+yb1GbmHetKlAsIMwcE8ucpkrPKSTbuo96?=
 =?us-ascii?Q?9q83wCLLRx+rX51at5ZcMc4HHAWcDzDYWmq+Zhh4EJo1HPzFUR9gbUlLeE3X?=
 =?us-ascii?Q?Kb88TxsUHB3OFDXbfv41w9e/oR0+sshQml5+xXHOAaplN6hVcDinNnvyWvhh?=
 =?us-ascii?Q?4l9bqXKyfAYPJRptqGRH0UMKNgGEGt+Qn//AX+H/glLAB3Lo2F2OqDSchfKV?=
 =?us-ascii?Q?p2vcQbCIEGvLPn49k7A5OLPyeoS7aZwjEpnfOoJXi08rGixH9H7s44PKjqbp?=
 =?us-ascii?Q?VxdISfY0BmS+Av4NrsgF2FQyr3Fwq2EPZpDHU+VK23UUsSljudLXxfNjXUM2?=
 =?us-ascii?Q?QuO+iTiUkpOfUw3poOAaHUlsCvhtEc6ztAyVXN4VylMJDUo3jotf+W4XteLF?=
 =?us-ascii?Q?mVvCHZg2pLkSWGgpfzkn5bcd2y8AnWoZ8azbiZFf3qxhoOEpZBNSaRc0xUGN?=
 =?us-ascii?Q?XMqXrTZEdEUblxZFOSNYzSQtJdownGuYExhaSHYvGOg3FUQxTLs1Zd4XQyGY?=
 =?us-ascii?Q?Oklkds/HhQoiL2E84MU1hmXdn4Ra9OT3HrOZrrGfYRIos0ZRqZFiwm1GIrBN?=
 =?us-ascii?Q?wzDvjbinryhGobLWZzOdbGBHhHaC5kJjchUIouRBDXQY1mtJeyiCr9K4CDsY?=
 =?us-ascii?Q?34ul2Lhtaht6sr8VoUwQkVSrsNkUxAHDmptb5BzyX2EHkhLseUA+G8pcCalZ?=
 =?us-ascii?Q?nBZ0RY2eBsdmrK3Yh9SAsNSCYJ/F9L/LofCS/n7ZCepF9+r2F5+fM7PIRcYM?=
 =?us-ascii?Q?UfAaZ2klv8tJTrvf9jOmBzbCmYI51sizCzVn0zktFLqLtPKUoJ2Vrp+PTfZc?=
 =?us-ascii?Q?Foyl0ZX6l4cMDJvOZrlqR4NydacDCsPfyJryLCQB149NZU1P66Uhb2p2NSEp?=
 =?us-ascii?Q?mvvzECFYBnAvWCRriMqJfeg48EFhxX79EqLMf+qkhUNGoYcWh7uCho/t1hGR?=
 =?us-ascii?Q?3sFmiuKYcI40YuLqnuaigtSeMQkoscsG/LlISYxm3GwgkQiMIRNOJ+yR5zFB?=
 =?us-ascii?Q?NzLGPtwZW59dIpxrh77+hSC8wtHd3CSrffBCfvSB9WtWPJ+pZ7zI0K4Je+g4?=
 =?us-ascii?Q?5PbjmEEk2slQLwuro16WBZUn21wlgd6fGmfERuu546Ysa4Zn9NlNEh6dhkdN?=
 =?us-ascii?Q?DlveFsBs4DhO0DTk6ccFgjE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d3013a-1ab8-4747-4964-08d9f8087b14
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 02:42:35.9083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ip64mN76zsG59PFJlcH8KJZC1A3/o9h/HrfMNZotc+jTaJrY14Y5rIyVllUztPCJFYzMEeEQAShp8M16yX+GoQ==
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jonathan Lemon <jonathan.lemon@gmail.com>

As 4bit block protection patchset for some micron models are merged,
n25q128a13 also uses 4 bit Block Protection scheme, so enable locking
for it. Tested it on n25q128a13, the locking functions work well.

Signed-off-by: Jonathan Lemon <jonathan.lemon@gmail.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Link: https://lore.kernel.org/r/20210628211729.3625017-1-jonathan.lemon@gmail.com
---
 drivers/mtd/spi-nor/micron-st.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..f3d19b716b7b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -146,7 +146,9 @@ static const struct flash_info st_parts[] = {
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-- 
2.17.1

