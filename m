Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64338B181
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmBc10nF4z307P
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 00:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=CKrqnd0/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.237.100;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=CKrqnd0/; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2100.outbound.protection.outlook.com [40.107.237.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmBbb2zj9z2xg1;
 Fri, 21 May 2021 00:15:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbjhPD3kvH52gj9YnBSR5tncHocvQ1O3gL6rXs/iNuhiy+nmrX3jdQJtlngopvAQEKFwfR5UPQjhzaKtZ9tCNH/C/wCVYMzuQ9yw56/ysnC7bUjQmxqDurJfJ85zo6ADY2OgeaMFVCT2DAgBf3m7JgaZmoDcl2TdDpj34x7+GAyZSKSeJwcmwnxq9L2+XhaoK73LDGHscVFLhf3FLo7RvAUP5yVL8cpZ+UyIhgIPPjM7RgiDKhIUjIQE1vRYzPQRaEMC3ZyGHCgUMRDZyDcWdhl/vFynXEkjCoEny5Jav7mhPvw6av3bKO8IYIN80+9TiOXnweBAUi0l+3pBvw6QeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRmcy01Jt9Cn5QcPC59RsXMBh2riNUi3tNcpmtQ9Nlw=;
 b=WXguG3MMijIbsChCnxIQEdJ4yFtxxf3xYpIUNhtb3huRWJGsU5ayXC7U0yW/SoRmJVq7nzVhTpY5ZQj5vQx8q+rAQPcbaElWSCXm1CELynEWyVs4xp3IRyT6UeyUaea5JV/G8V90XocU2zFRzwFsfWBMRjgdkotcJgEJeWaC6Kir1ZJr44uAvEhgf8+lNh+vWsLHisiwghweC9O5EM6dJt82/aPjq2AkJcDXcGMkJAigXEhvbWlYiNrUXzdo3tCBQe2mjfw2BgnTdWRfxJ4V/L+5xSqiFdiF4qIKx9E9H7zaMyXKn9OGz2kbKXfEQ2QC6xckjDODdLfmmUb5pTw6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRmcy01Jt9Cn5QcPC59RsXMBh2riNUi3tNcpmtQ9Nlw=;
 b=CKrqnd0/61p6GLMvwTKLyofYzjoCiFlF4VLa1TXI9L5v3sG8DODwb5EnmIXkxmnwNabmJrRFJXIA612gIkflWENlhy+/Bk3/uSLE5/tPJkkgHtBM879wTOc1Y3OmbaBz/KnKn+0f4zReacwrQPYWboUGKltbLntZUnIuueluF7Y=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6500.prod.exchangelabs.com (2603:10b6:303:72::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 14:15:30 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 14:15:30 +0000
Subject: Re: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
To: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-4-quan@os.amperecomputing.com>
 <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
 <HK0PR06MB3380D7B693922C3D6B3C14F0F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <d801bdc4-449b-fdbe-4784-acd13df1c063@os.amperecomputing.com>
Date: Thu, 20 May 2021 21:15:20 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <HK0PR06MB3380D7B693922C3D6B3C14F0F22A9@HK0PR06MB3380.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2PR04CA0068.apcprd04.prod.outlook.com
 (2603:1096:202:15::12) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2PR04CA0068.apcprd04.prod.outlook.com (2603:1096:202:15::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.33 via Frontend Transport; Thu, 20 May 2021 14:15:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee632fea-d5a5-43bc-283b-08d91b99b949
X-MS-TrafficTypeDiagnostic: MW4PR01MB6500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB65007DCBACAD29A4A3315384F22A9@MW4PR01MB6500.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjtykTd6xxlzB53Z/+suMId/z+45hIWDWi15y2ee6m8buWa4KPnQRlj8N1Upzgan90PRI8QHybDvs5FUcugH2lATbZzdtrevLaYriQQCqWzFmVGe/8Tti0cyiGL9GplVR+PIo5KUirbBh7LHtik6yxc6IuVm7eF+9s3fMYRGhFJVkoTlQUxodadN7VvuykrMydCQTd9kXM1cdR/A7fKhJRUb684O2CKpm6yVARmSpNyOE5JtJsbNXr6rZ9KSaum5EKTrsUTawOCaW4/5jF3cW826z9L6fG2ST+/7beFkh3q76Dc0oiiO5NN9pm700/lXmkSUdgM2eM2LSlsXoqIfTJCinjtShWfOUcJFF85XKITuxXGfEDNQ+sz54V/fzFyKnpWIFECEzWm1A9bWvdhFzqcclmgjgHqC+f1IwAi0y2u8JJetvlZnH+WRzYEQjR1snrkkL+AH1lM5vP+kqwnISkQQpQRsEIELL1AMwP6Um4zXbX8pwTR5SIeiUplp7sW39qIex5GS432lrrDcDcTF0huIAvy2yN8OSAMS3yAiHLe98aFMJcEM00/D4F09P/tXofejuTJ1fEqhfRGdyti/VAwr6cqQ072QYhLiWpAQxo5MdZywczFRgWi3bJL9BP49lR+YKdfehgdx/zyGUoteiW49WRoULj/HDj14fuyMpeEVdieLz+QQeVgGn13KdS0U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(53546011)(66946007)(52116002)(66476007)(66556008)(83380400001)(2616005)(8676002)(478600001)(5660300002)(4326008)(8936002)(186003)(16526019)(2906002)(316002)(54906003)(86362001)(31696002)(6666004)(110136005)(31686004)(38100700002)(7416002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YjJ3cFdYRWJKUk5LY2c5bFBGUVRtbllBOFpHcjVSVTM1U1VHQXQ4amJaM0sv?=
 =?utf-8?B?dStFR3l2Q3p3R2lQcEFkam52T1llWVIxa24wRG5NYysraGxRNDNMcmFjSm9K?=
 =?utf-8?B?anFjbFVmZzJDNEtxdm5VMllyRkYvbytTMm1aMUpvRWxZZTN0TDhRS0VRMlJH?=
 =?utf-8?B?SmNsYVlnN2ZWNG1FUUlGNndQUGdKeXRySVZQMElTRk03alRFZ0YxcTl3UHBk?=
 =?utf-8?B?N2F3VUV2WGRCWGo1T0EzNmFxKzdVQ2N6YU90dGxoN2VZTU9kT0RaY3EwOTRu?=
 =?utf-8?B?Y3h6NkN2U1NEL2hzRThYd08zWTVkOWpFNzV0OGVCV0VLNHpzbktXR3FQNTBX?=
 =?utf-8?B?cEJ6YzJKRkhxS2V1SkZ6bC9oYmI0RldqZnk3SHBaK2RFZEVDajcvOHQvMk5U?=
 =?utf-8?B?dHRVQ0k0QzJuZHFqQnJsK2J2dXVzVDVhSHJDOURBU2h1UFAzVUs5KzIwZmhL?=
 =?utf-8?B?SmNoTEVFRGIzaVdjdi9oMFhXa1ljYWdIZkk4U2pEdVRib1pCZXBkL1doSWVD?=
 =?utf-8?B?YW5xbHl4WmRIbXNzZDBqcEZWQVdXdkEwUDlBWUVQajlzcE5mcG82aVBrcCs1?=
 =?utf-8?B?WnplUS94cUhmd0RlSlZIeUVaSXA4TWtrMVQ0UkNPaHdLb05QVGp0U3hsQjdq?=
 =?utf-8?B?T2V3anFsZG5ienJ1enR3K0t5MXJqdm5RekxBbkVSZkRraEFYaDVXODFkSEha?=
 =?utf-8?B?OCtNOHlIdnU2bUFORUlFRk9RTERudmlsSjljZDF5Z0pVb3lVbmNrbGVGZ1hy?=
 =?utf-8?B?bzJvN0g1ZWxIQ0dWbXRpQzE2SFpNb3NuUEtkNzFSbS8vZEIzSE4vN0RUc1BH?=
 =?utf-8?B?QnB6WU5EQWx3UzQ4cjNTTDM4ZmhWZE52K1I4ZUhhMnMzRFdVRHBjQW5kY1FZ?=
 =?utf-8?B?TnJmVGxZWWZhVlRPWXhrRWNwblFGWGxsVm01enBpeHRGbGpGTWFDamZleVlX?=
 =?utf-8?B?WlN0emJoSHlQUUwrbXBMR09OSU1pYXFrUW42K2luby9GMnFka0l4RXJVc1BE?=
 =?utf-8?B?eUhScXRjYnh6QXlJaUpGOHpWOW83d3MzTk4vWUNMM1NxQXlub0s0TUNPT2RJ?=
 =?utf-8?B?MkJTTFdLRkZORVBUbkwvcmR4dmx1bHV1MldrWDZrSGgxUnhrR01aelpsR0tJ?=
 =?utf-8?B?Y1owdEpyUjVUS3VLdHNudkt1ZVVEeHZEUzN1LzllTlZLYWVpaWYvWjVNM3Fh?=
 =?utf-8?B?WW9lTmJvVi90dkNSMzBVWTNjRUZEaERWWTlhZXcyUkdrTlV6NDI3MmQ0bHdw?=
 =?utf-8?B?bEJRRmhrU2F1RTF5TGVaSENTdVZlWklFR2Z6cExrVW5MV2hkaG9jbEVseDdH?=
 =?utf-8?B?RHJIQ2dUbEN6WjN1Y0VlOEV2UExMMU9oSlVjNmF3Q1hpVVh3aDJyc1M0NHFr?=
 =?utf-8?B?d3l1YXVZZExvYi90Vm5zRVlrdTlWV3dxb1RxZ1VvVjJIWGpUL0VoRnZKOXA5?=
 =?utf-8?B?NWNOLzVSeVNaYnpEeHl5STJmRWlPZDd5bGx0Z2J4UUlvQmlENFRlSWMyTW5j?=
 =?utf-8?B?WFhGN1k4ay9YVDU3L3dlRXlZdEhJSlN6RTBVenlZWEVXUG5MRFNCY0VRaEFi?=
 =?utf-8?B?aWRzaVBidVFjSUErbFNjQVZBYStnTFNxQlBSbHQ5WnNmYngrNTVyaENMTTcz?=
 =?utf-8?B?NzN6K2hsOElxdjM0R1NMSU8yQVBVSXVxMUM0YXVWVjJNQXluTytaK1JHUmdH?=
 =?utf-8?B?MnJyb1lnOE5EYzVPSjRWYjcweUR1cE1NeFVOdnNsdXBuQ2M5NGc4ekNoaWkz?=
 =?utf-8?B?aGRpUlFYaTNxWStyamlSY253Vk0xeU56RU40Q1c2eEhaaWd3RFdycStVMmwy?=
 =?utf-8?B?MU1LdUxtbE41cmdGVUJJQVpSenExSVp3ZVBxZllwWTNWanAwRXRaeHhsWUxm?=
 =?utf-8?Q?FtPiWE2ZbCBiF?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee632fea-d5a5-43bc-283b-08d91b99b949
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:15:30.5019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90QMFSPHX77slu410sjHPAg+WN8fOU61Mv6q+Hfe9oMbWKEQg6hoStQb1DvLUZ/Y8C0CNz2zBVkzBDtspR966QTnvBfocTBVTgxOuIW7jhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6500
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
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20/05/2021 18:28, Ryan Chen wrote:
>> -----Original Message-----
>> From: Joel Stanley <joel@jms.id.au>
>> Sent: Thursday, May 20, 2021 7:29 AM
>> To: Quan Nguyen <quan@os.amperecomputing.com>; Ryan Chen
>> <ryan_chen@aspeedtech.com>
>> Cc: Corey Minyard <minyard@acm.org>; Rob Herring <robh+dt@kernel.org>;
>> Andrew Jeffery <andrew@aj.id.au>; Brendan Higgins
>> <brendanhiggins@google.com>; Benjamin Herrenschmidt
>> <benh@kernel.crashing.org>; Wolfram Sang <wsa@kernel.org>; Philipp Zabel
>> <p.zabel@pengutronix.de>; openipmi-developer@lists.sourceforge.net;
>> devicetree <devicetree@vger.kernel.org>; Linux ARM
>> <linux-arm-kernel@lists.infradead.org>; linux-aspeed
>> <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
>> <linux-kernel@vger.kernel.org>; linux-i2c@vger.kernel.org; Open Source
>> Submission <patches@amperecomputing.com>; Phong Vo
>> <phong@os.amperecomputing.com>; Thang Q . Nguyen
>> <thang@os.amperecomputing.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
>>
>> Ryan, can you please review this change?
>>
>> On Wed, 19 May 2021 at 07:50, Quan Nguyen
>> <quan@os.amperecomputing.com> wrote:
>>>
>>> It is observed that in normal condition, when the last byte sent by
>>> slave, the Tx Done with NAK irq will raise.
>>> But it is also observed that sometimes master issues next transaction
>>> too quick while the slave irq handler is not yet invoked and Tx Done
>>> with NAK irq of last byte of previous READ PROCESSED was not ack'ed.
>>> This Tx Done with NAK irq is raised together with the Slave Match and
>>> Rx Done irq of the next coming transaction from master.
>>> Unfortunately, the current slave irq handler handles the Slave Match
>>> and Rx Done only in higher priority and ignore the Tx Done with NAK,
>>> causing the complain as below:
>>> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. expected
>>> 0x00000086, but was 0x00000084"
>>>
>>> This commit handles this case by emitting a Slave Stop event for the
>>> Tx Done with NAK before processing Slave Match and Rx Done for the
>>> coming transaction from master.
>>
>> It sounds like this patch is independent of the rest of the series, and can go in
>> on it's own. Please send it separately to the i2c maintainers and add a suitable
>> Fixes line, such as:
>>
>>    Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C
>> driver")
>>
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>> ---
>>> v3:
>>>    + First introduce in v3 [Quan]
>>>
>>>   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c
>>> b/drivers/i2c/busses/i2c-aspeed.c index 724bf30600d6..3fb37c3f23d4
>>> 100644
>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>> @@ -254,6 +254,11 @@ static u32 aspeed_i2c_slave_irq(struct
>>> aspeed_i2c_bus *bus, u32 irq_status)
>>>
>>>          /* Slave was requested, restart state machine. */
>>>          if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>>
>> Can you explain why you need to do this handing inside the SLAVE_MATCH
>> case?
>>
>> Could you instead move the TX_NAK handling to be above the SLAVE_MATCH
>> case?
>>
>>> +               if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
>>> +                   bus->slave_state ==
>>> + ASPEED_I2C_SLAVE_READ_PROCESSED) {
>>
>> Either way, this needs a comment to explain what we're working around.
>>
>>> +                       irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
>>> +                       i2c_slave_event(slave, I2C_SLAVE_STOP,
>> &value);
> 
> According the patch assume slave receive TX_NAK will be go to SLAVE_STOP state?
> 
Hi Ryan,

As per my explain in other email, we need to emit one SLAVE_STOP event 
to complete the previous transaction before start processing for the 
next transaction.

- Quan

>>> +               }
>>>                  irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>>>                  bus->slave_state = ASPEED_I2C_SLAVE_START;
>>>          }
>>> --
>>> 2.28.0
>>>

