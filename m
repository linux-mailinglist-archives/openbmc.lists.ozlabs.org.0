Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 628BC406AC3
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 13:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Yhl2qFlz2yY7
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 21:35:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=/EV8oWZA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.100;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=/EV8oWZA; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5YhB3KTwz2yPg
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 21:35:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tdv3xqhis2P8vn1BNgsaNrQRGP2eADZZc3cK7F8kAafPzvm7KclhKpyizdDOHLSV9mkzwj2qYR9ceefyXZo246wJq24zkUP3tUpuU8Av51DlXmb4FskSy639Mlpp2XU1i0Og+P6Lt97X4vtbhPHlrbMdxciRH+zlTkgXN6EYiXPHMcHTDhA88rDw/ZVqDeZ57v6ID4/tPK9j2IZyI7RcO5/71uSb+3uoDru5b5rdm2tcXM39wjQ3GSbiK9dwkMU2f4KB5o7fly34dqKctGgTQ0NSTJ0wRzzB0NiDerS3IdSStIibrKsuaH1pjlK0tPTkMI2atyU8KWA0JzHHCsat9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=6IWHD6kYqb4jBc74St/wUGUcnTbwJXWeWAhpEoco7dg=;
 b=G3HoG3E2g9HeRCeiceyVmw+k0rzAI7vwpRyowEWv8TDDJOIhXr0L34XjCmrLX+H1Ao5oHSkU/xm4ajJi/Xd725D4HE05M3qP1S3mzTLDa8U8d1jqjdwr7HQXteOypgCnuRLi/EdyR9iUBGbqy9yIwptooygjrhXfjG7vTQlkMKoQ3o3KBJJT4P/z68P5dcHRNurjso7//rwTD2+WGO51rzKaYVUWqfT4zctIvL/O0G/p+/IPQw6/ggOXOIr5oMl7st7L5A/oB+jj8s7QeT2o+NIsuj9jqQkirGv4LigeHeclw5Z1tyLGQgG5MDV3QCGY3bApQ5P5XpH5JutJoYawXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IWHD6kYqb4jBc74St/wUGUcnTbwJXWeWAhpEoco7dg=;
 b=/EV8oWZAX3sP2Cx5jHOEIWWeBkzG2XUmdb3mbKlEn2rd5VvBYgk7hERQ0D1UpN68TrZ1064vYVhaK/glK/Whs4nt3b7/7HEXz03YIs+xMiUPLD7wUoWlMSF5XmSnizizos70tnaxDpyOvvBPmVuhufgKytn8b1hycKRJs4cavLI=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM5PR01MB2473.prod.exchangelabs.com (2603:10b6:3:45::19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17; Fri, 10 Sep 2021 11:34:44 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::bc35:5371:a238:b08b]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::bc35:5371:a238:b08b%3]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:34:38 +0000
Subject: Re: Implement OEM mechanism to handle
 xyz.openbmc_project.Condition.HostFirmware interface
To: Andrew Geissler <geissonator@gmail.com>,
 Thang Nguyen <thang@amperemail.onmicrosoft.com>
References: <53e204da-0c8b-d161-a065-a6195550d7f7@amperemail.onmicrosoft.com>
 <3909e9e3-0a58-e542-a004-89278438997d@amperemail.onmicrosoft.com>
 <07A6A378-47F6-4805-ABFD-D216F4D4C8FE@gmail.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Message-ID: <5429fce9-d715-51a1-5e8d-61b3bd434a23@amperemail.onmicrosoft.com>
Date: Fri, 10 Sep 2021 18:34:29 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
In-Reply-To: <07A6A378-47F6-4805-ABFD-D216F4D4C8FE@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0192.apcprd02.prod.outlook.com
 (2603:1096:201:21::28) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
Received: from [IPv6:2402:800:6344:78c8:f935:4326:3161:aab5]
 (2402:800:6344:78c8:f935:4326:3161:aab5) by
 HK2PR02CA0192.apcprd02.prod.outlook.com (2603:1096:201:21::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 11:34:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90171314-869a-4749-fa8c-08d9744ef8e1
X-MS-TrafficTypeDiagnostic: DM5PR01MB2473:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR01MB247334E4B1F17F9C74A0BB2A90D69@DM5PR01MB2473.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyTSnk2cQFVXIP67eqPH8MKXotblyTjQNtZCT4jroxRPbYiIIwOdynuUI633OA9nflde3dbpuD5s0JqLT43dMgXEOHANDGSemPs/zuqY7cQm5U7BqU6SVs8iY28jcRGxDygDR9GPTRB1IE3NjsTmGUy0P+tcd9IyUANwr/Yh7++voYMeRRufkKbRBvqdAbREN+Ra0HM6/7glq+j+tUzTj/Ip6vnTVLlwo2PeOyXaXc3t0ubLlKLvRSb/3ex0AT6VIEO9IClhfGDmm9I41mcC0CcR1jgeFQCiKFFRU6IwHdhK7pN2RO2L7UYDhh6YKKNkMCTy5nrukZz2UwyLqkb8eHvILaC6FpQR8RUNWCrnbmw/gSPEXCFpzPVSZkILcFSV0duF+bGf+5k0psh9NPv4OjxORkBEs5G0YqPnRwGYpPAY3FJVtJiE/s4/66+aSd4RwMpyDZb71tZhnfb0N7FcS/L8n+RNwnUY7jVjZuyDIr9hzFRqeHsm4j+FR5o8QM/zRVAsvmnRg4DOsg8qgiOzx1iYcrzfOL42KZgQ5fOq6yPp6gJky9L+q46iTlvbXB206qwS8d1aX+4MxhBIWToFOqh9k0jXlB8ozP4lsR2pycqMK5bXoYHPl01Cp8ztgmPJDW+v/bnEcjutlid2PKMKUdYRLo1yqM2bAtlOaswOQOh9tD2P/2pT8kbRzE3hyZ6Pa6cafl4jNZVtJ9mD9rYzZLBAfumxq69TVMAe365Go6ecisje1ujfoKX7zFPMvdQ8+cUSIE5xr1dvX2G+19+Vgb4V4eYyLm85kn223WjsDBu1kQlygYfhB6xwQFKo1xQ49SIxQaoyh7XGJpq/vFcdY8XK/FErVTOwxSwLqWfa1cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39850400004)(346002)(136003)(31696002)(186003)(4326008)(83380400001)(66556008)(31686004)(6636002)(66946007)(966005)(66476007)(38100700002)(6666004)(2906002)(5660300002)(42882007)(6486002)(110136005)(316002)(53546011)(8676002)(52116002)(2616005)(478600001)(83170400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFZxR20zcWZSK2JhRjcxcStJWEphQXQwOEoxSGtEbXhZVUZyN21nNzlDbTNi?=
 =?utf-8?B?R3hlM2hDcVl2RU4ySzM4K0ZGLzRXWHFIb3kzY3JqN0czcFU5L2ZxZFkzMHl3?=
 =?utf-8?B?V1hZMElJOTg0elN3cVVGSERRZ2FPWFNKc3RCN2gzbEgrdXZuOGtSaUVXTmti?=
 =?utf-8?B?UXVGSTBDa1VzWjdRbkk5TyswVXJmZXVWWFdPcytPMGptQk0rL0pPV1VsVEVa?=
 =?utf-8?B?bVZQQXdrRXRyRFZsd3pvWnhnWXRFZC9TaGQ2MDAwNm9qbm83eHJCOUVkZlZs?=
 =?utf-8?B?ejg5UkUxWWh5WktCZ0dQOVFlUFRHKzRhMFd3cWhoR0VPakpnb2xmQW9WbmZ2?=
 =?utf-8?B?OTFEa2FhSFZ1Z2lNVGs0V2NnSVRYelNtSHZRbXRtdHhRakZrOTQ4cjNBR0dZ?=
 =?utf-8?B?ZWhHeThRbjJJWGtJU2RSaXNYTHl2Qlc5RHAvRHNBWEhGL2JHa2xwNkd1aEZU?=
 =?utf-8?B?WTd3L1hMYVk1S3VBOUM0S0RsOHo0dmJjaGZlZlpnbEEyQUU3UGJRaDhCQkkr?=
 =?utf-8?B?ZThYeDdtdWZ3bmtZcU1FOTRCNjE5QTJSbTZJdGFwMUNmeGJLWml5TmRkTUhN?=
 =?utf-8?B?dHkrbUVpTjFWU1VqUDBDY0YwMk9lUzAyK2dQdC9pdVQ1aVVjS0hLdU9pK00w?=
 =?utf-8?B?Zkpiek5kdGdKNDJ6Q243U1NkL2dBQ3djQ1VMVmVMa1B0Qkh3eDJFbXIzcGxO?=
 =?utf-8?B?UEtLWVJpWldjRnU1VHVBdlUxVHFXVlQ5RjM3SmZoM0tkbFZLNW9iRzBFQ3hC?=
 =?utf-8?B?YlN2OVRIMGZUc3E3MEVDSXdxYWY5VnFaL0FuTXREdWdxbm9hSlkvV3lqMUFS?=
 =?utf-8?B?YTZRaFd6Zjh5eExKUHFmeHlrOWRCdGFyWFMwVEUzRktMR0ZTTjF0Y3gzUDFU?=
 =?utf-8?B?S2ZBVDRtaXFKd2o2MldKRUcwOFRYNjk5UWtLMnhEVTFWV0dSN0dFeDllMGs4?=
 =?utf-8?B?eXNjUzF4Rkd0M01peHg5Z2pPOTNXNW1mUHFDR0krcTMwS1UrajhncCtjOEtI?=
 =?utf-8?B?RVNDRUVHS0RBTjIvcUxEMytzQU4xTUFYMUVHbXJmaXZlZjY0Y2lxbTk4YW9R?=
 =?utf-8?B?UkRWVjlhNkRXeFZEek53VlIyRDJWdXVoczFheTg5bzBzaE5MZkF4bS9IVmhH?=
 =?utf-8?B?ZDQvZFIrN1IvVXE2SmwxWllVOHVibll4M3RYQ0dLcytQZHBDaW4vbEwzWVJh?=
 =?utf-8?B?TEJaQlpPdG1SMmZRTHNROEhyWDl4VW1iaXBDYVNJdFVoNktzTFdHcXNNTHVF?=
 =?utf-8?B?bTFTazVpUUN4YVV5RGdRNTYyZkV2aXE1NGd5Z1hjSG1TNnB4SVJSY1VXTzk4?=
 =?utf-8?B?UG95b3NQVUtJZnlxRHp6Rks5a1NqWEovUEZKV09mSGJyY2hmRUVNbzB2eFlW?=
 =?utf-8?B?RXhIUDBzV21jeUQzSy9JWVV4R0c2ZldWNmdhcGs0QVFSZnN5bXRLZTRiL1Zw?=
 =?utf-8?B?TXBiQ09rS0RTNytoemxjeUJTcVIvUEs5RWt4RXBvZmRqcVhxT2htb3NLZXBa?=
 =?utf-8?B?T3FnNldYYlZUZ0FncHlHZzl4SEtzaFhhSHpvTWFCakgxWFRLSzJObVBsOU9k?=
 =?utf-8?B?M0pTb1NmUTh0QXJ6WXMzdGg5ZHZzSkt2UjBlSllLRHJOZTZZTGE1Tk5XVUFW?=
 =?utf-8?B?OW9HZW5RYk5lTnpTaVNMVTFSS0pQUjFCS0hvb3kyMmVCSnZSck41UmFxQjAv?=
 =?utf-8?B?OFlVWnZMZjVEVzhaY0x2Z3A1UTlBMWhVVS90NmM4UTRpVTZwUy90UnNVV0do?=
 =?utf-8?B?NzhWZEVKb013UyszY0pTL09OT2FXM2R2dmQ4N1oyMjcvWXBqYUlubVpGckZl?=
 =?utf-8?B?UVB0QUdyT1BqT2Y0Ukd6TnJScGl5TXdmaklkOGNhV0gzOTg4N2wwT2FFcTVQ?=
 =?utf-8?Q?UFSmWGUeRs/5f?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90171314-869a-4749-fa8c-08d9744ef8e1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 11:34:38.3335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DrD/bKQn7WVe4zuOJFaRjWiHXUtlYsFV8dmJWdHqLbY0dABqF71JTdhy7bqcJlAfcH5Sw4ImKwjXYhvC0F0dEdnVZ4MA6OExkCegaY/ku4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR01MB2473
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,


Please see my comments:


Thanks.

Thu Nguyen.

On 09/09/2021 22:42, Andrew Geissler wrote:
>
>> On Sep 8, 2021, at 8:54 PM, Thang Nguyen <thang@amperemail.onmicrosoft.com> wrote:
>>
>> Hi,
>>
>> Let me explain more detail about our cases:
>>
>> - Our system uses a GPIO called FW_BOOT_OK to detect if the Host is currently ON or OFF. The Host firmware set this GPIO when the first core initialized.
>>
>> - We have no problem in Host State with power control. But the problem is in the case of BMC rebooted while the Host is ON.
>>
>> - Before the commit https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0, phosphor-reset-host-check@.service  is used to check and update Host State in case of BMC rebooted. But after that commit, the service file was removed. This makes no target service to update the Host State and the host check is fail at https://github.com/openbmc/phosphor-state-manager/blob/0a675215d6a6d2eb13e030ba0f618a4691de58d4/host_check.cpp#L109.
>>
>> We would like to ask for your idea on how should we implement for the Host check when BMC is rebooted?
> Hi Thang. Yeah, the reason for moving the logic directly into phosphor-host-state
> is we had a window where the host state would say off (default) even when the
> host was actually on. The other service would run and update it to the correct
> value but there was a window where external clients would see an incorrect
> state. So since we don’t want to report an invalid state, I needed the logic
> within the app itself on startup.
>
> I think you’re on the right path here. The design is to implement the
> xyz.openbmc_project.Condition.HostFirmware object and support the read
> of the CurrentFirmwareCondition property. Based on your GPIO state, you’d
> respond accordingly to the read. That way the state-manager code will just
> work as-is.
>
> On where to put this code… So far we’ve put it in the area that is doing the logic,
> like PLDM and IPMI. Since this is really just a GPIO read, I’m not sure the best
> place. I’d be interested if anyone on the list has some thoughts. Could host it
> outside of openbmc and just pull in via a recipe.
>
> I’d entertain a subdirectory in phosphor-state-manager with this small
> app (to host the interface you’ll want a c++ app) and service to run it.
> We could just enable it via a meson/compile flag. It seems like it could
> be fairly generic and something that other system owners could utilize.

So you mean we can add the code in subdirectory in 
phosphor-state-manager code.

And the code have to generic enough to be reused in others systems and 
should include compile flag to enable/disable it.

This code will response the host state base on the GPIO pins status.

>
> Please take a look at https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
> We’d want the GPIO utilized here to have a standard name so others
> could potentially make use of this logic.

In the specs, I don't see any sections mention about the host GPIOs.

So I think I will use the GPIO configuration file host_gpios.json with 
below format.

{
   "host_state":{
     "host_0":[
       {
         "KEY": 48,
         "Polarity": "High"
       },
       {
         "KEY": 49,
         "Polarity": "Low"
       }
     ],
     "host_1":[
       {
         "KEY": 202,
         "Polarity": "Low"
       },
       {
         "KEY": 203,
         "Polarity": "High"
       }
     ]
   }
}

The host_state fields will contain the GPIO settings to verify the 
running state of the hosts.

I will support multi-host setting. For each host, I will also support 
identify the host state thru one or some GPIO pin status.

>
> Andrew
>
>>
>> Thanks,
>>
>> Thang Q. Nguyen
>>
>> On 08/09/2021 20:19, Thu Nguyen wrote:
>>> Dear Geissonator,
>>>
>>>
>>> After commit https://github.com/openbmc/phosphor-state-manager/commit/0d1c3f1f9329c853677f0581287afef83eeea0f0
>>>
>>> when BMC boots up, phosphor-host-state directly checks  the host state thru interface xyz.openbmc_project.Condition.HostFirmware.
>>>
>>> It does not check the existing of /run/openbmc/host@%d-on as before.
>>>
>>>
>>> I plan to implement "oem mechanism" to handle the interface xyz.openbmc_project.Condition.HostFirmware.
>>>
>>> Which will use the GPIO interface to update the host state. I researched the code handle this interface in phosphor-host-ipmi and pldm.
>>>
>>> I wonder which repo should I upstream the code? Currently, we don't have any OEM repo in github to upstream the code.
>>>
>>> Do you have any idea to handle interface in bash scripts?
>>>
>>>
>>> Regards.
>>>
>>> Thu Nguyen.
>>>
>>>
>>>
>>>
>>>
>>>
>>>
