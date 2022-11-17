Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E34D62D197
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 04:24:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCQJV2kLSz3cNG
	for <lists+openbmc@lfdr.de>; Thu, 17 Nov 2022 14:24:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Bx1m045T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7eaa::712; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Bx1m045T;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20712.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCQHr6nM4z3cLB
	for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2022 14:24:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgYljr8XSA1Ip3LVa2VTWYtTFJk22S1MTFMWtkbKDVJ0ar4jn8L63ybgP4mbk4CxGRZ+HF/uC12eJLHnmqbLZvtyvpNqJVM6jTbLlosiEFGgw8gryZ7RyI58R5AyIoS7IkxtJd3zBw4ZtUl+4BAhu5hEzfx7U1p96XtCy6zJfsoJY5QOF83UcqkhXrDF0G7zdG0q/82D5TV1am5wdC9ioxLh5NSVedLfsPWzP7rzqPjhkwboZiO9PQfKLIJe0Z3bHU9VN/TmSiHd7yyZ7ByBfGEcTW7pV9ilkLQ4RD/uxTaEmRc6KEcu7IPYvme0L4wEg7ZO4/0ckCsAb6gp1EHC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfZ1gZAObXCNpCenEj8inp/wi2eNWP/ZCAJKBxTANvE=;
 b=W1DgGuLgRoHqhOIobja1gh12/cUCvlX5CZvp6DShHybosOfVUDxb8MO20AqyNfgEq4Vuf6lUV0zrjXUYzeQ36gO7aDYI1n9XK1M+SA1cRaaibP9F+l2tEtb4UBt8i7yRjdTbk14hYodUi10GEhcSxlsA/nl6bzyv+ABeh/RJ2DvXMK0VdtOyBXJwbcH+MfdVyNuKvPPiuAYiMk3lEwLTCZ3rS4BlrFj1ZOWjqA7Q9kTBOLE+/3rkf3iqKoPfzBP51QWO2OR21rMD3apbsYDvbjLMFiEq45yGnOYf8v3O6oY2nvJkCQ0bfjo+WcrxQAicmLCBxW+8Agrn1vTyZMyLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfZ1gZAObXCNpCenEj8inp/wi2eNWP/ZCAJKBxTANvE=;
 b=Bx1m045TEn0/uQtOxNfRQPHj4zgJw31vZXo4dq0MuwnO1VNJMMialulkzrLtO3qnOWKGFSggzJCRtQBzL/RfCC6sxoiFITeQ/OVqtKRPtBvgmj/vVpPB+fjzlzYJmaM6xP8vU4iq4H2j2rWe8qUmbULGVv9m57NAcKt1OPaMEG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN4PR01MB7455.prod.exchangelabs.com (2603:10b6:806:202::11) by
 DM6PR01MB5050.prod.exchangelabs.com (2603:10b6:5:68::22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Thu, 17 Nov 2022 03:23:46 +0000
Received: from SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a]) by SN4PR01MB7455.prod.exchangelabs.com
 ([fe80::df7e:7f53:a83f:a86a%4]) with mapi id 15.20.5813.016; Thu, 17 Nov 2022
 03:23:46 +0000
Message-ID: <85d8c141-0a36-b80f-1aea-da3028c4a0f7@os.amperecomputing.com>
Date: Thu, 17 Nov 2022 10:23:27 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v10 0/3] Add Ampere's Altra SMPro child drivers
Content-Language: en-CA
To: Joel Stanley <joel@jms.id.au>
References: <20221031024442.2490881-1-quan@os.amperecomputing.com>
 <c42b8b25-1f58-9edb-37d5-37739d529360@os.amperecomputing.com>
 <CACPK8Xf3ZqBnafy4+39M_Xzto4nsMazaNXThFzhjszuu4kvG7g@mail.gmail.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <CACPK8Xf3ZqBnafy4+39M_Xzto4nsMazaNXThFzhjszuu4kvG7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To SN4PR01MB7455.prod.exchangelabs.com
 (2603:10b6:806:202::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR01MB7455:EE_|DM6PR01MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 178c1b7c-8fd0-43b9-2bf0-08dac84b21d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ADny220h1VvQHRKOvrNS0CL5jiPQ//SFcXzX/VkRKP7tmTFFLJ1VJQyKTvLwSBnPfL4Od+V/1zAbMYB1sZdVFOSZtWD1NsJfNtdUJC2VFz1KmbaT+ZsTb9Bn1ewQyz/jRnMIkQpb3iK27pVg2PSIm0XCIRzfI8N6efMPZKOUDQ7QaaMvgVqBDO3nZUzFC4YhHE4VoXrKL7jzaTJuWOPycGbzmNty9T6B5B5O6pYPD9vhPSPmc4+EOwX/CH2OXQ5Hrl52uz+8hqwmQuNDfOG+lId0lokQvHU1cgZ8hstpfYMNfY5cnlPi+fN6Rwxg3OQvN6mge36m+G1QlpoWfWtjoGqaKGKhtuPaK8GCfCm9EZZF4FfV4SnDtaESUnG3M10ED1kDxc8ypvHRnpW9tHb6JPRWOvf7ahmJtYI7OYakSMNVm6vVnSPx3hog3cq7840aqVgE7BbcHW8kzWoeWyVeVUxkyYsdNG7ALWFrVzyP6/I+m704KJnrCAZjo03r82s+SQHMJ59Lp0DigugmLAKrqWboiIvASLY/9ttHXdSjAJxxCOQbv8ubtcTSFEGNzPqfBPrN+iAS5SR78A0PqAk4logjrNy9e9YehWLMA2uPpPfR1qYLa1YqfYLEnH/yJHXcXC+EZfta9E+7t7wiRzKcuK/XPQaJrx/mEFTFyQ4VV71lulnhU3IFEjucQRJfxmA7us9Piv/cSFnpBrul6nvZs1RRDlQ5i+OFiNviN/j6/TNHAvzjDNLEPgifjUE2RhKnUETFVFI/TvHnF6aHCtmswVUGW35gUpOR4w+1DJjjmVN0pKwlfYpNIZBg2BZIHzEvAh2uPevTFHfwFjrvgySdCukndMQ6Q6ZUW78cVp/5kD0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR01MB7455.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39850400004)(451199015)(478600001)(107886003)(6916009)(316002)(6666004)(966005)(6486002)(41300700001)(66946007)(4326008)(8676002)(66476007)(66556008)(2616005)(186003)(8936002)(83380400001)(5660300002)(2906002)(26005)(6512007)(6506007)(38350700002)(52116002)(54906003)(31686004)(38100700002)(53546011)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?elFUTnhWZDRUOHZwQ1dXWFZHNXVsa1k0RVA1aGhvWDRDWXBqT0tqakt1MjZn?=
 =?utf-8?B?SkhXQmVkNFdhZ01vTkd0bHc1RldHd0l3cmYyTjR5WDhhSTVpUWRDL1Urc0dv?=
 =?utf-8?B?NDJIc2VwblFiaHhrQ3RUNFBiZ2RCQVI1WndEdnc2WUYxMmVVdWZMaGpYRkQy?=
 =?utf-8?B?Vk04MFhDbnJ2d0RSTFB5Kzl6NTRHbXJ4d3NReENyYlNoT1V6d0VkWXhoZUVO?=
 =?utf-8?B?YjVtdzY5Yy9kSUlmT2dGVkRNclZKM2M0MlRSUjJONmtXUFlFTlMyQ3pXaENi?=
 =?utf-8?B?RzRrbzV3N2x6SEI1ekpzVmN3TkdscDh1VXhxRGFnWGp6dVhmdVlkZDROSElp?=
 =?utf-8?B?SGZNenNneUIxMVlvUGdtTjhkd2tNZkVHYmswQ2lBT2IvTEZ3ZHZDNytjSnhN?=
 =?utf-8?B?dGFrUDhtdlA3dVE3YldhS3d2L3pXS3R0TERZdGxrK1QzbDV2RFdJTjF2OWlC?=
 =?utf-8?B?N2tFZDF3aUVQNGk0MFZnUENOckwycVlFZ2ZSWC9yZDhicHNiUHBZaHZzRTVK?=
 =?utf-8?B?RUdxdnBWbHhSRzlJYktKd1JmM1VnKytKMGJvVHFJRXJSME5FM0NGY2hZN3R4?=
 =?utf-8?B?MXNqS1RlckwzY1hDeGZkQWJEL2F3cmxlQ2dKVHFHbmx6b0p3VzYwWTgvSk9N?=
 =?utf-8?B?Si8yMEVjNlBFcHlXcU5NVGhGRFhteVVaT1Z1ajlrOW1xSWx3UmNKYlp3T25E?=
 =?utf-8?B?QlFuOGF1MHU1UkVlOEh4Wnl5WGJqOUdWaUoxZ2tzNVh3d2VyQnRDelQ2SnhP?=
 =?utf-8?B?RlorNGVKYndHS21JM2kraXNpa2ZSVzJlQWlZdVdVRnl6bVhWZzhpd1Jxa3dp?=
 =?utf-8?B?WEdNVjF6L3hCenc0M05zeGFUZEMxaEErVkJKMFhaM3ZIa1ByUHpFeVJqaDR2?=
 =?utf-8?B?dzRmSUpTNFFzald5ank5RVJFUlFxM2VHUlVJOUttRGFFaDNVZW54UnVjZ0tO?=
 =?utf-8?B?dTZDZlBpcnpRRXZMaXFrT1JHNm4vK3hmRXdjVENOc2I5WXJJOWdzMWdSd01E?=
 =?utf-8?B?cmorV05CK2w0QzlvaTZ3QTNuQ3AzZUpmNU1lOFpNOFpzT1N4cGFFRCsrMzBC?=
 =?utf-8?B?WktxZHdTNy8yTEd6Rm1XayttamVpT0dlZTZmRk1tUWZRMElBcitDSUJDbTN6?=
 =?utf-8?B?bEVYRTUxM0M3OU1RNTRwMUl0dllReU9OZE1VOGJ1RExWbWVNOEZuUGlxbW9G?=
 =?utf-8?B?eFFHS2JlQkFzN21OSm04UURUVjMwV0ZxbmsrSmhEajB0OWpYVEhCSUJRT0pk?=
 =?utf-8?B?Zy9PR1h6YW9lcjNPcGFsb1BiMDIxWmxud3pTaTU3SkswV0NNL0pkTE1DeTJQ?=
 =?utf-8?B?VDRXK3lmcHBoR1JUdTNpSlNLOUNWaDBCeG5BcXVBdDNXbTBwRjhncHVkSzU4?=
 =?utf-8?B?SThjSStibzYwa3ZOU1pWdXJuSm42eXNHYnV5NDJ2NVpac3pPamFINWVwUXpG?=
 =?utf-8?B?WWhaRUNzcGJ3aXZrWUVFaTFsNEoyVkdRVnduUUkvMzhiYTlSZldjYkRUeXpx?=
 =?utf-8?B?blFoMkhBcXR0SHRwWUtMNGNzM1lwbGtiekZxelpXYUFhVWo1c3hXNzBCTk93?=
 =?utf-8?B?Yy9yVCt3eGtDMmFoVkhvK2xXd2ZyWDdzS2tmTWhOd2hmWitFZlZnb3V5WWI4?=
 =?utf-8?B?enJCemZ6Z3hEK1g2cHozdlpETzZSY0RaY0pvUnZyY25LZDRBZ0lBMmpGNEZ4?=
 =?utf-8?B?TDFiem0ySkJwazdvWkk0K0dtRzgrZVFxQlljU1ZzUTJIMk1ybXJiY3hWb2JB?=
 =?utf-8?B?MmxlU2ZUc21weHMwL3g2MmNnNzJweFFlQTdqWnRlK2FCRkkvQ0RpYmtZaWF6?=
 =?utf-8?B?a0d0WU1qSU1rcHFzeTBqN0g4b1NDYllXVC9hQjNzeGp5eW00WmJMdVJBa2l1?=
 =?utf-8?B?eTltcEJoRmNwdlZvZzMyWVdUc2s1NjVkNlYzS2VXZlpidHp0L01Ic2pWUTRB?=
 =?utf-8?B?bFpmMW14ZU4rcXpmREIzbWJrS2JxYWhNSnlHRDQ2eGE1QWpvajZUZ1Evdi9j?=
 =?utf-8?B?M3F0R2M4TU91UGYwcGlNaG9tMzhlSDU1TzZyaVJzeEdCZXBSY21DdDB1blAy?=
 =?utf-8?B?bEZNY0N6U1dwR0t3clpFNHVkV0k1M0xRQWVOdUVodjYvTStlMllMYktJSWlt?=
 =?utf-8?B?TFJCRGhuc1ZHZ1Z2VTdJNDBoYmtBM2RMd251NVczTkRxVDZtTENPSndWeVlC?=
 =?utf-8?Q?w9SIhPcU5DtS/6syn0HvdCw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178c1b7c-8fd0-43b9-2bf0-08dac84b21d7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR01MB7455.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 03:23:45.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zac/1OfYLZWRNXccZ6yVZzDv4Qg1uLrn2zhU03kFctIpzQFLRrKilNsS24Nz1PO/lDXFJ2VwOH1mBfQbEOELscgFJ1Zhx7TfeSH5HCIdMo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5050
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
Cc: Open Source Submission <patches@amperecomputing.com>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 17/11/2022 10:11, Joel Stanley wrote:
> On Wed, 16 Nov 2022 at 03:56, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>>
>> Dear Joel,
>>
>> As this patch set was all accepted in linux-next tree, May you help to
>> pick them to your openbmc/linux dev-6.0 branch?
> 
> Done. Great work, well done.
> 
> Cheers,
> 
> 

Thanks a lot for the help.
- Quan

> 
>>
>> The list of commits is as below (as some was picked in v9 and the remain
>> was picked in v10):
>>
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=072b9545e5cf470eea01f8e59c3dbd4b81181a2e
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=026d99699101db523f444d0fc3dddb75fef42594
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=4a4a4e9ebaa3ce903a3cdf8bb173eeaf87828cea
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=763dc90e9a4332f82ad43c866c6878742b15d4ab
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=2202e8df80936fa0d92d49cc7db1562e7772308e
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=c157f6e8ea2e61ab72f85567f37faa4711c291d7
>> +
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221115&id=37618918f6c7219e1bfb86e4c3fe7834092643d0
>>
>> Thank you for the help.
>> - Quan
>>
>>
>> On 31/10/2022 09:44, Quan Nguyen wrote:
>>> The SMpro co-processor on Ampere Altra processor family is to monitor
>>> and report various data included hwmon-related info, RAS errors, and
>>> other miscellaneous information. The SMPro MFD driver initializes the
>>> register map and instantiates all sub-devices. All the specifics will
>>> be handled in the child drivers.
>>>
>>> As some patches in previous version were picked, this patchset includes
>>> the remain patches which are Ampere SMpro errmon, SMPRO misc and dt
>>> bindings document for SMPro MFD driver. The errmon driver supports
>>> monitoring and reporting RAS-related errors. The misc driver supports
>>> reporting boot progress and other miscellaneous information.
>>>
>>> Discussion for v9:
>>> https://lore.kernel.org/lkml/Y1aHiaZ1OpHZIzS9@google.com/T/
>>>
>>> v10:
>>>     + Revise and fix document format                             [Bagas]
>>>     + Update commit message: s/This commit adds/Add/             [Bagas]
>>>     + Use
>>>       Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>                                                                   [Greg]
>>>     + Drop Documentation/misc-devices/smpro-[errmon|misc].rst     [Greg]
>>>
>>> v9:
>>>     + Fix issue when building htmldocs                           [Bagas]
>>>     + Insert 'break;' to avoid fall-through          [kernel test robot]
>>>     + Update SPDX license                                         [Greg]
>>>     + Fix messy goto                                              [Greg]
>>>     + Use ATTRIBUTE_GROUPS()                                      [Greg]
>>>     + Use dev_groups instead of sysfs_create_group() to avoid
>>>     user space racing issue                                       [Greg]
>>>     + Fix ugly static struct define                               [Greg]
>>>     + Rename smpro-mfd.c to smpro-core.c                     [Lee Jones]
>>>     + Fix include files in alphabetical order                [Lee Jones]
>>>     + Add defines to avoid using magic numbers               [Lee Jones]
>>>     + Return -EINVAL if device does not match                [Lee Jones]
>>>     + Remove unnecessary comment                             [Lee Jones]
>>>     + Remove unnecessary channel info for VRD and DIMM event      [Quan]
>>>     + Separate error_[smpro|pmpro] to error_* and warn_*          [Quan]
>>>     + Add minor refactor code                                     [Quan]
>>>
>>> v8:
>>>     + Insert 'break;' to avoid fall-through          [kernel test robot]
>>>     + Avoid uninitialized variable use               [kernel test robot]
>>>     + Remove unused #*_cells                                 [Krzysztof]
>>>     + Switch to use sysfs_emit()                                  [Greg]
>>>     + Sysfs to return single value only                           [Greg]
>>>     + Fix KernelVerion field in Documentation/ABI/testing doc     [Greg]
>>>     + Change errors_* sysfs to error_*                            [Quan]
>>>     + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
>>>     overflow status of each type of HW errors                     [Quan]
>>>     + Update wording in Kconfig for smpro-errmon and smpro-misc   [Quan]
>>>     + Masks reserved bit when read 10-bit power value             [Quan]
>>>     + Add some minor refactor                                     [Quan]
>>>
>>> v7:
>>>     + Add docs to Documentation/ABI/testing                       [Greg]
>>>     + Re-order patches to avoid compile dependency           [Lee Jones]
>>>     + Remove regmap_acquire/release_lock()                        [Quan]
>>>     + Install regmap bus->read/write() to handle multiple types of bus
>>>       access                                                      [Quan]
>>>     + Replace i2c block read by regmap_noinc_read()               [Quan]
>>>     + Fix wrong return type of *show/store()         [kernel test robot]
>>>     + Update GPL version                                          [Quan]
>>>     + Add some others minor code refactor                         [Quan]
>>>
>>> v6:
>>>     + Introduced smpro-errmon, smpro-misc as smpro-mfd sub-device [Quan]
>>>
>>> v5:
>>>     + Introduced the smpro-mfd driver and drop the use of
>>>     simple-mfd-i2c driver to avoid DT node with no resource in child
>>>     device DT nodes [Rob]
>>>     + Removed the use of reg DT property in child driver [Quan]
>>>     + Validated ManufactureID when probing smpro-mfd drivers [Quan]
>>>     + As child devices are instantiated by SMPro MFD driver, drop the
>>>     ManufacturerID checking in child driver, ie: smpro-hwmon [Quan]
>>>     + Revised commit messages [Quan]
>>>
>>> v4:
>>>     + Revised commit message [Quan]
>>>     + Fixed build issue found by kernel test robot [Guenter]
>>>     + Returned regmap_read() error code [Guenter]
>>>
>>> v3:
>>>     + Supported list of compatible string [Rob]
>>>     + Introduced reg property in DT to specify reg offset [Rob]
>>>     + Updated description and other minor changes in yaml file [Rob]
>>>     + Handled negative temperature value [Guenter]
>>>     + Returned -ENODEV if Manufacturer ID is wrong [Guenter]
>>>     + Refactored smpro_read_string() and smpro_temp_read() [Guenter]
>>>     + Removed smpro_write() function [Guenter]
>>>     + Added minor refactor changes [Quan]
>>>
>>> v2:
>>>     + Used 'struct of_device_id's .data attribute [Lee Jones]
>>>     + Removed "virtual" sensors [Guenter]
>>>     + Fixed typo "mili" to "milli", "nanoWatt" to "microWatt" [Guenter]
>>>     + Reported SOC_TDP as "Socket TDP" using max attributes [Guenter]
>>>     + Clarified "highest" meaning in documentation [Guenter]
>>>     + Corrected return error code when host is turn off [Guenter]
>>>     + Reported MEM HOT Threshold for all DIMMs as temp*_crit [Guenter]
>>>     + Removed license info as SPDX-License-Identifier existed [Guenter]
>>>     + Added is_visible() support [Guenter]
>>>     + Used HWMON_CHANNEL_INFO() macro and LABEL attributes [Guenter]
>>>     + Made is_valid_id() return boolean [Guenter]
>>>     + Returned -EPROBE_DEFER when smpro reg inaccessible [Guenter]
>>>     + Removed unnecessary error message when dev register fail [Guenter]
>>>     + Removed Socket TDP sensor [Quan]
>>>     + Changed "ampere,ac01-smpro" to "ampere,smpro" [Quan]
>>>     + Included sensor type and channel in labels [Quan]
>>>     + Refactorized code to fix checkpatch.pl --strict complaint [Quan]
>>>
>>> Quan Nguyen (3):
>>>     dt-bindings: mfd: Add bindings for Ampere Altra SMPro MFD driver
>>>     misc: smpro-errmon: Add Ampere's SMpro error monitor driver
>>>     misc: smpro-misc: Add Ampere's Altra SMpro misc driver
>>>
>>>    .../sysfs-bus-platform-devices-ampere-smpro   | 312 +++++++++++
>>>    .../devicetree/bindings/mfd/ampere,smpro.yaml |  42 ++
>>>    drivers/misc/Kconfig                          |  22 +
>>>    drivers/misc/Makefile                         |   2 +
>>>    drivers/misc/smpro-errmon.c                   | 529 ++++++++++++++++++
>>>    drivers/misc/smpro-misc.c                     | 145 +++++
>>>    6 files changed, 1052 insertions(+)
>>>    create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
>>>    create mode 100644 Documentation/devicetree/bindings/mfd/ampere,smpro.yaml
>>>    create mode 100644 drivers/misc/smpro-errmon.c
>>>    create mode 100644 drivers/misc/smpro-misc.c
>>>
