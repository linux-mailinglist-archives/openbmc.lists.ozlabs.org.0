Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 652547F9B53
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 09:09:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TPIysxwV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdysr57k8z3cSP
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 19:09:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=TPIysxwV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eae::700; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20700.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdysD1rNCz3bTN;
	Mon, 27 Nov 2023 19:08:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTgW/YDOmJT+eHiuI2Akv5d0ErTjsBP1ZNnhSrvB5fVLnPFWrTVJbjvKlHxw11j15tPBdUHis7kUDr0D7fW14diZRGHjMEgth0WLERxZxT+3TFA6j3HO6i5SKYeIMs8NfAtne7i0H78jbFjXz85cqIOQTVMfZGtG2E8VY48IoNMFzIZ5DsOjeSnn/hxM8NLPMaC6xEgWoyroP7TQPHUZcGaVSZYz3+bicXyyFAd+ueuDNwCn4AL+66GIVxI89m7meyLq6j2CliLxiRgGL3LD1fw+Fdvknl3L+OyqYP4tEOQuJJ3VD9SlIQabwj8GaJc5GxioKBAM85dLccrIh0gjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuDCknC0k5CJjp+ssj8BbXc0Z+kcu1L6HYB4R5mlmxc=;
 b=S/mLxaI74x/X0roEUDzG4l0XFKF/1xk+HaFNLo4iJeqdpF/i7a/z7VikKiiriImnM6EL0mXKDuiB3hQ9BM8N/3MK/P6JzosyzJOb/uF1+Tzt0s6IPens/5oSbf1/UD5uq4PQFFYDwZxl2vpwpHiDeSdhWEnkfCNqAYFVSD1XbpsQn3I2IVNhW0qXhp4x9IFQx0dzBI/QZZR6ad7f46FNagV2ANvfoNey3xr1uzSPX9I3oWQ+TZQeJ1eM/+uhjhJKdzKUbKYixGvxnsHgi+4UzDhG3DorwR8FnnnUVPAefN2Wh0IdDE4HM6yCXZs8pPhCSnGfipJMmhCV8wNFaNI7nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuDCknC0k5CJjp+ssj8BbXc0Z+kcu1L6HYB4R5mlmxc=;
 b=TPIysxwVsNowTrRwjg+gf1NbQenyg3Zs91OIT64QWr9HvBsS/YEmzGdSxws7mQCbavPlfm6KcgEYVJa//M5m5j7YxMXQwt8dMIJBVoNyiyRQEa2DfvSn0P/cT6/lu+V85yXqzquZu/3yjwXtT91cVmtSg99zdGT49RrM5JW4Z5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SJ2PR01MB8077.prod.exchangelabs.com (2603:10b6:a03:4f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.25; Mon, 27 Nov 2023 08:08:16 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 08:08:15 +0000
Message-ID: <854762fb-1767-4208-a7fc-10580730c1f3@os.amperecomputing.com>
Date: Mon, 27 Nov 2023 15:08:02 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
Content-Language: en-CA
To: Cosmo Chou <chou.cosmo@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
 <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
 <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SJ2PR01MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 720d0133-50cc-4631-47ed-08dbef2001bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5TLUwdoKyUVDQ/qPQK9Z3UYt611GdsvbP803J9eP/D5GXPzhkzZZVQdcc41iYxDXz1d6YXsnnhHMcIA16Gh2n5fsYzhWvuHvN1t4U1oOtY2Dh6aewLhvyJ45yGlDE2XU0u0rEviil9fYEQRiuVqdeLFndrRvlPZ4R8EF9IqDNNzlCiYAcc1ojr4/WP79bM/7TUthaw8j/dMVqhYOcMhkXxrX/ZtgkMShCND2oTSUANRflh0FG/W8xt+bgY0idy/ffB/tbEzSGggpAIZYgvUxhzORaOuTF3iSyDv0EHokW87DURIId71Dk8e3WUZ40WH9odeAHVU3eIgGtVqLsThLpNWW3d4MqhpZSSkOs+pYGSZetBKz/Jn/8CIxGojqNIQDItkKH6HFs+ZG6h4J5jgl2chkvBUtZCr8XdHEETGFP5PQA52id3sISg3TFx2DKiLoUYXCKFduvmhHRsxxnKiLgtsYUWi3x3kupTtjatyLeadaIjtwvbW/SCuRrwEnzrfF/if76X/EwNey7ZU8jnBvNHDsfKqqjkuVmP8kSUhPQkZqUludZfy4pY+X1nUys7HcJHOcGoGKMYR0qZlph4xDg7Np5EkYgnvv3XqVmfk7NJCwSJWhQEaIz3R2LbShAJC9mb+eIMN6ulCzuiWpvt1kDg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(366004)(136003)(376002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(26005)(31686004)(6486002)(2616005)(478600001)(6506007)(6666004)(966005)(6512007)(53546011)(38100700002)(31696002)(86362001)(41300700001)(5660300002)(110136005)(66946007)(66476007)(66556008)(7416002)(4001150100001)(316002)(2906002)(4326008)(8676002)(8936002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bG5XU2F4THhJd2FpSkhqOHRDNDhTRWVSSkxFRXhVU0dvcm5OOENpaUtUN0xN?=
 =?utf-8?B?dmJwRjRKdGJYWWt6Yi8vcWlzY2VCSURiRE81Mk44ejFDT1NkcDZPcGFTQmg0?=
 =?utf-8?B?SDdXUVdwZDMvbktpZmU2RjBFV3QrMmhYSFYxQnFGeENvSDBycFd5Y2MvaDFJ?=
 =?utf-8?B?VWt6UWVCZ0xVWXRTMzZKODhRYkZ2dDVER2plRGNVdVZBZzdXS2l1N1hKZkRq?=
 =?utf-8?B?ZzhFQkZjSDJZM2FvZlVNWEFKSm9GZFdPRU83d21XYjh3VDkzQVZpbFhQdDlt?=
 =?utf-8?B?WGd3c1dGU3M2ZWJzM2FkWmVvemFqYmNNMDd3OEVDSk1EbVkxMzFKbkNycjQy?=
 =?utf-8?B?WWF0WEJvNEI4dG9GbGx6eVhlZGdRQ2MySGVrNGszU2xXRTFBOHRuV29DYTdW?=
 =?utf-8?B?UkZuZ0hRVVJBVmlna1N5U2s1V0FWanN0UVhVencxcUduVmVwU2V2OUFWeit2?=
 =?utf-8?B?clI5cjhWckhhN1dpNXJ1K3FJdWdqeHo5a3hTenNnQk1USXNRTlMwS21LQWkx?=
 =?utf-8?B?dnRQSlJtdEtscVhqZ01LWHBBL1VxcmZ4d1ZSSFlSeC9kQysvekVpMXZObk1O?=
 =?utf-8?B?UXJWek03NXhYNlI3MnhIbDV5RWhyVkxWcHdrYkY0dkpuNkZJcTlGNktRa2VU?=
 =?utf-8?B?Wjdmd0tSRHVPSVZaQ2ZOeTZFUHdzUFYxWWlNMkRJUkhUaEdDeXgvaktCWWxx?=
 =?utf-8?B?eVUxUURsUUZxenlpeFB4eGFiZDBDMmtYbVJBcC9MQ0s3dmNFcEFEc0hqUWtU?=
 =?utf-8?B?cHFVSU5YN1cyUStpMVdBa3BGRFVQYWRGQ2h5ajdOS2d4alBSM3VUVTB5WDNZ?=
 =?utf-8?B?bGlGcDZCZnBzYVl2TGRQTm9qMDl4dFlPWjQ4MmNLT3lVTzhhYzRtbGt2Yk4r?=
 =?utf-8?B?NnRKUFEwY0d6UldtQ1orUHdxL1VCN1czcjZxMnRYanJxeUtLRnhGc0tOR2xj?=
 =?utf-8?B?N2F5dUwwUk05UWxGeVE0TURzL1RYaDMralhFR21UV2FxVElGcURvWmU3Y1J0?=
 =?utf-8?B?QXdpVmJwUXhzeVBIQ01tdDNCU1Z4YU1TbDlhRUVMOHYydjhoVUFKcmt1TlY4?=
 =?utf-8?B?c2xnZTZtblY3bFZPNlVkMlVCQVFUZ0grcDk5OXpzUTVNU0o4aWg5cGJla3Mv?=
 =?utf-8?B?MlJQUG0yWDd4cXhSeTZQSFhVRDViaGdjbEI5THQvWVlnemMwdEw2d3o0Ylpm?=
 =?utf-8?B?QkFMcGJXVk9SMG9WbFU4MzhoZ2JaN1ozNXRqSU04Nnk4VVBzRThvRDZZNERT?=
 =?utf-8?B?a1M4dGdRZlNySVU3ME1rWUVQZ2hCK3Fyd0pvRjBoZW5BellBVnQ0WFd6MFls?=
 =?utf-8?B?OUVrUkEzZVVqcmRPa2FyeWhJSDJEMU1pRXQxbzV6TzdYN2RkdG5YcHByL3lq?=
 =?utf-8?B?NHBjNys4SEVOTExSRnFBWXNOMXljV25lSFdpQjJNeStlaWUzRGdQN0paZ2ta?=
 =?utf-8?B?eHlwQmhPRExyVFlveWxKdStQZ0hieVdDeUFwRzV2Vlg4bFFaVlRRN1ZvU0NL?=
 =?utf-8?B?VkxseVVyeEZPblZYVTZpZ0l5ZDZza0ozSnROeHQycnNqejd2K0prbXExd25M?=
 =?utf-8?B?UHpqM3JpNFIyRDhBS0hXMVlRU2ZaZ0FQL00rNndZRGw4S1BBTDVPbEJ3dUdF?=
 =?utf-8?B?UzlkT0VSYjY2ZTNRR1pJU3ZFKzhtVWhpVktBVFN0UkNCSFdGOUgyV0FBMWZm?=
 =?utf-8?B?Z2pIN0lnYVBuQUxuNnN1eVVXaWpqbVNWWTBOaW1jMzh5bjdnRkdGVlpxeVlF?=
 =?utf-8?B?dGFLNzR6Z1E3S29URzNNZ0E5SkRsUU1lTk1lQWNOSWMrbEtFSmc3WTJHWWto?=
 =?utf-8?B?YXZpb0VvWFpVYlQ1bWNmeUNuc214aWV5SGpqM2tNb2ErSERkYm1xTVFwRUo4?=
 =?utf-8?B?akJCYTNZRE1hV1JicjNnS2puYjVSY29UNmx6U3RJZk1OdU0zWjhPZkdmZnJj?=
 =?utf-8?B?c3Y2MTdIeDlSUkNvdHZVZW80NkplUXNkNFAwTmJhSXhaM1hKYUhSZEN1cDVh?=
 =?utf-8?B?NGk4b2VTdVhaUU9qMWtpL3cxVUQwOW5WVmhVRlFJeCtFREdOSFZyRTAwZWZh?=
 =?utf-8?B?WVZ3ODN2dFd1bnJzWEpvaENDc0t0dDNYMFMyOVBReUc2SlQrcXF0b1dBZ1cz?=
 =?utf-8?B?NFJNZEc1QmZuMHBwTU95OERKMEs2dkFEYVk1Zk5uekUwWjRpOG9pRDRaSnNL?=
 =?utf-8?Q?uhYi3dTxt99f+bT8oB0sk1o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720d0133-50cc-4631-47ed-08dbef2001bb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 08:08:15.3089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjlDUBqxWg+lidbXLN+cxeTyI+MMnSc6OSIL9ppJWYazX2L1sPhZdFAv73VlLHQ3fZkmPN9Dj9lYC8vxq/67BwZokK53mva/IKRlJU+4oEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR01MB8077
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
Cc: jae.hyun.yoo@linux.intel.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, cosmo.chou@quantatw.com, joel@jms.id.au, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 27/11/2023 14:04, Cosmo Chou wrote:
> Andrew Jeffery <andrew@codeconstruct.com.au> wrote on Mon, 2023-11-27
> at 11:23 AM:
>>
>> On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
>>> commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
>>> in interrupt handler") moved most interrupt acknowledgments to the
>>> start of the interrupt handler to avoid race conditions. However,
>>> slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
>>> is handled.
>>>
>>> Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
>>> the problem that the next byte is not sent correctly.
>>
>> What does this mean in practice? Can you provide more details? It
>> sounds like you've seen concrete problems and it would be nice to
>> capture what it was that occurred.
>>
>> Andrew
> 
> For a normal slave transaction, a master attempts to read out N bytes
> from BMC: (BMC addr: 0x20)
> [S] [21] [A] [1st_B] [1_ack] [2nd_B] [2_ack] ... [Nth_B] [N] [P]
> 
> T1: when [21] [A]: Both INTR_SLAVE_MATCH and INTR_RX_DONE rise,
> INTR_RX_DONE is not cleared until BMC is ready to send the 1st_B:
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L294
> That is, BMC stretches the SCL until ready to send the 1st_B.
> 
> T2: when [1_ack]: INTR_TX_ACK rises, but it's cleared at the start of
> the ISR, so that BMC does not stretch the SCL, the master continues
> to read 2nd_B before BMC is ready to send the 2nd_B.
> 
> To fix this, do not clear INTR_TX_ACK until BMC is ready to send data:
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L302
> 

This looks like the same issue, but we chose to ack them late. Same with 
INTR_RX_DONE.

https://lore.kernel.org/all/20210616031046.2317-3-quan@os.amperecomputing.com/


- Quan
