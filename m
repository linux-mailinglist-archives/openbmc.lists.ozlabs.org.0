Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D275466D5EE
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 07:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwz675988z3c8b
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 17:10:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=HCa3wKAM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.93.108; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=HCa3wKAM;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2108.outbound.protection.outlook.com [40.107.93.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsyWb5CTJz3c4x
	for <openbmc@lists.ozlabs.org>; Thu, 12 Jan 2023 19:34:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvZ5R4O00f7SmlYAfVhlQJpityXDucPl9x7V+7Qq5LE2fuJPEulp8GsGRTLQBH0lMJno7k6W45gs91/UTwQrccLINOSEGwhmXBSp7o5QYjUdcKp+8bsZCzYCaT76T6flKMVqo9MjdJxcq8/vzZDoBb8dlLspcQvrrSyvT7eKKOWdYWmfGZZT01qSxbad2LOHSvPymEV9BCrA8PbaArAJQ0dFB1HL//zhsfn+tkQMKdyC9bU/vCVYohwRCO5gndhTgQxZYZ+Kt2x9NB7VY/aaVfIS+EUcc66/PBMI1Zzqq2vhdeIRkz2az4AvolpuPZkgeqqvMtlzw6IrigEdEzFNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR9ZLqtAFEm5A9/j4Ntpo+FdppUvudIKNLqpohauXZk=;
 b=gcubwLK2TJ+XmXaCSJBd7IegEee4OwnR/QSpFrfw+SYmnyQx8qU498X6UhyR1pRXBd9nVVy80lcs9XiAhOv954sm9t4ZyhcOk2VfeoPeeQukWkfcfexbNDYMBFkCphQFo/FDH28+50ApP4F8cZ60xXm5DHWRQZ/SnWNeGp7wzv/yRVDRr6GiUNj8YlWxDp8DhO79ZvbWgmlwM15mQSGhJ1dF3QyBrxFwvA4EH0fg8xtTB6BIjImwU0I2B6/B2N87HEYXC1ONEbI5In3R6XB0A1H5TaLwsn6XTg5XZek92ZxhXenyrKoahk4ACR8KTdMHvVS/0QdJFow7dHml7fR48g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR9ZLqtAFEm5A9/j4Ntpo+FdppUvudIKNLqpohauXZk=;
 b=HCa3wKAM/jhKYVX9AH/yN6/9qz6lskPDspv7GXuhcGlSDR2XCfkGmGPKsd7J9BmAZYjGiVoxYMuLftHUWXFec11q5wC+cTL4mHccvtq++2z5LVUbjXESBI+dosHAmkf4ndKiofzRR4vV7EluhscdhOTxv1TSDMWNYH3rh5FsI/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from SN6PR01MB4973.prod.exchangelabs.com (2603:10b6:805:c4::13) by
 DS0PR01MB7916.prod.exchangelabs.com (2603:10b6:8:14c::16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Thu, 12 Jan 2023 08:33:40 +0000
Received: from SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c]) by SN6PR01MB4973.prod.exchangelabs.com
 ([fe80::1e67:38ac:ed37:be1c%3]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 08:33:34 +0000
Message-ID: <f9e653ce-52bb-cb89-8845-2a718e76b718@amperemail.onmicrosoft.com>
Date: Thu, 12 Jan 2023 15:33:24 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3] USB: gadget: Add ID numbers to configfs-gadget driver
 names
Content-Language: en-US
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Li
 <frank.li@nxp.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Vacura <w36195@motorola.com>, Jakob Koschel <jakobkoschel@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Vijayavardhan Vennapusa <vvreddy@codeaurora.org>,
 Rondreis <linhaoguo86@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Open Source Submission <patches@amperecomputing.com>
References: <20230111065105.29205-1-chanh@os.amperecomputing.com>
 <4e98a5ee-96a1-eb98-8529-68f36c3cb7fa@collabora.com>
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <4e98a5ee-96a1-eb98-8529-68f36c3cb7fa@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To SN6PR01MB4973.prod.exchangelabs.com
 (2603:10b6:805:c4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR01MB4973:EE_|DS0PR01MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd0b497-8e71-433c-7389-08daf477b15c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PUT9ZX6/adwT+JfrXiSvZglozbWLH1iSwJ+5tGiWgaFT5dB10ujy1cdyoeF9WVaTUCuFc5LXtCX7Tx8uFQKm6+hHmpBqI3fXounuxZLktEJPNBKdU7qvFN8TKFKmd/yJqRZkREYZu1CeootB/zqKmz/K2EneykUNn0SLSLcuUsFZIdWn3pRHTFC+0qt5SJ+3Aj1pVraNGOu+ZS80dTvD4dZCxBZUxJbUkXBZkBfxLnKfWJTas7tTjDzBBazz9MPLsQe5Br/DrTXcvw0LBs9Fk7AiSLCQdfQOhsf+1EJ+1CB2v/OJjtYVcggiboovQFcSfUnqBVuY4+YXItSxG3p9FV14PUnZTBkG23d3jPu9EpokDPA30yAmYJxe5okP7kLQHKo50vFEzlS+DLsDd+pZump2NSoNNxC8EOG/brOr68CSchpM39wkRxiVAzn30Kf7Z+6TGCRguzWW7Ib4d5gN37aLqMmzlyZjzbWQEhz4mg6OFKz09o3RnkKjxGVPuDn8evWAXQ49l5jzWenGoiRYhRYK9Ikn7khpjhGdhMZFFvpjs2gDweAIyhwk0joox9POECMLnVtqAS12afZcARrb0SUlwlgwhFO5m97YJ0M1Cjl+f3JpO9ofuAKV/Btrn9rBVbO19tFU6/CNTZGXeoebVgyFj09/gNuoFW8yY3cWqCaskH0bS51X2dKJAw2VgFs1uEAqkxzZ7fbNuzwqCR8jlQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR01MB4973.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(451199015)(31686004)(31696002)(66946007)(66556008)(110136005)(8676002)(41300700001)(66476007)(83170400001)(921005)(38100700002)(6666004)(186003)(6486002)(53546011)(26005)(6506007)(478600001)(2906002)(7416002)(5660300002)(316002)(8936002)(83380400001)(42882007)(6512007)(2616005)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZjBDRjJudHQyNHRDWkl1cHlsU28ydG9BRkNqOGQ1Yy9zeEJtWUZHekh2dko1?=
 =?utf-8?B?ZDE3YWR4Q0txTUg5ZHI3NUgrcEsvWDFaVnh4MVllNHg3YXA5REhrVHZIcnBC?=
 =?utf-8?B?c0d4K2N5djBuNDFXQldOeDlyTFhMcElLV0pYUE42UXRjTVY5SWVxZXZTaW1U?=
 =?utf-8?B?UFBmM1E1b0p6NisrL1k1TUtxVGdJaWVCQ2tSZm00ZmllSXJHY1lDQldjREVt?=
 =?utf-8?B?d0svQ3hnQzM5VXZ4UkdjMTI0R3Rsd1B5VEllRGVJUm5lb1lNSTFHNVhsYVc0?=
 =?utf-8?B?ek5yWmxYdUpRTHk1cHFMWmR2RE0rdE5ua3JQRmdyU3N4OUlCVUJZVWwvTm9y?=
 =?utf-8?B?Q1FyUHNTMUo5YkMrOEdQRGFvMnI5QTA2OHJ5cUJzMXVQWTlpZ2cyc2pkclo1?=
 =?utf-8?B?Ums1bWhCWVRnNDJrUkJ6ckwrQmFIOWxRWnhTYW5YeUd5UFdRV2ZDY0dLQVVL?=
 =?utf-8?B?TzRXYlNoSFZhdGsydjhnWVZhTHQyVU01dEsxdjF6aFQvTVU4K3BKQmZDWTlM?=
 =?utf-8?B?UGNJcU1yOXFhclV4SkpUb3ZLaytteDRIZWhaVVhla0ZyNHkwSjFkMmNFS3J0?=
 =?utf-8?B?K01DZFFqSHpxeElhUlJQSWl5bTdzUGRlYlE3amRJNENJUzJXc1FRN2hjMWRR?=
 =?utf-8?B?NEpRR1RRQjJaSFF2TDdwV0xacVZzYXZqSll6aWtNMVA0YmxuT0JOQmpsN1cx?=
 =?utf-8?B?MjJnUFdheDBBMy8xZk1FTmRyOXhrS1BpTFdYZE5oeWxjM096eFV4OC9JNUd3?=
 =?utf-8?B?SDl1emx0dXBjZGJDYlo4M1JuUDRZdnZWUnZaQllBZW5zMWNzUnZFenVuSEND?=
 =?utf-8?B?aVJSWUkwcDRtRUNuSVMySjRyem5wdyt2clFPRVp5bThTd01LclVxYXdMdVlJ?=
 =?utf-8?B?YzJJUFpoOFFtbEtWL0JaK0RCblVsSzBNN2lTYjU5cjdZTnJWT0xjT3dFaUZ6?=
 =?utf-8?B?ZzJJTmFNa3lQRDRUM0xsaklPK0pPS1RSQXR3VDAvODhyamc0ODcrYU1nYVhv?=
 =?utf-8?B?SHZNSTN3WVZFeWFxUkdkb21INCtSQ1N3MDRsdjFvY1I1MmU2R3NYT3p2aUpV?=
 =?utf-8?B?TEV0d21KZTBzVXdnR3NjOWdXMU1ZNmUxb2dQaGt5Q1p1c2NqNEVBb3ZscGRU?=
 =?utf-8?B?RzArRkJEeFV0OHlNbEYzcXFPSEQvdEwzczgwQnFkeEZoY2pvdVFQb0lMMWhX?=
 =?utf-8?B?WHU0cEFBcEswYjdLYVNPZ0N2cEhhalBnVDE3eGxjTjJUM0tXUUIxUExyTmUz?=
 =?utf-8?B?ZzF3L0tpUlR1eExxUlNESVZzNkxCcEZDTVcxVFlaS3NtMXAvZ2tiTmNjdmhp?=
 =?utf-8?B?RFFsR1owa1drckpza0dxbkRNYXA2RGJHd3cvcjloN2tqMHlIOFVtRlFKRE1h?=
 =?utf-8?B?ekUzQkEyRWRtK3pLeTg0cUdjQXJNalIxODFtTTlyNFJkbklseTBsamRablI2?=
 =?utf-8?B?VzVCU3k1bktSS2V3ZWx0U1MzNllmQVRIM0tFUUxLOHFNU3ZuNG8rbVdleW41?=
 =?utf-8?B?Qm1wU21TOGpIM1JqOU5HVHUyRDJwY3RqUnE0M0hCLy9ZNnAxVklOUktybXQ1?=
 =?utf-8?B?aVZJaW5hZU9FejRFYjN6MU4yKzErK1oyWklHWDhLWmZSZnNVS3lhNlRDcjMz?=
 =?utf-8?B?Vi9MZHBQdVh0WTNROGloZytoc0hmZTFhY3NubjJBZFIvSllHMmtCcXVkcjlS?=
 =?utf-8?B?ZDlsNW9VVHhxUnRIN29nOFhXeWQ4U2hMNFhwczk0dVluOFNjYU9UUlN0RkpG?=
 =?utf-8?B?S0ZPQWRiWXhnYW9RLzgyVGpsOHlXNXhWUzBENFNPOFF0bXdhTVRMZnkyeDlG?=
 =?utf-8?B?T3d0UmxLalkvZGpBVU8xVmNxdGlZdFVyVjBJQ3hZNGJoRTNGWnpPT0xVU25u?=
 =?utf-8?B?R1QvUWJ4amU0YTNBamRYOTRKUGZOYmtxcDdhQ1FoVVd0MUcrSXlYYUh0R3V4?=
 =?utf-8?B?bS9CMXUwZVpGRjFKOWxoNlNrOXBWaVRnRU5XM0FlV1hwbjVsS1UrcVFINlo5?=
 =?utf-8?B?a1BzU1J2MFFaOWQ2N01PTE9Wd0pkcVlvckJORXVwVDlEMHUrMmovTEVyS1I2?=
 =?utf-8?B?KzNOWWJxQ2J1Y25KMTEwSG15QzZIVjNsQzJ6Sm1ValpnQnN3ZWlLcVY4M20y?=
 =?utf-8?B?dWE2V1QxSnJlSTN3ODl6bGVXVTFoTE1WNGxBTGZqMHpqWWpsY2dMZ0NKcVdt?=
 =?utf-8?Q?27iFsyt3T5PW/T6S0dKKkiE=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd0b497-8e71-433c-7389-08daf477b15c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4973.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:33:34.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97UeJf7/iC7MEo3zATZpxpy8+7w1HVgIbYHiXVd0qO9jHWyYuI/9pyrQ8uPFJzTPdQurtOJPtJId1/RviHgt8+MDw9RPMCxacSO/z3ObylKLtOkB8LjgMBhByYv4lF7N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR01MB7916
X-Mailman-Approved-At: Tue, 17 Jan 2023 17:08:32 +1100
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



On 11/01/2023 16:46, Andrzej Pietrasiewicz wrote:
> Hello,
> 
> W dniu 11.01.2023 o 07:51, Chanh Nguyen pisze:
>> It is unable to use configfs to attach more than one gadget. When
>> attaching the second gadget, it always fails and the kernel message
>> prints out:
>>
>> Error: Driver 'configfs-gadget' is already registered, aborting...
>> UDC core: g1: driver registration failed: -16
>>
>> This commit fixes the problem by using the gadget name as a suffix
>> to each configfs_gadget's driver name, thus making the names
>> distinct.
>>
>> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>
>> ---
>> Changes in v3:
>>    - Use the gadget name as a unique suffix instead     [Andrzej]
>>    - Remove the driver.name allocation by template        [Chanh]
>>    - Update commit message                                [Chanh]
>>
>> Changes in v2:
>>    - Replace scnprintf() by kasprintf() to simplify the code [CJ]
>>    - Move the clean up code from gadgets_drop() to
>>      gadget_info_attr_release()                        [Frank Li]
>>    - Correct the resource free up in gadges_make()   [Alan Stern]
>>    - Remove the unnecessary variable in gadgets_make()    [Chanh]
>>    - Fixes minor grammar issue in commit message          [Chanh]
>> ---
>>   drivers/usb/gadget/configfs.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/configfs.c 
>> b/drivers/usb/gadget/configfs.c
>> index 96121d1c8df4..0853536cbf2e 100644
>> --- a/drivers/usb/gadget/configfs.c
>> +++ b/drivers/usb/gadget/configfs.c
>> @@ -393,6 +393,7 @@ static void gadget_info_attr_release(struct 
>> config_item *item)
>>       WARN_ON(!list_empty(&gi->string_list));
>>       WARN_ON(!list_empty(&gi->available_func));
>>       kfree(gi->composite.gadget_driver.function);
>> +    kfree(gi->composite.gadget_driver.driver.name);
>>       kfree(gi);
>>   }
>> @@ -1572,7 +1573,6 @@ static const struct usb_gadget_driver 
>> configfs_driver_template = {
>>       .max_speed    = USB_SPEED_SUPER_PLUS,
>>       .driver = {
>>           .owner          = THIS_MODULE,
>> -        .name        = "configfs-gadget",
>>       },
>>       .match_existing_only = 1,
>>   };
>> @@ -1623,13 +1623,21 @@ static struct config_group *gadgets_make(
>>       gi->composite.gadget_driver = configfs_driver_template;
>> +    gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
>> +                                "configfs-gadget.%s", name);
> 
> This line is 88 chars long, which means you're taking advantage of 
> checkpatch
> allowing 100 columns nowadays. That's absolutely fine. If you collapse 
> the above
> two lines into one, the combined length is exactly 100 chars, so you might
> just as well use a single line. In any case (collapsed or not) you can 
> add my
> 
> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 

Thanks Andrzej for the review.

Just found out the commit title is not totally correct.
It should be "usb: gadget: Append name as suffix to configfs-gadget 
driver names".

I wonder if these issues could be fixed when get merged or should I 
resend a v4 with that two lines collapsed and with the title adjust?

Thanks a lot,
- Chanh

>> +    if (!gi->composite.gadget_driver.driver.name)
>> +        goto err;
>> +
>>       gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
>>       gi->composite.name = gi->composite.gadget_driver.function;
>>       if (!gi->composite.gadget_driver.function)
>> -        goto err;
>> +        goto out_free_driver_name;
>>       return &gi->group;
>> +
>> +out_free_driver_name:
>> +    kfree(gi->composite.gadget_driver.driver.name);
>>   err:
>>       kfree(gi);
>>       return ERR_PTR(-ENOMEM);
> 
