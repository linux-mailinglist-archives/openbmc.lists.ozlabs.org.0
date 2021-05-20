Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283538B19F
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:23:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmBmv0pPRz300b
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 00:23:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=dAso35XC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.122;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=dAso35XC; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2122.outbound.protection.outlook.com [40.107.236.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmBmX39Bhz2xMw;
 Fri, 21 May 2021 00:23:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSczIRa/9CweTDv+QiurnaEqEcbjDwIKBjxPSGYfw2F96JEa0dDy1JS7K5q3fPZ0AA036d9VD2zYKsUtZm/ch2acdp/viE8D2TAg46q8n5psp5CZ2a2zK4f3OSEZnx/e7hpJgvOR68yQ+O2L/nXMEM3C0L7kA3bvPtqVZwPOKRkKdfNepULgCtQ/upBzqDnsJgmBujKy53A/h95+X9xaq5NqNuNNnl1royFiJCA68uI+ohn5znXgWoDKHBYp5/d1Pjc1gaKtV9919dHqZ2o3zDAe2xXAKiJAeqlWoOARywzFBkooOsUCnAwVM0CHiLqrL3ql+3TJJp8w9nFV/NKSLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41ejgpNrRI8WUxXaYkEt/CMEql9ZR8SxHXd4tmYYbSw=;
 b=fA+eAYiqGEhpCy1NuO6L//N6ekRgMQHiSbyJraotJlPZONVZw6aKb+AAjYhhYw9P/ejnuEKO2pR4g4S6J90nGjMSI7afiaYSRz/qduuDH/wSxBI2flpIc87WBir3XP3bBb/skbuE46MVDf0seiVVRU1FvG6iM5kqa2guX8o1cvuI2X9m2lI9mzi4RRU5SMIdZzNX55TjZKH8kjx3B6gtLKAK3k+Zs3DGxX8b5Jn3cXTc4cvGfWKQAwVtEzculGJ8jiVUzHrbp27+LcwC8ELcUZFTtjW06eHOtyOp0urULhg6Yg60XKEdYUDweRutSwSJ/B1zJTUa/VVTH939We+DUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41ejgpNrRI8WUxXaYkEt/CMEql9ZR8SxHXd4tmYYbSw=;
 b=dAso35XCgcf+zY/t7A9NClsQ9vaerQ24MRGZ3ECwPdWPpaYs4Hk6R4O0Ey8hH++vw/MVXBfEDrD9bVO8xctDA9F8KSGQAqpwRR/7ZUJtEZP8PvRkSGBsOlw/Cp2X9a+Z6moPNeMldkwofq4DecVVTu8SxUbwrf3oJ8AVEetPdmY=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from MW2PR0102MB3482.prod.exchangelabs.com (2603:10b6:302:c::32) by
 MW4PR01MB6146.prod.exchangelabs.com (2603:10b6:303:7c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Thu, 20 May 2021 14:23:18 +0000
Received: from MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503]) by MW2PR0102MB3482.prod.exchangelabs.com
 ([fe80::d840:7aa7:58d4:b503%5]) with mapi id 15.20.4129.034; Thu, 20 May 2021
 14:23:18 +0000
Subject: Re: [PATCH v3 0/7] Add Aspeed SSIF BMC driver
To: minyard@acm.org
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519123401.GG2921206@minyard.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
Message-ID: <58adf982-bf9c-f706-68ed-c25be43a22fb@os.amperecomputing.com>
Date: Thu, 20 May 2021 21:23:04 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
In-Reply-To: <20210519123401.GG2921206@minyard.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To MW2PR0102MB3482.prod.exchangelabs.com
 (2603:10b6:302:c::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:623c:5f9b:6031:ff4f:8fc2:44d0]
 (2402:800:623c:5f9b:6031:ff4f:8fc2:44d0) by
 HK2PR02CA0201.apcprd02.prod.outlook.com (2603:1096:201:20::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:23:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4d19aae-c578-46a3-00fb-08d91b9acffe
X-MS-TrafficTypeDiagnostic: MW4PR01MB6146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW4PR01MB6146795D433369FB2AE468C7F22A9@MW4PR01MB6146.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7XJcXzu0tBS/1tUQO3bEwWHdW8wOh0gcdS9RGmudeULRkxPZn0F2JwdNaSZdEPugI++FcnCFIoOv6OpSuKOUlc+0w31exKiKIeH7DdqpWT/YMQ3sSPdSe8AMYCTBwS8L/DSNlSAe9BMOSgHI/LRl6WYxJb2ShMP2JUO9cDAse8XIebjFaIAilfjwJ7h2A6B+0zfa4Ayx7V6gyUTwzX/wrC43XqmHx4DBPff1t3egmjM3zScxoslPs0S1/dGa/hiC45+KTxUt8SO/RPb4y/3UdXT7LrxhZrMu/970d4QwSrXbN4l26MKewGDRDhOParRIn3WPTbIb/NLFsukosP7Wn8xihE0m016P4ZY2L2mdImbDrfglU2Z1YBw8Cih+cBJaZpL6KRdSY4ILfwaUPYteX7o8fS/l7zSJudvRP/zSc+hLUunSioe5rH9elJDyjZ1oRa/mX8gEImTboQVqcBpuiGZP/xOkzc/DKNp4zGBwNdLJcLyLUeCb5KJ6SZqRjWtYLn20ANmVGpvk0nmEoFqQ/tPDDhHpgJCgGW5IU9ZsfqJKiLzL8AxtnUH2A5DAbbEDPLGdPVzL8Ln0ldEI8xuZjiVwTZz9iHsqQTcEQ2urAKOLC5y2JFxJif0LSWyCpgsUtyVUnMzbRYjp2lQpwHtsAUTtDsPJ3FF6FmwezF4wulfZS6M04jI/QBCA46bsb+t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR0102MB3482.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(396003)(366004)(16526019)(316002)(8936002)(86362001)(186003)(53546011)(7416002)(52116002)(66476007)(6666004)(38100700002)(83380400001)(4326008)(2616005)(6916009)(5660300002)(6486002)(66556008)(478600001)(8676002)(54906003)(31696002)(66946007)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cXVQSnFORUJ2RTdYZENWaWh1WkVvaVhNcDE4TWw3QXgxNzFQWVFjQlh4Rndh?=
 =?utf-8?B?QThCR0NacHgvcWRpZzFQclhScVQ0bnI1S1pjWGFFNWVINW92YXVMU2JPQVBU?=
 =?utf-8?B?clF5bUplR2xxQTFPck9QQmFlV1l3dGlSQWEyRTBIVnlBWllQWXhMUnNMdmJM?=
 =?utf-8?B?VEZLU1djWGVscDZMYmZDcVJmWTU3Y1ppeDF1NW1NbnNaMG9pUVJiZ2F3alpX?=
 =?utf-8?B?bTltd25KUUljUWZFZ0ZZb2p2Zk1OcEc3M2x3T2ovN2V4MTg0dXhhcGx4alhY?=
 =?utf-8?B?SkszekZnc2o0VjhTVTErNzM1OUJvTm5XR3dnVE0zNWVTSmhrZ3VOaHo4NC9U?=
 =?utf-8?B?cDY3NXFsQ0w3YmZXNU5renhlNXgvQW9FYzdYeXZIdGlvV0l2SVE5OEU4NUNC?=
 =?utf-8?B?bGxVejNURXRJdFZ0WHRTUHNCYTNDQzEzT1BZQXZHR3ZIRjE2SnlCK0J2cFQ5?=
 =?utf-8?B?WXRYSjBFaXBJclhJcEtZajYyMHVsSFU4T0FHcEQxdkFUNU9FY3I3RjRTejRs?=
 =?utf-8?B?MmZEL203MmJZd0pFOTdPemZZTWt0R0VweWtCakxaN2d5WWJVTG5pSUxjT1ZQ?=
 =?utf-8?B?Vm01OVQraXJIRGhSZmduT3ZwemdtaTBRZm9NQ1NWaWs4NUZqR3RSZURBS25C?=
 =?utf-8?B?QnJMMmdXd1ZsQWJnTHBBWU4xWDJRTkhOR3JwSmVneXJ0Vzc5WEh4akZjVS9r?=
 =?utf-8?B?cnc0ckhkOEV1N0tTcUZnOGR5MTZtK0Y5TERUYmwwSU12b2FHbUdYVlFBVU8x?=
 =?utf-8?B?bUticHBCNEFsdEx5aHRCQnp0YUdBQTdvNlZGY1RxOUFxOUdWRXFJZmdvZ1M4?=
 =?utf-8?B?eHh0cHl4NUpBUnBRSTY4QzhIcUtubVE4ZU1ZeEx5eEVZYlVhMFBMN2hHc1Jo?=
 =?utf-8?B?ZUs3dEs2MGU3cktsTG1XL0ttaG0rZ0JzRktYSmc4RWwvL0pSakRKNE85Mitp?=
 =?utf-8?B?SVIwTHpDUi83MTIwR3lpa3drdDVtbS9YUFZ0K0dGQ1lWbFdvRmRnMzVLRXdu?=
 =?utf-8?B?RElCdVowcmZzMk9Cb1VOK0tYYW1LVTVBZmM3SUxMS1FzbDNhd3NDT3haaW1v?=
 =?utf-8?B?bUJsWU1VdFBEMEwvQnRSREhLS1RKcGQ4VmlnUXNMaFVXY2V2WGdyZFoxZmwy?=
 =?utf-8?B?VVRvOGdnTFRTZHR4MERCbHhGelRJQXluRjlXSWtCWk1TNjJ2RFVQOTRQMVFz?=
 =?utf-8?B?c04xbDlTalRDUDJGa1ZDdUw2U2lwV3I1UFBIOGVhVlUyZlJOT0ZtU0piek9U?=
 =?utf-8?B?SzdrOTQwOUZmREkyWW45SzM5SEVvNEdLamZwbWFSWW4zeFQvS09zcGZyVGh4?=
 =?utf-8?B?YnN1QmZmTGsyU0JRZUpkSjBlUjh4L1lZNnJMaXZSOG12N3JFRlV3cnFoM1ZL?=
 =?utf-8?B?L2FYeHNNS2trOUhTeFF4RStsQ1p1VkFabTFySGRUYittSEI3MTB1czJnVmlK?=
 =?utf-8?B?ZXNwUlI4N1hjZWlZY2x2L21GSDJiQTdnMW45cGVuNFg1Mm02MjBzN1kzYW8z?=
 =?utf-8?B?RlczUVQwQnRDeXdqQ2UyZjhzUFBrb0xra2ovd2Zna1lncGRmRzN4eFMxVzJY?=
 =?utf-8?B?MkxFa25tcmh0TXljK1lVbW40RG1mT2VSMEtCQXlNQldidjZMOGEvSER6SldJ?=
 =?utf-8?B?Y3EwZjN0REt4bENldlRBS1d3TVAyc1IrdVNIY1lHUDA5RGRwVWU0UTc0UHhN?=
 =?utf-8?B?aWVtMTVtQTRWYzc3SEFUWXFnalJjMVprekljK2Mrams0UkRpVFdFS1pvNFJy?=
 =?utf-8?B?bHY4WTYwRml4R3pYdGMxa2h3WnovajE2bnBEcmQwVVZmc1p6NU5HZDRMSjJP?=
 =?utf-8?B?N0hTMi82YnVNSVV3bHo4bWdIK05PVU8yZjZGNVFHbHNET1BSNjhyVEFIWllW?=
 =?utf-8?Q?UPwBkDuMxpQPU?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d19aae-c578-46a3-00fb-08d91b9acffe
X-MS-Exchange-CrossTenant-AuthSource: MW2PR0102MB3482.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:23:18.1417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CrKnUqmKF3oAfw/ZWj+yS0idUniqika+2A/OwY0slpAsSVeoPuMvsNQXqlIjTiK8rRKc9/fe3kG5YNiU7TFo2VKikax2aimwmwUIch1eSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6146
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19/05/2021 19:34, Corey Minyard wrote:
> On Wed, May 19, 2021 at 02:49:27PM +0700, Quan Nguyen wrote:
>> This series add support for the Aspeed specific SSIF BMC driver which
>> is to perform in-band IPMI communication with the host in management
>> (BMC) side.
>>
>> v3:
>>    + Switched binding doc to use DT schema format [Rob]
>>    + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
>>    + Removed redundant license info [Joel]
>>    + Switched to use traditional if-else [Joel]
>>    + Removed unused ssif_bmc_ioctl() [Joel]
>>    + Made handle_request()/complete_response() to return void [Joel]
>>    + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
>>    + Remove mutex [Corey]
>>    + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>>    + Removed the unnecessary memset [Corey]
>>    + Switch to use dev_err() [Corey]
>>    + Combine mask/unmask two interrupts together [Corey]
>>    + Fixed unhandled Tx done with NAK [Quan]
>>    + Late ack'ed Tx done w/wo Ack irq [Quan]
>>    + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
>> to fix the deadlock [Graeme, Philipp, Quan]
>>    + Clean buffer for last multipart read [Quan]
>>    + Handle unknown incoming command [Quan]
>>
>> v2:
>>    + Fixed compiling error with COMPILE_TEST for arc
>>
>> Quan Nguyen (7):
>>    i2c: i2c-core-smbus: Expose PEC calculate function for generic use
> 
> Note that for this I2C-specific change, I will need acks from the I2C
> maintainers to be able to include this in my tree.
>  >>    ipmi: ssif_bmc: Add SSIF BMC driver
>>    i2c: aspeed: Fix unhandled Tx done with NAK
> 
> For the aspeed changes, they don't really belong here, they belong in
> the aspeed tree.  I see that you need them for the device to work
> correctly, though.  I'll need acks from maintainers to include them.
> 
Thanks for you information.
Will separate these i2c-aspeed's patches into other independent series 
in next version.

>>    i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
>>    i2c: aspeed: Add aspeed_set_slave_busy()
>>    ipmi: ssif_bmc: Add Aspeed SSIF BMC driver
>>    bindings: ipmi: Add binding for Aspeed SSIF BMC driver
>>
>>   .../bindings/ipmi/aspeed-ssif-bmc.yaml        |  33 +
>>   drivers/char/ipmi/Kconfig                     |  22 +
>>   drivers/char/ipmi/Makefile                    |   2 +
>>   drivers/char/ipmi/ssif_bmc.c                  | 605 ++++++++++++++++++
>>   drivers/char/ipmi/ssif_bmc.h                  |  93 +++
>>   drivers/char/ipmi/ssif_bmc_aspeed.c           |  75 +++
>>   drivers/i2c/busses/i2c-aspeed.c               |  51 +-
>>   drivers/i2c/i2c-core-smbus.c                  |  12 +-
>>   include/linux/i2c.h                           |   1 +
>>   9 files changed, 884 insertions(+), 10 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>   create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
>>
>> -- 
>> 2.28.0
>>

