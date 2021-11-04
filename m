Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B51B445B5C
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 21:57:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlbYF3q1Jz2yTr
	for <lists+openbmc@lfdr.de>; Fri,  5 Nov 2021 07:57:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=I4cbZpM0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.42.27;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=I4cbZpM0; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2027.outbound.protection.outlook.com [40.92.42.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlbXn4X6tz2y8P
 for <openbmc@lists.ozlabs.org>; Fri,  5 Nov 2021 07:56:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYaK2Nj8HZM0JpJ/HrEbm2e2BG8vsqBHgVU0WallKCTvB49TsHH/jWYNBP51G69CjGdiOSawzSVzr0PSwMoI5JrQo+awVMAOHJAnGoQ3afxM8MkmEqYPUac/ZT1x9Kz7UZc4wIePfk6W69UNKB3LrYZmDrcIaJpq1MeeR6HIun1/3prPAS+yYNAfe/j3p9n026SCbV8pp+PJxi6ttIN+n6feaeKxZdPNyYQexOucjS7fSi+CLgcZiHw15Pywi+c0viBnFzjrvGpEyvtl3XG8y5qjLe2miubK6JDNZ4hWUUcBgymonK/Viu5f4deuT6EtKh/h3vNkcozPRe/H0EZosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRlIxfj+QfHas7HzXTviuAG5wG57YH6atlnCQ6A+WmM=;
 b=FfZUvxDluwx/bQfcgCxIawMiJUlqHP5ymkBfYDx1njGhSKucniJ34nfVNfeCbGfOSuFXm8H2R2qFyTWOi1reHzXuVfXBSV587YFEYClqckvH4cyVagzwj1b3hHJB8zubFUYYf5VFTdY2Y8NiW4SpbXNfrtOiownD1NEwEriT98mheKOPKW7LA/RKt0xjGMbLMs1xTEgkGiwTwCLS4JnJCw2rSa7keNsl0vhXG4qCnA6JXv+WELuis+3rzEWkpIAJdbV+elAQ8FpiPb/JaodnvUyodTGR9WCFgKhCfm6mntsE/aLCfaToKoX2k49w/sQUP/PA47lXbb+4V6mY3Oxrzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRlIxfj+QfHas7HzXTviuAG5wG57YH6atlnCQ6A+WmM=;
 b=I4cbZpM0d3WLFABAxPQoDOW+n2a//WHA2Z4qrcQcNTlXZnEdwnyJ/acY5tanCSmMc1tNOlk2sh8zv6ZW7cdR4u/XFKz8Bis5TO2ZGcTUhrw3RgotGjdZlRW5gsZaFgzs+hxEvhkp/+2x+43qnCDmC0J1Yuyl6BgdiXWArU7Bl2cjlcMTZStiDAaXdDhwU8q7OCfkl8zX4QQCPeYRXxywdzwZtO9x5nizFbr7erWQUW0x7NROrNV0Sxen9zB5CpauTSWqRny+mvPBK+5MLvnyUS1uqpDcFNkHdgvV0FUBue0971ZxBsGM6t/Bzx9l6kQ15rQ4MlTzxx6PIv87lyK2LQ==
Received: from SJ0PR14MB4805.namprd14.prod.outlook.com (2603:10b6:a03:376::7)
 by BY5PR14MB3922.namprd14.prod.outlook.com (2603:10b6:a03:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Thu, 4 Nov
 2021 20:56:22 +0000
Received: from SJ0PR14MB4805.namprd14.prod.outlook.com
 ([fe80::855b:40a8:8bd1:3a3e]) by SJ0PR14MB4805.namprd14.prod.outlook.com
 ([fe80::855b:40a8:8bd1:3a3e%9]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 20:56:22 +0000
Subject: Re: phosphor-logging Create API with Resolution
To: Patrick Williams <patrick@stwcx.xyz>
References: <MW4PR14MB48034DC5EC5E1B30FCF58CE8DC8C9@MW4PR14MB4803.namprd14.prod.outlook.com>
 <YYOpdFQkG+hymMPk@heinlein>
From: Kun Zhao <zkxz@hotmail.com>
Message-ID: <SJ0PR14MB4805D9719154CA931ED1F895DC8D9@SJ0PR14MB4805.namprd14.prod.outlook.com>
Date: Thu, 4 Nov 2021 13:55:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <YYOpdFQkG+hymMPk@heinlein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TMN: [oQnSjSWQL3/87R06HnXpamn2hFrFP0KA]
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To SJ0PR14MB4805.namprd14.prod.outlook.com
 (2603:10b6:a03:376::7)
X-Microsoft-Original-Message-ID: <8ac1b47c-da8c-3c5b-a02b-5028ed4e6ca8@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.31.135] (98.47.62.178) by
 BYAPR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:c0::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.6 via Frontend Transport; Thu, 4 Nov 2021 20:56:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9510ec8-a818-4008-013c-08d99fd58e86
X-MS-TrafficTypeDiagnostic: BY5PR14MB3922:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LD6P27ZJ9qUP8vVSiOo5d/v8lqLWhg8J73Hot9WTd5B2t/BbvekEmtuL6aCtVugHG4vCbc6Y1HAAgahmg+Q+c7BQNK7EdqOMOrHzfX46WUzFAj1al3Jf6RZVmqiq8FdkNrWyLU6Nm3HZ022zqtYpBoKMcbE0SlxfJijGX/Gk9kSvgzI1bQXdRBIqIB9yrEMEjZD8KvtIsdaKXKAkc1+dzatJfnhxxxkuTRxRV0XSTV+h7lwDwjDc+SaCWCIbaQHgQVol11D8JMq7A6ucTx1oNzTXtnejsSKDcoOl8yldTEfQGVhVmt4A7dCQO2FYyYkqpT/82B0dkiTgThIHa38fQ98Yy0i2189HGY44+3Pr/xGuAPRTSEtoU4ZCu/wBbzl+TwT0CHo3n4xlmnFJgEju22JxyuH9JvrKnXrl1AAko/FtwVnLKzFWb2VJgeApFujsaHEiJs+J9FRexRvwmTEYLDDAwkkNlSHb6oPsTiF0Dbw7t/ToLZLaPjDzUFAG3V2FH6bLgIsk/8AHRMpJ03cpu30gd79z92PXQAaemOlwRBg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DQRzyzr983eMfD3+cm7Zt9blDYiZi7j144IvFpISmceyh5DfQRtXflrqKL9jeBLo21qmU/YSQ9pQ0mRJRzxGeuqmbxeh0KoqpTl+URPf9U0V0G5lulBrkwscUyqMgwbyrcQDNzptDgggXpYjWgMtk5kcjG1dT6gV/vj3llhYXqjby7F9wJf/yREaiLkooWJl2fkjAuq34KvWT1NHTx/TpK0e+C9XXYSf3ZBUIZQa/8Mzsyqk0dV8fV7ksyi/9O4hSNx+d9lAci4mlJFux2VZJqyYlIF7FpouHNaw9J451mOelWtwGJ5N460RZGPxWT4swSLu8DJIYe+s4hLXweW+oqkMCbUHhqmUEdEYwuxd2ZpW6xbgA9Avb032Y/DPwNHLBciZEMybHzHzFKVFY8UJf4fYXqtiE0lO02N40KsLQUUvHY8TOQXBbIUa7LjIQ0Hq6u/hpnCxGJpvmuyXQ97SM6kmpxLKn/y17TK92bHNngtQD8W/7Ja5xKX/mwDHBaLhzWr+yMZAnS2ZEFFAF1j55yC2Y5nkMs2ei7eg4QNszG205Q032fycOBnSkxgTYvfCDGceX0V6I/uX4VIaLCbG/0A70Bmw2lQ2WWzI2dUQZW8bmbhNotW4DSCgLu23hwu0sH4Qc6DAtn6hjJTSCV4U1yPhlKgeqhW13k2NjMtVZe/yKeNJAqpOwY/rlGSxR5P7
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-32894.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c9510ec8-a818-4008-013c-08d99fd58e86
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR14MB4805.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 20:56:22.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR14MB3922
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/4/2021 2:35 AM, Patrick Williams wrote:
> On Wed, Nov 03, 2021 at 11:53:17PM +0000, Kun Zhao wrote:
>> Hi Team,
>>
>> We have a requirement to provide the value of Resolution property at the time of log creation with phosphor-logging Create API. But current Create() API doesn’t support Resolution as a parameter, we have to do two steps (create entry, set-property of Resolution of this entry) for it.
>> Any suggestions? Modify Create() API or add a new CreateWithResolution() API?
> 
> I suspect we're going to have other use-cases come up going forward where other
> people want to fill in other properties, so having CreateWithNNN APIs sounds
> like it'll start having clutter.
Agree.

> 
> Can we enhance the handling of the AdditionalData field to take fully-qualified
> property names and place those in the appropriate property at create time,
> rather than placing them in AdditionalData?  What I mean by this is that if you
> pass a key of "xyz.openbmc_project.Logging.Entry.Resolution" it will place the
> value in the ...Entry.Resolution property at creation.  Any non-FQPN will stay
> in AdditionalData.
> 
I think this is a better way. Thanks for the suggestion.

--
Kun
