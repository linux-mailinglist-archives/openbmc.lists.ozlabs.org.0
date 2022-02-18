Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BED54BBD1C
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 17:12:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0cD75C9bz3cVd
	for <lists+openbmc@lfdr.de>; Sat, 19 Feb 2022 03:12:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BTjbzMAv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BTjbzMAv; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0cCc2G4qz2xsr
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 03:12:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645200733; x=1676736733;
 h=message-id:date:to:cc:references:from:subject:
 in-reply-to:mime-version;
 bh=OwhcaPjt5Ztl7mm8NbxpTUuPpwCaGmSKEt5/U6J5sAc=;
 b=BTjbzMAvWqJOWsjNojsqlkJeFMOGcFLU+9ZARL41koiMNwl9ZgVr5w1f
 6IOB03YOz5nRu365vSu5zgw46VeBur4qr+qSHUpsdijsT9lCO8sBN1krJ
 kDdZok0ZmBwj15l7delOIGvehwTPY/GiAG3l3suu819+tz6Q7MrgOpEaB
 NXBnftirMr6ZOX9JYdMpOZ56CU82MvezC1iZjhSMvJd1P8Lf9F2XWT69T
 0RSfanjAC1TC55nLOzHo6N0LdacK8u9sLIHB5hmWHP3KZO+QYl9lRVm39
 xg4bn1TPtMGyucSlColCKg2CG3OhpXKUHeP4+cuA5I+QKDOaCNz8Jqslu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311896365"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; 
 d="scan'208,217";a="311896365"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 08:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; 
 d="scan'208,217";a="637780337"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2022 08:11:06 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 08:11:06 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 08:11:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 08:11:06 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 08:11:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNLI4tgH7F9Ph1rfvbQBHds/d0bQofu1Faxq476dVfHBj/XyB2D0hMzvetLfNS0efskH50hpuwI/Qxi29CBDM1kN2u5xrVs4ekT8EGX+4B2CKwEeM7RDwlInd10eNuy0bB743ltnDaGa52zhgdsFDBCsRHi8Dzk8YyZ+x1y7J/Q2W2U6j2oJ5RMNyVizPuEo6x6S1qh7wfuuT0H9nmam4IO+QzPB4t1jzE1Aaee3monCbMhKa0p+z570K/VeMN9+7S4SVVxNLtNj0cbPyiOe9bciV0KJxTZinzKXqRph+yK3qZ9RR9lgNoytDhyBVVAXwf6Gu2x1isIdXLFXPOIcVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbe2eyT9vbl2+2lkM12Y4OO69hCG0V6Y4TdOwDAl3uQ=;
 b=X7O+Vl8KbFZadu2b+7ilYU9n7YVNnXQg9rrynyWRBlwpglqGiNR56HsOCecgN2PKY3e61kjh59S0vT4TnBEnYT7/lSe8cWOFbAH6zgzST04h0m+ZoLZ38KKk5X6hBhMWJWPw39ctldV+rUMzk1oK52JdLDgqVJCocc0y3ii9SUrv31+zPi7LwrunA7Dxm6MOx90EgOMRvgdux9mGhzCTk94YQBeQTJg18O9nz1ezUuxmbX8wRT4TcgMSsafz4MOprmSbNjF5U4QwOKp0gQQ7imEaX0m46G2RIxTdbh5bEs1qengRLiHpfjuBmkIQDUMapWUwStQe8/TodTCvje/XBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Fri, 18 Feb
 2022 16:11:04 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92%5]) with mapi id 15.20.4975.018; Fri, 18 Feb 2022
 16:11:03 +0000
Message-ID: <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
Date: Fri, 18 Feb 2022 08:11:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: Lei Yu <yulei.sh@bytedance.com>, Jeremy Kerr <jk@codeconstruct.com.au>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Checking for network online
In-Reply-To: <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JJmNn2gWMifbi0l47i9hBCSJ"
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fef8b1dc-c03e-46c1-5d8d-08d9f2f942b3
X-MS-TrafficTypeDiagnostic: LV2PR11MB6000:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <LV2PR11MB600095B815A8432651C2397AE2379@LV2PR11MB6000.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxN76mSwdCDGCDFtB9CnTCSRH4alh0DuslBLPk1d9Swvmh84w8zeahAsJeIF8T/O8T4MFdnM7zKlhFLlECDsBkJJrLtPd98bXQ0cwDNr8A+xGkvkzuc8UL7va8b6e3tS461mVS3gY2Q5Qn9ay3iWj/uq1e+OeCHwEPzi5l8Ji9U05zNGGmLd46Xc6Z0VHvS87rm/a283gpIDOl+9U508HJCxX5dTmJdyPd9tcemmKelPEQaizJa9PfkFgF+Umd2141ApcZeyuAdAclZVZjMk8Fw/IuScSijql4KnNJ3qfLwJ7ETMCY+/1fbticOqvc+ftEXwYPH7bUIe7rpyy4sjiyYpOAzHFOwHRPpDGUAiMKHKgqFoDhgugnkjd/qkQmmv/LkP6SZNHex49LbzPCOda3mdqJbznjcMf1ds1CxIaW/ewMQEejA0Dd9YrAlqc4Eq0+YMd8Fo4W/W1qwlwwNGgrKCdcWC04+3tVwNyB2YK/2SdPhsFqz/wKs1OV6BVCaLzPBdazxEP1+tWiDBCdV8SLVIon4OzBgGJccSHpOPZ/rrxv8tQTXH/WCmc9qYX9D/HiJBnLbxdQMUQSFjqqniUd8By41mXc7oimN4BlDSSmJLIaIZfYKWoX3ZVBgnpP2HtJCOIk57rxtcFKOv32B6EerZZyt1gNkaLtpopJ4aLhgQb5d4FuSQsTIOzkUKEKV7l4/C1iCYxP/+CBIb0oIMAf+YlOZ8ODqID6xnJ0MpwXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(31696002)(26005)(21480400003)(4326008)(83380400001)(86362001)(38100700002)(40140700001)(82960400001)(3480700007)(166002)(66476007)(66556008)(8676002)(316002)(6486002)(966005)(36756003)(110136005)(31686004)(2906002)(8936002)(235185007)(5660300002)(6512007)(53546011)(6506007)(33964004)(508600001)(2616005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDBOS2x2eWZVd2pVUENjclk2S1Z2SEVtVHEvYWp4VXMzeHdKWk5PWERpVnFU?=
 =?utf-8?B?T1Jub0NQNk1BdldtZ0RnMjUzamZrampLd2lpTFkvMEt1ZmlqZE5ka1lzTUo1?=
 =?utf-8?B?VlRHUmN0RnR2eFV0d3RpQ0VqR0o2Wm52MkxpeTdXbytFSncrOW9ZMnpKbmNn?=
 =?utf-8?B?UnhmTk9IUlVwRzVjVDJQWWd6OFJXU1pscDBpTmxJbzRCeFJObG1VdW1Fb1BV?=
 =?utf-8?B?N0UyNXF4ZTB4eUFhWmxKOTJoZGlidHhESXhVVCs0N0pDZjVCWW1qVVJiclph?=
 =?utf-8?B?ZlQ0dTkzODlCRnJGaG9jQjR6TDR0Y3BaNm1BMkxWKzJXcU5RZldWTzdvOWlC?=
 =?utf-8?B?YlJ5emFFenNaWkVJWnpiTHlnZXZzOFdSSEhwUW82WXllOVRlcWV5UmJObW1n?=
 =?utf-8?B?V0Z0RUhBRzFSaU9oK1RCMXBtd3pkc251TzhrV1pIWGxwQ2g2RWtaUmpKK1Ix?=
 =?utf-8?B?M1loZlQ0YmY5ZVVuYnFzc0NXVTc2bjFhYytKbDRVeXhmU0NTbkRrc3EwOFpr?=
 =?utf-8?B?d3FMQ1gvbU1EUWx5S2VRdlZGU0s0dXBxOXBpWCtaZmZTdTNnTGVkcnNFZEVh?=
 =?utf-8?B?b1dZbS8zQ2cvRlRWODlJd1lWRFRZNjB3Sm80OGRFLytVY0RTKzVWUUxUNEhm?=
 =?utf-8?B?Wk4rM3AxdHE5UHlhTDhLUjZ5aHVmbHA0QjRlOEs0TGNpNW5zWkNEdGpUT1Rm?=
 =?utf-8?B?UUo4RVB3U0dSdkNCcTFIWmR3eGNqc2RzcndUUW9nSHY0NHFxMVhLS2JBbEF3?=
 =?utf-8?B?eWIvMDEya1ovdFBxK2lPUUR4a3MwNnR1ZVdzVk5CZXB6K3VxcERPanN2Wi9p?=
 =?utf-8?B?MGozWXhnclVqbWRGempNRU9PLzB2czVrSGxiM3QvUzVTSEN5WTYxZXFtMUJD?=
 =?utf-8?B?NlcvcVAyd0pMVW5ZWVBPY2hCN2paQzIvN1VKQnN2bGdKMmhtS1E4b2pjNUVl?=
 =?utf-8?B?Q3d2MHhvTWZ5eng3NUVuQW11RmpQMWxZWllmb1JDYUwyZVcwaFpxME8xRUZ4?=
 =?utf-8?B?T0paSFhtMDRZSktIYzlFbGl2TUt4M2ZxcXNuVEFVRk1tSUFuY3NaU0dOY0dW?=
 =?utf-8?B?V1RRWlV2RzNnUEFpdi8rMHRud2Q0eklSV1h3NTRzS0NYNU82cnJzNGxmY3py?=
 =?utf-8?B?OExITlROVjBLRTJMOFQrUEplYTBWQ2hXMFBETGM4Q0p4ME4zMy93RnV0Y1Uz?=
 =?utf-8?B?RzF4Mm5VZVBuVlVaVEcwU3JaY0FPRWNETTl4MGxSbUNxcG5LSjMvb0Vac3F2?=
 =?utf-8?B?amlXSnUySDQ5bVl6VWh0YW9Yak5ERHBXQVIyV0xWKzB1NitpdjZySlBzTzVD?=
 =?utf-8?B?ZE0rVVRicU9tR01TeCsra1ZPL3FmTHlSc0JpelBRQmdiVXpvemZiK09nSngz?=
 =?utf-8?B?NjN0dzFmNnlxMnBvdmM0Q1Mydng1NjVEUUF0c21RNEVqaTRXUXlVL2ZoVENu?=
 =?utf-8?B?Q0dIc21Ob1JoTGNWM3F6VnVtMWljTzRjTitTWUIxeFJoOXoxNXhneUI5Z3g1?=
 =?utf-8?B?VWlycWhydWgzQnpLVGN1b3FVbUdYKzNlTERFcDJuUEkvL1Y3dW5qTC9UU2Yy?=
 =?utf-8?B?SnJ5ZmxSMFQ0dWdqR3g3MGJ3ZWZxNHZjeFdXQzBWb2kyL1ZSS0UrTmZtWHJt?=
 =?utf-8?B?U3ZONktZbVJMd21pV3BXd05zRk9xWUlpcVFPNnRwSFhVekZtdGFDUU16dXlC?=
 =?utf-8?B?WmVMWnJzOWVCdSs1eDJucWtjUnBkaDI0aXh6c05naDBkYzNXUjJNSXJ5MGFH?=
 =?utf-8?B?UjcxRlN4YnE4c3Bib2xGa2lSdmlFK3d5U3dyeGdKc2w3SkdrSlgwd29GMmhv?=
 =?utf-8?B?SzVnYjNaWDFxd0VZM1o1Yzd6WDF6bTYyTzlDSGlPOWVMUFl6UTNYcS9hY0RK?=
 =?utf-8?B?dFpDSklMNDhLYnhqRVR5WW96NE1yWnlET2xwYzZRQk41d2xNQlcyeTUrK0Vx?=
 =?utf-8?B?ZnZkLzhRMkR5MkZSM2tyYmZiZUVaOGkvb0kvWHl1d2pwTW5pR1BzazN6UWxO?=
 =?utf-8?B?V28vRFNyNVIybi9nS1NGQXRUdVd2V1d1T0w0L1ZnZkExSStjTEg1QkxDLzNo?=
 =?utf-8?B?S3JXbW52dXdMSDZoK2pqOUJNRitTUGIvWnpxTFJOekNXTFlZdUpVTHB6UGYr?=
 =?utf-8?B?d0kxUkU4SzdXQ2Zsd1FwSXdia1VwaXBnU2I1bFVWdkZiK2c5M2l3ekRSOWE0?=
 =?utf-8?B?ZVlSYnRBZGVWNkNQNG1hd1ZVbzd2RnQ5ZFJDWTZ0Q1ZtSlVuRW9OWWM2T1Yv?=
 =?utf-8?B?L0lFYk9GWm1tUVBLMy93VlMxMkVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fef8b1dc-c03e-46c1-5d8d-08d9f2f942b3
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 16:11:03.8686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZM0dbbYpyjDXOmNKvfeZj5xq+hqVU/r5p0bqxIc9uJIh3PlwbV/v+aXo+5neXQxB8XHUtJait0o5mhn1z4Se7EvdLqYTfj30s8C4H+4bLrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------JJmNn2gWMifbi0l47i9hBCSJ
Content-Type: multipart/mixed; boundary="------------qzSOJVeeQtoO3S4HOqko7i85";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Lei Yu <yulei.sh@bytedance.com>, Jeremy Kerr <jk@codeconstruct.com.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
Subject: Re: Checking for network online
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
In-Reply-To: <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>

--------------qzSOJVeeQtoO3S4HOqko7i85
Content-Type: multipart/alternative;
 boundary="------------aBC42CEPOnl0Cpc64j0JcU33"

--------------aBC42CEPOnl0Cpc64j0JcU33
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmVhZGluZyB0aGUgLS1hbnkgc3dpdGNoIGluIHRoZSBzeXN0ZW1kLW5ldHdvcmtkLXdhaXQt
b25saW5lIG1hbiBwYWdlIA0KZG9lc24ndCBsb29rIGxpa2UgaXQgd291bGQgYmUgaGVscGZ1
bC4gVGhhdCBmbGFnIHBlcm1pdHMgdGhlIHNlcnZpY2UgdG8gDQptb3ZlIG9uIHdoZW4gb25l
IG9mIHRoZSBOSUNzIGFjaGlldmVzICdvbmxpbmUnIGZ1bmN0aW9uYWxpdHkuIEluIHRoZSAN
CmNhc2Ugb2YgYSBOSUMgdy9vIGEgY2FibGUgY29ubmVjdGlvbiAnb25saW5lJyBuZXZlciBo
YXBwZW5zLiBUaHVzIHRoZSANCmRlZmF1bHQgMTIwIHNlY29uZCB0aW1lb3V0IGlzIHN0aWxs
IGdvaW5nIHRvIGVsYXBzZSwgQk1DIHJlYWR5IGlzIGdvaW5nIA0KdG8gYmUgaGVsZCBvZmYs
IEJJT1MgaXMgZ29pbmcgdG8gZGVsYXkgY29tcGxldGlvbiAoaW4gb3VyIEJJT1MpLCBhbmQg
YW4gDQplcnJvciBtZXNzYWdlIGlzIHN0aWxsIGdvaW5nIHRvIGJlIGxvZ2dlZC4NCg0KSXQg
YXBwZWFycywgYmFzZWQgb24gY29tbWVudHMgc28gZmFyLCB0aGF0IG15IGJlc3Qgd2F5IGZv
cndhcmQgd2l0aCB0aGUgDQpjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHdhaXQtb25saW5l
IGlzIHRvIGFzc2lnbiAiLS10aW1lb3V0IA0KPG51bWJlci1zbWFsbGVyLXRoYW4tMTIwPiAt
cSIgdG8gcmVkdWNlIHRoZSBhbW91bnQgb2YgdGltZSBmb3IgdGVzdGluZyANCnRoZSBOSUMg
c3RhdGUsIGFuZCB0byBuZXZlciBsb2cgYW4gZXJyb3IgYmVjYXVzZSB0aGUgTklDIHdhcyB1
bnBsdWdnZWQuDQoNCkdhdGluZyBvbiBvcGVyYXRpb25hbCBzdGF0ZSwgYW5kIGlzc3Vpbmcg
LS1pZ25vcmUgZmxhZ3MgZGlkbid0IHdvcmssIA0KbGVhdmluZyBhIGxhcmdlIGJsdW50IGlu
c3RydW1lbnQgZm9yIGEgc29sdXRpb24uDQoNCk9uIDIvMTcvMjIgMTg6MjksIExlaSBZdSB3
cm90ZToNCj4gT24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgODoxMSBBTSBKZXJlbXkgS2Vycjxq
a0Bjb2RlY29uc3RydWN0LmNvbS5hdT4gIHdyb3RlOg0KPj4gSGkgSm9obmF0aGFuLA0KPj4N
Cj4+PiBJc3N1ZTogc3lzdGVtZC1uZXR3b3JrZC13YWl0LW9ubGluZS5zZXJ2aWNlIHN0YWxs
cyBmb3IgMTIwIHNlY29uZHMNCj4+PiB3aGVuIHRoZSBtYW5hZ2VkIE5JQ3MgZG8gbm90IGhh
dmUgYSBuZXR3b3JrIGNvbm5lY3Rpb24uDQo+Pj4NCj4+PiBUTERSOiBTaG91bGQgT3BlbkJN
QyByZW1vdmUgc3lzdGVtZC1uZXR3b3JrZC13YWl0LW9ubGluZS5zZXJ2aWNlDQo+Pj4gdW5p
dmVyc2FsbHk/DQo+PiBQcm9iYWJseSBub3QsIGl0J3MgcmVxdWlyZWQgdG8gaW1wbGVtZW50
IG5ldHdvcmstb25saW5lLHRhcmdldCwgd2hpY2gNCj4+IGlzIHN0YW5kYXJkLCBhbmQgbWF5
IGJlIHJlZmVycmVkIHRvIGJ5IGFyYml0cmFyeSBwYWNrYWdlcy4NCj4+DQo+PiBUaGVyZSdz
IHNvbWUgZ29vZCBiYWNrZ3JvdW5kIG9uIHRoZSBpc3N1ZXMgeW91J3JlIGV4cGVyaWVuY2lu
ZyBoZXJlOg0KPj4NCj4+ICAgaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dpa2kvU29m
dHdhcmUvc3lzdGVtZC9OZXR3b3JrVGFyZ2V0Lw0KPj4NCj4+IGluIHNob3J0OiBtb3N0IHNl
cnZpY2VzIHNob3VsZCBiZSBhYmxlIHRvIHN0YXJ0IGJlZm9yZSBuZXR3b3JrLQ0KPj4gb25s
aW5lLnRhcmdldCwgYW5kIGJlIGFibGUgdG8gYWRhcHQgdG8gY2hhbmdlcyBpbiBuZXR3b3Jr
IGNvbmZpZ3VyYXRpb24NCj4+IGFmdGVyIHRoYXQgcG9pbnQuDQo+Pg0KPj4gRm9yIHlvdXIg
c3BlY2lmaWMgaXNzdWUgdGhlcmU6DQo+Pg0KPj4+IElzc3VlczogVGhpcyBzZXJ2aWNlIGJs
b2NrcyBlbnRyeSB0byBtdWx0aS11c2VyLnRhcmdldC4NCj4+PiBwaG9zcGhvci1zdGF0ZS1t
YW5hZ2VyIHVzZXMgbXVsdGktdXNlci50YXJnZXQgdG8gcmVwb3J0IHRoZSBCTUMgaXMNCj4+
PiByZWFkeSB0byB1c2UuDQo+Pj4gVGhpcyBpcyByZXBvcnRlZCB2aWEgSVBNSSBHZXQgRGV2
aWNlIElELg0KPj4gVGhhdCBzb3VuZHMgbGlrZSBtb3JlIG9mIGFuIGlzc3VlIG9mIHdoZXRo
ZXIgdGhhdCByZXBvcnRlZCBzdGF0ZQ0KPj4gYWN0dWFsbHkgcmVwcmVzZW50cyB0aGUgZXhw
ZWN0ZWQgQk1DIHN0YXRlLi4uDQo+IFdlIGhhdmUgYW4gaW50ZXJuYWwgIm92ZXJyaWRlIiBj
b25maWcgdG8gc3RhcnQNCj4gc3lzdGVtZC1uZXR3b3JrZC13YWl0LW9ubGluZSB3aXRoIC0t
YW55IG9wdGlvbjoNCj4NCj4gICAjIG92ZXJyaWRlLmNvbmYNCj4gICBbU2VydmljZV0NCj4g
ICBFeGVjU3RhcnQ9DQo+ICAgRXhlY1N0YXJ0PS9saWIvc3lzdGVtZC9zeXN0ZW1kLW5ldHdv
cmtkLXdhaXQtb25saW5lIC0tYW55DQo+DQo+IFRoaXMgaXMgbW9zdGx5IGFib3V0IGZpeGlu
ZyB0aGUgUUVNVSBDSS4NCj4gSW4gdGhlIHJlYWwgZW52aXJvbm1lbnQgdGhlIG5ldHdvcmsg
KnNob3VsZCogYmUgdXAgYW5kIG9ubGluZSBzbyB0aGUNCj4gYWJvdmUgbWFrZXMgdGhlIHN5
c3RlbWQtbmV0d29ya2Qtd2FpdC1vbmxpbmUgc3RhcnRzIE9LIGluIGJvdGggY2FzZXMuDQoN
Ci0tIA0KSm9obmF0aGFuIE1hbnRleQ0KU2VuaW9yIFNvZnR3YXJlIEVuZ2luZWVyDQoqYXph
ZCB0ZSoqY2hub2xvZ3kgcGFydG5lcnMqDQpDb250cmlidXRpbmcgdG8gVGVjaG5vbG9neSBJ
bm5vdmF0aW9uIHNpbmNlIDE5OTINClBob25lOiAoNTAzKSA3MTItNjc2NA0KRW1haWw6IGpv
aG5hdGhhbngubWFudGV5QGludGVsLmNvbQ0KDQo=
--------------aBC42CEPOnl0Cpc64j0JcU33
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    Reading the --any switch in the systemd-networkd-wait-online man
    page doesn't look like it would be helpful. That flag permits the
    service to move on when one of the NICs achieves 'online'
    functionality. In the case of a NIC w/o a cable connection 'online'
    never happens. Thus the default 120 second timeout is still going to
    elapse, BMC ready is going to be held off, BIOS is going to delay
    completion (in our BIOS), and an error message is still going to be
    logged.<br>
    <br>
    It appears, based on comments so far, that my best way forward with
    the current implementation of wait-online is to assign "--timeout
    &lt;number-smaller-than-120&gt; -q" to reduce the amount of time for
    testing the NIC state, and to never log an error because the NIC was
    unplugged.<br>
    <br>
    Gating on operational state, and issuing --ignore flags didn't work,
    leaving a large blunt instrument for a solution.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 2/17/22 18:29, Lei Yu wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmai=
l.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Fri, Feb 18, 2022 at 8:11=
 AM Jeremy Kerr <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jk@code=
construct.com.au">&lt;jk@codeconstruct.com.au&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi Johnathan,

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Issue: systemd-networkd-=
wait-online.service stalls for 120 seconds
when the managed NICs do not have a network connection.

TLDR: Should OpenBMC remove systemd-networkd-wait-online.service
universally?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Probably not, it's required to implement network-online,target, which
is standard, and may be referred to by arbitrary packages.

There's some good background on the issues you're experiencing here:

 <a class=3D"moz-txt-link-freetext" href=3D"https://www.freedesktop.org/w=
iki/Software/systemd/NetworkTarget/">https://www.freedesktop.org/wiki/Sof=
tware/systemd/NetworkTarget/</a>

in short: most services should be able to start before network-
online.target, and be able to adapt to changes in network configuration
after that point.

For your specific issue there:

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Issues: This service blo=
cks entry to multi-user.target.
phosphor-state-manager uses multi-user.target to report the BMC is
ready to use.
This is reported via IPMI Get Device ID.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
That sounds like more of an issue of whether that reported state
actually represents the expected BMC state...
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
We have an internal "override" config to start
systemd-networkd-wait-online with --any option:

 # override.conf
 [Service]
 ExecStart=3D
 ExecStart=3D/lib/systemd/systemd-networkd-wait-online --any

This is mostly about fixing the QEMU CI.
In the real environment the network *should* be up and online so the
above makes the systemd-networkd-wait-online starts OK in both cases.
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

--------------aBC42CEPOnl0Cpc64j0JcU33--

--------------qzSOJVeeQtoO3S4HOqko7i85--

--------------JJmNn2gWMifbi0l47i9hBCSJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmIPxRQFAwAAAAAACgkQOcg9x5uaKcBT
wwf5Aal0ebgUdC7TdhRuLWsJz86KumMYyF0X4cZLRHM2MQeyhKUxy1y+ktx89wkqi/nWf4EO/FWa
57gaQwz3JsSidDhmN6GxIzgdfeue1Evjw7jQ8Aj0UnKRz8z5Q8QQ1AstPQXCjKTzxX5SkYuHGxxo
CgZpWlotcAi7WzrX/EPUNh4zb2zjucTIwCG4Wr1Dea/wtFYkL2gHyEXEJpoJcSsI6FaP6xsEOZnW
17FBt6kF1rxtGI0ix900LOolW2MTkIzn8PKPxmHnQ4Y4P3UkAzT+Y2hXku8Bf2D0VDpalTnmwxGG
B1VjrsIk32HaCmn6Gytku0w4XGydo62iyVH157yzuQ==
=w5gn
-----END PGP SIGNATURE-----

--------------JJmNn2gWMifbi0l47i9hBCSJ--
