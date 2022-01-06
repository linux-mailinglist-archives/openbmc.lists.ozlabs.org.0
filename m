Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC9D486803
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 17:57:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVCFD0c53z30Kn
	for <lists+openbmc@lfdr.de>; Fri,  7 Jan 2022 03:57:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L1Jbux4c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L1Jbux4c; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVCDh0pDGz2xtP
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 03:56:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641488196; x=1673024196;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=dRMJd7/ljnmLtlykXvjxFEW1ReCZC+M+Zf38m2Juxck=;
 b=L1Jbux4cvbNhmAULi+fJdkjvatgTmro22Vup3uqxZkJkof08IIHl4FaG
 Dlj88DKhrT/trcOAd7iI/Bx7uT7xUHJU7hu40ZsHtqEuCXM9zNBapZ4aD
 g/1nsrUtoj6rkLfKB4D0LzEjTmsaHcE27qb85gYgsg37RHFKSHu9zTKTP
 13M8rk6GqLBS6fhXP47Tq1T+LjfJ2Uu/z3U1+NwrYdznWtppowkQG6zpu
 6RvoXJXRtUAPfUR0LxYFG8gvUip9pqs3h4OK72xfnf8Q1v9Nv/aUgEEMP
 bIzL4PQOW+xt1hcAKbA7QgjmYgfoMQoZzN4qbkk2mxkBO2yaTuwWgvXT3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242646806"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
 d="scan'208,217";a="242646806"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 08:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
 d="scan'208,217";a="591425720"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 06 Jan 2022 08:55:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 08:55:25 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 6 Jan 2022 08:55:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 6 Jan 2022 08:55:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 6 Jan 2022 08:55:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frroo3Teaf1dwGCs8WSeYRV8aCKbOGvDs+RhdBCFAaq+w+sH4WiTUWkmnRMlI35SRtZgwPQi8xr9gYqnICh4CUNoEv/l/uqxqU0LvjwLgf5dXMBQO1oFY2cCaB3YYPhwDs5GEcBAEOtJeJYgK9gy3muzxdK93x6t+QyuB3UiIvDyKJKuwRLqDejenOjYWxo7b6cmtat1AgVGbpJ8P2bwZeU2hZnwmyNXz/oz1Hk4T5iGEw9DsQoWwdUj+njQSxGSF7MR+IHMCD3IWFNPWG6815YvW0oHznaqJsCYKjxwOfE7MbiFQM5uRmfsoGMpkP7cpr+bmubaaJ/gdMvj/WXR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQYjuQTHiHqXbAkjLWTO8XXwgA2fOXnhDfKRzBA+LQ8=;
 b=mf/J6mocqMPvBFhoIJ5CBg8hyf7rbmwdbSuNkM2LR8ax4ARHdTh7HtkFQX4J5bHV9hc0eyS+NRejD/DiyFdY3Z0gGLd2l9WH6X9pcsBOrGSNTkJEk77oXOoc4Fc8IbdDMhbe5K/I2RFmr7kdlYIj2F2XpB1fv8+a4Y3b0n0hdUQzQA6nmwXExQH0lsA2LFs8hnhD4cSdi/WimDzYn/vIOc7c9sFTzGpNInG4i3iO41YD2QNHj2QdZ88sOLYWxoaYV/C6D0StWVuvWZ6OEbB3oj5/sq47XHAd0n4XhCEGlY9HwRzx+GsBx1+qR+iO6lojeAe/WIR1ld5+d40ZbcqhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.10; Thu, 6 Jan
 2022 16:55:22 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::b90d:f84c:59f1:6927]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::b90d:f84c:59f1:6927%4]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 16:55:22 +0000
Message-ID: <3eb8983b-5023-660f-9993-3699880aa61d@intel.com>
Date: Thu, 6 Jan 2022 08:55:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.0
Subject: =?UTF-8?B?UmU6IOetlOWkjTogVXBkYXRlIChvciBnZW5lcmF0ZSkgL2V0Yy9pcG1p?=
 =?UTF-8?Q?=5fpass_file?=
Content-Language: en-US
To: =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>,
 "mine260309@gmail.com" <mine260309@gmail.com>
References: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
 <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
 <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
In-Reply-To: <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qYqrKjosPz7pw6lH08F06Iie"
X-ClientProxiedBy: MWHPR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:300:117::14) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e337ae-eccf-4f16-3a71-08d9d13553d1
X-MS-TrafficTypeDiagnostic: SA0PR11MB4687:EE_
X-Microsoft-Antispam-PRVS: <SA0PR11MB46878C9607D49D91A5C0A006E24C9@SA0PR11MB4687.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: of9aCfZUARv2fe0L5TGEzUPSI9jqLZU06MfVxkZJL8clTX6a9ewgTyK6DAlZOEcbjdcIkl0qxuhfCPf+pp06J7yHuu2ZpV+inGZpxUC7boDj+jTq8QvTNgYg8QCJQbYJwTa1HuAPZKKMgIj/cJKrB59P65y8qfXdcGSDf0hbzsH2w4W5ujmOrh/G9clQflOPpXmcHjIEMIn9t9PNoj4shebXQMbHYWQnPi9bTbMsOVZ+LvWLmQpgDZeb2t08qE5nDp20gme+wmzmhY/XBIVTmiMpGmaG5iGZUkY6+8Z9MpW32HMDKs/RZv+9KPBZpddiJzDltViuVF7ryv5BJn/XV8BnNfgX3xIdC5nYUl06SGK1He5she0T7DbzNxyLa8/25OsG9ML+hHXvZEAj/lKbNGz1YvN57GiEyRXvFYfUYAv1H9FP0PKNlgaJWg3ahaoSuZ5eWOiJh0ZNs6jNV03YoksiYHzg3HAEUT09odipYm8fZaa4xFc3PNgmSK9RadkEypPa1zH5wnj/l8fO5m2uG1djvAiQfMXbYPQSXQnQ5w24fjJ0fsuyqLtQ+1uaNvCjirH6tesNgcC4gpV64FuPlI+wNRT9ZhQ83F7ieZ96+JugjjP2e8uBdJSupYJK4yhqFTxuG6hiHaONrbNkvttKMgZO624jD8ucBTk52Ci1LqqPtox9N5lH4BspLYKanRFe+GbyiQIFCrCKBa8qVVtOLQPvRCCBSCSAN9PJyrN7XNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(26005)(66476007)(66556008)(4326008)(83380400001)(186003)(235185007)(38100700002)(33964004)(8936002)(31686004)(66946007)(36756003)(224303003)(2616005)(82960400001)(6666004)(31696002)(6512007)(6486002)(2906002)(316002)(53546011)(6506007)(5660300002)(21480400003)(110136005)(40140700001)(15650500001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzlIRkVnT0NYeGlGcEFIcTJIN0JZdTA0UmVlUTluU2RFcFZyMXZtaEljWW5Q?=
 =?utf-8?B?SFMwUUxqNkU5WjdUK28xV2IrNnMwRVFYYnloaEFwb2Via1ZpQUY5Uzhra25j?=
 =?utf-8?B?ZmYydjIzc3dsNytuVEthdUhDb3hTNmJWY09ueVR5bys0SDlmMCtuVHE0bzBC?=
 =?utf-8?B?eEdzY1RLK05uOGxPMTdZd3d2aExWMWZCNVcydUgzZEVVWXpnMFNiY2RoL3JE?=
 =?utf-8?B?cEtkMXoxTkNFclg4NjVkUUI2MFk5SXhjaTl1SkkxUlc0alFsckFxbE54ZGEw?=
 =?utf-8?B?b1BnbXRGaVd1Qm5IOFYxdnlUZ1NsME9DWnltZnNSTFlNc3l2cVdHblJEeHZZ?=
 =?utf-8?B?alY5Rm90Wlc4SjhJcVN0N1BKWTR2MnV6WHg2MnVCR2gwNTRpOWVabHZQTkQ3?=
 =?utf-8?B?MEpwQWp0ZFpBWHF3ZE8xb0FjaDNJc2dRUVhQNDRPYlEzSDgxT0FKazN0MGVK?=
 =?utf-8?B?TkNxMTNaZTZ3WTd5NXhaYWFPUzczTnRkeHVIQm5LWHJOL0J2WHhRcmxxMFAz?=
 =?utf-8?B?bGpjM0R1Yk1kUlU3TDBBSCswOHlYcHdkanJ2NGpsUlk3d2N5bWoxeUh3R0tZ?=
 =?utf-8?B?TmxYU3JIaDZUTUt3ajFjSExLR01vSzhad2lCVjhyZ0FCdS9odHI1WTNudi9T?=
 =?utf-8?B?M2lyK0Znd2NPbmlnZFVpS3BTWWJlSWZVOVNYZVNDT2xpdUJFNllMRFR0akE5?=
 =?utf-8?B?aFRKb1FYeTBGRHE2TTRKZjJwZ3J3b0didlhEWjJ5Q2MrV0MvS3RPYWhYUElD?=
 =?utf-8?B?UFNnTlNrb1pOd1IrcDR2UlhRZGJhQkQvajFqTlVoNDdFS1dRR1UvZENGZWVw?=
 =?utf-8?B?c3ZaKzNGK2xvQTkrQkRiYzdoMFRiUmhlbTZGUVBuWjhuRUZwRTNBY3VuMzVP?=
 =?utf-8?B?N2xmVlovZnFHSHFVNldJOGhGaHRSWFVYaUlySEpRc2dJZTg1alMyd1BpRThS?=
 =?utf-8?B?R1AzQTREQjBKbjhhNjllQmNFalQ4eGwyeUR5Q0lKWURmS081UFlzNHFjOWNw?=
 =?utf-8?B?elo3bUlmcHJnTTNLNjJvSGEvd0I1bDQxRFl6NjVQUWZvajFPcFRwOWRhb1ZP?=
 =?utf-8?B?OFFCRC9VU3hHWlFVMTFhNm5CRHEwUWhHZWpySGxsMEs0Y0FuNEc0aE1wY3NO?=
 =?utf-8?B?NXo1enBEeEZSTjIybDlpUUFWOEZPRjkrNTIwVDZpTDE5Ym9lem5LSHI5QXFu?=
 =?utf-8?B?Q3RiSC9udGt6RmREMFNPdlRaOTA2cExVYVhCR1E0UWNBUEwwWldZWUIzQ2g5?=
 =?utf-8?B?L083V0IwR1VlMDl6OU5PSzg0WG9Vdnd6aTJSOXJNOTUrS29FT2psTWxMYktZ?=
 =?utf-8?B?MWpoaitTVmhtc1p3Z0l3TFl5aUZsYUFiVnRsTGEwUmRaQkJRUjZnRUhVdTQr?=
 =?utf-8?B?VmVCUmlCMlNncDVzV0dZOXVLNEpNeU0zNVc0MUdmVHJSQzZ5NGc3TUJlajhT?=
 =?utf-8?B?VVJFWE1KNjVYRk8wZXFGM3dQT2YycXRWQy9PQjV4dlAxNzJrT29ScnZXQld6?=
 =?utf-8?B?eUlLclE1YUsrVm85T2ZMOWRsWlBRNXFBUFhVaFUvdGF5b2hqUVhPMHd2WWd5?=
 =?utf-8?B?Wjg1K3h5NDQvaFp2eXVvdTNPQ0RVRlpSS2pSTTFjaFVRU25iZFZDT2JzTnIz?=
 =?utf-8?B?SnNwWXlMTGFNangyb2dYTStZZGIxUTdqd3dSaFFXN1h4QU1WR3NnT0dySzVq?=
 =?utf-8?B?ZmFCWTluODdIRHByYm13RG1TQ1RlRHpselNDcDVvMW1VN0xuK3JuL1dwYmR4?=
 =?utf-8?B?OEZPbnRMTTdMREtCaFptYXNCWURMbzE1ZWExbjYwSXgwOCswWmVjMENhd0lR?=
 =?utf-8?B?bmt2NzdwaTIrSnVjb0VZL2hqcmNBdGs1SDdWWXlBNXRTVGVvSjVWS3VvK3pY?=
 =?utf-8?B?VE5VWGp2a3NlSUh3amRleDF5cnUyMU5temJPU3JpNHZDNzI5L3AybDlscXRJ?=
 =?utf-8?B?aUUrRzZhemxlVURYbzNEZmVBWEpZSWc5WkNhN2c1ZGZ2VUE1dXIvcWMrRUQ4?=
 =?utf-8?B?R3ZCOVJhSFRndDh0TTI0QjJVWUR1cEtxU2pXS1RJbDltaWl0K1drSk9weVBR?=
 =?utf-8?B?WDZ2NGp1cURqdjNYZ0ZMK0JyNkdOeWdIQURsT1VXd1MrNzBvNitTenArVUJR?=
 =?utf-8?B?NElBZjRFcXJFNlhpYzRJYWl6UlM1cEZBSTJObFB5L2MwRnNJYVplcDlPMkJY?=
 =?utf-8?B?cXNzQ0dHVWxmTVRneUxLN2paZ1Jhekg2QURQTnMvUGZkYTl2eUplcVBqSUQ3?=
 =?utf-8?B?SXk4YnhMeXk2QnJHYVZ6b2VFaWR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e337ae-eccf-4f16-3a71-08d9d13553d1
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:55:22.2933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4OTrCjt/OIlg+ETwILAqNA17KsW1CwGANikdW+DDEiaeKolhW9y9YnFqLk7+hqbp6TZ8nmlL9w0C71xBy9j9Yp6GxOD4m1Zbq9Re5vUFTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--------------qYqrKjosPz7pw6lH08F06Iie
Content-Type: multipart/mixed; boundary="------------nwGuZuHqRfbqJ9C7LYS7LcnD";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>,
 "mine260309@gmail.com" <mine260309@gmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <3eb8983b-5023-660f-9993-3699880aa61d@intel.com>
Subject: =?UTF-8?B?UmU6IOetlOWkjTogVXBkYXRlIChvciBnZW5lcmF0ZSkgL2V0Yy9pcG1p?=
 =?UTF-8?Q?=5fpass_file?=
References: <3e6afebf819c4784a4dbacacccb74214@inspur.com>
 <CAARXrtmN1Fu8tWsqVotOwz_xdZkPLdaRPoS831mqRTO4FP6HHg@mail.gmail.com>
 <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>
In-Reply-To: <dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com>

--------------nwGuZuHqRfbqJ9C7LYS7LcnD
Content-Type: multipart/alternative;
 boundary="------------RaxcUq3T0AxVXYXq4C6983W2"

--------------RaxcUq3T0AxVXYXq4C6983W2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhlIE9CTUMgUEFNIHJlcXVpcmVzIHRoZSBwYXNzd29yZCB0byBiZSA4IGNoYXJhY3RlcnMg
aW4gbGVuZ3RoLCBhbmQgDQpwcm9iYWJseSByZXF1aXJlcyBhIG51bWVyYWwgYXMgd2VsbC4N
CkkgcmVhbGl6ZSB5b3Ugd2FudCB0byBnZXQgdG8gYSA1IGNoYXJhY3RlciBwYXNzd29yZC4N
CkkgcmVjb21tZW5kIHlvdSB0cnkgYWRkaW5nIGEgdXNlciB3aXRoIGEgcGFzc3dvcmQgdGhh
dCB3b3JrcyB3aXRoIHRoZSANCmV4aXN0aW5nIHJ1bGVzIHRvIHNlZSBpZiB5b3VyIGF1dG9t
YXRlZCBjcmVhdGlvbiBtZXRob2Qgd29ya3MuIEFmdGVyIA0KdGhhdCB5b3UgY2FuIHRyeSBj
cmVhdGluZyBzaG9ydGVyIHBhc3N3b3Jkcy4NCg0KT24gMS81LzIyIDIzOjAyLCBYaWFvY2hh
byBNYSAo6ams5bCP6LaFKSB3cm90ZToNCj4gU29ycnkgSSBkaWRuJ3QgZXhwbGFpbiBzb21l
IG9mIHRoZSBtZXRob2RzIEkgdHJpZWQgIDogKA0KPg0KPiAxLiBJIHRyaWVkIHRoZSBtZXRo
b2QgeW91IG1lbnRpb25lZCwgYnV0IGZhaWxlZC4NCj4gVGhlIGxlbmd0aCBvZiB0aGUgcGFz
c3dvcmQgSSB3YW50IHRvIHNldCBpcyA1IGRpZ2l0cy4NCj4gSSBtb2RpZmllZCB0aGUgY29t
cGxleGl0eSBzZXR0aW5nIHZpYSAvZXRjL3BhbS5kL2NvbW1vbi1wYXNzd29yZCwgYnV0IHN0
aWxsIGNhbm5vdCBzZXQgYSA1LWRpZ2l0IHBhc3N3b3JkLiAoVGhlIHNldHRpbmcgZm9yIHJl
ZHVjaW5nIHRoZSBsZW5ndGggcmVxdWlyZW1lbnQgZmFpbGVkIHRvIHRha2UgZWZmZWN0KQ0K
Pg0KPiAyLiBJIGFsc28gdHJpZWQgdG8gdGVtcG9yYXJpbHkgcmVtb3ZlIHBhbV9jcmFja2xp
Yi5zbyBpbiAvZXRjL3BhbS5kL2NvbW1vbi1wYXN3b3JkIHNvIHRoYXQgaXQgZG9lcyBub3Qg
cGVyZm9ybSBjb21wbGV4aXR5IGRldGVjdGlvbi4gRmFpbGVkIHZlcnkgZGlyZWN0bHkuLi4u
Li4NCj4NCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IExlaSBZVSBb
bWFpbHRvOm1pbmUyNjAzMDlAZ21haWwuY29tXQ0KPiDlj5HpgIHml7bpl7Q6IDIwMjLlubQx
5pyINuaXpSAxNDo0MQ0KPiDmlLbku7bkuro6IFhpYW9jaGFvIE1hICjpqazlsI/otoUpPG1h
eGlhb2NoYW9AaW5zcHVyLmNvbT4NCj4g5oqE6YCBOm9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zw0KPiDkuLvpopg6IFJlOiBVcGRhdGUgKG9yIGdlbmVyYXRlKSAvZXRjL2lwbWlfcGFzcyBm
aWxlDQo+DQo+IE9uIFRodSwgSmFuIDYsIDIwMjIgYXQgMTE6MzkgQU0gWGlhb2NoYW8gTWEg
KOmprOWwj+i2hSk8bWF4aWFvY2hhb0BpbnNwdXIuY29tPiAgd3JvdGU6DQo+PiBIZWxsbyBl
dmVyeW9uZQ0KPj4NCj4+DQo+Pg0KPj4gSSBub3cgd2FudCB0byBhZGQgYSBkZWZhdWx0IHVz
ZXIgdG8gbXkgb3duIG1hY2hpbmUgKEkgbW9kaWZpZWQNCj4+IG9ibWMtcGhvc3Bob3ItaW1h
Z2UuYmJhcHBlbmQsIHVzZSB0aGUgdXNlcmFkZOKApiApLA0KPj4NCj4+IGJ1dCB0aGUgbmV3
IGRlZmF1bHQgdXNlciBjYW5ub3QgdXNlIElwbWkuIEl0IGlzIGJlY2F1c2UgdGhlIGlwbWlf
cGFzcyBmaWxlIGlzIG5vdCB1cGRhdGVkLg0KPj4NCj4+ICAgIEkgY291bGRuJ3QgZmluZCBh
IG1ldGhvZC90b29sIHRvIGdlbmVyYXRlIGlwbWlfcGFzcyBmaWxlLiBTbyBob3cgY2FuIEkg
Z2VuZXJhdGUgYSBuZXcgaXBtaV9wYXNzIGZpbGU/DQo+Pg0KPiBXaGF0IEkgZG8gaXMgdG8g
dXNlIHFlbXUgb3IgYSByZWFsIEJNQywgYWRqdXN0IHRoZSBpcG1pIHVzZXJuYW1lL3Bhc3N3
b3JkcywgYW5kIHRoZW4gY29weSB0aGUgaXBtaV9wYXNzIG91dC4NCg0KLS0gDQpKb2huYXRo
YW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXINCiphemFkIHRlKipjaG5vbG9n
eSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5IElubm92YXRpb24gc2lu
Y2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9obmF0aGFueC5tYW50
ZXlAaW50ZWwuY29tDQoNCg==
--------------RaxcUq3T0AxVXYXq4C6983W2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    The OBMC PAM requires the password to be 8 characters in length, and
    probably requires a numeral as well.<br>
    I realize you want to get to a 5 character password.<br>
    I recommend you try adding a user with a password that works with
    the existing rules to see if your automated creation method works.
    After that you can try creating shorter passwords.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 1/5/22 23:02, Xiaochao Ma (=E9=A9=AC=
=E5=B0=8F=E8=B6=85)
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:dbe4f24d42c24b9cbe8992fb982f02ec@inspur.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Sorry I didn't explain some =
of the methods I tried  : (

1. I tried the method you mentioned, but failed.
The length of the password I want to set is 5 digits.
I modified the complexity setting via /etc/pam.d/common-password, but sti=
ll cannot set a 5-digit password. (The setting for reducing the length re=
quirement failed to take effect)

2. I also tried to temporarily remove pam_cracklib.so in /etc/pam.d/commo=
n-pasword so that it does not perform complexity detection. Failed very d=
irectly......

-----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA: Lei YU [<a class=3D"moz-txt-link-freetext" h=
ref=3D"mailto:mine260309@gmail.com">mailto:mine260309@gmail.com</a>]=20
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2022=E5=B9=B41=E6=9C=886=E6=97=A5 1=
4:41
=E6=94=B6=E4=BB=B6=E4=BA=BA: Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:maxiaochao@inspur.com">&l=
t;maxiaochao@inspur.com&gt;</a>
=E6=8A=84=E9=80=81: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:=
openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
=E4=B8=BB=E9=A2=98: Re: Update (or generate) /etc/ipmi_pass file

On Thu, Jan 6, 2022 at 11:39 AM Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85)=
 <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:maxiaochao@inspur.com"=
>&lt;maxiaochao@inspur.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hello everyone



I now want to add a default user to my own machine (I modified=20
obmc-phosphor-image.bbappend, use the useradd=E2=80=A6 ),

but the new default user cannot use Ipmi. It is because the ipmi_pass fil=
e is not updated.

  I couldn't find a method/tool to generate ipmi_pass file. So how can I =
generate a new ipmi_pass file?

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
What I do is to use qemu or a real BMC, adjust the ipmi username/password=
s, and then copy the ipmi_pass out.
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
--------------RaxcUq3T0AxVXYXq4C6983W2--


--------------nwGuZuHqRfbqJ9C7LYS7LcnD--

--------------qYqrKjosPz7pw6lH08F06Iie
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmHXHvcFAwAAAAAACgkQOcg9x5uaKcBe
BAf/aJ0Y1Lr8EkJLxtOkVxAOK58Rq33K5rC/5yU3jLC4f1SimHH6FlQHwU0xU/M8dUqsuPIQ1JBw
+mHdD43Z3AtbKNCL5PGv+Kb8/tBfRFd7p8bPlUBjuhaLB90yuCcGjg8Zm7VXIBHsUromU59uqX2K
rerXyiCL9+tPxvdxR5+rqOV8Nf/mtDk8a2z4WXU6eE5ZxA1xS6iNxMAHR0XdB+A9OWKfkJ8obyBc
7ph8G24MMyPwAqp+5f87Yw4ng3b6b3mv2qukvjYPtQX8vCXoin4/WGIQMSbfsqbuAxH367V4AjdJ
JePsixV3g94qVJYr26XvkDDWs0OD7TxIm4HOMyl1rg==
=elFH
-----END PGP SIGNATURE-----

--------------qYqrKjosPz7pw6lH08F06Iie--
