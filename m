Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD86567D0D
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 06:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld5xB2J4mz3c03
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 14:22:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Nw6JlShd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.244.106; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Nw6JlShd;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2106.outbound.protection.outlook.com [40.107.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ld5wZ3JtVz300x;
	Wed,  6 Jul 2022 14:22:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnmjlRP2pL4W9uG20j/xN+41mTmq8K5SQqygueR60M3Myr+ar8qkUW4hMH6Q8w28aTCkDvEEaQxHeFxO4FdBtXbJyGejpN4GCEF8lRACCwPY26DDKbIn5W1SP9ixb/QM/btugc3XaXhgCgnYrbvbeZgWHa7WPWwSvdC8wgX1+THUWJH4WhIa4CXd4TH8nV5Xurk6X7h7gcuDRkwC0VtToSZKogB0h39D1roc6fbXsvgbLF/mnHZRSkrhWi1+zamz4eRA1RUGPAFPkpQBWmcVV+qcLuPEKDrwRC0uUe+Ele9lsSS2G+vFLHHFY91FKUW4ffIYyG6W5xRwnjkoLrDZRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7VL3IgyFLKTjem93FjW19WJUJFv3PTFAMzp2hIbEPo=;
 b=cr0AOnn7y7M9u6Pj5+wlLTUu8aVfU6ysL4ZV/KzYOwF+jEAQAb0XMX3JY7BsSSdeMPkx4FfuDr1NqFHF7lGmNmM+AffqpEr7f22mN8zjtLfPsrv8e+qbGhhMrE+/b9WPKqebuhn8tIm0/SZO1NLbpFKAyVXmwMIOgALHIPDpCCcXcivRFyGB1B2Hr3l40V6WbVvXGGZ3H7Zwa4uBB7KaADAi1+HiNTIGazMWtdjri0Q8BPFGm1MjFIynB1D9knVglDa5h8p8Bx3xu3nnZCc3LCIJXmlMCerBAmTR7a8DQ4basBoXoVDPf8F2Sn2c1jVfrYqubZLe74A++Z1SxJgnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7VL3IgyFLKTjem93FjW19WJUJFv3PTFAMzp2hIbEPo=;
 b=Nw6JlShdtVrtuw1+QpdMJF+3AAi38h4sTdnH7dQ7RCEeVXYg5rVF2Yd4zHOFr7MciwUgls/TwLJlZqG292rwbbZSdbNUTMowmW/5S6drW98MbeAuLwiiIbE/t5j8iDIJTPoX2UomkGXqjT2Kqip8S8abugNcE38PgPSsHXY7CV8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 BL0PR01MB5299.prod.exchangelabs.com (2603:10b6:208:31::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.17; Wed, 6 Jul 2022 04:21:41 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::7535:773:f979:893e%8]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 04:21:41 +0000
Message-ID: <01bcd315-4d28-6854-3c6e-0a755b37824a@os.amperecomputing.com>
Date: Wed, 6 Jul 2022 11:21:28 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0
Subject: Re: [PATCH v1 0/5] Enable second flash, update gpios pin and merge
 adc channels
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20220228000242.1884-1-quan@os.amperecomputing.com>
 <CACPK8XfCskh7KPhXJqOR9ZLnoBdd64SL9D1z5HoDC+_VVs4LCg@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8XfCskh7KPhXJqOR9ZLnoBdd64SL9D1z5HoDC+_VVs4LCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:54::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d764f443-6692-4d44-410d-08da5f0706ab
X-MS-TrafficTypeDiagnostic: BL0PR01MB5299:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qviMmCATCwluuhgqp/IDuqbwvQmO0AhETKnsqlXOwCXMuDV0rtZdABpQ2rOrvqCBn/VW0wGU1erknZ8xm2iqAurcAYaedBnr78egwx0BSWDHG5zH0KhvYERAFIZeuYPAIihNNZuUR+NeyLKlzg0cPDqyVJCAnra78DnwDmOGpfU6bFuSfLAsqqLqmOaJW5YX1NjzNxWesshqOrfGXG2wATwqaDeOmBvOUrPpP45jFaEoGvnDxdDvHakrmlpx5JGjF3XcNPPeen3hWxLNk5PS+3kGnPsLec0qHITjwl69c2Isr5JqucUe5OLV9yDv9oAEaL7//J8y0ElniZSLGmja9T7peA3G/bpHfKFiFfuPV1nJ5aP0irENeRSMS2Zn/BcmlqyfD2vvOY4M5cBznZua5G7FpkyAfHx5ToWrO2vrzkeo4lqO550rtN+QbgpwozrYpI+0v7a/5bNMKCA8HQa4dt83IlBLcY6dAV1Cdu+6fZU2pGSyp+RsS3uEfTYNZ0RPnbkGVNKl44og0X1JBGMaDTEPkjJg7TJwAF0+HFjnd1K9lVH+eYbPDcrDb30GWg0eMxDPxtAJoLRXUix0s7LKl6wp2xwnpKSUbnFGnhpONwhLkqrboEzzak5twGxPbwseeZ6kTMAEt0XIspMLvMRUadm4G4S0cGoblsxku5BH1Tu+efTXRbaZP4zEMh91VtAm6yapCdZdzeZWZ2cb3UKjK8ENaXdbT8bt+6Zi0vZmnDm2yfdMS7GZfItpHKUYxWB5uvT/BjBzU7MoNk25UWS41ORQXZn8uW/nxJj0ArJeZKksHBz7Vt0eg4FHTjSeYJloVVFs909/VkLtp32O2ckW72bFbbCWLZ3U3PR3DcM5Z7iP18Nx56JHvwJtyqWMqnF3fCOE0W4t+8TfmD+HeMe33w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(38350700002)(107886003)(38100700002)(66946007)(8676002)(4326008)(66556008)(66476007)(6506007)(5660300002)(2906002)(86362001)(31696002)(15650500001)(52116002)(53546011)(8936002)(2616005)(6486002)(6666004)(478600001)(41300700001)(83380400001)(54906003)(6916009)(316002)(186003)(6512007)(26005)(31686004)(449214003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?eXNCR0Njc3FhR2pEQktUZWtHRC85bDI4dkU3d0VFbkNpRk14STBVcXBVNUxp?=
 =?utf-8?B?aWdxcTVieTc4SG5XMFEraUlrS0tPRy9GNS9DOTVTKzNyZm5KTndxZm5rRTBy?=
 =?utf-8?B?SXJhcWxHVlJoRXBIQ01KRGd5a3hDbmtuN2JsZzllenFNWnlmRXg2S1ZiSTRX?=
 =?utf-8?B?WTlCUlcrdCtNYXc4YlpFb1lmR0Vqa21hUWZtK3JCZlFXcTZ1eWs1WWxWMkJP?=
 =?utf-8?B?bWRnZUVBSENUcjc1SjQydytYdlVGdzVPbW5GNURlSmFlOXhwbmljelVrNlVR?=
 =?utf-8?B?Z3NrNk82VitEWE5LYU5aR21NU2h0cDJQWER1QXNaZGFrYXFwbzlpOGJQNFUv?=
 =?utf-8?B?aENPY3hBUGZscmVYZy9OQjdBRUYrSTV0Zmg4NkhIaW9ENlVTL21PR1owK1dY?=
 =?utf-8?B?cnVmYlRqSnZzblI0ZkdNTFd5di9tQUpEM21Xc3hEOEZsSlRXWW1OWUJnK205?=
 =?utf-8?B?RVVOa0I1TE9CWTRKTlZZOWZWM2lLZGJ6YWZuRVVIOG9lZ3ZUa2FjTmFodDRL?=
 =?utf-8?B?WkJtbmhrUDk2UGdSVFNCaDFIUFB1dUhDUUNoRUxQR3VRMlFmMUh2RXFPT0li?=
 =?utf-8?B?TFptQWMvVGpGSVVQUTFSbWw0aHJXQVRwYTVVZHhnQ3F3ZTNQc0E2YXdEeGhY?=
 =?utf-8?B?NnFwNkhidlQ0SE13Um5rRFRXdDFJSStFeW1kZ0NPZzlkZm95TlVwK09xN3li?=
 =?utf-8?B?U3hnRWtNU1FDclBiLzRKSkFIWm51clpGSkk0YjJuOU9JS3JVVzhPRnppTHBF?=
 =?utf-8?B?cVdVQzN5V3VZS0pyOEl4TmtZMmZjK1VnVlV5Sm4rYmFHUmFQSjNBTllHSG80?=
 =?utf-8?B?QnhPWTQ2ekhCbzVSc200VzVSSGI4YWFRS1lKdlJ3UVFwY1lFNlo3aWtYUGY5?=
 =?utf-8?B?UXRwb3BmZkZ3aDZ4Z2EvdXpTTEU4czNxaEtCTDJIWXVJc1grNktaeDFzZkRT?=
 =?utf-8?B?TFd2ZGlFSGRPSkV1MmRRRWhaWnNTeWM2RnA0Ky8yaHN4OWEzVzRpN05zVDdW?=
 =?utf-8?B?SUY1dUxJNkdNSTk4NExNSjRSMVBlWkdGMit3MzJINC9PY0IzOWRROWgyVWZ4?=
 =?utf-8?B?RXJKbjg4VDVEdWNlU1FNdGRqR0MyZnRRWThTNEtWdmR2L2FWSkdZemxVQVRK?=
 =?utf-8?B?YkZwTWVPSmNHREwvR01XYTdCY0gxRXY4YnE1eWVaREttWWpueDJHVGlGK2x0?=
 =?utf-8?B?VWhNdjN0UStvSEJYNmxVVW1WZ3BWWHpidmQwa0g4cUZxZ2hCTkVrY0F2azRa?=
 =?utf-8?B?aldTRlZLSUtpUUFWMEI3TjVGelBmYUI5d2FlS3Z3WGRXb2FOOEtJSWU5S1Vu?=
 =?utf-8?B?NThlTUovYzhldllXVURTdDdlU2MwcnNlbzBLbkxva2pQRWRDVGxwVm5iMWoy?=
 =?utf-8?B?cmxlNHc1eVFLWG1ydnNZRVlObllDVm9DRlI4c3J5eDBmQ3l3VSs5RXdCekdM?=
 =?utf-8?B?OXozZEdwenRVRC9WRVhOcUxPWWozQ1BBL0FucFhTNGZhaURGcFVodldOZU0x?=
 =?utf-8?B?anc1ME1jcERScXYxdlYrRjB5WnEydlFnN1k3Q0p1ckg1b09KL084ZHF0ZXhi?=
 =?utf-8?B?aytIWjFXWFMzcklhclRxcmVud3IvaE9CK1dlZ3gvS0w0ay9WWjg0UzlDZy9L?=
 =?utf-8?B?ZWh4b0hmdkdzaC9LQVNzQVpmbkhrTmM3RU0zL3k2dlJlWkpwd090SHMvN0c2?=
 =?utf-8?B?S2c2UGpQdEZDcVRSdWx3SXpDbWtDV3hIZ3BNeHlNZHJhcVNTWnc2Q3JHK240?=
 =?utf-8?B?bFdNQTNWa1dTekJtdWlHMDcwNnlSWkQ3bUkyVURRT1cwelpZTzJ6VXg0YlpX?=
 =?utf-8?B?QS9qVGYvUWNZRjh1c2pqNnJWMzVqQzdYOUhvRmxpeGlQY0R4elR3RFAwbVZ6?=
 =?utf-8?B?Yk95YTNtbUdkNHRzVVlxa25sZmkrWkhlTEtkVFhLa2dCbGVOS0U1NldyanM0?=
 =?utf-8?B?OWllc2JFU01lVVBOTzdMN25DbWhWUUt6aXVyUmlidXFSaWRPdFFobEhTVXhP?=
 =?utf-8?B?NjM0TzVQZTNpZFdPeWZGVjlxRjZScWYzN3lWOEpsU2hxY0ZSWUJ3L0syZE5C?=
 =?utf-8?B?MVFGaHoyVFF3amxUZTZ5L2daWnJqTW9nTU1rM3dmOTFHN21HVGRHL2ZJM2Jz?=
 =?utf-8?B?TTh1SUtyaThIay9rbGtKL2tqVW1tRXRabnZFODRlZ2l2bUQ5U0k1WGdQc0Rw?=
 =?utf-8?Q?+2i03DJlbAGkDZWbk4R/two=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d764f443-6692-4d44-410d-08da5f0706ab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 04:21:41.2967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isFGHV1IoXiyijWCgDJWamFs2qKZ604DUU64M0PYF6sHzqCu6tmblIG7Nj7CAeiaSmN2acpgw+KKRaD4XN9FE4ByUfZwx9n+lXOJE6z3n0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5299
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
Cc: devicetree <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Joel,

Thanks for applying this patchset for v5.18.

Would it be also possible to apply them to OpenBMC kernel dev-5.15 
branch as well?

Thanks,
- Quan

On 28/02/2022 11:21, Joel Stanley wrote:
> On Mon, 28 Feb 2022 at 00:03, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> This patchset adds the second flash support, merge all ADC channels to
>> single iio-hwmon node and update various gpios pin name.
>>
>> Link:https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>>
>> Quan Nguyen (5):
>>    ARM: dts: aspeed: mtjade: Enable secondary flash
>>    ARM: dts: aspeed: mtjade: Update rtc-battery-voltage-read-enable pin
>>    ARM: dts: aspeed: mtjade: Update host0-ready pin
>>    ARM: dts: aspeed: mtjade: Rename GPIO hog nodes to match schema.
>>    ARM: dts: aspeed: mtjade: Move all adc sensors into iio-hwmon node
> 
> These look good.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I'll apply them for v5.18.
> 
>>
>>   .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 26 +++++++++----------
>>   1 file changed, 12 insertions(+), 14 deletions(-)
>>
>> --
>> 2.28.0
>>
