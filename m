Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 603224CA9A6
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 16:51:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7zBY2qh1z3bsy
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 02:51:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BEBEGqKt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BEBEGqKt; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7zB15FwZz3bpF
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 02:51:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646236282; x=1677772282;
 h=message-id:date:to:cc:references:from:subject:
 in-reply-to:mime-version;
 bh=y09zm9dm4neHXRZ8STqeceZPfE3SEm6D8tPVA2lk2xo=;
 b=BEBEGqKtWndVdqa325l4EGcGIzajIQoWYbrCp6qp24YfglC3H60SNqDv
 omrSjFN16r6StFoO6u2bebVuRaV6Ji2PPSnZJfGRUOxB7fqJ4Q4NQMrac
 MQQzA+xmE5VhlhmLIBMtBRGIGIhVqohX3YDt610gcQ0yX7ZFTaeeMQeMm
 b9tyULX+smnH/OiyNXBnn+aBanXIRGtN6w5FglEvQ2/0IzSEJv4HT24d1
 zabfU1ufWOpKrSj7hMef2HUtbCKNNMyzGkTQrKzGY9mYPIEkBvaaBFszr
 7kANJzHzlHZmDNM8Sqb59ewu8Jc5aRgSnlzbuK7agylGGdvZfF+ruUgJH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253161215"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
 d="scan'208,217";a="253161215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 07:50:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
 d="scan'208,217";a="551301501"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 02 Mar 2022 07:50:12 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 07:50:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 2 Mar 2022 07:50:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 2 Mar 2022 07:50:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 2 Mar 2022 07:50:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oxu/GQoHj7DcZMfv2JRKdBz5/DOGf2wVopVdVejPJn3FEno8jHnAKzTzSYITH9bTM17gAsT0ydgyXsFFp+bQuZBK+2lMN4Q1vmAmhR2j5PIPZq6ODWYMaONuDW/4iJt3riI2tjNFOgot3R5QGFN1IT1MSFbJ/OmisgwyfzaJN2G1Yt0MHNRbj3hOZOYmGHxbNyO4S65WAPP7k0euXj7GWiIklhV9ZHCOTvTGIhiM/0KfDCnD8C/aGvKSVQQUJVzZZtwKwMrj+0bcpbr8dAynSgI+pLBIyAVFi5XtfkIvLxrUBLshQJpUNzFVAmIGO33yul4qQ6ZKw4iW+0M78gRR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lB5iQyzwtQLAat6ijzqj5P+2niRzh/HZuWthFohqsPk=;
 b=CF7dhanfFgECvDvPruom6xslHqVdwqPOM4NTe1/WR3tIGSr4TZsp+fxMro0KrNmh0hTTm664/yWAueA+0wGQR4FrFgknwI65wP58dOKab5xAzC01jaNPJwMnt00FNAUmdH1rGYgEepdzb3yh4yLsiscOyHlb04oEp8xzAkRP7vomEzxZtXkV84vcJxp7oaDOX6DSM0yvElYieVOUqDw+rUSGUbkGI0OifvtQXobOrjVNsJcaff6W1Frxn2XjbBv1wilKPYLmkfyfnGhSgg/ffbUG8FdhYm/XcTGVXWtRd8QHT0IVErxnK6d+47g14WEU6vX1EqP4fx993JbvsTKMQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by DM5PR11MB1353.namprd11.prod.outlook.com (2603:10b6:3:a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.26; Wed, 2 Mar 2022 15:50:08 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92%6]) with mapi id 15.20.5017.026; Wed, 2 Mar 2022
 15:50:08 +0000
Message-ID: <f392c47a-76d2-c9f5-44f4-07f127f8e928@intel.com>
Date: Wed, 2 Mar 2022 07:50:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: Heyi Guo <guoheyi@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
References: <13769f21-e6c3-5550-909a-fa0893c1c32a@linux.alibaba.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: phosphor-network: does it make sense to disable systemd-networkd
 sending DHCP release?
In-Reply-To: <13769f21-e6c3-5550-909a-fa0893c1c32a@linux.alibaba.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------z72GMXNx23lknvipwjUfvLoi"
X-ClientProxiedBy: MW4PR04CA0371.namprd04.prod.outlook.com
 (2603:10b6:303:81::16) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80b37dee-21a7-463d-a8b4-08d9fc6453af
X-MS-TrafficTypeDiagnostic: DM5PR11MB1353:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR11MB13538CF27D53828B0798CEABE2039@DM5PR11MB1353.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2B5TZ6sC+hmSd0oNL3CYfbMyf+43g46aKMbeyf4QWxI1P7PUJKhsc352Tv6Mhrs9leJeeD+7QzSCSl+P001NtEHWgKug6pb8XTNXh5zbpVIe0sYPK/KkoDMYjsyfiqlpsnguaotJG3z8PumbW+oBBu7DksJQ942oOeXFKzFK10G13TW5uT6LXy8uf/hB+pV6UXpfC7lbZ6UhYZbOaZ0WNDGtqs+SSIXZO6OcAYdWgqKTB+04CPbZu9MwSgOSVvHwWsYAzy92/PR4GmikUXeMv63WqMJEZD4YD0LBBUUZ6YQzz/uQ/CmD0h15ZHDjyuAEbJIC24Q5sIaXCGACWlhayvwDaQobv2oNBjyd99VRReeOsVZcTIFPSwxYp96hZO/mDkZgmlhQ7z9Qr0BLGQyors7kQzWjMjekjgMAK+X8OoYogVA6gymT8fH0OEAuDSnRaWeRJICRWTNL8GmB3r1p2mR19T9JGIulaIi7WkpLAHYsGkrS/+ThjSeehXVJOV2Rv98MaisN2NZ6Jia/aP6VTtk3aGC90fYR0pSrTipPfxiQmVGJWsSbYJMBdhBbCmuGXZwSHOnIpKzR8n8ergDa3pZLndWgkVGGNl9R3jcfmSXmT+MHLAEmYZVUMjgB8hSmMjiFgHXnqDOr9l/femQnvAufYXcfhjTU36qD6exn1+nbYkPy1uJ7AmSKQC9CFHHNKK8F2P5/2MV6EBoqmzcf+J9jyxWIE9bo+k/6SeEHOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(21480400003)(6486002)(6666004)(2616005)(8936002)(36756003)(53546011)(82960400001)(6506007)(33964004)(83380400001)(38100700002)(31686004)(508600001)(110136005)(54906003)(316002)(40140700001)(6512007)(86362001)(235185007)(31696002)(5660300002)(186003)(26005)(66476007)(66946007)(66556008)(8676002)(2906002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGwyb0pvTXNKZE0wRVpINjhpMTFTRllESVYvVHVDWFh4eWpYNG94ZXdlSEdB?=
 =?utf-8?B?U0xsZHNyeE5aOEdzemZjcnNwUFNnUFRqVE9sc1l3N0ROeEViZVJMM2JGK3U0?=
 =?utf-8?B?VlV2alJiM1RWTjVVY1VHZmxiTFllTWhOc3FLdWxSU2xuQi9qWnEzODMxWHNs?=
 =?utf-8?B?R2V4MVNPSlFnVFJPbGYyei9lYUFCZnN5MU5jMUNtK2R6R3drTVVQdVErOUE4?=
 =?utf-8?B?VVMvK1Z0WlM1Y3hBVFBIWHdsdUtvU2J6UTdOMTlIZDRrT2RJNHoxc0Y0MXJN?=
 =?utf-8?B?cG1XVmhwSGM3MXVmWkVMRU1tT2Zac0NBTlFZYUtoSUkweVE2WFZES1ZESEcx?=
 =?utf-8?B?enVBOHFiUlVjMkhsTmdDcmd4VzlUcUx6ZVFRaVBqNHJvK0lqbEpyZFdLM2N4?=
 =?utf-8?B?cG4rZm1sQThSMEYvdEVURURwVVFybDVPYSt2aGhZWTh4S3VFMTl4ck5uWEly?=
 =?utf-8?B?dnBZRnNZMENOYWRPekN1ZDI4UDFKUHo0c1V6cXFIazJtZVVaZHdiMWJkSUpa?=
 =?utf-8?B?VitnUldEODdNb0ZCanlGQ0dvTTJWY2N2YThmQ2NFd1kwTHVvajhqV2ZPdThv?=
 =?utf-8?B?elUwdTh2a1lvcXRMcHpmNDFMbGtOcktNak9qWHNBQ1FubnhseWxCSm5xaFNi?=
 =?utf-8?B?NzdnVFIzTVZjRklEYkorTFN2TCs0R2NiWXVHdkZ2a0ZYYmVzN3hITmVGdmNz?=
 =?utf-8?B?WWMvR2hIb2ttT3FPcnBiZ1MrWldMNHVtd3ZTREt6VE9yaWpEbzViQUhwcmhW?=
 =?utf-8?B?UFdDRWxGU1NYLzFHZmdyWXpYMU41N0R5QlptL0dtbWZsS3V5RWxCU1VQVkx1?=
 =?utf-8?B?UjVMWDFqN3BxQnI4NnpsZkhTc1dzUlNjeG9xQVhjZjhobzVWVnBFT0lWK3pC?=
 =?utf-8?B?TkRXN2FGdUlHSE1VQVBnY2hRem1KbTRSN1lZRUVIeXludURzdjZNVXgwQjR1?=
 =?utf-8?B?cjhVSEgwMkNHTUJBT01SNGoxSG5ISFRJNVVucmxYYlI2WG05YjJieG10aWEy?=
 =?utf-8?B?TGUrTUJEQ3hONnljNkdaWUlZTkVpSEFYb29ucWhSU2txS0ZuUzQ2ZXNQcElR?=
 =?utf-8?B?WkNkZlplS0E2VGxDUXhZZnJ4aS9vd2NHWm5DanFkclNTVXdma2g0YmxJVExR?=
 =?utf-8?B?QjFmQjZ1WGlJOFhybFJIaEMwbmQ2YmdUK2dxeHVyR2tuRDhlTndOZWtzQ3Az?=
 =?utf-8?B?R2JBTHJxVUFUaTkvNTRUb0NpWExJVTl1SGh5RlVSN0NkbkxKOVp1NVphYWY2?=
 =?utf-8?B?ZTJkOWlkcVB4MjVQVVVZWlZ2RWNpTCtzcDlWa2lFRkZObkFQL2FVWjdmNWJ4?=
 =?utf-8?B?eC9DUmVCdXJiWVo4U1NGRU1tbUVmQW8zV01HaDBSajY2VkhXSnVaZ0xhbmRx?=
 =?utf-8?B?VFRYNlVpczNSa1ZUbTk5bkRSOXgzR3dLc09aTWlERko0TUlHTWVYZnZrR2tD?=
 =?utf-8?B?UG4zVHo5UisyS1k0WTZZdHNtamRLZkw0aWdVd3BNYjkvS3MzNnFaWS9sUlFm?=
 =?utf-8?B?bkc0WnBmR3V0TkZkSXpPQ3ZPcy9zZ3BsODJnaHRyY1JmT2lFM1JqeGZLak93?=
 =?utf-8?B?ZnBnb1lOa1FFKzJMM3hFdkZiOVNMcnYvbUE5T3BMams1VVVDMDFPWkxuNVV4?=
 =?utf-8?B?N3MvRVhUdWYxMXZ4VkRiMTZHbzJ3dHVha3NHV3BNMU9ZeURNcE5Za0J0NHhn?=
 =?utf-8?B?aHRFZ3BFYlBpenJOR2Y4VStHS3daaFNSNXYyUkVPWHg3dDlud1J3TjdQcTcx?=
 =?utf-8?B?NEtvcXdrcVhDRitMNi9JUURSQlVEUllWYndCQnA1YzhJYmdVNDBaVExZeWgx?=
 =?utf-8?B?dDVIbU80b1c5VlRnOVBjYWFJSGRURW9JUmo5NHNxWW5reGNxMzc2OEV1ZnZE?=
 =?utf-8?B?N0VPbWE1djhHMXp4TWtkSDB2UlZ4MUhkOXI4QWo2NjV5Mkh6Q2hiSUJjZGMv?=
 =?utf-8?B?ZEJuWjMxTlJnZmlxbWhQdnJnVTRvd1B5V3VaYmFad1VNREJqbmxIUW9aazRr?=
 =?utf-8?B?YTgxa3BDcFRRckNJcW1RbmlFM1NoK1JVUUxFV0dqVjNubWYwQUNlWWprb25D?=
 =?utf-8?B?eXliMVg0MDNteno2bENXMVF2STRoZDloL25hbUh4WURiQ3AyeFZlcFZsTmQy?=
 =?utf-8?B?NWJaZFZtQmM2VlpsVlliSFpkQlUyQy9IMHlNM0JHbjdFclNtU2xjWjFtQmNj?=
 =?utf-8?B?Y3ZKeFZOVlN0c3dmSWZmTG5ONGdzc2VOZDFRLzdUMm40VFNVWUVYeE5mbGV2?=
 =?utf-8?B?S2JOWUJDWGZmMWN5WENCMXRzTUZ3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b37dee-21a7-463d-a8b4-08d9fc6453af
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 15:50:08.3085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KLlCVSguiPUMGjAFmqrFY0vfFKXPmM/mH++pq1QdNmKArjAr5uMA40HIiHMLmeYDjQRHbZAXihvjzqnXvfoaWQqc8PX6laHd2JNTvGL54iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1353
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 Nagaraju Goruganti <ngorugan@in.ibm.com>, Adriana Kobylak <anoo@us.ibm.com>,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------z72GMXNx23lknvipwjUfvLoi
Content-Type: multipart/mixed; boundary="------------GUHe2KH0hXFgvhHsnjkIJSd0";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 Nagaraju Goruganti <ngorugan@in.ibm.com>, Adriana Kobylak <anoo@us.ibm.com>,
 William Kennington <wak@google.com>
Message-ID: <f392c47a-76d2-c9f5-44f4-07f127f8e928@intel.com>
Subject: Re: phosphor-network: does it make sense to disable systemd-networkd
 sending DHCP release?
References: <13769f21-e6c3-5550-909a-fa0893c1c32a@linux.alibaba.com>
In-Reply-To: <13769f21-e6c3-5550-909a-fa0893c1c32a@linux.alibaba.com>

--------------GUHe2KH0hXFgvhHsnjkIJSd0
Content-Type: multipart/alternative;
 boundary="------------YEgqcsj0K8rQQ0r5j7jaxKh3"

--------------YEgqcsj0K8rQQ0r5j7jaxKh3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyLzIxLzIyIDAxOjA1LCBIZXlpIEd1byB3cm90ZToNCj4gSGkgYWxsLA0KPg0KPiBO
b3cgc3lzdGVtZC1uZXR3b3JrZCB3aWxsIHNlbmQgREhDUCByZWxlYXNlIHBhY2tldCB3aGVu
IEJNQyByZWJvb3RzLiANCj4gVGhpcyBtYXkgY2F1c2UgQk1DIHRvIGxvc2UgaXRzIG9yaWdp
bmFsIGFxdWlyZWQgSVAgYWZ0ZXIgbmV4dCBib290IHVwLiANCj4gSSBzZWUgdGhpcyBmZWF0
dXJlIGNhbiBiZSBkaXNhYmxlZCBieSBhZGRpbmcgYmVsb3cgbGluZXMgdG8gdGhlIA0KPiBj
b25maWd1cmF0aW9uIGZpbGUgb2Ygc3lzdGVtZC1uZXR3b3JrZDoNCj4NCj4gW0RIQ1B2NF0N
Cj4gU2VuZFJlbGVhc2U9ZmFsc2UNCj4NCj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGRpc2Fi
bGUgREhDUCByZWxlYXNlPyBPciBpcyB0aGVyZSBhbnkgcmVhc29uIGZvciANCj4gdGhlIGN1
cnJlbnQgZGVmYXVsdCBjb25maWd1cmF0aW9uIGluIHBob3NwaG9yLW5ldHdvcms/DQo+DQo+
IFRoYW5rcywNCj4NCj4gSGV5aQ0KPg0KDQpGV0lXLCB1c2VycyB3aXRoaW4gSW50ZWwgZ2V0
IHZlcnkgY3Jhbmt5IHdoZW4gdGhlaXIgSVB2NCBhZGRyZXNzZXMgDQpjaGFuZ2UuIEknbSBw
cmVzZW50bHkgd29ya2luZyBvbiBhIGRlZmVjdCByZWxhdGVkIHRvIHRoZSBJUCBhZGRyZXNz
IA0KYmVpbmcgYWx0ZXJlZC4NCg0KQXMgaXQgaXMgdW5jbGVhciB0aGVyZSBpcyBhIHJ1bi10
aW1lIG1lY2hhbmlzbSBmb3IgY2hhbmdpbmcgdGhpcyB2YWx1ZSwgDQpJJ2QgYXQgbGVhc3Qg
bGlrZSB0byBzZWUgYSBjb21waWxlIHRpbWUgY29udHJvbC4gSSBleHBlY3QgSW50ZWwgd2ls
bCANCmNob29zZSB0byBibG9jayBzZW5kaW5nIGEgREhDUCByZWxlYXNlIHJlcXVlc3QgZm9y
IHdoZW4gdGhlIEJNQyByZWJvb3RzLg0KDQoNCi0tIA0KSm9obmF0aGFuIE1hbnRleQ0KU2Vu
aW9yIFNvZnR3YXJlIEVuZ2luZWVyDQoqYXphZCB0ZSoqY2hub2xvZ3kgcGFydG5lcnMqDQpD
b250cmlidXRpbmcgdG8gVGVjaG5vbG9neSBJbm5vdmF0aW9uIHNpbmNlIDE5OTINClBob25l
OiAoNTAzKSA3MTItNjc2NA0KRW1haWw6IGpvaG5hdGhhbngubWFudGV5QGludGVsLmNvbQ0K
DQo=
--------------YEgqcsj0K8rQQ0r5j7jaxKh3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <br>
    <div class=3D"moz-cite-prefix">On 2/21/22 01:05, Heyi Guo wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:13769f21-e6c3-5550-909a-fa0893c1c32a@linux.alibaba.com"=
>Hi
      all,
      <br>
      <br>
      Now systemd-networkd will send DHCP release packet when BMC
      reboots. This may cause BMC to lose its original aquired IP after
      next boot up. I see this feature can be disabled by adding below
      lines to the configuration file of systemd-networkd:
      <br>
      <br>
      [DHCPv4]
      <br>
      SendRelease=3Dfalse
      <br>
      <br>
      Does it make sense to disable DHCP release? Or is there any reason
      for the current default configuration in phosphor-network?
      <br>
      <br>
      Thanks,
      <br>
      <br>
      Heyi
      <br>
      <br>
    </blockquote>
    <br>
    FWIW, users within Intel get very cranky when their IPv4 addresses
    change. I'm presently working on a defect related to the IP address
    being altered.<br>
    <br>
    As it is unclear there is a run-time mechanism for changing this
    value, I'd at least like to see a compile time control. I expect
    Intel will choose to block sending a DHCP release request for when
    the BMC reboots.<br>
    <br>
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

--------------YEgqcsj0K8rQQ0r5j7jaxKh3--

--------------GUHe2KH0hXFgvhHsnjkIJSd0--

--------------z72GMXNx23lknvipwjUfvLoi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmIfki0FAwAAAAAACgkQOcg9x5uaKcAa
2AgAjq7HPwGNgDs8ttH+cn2W9KAmlqSWwccHnPZ2HIBHIaCyoDazQmZCO+nOB0nGu/rRNTiBnP2O
x7HXq3zZdIYUdU+Xharr5UrrbN4LZBzHlcvMcdxEx6t37S49oHZ+T9yX279E5rQHyl9R6L+hhHyg
K4ejXLafpl3+Ck+KsTQT+7Z+SSNFOhyyYuzFhPxj1sVlVWg1/v1Sq7BoJRuhRaJ75cvRyjFOF7QF
vQKbPb0Qsibib/9j6+gRkYgzqggvLjUmurd3UqOWnT/1YnGgd7qv5fBM7tLPweNbzy+Mq6Hls/B4
zpqUjucpHQfUXCZzSgPSfn2Lhzxn1+wGdMNWQ4l6bA==
=9HS9
-----END PGP SIGNATURE-----

--------------z72GMXNx23lknvipwjUfvLoi--
