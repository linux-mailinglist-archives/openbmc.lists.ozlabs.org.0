Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F39635B3A71
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 16:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPHyP0HRHz3bbQ
	for <lists+openbmc@lfdr.de>; Sat, 10 Sep 2022 00:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EykKG4p8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EykKG4p8;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPHxt229bz309f
	for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2022 00:12:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662732754; x=1694268754;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:mime-version;
  bh=LKqhplBqdXPgxMTPpHJ6Oo1GNxTNOKrDDkn2HQyx/wA=;
  b=EykKG4p87Z9ogQIY5VYNXGN1zwZiAgqzfyQtesdxqFIzPQFaFA83Ps1L
   SNfR1eJNaDxNs4afc6m32Ctmuc5EJyPct1hgpzDyoy3X06LDK3GR30/G6
   7shwCI237B/mNM7L9wMVEDa9W4Md1+53d77MgQeKvaUKSm6hT2MAoCQux
   nCAoe/xc1LCSDaTRUxkFeFhl/wP+N8A33lzswEmhJoC4bArjYyOKVVDyD
   MIPQCjGsirqGDaCcuh1OTo6lIP/E8Ia6ZvXGewYfENs5T0H/Ewng8u+g9
   31qEqBAaz94cyZC3XPaSGpNYo/6RcpCIIwX9vpaddGp/9B2h0P8FQVV3d
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="295063051"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208,217";a="295063051"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 07:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; 
   d="scan'208,217";a="683650002"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2022 07:12:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 07:12:26 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 07:12:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 07:12:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 07:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRGiUFzvgjodVYNKYWzsaFfwsa5lHuDjKFZQoAEvQSn36QffyuMpJIkwRaMwr3KhKnJBOlS96xFV3MEekWFjtvhsLRSQsHKLxx/8urN9btJ4AXNShxMbR9JC8MRFlS+PcUj8MaMw4OV4jnhAk0onc9Rs4kGYl6O2Aq8CDbTVl6yV/wMJVDJK1SjZ7ILNV5W5wVGMZSt60lVyS/0sUyXmzhqN39coqd/x1d7I73bO+SUj1uZdMXdJFC/g3u4o9z1DMe19UYUQo4Nkr5Ncf7sf5ERVIuA21NzshdHzEnW9gRDPJr0hLguxqmQ2LkGqF8wImPC2xkPecfEtREZuu9FT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Tn7rTMw/VvSFlVZd1TflLUCks+Iheswh5bsya6zFeU=;
 b=VFyRieHttLItvJSeqeg7gGpnfmkg96AAOObwmmXCvLu3KNwV4xsDpLoqoBYwQ1sCJwM7PGlQT02uCBNSITRNobObsoKOqalOzFsbrv/OZ5oYm4Mzhvk9MC4MU6tesq+w51ZqTspJJ/rV7KbYY9vcoUXGkdRPCcn/jIntBuDBneRV00IQR9KMipOo4In2DaWV6cDtPgkCaJmAa6kZ3bboQdQnZCNdgvFyhOdPtUgZF7lECNLGdMnTeQ+vCacToK50pEYLb0uPtYgRGGRZICofSvjm7uDUpalysyUv2Zse7/8NunnkiWHPLfyjda+YW0Cq/a7AVbHCO/Iy+G8s/J9cSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 14:12:24 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708%9]) with mapi id 15.20.5588.015; Fri, 9 Sep 2022
 14:12:24 +0000
Content-Type: multipart/alternative;
	boundary="------------lw1yGRZj9S0OTR9e6TRhQ7U9"
Message-ID: <89592b7f-784c-d94c-8a81-57cb49a3bcce@intel.com>
Date: Fri, 9 Sep 2022 07:12:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: SATA hotplug notifications for BMC inventory updates
To: Paul Fertser <fercerpav@gmail.com>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <Yxin03RwpUvVPsAy@home.paul.comp>
 <2f56b77e-a7a2-3577-c868-90fa6226f483@intel.com>
 <Yxr6OmHDrzQVSaYr@home.paul.comp>
Content-Language: en-US
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <Yxr6OmHDrzQVSaYr@home.paul.comp>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 972cf4de-170e-4aa0-5e86-08da926d515c
X-MS-TrafficTypeDiagnostic: DM4PR11MB6525:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBNVCkSNNp64HGxR9YPAj1FIMuzQUfl88yVyIKyqrFiBjTvQKNINS3TZeJjdhLlIXq5lNdZBHlnr9iRATR0iF4lkMnQHXD1U5Fn7+vaXqliYal9KyKo0xcEITRHxcAppoxH8RKIU3128h5h92oo0ck+tcHtNZGIPdUmrV8Cz7XFvbSAXj1VvZjxGgPjbS1ViJ94QgQ5cyOtU4nTq7jm3RP6m38NJAVqV6cnpL9sZAuKlRgPqbs6+TP9f2oOqbeTdnucAME8YFNGIrZP5Tb7ZDjwkNzgVbqnLqr2oJ9JcFdJZTBdW8mtaLrHk4v+NP+TpXMEXLQBIN7ZUc96NsQwY+SLX2PEKFOIT0GimC2A5NQZYSyfOHpJ8YvsqAqLiH6R4XKedPvzP/R2UJs0/YMPqpsvK/zyPeJ3qovjYe1fZ3YWNMOtBSQiI27RGdIo/k6vsEmPiD1YeI3Hf5GhdD9PUC/1J2i/Dt9ysecc2ZhEcmgTIY2i5oTxgEsfoh6GquvYVlEclj37nE3lD8CQ1Af/zHJBD0FPoNn3Fc4s6bWBjK8vQzG47QnRISkmSrtCG91/OpFm+ryLZoeFuGPy68y9b1sIHbJ9zKqEokttcHOJ4A4Ao3u/wvqegZcJwVk3ivpPEqU83v74c626SXorQkzSqkAjaBvA519cRCKCah6kkbunPKm9qvjs8XAmdDDQmx9mMH3hFCpWt+ebFCgMqdY/mvB9u7/QEpHlOO6xDR8QtoNLEUJZZS86vMsDG4vPCXdYpB89S4GiID87sKIyz8M4KVo4QotWCAbT5id09IrrvOuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(376002)(366004)(39860400002)(36756003)(33964004)(40140700001)(6666004)(2906002)(6506007)(6512007)(26005)(66946007)(31696002)(8676002)(66476007)(86362001)(8936002)(53546011)(5660300002)(4326008)(66556008)(31686004)(478600001)(316002)(6916009)(41300700001)(6486002)(2616005)(83380400001)(186003)(38100700002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUpCQzJyVE41dEtXc0diMjBGK2pOWG9PZ3hhanU4ZEpZTU1IL3g1NlFKZlRa?=
 =?utf-8?B?Wkg2WnZDZlVuTk56b2U4NWd5NjVIUmVObGpMOTRhbDBlOXNtbERMcnZwSlFP?=
 =?utf-8?B?dHpKWEl3QUZ1RkZxMG1VQTJwalE3UURzSmhmSjlOWTFuUUZPZnBwM2FTRkVM?=
 =?utf-8?B?L1NsZXQ2eXJiRkdKalNkcCttTlNOTnFyN0MraUQ2aVZTN2hmUGlHN1lKZ1Y1?=
 =?utf-8?B?RmFqWHh0U252L2tXRVZTY0EzSEJLUUpnR25SSVhHTjBYOENBNmJBbDJOQUxG?=
 =?utf-8?B?L0NHR1VvbHRkWDdhUWJPaVlNZFFoZ211cm9UMGxhYnNadUpQUzFsSmkzZk4v?=
 =?utf-8?B?ajYvWTdmNUwxSGlEUXUyeXlPeDNra2RpbzNNdjljS2hmUkhDSEpObVgxUmwr?=
 =?utf-8?B?TnlmUEhQYmUrNVF2RUJ1RUdlNThFREpBalpGK3FZQUpRR2s1bDF0aURDWU1h?=
 =?utf-8?B?dDF3VUZNb1NIVm53cU8ySnUveFEyNjkrb3JJMkhjTjJFL2lMcmc4dG5YWmdQ?=
 =?utf-8?B?bDZDeUJKekN6THUzNkVTQUdCY3dKWWYzYmZxTUFaSlI1WE5VcXhsVG1YL1Jk?=
 =?utf-8?B?MGUvb0ZsVzhNZFF6cEdBRHJLU09QK2VnQWdhbEhxUHdVYWVlcTYzQnJ5V3NF?=
 =?utf-8?B?c0RCWjF4Yjk5anJBbThIYk55cmlab2h4c2pBL0xUNzVobzI5SDc1RjBVa2t2?=
 =?utf-8?B?cjg3eS9uR2tKdS9QT0VOTXB1Q3UrSjdOTXZtaGhZajQrRDAyV0REN3B5cUt4?=
 =?utf-8?B?UjQybXN6aE42SWNGTno1cGdLM3RMOVpubDNxNktRU205NU10QytTd0dTWmE4?=
 =?utf-8?B?cmFodWN6YW5renI0aHgrcmdUN0c1MkEybmQxdEFEdnJ5VUV4M1VMTGQ4dkMr?=
 =?utf-8?B?TWhCbTZyY242ZTA2dGRKbTFxQVVOektCdzlXejRaMis3MWhwRVJsLzNjNDdo?=
 =?utf-8?B?NDN5U3MxRHFibjIyL3ZNQnFmYTRNaXlsay9zQU91YWFHSGlZOTZkUVZnU0xL?=
 =?utf-8?B?ZXNKRENkeUptT2RwYkZLanhLZWdPeUNuc0VJMjhSTDlTOVZmUCtzSVA2TjFa?=
 =?utf-8?B?TndpZHhmRW1NZnZhOGdQNzczeW1Pb3dJU0w5ZGJtaWRuT1ZublpEMG5SK0hz?=
 =?utf-8?B?ZnY5VEtsNGRPTVdzSkJoQldCanpNY09FaTV2Q2FKTUllVHdyNzQyclBLcVNR?=
 =?utf-8?B?Nm5lYlFCMlBkS2ZlRnkyK3B3U2dRZ1A2bG1kMVFIVm9ISlZNUDlkK2JrclBI?=
 =?utf-8?B?ZG5UdnAxcTg4d3dNVEFEWkNzakFNY3RIR2hhRnhoZEZhcWg2czhkb2YvL0Yz?=
 =?utf-8?B?ekhNV2F5K1JQUmNBKzNiK2N5eW1aRjZBMS95VzVlTUQyQVNMS29sbHRONEZR?=
 =?utf-8?B?dUhkdEF5Q1NFc2tpUlVwSGVZdTNReTM4S0hUNFFQaXBvUlUvcWxxRExYdThQ?=
 =?utf-8?B?ZjcwS2ZRbEtSMlBTcWNSeGJ6YjVuTWQvNzRlM2kwMXFGNGhMSTVWNjBNMTlU?=
 =?utf-8?B?WWo4Y3JPb1Q0MDZYYklYbTZvR3A2R3VXTlhSZDdMSkNkV05MV1Q0K2VjQkpM?=
 =?utf-8?B?SVJ1ajVEQmhUSmhhVmhSYXRUT0hIYldJNkVvVTFNb0NSR0FCZGtQSkZWRFNq?=
 =?utf-8?B?YWd5c24wM211Q3ptT2Z1MDk5bktLRDBydUViM1JiRlRPWTEzUitFdzhuQ2sr?=
 =?utf-8?B?a0M5REIxdGcvVlZDRVBONnlsMnN6ZStCbGtUYU03WXp6M015d3pSWEM3VStl?=
 =?utf-8?B?TUFLV1RpdzBtNjVaMTdNdXUwMExzTmkybnNnbHVpajhDN0JqTVFoSko2RzhH?=
 =?utf-8?B?QU9uU3NyblpjUWFTOGFuMFRKRGVLQnlSZ1hkOXFmQU4yYjlveWQ1bDhYREVq?=
 =?utf-8?B?ZlRnZ09pL2daOGxCWFd3Y2ZrVmhiZnVCYkRYaHZwWDI3Q2ZkNlJ4aFF1dEJJ?=
 =?utf-8?B?UkZhSmh6REFRYVloYWRGZUw4ZWdKV1lwV2liT1EvUmpHNnNRb1I3Y2g4MENC?=
 =?utf-8?B?eStHSGtyRmJPT3dIK2pSZFk5azdQMmhYaHZpZTBEOGUzejY5RjZXOWkwSWNJ?=
 =?utf-8?B?Nk5DYi8zUjlFQzhUbXRxbnNxM05BTmtlVHpuVDNxdERNZzdYV25pM25jK2pa?=
 =?utf-8?B?NlJhMGVzTVRwRXpraUJrVlppdTY2YkVBUlJjNU9GMXNHUlM4MEpKSjArR1Nt?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972cf4de-170e-4aa0-5e86-08da926d515c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 14:12:24.7006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZquxhH5yBrJTrsrtKKbSGMM3P/H2sW5OjmhjKzdbBQWvO6MCoG2S9ABwmfZ5NnLiZoDXRIt6VLCS6wplqBDJ5ncKRon+g6nv1TNZZlawnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
X-OriginatorOrg: intel.com
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

--------------lw1yGRZj9S0OTR9e6TRhQ7U9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/22 01:32, Paul Fertser wrote:
> Hello Johnathan,
>
> On Wed, Sep 07, 2022 at 07:36:08AM -0700, Johnathan Mantey wrote:
<snip>
>> Paul, this question now crosses a demarcation line. As a contract
>> worker I'm not comfortable discussing the topics you raise in that
>> paragraph.
> I'm not fluent in business slang so I take it you mean the feature
> might be nice but Intel doesn't want the OpenBMC community to have
> it. Well, too bad.

What I'm trying to convey is that as a contract worker I have access to 
some information I may not be authorized to divulge. This is a public 
forum, and I need to tread carefully so that I don't divulge information 
that impacts my employment.

The starting point for this conversation was HDD insertion/removal event 
detection.
Which then evolved to HDD MFR/Model Num access.
Which then evolved into RAID controllers.

It may turn out that Intel does want this feature as part of OBMC.
It may turn out that Intel is amenable to the community implementing a 
RAID/BMC feature.

The transition to RAID controller has initiated an investigation into 
what Intel may be willing to enable regarding OBMC.

-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------lw1yGRZj9S0OTR9e6TRhQ7U9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/9/22 01:32, Paul Fertser wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Yxr6OmHDrzQVSaYr@home.paul.comp">
      <pre class="moz-quote-pre" wrap="">Hello Johnathan,

On Wed, Sep 07, 2022 at 07:36:08AM -0700, Johnathan Mantey wrote:
</pre>
    </blockquote>
    &lt;snip&gt;<br>
    <blockquote type="cite" cite="mid:Yxr6OmHDrzQVSaYr@home.paul.comp">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Paul, this question now crosses a demarcation line. As a contract
worker I'm not comfortable discussing the topics you raise in that
paragraph.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'm not fluent in business slang so I take it you mean the feature
might be nice but Intel doesn't want the OpenBMC community to have
it. Well, too bad.
</pre>
    </blockquote>
    <p>What I'm trying to convey is that as a contract worker I have
      access to some information I may not be authorized to divulge.
      This is a public forum, and I need to tread carefully so that I
      don't divulge information that impacts my employment.</p>
    <p>The starting point for this conversation was HDD
      insertion/removal event detection.<br>
      Which then evolved to HDD MFR/Model Num access.<br>
      Which then evolved into RAID controllers.<br>
      <br>
      It may turn out that Intel does want this feature as part of OBMC.<br>
      It may turn out that Intel is amenable to the community
      implementing a RAID/BMC feature.<br>
    </p>
    <p>The transition to RAID controller has initiated an investigation
      into what Intel may be willing to enable regarding OBMC.<br>
    </p>
    <div class="moz-signature">-- <br>
      
      <title></title>
      <font color="#1F497D"><font face="Century Gothic">Johnathan Mantey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color="#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color="#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small><br>
                  <font color="#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href="mailto:johnathanx.mantey@intel.com" class="moz-txt-link-freetext">johnathanx.mantey@intel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------lw1yGRZj9S0OTR9e6TRhQ7U9--
