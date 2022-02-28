Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E54C600A
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 01:03:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6LFk4k4Sz3bWf
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 11:03:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=ClKAa8wk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::730;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=ClKAa8wk; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6LFB1vtfz30MH;
 Mon, 28 Feb 2022 11:03:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd2c6XtY5snYheZ7raNertpLjhCt4xUznrKw90mNIYC73IgQ1iZKBRH5adWFrSCzzDGHs6GcxPQEvh5O/z42IGRYv5h1IeOrsZvxJWuDqLdNf8I8UTR3fq+UskWw5rni0shfbdBcN4NvbzB5eafgbVrEweVkuAUHRyYG1In9HGBMD2BIMZ1HNnsEAWDFkfUER/x7wxveruq4h/HKI4xu7GM1gizQnOrvA57uYC910oec886p3W+pffCPIxEUBUTLB4AGsRByk+vnN8JI52AjlK4mKBSTrQBSskyZKXQoeOOoUw0ZYeumLmX9qKJPtnukXD78IjE6jbbnt6EoR5DJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmRDv+8Kp2O/7JYi+Yoddp53xb9TUJwa6yZH9pOukH4=;
 b=jqNGQjhQfIIfNfEj5T5ij6cz8rv+CKskbg/vbdfm3EK+FrapHfPSf5YIJ8s73y6AMNzCZie7LlFmFbghauSn8SJfEdNBgi7xlhKtQZafruElb9uLo7oG9r4cHlk3ar6zMmJaoQTpNf/KiQmHTuXWNZSAEpJ7tXJpsegbl4sTFb/Mv0hi6K+UXjV5zuW6ttBK4yw1kkIrRdasP8s/uDdUL99TxoCt1FxgKzTS5gXmzTrSfwOgXTITNBlqZHvKmbrgulhyX8b6A1FKsdwtbPDR/jeQgeU8Ji1GolVhTyupWkJouYUWx+qhnCaxZIaG6yFRfsSRu2wrOfAMNQgE5Td5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmRDv+8Kp2O/7JYi+Yoddp53xb9TUJwa6yZH9pOukH4=;
 b=ClKAa8wky7Kbg2CqIjgJhIVRq6xl3aLJICq8OX9NmWyLjdvmp4CsgQ4rpq9/dXRU9DWsqcam1n8URSVrYRHoEGnJ7t4EJV2tC2dVyQMQW2jFg0Scm6/CLXS/2pNFQkywSzhFiHz2v/YSa5UDMupBhT7XN0wmFNh9OQE2MNKpAFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 PH0PR01MB6184.prod.exchangelabs.com (2603:10b6:510:14::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.24; Mon, 28 Feb 2022 00:03:01 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::d9a2:2761:a4c0:1e1c%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 00:03:01 +0000
From: Quan Nguyen <quan@os.amperecomputing.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 0/5] Enable second flash,
 update gpios pin and merge adc channels
Date: Mon, 28 Feb 2022 07:02:37 +0700
Message-Id: <20220228000242.1884-1-quan@os.amperecomputing.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b79bc2e-8c7c-441c-14ad-08d9fa4daf0b
X-MS-TrafficTypeDiagnostic: PH0PR01MB6184:EE_
X-Microsoft-Antispam-PRVS: <PH0PR01MB61847560A62B6D916398AC1DF2019@PH0PR01MB6184.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ihv161V0uEoB5aN/niCsaDE4XYIwNK+leC3rXjb2GG/WH6kILrmuHW5GJ8pxYdKxvI4EoY3VHRUxOfYroesPcUT78bWoiswPkTNtPLZZu6vNK/pTOHisHP82qbTMtPOb0PF1kh0m1UJpq7ehOEvjD+VDrkf1Ec7R9HIPofejk76V9KYJvoEaO+5OcC5Awf2st+ugHoTJJ1rQGEOdbDooYy783bTSxPRs73MFkFz0u0zhUpoiSynFylJ0HNX7bfI7AsBXc6oucpNMFGbHrA6iyl+UejKZHW/W18ph0nnM0csjC28vAt07iVsMuN4HNA5kbJN8n3eGFDo9kVFx59Y86B7/1hcbPQRSXhz6tvaDxj6szz5zKJIKeyRwDOLPwALeZOVh+JVX/q0xrzkkmit9vViWBhMYpS98wB/AUfM0bF8TM4QELiD6vg6TokIpyyzZO3rDq1BtC5jD5FgHhN53uJxYWeMg6hx4mvRhqjZRopz8Hgz8GbryFy/aZ1/PqLBnsGUDCUyv6dUhdC6PiniFzUgtVc5jPD4t2Lbs3YYOCX3V6WqJNtkoHSCFqy1BoG/EAVkZev4EaxG2vNGw9Lq6xRi5uc3tS2lvCr1Znq6rmzMNu1pyA1avYOrX0OFesjbXE8nMAlSrCDlVA8OgTuK8TmZh+zK01gfBH5ww1zz/nlzjp7Sh/j1Nut4Ekf8K6FBxKLgaByEQUHVE/dEEB1Txm+Y666dJAjgLcrZAMt+7L/EYdx5od5AzYHbKigsz1s2yUBL/Y/RiphBKFrsgFD+NIi9Z3Dmk9UUrx8GUsMM2ql14VNUTvPiuoZkT6jNRRVvA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4744005)(83380400001)(66476007)(2906002)(6512007)(186003)(54906003)(26005)(38100700002)(38350700002)(110136005)(15650500001)(1076003)(107886003)(2616005)(8936002)(66946007)(52116002)(5660300002)(66556008)(6506007)(4326008)(6486002)(316002)(86362001)(508600001)(6666004)(8676002)(449214003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wp7/ezC9TjiFKKeuEJsZEvnizPydpikk6Wm0pcwy6rQUCtsTKQ3uY9DgR9Nu?=
 =?us-ascii?Q?HDfDCDd7Opvwu85mGEyxshk9pl6csJBuFQE11ZhM1AwNoudFhm9BQW6UwSrG?=
 =?us-ascii?Q?c9PMce9U9GteZRSpp02QSAfIk4Ec6qY29JuwOHzZgq84BQtFdYvF5Dn8fb22?=
 =?us-ascii?Q?l/yYWNssB4GC3e2lsKxtZQbYseICUj2zgMbr0vVQPGS/ttM9PF1tt61mNH6B?=
 =?us-ascii?Q?H/q2M6Q4oxbF922jFQKsu13AHu4LEp+AhRc7tQRnC/7bXmI4sACxipFbPRuo?=
 =?us-ascii?Q?p5fIg7rm1RBY/DvQIBp8xiczeRRSAwgAbn1KOpX/uLynLN1bjpUyocBEhZKX?=
 =?us-ascii?Q?kfHPRVQwqZaJ98oo+srBWBeX2Sa4NKHpwcZcAf5HQ/K6EuPnOcVArhO6k//x?=
 =?us-ascii?Q?kshmElu1qs1k7/VIc8i3gGMSppG3zayu6wAbv4Lh776/Brpzz4xOZt7VbFvS?=
 =?us-ascii?Q?555X/746R7A2vOasLwEG2QN4eUcbXMyetHhgTEJb1PCVTuD4/Q7SnG+AGbyW?=
 =?us-ascii?Q?Pxu939Aq6LAKVLoRHS9+kv4SvZeTuloEcL6nKdwiqw/80kaUjNaiNLf7ogql?=
 =?us-ascii?Q?lGPnWGZdfnP1Zkv9/f0uW6gFI6sKz1XgloB3hE3DHq3HMCcbA6XN7SlBSBgr?=
 =?us-ascii?Q?VMiJxyRPw3v/hK2TTFRgvE1jkf/FrfNWtS3Ww7reLhQ8mItZri/gTMaDzEsL?=
 =?us-ascii?Q?Ke3hQGWiEXY50jrlDFq6XKcb2e3zf3vlA+tj6NFD6Du6Zh3DzwSqX87dujqj?=
 =?us-ascii?Q?LcGec/yf3xDziVlN16kOP/IQGA51g1Ty7WCPjfOqQVpCFOxo9gi2tOSouNpV?=
 =?us-ascii?Q?VozhS7RwImKp2NQiYKjI5i5rmEzOjzwj2eXlLCA2ugD+9Ovq720faE/VU+ff?=
 =?us-ascii?Q?Aq0N2yAfoQUKVyxXKOIROeoKRIq6fsNhhH8rJv9ukXAGcHqeC3e0oI/9lhA+?=
 =?us-ascii?Q?3kuWk9GcYL3Vvcvds711gx9wpxN6FtmHzDTfv5RNKz639R910nL72sNhtO3B?=
 =?us-ascii?Q?k+mfcjYnEgFjNEg9p7XWroeyW8SKZ+HnSX8Z6YGqV9D5uXQrSNJDLGCmLg8K?=
 =?us-ascii?Q?x0B6t7zczmGxAGZWyyT+nkXEuX17ysyIixcNO82L3JQwjli80vZhtJs3xazD?=
 =?us-ascii?Q?ZZnc8tSOLf3470nwBJrR7QvXJIHl9aVwkGTqH9oiPu4VBWVKBMV3LducrIby?=
 =?us-ascii?Q?yxw2tn6nnBWNesqxpcQzBpkgMbfLtIzDYJQYa1LWvENrI4EFNNj9cW09iluV?=
 =?us-ascii?Q?a2GKcEIdbKy6dg4NHvMesRa/+hAsUXqNeUtJjh3BuiBJL7cIU0kK02fKr5b8?=
 =?us-ascii?Q?qifHsNLerbLMjZqUaMEfGa2b1yDB0C2VO7aEH90onYS6AqyztV4DD4eZItO7?=
 =?us-ascii?Q?cFCOH0AYHNemt5gui0VqYrQEvQ7Ql6fYkBzWgwG2u46i7jfPVNo4XUySTSBv?=
 =?us-ascii?Q?3C0mRgCR4IZ2B6BbSeFgGBFWsjS+fcMjEKoGyoVThaHRTbu/9h5eNDud/Fif?=
 =?us-ascii?Q?7pvhvDjMPP6jS1tni+QmBHh6h5cOpH0C7AvYKwzSP4XMm/qlvESUhGUIbLIT?=
 =?us-ascii?Q?PLpQiGfu2pPLlLS7av5RfOPHq1CFAnsYhklapX1HL5ZJE24hq+Q9ZRWZr4/b?=
 =?us-ascii?Q?3/DsCnpN287bxxWxh9DewiPfB2PKgDNaPPp/0w2XsvIWGwpwvkgYNyen1ugF?=
 =?us-ascii?Q?fOh6og=3D=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b79bc2e-8c7c-441c-14ad-08d9fa4daf0b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 00:03:00.9862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhHy8KOv0+XC9rd9boaMfpJHIYPIE7JV98mAV3sdswTq7sMFCQ9hUMr/trtIizi3C0jZpy+6GgH/Y6elg/G0vP4/j263x3AsXlHMIdSLPg4=
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

This patchset adds the second flash support, merge all ADC channels to
single iio-hwmon node and update various gpios pin name.

Link:https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

Quan Nguyen (5):
  ARM: dts: aspeed: mtjade: Enable secondary flash
  ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
  ARM: dts: aspeed: mtjade: Update host0-ready pin
  ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
  ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node

 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

-- 
2.28.0

