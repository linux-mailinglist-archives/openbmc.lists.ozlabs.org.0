Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110114CF3AA
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 09:33:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBsDm6h8Jz3bTn
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 19:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=iiEZCz6J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::70e;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=iiEZCz6J; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::70e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBsC05JSMz2xKJ;
 Mon,  7 Mar 2022 19:32:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWdQEOtWRg2ATTdX22RLWQDYKfcE9FPj8CNFcNGGX3P2NGuJXbvrBgYfi2day6t3kFsscOG3/6KVqqgtpQJs3nq2tKwl67x6OWNO28tvR5Erk/DoB+VJiRmbiGZv68EI4UFqMjgK9qgpFOPDINzC4FKp/AnGEGWk1D9lqZv+Hlco6llMyfHEATy8UTZxaypW01MEA4pqZ9isQlXZm9EZGJoXZX8GI6QNYIgg276+iOnPIBieM7swv6/5cl4vouM+42NCrh1/CxpAB6e2N9Hl1+MM/ly64gnkbDVAwhlU8hCK/ZGWVy7s92fUZyYRkVou5pYpRWTUlTL1XUOJGo+l6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PKhwIM5K3x7SHDTGWhi/DpFlhUkIdxzjkSVarXoNIs=;
 b=jXMP1WakOVGM6q4/HqDuzDfcJkp+I0ppmM7RF+bO4VzssHfLUZPp3iKwQONWxjPo9/fHQtsPhMPVya26PyzV+4Z0+PKQZzMmqQheejlzPezKzjFHjYssv4mdciDm1lyMdxqW3vpYl8m/gbiRBK/xekOVX0XXfQJMpqxz56Aqwm0fYei5/Q8G4OWJLlFZMwEJ79vDboZzXfwV652nvPISSVMCJj/wwf3+2GFGIz7XP5dVn/fG7MxyFP6bqB+HXfXWG5RRjDfNASxI1dEAS617nEWnMuimKY+Gj+ESJwWx4ZDKhSv8fZbYbAPuppqxVskvDNLMCtRqv0Je84rg9F6NAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PKhwIM5K3x7SHDTGWhi/DpFlhUkIdxzjkSVarXoNIs=;
 b=iiEZCz6JDHJil/544/1qYDHMuljZkMiT7ZJVgHxYxesCp6YxES/PPXmanbN5aVjmkOela+R91nVqpGbPY2MCjv7qIWkAkla7+Q3Lz36Vg2Bn1CVyq3wBBp7nrXvi2O/NFqYTwwXeIbtvlaw3C/SPwLfaFvtATT4bJ5KaZoR7zVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MW2PR0102MB3498.prod.exchangelabs.com (2603:10b6:302:3::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.20; Mon, 7 Mar 2022 08:31:54 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 08:31:54 +0000
Message-ID: <ab145110-6a9d-8a1d-811d-0c209b4bac60@os.amperecomputing.com>
Date: Mon, 7 Mar 2022 15:31:40 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
To: Lee Jones <lee.jones@linaro.org>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-7-quan@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <20211224041352.29405-7-quan@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0239.apcprd06.prod.outlook.com
 (2603:1096:4:ac::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebf272cf-7e9e-4c35-e67a-08da0014ef77
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3498:EE_
X-Microsoft-Antispam-PRVS: <MW2PR0102MB34986235BADACF638826704DF2089@MW2PR0102MB3498.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MDpBYn2/e4hoot7AOFERWYlrjQ4BogWItAS8iCel7fwGd9H50G2rX8Zh888U13CTUKXl/zIJwIAIiBP9WptsZ+/v9VxgEXfCRHYJcp0sjp+N6FJThenGpsPuirBwI7kUMTdqqjkr4rchlJA6g3Zud3dRk8t/hKPKJX2TFMMu0ZoEMdJpW2Ofg966s2i0BK0V8tHpRkNobIutwe4bklCGuSZCUAEZKF/uwhw+gIp4oGB7Sm0U/hYkygOWnfDdxLHl15lnYXRvuco3DPV57tVXD+h0jEo87ZP/smJFX6Lc68b7e1/VDEtqo3GeOSF5tx/M0o7OUB+Av+DmfqbY5pqaQB8z9csRTRfRSvkdnuiNNX8NFUSsnXhHWb5l+KQLby2LCbwYz9omM+W9iFizJiFPfFWYFJKDMXdtbyCPrR6xDzapCo3mqYn/dx74Cdl/skUDRFfn4ClyKBbtkzCFtmBA+/NMNp/9sn/HyEncnYWIplX0f4U9dxhcZpOhUzG9i25Um9GiROYD6LTy1i+uU0DuBnFlJiGJs7vhtY+4r+D+dRTSzyrm+pZV0tykyQkdNvapHVcp3LMoQSQup8SN4+cuQH3oZnT8wa5aRSchyrenD10rAWHs683iLxmVWtusN2q9LyxJpCgzdVZ1UqXwWKHaEfCoPnBLMSTqsGrPFhEEtUeCsPpQnHVH2hAUHpwOsZd9f4JgI4vPzquvwXLKsRDquic4PbTcN/44Zz582rSGwR9KU4bb3HO/JpehccENSZKDp1gg17ar0HEn0q+3FWEWs1At/D8ICCtJ9ZoXa7IImryz503JxP6bfNTV/kSICOxI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(5660300002)(52116002)(6916009)(31686004)(6506007)(26005)(38350700002)(8676002)(66476007)(6666004)(966005)(86362001)(6486002)(55236004)(53546011)(54906003)(316002)(31696002)(2906002)(186003)(66556008)(4326008)(83380400001)(508600001)(8936002)(66946007)(7416002)(4744005)(38100700002)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9VWjEyRDY4NEdYK01KOHk5NGdJdWc2NkFZQSswaGV4eStjS2NWTW5SV3Bt?=
 =?utf-8?B?OE9LS21KU1ZLc2RKN0M0dm1vUFVPNTlwVEoyRWFwalN1UkVHRzVkOG9HNW8x?=
 =?utf-8?B?eW9CMm5mWFM4NHlaekZxeG8xS0c2dWtNTmp2YWdSSVZSSXNSbS9GeTh5SHRr?=
 =?utf-8?B?b3RGazdiWFZPcllPUll5SWNWbUUvMGJGZDNGSUpOMmVjVkREWVFKQUNHWStp?=
 =?utf-8?B?N2p0bG82aGZwbWo3ejdta0dhNERnSkp5Nys2Z2FjWFNMejY1ZHRCTjlhT2dB?=
 =?utf-8?B?TjlMZUIxNm5rS1hZakh1VEZrdHFrU0lES3dXTUxTcjZuNVhjYmZnTlQvamFY?=
 =?utf-8?B?UEdOREFBUHBEdFhzRHU4NDVXbnJDd2tjbGVwa05qaTdsL2hOT2ZuZXU2Tkpz?=
 =?utf-8?B?b0JOL0ZrYjRTUERYTUJYVVRnRWoyMGtma3I5UDdJdXI2aytESVYySUxTQ2RC?=
 =?utf-8?B?RmZLRWsvb0VBeHd5NXQvQ3B6cVZwOEtQNkd1ZmNiOGJTdVBsYnEwSXFoZGV2?=
 =?utf-8?B?RGNGdEIvZzJyem1Zd1ZzWFdNa0RNSUNFZEpQZS9xQXdxMGNjMEpZYzZIWVNv?=
 =?utf-8?B?MlNtVWcyTlBSQ3JuRWp4WnVXdUFxNkNwZTVwUW1uTm5sR2tKNjJjajNFVGJn?=
 =?utf-8?B?UmxxRkZkczh1eW0wL2h0L2dRblREUDlYdDFDRkhJbVdYSjdoV2l6RkIxWmxM?=
 =?utf-8?B?eTBDVW9FdFdUeHJJZFBuMm1Vd25Yc1VLam5JWmg1R0lORDRhbHl5VmxzcFo5?=
 =?utf-8?B?K3NzQ0xjSU9Qakx5aW12ZHFOQ2IyWDdNekVIa2M3dStBa05RN29UZlpQQ2c4?=
 =?utf-8?B?RkFHc1RYaWhiODY1eEdqVU5oSkp2aGd6blh1dlN2djNSclNPcnB1bXgrK1lF?=
 =?utf-8?B?UTloUC9PRXdYY2w1R2Z0UFJ0UFNFMW5IN2xwcFd0V0xjQ0ZCSHJXYnB1UWtG?=
 =?utf-8?B?Z0pueUdocTdybnFkR1R2SnovOURhaW83bGc5ZlBRWjRMZm5YaTBpbmMvYis4?=
 =?utf-8?B?THZyQmNCaStHQnl5WmUyUDBaUFNzNUpNQmFYUXFQN0lSMHRWQk9uRktHYlFv?=
 =?utf-8?B?YkFQVmFEb1RYM3lGT3lvQktCUUQxVGNjNG9LL0VDR1RTTVQyNXRXRnNTb0F1?=
 =?utf-8?B?eGNWVC9UWEgrbEhtUjl6RkpkVExGU0VmWk1YZkVYMzd1bVovRGROZXVjYkdS?=
 =?utf-8?B?aEdVQmV1QXJtYk9jNXpPYVNRbUxtVWE1QWlmWGhiVE1pQS9DQWx4OVl6clU3?=
 =?utf-8?B?T0pCY0gvRG5TYlpGUWY5RGFlTEZBT05tclA4RDJ2cSs3VjdMMGpQbUVjVi9N?=
 =?utf-8?B?TWkwZldTb0pCY0tHMHhGU2wyUXB5TlBzdXBERVo4ZVNEbHBIcXhrZjg5VUc1?=
 =?utf-8?B?MkVXSEJZaVNibG81dURLV2NhYW9LMVFwZjVtbDBhWk04ekVqdS9uRktyWVpy?=
 =?utf-8?B?U0hQZ3BPRDNUZWxpeThUOVdVQjV5NlVoT3Rvc21uTS9rSHNld3pIM0dHcDNk?=
 =?utf-8?B?RExPQVdKVzFHczNkcFpyc2R6M0ZCdnpXK0ZVMEhacVpiNloxSlhpL0F1Y1Rn?=
 =?utf-8?B?V3hQdTFrY1NuSVQrOVhRZkVad3VFU2tNK0k3dHozWk1ibjc1cUpQc3FSUFFm?=
 =?utf-8?B?QWY0UkhsR2dPTHVMQUZpVXExdngxZGdMb091RXlMNUU0K2tlQ1dBcWV5R2tL?=
 =?utf-8?B?THZNMVg4WlBaakIzU3M3eGY4MTlIUXNxNE9KN3NYenVsZGNGblZNdGgwTHM0?=
 =?utf-8?B?cy9JaFBVcEc1OWVRVXhyc1RuSmpZU3BCQmc1SEpONFdSbzQvS2h3V2pqYld4?=
 =?utf-8?B?WlVJQVZGRzcwWFNJZS9tSENWaVFSa0RWenY0T0hjVGtCcXAzeVlRdndRSmdJ?=
 =?utf-8?B?WmtjRk9rWFpsc0oyVTdNdEUwdUVBSkVaeU9hN1BGa3haVUJoLzdvZ2Uzcks1?=
 =?utf-8?B?SnVCcTM0cnVEZitVYjRuK0psNkx0TFdkQTlvV1pKcFh5ZFlxbTczZ3VMSERa?=
 =?utf-8?B?QU4vLzE5WlFIK3B6SndLbFJ3QUZyeHpST2tWVEtiY0lUYmI2L2lrN2lOa012?=
 =?utf-8?B?OVJMdGU1bmdxdk9VT3RZNG9idzExWVpoWXJQdmJlL1VsUjRheWEzZWE2Q1ly?=
 =?utf-8?B?aXdqMWFBVHMycG1ZRDVIZG8yWEd2MGFqNjdrQTFNUkorYUlielJqbDAyTUFu?=
 =?utf-8?B?UXY2MkcvTkR4b0Q5dXBndkl4ZkNiZTJBQ2grN2FwUlBXc3Mzam5wRmt4bFRv?=
 =?utf-8?Q?BMLOob4a1weZN6W6tMMSVBWgL8nnrJiy5l2Ay3oego=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf272cf-7e9e-4c35-e67a-08da0014ef77
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 08:31:54.6599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMX2SGCeNcFzALPXybtIbMBmnuraTP665tPxHCFhu0ivm2/II02cMSTzah2097nUvsV03+womrkmqZGPnZc3yYljc3ZnMy3SXj5f9003cqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3498
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Open Source Submission <patches@amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phong Vo <phong@os.amperecomputing.com>, Mark Brown <broonie@kernel.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Lee Jones,

This mail is to reply your comment in https://lkml.org/lkml/2021/12/29/120

Thanks for the review,
- Quan

On 24/12/2021 11:13, Quan Nguyen wrote:
> This commit adds Ampere's SMpro error monitor driver for monitoring
> and reporting RAS-related errors as reported by SMpro co-processor
> found on Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Change in v6:
>    + First introduced in v6 [Quan]
> 
>   drivers/mfd/smpro-mfd.c     |   1 +

[Lee Jones] Separate patch please

Will separate this smpro-mfd.c in single patch only in my next version

>   drivers/misc/Kconfig        |   7 +
>   drivers/misc/Makefile       |   1 +
>   drivers/misc/smpro-errmon.c | 571 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 580 insertions(+)
>   create mode 100644 drivers/misc/smpro-errmon.c
> 

