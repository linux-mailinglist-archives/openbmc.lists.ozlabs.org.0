Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3837C82B4
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 12:04:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=wBG9Wksd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6MYx5YmMz3cfx
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 21:04:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=wBG9Wksd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::72b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6MYH5XZMz3bV2
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 21:04:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo/otCsRTCsiLXGfVpuawg5vVhsJCFofgxY154u6I1ABWgb22SzGtbCwrCObtvsLrykidaxc9kNuNgkRarSsQJUMP8rpfKuvfJjcTbn+i1gmKUTqLP+cJoA6gMkgnGXABGRHQuNxk2vMAB5MgVeKjc+hE9IwUlSl7kYdRyJ4kuJigomGaXLpK7l1tZ76v6BGGOFL2KWPtTQu/M3RtpcX75zgJny8th8duMQy4XqrzvdrIcP4Y4vTvqvSSonQhVxMVheg+jSNJAeUG7dieMUIsVVTsNfstvPObJqwsUZT5RxF0Eo4y/vLvgZhkJOt+Ieuhnm2O65z8dBCR8aDRE4q9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTlOjWhKnVwaUCUZmLT3c3doVkMUGdaKZ82rhS/IifM=;
 b=GvIxVo/VvLC+K4xytQajW9APdQ5qFoz/dQ2kvG2+YcngO3SDLSGz+r2kRIErtpxllAqk+rD2UfSeQlkus6/h9TpFMZ1NOyKmUIWQQb5gtNbzdSEuUuAhFOeKr3JyMXZDXFxgvMoA7Sg4GhA3NAQ4Btc6ZDvUoC/fpfTzzMeZPEAGZ7boHL39Mf21IiLP70MueaRfeFLTiCz+OUMGOH4kLRatwBTjXnBkHMzt657iaT4dTG7qzCLJkwKQiBNX8f06ij1TmECZgHq9FHpHAWhtHTjOaf9Hy4TYbbNEx/IAEXlfLnQGSV5AjUWoQUuWVCpQfniZGVDpBeEZzUYX/D7ZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTlOjWhKnVwaUCUZmLT3c3doVkMUGdaKZ82rhS/IifM=;
 b=wBG9WksdprL4Jb2JNFs23ZaLAYWZG2zSDiWWNW0OBCug2VZVJNJXkcYm8ViTlQePhyMj2C1H30zS1lTkqvexCqWdoybr2GdZgRy7fW/xUPgRZS6NMzkE5ALUIilrp2XyVpu6qDN8LPivZENYgiOvDL20ZxX0SYVDx5mNKpHYa04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 CH3PR01MB8647.prod.exchangelabs.com (2603:10b6:610:1bd::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.46; Fri, 13 Oct 2023 10:03:54 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 10:03:53 +0000
Message-ID: <8f64e21c-7fb1-4dd2-9729-0c30fbf76291@amperemail.onmicrosoft.com>
Date: Fri, 13 Oct 2023 17:03:42 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Update the device tree for Ampere's BMC platform
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
 <CACPK8Xeo+7hTmfYR-eR9H4teUFqs5vOcSRm_VvDoVOqP4D6+NQ@mail.gmail.com>
 <92b76d7f-8eaa-48a8-bad0-714101c558d8@amperemail.onmicrosoft.com>
 <CACPK8Xewm8js1OW4MdpU9TAvpjbJDtd=9siMcL1huJo5a=ZJmA@mail.gmail.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <CACPK8Xewm8js1OW4MdpU9TAvpjbJDtd=9siMcL1huJo5a=ZJmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|CH3PR01MB8647:EE_
X-MS-Office365-Filtering-Correlation-Id: a811605c-3996-4259-03c7-08dbcbd3b4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QYhzanYLcjifkxXk0byA1+i3Nsg3z0NgmoENoXUIl4DIfURG46kwDBaHs7EXtvdjEKuZAYmj1TcToZY/ASEK36Pkpegc0A5E4XEHnPE8v84vemGgMcKd330NAUYn/f965OMk8uFKj+DBDGbEIxbg/qro2J8IebYrYX2D0ewm3kh62KFvHQGrwX75foO9dhZMA48NE5ntB+O+rwRd762oJIR9bA5OM70Dzow5iiPZafRyo04RRWNzs43vbbyu9OmVfAAmmr9HW0E+ECy6a8J4jiJXjZYJgvZfc0SwoKhEHtfPU2URwPnx5g1ypU1h2h+fUhgytpx7bl01Uyx80gpax/OWu4i2gQcs8H3P/Xepix3J15iw9VRBtkxZvlAHC1WgY7T78IiQh8O2oNXA/w2S4L9zsM7rzVmmoq88RyVmqQkM8GDcNrICR15UcoLleVcBZDFY6pm5+ymjfxtsj5KrBQnJXsJ4fZo2LxoA7I4K03TTFVXD/8a7FmVZy414I9DI8yNtTXA16efTtWVTATlWh3QzBth/ngSZ6JZIgrWrJwdRarF3STz2WesRpMOgAL0mzZ5+UEYkEkUR564WDbvCVTb9hNetCF+R1iOmS8xXsac=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(396003)(366004)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(6512007)(53546011)(6506007)(478600001)(966005)(6486002)(83380400001)(26005)(2616005)(42882007)(2906002)(15650500001)(41300700001)(6916009)(316002)(54906003)(66556008)(5660300002)(4326008)(8936002)(66476007)(8676002)(66946007)(31696002)(38100700002)(83170400001)(31686004)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RGh1YUJ4Y2I5eWxuU0M0NzNUWFZFOE5RU3NwYkZlWlFZci90NHdZbkJDYnhP?=
 =?utf-8?B?aXV3b0tuNFRzajdPMWhkWXEyTkJ0Z053SkN6VTlsN3NaSk50UUp2SVpySElr?=
 =?utf-8?B?V1NoanpqN1FQM0pZYzRpcHRTQit6RnpYU0NibmdldXltaUgvWVJVckpGbmxr?=
 =?utf-8?B?MVIrbDloNzlCeHJ0dUdFckJoU1h1eVhleDd5dDFKVkNFL3ZLemxIWjZjWVd1?=
 =?utf-8?B?T2F0c2x5ZEVEZC9NR0JrTm1lV2U0SGliTi9EVGdvOFdaaXdxNENZYzVySmI5?=
 =?utf-8?B?QUpWaG41aW5yYW5RbXIzQmw0cnFZOU43b202Sko2V3ByUWt1RUFOMmtxNDVG?=
 =?utf-8?B?YXJVaW5hTzB0K1JFRCs5eVkrRHZ4blB6UTA3cmp1TEZhVi9IRDk5VHgwRE5n?=
 =?utf-8?B?WEpuSE10Y01BZTF1dURKZDd2YndUTTJPeno3Q3ViQ3Q4VjE0ZzIzWUxyaHFs?=
 =?utf-8?B?akttVC94Rk5kb0lscGE1QlQ3NjNZc05LTXV3UnNrVnYxUUlHVXJsUE5WSGs2?=
 =?utf-8?B?U1I3c2UxV0oyNnZWcTE1U1Nac3IxOVowc29FRkxoY2JPVkU0OTluNlFnZW01?=
 =?utf-8?B?d0FzbXhFdEtwNkxYV1l1UnZCZUFJUGNJMEFVTURIZm5MVlF3Rk9LTDFuQUta?=
 =?utf-8?B?ejZDMG1uZ2JUeUFHSUFsQVZsQ0tkVE03QjAvTFdJNTRMUjVUYTFQRmZvZy82?=
 =?utf-8?B?TzR5b0pwdVl6TEVWb3U3amtXSDJSV2h1OXo3bG9CUGlVc1FKK1A2VnNpRG4y?=
 =?utf-8?B?KzVNTUlZOHY4RFBrbHhYRWY2bnZ5TVlyRVlUekRSR05NM09KS3VGbGJwbzZU?=
 =?utf-8?B?YnNEMFByenNxSDBwS3B2ZndtK1BRcTg2aEhPQ080OHdnaHZXN2p4dlpNQjNS?=
 =?utf-8?B?ZFBjSHdYQmdRMmdXMHpwUzVwaVg1UG9jMUY2SXFGajBWREZPYWhuRlZ1bVAy?=
 =?utf-8?B?QzFWREJEdnpQTDh3VVlOY09FZlpENVpJejhTYmVKb0RtN0dkM3h6aHlHSlJo?=
 =?utf-8?B?M2M2cG00QUhBdE05eU84TGFGalVYSlBtWGY3N3JJcFIvMXdIYmw2NzBLbVFH?=
 =?utf-8?B?bHV0KzVVYXZla0ZJek9DeVFzOTBTejhxSzV5VlFiSmlKaktIRjVGaTFvUm92?=
 =?utf-8?B?M3A3VFEvZ3BKMGxxb3dVTEVQNVlPSFJBRjdEckpIQmgxY09BWWU0SmxEUTAy?=
 =?utf-8?B?QW9zRURwL2R6QzdCNWpxR3A4YlhzbmV1cEVEbGNuMVRtY0lMSXBEbHo3cTdk?=
 =?utf-8?B?YlJEUWh3NFA0SndGY1F6Q1ZRYjl1N1NmZnpLbVVZSWhZL3ZaL21OQmxaMVZq?=
 =?utf-8?B?S1NoMGpPNlFuVEEvZFJNc1p0b3RiSWhobldrWm5jRzFWd0t5NVNnc09zUmcy?=
 =?utf-8?B?enpPSlJNVzRpZE9WK0M4M0E4ZVRwTyt0aHBuZ1JWSGhucE5FN3ZJaG5ubTRo?=
 =?utf-8?B?c0QrbFgxUXE5YlMxUXBVa3pMeTNvODJwRitSb3l0ZnV5SUIwRjIyRnFKOWRH?=
 =?utf-8?B?VWh2WlRzUThjU2VaMmYxRGVXTEc1eHFOMFR5eUZVSlVRdjJSUFh2RUxzQzVX?=
 =?utf-8?B?dDJPQWZMZytBRzRqM3U0M2NiRDFkOXlGZmJwLzZNU2lmOFFGckZZc1JwL0Vt?=
 =?utf-8?B?dmRoRGR6eGl1Um5VcVlhdDVVUEF5WW5aNGx1dXo5dW9vYTZRYmNkTnQyNzly?=
 =?utf-8?B?RGxsR3NhU1JBNlJISHl0OEVodzN5QWo2RW9XaTFTMVBweCtxVXFIVG4vay9h?=
 =?utf-8?B?aStRMnFiaGY0UjlURXcxL25FdEdoWGdPREJBZ1dwRlF3T2VYYVltZlZwYjBZ?=
 =?utf-8?B?NzJYa2hDOEFjNEJyZjVJRTVaekhjc3dXSnR3Q1RsaTRLNUpNbysxL3hyT0x4?=
 =?utf-8?B?L3FhYkhOUWQza2ZKVkV1TVNHcWpZdnZKME1VRlMzcGFmOFFnNUJlSXRjaEsv?=
 =?utf-8?B?K1dpc0krRURYSHJrOXRUdTRqMTBBK2VoTjA4NkF4NDhOaTR1M1M1NmJ1UXA3?=
 =?utf-8?B?ajZsME5XV1p1TzdZZExHakUrNCtlWTNZa3NkdTQ5WWdwZEt3UDFWeHNuYUtn?=
 =?utf-8?B?TVZxS3hQTVhFWnVUSVREenhYK1dFTEdXY1hCaEt3RFVHNkNEbzJGaUNqdkwr?=
 =?utf-8?B?Q29DdWp2THAwNjg3Q0NFWVJ5NGJqcWUzcXBhdWV2K3luMEZyU01EQ1YreFFY?=
 =?utf-8?Q?KfYR/ipFRfsVAdtSBD4QvVc=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a811605c-3996-4259-03c7-08dbcbd3b4d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 10:03:53.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1r+2qJopmP6nkmKd3XBEUa5ryVFK2xXaV5OAqW/FdKOkl4dt0PjswEhKaf9rKl7I+XS/9njYOdjPwvbEZkcFkVRfexpEpJuECXK4GXqdn+jLMlQNRBEDGL2z/MItDIT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR01MB8647
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 13/10/2023 10:02, Joel Stanley wrote:
> On Wed, 11 Oct 2023 at 21:58, Chanh Nguyen
> <chanh@amperemail.onmicrosoft.com> wrote:
>>
>>
>>
>> On 11/10/2023 15:31, Joel Stanley wrote:
>>> On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
>>>>
>>>> Updates the device tree to support some features on Ampere's
>>>> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
>>>>
>>>> Chanh Nguyen (7):
>>>>     ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
>>>>     ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
>>>>     ARM: dts: aspeed: mtjade: Add the gpio-hog
>>>>     ARM: dts: aspeed: mtmitchell: Add LEDs
>>>>     ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
>>>>     ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
>>>>     ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port
>>>
>>> I'll merge all patches except patch 4. Please resend that on its own
>>> once you've added names.
>>
>> Thank Joel very much! Please also help me push them up at
>> https://github.com/openbmc/linux !
> 
> Sure. That's been done now.

Sincerely thanks!
