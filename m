Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A3488E59
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 02:52:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXGzZ12DPz2yQ9
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 12:52:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=anBgYMx7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::70d;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=anBgYMx7; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL3jD4NCCz2yQ9
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 21:49:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBqvlMAIWIvePQMSEe99RHaYmLTkIeFahHBqf/4Rdn2yl/63loa5W/PaVE32D6emXeNRIZAnXLHPvnaQWoXmdJ101L/pGpLRzVXufBha6tLdnTAsaGTcX0PlqSRh5KKc/0Jai+kOtirW/LwBUaCbOSqGrDAQfVgEqervyAJJ8cstgJB38uiZBDxSGpEqTWqAlNPTCmk3frjqSquJ5vJf7N+Ii1yxTpxCUfy87Mk/8fREJk9y7k+e/zMHc3BIlOPLm9ZID2PgXay4O9C5Ud29HK79/boaNrqi99CtvahMxcLHqMsRuMnhuS8RnbmfIPJ0nozc9G+yWcBeoC7OPIMVLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWicS1EmQm76+ifRTz0BKhO1FCc423/soviHVgUQPWE=;
 b=cbIhu8WuJCH/O8gC51l/1Lc2QMbppM+yhfffgWCfvct/CRpT1HSV6wsQ2HUGHzuq1gwHubr2OpSe3kvkLrWQvphP1uQlGMB+BUBJMBpYoiooxw/st4t3md0hlZb0/HyhFjRAK9/XEnCMbUuATO9NfzP7WsmGQjdwGhYIVFxgERE5ODi5SF3gfN2XIaWRuvLSY7DG1+DPprjGxKKvf9Cdv9zVZRN/d3SYu6DOW8KjsyF4UvYN6mP7EbjbB7pgFStJ/JITBomo/8RG8W2USDHnarP0d8NnzCmYimU09YK9VKfmRkNMbTxb6FKCXjlp/r0SYZHSGR35F5FRBv3Ua661gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWicS1EmQm76+ifRTz0BKhO1FCc423/soviHVgUQPWE=;
 b=anBgYMx7wxaJCW2n2PteiAiNwsHqQE7AxTN99fB8ESSvWPGaNFLn3xAA7fROoHwiR+tfPUXbemfzrkQYMegaHbaHtuYZ3q/qNawbEClGSzWzGzoOwd+x6TjDLL+BA4G/XnLI1m0MB+/PkIH/ViDKoJACB1VUNydBmJLwaJyxYSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB3394.apcprd04.prod.outlook.com (2603:1096:203:85::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Fri, 24 Dec
 2021 10:49:14 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b9cf:f0c4:9ef1:d769]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::b9cf:f0c4:9ef1:d769%6]) with mapi id 15.20.4801.023; Fri, 24 Dec 2021
 10:49:14 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 1/1] mtd: spi-nor: winbond: Add support for
 w25q01jv-iq
Date: Fri, 24 Dec 2021 18:49:00 +0800
Message-Id: <20211224104900.27140-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0143.apcprd02.prod.outlook.com
 (2603:1096:202:16::27) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89252e2b-388f-410a-e76f-08d9c6cb0668
X-MS-TrafficTypeDiagnostic: HK0PR04MB3394:EE_
X-Microsoft-Antispam-PRVS: <HK0PR04MB339469FE5FF9D9C0307676458E7F9@HK0PR04MB3394.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYaYzWlzyklp+iSG7+LTVKe0BqkW4HlA58AKc3REBIjvnTNWSmxh9nE5J3sDqJ4j9AiPfZ+nXCX/LWhLt3V57DffaeLJIcu4goP9QxfNScrdPGD38tDhtWpmM9vEftx0uB326+o/1EdLTnP/+IUl4vDLCRz16sGfUrwcsrTRIgPCx4bH09hxPH9TsCw2Y3ZDcSI0+4Q9pxHRstaW3UcLhvnXfTEE/m11y6Pn7tnncjcAZ2V/RHlIjY7zbFbKWEr6NvyljbmAWWTITi6UkhY7R26w1wF7A1hwPupF38gpeL/hAZzLvTc9QskyTAPzEvncG/QJW9Om7G47THdcVDhC1K8wZceq2QxQSybZet2UAYxmTTsXKhPhL57yL56D5Vz1mBLEl84tn21wjT1xYMLCwwqPlWejVbFheQ0o+jda+fK+QBa/xkfVniZIpJFDVXe++MQIMXV9bHkG/AqyHG5pevDdmB8ey/zUdyW1U+zic4mKcSIyH4+AVyCYnsZzf1Fa5w6v0nKKbW1i28WTZaHVUZD82Z0PiqB6DHwBp308Voz6xXWd4j9EpVneXTafbeHpuSnVRQVq7bgJduK+JjXB14UFsKPtQaiksB7x5ChyQfFk/ztVB4ubdCAKZ9LzwJr0QIcy62AKMESAkynIJSre6gVk5Ht3IWqzc9djEWasgL70oJOE26OETabQqSbT3izmP+4JGUzPF1ZWZIyfEpVxFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(1076003)(44832011)(6666004)(4326008)(2616005)(8676002)(66476007)(66556008)(36756003)(66946007)(38100700002)(38350700002)(4744005)(6506007)(508600001)(186003)(6486002)(86362001)(5660300002)(54906003)(52116002)(107886003)(316002)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W5Sm+9r1hUNsdZaoSac9zBH0zC2jN+/4lkwovQAQNarhRLX3CwtfbB7xth7J?=
 =?us-ascii?Q?EuBsw6S8rO8dVOdEGpWjcBfuC5Fp9aNALRC3yLhkbzWvJWJUm2mkUzdkYMc6?=
 =?us-ascii?Q?v4UEiR3GDquP8KHI2aD2RTLq1HqzmKy7HZcZY990TbzN3Lucdz64rMialepp?=
 =?us-ascii?Q?oiD4glZOOoQcay4MbgG9laJbBm1w+gUXA6rHsmBPYmoiD+EqMSwC9yaVRIdn?=
 =?us-ascii?Q?8lar4rLz+UtvSa9tVYKUg4qd/55ebUMnfQDyRFpUPoaMto8MOPzbgvxWy0tF?=
 =?us-ascii?Q?Ne6cA1B5VEZOI7yfIMxxAewj0WSDkO5Ycju/Jlk6g+JFX6Qr+KTlypWFky77?=
 =?us-ascii?Q?5F3F9H+lgG/P3wSd9aQu9C7bbR6fT5wCGZ3Upto4Gz0vy/hPBoBUDRPoS958?=
 =?us-ascii?Q?+bDumh/eNfmkVz0aiA60+wENbyxAnRwvwQDe8NzRz+9/R0sY8rEOi08inJ+t?=
 =?us-ascii?Q?Kh+ZEzJYYaHLtXPNLaeVIbTwVFd+1d4bnT8Nt+qcpRpr7ECQTAX/NlCopPv1?=
 =?us-ascii?Q?ZuJrJqmhu4hsrBlD6my7kZpa6HPhDmzahwRxmS0lqxl4ywl5PdOMqQqTzlS9?=
 =?us-ascii?Q?GdlOWR7slWM4XFdKWvI5fDo4HCkTa9dZyS6JOr057elElSQPwQiYaUB3guOy?=
 =?us-ascii?Q?X9yd9rzGObGO2NnyAf5D5BnsPALeLDConIOvqKStX3A7SFeXkGoRf1xfQRhh?=
 =?us-ascii?Q?Xb3WHgs5mvZ9+UexXBrkU8jC+MfM0iuSDpB+iTQiNIcsaKRNHlQcIc+ffpWV?=
 =?us-ascii?Q?D4lI7v8L6dp1aYHumlqwAtQ51ErrWuOhfdfpuIdrpOBoCHhV23Bv/j3K50zP?=
 =?us-ascii?Q?VP0D2oH25UqXjrwx82QJzbHzy2Du5YvquD4idu7xEuDIZzUPVUEoxLRsNBvQ?=
 =?us-ascii?Q?2Bb6UeYQS6Sjh1ktc/r0hzgoFMHMZoZKCBI2fsANohCSfgM/LgHjrytAA1Qa?=
 =?us-ascii?Q?nWGY0tOtN/XmNj3qk3kUqAgqpApPD+0wdDadLXbu3/EUUsSKHuO09rWcAHHW?=
 =?us-ascii?Q?p9J2ULzcKGXUuf9N59H8mTueJb9l4NK/vaxmufCod3FuOk2G6fhSSb3z7HuF?=
 =?us-ascii?Q?mMutcaPnsltGqzRbqs64LCt5SvYPqxfFq3WgHf5+vL5f8s0GuLMkd7NgUfYh?=
 =?us-ascii?Q?5WTDZXRF7DxcwaO5hi1ItLLpvsgDB2LJKMjvObhd3oVYIIhJMa6l4T5IZ2V8?=
 =?us-ascii?Q?19Rgv9VTRTdCmeAdo+tzofTGNt+Ms21O65pe3DJaBDkb0GaFf7OGbofWoMg4?=
 =?us-ascii?Q?40wNse9q9hZX0NokGV/+EBSnX2LMX6xvOK+kZ7p36xEKDWoQ7ARYJeh0R+zK?=
 =?us-ascii?Q?UkSRkpzQaLhqpTv4++/oijjSZgYOhTggyeiNvhBqcUUnaZ8EDo6ugpDucdQX?=
 =?us-ascii?Q?n2ZdRaTrgKw3zJFsbvaVQa5S2vXfqioV12DKB9K+Osw6a4FMqNV66AXYultz?=
 =?us-ascii?Q?0/qdrHjQygtBMnoexVnfJ4J2ckeVTeLmBp1KnS7eETbC4ggN+Yxg5RFCT4Bz?=
 =?us-ascii?Q?dxG6X0YIs1aHCREYeE1XZ6iPd2Bg3SRR0R9b0Jyb+fHsSbHTKD/d07GUum0y?=
 =?us-ascii?Q?ktcpPpvfVbuXApunDia4/Q+Bam5ehQGiEL2zWaxwVLZ0LvAKIf8N0DEF5wjh?=
 =?us-ascii?Q?EpnYWCsfKGXz9mqB6zLjBNo=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89252e2b-388f-410a-e76f-08d9c6cb0668
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 10:49:13.9463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbkRxMa4WqOj6jbSNk03birKAnePNc+06Dr094j1G9t0cx04VGls6qIPHjtwZtnyi0/IK+7Y5Q6SOh4LIeMvrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3394
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:50:43 +1100
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

Add support for winbond w25q01jv-iq chip

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index c783ab4ba1e4..a2a72d05fc28 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -104,6 +104,8 @@ static const struct flash_info winbond_parts[] = {
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q01jv-iq", INFO(0xef4021, 0, 64 * 1024, 2048,
+				SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 };
 
 /**
-- 
2.17.1

