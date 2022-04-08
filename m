Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE384F8D29
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 06:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZQZS2Vg3z3bXy
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 14:41:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=GlzR3moQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:7e8d::731;
 helo=nam04-bn8-obe.outbound.protection.outlook.com;
 envelope-from=quan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=GlzR3moQ; 
 dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZQYx18NGz2xCC;
 Fri,  8 Apr 2022 14:41:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZFPUGIE1IV1XBwvOhoAJpvz71o4mQ2RIS6+fnmxIepj11IylaKfuv+PZAWYeCZ7vawYq0Tm/A0Q6EYyRl3SHQc6zJDybm1iCvXtKXObFpCidV2fmV22pVi5hGbFKWE/6rLVJsZB4ozM4xgxa3GKDOH3bmw5af8tyc+zf9vYdG+oqNosbCDSuCmGNY/mtI8HxWE4sZjFhGdXMX83ZtgyrHY+xYddZx4rMzQbZpwaGdpHwZJCY0VvmDNU+EJTbgCt3OU+015bKCE5GoTSXEfilFDJRHvk0miLZmiDgU3PjuQH4LbWfalx4lXtsdVV8wkEdK7P+5FgZQokSR1jkTDi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfL8xJCVIbLB53B+QJyM8NUM+E2lo2AYnMXMh56GvjU=;
 b=LGAaEOarW9d4uYtNsZeibODnnLqbjxWJh5ao8yUZpvfcY9SeG4fMTk2KoppUPDdu8rxIBz8PXURPcPESaqdB5r+KyIAOjnzt95E/54zrBK8CBn/NGyeimfwb6cHUKzbsf2KpiYLIGnf+fEQuDW9jJ8DyrgLJlKYJeLCzv1/wmuOh9MmjPcA89E23BD921nnRC/HuScVlNum4BCyZxXXTAefi0ZbvTeteOUsc2NdUzmaIa8fgC0pgN6VLqlexjdRlQN6l5xNt17k+dHVhc7jq1iNSNeVJtQ4a2rMir69vHUM5KeJUs0ANl+pzZ/HCXDSyGa9PB1YQ5AhYMNd6pPpQJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfL8xJCVIbLB53B+QJyM8NUM+E2lo2AYnMXMh56GvjU=;
 b=GlzR3moQnhqyyOejPF19gbIYn0Pl1l+0GgxXdtTbW8Wn1aEuXLke9AqmFxMINme5SQ0GErm65bjLsGTwAJGl9uTsQ5ZBFwcVVD31pLqYDGewhbON+Rhc3u4mXYyKipkODnjOsaXYoDemCvyDUu3GiaJloHTJ47YQta3Oc3WWSU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SJ0PR01MB7282.prod.exchangelabs.com (2603:10b6:a03:3f2::24) by
 DM6PR01MB4123.prod.exchangelabs.com (2603:10b6:5:22::26) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.30; Fri, 8 Apr 2022 04:41:00 +0000
Received: from SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::68f1:1dd2:fa3e:28be]) by SJ0PR01MB7282.prod.exchangelabs.com
 ([fe80::68f1:1dd2:fa3e:28be%3]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 04:41:00 +0000
Message-ID: <2552a9e2-ca37-c2d3-f636-da18a56bf32e@os.amperecomputing.com>
Date: Fri, 8 Apr 2022 11:40:47 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: minyard@acm.org
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-2-quan@os.amperecomputing.com>
 <20220311011942.GX3457@minyard.net>
 <569f50d5-8f13-280e-b944-6e26d95dc50b@os.amperecomputing.com>
 <20220317131356.GC3457@minyard.net>
From: Quan Nguyen <quan@os.amperecomputing.com>
In-Reply-To: <20220317131356.GC3457@minyard.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To SJ0PR01MB7282.prod.exchangelabs.com
 (2603:10b6:a03:3f2::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d958bdeb-01fa-4bd7-535d-08da1919fabf
X-MS-TrafficTypeDiagnostic: DM6PR01MB4123:EE_
X-Microsoft-Antispam-PRVS: <DM6PR01MB4123D72DF7CA327E0E3C5F0FF2E99@DM6PR01MB4123.prod.exchangelabs.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YO++buxVyiBDlwevWtFbv4XDAZM+vgfta62XwlfZjIEWRmdPe5RCB44t0vr+p10VY/o3nY0DzeyuQuWR1dZf+2tbyLrjnG1Bnkk5kRFxiZYIdkJ9O8hlgmQzEsE/ewLKwU0fFn6rUDb/OMoMFejJ6SvE6UmJt7n38ZJRHgKHepupoJoDuJq8AYWANj1mM4ig/+66Kn5RdS7orUmkZpVNOz3Lej6LnR9T5gRPQwIy4MzinFtPmCQfb948eXbpWzmyg5FIOGC5xvfYiem3lH95cV9z21ifUDBfNlC5y2PAb5w8IbP+jQxK3TRacilV+SjffxJHT4coQAW0qGRUgKMAAbL8/0gkfuIegbv/mib8Xyvt46z5KgSMU6TyP6eb9HFHNIgPtbwRWETW2EvxJHzFY4kvi/T4sRRPk2kDJsw+GJCnwFT7LIcbB1OglTR8EWCctFxYiPdS5PPMYMeGle/VY95QXkYeyr8L2iC3JBwDRBTZsBugwQaZeapHSd4rn/FEZApUHPAxtGsH/+zKCUKD9bisWhdv3o1MlV7DhhNbYd1Os1F0ohYSI1go7TSS5Vnr7VSHlQv9koN1vivQG44npizx/H4IIWeyLHDYMERh/6a/aegTRC1OZdP6lg183Bh+cObXhsHIR3YEcZ0XJn28yR03oXmQ5jiR4XQluiyAU3BjWxdghTymqGjm6TmqUMW57FudKlis9m/Q2sfZo80iU0DY2BPZo/AJjHwImEWJvE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR01MB7282.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6916009)(66556008)(4326008)(31696002)(66946007)(38350700002)(38100700002)(186003)(66476007)(6512007)(8676002)(316002)(86362001)(52116002)(53546011)(6506007)(26005)(8936002)(6486002)(107886003)(2906002)(5660300002)(30864003)(83380400001)(508600001)(7416002)(6666004)(31686004)(2616005)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlDUDBtNy9yK2JJRndaU25lQlJsYlNHZnNzWE1ZWjNnQlVKdi9PMkM1TEpy?=
 =?utf-8?B?UjBxN0puU1dhcjlvMnM1T1crRDhMaGR5MHdiak5BeVNpNmM1Wm9IS2VtdW91?=
 =?utf-8?B?Q2pibDF4SWlkWG11UXZzekl2YXBwRDRUTnBrRWJucDd4N1hXVDgxM2NNRDRx?=
 =?utf-8?B?b0Y2LzJRc3BBaUIvK2U0SzNBNlYzWjM2cUQ5NiszT0l5MXpBNmVMdElMcTlC?=
 =?utf-8?B?NGJTUnBTN1ZoVFFWamJmQzVXUDU1NHZrWUtzL2FlZmtEV1BFWEFHTy9pY1Jq?=
 =?utf-8?B?N3lQaHN6WGN6eEJGb1NCRDROR0UvZGgvWkFXbzNDdG1pcnBndFh5dmVGYS9u?=
 =?utf-8?B?SXp3QW40TUJqMjlNZk9UZzRRQlgxTklYd0h6c2c4UXQxL00vdDJDRFpmUDBs?=
 =?utf-8?B?M04xZnZ4L1ZBMWdlV2JPaTl3eUhUb0pTYTVIR3BiZGI3Zkw3VnZWTkVBbENl?=
 =?utf-8?B?c2RSY2JkclgxclNkMm9FZktlM3JkLzlLeWNLRS8xTy9MQkY1aUpLcnBnQUpJ?=
 =?utf-8?B?ZUo4YjlkamQ2MHhseGcveWhYRHJyd1VLbUF2T1JOY3hTTUl6Z1NTKzBNTnRr?=
 =?utf-8?B?c3dmL3U5UFp0aUhUWWUxZXQ0Z3BEd2hReHVmNFU0dXBvc0RpbE45QUxGb3V1?=
 =?utf-8?B?ZnRJTEt1T3dkc29PalJ1ODQxclBoSUJINUdTampEQmxzNXMwYVpldWNVNVVo?=
 =?utf-8?B?d2Q1cE01R3ZkdGphVGxwVWw0WlVGYk1Mczd1djRuaFRTalh1SDh3Z1ZmSVg0?=
 =?utf-8?B?bWgvQ21kNDZSTjJwbEp4aGEwNFdISFlFV2FwYzBsbEtzaXBjYitaaTEwVENz?=
 =?utf-8?B?RVdSQzN5dHFOY1BaUVZncTUra1duUkdLZ0x5R1NvaTJjZWdORXdBd1dpNEV1?=
 =?utf-8?B?a2FPdlgyMHBiRy9CTjJGSFFXdm9ZYkFrcFVNR3BSQ3dGV2RTMXZFYStnS3dM?=
 =?utf-8?B?SzlpcDZ6cGo0NlZvNmplZlVqclhxWEdFMTFXQkYwdkxMbEVyNTA5RXJHWDJk?=
 =?utf-8?B?dHB6dU1XSHdlU2VmalNqaEJpMWRVZHNvL3pWU3puUUF3K0hKbnY0MXRpUUxQ?=
 =?utf-8?B?UTZMV0lEcmFiZ2R3NGF0enJRSWFwWjZKRUJzaG4vNXhqMXVHU3kwd1M4azFu?=
 =?utf-8?B?R3B1N2NWa01GUjdPdndSNmo0L3BPeGJIUnRoUDB5SzNuMCtnTWQ1blQvVnJS?=
 =?utf-8?B?M2NoZjMrOTVxSkhKUmVENjk1U3VZV3FSbUpsd1VJd0FOMHgyYzBMYlQrM2NZ?=
 =?utf-8?B?ejRqWkc4MW1USlBaaWxtbGZLb3I0OVoyVkMxWm43Q3RZcnNGODNOYy9jNGZX?=
 =?utf-8?B?SW5qNUtzbFRtdVd2bDZTa0tmVDJWRUp4TCtQOHZiekxlS0ErajZwa2VUUFVQ?=
 =?utf-8?B?T2NWY05mRGpKdlNrMTRnMXc5TkdyeGEyNUsyZjJKMm56YysrRTVzakJwY0cx?=
 =?utf-8?B?MUpHdjVBamRQajFWWmIzSWRVaDBJc0dWWWU0ZjJVNmp4a0cwSmVLZCsvWGk4?=
 =?utf-8?B?Rkd5Vm5wekQzTU44VVZHNlZ6dHFObEYyRjhFanlmMEsxVHZQRzRwVXg5UVlF?=
 =?utf-8?B?N2t3Q3pLeGpFV0VPSSsyWWJXazNmN08yRlo4RXVkODBYN2hSYjRVV0crazc1?=
 =?utf-8?B?TktUbXV3MEZGeWQxWEVLVjl3dncxRG5JTzM4Y25aYWU5TmJ4TDR0WElBWG9G?=
 =?utf-8?B?UDRIVVNTWW9mK3FPcW55U2UrU3Z3RTluWkZ6VWQ0cXZZN0MxMmJlanQzNURr?=
 =?utf-8?B?czJ5ejI4YnRZUFhEN3hqUE1UOG1waEF1QUNtZlRuZ3NLM3dsWHdPZEF5VHQ1?=
 =?utf-8?B?MWprMzFMV0RoR1Rnbi95WlFWZ216SVo0NGhLZEY0Y3Y3OE1ERERpbTQwQjRm?=
 =?utf-8?B?VlhiNE5IcTg0WXM1OEJJbTQwbHZWY3NVdDhNSmJ3L2hhb251SjNIOWluUmcr?=
 =?utf-8?B?NjFnbGwxTWs1S2pDV1ZJNUZhL0ljdWczQmlwRm00cVBiUEkxQ1JLbTREQnU5?=
 =?utf-8?B?ZGdXM0cxNHp5R3U0UDBERDZGb3FTZVZzeG91MnkxYTFWY3luZUVzUmZ0cVFN?=
 =?utf-8?B?SU4yS21FcjY3bisrOFRnTXlSTnYza09vcmFnYlVuSzM2QUc0cUI4Wk5pRGVw?=
 =?utf-8?B?czhmaUZUaUFmM0pFVDBzaFNQVWJpd25OY3VTWjJacDZaMk5XelZTZDIwbHA4?=
 =?utf-8?B?Rm1BMmE0WmdGTmZIbHRxTCtxT3FEL3UvTWNjL1hVNHg1aFNqNkdnZmM5OTFx?=
 =?utf-8?B?SThQU3JkWHlnbFBibHIrUXh0SUZWd1M2UHM5UTNYVHJ2d1V0YVA4MEx2TUF6?=
 =?utf-8?B?Z3hra1Y0MVFMVVk0Slc2eG9PdzJCcmhzRnBxTjVQS1RJbktmd0RLUDgrYVgw?=
 =?utf-8?Q?kWBCJgMFeqdDt/2Ro+gJ88YJpF98tr1lNRxB0?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d958bdeb-01fa-4bd7-535d-08da1919fabf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR01MB7282.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 04:41:00.2127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlroa2n6m0KpsRQS6Y5P/+4aEvGsqislp3ZrAjLPbqUMPsG4qC+2ji9YPfYjcWBhX7HvhmXpvn0h3ctBY22UwWENsJT9TIVKon65c7t7DrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4123
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



On 17/03/2022 20:13, Corey Minyard wrote:
> snip...
>>>> +
>>>> +static void response_timeout(struct timer_list *t)
>>>> +{
>>>> +	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
>>>> +	unsigned long flags;
>>>> +
>>>
>>> Is there a possible race here?  The timeout can happen at the same time
>>> as a received message, will something bad happen if that's the case?
>>>
>>
>> Thanks Corey,
>> I think I need extra comment here.
>>
>> The purpose of this timeout is to make sure ssif_bmc will recover from busy
>> state in case the upper stack does not provide the response.
>> Hence, the response timeout is set as 500ms, twice the time of max
>> Request-to-Response in spec as the code below. Should it be longer?
> 
> That's not what I was asking.  I know what the timer is for.  But what
> happens if the response comes in at the same time this timer goes off?
> What will keep the data from getting messed up?
> 

Dear Corey, thanks for pointing this out.

In case the response comes in at the same time this timer goes off, both 
timeout handler and the ssif_bmc_write must first win to acquire the 
lock first, eg: ssif_bmc->lock

If timeout handler wins it firstly test ssif_bmc->response_in_progress 
to make sure if the ssif_bmc_write() is succeeded. If not, 
ssif_bmc->response_in_progress is false, then set the ssif_bmc->busy and 
ssif_bmc->response_timer_inited flags to false, and set the flag 
ssif_bmc->aborting = true to start aborting the current response.

If ssif_bmc_write() wins, it then first test if the timer not yet goes 
off, ie: ssif_bmc->response_timer_inited is true, if so, del the timer 
and let the response ready to send back to host. If not, make 
ssif_bmc_write() to return -EINVAL as the driver had already aborted the 
response and wait for the new request.

This will be included in my next version.

>>
>> As per spec, the max Request-to-Respose would not exceed 250ms.
>>
>> I put the comment in ssif_bmc.h as below:
>>>> +/*
>>>> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
>>>> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
>>>> + * Recover ssif_bmc from busy state if it takes upto 500ms
>>>> + */
>>>> +#define RESPONSE_TIMEOUT			500 /* ms */
>>
>>
>>>> +	spin_lock_irqsave(&ssif_bmc->lock, flags);
>>>> +
>>>> +	/* Recover ssif_bmc from busy */
>>>> +	ssif_bmc->busy = false;
>>>> +	del_timer(&ssif_bmc->response_timer);
>>>
>>> You don't need to delete the timer, it's in the timeout.
>>>
>>
>> Will remove this redundant code in next version
>>
>>>> +	ssif_bmc->response_timer_inited = false;
>>>> +
>>>> +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
>>>> +}
>>>> +
>>>> +/* Called with ssif_bmc->lock held. */
>>>> +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
>>>> +{
>>>> +	/* set ssif_bmc to busy waiting for response */
>>>> +	ssif_bmc->busy = true;
>>>> +
>>>> +	/* Request message is available to process */
>>>> +	ssif_bmc->request_available = true;
>>>> +
>>>> +	/* Clean old response buffer */
>>>> +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
>>>> +
>>>> +	/* This is the new READ request.*/
>>>> +	wake_up_all(&ssif_bmc->wait_queue);
>>>> +
>>>> +	/* Armed timer to recover slave from busy state in case of no response */
>>>> +	if (!ssif_bmc->response_timer_inited) {
>>>> +		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
>>>> +		ssif_bmc->response_timer_inited = true;
>>>> +	}
>>>> +	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
>>>> +}
>>>> +
>>>> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>>>> +{
>>>> +	u8 response_len = 0;
>>>> +	int idx = 0;
>>>> +	u8 data_len;
>>>> +
>>>> +	data_len = ssif_bmc->response.len;
>>>> +	switch (ssif_bmc->smbus_cmd) {
>>>> +	case SSIF_IPMI_MULTIPART_READ_START:
>>>> +		/*
>>>> +		 * Read Start length is 32 bytes.
>>>> +		 * Read Start transfer first 30 bytes of IPMI response
>>>> +		 * and 2 special code 0x00, 0x01.
>>>> +		 */
>>>> +		*val = MAX_PAYLOAD_PER_TRANSACTION;
>>>> +		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
>>>> +		ssif_bmc->block_num = 0;
>>>
>>> Do you need to validate the data length before using this?
>>> This applies for lots of places through here.
>>>
>>
>> set_multipart_response_buffer() is called only when ->is_singlepart_read is
>> false, which is determined by the below code under the *_write()
>>
>> ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <=
>> MAX_PAYLOAD_PER_TRANSACTION + 1);
>>
>> So, I think the len is validated and could be use in this functions.
> 
> Ah, I had things backwards.  "Read" here is when you are writing to
> the other side.  I understand now.
> 
>>
>>>> +
>>>> +		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
>>>> +		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
>>>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
>>>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
>>>> +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
>>>> +
>>>> +		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
>>>> +
>>>> +		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
>>>> +		       response_len);
>>>> +		break;
>>>> +
>>>> +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>>>> +		/*
>>>> +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
>>>> +		 * IPMI data plus block number byte.
>>>> +		 */
>>>> +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
>>>> +			/*
>>>> +			 * This is READ End message
>>>> +			 *  Return length is the remaining response data length
>>>> +			 *  plus block number
>>>> +			 *  Block number 0xFF is to indicate this is last message
>>>> +			 *
>>>> +			 */
>>>> +			*val = ssif_bmc->remain_len + 1;
>>>> +			ssif_bmc->block_num = 0xFF;
>>>> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
>>>> +			response_len = ssif_bmc->remain_len;
>>>> +			/* Clean the buffer */
>>>> +			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
>>>> +		} else {
>>>> +			/*
>>>> +			 * This is READ Middle message
>>>> +			 *  Response length is the maximum SMBUS transfer length
>>>> +			 *  Block number byte is incremented
>>>> +			 * Return length is maximum SMBUS transfer length
>>>> +			 */
>>>> +			*val = MAX_PAYLOAD_PER_TRANSACTION;
>>>> +			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>>>> +			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
>>>> +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
>>>> +			ssif_bmc->block_num++;
>>>> +		}
>>>> +
>>>> +		memcpy(&ssif_bmc->response_buf[idx],
>>>> +		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
>>>> +		       response_len);
>>>> +		break;
>>>> +
>>>> +	default:
>>>> +		/* Do not expect to go to this case */
>>>> +		dev_err(&ssif_bmc->client->dev,
>>>> +			"%s: Unexpected SMBus command 0x%x\n",
>>>> +			__func__, ssif_bmc->smbus_cmd);
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	ssif_bmc->nbytes_processed += response_len;
>>>> +}
>>>> +
>>>> +/* Process the IPMI response that will be read by master */
>>>> +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>>>> +{
>>>> +	u8 *buf;
>>>> +	u8 pec_len, addr, len;
>>>> +	u8 pec = 0;
>>>> +
>>>> +	pec_len = ssif_bmc->pec_support ? 1 : 0;
>>>> +	/* PEC - Start Read Address */
>>>> +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
>>>> +	pec = i2c_smbus_pec(pec, &addr, 1);
>>>> +	/* PEC - SSIF Command */
>>>> +	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
>>>> +	/* PEC - Restart Write Address */
>>>> +	addr = addr | 0x01;
>>>> +	pec = i2c_smbus_pec(pec, &addr, 1);
>>>> +
>>>> +	if (ssif_bmc->is_singlepart_read) {
>>>> +		/* Single-part Read processing */
>>>> +		buf = (u8 *)&ssif_bmc->response;
>>>> +
>>>> +		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
>>>> +			ssif_bmc->msg_idx++;
>>>> +			*val = buf[ssif_bmc->msg_idx];
>>>> +		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
>>>> +			ssif_bmc->msg_idx++;
>>>> +			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
>>>> +		} else {
>>>
>>> I thought for a second that this was wrong, but I think it's correct.
>>> Supply zero if you don't have data.
>>>
>>>> +			*val = 0;
>>>> +		}
>>>> +		/* Invalidate response buffer to denote it is sent */
>>>> +		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
>>>> +			complete_response(ssif_bmc);
>>>> +	} else {
>>>> +		/* Multi-part Read processing */
>>>
>>> You don't check the length here like you did above.  I think that's
>>> required.
>>>
>>
>> As per my explanation above, the ->is_singlepart_read is determined by
>> testing the length, so it is validated as I assumed.
>>
>>>> +		switch (ssif_bmc->smbus_cmd) {
>>>> +		case SSIF_IPMI_MULTIPART_READ_START:
>>>> +		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
>>>> +			buf = (u8 *)&ssif_bmc->response_buf;
>>>> +			*val = buf[ssif_bmc->msg_idx];
>>>> +			ssif_bmc->msg_idx++;
>>>> +			break;
>>>> +		default:
>>>> +			/* Do not expect to go to this case */
>>>> +			dev_err(&ssif_bmc->client->dev,
>>>> +				"%s: Unexpected SMBus command 0x%x\n",
>>>> +				__func__, ssif_bmc->smbus_cmd);
>>>> +			break;
>>>> +		}
>>>> +
>>>> +		len = (ssif_bmc->block_num == 0xFF) ?
>>>> +		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
>>>> +		if (ssif_bmc->msg_idx == (len + 1)) {
>>>> +			pec = i2c_smbus_pec(pec, &len, 1);
>>>> +			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
>>>> +		}
>>>> +		/* Invalidate response buffer to denote last response is sent */
>>>> +		if (ssif_bmc->block_num == 0xFF &&
>>>> +		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
>>>> +			complete_response(ssif_bmc);
>>>> +		}
>>>> +	}
>>>> +}
>>>> +
>>>> +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
>>>> +{
>>>> +	u8 *buf = (u8 *)&ssif_bmc->request;
>>>> +
>>>> +	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
>>>> +		return;
> 
> I don't think this check is valid.  I believe the msg_idx only covers
> the current message, but ssif_msg is a full multi-part message.  It
> covers the single-part message, I think but not the multi-part ones.
> Also, abort the operation and log on bad data.
> 

Yes, thank you for this catch.

Will change in next version.

>>>> +
>>>> +	switch (ssif_bmc->smbus_cmd) {
>>>> +	case SSIF_IPMI_SINGLEPART_WRITE:
>>>> +		buf[ssif_bmc->msg_idx - 1] = *val;
>>>> +		ssif_bmc->msg_idx++;
>>>> +
>>>> +		break;
>>>> +	case SSIF_IPMI_MULTIPART_WRITE_START:
>>>> +		if (ssif_bmc->msg_idx == 1)
>>>> +			ssif_bmc->request.len = 0;
>>>> +
>>>> +		fallthrough;
>>>> +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
>>>> +		/* The len should always be 32 */
>>>> +		if (ssif_bmc->msg_idx == 1 && *val != MAX_PAYLOAD_PER_TRANSACTION)
>>>> +			dev_warn(&ssif_bmc->client->dev,
>>>> +				 "Warn: Invalid Multipart Write len");
> 
> You should abort the operation here.  Don't deliver obviously bad data.
> Same in the code just below.
> 
> This will require that you add a message aborted type of state to just
> ignore everything that comes in until the full sequence ends or a new
> message starts.
> 

Will introduce the abort state which will ignore everything until the 
new request comes to handle those invalid cases.

>>>> +
>>>> +		fallthrough;
>>>> +	case SSIF_IPMI_MULTIPART_WRITE_END:
>>>> +		/* Multi-part write, 2nd byte received is length */
>>>> +		if (ssif_bmc->msg_idx == 1) {
>>>> +			if (*val > MAX_PAYLOAD_PER_TRANSACTION)
>>>> +				dev_warn(&ssif_bmc->client->dev,
>>>> +					 "Warn: Invalid Multipart Write End len");
>>>> +
>>>> +			ssif_bmc->request.len += *val;
>>>> +			ssif_bmc->recv_len = *val;
>>>> +
>>>> +			/* request len should never exceeded 255 bytes */
>>>> +			if (ssif_bmc->request.len > 255)
>>>> +				dev_warn(&ssif_bmc->client->dev,
>>>> +					 "Warn: Invalid request len");
>>>> +
>>>> +		} else {
>>>
>>> You check msg_idx above, but I'm not sure that check will cover this
>>> operation.
>>>
>> That check is to make sure the length (*val) must always be strictly 32
>> bytes in case of MULTIPART_WRITE_START/MIDDLE. And this check allows the
>> length is up to 32 bytes in MULTIPART_WRITE_END.
> 
> Now that I have read and write straight, this is where the previous
> comments apply.
> 
> You are trusting the the length sent by the remote end in the second
> byte is correct, but there is no guarantee of this.  The remote end can
> send as many bytes as it likes.  You need to check that you don't
> overflow buf here and that it actually sends the number of bytes that it
> said it was going to send to avoid underflow.
> 

Will include in next version. The request which is exceeded the 255 
bytes should be aborted.

>>
>>>> +			buf[ssif_bmc->msg_idx - 1 +
>>>> +			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;
> 
> This computation is fairly complicated and hard to understand.
> Calculations like this are asking for trouble.
> 
> It would be easier to understand had request.len be the current length
> of what is in request.payload and increment it on every incoming byte.
> Then request.len could be used to add data to the buffer, like
> 
> 	if (ssif_bmc->request.len >= sizeof(ssif_bmc->payload))
> 		error...
> 	ssif_bmc->payload[ssif_bmc->request.len++] = *val;
> 
> If you renamed msg_idx to curr_recv_idx and recv_len to curr_recv_len,
> it would be more clear that these are related and operate on the current
> incoming message.
> 
> It would also be nice to get rid of the casts from ssif_msg to a buffer
> array and just index directly into request.payload[].
> 

Really appreciate for these comments, Corey.
I have rechecked the code and there will be, definitely, changes to 
refactor this code in my next version.

> In thinking about this further, I have a few more observations...
> 
> There is no need to have the netfn and cmd in ssif_msg.  They are just
> the first and second bytes of the message.  You don't care what they
> are in this code.
> 
Agree. Will change in next version

> Why do you deliver the length as part of the message to the user?  The
> length is returned by the system call.  You have all these +1 and -1
> things around the message length, which is error-prone.  Removing the
> length from the message would get rid of all of that.  And using packed
> structures is generally not the best, anyway.
> 

Will avoid those +1, -1 in next version.
About the packed structures, I think it is needed because we want to 
just copy the whole request/response struct from/to user space.

> The PEC calculations remove one byte from the maximum message length.
> Since they are not included in the length byte, it's kind of unnatural
> to do this the way you are doing it.  Instead, it might be best to say
> if you receive a byte and curr_recv_idx == curr_recv_len, process it
> as PEC.  That way the PEC never hits the buffer.
> 
> There is no need for msg_idx, or cur_recv_idx, to be size_t.
> 
> I need to look at this some more, but I'll need to see the rewrite.
> 
> -corey
> 
Thanks Corey,

Will address these suggestions on next version.

- Quan
