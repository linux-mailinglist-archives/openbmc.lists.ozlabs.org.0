Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321250C493
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 01:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlVmk0RSmz3bbk
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 09:22:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=AKASfrCi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe59::70f;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=AKASfrCi; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlVmC5j3Qz2yph
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 09:21:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3q1reVAaBujqbP/J/FdlrhflvG0FWrVUwtixWUY83nchLHta27yJyJeZGy/xAaXTI4x0hkHTqYE6wQdk0NEcfNf0s7w0BL7Lp4KBsW4prQcjcZwFkSPinDRvBLiASuWW0CgMXPLlsJAH7BdaTv8AFqkPlxt006xSgBQPJVHxJVsj6ATL0ZVZyLMwt+u3J8Gc1270UZCd/VqcV9G1y3Wr1YW7mo/5i1JZ1gQXImzksJgIoIkcneRZtSRMB+p4aYJwmtKNF6wl4oh/GjqbFc2hyzJmf71shpiX07ImhYE2Byc4TuSr9IxHS6UdCTuH4fzc3pIUKb3NUM4CLBmejIIVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aONITpye+IeJr84qGlAJnqM+jRTCuMmdqzmJ+Qi8sLA=;
 b=Jl7ElWUgrYkhwWjlobVW+A5JJ0HA42BaxrxldOb2Kd/9801GRO4yjf9EVQtZY/l37XmMiPO+Avhij67ytK047sVMkTecdl0G5hqInQK+fPuCHX1Ay0q4CPmgJ/QtI2ENcw/5Xh57tcmBbS76OBBsHB7BUB6dNGhTjUHi+/n22wZr9UfPaR7/aJCkwlbqmBjE/A4nG4lXgPJpdrBwBWc06Wx+dtxHWgF3Zj9o4VgEGZ2QPv6j4HIULPXhqaBK0MKcYNhefd5nDMJnGiOc3b5Ft5JHoipNNtGwb9qLp7dYk/Dnnc4o4rTg+3jqcdQvtc8Z7BoMRk+xetgTioxggLHPeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aONITpye+IeJr84qGlAJnqM+jRTCuMmdqzmJ+Qi8sLA=;
 b=AKASfrCiHGPHw3IjRsTICcVEsqKBPPpjzt1YQyQKK1/p81OPyi4IBDHU5pSpUnD700S6jnMNS7Sa1okWoXZh0V441na/m5AgjvLjhO9PNNM5B3JhmgIp8sz097UMN80qwlIl7dn5bWLck7UWKIDFfQqQxBHgLGK7cxhbq0whNyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 CH0PR01MB7064.prod.exchangelabs.com (2603:10b6:610:10c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Fri, 22 Apr 2022 23:21:20 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::319b:4612:e6f4:f22c%3]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 23:21:19 +0000
Message-ID: <79357f23-443a-c3c9-f084-6db6dda60e92@os.amperecomputing.com>
Date: Sat, 23 Apr 2022 06:21:06 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
 <82a6452a-965b-7fbe-eba2-919f0a6ed73a@os.amperecomputing.com>
 <YmLCcFrrobUJtiLI@kroah.com>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <YmLCcFrrobUJtiLI@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0109.apcprd02.prod.outlook.com
 (2603:1096:4:92::25) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c38b247-4c30-4a5f-743c-08da24b6ce01
X-MS-TrafficTypeDiagnostic: CH0PR01MB7064:EE_
X-Microsoft-Antispam-PRVS: <CH0PR01MB70649E85B34821A1E23B5AC8F2F79@CH0PR01MB7064.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W3/0k/3KvWxu32wEOXRd0/Z802mwcD4HzDiXfQ1gtIMk61oLW18OPfbQfYxP2Im7mckYH4xy68UJ4uLIYQl9TsiOqrY8dByGRyM3n9qR8bev8XihcQXT97owhzeBmhqDXD8P1psoEyyx9ZFtb7lwStpQpTRwLHu90AdzM4ys2X3D8a9QFs0STQSSdgXwjyHfjYAAhFUI4HXOx+qR3MCDHYEyzjfMMrMEQKgYufGu6iolVKN3/hCC5R+gToyQkl3wp71fyHbNPEqUfVzwB36Jc5K6GgTO3yqJ9qnsGmNVJ0KlmeB03S4p3Rnpeq3uhyLSqJstEnGhTIOA4mai9z9HRo2/2kCqHm3hnAJYc5VtLTPY7X0s8rllC7igG1eHiBAXTgIXOPI+TVqptuOOR91X41nxsYbbC1Ld8MJ71IZ8NX5+XonzY6f8CYmEgVJHVr2D22E2TtlNdcIwk3ivc1bj/jPwdgglWsLVvL1hNZxOSUoeAwasMGRn50Fc+RrKJmepqETmLFgBjNnJE7ya6D2sBMlcr4MZ4DhPOYU/9FXmBH3kS30m+5qB+m6pd0s9s8+07gNXw8zaFeXsfRh7dbL0/AMqCVlLqPgC2JyFFvbJKLNxPCaR3nr+ax96cRWmeyYvp4tnHOt0U5o/L61AnXVY30KuUMywae/RIEoU4a7C26rMDjH3OVH4aVBUKVoClTG/yMX987LtSfazHPZk4i0/jTVregZ84kT9yxWekQtlaxk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(66476007)(66556008)(66946007)(6486002)(4326008)(2906002)(8936002)(7416002)(5660300002)(54906003)(186003)(2616005)(6916009)(26005)(107886003)(8676002)(6666004)(316002)(6506007)(6512007)(53546011)(83380400001)(52116002)(86362001)(31696002)(38100700002)(31686004)(38350700002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGwvNmpwQlpna2czWWdNOWVndDRJUGxRMlVoRUFsc0FvMjZXNVFqMnJGbEhB?=
 =?utf-8?B?MFFKZEhKZE9PckVPL09TVVYyU25qTUNXVUxxSDZScCtzeXdkSTFrckszWTZV?=
 =?utf-8?B?QmlqZk1SVWg1MVJYbzRnMHd6UlUvNVQ0SHU0dUxUdG1YaVd6SHpQblFaRUZK?=
 =?utf-8?B?VlhldURuSUNPTEVPYmoxRlAxSzRQYjhiMEVkS3dDNjhnYTZvZllScXdubnJ1?=
 =?utf-8?B?clREZFRNaHRZYVRCY01pcFNNWTU2OWsrUEE5ZlV6T3NJNHhXcllTL1ZQNStP?=
 =?utf-8?B?ZHlkM3FuNmFQTjRJTmQ1dVR2V3cwbFlkZytLajltK0RBc1VqY3h4aDlUdGVi?=
 =?utf-8?B?OHZaL3pNZmVZMVJZZDZzMnRVMTF5eDNROW11eUFRQU5vT0JLNlFBUDNjUGVC?=
 =?utf-8?B?eHNYTGJlSGV0bklPNFB3eU9Kb2src21mR1N1YUFDQmdVdG1xM1JsYXZsOWRJ?=
 =?utf-8?B?UzA4Vm5lcE5pM0xnQ0lWbnlrTWZhbFJLNTkrY25wZFVhQUgxcEdKbDVSL3M2?=
 =?utf-8?B?dlhkUDZ4SFBLUHNuVUdYUWt4Zlp2amxMUnRyeC9HUXlHTm5OVWlnVi9ZN2R2?=
 =?utf-8?B?QmQrMkdkRC82QU9PaW14MFNFRVdJT3FERThYTE5WZGs4QmhRbjRjNkE3NUFr?=
 =?utf-8?B?cXdJdDVzZVpUSTJZbDk2aHNmcGduai9zYXUvaTMrM2pPR0phRW9ESVdsT01L?=
 =?utf-8?B?R2hlNVJ4MkZlNzBHZ3cvTmVDbnQwWnVRanNzNkxjZGhtajRRdXkxZzA1cElq?=
 =?utf-8?B?Y2FSWXQ2RndaN05maFhXUSsvNHlEOExJY1hydWk1eXZZOW8zdjlDZVBKZDNW?=
 =?utf-8?B?eXVsTGlhMkFjdnN6elRMMkdTRmVxUnVtcEQ1TEhoSUpTSkVocTA1L3N1RXRI?=
 =?utf-8?B?OVBQNWxWUFFlZmNRYnVKdmo5Y1g2RjMvNjNmRHZmTTdTZEU0QU1hYVpxUEdz?=
 =?utf-8?B?MmRnNVMvYlowV3VWS2VmSC9OUHo4TTgyaGpSU1dyU0NNS0ZSNmhjUDFva0tK?=
 =?utf-8?B?UXNseEx1bVhSMnlCQVVDdkZ1VHF1RFVjdzVCekJSSG84L2xUM1RtNmpqZmF2?=
 =?utf-8?B?Si9yc2hoZ2lWR1V2WU1pcFBLNCtQeFp3aHBqRTR3NGlXSVlpOHc3UTJMWGlw?=
 =?utf-8?B?U2hsVG9BSkl1OXozWlQzdURtU2UyeHpXQXYwNGlyZzZMaUV6K1ZDMjlmTSto?=
 =?utf-8?B?NnBaUllIN2NNUkhXcEhVSVE5N3dGWVJlSVpBVmJPajkzQms0eFhVSWN5YURU?=
 =?utf-8?B?dkZIWjJPWGRiYWtIMTltK0p4c1AvVnp0TjMzODFlTk5Fc0NEa3ZvN3h4dGJ5?=
 =?utf-8?B?Z1dSZ0tKam8wOHRkOU5ka1JLbGRnUkRZQnJ5d09sM1RqSm9meXJMcjM5eVpQ?=
 =?utf-8?B?REFrdHVMczhyUnFmUGlsODlGOWpNZmQ0N1ZUSkFnQXYxL04zN2VEd04vNXIw?=
 =?utf-8?B?M0pHOXVsa29oTkFzL1d0Yk4venBsSHYxTWJMd2xxNURlMFZoeTdhbi9adHBZ?=
 =?utf-8?B?ME9XSXdxWVZmWWlvaUliUFFyMW9oS1BjallEUGwxN0lrdkdEQmEzTWVaN2Nh?=
 =?utf-8?B?N3BRTWpnY3hVOGcwc01TaEhFSExQRTdURHAyMTExY0dmR3lYaVhWUWFHN2R0?=
 =?utf-8?B?MUdVSXhCQ3JCU05BQTUrWUdMNnVFcnRycW1Sa3lDdjhxbWxxQXk1QXVtbHlw?=
 =?utf-8?B?VmFvcXVHSENoSzVZcHFXTlBHbkRkbU1ST0xRVkZyWnNiNG5FYjN0bkFEcGk2?=
 =?utf-8?B?SmZIMGIrQVgxL05EUmxDbDFVZENDRUtwMTVNY09hMVc0eXV3dk1PajJVR1Vi?=
 =?utf-8?B?UWJQYzlxRTBTdnduaXFkUHlpQ0xHT3BSeDBVNDl1aU91dEl1T3NwSnFWVU9M?=
 =?utf-8?B?ckt5YnYrMy9rK0tiaGpoNzVhQ2R1c2NaNi91dDNwK1BMWmthengrSE4rZjdW?=
 =?utf-8?B?TlJEcGtaUjFSQW9CdHRlYVdpaXBaMVRFRmdSdVJ3aXVVVHVZSXFHZVpORGQ2?=
 =?utf-8?B?U2NqQW5iOVVzMEM4Tm5QR1ZydkRFRDVkZXBVSWFYekN1TENJUkFRVUM3ZXp5?=
 =?utf-8?B?QnRWTDg5N0VSY25SeGRhTkR6MHFnbjgwOWNNd3pKU3MxWUN6RUo5TUFLSDZj?=
 =?utf-8?B?czhnelNMT3dWVEdvRS9oQkRLb0tKbHFZbTlwL0gwSitQSUhYK3JvR2gvZGNj?=
 =?utf-8?B?aGJaTmUrak1uU0tOTUE3dFJaVTd1K3M0UXc4ZVptYm9uclh5ZmlLaXN1SXBs?=
 =?utf-8?B?RVZDVnNFdGg0YVYvRUxUbVpKVmZJWHRaSDhkVC8yMFhnVUJQc1VCa0NSei81?=
 =?utf-8?B?K2tzMlJ0RjY2d2Q2clc3WjJCeHRDMUhwM3pUVjlPaW9rcUpEUXl5ZGM5bzFp?=
 =?utf-8?Q?VBfZHTcHBUEduv1f1XygWwGpQtwF8S0gM5VIZ?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c38b247-4c30-4a5f-743c-08da24b6ce01
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 23:21:19.1925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxfxtwRBoQl7a8Ahb0r9tJHaRBWKNFjprH/W2QxX3mvQoj91GPoDm+ttbfKNxFwNCSdAtgSEn4mk0H/4daNmD0dwLBpjw08V2g1XMAKICkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR01MB7064
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



On 22/04/2022 21:57, Greg Kroah-Hartman wrote:
> On Fri, Apr 22, 2022 at 09:43:39PM +0700, Quan Nguyen wrote:
>> On 22/04/2022 13:20, Greg Kroah-Hartman wrote:
>>> On Fri, Apr 22, 2022 at 09:46:47AM +0700, Quan Nguyen wrote:
>>>> This commit adds Ampere's SMpro error monitor driver for monitoring
>>>> and reporting RAS-related errors as reported by SMpro co-processor
>>>> found on Ampere's Altra processor family.
>>>>
>>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>>> ---
>>>> Changes in v8:
>>>>     + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
>>>>     + Avoid uninitialized variable use               [kernel test robot]
>>>>     + Switch to use sysfs_emit()                                  [Greg]
>>>>     + Make sysfs to return single value                           [Greg]
>>>>     + Change errors_* sysfs to error_*                            [Quan]
>>>>     + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
>>>>     overflow status of each type of HW errors                     [Quan]
>>>>     + Add some minor refactor                                     [Quan]
>>>>
>>>> Changes in v7:
>>>>     + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
>>>>     + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
>>>>     + Validate number of errors before read                       [Quan]
>>>>     + Fix wrong return type of *_show() function     [kernel test robot]
>>>>     + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
>>>>     + Use pointer instead of stack memory                         [Quan]
>>>>
>>>> Changes in v6:
>>>>     + First introduced in v6 [Quan]
>>>>
>>>>    drivers/misc/Kconfig        |  12 +
>>>>    drivers/misc/Makefile       |   1 +
>>>>    drivers/misc/smpro-errmon.c | 477 ++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 490 insertions(+)
>>>>    create mode 100644 drivers/misc/smpro-errmon.c
>>>>
>>>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>>>> index 41d2bb0ae23a..9fbe6797c440 100644
>>>> --- a/drivers/misc/Kconfig
>>>> +++ b/drivers/misc/Kconfig
>>>> @@ -176,6 +176,18 @@ config SGI_XP
>>>>    	  this feature will allow for direct communication between SSIs
>>>>    	  based on a network adapter and DMA messaging.
>>>> +config SMPRO_ERRMON
>>>> +	tristate "Ampere Computing SMPro error monitor driver"
>>>> +	depends on MFD_SMPRO || COMPILE_TEST
>>>> +	help
>>>> +	  Say Y here to get support for the SMpro error monitor function
>>>> +	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
>>>> +	  loading, the driver creates sysfs files which can be use to gather
>>>> +	  multiple HW error data reported via read and write system calls.
>>>> +
>>>> +	  To compile this driver as a module, say M here. The driver will be
>>>> +	  called smpro-errmon.
>>>> +
>>>>    config CS5535_MFGPT
>>>>    	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
>>>>    	depends on MFD_CS5535
>>>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>>>> index 70e800e9127f..483308a6e113 100644
>>>> --- a/drivers/misc/Makefile
>>>> +++ b/drivers/misc/Makefile
>>>> @@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
>>>>    obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
>>>>    obj-$(CONFIG_SGI_XP)		+= sgi-xp/
>>>>    obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
>>>> +obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
>>>>    obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
>>>>    obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
>>>>    obj-$(CONFIG_HP_ILO)		+= hpilo.o
>>>> diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
>>>> new file mode 100644
>>>> index 000000000000..df7d8fc4ff3f
>>>> --- /dev/null
>>>> +++ b/drivers/misc/smpro-errmon.c
>>>> @@ -0,0 +1,477 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>
>>> Are you sure you mean "or any later version"?  I have to ask.
>>>
>>
>> Thank Greg for the review.
>>
>> Will change all to SPDX-License-Identifier: GPL-2.0-or-later in next
>> version.
> 
> That is not what I am asking (the SPDX tag format).  I mean, do you
> really mean "or later" for your license as that is not the license of
> the kernel overall?  If so, wonderful, but I have to ask that as your
> legal group needs to be aware of it, sorry.
> 

Dear Greg,

My sincere thanks for bringing this up. This would need help from our 
legal team to recheck/review and will make appropriate change in my next 
version.

- Quan
