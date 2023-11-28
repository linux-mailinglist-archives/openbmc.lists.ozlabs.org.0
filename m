Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0228B7FB32F
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 08:51:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=C95q25I6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfZQJ3CZmz3bWH
	for <lists+openbmc@lfdr.de>; Tue, 28 Nov 2023 18:51:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=C95q25I6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::731; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20731.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfZPh5DBxz30hn;
	Tue, 28 Nov 2023 18:50:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMdVUwpy8KpOCPGT7MX+66w1FAE8e50sW2iKzWbb0iWj9bdzzUBll2WRyTxcIe31+6L4yjMGNMHCHEL1o4WdbNH0LCsM7TAE/EgrYpwpJ9Qq7E3u2ULDGOZFCKJbK0nEt54BbvX+yWQRhuzQpq1wwq1GOLFTOLKr5/xggEomiZUrGn7pVH5CY4vXTZj3U5JZMajckIvUQSFhQAPdbU13stw8tpYyZ57Gk4HKtGwRyoGS44Qn//KHSTs4lLEBvxmFn/pnHFCWwACQJI0lEmaxZurju5OUpYpRv2Oe+w0URtHipdtRjx32wcZopHlOXZEBbk7Rjt2GcNJJTi1sa7bcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj61uW5yJwFvTNQDIxRpGVPNzMnW9GRwZpBwW8q9sOY=;
 b=cWcR/p8nSq/bl6Lj1n3FVvUxDQM5CPFIGO8HnrQx9tqJOld4Ubpj05dtx1OKsas4YSvDgW+w1GAo/7WjabFczjE7HTpBnKSu34Y7bZJhmIAEgjynRiYt5d/0JJDrLo9nSJs+MwvN6o+aT2MQnnUMlQiJWF96r3OJP7zRdPt8GfnUbeUXacW7WNQt7pMD2Qt73w+GeHq5QaVu2f0cotx/czTICpwe3MTm3LIaBw4luT9nrEUzd+cG/f1EIwZ0zl06c69WWZOzBbMv5H1QJklTgrYw0/SclJati3+AvGShw3lhlEOWpjNmTiqdvnfIGktKLVjhOC8F+CSEwZ2cWV5JQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mj61uW5yJwFvTNQDIxRpGVPNzMnW9GRwZpBwW8q9sOY=;
 b=C95q25I6JNVj3E46ibB1c9WQCLDf/g3Tlw2PtLPcZFrNxkxNBmhbmRnBWggdtR1KSUMwcKabPANGaWQ4nGtUNhBevhV1tfuYqNkl1KY37LP976rxYoR6MvtJudCXVPdSyqQmY4mFUisG8S9hE6efJCEdfB4R9fyoAjrTT72vWFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CH3PR01MB8441.prod.exchangelabs.com (2603:10b6:610:1a4::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 07:50:09 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 07:50:09 +0000
Message-ID: <878e8af6-25c7-428a-8fee-f924744382c1@os.amperecomputing.com>
Date: Tue, 28 Nov 2023 14:49:57 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
Content-Language: en-CA
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Cosmo Chou <chou.cosmo@gmail.com>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
 <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
 <CAOeEDyumVdi-3O3apMUFJ695V3YcZqZQ7wvzYL2YfU88XJ3Dxw@mail.gmail.com>
 <854762fb-1767-4208-a7fc-10580730c1f3@os.amperecomputing.com>
 <d0773df55a6fe8a5c9b1a3d7c8dd2e1343643272.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <d0773df55a6fe8a5c9b1a3d7c8dd2e1343643272.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) To
 SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CH3PR01MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe1b500-e613-4114-4cc4-08dbefe6a497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Z1RNKp5ZJ1xFBVbwlAltRRyJIgj8Ic5A7swW7cvCdM93L3+1wirlgceAwM6t0GGvr94wwf6htd53tOITgxC3xPpTI0AIvOPi0HbyBUR1TlDZ6BEFc5+oPXijVsdIJmszE1W0FIa2IgV0pxkSsyhjUL8dUqSyefXByLYL+mFleF8gphIkFRvtlW1IQr59qhJSo44k5Zeh7aVuftiVldkjaDlxTpO/hM7Ogc8apK1xGSnZ5KG/k80UgnILDvSFnlh/0SD/6p68GRQzKVNrqHqCkLRpnlRlc8M4AAfW1GnKD41Arg3V+qBsQAdn5OmMn/rAHgggSJrW7DVyuIN9q3n8yIObmaJxGSnx2VV1AEevWnEP73YYAKcVtE/47ZITV8FpYVYUDnZy+s/wreQ0lxSq/z44AlXWLQosJ/9MdAQ8EPHdG3aWXmH9Bg8ZhefxfC9l8WAuYC6QDXuZeOy0vBUQ4sj7kk2Ym2AtA6KtoM7aiOXQs/Ivgq8Nmv9H87T7Avf6mdFV6JAJfnL1TzTvhUvjR+V73YDozTu7VxDWR92RoD/3P+Yyf6gxxITxhtlKLdnVNFMpBc3BnfOYNk76FEc0qfE7M3EC4S7avJhTGeTmxz/q8wUjrvgET4v5EVfBujnT6VXuJRW4BKJrlL3/b9I/9w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39850400004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(41300700001)(4001150100001)(31686004)(26005)(2906002)(7416002)(5660300002)(86362001)(2616005)(66476007)(6512007)(53546011)(6506007)(8936002)(6666004)(8676002)(31696002)(4326008)(478600001)(6486002)(966005)(316002)(66946007)(110136005)(66556008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?c1NTYmxjNVIvMU84R0ViTWl5UFRrOC9JemE2b0dPUkgrTTZXTUlZcGtlVFp4?=
 =?utf-8?B?YUVYZWkvNHBiS2JvWitHV2s0SThiK0tXOW55SjlTYnN5bkhUMFRMWGM4eDE4?=
 =?utf-8?B?K093bDJ3UUF6S0h6NmxzQjZXbzNBOERzRjY5OWEweTRtM2hRMm5PU2xwNk41?=
 =?utf-8?B?UU1lWEJkVmZaYm5vY0FxY2l6VmtGQ2RRTlE0TzFtZWxjY2dzcC9nOWNJVHE3?=
 =?utf-8?B?Mk9wMzZrb3N0ekQrR3VYUXd1eWRRcFk1UGhya0ZlL0tMRUU2c3pDU2NENzFQ?=
 =?utf-8?B?NW1UNXhIa3JWb1hGU1JsK01RNVRROEl0aE02a2hyaVhaN0JQemVoNUFrTmhk?=
 =?utf-8?B?cUZZVHZEcnA3aE8vZy90UmQwTVFEODlhSitjTHpqTVVRL2dTNC92VFcyUVRH?=
 =?utf-8?B?RStNcGFRdERhRVlWNmpZbjJlalNqaC9WS2hiVncyd2grbmNyQ1U1VVdzRUd0?=
 =?utf-8?B?YUFjaGpjdk5yUUFlbDZ0WGZDdzF0MTQ0VnRJMGtvY2pHVDFLSStPb1lLU1Vt?=
 =?utf-8?B?aS9Dd1FSSGZ4eGx2Y1VwOE9KNHhDdlBiZDVZWmx4WHI2aTh1NDRSY0tsS0tj?=
 =?utf-8?B?M0tNRytZRWN3UmpkNUdKOEFxN1FsOTlBL1prZU1PMGJYUWY2NWRxbEFxNWcr?=
 =?utf-8?B?dUtCOUkyaXlhS2M4SzlDZDhFcW8xeW9HWmNGZGkvaEZzSFUwY0J3ZlRuUjFj?=
 =?utf-8?B?VnQ0T3poaUo3ZjI1amt5SUpEN2t6K0NER3B0QVpyVFNlOWgxaVYwYXRsa1pj?=
 =?utf-8?B?TE1reHFsYjNnUFB6VkRGTXM3cmpMeUE4WWZ2Z0dPZlVHdUJtTEwvblZvVEdu?=
 =?utf-8?B?b0pCRitHdDEzQVRWdm5DZndPODVNZEpNQm40K3VveHk3dTJlTFFpNkU0V3Q0?=
 =?utf-8?B?Z2E3ZHVmWVhScWVxZXJsQ0RZMGxKeElFUi9rb3hUZ2VuOVhhVE54YWJ3WTlU?=
 =?utf-8?B?VEJKaEMreHAxcjAzanVpbTlxTGg3eWVFajJRQmYyRUlCSW1WK0N5cU1rY3Zj?=
 =?utf-8?B?dDAyQ1dzWmFHYjJhT1lmN2xwcHRTVmd1NkhWOVJ1Y2Mvd0tRS1Y1aE51a1Nj?=
 =?utf-8?B?WEl5SEJEOVk1QUVRNTNEY0xSelNJZWVhb0JqMnpKbnZMaWtUREFjcEdxWTNz?=
 =?utf-8?B?anI2eGc0aEZ0eW45YWFMeXdEbHh6VHhPbHJTU2UxZ2lDK0F6K3JGcnh4QmZE?=
 =?utf-8?B?VU5nbFNCMWt6Y0FFa3NyZUR5d2NsM0phSi84bHl0bXhuc1dub1k2QTZGOVM3?=
 =?utf-8?B?aGNXanZPOThJZU9mdEhyVzJzeGlHUmwxbXJSY1RJOVhHR3FDM0pLa0F3L3ZT?=
 =?utf-8?B?TGdTUlhSSG1pNk1pTGxNNkZrYURrK2JEZnNzRjk1MWVKRkk5TGtyZnhVUG5S?=
 =?utf-8?B?UnpMZW9jME9PRlAva2JVSndLYnlxVWdqajc0Zlg4dUdORnVTNjhWYWFYYU9L?=
 =?utf-8?B?NXpJeWdqRTVCQTFweDZoMlJrRVF2ZE9vNDZUSStpTENtNjZORW9COFZaZ2dN?=
 =?utf-8?B?ZERmc0swSm5PY3p0L1JzL0dvblk1MTQ5TjZmK0V2Q01CRVNYSTJodWxyWTJZ?=
 =?utf-8?B?c3R5bmVIR1lRUUFMelQ5aXFHMHB0M3pBVGoycW9hbWY2bkRNdjJOdmRHYlBp?=
 =?utf-8?B?dGlTTU11UjlWMk9UVGl2d0ljSW1jbm9lSWxMQWN4U2hiUzc1Tm03VFBQelpy?=
 =?utf-8?B?OVpxYkZEUXJZM0VFeXQ4UkxPNUlzdDJ4K2JDdkdsNEQ4bG9QZ0kwQjJIMEw2?=
 =?utf-8?B?N0dHWVdpWm5nbmFOVXBqK3UzanlLSUZxcjE5ZTRHUFpGemJ5bnVvWmFzN2Rz?=
 =?utf-8?B?MGVMY21wZFNhZnNvVWVscCtteXR0aEpRcTVRREQzRVJJZGpCZUVLeHQ5MTI5?=
 =?utf-8?B?ekw2WUt3VkM4bGtudVNmSmFpRURWajdTWExqUlRlZ1RtLytFRnh5bVFTbmRG?=
 =?utf-8?B?Z1ZoTmNWZGExVEJxcUp3OVNZUitvNUZycXpFNmZrMzZLK0NYN2hVRU56YWwz?=
 =?utf-8?B?QmZHYWtjVmlFS0xqa3hxTUltcmIwZkQ1VlBPelRLWjJ2cS9vRXNzZWlzNGVz?=
 =?utf-8?B?T2Z4MzVhSDVnb0pOUG5xTXR0YzA3Z1paMlpYWk8weFg1SWN5Ujg0NElrMlRW?=
 =?utf-8?B?Vm52aFp3UGNDWjlHVHAyamMwYVhiMmVuTU5yQStQYitwMGptZWJlSlh0S3Nw?=
 =?utf-8?Q?lYj79GHNq8CeMvrcV3H0HYI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe1b500-e613-4114-4cc4-08dbefe6a497
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 07:50:09.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ3G+gey1RhzGEj2VTj5G4eXRlyLyq02MyLY3ULIz5a2pDpLU+UCBrYQaXnMwidlJLEMDalGvbXN7JHKIEZoU3ZW4ZIc41X2EOrSPEuQxZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8441
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



On 28/11/2023 06:00, Andrew Jeffery wrote:
> On Mon, 2023-11-27 at 15:08 +0700, Quan Nguyen wrote:
>>
>> On 27/11/2023 14:04, Cosmo Chou wrote:
>>> Andrew Jeffery <andrew@codeconstruct.com.au> wrote on Mon, 2023-11-27
>>> at 11:23 AM:
>>>>
>>>> On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
>>>>> commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
>>>>> in interrupt handler") moved most interrupt acknowledgments to the
>>>>> start of the interrupt handler to avoid race conditions. However,
>>>>> slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
>>>>> is handled.
>>>>>
>>>>> Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
>>>>> the problem that the next byte is not sent correctly.
>>>>
>>>> What does this mean in practice? Can you provide more details? It
>>>> sounds like you've seen concrete problems and it would be nice to
>>>> capture what it was that occurred.
>>>>
>>>> Andrew
>>>
>>> For a normal slave transaction, a master attempts to read out N bytes
>>> from BMC: (BMC addr: 0x20)
>>> [S] [21] [A] [1st_B] [1_ack] [2nd_B] [2_ack] ... [Nth_B] [N] [P]
>>>
>>> T1: when [21] [A]: Both INTR_SLAVE_MATCH and INTR_RX_DONE rise,
>>> INTR_RX_DONE is not cleared until BMC is ready to send the 1st_B:
>>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L294
>>> That is, BMC stretches the SCL until ready to send the 1st_B.
>>>
>>> T2: when [1_ack]: INTR_TX_ACK rises, but it's cleared at the start of
>>> the ISR, so that BMC does not stretch the SCL, the master continues
>>> to read 2nd_B before BMC is ready to send the 2nd_B.
>>>
>>> To fix this, do not clear INTR_TX_ACK until BMC is ready to send data:
>>> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-aspeed.c#L302
>>>
>>
>> This looks like the same issue, but we chose to ack them late. Same with
>> INTR_RX_DONE.
>>
>> https://lore.kernel.org/all/20210616031046.2317-3-quan@os.amperecomputing.com/
> 
>  From a brief inspection I prefer the descriptions in your series Quan.
> Looks like we dropped the ball a bit there though on the review - can
> you resend your series based on 6.7-rc1 or so and Cc Cosmo?
> 
Yes, sure, I'll rebase on v6.7 and resend the series shortly.
Thanks,
- Quan
