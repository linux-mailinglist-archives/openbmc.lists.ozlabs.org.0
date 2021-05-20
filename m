Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 514FB38B0E8
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmBLR1lYfz3062
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 00:04:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=O8vNssRH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.103;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=O8vNssRH; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2103.outbound.protection.outlook.com [40.107.94.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmBL51byRz2xvT;
 Fri, 21 May 2021 00:03:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfmMetX4YWCM+hZ0s2oEhRsjT1xqOQu8mjU7VviEBbrMJvIjIrP50r7b3WnVD4cxQxDI2BqxoKzHkPaquZaUtKhdYJYPu4jhDTf7dXExvezI14iiD3v7HBWJ9nNQwouFCjqMhqpAtJvSxO7MVq5zXKAqZSZrUkzDQFqPuUlMcfvDF4wFX0cbQu2wCiXsFH5czIjktzIfSInQLJUx9jbzYs904Jzq0aV69X6Ihe6oOdXHkLSpkKbFpERkkpIvCNVBxF9bO7pne5i8kW84xCZ6jmwXaqHQQ9TiO8EsaUMB4C+QXu+ESnmGBQyFSeV/UAmgyEq4Y8cnOCvLDU1lr6Hjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyql9MaMdh47OJgpYDRPts7soSiw2EHAounFyrEltV0=;
 b=PpDqTnSZDiIazKprJmL9dGjc7lGFWULn70di6sJzMZLw7dENBOI+ARyLyxHwOF6ifjLVzRGmbMgvdnG2ZM16WH2ish22Vl7Kulgz9VB+KQuCyPqCujTx3kU0/cQNuiILRAOKk2efuLE75E/UTkWQDqRl5CZYhOHNhfzjE7ZNo7AjHBr2t4sQ/TiRykfeUPS57Ze+e3Cg5sRN1MxzEodkdnSNSbFecEBBNuKkGdTR9L8olFttx2GzwqcXyrpfp+xGr29xQzl45Uxli80xRjl0w+lSqYT9vz3WSsgVm0VwJ1/jLeeW971Gd8c0gqxTdo5DBkMrEheuoKj8cgjz5uj4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyql9MaMdh47OJgpYDRPts7soSiw2EHAounFyrEltV0=;
 b=O8vNssRH1rSaDThpwcuwEXEes8+HZi+Q5hWtOhIzZngQDNuU4D//K6Shigz45TiMB2PqrmL8+HhIxmJMnoThHqfThcaFgGAoy6NYd/rvmhZjF58FkuTINl4Z9Cb+0Jp3SEsFBCYYOLwMfHqVx6T/pRurDYylJP1/aTxKe7YfJoc=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MWHPR01MB2672.prod.exchangelabs.com (2603:10b6:300:f2::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Thu, 20 May 2021 14:03:48 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 14:03:47 +0000
Subject: Re: [PATCH v3 4/7] i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
To: Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-5-quan@os.amperecomputing.com>
 <CACPK8XdyQT=cuSr9KBqC0PBkOLgBUBpyz3kZEA3JuOuZsQN_Rw@mail.gmail.com>
 <414a51e8-0973-0007-9ffc-2949f3c7b0f8@roeck-us.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <f7b8ee1d-61dc-68a8-f60e-25f99e104c04@os.amperecomputing.com>
Date: Thu, 20 May 2021 21:03:33 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <414a51e8-0973-0007-9ffc-2949f3c7b0f8@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2PR02CA0199.apcprd02.prod.outlook.com
 (2603:1096:201:20::11) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2PR02CA0199.apcprd02.prod.outlook.com (2603:1096:201:20::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:03:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c373ca7-6ea2-4650-30b0-08d91b981676
X-MS-TrafficTypeDiagnostic: MWHPR01MB2672:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR01MB26724707C44289B435517C81F22A9@MWHPR01MB2672.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lScz7btVUYbqeQPrvviWcyZmoxnASf9wXSzbBFmdYw0iftLQn7hz9VNzQSw/U0kl0w1uYrNLWHNM+naU1lfMELb3RejzvSjGqfDnlGDyQvO3p9yWOgbltBCmWyhtf+9RFvJ9UnUimyJIlLMwIzVsNseFvBI+bOOKu+Y95Te5cd3+nJSPb1nbrqtXeZrJ92eTLxbkHH5uZKOs8h28HAUD3BjY9z1JBgYCviY6EFe23T7JPi71qWLj6oMIGsk44qkTZC6I1PyO5xoKGbbJD7PBYu50zah0s39C8y6c+nbKcWGfXNhAcCVkYWtvCG5Vd6EbliG7CV2oz8jnUsZNR0+/DtrSZzIjor6XZPOJUMv5DValSuR2GIW1+efWsljj3/6fUaQlcu8vg4rtN5rD2/PKbV3Ivyv12HHzvgONsnf1nnIVNuMfb4CTnPGlF000wNOT/ef6SVmq9hsgS7CGhawm/3iQnPNHrZpWATuT6ztzveki3cBEuNzmc5YhZF2jfrcVph83y+mEPLmF3UJrbUK4itIm9A75rvcQOVQFqhcOUpa9DnYM1PHjfoXx/8Df7y6Uq7ujptn3tn9l24z7mvU5Kwvp2OJwTPB53lLxDvZA3dVIZZM+0MV3lTeWWZXtAg18SoHyJcmqp+Y+NzhKmFq5aGDV4tuOd3m7YSPzzs14onMMPSnUEQs4nYLkVHFbKFJk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(346002)(136003)(396003)(16526019)(86362001)(186003)(7416002)(83380400001)(52116002)(66556008)(66476007)(31696002)(53546011)(66946007)(6666004)(478600001)(2616005)(31686004)(8936002)(38100700002)(316002)(54906003)(8676002)(6486002)(110136005)(5660300002)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGVnaUIvL0o4NFV3SHA1S01UQVpsbTk4Uk5pclpBWEZDVERxZlR5TFFDOW41?=
 =?utf-8?B?c3ZJWmxkSFBhbHp5Qmk5czBROTE4TjNjVVdiay9DWE9qZU4zTTJZK1FLOXMr?=
 =?utf-8?B?RGY4MDFzZ1p3clFlVGhkUDVqazFmN1FGdFFzekZieFhZS2JPTFU4Z0h6YlNF?=
 =?utf-8?B?ZllWUkhYRVhueFhDNGlvMGtLRTBBVC9HRS8wRnlHdzZsVzZsRGQxbGx0M0kx?=
 =?utf-8?B?OXI4K0pjU1FLLzVGRUppekhGbDJtK3UzT1U1ZUd2Z1NlM2NnTVdGcGllTklL?=
 =?utf-8?B?aWVaODhQZTlDRkFHUGg3MzBRUk5SVU1qRklHaWt2N0JaRkkyT21QVjh1NjIr?=
 =?utf-8?B?UTdsRURsc1Fta082STdHTWZUT3Q3eU85OHZLUkUwYWdRUExKZVBleUdWVEY3?=
 =?utf-8?B?clVTcWI4MCtVNEEwbm55YlNDZnM1OG1FdGhTY2RnUXpHdU56N3VPWHBiWFNB?=
 =?utf-8?B?cGRZQ2xobTJCM1dFVlZZaTVjekxqbkNMSHlMKzk2MFZzKzg1TE51UnAweDFB?=
 =?utf-8?B?aHJTV29sNXpVbTZUam5ONzJma3pzWGtXR2laNE1mQTZwcGkwZXBwczYrZ3BT?=
 =?utf-8?B?MUdjVUFFSU8wRHpBZ3lIV0FnMjliMnM5Q1NTRjFHUTd6MmVleTAyK3lzenZm?=
 =?utf-8?B?UVcxbU9aWmorQ2lxaG9XeGhIOUVtZVMrN3crQzd1SFB3dXpWdUNWSVFUak5G?=
 =?utf-8?B?QVI0Vm1USDU5MENoU2Z0SUxScGEzUmlvdlZUUEhOdjRZcHJCY2k4SXFzdi9r?=
 =?utf-8?B?RGhxN24yUmpVbkhCVGZqMkx5UUZuUjEzSnZwMDd3d3IvVzJYTlN2eDlObkVs?=
 =?utf-8?B?TWtnNVFRdld3Q2RPRFNFQmNJZHdQYXFnYWxWSHdUUyt3RTFSaVZBL1RmZ2xr?=
 =?utf-8?B?aHRQOEtid2NRd3BuMzFibWNpRjFDQ1JqVzRKN0dWNk5kWG54YTdTUUFQS1pX?=
 =?utf-8?B?WXlMd09VK2tPUkpRb0x6OHZUejFseEpRSWwycVFzclBJdVFTSjFyemFEWENH?=
 =?utf-8?B?ci9qcEJ2MXBHZm51SVo5YWFadHVYYnFxckdoUXBlU2licG1ETHdSV1dWdEdn?=
 =?utf-8?B?RUkxUCtKZnQ5VmxuTHI0OEw0MFZhdzlkZS9wN3pGdVBJdWtYUkF2NE9Damkr?=
 =?utf-8?B?TllBdXQ0ZmlvM0Y3NFhHRXcrQmg4NnQrRjB3Mm5YYnNnaldkam1KRy93M2li?=
 =?utf-8?B?SUs1YkQxeDZLQVdYTmtwVWN3a3NLMDVWVStqUElOTEhDQ3FzN1RSZ044cDU1?=
 =?utf-8?B?TUMxTWJlZEZ0L0xLVGpYSWFmQzNZNjdtcURjN0wyTEJDZCt0MXd3Y1FQQ1dv?=
 =?utf-8?B?Z0s2MnFLMWN6a3RMU1dKSlA4TUxUa0FsaHZCLzdLQm04dmE0K05HT3ZCM0Vp?=
 =?utf-8?B?Ukgrek9hTi9aN3FCOHV5SmVOVWcyZVdwTUkzdWJKcXhwRU5HZ0pabUdjcXNF?=
 =?utf-8?B?cDBTUXFoRFZWSHhOTjdlT1JXTmprUEIvbStpcEk4cS8zd3FWa1llbnlnZmda?=
 =?utf-8?B?NHFTZkhWb2NhOHQ2SWh4UXU1L0lzRlNVb2VyLys0dFQ5QTIwOERFY2MxUzRq?=
 =?utf-8?B?dU0vN2pZbkZQaVJReEFvMUN5OThhalZGT1VIUzY1UG9Ndk5sVVdWMi9QMVJp?=
 =?utf-8?B?K0tqL3NyTEF4T05PanQyQk9LRVplMC9qSHpyWDNaVEJSOXFIcE4yY1FOSkZy?=
 =?utf-8?B?REkrajZxRVN5SDJjN0NoZ1VaSHBLTGo3NytweFJEMmRLN0FPajJxMUV4WjNq?=
 =?utf-8?B?WVRlVUUxb3E4TXJsb2N4RzhjcEt3OGROa2JxbDIwRm16WlRyVGhpUThVZlNw?=
 =?utf-8?B?K0pUcXZhNDVDQ0U5U3kvMVFRcW5kVzFLbGcxN01Pc0ZFOTdYZTRpQ2wzeWow?=
 =?utf-8?Q?SITIDzb1w5/h3?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c373ca7-6ea2-4650-30b0-08d91b981676
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:03:47.8407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WqiZg7nkrXqekyb6VcDW0LQ4YYZt8V3LiTRqcElkn9nlHsC2I5vun29vmk+TQf7OWnZk0FhVQgQJ+ZX3gE7Yu5/JUMzLStcen3aHy7J5pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR01MB2672
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

On 20/05/2021 08:19, Guenter Roeck wrote:
> On 5/19/21 4:43 PM, Joel Stanley wrote:
>> On Wed, 19 May 2021 at 07:50, Quan Nguyen 
>> <quan@os.amperecomputing.com> wrote:
>>>
>>> With Tx done w/wo ACK are ack'ed early at beginning of irq handler,
>>
>> Is w/wo a typo? If not, please write the full words ("with and without")
>>
>>> it is observed that, usually, the Tx done with Ack irq raises in the
>>> READ REQUESTED state. This is unexpected and complaint as below appear:
>>> "Unexpected Ack on read request"
>>>
>>> Assumed that Tx done should only be ack'ed once it was truly processed,
>>> switch to late ack'ed this two irqs and seen this issue go away through
>>> test with AST2500..
>>
>> Please read Guneter's commit message
>> 2be6b47211e17e6c90ead40d24d2a5cc815f2d5c to confirm that your changes
>> do not invalidate the fix that they made.  Add them to CC for review.
>>
> 
> This might re-introduce a race condition if the code that is handling
> Tx done sends another byte without acknowledging the original interrupt,
> and another Tx done (or Tx nack) interrupt is received before the interrupt
> handler returns. If that happens, the second Tx done interrupt would be
> acknowledged but not be handled, and transmit would stall. That may well be
> what I had observed at the time but it is too long ago to remember, sorry.
> 
My assumption is that HW will start sending another byte as soon as the 
Tx done of the previous byte is ack'ed. So if it was ack'ed early before 
the slave irq handler to actually prepare the next byte to send, garbage 
value might be sent out instead.
I'm not sure if my assumption is correct but this patch do help in this 
case.
Please help with your comment.

>> Again, this is a fix that is independent of the ssif work. Please send
>> it separately with a Fixes line.
>>
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>> ---
>>> v3:
>>>    + First introduce in v3 [Quan]
>>>
>>>   drivers/i2c/busses/i2c-aspeed.c | 26 ++++++++++++++++++--------
>>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c 
>>> b/drivers/i2c/busses/i2c-aspeed.c
>>> index 3fb37c3f23d4..b2e9c8f0ddf7 100644
>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>> @@ -606,8 +606,12 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, 
>>> void *dev_id)
>>>
>>>          spin_lock(&bus->lock);
>>>          irq_received = readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>> -       /* Ack all interrupts except for Rx done */
>>> -       writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>>> +       /*
>>> +        * Ack all interrupts except for Rx done and
>>> +        * Tx done with/without ACK
>>
>> Nit: this comment can be on one line.
>>
>>
>>> +        */
>>> +       writel(irq_received &
>>> +              ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | 
>>> ASPEED_I2CD_INTR_TX_NAK),
>>>                 bus->base + ASPEED_I2C_INTR_STS_REG);
>>>          readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>>          irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>>> @@ -652,12 +656,18 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, 
>>> void *dev_id)
>>>                          "irq handled != irq. expected 0x%08x, but 
>>> was 0x%08x\n",
>>>                          irq_received, irq_handled);
>>>
>>> -       /* Ack Rx done */
>>> -       if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>>> -               writel(ASPEED_I2CD_INTR_RX_DONE,
>>> -                      bus->base + ASPEED_I2C_INTR_STS_REG);
>>> -               readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>> -       }
>>> +       /* Ack Rx done and Tx done with/without ACK */
>>> +       /* Note: Re-use irq_handled variable */
>>
>> I'm not sure what this note means.
>>
>>> +       irq_handled = 0;
>>> +       if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
>>> +               irq_handled |= ASPEED_I2CD_INTR_RX_DONE;
>>> +       if (irq_received & ASPEED_I2CD_INTR_TX_ACK)
>>> +               irq_handled |= ASPEED_I2CD_INTR_TX_ACK;
>>> +       if (irq_received & ASPEED_I2CD_INTR_TX_NAK)
>>> +               irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>>> +       writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);
>>
>> Are you intentionally only acking the bits that are set when we read
>> from STS_REG at the start of the handler? If not, we could write this
>> instead:
>>
>> writel(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
>> ASPEED_I2CD_INTR_TX_NAK,
>>          bus->base + ASPEED_I2C_INTR_STS_REG);
>>
> 
> This would clear those bits unconditionally even if they were not handled.
> 
>> If you only want to ack the bits that are set, then do this:
>>
>>    writel(irq_received &
>>              (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK |
>> ASPEED_I2CD_INTR_TX_NAK),
>>           bus->base + ASPEED_I2C_INTR_STS_REG);
>>
>> That way, you can avoid all of the tests.
>>
> Or
>      irq_handled = irq_received &
>          (ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_TX_ACK | 
> ASPEED_I2CD_INTR_TX_NAK);
>      writel(irq_handled, bus->base + ASPEED_I2C_INTR_STS_REG);
> 
> if the idea was to avoid the long statement.
> 
> Guenter
> 
Thanks Guenter,
Will apply in next version.

>>> +       readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>>
>> When you move this, please add a comment that reminds us why we do a
>> write-then-read (see commit c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a).
>>
>>> +
>>>          spin_unlock(&bus->lock);
>>>          return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>>>   }
>>> -- 
>>> 2.28.0
>>>
> 

