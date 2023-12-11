Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3B80C051
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 05:10:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sSmTozzP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpSw00yb5z3vcV
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 15:10:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=sSmTozzP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::710; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20710.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpStW3sLlz3bmy;
	Mon, 11 Dec 2023 15:09:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WerzbFX1P4No0qNpMr2ZeIH+PPt0oMMdQR+dGHZYhjK6mYtvSd7onEZ63/Yn3GnjT86Py8mZ8uTKJlxYSReXfzCld0Q0y8HMr+0XZPvh2wWY1WPZDQNBCd6v1/ttaK/4OG8KD620TIiJOroEFpzNySNSelYQHFKDlP90t8IbeMipJRaOZm3u+QGfNWJPo8JcGkfPGs+j2rNWt9A05/Jn2pqXoP15DsuW2yyJ6U56PZtlelHT2TL6yp+lXvhMcyKMafF7cEwjrccOtoDNT8ua4wbSkJcaMw3tX7Hs9xW0ZFKEaREqqnUvZd5wwHM/5/4i5xRIT8yhhb8L26HV6yclRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5lwL2o5gQzDdQLlj7xI/AzAXitXF9gphRtqEM0UIGQ=;
 b=SPz7QxTeUb8e/cMkMkNO053KnlrzqQjQxnt6HK5KuTBHdUn+kL1SBWynKa3ZkIdl/w/y4Ld6TFZ8jJN5xVju6IOzNGezaMOQRh+4TZ9OAmDxKdn7wdX9cEQv2TkCE9bCqbZv8oC1DkH0Z161psbSlLsjftRQmEZ09AhO+xA0dp0MPGeagu9TUNQgobZbOmlxlib2c8QYIQ6Wxp1LTIeSNT9l7/Hv0NOfqFg29rp0zsyM+/W1D8x9zXP0G8GM6YNmtU5sqeZtBfqODAwh/t5amslAVaTmsev7/WmfT7jrW+a5G/ldW55oCNnA3wA2kpz2RpwrWA2ObDCAkXDndBIyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5lwL2o5gQzDdQLlj7xI/AzAXitXF9gphRtqEM0UIGQ=;
 b=sSmTozzPMsNoE/IFv2xtvITZZTpLuV+O/GBUPLsN9iiwmYQo2GzEch972CPJBgI77MgJTcCw3NhJDTVgQHVy050uJp58eGyHnAe0Jw27w7c0DCVpnA7lZa8RDOJ8I7bsqlQv6VBz8JJFEPTMACcwfG+C07imcJ6X4MpOMWYQbiY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH7PR01MB7821.prod.exchangelabs.com (2603:10b6:510:1d9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 04:09:05 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 04:09:04 +0000
Message-ID: <43c99449-8a4b-4db5-8b1e-bc7ae920db76@os.amperecomputing.com>
Date: Mon, 11 Dec 2023 11:08:52 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Content-Language: en-CA
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
 <20231208033142.1673232-2-quan@os.amperecomputing.com>
 <79ce9162faeb113ecb13efeb58d95f8a71e1a060.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <79ce9162faeb113ecb13efeb58d95f8a71e1a060.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0307.namprd03.prod.outlook.com
 (2603:10b6:610:118::8) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH7PR01MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ef1e47-897c-46eb-4f9a-08dbf9fee9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZFTIY/AwYLZgHmI1omXYrxmO04kyWTrVIkeCXvK+uaW+PrqvTWVygvxUXNlD6otCyQaCRA7mjoZ6iyU0UBO+Lu6pPaZCnG1rTAKLgCqY5O73yiASoSUoXxFloQWQBXqFdPb5NjJ/6hF6MQSF1YjmTbvTViu+dr1o2stWfw1s4WvCnuKvgEfNMBUA2TJ9Wz6bBfrTXwOy19AUCfaCU5cJ99m/SL7FqMrPJUEocqdPitV8ggG51GS+VZrK/o6mXICJNSGE15vGDQAp/JNNFJZ3Fti1QqyINmkZ80Kc1fdBupDubnaIo3ldhfeKHQPI3hiTMc7GzS3XkYrO98A5kaqw03zhYJNoXcLuDDDpNdAy6h7//14aS5ucZ+5Fk/LPq12MyY8cHIpjFO2ZEG069ZU+AtV9Rg3lLu/aAhxcz77Y0tTis2zDlSAoV64egbL4c8pTQrt4W/3Ij6xql1fy/XkhxiQxiXQ3OhTA7eInqQO8MIQYz8HyHjorF4aLl7JqzmXffFxpHErEswzFCR56EErFR6boMsdw2y/tsF7qXZPH1Z4hAJFLn0ZYraizRXVBt+U5GjyUTqnOIY+Rg0mgbvWMwcgwwysUM7AI8Y3ZY4j+JuXmAAzSM5ZqOJx9q8ZFFwVg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(107886003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(966005)(2906002)(83380400001)(31686004)(921008)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(110136005)(316002)(38100700002)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?MW53TDdEUGpQbE9IRVg4VDI1cVlERVBZZVhTNmVuN2NKTzY0T0FPYXgxcDd1?=
 =?utf-8?B?L2tCMENRYzhQMDRLWGF4N3FiaVVDZ1JwTFR4SnVERWwxL2hDbUl4SGtXNXJY?=
 =?utf-8?B?eFJya09SK3ZPVHVwZVpHU3IzSy9hdDBXN0RZWmxzVmxyYjBvYXlqSnYwemxi?=
 =?utf-8?B?azJTQk5IT1dVUlh6a1kzcmlWazJXOHhncnpqQ3FDQmVKQStSU1pCdmZBZ2w4?=
 =?utf-8?B?N0VJN0pnMkdVNUUvekh1OURFVEIyVyt1OGJyZnBZUFUvaFpwZWNQQW9rc3NC?=
 =?utf-8?B?ZFFHNEYyUXE4ejZjeGZtU1FIQWJVRVhncysvYkU1RTR2WmYrUUtNNEU4U2NN?=
 =?utf-8?B?SGhhNW53K05STSswYTVBcVN4aDdudDhDMU9EWldlWEdmdFl2N1psTHZ6eGRs?=
 =?utf-8?B?R1I5aDFaazVRUHZJeTRtbEJUWThIb210UDF3NTg5SG9YT050WS9VYkJ5WFdI?=
 =?utf-8?B?amhHMnQ4MGZNS2l1dWRmSnZEcFFzb1dvSnpIdWdmM1F6NU5BbVJPTUw0WHc3?=
 =?utf-8?B?bkl4b0J0dm1ObEVjNi96QnBKcFRZYnVWcm9tbGQyQjVtMDFnaUdLMHk0VXpJ?=
 =?utf-8?B?Z3JwTHE0OTl2NHlNYk9PN1l1a1hlWDJCVjZLUHhTYml2MDE3bml5elQxNGht?=
 =?utf-8?B?M1FCMWwyYW9JMytjYXYxa05wdWhOMzRuQm8vd1JmcGdVaHp6Q0JLREgrM2dB?=
 =?utf-8?B?K2M2QStPNW54UzVlb1U0UHMwNnhoL011VFYxRXFHNEFOZHFZNElqanM5dWFJ?=
 =?utf-8?B?TFNzT1BuMkJOdnhkSCt2T1dzc25KRXpFQ1lCVzJhbmtqVmp2QW1UTmlzeUJL?=
 =?utf-8?B?Tzl4Ym00SVAvZ3dwTzlsWm80UlBRNVNmblJIQVh0UHN3dTF0RFFMd0drcFBS?=
 =?utf-8?B?UXVvdE1RVlZjaGFlbmVNWngzVlg4TnRIWndlY1pOTy9JNDRKKzUydUF4RDEv?=
 =?utf-8?B?d3c5RHdVQ3lQUjExd3UvbVdJekFwVVcvMUlGVHYvZWhJaE5uNU9SemVDdmh6?=
 =?utf-8?B?TzBxUjB1ODF4a29YdTJ5LzZMOGZKSFBMem56aXplK3VvNnRFMGdvMWNsZGlN?=
 =?utf-8?B?Q0ZmaDRJOGx0UVdVVFNYdFR6N0tySENPam0zcHlHbGhRQ1dYSkFMS2hMTHk4?=
 =?utf-8?B?dk1BQXJERDMrdjRxOFk4Y2pmYTVIaWFGTVpieklCSkhIUEh1NGpUWm1DcnQ3?=
 =?utf-8?B?T3RuSmVnUzRVY3A1UnlCeGt3QzQ2bVBidnFqK1ZWbXFGQUF6SlJBU0xGTE5R?=
 =?utf-8?B?V0ZPbDBnOStUaXdVSnNjUGdvRzFxYlJPMzh0YnZCWUNqWGNvdDFFcUMybWxz?=
 =?utf-8?B?dWhtRU5vNGpxa1MwS3lSU25VZ3F3Y0dxdjJXRTZZcElmY21rR0JydEdWbEJl?=
 =?utf-8?B?bnVITVpWM3ZJVFMzQ1dJTUtHNkxXQ0p4NE5PbXh4U1UxeERSQ0xxaDRFYzUy?=
 =?utf-8?B?N0xJeldMYmJxZlN3M0VWeEdrNDVYdHBpWjlwV0NnSUd2MEJUdXBhY1l5UVVI?=
 =?utf-8?B?TWFabnZOdkx5TGh1MzFyRnlOY1p0ZU05WDJsck02eWIzbnY1K1JaMW5DNUJz?=
 =?utf-8?B?QVkvSG5QdjMwWEQ0WEpYQ05vMGVRVllnL2poM00zVzUxVXQ2SjR6RXpKRldU?=
 =?utf-8?B?N0IxTjRHNi93UndQdTBDcVJQZnMxdUdCcm5zbVRuUDhrdUk5dGdnR0d1VjIw?=
 =?utf-8?B?SDhpQ1krdW03QkFqM2V1K1ZQUUR2TmVBZWF1L1E2a2RhWjg3UlA3Z1dwY1lB?=
 =?utf-8?B?eGFHemoxUDFyQ3Q3TDBFRitGeDA0NDhpbjdZMTc1RDFUWjFvY3B0bzBCU0dJ?=
 =?utf-8?B?U05UZW9CbU5MOGR4SlFkOGp4UWIvMnVCWEl2NlFxNmNablYxQVdzNS9kRlFj?=
 =?utf-8?B?RWhmcFk1WHFLeEk1TWJBcHdDd05oUnRoMzhlZHNpcWZoK1F3dktmak91cUlD?=
 =?utf-8?B?blNITGEzMGJoczc1ZEdtWWtJNHB5d2FqaTdkbWhaTHUySHR6M0dWa1huaFFS?=
 =?utf-8?B?bWV2SUVLdEFaYXQ4S1lxQUN5V3ZRcllOYUlUdXI2c09oTzd2R3l3WUsxY2Yy?=
 =?utf-8?B?d3R5ZWlGQy82WDk1VXUzQ2JwTzUrM0FvNTdDVTdPQ3prc2hIVWZQNG1WUDdP?=
 =?utf-8?B?TkxRZmZLQTIvenljdXpDemdKUkxMY1F4S0xZVUpEdzM2ZFVPNWlqM2dqZm02?=
 =?utf-8?Q?A8WVQ9QdXcDGjin1k7gnI1U=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ef1e47-897c-46eb-4f9a-08dbf9fee9f7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 04:09:04.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpvyiMmHLT3NruOPdaRuYpgmh51jmVyA3C+uFWaYBVn2KY2ZYlN+s3FX2DY4uOFKcdRosQfYRk87WT6jbyQTnIYSp3X8WrstMcOAVMBsPP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB7821
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



On 08/12/2023 10:56, Andrew Jeffery wrote:
> On Fri, 2023-12-08 at 10:31 +0700, Quan Nguyen wrote:
>> Some masters may drive the transfers with low enough latency between
>> the nak/stop phase of the current command and the start/address phase
>> of the following command that the interrupts are coalesced by the
>> time we process them.
>> Handle the stop conditions before processing SLAVE_MATCH to fix the
>> complaints that sometimes occur below.
>>
>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
>> 0x00000086, but was 0x00000084"
>>
>> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + Change to handle the coalesced stop condition with the start
>> conditions                                                            [Andrew]
>>    + Revised commit message                                              [Quan]
>>
>> v2:
>>    + Split to separate series                                            [Joel]
>>    + Added the Fixes line                                                [Joel]
>>    + Revised commit message                                              [Quan]
>>
>> v1:
>>    + First introduced in
>> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 47 ++++++++++++++++++++++-----------
>>   1 file changed, 31 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 28e2a5fc4528..1c2a4f4c4e1b 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -249,18 +249,45 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>   	if (!slave)
>>   		return 0;
>>   
>> -	command = readl(bus->base + ASPEED_I2C_CMD_REG);
>> +	/*
>> +	 * Handle stop conditions early, prior to SLAVE_MATCH. Some masters may drive
>> +	 * transfers with low enough latency between the nak/stop phase of the current
>> +	 * command and the start/address phase of the following command that the
>> +	 * interrupts are coalesced by the time we process them.
>> +	 */
>> +	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
>> +		irq_handled |= ASPEED_I2CD_INTR_NORMAL_STOP;
>> +		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
>> +	}
>>   
>> -	/* Slave was requested, restart state machine. */
>> +	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>> +	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
>> +		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>> +		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
>> +	}
>> +
>> +	/* Propagate any stop conditions to the slave implementation. */
>> +	if (bus->slave_state == ASPEED_I2C_SLAVE_STOP) {
>> +		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>> +		bus->slave_state = ASPEED_I2C_SLAVE_INACTIVE;
>> +	}
>> +	/*
> 
> If there's a reason to do a v4 then an extra empty line above the
> comment would be nice. But let's not get hung up on that if everyone
> else is happy.
> 
> Thanks for the fixes!
> 
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 

Thanks Andrew,

I'll add your Reviewed-by in my v4 with that extra empty lime before the 
comment.

Thanks for the review
- Quan
