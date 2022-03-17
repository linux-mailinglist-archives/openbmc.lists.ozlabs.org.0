Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 725584DC145
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 09:31:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK0jh2Xmdz308F
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 19:31:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=DanmRuio;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::70d;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=DanmRuio; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::70d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK0j72Bfxz2yQG;
 Thu, 17 Mar 2022 19:31:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QRpCt7pdS0E+OQGfyMI/OjuLCLi6kw9s7DYvL7Ft3YuXrJURrx7WElgWtTpvTAyM5VgvMjy2GeD09+Xu6v+7cUHd5QtaN1VGc7JdBGFLNUcqTtbPWEbQx1+P1D2tDagOzn4z/arWbBnysyQcIY+gVroPZOaRDlIVh6EETsoBl7YfPq4cVr5Fi+7cf3q0IV5v30eBBBWWbKkwazlUV7nx4gAYXk/vHc3hDlJ0tlk6lCNrYsOO5RhqKDAyHlKYSihikbt+bKBPRDKvQU7OLE45iqqzevAYKy0oZ+7qAYURO9aE4uL1IJHy+Al+W680w3iYKKRg1ba9OyzZ9LLtIX63UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJzuLp3z3fTrOolx2kd8EkJUGp+3LVC3eSuXWyGi/Dw=;
 b=FtPBTK1+pnb0aODeJ/i0Mj1y2G+co1/ZQFXEsU0wuINKudjuMthWNugWziLBc3khNbHz9xKP1a+ZjdaswZno/J2HYaG76iX0rvEhsSRW2yCgLkIZPlI9TsyjOhALDkJtU33u3EK8w+QdB60NMj9+7xvUMT0BIyWsIgk3X7gtAwKmscFooAhy3A/cEq7srnc8OXgV7K2q8LE8WSNtsTh/MG+orc2BiMNMJp/35+WY99/KEoofsuqq5kw4BZvBcwKv+fRgD3/HKQ4vksuPhzBkZtKAquzLzctSwIkYycAu0qDH3YBZYsfXfxRNpHjzQAvak4sulX8y7TewcVC+WRNrKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJzuLp3z3fTrOolx2kd8EkJUGp+3LVC3eSuXWyGi/Dw=;
 b=DanmRuiororg+dpTLTzRuXabmOol15hIJhfqd5Iyq7qjGaM6WkLGUbR/EP5WM3d4yNFeCUkY/UmOL1xaGgilBAc5dqBm3iicDAxQk6uxS9U70Yy1fADbFZ6/sPnOPj/wsVUvLlW99SK/i/nwQKyetMAl3SQaXzemDtHNXz4fYCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 SN2PR01MB1967.prod.exchangelabs.com (2603:10b6:804:c::15) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Thu, 17 Mar 2022 08:30:45 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::cd24:39ed:7042:46d6%8]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:30:45 +0000
Message-ID: <569f50d5-8f13-280e-b944-6e26d95dc50b@os.amperecomputing.com>
Date: Thu, 17 Mar 2022 15:30:32 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: minyard@acm.org
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-2-quan@os.amperecomputing.com>
 <20220311011942.GX3457@minyard.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220311011942.GX3457@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a521d4f4-bedf-4ea2-27a6-08da07f06dfd
X-MS-TrafficTypeDiagnostic: SN2PR01MB1967:EE_
X-Microsoft-Antispam-PRVS: <SN2PR01MB19677C5ECF5D77B7F7D130D2F2129@SN2PR01MB1967.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLIwLgN5UIiWHls5d3o3oMRn7Qi5Ze6x93WZT6WsjB4L/2N08YnkoJ2fl0DZjV7DWQUeHbQeUAlbJxG63HdcBzEZhWf5utAgO/qJ79b2a4o/uiROs9G8v8knBTFAfB9cSOhZer74pA7Ve3g6LnOl5FfWq5dsfHxKgliflQhEbNudFPknaBwc1oC8/rAlR2oeysVc13T7K2O8IzAl7wtubRXJ7xBZk1gq5OKGD8kqq6s+wt+iBBmlQnYtpOAY2EVvPdepG2ulOcZi210W+Nheams3OtdBlQ8yvukT5oS0YO+caNAw+JUTpmQU7KvuxWa023GN+Z77fiemYLuf9HhXOLpk1sivbYTsVfmX89RHsAKqpL1qwR5FdyBGbc/DtkUMJINhKO9A5YTPc6EsWRekUID5fr4CgIG3o/8rDq5FFH5gzCmDg1yA58BFoEmczGSqRYlrbYzmC0j4SWAegUw/FIxWHP8uWKNJtc7bxTJYGiLNCof7SdomIhwAsLjS/QJvMleTxJzk2a2BSbvoEnwXerABIJ1WMZ9uI3vQaUeYysRX7PE6hM3bipbt6P6B0rdwucUhnxEtIYaZDAALvrTpQjDZK/pyhzGCCwuLJNU1xlVSO8bANNnS0+sUXLj9xedMRgoR1RpDacV6+0+KopXPJD55traq01ishQrpRuWleaiSXQ8KEFtfnHbQSAn5luZeCO52v+egOe8KC4+14cFjplCoQva9jusdM4mPjRlOqE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(7416002)(107886003)(52116002)(6666004)(6512007)(53546011)(6506007)(55236004)(6486002)(2616005)(508600001)(186003)(26005)(30864003)(8936002)(316002)(6916009)(38350700002)(38100700002)(8676002)(4326008)(5660300002)(66946007)(66556008)(66476007)(31686004)(86362001)(31696002)(54906003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5lem15TldFOUo0Nm5zT0tTellDVzhBeEtHRVo5Z3p2U0pZZ3B4TG9MNzhv?=
 =?utf-8?B?L1cybC9Jd2lDNXB6djZMbmhMdU9tRTQyQlRNRStoNUpNVitFSUx3T282YS9Q?=
 =?utf-8?B?VHFBRlU5M1E3VjBTWXgycitCV2JkRXEwWVNHZUdEQ2xxRXE0K1hFZU43aU52?=
 =?utf-8?B?N29CemY2bStGSm1qUEdHY3puNEZKUkUvdFFTNmlFT0pRMUQ0WWpkelJwYVdX?=
 =?utf-8?B?UjRvUmxYUHhhZlR5cENNSXZQeVlndjNsSzEwcWZwbExXNzFIUDBaOGxNQnJh?=
 =?utf-8?B?bWN2NUViNTRZNFE1cTB4dVkvSXpHN1dmczkxbDlGVTJIZklIajhWc1pGdk4w?=
 =?utf-8?B?M0pxMGJxRHpaSktIWlk0VGs1MWQxQTFOeWtlaURmVWs1WURPRjkwQjhWZ0x3?=
 =?utf-8?B?aG1zTVFucXcvbFhXV1NVdHlTSFZ2ekVTQ01BMXFrV000Y2ZIRWlYbXFSNEFp?=
 =?utf-8?B?VlZLeGlYeTJYQUhtR2o2d0FUK0FDU0JBRlVjUnE0QTJMdW1BeWNQYVd0SC84?=
 =?utf-8?B?b0VpbUZ0U1Yrb0dBN3Z2UXVyQk43QkdXeUI2RGRDWmcrY0RNNHRYSFkrbXVI?=
 =?utf-8?B?d3k2OVFUUnVRUnpPT2hSMzVQNkFtOEQrNm92LzBBZTM5OGxGSmVOVmoxRlY0?=
 =?utf-8?B?L2RWM240T0hUTWczNWtVWkp0V2thbTMzMW9XYmRWTlBpcHhaUjlRNWxmWU9k?=
 =?utf-8?B?dWwxMEozUG5DSzloVVRIdXRVOUJ1UXdWM0MzMTlpRkxHS3FmZ0FIOER5RUdz?=
 =?utf-8?B?L0JPZnVRcWxHdHVUQlJiazBtdDRubDA4T0F5QkQrdHVqNGhOcThtcGJ5cjJs?=
 =?utf-8?B?dHFKQUJCaGVPM0tVSzNQZmtDWjZMd3lvZUhsOEJFbFBUWXN0V3VEVS8zQ2s5?=
 =?utf-8?B?WkhLNlJMNU8yYUgvU215VHBQSXduVlc3bjR1c2FSL2tnK09sZ1VxaW5UYkpQ?=
 =?utf-8?B?SVBYbCtJcXY0VXN3dlo4VVo1aFFRZCtnMTQvdEZKOXJtWTRKcEFGNlNIUkxV?=
 =?utf-8?B?UzFGUitWcUdsRk5VWjRSRGl5ZGJYU2wxTFd2cG9IZmoxRTNJcXpyMUlIS05L?=
 =?utf-8?B?OW9GSEZXT1dBV3BhZGYwVTl1SEhiWTdMZlpTWnRNc0szemRib3NJTC9jUVVJ?=
 =?utf-8?B?WmEwWXV3TVd2Q0dIMjJXYU5TZDlwVzcrbGtSaE16WDN5SngxTTdxdmUvOXV4?=
 =?utf-8?B?WVlDNXBsUVR1R3FDeGFqM1BKZTAwYUM4SXZubUJMeHRTdVZUTllUQUk2ZlRi?=
 =?utf-8?B?eXE5bHJ2ZU45bUNqWlVOT0ZJZFROd3ROWEZHOXN1NmlZNTZ6MmhhVi8yYVRq?=
 =?utf-8?B?WkJWRDZWZ0ZMQXBpaEJzdFlCTTBZenlseXQwbjl2cGhuZDZoMDlqeFV2YWRx?=
 =?utf-8?B?ZzV6UFlpVGtiT1pVcWdkdmRkMnFGcUVYSkZab0ZYSzFieGZYSU1qWUNWR3NM?=
 =?utf-8?B?NFRLdlo2MXNxK3hUV1ljOStVNHdMU2hjM1UxSUwzUGxjUTU2WnBKUGZ6MmJB?=
 =?utf-8?B?aHl1d1R3ekJZWFZyQml6bXdDT0tRaWNrVW9CWm9peHpESHFiMm1jL21kODkv?=
 =?utf-8?B?RE5lZjJydnB0eTZVeXlPUC9UbWJycHg2QU5CbTA5RmEzUkJpaEw3UlZwQjhK?=
 =?utf-8?B?cVFpY0ltakdUeGd0Y0JlSWRPc3VESjVWaXZhNXl4Ny9aMTBxalUvcUVWU3dT?=
 =?utf-8?B?VHo5RjlZZU4vcGFRbE1ScEpPM0wra2tHNzR5QjBqcm1FSy9HWVZwcStDRE9X?=
 =?utf-8?B?d0hBbEZ5ZFZLd1JHVHhPZ1JieGtVc3hHd1YrS3Nvcyt1Vjh0aks2WjN2aGhp?=
 =?utf-8?B?ekloYXl5K21WTGE2YzNROExuTkY0RDc5S1BibEhZZWtEYmE1YXFMMzJ6SGRD?=
 =?utf-8?B?cSt3cXN2SW5OajJNTitCb1pKeEtocUMzUEVjR3hMcVBtNFNYSTlIeHgydndE?=
 =?utf-8?B?T0FNRGYvd2Vpc0RSOXplMzZjVHJNNHpQak9BSDVNT0JBVTR0WDhRbTNDMVdw?=
 =?utf-8?Q?9O+KveS7ImyJWCn+lzTXMOVTaLzGuk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a521d4f4-bedf-4ea2-27a6-08da07f06dfd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:30:44.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFKqhAGSL2NJQQmwFCHdsG89/pXqgpTfBKUlxYGUOiwXdVr0DRUnkvLfd7JwMJAMWzuO/Jdk5a/5d/B4Uw5IAZ9ao3PGjNugDBnuk+JmeN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR01MB1967
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/03/2022 08:19, Corey Minyard wrote:
> On Thu, Mar 10, 2022 at 06:41:16PM +0700, Quan Nguyen wrote:
>> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
>> in-band IPMI communication with their host in management (BMC) side.
> 
> Thanks for the update, and removing slave_enable().
> 
> I spent some quality time with this, and it looks like there are places
> where you don't check lengths before indexing arrays.  I've marked
> several of these, but you need to check it all through this.
> 
> I have a few other comments, too.
> 
Thank you for the comments, I put my comment inline below.
I'll scan the code and may put some extra fixes if any in next version.

> -corey
> 
>>
>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>> ---
>> v6:
>>    + Drop the use of slave_enable()                             [Wolfram]
>>    + Make i2c-aspeed to issue RxCmdLast command on all
>>    I2C_SLAVE_WRITE_REQUESTED event to assert NAK when slave busy   [Quan]
>>    + Make i2c slave to return -EBUSY when it's busy                [Quan]
>>    + Drop the aborting feature as return Completion Code 0xFF may stop
>>    host to retry and make ipmi_ssif.so fails to load               [Quan]
>>    + Add timer to recover slave from busy state when no response   [Quan]
>>    + Clean request/response buffer appropriately                   [Quan]
>>    + Add some minor change on error and warning messages           [Quan]
>>
>> v5:
>>    + None
>>
>> v4:
>>    + Send response with Completion code 0xFF when aborting         [Quan]
>>    + Added bounding check on SMBus writes and the whole request     [Dan]
>>    + Moved buffer to end of struct ssif_bmc_ctx to avoid context
>>      corruption if somehow buffer is written past the end           [Dan]
>>    + Return -EINVAL if userspace buffer too small, dont
>>      silence truncate                                       [Corey, Joel]
>>    + Not necessary to check NONBLOCK in lock                      [Corey]
>>    + Enforce one user at a time                                    [Joel]
>>    + Reject write with invalid response length from userspace     [Corey]
>>    + Add state machines for better ssif bmc state handling         [Quan]
>>    + Drop ssif_bmc_aspeed.c and make ssif_bmc.c is generic
>>      SSIF BMC driver                                               [Quan]
>>    + Change compatible string "aspeed,ast2500-ssif-bmc" to
>>      "ampere,ssif-bmc"                                             [Quan]
>>    + Abort current request with invalid SMBus write or
>>      invalid command                                               [Quan]
>>    + Abort all request if there is pending response                [Quan]
>>    + Changed validate_pec() to validate_request()                  [Quan]
>>    + Add unsupported_smbus_cmd() to handle unknown SMBus command   [Quan]
>>    + Print internal state string for ease investigating issue      [Quan]
>>    + Move to READY state on SLAVE_STOP event                       [Quan]
>>    + Change initilize_transfer() to process_smbus_cmd()            [Quan]
>>    + Introduce functions for each slave event                      [Quan]
>>
>> v3:
>>    + Removed redundant license info                                [Joel]
>>    + Switched to use traditional if-else                           [Joel]
>>    + Removed unused ssif_bmc_ioctl()                               [Joel]
>>    + Made handle_request()/complete_response() to return void      [Joel]
>>    + Refactored send_ssif_bmc_response() and
>>    receive_ssif_bmc_request()                                     [Corey]
>>    + Removed mutex                                                [Corey]
>>    + Use spin_lock/unlock_irqsave/restore in callback             [Corey]
>>    + Removed the unnecessary memset                               [Corey]
>>    + Switch to use dev_err()                                      [Corey]
>>
>> v2:
>>    + Fixed compiling error with COMPILE_TEST for arc
>>
>>   drivers/char/ipmi/Kconfig    |  11 +
>>   drivers/char/ipmi/Makefile   |   1 +
>>   drivers/char/ipmi/ssif_bmc.c | 791 +++++++++++++++++++++++++++++++++++
>>   drivers/char/ipmi/ssif_bmc.h | 102 +++++
>>   4 files changed, 905 insertions(+)
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.c
>>   create mode 100644 drivers/char/ipmi/ssif_bmc.h
>>
>> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
>> index b061e6b513ed..18a89093d64e 100644
>> --- a/drivers/char/ipmi/Kconfig
>> +++ b/drivers/char/ipmi/Kconfig
>> @@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
>>   	  found on Aspeed SOCs (AST2400 and AST2500). The driver
>>   	  implements the BMC side of the BT interface.
>>   
>> +config SSIF_IPMI_BMC
>> +	tristate "SSIF IPMI BMC driver"
>> +	select I2C
>> +	select I2C_SLAVE
>> +	help
>> +	  This enables the IPMI SMBus system interface (SSIF) at the
>> +	  management (BMC) side.
>> +
>> +	  The driver implements the BMC side of the SMBus system
>> +	  interface (SSIF).
>> +
>>   config IPMB_DEVICE_INTERFACE
>>   	tristate 'IPMB Interface handler'
>>   	depends on I2C
>> diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
>> index 7ce790efad92..cb6138b8ded9 100644
>> --- a/drivers/char/ipmi/Makefile
>> +++ b/drivers/char/ipmi/Makefile
>> @@ -30,3 +30,4 @@ obj-$(CONFIG_ASPEED_BT_IPMI_BMC) += bt-bmc.o
>>   obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
>>   obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
>>   obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
>> +obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
>> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
>> new file mode 100644
>> index 000000000000..62db97773654
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.c
>> @@ -0,0 +1,791 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + *
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/poll.h>
>> +#include <linux/sched.h>
>> +#include <linux/mutex.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/timer.h>
>> +#include <linux/jiffies.h>
>> +
>> +#include "ssif_bmc.h"
>> +
>> +static const char *state_to_string(enum ssif_state state)
>> +{
>> +	switch (state) {
>> +	case SSIF_READY:
>> +		return "SSIF_READY";
>> +	case SSIF_START:
>> +		return "SSIF_START";
>> +	case SSIF_SMBUS_CMD:
>> +		return "SSIF_SMBUS_CMD";
>> +	case SSIF_REQ_RECVING:
>> +		return "SSIF_REQ_RECVING";
>> +	case SSIF_RES_SENDING:
>> +		return "SSIF_RES_SENDING";
>> +	case SSIF_BAD_SMBUS:
>> +		return "SSIF_BAD_SMBUS";
>> +	default:
>> +		return "SSIF_STATE_UNKNOWN";
>> +	}
>> +}
>> +
>> +/* Handle SSIF message that will be sent to user */
>> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	struct ssif_msg msg;
>> +	unsigned long flags;
>> +	ssize_t ret;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	while (!ssif_bmc->request_available) {
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		if (file->f_flags & O_NONBLOCK)
>> +			return -EAGAIN;
>> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +					       ssif_bmc->request_available);
>> +		if (ret)
>> +			return ret;
>> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	}
>> +
>> +	if (count < min_t(ssize_t, ssif_msg_len(&ssif_bmc->request), sizeof(struct ssif_msg))) {
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		ret = -EINVAL;
>> +	} else {
>> +		count = min_t(ssize_t, ssif_msg_len(&ssif_bmc->request), sizeof(struct ssif_msg));
>> +		memcpy(&msg, &ssif_bmc->request, count);
>> +		ssif_bmc->request_available = false;
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +		ret = copy_to_user(buf, &msg, count);
>> +	}
>> +
>> +	return (ret < 0) ? ret : count;
>> +}
>> +
>> +/* Handle SSIF message that is written by user */
>> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
>> +			      loff_t *ppos)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	struct ssif_msg msg;
>> +	unsigned long flags;
>> +	ssize_t ret;
>> +
>> +	if (count > sizeof(struct ssif_msg))
>> +		return -EINVAL;
>> +
>> +	ret = copy_from_user(&msg, buf, count);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!msg.len || count < ssif_msg_len(&msg))
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	while (ssif_bmc->response_in_progress) {
>> +		spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +		if (file->f_flags & O_NONBLOCK)
>> +			return -EAGAIN;
>> +		ret = wait_event_interruptible(ssif_bmc->wait_queue,
>> +					       !ssif_bmc->response_in_progress);
>> +		if (ret)
>> +			return ret;
>> +		spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +	}
>> +
>> +	memcpy(&ssif_bmc->response, &msg, count);
>> +	ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= MAX_PAYLOAD_PER_TRANSACTION + 1);
>> +
>> +	ssif_bmc->response_in_progress = true;
>> +
>> +	/* ssif_bmc not busy */
>> +	ssif_bmc->busy = false;
>> +
>> +	if (ssif_bmc->response_timer_inited) {
>> +		del_timer(&ssif_bmc->response_timer);
>> +		ssif_bmc->response_timer_inited = false;
>> +	}
>> +	/* Clean old request buffer */
>> +	memset(&ssif_bmc->request, 0, sizeof(struct ssif_msg));
>> +
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +	return count;
>> +}
>> +
>> +static int ssif_bmc_open(struct inode *inode, struct file *file)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	int ret = 0;
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	if (!ssif_bmc->running)
>> +		ssif_bmc->running = 1;
>> +	else
>> +		ret = -EBUSY;
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +	unsigned int mask = 0;
>> +
>> +	poll_wait(file, &ssif_bmc->wait_queue, wait);
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	/* The request is available, userspace application can get the request */
>> +	if (ssif_bmc->request_available)
>> +		mask |= POLLIN;
>> +
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return mask;
>> +}
>> +
>> +static int ssif_bmc_release(struct inode *inode, struct file *file)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
>> +
>> +	spin_lock_irq(&ssif_bmc->lock);
>> +	ssif_bmc->running = 0;
>> +	spin_unlock_irq(&ssif_bmc->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * System calls to device interface for user apps
>> + */
>> +static const struct file_operations ssif_bmc_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.open		= ssif_bmc_open,
>> +	.read		= ssif_bmc_read,
>> +	.write		= ssif_bmc_write,
>> +	.release	= ssif_bmc_release,
>> +	.poll		= ssif_bmc_poll,
>> +};
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static void complete_response(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	/* Invalidate response in buffer to denote it having been sent. */
>> +	ssif_bmc->response.len = 0;
>> +	ssif_bmc->response_in_progress = false;
>> +	ssif_bmc->nbytes_processed = 0;
>> +	ssif_bmc->remain_len = 0;
>> +	ssif_bmc->busy = false;
>> +	memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);
>> +	wake_up_all(&ssif_bmc->wait_queue);
>> +}
>> +
>> +static void response_timeout(struct timer_list *t)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
>> +	unsigned long flags;
>> +
> 
> Is there a possible race here?  The timeout can happen at the same time
> as a received message, will something bad happen if that's the case?
> 

Thanks Corey,
I think I need extra comment here.

The purpose of this timeout is to make sure ssif_bmc will recover from 
busy state in case the upper stack does not provide the response.
Hence, the response timeout is set as 500ms, twice the time of max 
Request-to-Response in spec as the code below. Should it be longer?

As per spec, the max Request-to-Respose would not exceed 250ms.

I put the comment in ssif_bmc.h as below:
 >> +/*
 >> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
 >> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
 >> + * Recover ssif_bmc from busy state if it takes upto 500ms
 >> + */
 >> +#define RESPONSE_TIMEOUT			500 /* ms */


>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +
>> +	/* Recover ssif_bmc from busy */
>> +	ssif_bmc->busy = false;
>> +	del_timer(&ssif_bmc->response_timer);
> 
> You don't need to delete the timer, it's in the timeout.
> 

Will remove this redundant code in next version

>> +	ssif_bmc->response_timer_inited = false;
>> +
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +}
>> +
>> +/* Called with ssif_bmc->lock held. */
>> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	/* set ssif_bmc to busy waiting for response */
>> +	ssif_bmc->busy = true;
>> +
>> +	/* Request message is available to process */
>> +	ssif_bmc->request_available = true;
>> +
>> +	/* Clean old response buffer */
>> +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
>> +
>> +	/* This is the new READ request.*/
>> +	wake_up_all(&ssif_bmc->wait_queue);
>> +
>> +	/* Armed timer to recover slave from busy state in case of no response */
>> +	if (!ssif_bmc->response_timer_inited) {
>> +		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
>> +		ssif_bmc->response_timer_inited = true;
>> +	}
>> +	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
>> +}
>> +
>> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	u8 response_len = 0;
>> +	int idx = 0;
>> +	u8 data_len;
>> +
>> +	data_len = ssif_bmc->response.len;
>> +	switch (ssif_bmc->smbus_cmd) {
>> +	case SSIF_IPMI_MULTIPART_READ_START:
>> +		/*
>> +		 * Read Start length is 32 bytes.
>> +		 * Read Start transfer first 30 bytes of IPMI response
>> +		 * and 2 special code 0x00, 0x01.
>> +		 */
>> +		*val = MAX_PAYLOAD_PER_TRANSACTION;
>> +		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
>> +		ssif_bmc->block_num = 0;
> 
> Do you need to validate the data length before using this?
> This applies for lots of places through here.
> 

set_multipart_response_buffer() is called only when ->is_singlepart_read 
is false, which is determined by the below code under the *_write()

ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <= 
MAX_PAYLOAD_PER_TRANSACTION + 1);

So, I think the len is validated and could be use in this functions.

>> +
>> +		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
>> +		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
>> +
>> +		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
>> +
>> +		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
>> +		       response_len);
>> +		break;
>> +
>> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>> +		/*
>> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
>> +		 * IPMI data plus block number byte.
>> +		 */
>> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
>> +			/*
>> +			 * This is READ End message
>> +			 *  Return length is the remaining response data length
>> +			 *  plus block number
>> +			 *  Block number 0xFF is to indicate this is last message
>> +			 *
>> +			 */
>> +			*val = ssif_bmc->remain_len + 1;
>> +			ssif_bmc->block_num = 0xFF;
>> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
>> +			response_len = ssif_bmc->remain_len;
>> +			/* Clean the buffer */
>> +			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
>> +		} else {
>> +			/*
>> +			 * This is READ Middle message
>> +			 *  Response length is the maximum SMBUS transfer length
>> +			 *  Block number byte is incremented
>> +			 * Return length is maximum SMBUS transfer length
>> +			 */
>> +			*val = MAX_PAYLOAD_PER_TRANSACTION;
>> +			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>> +			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
>> +			ssif_bmc->block_num++;
>> +		}
>> +
>> +		memcpy(&ssif_bmc->response_buf[idx],
>> +		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
>> +		       response_len);
>> +		break;
>> +
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev,
>> +			"%s: Unexpected SMBus command 0x%x\n",
>> +			__func__, ssif_bmc->smbus_cmd);
>> +		break;
>> +	}
>> +
>> +	ssif_bmc->nbytes_processed += response_len;
>> +}
>> +
>> +/* Process the IPMI response that will be read by master */
>> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	u8 *buf;
>> +	u8 pec_len, addr, len;
>> +	u8 pec = 0;
>> +
>> +	pec_len = ssif_bmc->pec_support ? 1 : 0;
>> +	/* PEC - Start Read Address */
>> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +	pec = i2c_smbus_pec(pec, &addr, 1);
>> +	/* PEC - SSIF Command */
>> +	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
>> +	/* PEC - Restart Write Address */
>> +	addr = addr | 0x01;
>> +	pec = i2c_smbus_pec(pec, &addr, 1);
>> +
>> +	if (ssif_bmc->is_singlepart_read) {
>> +		/* Single-part Read processing */
>> +		buf = (u8 *)&ssif_bmc->response;
>> +
>> +		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
>> +			ssif_bmc->msg_idx++;
>> +			*val = buf[ssif_bmc->msg_idx];
>> +		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
>> +			ssif_bmc->msg_idx++;
>> +			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
>> +		} else {
> 
> I thought for a second that this was wrong, but I think it's correct.
> Supply zero if you don't have data.
> 
>> +			*val = 0;
>> +		}
>> +		/* Invalidate response buffer to denote it is sent */
>> +		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
>> +			complete_response(ssif_bmc);
>> +	} else {
>> +		/* Multi-part Read processing */
> 
> You don't check the length here like you did above.  I think that's
> required.
> 

As per my explanation above, the ->is_singlepart_read is determined by 
testing the length, so it is validated as I assumed.

>> +		switch (ssif_bmc->smbus_cmd) {
>> +		case SSIF_IPMI_MULTIPART_READ_START:
>> +		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>> +			buf = (u8 *)&ssif_bmc->response_buf;
>> +			*val = buf[ssif_bmc->msg_idx];
>> +			ssif_bmc->msg_idx++;
>> +			break;
>> +		default:
>> +			/* Do not expect to go to this case */
>> +			dev_err(&ssif_bmc->client->dev,
>> +				"%s: Unexpected SMBus command 0x%x\n",
>> +				__func__, ssif_bmc->smbus_cmd);
>> +			break;
>> +		}
>> +
>> +		len = (ssif_bmc->block_num == 0xFF) ?
>> +		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
>> +		if (ssif_bmc->msg_idx == (len + 1)) {
>> +			pec = i2c_smbus_pec(pec, &len, 1);
>> +			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
>> +		}
>> +		/* Invalidate response buffer to denote last response is sent */
>> +		if (ssif_bmc->block_num == 0xFF &&
>> +		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
>> +			complete_response(ssif_bmc);
>> +		}
>> +	}
>> +}
>> +
>> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	u8 *buf = (u8 *)&ssif_bmc->request;
>> +
>> +	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
>> +		return;
>> +
>> +	switch (ssif_bmc->smbus_cmd) {
>> +	case SSIF_IPMI_SINGLEPART_WRITE:
>> +		buf[ssif_bmc->msg_idx - 1] = *val;
>> +		ssif_bmc->msg_idx++;
>> +
>> +		break;
>> +	case SSIF_IPMI_MULTIPART_WRITE_START:
>> +		if (ssif_bmc->msg_idx == 1)
>> +			ssif_bmc->request.len = 0;
>> +
>> +		fallthrough;
>> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
>> +		/* The len should always be 32 */
>> +		if (ssif_bmc->msg_idx == 1 && *val != MAX_PAYLOAD_PER_TRANSACTION)
>> +			dev_warn(&ssif_bmc->client->dev,
>> +				 "Warn: Invalid Multipart Write len");
>> +
>> +		fallthrough;
>> +	case SSIF_IPMI_MULTIPART_WRITE_END:
>> +		/* Multi-part write, 2nd byte received is length */
>> +		if (ssif_bmc->msg_idx == 1) {
>> +			if (*val > MAX_PAYLOAD_PER_TRANSACTION)
>> +				dev_warn(&ssif_bmc->client->dev,
>> +					 "Warn: Invalid Multipart Write End len");
>> +
>> +			ssif_bmc->request.len += *val;
>> +			ssif_bmc->recv_len = *val;
>> +
>> +			/* request len should never exceeded 255 bytes */
>> +			if (ssif_bmc->request.len > 255)
>> +				dev_warn(&ssif_bmc->client->dev,
>> +					 "Warn: Invalid request len");
>> +
>> +		} else {
> 
> You check msg_idx above, but I'm not sure that check will cover this
> operation.
> 
That check is to make sure the length (*val) must always be strictly 32 
bytes in case of MULTIPART_WRITE_START/MIDDLE. And this check allows the 
length is up to 32 bytes in MULTIPART_WRITE_END.

>> +			buf[ssif_bmc->msg_idx - 1 +
>> +			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
>> +		}
>> +
>> +		ssif_bmc->msg_idx++;
>> +
>> +		break;
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev,
>> +			"%s: Unexpected SMBus command 0x%x\n",
>> +			__func__, ssif_bmc->smbus_cmd);
>> +		break;
>> +	}
>> +}
>> +
>> +static bool validate_request(struct ssif_bmc_ctx *ssif_bmc)
>> +{
>> +	u8 rpec = 0, cpec = 0;
>> +	bool ret = true;
>> +	u8 addr, index;
>> +	u8 *buf;
>> +
> 
> Is there any length validation for using buf below?  It looks like you
> are accessing without checking length, but maybe I missed something.
> 

Yes, there is length testing for each part before using buf to calculate 
PEC as in the "if" below.

>> +	buf = (u8 *)&ssif_bmc->request;
>> +	switch (ssif_bmc->smbus_cmd) {
>> +	case SSIF_IPMI_SINGLEPART_WRITE:
>> +		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
>> +			/* PEC is not included */
>> +			ssif_bmc->pec_support = false;
>> +			ret = true;
>> +			goto exit;
>> +		}
>> +
>> +		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
>> +			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
>> +				ssif_msg_len(&ssif_bmc->request));
>> +			ret = false;
>> +			goto exit;
>> +		}
>> +
>> +		/* PEC is included */
>> +		ssif_bmc->pec_support = true;
>> +		rpec = buf[ssif_bmc->msg_idx - 2];
>> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
>> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
>> +		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
>> +		if (rpec != cpec) {
>> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
>> +			ret = false;
>> +		}
>> +
>> +		break;
>> +	case SSIF_IPMI_MULTIPART_WRITE_START:
>> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
>> +	case SSIF_IPMI_MULTIPART_WRITE_END:
>> +		index = ssif_bmc->request.len - ssif_bmc->recv_len;
>> +		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
>> +			/* PEC is not included */
>> +			ssif_bmc->pec_support = false;
>> +			ret = true;
>> +			goto exit;
>> +		}
>> +
>> +		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
>> +			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
>> +				ssif_msg_len(&ssif_bmc->request));
>> +			ret = false;
>> +			goto exit;
>> +		}
>> +
>> +		/* PEC is included */
>> +		ssif_bmc->pec_support = true;
>> +		rpec = buf[ssif_bmc->msg_idx - 2 + index];
>> +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>> +		cpec = i2c_smbus_pec(cpec, &addr, 1);
>> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
>> +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);
> 
> Just curious, I'm not sure the client side PEC in the Linux driver has
> ever been validated.  Have you tested both sides?
> 

Yes, we found that request from host has an extra byte for PEC and that 
is why we added PEC support.

>> +		/* As SMBus specification does not allow the length
>> +		 * (byte count) in the Write-Block protocol to be zero.
>> +		 * Therefore, it is illegal to have the last Middle
>> +		 * transaction in the sequence carry 32-byte and have
>> +		 * a length of ‘0’ in the End transaction.
>> +		 * But some users may try to use this way and we should
>> +		 * prevent ssif_bmc driver broken in this case.
>> +		 */
>> +		if (ssif_bmc->recv_len != 0)
>> +			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
>> +
>> +		if (rpec != cpec) {
>> +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
>> +			ret = false;
>> +		}
>> +
>> +		break;
>> +	default:
>> +		/* Do not expect to go to this case */
>> +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
>> +			__func__, ssif_bmc->smbus_cmd);
>> +		ret = false;
>> +		break;
>> +	}
>> +
>> +exit:
>> +	return ret;
>> +}
>> +
> 
> Just a nit, more a general coding style comment.  It's almost always a
> bad idea to put a negative (unsupported) into a check function.  You
> often end up with something like:
> 
> 	if (!unsupported_smbus_cmd(c))....
> 
> which looks a little strange.  Double negatives can make it hard to
> follow and lead to mistakes.  This one isn't too bad, but sometimes it
> can be.  It's better to do:
> 
> 	if (supported_smbus_cmd(c))....
> or
> 	if (!supported_smbus_cmd(c))....
> 
> 

Thanks, Corey. I'll try to refactor this part in next version.

>> +static bool unsupported_smbus_cmd(u8 cmd)
>> +{
>> +	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
>> +	    cmd == SSIF_IPMI_SINGLEPART_WRITE ||
>> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
>> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
>> +	    cmd == SSIF_IPMI_MULTIPART_WRITE_END ||
>> +	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
>> +	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	/* SMBUS command can vary (single or multi-part) */
>> +	ssif_bmc->smbus_cmd = *val;
>> +	ssif_bmc->msg_idx++;
>> +
>> +	if (unsupported_smbus_cmd(*val))
>> +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus command");
>> +
>> +	if (*val == SSIF_IPMI_SINGLEPART_WRITE ||
>> +	    *val == SSIF_IPMI_MULTIPART_WRITE_START) {
>> +		/*
>> +		 * The response maybe not come in-time, causing host SSIF driver
>> +		 * to timeout and resend a new request. In such case check for
>> +		 * pending response and clear it
>> +		 */
>> +		if (ssif_bmc->response_in_progress)
>> +			complete_response(ssif_bmc);
>> +	}
>> +}
>> +
>> +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_START ||
>> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
>> +	    ssif_bmc->state == SSIF_RES_SENDING) {
>> +		ssif_bmc->state = SSIF_BAD_SMBUS;
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +
>> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		ssif_bmc->state = SSIF_RES_SENDING;
>> +	}
>> +
>> +	ssif_bmc->msg_idx = 0;
>> +	if (ssif_bmc->is_singlepart_read)
>> +		*val = ssif_bmc->response.len;
>> +	else
>> +		set_multipart_response_buffer(ssif_bmc, val);
>> +}
>> +
>> +static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_START ||
>> +	    ssif_bmc->state == SSIF_REQ_RECVING ||
>> +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_BAD_SMBUS;
>> +	}
>> +
>> +	handle_read_processed(ssif_bmc, val);
>> +}
>> +
>> +static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	ssif_bmc->msg_idx = 0;
>> +
>> +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		ssif_bmc->state = SSIF_START;
>> +
>> +	} else if (ssif_bmc->state == SSIF_START ||
>> +		   ssif_bmc->state == SSIF_REQ_RECVING ||
>> +		   ssif_bmc->state == SSIF_RES_SENDING) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_BAD_SMBUS;
>> +	}
>> +}
>> +
>> +static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_RES_SENDING) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +		ssif_bmc->state = SSIF_BAD_SMBUS;
>> +	} else if (ssif_bmc->state == SSIF_START) {
>> +		ssif_bmc->state = SSIF_SMBUS_CMD;
>> +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		ssif_bmc->state = SSIF_REQ_RECVING;
>> +	}
>> +
>> +	/* This is response sending state */
>> +	if (ssif_bmc->state == SSIF_REQ_RECVING)
>> +		handle_write_received(ssif_bmc, val);
>> +	else if (ssif_bmc->state == SSIF_SMBUS_CMD)
>> +		process_smbus_cmd(ssif_bmc, val);
>> +}
>> +
>> +static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>> +{
>> +	if (ssif_bmc->state == SSIF_READY ||
>> +	    ssif_bmc->state == SSIF_START ||
>> +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +
>> +	} else if (ssif_bmc->state == SSIF_BAD_SMBUS) {
>> +		dev_warn(&ssif_bmc->client->dev,
>> +			 "Warn: %s received SLAVE STOP from bad state=%s\n",
>> +			 __func__, state_to_string(ssif_bmc->state));
>> +
>> +	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
>> +		/* A BMC that receives an invalid request drop the data for the write
>> +		 * transaction and any further transactions (read or write) until
>> +		 * the next valid read or write Start transaction is received
>> +		 */
>> +		if (!validate_request(ssif_bmc))
>> +			dev_err(&ssif_bmc->client->dev, "Error: invalid pec\n");
>> +		else if (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
>> +			 ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END)
>> +			handle_request(ssif_bmc);
>> +	}
>> +
>> +	ssif_bmc->state = SSIF_READY;
>> +	/* Reset message index */
>> +	ssif_bmc->msg_idx = 0;
>> +}
>> +
>> +/*
>> + * Callback function to handle I2C slave events
>> + */
>> +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
>> +{
>> +	unsigned long flags;
>> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
>> +	int ret = 0;
>> +
>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>> +
>> +	switch (event) {
>> +	case I2C_SLAVE_READ_REQUESTED:
>> +		on_read_requested_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_WRITE_REQUESTED:
>> +		on_write_requested_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_READ_PROCESSED:
>> +		on_read_processed_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_WRITE_RECEIVED:
>> +		on_write_received_event(ssif_bmc, val);
>> +		break;
>> +
>> +	case I2C_SLAVE_STOP:
>> +		on_stop_event(ssif_bmc, val);
>> +		break;
>> +
>> +	default:
>> +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event\n");
>> +		break;
>> +	}
>> +
>> +	if (ssif_bmc->busy)
>> +		ret = -EBUSY;
>> +
>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc;
>> +	int ret;
>> +
>> +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
>> +	if (!ssif_bmc)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&ssif_bmc->lock);
>> +
>> +	init_waitqueue_head(&ssif_bmc->wait_queue);
>> +	ssif_bmc->request_available = false;
>> +	ssif_bmc->response_in_progress = false;
>> +	ssif_bmc->busy = false;
>> +	ssif_bmc->response_timer_inited = false;
>> +
>> +	/* Register misc device interface */
>> +	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
>> +	ssif_bmc->miscdev.name = DEVICE_NAME;
>> +	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
>> +	ssif_bmc->miscdev.parent = &client->dev;
>> +	ret = misc_register(&ssif_bmc->miscdev);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ssif_bmc->client = client;
>> +	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
>> +
>> +	/* Register I2C slave */
>> +	i2c_set_clientdata(client, ssif_bmc);
>> +	ret = i2c_slave_register(client, ssif_bmc_cb);
>> +	if (ret) {
>> +		misc_deregister(&ssif_bmc->miscdev);
>> +		goto out;
>> +	}
>> +
>> +	return 0;
>> +out:
>> +	devm_kfree(&client->dev, ssif_bmc);
>> +	return ret;
>> +}
>> +
>> +static int ssif_bmc_remove(struct i2c_client *client)
>> +{
>> +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
>> +
>> +	i2c_slave_unregister(client);
>> +	misc_deregister(&ssif_bmc->miscdev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ssif_bmc_match[] = {
>> +	{ .compatible = "ampere,ssif-bmc" },
>> +	{ },
>> +};
>> +
>> +static const struct i2c_device_id ssif_bmc_id[] = {
>> +	{ DEVICE_NAME, 0 },
>> +	{ },
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
>> +
>> +static struct i2c_driver ssif_bmc_driver = {
>> +	.driver         = {
>> +		.name           = DEVICE_NAME,
>> +		.of_match_table = ssif_bmc_match,
>> +	},
>> +	.probe          = ssif_bmc_probe,
>> +	.remove         = ssif_bmc_remove,
>> +	.id_table       = ssif_bmc_id,
>> +};
>> +
>> +module_i2c_driver(ssif_bmc_driver);
>> +
>> +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
>> +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
>> +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
>> new file mode 100644
>> index 000000000000..9a26f3c252cc
>> --- /dev/null
>> +++ b/drivers/char/ipmi/ssif_bmc.h
>> @@ -0,0 +1,102 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * The driver for BMC side of SSIF interface
>> + *
>> + * Copyright (c) 2022, Ampere Computing LLC
>> + *
>> + */
>> +#ifndef __SSIF_BMC_H__
>> +#define __SSIF_BMC_H__
>> +
>> +#define DEVICE_NAME				"ipmi-ssif-host"
>> +
>> +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
>> +
>> +/* A standard SMBus Transaction is limited to 32 data bytes */
>> +#define MAX_PAYLOAD_PER_TRANSACTION		32
>> +
>> +#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
>> +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
>> +
>> +#define SSIF_IPMI_SINGLEPART_WRITE		0x2
>> +#define SSIF_IPMI_SINGLEPART_READ		0x3
>> +#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
>> +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
>> +#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
>> +#define SSIF_IPMI_MULTIPART_READ_START		0x3
>> +#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
>> +
>> +#define MSG_PAYLOAD_LEN_MAX			252
>> +/*
>> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
>> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
>> + * Recover ssif_bmc from busy state if it takes upto 500ms
>> + */
>> +#define RESPONSE_TIMEOUT			500 /* ms */
>> +
>> +struct ssif_msg {
>> +	u8 len;
>> +	u8 netfn_lun;
>> +	u8 cmd;
>> +	u8 payload[MSG_PAYLOAD_LEN_MAX];
>> +} __packed;
>> +
>> +static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
>> +{
>> +	return ssif_msg->len + 1;
>> +}
>> +
>> +/*
>> + * SSIF internal states:
>> + *   SSIF_READY         0x00 : Ready state
>> + *   SSIF_START         0x01 : Start smbus transaction
>> + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
>> + *   SSIF_REQ_RECVING   0x03 : Receiving request
>> + *   SSIF_RES_SENDING   0x04 : Sending response
>> + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
>> + */
>> +enum ssif_state {
>> +	SSIF_READY,
>> +	SSIF_START,
>> +	SSIF_SMBUS_CMD,
>> +	SSIF_REQ_RECVING,
>> +	SSIF_RES_SENDING,
>> +	SSIF_BAD_SMBUS,
>> +	SSIF_STATE_MAX
>> +};
>> +
>> +struct ssif_bmc_ctx {
>> +	struct i2c_client	*client;
>> +	struct miscdevice	miscdev;
>> +	size_t			msg_idx;
>> +	bool			pec_support;
>> +	/* ssif bmc spinlock */
>> +	spinlock_t		lock;
>> +	wait_queue_head_t	wait_queue;
>> +	u8			running;
>> +	enum ssif_state		state;
>> +	u8			smbus_cmd;
>> +	/* Timeout waiting for response */
>> +	struct timer_list	response_timer;
>> +	bool                    response_timer_inited;
>> +	/* Flag to identify a Multi-part Read Transaction */
>> +	bool			is_singlepart_read;
>> +	u8			nbytes_processed;
>> +	u8			remain_len;
>> +	u8			recv_len;
>> +	/* Block Number of a Multi-part Read Transaction */
>> +	u8			block_num;
>> +	bool			request_available;
>> +	bool			response_in_progress;
>> +	bool			busy;
>> +	/* Response buffer for Multi-part Read Transaction */
>> +	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
>> +	struct ssif_msg		response;
>> +	struct ssif_msg		request;
>> +};
>> +
>> +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
>> +{
>> +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
>> +}
>> +#endif /* __SSIF_BMC_H__ */
>> -- 
>> 2.35.1
>>
>>
