Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96F55B8F3
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 11:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWjGZ4h2Wz3c00
	for <lists+openbmc@lfdr.de>; Mon, 27 Jun 2022 19:33:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GoM8xBsW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.212.110; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GoM8xBsW;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2110.outbound.protection.outlook.com [40.107.212.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWjFy1Msbz3bqv;
	Mon, 27 Jun 2022 19:33:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/uboH+Dv2j8nv7bnZsJ6xdTq+I9T22L7RXpNTKNr6WF/sAMfwdlURbWbLLR6r6Ruy+VB8iqMmg9NvtUXyy7F78dC/3kpKuEeKt6X3/j8Cev56TzaGy5ZVpYO9nJujrK9PuiVUhIo0UiKAH8wPKLjTv+D38tbSctttslwC38Rsa7oLIu1Z3S3aNR20nmdtWuBSqrblkb0BQPj4fiZ+4Bxg4c2WdEEZtdky5piroSFjwTvONnrLAZ95d/ZimmnjKVxKUedh+KDtCCTYtwUy8+rLTUfZg0rtP8AKgAVCei+rydPzLxUR9TiFHWF04j0K1Y8zrxxIwbMtyyTpL83U7VUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybSgXZJ+srHE89dZZzEPWcLbd8vmV6hay2/MHGsXXaA=;
 b=nyLJ4oxuuPXlhq7LILZ+xrQv8tFYpIKOuwLMpa4LDpdKrVMpThPXu6KZA+xyXP/wrwR14UOwMmNgefWw49+XK3ixGqdTGFTLJyC/bmouyh4M32AsEy/A0Dvs33VOl8KPSP2bzr51qZCQR/dcSv1D26Jr6Hboi0tFIBDlR6Eh/GvgQJ85zuxQygeUl++0UE4z7yymvpGTFwgZubqc6gHl3eJr0Yw6H3rZKM4LgAFQ0AYco/tl3wu1F8dhyViteiXF9kRlayHYihRCQc69IIKT/Cl6Xc2gzF3OlRCCbstIw3cY4tl2vUA51oG/rjf3N/0tqDZ2Bg8gr2l19fPje+jptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybSgXZJ+srHE89dZZzEPWcLbd8vmV6hay2/MHGsXXaA=;
 b=GoM8xBsWvOx0WDNJ5F+qDu5YBt+dNKFP7Ek31GJ1UImhrJE0SGDekgiAOQuEB97T5kLctFGz98BS9bEISF3XGEr3euRCqN97+p6uSdmUGu2yZZKfUR61Ha5uaHdnipa4rK6N6XihcGqOrw+BvjViGn849JRAlu5hrE02nvyzamE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR0102MB3458.prod.exchangelabs.com (2603:10b6:207:1a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.17; Mon, 27 Jun 2022 09:33:03 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%9]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 09:33:02 +0000
Message-ID: <9120c167-38c2-f8c4-e039-4202d5844639@os.amperecomputing.com>
Date: Mon, 27 Jun 2022 16:32:49 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 openbmc@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20220621092120.2427152-1-quan@os.amperecomputing.com>
 <97934f38-4da5-ab9e-7089-d6e48edd5e6a@linaro.org>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <97934f38-4da5-ab9e-7089-d6e48edd5e6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c844a80-b55c-413c-b9c9-08da58200838
X-MS-TrafficTypeDiagnostic: BL0PR0102MB3458:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?dDNGYzAyQnpDdExJc1JKcG1GOERVYTBHK0g4cnljVjl3U0dDNUlYcXF5YnZW?=
 =?utf-8?B?RkdUUWVrdWpiR0RxUVY2cDdYYVk5UkNXZzI4TEJVKzlqemNydVNzUEdsK05z?=
 =?utf-8?B?Y3RIdXA4b0lBdHhNTmFucjQzOG5GbFdsODlwbkYweXk2M3lMOWMxWEVOMjZn?=
 =?utf-8?B?K2x4ODNIUU04Ui8yKzBxOWVoNitTU2RtSm9sblhOcDNNOWlOeUJ2VWZWalhC?=
 =?utf-8?B?dVFWL0R3SklKbzRsbS9ybFNXSHJyYTJXeGY2MlVuQ3RkbWNONzhZSzhRWGdu?=
 =?utf-8?B?MStoeW1KckYrV0JDdzBoN2tMTEp1dnhtQTE0TWZzNkhvNnRYZGI0aDJlQkh2?=
 =?utf-8?B?SnFRNFVFUFFnSis2emYzZ1Qra2tCVjB3SWpCL3UxQmNGTFJ3UXBzSlJadWF2?=
 =?utf-8?B?YzhUamVlUUsvTm50Y1JZaVd3L0F6OWtNd2o1ZlRKem5qTUxoZGZNK1lsMlE0?=
 =?utf-8?B?NER3VGVZR3RJU3RzS3crdlVwNlhOcVVFOUppeFZGeVhWR1A5d0N5dVFFeFdD?=
 =?utf-8?B?SlhDN0IxcmpJSDlvcnhVS252cHNVOTB1UFN5TFpWVnRYcFRHYjQwRW15Qktw?=
 =?utf-8?B?RTA0azNjcjNnS0ZHcENvQ2ovYkZ5emp2SjloWWtieElUT3RTYnFUd3RQcTl5?=
 =?utf-8?B?MDZEUENmQktPZmI0RHVSUFZlZTVzWTVTNW9XTnUzRmVtT3l5MTdsOVlmbXVj?=
 =?utf-8?B?RThVSU93TmgzaHdaOGhXOGNKOXd5VTRkejIyRmlmWFRzZ3EwSHZ2TVdxa2lQ?=
 =?utf-8?B?QkgrbGdhNHNUK29YNGpBRGh2dWpKS1gwdkpSU0JpN2dlckU1K1hBTHFHbjdo?=
 =?utf-8?B?djcrdnV1ZHhmUWZIRlNCV2o5Y3hsUWpaMnZkYW5kaHlaWmt2cHhzcng3K2Z1?=
 =?utf-8?B?YkZpbVlBWWdmZlNLOFRzTDh0dlhKM3pUcTduU3RrMDJqRFltSTZUWHFWRnJ1?=
 =?utf-8?B?VE15L3B2cUQ1RlZZSUlpNUpJTFRrSnYxZFpnRVY1R2VXZEFjT0NlWVc4ZmQ1?=
 =?utf-8?B?T3pJRndScmRESnhJdjZTZm91OWlvbHUzUUpucHZ0ZUNRczRjdmw0Yy9Xdkw5?=
 =?utf-8?B?endpMGQ1TmoyTGlXYU96VDA5VGR0Y3VrUi9QeHA5SkNZckowU3pHajM2cldw?=
 =?utf-8?B?cFZIUlBxaXNHWS92QWJyZktNRDRyKzlDdlJsc3JGK3NGMVUrc2NxL2pkN0po?=
 =?utf-8?B?a3R2YlJIKzZpTHFhWSs3Mm1tMzVQVGJNREt1TkZWWTlNeEJIZzMzVHRvdDkz?=
 =?utf-8?B?d3NNekgxVzU0SUYvTlVRVW9maWUvVFVpV1dVc3ZaclIwVHVWUT09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(39840400004)(376002)(7416002)(316002)(2906002)(5660300002)(31696002)(38100700002)(8936002)(30864003)(66556008)(8676002)(86362001)(921005)(83380400001)(6506007)(53546011)(52116002)(38350700002)(6666004)(66946007)(66476007)(107886003)(26005)(41300700001)(6512007)(4326008)(66574015)(110136005)(54906003)(2616005)(966005)(6486002)(478600001)(186003)(31686004)(43740500002)(473944003)(414714003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WEJrVHduQXNieHNFNnp2cG5HV0lQY0xaemFKQk5ubXEwL0R3WHZpSmMvdVFw?=
 =?utf-8?B?TDJlTmRsQ2FzTXozUVF3RnZnWXEwTUdmY09CSzRxQ2dEbXJnNUtaajdpeXln?=
 =?utf-8?B?My84RVZvekxjQkdoTXRqOG5YRWhFcDBQK242ZHN2Y0MydDhtWkc5UWxDdTBW?=
 =?utf-8?B?TUdyOEFsMEFDV0d5VUQyZFlXUjNIR1pFLzVISDZZRUp6Y1k1eEx1bFRFcDY2?=
 =?utf-8?B?czJHMUxPZkxwa3hXMEdaMEI0ckJXVkVrZ1pNaXBFaXhyUzNRQ0pXbG5YREY5?=
 =?utf-8?B?b3BrR2lZWit5L1lJRnp1TXNXWWFrM2N3dlo1eWJMbFpLN1RiaUQvcTd3cmVq?=
 =?utf-8?B?RHRXb1ZKeVU4Zmp6SFFlU0RaSFRVZHRFeW9zYnVmMVdVYUJmMyt5akVGbmNV?=
 =?utf-8?B?NVJzbTVyWFdSWTJlOHFCdTlSN3JjeXBqNHFSR0xyL25uT2xBZExJclkxUkg4?=
 =?utf-8?B?VDl2anBQN1NjZkZRTkxUL3p2YThIb2FyR0hwa0NPYXczVklYaWdlWDdPbkRQ?=
 =?utf-8?B?TzBwdjRDblBsNVAyZnJPRENicUg5U3lXcVBac0UvbzE1alVHTnNYQ3hLVWhp?=
 =?utf-8?B?TTdqMUN0QzBUNUh1N3pBU05jUnU2UE9MQ2E0ZHA2QmJZbTJpTHpTNGpUS3dq?=
 =?utf-8?B?Mk9nQlNZZkZUSzJOUTdhS2RaSFVENVBlT3ZWNXpwdEZsZmpYYUdiWW5obEJL?=
 =?utf-8?B?Y3hEVnZYdTk1MFRQbGNQQWRrV1FYQVhCN2ZIRHNYUjRsalJON2JqM0JLNU9x?=
 =?utf-8?B?OXlhaGVxajQ3SmJwdzlOelNSODFVVERjQVIwUlRlaEJvTE81dGJqVDRUZVlk?=
 =?utf-8?B?YWp1WFRqbzEzNWtCNWMwbHJOMDl2T2Ezb1RYa3MrK2JxdjFoalVSSUlzZTMr?=
 =?utf-8?B?L1JGbHpKS0pxb0RGakgvSlAvemIrbnIxQk9ibUNrQ1lncXhYK2REc3ZUSFdY?=
 =?utf-8?B?RU8wUytqTlNjY1IzaWpzbEpjd2xITGFpUkYzclQvTy9ISDNOMHFINUhKdXRO?=
 =?utf-8?B?dGVlOThhN0ZmZHVKYk4zaXN2QWNsdmVQVWxlOW01b0NtMlNDcDl3aENkQWR1?=
 =?utf-8?B?b1dpUkx4ck44QkdFZzVZdEJ0ZU94SVpiaVJDZENzb3o5cjNyWjZEUHQ2aVpP?=
 =?utf-8?B?bU9YRmk2ZjVRVnhFZHNZT1pyS0NOZll4bE1BMFJXelMyUVh0cGdZak4weVVD?=
 =?utf-8?B?ci9uVDVuK3RpK1I1M2FLQ0swdG02R2p1NGRhVmhnOHhlL0Z4eTZNNzh4TEly?=
 =?utf-8?B?dnN0R2pWWnFkVmh1M0p3bzU1U0pSWHVpeFBId1RRM01TOWJrL0xva2lMVk91?=
 =?utf-8?B?azF4MmpnelZlaE9EZHJ0WGk2OUxDUkc0VXU2YXBUUkdMeE1LY2VtQUwrQXNK?=
 =?utf-8?B?dmVsL0t1U1lrZGFRZUxybEVlVWZSVkpXd042bDBCSGsybXZjaFFRck5RblZp?=
 =?utf-8?B?OEhxYk1NVjFkc0I2RjBveUNJLzB6TzFwVXB2SXQ2UjIrU2tSQVNjYlRhaGtK?=
 =?utf-8?B?ZU9GRmxSdDJqYlUrNU1McmkzUXd1R0ttejJad3p5UkE3YVlZaXJiNWlBQi9S?=
 =?utf-8?B?Yys4MXZXa1A1Q3RxMXhsNDh1MFBYdkJyTmNRSWtmQk12T0RJY2hYZURWcmFB?=
 =?utf-8?B?QzZVN2NpSW50WjhiU0V0NlJVT2x3UldWNUdCWXR2UUd0RXlUekpKSWxXa1BO?=
 =?utf-8?B?bW0xdFUxNW15MjZMdDRXcGdjV085Q3JqUEVRSE5BWnJIVFBkNG1CMWtCY2NI?=
 =?utf-8?B?Ym16cklyZUowbHgvWHlieWhGeTlFMU05dXJxYnBWL21uUUFOWnVLMFJWTlBa?=
 =?utf-8?B?NkhiS3N6c3FWV3VLT1UwVXhTWGdsajJJUWh6Ny9tOUgrN0NIMmVYaDNLUE9O?=
 =?utf-8?B?SHl4cU9uVVQ2U2RwWERlZHRSNmUwSXh4TmJWM1dXRURiNHlPNW9OeGE4VDhs?=
 =?utf-8?B?dWJObS9wTGVid1Y3RUJNeWwvRVBPajYraWRQZVBLSXZIRkIxUEtlMVVjcW1l?=
 =?utf-8?B?WkwxTGRwV3hLYkJxaVMySTFuK0RnQjEyby9TeDdneUR6T3pEYitncTVvb01o?=
 =?utf-8?B?RVd4bFJaVnlWRVU4NzlZeFFFcjVvcmtUalFLU3huc0xvNHN3NWNEMFRHTHpK?=
 =?utf-8?B?Ympyb2pXTFlVQlZaRUE5LytuV3h4c3ljTmtUaHNnQkZHNDhWMTM2NTVKL09o?=
 =?utf-8?Q?XpJoRnwqNMUbTQz50ugoWcA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c844a80-b55c-413c-b9c9-08da58200838
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 09:33:02.8197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXhEpY8LodNydxU3P2EZAJFVyGzV1lTYAYv6Mrs1Tvjz1PNRQGdqsi7NPC78yumeSz/eCq0vHW5OUmF2pvlN4a8TL7RINWWt41KdseBXPBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR0102MB3458
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
Cc: "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/06/2022 22:51, Krzysztof Kozlowski wrote:
> On 21/06/2022 11:21, Quan Nguyen wrote:
>> The Mt. Mitchell BMC is an ASPEED AST2600-based BMC for the Mt. Mitchell
>> hardware reference platform with AmpereOne(TM) processor.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
>> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
>> ---
>>   arch/arm/boot/dts/Makefile                    |   1 +
>>   .../boot/dts/aspeed-bmc-ampere-mtmitchell.dts | 579 ++++++++++++++++++
>>   2 files changed, 580 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 5112f493f494..93c236c14fa0 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1558,6 +1558,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-ast2600-evb.dtb \
>>   	aspeed-bmc-amd-ethanolx.dtb \
>>   	aspeed-bmc-ampere-mtjade.dtb \
>> +	aspeed-bmc-ampere-mtmitchell.dtb \
>>   	aspeed-bmc-arm-centriq2400-rep.dtb \
>>   	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>>   	aspeed-bmc-asrock-e3c246d4i.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> new file mode 100644
>> index 000000000000..42425e13030a
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -0,0 +1,579 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2022 Ampere Computing LTC.
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +	model = "Ampere Mt.Mitchell BMC";
>> +	compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
> 
> The compatible has to be documented. Please rebase on top of:
> https://lore.kernel.org/all/20220529104928.79636-3-krzysztof.kozlowski@linaro.org/
> 
Thanks Krzysztof for the review.

Will rebase and add compatible string as a separate patch in next version.

>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +		bootargs = "console=ttyS4,115200n8 earlycon";
> 
> console is not needed, earlycon is debugging tool so definitely should
> not go to mainline widely distributed DTS. Remove entire bootargs.
> 
Will do.

>> +	};
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x80000000 0x80000000>;
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		gfx_memory: framebuffer {
>> +			size = <0x01000000>;
>> +			alignment = <0x01000000>;
>> +			compatible = "shared-dma-pool";
>> +			reusable;
>> +		};
>> +
>> +		video_engine_memory: video {
>> +			size = <0x04000000>;
>> +			alignment = <0x01000000>;
>> +			compatible = "shared-dma-pool";
>> +			reusable;
>> +		};
>> +
>> +		/* 1GB memory */
>> +		vga_memory: region@bf000000 {
>> +			no-map;
>> +			compatible = "shared-dma-pool";
>> +			reg = <0xbf000000 0x01000000>;  /* 16M */
>> +		};
>> +
> 
> No need for blank line.
> 
Will fix.

>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		S0_overtemp {
> 
> Only lower-case letters, no underscore but hyphen. Missing prefix (e.g.
> key/event/switch/button)
> 
> See:
> https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
> 
> 
Will fix them to s[0|1]-[overtemp|hightemp]-event in next version.

>> +			label = "S0_OVERTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(V, 7) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(V, 7)>;
>> +		};
>> +
>> +		S0_hightemp {
>> +			label = "S0_HIGHTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(V, 0) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(V, 0)>;
>> +		};
>> +
>> +		S1_overtemp {
>> +			label = "S1_OVERTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(X, 6) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(X, 6)>;
>> +		};
>> +
>> +		S1_hightemp {
>> +			label = "S1_HIGHTEMP";
>> +			gpios = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_LOW>;
>> +			linux,code = <ASPEED_GPIO(X, 3)>;
>> +		};
>> +	};
>> +
>> +	ltc2497_reg: ltc2497_regulator {
> 
> No underscores in node name, no specific names (Devicetree spec requires
> generic), so ltc2497 has to go. You could add some more specific
> prefix/suffix to describe the function.
> 
This is to monitor peripheral voltage so it would be updated to:

          voltage_monitor: voltage-monitor {

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "ltc2497_reg";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	gpioI5mux: mux-controller {
>> +		compatible = "gpio-mux";
>> +		#mux-control-cells = <0>;
>> +		mux-gpios = <&gpio0 ASPEED_GPIO(I, 5) GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	adc0mux: adc0mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 0>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc1mux: adc1mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 1>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc2mux: adc2mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 2>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc3mux: adc3mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 3>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc4mux: adc4mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 4>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc5mux: adc5mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 5>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc6mux: adc6mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 6>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc7mux: adc7mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc0 7>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc8mux: adc8mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 0>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc9mux: adc9mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 1>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc10mux: adc10mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 2>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc11mux: adc11mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 3>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc12mux: adc12mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 4>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc13mux: adc13mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 5>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc14mux: adc14mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 6>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	adc15mux: adc15mux {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc1 7>;
>> +		#io-channel-cells = <1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&gpioI5mux>;
>> +		channels = "s0", "s1";
>> +	};
>> +
>> +	iio-hwmon {
>> +		compatible = "iio-hwmon";
>> +		io-channels = <&adc0mux 0>, <&adc0mux 1>,
>> +			<&adc1mux 0>, <&adc1mux 1>,
>> +			<&adc2mux 0>, <&adc2mux 1>,
>> +			<&adc3mux 0>, <&adc3mux 1>,
>> +			<&adc4mux 0>, <&adc4mux 1>,
>> +			<&adc5mux 0>, <&adc5mux 1>,
>> +			<&adc6mux 0>, <&adc6mux 1>,
>> +			<&adc7mux 0>, <&adc7mux 1>,
>> +			<&adc8mux 0>, <&adc8mux 1>,
>> +			<&adc9mux 0>, <&adc9mux 1>,
>> +			<&adc10mux 0>, <&adc10mux 1>,
>> +			<&adc11mux 0>, <&adc11mux 1>,
>> +			<&adc12mux 0>, <&adc12mux 1>,
>> +			<&adc13mux 0>, <&adc13mux 1>,
>> +			<&adc14mux 0>, <&adc14mux 1>,
>> +			<&adc15mux 0>, <&adc15mux 1>,
>> +			<&ltc2497 0>, <&ltc2497 1>,
>> +			<&ltc2497 2>, <&ltc2497 3>,
>> +			<&ltc2497 4>, <&ltc2497 5>,
>> +			<&ltc2497 6>, <&ltc2497 7>,
>> +			<&ltc2497 8>, <&ltc2497 9>,
>> +			<&ltc2497 10>, <&ltc2497 11>,
>> +			<&ltc2497 12>, <&ltc2497 13>,
>> +			<&ltc2497 14>, <&ltc2497 15>;
>> +	};
>> +};
>> +
>> +&mdio0 {
>> +	status = "okay";
>> +
>> +	ethphy0: ethernet-phy@0 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
>> +		reg = <0>;
>> +	};
>> +};
>> +
>> +&mac0 {
>> +	status = "okay";
>> +
>> +	phy-mode = "rgmii";
>> +	phy-handle = <&ethphy0>;
>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +};
>> +
>> +&fmc {
>> +	status = "okay";
>> +	flash@0 {
>> +		status = "okay";> +		m25p,fast-read;
>> +		label = "bmc";
>> +		spi-max-frequency = <50000000>;
>> +#include "openbmc-flash-layout-64.dtsi"
>> +	};
>> +
>> +	flash@1 {
>> +		status = "okay";
>> +		m25p,fast-read;
>> +		label = "alt-bmc";
>> +		spi-max-frequency = <50000000>;
>> +#include "openbmc-flash-layout-64-alt.dtsi"
>> +	};
>> +};
>> +
>> +&spi1 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_spi1_default>;
>> +
>> +	flash@0 {
>> +		status = "okay";
>> +		m25p,fast-read;
>> +		label = "pnor";
>> +		spi-max-frequency = <20000000>;
>> +	};
>> +};
>> +
>> +&uart1 {
>> +	status = "okay";
>> +};
>> +
>> +&uart2 {
>> +	status = "okay";
>> +};
>> +
>> +&uart3 {
>> +	status = "okay";
>> +};
>> +
>> +&uart4 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +	status = "okay";
>> +
>> +	temp@2e {
> 
> Generic node name, so usually it is "temperature-sensor"
> 
Will change all tmp75 and tmp175 nodes name to temperature-sensor in 
next version.

Thanks a lot for the comment.
- Quan

>> +		compatible = "adi,adt7490";
>> +		reg = <0x2e>;
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +
>> +	psu@58 {
>> +		compatible = "pmbus";
>> +		reg = <0x58>;
>> +	};
>> +
>> +	psu@59 {
>> +		compatible = "pmbus";
>> +		reg = <0x59>;
>> +	};
>> +};
>> +
>> +&i2c3 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +	status = "okay";
>> +
>> +	ltc2497: ltc2497@16 {
> 
> Generic node name.
> 
>> +		compatible = "lltc,ltc2497";
>> +		reg = <0x16>;
>> +		vref-supply = <&ltc2497_reg>;
>> +		#io-channel-cells = <1>;
>> +		status = "okay";
>> +	 };
>> +
>> +	eeprom@50 {
>> +		compatible = "atmel,24c64";
>> +		reg = <0x50>;
>> +		pagesize = <32>;
>> +	};
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9545";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x70>;
>> +		i2c-mux-idle-disconnect;
>> +
>> +		i2c4_bus70_chn0: i2c@0 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x0>;
>> +
>> +			outlet_temp1: tmp75@48 {
> 
> Generic node name.
> 
>> +				compatible = "ti,tmp75";
>> +				reg = <0x48>;
>> +			};
>> +			psu1_inlet_temp2: tmp75@49 {
> 
> Generic node name.
> 
>> +				compatible = "ti,tmp75";
>> +				reg = <0x49>;
>> +			};
>> +		};
>> +
>> +		i2c4_bus70_chn1: i2c@1 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x1>;
>> +
>> +			pcie_zone_temp1: tmp75@48 {
> 
> Generic node name.
> 
>> +				compatible = "ti,tmp75";
>> +				reg = <0x48>;
>> +			};
>> +			psu0_inlet_temp2: tmp75@49 {
> 
> Generic node name.
> 
>> +				compatible = "ti,tmp75";
>> +				reg = <0x49>;
>> +			};
>> +		};
>> +
>> +		i2c4_bus70_chn2: i2c@2 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x2>;
>> +
>> +			pcie_zone_temp2: tmp75@48 {
> 
> Generic node name.
> 
>> +				compatible = "ti,tmp75";
>> +				reg = <0x48>;
>> +			};
>> +			outlet_temp2: tmp75@49 {
> 
> Generic node name.
> 
>> +				compatible = "ti,tmp75";
>> +				reg = <0x49>;
>> +			};
>> +		};
>> +
>> +		i2c4_bus70_chn3: i2c@3 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0x3>;
>> +
>> +			mb_inlet_temp1: tmp75@7c {
> 
> Generic node name.
> 
>> +				compatible = "microchip,emc1413";
>> +				reg = <0x7c>;
>> +			};
>> +			mb_inlet_temp2: tmp75@4c {
> 
> Generic node name.
> 
>> +				compatible = "microchip,emc1413";
>> +				reg = <0x4c>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c5 {
>> +	status = "okay";
>> +
>> +	i2c-mux@70 {
>> +		compatible = "nxp,pca9548";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		reg = <0x70>;
>> +		i2c-mux-idle-disconnect;
>> +	};
>> +};
>> +
>> +&i2c6 {
>> +	status = "okay";
>> +	rtc@51 {
>> +		compatible = "nxp,pcf85063a";
>> +		reg = <0x51>;
>> +	};
>> +};
>> +
>> +&i2c7 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c9 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c11 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c14 {
>> +	status = "okay";
>> +	eeprom@50 {
>> +		compatible = "atmel,24c64";
>> +		reg = <0x50>;
>> +		pagesize = <32>;
>> +	};
>> +
>> +	bmc_ast2600_cpu: tmp175@35 {
> 
> Generic node name.
> 
> Best regards,
> Krzysztof

