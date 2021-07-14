Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C33C94AA
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 01:48:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQDjW0223z308C
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 09:48:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=bGWJHq5D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=bGWJHq5D; dkim-atps=neutral
X-Greylist: delayed 125 seconds by postgrey-1.36 at boromir;
 Thu, 15 Jul 2021 02:54:44 AEST
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ3Wm0dtTz2yNl;
 Thu, 15 Jul 2021 02:54:43 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="271498299"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="271498299"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 09:51:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="488124004"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2021 09:51:32 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 09:51:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 09:51:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 09:51:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcVxOt5p9KH+BEJ72/mWf5K7Raopvre3ZkUQNOErp0dYF5AxR8f3yGTvXxD3XeP/PH8dt53I0Mcb1dMwtT5TgWb7LOPlLv+oiNqs5+u5ZJA8x0JEHufIce+6NAr4PzqHwb5HxOptTFqA6q3cLPhMtwX/c3LBloPSg8EhfQjOvWyvhXMpsZjgy2Ha/o6vR9eA4gRMbyDK2LtE8osvZAt9n/9RnGjq0n04daSmvic4sM6dCcK5WuyUswdh227IVMBEIg1ZC/6Bl8xLF9mpCqUhNVywGW4z3Es3Ib+Anscy6CXiTayLeuP/ibHE+wbIPFH7M3uJmbwebSeKRU+oNJ5vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTGM7Fy0zF56R3kbgEWgzIsGNFEGtxrXKMrok3TYTr4=;
 b=CGQRXIi0ZcxqtCirTg4USgBWQ3qnfyTLnxKkSl6spJuH8jCg3U0bPmCl6sdkeQq1mE8wTxllVpCC088XUovtyPfgd8Jh1NzH59GeWVbzt5mNo5ZlDTJ2BKEnKd4of3R7Rxpl9WasSJHx8wrjcD9/qVDdzrfXlrb06qHyDDX+PeFyrWRQSFRJjvNUfYpE/oN66G2miI/qFbl21tkDt5K4FKcPBNyeZqroscoWQJVOw9oVsCBtMEG6B3krWeMVslHQ1TZebVYztJGsYpR2i8HAyx85P0MjrM9Om2VgzOzf/o4wLNT/l6ITWV/5JEitjUYPR3+wh5rQ7MxZq7vw8Rlu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTGM7Fy0zF56R3kbgEWgzIsGNFEGtxrXKMrok3TYTr4=;
 b=bGWJHq5DWJtVhFgen6+uRGlKaMfpIIQyW+2nxXHOdzJYqusOUabPeKn4Xa1lrb9lRAadJAiKmpKUQGbmcWZo1zDBK3LPpmQhQFx/B+XxM5pTEXcTyhGPqMEUOxhRIWe6/U7ryEtE6EatKT4rm2S2/I9q9johiEMS9DsQQgVVUxE=
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com (2603:10b6:a03:2d4::18)
 by BYAPR11MB3798.namprd11.prod.outlook.com (2603:10b6:a03:b3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:51:27 +0000
Received: from SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::15f9:1166:732a:313d]) by SJ0PR11MB5150.namprd11.prod.outlook.com
 ([fe80::15f9:1166:732a:313d%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:51:27 +0000
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 00/14] Introduce PECI subsystem
Thread-Topic: [PATCH 00/14] Introduce PECI subsystem
Thread-Index: AQHXeNB8fbhsokCEkkWDdpxmkZucVw==
Date: Wed, 14 Jul 2021 16:51:27 +0000
Message-ID: <3b9cfe5f728c40c473a22070029c8790b452daf4.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
In-Reply-To: <20210712220447.957418-1-iwona.winiarska@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.1 (3.40.1-1.fc34) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deb12179-c542-4cb0-b575-08d946e79f9f
x-ms-traffictypediagnostic: BYAPR11MB3798:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB37981403FDADD0D4DFEEA060C6139@BYAPR11MB3798.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gCF4KRZ4ME1AA4naYOAKsN6jbrdjEL9jW6t4KlAHDxcfmtUGEwWzL9PRDDCzZ7y2RRG+p1BwjBSc/OoYGS2IwpILHRUzd+VJjyacR5qbPpHkGRBzrbK/+HUPRAlXiw1yrTpEXSnakSkIwwA3ePwZUj9k2tb6K//KzvUQ53kpSyvaRJCk1uuEpktKg6z6LLk3CaEpzoEAJEFb4pimn0WvHbI7DcYtz1PWvMl6oUGRCxQ3kRfr3pRXeyS90WSucMTIBhWxE9b1/eSL/C0q4xjU1kOcNV6eme7zPTJgWy6owUG+EXyMHqLP0dPe/PC6nS6TpxBF5SwUZLOQvw+RhUTesN4TwxSAb35v7ZUshFc4J9bAEQm1EH4erRVubrshZOhqRGsVKo/sDJqEn/gECGoM2RPXlcPSEIL/yTL6ewCjbY+2EHbhHro7PVVNzYIWxkPhup/TjhNyzZ1glfJBzL/bQDfN8/SFFhIkCFV0AVBvnACPZr1fC2qe9sBorYq5UsC+2ZgweK8OkA6sNOjpYl3UaSdtU/NWieWbhv2jd5nfUU4lMSwS2DPS0XehsdKm6pQwVuOFgDr8AIhMdHgPnDmjH0GKLi9sq9UL56IZ3nYrOrV+JVvrD/zSjottUui/gcahcyrcx+mBu9Ney1xk9w7FIaCe95Bl3UFN/XdmCNmvc330+wFGCLUY9ZerVYUQBXruu4uqb3lrwO8gYe55LYt8FivgBN0B12nus8Q/AI0bnZF7lJ9pQ1lB5S3NmWnWvf1Y4gVElop1EKb6DaIBAFGJZ+C2GvpqDwt0uG5yezRPzBTsMGuDBmc5px/zWUSEuMxYX+lm4oU5FHa3igraatL1wg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5150.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(54906003)(2906002)(86362001)(66446008)(66556008)(66476007)(64756008)(316002)(83380400001)(478600001)(6506007)(91956017)(26005)(110136005)(186003)(4326008)(36756003)(966005)(8936002)(5660300002)(8676002)(6486002)(7416002)(122000001)(6512007)(71200400001)(66946007)(2616005)(76116006)(38100700002)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW9EU1c1aDFXOWZMbmpLbmJDbW1neVZnVXJmY213VUxTODBKWjg0WFhHRkNa?=
 =?utf-8?B?ZW84WlJVVWFWTVpCQVJRa2lJbmhIV1NiUFhiWUUwaTB4d2pURE5QVzNUZUdl?=
 =?utf-8?B?YURNb0ZoeGI1clJuQnJTejB6SEc4R1UyT05tMjdxWWk5ZW02VG5zUjhEc3Jm?=
 =?utf-8?B?ZnY5V2lZaVZ5cUxmR1dpZFpqRXhlWVZQYitFazU0dTV0UEJkTDJ3d2c3dVNp?=
 =?utf-8?B?YkF2RUdlMmpMTE9WMkR3YTNaZk5CbE1RdGl5M3ZUa0NPL2MwekV5czBmN3JH?=
 =?utf-8?B?b2pXckR5azVxSmkxbmZDM0ttR1NoMkVMRExtM0pwRlRTN2VWcXU3czFYK0tI?=
 =?utf-8?B?UHhZMUkxZURvcXd6T0lsMjUxNlJhdy81dUdrZk01Q1Y2MlhNRXdIUlozdzM0?=
 =?utf-8?B?N2o0TzFZWGpueVlhWTdEWkZhakpPMjBoYjIzUTJORlhpQ0VCeWNCZWcxd3lE?=
 =?utf-8?B?bk1OQXhvSGo2bVk2R00vZU1PZE9UcXcxMVBKWWRqTTYrV1F1ZS95TURpMGo0?=
 =?utf-8?B?ZGZaeWRvRlVsVkd0c054RVdtcHczdmFjQkd3S0JYNU5mdytQd0F0N3l3OVpk?=
 =?utf-8?B?V0hnYnZrUDFYT0F2U2NLd0FXVFR6SVJuS1BWYW8ybFhHMWxhQnVCWUt2d3pq?=
 =?utf-8?B?UUhvRW9IeFhrMlc0R2J3Q0w3ak9aVXl1L1plS2JxT3hnSkpITC9oS2ZXSUZu?=
 =?utf-8?B?UCt5QTd6TWJ3Y0VXbkc1QnFnZ3BmK1RpSmVQbkZrTzJjZFU4eWt3cUN0TEhy?=
 =?utf-8?B?aytWWGN4cytMdFFTUkYveS9QK1JZL3FqREphU1NuTHh1Nk1vSERXYlZOY2oy?=
 =?utf-8?B?VHZ6SGpQeDlUUVJ1dDB2ZllQdHB6K0JlNnRaSVRyNlczOUVaU2Y0T2phWm1x?=
 =?utf-8?B?QmJDckhaT09heENSU1JIVmhjMGU0aU5BQ0hVNVpBM29HS3lYY201UlRxYnVu?=
 =?utf-8?B?VXVyejhFZ2hHRUIyUDREVER3bWliUDhzeUlaQ0FBY2Jsd2VnSHZnUlhzNFBR?=
 =?utf-8?B?ZDBJSHpXc0JLSjBTRXVvR1hWM0RLSTB3MjFFYUx1ZGdaaFFFZ0txcERMTmhR?=
 =?utf-8?B?OGFMUlNyVU9xZVg5K1NBbVFhT0w4ZXRJUi9oOHVhK28wY0t5R0tkc1pPRFU3?=
 =?utf-8?B?VklYdHFLWjdrTjk4R3NFV0YxQ0hWdFByc2JPZEN5ajI4OVdxd1ZiZDNMRDJl?=
 =?utf-8?B?a3FoQUFIUnJNTG81YmYzOUh2enBuQklveUlQR3NHZ0l6aTNrK2NhbzYvQkF6?=
 =?utf-8?B?d0R1VW9VZFJ2d3dGdzdsV1J3SEcyc1VrRlE1dG9WcTZydFIvbXJFWm4rQ0VU?=
 =?utf-8?B?VllwRE83aHpWVG53a1djU2ZvQ2xYeXlWQnNGWk5tUE9rY29qbytmU0FNQkR0?=
 =?utf-8?B?M1BqL0hpamVkdFZPL0dCTDhDVXM3eEphS3JXbEMrb3ZGOW5vTk5oeitMWTJu?=
 =?utf-8?B?V01DR0prNm9GeXdBbHFLcFNKSW5Mci90WXVzRkJDWFdwT25tbEdvajFReDEr?=
 =?utf-8?B?K0pPRHM5cXA0dVFPU2M5N20zNmRpVDdDQ1pENm84TWM0ZHJnaU5HSXV5eE5S?=
 =?utf-8?B?ZURicEFiSkl0Zjd5YlovdmJUQWdCSU10aTdSaTVWM0s5aHU2dHVCUVoyclV5?=
 =?utf-8?B?b1RCM011Nit2Q1RmbmxwejNYdjhKWXZvL01DV1dIUUhaTXlUbTVncDdZTzMv?=
 =?utf-8?B?NUd5ZDBpNUpPZVBzQy9kb0l3a1hqMkoxK0tKSnVsS0kzZWd1djJTeDBMMWdU?=
 =?utf-8?Q?e6BW+q1y1PoaOSDuHimaNGl3wWAou/O9MIpHR1k?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B0BE1C886FDD343926DE24D9E7D1EAB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5150.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb12179-c542-4cb0-b575-08d946e79f9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 16:51:27.6670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZyJTjAct9epbbhp8/gKTtuEt1L8xBQ8m1jM18DEaZjDRn5UJGVwe3pnaFAN0Lmk8vhWFuXoNROo0SoI1wa6hme5tom1OG/pJVVZdmS6YYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3798
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 15 Jul 2021 09:48:31 +1000
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIxLTA3LTEzIGF0IDAwOjA0ICswMjAwLCBJd29uYSBXaW5pYXJza2Egd3JvdGU6
DQo+IE5vdGU6IEFsbCBjaGFuZ2VzIHRvIGFyY2gveDg2IGFyZSBjb250YWluZWQgd2l0aGluIHBh
dGNoZXMgMDEtMDIuDQoNCkhpIEl3b25hLA0KDQpPbmUgbWV0YSBxdWVzdGlvbiBmaXJzdCwgd2hv
IGlzIHRoaXMgc3VibWlzc2lvbiAiVG86Ij8gSXMgdGhlcmUgYW4NCmV4aXN0aW5nIHVwc3RyZWFt
IG1haW50YWluZXIgcGF0aCBmb3IgT3BlbkJNQyBjaGFuZ2VzPyBBcmUgeW91DQpleHBlY3Rpbmcg
Y29udHJpYnV0aW9ucyB0byB0aGlzIHN1YnN5c3RlbSBmcm9tIG90aGVycz8gV2hpbGUgR3JlZw0K
c29tZXRpbWVzIGVuZHMgdXAgYXMgZGVmYXVsdCBtYWludGFpbmVyIGZvciBuZXcgc3R1ZmYsIEkg
d29uZGVyIGlmDQpzb21lb25lIGZyb20gdGhlIE9wZW5CTUMgY29tbW51aXR5IHNob3VsZCBzdGVw
IHVwIHRvIGZpbGwgdGhpcyByb2xlPw0KDQo+IA0KPiBUaGUgUGxhdGZvcm0gRW52aXJvbm1lbnQg
Q29udHJvbCBJbnRlcmZhY2UgKFBFQ0kpIGlzIGEgY29tbXVuaWNhdGlvbg0KPiBpbnRlcmZhY2Ug
YmV0d2VlbiBJbnRlbCBwcm9jZXNzb3JzIGFuZCBtYW5hZ2VtZW50IGNvbnRyb2xsZXJzIChlLmcu
DQo+IEJhc2Vib2FyZCBNYW5hZ2VtZW50IENvbnRyb2xsZXIsIEJNQykuDQo+IA0KPiBUaGlzIHNl
cmllcyBhZGRzIGEgUEVDSSBzdWJzeXN0ZW0gYW5kIGludHJvZHVjZXMgZHJpdmVycyB3aGljaCBy
dW4gaW4NCj4gdGhlIExpbnV4IGluc3RhbmNlIG9uIHRoZSBtYW5hZ2VtZW50IGNvbnRyb2xsZXIg
KG5vdCB0aGUgbWFpbiBJbnRlbA0KPiBwcm9jZXNzb3IpIGFuZCBpcyBpbnRlbmRlZCB0byBiZSB1
c2VkIGJ5IHRoZSBPcGVuQk1DIFsxXSwgYSBMaW51eA0KPiBkaXN0cmlidXRpb24gZm9yIEJNQyBk
ZXZpY2VzLg0KPiBUaGUgaW5mb3JtYXRpb24gZXhwb3NlZCBvdmVyIFBFQ0kgKGxpa2UgcHJvY2Vz
c29yIGFuZCBESU1NDQo+IHRlbXBlcmF0dXJlKSByZWZlcnMgdG8gdGhlIEludGVsIHByb2Nlc3Nv
ciBhbmQgY2FuIGJlIGNvbnN1bWVkIGJ5DQo+IGRhZW1vbnMgcnVubmluZyBvbiB0aGUgQk1DIHRv
LCBmb3IgZXhhbXBsZSwgZGlzcGxheSB0aGUgcHJvY2Vzc29yDQo+IHRlbXBlcmF0dXJlIGluIGl0
cyB3ZWIgaW50ZXJmYWNlLg0KPiANCj4gVGhlIFBFQ0kgYnVzIGlzIGNvbGxlY3Rpb24gb2YgY29k
ZSB0aGF0IHByb3ZpZGVzIGludGVyZmFjZSBzdXBwb3J0DQo+IGJldHdlZW4gUEVDSSBkZXZpY2Vz
ICh0aGF0IGFjdHVhbGx5IHJlcHJlc2VudCBwcm9jZXNzb3JzKSBhbmQgUEVDSQ0KPiBjb250cm9s
bGVycyAoc3VjaCBhcyB0aGUgInBlY2ktYXNwZWVkIiBjb250cm9sbGVyKSB0aGF0IGFsbG93IHRv
DQo+IGFjY2VzcyBwaHlzaWNhbCBQRUNJIGludGVyZmFjZS4gUEVDSSBkZXZpY2VzIGFyZSBib3Vu
ZCB0byBQRUNJDQo+IGRyaXZlcnMgdGhhdCBwcm92aWRlcyBhY2Nlc3MgdG8gUEVDSSBzZXJ2aWNl
cy4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcw0KPiBhIGdlbmVyaWMgInBlY2ktY3B1IiBkcml2ZXIg
dGhhdCBleHBvc2VzIGhhcmR3YXJlIG1vbml0b3JpbmcNCj4gImNwdXRlbXAiDQo+IGFuZCAiZGlt
bXRlbXAiIHVzaW5nIHRoZSBhdXhpbGlhcnkgYnVzLg0KPiANCj4gRXhwb3NpbmcgInJhdyIgUEVD
SSB0byB1c2Vyc3BhY2UsIGVpdGhlciB0byB3cml0ZSB1c2Vyc3BhY2UgZHJpdmVycw0KPiBvcg0K
PiBmb3IgZGVidWcvdGVzdGluZyBwdXJwb3NlIHdhcyBsZWZ0IG91dCBvZiB0aGlzIHNlcmllcyB0
byBlbmNvdXJhZ2UNCj4gd3JpdGluZyBrZXJuZWwgZHJpdmVycyBpbnN0ZWFkLCBidXQgbWF5IGJl
IHB1cnN1ZWQgaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IEludHJvZHVjaW5nIFBFQ0kgdG8gdXBzdHJl
YW0gTGludXggd2FzIGFscmVhZHkgYXR0ZW1wdGVkIGJlZm9yZSBbMl0uDQo+IFNpbmNlIGl0J3Mg
YmVlbiBvdmVyIGEgeWVhciBzaW5jZSBsYXN0IHJldmlzaW9uLCBhbmQgdGhlIHNlcmllcw0KPiBj
aGFuZ2VkIHF1aXRlIGEgYml0IGluIHRoZSBtZWFudGltZSwgSSd2ZSBkZWNpZGVkIHRvIHN0YXJ0
IGZyb20gdjEuDQo+IA0KPiBJIHdvdWxkIGFsc28gbGlrZSB0byBnaXZlIGNyZWRpdCB0byBldmVy
eW9uZSB3aG8gaGVscGVkIG1lIHdpdGgNCj4gZGlmZmVyZW50IGFzcGVjdHMgb2YgcHJlbGltaW5h
cnkgcmV2aWV3Og0KPiAtIFBpZXJyZS1Mb3VpcyBCb3NzYXJ0LA0KPiAtIFRvbnkgTHVjaywgDQo+
IC0gQW5keSBTaGV2Y2hlbmtvLA0KPiAtIERhdmUgSGFuc2VuLg0KPiANCj4gWzFdIGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMNCj4gWzJdIA0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9vcGVuYm1jLzIwMTkxMjExMTk0NjI0LjI4NzItMS1qYWUuaHl1bi55b29AbGludXguaW50
ZWwuY29tLw0KPiANCj4gSXdvbmEgV2luaWFyc2thICgxMik6DQo+IMKgIHg4Ni9jcHU6IE1vdmUg
aW50ZWwtZmFtaWx5IHRvIGFyY2gtaW5kZXBlbmRlbnQgaGVhZGVycw0KPiDCoCB4ODYvY3B1OiBF
eHRyYWN0IGNwdWlkIGhlbHBlcnMgdG8gYXJjaC1pbmRlcGVuZGVudA0KPiDCoCBkdC1iaW5kaW5n
czogQWRkIGdlbmVyaWMgYmluZGluZ3MgZm9yIFBFQ0kNCj4gwqAgZHQtYmluZGluZ3M6IEFkZCBi
aW5kaW5ncyBmb3IgcGVjaS1hc3BlZWQNCj4gwqAgQVJNOiBkdHM6IGFzcGVlZDogQWRkIFBFQ0kg
Y29udHJvbGxlciBub2Rlcw0KPiDCoCBwZWNpOiBBZGQgY29yZSBpbmZyYXN0cnVjdHVyZQ0KPiDC
oCBwZWNpOiBBZGQgZGV2aWNlIGRldGVjdGlvbg0KPiDCoCBwZWNpOiBBZGQgc3VwcG9ydCBmb3Ig
UEVDSSBkZXZpY2UgZHJpdmVycw0KPiDCoCBwZWNpOiBBZGQgcGVjaS1jcHUgZHJpdmVyDQo+IMKg
IGh3bW9uOiBwZWNpOiBBZGQgY3B1dGVtcCBkcml2ZXINCj4gwqAgaHdtb246IHBlY2k6IEFkZCBk
aW1tdGVtcCBkcml2ZXINCj4gwqAgZG9jczogQWRkIFBFQ0kgZG9jdW1lbnRhdGlvbg0KPiANCj4g
SmFlIEh5dW4gWW9vICgyKToNCj4gwqAgcGVjaTogQWRkIHBlY2ktYXNwZWVkIGNvbnRyb2xsZXIg
ZHJpdmVyDQo+IMKgIGRvY3M6IGh3bW9uOiBEb2N1bWVudCBQRUNJIGRyaXZlcnMNCj4gDQo+IMKg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvcGVjaS9wZWNpLWFzcGVlZC55YW1sIHwgMTExICsrKysN
Cj4gwqAuLi4vYmluZGluZ3MvcGVjaS9wZWNpLWNvbnRyb2xsZXIueWFtbMKgwqDCoMKgwqDCoMKg
IHzCoCAyOCArDQo+IMKgRG9jdW1lbnRhdGlvbi9od21vbi9pbmRleC5yc3TCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsNCj4gwqBEb2N1bWVudGF0aW9uL2h3bW9uL3Bl
Y2ktY3B1dGVtcC5yc3TCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkzICsrKysNCj4gwqBEb2N1bWVu
dGF0aW9uL2h3bW9uL3BlY2ktZGltbXRlbXAucnN0wqDCoMKgwqDCoMKgwqDCoCB8wqAgNTggKysN
Cj4gwqBEb2N1bWVudGF0aW9uL2luZGV4LnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKw0KPiDCoERvY3VtZW50YXRpb24vcGVjaS9pbmRleC5y
c3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNiArDQo+IMKgRG9jdW1l
bnRhdGlvbi9wZWNpL3BlY2kucnN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA0OCArKw0KPiDCoE1BSU5UQUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMyICsrDQo+IMKgYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMTQgKw0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDE0ICsNCj4gwqBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYu
ZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNCArDQo+IMKgYXJjaC94ODYvS2Nv
bmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgMSArDQo+IMKgYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1LmjCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzIC0NCj4gwqBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9pbnRlbC1mYW1pbHkuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTQxICstLS0tDQo+
IMKgYXJjaC94ODYvaW5jbHVkZS9hc20vbWljcm9jb2RlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAyICstDQo+IMKgYXJjaC94ODYva3ZtL2NwdWlkLmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstDQo+IMKgYXJjaC94
ODYvbGliL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0NCj4gwqBkcml2ZXJzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArDQo+IMKg
ZHJpdmVycy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+IMKgZHJpdmVycy9lZGFjL21jZV9hbWQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0K
PiDCoGRyaXZlcnMvaHdtb24vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICsNCj4gwqBkcml2ZXJzL2h3bW9uL01ha2VmaWxlwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsNCj4g
wqBkcml2ZXJzL2h3bW9uL3BlY2kvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAzMSArKw0KPiDCoGRyaXZlcnMvaHdtb24vcGVjaS9NYWtlZmlsZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA3ICsNCj4gwqBkcml2ZXJzL2h3
bW9uL3BlY2kvY29tbW9uLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDQ2ICsrDQo+IMKgZHJpdmVycy9od21vbi9wZWNpL2NwdXRlbXAuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCA1MDMNCj4gKysrKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJz
L2h3bW9uL3BlY2kvZGltbXRlbXAuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
NTA4DQo+ICsrKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvcGVjaS9LY29uZmlnwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDM2ICsrDQo+
IMKgZHJpdmVycy9wZWNpL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArDQo+IMKgZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvS2Nv
bmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyICsNCj4gwqBkcml2ZXJzL3Bl
Y2kvY29udHJvbGxlci9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMg
Kw0KPiDCoGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL3BlY2ktYXNwZWVkLmPCoMKgwqDCoMKgwqDC
oMKgIHwgNTAxDQo+ICsrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9wZWNpL2NvcmUuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMjQg
KysrKysrKysNCj4gwqBkcml2ZXJzL3BlY2kvY3B1LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzNDcgKysrKysrKysrKysrDQo+IMKgZHJp
dmVycy9wZWNpL2RldmljZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMjExICsrKysrKysrDQo+IMKgZHJpdmVycy9wZWNpL2ludGVybmFsLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEzNyArKysrKw0KPiDC
oGRyaXZlcnMvcGVjaS9yZXF1ZXN0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgNTAyDQo+ICsrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9wZWNp
L3N5c2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgODIgKysrDQo+IMKgaW5jbHVkZS9saW51eC9wZWNpLWNwdS5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzOCArKw0KPiDCoGluY2x1ZGUvbGludXgv
cGVjaS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDkzICsrKysNCj4gwqBpbmNsdWRlL2xpbnV4L3g4Ni9jcHUuaMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKw0KPiDCoGluY2x1ZGUvbGludXgv
eDg2L2ludGVsLWZhbWlseS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNDYgKysrKysN
Cj4gwqBsaWIvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDUgKw0KPiDCoGxpYi9NYWtlZmlsZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoCAyICsNCj4gwqBsaWIveDg2L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICsNCj4gwqB7
YXJjaC94ODYvbGliID0+IGxpYi94ODZ9L2NwdS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCAyICstDQo+IMKgNDcgZmlsZXMgY2hhbmdlZCwgMzkwMiBpbnNlcnRpb25zKCspLCAx
NDkgZGVsZXRpb25zKC0pDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9wZWNpL3BlY2ktDQo+IGFzcGVlZC55YW1sDQo+IMKgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL3BlY2ktDQo+
IGNvbnRyb2xsZXIueWFtbA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2h3
bW9uL3BlY2ktY3B1dGVtcC5yc3QNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9od21vbi9wZWNpLWRpbW10ZW1wLnJzdA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL3BlY2kvaW5kZXgucnN0DQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vcGVjaS9wZWNpLnJzdA0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL3Bl
Y2kvS2NvbmZpZw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3bW9uL3BlY2kvTWFr
ZWZpbGUNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od21vbi9wZWNpL2NvbW1vbi5o
DQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcGVjaS9jcHV0ZW1wLmMNCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9od21vbi9wZWNpL2RpbW10ZW1wLmMNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wZWNpL0tjb25maWcNCj4gwqBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9wZWNpL01ha2VmaWxlDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvcGVjaS9jb250cm9sbGVyL0tjb25maWcNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9wZWNpL2NvbnRyb2xsZXIvTWFrZWZpbGUNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1hc3BlZWQuYw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3BlY2kvY29yZS5jDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGVjaS9j
cHUuYw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BlY2kvZGV2aWNlLmMNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wZWNpL2ludGVybmFsLmgNCj4gwqBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9wZWNpL3JlcXVlc3QuYw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3BlY2kvc3lzZnMuYw0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4
L3BlY2ktY3B1LmgNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9wZWNpLmgN
Cj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC94ODYvY3B1LmgNCj4gwqBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC94ODYvaW50ZWwtZmFtaWx5LmgNCj4gwqBjcmVh
dGUgbW9kZSAxMDA2NDQgbGliL3g4Ni9NYWtlZmlsZQ0KPiDCoHJlbmFtZSB7YXJjaC94ODYvbGli
ID0+IGxpYi94ODZ9L2NwdS5jICg5NSUpDQo+IA0KDQo=
