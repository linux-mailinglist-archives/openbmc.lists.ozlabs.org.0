Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D65523EF9
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 22:33:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz67L0ql0z3bq9
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 06:33:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BhEm87qT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BhEm87qT; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz66m4ZM7z3bZC
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 06:33:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652301184; x=1683837184;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=fUkTgRt+gbgMhnq+/XAReQKuAxMvR14UWwGWRtyxr+0=;
 b=BhEm87qT3PQDiiJbOgyjRKYeXhjghwggvspPM7nFaQ4TDatHo9uUytTy
 X5n54AXP3D9hFh/p1E1XmqlKJmtGrAuw6ghBX+FvU5RVYSwZS4gHwsFeV
 n6EeR095gDRGpA9qVLtzLPc/z8OYFS3mqaEra5kStmLD2rGiem9HH/4jQ
 /IlBzl4cDUAmCfqgMn/7dwI5WtR1MwTZH4YpIh5JRxu9PbOYSUVKBHr0b
 a8gHjguEUdUOkcIfLXI/4HWIfltSAoGzMklh32u6dfYsVLp11XTqY7oYU
 tNGo+sx+xqEQju0JyBizmTo06PB+u/P77/8vcaTaN93/bHGnHmMvpMgI2 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269744228"
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
 d="scan'208,217";a="269744228"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 13:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,218,1647327600"; 
 d="scan'208,217";a="542467086"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 11 May 2022 13:32:00 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 13:32:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 13:31:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 11 May 2022 13:31:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 11 May 2022 13:31:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op5T/4uDeZ7pZ3yd2tK4abSja5EpJ3ELSIcZ/TApabm2Nv31CGMc/HBRTMJUsxlIRBoeMtcJTzv44vErifcZBrN/7MbrgdsOJVnfffk5Lo3A8jMdnH3r5tXkv/QnVh8KR/Io77ZTeIrSfWqNA+3OWYD4WkH5YrxE9YpnmpLry0HOFjYhdqe+hckZTju1R6p5AnP7qbkJAcfOWnvlNsPwAZ+BYcbhfYVmDhC2JF51E64pju0gh3GA71MluK0xVaZUuwKbQzNSxVFm65mEIABE1jBmBKR/ElzPxZDeArwbQ097aUjniCMqxXbS+3OO4UwcSrbpgPhSgFvGuKqlo2TTTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcoYaQ5675pi194wE2rppflp+BgESgT65xeBinQky4s=;
 b=NQtKawKSyQuP97F8ocZWWpM0kdm2DRa2uLPEn8y02pz5jUPscMF6qtzg1dRMM/QKWAt4x8tKMIdhkl18i13h7x6N29gfIeGzF78ueJIGBArQpR5X9j6zM6pwgEO0Ig/FARXs/ZsqrIBqfT3AVZfYdHGfzUNgnFxMj1KciKJJI9i7YBASgqB7uKYywkdp3vdJzz7YUZ5f3KbyXm5nB0shElPaQEdvvEGSfwWLZQXe4Yi/0Zr6avXV+G9pogQ3TBTvDsAFSWV+kVSN0OZ1nPqvQjVT9txtkehFdhlrqQ4hzH05IZW65VsUzeVYWYdDIm0CcUhMw+EJYEocZGT771Wh2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 20:31:54 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::1588:5bab:9784:2408]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::1588:5bab:9784:2408%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 20:31:54 +0000
Message-ID: <b64651cc-7da1-d8d4-eaa1-de4cd7555828@intel.com>
Date: Wed, 11 May 2022 13:31:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.0
Subject: Re: VLAN issue with NICEnabled property
Content-Language: en-US
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>, <openbmc@lists.ozlabs.org>
References: <93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CUr6HRIlgI0Fb31fV10HdZBI"
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8b4f115-76f1-418b-913b-08da338d4945
X-MS-TrafficTypeDiagnostic: SA2PR11MB5020:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <SA2PR11MB5020741CC234576EECA0437EE2C89@SA2PR11MB5020.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVc4JLQJP+YPm+0LugCEiEPF5QaIo4qPu4O6Yi3umMKTSR3Qs3NXjsJif2GRu4P9CMtzJxNw5I8TNcUsAmXUI+03SaAhaGPUbzOrivRwQUEDT0hrKnfHhi+SbpNOlhpy0FbVVuor2amQ5BxMHX0ySb2nMWfN4++a/lDyBQZz6R/fiuAYxbYO/3xYYoHhz7ekL0I/Kkt9BN98kpkxgmyDWOEiKG3+KpNYpmDwt/gniNw7sYBWnvkUwex+Bxq34WcnQbVYZYE261vRnGlidEr6B3hPHGGhRQoD9KJWA9Fj6VJ8AyAdngm7iZGFptvBRbRHbKWysJkFOXOfQNSA/oIKDgr2mpl7sfno8OGELToQHEdaAQ9JD44/8XtZ37mJThh/yi+GZjF46rg0svw/KTZPFpUZvgm4yrAXDXP4h6PCOvIE+Sq02lCnn6CViPGJQm99xuqgZku0+6Tlh96wFFfqUJhoWXua1o8v4rUrl2iZ/WuqhNQ3G3KSmihC4AEkqwWRAB+hOA25Zds01FhxsHeiIoPelqbd7J1KVJ3rdj9AXuiKMB8aoqdZADJg5SSSoWxkFHnfinXqksC4FHsWhtGh5obHAAGj3WfvLH7yWX1yfxJdmHvyP8CetcpznEKSY68mu300y+gjDVSAHNpJx46o2J99gb9trMZYdp76+votbPtRglP7YN7+UaSLI8milBh2xwsUU/v9AuMblzOZAag5eHARUwwywV8pO2q+G4YGIzwYMQSWWXDq0+eZYixQEF+/+qcN7tCGv0H7NhuQopzwbAuy6QDl6FzOAgBaCM/MqITEuQq1UmGbNGnQxPtKCfkj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(2906002)(235185007)(31686004)(5660300002)(8676002)(40140700001)(66556008)(66476007)(66946007)(4326008)(38100700002)(6486002)(186003)(966005)(83380400001)(86362001)(31696002)(2616005)(8936002)(26005)(6506007)(33964004)(53546011)(6666004)(316002)(21480400003)(82960400001)(6512007)(508600001)(166002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cktybi9WZ2xGYkpSbkV0cnRneVNQTG01dEdHci9oeW5HcGNCaFB4dnlsSlp3?=
 =?utf-8?B?bXVuOEdlMEd1dzJKZ1lyRTgyNW9JanlIRWU2eXQ2Vk9TRXdtYWVzT0ViNGJy?=
 =?utf-8?B?ck5ZNTlmamszMVNXUEd2Rm93cWhKODk2N1gwaS80VnFQK1pwWEFUdTdVN3Mv?=
 =?utf-8?B?NHAyM2M2aG5WczNQWmhuek83MjZ2MVk4QTNNVlY3RDVMUEVGUWV0MnMrcmhj?=
 =?utf-8?B?NUVFaUdLWlpaSUI0Yk5xUHd6TjBrRmVudkVMUFR2cUJsU3BZTU9PdEFaQjlx?=
 =?utf-8?B?Q2JnekhsUmZtWlcwaUtBSFlhdFArZ3A0VmFQQ2xIaFhxT2ZMb1daVmJzMEdI?=
 =?utf-8?B?RGVDbnd2aTFpbUw3M1RJNU41dnlkcUV0VzVCNHBIbS90VG41YTBSWlAvQUds?=
 =?utf-8?B?WlV5OVR0QlRTUUtPbzlLUS9tbWVVUGVmUmJnd0VoQm44RlpUbTB4dDA2c0gr?=
 =?utf-8?B?NXFHdmo5eEs1REhzOVJuclNndWh3UEQwWlVRakptcWhPRERTR0pwdC9hcldK?=
 =?utf-8?B?Y1FQUVRLVlo1NGE4dWk3dVlaRkxuUDN6S1hwS0wzVG5ac2Q5cmhLZjRxQmQy?=
 =?utf-8?B?dlN4SGhzdXhPK0VzZUcwQnNoQWhqOStCRHduVXlMckRkS2J2a0daYjVhKysv?=
 =?utf-8?B?K3pKekJ3ZXF2dkZwZk1aaEZlRjN5Z3BuZ29mcndpT0E1MlM2UUw0V1lCWE5T?=
 =?utf-8?B?VmZyQTBKVU0rODdLcnBJcHhwRFBoYmVIMG94QlNpVTNZRDVFSmdUYW5vSEhB?=
 =?utf-8?B?TTRFUjRraGdSdyt4Yzh2RmpxMGFmV01rOTZpTlVnK0FMWXJabjY3aTF0Zndt?=
 =?utf-8?B?TFVTdktTMGFoNWhFWERMSUNsSjUyWlZLSGFtRW0ydkNleHdwbHVBUFpON0pi?=
 =?utf-8?B?TU0xZnZtWXRBTEtBbkI4UmQ2dllOQTluUU9jMFVGdVRwUjlwQ01VdndrdTNX?=
 =?utf-8?B?Z0duOFUyemVibDU2MkNucnVUc1I2M1hXU1BLMW1tdzJOdjBhUUErcWw3U0hD?=
 =?utf-8?B?WXFYNFNkTlYremZIY3RGaW9XYVpnc25TbXhUaFRlTk13SURyTHFDRnpkbkpJ?=
 =?utf-8?B?ZkVFcXFpcmo5MFYxRmFiazBiUWVKYk40c21aL0MxL01Rendta1dST1haeWZC?=
 =?utf-8?B?QzUzMG9XeGx5L3hFcVRqYUJTeFV2eDdZeDNHV05sYjNxbHBUNlNxYlRpT3NX?=
 =?utf-8?B?YzdEcDVNTjdzcFdmbjJNcllzVVlqSENESEp3WEFpTFJLUm5sWTNlSDk4LzA2?=
 =?utf-8?B?amNRaHVyMURLaDhGM3Y0L29TRVBJTTdUaWtoNWM1T0xGdDA3RndZK01OSWxu?=
 =?utf-8?B?cXQvNTNTWEZjbVJOdTV6WXlaeXFyK3NNS2VQZkZqU05BOEJTcmZnZFdmNFYz?=
 =?utf-8?B?eXpzZjlJd0dZSXAvc3lnMTI1K2FNbC85TmJvTml5VlNRaS9vdElJaHRHR3Js?=
 =?utf-8?B?UWYzdHJBY1ZVWmp0YVdpbCs1eVZEUW9tVCtwWEwxRHVtRUt1eTJnMDZ4c2Zu?=
 =?utf-8?B?cWtEeEZPZTJZa0VpVjZKNVNWVzVvZng1dmlUVmNUNEJSTDhUZFdjYjJnWmdB?=
 =?utf-8?B?RGxwaTRBb0ptbFRiU3lqM1hxNzhrWWdzd2VSR25iZDJ2ZFB0TElEYjVDcXpH?=
 =?utf-8?B?Y3FjOTMrRllIcm5iMHQ5Y0pMdGVnL2w4Y2piQXV1R2lJU1NnOWFqb0xaejhO?=
 =?utf-8?B?M3Z6cmo1d2hGdGw4TmFhRng2T3RuYWQvVVRFMVdzSVFXWktONE5lSnNrZGRC?=
 =?utf-8?B?WXJGam5USzhSTWlxRnVPYVMvYXprSnBNYjB5Qnk3VDcrcEExMXkrQkF5Szdh?=
 =?utf-8?B?cG9DbFppallCZE5yVVMyeVF3bnZPUmZZaUg0TzluWUN3b3RUM1lrWld1bGNC?=
 =?utf-8?B?RGlGdlp2UjM3NC9ja3pmQXhXZGQ1TThTd0R1Mm5qR3MzUGZDN3lkNFNLYUFE?=
 =?utf-8?B?cXdQblJXY09DMVB3eFhmL1A3UUVvYjJTUjFhK3Q3eDcrS3Q0aDFSWWwwZ00z?=
 =?utf-8?B?S2NEdDVZWTBUT3dRWHJ4NzZpZW1yVDAwWU56KzU2VWdwdkprNENITVRYVURy?=
 =?utf-8?B?R0NHTGxrZVhYY2ZlejIxdGZHa2ZXMTZLZGdDbjJHWnFyWGZDOWNCL3NtdXZC?=
 =?utf-8?B?TU9BMU1EcE03ZjRFK0xpMTQ0RVpQV2xaL3kvaXRTMlBxZDB4T2d0bHAvL09z?=
 =?utf-8?B?WktTMHo5TFQrRnlMd0paNjZ0SnZYTUhlZi9RNXYrQVM3WnhwK3VUTGx1RmhP?=
 =?utf-8?B?dXgvdzRSVjlsenlnQ2gwODFvTnh1ZGRTaFQ5eHhwVVpVbHFCbUpkcTl1MGF0?=
 =?utf-8?B?aTFyM1dnL09McEk1V3VsVVVTU0hUd0ZndEhSNllJYS9oMjFiYVdJaDdFUHYy?=
 =?utf-8?Q?Jj3EIm1No/VTHu50=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b4f115-76f1-418b-913b-08da338d4945
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 20:31:54.0922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tkXm/qycq2M3ky3ej7OE9viO/3XxZPhw/l7eAJccdx7NYm2OGiwMT0LEJbKzUlUmfxdP9JdJilAxUnDHCYiQZ+595EBCw7lPQzsxr+vDHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
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
Cc: wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------CUr6HRIlgI0Fb31fV10HdZBI
Content-Type: multipart/mixed; boundary="------------pZttO2pLdefXlS5cGa6EoJpS";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>, openbmc@lists.ozlabs.org
Cc: wak@google.com
Message-ID: <b64651cc-7da1-d8d4-eaa1-de4cd7555828@intel.com>
Subject: Re: VLAN issue with NICEnabled property
References: <93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com>
In-Reply-To: <93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com>

--------------pZttO2pLdefXlS5cGa6EoJpS
Content-Type: multipart/alternative;
 boundary="------------2q4b0gR4P307sHaliOmqNXKv"

--------------2q4b0gR4P307sHaliOmqNXKv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8xNS8yMiAwNToyOCwgSmlhcWluZyBaaGFvIHdyb3RlOg0KPiBIaSwgYWxsDQo+DQo+
IEluIHBob3NwaG9yLW5ldHdvcmtkLCBzZXR0aW5nIE5JQ0VuYWJsZWQgdG8gZmFsc2Ugd3Jp
dGUgIlVubWFuYWdlZD15ZXMiIGluIG5ldHdvcmsgY29uZmlndXJhdGlvbiBmaWxlLiBUaGVy
ZSB3YXMgYW4gaXNzdWUgd2l0aCB0aGlzIHByb3BlcnR5IGFuZCBpdHMgVkxBTi4gUmVib290
IGJtYyBhZnRlciBzZXR0aW5nIE5JQ0VuYWJsZWQgdG8gZmFsc2UsIGl0cyBWTEFOIGludGVy
ZmFjZXMgZGlzYXBwZWFycywgYW5kIGlmIHNldCBpdCB0byB0cnVlLCBhbGwgcHJldmlvdXNs
eSBjb25maWd1cmVkIFZMQU5zIGZvciB0aGlzIGludGVyZmFjZXMgd2lsbCBiZSBsb3N0Lg0K
Pg0KPiBUaGUgcmVhc29uIGlzLCBzaW5jZSB0aGUgaW50ZXJmYWNlIGlzIHNldCB0byBVbm1h
bmFnZWQgaW4gY29uZmlnIGZpbGUsIHN5c3RlbWQtbmV0d29ya2Qgd2lsbCBub3QgY29uZmln
dXJlIHRoZSBpbnRlcmZhY2Ugb24gYm9vdCwgaW5jbHVkaW5nIGNyZWF0aW5nIFZMQU5zLiBP
biB0aGUgcGhvc3Bob3ItbmV0d29ya2Qgc2lkZSwgaXQgY3JlYXRlcyBpdHMgaW50ZXJmYWNl
IGxpc3QgZnJvbSBnZXRpZmFkZHJzKCksIGFzIFZMQU4gaW50ZXJmYWNlcyBhcmUgbm90IGNy
ZWF0ZWQsIHRoZXkgd2lsbCBub3QgYmUgYWRkZWQgdG8gdGhlIGxpc3QuIFdoZW4gc2V0dGlu
ZyBOSUNFbmFibGVkIGJhY2sgdG8gdHJ1ZSwgaXQgcmV3cml0ZXMgdGhlIGNvbmZpZyBmaWxl
IHdpdGggdGhlIFZMQU5zIGluIHRoYXQgbGlzdCwgc28gbm8gVkxBTiBpcyB3cml0dGVuLCBl
c3NlbnRpYWxseSByZW1vdmVzIHRoZSBwcmV2aW91c2x5IGNvbmZpZ3VyZWQgVkxBTiBmcm9t
IHRoZSBzeXN0ZW0gd2l0aCBkYW5nbGluZyB2bGFuIG5ldGRldiBhbmQgY29uZmlnIGZpbGVz
Lg0KPg0KPiBUbyBzb2x2ZSB0aGlzIGlzc3VlLCBteSBwcm9wb3NhbCBpcyB0byB3cml0ZSAi
QWN0aXZhdGlvblBvbGljeT1kb3duIiB3aGVuIE5JQ0VuYWJsZWQgaXMgZmFsc2UsIHRoaXMg
b3B0aW9uIHRlbGxzIHN5c3RlbWQtbmV0d29ya2Qgbm90IHRvIGJyaW5nIHVwIHRoZSBpbnRl
cmZhY2Ugb24gYm9vdC4gQnV0IGl0IGlzIHN0aWxsIG1hbmFnZWQsIG1lYW5pbmcgdGhhdCBp
dHMgVkxBTiBpbnRlcmZhY2VzIHdpbGwgYmUgY3JlYXRlZC4NCg0KVGhpcyBjb250cm9sIHdh
cyB0aGUgcmVzdWx0IG9mIHVzaW5nIHRoZSBVbm1hbmFnZWQgZW50cnkgZm9yIGRpc2FibGlu
ZyANCnRoZSBOSUMuIFRoZSBwaG9zcGhvci1uZXR3b3JrIGNvZGUgbmVlZHMgdG8gY2hhbmdl
IHRvIHRoZSANCkFjdGl2YXRpb25Qb2xpY3kgY29uZmlndXJhdGlvbiBvcHRpb24sIElNTy4N
Cg0KPg0KPiBCdXQgdGhlcmUgaXMgYSBxdWVzdGlvbiBvZiB0aGlzIHByb3Bvc2FsLCBob3cg
dG8gc2V0IG5pY0VuYWJsZWQgcHJvcGVydHkgd2hlbiBjcmVhdGluZyB0aGUgaW50ZXJmYWNl
PyBVc2luZyAiQWN0aXZhdGlvblBvbGljeT1kb3duIiBzdGlsbA0KDQpXaGF0IGRvIHlvdSBt
ZWFuIGJ5ICJjcmVhdGluZyB0aGUgaW50ZXJmYWNlIj8NCkFyZSB5b3UgcmVmZXJyaW5nIHRv
IHdoYXQgdGhlIHN5c3RlbWQtbmV0d29ya2Qgc2VydmljZSB3aWxsIGRvPw0KQXJlIHlvdSBy
ZWZlcnJpbmcgdG8gaG93IHBob3NwaG9yLW5ldHdvcmsgY2FwdHVyZXMgdGhlIG5ldHdvcmsg
DQpjb25maWd1cmF0aW9uIGluIHRoZSBkYXRhIHN0cnVjdHVyZXMgdXNlZCB0byBtYW5hZ2Ug
c3lzdGVtZC5uZXR3b3JrIA0KY29uZmlndXJhdGlvbiBmaWxlcz8NCg0KPiBoYXMgdGhlIGlz
c3VlIG1lbnRpb25lZCBpbmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLW5l
dHdvcmtkL2NvbW1pdC8yNjI3NWEzZjJlY2ZmZTYyNjQ2YjY1NjQ2YzAwYTllNTZjNzViZmY4
LCBob3dldmVyLCB1bmxpa2UgVW5tYW5hZ2VkIGludGVyZmFjZXMgd2lsbCBoYXZlIGlzIEFk
bWluaXN0cmF0aXZlU3RhdGU9PW1hbmFnZWQsIGEgaW50ZXJmYWNlIHRoYXQgaXMgZG93biBo
YXMgQWRtaW5pc3RyYXRpdmVTdGF0ZT09Y29uZmlndXJpbmcsIHdoaWNoIGlzIGFsc28gYSBw
b3NzaWJsZSB2YWx1ZSBmb3IgaW50ZXJmYWNlcyBuZWVkcyB0byBiZSBicm91Z2h0IHVwIG9u
IGJvb3QsIHRob3VnaCBpdCB3aWxsIGJlY29tZSAiY29uZmlndXJlZCIgd2hlbiBpdCBpcyB1
cC4NCj4NCj4gT25lIGlkZWEgSSBjYW1lIHVwIHdpdGggaXMgdG8gdXMgY29uZmlnUGFyc2Vy
IHRvIHJlYWQgdGhlIEFjdGl2YXRpb25Qb2xpY3kgZnJvbSBjb25maWcgZmlsZS4gQW55IG90
aGVyIGlkZWFzIHdpbGwgYmUgYXBwcmVjaWF0ZWQuDQo+DQo+IFRoYW5rcywNCj4gSmlhcWlu
Zw0KDQotLSANCkpvaG5hdGhhbiBNYW50ZXkNClNlbmlvciBTb2Z0d2FyZSBFbmdpbmVlcg0K
KmF6YWQgdGUqKmNobm9sb2d5IHBhcnRuZXJzKg0KQ29udHJpYnV0aW5nIHRvIFRlY2hub2xv
Z3kgSW5ub3ZhdGlvbiBzaW5jZSAxOTkyDQpQaG9uZTogKDUwMykgNzEyLTY3NjQNCkVtYWls
OiBqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20NCg0K
--------------2q4b0gR4P307sHaliOmqNXKv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    On 4/15/22 05:28, Jiaqing Zhao wrote:<br>
    <blockquote type=3D"cite"
      cite=3D"mid:93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi, all

In phosphor-networkd, setting NICEnabled to false write "Unmanaged=3Dyes"=
 in network configuration file. There was an issue with this property and=
 its VLAN. Reboot bmc after setting NICEnabled to false, its VLAN interfa=
ces disappears, and if set it to true, all previously configured VLANs fo=
r this interfaces will be lost.

The reason is, since the interface is set to Unmanaged in config file, sy=
stemd-networkd will not configure the interface on boot, including creati=
ng VLANs. On the phosphor-networkd side, it creates its interface list fr=
om getifaddrs(), as VLAN interfaces are not created, they will not be add=
ed to the list. When setting NICEnabled back to true, it rewrites the con=
fig file with the VLANs in that list, so no VLAN is written, essentially =
removes the previously configured VLAN from the system with dangling vlan=
 netdev and config files.

To solve this issue, my proposal is to write "ActivationPolicy=3Ddown" wh=
en NICEnabled is false, this option tells systemd-networkd not to bring u=
p the interface on boot. But it is still managed, meaning that its VLAN i=
nterfaces will be created.</pre>
    </blockquote>
    <br>
    This control was the result of using the Unmanaged entry for
    disabling the NIC. The phosphor-network code needs to change to the
    ActivationPolicy configuration option, IMO.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

But there is a question of this proposal, how to set nicEnabled property =
when creating the interface? Using "ActivationPolicy=3Ddown" still </pre>=

    </blockquote>
    <br>
    What do you mean by "creating the interface"? <br>
    Are you referring to what the systemd-networkd service will do?<br>
    Are you referring to how phosphor-network captures the network
    configuration in the data structures used to manage systemd.network
    configuration files?<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:93ff730f-ee5c-b5a1-9e14-873248ff969f@linux.intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">has the issue mentioned in <=
a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/phos=
phor-networkd/commit/26275a3f2ecffe62646b65646c00a9e56c75bff8">https://gi=
thub.com/openbmc/phosphor-networkd/commit/26275a3f2ecffe62646b65646c00a9e=
56c75bff8</a>, however, unlike Unmanaged interfaces will have is Administ=
rativeState=3D=3Dmanaged, a interface that is down has AdministrativeStat=
e=3D=3Dconfiguring, which is also a possible value for interfaces needs t=
o be brought up on boot, though it will become "configured" when it is up=
=2E

One idea I came up with is to us configParser to read the ActivationPolic=
y from config file. Any other ideas will be appreciated.

Thanks,
Jiaqing
</pre>
    </blockquote>
    <br>
    <div class=3D"moz-signature">-- <br>
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <title></title>
      <font color=3D"#1F497D"><font face=3D"Century Gothic">Johnathan Man=
tey<br>
          <small>Senior Software Engineer</small><br>
          <big><font color=3D"#555555"><small><b>azad te</b><b>chnology
                  partners</b></small><br>
              <small><font color=3D"#1F497D"><small>Contributing to
                    Technology Innovation since 1992</small></font><small=
><br>
                  <font color=3D"#1F497D">Phone: (503) 712-6764<br>
                    Email: <a href=3D"mailto:johnathanx.mantey@intel.com"=

                      class=3D"moz-txt-link-freetext">johnathanx.mantey@i=
ntel.com</a></font></small><br>
                <br>
              </small></font></big></font></font> </div>
  </body>
</html>

--------------2q4b0gR4P307sHaliOmqNXKv--

--------------pZttO2pLdefXlS5cGa6EoJpS--

--------------CUr6HRIlgI0Fb31fV10HdZBI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmJ8HTgFAwAAAAAACgkQOcg9x5uaKcA9
5wf/c16VgaAYseQmHmJ2Rhsk6P19qXf+4V6A1sFlwryG+o7dor5k9wjUUSUeXFjKmhhkycrwN/aw
5StbvvPLL5JuYTulRyEgW47sXMSY2hknPU2B+Ry02zEarI9yOKPs2aZRCICL4Z6SiDbo4bspJCnN
4wlEoMzNuXrOHg14dCZy7p3DXZizVarrRfwndG1ZFpF6D/cvL5uqO483vX0gDAuC0NDZu6+XDkJX
sjbzB0UXmxEGIG1HQawSSm1YLbxIpTbKKVumV1kB+VbpRYiUV2vrnq7AN2ss9WHuXaUDar3tQkPZ
sv1QjweGe31DeEHHOmUC5Fr4R0lC+6yKXzCjFfCmZA==
=b3ug
-----END PGP SIGNATURE-----

--------------CUr6HRIlgI0Fb31fV10HdZBI--
