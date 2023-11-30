Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C673A7FE967
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 07:56:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=RSSOOOIu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgn6H20qxz3d9Y
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 17:56:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=RSSOOOIu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eb2::709; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20709.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgn3K2Fwpz2yQL;
	Thu, 30 Nov 2023 17:53:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZboDBgDocarYd8kjzoEglGh+qpBrzFvFS0YFZ4I3Tx+oOrHhZVz9hsWsVP24Axq7oNjXnDxn6/Q5Ac1mq0CzPuM3OF8ZC9h+UF2cT0PqBp8yrL71HFPQGJ7xfu1GE3tPQTZMzpYxBXe3Uid6UW2ezP9CbgiK9M6Zcdm/46VAYaHtmvz1EIzDi70JjTma674Cz7WcJTQuxEM3fUQUhY9Ja85hStPzzwKw5IK8sJYt5HZOH7aHHfWbde02yDiBG65IpAe2MtKQ3A0csoNqFkD2r1zIzGKilhsuX/Sf4LxucPInHzQIwuKvXo0YauhtcTIyHnKN59t2ypqfoDPzlwpNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QstX0oUovXITfXSNz2qRU0uKNbgkVM9/YaMS2McO0Tk=;
 b=M8viMY4V0kEbCyh6KZ51FtgLAtFzmT7qSJZUCyKjMfqbvKgUu/ZAWxopfjvQV+Yp5RK/ZJZ7tSY8unQJ/z6ecleutRPmR00oHk+0pmPeQFyhVkRtw1o4f4iNOxCcFRVkEjaoA/kbYV+wROtFj0lX4UsPnSt7ujvsdPVMLrTT/S3r/hmfN2/ApWyxG7eDPCwHIzn/hWNQO6olB853Ts1MRvmoUN7Tfholz3y4FIQCtiR/LiiuBESS65dQZIW4ux69r6YPQKU6uTbSeLfdLMWlWJNHdmIaA8U/m+bdF+WpQZscD1ePY5JxvIBVQqKwG3nDTI0OTji91krZszNmbONfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QstX0oUovXITfXSNz2qRU0uKNbgkVM9/YaMS2McO0Tk=;
 b=RSSOOOIuxjqfOPbDRiPpPx04lZy+5P2nbhp7BoPPUzEYZ4AgFfpfOTBE41Id0slslrKGjPEGZdKFeIjRZ9qz4B84YEuwAq/CwFa7JtApa0Yo7p9Zr9CZa9zrt7qS3ndOx/eUqhAr0VZCHtNsuCTr8/fqlerldSN798lBdzQBm10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CH0PR01MB6953.prod.exchangelabs.com (2603:10b6:610:106::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.23; Thu, 30 Nov 2023 06:53:28 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 06:53:27 +0000
Message-ID: <9ec9b363-0e70-496e-9083-6382a579a0bf@os.amperecomputing.com>
Date: Thu, 30 Nov 2023 13:53:22 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with NAK
Content-Language: en-CA
To: Andi Shyti <andi.shyti@kernel.org>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
 <20231128075236.2724038-2-quan@os.amperecomputing.com>
 <20231129003542.jfhhotebweb3uwyb@zenone.zhora.eu>
 <3f37c359-1c71-421f-b7d9-054696735adc@os.amperecomputing.com>
 <20231129212552.3uy7oqm5fz5h2m6b@zenone.zhora.eu>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20231129212552.3uy7oqm5fz5h2m6b@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CH0PR01MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c66bf3-f305-4516-c85e-08dbf1710e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jjlMxQwTKfhjVk/t6IlWRoV6BPysqrkJ3m+kl82KY3M1QRltfKcZbWSCup0QAgM07DOJGQ0YKBNNaIrkg35MVzckwysDB+SqT8Zamdg8kNrbKSELXmEN3OPuY3A3ogY0Rw3EXhpMJROxSttkkCcpiRh/eWpGiz52i3gvV/jg5DFQrakmUpa939KW7tU3UcPd0nUx/3OUQdormB2W6hZXqbfbeqQS/4yWbs931DoiwdsQP18nxMNYOg0aWAis9rzgqeIHvjnvW1lbKz/6IEkjfxvW/xpQwqueDBtn20kWPFECDnFMJEVhFXsD1s0KxfbYKOEDkPru2OpsB2ueYw/qlqMrEjIXGhmhajLqECXVvrahe8MaEWENRswMc4/Vjv9iHNGRNsG1lUbKHbp2Ull54YYmceykMusCY7ArhsvsXI2A6oBxh7aFfc21F1kgg0G0XLp4IJI9HYth+5SfHd4Wecch05OOFkWvu9CcOTDWmuY6jz5ojNA/nT8tUDuVv89GGk+SD6PgF+V9+L+Yls6t6jDOx9OWIe5JePoYsbeFMVfVPJqjifGzkVIbnvUvV6EbMqYbs8w5aRkiM2OP4iz7JXX20FuUemSfc5Y96Pag+4RXjqSV/qLPoJeJbM4WKDDj+o9KoEGD6UPbx6ghkH5qOA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(396003)(366004)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(66946007)(66556008)(66476007)(54906003)(6916009)(31696002)(83380400001)(31686004)(4326008)(38100700002)(8676002)(478600001)(6486002)(966005)(2906002)(7416002)(5660300002)(316002)(8936002)(86362001)(202311291699003)(6666004)(6512007)(53546011)(6506007)(2616005)(107886003)(26005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?S0M2Syt6dmVjMnp2RTY4MjJJM21UZWNiK280cGlHZ0dGK3ZpWDkybUI0UE5u?=
 =?utf-8?B?NzJ1c0MzZmk3TXdUZ1BSQXFRK2UwWndVdFJxVTlNa0xqTzErVFdGdXdXNE1O?=
 =?utf-8?B?T1dBak8wc2xadTAweTBDamRIS1dqWENGYlJrQU1ZZktrUUR3UUdLL3p0dE54?=
 =?utf-8?B?aFhNRlBuWDZsdndRdXdieUxXeGdPdkQvQUdPakg4NldIaUtWbVR5Y1paaTA0?=
 =?utf-8?B?QTVOS1JycDB1OHA1Y2p1T0NnSkNETVZ5d01PWWNNdlpVZlpBdk0wanNwVjR4?=
 =?utf-8?B?citoQngzR21FdmpNMm94Q3BSOWhoL1EyZlhXaWIyWVF4azNyd2tQSHN1enNo?=
 =?utf-8?B?WmZHRjRmSDdTZFlTTFVlWlhqNFl3cmozNU5JQWJZQi9aVzh2ZnNwcXlvdm0r?=
 =?utf-8?B?bDhZOE1DdDd3L0liY2pDQzIvdFUyZ2xJUHlockFuUU5XU3h6ZEVYSEcvV0dZ?=
 =?utf-8?B?Q2JuQm1mSE1MaUtacmNMUXhUZUg5NnhHWFpqOEhJU2pram1FQVp6WGtJRXd2?=
 =?utf-8?B?U244N0NZQWR3Q2VhdVFoWU9TdUtVMnQyc3F4dnBka1h3cGtYNTQ3ZFR2ZnBV?=
 =?utf-8?B?TEM3M3o3UStsd1ZueFpwbmZMZ1VGQkdmdzlpWDFjaDF6cWRINFVFT2gzemhk?=
 =?utf-8?B?M2Rzd0U4Y3NxcC9TblZqQ2lUWWRqVnRLZ2JMQlgvWEE3dFRoM0gyMHZ2MENE?=
 =?utf-8?B?Z0RlbkRXYVBGdXRCTzZPNlo0T0o1OGpmcXN5VmVCNHJNOHJKRHoxYUp5ckth?=
 =?utf-8?B?RXpMcjcvRlJ6TTVsc05mSFQrT0syZVdxNXYvWTNnaEhqODdNUzVqUTdvRTBY?=
 =?utf-8?B?bXNqRElUQWZTY0JRRUdybjJRclNhdEo3TEo4UEZOY21meG85eU1zWlpneWRr?=
 =?utf-8?B?VXBuRFFzdkhTNEpvNy9SL3Nvc1p1bWlhSlU3N1JoaXVLem84K0pUMmtoUFE2?=
 =?utf-8?B?SWxibkZIdURpUzlMY2pRR3R2Q1lZWC9wODhXSGpEZmI5T2FwTWs5Yk0vNnJw?=
 =?utf-8?B?VXBaWXNyU3NrVTY5K2xnRXNnOGo4ckpRYmFSVFZqOG5ERnM0eDVmbmZQWVpE?=
 =?utf-8?B?VGlZbkVJdEM2R0xIYWp3YlFFUm9ZNGRwd0hFaEdaVTZWTlhxZklYbEsxTVd6?=
 =?utf-8?B?TTIrUXI5R3VYeUx5LyswU0F3YWthUElwYzhUZE5vdmRSdDR1WnBGcG5SWlBk?=
 =?utf-8?B?ZE9aUXlNb2hYaVZhakt4TWpCWllYZzk3MUtCQ0hoSHRkVnQ3OVEzVWJSSm53?=
 =?utf-8?B?a3JiTEZOQlVtZFI1dGZSdjA1V01GRE9BNERSZjJrVTVTeG5BTlRLNWo5QUlj?=
 =?utf-8?B?WG5LWERaWHhlTGtnb0pqNE9IVnVxQnZ5TDFJK2ZreGd4TG9DMEEweVRUVGdN?=
 =?utf-8?B?QTdtQnRzT0ROVktLSEIrWURrSC9QWEJOSVpxZFVyOUVnUTVhb1FwOTlPeGpa?=
 =?utf-8?B?QjllZzBsaVhaWVoyTlhvaDBpWW01WXhSZldWVG1nd1M1QndDM01HaEdHZE80?=
 =?utf-8?B?dk5Fb0VHZ1BGWEpOaGpnY3N1a3dYaHIvejZqeFNFV3RFWFcxRk5CYWdYRXFY?=
 =?utf-8?B?enhzWGRNelNETFV3NzhLZXNKOXRLbGFFbXR5NWlDenZFbWpDN2ExbkxjNThY?=
 =?utf-8?B?T0JzcmMwaVpRNWZKeldnQWZlb0R0MzRibjRUSm5ZY2VRSHdzZkswdUpRMkxY?=
 =?utf-8?B?WlZhVjZBVHNWb0VBL3dwQzBrYXpBMUgzaUUva3JlUVJ2NW5Mc0U5ME9QRm11?=
 =?utf-8?B?ZGd1TnBuOHRxMTdHZGZGWFY3WmIvZ3hYN3Z5Z2I4aG9uMHNkTEIvZ0NOYUsv?=
 =?utf-8?B?RmxCbjNDTHRBVmxhaFIwaG0vU0dTbk5vVW8xV0VjOWZsbXlmNTg2TGJKMXdT?=
 =?utf-8?B?ZElFeUg0Ujk3WkxDRHF2dnR1Y2VPRlBsWTZLQjZudlNkQ09meGRzODRNYjhp?=
 =?utf-8?B?TTV4OFFKNjBISjZrTW0xQzJnaDZ2QlU4djdIN2pIN3p6bWxEL240eGpXc0ph?=
 =?utf-8?B?WERieSt3ZnRXeFoxYzUyMXJIQUtFSWxXbWIxVXJKRkJWZmQ5L2E4Smd4UlhT?=
 =?utf-8?B?a1ZXVHQ4dnR0WUpFVzV4ZFVpdkNRYlpJbGZxeGNGSFRQeDRFR3dKdVpDTE5t?=
 =?utf-8?B?RXBkcFQxMEVFYXUwaUhCeTZwVVR3TldpNlpJWmV4Z0FWTWpnVjZjWVpnc08r?=
 =?utf-8?Q?uvf25l+VytdStmCi+dL5ods=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c66bf3-f305-4516-c85e-08dbf1710e5b
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 06:53:27.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCpFRDp+ZcgfmPH0Dq914T4AXqdI6Iz+MHhbAEWKGzIc7ZY/cldIampIk1tux/QD/SONwmDKp+qlY1V5TtONkOi0MOTUjFVvyIBZP85jejk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB6953
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



On 30/11/2023 04:25, Andi Shyti wrote:
> Hi Quan,
> 
>> On 29/11/2023 07:35, Andi Shyti wrote:
>>> Hi Quan,
>>>
>>> On Tue, Nov 28, 2023 at 02:52:35PM +0700, Quan Nguyen wrote:
>>>> Under normal conditions, after the last byte is sent by the Slave, the
>>>> TX_NAK interrupt is raised.  However, it is also observed that
>>>> sometimes the Master issues the next transaction too quickly while the
>>>> Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
>>>> last byte of the previous READ_PROCESSED state has not been ack’ed.
>>>> This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
>>>> and RX_DONE interrupt of the next coming transaction from Master. The
>>>> Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
>>>> ignores the TX_NAK, causing complaints such as
>>>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
>>>> 0x00000086, but was 0x00000084"
>>>>
>>>> This commit adds code to handle this case by emitting a SLAVE_STOP event
>>>> for the TX_NAK before processing the RX_DONE for the coming transaction
>>>> from the Master.
>>>>
>>>> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>> ---
>>>> v2:
>>>>     + Split to separate series [Joel]
>>>>     + Added the Fixes line [Joel]
>>>>     + Revised commit message [Quan]
>>>>
>>>> v1:
>>>>     + First introduced in
>>>> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
>>>> ---
>>>>    drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>>> index 28e2a5fc4528..79476b46285b 100644
>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>> @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>>>    	/* Slave was requested, restart state machine. */
>>>>    	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>>>> +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>>>> +		    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
>>>> +			irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>>>> +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>>>> +		}
>>>
>>> this is a duplicate of a later "if (...)" satement. What is the
>>> need for having them both?
>>>
>> Thanks Andi for the review.
>>
>> I assumed the if statement you mentioned is here in [1]. If so, then that is
>> not duplicate.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/i2c/busses/i2c-aspeed.c?h=v6.7-rc3#n287
>>
>>
>> The if statement is to process the case when Slave sending data to Master
>> but being NAK, the I2C_SLAVE_STOP event will emit later in switch-case
>> statement. But it is only for the case INTR_TX_NAK without INTR_SLAVE_MATCH.
>>
>> The new code is for the case of INTR_TX_NAK with INTR_SLAVE_MATCH. What it
>> does is to detect if there is a mix of INTR_TX_NAK of previous i2c
>> transaction and the start of new i2c transaction, indicate by
>> INTR_SLAVE_MATCH which is only raised when Slave found its address matched
>> on the first byte it received. If so, the new code will try to emit the
>> I2C_SLAVE_STOP first to complete the previous transaction and process the
>> rest as a new request.
>>
>> So if this was the case (with INTR_SLAVE_MATCH), the INTR_RX_DONE should
>> always raise with INTR_SLAVE_MATCH because Slave did receive the data which
>> matched with its Slave address. And this will be translated into either
>> I2C_SLAVE_[READ|WRITE]_REQUESTED and that make the if statement you
>> mentioned [1] evaluate to false and skip.
>>
>> So, in short, the new code is trying to handle the case of INTR_TX_NAK with
>> INTR_SLAVE_MATCH first before let the rest process as normal.
> 
> yes, I saw that, but wasn't it easier to do something like this:
> 
> 	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> 	    bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> 		irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> 		bus->slave_state = ASPEED_I2C_SLAVE_STOP;
> 
> 		if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH)
> 			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> 
> 	}
> 
> But I see that Andrew has done some similar comment, also for
> patch 2. You can answer both in the same mail, not to duplicate
> the answer :-)
> 
> We can wait for him to reply.
> 

I think Andrew's idea to handle the STOP conditions prior is much 
better. Will test and post the next version ASAP.

Thanks a lot for the review
- Quan
