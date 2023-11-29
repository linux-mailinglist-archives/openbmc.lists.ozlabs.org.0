Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FF7FD1AB
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 10:07:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sf6x0msg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgD4G4qjzz3bV7
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 20:07:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sf6x0msg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::71f; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgD2437Wrz3cfB;
	Wed, 29 Nov 2023 20:05:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwQzyMLd2t9v7m6BP6acDKUPZGb4ZwWN3iw3/Gb0okSdYwmpPl7i4WloZNMGy7tP8h8tbVEqanTATneJqBIUFM8e7j9rCRqVF9s5eg4ZRoNoAOnsZK+2SJxhxrPcoVLUGnKy8zhZ+J7z3KWhE6yzQ+RPJL0MOoMZl8SncWSEpp+2fjzF7l1GiyWkDDqzt+zuC9eL3B0EoUG7o7YQoTsU83QeEFdhaevrQtNEE4JY/SMyXYxAEibdmxmomEQJ/9sq+OyUWaCOSmib0ypEO0ESEiRSWblwxCtAF7wxvZjlfETmu5qNoePFd/rQMHtmTyKZ7OA5ck0yXeiOnCDEd6wmDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxawtfnyo1jYfd6dS9GclOJQx6eOHfAdR8BF/OAgKas=;
 b=UVHgTQomOEDeBmi5U2UJfAQAoVERQel6dO+YVtj4zwcB4Z7Nn35Hf8qqJ2DidW9aaIQXTpz9I3VrJJwmA+P1cPYFJzle7gtHIjPjDOqXGNosnUAAZ0LgUBJdbu/AOuulR+oQf8ka4HVKQDKG/zmEQ4aFxZdOmLlCteejS214VYN4qrT4miU5CotUS10/vRdDwsSVlqBAjvKV5JzXOHEk1/GW0t6bOdQuJVY90hDOua1mC6FXRAXQox2rjgV1Xnp32Ap86IR5Au0Y39iYhEmEgOaQkRVCUjEUbJp096DwRLJEtVtgtj9NjnpelTQqu0HYUC0Hgn6f8ElNjxxGH1yODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxawtfnyo1jYfd6dS9GclOJQx6eOHfAdR8BF/OAgKas=;
 b=sf6x0msgr9lCcB9gpru7aFyS1gIi1xTG7ORYNiikWnxO0Zm6uaSg30FxKB+wFQ3PgD9CyqJJnl1DKW202yBTfHttxJkpjyPLeLxqs4FdV/AX3RYoUncmewGMkFSZFDLcBwY1aZtkWQLCFmLod9gCg0NqHLMwaDyOzwSbC7k9UCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 SJ0PR01MB6302.prod.exchangelabs.com (2603:10b6:a03:299::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Wed, 29 Nov 2023 09:05:29 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 09:05:29 +0000
Message-ID: <ca04bff3-a89e-4cd3-b833-6ab076f3c44c@os.amperecomputing.com>
Date: Wed, 29 Nov 2023 16:05:23 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 2/2] i2c: aspeed: Acknowledge Tx done with and
 without ACK irq late
Content-Language: en-CA
To: Andi Shyti <andi.shyti@kernel.org>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-3-quan@os.amperecomputing.com>
 <20231129004509.ilriuwm3hulvy67l@zenone.zhora.eu>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20231129004509.ilriuwm3hulvy67l@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|SJ0PR01MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d4e511-96c3-448d-1ce7-08dbf0ba559f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	gKYtvprj7jYHUawwgFYUmyI12ylZLlPJCFjaXv80vAy2fv36+cKRBfLKJbIc51lsVisWBDfDr86ndpPNTvY4NP4fIlv/OdURhMwJLKKBFY8LOXOcZW0Sp0ec1PKXoJpjXW3exmCZ3XQtIVQMuylzFLA0AJZt0KS+/YIiLoEjHl0dkIJdZrfF0/Mubm1EbCqdpVo1gBZnEJfriRcmljvWB9mHuXKl3X6IDbIc0UiW0nzKd8x5pVCJ6kUUnXWZ6ZsBgb+3BtmuR2rOEV63nVKF/EL76lD4dnU7SzTuQtJcv9q4d1A/yHsv682QsYVqBzvW/olMjjR/wAe+QY9NujUkHWdYkr4OtY+o1aaV+14OR5oUzBqAHFzEcZxSvup2YZYa1lKgi3Q+bQ9/mIb12ZKlL5rXneFRkXLlnOCyJD5VHvE3Rrqm1q8TH5I7PnyqUQ4ZPSyLdp4CJjjne5rREVR34s5SAT5r4tHQ6ij+7j18OnxYgd1ea43D8EgXQZtDEOigQOGT6o6cBJdypy0upYnR6vxH96dpnaW8YWONDL/CJ4YLJsp7FCg1nfbAhOOiUkbLdE+Fvy7n0LNyGH5y0+7SfrbGrJalO/JRPbfyNOL/PtM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(396003)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(83380400001)(316002)(6512007)(6916009)(66556008)(66946007)(54906003)(478600001)(66476007)(6506007)(6666004)(31696002)(107886003)(53546011)(5660300002)(6486002)(7416002)(966005)(2906002)(86362001)(26005)(8936002)(8676002)(4326008)(2616005)(31686004)(38100700002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Nk5SeFV0ZUI4WFZCVC9DTlIxOUUyOVk1ZGorS1lmOGtlZVF6dzl5Mit4Q1JI?=
 =?utf-8?B?bjNUNmZPVENyNEhQcis4QU0xU25OdSs5UC85RVpNOExQaUJTRW4ySC9ia29R?=
 =?utf-8?B?bCtad0FUMEdRL1JTS3R0TjlBMlg1c1ljbVpSTFBLc0Nua3NmNUZoUUVZRXdw?=
 =?utf-8?B?Wm45OUZ5cDM1bEN3MDNCblMyRWJTS3BSdFAyVmNLV1JBK1VTSXBzYnUxQ2FC?=
 =?utf-8?B?VGZtNmZ0UGllRjhUc0ZJZzF5TXowT0Y0eFVHYnR6bzl4WUIzYVRSbisvUHhG?=
 =?utf-8?B?c0pGaXRUL3duaElZMlUvWllaNWtzdzUxMlhvT29ucHVBK0lKa0NZZHRrenVN?=
 =?utf-8?B?M2g5dm5abW92RmhiTDlVVjd0anJJTW9vZ0dySkJtbzlrU1lQSXZaMTZLYisw?=
 =?utf-8?B?LzU2N3k3TWd4amo1dDlEMWlub2pieHBwVERBWXVJbS9RYTNZbHNYcXpCcXdQ?=
 =?utf-8?B?UHJSZjFQZ3ZndFVpRUcrb3FRTDN0V3ptdWppcVBZNnBsWkZPSFRrMUNDdHR4?=
 =?utf-8?B?OUNrYWNiTDdKclVVVWw2eUI2U2I3WXRNRm5IZG53MTh1ZUVQZTFsVENiMld6?=
 =?utf-8?B?R2Vtc1pNcnJtOUVaNVl6czZMdEE0cTVXaTZjOHZKYnhLOHQ5UCt4a2lPdmoy?=
 =?utf-8?B?ZWFQSE1zdVdOVGgzemEvQmlGN2RuZHBIUWVoYWhGZmwwZ1VINys2MllFWXdw?=
 =?utf-8?B?TURFa2FhcDJrSFRXTTI0cGtseStxMGRVNmQrU0VxbHYzeHd2R2M2Tit2UU42?=
 =?utf-8?B?ZEFNN3FHZE1TSlptVDg4c0hLaG0wQ3dvL0ovcTJPM20xZEROVURSUGNXY1Yx?=
 =?utf-8?B?alBxbXZYUnRQcGxIa0FFRSttMU9NQk5jZS9WTU9BOVVJd2dXcjlRdmQ0TWp2?=
 =?utf-8?B?T0djemc0ZmkxN3dHUDJWSmk2aUxKdGxoZHdyN0JWZnkzLzAybnd4OTIrNnJP?=
 =?utf-8?B?L1ZIbmVNckFjTDFsNmk4clJYNnZiSTlGTXJiaEp2SC9GTWYvQVhndExmR1Jp?=
 =?utf-8?B?NUIxZ3BIb0VvdklhUkZUb1dGbmJGUGJkQmxxYmdxMW5wcmNaTytwalViYkZv?=
 =?utf-8?B?MWpVcTJUR0cvNE1XeHNGYnVLaUV0MnBLN2ZYT3VwVGc3cmZ0R1VwVWM2MDRq?=
 =?utf-8?B?MVdlNEdaeG4zV1BWaE8vZzhCWXVYUmk0L2FBc0hJQ3U2dDBxNXBBRkw3MTFR?=
 =?utf-8?B?STJxUlIvTHVXRXZCejUvN3k0L1hZT2g3NnRZaUJ6blBzNVQ2SlJsZE00aVU0?=
 =?utf-8?B?cDNpWmJzYkVXT3pwU1NKeTV6TkREai9Ob2I2RDdON0Q5elphM3dsRGVoaldy?=
 =?utf-8?B?aXFZTmJzUjdWTlVXWFd3dnAwWTNXbjlDOHJyVXRjZW5ZcE9NK1RwVWEvbTdt?=
 =?utf-8?B?SVpJQ3RuaEFVVXpNeHJ1TVpGbkRYM2tEL2w4RTg2YlpFQkVBbmlzRnc4MzBC?=
 =?utf-8?B?NEZGV1BSRUovdG5KblJ1eDEveUtvZ0kvTkVldXNSWWRTQUVzSHlZRXZKSFVI?=
 =?utf-8?B?MTErdnBEK1JHcVMxMmJtV2RwVUk3bHlPQVRpcWhQZ3NHZ1FzRUxPclFWbTE3?=
 =?utf-8?B?Y0t0a3ZTSFJ5bmgrVStUVURMS3orTlJEUjB6ZVc2LzdSNnEzK3FVZ3dURTgz?=
 =?utf-8?B?RzZrUk5QYkFodUFpUzJpbm0xNEQzZW8raDBVUjBoVVV5UlIvVFM5WC9TU3Q2?=
 =?utf-8?B?bnRzSzdsMncwNlNkTzVpdG0xdmVId2F3Mzg4VkJEK3dTUGtNcllTYVJjTzkw?=
 =?utf-8?B?RHBPNWFoQkJkN3M0T0dMU0NFOEJoUHRwcHRRYS9MR1RNdDFCWC9aWFpuUGNK?=
 =?utf-8?B?cExicU1SV3o4eG9LdFJpNE02M3h0RGtLWGpodm53Z3J5TC9SMkZ6T2RRcktS?=
 =?utf-8?B?SDdUclFLNERZNU1UdkxUeGFjWkRacUtkTExnMmg2dzcyMlhIWXVTWmdiT2Va?=
 =?utf-8?B?TFBJcGVZQ09udExybzY1QmkrVFRMbXdNYVpQL0YxSS8za1l1L3I1ZElFVmNC?=
 =?utf-8?B?U2VOUndvUTB2VElFNFNJK1RnczhIVFAwTmY4TS8yRVhnMVcwOENoODY3cFFJ?=
 =?utf-8?B?UHRIVHVGTk9zN2htbkJhbXc3YkNtdWpqV21ZMXFqTWxKblQvSkNnbE83VkRs?=
 =?utf-8?B?M2dlZjd1dUh3bHpVaXRoOWU2NjdJQk1MZysyWWZwbk1ZZGpZeHFnRHd1TzY5?=
 =?utf-8?Q?K/XgXRV9iahbLiHFuulVmnE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d4e511-96c3-448d-1ce7-08dbf0ba559f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:05:29.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uyMd9ayObHqfmTRBxKo6DC2agsHOaQjEfjlYljSkOrRDiEO4fpN4PNpCudDxlZqnOCS6by4JeUBNKNOuF0UMQCxBfo0oEVbH6qO5u3/nn8=
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 29/11/2023 07:45, Andi Shyti wrote:
> Hi Quan,
> 
> On Tue, Nov 28, 2023 at 02:52:36PM +0700, Quan Nguyen wrote:
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
> So, you are acknowledging everything here. Why wasn’t it done
> this way in the first place?
> 
> I would appreciate a comment here from Guenter, whose commit you
> are fixing.
> 

Thanks Andi for the comment.

This base on my observation that HW may proceed to start 
transmit/receive new date as soon as those irqs are early ack. This may 
cause a race condition because SW was not actually process that irq yet.

I've also put some explanation in my reply to Andrew in the other mail 
for this part as well.

And of course, I definitively love to hear from Guenter as well as these 
code is just based on my observation through debug only.

Thanks a lot for the comment.
- Quan
