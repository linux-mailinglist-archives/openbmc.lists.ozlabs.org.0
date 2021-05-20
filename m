Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95D38B061
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 15:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB0r3hgzz304N
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 23:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=qtU9oqYZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::71c;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=qtU9oqYZ; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB0T6Lvqz2yxr;
 Thu, 20 May 2021 23:48:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifB88yCJYQEWB1qlW7PVz4D9uc2NQugMETgtBsMO/IlbzV6PrIXJH+GLaqs2KJk2aL8FpQmAJr35soHSoLQljOR4XRideofHW+MR2sTiQ3OTFPAJmerNdYChIuSM5CifIhFvdAphdLOQefM83WHv6/iI6KwwuYOjeEPbmmGoCmqTEgjbto6McXdo6UKJ9hVzxEZSmeMPpIq7qWVrRg3q1udKKC1aYLY7e8NSwBrRqvLL8V7PPYx0SiC4YjUuXIMsPVs+0CfU5je7zPFNDB+jd/Hgk+lxXKaFaVZLZn8HoA2RdKv47dMKc7k9cY3tIq+sO92a7sm22UIm58PACoXAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrKWV+2RxRaXCa7k/htcqM0z38S9dsSMzpPixHdE1A4=;
 b=Cf7sZi7CxpFY1jQVqpVHZ574AK8xyyX2huPOExKl0eQfo7+Roo+IHuKn8cqGDGBmHl9jL3L/siScUaOkoNBUxLsNSimgz4oI56r80BeFuWUPU3FmBkXFQtXM/qW2awqn1sP00RgD045+V320nbe2LoKqKTdZf3QjCoxqgvvQ03hF+mry3Z1hxQjAn9KzQ5012n2mzJCKpfCongwLc1t7U2rQOZtUBe1D0IW40Ta25aUm0A0+91Y5nomcIz4Ulqr2xhga+wY4tRmAOTK44mSz89FFGTt99NtspoPiqAGVg0T0DcwXNr6xJJY6CvRIyMBcLFxfJ4W6JkjzuTTYTGq68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrKWV+2RxRaXCa7k/htcqM0z38S9dsSMzpPixHdE1A4=;
 b=qtU9oqYZnwxyObL2z1XFhK/q5AVI1mFwl9Qi4m63dmzNWednEHkbvmeiLH9udVNqVD0aZC1DVgxhMwdJGmZgKb5EIzGbmHigrFsyRZJcaROdUMTzTkJte8ToGB7kAsAY18LYVLNbWwYXxdHvEJGJIAfbNAoM/jmG3ERxq890LDM=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW2PR0102MB3450.prod.exchangelabs.com (2603:10b6:302:2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 13:48:30 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 13:48:30 +0000
Subject: Re: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
To: Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-4-quan@os.amperecomputing.com>
 <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <211c8380-8909-4acd-5b7e-9ba2a0f20834@os.amperecomputing.com>
Date: Thu, 20 May 2021 20:48:08 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2PR0401CA0021.apcprd04.prod.outlook.com
 (2603:1096:202:2::31) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2PR0401CA0021.apcprd04.prod.outlook.com (2603:1096:202:2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend
 Transport; Thu, 20 May 2021 13:48:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54db8243-2b4c-4273-a8ed-08d91b95f33b
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3450F7D7631AAF19E750B495F22A9@MW2PR0102MB3450.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0qn++om+sriSy/q+EQwBpS1++ww61X+3+gjzDT+l4EwFMvvBHLj9W8fswhi9MKpni7Q/6RNsStOy6qiLlI8Z9mw05KKIk8qgw9AyVgN+Bb2vQpTpPDIQnn0AU/4w3VHhTgUVSS378aNBXg1+FiYI488t0TETZGbUcaghtcQjWTDD3R2WqDfOPBtgLwUsOxhW9yy50yApiP0m330bccVsMTj/BrWlH8o7VlwsAbaBZLu6xfmYMI8UT2+tHxA18UEfPC8dug2cAgXQd367G2oEbxIPqLNp7GvlFbfqhbUf9TSeZN+RCb1Yu1ptry7EC1PLimL2UziKcl7ddfEj8PQ197AljvkY4JhJiPjz33x2jHzyKfZdGR++IrfDQR2FngmGJxjAMamZq+jCdKaQzYCQzMDz4SMNGXxqdeX30v623zFNdJESAqzzDSC8ismp+/EQ7t4tLXGBsSwevKLlwYWQ+DFDs7fVLDVGFhh3BwCrNOocN6VYWcDpIctV3VoISDAdDgghJW9bHadhqGizfTjxpH1fwGP3rRLv1Q/avcee33qggl7zoWHz2FuFDpcHsY0R1CMVZHzjjEuVBmU2a7kCSscaGcR3oL/wYUvIn86kVPeNzDw7so3b3/PTfX++MZkcGKJu8eQDwTxNdavtk2gwfcZ6b+kKlKnoAeA505ofdxdtyp3f12jPRoqeCINT8cP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39830400003)(346002)(396003)(376002)(136003)(8936002)(16526019)(2616005)(4326008)(86362001)(8676002)(53546011)(38100700002)(2906002)(186003)(316002)(7416002)(31686004)(6486002)(478600001)(31696002)(66946007)(54906003)(83380400001)(110136005)(5660300002)(66476007)(52116002)(66556008)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TXpjbnlIMFNaenAwOWFJaC9nV0wwdHgrdjYyTUZ6V0taWUs4RElJZGNkYlFP?=
 =?utf-8?B?RjYwbURWR0NLOHN2Rll6cCsrbWZIUkdvQWI1dFVqbDFNb21HZWZFY3lhZUNZ?=
 =?utf-8?B?dlFBVU95N2FLZUx1NXRyMXpnbGFMR0RUWm1Od0dmemZTNzlVVVdmUGY2cVJK?=
 =?utf-8?B?WlA4dnE5VDNjYUdPdVpJbTB4eFJ5Unc5VVZYWE5SUnIrR3cwRDFHc2lWWHZN?=
 =?utf-8?B?Ri9IYitIQXZVbFRYWTJla0NTSGpzNGcrbTVVQ1I4bWZCcHluRUZjQTdROG80?=
 =?utf-8?B?c3pZSVhrazJsWG5nMUFxWG4xcXdzbTRqUU9FRnVveTZ0VGVzSGdPMFEwUXY1?=
 =?utf-8?B?Nzgxc0haV0tKL0Q0N29KUDZmcVpKNkRaWUwwU1Z1ejBuMmtNSm1vUXhwRzJX?=
 =?utf-8?B?dS9LdnlaS293SStpTFBWNDNTaGsxR2dlY1pKQnA5U0xPKzlIdUlvQzJpWGIw?=
 =?utf-8?B?ZlRKUW1QM04zclI2cG5xdmJyUFJ2ekhwSStwYis3dmNkK0t6d3ZCMFFSTWZy?=
 =?utf-8?B?Nmx0NUpkTURyMjhGYVhDYkl1Tk5vMGhkUGNBZktONXZMNW53NGV1RE1vdHdp?=
 =?utf-8?B?bUNsTGptQ0gxSlNVOTF3MzlaZ0gzYVZZNkdVUUxONFBjN1pUcndRQ1B3N1F2?=
 =?utf-8?B?MThWMlhzWHlxTkFnL1BQUldZdnc5WW93UVRMRk56eFlOOG8zdm13MWlpNVB3?=
 =?utf-8?B?NkxTb0NJMWZLTkRZV3N2Y2lJOG5xMDE1YlIvZFlLOURNUEgrQ2F0WUREMnZI?=
 =?utf-8?B?OFhYVUxsYkNaeThJei91TmF5QUEvTUhzNDdGejZpTnNtUmNkT3pUQ0pVTkxC?=
 =?utf-8?B?MU96UHBSVlYrWjFjUEJvZ1FMU2xOQ1AzditMYzcrMTU1L1NXWFdzZlFqTE8x?=
 =?utf-8?B?KzNJbDI4V05kV3dEQkNlYTcyVkR2RFNOMTRUZTVDbEViUDVaakFibjEydm5x?=
 =?utf-8?B?Z1hvZmZ3a2J1OE5Hb0lORHVBd1RXQytTTGRIT001ZEZ3dWloNXkwSFNzMmEz?=
 =?utf-8?B?RDZjVW14QkpVMzdWSDJReGZkc1Zhdm1sN25jRUtYbk1KQWZLbi9DYithbzJ0?=
 =?utf-8?B?NW8wRkd3K1RuZUF1SlN4MGxuRWltWDFueDFJMHMwemxaV044MGlPTGt5Y3FM?=
 =?utf-8?B?d2E5Q0NDck5nSG5SNW1qTm90VzI2b2daazhCeVlUZk5aY0FjbVZoTUF1Tlpp?=
 =?utf-8?B?d3R1a2dxYWtaTExOZTFLMGs1NW5ZVjM5UzV3S1VLNEFieWhPOVVRRjRibGp5?=
 =?utf-8?B?dnNrbzZIbW1SQytGdHgxeEpwTUphNVlTdStqdGQyRjZRUEJoZHNsd2xwMlpo?=
 =?utf-8?B?Rzc5S3hmaXFwa3lkZTFZT09RZVZzT1l1ZVZmbGVaL05JUFhZckNRRmVNOG9z?=
 =?utf-8?B?d2ludVFUNHpMMVA0YVBUS0RmNXhENGRTR0F5L2RhSkVrNWZqOUNaU1U3a3hU?=
 =?utf-8?B?NEdwbjJwOEYvdEZscTh0VUI3Wmt1ZnBYRCtnSUJBQ1ZzRDBpMTU1U0dtc00x?=
 =?utf-8?B?SDgzaVU5ZzcxenMxcWdLYWNIb0tRMklhd3NwZFZCamRuekxpbmZIaDh0RlQv?=
 =?utf-8?B?VGVXTWhXbmdQa0JYSVpSdStIRXBXVnlBVFpZZmhja3RJTStMOEpXaXpCUk5J?=
 =?utf-8?B?SzNta2Zvc2l6M2JtenpWRFo0M3pNZkRCdS9MMHhMN21FSUdBUWk2MjdkcFJp?=
 =?utf-8?B?R3M1dlBVTkxRUVRmTEFvVHFaS0FZN0NOU0NHSmdlZjgwTEdma242Qi9PK0Vy?=
 =?utf-8?B?all6b3RHeENYUytGWGM3TC8wZkNJZk1qYmMzMVlWcmEwaWRjQkV2UnNjMmVX?=
 =?utf-8?B?SVZnSnJKV0ViVk1DVnBZNnp0L2JVMXoxY1JGaWtUT3RTM2FmREpwUE5EdlNL?=
 =?utf-8?Q?YktzNHY+K+Uqf?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54db8243-2b4c-4273-a8ed-08d91b95f33b
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 13:48:29.8184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjdloSw5GK5Xd/uZGhps00mClcI10lcxDVMr/N+ifoVFrcEHqPwFwlyWp6qfqRMHwvfL9Jin/NugGmFEQvdklSKdJJUdusESi66gE39tf+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3450
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20/05/2021 06:28, Joel Stanley wrote:
> Ryan, can you please review this change?
> 
> On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> It is observed that in normal condition, when the last byte sent by
>> slave, the Tx Done with NAK irq will raise.
>> But it is also observed that sometimes master issues next transaction
>> too quick while the slave irq handler is not yet invoked and Tx Done
>> with NAK irq of last byte of previous READ PROCESSED was not ack'ed.
>> This Tx Done with NAK irq is raised together with the Slave Match and
>> Rx Done irq of the next coming transaction from master.
>> Unfortunately, the current slave irq handler handles the Slave Match and
>> Rx Done only in higher priority and ignore the Tx Done with NAK, causing
>> the complain as below:
>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. expected
>> 0x00000086, but was 0x00000084"
>>
>> This commit handles this case by emitting a Slave Stop event for the
>> Tx Done with NAK before processing Slave Match and Rx Done for the
>> coming transaction from master.
> 
> It sounds like this patch is independent of the rest of the series,
> and can go in on it's own. Please send it separately to the i2c
> maintainers and add a suitable Fixes line, such as:
> 
>    Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
> 
Will separate this patch into independent series in next version.

>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v3:
>>    + First introduce in v3 [Quan]
>>
>>   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 724bf30600d6..3fb37c3f23d4 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -254,6 +254,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>
>>          /* Slave was requested, restart state machine. */
>>          if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> 
> Can you explain why you need to do this handing inside the SLAVE_MATCH case?

> Could you instead move the TX_NAK handling to be above the SLAVE_MATCH case?
>
>> +               if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>> +                   bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {
> 
> Either way, this needs a comment to explain what we're working around.
>
Let me explain with the two examples below in normal case and the case 
where this patch is for:

In normal case:
The first transaction is Slave send (Master read):
    20(addr) 03(singlepart read) 03 1c 2e d5

Then the second Master write follow as below:
    20(addr) 02(singlepart write) 02 18 08 59

The irq will raise in sequence below:

  irq      data  from-state      to-state
00000084  20    INACTIVE        WRITE_RECEIVED
00000004  03    WRITE_RECEIVED  WRITE_RECEIVED <= RX_DONE
00000084  03    WRITE_RECEIVED  READ_PROCESSED
00000001  1c    READ_PROCESSED  READ_PROCESSED <= TX_ACK
00000001  2e    READ_PROCESSED  READ_PROCESSED
00000001  d5    READ_PROCESSED  READ_PROCESSED
00000002  xx    READ_PROCESSED  INACTIVE       <= TX_NAK

00000084  20    INACTIVE        WRITE_RECEIVED <= SLAVE_MATCH & RX_DONE
00000004  02    WRITE_RECEIVED  WRITE_RECEIVED
00000084  02    WRITE_RECEIVED  WRITE_RECEIVED
00000004  18    WRITE_RECEIVED  WRITE_RECEIVED
00000004  08    WRITE_RECEIVED  WRITE_RECEIVED
00000004  59    WRITE_RECEIVED  WRITE_RECEIVED
00000010  xx    WRITE_RECEIVED  INACTIVE

But sometimes:
The first transaction is Slave send (Master read):
    20(addr) 03(singlepart read) 03 1c 42 cc a5

Then the second Master write follow as below:
    20(addr) 02(singlepart write) 03 18 42 0c 63

The irq will raise in sequence below:

  irq      data  from-state      to-state
00000084  20    INACTIVE        WRITE_RECEIVED
00000004  03    WRITE_RECEIVED  WRITE_RECEIVED
00000084  03    WRITE_RECEIVED  READ_PROCESSED
00000001  1c    READ_PROCESSED  READ_PROCESSED
00000001  42    READ_PROCESSED  READ_PROCESSED
00000001  0c    READ_PROCESSED  READ_PROCESSED
00000001  63    READ_PROCESSED  READ_PROCESSED

00000086  20    READ_PROCESSED  WRITE_RECEIVED <= both 3 irqs raised
00000004  02    WRITE_RECEIVED  WRITE_RECEIVED
00000084  03    WRITE_RECEIVED  WRITE_RECEIVED
00000004  18    WRITE_RECEIVED  WRITE_RECEIVED
00000004  42    WRITE_RECEIVED  WRITE_RECEIVED
00000004  0c    WRITE_RECEIVED  WRITE_RECEIVED
00000004  63    WRITE_RECEIVED  WRITE_RECEIVED
00000010  xx    WRITE_RECEIVED  INACTIVE

This patch is to address this case where TX_NAK, SLAVE_MATCH and RX_DONE 
are raised together.

>> +                       irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>> +                       i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
>> +               }
>>                  irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>>                  bus->slave_state = ASPEED_I2C_SLAVE_START;
>>          }
>> --
>> 2.28.0
>>

