Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8CF7FE963
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 07:55:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mzu6n7gN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgn4k3vGhz3bwJ
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 17:55:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mzu6n7gN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eab::70f; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgn2x22zGz3c8c;
	Thu, 30 Nov 2023 17:53:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+pUeJM2dNmJPFjg8QJ1PX7wVj3EAttqFgdWmCs0we2OehYqiqdoCquECqZGf9Kzp5a96g4vsRJbNA+N4sAVLsAXpELh0+zB2G6fxNvWQIEa/SiYFbfS1hS7gXC3+WIYybXOFKUHhC8YZGxSLq2kEH/xQ6EXLEfjKIMQnG1DaeMsN/LQHijAx6fpAvo6kV+2uB1BGhqDlNT1+bMFgDcCV6KLXpiR+4FMXbi0qGZhlTI7r2cJA5F7VQVHCF7iSgJCk+f+xCr/dROs463YEdzCfsWHtLYlSJBgiAO+5B/kDHhBd7SvrX3gBdwZBq+QD+YvYzMq0rfOrcLjcWWyDE3nCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN3Vg7sqqYha5Ok54lam6jBvNYZWHYvrYAx8qSe1Vlw=;
 b=aj+NFiaYx34ZLt4RoIiEb1zhVy4z8RTge88fHXUQ3pF0qxGZ7XK2DvHFdOozQxHa/F5XuG5Nj38uUQ4P/urJd2riRrEY6zW0+rUk1cKr6W611Sj22YMrQN8N9M3Vl1JpZcm1NVvas/LP+Oy+sWZ4LKK0FkyMVgHFjnYGA1AjA87KPYgyS7sHiGyQVFkfzPCddKT343kpfdoRxSVXUO4347anosxwegi0AkkFwRQk/Zz693vKPQeEHafhIKfsUhwyOzKYIyysZaeZeD6wfLlcyHgibl/vlOeCxPOIysghLMkF1ZdX0Wl3N1QAn9Cuf2blxHlp+3pejnKxTXMj8bwhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN3Vg7sqqYha5Ok54lam6jBvNYZWHYvrYAx8qSe1Vlw=;
 b=mzu6n7gNvyY6Oi0ryNTsBva8jpb1mwz9cZYUY16SGHrVT4334/PURHuGkLaY9irP+A7XQNJhuCev+2tPebcrmahGndtMQmfHtTBjPFsUp7vBsUjDKlL22goCvxadPXYECQ9kIeqHTU+3N1eRuxxA83u1lZqcL05T2SdIplk2YAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 CO1PR01MB6615.prod.exchangelabs.com (2603:10b6:303:f4::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.24; Thu, 30 Nov 2023 06:53:13 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::5682:1d84:171a:1d68%3]) with mapi id 15.20.7025.022; Thu, 30 Nov 2023
 06:53:13 +0000
Message-ID: <4c11086e-6f56-4614-9ba0-9b6e2439bce3@os.amperecomputing.com>
Date: Thu, 30 Nov 2023 13:53:07 +0700
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
 <66dcea57-db0b-4686-9eaf-746db637f31c@os.amperecomputing.com>
 <cb6043dfa13a269eb287a38521dc1b7722a237cc.camel@codeconstruct.com.au>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <cb6043dfa13a269eb287a38521dc1b7722a237cc.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|CO1PR01MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: daebd0ab-eef6-4cdd-48bd-08dbf17105b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AejLUR37rafB5NCDNtL34MeULHgIJ5Xmxd2ro5iGPhGm5PFkdrDO77u/kL2ZDvHIog9dz6S2tLt/9Wqe5yIeYiUs/Meg6RXkegqOXYZKcdalYTLp2R3KhbUAEitItN8FNK2HXZksdkY+z5MWn9fdRAeIQSsrSB0wYrIzrR0HyueAenOOMU/VB+PXtNIFwSwi0v+YvUYYciAhMqYhAb0yrNHnc8nE2MDAohT0TpYXRzbbdw5dGr3fkABU4VRjyERk5BdjVE4LRkDQBX2MOqY7iitb+42dzWrQGbx+xhXKPifvTS6uX7qmA8HgJPvwJ9z3zEUDUjPkM/Xj5oAfgxGKN/uNAzYspePp9TxfP44xMBlytEaYN6goa7YHl118mFL5s81Vf2+qfwrQo/I+5e2R4f6NauNS1QIoU4nE92ioup6CHcNQTru5CaeBh6aC8likTdc8qgqNb7dsIlLC6pjK5e5Yvm1aGLt6vgGUu5C4XwUlnYyfcGDVKkAl7iDkomG1W4FcSn2HfMBtUDRGNQaQdMsTMirZcQFL9RVihXcdbfhzKfU3cfFM7AhhBbNIt+WOi3cfeXKMaCg3SXjk9xMcOCs/Wg3LdgEbpe9X3lO5Owh4vM1bOguDzr50UkuOar8tCo2j6rTCHXeEZHqNcrcJ0HXb7BJddXoqKMV/L4bAsJ+cx2mTa6k9Lhc7W2t40sNE
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(39850400004)(366004)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(316002)(66556008)(66946007)(66476007)(54906003)(110136005)(6486002)(478600001)(6666004)(7416002)(5660300002)(921008)(41300700001)(2906002)(4001150100001)(31696002)(4326008)(8676002)(8936002)(86362001)(83380400001)(2616005)(38100700002)(26005)(107886003)(31686004)(53546011)(6506007)(6512007)(202311291699003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?b3JOS0FBZDd6TWVOcWFFeXZ5Z1J4T2ltdTUzamJmaXc2a2pVcVNoSHIyems0?=
 =?utf-8?B?SDJRV1RVb0Q5bTdrd0lVZ214MFJOa0lOQUx2UVdZS2p6Sy9QVXJnYStoRFI4?=
 =?utf-8?B?NlpUVTNaaTFyaUxhajZ5RjRoUE5EKzc0cktQck14VGkxVEFUQ0k2T0tZSmlY?=
 =?utf-8?B?UEF0akhiWC8rQlg0Y084NTQ2T1pGcXduZUZWdUdqd2pVK2YrdkxZdUxERzl2?=
 =?utf-8?B?dFJBZjREYkdRM2ltZHJoei8vSXdSQUhjR0VaWUpOcVdTZDZoblg3aU04a2xu?=
 =?utf-8?B?S0RVVkMxNkhBUlVzcFU5aUlZK01WTE5qaHpnSklmY0RCVXppV3dvZ203VjhX?=
 =?utf-8?B?ZzlVd2hQdDRUcDQzb3NSRk00SDViREo0Z2pUSWk5RUFMMUgrRGZ2VlltOUVr?=
 =?utf-8?B?REZ5LzYxVzlSc1pWUjRUQ1NGblBNL2NJN0Z2YTZjS2NINDNubzRiNzUzVm5U?=
 =?utf-8?B?SSttUWozTGpzZ3BlZWt1d0g2dXJkWExzSVNnWEdBNkFqejl1Z3VOWjNzNWNK?=
 =?utf-8?B?cWRXdjZVL0IyWGpmTzdNSjRnUU4vVGxxN056KzlISks2VTlKTXN6NlM0L1Qx?=
 =?utf-8?B?cjl2TXp5UkwrUUYreEgyczJwR1RJR2F4Nko4V1RwaVYxNFdpY05TWFRsejZH?=
 =?utf-8?B?M3lWbE5ycE1vTnc2U3drMmR5REkrblFsT2s1VTZaMGhNeFE5SytYY09MYUNp?=
 =?utf-8?B?emlVaUZPcGNrK2hpZy8xN2toYmVRVHVwbGs0N0JhMjVONkoyK1QvNTlta2xk?=
 =?utf-8?B?S1J4UmJ6K2U4RjRhTFZCbmxhc0xOeENTUVYxUi9sd21vbGVwVXVSUnNTb2hM?=
 =?utf-8?B?dUNkSXVXV1I5R0JGSTRBVmhQVGNyZUlua2txMW9rUlhObEtTYWNhdEthbnF2?=
 =?utf-8?B?eEpUeHMrM2tSV1ZxUlpVcUdPNnZUb28xcURpY3lQQWx5SGtIY2p6aUNUWUU3?=
 =?utf-8?B?VnVrT2ZzczZPTTU5Kzl6MGRoSll1M3lqRkQzZkNpT1pEbFVTQjhaNWNMY2JT?=
 =?utf-8?B?TXRTcnZ2VFZmZndPZmx2a0FqN2dEaXlYMFUxUm5pSjJaUnZlL0Q5ME5LWEM2?=
 =?utf-8?B?Nkg3SjRudHBydFREQU92RHgwK01IYnNoa280YzNndmI1eHlDdUtMQWtlZzFj?=
 =?utf-8?B?cXdWUkxRV1BiMlg0UUVZd0xVVlBkZmFSZGpNckNoM2psL3NtSkd0MVpQOVlv?=
 =?utf-8?B?SVNBQWhtMHZjU1BFS3NlRGh6N3M4SEpnU1dvRlhsS1VUS0JhaWppSHVvOWRi?=
 =?utf-8?B?WlZad3o5ZDhxVUhtUzUzY2hzcnI1dVV0MTlIM2NHL1lKK2RSLzhyTEo3VElV?=
 =?utf-8?B?WGVpcUYxQWVIUG1MWCtXcGpMQkpYak5ESVp0TEliWnBteVVIa2JmVzRnQSsy?=
 =?utf-8?B?TmhBZ1h5RXVNeE9sWkRab1ltQVV0bGYrT3ZxQjlzUmxtMUllQVBYL2lZVTJO?=
 =?utf-8?B?MnJUNDd0L05xNnM1bGZkbkxVZS9KUm5KOWZJVmtyd2NxeG0yTEp4Y2NVWUNZ?=
 =?utf-8?B?R0pZYk80WDVWZWhrSkJXeVRJNWI1djVDcVZsd2lBYWVXM28zd1ArOWJZdVZI?=
 =?utf-8?B?SVZYWFp4Y3FuVDJYa3AyV050NHZ2b3RQdkx4MmFqSFUvdTEwN0tvNDh3Z1B2?=
 =?utf-8?B?dHllSEd5NDBVVXVyU3l5YlNMdmZkVllsWEhiRkg5UnJrSEtHS0g1eCsvRzdT?=
 =?utf-8?B?Rzc4UlhXL21XLy96NDlncFg5SUY1SDZRcTdjVmR0N1dxVUZtK0w1dmROTHJ4?=
 =?utf-8?B?bnUyQkJ4TDNrRldrR3dnTU1zczQrcVgycFBKemV6TGlRWGlLc3B4a0hKUFhu?=
 =?utf-8?B?Sllna2JmR3Z4WC9hNVNmOHBkUkxmM1N0T2s5R2twVUhMdmZQWmxSVkJvb1hF?=
 =?utf-8?B?UUFYWlFvVDJIWGVaUmI4OHpzUlJpVm5uOTBMQmhNejRlTXpCSkkzZU1oa3g4?=
 =?utf-8?B?VU51R0poNGt5MlFLbXZZUUM0RCtSaDN5MXVHV25nTlhIc1VFbUFIc3QwSFZL?=
 =?utf-8?B?YVZJUk1xRWpVQzNaenN3bTdLTnNpZGo4UUo4RnhnTjliTzFJN2tUbXRldkRl?=
 =?utf-8?B?eSt2WUFNSTJPT3FySFR4cFN1aXRsRklDc1crRmlQN2ltU2IyQmtwZXQ5NC9j?=
 =?utf-8?B?aWtWaEw0bElGVDdoQ3ltMDM3UmY1MXZkbDVKeFJCZlJTSDNaaFJIdy9qeE1L?=
 =?utf-8?Q?YFH8yvXpGSyl8LoRSYPzX8I=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daebd0ab-eef6-4cdd-48bd-08dbf17105b1
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 06:53:13.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRcO+HxGQlvD6osUBiY4Nc94HtsNolSPG668dGGZW1nq21F6JDwPWaZxkerTvokk5Jf9mkN0kQV6Gs9NHixTUCGqcQ6BP+gJ/cMCfpd9MRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6615
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



On 30/11/2023 05:44, Andrew Jeffery wrote:
> On Wed, 2023-11-29 at 16:02 +0700, Quan Nguyen wrote:
>>
>> On 29/11/2023 07:33, Andrew Jeffery wrote:
>>> On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>>> index 79476b46285b..3231f430e335 100644
>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>> @@ -611,8 +611,9 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>>>    
>>>>    	spin_lock(&bus->lock);
>>>>    	irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>>> -	/* Ack all interrupts except for Rx done */
>>>> -	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>>>> +	/* Ack all interrupts except for Rx done and Tx done with/without ACK */
>>>
>>> I'm not a huge fan of this comment, it just says what the code does. It
>>> would be much better to explain *why* the code does what it does.
>>>
>>> I realise describing what the code does was already the gist of the
>>> comment and that you're just updating it to match the change to the
>>> code, but that's my entire problem with it. We'd be better off deleting
>>> it if we're not going to explain why the masking is necessary.
>>>
>>
>> Thanks for the comment Andrew.
>>
>> I would prefer to delete it.
>>
>> But if to put some comment, how about:
>>
>> /* Early ack INTR_RX_DONE, INTR_TX_[ACK|NAK] would indicate HW to start
>> receiving/sending new data and may cause a race condition as irq handler
>> not yet to handle these irqs but being acked. Let ack them late in the
>> end of irq handler when those are truly processed */
> 
> Please update the patch with this comment. It at least goes some way to
> explain why.
> 

Yes, will do in next version.

>>
>>>> +	writel(irq_received &
>>>> +	       ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>>>>    	       bus->base + ASPEED_I2C_INTR_STS_REG);
>>>>    	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>>>    	irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>>>> @@ -657,12 +658,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>>>>    			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>>>>    			irq_received, irq_handled);
>>>>    
>>>> -	/* Ack Rx done */
>>>> -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>>>> -		writel(ASPEED_I2CD_INTR_RX_DONE,
>>>> -		       bus->base + ASPEED_I2C_INTR_STS_REG);
>>>> -		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>>> -	}
>>>> +	/* Ack Rx done and Tx done with/without ACK */
>>>> +	writel(irq_received &
>>>> +	       (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | ASPEED_I2CD_INTR_TX_NAK),
>>>> +	       bus->base + ASPEED_I2C_INTR_STS_REG);
>>>> +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>>
>>> I'm not sure why the write was conditional, but I'm not sure that
>>> making it unconditional is valid either? Why the change? Why not add
>>> the extra interrupt bits to the condition in addition to the value mask
>>> for the write?
>>>
>>
>> In original code, only INTR_RX_DONE was acked late. So the check
>> (irq_received & ASPEED_I2CD_INTR_RX_DONE) is need and that help to save
>> one write() then read() if there was no such irq.
>>
>> In the new code, there is no such check and the drawback is that there
>> always be one write() and one read() for all cases, include the case
>> where there is no irq at all, ie writing 0 into ASPEED_I2C_INTR_STS_REG.
>>
>> And yes, your concern maybe right, we can not say of writing 0 into
>> ASPEED_I2C_INTR_STS_REG is good or not.
>>
>> I checked back my debug log and seeing that irq always come with at
>> least one of INTR_RX_DONE BIT(2), INTR_TX_ACK BIT(0), INTR_TX_NAK BIT(1)
>> raised. So it seems like the case of writing 0 into
>> ASPEED_I2C_INTR_STS_REG is indeed rarely to happen.
>>
>> Do you think we should change it to:
>>
>> if (irq_received & (INTR_RX_DONE | INTR_TX_ACK | INTR_TX_NAK)) {
>> 	writel( irq_received & (INTR_RX_DONE| INTR_TX_ACK| INTR_TX_NAK),
>> 		bus->base + ASPEED_I2C_INTR_STS_REG);
>> 	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>> }
> 
> This is less different from the existing strategy and doesn't require
> any explanation beyond what you're already trying to achieve in the
> patch, so I think you should switch to this approach.
> 
> If someone wants to work out why it was done conditionally and argue
> for its removal then they can do that separately.
> 

I agree, will update in next version.

Thanks
- Quan
