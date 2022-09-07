Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5805B0614
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 16:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN3vf0HZQz3bd5
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 00:06:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZsPzA0rY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZsPzA0rY;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN3v50FL2z2yxG
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 00:05:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662559553; x=1694095553;
  h=message-id:date:subject:to:references:from:in-reply-to:
   mime-version;
  bh=F8wJgXQWxmQzjKMxjhBmhRgIqUoXug5YeSlO4PMjrT8=;
  b=ZsPzA0rYWNmIz0w+0kFpCsSU8zTnADh0RpFTdswawVTyB1ngk58wi4tL
   RAGJlDKOTmWTmjieskD7MyQq7EGUu20TwXpivS7zvTI4DLebjQntlSYu7
   p+lV+D362a55IgdcdAAqjcZVylQ86YfkWG0GMT7UMJ3RXu5nDmtO6AFAc
   qHdXJvMHKS5GsgOULDcOZ1ZO+Ha6/aBNKC9lLh5DWV+Dc1b3foizWylET
   0wiJfV3pvOqZ9hkDvAdNJUqwFV2fTaBYuQCH0FvdNyzHU1uXQJXVF3CO9
   gEwBWThxPDNO7CA2bhYsT2DVtbrTnMU3psolG25P4qVes9Gz+AoTaVVv0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="279889671"
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208,217";a="279889671"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2022 07:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,297,1654585200"; 
   d="scan'208,217";a="756775999"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2022 07:04:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 07:04:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 07:04:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 07:04:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 07:04:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXw+iylZf5qIrCKjp7V+howcP9Jdj5CCj3b450MQU0aa0Q0YKYTCfOsXUQ3DII2lwFzuGWqLnZ3amw4E/b+blCpFgG3gc8gg0hqP+YZxpSla4uPSQQ6w22roBKBSTzcynBuo7XvKJcTbflqkQzCLexA0p2Ld0ls8D7Eb0MgPHHV5CEGJ/PllnOpb4bEXKEv1vnjq7R6mN2ujdZYbJcrhPiwsjtx+i+gTUUA7ySHzsZIucu9QKTgsvF1/pLqyq11wsdAuprFuDds2otfeoj4xlq8k0phTVCjkU22F8tPFi9/gjt5oHeLSt0ZOx3vZt2dMgDjjZUm3zHnq0TLpSwzSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+jLYRRA3RA1kBQyl7vAg5lW04++zyNOv0ufA1LBsmM=;
 b=cw+45cqjxTCKQ/WByPjQn/EjjgaADguKu4NE1FJ+lmwHtrEnFclFbK7/riG5vbJZLNYN+L9xVtoav66VFsuSLqLrLWuDQusfYyIjZ4i3+n5bqmb+yu3bYM9wW+CA6wstKWLgL+wKYj4UnuGemYhCfYbk/EHVi3+GBRzNov1qbQQoEmNJHZxVM9fQ+OQgemDVYkWpyjSw3KwtHkRXu3f55y7RQNzCmNReESTQZwK3bigRd5CNao4cDL5tBxVbPIdeCgBpeRv97VO1r0JOCT7J4wL0ch5RX0vDq/mPeCP5zU0XNpI76v9Ua5O+bD570spv1UCTiwiK/vuI7J8cxx+KMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 14:04:51 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fce1:b229:d351:a708%9]) with mapi id 15.20.5588.015; Wed, 7 Sep 2022
 14:04:51 +0000
Content-Type: multipart/alternative;
	boundary="------------KctNjgc2umA9Yf0I0PQaJIu2"
Message-ID: <a18faae2-7efe-42ab-4a85-215afbaaf89b@intel.com>
Date: Wed, 7 Sep 2022 07:04:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: SATA hotplug notifications for BMC inventory updates
Content-Language: en-US
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>, Paul Fertser
	<fercerpav@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <YxXZeFQhJWDSHSVf@home.paul.comp>
 <2cdb6ea6-fc85-9835-d410-01195148a3eb@intel.com>
 <17841662532977@mail.yandex-team.ru>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <17841662532977@mail.yandex-team.ru>
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbf3ab79-3a60-47a1-d7db-08da90d9ee66
X-MS-TrafficTypeDiagnostic: MW5PR11MB5859:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /gs573dj3VFM2jXXV+RfW8ZEACHy4IxHKdK1RjsgoDeXqdBNvj7qDOxhHThHWWArES766RJig3peLgXauJfi3Oz8uOPQv6xZCRbbKxipYAc7bqq/oB24YaDBMm0jkT4VgYdWiHSWwCo1Mxtc2q5aBlrs1+P1WkRqri1DfcBd/md51yP5xnxFzBdxwgpRn5nzKJ7wTDng1sbINZuG8UYOu4NSOm811DYoQBimagrxMtzJxgdJazlSu8CTRd8C3JuVJCDeefSKj3a0hdM730Qb7MjPuX2tlkpbVY0OCtcNFfn9zBrXKmVlU+ezxzcnGK0JwujQX53kjZonvUQuCpwdxXhSRR/stAehcEQR9uXmo33fmzVaccMJIvJV++2QjOVohmtnzI4C4k6rTWmMEei51aNUh6JeagmxXgHAKz0MOY0z9POWwR2p3T2ZV2iZ10Bd9XrdmO4v1W2ZpfxwmvEjySB5oDS8aMI3dzHIWdcSCz1dQloojP234bjzth+H+7GeH1UYxc12exUKRo4GZh6v9NQZMVteQzADZAE0W7omNyRBueLhjr/CuZmsPWOSbKoldO3dQBt3NoAVvW7zm/ZbnbiPKbabI50BZzJf32mt4h2kp7MGCAC4WwUkXLL0RdiOGsJcqNnCVlE1JbuhS6Fav5qQ4PVa4fQGpGIIGiKLPTTlZc6hylOxQCQDz8SkJQeZi0g11whdH+voK5RYsY+SWHiOpbPQIzvwbrVUKjkj6rxrI3znMckmcrkq0LeEeRM/MCLJn5rCrMy+2lQ4SuMlHpg+QYMSXlHg3PEB+qNls5U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(39860400002)(376002)(136003)(366004)(186003)(2616005)(83380400001)(31686004)(38100700002)(66476007)(66556008)(36756003)(8676002)(66946007)(6486002)(110136005)(316002)(86362001)(40140700001)(6512007)(2906002)(31696002)(478600001)(82960400001)(8936002)(15650500001)(53546011)(6666004)(6506007)(26005)(33964004)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFY0SW1sakJlc2JLdG41eDBHc25UdE1DYjZmZEFySjRRQnBVSnB0cUxFaGJ0?=
 =?utf-8?B?M2k4bUZkcUozZWk2SExyYzh2a2cyVFVCUHFhM3dCZ0xkbFpEeTBBRlFrbWI4?=
 =?utf-8?B?YkYrdUtYSHBTaUtJeWZZcHdtaENQMWF6Z2lNOWVUZE45bmlsbWUyRU9CeVBk?=
 =?utf-8?B?WWI1NnZZTHNSb1RaUGcrWU9zcjNNMWdvY1JEYUxCQ25lRnJKSmRheHBpNnE0?=
 =?utf-8?B?bCtHSFFCVElLclhyTTdKTzJiTy81M3ZtcFd3RW15aVRlVC9yVHR4VnRpSFV2?=
 =?utf-8?B?RVFYSnBjN1I0d2dDVExOei9sWlh0MmxHWHlVMWpnbTFWWTk3Um5DMTZDekdT?=
 =?utf-8?B?Nk9NUW8rNDZUb3ZhQ29GT3Z0dVhBQUhXeWtDWlhNakt2aytWYXUyYndBOExr?=
 =?utf-8?B?Z3ZsU1dCSytJSnBZdHZkNmVBTTE3cENSMXBLalNMRXc4WlRxQnl0ZUpETHFI?=
 =?utf-8?B?VUdJWmE0amZnRjR5ams2bHZ2T2ZDaDVZRFhqdFpOUGF3UmExWThnYm1SVS95?=
 =?utf-8?B?bGZYQkdrYVJMZ01YS0lzYjhUUGhqQ1FTcHBMb1BtR25salpBbFd5T2k4OEZR?=
 =?utf-8?B?T09HZ0EyU1BpV3AyYWFCMDBVZGZtU1U2MHBFQ09oU0dNbVlPSWNGaUJ4T2dt?=
 =?utf-8?B?dDVacHIxUUpaNkMyQzd2STd3UFZPRUlSNk9zS1orbCttSzcwcUd5aCtqaVVU?=
 =?utf-8?B?OUgvRzBsNzlYVzBnc3IveXM1N1VENVMwNmRTcFNyaGxJR1dVYlgvZVhWbUp1?=
 =?utf-8?B?Vk5rZ2JzdVV3UE9DSW4zT0NXTzFJaCtKS3J5QzBuRkYwSmNSOStQdEUxRUlI?=
 =?utf-8?B?eUF3dXVldnVHREZQZmk1V1hLVGNWZExHamNOaFVVQXRJTHVUbVdBZGQzQXJH?=
 =?utf-8?B?QjB5KzlFaDNXT0ZSVDZualhGMG1leU5BNTBTanFCd3ZicWhQMXMyd1hlcjRP?=
 =?utf-8?B?bHljS0JGTi9oWE43TGc1clJJaUFNV1FGZTBRY0FyeEYxTDArellLOU55bHZa?=
 =?utf-8?B?Nnd2YkFLdVpGcUJEa1hWUzFoT0NDVmVzL2Vwb0l2bmF2a2IwMXFQeGRXMVdX?=
 =?utf-8?B?RG9LQjREazZBbjJzL1VwWUtkWkVjREl0ampESnJjV3RlZi9PRVhTSE9mYjNw?=
 =?utf-8?B?bzErdGlsTzRFZUlVLzlUc0Frd2JMaXV3bHpnL3FsUENkR3JlMjBOaXQ2d0xv?=
 =?utf-8?B?Ny9PQ01NeEJQZTZnTFBiZ0ttL1ZIV01DNmd0cCs0L0p2WlRMaGlBUVRjelhV?=
 =?utf-8?B?c0QvMFJTRHFwWS9RTDc1UHEyWGUzbGNVeFZTNFRyLzBiRU9lNlFseVoxNlVI?=
 =?utf-8?B?em9kOXo0NUthRzB0L3JGL1BpMVZQQ0EzUDhRQW5aQkpoc3Nncm45UUV2ZTdE?=
 =?utf-8?B?MmFkTnVFZlRDN3RLV0pOVFljTkdkV0sxRkFvUloxcG03cHR1emJjODlJbkc5?=
 =?utf-8?B?Z1V5RzBaMktETk0xZFdvK3c1SVBLSGZoTGRHKzVJMFBtdW94bTNENjg5Tmhq?=
 =?utf-8?B?U0FMMzRkb2dsQTh0ZFhvRjliUTZZeWVuSXZoemJZbFRKVGZCZGdnRm9ZS3ZN?=
 =?utf-8?B?V0dRamxNMHlqMlpmNkpNcHFBaTA5Rm8wWDdGRlgwbWJZOC9HeU1xWXREL1RH?=
 =?utf-8?B?a29Rb2RsOU9MakJXaHA5cVlKbFVmYy9ZakxoM1dqQ255anpDL0dZL1kvVHE0?=
 =?utf-8?B?eXFaTE81bkRLWkdGK0RJcnFzODVzZkNsN1RUaUVlR0JFZHNTL2V0eEVjME5K?=
 =?utf-8?B?T0NDaFlHWitlbms2ajR6MzhTQkVYSnpYUWlIcit4YXZ3RXRYWnpsQXZZbjZa?=
 =?utf-8?B?Ty9qY2xLbGNoNG9xeENyVHNLMURRSVJGeSt5WmRMNUhaSkVESWpEMGM4YUpu?=
 =?utf-8?B?RXdFRVc3aUl1WWg3UU1aWmVXZVdnVnhJSmZhWlQrZ0dxNWtlODNyWC9XSSt4?=
 =?utf-8?B?eGcrWUJvQmZaaE0wYnVkODdpeSt4ZW1BNlNLVkRIcDUvL2FjRnpYSEs3RnBh?=
 =?utf-8?B?b3dSNWVhWE1yWUNRL0h1SklFWlg2Q2NldGwvM1o3VlozekV0TWJhUlgrbDZr?=
 =?utf-8?B?V1ljVC95NTg0VDdaVEtZa09Nd2JIa1AvSVNXN0tFZVF4VHJ4eWtROWsvaEt2?=
 =?utf-8?B?Rll1dDRNMXdGMU4rek5tN3BsTkl2SGhDSHpDQjc0TGdQc0VPRGJrVmh3SDFQ?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf3ab79-3a60-47a1-d7db-08da90d9ee66
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 14:04:51.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFdF6ag+Z5opknJAuSvU04oFgWeEHkQkQVInkCaAoohJTqSRSV8nDjCsdDdabJ2ioTJ0bzLm6IANgj4RMqaU6tQ6k+n6xIwaHnNuB6fGSOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------KctNjgc2umA9Yf0I0PQaJIu2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/22 23:47, Konstantin Klubnichkin wrote:
> Hi Johnathan,
> What do you think about implementing this feature using SMI?
> Is it possible to raise SMI on drive plug/removal?

Paul, my experience with SMI is limited. Systems I've used that issued 
SMI only did so for PSUs. The details have gotten fuzzy over the years. 
I believe the SMI only asserted on removal of the power cord(s). The SMI 
event resulted in a high priority interrupt designed to tell the BMC to 
get state saved before complete power failure.

Even if you had the SMI connection from the HDD enclosure, I'm not 
certain how you'd acquire the information about which HDD was 
inserted/removed. That is an implementation detail of your HW.

A back of envelope thought I had is perhaps the host side could interact 
with the BMC via a mailbox. The issue being you'd have to have SW 
running during the BIOS time, and when the OS was in control an OS 
helper app pushing the data. I'm not sure how feasible that idea is.

> Thank you!
> 06.09.2022, 18:54, "Johnathan Mantey" <johnathanx.mantey@intel.com>:
>
>     On 9/5/22 04:11, Paul Fertser wrote:
>
>         Hi,
>
>         An OCP Tioga Pass platform features up to 4 drive bays for SATA
>         storage accessible from the front and fully hot-pluggable. The
>         backplane is usually connected directly to Intel C620 PCH (aka
>         Lewisburg).
>
>         It would be nice to have information about the currently attached
>         devices (model and serial number) available in BMC inventory but what
>         are the ways to get this information?
>
>     Intel systems only get drive mdl/sn from NVMe devices that provide
>     that information via MCTP over SMBus. SAS/SATA drives, to my
>     current knowledge, don't supply this info in that mode.
>
>     The insertion/removal events are also managed from the BMC via I2C
>     to a FPGA solution residing on the Hot Swap Backplane. The FPGA
>     provides registers that allow the BMC to query the PRSTn/IFDETn pins.
>
>         Is it possible there's some additional module in the all-mighty ME
>         that can supply BMC with the current state of PCH SATA controller? Or
>         is there some other sensible mechanism other than talking to UEFI on
>         startup (which would mean BMC is showing stale and thus misleading
>         data till the next reboot)?
>
>         Even though the question is quite specific we'd appreciate any related
>         insights on the topic; there must be some side-channels to RAID
>         controllers and such for BMC to be obtaining essential information but
>         so far I wasn't able to find any documentation about this.
>
>     RAID solutions are outside of scope for the Intel BMC.
>
>       
>
>     --
>     Johnathan Mantey
>     Senior Software Engineer
>     *azad technology partners*
>     Contributing to Technology Innovation since 1992
>     Phone: (503) 712-6764
>     Email: johnathanx.mantey@intel.com
>
> -- 
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
-- 
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com

--------------KctNjgc2umA9Yf0I0PQaJIu2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/6/22 23:47, Konstantin Klubnichkin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17841662532977@mail.yandex-team.ru">
      
      <div>Hi Johnathan,</div>
      <div>&nbsp;</div>
      <div>What do you think about implementing this feature using SMI?</div>
      <div>Is it possible to raise SMI on drive plug/removal?</div>
    </blockquote>
    <p>Paul, my experience with SMI is limited. Systems I've used that
      issued SMI only did so for PSUs. The details have gotten fuzzy
      over the years. I believe the SMI only asserted on removal of the
      power cord(s). The SMI event resulted in a high priority interrupt
      designed to tell the BMC to get state saved before complete power
      failure.</p>
    <p>Even if you had the SMI connection from the HDD enclosure, I'm
      not certain how you'd acquire the information about which HDD was
      inserted/removed. That is an implementation detail of your HW.</p>
    <p>A back of envelope thought I had is perhaps the host side could
      interact with the BMC via a mailbox. The issue being you'd have to
      have SW running during the BIOS time, and when the OS was in
      control an OS helper app pushing the data. I'm not sure how
      feasible that idea is.<br>
    </p>
    <blockquote type="cite" cite="mid:17841662532977@mail.yandex-team.ru">
      <div>&nbsp;</div>
      <div>Thank you!</div>
      <div>&nbsp;</div>
      <div>06.09.2022, 18:54, &quot;Johnathan Mantey&quot;
        <a class="moz-txt-link-rfc2396E" href="mailto:johnathanx.mantey@intel.com">&lt;johnathanx.mantey@intel.com&gt;</a>:</div>
      <blockquote>
        <div>On 9/5/22 04:11, Paul Fertser wrote:</div>
        <blockquote>
          <pre>Hi,

An OCP Tioga Pass platform features up to 4 drive bays for SATA
storage accessible from the front and fully hot-pluggable. The
backplane is usually connected directly to Intel C620 PCH (aka
Lewisburg).

It would be nice to have information about the currently attached
devices (model and serial number) available in BMC inventory but what
are the ways to get this information?</pre>
        </blockquote>
        <p>Intel systems only get drive mdl/sn from NVMe devices that
          provide that information via MCTP over SMBus. SAS/SATA drives,
          to my current knowledge, don't supply this info in that mode.</p>
        <p>The insertion/removal events are also managed from the BMC
          via I2C to a FPGA solution residing on the Hot Swap Backplane.
          The FPGA provides registers that allow the BMC to query the
          PRSTn/IFDETn pins.</p>
        <blockquote>
          <pre>Is it possible there's some additional module in the all-mighty ME
that can supply BMC with the current state of PCH SATA controller? Or
is there some other sensible mechanism other than talking to UEFI on
startup (which would mean BMC is showing stale and thus misleading
data till the next reboot)?

Even though the question is quite specific we'd appreciate any related
insights on the topic; there must be some side-channels to RAID
controllers and such for BMC to be obtaining essential information but
so far I wasn't able to find any documentation about this.
</pre>
        </blockquote>
        RAID solutions are outside of scope for the Intel BMC.
        <pre>&nbsp;</pre>
        <div>--<br>
          <font face="Century Gothic" color="#1F497D">Johnathan Mantey<br>
            Senior Software Engineer<br>
          </font><font face="Century Gothic" color="#555555"><strong>azad
              technology partners</strong><br>
          </font><font face="Century Gothic" color="#1F497D">Contributing
            to Technology Innovation since 1992</font><font face="Century Gothic" color="#555555"><br>
          </font><font face="Century Gothic" color="#1F497D">Phone:
            (503) 712-6764<br>
            Email: <a href="mailto:johnathanx.mantey@intel.com" rel="noopener noreferrer" moz-do-not-send="true" class="moz-txt-link-freetext">johnathanx.mantey@intel.com</a></font><br>
          &nbsp;</div>
      </blockquote>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
      <div>--&nbsp;</div>
      <div>Best regards,</div>
      <div>Konstantin Klubnichkin,</div>
      <div>lead firmware engineer,</div>
      <div>server hardware R&amp;D group,</div>
      <div>Yandex Moscow office.</div>
      <div>tel: +7-903-510-33-33</div>
      <div>&nbsp;</div>
    </blockquote>
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

--------------KctNjgc2umA9Yf0I0PQaJIu2--
