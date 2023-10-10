Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069C7C46D4
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 02:47:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ZJfwBgqa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4vHR5kLnz3cCM
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 11:47:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=ZJfwBgqa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5b::729; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20729.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4LwW1cLWz2yjD;
	Tue, 10 Oct 2023 14:28:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqKvafB9WcJtni2SuMXoOX7cBQcjnUtpX+3vPoMH/J7H6a35VIxptd1cV4fP337A+oUJGy/FdRcoIEp8UlhaV7AaZ53QOnkM2Tpc0eMp5JKP9cdDRnENQd8bW67R8EVXOrapqrPH0DJ2gkSvY5MEgsOzMw9tiig3CgifitbikfAQek/5OMJ3bJDyRqXLeTqMJgIq6x4qSjiTF5nhbl7bCVzsRFX7hk5ZHfzfGWkStxlUB6GwWDuaEEyHheqBvr6nZdn8sCsBVTU6mow72H7alWFU4Q2sK+LV6p+/cTSobBzmiLAmTQyyPAkTpcubUkguJiFMXQ1ATtxHk4+n6WVI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAcHgMTaJgvaKynrsdKOl++n5gguK6LFMS7UcKWM2eY=;
 b=B2hXsOXExnKcYFEnGu6TpPgATwOl92dXdfIxLJlrmOAhy48dvRFDPTtZz41UAz1T+JJ2kICdNeJo+MT/74AZ/we8J1cufbHhGaQL0h1SbgJk+4QRUMnQABVWJuUvotO5TIX6uZgM/EcfynQircBLWhSCFhTQoJQDMkeuPKT25JjX55pgL89/bF9LRtic56JsqAcv4zLGkLoI996awMvnI+3juaOr1Ry5vFNFGjahpwzGx2VDazL5omLj5Xp106yo518tqV7wEkpJFzVB0R88trgm9G9FlHGAUvHoclZUsZ1gl5rqiE5tY1MCBF43XWR0qNcRsjmYFAysaYtVnUqDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAcHgMTaJgvaKynrsdKOl++n5gguK6LFMS7UcKWM2eY=;
 b=ZJfwBgqaSQ8ir3+PcI7V+w8qXcVUzCZotTfCNbRJDlIQD1bH/JaBVGQ7x/3Z37ntde2sLZ0vce+E43TBu7cMPPm22fBFCdDaI0Mc6Q2A0fwgR0Noqtc79Py3v98iDDXnI3WhPwNFOjld3TUmuvhfgPSIdYp1Z/5X8uGxaI3GXt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from DS0PR01MB8010.prod.exchangelabs.com (2603:10b6:8:151::19) by
 LV2PR01MB7813.prod.exchangelabs.com (2603:10b6:408:171::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.37; Tue, 10 Oct 2023 03:28:31 +0000
Received: from DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9]) by DS0PR01MB8010.prod.exchangelabs.com
 ([fe80::6a3d:61d7:133b:9eb9%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 03:28:31 +0000
Message-ID: <b46467de-8ddf-4ff5-a133-c18613d2a34b@amperemail.onmicrosoft.com>
Date: Tue, 10 Oct 2023 10:28:19 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] ARM: dts: aspeed: mtmitchell: Add LEDs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
 <20231005035525.19036-5-chanh@os.amperecomputing.com>
 <65a610df-5030-4dd0-9f04-2089dfe09a3d@linaro.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <65a610df-5030-4dd0-9f04-2089dfe09a3d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To DS0PR01MB8010.prod.exchangelabs.com
 (2603:10b6:8:151::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR01MB8010:EE_|LV2PR01MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 40876822-0bf2-49c1-48ea-08dbc940f997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	W+xaZPcfKTXmZ8W0pXoOQgpGuzobGObiDWyXmKw/zIpS+jeYeFl6j9drIsctl0vv5e09177OHQm5ycjtDT7EleBlehOm6YEbXfYNnFIYypbB8mBEmH4fJ/BFfUGfBqupKLPk2UB+PGVvJzdPg4TJT/6Vy90XdIJfnm1Lj9QtKIUQsPSK8tNnW5JXq8w0f0C1+9/xdfsJHcWmYG2rGAldVJ2rAcf672Li4YpFCSLQf1IgPtQ/ELdV+m/xScwjVt8PbY0rcmxTzq+zKYmIhFES1sudDJ9DH1B5vu5EZLfJnL4bFdsCujBvG+Spu1Eb6o+fvrdt4OUTjmj/xtWRjldVxtxhUpG//SE+kZhPgFE81BdpTXUxySinyN/DGf2L/QFwp21NhsM7XWe+lCLvaPCuBZQH+ZbQphi/XTMr7hPrWNWht0ii9qGl18dds1MPH3sHvKV2l0g3CQurzwOmqMoz3Uy18s2tpemg1MK/GtMc1apo18hokLurOjlt6YAtxwmYcuFhNGCJP1/ckiGXTkjlR+RtPEuyZqCYBXLQVKLx7bpJ0bKy80VHoXnlQKV0lpPmcUtpfdKj9fZFtWY5otxnFXE/y6O55iPe/6zFzHdPma67TFqZ39dOAxLNjei1U63X
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR01MB8010.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(376002)(39850400004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(31686004)(6506007)(6512007)(53546011)(6666004)(2616005)(31696002)(38100700002)(921005)(83170400001)(83380400001)(6486002)(2906002)(42882007)(966005)(7416002)(478600001)(41300700001)(8676002)(8936002)(26005)(5660300002)(316002)(66556008)(110136005)(66476007)(66946007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ekVXbG8rOGNqRW54c3lLWFU4Y3d3L0tIZTdsRXJGQkR3UlhObWJJNXVoZTFL?=
 =?utf-8?B?bkhtNmxWMk5YNVZtYWRoeWMxekV5R2tZNnhZSi9EU0UvcjNjYXlISDJtck9K?=
 =?utf-8?B?amxUVmRkU2g4ZkpxdGZQOCtBZmZMK3Y0Rk5vdUVyTGdLNTEvQlNYR3hYakZD?=
 =?utf-8?B?TDBSN1Y2dnpWU0FGcFYzMFI3SjBLMzRTa2RUaDdweDUxcHdmSTkwWlFhSHNv?=
 =?utf-8?B?SVRrbjNjY2JJeE9xRndwN2tOVjR6QXVSVktiYk5UeWMvN1pnSEdzR3FadjJS?=
 =?utf-8?B?VDZuSWc2aWw2MWQveFdJUFc5cUhhQmo0Sjd4NDhJMWRndnpWV3pEeElOOUFh?=
 =?utf-8?B?QkFzVTRFc3ByM2xjYTNMcHpvS1Qvb0RPSHZjNkhmKy95cGN5dVh3ZHFvUVls?=
 =?utf-8?B?b3lwYUl4bDdvbzkrU0dFMzVGdUdXRXJpQXBOS0ttMUtCOUNZMXQ1cUFkVGFS?=
 =?utf-8?B?U2EzbVBZckJIS1pzZWRHK1VGQXJYeVBDTWF1MTdzbnpuVktISHJ3bU8vdzBx?=
 =?utf-8?B?emVQOElkTnBDNFg3QTZvY1JVdDZUYzJLdjhGZVdXVXFMV2FoWTJkc2JGRzlU?=
 =?utf-8?B?TGRyNlVPL0xCZGZsUldFaStySjM4aVBOc0l6V0xyOEZwajJBSUpsaHhSSXhy?=
 =?utf-8?B?Y0FXbW5xWGJheUlKVWlWZHJUKzJFZVNycTZuNWlvNnhnMkxrYVg1TjVvN21H?=
 =?utf-8?B?UzZGTFhKQ0hNeTdBOUtIR1pxc1JiMCtvUjd1Y1VJR2ZLb2d1ZjFzQy9tZHZH?=
 =?utf-8?B?WUFwUEF6RFhzd1lhZ3FWbUhMZVAzUlhuYm52RmIrWUFPSkthNlBMR1FHRU9C?=
 =?utf-8?B?TWhjRUlpU1I0SUoya2IzUkJHK1pwMi8yNGQvckVOSnFZMFRXOFg4am54TUtM?=
 =?utf-8?B?SUcyYzQyRmc5YWc4Y0ZjSnNxOGJDSnRhcEtXS1J4WG5YNGxnY0ZMZXZLMGh1?=
 =?utf-8?B?NlNRcmdnRXlTaWoxRHBsSlROM0xYOHp5S3drWWdhdkhnTlpucFFGWGFtZSt1?=
 =?utf-8?B?bVJBNk1sUWd2RFk3bXNQN09IRmp1cDZxMjhTaVlMeDNGUHJ1UHVZOHQrRkFR?=
 =?utf-8?B?bWpEN2g5MnZlMHhoU2c0R3NZMWd3QUtaTk54WkJ3QWN5Q3V5Qm5mbDRLd05m?=
 =?utf-8?B?L0V6djBoREVEK1pJVWV1aGxBazFkdGxpZHNMSGVQTGtzZzkxRlhVN2hVWFVJ?=
 =?utf-8?B?MlNYcHg5YjlGSlhYWWxudGp5SlBoVnVHZkFTc1FqbkduS2RpRXc1cUZwQWdQ?=
 =?utf-8?B?L2syNjNlYjZyamJXK09wK2UzU2dEa014TkphbWJHb0crY290ajUxVm9vMEdZ?=
 =?utf-8?B?ZHl1d1gzcHZQTkpLbHZCK25mbXpNOEJtR1RkdmZLQXcwR1JoVmZteENaUjBp?=
 =?utf-8?B?c2hzT2VCSTNDTVRlOE5zOTE4OE9hR0g4VXNYK1d5ei9XWjJnTFRtUkpDQWZY?=
 =?utf-8?B?cVZQamlzZzZlT2NUU0FodU0rRmx6dlNZakNpd0JIWHRYRTRZdUowQzNBL05u?=
 =?utf-8?B?Zk5HM1M1ZTg1ZUVDWGtEbzBIM3F0VHgycXY3QTl6VEF6b2Zwc2ZmWFRobFRI?=
 =?utf-8?B?dW9tcXRWTHE4THIrQThxWmdiQlZCVTgrY2JpcmI5ZC9RdUtWaDFWazl6YUg5?=
 =?utf-8?B?SWFsajZkRHZFcm1iNGxTWlVtYWF0K3VZOHphZk5NM0gvNDRYTjkxMTNpUXA4?=
 =?utf-8?B?QWJxUmp4aVZKa0VvbmZHZUE1Lyt2QklqMG1HK3R2M05FRktjK2NZVWd2TmVi?=
 =?utf-8?B?QVFiUHBGOG5wc3VwR05FRFUzQmcwT1l1OFpUZlk0bkxkVk9mWG4xSGtPYUJH?=
 =?utf-8?B?UmF3c3VvWlVGaUhLUE0yWmFCZjZGTlBaWndSbFNnR2w2NDdFQlpWQXgxZzQ3?=
 =?utf-8?B?UWQwMUt6ZmNxelBlVzVFcC9na293aXpFVDR3Ty8xUkppTk5UYVl4ZURCOE9D?=
 =?utf-8?B?U09xQ3YzbXYxWjVvVVRnay9uK2FPc1ZDL1Z5NitiVXExSmJ1VkZqaWY2VGVC?=
 =?utf-8?B?SUo4MlUwREFydXVxRzcxTDdPZTVmRko3emlSRFNtM3pQR2JhNDhCTlZpRGFN?=
 =?utf-8?B?bEdYRGtKS3FZdHQyaXVYejFGS25sYlBHZGtCWktLemh4M29aL2hlOGZGN0Fm?=
 =?utf-8?B?QUJNd0s2dTc2QnZkRWR3aTRBQ3Jpa0d3T3JiRzdyWHN2Y2hVRG4zTUhUUnJK?=
 =?utf-8?Q?QSw7Y6p5UR918UsTRH0SueI=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40876822-0bf2-49c1-48ea-08dbc940f997
X-MS-Exchange-CrossTenant-AuthSource: DS0PR01MB8010.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 03:28:31.0311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+vKVVtwpfN0lkkvS/TYXJBl9/gLqAXy9vor6Crg+JOh23w90mMuA7JxAPBu/pqFPf1b6bKm/6zs7yVbCze2k4HgCkNI52td1iCup+olkAl8sGFImMd/4nzmQXwm9r9K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7813
X-Mailman-Approved-At: Wed, 11 Oct 2023 11:46:47 +1100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 05/10/2023 14:31, Krzysztof Kozlowski wrote:
> On 05/10/2023 05:55, Chanh Nguyen wrote:
>> Use gpio-leds to configure GPIOW5 to GPIO_ACTIVE_HIGH and
>> GPIO_TRANSITORY flags as a bmc ready led. The GPIOW5 pin
>> is reset when watchdog timeout occurs.
>>
>> Configure the GPIOS3 to GPIO_ACTIVE_HIGH as an identify led.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts     | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
>> index b7c4f7cfad07..88693c2b2dbe 100644
>> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
>> @@ -51,6 +51,19 @@
>>   		};
>>   	};
>>   
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		bmc-ready {
> 
> Missing led name.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Best regards,
> Krzysztof
> 

Thank Krzysztof! I'll test the DTS against bindings and update it in 
patch series v2.
