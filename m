Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E711680C045
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 05:07:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DwIzxN1/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpSrH2zRVz3dKH
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 15:07:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DwIzxN1/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::723; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20723.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpSqc3BfMz30gs;
	Mon, 11 Dec 2023 15:06:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWOl7gVuLodHOVarwoL0I5yJp0dukMg0qKQwnriMKKovoY0gFjTLam15z6CFXhB+zUgtD+3tbwxL9sTk1D7u4RdLSh8U7jRw+PV7Cu5zvENUClvdu3pw0pPpCkbqc+x1akUNyuIiiDR6fZhS4JmEeMybhY+5LrNcm61acvlNe38Uol+B2pttCsHlswsCYnYEMP86R9IEPx773o6xEAw2WgEYbC51dkFVuc0Aq1U3GskxhXGrmCp+E/y/mJH08klI5PUl43hsb8Ex4ibXdhDsjrfwKWhIcjfgtO1TVJj5WD8vX9pnoHMBrQg4Ah1O7ca1HJKN9Y00vZzBpgUq/7KqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWQrr6e3TPhnlT1RzjWKv8s/y/jkuMuuDDJqAD/WSc4=;
 b=Y5RDH7Hg+qB5To+lFe5y569xrBDgsf41ZXzUexsX+IoviK4fQEqFpX7aDUj+SBaIx2+B4jZWJQCemBdURx2lxfe7hhPVoy3GRKopqMi/Ek0hMTXCNZpVbswg501O9UUEo2y8uxwgkfraNFY4zBL/YJPkqN39lo/x2IhQYd1qqM0I0x2z7Lzw7z6Aa/gkZ9WoTBlKJ1YNo3Lti8uP5yb/hi4/HZ7TkjCv99vzZDWHIcSSZL/EfncWNzM9ZH0JoG9zGiVI8v0gmiRiBcCAYpmKpMRkp/P1WCAcTURLRiZn8ySOT/hO0blyuYn+LsOd7Yo9dM4DrLsNWtn+2GtD4VX6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWQrr6e3TPhnlT1RzjWKv8s/y/jkuMuuDDJqAD/WSc4=;
 b=DwIzxN1/fz53KwAkjXy0qSQY80id1L6D9A1/0X78GyeOTqyAl+giDEXiJul5mIE7PPc9E3fOxZ6ycpE/idB333ahT+Q7S2gST9oXx8Jm9fEGUjeeQSmwLCqkHsd6aYj+tHmMqFckvl2jtIuptcEEohuKUli6taS2EdsnLUw9q94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 PH7PR01MB7821.prod.exchangelabs.com (2603:10b6:510:1d9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 04:06:24 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 04:06:24 +0000
Message-ID: <79d8377f-b443-47cd-831c-4f27a4f59572@os.amperecomputing.com>
Date: Mon, 11 Dec 2023 11:06:12 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: aspeed: Acknowledge Tx done with and without
 ACK irq late
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
 <20231208033142.1673232-3-quan@os.amperecomputing.com>
 <dc36d61aedd2b2389eb366b27436f19d934fc93b.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <dc36d61aedd2b2389eb366b27436f19d934fc93b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::22) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|PH7PR01MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 487bebe6-074a-4025-96b4-08dbf9fe8a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nNaW9xCwSByUjboGH2wzckwGFvJ6Vrddz0fcFKjjYnAxqm8DRoDUZKpMhakiNJ/I05mxnNUD17Fy30pL/A33ChiAA3cquXUg8fsJEJzemBp78wE6VIRbxZ/3gktQnerrFYsYXLwJMhTzUVvlfKJhlDPvMp1JpLUuKH11FvnVDsEr4xcVFU2NkyDQ09juP5OGJm/eCLUG3uYgeKJ49cILjDd8IiHlbhfOUB7lcPkEtvmUMJEXrp34CIoK388u9uEm52j4WLdbAUVoxUn0lOAHc8fQ/vNLCPBLh7PDq3NtI6nAH2GVIr/PHkPzyrnMLR87Gz9pCq2YQ6XwXMjN5GIdGnQLIHCIXJTyIjek9an3zAgxbSs2PEUsNaLnLl1J5+zMYzcJI1s7X2bpnEi6WyxoWLvvOsaKi+niqgln1S3hc88JsL7WWniSotdwu8cWf401zgd7SiwvSiqDRzIhvfcBpp/FXqCnrWvHyBMjUuGmZWjtRsh3MFAk/B4wfOpAMS2r+5MmVVi+hwxbhw1Qj2UJqtqyC8aZDZ7D/R+oiTOe6PXdoB6B5Lx6EAwsI/b1jJvaDNfTKj7MhBfo8xn9SBg5X+ghDMdH0Wv5ApA0Mn5f++6EhgmVSw/8EhTCa4e2Irxj
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(107886003)(7416002)(54906003)(66476007)(66556008)(66946007)(6486002)(966005)(2906002)(83380400001)(31686004)(921008)(41300700001)(478600001)(86362001)(8676002)(8936002)(4326008)(31696002)(110136005)(316002)(38100700002)(6666004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UmF1WkVQNEp0TDV6cmh1a0ZDck5TUVV0U2pDbVQvRjBmNkpNWkRja2U0TnV1?=
 =?utf-8?B?SStDN1o4aUo0NXU4RUNoWElKY0JMVzdIUUJVZ0IxQXVsVzhFZy8rN1hJWFhB?=
 =?utf-8?B?eDFZWUxjL3poM3R3aFU0WTJSVjFEMlJzQ2xzd3RDZWo4MytmV0xuWDZpR3M1?=
 =?utf-8?B?YkVELzBxVWtCYkZRZjh0NWRHaHhPOGVFZFNmMCt1UmZFNExyVGZ6U25hQ3Jj?=
 =?utf-8?B?bFhEZTI3R1h2WnVDV1lSQnpYLzMrRXh0Uy80ckl3cFl3c0x6bGZCQVJycjk5?=
 =?utf-8?B?ZDdsU1RwRmhQa2FIbEJPY3RFZUhqL3RUQkRuR2IxbDl5QWtXYXo1UFJpaHNi?=
 =?utf-8?B?Y1RzWDZuWnA2ZUl2RHltYWtRb3hwelhRZS9oTTRtOEFQbDVjYmpIVXdpZDk4?=
 =?utf-8?B?Z1FrRmJKRndnS3RyQUJVUnhNY3dHNkpCR1VmZmV0QjZmNVEwaFZmaEhLRnl0?=
 =?utf-8?B?cEdqaWhFS04yY3QvcEdWelZoTDZKNm1Bczh3TEJtSEs1eXlHd2IvbjZHR2FU?=
 =?utf-8?B?OEliMzFWdE9ET1FMdVVJdVNJZzQzMmhQTVRyOXBUaWlLd3NOS2RmNEJoM3kv?=
 =?utf-8?B?a3Z3UC9aYWpXUXlHcjZ6TDd2MFlCRTgvT0trd3orMWl4bjVXV1VObk5xTlJB?=
 =?utf-8?B?MHA1MEFYT3hNMncxYmk2Vm1QbHNqbGprbnhYMDRqc2ZEVTVrSUpDSFZmTEFO?=
 =?utf-8?B?VDZSVzM5cmZwdjFqd2F3YXVPYVlFYU4vck02K1hPbFN2YWE5MHJUMTFYVXNX?=
 =?utf-8?B?NUhEMFBLM2xsQ3FBd0VJc1M4bk5yMmRhVUNrQUVkc05USXFkaEEyVXRQejdy?=
 =?utf-8?B?bXl1U0FvWWhlKzBueHhTUkNKMU1NQVhldUdpcGFKUEJNL3JBcEY1VzYzRXNr?=
 =?utf-8?B?VHVEbW5XaDJZTitzWE0yYStKU1VEMUFTNTVHNVN3UzhjWEdwUHdSQ280VlZr?=
 =?utf-8?B?L2RubCtZaHFkVzZWZlpZd2lBUlByQXVEYXlOOGdzVXQ4SE1zUjFHNkZrNGIw?=
 =?utf-8?B?SmV2ZDl3NG9WZDByeGc4UFp0K2pTYnlobUhZK21WcHliZElEVml1dTZVQkRM?=
 =?utf-8?B?d2V2SGJ2akdmcWJGNjMwS04rS0VTS3cvVVZaS2pyeEFoVkxCTTVSVWhadkpy?=
 =?utf-8?B?aFVDcVdxN1lIaW54UFJPWlZYUnFsRzVZUm9Qdm54Vm1sbld5YWp0MG5xS0hu?=
 =?utf-8?B?ZURmMW1jWU9XQTJaZUFaOVZZWWpXN1RmYlFzd3NWdVFKbzhyM1dDYTM4TGgx?=
 =?utf-8?B?aGdHUWVHU2ZhVjRTaXpMT0N3Tm15L2x6bkdhNXFGOGZua25IcVNYcmRkUGFi?=
 =?utf-8?B?eElzV2tqNXh6N3RNYXZWZ1JUTG91SEVwc09ZY05ZeDRzUjVwYlNXL0ZycERQ?=
 =?utf-8?B?TnlYcEpscXlDYVVVNXhOa2t1T0JDNUpvR3h2TEJqK0txNGIyYUlzM2VwQ3lN?=
 =?utf-8?B?Z1lyaXFuS3R5bjQ1UTQzcnpBdHY2TUpzbVRWclEwZUR5UGdjMFhPNVVXSlhD?=
 =?utf-8?B?MDhobDFKdWJScmE4MVFlYmRWeUZGOFVqU2FmbFUwcWlhc1d0bDZHcFVCbmYr?=
 =?utf-8?B?cjFOV01XR1IzR09TNzM5OW5WS3YyeVYwbTJZc0Q2dkJ2cTltZndScm9VRVFn?=
 =?utf-8?B?R21XVVZrRnp4RURZVEpQN3BuRzhNandrNjE0MzZPWVAzTXZ1WWhFUkJkU25R?=
 =?utf-8?B?aTFEd0tXV09ScklqMzFUei9rR1lCVzkyaEhSNVhuWXl0VlZ6UXUvSTVlSXJK?=
 =?utf-8?B?b0ZyLzZ6RnNRRGtaWkI3QndCUDl0bXB2ZHZIWCtGQmtKcjErK1I4a0NVRG1G?=
 =?utf-8?B?ZmNRdk9MMzhCbG83MTdEQVZoa2NwanJZUFRaR1hUdE0xZTFIckNCWXBWMVNm?=
 =?utf-8?B?ZHROdHJKZy9Uc3ZmVDBpOFBaODZkMWs5cGdCam1hTkZkL2lEK3lYNVNHM0Rp?=
 =?utf-8?B?dkd4WjhhcFhsbFFicFFTb2FqdzJZcmVILy9rQkRkVm92dFZqSlc1alF6dXZi?=
 =?utf-8?B?aU9vNW83aC9mNnFUVG5OU29HeVRhV2N6YkhUWjJDSzRYZ2hHUWJVMG9uUjd0?=
 =?utf-8?B?WjFHbTVuWHQ0dnhaQStOK041allzOS9lblg0NVNTTEFtMHN3VjBjRzhzZ0Rp?=
 =?utf-8?B?SGxoV2tFNjAwNDFoU2NEdVVHNVBlV3ZoTUtFaFgvd1Z1cE5BNXNaWmYrd0dC?=
 =?utf-8?Q?rNSqdQh6ikfuxG7UbMLOUPU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487bebe6-074a-4025-96b4-08dbf9fe8a91
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 04:06:24.7145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDFiE9M2BVZdkr6PhzsZnjaRUXnXAaun9WJJnPKubPKKQT94EnPEqQlmBtiybO/M4nojlvoJ4bkWis9R1hIM6Gt+tyVCVn3M3sWxoZjFGVI=
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



On 08/12/2023 11:00, Andrew Jeffery wrote:
> On Fri, 2023-12-08 at 10:31 +0700, Quan Nguyen wrote:
>> Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
>> interrupt handler") acknowledges most interrupts early before the slave
>> irq handler is executed, except for the "Receive Done Interrupt status"
>> which is acknowledged late in the interrupt.
>> However, it has been observed that the early acknowledgment of "Transmit
>> Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
>> be raised in READ REQUEST state, that shows the
>> "Unexpected ACK on read request." complaint messages.
>>
>> Assuming that the "Transmit Done" interrupt should only be acknowledged
>> once it is truly processed, this commit fixes that issue by acknowledging
>> interrupts for both ACK and NACK cases late in the interrupt handler.
>>
>> Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in interrupt handler")
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + Fix the unconditinal write when ack the irqs               [Andrew]
>>    + Refactor the code to enhance code readability                [Quan]
>>    + Fix grammar in commit message                                [Quan]
>>
>> v2:
>>    + Split to separate series                                     [Joel]
>>    + Added the Fixes line                                         [Joel]
>>    + Fixed multiline comment                                      [Joel]
>>    + Refactor irq clearing code                          [Joel, Guenter]
>>    + Revised commit message                                       [Joel]
>>    + Revised commit message                                       [Quan]
>>    + About a note to remind why the readl() should immediately follow the
>> writel() to fix the race condition when clearing irq status from commit
>> c926c87b8e36 ("i2c: aspeed: Avoid i2c interrupt status clear race
>> condition"), I think it looks straight forward in this patch and decided
>> not to add that note.                                            [Joel]
>>
>> v1:
>>    + First introduced in
>> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputing.com/
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 1c2a4f4c4e1b..967a26dd4ffa 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -617,13 +617,19 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>   static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>   {
>>   	struct aspeed_i2c_bus *bus = dev_id;
>> -	u32 irq_received, irq_remaining, irq_handled;
>> +	u32 irq_received, irq_remaining, irq_handled, irq_ack_last;
> 
> `irq_ack_last` might be better as a macro, but you're probably saved by
> the optimiser anyway. If there's another reason to do a v4 or others
> are unhappy with it then consider fixing it, otherwise:
> 
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> 

I'll send out the v4 to use the defined macro instead as below:

Thanks Andi, for the suggestion on the macro name.

diff --git a/drivers/i2c/busses/i2c-aspeed.c 
b/drivers/i2c/busses/i2c-aspeed.c
index 5511fd46a65e..0f67218cf04a 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -93,6 +93,10 @@
  		 ASPEED_I2CD_INTR_RX_DONE | \
  		 ASPEED_I2CD_INTR_TX_NAK |  \
  		 ASPEED_I2CD_INTR_TX_ACK)
+#define ASPEED_I2CD_INTR_ACK_RX_TX	    \
+		(ASPEED_I2CD_INTR_RX_DONE | \
+		 ASPEED_I2CD_INTR_TX_ACK |  \
+		 ASPEED_I2CD_INTR_TX_NAK)

Thanks for the review,
- Quan
