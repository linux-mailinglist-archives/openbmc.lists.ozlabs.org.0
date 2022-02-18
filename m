Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602804BC058
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 20:40:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0hrP5KkVz3cTQ
	for <lists+openbmc@lfdr.de>; Sat, 19 Feb 2022 06:40:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M0Ll0MGE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M0Ll0MGE; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0hqw349Bz30Pf
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 06:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645213229; x=1676749229;
 h=message-id:date:to:references:from:subject:in-reply-to:
 mime-version; bh=kO6U794u4KkwwFFKwF19yQA0Ye8Ukb7on0PwJT9d7Yc=;
 b=M0Ll0MGE+OjzztzcGY5170E677Udmtd17ha8q/d+yBOhkX0DTXo/cAMH
 rZl60acbvUiAURRCMjvAWf2nZW/w7Cfa7Dk1Rz2M9gWGX2PR9f46QsMbI
 kIJ+mP8Cnz33i7gi722jDmWFVW8WBm62P6xhzAkxEvxPuPmlU+M79/x6T
 oRoBQpAVGD4DAZ2uQbb+bAfe6eCN2/waaRukumGYtugouOZpbwZ3ZC609
 kMpbO+ldTIpDYzsHDSo4oYRj/zr6CRu1fD9+7r85/lWc4IJWcGI8fFPfO
 XqT90nh41Z1hKyS5HE17Aip2h9WV6z5VYu2ywrDunvDejeNyXvrajRDQ4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="311942229"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="311942229"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 11:39:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="572413715"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga001.jf.intel.com with ESMTP; 18 Feb 2022 11:39:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 11:39:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 18 Feb 2022 11:39:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 18 Feb 2022 11:39:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 18 Feb 2022 11:39:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLaodIk8sD7/JAiJWZgGE4XXQ56J0It1C40gLTRx6j+M/nPoin4B5fldL5osmbuOoe4NAgdigH/4IiYWbRBT6eryTgnb8ZCEdVXVA3uuoTbqO9azK+rDCt0JhgVQKI3yvONdB+h5Bb/0rrI2wvU6o6nItNTTjon9CILaqgmGV1CnOb0nVDku5efoT5NQOg7W8sq7Rc6eqvcF90CsLeq/0CwPpgD0KvoArrpQLOpYEZ+t5FzbSTJzaNZoAS5qamkvcVnMOQJE6g18omMVKy5Rps6DHG+Z17+WapjnyerR8AO4G1yoKhlKuRpzkx3j/vgoJ0MQdjRIljPfTNprorGxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO6U794u4KkwwFFKwF19yQA0Ye8Ukb7on0PwJT9d7Yc=;
 b=k5nmEiI4o66dWnpH18/pKJtQ+tyqPlkjXtOIQPujMCutL1qkx09vicus1u1WQQfaqpBc0SrxWfG7o0ddLnphA2r5FKFvXkwPfIXJpvUfIhQb355ZZCFH5P1gmUQFnz5DpVKa7H4ilHcu0NZXSLgzi2DAXmaoJQuIiRWemAEk8hMdF4830uJ4HabtoYpl9IlgAQf/ju8grNZCKT86jffrunmprsS3L1pBIctQ9jAY+ofArEgCVceYHr4JIJ4U8JRc8VY7ppY7itl2swUva/X8l1CrX3yCZPwAfpTRs3IL/Vil7m0WKli3xsY5M4VORbZWiPD6lE4w6cDzaG43493mCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by BN6PR11MB4001.namprd11.prod.outlook.com (2603:10b6:405:7f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 19:39:15 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::78bc:db7e:2581:4c92%5]) with mapi id 15.20.4975.018; Fri, 18 Feb 2022
 19:39:15 +0000
Message-ID: <5c14f9f8-886e-236d-3953-47c27f1e61bd@intel.com>
Date: Fri, 18 Feb 2022 11:39:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Content-Language: en-US
To: "Doman, Jonathan" <jonathan.doman@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <c5ca733f6c1dc5041c787fc160d5bf3e4d722b36.camel@intel.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Checking for network online
In-Reply-To: <c5ca733f6c1dc5041c787fc160d5bf3e4d722b36.camel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KRiA3ByPs9SkkFl6A8BOpCko"
X-ClientProxiedBy: BM1PR0101CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::33) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08afe313-c07e-4bc4-dbea-08d9f3165887
X-MS-TrafficTypeDiagnostic: BN6PR11MB4001:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB4001BFD409E220E1098322DDE2379@BN6PR11MB4001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vzm9VDn3mbNB56bOA9UKsrO+gUzrM5c7SvurlWqvP9Win9PCWWMzJ49F0V56OoiRQOkOeGxiLRKfqbvD37cXQO+eOnMNwPINO3zbWUqyFh2IRP3wlYZs6JPtWHfpnmwzwLJqsg0JPIPAKt76s7c8vRkV8GLqn0baFbjs7ZobHWUawEJ6NeLk7k41ca42hA9BhhHj28YblvPEJ2shwyIUp89J0nzBRs7Op+bnPtRWcOGFaVsPifnf8MHZrvg3yHrdwyjsdt0I2fr76oxtmLXtNePtE+Hx41ilb1cpkrpKamoETwV7yIkm5zmPhkYUrv5SfxCbZqEWiwkSK3YreQTSFjKisfaobSqXsNCPrV+qN3b8Dv9xAPhwNbm+PaJh/HlQAquW+PxsXqeZF8TwoO06m69bfLKEyvKWmNH4oYBt4wcP/ZCwnNrUwZ1KexpIjVayaOSfTzfMl6hWniilDqPF72rscBMVWPMmZQU7jBzDTExujRRhZHT9R1oM6F1LE1q7/LcquwgJ+DLmkezZtywgyJMzp5J1MKm2/Ovr4MMl9sG8WV6DdREj+HJpNLhaQHt5SVk+dKZQsFOrFdyr4pvixJblK/muoT7+QedyyH/BCfu5B+xnIDHBXUgyGgY7tHs2dnc6KSLkPwVPqjkP80w57BL5IPJ/fuL55X85670t/CI5lw6/bi7h+MBK64GiXto+73/sao/+hDNqely7Q+7J46fZV/dHcJi6hFIgF503uwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(38100700002)(83380400001)(66556008)(31686004)(186003)(26005)(86362001)(2616005)(6512007)(235185007)(6506007)(36756003)(66476007)(3480700007)(2906002)(8676002)(53546011)(33964004)(21480400003)(31696002)(508600001)(82960400001)(8936002)(6666004)(5660300002)(40140700001)(316002)(6486002)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2JZbUh3ek5qZnVwMkYxaWMxYXdXcHBNZGl1YitMK2NvRVpGVlZlUHJkd3Rp?=
 =?utf-8?B?VnNicFJ5azVLQzY3b3JweGF4T1VNR3hwSXRoNU41TkpyQjVUdjNxa1VFWnhr?=
 =?utf-8?B?YnhqZXpvR3paUzdTSDF1cDZzcGxkVnNrVVBsbkxBRnFWVkJmWlM1VUs0ZlBL?=
 =?utf-8?B?TjZqZ2pKSy9RMFhlYkxZUllYMEJ2cFFVb0dLV0NMOUdOcS8vdEQ2UklKNExt?=
 =?utf-8?B?dXk5VG9vM3I4a2VQNWFxTzFBVEUwVUcxUlZOYkJienZLaWo3bXQ0c21EVVVC?=
 =?utf-8?B?cUJhWDR1eTFhUFpneEFUY0loOG9XTUJhMkJDZmdjdS80cHh1WGlIdjQxaTdC?=
 =?utf-8?B?c3ZzVjVmeFhhNUxFaEFHRzNhbUkxRmVnV3M0enJRY1NhdVQ4NVZ6V3M3T1FL?=
 =?utf-8?B?SzU4aXpNTVF1SzAzNTErcXVZbVFHY2I3OEhPZXRiek0vZ3gvckJ5Y05OWThk?=
 =?utf-8?B?M1V3ZjNWaVVHRWNvTWh0NVhNRDUrcXAvbkFicTJRdGRqTHpNMnIzbWJwQlZz?=
 =?utf-8?B?TndIMEJJZjBZb3F6UnN1bFNqUFpxWHFaRCtUVXZFV0xCRXh5bGkvOHpFWnhv?=
 =?utf-8?B?L29obks4VTlyT2JmN2hkRXovelVrcFFPYnFxZm16ci9aejV5NVJzYmFldVg3?=
 =?utf-8?B?U2hIRDE4d2hEVWNMK2FQQmtHOTdjZFZQL2ZaWjlJaVdMVU1CbnJCZ0hab2lx?=
 =?utf-8?B?UmdoY1kzVHh2UzVKNUpXZWwvMzBicnFNamJQaDBMc0h2dUxueW5XNzNWT0pP?=
 =?utf-8?B?TlE0UkJQSEI0ZmRhR2dTT1ZhTlN3Y242YmgzbUhxQ2MzTXNjbmFWUWJJU1A1?=
 =?utf-8?B?bjU5SjN6czlaWm52bjk5Vllyb2FPRHhkZ21INSt3WGoxMW14N1pMOFlxbWZX?=
 =?utf-8?B?WHlaTmtUaWtiWC82UUtpc3NKM3I4OVNkVGo4cS9qNk1sMXhpTGdpY1Y5Q0xn?=
 =?utf-8?B?czhQSEcyMjJKdFZSODRFaWtlTkxCRUJ5SDNKbEJzaTB1WU9FdkhaNkpEemV0?=
 =?utf-8?B?N3lZaitqbWNHcjhmaThBcUlXcGpKV1FrWkVKdWRTQ2s3azNmc1dtREdtSVRv?=
 =?utf-8?B?VnF3SlJySDRiZGNvc3hmVmZqYnordUc3NnQ4bE40bXM5MmtubFJGcUxQTlM5?=
 =?utf-8?B?VThlMWN2UEZSTkJxOXdzTFhDSEFRQ1o1OS94V0hCQVlOUmt2U1lKTk5mR3R1?=
 =?utf-8?B?bjd4c1NydWZjbDhXeW5FYU9UaU9XMDFLMDUvQUZpWWw3dFRRU04wRlhUdUl4?=
 =?utf-8?B?OEJSRWxHWTYxZmMwRTFMVkFoR3lHdGhGK3dEZGxNaVlwN0JRS3Jhc1E4aEJ4?=
 =?utf-8?B?UExzWVVtb3NUbnJyQ3pPR3QzMWpWT0hvYTJWdjZCWjFuaWMzYjFEbmEyWC9S?=
 =?utf-8?B?UW1ZOHlUeGxIUnFDRTZRZ2UrRnZzS3NBTmcxVW1oR0dNc0lHZmMza0FpdDRG?=
 =?utf-8?B?VnNDZ2UyOEZMdk5ydVVmZ3RqenRTWUZYQ2MwSkF2MHkzWFBhUUFqQmkveU5M?=
 =?utf-8?B?U3B3MFp6NURwaVQrOUsreG5oNFVDbmtTWDFNRmhlTzhhb1F6c3JSSGJwSE9F?=
 =?utf-8?B?ZDc0VmlZbk1ERW9MbUdwYnlKRC9TcENqbnZzYnZUSGVzb0JNNm9CZ2tLc2N6?=
 =?utf-8?B?b2xyVzI1UVR0UTNSOExidHRTOFN4K0dTSkR4ajNheklrUVg1WU1BaDFTOFRx?=
 =?utf-8?B?SUJiM0NBNmFZRDBHQUh0TXBoR29KeFJhK3dZekZCTjlaQVJ0WTM0d2cvVnhB?=
 =?utf-8?B?ZitnaUlvbXNrcTdvVldQUkdXMk5RVFkrdkRYSnpKMWFQQ2tDNXBWU09PTGE1?=
 =?utf-8?B?UTJsaVZkK0R2RTZGWHZLRW53emV5dTdzTkZ0cHRtblRmaldhWVJ2WDIzV2tU?=
 =?utf-8?B?UlAvQVM2bUxNQUxhTWJLSWxEOVlIZm15WWkyaU53TDJIMjRIdXJHZ0k3QTVC?=
 =?utf-8?B?Z2dzU1ZFK2V0QzliUUFmRWdTMjNEeWJFTHNrQjZxY2orNEJZclY3TmovT2dV?=
 =?utf-8?B?cXlZZS81b3ExWlRKWVNWMEJiTDRpWFpmcUkxTDlYS2kxTFF2VFlEYTcxRFl1?=
 =?utf-8?B?cTdFcG5KMFlKUnhjM28xOXNRQ2ZSSGdlZTE2Wlh5am1TRFhTRU9JeVU2ZjZw?=
 =?utf-8?B?Ull5RDFubkwzWUtIUmMzeVFJVlBsQWJGR1A3N0RBYys0dUY4VTZFL3ZYV0hI?=
 =?utf-8?B?aXNyZHQvS1RhZkNIN2wvQWltQ29hRUdkNnRXZVFCN3plMldVbTFlcElnWkNC?=
 =?utf-8?B?UzBHTU1jazRhMHQ4Q3RLRG9tLy93PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08afe313-c07e-4bc4-dbea-08d9f3165887
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 19:39:15.4932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jgdm4chmgp84s2lzLxD2Fb9KMe72kSEKCq9udwxUj1qgwETXt0jDcJKpv38eRBXrEbWBdIDxN792cLmW7k8ogTZO147mLc/FfZIAN8OUKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4001
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

--------------KRiA3ByPs9SkkFl6A8BOpCko
Content-Type: multipart/mixed; boundary="------------7aqmHGnwgPz5SNNNhBMb8mUi";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: "Doman, Jonathan" <jonathan.doman@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <5c14f9f8-886e-236d-3953-47c27f1e61bd@intel.com>
Subject: Re: Checking for network online
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <c5ca733f6c1dc5041c787fc160d5bf3e4d722b36.camel@intel.com>
In-Reply-To: <c5ca733f6c1dc5041c787fc160d5bf3e4d722b36.camel@intel.com>

--------------7aqmHGnwgPz5SNNNhBMb8mUi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDIvMTgvMjIgMTE6MDQsIERvbWFuLCBKb25hdGhhbiB3cm90ZToNCj4gT24gVGh1
LCAyMDIyLTAyLTE3IGF0IDE0OjU0IC0wODAwLCBKb2huYXRoYW4gTWFudGV5IHdyb3RlOg0K
Pj4gL0kvbnRlbCBoYXMgcmVjZW50bHkgcnVuIGludG8gYW4gaXNzdWUgcmVnYXJkaW5nIGEg
c3lzdGVtZCBzZXJ2aWNlLCBhbmQNCj4+IHdlJ3JlIGludGVyZXN0ZWQgaW4gc29saWNpdGlu
ZyBmZWVkYmFjayBmcm9tIHRoZSBjb21tdW5pdHkuDQo+Pg0KPj4gSXNzdWU6IHN5c3RlbWQt
bmV0d29ya2Qtd2FpdC1vbmxpbmUuc2VydmljZSBzdGFsbHMgZm9yIDEyMCBzZWNvbmRzIHdo
ZW4NCj4+IHRoZSBtYW5hZ2VkIE5JQ3MgZG8gbm90IGhhdmUgYSBuZXR3b3JrIGNvbm5lY3Rp
b24uDQo+Pg0KPj4gVExEUjogU2hvdWxkIE9wZW5CTUMgcmVtb3ZlIHN5c3RlbWQtbmV0d29y
a2Qtd2FpdC1vbmxpbmUuc2VydmljZQ0KPj4gdW5pdmVyc2FsbHk/DQo+Pg0KPj4gU3lzdGVt
IENvbmZpZzogQWxsIE5JQ3MgaW4gdGhlIHN5c3RlbSBhcmUgbm90IGNvbm5lY3RlZCB0byBh
biBhY3RpdmUNCj4+IG5ldHdvcmsuDQo+Pg0KPj4gVGVzdCBQcm9jZXNzOiBUaGUgc3lzdGVt
IHVuZGVyIHRlc3QgKFNVVCkgaGFzIEFDIHJlbW92ZWQsIGFuZCBzb21lIHRpbWUNCj4+IGxh
dGVyIEFDIGFwcGxpZWQuIFdhaXQgZm9yIEJNQy9CSU9TIHRvIGJvb3QNCj4+DQo+PiBCZWhh
dmlvcjogVS1Cb290IGhhbmRzIGNvbnRyb2wgdG8gdGhlIExpbnV4IGJvb3QgcHJvY2Vzcywg
YW5kIHRoZQ0KPj4gc3lzdGVtZCBzZXJ2aWNlcyBhcmUgc3RhcnRlZC4gV2hlbiBzeXN0ZW1k
LW5ldHdvcmtkLXdhaXQtb25saW5lLnNlcnZpY2UNCj4+IHN0YXJ0cyBpdCBzdGFsbHMgd2Fp
dGluZyBmb3IgdGhlIE5JQ3MgdG8gZW50ZXIgYSBmdWxseSBmdW5jdGlvbmFsIHN0YXRlLg0K
Pj4gVGhpcyBuZXZlciBoYXBwZW5zIGR1cmluZyB0aGUgZGVmYXVsdCAxMjAgc2Vjb25kIHRp
bWVvdXQgcGVyaW9kIGZvciB0aGlzDQo+PiBzZXJ2aWNlLiBXaGVuIHRoZSB0aW1lb3V0IGVs
YXBzZXMsIGFuIGVycm9yIG1lc3NhZ2UgaXMgbG9nZ2VkIHRvIHRoZQ0KPj4gam91cm5hbCBy
ZXBvcnRpbmcgdGhlIHNlcnZpY2UgZXhpdGVkIHVuc3VjY2Vzc2Z1bGx5Lg0KPj4NCj4+IElz
c3VlczogVGhpcyBzZXJ2aWNlIGJsb2NrcyBlbnRyeSB0byBtdWx0aS11c2VyLnRhcmdldC4N
Cj4+IHBob3NwaG9yLXN0YXRlLW1hbmFnZXIgdXNlcyBtdWx0aS11c2VyLnRhcmdldCB0byBy
ZXBvcnQgdGhlIEJNQyBpcyByZWFkeQ0KPj4gdG8gdXNlLg0KPj4gVGhpcyBpcyByZXBvcnRl
ZCB2aWEgSVBNSSBHZXQgRGV2aWNlIElELg0KPj4gVGhlIEludGVsIEJJT1MgaXMgYmxvY2tl
ZCBmcm9tIGJvb3RpbmcgdW50aWwNCj4+IHN5c3RlbWQtbmV0d29ya2Qtd2FpdC1vbmxpbmUg
dGltZXMgb3V0Lg0KPj4gQk1DIGVudHJ5IHRvIG11bHRpLXVzZXIudGFyZ2V0IGlzIGRlbGF5
ZWQuIEpvdXJuYWwgZW50cmllcyBhcmUgY3JlYXRlZC4NCj4+DQo+PiBRdWVzdGlvbiBmb3Ig
dGhlIGNvbW11bml0eTogR2l2ZW4gdGhlIG5lZ2F0aXZlIHNpZGUgZWZmZWN0cyBjYXVzZWQg
YnkNCj4+IHJ1bm5pbmcgdGhpcyBzZXJ2aWNlIGRvZXMgdGhlIGNvbW11bml0eSB3YW50IHRv
IGhhdmUgdGhpcyBzZXJ2aWNlDQo+PiBjb2xsZWN0aXZlbHkgcmVtb3ZlZCBmcm9tIGdsb2Jh
bCBidWlsZCBpbWFnZT8NCj4gDQo+IEkgdGhpbmsgdGhlIGluaXRpYWwgZGlzY3Vzc2lvbiBp
biAjZ2VuZXJhbCBnb3QgdG8gdGhlIHJvb3Qgb2YgdGhlDQo+IGlzc3VlOiBtdWx0aS11c2Vy
LnRhcmdldCBXYW50cyByc3lzbG9nLnNlcnZpY2UsIHdoaWNoIGluIHR1cm4gaXMNCj4gb3Jk
ZXJlZCBBZnRlciBuZXR3b3JrLW9ubGluZS50YXJnZXQuIHJzeXNsb2cgc2VlbXMgdG8gYmUg
dGhlIG9ubHkgdGhpbmcNCj4gdHlpbmcgbXVsdGktdXNlciB0byBuZXR3b3JrLW9ubGluZS4N
Cg0KSSBhc3N1bWUgeW91IG1lYW4gT3BlbkJNQyBEaXNjb3JkICNnZW5lcmFsIGNoYW5uZWw/
DQoNCj4gDQo+IERpZCB5b3UgdHJ5IHJlbW92aW5nIHRoZSBXYW50cy9BZnRlcj1uZXR3b3Jr
LW9ubGluZS50YXJnZXQgZnJvbQ0KPiByc3lzbG9nLnNlcnZpY2UgdG8gc2VlIGlmIHRoZSBz
aXR1YXRpb24gaW1wcm92ZXM/IElmIGl0IGRvZXMsIHRoZW4gd2UNCj4gY2FuIGRpc2N1c3Mg
cmVtb3ZpbmcgdGhhdCBkZXBlbmRlbmN5IG9yIG1ha2luZyBpdCBjb25maWd1cmFibGUuDQoN
Ck5vLCBJIGhhZCBub3QgdHJpZWQgdGhhdC4gTXkgdGFrZSBvbiBkb2luZyBzbyBpcyB0aGF0
IGl0J2xsIGJlIGxpa2UgDQpwbGF5aW5nIHdoYWNrIGEgbW9sZS4gU29tZSBvdGhlciBzZXJ2
aWNlIG1heSBkZWNpZGUgdG8gcmVseSBvbiANCnN5c3RlbWQtbmV0d29ya2Qtd2FpdC1vbmxp
bmUuIFRoZSBpc3N1ZSBpcyBub3cgY29tcG91bmRlZCBhcyBhIHJlc3VsdC4NCg0KSSBiYXNp
Y2FsbHkgdG9vayBpdCBvbiBmYWl0aCB0aGF0IHJzeXNsb2cgbmVlZGVkIHRoaXMgc2Vydmlj
ZS4gSSBkaWQgbm90IA0KaW52ZXN0aWdhdGUgd2hhdCBpc3N1ZXMgYXJpc2UgaW4gcnN5c2xv
ZyB3aGVuIG5vIG5ldHdvcmsgaXMgcHJlc2VudC4NCg0KVWx0aW1hdGVseSB0aGVyZSB3aWxs
IGJlIHRpbWVzIHdoZXJlIHRoZSBCTUMgd2lsbCBoYXZlIHRvIG9wZXJhdGUgc2FucyANCm5l
dHdvcmsuIEl0J3MgdW5mb3J0dW5hdGUgdGhhdCB0aGUgd2FpdC1vbmxpbmUgc2VydmljZSBk
b2Vzbid0IHNlZW0gdG8gDQpwZXJmb3JtIHRoZSBleHBlY3RlZCBvcGVyYXRpb24gZm9yIHRo
ZSAtLWlnbm9yZSBhbmQgdGhlIG1pbi9tYXggDQpvcGVyYXRpb25hbCBzdGF0ZSBmdW5jdGlv
bnMuIFRoaXMgbWF5IGJlIGEgbWlzbWF0Y2ggYmV0d2VlbiBteSANCmV4cGVjdGF0aW9ucyBh
bmQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBvZiB3YWl0LW9ubGluZS4NCg0KLS0gDQpK
b2huYXRoYW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXINCiphemFkIHRlKipj
aG5vbG9neSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5IElubm92YXRp
b24gc2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9obmF0aGFu
eC5tYW50ZXlAaW50ZWwuY29tIDxtYWlsdG86am9obmF0aGFueC5tYW50ZXlAaW50ZWwuY29t
Pg0KDQo=

--------------7aqmHGnwgPz5SNNNhBMb8mUi--

--------------KRiA3ByPs9SkkFl6A8BOpCko
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmIP9dcFAwAAAAAACgkQOcg9x5uaKcCJ
4gf/X3pDvR+sEKiWHVT15yoI2XpqG+s80mOBommFW5sJtaxGOprQm4PXIFkbaFWJnL+7ZsePDapD
Kw+cKQ3OoyQvHOinjsgv/RqD6o2llRubvF6Bz969KWaMWVWBWW4iPQkM79UbFLu6zHAc3RmsYqI8
pNv+zvigOlI5/3BGTtwK23vaG1n23ZGaT+klBJ997Hh/O5UhfcbUoJRCYO35n1l8i2//f61c6XqN
9VsER8/0Hx8of565ZBlZwdN+79BmWL9LSCwDd+G52oZesERAEeFEr4OAX1MjDSyi1Cl9XuCQGUQL
1c3wGwXaajOMxfutiCnJ4FKapuFNPddf7IiSkmE5rw==
=JYUR
-----END PGP SIGNATURE-----

--------------KRiA3ByPs9SkkFl6A8BOpCko--
