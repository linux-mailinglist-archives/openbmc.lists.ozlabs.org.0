Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0D539F4E
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 10:22:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LChwc5yqZz3blW
	for <lists+openbmc@lfdr.de>; Wed,  1 Jun 2022 18:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LoS6cSN7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8c::70e; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=LoS6cSN7;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2070e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LChwB2VWTz30BP
	for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2022 18:22:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDYGlBZzJJyudJGM+wvuMo/FID4rn0MT8dKULsB1MBYcIh3cTkHOQRIEm25FyjQKeoevi7izqTzg8v3QFL8L+ghdJxnd9tBRHwtIYWzM6emsuzFCSwAzr/9Qo7fr7X/v8kRp+b/eWv4/2rptEFAGlVs+eq/Y4SS+rmGmKR1ksTtJPBa9ZGMT0auX3u+3mBGREpbFaJ9jwMBcjhk0H9Gu7hmhIAxWO4mBjk2ySOX0etA5v+TfmCnQXRzFjjLxSHIjBxthOW8tcoYE07hXLPhkI9q3Hx4QcVKRBhqsbzF3dT+bqQE4Keq7nj6aVeomDwV5CruSfV4SXKREYcfhzDggoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTF+bG76d0JIStARmAsJC6U5+8f15OlLKLNmwcLpyOE=;
 b=P/MKRNshgwZYvF6nFDRGVY0nFrd3Bnu2TgWXyhiLbpVI1Zw5mY7GM/Q/Le0tRFJifT1BGnBitz/7/FEii3Yz5LhVa2PjbDlxFKOEqVmt8pctVr1l68rOzPOUmZRPMirSB0dxNsUo495xxTRw5YQiXVBYu+9i8L16y0FStRsdpVVe9CKXf8mU3pl4/OBAWtOMT9OMdWsshs0O3WrySTn6GV3R17967Z1Wsi46PKALa1nrgw+YavFmzR6JUPMxORp+cVC8d7lGvOj5MU2euNo84RQ+uFJtKT4A+XxQGbRJxpbb1c3W7JxyXxTeq2mwlW2CIRE7Ud/lZAxLMbhiqdvvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTF+bG76d0JIStARmAsJC6U5+8f15OlLKLNmwcLpyOE=;
 b=LoS6cSN725BPu/4c5Ry8wVCfwlGBAFw4kstJsfN+1Agzi1FFPWPc5BM9CuhIqohP4OEvtow5as+Vy21e40vNwdHCNndBnQM5kyNBd3qXbx5L3On5ksyozW0oA/Bbl5rU4U4epLiSSbKqqbrF5hhCyyU9qus3JV0CdQsOcBgkuuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB4922.prod.exchangelabs.com (2603:10b6:5:9::29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.18; Wed, 1 Jun 2022 08:22:12 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::5514:7923:ceef:cb2e]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::5514:7923:ceef:cb2e%3]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 08:22:11 +0000
Message-ID: <4f5d7746-3747-4a4d-525a-4fb69e706cd0@os.amperecomputing.com>
Date: Wed, 1 Jun 2022 15:21:47 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YmJJIb1DAIq5arCw@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:3:18::24) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd41be1-ded4-478e-3eb8-08da43a7d307
X-MS-TrafficTypeDiagnostic: DM6PR01MB4922:EE_
X-Microsoft-Antispam-PRVS: 	<DM6PR01MB4922064206B12943833A86D6F2DF9@DM6PR01MB4922.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	tHOGdbQEUZzBsfKFm7xNgA+jgFSEjMwTco5FEozpG/n/uK4WjaTspXoU5A4V+aNsguP5caDzXSF4orQxa4oUKoHZKPkyuOlm48le40wcjHawHIUjUDM8E6m9AqjXfMB+XSycxxhCbbwfB48hFCy7wp50yoQaAcDYu6yAxwQ0W/nYnu8dkrgcP8p9CC2qbpyO0Nja1BYQQW35l1P7LtgxnS9lNKp2kZ7IV0xBdAzPyqiRVILiLda0jjAr7Gp3pLuSqg5+xM8l9nmH+aXSciPf6/sWgemBmuHGLMPFbju7NIiAi/gvz9RrzoMERG3/FCN4jnLK0q8JgD6wcx9I0EtuBvOKUxZKO0O8m41hNKQQrNWKiLI6rbYeHsuwRzy5pt2f3/IPrSxr4rZpgKIWTzPtbupp+fLp81fPqfT+hPGSyI3FiHQyZW3PlnA4AJqSykynv13k2Wzu5wkyfx2saAZWCjxoq5lJYPL0d2zCYfrPX2rClmDQsZai05F8HyGSREgicErbES65BL5qSn6Fk8O7EUIvok62XqZ9J8kLX3v6XkZJHGuBbPDE+kZJMgWYjyOwHRHsfQKx0R3SXB4SuPs41ME0Bi76cxUjoKIWMr1sgoreAMxK3kaDkCnObbOPRFETZYO+rtooeohRZLvEwmnNg0iv05XNEFH6b1pTJWBNDgCTXVmf9/U6xp1hyr6uLRujWZ2e+7GNK0l6PswVhOI6CECYbskx4CBnLMCg0A6EpMQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR01MB7282.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(83380400001)(6486002)(54906003)(508600001)(31686004)(8676002)(316002)(66556008)(6666004)(66476007)(4326008)(66946007)(53546011)(6916009)(186003)(52116002)(7416002)(5660300002)(6506007)(2616005)(107886003)(38100700002)(38350700002)(31696002)(8936002)(26005)(6512007)(30864003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UkJZWmh4YnZSRm54V3BidTMvNnNFa1YzV2x6ZXdEd3pFK1h5ajh2OFhTbjFV?=
 =?utf-8?B?UnUxUkNMeHJONWl0bWxaRzdRc0pWTEFqODgySGh0R3RyaDFqM2g2ZGxHalVL?=
 =?utf-8?B?QXRNa0NEbEZhZldLS3lVcWVERUlKelM1U1Y4TG1rQ3RabFNvQllseEFJeXdO?=
 =?utf-8?B?TzR3V1Q4dk5yS2Iway9aT3lhajZpR0w1RjlXTHBNZmFERENNL09sNFNwakR1?=
 =?utf-8?B?aFdDK2JXR3JIYXpMbWgxc3NHcXlLK1RWem5qVDBnL0Q4OU1kRHg3aFRHRXd1?=
 =?utf-8?B?UnBuRFB4N3hwb3pEdmlGd1JFZXkwbDErZDJGYnhtL1Fnd1AzNEpjaXpQckc4?=
 =?utf-8?B?ZUQ5MXhTSDllbFNkN3owUVUyS3NwRXJvbEcwZlJyM0pxVUx2bk9CN2lXOW94?=
 =?utf-8?B?YUtldmJtbmlBWFNPVWQ4YVBSVThxQUVwM1JLYWNva1NkVDZIUHlobVNOSWlL?=
 =?utf-8?B?NncxZDM4dHRjdk1kOEhOT283bXFhaVd0OHBobjlQakFwSGpLb3ZsVkZOd1lV?=
 =?utf-8?B?Wk4vUlFZVUl5bEVnVjFBcHR0N0lWNzNYbGxoSHdicWpBYkhraE14WmFxWUNh?=
 =?utf-8?B?R1RkMlYxSVBpRzdFWUNXZ2J5ZUFiaEpBSEZCd3ZGbXBROXRvdkoyY0lpeksr?=
 =?utf-8?B?TXlta3l2WVFRTWtncUx3UVh6cTZFYm9CYWVRcmRwUms3eVJKaVR4b3N1K3pj?=
 =?utf-8?B?VzJCeTNGL2NNZzlrK3B3K0lDREFpWGp0K2lFR2F0RERLWU1WZFR3OFVtbmhl?=
 =?utf-8?B?aFc2OXhGMXIzL0FiQk1wRUhpN2ZZbTVMRC9JZXNsclJ4M0djU0JrZmtXbHJE?=
 =?utf-8?B?ak9EZWZMYVR2ditVL2lhV1phOVl6c2hERUd4NSt4MTNOdVp1RWJPUlhZR255?=
 =?utf-8?B?dHFmQm9yZkFkSzNMK3BMUm8wcFlPZmQ4R1duS2hHc1orRUFhejZIL09TLy9H?=
 =?utf-8?B?K2N0RjNQVUNsWno3MFVhOGN4Q3l6SWhEaDFWK3pUUWJDMTRvdkVFbTZ0bVhY?=
 =?utf-8?B?MFBHcktLVE9UVGoxck9NeXJLbGVSM3NESytrTWhLUXorbnZDc2F1eVFsaEZC?=
 =?utf-8?B?Rk9OdHcrR3A1WTN3UCtBS3VEL0FnWVp5YUMxTkJSallQck9wNkMvbk9Ma0VT?=
 =?utf-8?B?UnJHVndiOHpLRytpYTlZK2FDNXhyVlRPWkxLNGM1M3VTY3pYWXljR1B4UUhD?=
 =?utf-8?B?M1pQbkhVeXc4NGJia2xRRUhqdnZUb2RKazRYQW1WMFFrbE4rcTVXVGp3TG41?=
 =?utf-8?B?VG1XVGhqYlRnQkdLSW5aTlVYT0FBQjJBMERQaXgvV25URGxvZlpNQlVoVnZP?=
 =?utf-8?B?QTNSMTg4YmsyaEtuRmhSOExJb3l4bkpLYjF2U3BOamd6Tng5RGYwei9ibmcz?=
 =?utf-8?B?Wm12OGdUc3J5YW0zTmFyRVJGeis0QWlGWm1FRzg2N2E5c2N3aUNVZzhkV092?=
 =?utf-8?B?WG9oM2ZiaS9DTEdVdXhueW02RlcyVXZxdlZYSW5YcHVsTTgyaDJOVlU1K0FX?=
 =?utf-8?B?ZEFqcGVHaGpxTEdnNG82alFoRmJ4ci95UEh4bFlEM2d1bkZla1hYNjBPdkt4?=
 =?utf-8?B?WU5IMjF0RTJ2aEJJRjk3MFVQQ1RRMTlnSDlxcHhZeUJXbG1KM0Z2K0t0ak8v?=
 =?utf-8?B?RE5FNDlqWEJCYTE5QVoxSTU2R1VacEdaRHFnSDdXdnBDb2FtN2JhRGdLbzRR?=
 =?utf-8?B?N2hVOElvMUJWU0E2VXNDbFZsOTRmbEJDdmJIdi90Z1BaNkNTM3ZvSUxhdlVy?=
 =?utf-8?B?QTAyZzFSRmZ3bFQ3cXpLRWViRTRqeWVNWlNXaHFKaFYrblV4RWYrOTRQc2sy?=
 =?utf-8?B?RS85Zkk3VVlLTWdMY05YSXU1ZnJ3QTgrdVR5TmdzNXc0WWFIRTVKUXZqdTM2?=
 =?utf-8?B?S2hPUTdOdDc3TS9FeE5QQmxEOUpiRHlFaUxuaU4rWE5aNnhFSEpOcjNwY1ZU?=
 =?utf-8?B?d0tWdTZzaU16bzZQandCYUFqbVhoaElGcmc2UXY5cERWZUhMRnJNc2ZxdDZs?=
 =?utf-8?B?ZFRxQU1XWFY2M24zTDBBVXZ0bjlzSTJ0TTEzdWxqcVZLV0RJbjVZRnRCejNp?=
 =?utf-8?B?UUhVRHB0Wm0xSmlHbEV0N1JtcjNUNldxVzgvZ3JmSjg3akR4VHNNWjJucStG?=
 =?utf-8?B?QlpvTnp5MFIvWlhON2cvc2VVeitVcnZjMERucUd0SUdhYTB6bXQ5QldiT1hu?=
 =?utf-8?B?bzlUQVRGMzNsVzFzMWdDWHc0MlFVUUFTQXRKMW5oKzVtSDg5bFhZdmI4S2VT?=
 =?utf-8?B?dWlvNzQvNXQxZjJlb1FKUnlGdmdCTmFSOHJ2amJDR3F0ZWl6YmJuVXpKK2xs?=
 =?utf-8?B?WWY4K3pON2xkRTlxaXZTZXkwRlNKUjNuRkN3VVgxT09RWGI3eWxpNHJNQU5R?=
 =?utf-8?Q?gseJAbuvB4u7jk8pO4/vIuRE9yRmUOKi/ExGr?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd41be1-ded4-478e-3eb8-08da43a7d307
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:22:11.3214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWheyxd2wQY43MpTOXDPG/bhrdzrnqCU7/6Ap11jycBWRvZ7CKh6nm4Jfjws1FtVsWuypQG2mmOygCQ4clAE5oq/VCkni1oSf3lum1Pkft0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4922
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
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
>> +
>> +	ret = sysfs_emit(buf, "%02x%04x\n", channel, event_data);
> 
> sysfs rules are one value per file.  You know this.
> 
>> +	/* Clear event after read */
>> +	if (event_data != 0)
> 
> Why would it be 0?  Isn't 0 a valid value?
> 
> 
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
>> +
>> +	ret = regmap_read(errmon->regmap, err_info->err_len, &err_length);
>> +	if (ret || err_length <= 0)
>> +		goto done;
> 
> return the error.
> 
> Wait, you could return 0 here, are you sure about that?
> 
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
>> +
>> +	if (!((channel == RAS_SMPRO_ERRS && (value & BIT(0))) ||
>> +	      (channel == RAS_PMPRO_ERRS && (value & BIT(1)))))
>> +		goto done;
> 
> No error?  Are you sure?
> 
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

Hi Greg,

Since the internal representation of the internal error is split into 
high low chunks of the info and data values which need to be 
communicated atomicly, I'm treating them as "one value" here. I could 
dump them in a temporary array and print that, but it seems like 
additional complexity for the same result. Can we consider this 
concatenated encoding as "an array of the same type" for the purposes of 
this driver?"

Thanks,
- Quan
