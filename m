Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF2D4096AD
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 16:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7V4z0tXWz2yZ6
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 00:59:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=e08A7dDt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=e08A7dDt; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7V4V1k1Cz2yHH
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 00:59:19 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221747154"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="221747154"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 07:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="432587981"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 13 Sep 2021 07:58:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 07:58:02 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 07:58:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 07:58:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 07:58:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdNz+z+KVnJjCme7RkyvFGXzpFU9o8iD6oPJmMm4ErhUjoJ7FYPIVzOxpSO3/2V0OKfi7JpprD7enzTvSuCF0dYS987spppOyZmkw0bslhtOec+zJqxKeop4ns+MzPkpK74Nxwo7DzXpkfkmE/f+Xz8qNgQVgRqiiNOiZxUufMjN5iuHfCG3LFORBwRsDaqVPeA4MT+XjBfi2SQHJlcHPhHasmVLkKvdTzLhQ3ULxUXhkTKugpTQyd9w9eIxapN9LfuomMGwrdn4Wzs+ngMDLh/yygElm4fakYSYXjPlSK+7CdP8xXBkPNijcGiVIReRpgVcCWOhZmtFr4c7o0lBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=QeLJLrvENKFCDb0BMmNk03yCRyta3HJ8Z5pZ9OR8ZLY=;
 b=R+Q94mIMucE97466gkU/L9ANa2zIln93EECewJ+zza/TC+337qNPHxT0C7qDVC+JztztvC3byiYcVP5lyXW25B8pcgDdF3EJJhW/hA+/zCIsY4xdxNfVUSN6QUd8xu4cjTtD/F9+XaotqQbI6s/eGG6Bhzi6icC2zNwwS6c1gndyxk1ks8EcaP7KEW9bL5cQmKc7VmOvJ6IU1u+rsU0YAKb68FdPzKOX1eerU38G+abcMUWeesznJv/WqKuyXXDh/9Hv/uKvhL37SpBDW2lxs8GwTZV3seDjSoW95PJctLEScMmRuI49AQVGvIgU/BlP2vn5/336ya//3uwv52dViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeLJLrvENKFCDb0BMmNk03yCRyta3HJ8Z5pZ9OR8ZLY=;
 b=e08A7dDtU1cufHm8iR61U4VDHpDcLPCk3D6exffXNLPNPlRm1Z6VHgea6pL5UNPzgz25tL4++fpm3RRfDDjzL/P1/DUi7r10icAnDRpA56im+Fiun+Ux7uN7gckxD43hCjwB6apJSBUgW9PQ2dWk5/V9SP4mZkS6lBezd+TEiQo=
Authentication-Results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
Received: from SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 14:58:01 +0000
Received: from SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165]) by SA2PR11MB5177.namprd11.prod.outlook.com
 ([fe80::d567:2bfe:5382:b165%8]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 14:58:01 +0000
To: Heyi Guo <guoheyi@linux.alibaba.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>, Tom Joseph <rushtotom@gmail.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
Message-ID: <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
Date: Mon, 13 Sep 2021 07:57:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
In-Reply-To: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BulkszIyDwjbWJI0Nz8qnJguKlsszYnet"
X-ClientProxiedBy: MWHPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:300:116::31) To SA2PR11MB5177.namprd11.prod.outlook.com
 (2603:10b6:806:11c::10)
MIME-Version: 1.0
Received: from jmanteyx-desk.jf.intel.com (134.134.137.85) by
 MWHPR07CA0021.namprd07.prod.outlook.com (2603:10b6:300:116::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 14:58:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 466991e5-2ef1-452c-6267-08d976c6e175
X-MS-TrafficTypeDiagnostic: SA0PR11MB4639:
X-Microsoft-Antispam-PRVS: <SA0PR11MB46391BF1EBF6BDAD7E5A5BD8E2D99@SA0PR11MB4639.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQKfKa/+7W0oYLiM/axZfZnx4RRsAsdVEIQiLbbLQ8Gaywrqn0FBKdzDoQ4P3YxhSZSmk6uuwoMqnGBUjRDyIy9ql3vzyMpxwY7NdAbIKsqzw3jOLr97SYPmg3cmBjX0wUVKMwEN/xPuQLagFNmxGWgZ8OZ9qtUPu0Pi/StVH8QH1t7yNoKehILCVqwB3DPhEpR8R+EgHTFxTqesdVNOMtd4DDUFmyJRwy7570WndUHM9uf8krX+CMPMdbWQJCigv/czZlsGHHeqPROrb2w4FWB5VyJ8nSWk38tAFsmcoaxAICNYRrrD+IyBrrlrW81bvviENPh6Mfx4ZRnnSfjW14IjRWXxTSeje1Sm+LzvqkMSIHSJziKUrSgpZtOvhUZE0SY3RVotFYPzEgo+O9UxiDCbPd3pF1LuMAJM3VKXOD/9EXjfhRufd6tYyohG6EM9S4MUplUMBgm3si9x14b4aNzX9fdk1tlh7piJLAhhTMTD99oc7lZM6IY9VD9JL131RHQ3WdVTdJCFlsm4Wt3C9Y8rICC1BYEQtUmoJDvR9F+piXCQEK8Oxw3AnUM44PMzUrrfKfjUQpc8zU+N5q13TwPRIybEhNSJOm5rwbYnm1aw4qCyqHjPYnY9tVpltJJLGG2u5kK9v+r3hBk3gKxM5txL1iG5elpEJdvGXo4dNb8jDuRN++bY78nLGOrqyhe8plYwwF50YtX/6PzpLSbUAH8ssqG8mZt0LY0boKRmslU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB5177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33964004)(38100700002)(83380400001)(86362001)(66946007)(316002)(508600001)(6486002)(31696002)(110136005)(36756003)(4326008)(8676002)(2906002)(956004)(26005)(31686004)(53546011)(8936002)(21480400003)(5660300002)(66476007)(66556008)(40140700001)(235185007)(2616005)(186003)(7696005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJpR05DT2FaTU9xWHJDeW95SkJVVWZmRCtQSFpIaFZIMWR2Y0Y2VWI0aDVK?=
 =?utf-8?B?TW5CVDluVVFYZzVmTnpqWGJxWmQ4SHlTbXpmMVFrd1poSFh2QlNBL0FHclM5?=
 =?utf-8?B?UUxuTG1Sd1puQ01yOFYzclNJMXJyVTBXZzg1Q0FQWkZ2TU9KNnEwVm5DY0dh?=
 =?utf-8?B?VXp1VUdRdnVYVGRseDVOUWExQy83QWpRaC9CVEdnSm5mUVEvYTVvaG4rWjFT?=
 =?utf-8?B?WHU5b29nYjBFMkkwdDYzZmtlNnVlcFErMC9XZW53ZU8xaWFMWnVvcWhEV0g5?=
 =?utf-8?B?MGJhVGlHSWxISUsxRXh4TkpNTHpjYTNsVWQzZnJzTDdhR0JaN2RmRnpFMStF?=
 =?utf-8?B?TU44dGxucnc1RjR2TU1qWFFYSjNuaWxDeGMrbWxEUWp3c0svZ3FMM1lFdkR4?=
 =?utf-8?B?cXNOOWNla2FDckFtdUZaZTNsRHl0Y0hTd0Zjd0oxMGlYdWwrSWU4QUpSa3ZK?=
 =?utf-8?B?QWk1Zk5nOFVvbVVLenc5V2RTTFRIZ2l6VmcySFRZUGhWUWJIcGhBNWNUa0l4?=
 =?utf-8?B?SXRoYXgxOTcvOFg2ckJzQUhObnhXWGZSaW10V2krYUFBUnpjZDJXak1jM3JP?=
 =?utf-8?B?RTVNam5iOTFUd3JlSlN6S25ZNFpBTWgybGxBYWViYmpxYWFKcytrVU9iaUZS?=
 =?utf-8?B?TDR1VVNCT1NPcU9JMThpSy9FdkNpVGRZWTVQaWQzcTBtb3N6ZDNzbHBEWkFG?=
 =?utf-8?B?NEt1SVBwMFoza2VvbS9Xdm5jT2kySW11bXJaWUpoS3V5SDhWVjE5Qy9RdVVj?=
 =?utf-8?B?Y1VvN0o4cklpRnJUNzd3eWlyMHNiemQ2YjZKZ0pqc3ZWMWdQU0w1cXUwTXRJ?=
 =?utf-8?B?c2VYUUs1RFBzQUlRa3k0OFFNbVRsRU5sNGFSR015a2taeXExS2lhY2pQZkxs?=
 =?utf-8?B?am9DVjNrUXVRbnBnaDBrVzBBeXdnVVZkaWpGcDV4eEV3bVpHY0w1VkpkdDFu?=
 =?utf-8?B?blU2NWNUOXJnSkk1RFJyQjJFY2tLdFYxSnF6ZnhJOXg4aVlmeTZqc1F4MUxF?=
 =?utf-8?B?YlZTTjJuUHN1Mmc1aDZzR3pha3RId2tSSUEvdVVCTzlJVVVRNG1tQVZMVXFX?=
 =?utf-8?B?eFFhUllGYVJ0eTl0UnRCQ0g4WStYaW1IYTV6RCtRK0ErTXNzM2lSaEQ0ZFQ5?=
 =?utf-8?B?U0Q4WnZMMFEzZ0Y5bHZodGlxOHNxSUNvL1hZVWllZVRiUGtqb2lFVE5mUXZp?=
 =?utf-8?B?VnpNMGJEZUU5UGkvMDExRW9ucHo2U0I4dFovWEdDS3NERklXQVdqcVY4U3RM?=
 =?utf-8?B?MElveCtyb3YyQ3hNam53dUpvVy9qL2w0bi9ST3pvTkRXRkd0cjBEbERnSENZ?=
 =?utf-8?B?a09qZDRtdzJnc1VmYklWWHJ6ZnNuSjBpamRHdHZTcG5mOWRVa2xFRVc5cEZ3?=
 =?utf-8?B?SzFzUlBzM1dneHZNUjlQMk11a0JkZWhVK2QvUmJGTVJWZU9YYzVzNHJKeXo2?=
 =?utf-8?B?bXVmWkJIbEE1YVhwK2NYM214VTJIYmxFZG94NjdFNkZEMm9GWWFXWmwzMi9L?=
 =?utf-8?B?bzJlMDEyc2NQdTlpVG1QaGtoL2prQzZjVmhGOFhoS0J2Q2RqTG9HUUFETzM0?=
 =?utf-8?B?ZkIyTm54R09FbXBjRHA2SXlaaG1ZcjlKdHlFaExycURwNzNGS3JDcnBITlNM?=
 =?utf-8?B?OFo3MVhocWlDUnlJeDZJd2NmckFGejU3Ukovc0hmNExGNWg4OFJ2b0E5QjQ3?=
 =?utf-8?B?Z2RFK3RIQm1VWENiYW9pWndNcmtVOW9xK2l5MnkvaGhybG9KMjF0OSt3eGFm?=
 =?utf-8?Q?DfwYDAOVgOVGwXIplzVLmHDKnjFzu3aLxGR+Hpu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 466991e5-2ef1-452c-6267-08d976c6e175
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB5177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 14:58:01.0890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HM3BjDg1bqrnzhTt8JQOrB5XH9TRASuSNMNnMhoAdHpnZ683wFWH6jWY+rcHZdtfnpeJw4TGLawRPF+edDreYTPArMwxO6b18tqqvD2AsNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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

--BulkszIyDwjbWJI0Nz8qnJguKlsszYnet
Content-Type: multipart/mixed; boundary="wTgLA4ei2oR8w6NonRJZ8OtCnIFRHdPaq";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Tom Joseph <rushtotom@gmail.com>,
 "Puli, Apparao" <apparao.puli@linux.intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <2416388c-73fe-f4fd-8c1c-c98f9c93230c@intel.com>
Subject: Re: [Question] How can we use underscore "_" in sensor name?
References: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>
In-Reply-To: <3a702375-de87-985d-d096-7f187d293459@linux.alibaba.com>

--wTgLA4ei2oR8w6NonRJZ8OtCnIFRHdPaq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Heyi,

On 9/13/21 3:49 AM, Heyi Guo wrote:
> Hi all,
>=20
> Can we use underscore "_" in IPMI sensor names? Now we see that "_" in =

> sensor names will be replaced with space in the code, even if we really=
=20
> use "_" for sensor names in json configuration files.
>=20

Which layer is translating the "_" char?
Are you referring to D-Bus?
IPMITool?
Some other locatioN?

It would be helpful to know.
As an example, D-Bus translates "-" to "%2D" and back because D-Bus, or=20
one of the D-Bus consumers can't accept the hyphen character.

It is likely that the underscore character has some similar naming=20
convention issue.

You may want to investigate using the same scheme to translate between=20
"_" and a "%5F" combination.

> The background is that we used underscore "_" in sensor names in legacy=
=20
> BMC, and all the OOB software uses such names to get sensor data.=20
> Therefore we want to make it compatible for switching to OpenBMC.
>=20
> Is there any way to achieve this?
>=20
> Thanks,
>=20
> Heyi
>=20

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--wTgLA4ei2oR8w6NonRJZ8OtCnIFRHdPaq--

--BulkszIyDwjbWJI0Nz8qnJguKlsszYnet
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmE/ZvYFAwAAAAAACgkQOcg9x5uaKcAl
9ggAifPFBTvqXLxBwj03A3qaEL7rDXBTEOZIp6xsgBMsQPIwagMR9YgLVYChJgViP09UX0lY1Qgj
7eKcRX84sdOj9ZoZWT2KZCSoGcnvytEo/rEs+bRBMk/z41FEmvNlT2kgRB8ucib0YqriB9m8N2bh
d/XbOWRghZlFFnzoX2GCwQf3ZCdydm2d5AwI3h664VaSZ383KKwJJAMH3H9dYz6bDpEtTa3yeoy7
q5vSy4bshAWqVas9uwqCbZb5hkMhMIC/VlLIF8DAGxRT6FFJRru5fG7PM9RiGsQuneM4qb1SlMtS
JwKxXpQoIq8OtT1QbXKfC2RR3wNz8GmLZ8zVP5mWJQ==
=sy7b
-----END PGP SIGNATURE-----

--BulkszIyDwjbWJI0Nz8qnJguKlsszYnet--
