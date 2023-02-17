Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7111169A3F5
	for <lists+openbmc@lfdr.de>; Fri, 17 Feb 2023 03:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHwvR2WCCz3f3R
	for <lists+openbmc@lfdr.de>; Fri, 17 Feb 2023 13:37:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YbZsaHWE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8a::71c; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=YbZsaHWE;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2071c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHwtn3QQ6z3cBy
	for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2023 13:36:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeVu8F3T6p1baoxiKXXim5aNSc0zQBiC8a2Sl4R40b+Gfld2lFrkVFuH4HzrzQWLNaUpcHOZ7ulT3j0kOXoWGiayQ5uXYCvkSCN7TH8+i4yH9hZmlZ9BPH/z2ndKFBkSMoLwJVKN3huNAI4HlnnQufbLyEhQlcCVuels3B4wQ8/A7puc2h42D93DnA1bde/eawali0Qj8JnBNyxysqgi4ciGP4ECl7m/tK1b1hrowKfK//XG9qAg90sQAJMHDDVVZaEPT/ScjsOEqPBY4L3CDGJaXNJqjWxKZvl+1rZaFO5Za0NBZCXDf/xuxZAxHEsxOk3sJchCGWGf9D/wD2FO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRtsdX2d1MwbCDnOm4OVooGSfGVBrl+3Voo2c6Obxuo=;
 b=SYHJb8A/xb20tMkTrZ0kSNFekJPGHJwekefEu7rijKCTlxcT2Qan3/W4Ger0IuxG9MQ5dyQ3Mty4kz3eQg8+hH2Dk/ETxdIi+Y6rrvesALn31oZ4Njp9HBNG91SC6H2DaVBqFRY6uSpwWq2Hw5ztIq2QKQc3pPE7K0aOmAoY1yTYzXOOx5fZS2nhalvg+40cQkI+L34bqOR2jn3xj8ukyW6OzwGl8w9R5F8f9AhWZH1bDyZlhuR36EAPffAEqjKdxxcb/7C2gomzPEnsNIgGW+054Xfvp638WTVaun4YB6OMm7yNNHxHtQqDe7kr93ShcR69gfXENpoCH7OnGhW/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRtsdX2d1MwbCDnOm4OVooGSfGVBrl+3Voo2c6Obxuo=;
 b=YbZsaHWEEZPfGJSl/5NNbWloipPDNCodbd5Pok2QIcR3egI6KFGEjPtePm1Lsv278w+PIi26dZld8apFAW/BZEf9NMlhAvnyRW6/TKjMFfOjVW2utROsrTwenrxdM7jEj57epqiawOdgLgIOhHy5Lp+tCMXUxOWAvVfbs/XxEiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 BN6PR01MB2418.prod.exchangelabs.com (2603:10b6:404:59::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Fri, 17 Feb 2023 02:36:26 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::bf6:8038:9fe8:1588%4]) with mapi id 15.20.6086.023; Fri, 17 Feb 2023
 02:36:25 +0000
Message-ID: <e887e0ee-b988-cd1f-d658-0667c69af1b8@os.amperecomputing.com>
Date: Fri, 17 Feb 2023 09:36:10 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] misc: smpro-errmon: Add dimm training failure
 syndrome
Content-Language: en-CA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230214064509.3622044-1-quan@os.amperecomputing.com>
 <20230214064509.3622044-3-quan@os.amperecomputing.com>
 <866fe1b3-8044-6581-9711-452550f91198@molgen.mpg.de>
 <98b2a8d6-c5bf-a782-7fc1-8874f94edc25@os.amperecomputing.com>
 <Y+4h0V+LtaX8745A@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <Y+4h0V+LtaX8745A@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|BN6PR01MB2418:EE_
X-MS-Office365-Filtering-Correlation-Id: c1beb10b-f43c-443c-9532-08db108fc3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	X176uCUZUdN5ZRBJFypWwCXGaP3ZEfBG6QWBXvEreWrAGJBZVBYH3fP5O4HIxEWwj9+xW+Q+lUTxviko0ZoHanwmv3IEllmGCQB6uJ5OW46DSf9oF7Yp0qpEdYF/IZx0ZRn7z/AVXLRTRN0rJFxPtIpFH6OGGY2ti374WAnnjF7sYB1Cszxx2rk1vqZSokZf4zix5nTvic4xqXGa5Ne5Yeq16yaFOZLY0Hai3k4AVuk4Qaz4Vdh5GlxaIBg7x2kJxewicMvSeFUm8r3zk8VTvVVTNrvgRPPh0V39Bgg8kUlJP29qNQXbhN4DlGRIxQJHEreLeSrMrnFQKTRlOZw5L4njTSdpGP7uDKcRTeQyps33n3rUt3Z692qVmPcv2awqjBgU2K+iP5vftynEAtZypZ7vyW41tOLfHJ9VbfbqVU+UXU7HYyJ6OO432sZqnucus6YDG0Tz6E+Fb5aEfjBa2GgbjAlLYK5Ek0L8Yl5N42xEH3jStdnoCptPOFwV24yiv9slkZyHLm0XFmTlF5iqaQPM33NdBRuVp4lRujZIaaRJjvO5T4xmH9opBZQYLDqrjqLt6LjqKwWseeQPD2qcqTouj9jJlcjtSEbsznFEL/bxbjEIv5c9dk+S8wXID4uKOTSSOI8a+8p+VqYI2UQU2fhUZ8xS8vgzUKQgfOjLw9lv32rDMBoiqfp9cL/JDvel14eeN31zw6TrSC2A/nrg7A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199018)(5660300002)(316002)(86362001)(52116002)(6666004)(6486002)(478600001)(966005)(186003)(26005)(53546011)(6512007)(6506007)(2616005)(107886003)(66476007)(66556008)(6916009)(4326008)(8676002)(66946007)(31696002)(8936002)(41300700001)(54906003)(83380400001)(38100700002)(38350700002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?VUlNcEI4NC9QalFCTjFEMFNKYWxVcWVNdGpOV3lqWitkejJIQTJQR0JUbzhU?=
 =?utf-8?B?dFVBbkRmSjQ0QjNoRXA3UDhCQ2JGcDRoUGhLdThvYmJOQll3Q05tNmxBNTVs?=
 =?utf-8?B?OGwrcmxMVmpNUFk2bEt5SGxiSzRFd1E2K0FHMXQzbndWdTVpYnAxQ3pFV0RH?=
 =?utf-8?B?VVFkV3ZqMjZ2OWd1ZDFrUWZHQTBqRWorYS9yL05LYlREZGhtTzJUemhKTkJ3?=
 =?utf-8?B?YVZmYzVTY2k5MHU1c3JTUDdJcm04MC9QYnFkV2RiR29Ta2xhOXowY1YxSXVu?=
 =?utf-8?B?a3JBTkNSRjBkWlBtd3Y5RFcxV1NCMVJoWVI4aGsrSC9McU5tdzBxaEJnWFJB?=
 =?utf-8?B?UU5XckxpQTRjU1RZWVc1UDJMVnJTOUxyZXNQV2NXTHowZVdkamJtM3Fpd1Z3?=
 =?utf-8?B?czI1S0RzNlNNbVBPWUZUOVdBMm1BbExiWERNZGRZRjF1SDJrVkZSbnB3Q1Qw?=
 =?utf-8?B?anRKaUd6N09uMmxsRTNVQWhIdE1ZbllNSWpxbFlDNUpSUWVmckcwMG9XdlY0?=
 =?utf-8?B?bUx3ckgwbDJJNnVKNW1xdE14cjhveXhEWTdVbmJtQmsrUk1EZXdOc09yNGNY?=
 =?utf-8?B?ejU3UFpYRkszVS85c3pjbHhsRDdHSHJWajFpODFmcmlSeDZQUFBKUWp4NUxs?=
 =?utf-8?B?VVNSWkxqUW5ialFXWE5mUlRKTGVId0wrSVFKZXcvSUFIUzhDRjVodGJlQ0FN?=
 =?utf-8?B?SWU1cG40eWZVNEhzbHNrTGNTcXU2WkNjN0JYTE5PZGZBa2lIb1VZaVdqcDZS?=
 =?utf-8?B?UnFLUjY0SHlIU2thZm9TekVuUEVQUjRRRlBKeVcyOHdxY3FuYmNDSTRWRjNX?=
 =?utf-8?B?RmpiUkxyTlJXT3JIVG13SSsyVW92blcwaXdvY1haQkpOR29VWUtvOE5XZ3lI?=
 =?utf-8?B?ajZxQ1VOUDl5TllPNkM3bkpWOG1hYmZFTS9LR0syL3hEUDhiR1NOUG5rVENr?=
 =?utf-8?B?Y0czcEFQYUxJNFFxNGFMeFpWWEVOamhNempOd29KTTQ1YWhWVlFiajJNY2gx?=
 =?utf-8?B?cUpxdG1BUVB4QkkvUEJoZHA5SHpITm42MUxvNnNoUzNCelIvTWF1RjlZY2FG?=
 =?utf-8?B?Szc5UUlRWE1GOEE4WEovZHJiaUNNK3FiRXBWQzBXeThQd1dFbHRYaGV5cXhs?=
 =?utf-8?B?bHNyT0x2cGV3WDFrVjRaZHNmbFc1UGNERFozVldVNTN2QU8zVHh4bCs2RlJ1?=
 =?utf-8?B?YVVXdDFKeXhJbFFnY0lmcG9uNjcxNlo3L3BJUHh6NFlzRnVSTjdRS2ZJT0ZN?=
 =?utf-8?B?Q1kvRnZxUlRBUmJrMDdMdlVMcEkxMzBsQ3U0L2pBUmhQdWNaTFJIV3orWDR6?=
 =?utf-8?B?QmU4TDlqbzJDei9qN3FnSWNBdW1wdWJsQ1RLVUxtV3o4UmxHWWp3b0NTVUk2?=
 =?utf-8?B?ZDNJMnpnNkVxNnMvNTVzalQ3ME9ZeTZNd1lHYTQxcE9kaWtYUzlRckFxUy9L?=
 =?utf-8?B?bzR0bVQ1clVjY01SMzQxZWkwQnlrOWJlYkpkUmJaRFNyVUdtd3BtOEFlRENh?=
 =?utf-8?B?S25hSGJOV0pPeDhpU0RqclFDTEY2MlkwSHhMUjkvZFV4UEU2MjFsUldZVnh3?=
 =?utf-8?B?dzJxYzlvemFwN3RuZVVycSs2WEE5Tm9xNjY2NmxnRjFyaUhHZ2x1ME0vbWxq?=
 =?utf-8?B?N2t5aHh2L0hkWjRSV2hBbU5BVzFqd0Y0ZnBRcGFXQVo4MTlBZWNrRGttbnpm?=
 =?utf-8?B?Qno5WG9XZG5jc0t5dGdTUnNRTCtOQmVNa1EwK3hCd2QwL1lyazV5NWNLdVpo?=
 =?utf-8?B?MjlKQWJETUtVYkRZWWVRUHptWWo4cnF1VHFlaXdDYlZSY2g0YTRVdnIrWGtL?=
 =?utf-8?B?ZVVXSXVmaEdTaFEvQmV4NjJLVFJmQVpJK2hUdHFVNnRXczdyaU1lVk5JY0VW?=
 =?utf-8?B?YkJHZHRjSmtQdy9IUWtscGRpSWlkakxtVjcvVEIvcHBscHhKcW52Zld1YUtF?=
 =?utf-8?B?bWpDbHlyejNHckEyT3Z6R1JnejNrdVJwWGsySHNrTlpqdldTWFRiOHgrSG5P?=
 =?utf-8?B?OTVkTUZ4UkN5RWpzQzUyWFFOZTAyVGlMekxUYkR1S2dSRWxXK2hrWjFYUHhn?=
 =?utf-8?B?N1UzKzVENW9WWmJGcHk2N0lqOEdRc0ZZeWpoMmx4aFp1WjI1NzlEZmZKVVJC?=
 =?utf-8?B?Smh6djNBL05OV295NGZYSndOWElENXdkcm1qMTBaRXQwVFBaMC9GM01sWUVF?=
 =?utf-8?Q?k3x7x4mkEqAUxjKvvWRTiNY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1beb10b-f43c-443c-9532-08db108fc3b8
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 02:36:25.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ks9towLAHmRup8un/SAp4oSlK3W+CxbxGDORov4+R6MRBTS+jlbAzYZfmnjisCliCswhHKKM5m9lp5uoYaKuvRp9Z5cZfIxlNlRSsyc6428=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR01MB2418
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 16/02/2023 19:30, Greg Kroah-Hartman wrote:
> On Thu, Feb 16, 2023 at 10:22:14AM +0700, Quan Nguyen wrote:
>>
>>
>> On 15/02/2023 14:33, Paul Menzel wrote:
>>> Dear Quan,
>>>
>>>
>>> Thank you for your patch.
>>>
>>
>> Thanks Paul for the review.
>>
>>> Am 14.02.23 um 07:45 schrieb Quan Nguyen:
>>>> Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
>>>> to BMC when DIMM training failed.
>>>
>>> Where you able to verify that it works? Out of curiosity, how?
>>>
>>
>> Yes, we verified it by injecting DIMM errors and confirm that errors was
>> reported correctly via sysfs.
>> For about how to do error injection, we may  need to refer to section 3.2
>> Memory Error Group in Altra Family RAS Error Injection User Manual. It is
>> shared in our Ampere Customer Connect [1]. The latest version is
>> v1.00_20220329.
>>
>> [1] https://connect.amperecomputing.com
>>
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>> ---
>>>>    .../sysfs-bus-platform-devices-ampere-smpro   | 10 +++
>>>>    drivers/misc/smpro-errmon.c                   | 77 +++++++++++++++++++
>>>>    2 files changed, 87 insertions(+)
>>>>
>>>> diff --git
>>>> a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>> b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>> index d4e3f308c451..c35f1d45e656 100644
>>>> --- a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>> @@ -265,6 +265,16 @@ Description:
>>>>            For more details, see section `5.7 GPI Status Registers
>>>> and 5.9 Memory Error Register Definitions,
>>>>            Altra Family Soc BMC Interface Specification`.
>>>> +What:
>>>> /sys/bus/platform/devices/smpro-errmon.*/event_dimm[0-15]_syndrome
>>>> +KernelVersion:    6.1
>>>
>>> Should it be 6.2, as it probably won’t make it into 6.1?
>>>
>>
>> Thanks for the catch. Will fix in next version.
> 
> Should be 6.3, it's missed the 6.2 merge window cycle, sorry.
> 
> thanks,
> 

Thanks Greg,
Will update to 6.3


