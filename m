Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 559FE50BA85
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 16:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlHHm6dcgz3bcX
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 00:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=N5+DdCyt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e89::709;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=N5+DdCyt; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::709])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlHHG5gCrz3bWx
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 00:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfNxX23rl9aLqQezA5Qj4NEo/vrfhgD8o83ftOfzxQnwSsUtQko1bc1eT1NFbRPsIHIvxbi8fbrRvYZm3phIHc8cXzZNj2J29eoIXVFKWT2Z9p/XK2o7FJ234ws7957mR8tyZ7jelmZ3i0I/yEUIyXuL0DLybsq11eTWSvbXdMICpqrfIj7ht7tMHr8czbvLgxzxDM644M4tvXnNZouQpZsgyMJLTYYlj6NuNWfgHTLeeIA5+404W+A4MD63uuYdAzb7iU+O828jVJ3OUoPXa3CL71iUW1vGBBMUXL1y7JdRXyhuzFdWVFbneaHfe2z0mRihE+FQ4Ez/VytNP9JMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSn8Y4P4Khb8BRAqlK8NOwjMVQof/7Ko7tYNp2j5s+o=;
 b=cr2VbnGT3lLIJgXali6k9NBdoYHrP1L42F/NMVZPbxNdiHZBohcrHCfmkveRlMZPr5P/gq5THB/WwHdj5bn/U6CfX/cvTotnOIP4v19Qqj/kOicXcT6AMkQSA/mwI2Dzg4IiLEeK24NAkR0/W2WI1gNyPVHPLiaBsWuN3HpnQLVHtwc1rB1PExQ613md/13JHXIiyoK1dZgezvrttTf5we9j7gf807k7pvF/NIIwTBr1TNMoOcLub+lAyWvmezJrqtR15so7aJrUi8F5lCENblEVOW8lvCskvoy+nZvxOaTfjhyEgnSFQ/IFT35J1+rAdPnzY+bB4xQmYsSRAsM2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSn8Y4P4Khb8BRAqlK8NOwjMVQof/7Ko7tYNp2j5s+o=;
 b=N5+DdCytwxX3UT0LxggJUMy/YWNDafFZBU2K0tQXwcb5DE/w3En3XuungocdgJnjPOQHwT5wo24Ri7B7dafP6kAI+8S4wjN8lrDVU4/ranyY7CBh12UAexZGpgup1FMba9WZLOLlSpQ70/hmQBugB4WQh3iDg1RSvuXCXVXU1h4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 MN0PR01MB7634.prod.exchangelabs.com (2603:10b6:208:376::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Fri, 22 Apr 2022 14:43:59 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 14:43:58 +0000
Message-ID: <82a6452a-965b-7fbe-eba2-919f0a6ed73a@os.amperecomputing.com>
Date: Fri, 22 Apr 2022 21:43:39 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
From: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
Content-Language: en-US
In-Reply-To: <YmJJIb1DAIq5arCw@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb17792-00a2-4a9a-8c57-08da246e886a
X-MS-TrafficTypeDiagnostic: MN0PR01MB7634:EE_
X-Microsoft-Antispam-PRVS: <MN0PR01MB7634211728A781016F1CE944F2F79@MN0PR01MB7634.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: We2D1rBZ2n/10BR78IERRvP3XbwOHio0+Wj7ql6TARq5v6cf8ePjgUkT4+wBz+H9eGSG0/HBnUCmm+k4rzQrCJKGf+CSKW7dc8Q+6nN75UniOaFcnb79QYeDtNNVPVnNl1+6KHgBXtLUnaNf3Mrn8EgmWBpzKeU9IL7q7yzdBgkTTuxpctvqUmfq4i0xvWgonaZfjoNIbglz8kj7Rid5dDdHnQBT45PKyxg+KwgM+eyzk7RZJ08d5Os+GlzxtdYeJoQjYVwVlZyhU15iwQkNpjhFdrbJVxDj9g1YxZ6PUF+KrfWDZj/8tSVB1FCo6J+KJeRBgsVCVwlTH3FtgI1VIXMWq5E5wo+prRznM0Uq1ZSa0hweH75EH3Bcf80KxaL95fRxKBeUWA5pU4jPG2/JeduJbt7RJ0eFH04MV+xcric0Skd6klsGhYWH9WYyTwQo4//AYA5uwb+ZttGOPtOdmabBe4D4VJnStiKZbyQPOHN+r9lYw59WEDEbttBpNkQby4vJGJa1fDl82JS+deEgUGQEu/lDZ45IDJrjdOk5eGZzXxMhGl3PXqjZqh4uyKwu0KvYFQrq1tEm9+w01AYkEU9YV4pKcJ4tOMtbvnlpNX8UfXmcb3cNSDXicTrvs+BS0rh+f6Du1avNe/E88f4Imnvy6rFONKmr74ERiSOvfRl+BjpQtjOPrZ/Gfiqgqo/p2DXcXzfr6laZkyxrQ3e/r/yQW5rStmMtbnDflp/E9nSvD0KmeWSwJL48Zr374rZdzO0ZxFEglGciWf43117evc2sg+tQg+HzdVzbtR1xEyvJEcuEsbdlNgFVoNyeMBGk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(30864003)(52116002)(6666004)(6506007)(26005)(107886003)(508600001)(86362001)(316002)(966005)(6486002)(31686004)(6512007)(2616005)(53546011)(6916009)(54906003)(4326008)(8676002)(186003)(2906002)(31696002)(38350700002)(38100700002)(8936002)(5660300002)(66556008)(66946007)(66476007)(7416002)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdwbEF1MmgzdjExR0dkUnBXVkhTSUZCWUgxbDFqOGs1dUEydHdZQW9zVTRj?=
 =?utf-8?B?SjJVS0FzRW9JOHZvalZnVW90anJFMUt1ZWludkp2b2lxUTZaYVVOYjBNU2ov?=
 =?utf-8?B?L01yMkl2UU9yc2d3Y3dwN0hsTHpkKzE5ampTOXpiQ2VaY3Y2bmRaWjlHZ0x2?=
 =?utf-8?B?cGl6VmFjOHd1VEtLMnAvSzQyVDhOWEZtVGh6WkpLVENMcExqc1hrZXF0cm8w?=
 =?utf-8?B?ZjI3ZFRYVHlwRURRK0QvNXI4dUZuYS96MXYrOVAxTFRvcUVzdUJEdTEzZVVK?=
 =?utf-8?B?UmltYU1zWjFMazIrYW5tMVlINXZQVkpTcTRQL1ljTndWV1lyV3djWXBUYlJx?=
 =?utf-8?B?K1RWVGc0Wit5L0RiTVNvN2ZHeUt2dUNEaEdjQ2ZVUVRRajVvNkZLMTl5ZVZE?=
 =?utf-8?B?M2hpR0EzeXIzMXdNc05NWmlROGJNd3Y1dldLK3F0Zk54aFdmWDl1Zm9jakZZ?=
 =?utf-8?B?M3U5aTErbDdDRS9MRVJsOVovcUlEVElUeUt6d3R1em9YYy85eHU0MTJRSTN2?=
 =?utf-8?B?cjZNTHRZOER4ekFWTkNhQ0FzQWFaQjl6aE1QVHVVQ3RSUUtOUXNNQ1U3Tmsv?=
 =?utf-8?B?V2l5M00rWEUyajRkc1ZaUHZYUkxQQjZmckZxbkxNeTEzeHgwaFlEMytSYXY3?=
 =?utf-8?B?YXFEdktUZzBjVlNoZHlwb1JZOW9MSWYyTU1lVHpxb2ZwZDZVS1h5QmpzZVJ0?=
 =?utf-8?B?bnNEMXAzNTQ3elN2Z2lIdE5ZWWpZSVQ4bnBLdVRiei8zM2dWWVpjZGNJNUdt?=
 =?utf-8?B?Ty9tNHJjN2pDU0x2cDZ0WlEyc2dIdUdoWmJBL3Mrcnh3VjF1QTlwS1p5VVpj?=
 =?utf-8?B?U0NKS1kwd29maldpQ0JkbjVoZHhVOGk0S0FYN3pDdUhXKzd4ZzV0WTV2OHdo?=
 =?utf-8?B?aU1lbUgvdStkVy85VFBQM2FRSnJTem5ENk9ad2pLdUYzQitPRmZUS1pERWhB?=
 =?utf-8?B?SlJTa0pyV3hEd29Tb1UvQnZWNkRYY1U3b2F3UmZUNkNOMFJjV3pCUlN0MjVn?=
 =?utf-8?B?MXlreDRNdkNGU1F6cWRsYVJEMnZrR0JHTUdqWFRFcU50djRQYkVUVEFiQTVG?=
 =?utf-8?B?V2s3RFJCbFdYbThrL2VpWk9qWnZ0LzlGZFg0SnNNdTcveUNTUHQvQVZFa1JJ?=
 =?utf-8?B?aloyUXFtdDlNRFNWOW5HMUhlQ0RhenRXcE9iaU1rZ0ExbFFkZlY1RkFoKzRt?=
 =?utf-8?B?MnJQUnJFNTBkK0oxYmdhdTFuZ0FpcUlNQzkyc2lQZXBtVVpJRTNrckRGTHIw?=
 =?utf-8?B?czNGaHAvc1JEYVVHMFRCRWNVMFJ2M0t2YUFOU0dCNVNzNU1wV3Jsb2tQeU8v?=
 =?utf-8?B?MjU3QjBjN3hnRHdWWHEzajhSSnNzQ011aVUrTmhDWXU0QjJmZllEa05mUTND?=
 =?utf-8?B?VEZSM2w4SHpmN20yRm9BUlpMa0gvWG9yVTRYSUh3c0pjVVBzSjJLSWRlRUF0?=
 =?utf-8?B?NzNGQ2Z6elJFTCtjUmNGYUNZeGpDSkRHb0lTa1R4SS9Ed3VJMUpKVlRybnBG?=
 =?utf-8?B?VnEzU3hLajNMN2dKUzJEaTVtTkJSSG1MWmkrMDByT1NiNG5qQ2lWc096WEdX?=
 =?utf-8?B?V1pvL0wybnZkd3p2MDVSVlYxaTZSNi9VdG40eTdacVdSQTFwSXJpdDJCdmlH?=
 =?utf-8?B?MXV3SVo0T3lMTVRNUnhQc1B4ZGxNc0twTHNkQTNtVGxIUVdmMzl0VStpUk1H?=
 =?utf-8?B?OFYrMjRDNGFrSlczUDIrTktMQlVEZG9HWXVYL0YycEk2UmUvYkl3QmlKck95?=
 =?utf-8?B?bWoxTWVzbmkzWCtmeXZKT1lvUEk4L3lGa0lBWlliczJMdkJmUjZ0MllGeTZV?=
 =?utf-8?B?TzN4cVdNRGpIRGVSMmgwbUJkd0tXcnhQeE5rV3U2SkFyTFcwS0NtVVhKWVpn?=
 =?utf-8?B?M3VuaHVaYjlvVVhGVkVnZlUxWGNXWkQrMlJ3cmN5b05qMXpTYVdzVGoweDM3?=
 =?utf-8?B?bTV2MERwR3FKQy9nVjdpV1gwbVpnbTZYYkZYNVNKTVVvN1RrdXQxaDE3RjVU?=
 =?utf-8?B?aXVtNmplY2huQWtSaURsamsrSkJsTFF2YzI5UHlRdWFqWExwT2kvak55YzZW?=
 =?utf-8?B?TFlQZmJSWW1XNThjeUVwc3NqTTc5TW5vRnpyb1UwY24xWU5tTFlkMGtMVzJM?=
 =?utf-8?B?OHBGVEtOZXlVdVFLMXJ1UlVQOVVRZTNTRkIxR2NKUU1tY05GRm50aGxFS1dw?=
 =?utf-8?B?OUlsczJrd1lwY3R6V0Q5dmhLSkQ4UG9Sd3E5SkYwWWtNTmY0U2xEYkJVd2xF?=
 =?utf-8?B?ZWV0Zy9PWnhTUGNoTlk1Vis5Q2hVa0NUV01JazFoTDhiVGVmME5mRXVOa0s3?=
 =?utf-8?B?cE9LUG5TNzZJbzMyYWxPRE9PWG9sZ24wRUhPT0szSzMxQjJYRElMVVBncjJ2?=
 =?utf-8?Q?+7aG9F0IGuIxj9KzkRq8L/lxYlg1ccxzx2j0S?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb17792-00a2-4a9a-8c57-08da246e886a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 14:43:58.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kupJeZy/rkHWGE9DYUx4Yqu5JFHwdsaC112GTlXH2ovrTiKSRt/BqD87csskquvTWR76aIPg+39vL/SiEiLRq5cGIUrZ7i2lfd2M7fArXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7634
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 22/04/2022 13:20, Greg Kroah-Hartman wrote:
> On Fri, Apr 22, 2022 at 09:46:47AM +0700, Quan Nguyen wrote:
>> This commit adds Ampere's SMpro error monitor driver for monitoring
>> and reporting RAS-related errors as reported by SMpro co-processor
>> found on Ampere's Altra processor family.
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> Changes in v8:
>>    + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
>>    + Avoid uninitialized variable use               [kernel test robot]
>>    + Switch to use sysfs_emit()                                  [Greg]
>>    + Make sysfs to return single value                           [Greg]
>>    + Change errors_* sysfs to error_*                            [Quan]
>>    + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
>>    overflow status of each type of HW errors                     [Quan]
>>    + Add some minor refactor                                     [Quan]
>>
>> Changes in v7:
>>    + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
>>    + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
>>    + Validate number of errors before read                       [Quan]
>>    + Fix wrong return type of *_show() function     [kernel test robot]
>>    + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
>>    + Use pointer instead of stack memory                         [Quan]
>>
>> Changes in v6:
>>    + First introduced in v6 [Quan]
>>
>>   drivers/misc/Kconfig        |  12 +
>>   drivers/misc/Makefile       |   1 +
>>   drivers/misc/smpro-errmon.c | 477 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 490 insertions(+)
>>   create mode 100644 drivers/misc/smpro-errmon.c
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 41d2bb0ae23a..9fbe6797c440 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -176,6 +176,18 @@ config SGI_XP
>>   	  this feature will allow for direct communication between SSIs
>>   	  based on a network adapter and DMA messaging.
>>   
>> +config SMPRO_ERRMON
>> +	tristate "Ampere Computing SMPro error monitor driver"
>> +	depends on MFD_SMPRO || COMPILE_TEST
>> +	help
>> +	  Say Y here to get support for the SMpro error monitor function
>> +	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
>> +	  loading, the driver creates sysfs files which can be use to gather
>> +	  multiple HW error data reported via read and write system calls.
>> +
>> +	  To compile this driver as a module, say M here. The driver will be
>> +	  called smpro-errmon.
>> +
>>   config CS5535_MFGPT
>>   	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
>>   	depends on MFD_CS5535
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index 70e800e9127f..483308a6e113 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
>>   obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
>>   obj-$(CONFIG_SGI_XP)		+= sgi-xp/
>>   obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
>> +obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
>>   obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
>>   obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
>>   obj-$(CONFIG_HP_ILO)		+= hpilo.o
>> diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
>> new file mode 100644
>> index 000000000000..df7d8fc4ff3f
>> --- /dev/null
>> +++ b/drivers/misc/smpro-errmon.c
>> @@ -0,0 +1,477 @@
>> +// SPDX-License-Identifier: GPL-2.0+
> 
> Are you sure you mean "or any later version"?  I have to ask.
> 

Thank Greg for the review.

Will change all to SPDX-License-Identifier: GPL-2.0-or-later in next 
version.

>> +static struct smpro_int_error_hdr list_smpro_int_error_hdr[2] = {
>> +	{
>> +	 ERR_SMPRO_TYPE,
>> +	 ERR_SMPRO_INFO_LO, ERR_SMPRO_INFO_HI,
>> +	 ERR_SMPRO_DATA_LO, ERR_SMPRO_DATA_HI,
>> +	 WARN_SMPRO_INFO_LO, WARN_SMPRO_INFO_HI
>> +	},
>> +	{
>> +	 ERR_PMPRO_TYPE,
>> +	 ERR_PMPRO_INFO_LO, ERR_PMPRO_INFO_HI,
>> +	 ERR_PMPRO_DATA_LO, ERR_PMPRO_DATA_HI,
>> +	 WARN_PMPRO_INFO_LO, WARN_PMPRO_INFO_HI
>> +	},
> 
> Odd indentation, checkpatch did not complain?
> 

No, checkpatch.pl did not complain. But let me check to see if there is 
better indentation.

>> +static ssize_t smpro_event_data_read(struct device *dev,
>> +				     struct device_attribute *da, char *buf,
>> +				     int channel)
>> +{
>> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +	s32 event_data;
>> +	int ret;
>> +
>> +	ret = regmap_read(errmon->regmap, smpro_event_table[channel], &event_data);
>> +	if (ret)
>> +		goto done;
> 
> Just return the error here.
> 
Will fix in next version

>> +
>> +	ret = sysfs_emit(buf, "%02x%04x\n", channel, event_data);
> 
> sysfs rules are one value per file.  You know this.
> 
Yes, I will address this in my next version. The "channel" could be 
removed as the sysfs file name itself is enough to identify the channel.

>> +	/* Clear event after read */
>> +	if (event_data != 0)
> 
> Why would it be 0?  Isn't 0 a valid value?
> 
> 

0 means it is good and there is no event, but if it is not 0, that mean 
there is an event and need to be written back to clear that event.

>> +		regmap_write(errmon->regmap, smpro_event_table[channel], event_data);
>> +done:
>> +	return ret;
>> +}
>> +
>> +static ssize_t smpro_overflow_data_read(struct device *dev, struct device_attribute *da,
>> +					char *buf, int channel)
>> +{
>> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +	struct smpro_error_hdr *err_info;
>> +	s32 err_count;
>> +	int ret;
>> +
>> +	err_info = &smpro_error_table[channel];
>> +
>> +	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Bit 8 indicates the overflow status */
>> +	return sysfs_emit(buf, "%d\n", (err_count & BIT(8)) ? 1 : 0);
>> +}
>> +
>> +static ssize_t smpro_error_data_read(struct device *dev, struct device_attribute *da,
>> +				     char *buf, int channel)
>> +{
>> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +	unsigned char err_data[MAX_READ_BLOCK_LENGTH];
>> +	struct smpro_error_hdr *err_info;
>> +	s32 err_count, err_length;
>> +	int count = 0;
>> +	int ret;
>> +
>> +	err_info = &smpro_error_table[channel];
>> +
>> +	ret = regmap_read(errmon->regmap, err_info->err_count, &err_count);
>> +	/* Error count is the low byte */
>> +	err_count &= 0xff;
>> +	if (ret || !err_count || err_count > err_info->max_err_cnt)
>> +		goto done;
> 
> Just return the error.
> 
Will fix in next version.

>> +
>> +	ret = regmap_read(errmon->regmap, err_info->err_len, &err_length);
>> +	if (ret || err_length <= 0)
>> +		goto done;
> 
> return the error.
> 
> Wait, you could return 0 here, are you sure about that?
> 
Yes, that is our intention.
If ret != 0 then return the error
Otherwise, if ret == 0 then return 0 if there is no error and/or 
err_length invalid.

>> +
>> +	if (err_length > MAX_READ_BLOCK_LENGTH)
>> +		err_length = MAX_READ_BLOCK_LENGTH;
>> +
>> +	memset(err_data, 0x00, MAX_READ_BLOCK_LENGTH);
>> +	ret = regmap_noinc_read(errmon->regmap, err_info->err_data, err_data, err_length);
>> +	if (ret < 0)
>> +		goto done;
> 
> return the error, no need for a goto in this function.
> 
Agree, will fix this and any other places as well.

>> +
>> +	/*
>> +	 * The output of Core/Memory/PCIe/Others UE/CE errors follows below format:
>> +	 * <Error Type><Error SubType><Instance><Error Status>\
>> +	 * <Error Address><Error Misc 0><Error Misc 1><Error Misc2><Error Misc 3>
>> +	 * Where:
>> +	 *  + Error Type: The hardwares cause the errors. (1 byte)
>> +	 *  + SubType: Sub type of error in the specified hardware error. (1 byte)
>> +	 *  + Instance: Combination of the socket, channel,
>> +	 *    slot cause the error. (2 bytes)
>> +	 *  + Error Status: Encode of error status. (4 bytes)
>> +	 *  + Error Address: The address in device causes the errors. (8 bytes)
>> +	 *  + Error Misc 0/1/2/3: Addition info about the errors. (8 bytes for each)
>> +	 * Reference Altra SOC BMC Interface specification.
>> +	 */
>> +	count = sysfs_emit(buf, "%02x%02x%04x%08x%016llx%016llx%016llx%016llx%016llx\n",
>> +			   err_data[0], err_data[1], *(u16 *)&err_data[2],
>> +			   *(u32 *)&err_data[4], *(u64 *)&err_data[8],
>> +			   *(u64 *)&err_data[16], *(u64 *)&err_data[24],
>> +			   *(u64 *)&err_data[32], *(u64 *)&err_data[40]);
>> +
>> +	/* go to next error */
>> +	ret = regmap_write(errmon->regmap, err_info->err_count, 0x100);
>> +done:
>> +	return ret ? ret : count;
>> +}
>> +
>> +/*
>> + * Output format:
>> + * <errType><image><dir><Location><errorCode><data>
>> + * Where:
>> + *   + errType: SCP Error Type (3 bits)
>> + *      1: Warning
>> + *      2: Error
>> + *      4: Error with data
>> + *   + image: SCP Image Code (8 bits)
>> + *   + dir: Direction (1 bit)
>> + *      0: Enter
>> + *      1: Exit
>> + *   + location: SCP Module Location Code (8 bits)
>> + *   + errorCode: SCP Error Code (16 bits)
>> + *   + data : Extensive data (32 bits)
>> + *      All bits are 0 when errType is warning or error.
>> + */
>> +static ssize_t smpro_internal_err_read(struct device *dev, struct device_attribute *da,
>> +				       char *buf, int channel)
>> +{
>> +	struct smpro_errmon *errmon = dev_get_drvdata(dev);
>> +	struct smpro_int_error_hdr *err_info;
>> +	unsigned int data_lo = 0, data_hi = 0;
>> +	unsigned int ret_hi, ret_lo;
>> +	unsigned int err_type;
>> +	unsigned int value;
>> +	int count = 0;
>> +	int ret;
>> +
>> +	/* read error status */
>> +	ret = regmap_read(errmon->regmap, GPI_RAS_ERR, &value);
>> +	if (ret)
>> +		goto done;
> 
> Same mess here, just return the error.
> 
Yes. will do.
>> +
>> +	if (!((channel == RAS_SMPRO_ERRS && (value & BIT(0))) ||
>> +	      (channel == RAS_PMPRO_ERRS && (value & BIT(1)))))
>> +		goto done;
> 
> No error?  Are you sure?
> 
Yes, no error, but let me try to make this a bit simpler in next version.

>> +
>> +	err_info = &list_smpro_int_error_hdr[channel];
>> +	ret = regmap_read(errmon->regmap, err_info->err_type, &err_type);
>> +	if (ret)
>> +		goto done;
>> +
>> +	ret = regmap_read(errmon->regmap, err_info->err_info_low, &ret_lo);
>> +	if (ret)
>> +		goto done;
>> +
>> +	ret = regmap_read(errmon->regmap, err_info->err_info_high, &ret_hi);
>> +	if (ret)
>> +		goto done;
>> +
>> +	if (err_type & BIT(2)) {
>> +		/* Error with data type */
>> +		ret = regmap_read(errmon->regmap, err_info->err_data_low, &data_lo);
>> +		if (ret)
>> +			goto done;
>> +
>> +		ret = regmap_read(errmon->regmap, err_info->err_data_high, &data_hi);
>> +		if (ret)
>> +			goto done;
>> +
>> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
>> +				   4, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
>> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
>> +		/* clear the read errors */
>> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(2));
>> +
>> +	} else if (err_type & BIT(1)) {
>> +		/* Error type */
>> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
>> +				   2, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
>> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
>> +		/* clear the read errors */
>> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(1));
>> +
>> +	} else if (err_type & BIT(0)) {
>> +		/* Warning type */
>> +		count = sysfs_emit(buf, "%01x%02x%01x%02x%04x%04x%04x\n",
>> +				   1, (ret_hi & 0xf000) >> 12, (ret_hi & 0x0800) >> 11,
>> +				   ret_hi & 0xff, ret_lo, data_hi, data_lo);
>> +		/* clear the read errors */
>> +		ret = regmap_write(errmon->regmap, err_info->err_type, BIT(0));
>> +	}
>> +done:
>> +	return ret ? ret : count;
>> +}
>> +
>> +#define ERROR_OVERFLOW_RO(_error, _index) \
>> +	static ssize_t overflow_##_error##_show(struct device *dev,            \
>> +						struct device_attribute *da,   \
>> +						char *buf)                     \
>> +	{                                                                      \
>> +		return smpro_overflow_data_read(dev, da, buf, _index);         \
>> +	}                                                                      \
>> +	static DEVICE_ATTR_RO(overflow_##_error)
>> +
>> +ERROR_OVERFLOW_RO(core_ce, CORE_CE_ERRS);
>> +ERROR_OVERFLOW_RO(core_ue, CORE_UE_ERRS);
>> +ERROR_OVERFLOW_RO(mem_ce, MEM_CE_ERRS);
>> +ERROR_OVERFLOW_RO(mem_ue, MEM_UE_ERRS);
>> +ERROR_OVERFLOW_RO(pcie_ce, PCIE_CE_ERRS);
>> +ERROR_OVERFLOW_RO(pcie_ue, PCIE_UE_ERRS);
>> +ERROR_OVERFLOW_RO(other_ce, OTHER_CE_ERRS);
>> +ERROR_OVERFLOW_RO(other_ue, OTHER_UE_ERRS);
>> +
>> +#define ERROR_RO(_error, _index) \
>> +	static ssize_t error_##_error##_show(struct device *dev,            \
>> +					     struct device_attribute *da,   \
>> +					     char *buf)                     \
>> +	{                                                                   \
>> +		return smpro_error_data_read(dev, da, buf, _index);         \
>> +	}                                                                   \
>> +	static DEVICE_ATTR_RO(error_##_error)
>> +
>> +ERROR_RO(core_ce, CORE_CE_ERRS);
>> +ERROR_RO(core_ue, CORE_UE_ERRS);
>> +ERROR_RO(mem_ce, MEM_CE_ERRS);
>> +ERROR_RO(mem_ue, MEM_UE_ERRS);
>> +ERROR_RO(pcie_ce, PCIE_CE_ERRS);
>> +ERROR_RO(pcie_ue, PCIE_UE_ERRS);
>> +ERROR_RO(other_ce, OTHER_CE_ERRS);
>> +ERROR_RO(other_ue, OTHER_UE_ERRS);
>> +
>> +static ssize_t error_smpro_show(struct device *dev, struct device_attribute *da, char *buf)
>> +{
>> +	return smpro_internal_err_read(dev, da, buf, RAS_SMPRO_ERRS);
>> +}
>> +static DEVICE_ATTR_RO(error_smpro);
>> +
>> +static ssize_t error_pmpro_show(struct device *dev, struct device_attribute *da, char *buf)
>> +{
>> +	return smpro_internal_err_read(dev, da, buf, RAS_PMPRO_ERRS);
>> +}
>> +static DEVICE_ATTR_RO(error_pmpro);
>> +
>> +#define EVENT_RO(_event, _index) \
>> +	static ssize_t event_##_event##_show(struct device *dev,            \
>> +					     struct device_attribute *da,   \
>> +					     char *buf)                     \
>> +	{                                                                   \
>> +		return smpro_event_data_read(dev, da, buf, _index);         \
>> +	}                                                                   \
>> +	static DEVICE_ATTR_RO(event_##_event)
>> +
>> +EVENT_RO(vrd_warn_fault, VRD_WARN_FAULT_EVENTS);
>> +EVENT_RO(vrd_hot, VRD_HOT_EVENTS);
>> +EVENT_RO(dimm_hot, DIMM_HOT_EVENTS);
>> +
>> +static struct attribute *smpro_errmon_attrs[] = {
>> +	&dev_attr_overflow_core_ce.attr,
>> +	&dev_attr_overflow_core_ue.attr,
>> +	&dev_attr_overflow_mem_ce.attr,
>> +	&dev_attr_overflow_mem_ue.attr,
>> +	&dev_attr_overflow_pcie_ce.attr,
>> +	&dev_attr_overflow_pcie_ue.attr,
>> +	&dev_attr_overflow_other_ce.attr,
>> +	&dev_attr_overflow_other_ue.attr,
>> +	&dev_attr_error_core_ce.attr,
>> +	&dev_attr_error_core_ue.attr,
>> +	&dev_attr_error_mem_ce.attr,
>> +	&dev_attr_error_mem_ue.attr,
>> +	&dev_attr_error_pcie_ce.attr,
>> +	&dev_attr_error_pcie_ue.attr,
>> +	&dev_attr_error_other_ce.attr,
>> +	&dev_attr_error_other_ue.attr,
>> +	&dev_attr_error_smpro.attr,
>> +	&dev_attr_error_pmpro.attr,
>> +	&dev_attr_event_vrd_warn_fault.attr,
>> +	&dev_attr_event_vrd_hot.attr,
>> +	&dev_attr_event_dimm_hot.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group smpro_errmon_attr_group = {
>> +	.attrs = smpro_errmon_attrs
>> +};
> 
> ATTRIBUTE_GROUPS()?
> 
> 
Will use this macro in next version.

>> +
>> +static int smpro_errmon_probe(struct platform_device *pdev)
>> +{
>> +	struct smpro_errmon *errmon;
>> +	int ret;
>> +
>> +	errmon = devm_kzalloc(&pdev->dev, sizeof(struct smpro_errmon), GFP_KERNEL);
>> +	if (!errmon)
>> +		return -ENOMEM;
>> +
>> +	platform_set_drvdata(pdev, errmon);
>> +
>> +	errmon->regmap = dev_get_regmap(pdev->dev.parent, NULL);
>> +	if (!errmon->regmap)
>> +		return -ENODEV;
>> +
>> +	ret = sysfs_create_group(&pdev->dev.kobj, &smpro_errmon_attr_group);
> 
> You just raced with userspace and lost :(
> 
> Always use the default groups of the platform driver for this.  That way
> you do not have to do anything special and your files will be created
> properly.
> 

And will switch to use .dev_groups follow your article at 
https://lwn.net/Articles/793061/

>> +	if (ret)
>> +		dev_err(&pdev->dev, "SMPro errmon sysfs registration failed\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static int smpro_errmon_remove(struct platform_device *pdev)
>> +{
>> +	sysfs_remove_group(&pdev->dev.kobj, &smpro_errmon_attr_group);
>> +	pr_info("SMPro errmon sysfs entries removed");
> 
> Drivers are quiet when all is working properly.
> 
> If you set the pointer properly as asked above, you do not have to
> remove the group on your own.
> 
> Huge hint, if you ever call sysfs_* from a driver, something is probably
> wrong.
> 
> Same goes for the other drivers in this series, please fix them all up
> this way.
> 
Thanks for pointing out. Will apply all other places where applicable.

Thank you for the review,
-- Quan
