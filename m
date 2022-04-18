Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E2504E4D
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 11:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhhFz0q6Kz2yXP
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 19:19:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=0pEZvt+y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f403:704b::71f;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=0pEZvt+y; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KhhFR52RFz2xSN
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 19:18:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF0v5MCdDLJm8+fnHPZu5C88OLFrjpp05UX9o4tNtgHgbcpXAOvYwXg7InDW2aDtgCq6tMAXR4lVcy1MdoElUK7jgk/abndp0WbkjUsn1UAR37Jz2U3Sa4SqJYEOuHINCnOAFNEPWy0xSVx3h+r22vKkhBJOIF2jWg1bMo/MbWqhmvEp4hzjkOQHXpZlTPEKtMmxvpxU2cRDCtQtsiEE57Q9xCOV1RANU2BeUbwZw88XdWzhrtLz6ukcJsDrighDvIoxFpgZMJf87pp63L6zZ3pTN4AQvW9wNCfBjhTWQL/mWyGCEw95oyvB44n/Htsxs2xYLqDqq1DkJIuog2HQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyX6Zi3P1sp7vG8+6ywvmwo2BEuK3YhQUFU2i0oU6E8=;
 b=LZEdNeiRRQFX1tNPhWGZbmtoA01Ov+5DhD4sPsU0fJKAJZjExf7ikRuMGyvkfbuOev6SWNsEFmdqYhFBPPs8LCi931mmIdzAcdSF+ozia/8wzw3GJaeTk1hSJQQQso8oCML/5RNP8YYkgG6hOCTVujbuvyroj9dqzDsvK1DYR22Irtn3AEpgTcABUdPXQuoYTENueSqsA0UefhOTlKDMeT/4zb7Mjfo8wBYN01Ch6KAGTPbzxpRgik6sjG1fkjPn45kKpBj+q8cQspTAL8tnegEDXNrtb1FYw20YyUka4c1VViU4N7obkcy6s9Cf+TXH10IQkvBszsdKr4qtynud1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyX6Zi3P1sp7vG8+6ywvmwo2BEuK3YhQUFU2i0oU6E8=;
 b=0pEZvt+y1CMNryhwaYONlziPqrtY8BM/EeM3ezTMRnkzAbd2bT0sQ4pwPuuR1ftvS7hQxhti3o1g17mFDqgOfTrYvoek2cLMZvaiUgxRcO2gjiygLZmK11sS90jaXt9vqjAR2E9vh8uIm1f8JeN0qcURwm+wAZnYbQAHVwPWLP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by PUZPR04MB5229.apcprd04.prod.outlook.com (2603:1096:301:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 09:18:24 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::1109:2541:660f:1489]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::1109:2541:660f:1489%6]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 09:18:24 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-5.15 RESEND 0/2] hwmon: (adm1275) Add sample
 averaging binding support
Date: Mon, 18 Apr 2022 17:17:26 +0800
Message-Id: <20220418091728.23051-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0142.apcprd02.prod.outlook.com
 (2603:1096:202:16::26) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfc00981-6251-4390-a1b2-08da211c6374
X-MS-TrafficTypeDiagnostic: PUZPR04MB5229:EE_
X-Microsoft-Antispam-PRVS: <PUZPR04MB522918B835164FA68437BF9E8EF39@PUZPR04MB5229.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GFFNyla7jEoGkCBy1fCoXOtolgV9RcGxV0ozVbr3pNoZQe/dHPjSSzSTQzxaosGNSmH5ZbGBprRjMCtr+2uDXUmcWQ8zV2TwGGQ3MfupUWMVZm3930tMEszIaRIYyJYnv4XlGB6Jaqgw0nOoaHJaLS6BghRDss8fNlSKnO/nkeNnp9pINTywMbRkgnSV9NWncV1sy0WB1kM4HFo+x+ctv/dhM409zmasT1h8pk4ktfu44Cg2RjXsKxMmCy7c8iJVM2u2HaLW08JKoUmQGi35HH85UD/N6NtMWKAIdAVCpN7y0BOyxkLw1DMRPQjzwaLwBE3tMOuBY2vQEiw/5AjRxYnMaIuQ2QLOivVfTLLAOdYtYHNRQtsWsIHfoZt28Xxh7osPLoyFeo7ShdqTxOwT4a1z9frjJiH/29qguTPGFe97My1nrVw6yhFjn32zKltE3SoKK2uG5TjJbxdDDcb6UqZBl5XQW3XwvYre7wUvhtZWylzD1qzBKfD1Czq75gnMeKaqf5oq0QP7KO/fWs5mLvWwPdhtF0bnZSWO0CGSkCiv6Cu6MC9H4IxkDwR7o8sFfS8eUkF+Sqvpd6jozhxFN1S1+brm7hJfzxO64iEzYcpczk4RM/qKzqdlwBRH5/M8wz+52S02AZ8C7PCPVD0fqlZ0HmmjoSyqBHrzmL1ToJUaaoIo7uGgCr9bmMMkv/KL+u3eZPsUso37UdmS/HYSNU99RmvtIPc1jf/IqcUzw/ifRgSBoxa7rcqH2m3okCLjJ2Z53j1Q7j8Crg2fdtihW5372TmxpSMY+2Wgq2tu8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(83380400001)(4744005)(66946007)(66556008)(86362001)(966005)(66476007)(6512007)(6506007)(316002)(36756003)(2906002)(38100700002)(38350700002)(8676002)(6486002)(8936002)(44832011)(52116002)(508600001)(186003)(26005)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cw0TNaQkQygiHXBJ34SidSiCYvVQCUXg7ccxrXlOhgBa7OSppV97ts2AjhoK?=
 =?us-ascii?Q?SJEZXEwVCAmtXILwyIrSPFbn8V/39a/lzCaI29fhROxTR/IWW3Ubpg1A6tWk?=
 =?us-ascii?Q?QwnNnLe2CbL+MgI2BhmFMo7b//vXgXSZ4JB6v+hmLstJO9jO8Vkoe7nzJPk3?=
 =?us-ascii?Q?kbGMViaAU4X+Mkb8HHED/wwDmVWqwHRsWrM+a+3w+SkVXMrIn0gr9wuMmWTv?=
 =?us-ascii?Q?3xmIscSdwdxFJsgsrAMReghZaBzt3XOoRgGzlKk55r5SpwVlbR0UIjIcuOBO?=
 =?us-ascii?Q?k++17uHcYYaYBtYLb0v3SB4ikjSmrsQGU1PJ9auF5DM6MPSGx6K3z06gaTHS?=
 =?us-ascii?Q?W8VlZfCRz5z8+5Ltu0Su6AwRwdEgDgVL/CatBvusAo5nReSO3wzXGOCmsEj3?=
 =?us-ascii?Q?SuBHtYEGgBDD0p3JgH8RMFsY01E7GHgbl6wVgnjR2yBcmYKl43kpPEtBIs8E?=
 =?us-ascii?Q?Elz8mbD0/xV2NPQX/4TZXqshLT2v9s/vCkjOLsQMCdspmCvOdy2jNL8QA0/b?=
 =?us-ascii?Q?PN8S5ew4Mo+yRDW1HT3J85siecMAMsTuZvAl65jyW5v0k84Fjrml3QElEbvE?=
 =?us-ascii?Q?Ud3gOkBH4H9ERRLUrivUlm4FHPyLoLeeexFZ1/h2+oYVSr+O1LZaGJyK+RQu?=
 =?us-ascii?Q?OWvF3IxgxdPlKkaWUC/QU+tRE4738jsM3RdBssuo6lBWr5OJ3wo87E/Sc5SM?=
 =?us-ascii?Q?Y4heQ3FLuJ76hHPd7D0FxxHrUiYQVl1sfMn5KQIjkFFobbUpACguX7pScQrl?=
 =?us-ascii?Q?FU7pLWDSFWBI6wAe47rvpO13QryTjXdFADKQGIjIXs/CFunDBnFxtTR2O+g7?=
 =?us-ascii?Q?m780eDhs8I8kVwLgkkm0m1QxZ3cM5aZM8I4dCX84vL5F/U9cXO3mpHlPPuEI?=
 =?us-ascii?Q?eyyQCcQGmvWmZKkbB+8JMpUPrvd6YrYKYB+TqWSsrhdo7DXPQ2I5PwS27MV3?=
 =?us-ascii?Q?uuOlkIjgIHnRLNT+P/uSfcnpiCLYZ79kk93aVB9+9/+4+neEYWhImW6l7FdT?=
 =?us-ascii?Q?3kGcGra9aqVd3li6W8v64E3Jiaaxj1zvrY34dXXzmByda6IeoSx/FN1ylZe8?=
 =?us-ascii?Q?4C2ehjRen6EQeNOmY8/lmOLna+elzKdx9tATfCvpyAId2YM0QwCqOkFOy5ug?=
 =?us-ascii?Q?WUpxX2nQbQlMAbUU+9eh6cLOtvds7YHY0n6Fk2gpSdHVrgZ0P1dfdDwhOhDh?=
 =?us-ascii?Q?II6l++rWKHSb1TZl4bTonYFWumNnQTDffNlWCoCR1hs6pYjOAqSOdiisjMSS?=
 =?us-ascii?Q?B9eNZKDLeAZRjHVBU8S5Wq0V/tY6ANpRhNTLtYYh13cChyu0hR2HRMQjR42t?=
 =?us-ascii?Q?tfdW2f4/kK1Jk3+WwOLRg9sfXfN8FHWACw0MY64cTP/Ybn6seecTo/xcTSiy?=
 =?us-ascii?Q?mu/UHdA+2p4sbgocs/wZX82Pz5nnBa4P6P/tObBpDjQ500TKQTWoqwvDW7Mn?=
 =?us-ascii?Q?C6TovJbp6ChDWsHKAx4Gs8OH1RcfqtIAGXJrH4Qb3yMAfENqgEKGOCcQtzxh?=
 =?us-ascii?Q?urpt/JWRpSXkikEhcs7cfioBxAo2+Q1jZTUdISLENJfqEOfRwDr9xF8brGBT?=
 =?us-ascii?Q?QoWTJBQJQPlrarA+GD9O2mvXVJwK/7d6D20WjYJEa9LX7WdGls7p8D5RnLcy?=
 =?us-ascii?Q?b38MNzscnkQi0S7yt/3B40hRQImHwyzQfKoYCMriHsCAEc/1Yv6BNPU+sut7?=
 =?us-ascii?Q?uUSPI9uG7G4gxnuzF0AVnODHsdXJs12axYj9I4bPoHpNdybo0BvWc6JESroJ?=
 =?us-ascii?Q?nQ3OQvcdStDIsMvlyGEmAy1BLqyRWbs=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc00981-6251-4390-a1b2-08da211c6374
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:18:24.0703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdodyvY7TElZAQC+ohM4I2dM/ZLQrBRFdgKmo5eSf4gu6hI4hSIF+44QCKGvG5kN+G5ekDz+b8LdLUSzIxdIBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR04MB5229
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch series allow user config PWR_AVG and VI_AVG in PMON_CONF
register by adding properties in device tree.

Example:
	adm1278@11 {
		compatible = "adi,adm1278";
		......
		adi,volt-curr-sample-average = <128>;
		adi,power-sample-average = <128>;
	};

Link: https://lore.kernel.org/all/20220302123817.27025-1-potin.lai@quantatw.com/

Potin Lai (2):
  hwmon: (adm1275) Allow setting sample averaging
  dt-bindings: hwmon: Add sample averaging properties for ADM1275

 .../bindings/hwmon/adi,adm1275.yaml           | 68 +++++++++++++++++++
 drivers/hwmon/pmbus/adm1275.c                 | 40 ++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.17.1

