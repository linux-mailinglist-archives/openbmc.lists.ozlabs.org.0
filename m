Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9F37FD19C
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 10:04:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=oWiQ/e2Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgD0F2Kmfz3clx
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 20:04:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=oWiQ/e2Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::707; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20707.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgCzV5Myrz307y;
	Wed, 29 Nov 2023 20:03:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzH0QVt8euoRctK/+5sOdtfCWbE1K+WFWnVGVIWG1psF98QI9eH6D1K++e2NHhQ8cWBK5BZ0BzNlMwQu+D9wIjbQ3WHteCUjUTlumOlMOLxVLJEuxRe60fvEE4fX8bwDBYEsYB8x1EeWIDmUIb2QF6psh8l1GbLGjcYlv3WzHnIp/Xz0mY27lLEzm+/ccS6TsgX1xeqwu7pA+aZ52MTbvBSaBZx5skLgap+cfaeLDHH5rxK4REQppCp558YzhqgiuuftYOi17q94/ZMyT7W+h0x96ZYWc9YVL3ld0b6+hHXkZ+z/SnCAIBD9jP6rc5wJrFPbsrQIvlYn9g82jD/0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE4bzJEOQ9hOjA4myWjs9nMkVd28r3D8bfWU/vmGtg4=;
 b=Fvr+TPKIxcwMPQ82TBDwZ0HGhDXroO+7ZcGpMYj6Cc5Vl7kf2MVyDG6pQJUctEfp3R0gHM1yt6aWYOp5mLPyXqM8N5gxxL+FaRdE9/a2+yAdikQBsQTkqh5Sg0x4EeOjeajlFuwR4AnqOpb54zcty7mZhRM0sDvZ0d675LCSiV48r9uzk/zJfK2QIYUvAwjPy5XZNdhjPX3JtYjb9RPxzORovaxuxy82C0WJANdLNWb26BShYptOrCV9vbt8NkwDM6DyZxkJZki285q0uBHmTv1WGGAuHScbA1o2yM75/BhU0qggJwi8Jpw49eN6JMboRcqZlQj3y44stikX1mbGNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AE4bzJEOQ9hOjA4myWjs9nMkVd28r3D8bfWU/vmGtg4=;
 b=oWiQ/e2Yp7dF+YmodIHzb+B1OHL2H5ILeLhO7oDtl94HSGEVklVfbPEIEPlN9zSdYuBQ2zmU0gDosVhXNJheT6c3358nnHCYbTe3r9T4Ar2sdWcW+pQAP1Vn+bFsu7QSTK33V99lZB4XfPlPHCDBHJWxAq7zP3mNmX25K89VhtU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SJ0PR01MB6302.prod.exchangelabs.com (2603:10b6:a03:299::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 09:03:02 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 09:03:02 +0000
Message-ID: <66dcea57-db0b-4686-9eaf-746db637f31c@os.amperecomputing.com>
Date: Wed, 29 Nov 2023 16:02:49 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 2/2] i2c: aspeed: Acknowledge Tx done with and
 without ACK irq late
Content-Language: en-CA
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-3-quan@os.amperecomputing.com>
 <2186c3b9ac92f03c68e8a2dd9fda871f80a6d664.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <2186c3b9ac92f03c68e8a2dd9fda871f80a6d664.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SJ0PR01MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b27c799-549b-4e0d-5533-08dbf0b9fd55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	50dJlGPhQPBR4Q/UBZ8F31Phtaxn+KQ+S7u+5Uu3ngtplqOogR0D+nRH/l8eQL8kuadcwuyjZ/R56vPdfZhumRuvPFPKpsqEyx0FKsWTLGBg6qW1teDH9NorVy9XV697WO5W+US7gWlMKCFGWx0t+hbsjvxP6lJHXajEB6V/Vw9pZbxYkAEaIYGGIjmjC669cbR3Gzm4E6xAzveiAdpO/4o6bQxoL0kcbz5AyEjzxpgnDoQZzVHuO9TuLB4u2ZWtAmA6yjcHDtwmwzoJ8BXrBbKOpC9NPbQZHm5qblLFXK6M7Kk+Oa3m6vSxeWYRjixgaBpUdQ5AZImzzdbDMA1ZhJ4xwcb0a4rt6TpTHFeR3sqTNonbLZoNYOf/s7OswJOWVse/G5MZ5TVXd+bQpp+gc+1Vf1WAYTJ/hOAUlPhKoMGkv8zfh3sPPmMBTymmFdYiDsv7V2hxnJPNSTjYAwmLmUsFRlgrK+eYzQXg8T+UDrU/jn2U90FAVpMzaUFmXjKUDokchCNBHJ1Q0uhIqG/TdWUhAzY0chQbpfYwssyYCttL2jBNW9vEq9R/w6+RBXAQc6SBc+dJYxDns6SPeI2Thuk0IEjCtpThtUzbmzuqHZhIRqBxg+Ej5e/Fazgq03bs
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(83380400001)(921008)(316002)(6512007)(66556008)(66946007)(54906003)(478600001)(66476007)(6506007)(6666004)(31696002)(107886003)(53546011)(5660300002)(6486002)(7416002)(966005)(2906002)(86362001)(26005)(110136005)(4001150100001)(8936002)(8676002)(4326008)(2616005)(31686004)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z2ZBUzdUc2FxakJBS0RBWjBPMlRXRjdjVEFoUHp4TE4zRlkvZXZINkV1Ukox?=
 =?utf-8?B?NnV6WDZuUGpObGtRa2I2ZUMwMEE5VHlTNmpYUmxseWVnaVZ4L3Nmb0NkaTJR?=
 =?utf-8?B?czRpV0R6Mi9rc2lsekM1dlFsV2hhWlZuSEhqTXVMNThTWHd0NVVwamlhVnor?=
 =?utf-8?B?Z09GT2dselRHNG0wMjIrdFE4NnIyQ09vUXQvY3hlVWY4YXRCRGtFczRVSkU4?=
 =?utf-8?B?WU9pZ1VNSFRzV1UvUXFaTmNXQnFiRU9oRnFPQ3FVQzNrS3kxSlhuYm1xNFZi?=
 =?utf-8?B?bitIMlBHR1FjeDRkeHUvU3gxOXI5MEtJdWwzOHJ4VDBaaWpQSGV2aXQ4N2Jw?=
 =?utf-8?B?eHdOa1Q1ZmRKcDRnblZhZllYV0tDNVlEU1UxNXovSklhYkx6L3Z6Umxhd2Fo?=
 =?utf-8?B?U1FIVGxHbEhFRHN0Y1hUVG5iRFo1QzlEaEVIQXJBV1pOcnh1R2MwK0oreDY3?=
 =?utf-8?B?Q0wzdE1MdmxNSSs0dHc5WWlheXQ2d1lpbW83SGpiVnY2OVZmbHFyL2ZLZDNz?=
 =?utf-8?B?SHBYS2krTjFrMG9DZm03amFFaHdPOE5aeDYwbTlERlN1Q2VUSS9DTW81M3V1?=
 =?utf-8?B?b0dhV1NrWTRiMVAyV0ZVZkpYWUx6U3FScnN1djdFQW9nNll3eXErQ2EvM1dY?=
 =?utf-8?B?endmZjJxR3AwdmJ0amplODM3eXpDdlZTcE1zOE1UZWpiMlNrck5vV3BjVnRo?=
 =?utf-8?B?UnozVVNEa0dBdFBzVG9GM0RESnBDRU9SK2VwcTh3K0N2a1B0bmVFb1RsQWMr?=
 =?utf-8?B?aGJtR0ZzQnV5N28xN3MwRVA0RmJuaEFxVkYwUnk3SnNiRHBDWk5uT3I4UVFa?=
 =?utf-8?B?Ui9uNTJNWFlBbG9zYXVvMlF0NkpDYUNocTFabXE1QlAySllkZXFBeWx2N1JR?=
 =?utf-8?B?aDk0NnNZK3dNbVA2WS9KUzJIS0MzYjlRcGVocHdSaU5GY1RqaHd3Mm1pZG05?=
 =?utf-8?B?aDVpL2NhTzArMEhxNEorUG8zMkFXVCtXNFMwMHdvdEtnMkxqdTJiL1BiWmhP?=
 =?utf-8?B?dURobmVtU002b3JGL3BzK3pKNDkrOXBsUFNWbWxjNExvaXRhS0U2cm4rc0tJ?=
 =?utf-8?B?RFNvSEE5R2xwQWRmR2JkNCtaVmFPZnBwdG9vZWs4NHRNd1ZXLy82RVEvTHNX?=
 =?utf-8?B?VFUxMU1aMnZjRmJjRmd4Z1JTVjF4YmRLcTh5dFlFeVN6dDNaNlBvL3hUV1U0?=
 =?utf-8?B?dWRwZXJkNktZRjBhaWdtbEVHY2xleDIxQ2tTdnRyZWtNSnY2SXgxM25NZWZh?=
 =?utf-8?B?QXA2SE5Ib1dQYXlQUERNb29NNy9Cam1EdGpkR1RkQWxDTlVkWGVLdURLTlBy?=
 =?utf-8?B?cHFCVEFuWDBpbEk4UmpZQ0pteS8yMU5OMEo2dVhxUVNTR0x0ZVZUSlp0a1Aw?=
 =?utf-8?B?djFnMXB3Qmk3RkNjVkVFZFNSdjJ4ZDE4SWRtc2t1cWdUSExOMFNNbks5a1Za?=
 =?utf-8?B?aUowNVprQkltRUF5MERMT2FSZkZ1VU1JcFFHajQyTUMwUEpHQ2hnMmczZkRk?=
 =?utf-8?B?QnhRWWRZZmdxWlJ4OTRLa3NUd3JFeEF0OVp5Y2ZDcXd0TjA4bGlMaGhGY2dy?=
 =?utf-8?B?L2ZmM1Q1ZmZpQWZnTEYzSm1JUTZwM0V2amh1Zm5JR0NiMTlZY1U5aWhYeEFD?=
 =?utf-8?B?VmkxN3hPbFp4RzcwNmJYR2ovcFZGWTlwUGNqTFp6a3BQb0ExVnlqY0lCUFZ1?=
 =?utf-8?B?dWFpSG1WY3pVOTV5a0tOS3lwbFVtYVgwN1FDVkZwWjdyY1BnN0tjY1k3U3gr?=
 =?utf-8?B?TVZJdWVhbFFTcnVQR2ZxRnR6dnhBZVJKQnc0ODhUaXBPa3FvbkNwdTZtZG1x?=
 =?utf-8?B?a0wvQnhWenpvRFFzWmx2OVpBbkl2amM2YWF4d0dmU3NRSm0xUlJLWHVWbkpW?=
 =?utf-8?B?eFZRa3ROVGoyYVV3RndFbWhYK2VYNXBoK2NXOWloSnBSOGkzazYrK3ZBU0h3?=
 =?utf-8?B?MmdveHhoeTN4L3AwcDY1YmFzRXJBQnZiaGJranlWSHh3TnFhNGh2SEFIKzBE?=
 =?utf-8?B?bFpReExOYjdMNy80b1RKVTRONnV1cEM4eXczMjFFVXZGdllDUHF5MFJKeVNF?=
 =?utf-8?B?YStJSFMvSDN6aGpMV1VsNWY4MDlXU1RzS2lOeXlLU1A3MWhOZGlxYy84ODJq?=
 =?utf-8?B?bjBaMTA4bDNGNWlOSU1admxhU2hUQ2hma3E4VXdxRm9sSXRsWDdwRU1leVRD?=
 =?utf-8?Q?n7+FiCr/Q8NZv087bD72I54=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b27c799-549b-4e0d-5533-08dbf0b9fd55
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:03:01.4405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GCb3xBN9kt15RsnEpxH0u38dkFTpbBbBeqnnqGJ3NPdR1zFkVPIo0XKiACXqz3MVT6YofG5l6Pf6H/GQ9ySwTkcC91aNBkOULTSl+XhHKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6302
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/11/2023 07:33, Andrew Jeffery wrote:
> On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
>> Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
>> interrupt handler") acknowledges most interrupts early before the slave
>> irq handler is executed, except for the "Receive Done Interrupt status"
>> which is acknowledged late in the interrupt.
>> However, it is observed that the early acknowledgment of "Transmit Done
>> Interrupt Status" (with ACK or NACK) often causes the interrupt to be
>> raised in READ REQUEST state, resulting in "Unexpected ACK on read
>> request." complaint messages.
>>
>> Assuming that the "Transmit Done" interrupt should only be acknowledged
>> once it is truly processed, this commit fixes this issue by acknowledging
>> this interrupt for both ACK and NACK cases late in the interrupt handler
>> also.
>>
>> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v2:
>>    + Split to separate series [Joel]
>>    + Added the Fixes line [Joel]
>>    + Fixed multiline comment [Joel]
>>    + Refactor irq clearing code [Joel, Guenter]
>>    + Revised commit message [Joel]
>>    + Revised commit message [Quan]
>>    + About a note to remind why the readl() should immediately follow the
>> writel() to fix the race condition when clearing irq status from commit
>> c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
>> condition"), I think it looks straight forward in this patch and decided
>> not to add that note. [Joel]
>>
>> v1:
>>    + First introduced in
>> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 79476b46285b..3231f430e335 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -611,8 +611,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>   
>>   	spin_lock(&bus->lock);
>>   	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> -	/* Ack all interrupts except for Rx done */
>> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>> +	/* Ack all interrupts except for Rx done and Tx done with/without ACK */
> 
> I'm not a huge fan of this comment, it just says what the code does. It
> would be much better to explain *why* the code does what it does.
> 
> I realise describing what the code does was already the gist of the
> comment and that you're just updating it to match the change to the
> code, but that's my entire problem with it. We'd be better off deleting
> it if we're not going to explain why the masking is necessary.
> 

Thanks for the comment Andrew.

I would prefer to delete it.

But if to put some comment, how about:

/* Early ack INTR_RX_DONE, INTR_TX_[ACK|NAK] would indicate HW to start 
receiving/sending new data and may cause a race condition as irq handler 
not yet to handle these irqs but being acked. Let ack them late in the 
end of irq handler when those are truly processed */

>> +	writel(irq_received &
>> +	       ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>>   	       bus->base + ASPEED_I2C_INTR_STS_REG);
>>   	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>   	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>> @@ -657,12 +658,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>   			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>>   			irq_received, irq_handled);
>>   
>> -	/* Ack Rx done */
>> -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>> -		writel(ASPEED_I2CD_INTR_RX_DONE,
>> -		       bus->base + ASPEED_I2C_INTR_STS_REG);
>> -		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> -	}
>> +	/* Ack Rx done and Tx done with/without ACK */
>> +	writel(irq_received &
>> +	       (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>> +	       bus->base + ASPEED_I2C_INTR_STS_REG);
>> +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> I'm not sure why the write was conditional, but I'm not sure that
> making it unconditional is valid either? Why the change? Why not add
> the extra interrupt bits to the condition in addition to the value mask
> for the write?
> 

In original code, only INTR_RX_DONE was acked late. So the check 
(irq_received & ASPEED_I2CD_INTR_RX_DONE) is need and that help to save 
one write() then read() if there was no such irq.

In the new code, there is no such check and the drawback is that there 
always be one write() and one read() for all cases, include the case 
where there is no irq at all, ie writing 0 into ASPEED_I2C_INTR_STS_REG.

And yes, your concern maybe right, we can not say of writing 0 into 
ASPEED_I2C_INTR_STS_REG is good or not.

I checked back my debug log and seeing that irq always come with at 
least one of INTR_RX_DONE BIT(2), INTR_TX_ACK BIT(0), INTR_TX_NAK BIT(1) 
raised. So it seems like the case of writing 0 into 
ASPEED_I2C_INTR_STS_REG is indeed rarely to happen.

Do you think we should change it to:

if (irq_received & (INTR_RX_DONE | INTR_TX_ACK | INTR_TX_NAK)) {
	writel( irq_received & (INTR_RX_DONE| INTR_TX_ACK| INTR_TX_NAK),
		bus->base + ASPEED_I2C_INTR_STS_REG);
	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
}

Again, thanks a lot for the review.
- Quan
