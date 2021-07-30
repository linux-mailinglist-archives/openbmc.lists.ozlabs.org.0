Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEE13DBF67
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 22:12:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gbz811C1Kz3cSY
	for <lists+openbmc@lfdr.de>; Sat, 31 Jul 2021 06:12:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=tQpO1caJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=tQpO1caJ; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gbz7Y3b3Mz30JK;
 Sat, 31 Jul 2021 06:11:31 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="274233192"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="274233192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 13:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="582285647"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2021 13:10:25 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 13:10:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 13:10:24 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 13:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQMOhFbpfL3BwKf8HtQDxtDv5HA3f9uZ57AlZQHOxMasEqJu535Wd7iDiSY8X0sPQX3Dx9+N+2U0ysZ5T3t77korNPGx55a2jwJb396xq9npOOWj7D3woAsQsI3+whyBv5RGG3q/Q2IkJo7G1behCxi4zXRpLWD/fm5etsKJmYLkTw/uniKFU9/jEgLwQS5ajlWPxptB06T3lGC65L+E3bUTIv9CXW++FfhWbAAjGKZUDcalxWVbNte6xXN/nC8upj3EpnNBmOrb7YZ90kLoNjdMU6D0rKVIer+XkP5b/d3Pi6JrmAzxBalCfpVppvXDyn8Nbm1UI7OmIpJ9m3UdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD+3BDN1H6uVtqmGt6s02xUP1jPNczuuAS1KA6CWBUY=;
 b=Zb4zHwj0cn02G28vw0U7teJ3q9ei6mskPAfseVdlpLw9k63Jfx1nZp5YuJtjtmla3OkYFZ4tLiqBgbzyy6suJwWVO1jLWpydoXeDCDnyFQuRaN/XLOqtQmCRPTLFIpVRcywMDu0ElElI1nEcXYstO627EvBqXhVyWZoQ4Su3EZ/eggEeoqnhlf048SOsPRenX9SCYZqfxpkdyBMlhR1m1DS0vjdAW4q/r8BPSWAF1oohiY+Hg8oyM1f4oLwTEIzHP4FLz/CxiVWKY5cxY6/rwPfRziXjxUBmCjlp234timi8O6gRrd2+3A07uorrgf3U1cvjv0wmGknZtKR3hVCosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD+3BDN1H6uVtqmGt6s02xUP1jPNczuuAS1KA6CWBUY=;
 b=tQpO1caJP33RgvHjsxdSGkzVjjt9Pxw+aXGeGtjf4hIxwSeo+LxMYL2/uaD5jJ31vLEdRUi1R4p9LhEn4pL0BoLmitESJbNjbev0dh22cbFSmr9Kr6FQetjmsINSesRheskj2hgOfgpkJbLntlzl9/b5bNw+sSsvTu32dH1EuX4=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA0PR11MB4653.namprd11.prod.outlook.com (2603:10b6:806:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Fri, 30 Jul
 2021 20:10:22 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4373.021; Fri, 30 Jul 2021
 20:10:22 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "zweiss@equinix.com" <zweiss@equinix.com>
Subject: Re: [PATCH 08/14] peci: Add device detection
Thread-Topic: [PATCH 08/14] peci: Add device detection
Thread-Index: AQHXd2qtFXm2JAdbHEufB6KAlx+zw6tXMIiAgAM3LgCAACAcgIABhzGA
Date: Fri, 30 Jul 2021 20:10:22 +0000
Message-ID: <e09a84385be48304d01584c6d629c0f56caad8a1.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-9-iwona.winiarska@intel.com>
 <20210727174900.GR8018@packtop>
 <47440a8329ce06c41ca9746db42cb1d66154ea46.camel@intel.com>
 <20210729205013.GW8018@packtop>
In-Reply-To: <20210729205013.GW8018@packtop>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: equinix.com; dkim=none (message not signed)
 header.d=none;equinix.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00cb11cb-84c6-4518-73ba-08d953960fc3
x-ms-traffictypediagnostic: SA0PR11MB4653:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4653D1ED959252A8979D406BECEC9@SA0PR11MB4653.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0GabfW5pfsrYUQDwU7e2tLuR2/nmeYnGooi0BH99crgI7jPB1F2wf9HxI4ZHBEwpwfdLY3d+xChzEx/qlT7LnXnz8trztg6hZ3oY1Fu/ph9xcATNya4UVjtkHsZVOZ2+qw/HtErFbbKV9gxsbo5Yzr1t9+M+q2EujUw922w/No87InF60hApysqjbgbSINRelQOucdrTIziJkNZMeVObHEQtp0L/mxr8BKWP/izP606yZJ4VmWsKbIw+Abz9wJE9gTvvlIGuKxoY1fU/oObgba3l+rLLdRrN782bEPemeoOvO7AaxKjuPN9hJpW2E3NP8GCd7OB3v+kT4kksB5jntovNkYHA2M392mHr6qAMHIDmclLOQ2XZiK/HNbEafbQ5jihvura/3prF2WGzlXR5sSUXjHFSHMZ5PlG6ldKdyTfmIPcaaKkugwlDEuN1H3WCNYHHzOPAuuAOn0S2P9flsuo9XnPCZdWptQGZzxeCw3O81aqjptAQ0XHaJ7+AhM7YwT0brLsRQBWLDSsJ++VH6Qtfz/GJ6xCMGvplomDx8Hm8TOI9jsfRhTvbBK+pRuAGE7Ss22BLkcxMbG6qNHkJC+A5w3kHrvzcHi1qSzduMmzAgHARiPKB91+bLFB53LgckgWDYuEVotbOUqETfC0T6D4/fOh3ZuZa210tV80io8pyqdRT89eigU+TRxqKNzAPgaM3Vf+f+dHDf9jPLDd3gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(38100700002)(66946007)(36756003)(186003)(66446008)(66556008)(76116006)(66476007)(64756008)(122000001)(26005)(6506007)(83380400001)(54906003)(91956017)(5660300002)(316002)(4326008)(8936002)(6916009)(2616005)(8676002)(38070700005)(6512007)(478600001)(7416002)(2906002)(71200400001)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGhwbm9CTXliTGdDMzFTeGNrS28vZVRuZzJvbUZLVXJsMnI3OHN4aGowclha?=
 =?utf-8?B?ZWRKbnk5NXRRQjRqOWJKbElkODNZMG1pSURsZjdOZHNaZGx0Yng5V2VabFBn?=
 =?utf-8?B?UG1xWGg2aE5NbHc4OFJWc2NOMGFMRHo4dzk4V083ODcrS3NIMTB6b1dqS2pP?=
 =?utf-8?B?ZlIwODZpbWdsQmV5d0RuMGk2MDdwM3htNm8yWHFXaVI4Mm4zNlA0d3I5VWtV?=
 =?utf-8?B?T0pkZzIwT3BPNWpENEU2UmVESy9hUC8yUDlFSHNEajhNb0JuRW5MRjRiWkFQ?=
 =?utf-8?B?bTAvK1NjMU9MNnFTbXU4SzlFT3R2Ukt5dWVPR1FQV0V1V0I3UGlROUN3QWZt?=
 =?utf-8?B?Y1I1TUlwbXFzMENuOERFZ3RrRjQ5TWVJNXpYUEY1Nmtvc3JrTnFsSks0OUFY?=
 =?utf-8?B?cXltbmZUQ1NZeVF5OTFDekxLSXJQbnlTd1pyMWJ2YitVQWYyeUk0TlBIbTA3?=
 =?utf-8?B?VDlVSnRHV3dpOEtSUWRVd3lTTHNPbjZVaDRkNzJYQ2dtVWw2Z1lkenJUZUln?=
 =?utf-8?B?aTJlYW0wR0pLd0VrQTVTczBXT3NzQm5FZFh0VWFTaHJuTDk3alRNS3pxcm8x?=
 =?utf-8?B?L2tFelBCVVcrZWtwMjBGV1hzclArREVlYnhwdWxXeUYxYnNTRkhpek9WVzlK?=
 =?utf-8?B?eHRxTzNvcU5xczFhRHczMGJoMDhwVFo1d0tMNkQvMzZKb0ZkNTRYVkczbTho?=
 =?utf-8?B?SFQ4N3M1N0k5bnZxbGpkVkgrUzBTRUx1QzVnMC9zZEt4bmJBdHc3Q29KTm9R?=
 =?utf-8?B?QXlEcERwZ1B0QVNmTFhVOWNPNThRWDdoR3N1bkkrSDdCelp4WklOdGcwc2xn?=
 =?utf-8?B?QWZXVkVoMGtzMUxYT3UzU3hja2R1cS8rczRvMFhhL3Z0NXYvVXg5K00zaXYw?=
 =?utf-8?B?dEh1dUtMVk4wUzRqRXVrODFZQlVvRDk5L0crV1VuejJzL2hKdDJyQTFOTzhB?=
 =?utf-8?B?VlB6R1FLSFJmaXUrWWVmQ0xOd0ZTUGFCRDdURnZ2a0xjaVY5cFgvWGFhczRm?=
 =?utf-8?B?cUxHZDBnL2NNbmNTOHMrdTBQRnlrUjJQcGFJaStNMUYwM1JDcEtrVTI5aHJT?=
 =?utf-8?B?Rnd6ZFh3d014V05SNEtUeDNLRXZrWGxVdG1venlld3V4dERiejhIaU5Wamho?=
 =?utf-8?B?MFpVRjNjaTU5ajBKajBXSVFoNjVNTGpOSm9QSFJkeEhvSVBSNUtNS3pOdzZY?=
 =?utf-8?B?NXRJTFlOT2U5bjgyTHZGeE5JcEV6Q091UnU5VWFZa0htZm45Q29vNWFqSGRv?=
 =?utf-8?B?S291d0FMWjRVK1B4TE5CS1hkZUQrWW9HSWorcjBZdnNyUmh1NDFHbHM4OVN1?=
 =?utf-8?B?NmpKS05vSFI1OHpSU0hyZEdHVm1kemxlY3MrcWRiQlkrYWJ6SnJycmhKRTlu?=
 =?utf-8?B?WEJFajNMMGFIR0QrMmJtck0yOXdhejhUMEpLKzllYmdrdkY0UzZGZy9QQWpG?=
 =?utf-8?B?SXFmTkdIZ09ERmVQa3ZqMVdocjMzU3Vsc1B3c2lBQkFmTktWWnVsTGtsTnZs?=
 =?utf-8?B?Rm9nNjBlVjNKTUtINGd2NS9TTDlkQ1E0Ykk5NUJULzArblV2TlVabkRQaWlk?=
 =?utf-8?B?Q1VhU21PSGk4alhBalVwRnNITVhKRVJGenFKUzV3VWdLR3RycU1WT0FTeXZB?=
 =?utf-8?B?S0U5S0dEWHRaZXBNYzdSbGFqdkRZRWFVN1ZsbDlyUDNlSkFJbmc2K3ZnaUtO?=
 =?utf-8?B?Z3p4RHgrUGNMakJIdVUxR3JXeEF0emZDbFJ3RmR0UHZCV3pSSUVVN0ZLbjli?=
 =?utf-8?B?cmZlU2gzYmcrM2Nyck9SRHc2M1BxWUlGYXhrZVdDQnhNbjhPMWViQU5ROUV3?=
 =?utf-8?B?OXhXSlJ0eG50ZFpudDJIdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9D84A181CE53A49A9765C733E7BC6DC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cb11cb-84c6-4518-73ba-08d953960fc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 20:10:22.3033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5dv8aPcaeSm0LklzEiwNTGCD7gxSRsDy74V7wGmBaMRjxK1jNyqgvHHfittP/BZwx4cJHeURjGQDhvFCCS1atzqzqDd6dTz/2QhjWHrkEFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4653
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "Luck, 
 Tony" <tony.luck@intel.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTA3LTI5IGF0IDIwOjUwICswMDAwLCBaZXYgV2Vpc3Mgd3JvdGU6DQo+IE9u
IFRodSwgSnVsIDI5LCAyMDIxIGF0IDAxOjU1OjE5UE0gQ0RULCBXaW5pYXJza2EsIEl3b25hIHdy
b3RlOg0KPiA+IE9uIFR1ZSwgMjAyMS0wNy0yNyBhdCAxNzo0OSArMDAwMCwgWmV2IFdlaXNzIHdy
b3RlOg0KPiA+ID4gT24gTW9uLCBKdWwgMTIsIDIwMjEgYXQgMDU6MDQ6NDFQTSBDRFQsIEl3b25h
IFdpbmlhcnNrYSB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBp
bnQgcGVjaV9kZXRlY3Qoc3RydWN0IHBlY2lfY29udHJvbGxlciAqY29udHJvbGxlciwgdTggYWRk
cikNCj4gPiA+ID4gK3sNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHBlY2lfcmVxdWVz
dCAqcmVxOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpbnQgcmV0Ow0KPiA+ID4gPiArDQo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoHJlcSA9IHBlY2lfcmVxdWVzdF9hbGxvYyhOVUxMLCAwLCAwKTsN
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFyZXEpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsNCj4gPiA+ID4gKw0KPiA+ID4gDQo+ID4g
PiBNaWdodCBiZSB3b3J0aCBhIGJyaWVmIGNvbW1lbnQgaGVyZSBub3RpbmcgdGhhdCBhbiBlbXB0
eSByZXF1ZXN0IGhhcHBlbnMNCj4gPiA+IHRvIGJlIHRoZSBmb3JtYXQgb2YgYSBQRUNJIHBpbmcg
Y29tbWFuZCAoYW5kL29yIGNoYW5nZSB0aGUgbmFtZSBvZiB0aGUNCj4gPiA+IGZ1bmN0aW9uIHRv
IHBlY2lfcGluZygpKS4NCj4gPiANCj4gPiBJJ2xsIGFkZCBhIGNvbW1lbnQ6DQo+ID4gIldlIGFy
ZSB1c2luZyBQRUNJIFBpbmcgY29tbWFuZCB0byBkZXRlY3QgcHJlc2VuY2Ugb2YgUEVDSSBkZXZp
Y2VzLiINCj4gPiANCj4gDQo+IFdlbGwsIHdoYXQgSSB3YXMgbW9yZSBhaW1pbmcgdG8gZ2V0IGF0
IHdhcyB0aGF0IHRvIHNvbWVvbmUgbm90DQo+IGludGltYXRlbHkgZmFtaWxpYXIgd2l0aCB0aGUg
UEVDSSBwcm90b2NvbCBpdCdzIG5vdCBpbW1lZGlhdGVseSBvYnZpb3VzDQo+IGZyb20gdGhlIGNv
ZGUgdGhhdCBpdCBpbiBmYWN0IGltcGxlbWVudHMgYSBwaW5nICh0aGVyZSdzIG5vICdtc2ctPmNt
ZCA9DQo+IFBFQ0lfQ01EX1BJTkcnIG9yIGFueXRoaW5nKSwgc28gSSB3YXMgaG9waW5nIGZvciBz
b21ldGhpbmcgdGhhdCB3b3VsZA0KPiBqdXN0IG1ha2UgdGhhdCBzbGlnaHRseSBtb3JlIGV4cGxp
Y2l0Lg0KDQovKg0KICogUEVDSSBQaW5nIGlzIGEgY29tbWFuZCBlbmNvZGVkIGJ5IHR4X2xlbiA9
IDAsIHJ4X2xlbiA9IDAuDQogKiBXZSBleHBlY3QgY29ycmVjdCBXcml0ZSBGQ1MgaWYgdGhlIGRl
dmljZSBhdCB0aGUgdGFyZ2V0IGFkZHJlc3MgaXMNCiAqIGFibGUgdG8gcmVzcG9uZC4NCiAqLw0K
DQpJIHdvdWxkIGxpa2UgdG8gYXZvaWQgZG9pbmcgYSBwZWNpX3Bpbmcgd3JhcHBlciB0aGF0IGRv
ZXNuJ3Qgb3BlcmF0ZSBvbg0KcGVjaV9kZXZpY2UgLSBub3RlIHRoYXQgYXQgdGhpcyBwb2ludCB3
ZSBkb24ndCBoYXZlIGEgc3RydWN0IHBlY2lfZGV2aWNlIHlldCwNCndlJ3JlIHVzaW5nIHBpbmcg
dG8gZmlndXJlIG91dCB3aGV0aGVyIHdlIHNob3VsZCBjcmVhdGUgb25lLg0KDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKy8qKg0KPiA+ID4gPiArICogcGVjaV9yZXF1ZXN0X2FsbG9jKCkgLSBhbGxvY2F0
ZSAmc3RydWN0IHBlY2lfcmVxdWVzdCB3aXRoIGJ1ZmZlcnMNCj4gPiA+ID4gd2l0aA0KPiA+ID4g
PiBnaXZlbiBsZW5ndGhzDQo+ID4gPiA+ICsgKiBAZGV2aWNlOiBQRUNJIGRldmljZSB0byB3aGlj
aCByZXF1ZXN0IGlzIGdvaW5nIHRvIGJlIHNlbnQNCj4gPiA+ID4gKyAqIEB0eF9sZW46IHJlcXVl
c3RlZCBUWCBidWZmZXIgbGVuZ3RoDQo+ID4gPiA+ICsgKiBAcnhfbGVuOiByZXF1ZXN0ZWQgUlgg
YnVmZmVyIGxlbmd0aA0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIFJldHVybjogQSBwb2ludGVy
IHRvIGEgbmV3bHkgYWxsb2NhdGVkICZzdHJ1Y3QgcGVjaV9yZXF1ZXN0IG9uDQo+ID4gPiA+IHN1
Y2Nlc3MNCj4gPiA+ID4gb3IgTlVMTCBvdGhlcndpc2UuDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4g
K3N0cnVjdCBwZWNpX3JlcXVlc3QgKnBlY2lfcmVxdWVzdF9hbGxvYyhzdHJ1Y3QgcGVjaV9kZXZp
Y2UgKmRldmljZSwgdTgNCj4gPiA+ID4gdHhfbGVuLCB1OCByeF9sZW4pDQo+ID4gPiA+ICt7DQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBwZWNpX3JlcXVlc3QgKnJlcTsNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgdTggKnR4X2J1ZiwgKnJ4X2J1ZjsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqByZXEgPSBremFsbG9jKHNpemVvZigqcmVxKSwgR0ZQX0tFUk5FTCk7DQo+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghcmVxKQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIE5VTEw7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgcmVxLT5kZXZpY2UgPSBkZXZpY2U7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgLyoNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgICogUEVDSSBjb250cm9sbGVycyB0aGF0
IHdlIGFyZSB1c2luZyBub3cgZG9uJ3Qgc3VwcG9ydCBETUEsDQo+ID4gPiA+IHRoaXMNCj4gPiA+
ID4gK8KgwqDCoMKgwqDCoMKgICogc2hvdWxkIGJlIGNvbnZlcnRlZCB0byBETUEgQVBJIG9uY2Ug
c3VwcG9ydCBmb3IgY29udHJvbGxlcnMNCj4gPiA+ID4gdGhhdA0KPiA+ID4gPiBkbw0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqAgKiBhbGxvdyBpdCBpcyBhZGRlZCB0byBhdm9pZCBhbiBleHRyYSBj
b3B5Lg0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
aWYgKHR4X2xlbikgew0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdHhf
YnVmID0ga3phbGxvYyh0eF9sZW4sIEdGUF9LRVJORUwpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF0eF9idWYpDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfZnJlZV9yZXE7DQo+ID4gPiA+
ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlcS0+dHguYnVmID0g
dHhfYnVmOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVxLT50eC5s
ZW4gPSB0eF9sZW47DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiA+ID4gKw0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqBpZiAocnhfbGVuKSB7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByeF9idWYgPSBremFsbG9jKHJ4X2xlbiwgR0ZQX0tFUk5FTCk7DQo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXJ4X2J1ZikNCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBnb3RvIGVycl9m
cmVlX3R4Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXEtPnJ4LmJ1ZiA9IHJ4X2J1ZjsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJlcS0+cngubGVuID0gcnhfbGVuOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqB9DQo+
ID4gPiA+ICsNCj4gPiA+IA0KPiA+ID4gQXMgbG9uZyBhcyB3ZSdyZSBwdW50aW5nIG9uIERNQSBz
dXBwb3J0LCBjb3VsZCB3ZSBkbyB0aGUgd2hvbGUgdGhpbmcgaW4NCj4gPiA+IGEgc2luZ2xlIGFs
bG9jYXRpb24gaW5zdGVhZCBvZiB0aHJlZT/CoCBJdCdkIGFkZCBzb21lIHBvaW50ZXIgYXJpdGht
ZXRpYywNCj4gPiA+IGJ1dCB3b3VsZCBhbHNvIHNpbXBsaWZ5IHRoZSBlcnJvci1oYW5kbGluZy9k
ZWFsbG9jYXRpb24gcGF0aHMgYSBiaXQuDQo+ID4gPiANCj4gPiA+IE9yLCBnaXZlbiB0aGF0IHRo
ZSBvbmUgY29udHJvbGxlciB3ZSdyZSBjdXJyZW50bHkgc3VwcG9ydGluZyBoYXMgYQ0KPiA+ID4g
aGFyZHdhcmUgbGltaXQgb2YgMzIgYnl0ZXMgcGVyIHRyYW5zZmVyIGFueXdheSwgbWF5YmUganVz
dCBpbmxpbmUNCj4gPiA+IGZpeGVkLXNpemUgcngvdHggYnVmZmVycyBpbnRvIHN0cnVjdCBwZWNp
X3JlcXVlc3QgYW5kIGhhdmUgY2FsbGVycyBrZWVwDQo+ID4gPiB0aGVtIG9uIHRoZSBzdGFjayBp
bnN0ZWFkIG9mIGttYWxsb2MoKS1pbmcgdGhlbT8NCj4gPiANCj4gPiBJIGRpc2FncmVlIG9uIGVy
cm9yIGhhbmRsaW5nIChpdCdzIG5vdCBjb21wbGljYXRlZCkgLSBob3dldmVyLCBvbmUgYXJndW1l
bnQNCj4gPiBmb3INCj4gPiBkb2luZyBhIHNpbmdsZSBhbGxvYyAob3IgbW92aW5nIHRoZSBidWZm
ZXJzIGFzIGZpeGVkLXNpemUgYXJyYXlzIGluc2lkZQ0KPiA+IHN0cnVjdA0KPiA+IHBlY2lfcmVx
dWVzdCkgaXMgdGhhdCBzaW5nbGUga3phbGxvYyBpcyBnb2luZyB0byBiZSBmYXN0ZXIgdGhhbiAz
LiBCdXQgSQ0KPiA+IGRvbid0DQo+ID4gZXhwZWN0IGl0IHRvIHNob3cgdXAgb24gYW55IHBlcmYg
cHJvZmlsZXMgZm9yIG5vdyAoc2luY2UgcGVjaS13aXJlIGludGVyZmFjZQ0KPiA+IGlzDQo+ID4g
bm90IGEgc3BlZWQgZGVtb24pLg0KPiA+IA0KPiA+IEkgd2FudGVkIHRvIGF2b2lkIGRlZmluaW5n
IG1heCBzaXplIGZvciBUWCBhbmQgUlggaW4gcGVjaS1jb3JlLg0KPiA+IERvIHlvdSBoYXZlIGEg
c3Ryb25nIG9waW5pb24gYWdhaW5zdCBtdWx0aXBsZSBhbGxvYz8gSWYgeWVzLCBJIGNhbiBnbyB3
aXRoDQo+ID4gZml4ZWQtc2l6ZSBhcnJheXMgaW5zaWRlIHN0cnVjdCBwZWNpX3JlcXVlc3QuDQo+
ID4gDQo+IA0KPiBBcyBpcyBpdCdzIGNlcnRhaW5seSBub3QgdGVycmlibHkgY29tcGxpY2F0ZWQg
aW4gYW4gYWJzb2x1dGUgc2Vuc2UsIGJ1dA0KPiBjb21wYXJhdGl2ZWx5IHNwZWFraW5nIHRoZSBj
bGVhbnVwIHBhdGggZm9yIGEgc2luZ2xlIGFsbG9jYXRpb24gaXMgc3RpbGwNCj4gc2ltcGxlciwg
bm8/DQo+IA0KPiBNYWtpbmcgaXQgbW9yZSBlZmZpY2llbnQgd291bGQgZGVmaW5pdGVseSBiZSBh
IG5pY2UgYmVuZWZpdCB0b28gKHBlcmhhcHMNCj4gYSBtb3JlIHNpZ25pZmljYW50IG9uZSkgLS0g
aW4gYSB0eXBpY2FsIGRlcGxveW1lbnQgSSdkIGd1ZXNzIHRoaXMgY29kZQ0KPiBwYXRoIHdpbGwg
c2VlIHJvdWdobHkgc29ja2V0X2NvdW50ICsgdG90YWxfY29yZV9jb3VudCBleGVjdXRpb25zIHBl
cg0KPiBzZWNvbmQ/wqAgT24gYSBiaWcgbXVsdGktc29ja2V0IHN5c3RlbSB0aGF0IGNvdWxkIGVu
ZCB1cCBiZWluZyBhDQo+IHJlYXNvbmFibHkgbGFyZ2UgbnVtYmVyICg+MTAwKSwgc28gd2hpbGUg
aXQgbWF5IG5vdCBlbmQgdXAgYXMgYSBtYWpvcg0KPiBob3Qgc3BvdCBpbiBhIHN5c3RlbS13aWRl
IHByb2ZpbGUsIGl0IHNlZW1zIGxpa2UgaXQgbWlnaHQgYmUgd29ydGgNCj4gaGF2aW5nIGl0IGRv
IDEvMyBhcyBtYW55IGFsbG9jYXRpb25zIGlmIGl0J3MgcmVhc29uYWJseSBlYXN5IHRvIGRvLg0K
PiAoQW5kIHdoaWxlIEkgZG9uJ3QgdGhpbmsgdGhlIGtlcm5lbCBpcyBnZW5lcmFsbHkgYXQgZmF1
bHQgZm9yIHRoaXMsIGZyb20NCj4gd2hhdCBJJ3ZlIHNlZW4gb2YgT3BlbkJNQyBhcyBhIHdob2xl
IEkgdGhpbmsgaXQgbWlnaHQgYmVuZWZpdCBmcm9tIGEgYml0DQo+IG1vcmUgb3ZlcmFsbCBmcnVn
YWxpdHkgd2l0aCBDUFUgY3ljbGVzLikNCj4gDQo+IEFzIGZvciBhIGZpeGVkIG1heCByZXF1ZXN0
IHNpemUgYW5kIGlubGluZWQgYnVmZmVycywgSSBkZWZpbml0ZWx5DQo+IHVuZGVyc3RhbmQgbm90
IHdhbnRpbmcgdG8gcHV0IGEgY2FwIG9uIHRoYXQgaW4gdGhlIGdlbmVyaWMgUEVDSSBjb3JlIC0t
DQo+IGFuZCBhY3R1YWxseSwgbG9va2luZyBhdCB0aGUgcGVjaS1ucGNtIGNvZGUgZnJvbSBwcmV2
aW91cyBpdGVyYXRpb25zIG9mDQo+IHRoZSBQRUNJIHBhdGNoc2V0LCBpdCBsb29rcyBsaWtlIHRo
ZSBOdXZvdG9uIGhhcmR3YXJlIGhhcyBzaWduaWZpY2FudGx5DQo+IGxhcmdlciBzaXplIGxpbWl0
cyAoMTI3IGJ5dGVzIGlmIEknbSByZWFkaW5nIHRoaW5ncyByaWdodCkgdGhhdCBtaWdodCBiZQ0K
PiBhIGJpdCBidWxreSBmb3Igb24tc3RhY2sgYWxsb2NhdGlvbi7CoCBTbyB3aGlsZSB0aGF0J3Mg
YXBwZWFsaW5nDQo+IGVmZmljaWVuY3ktd2lzZSBhbmQgKElNTykgYWVzdGhldGljYWxseSwgcGVy
aGFwcyBpdCdzIG5vdCB1bHRpbWF0ZWx5DQo+IHJlYWwgdmlhYmxlLg0KPiANCj4gSG1tLCB0aG91
Z2ggKHRoaW5raW5nIG91dCBsb3VkKSBJIHN1cHBvc2Ugd2UgY291bGQgYWxzbyBnZXQgZG93biB0
byBhDQo+IHplcm8tYWxsb2NhdGlvbiBjb21tb24gY2FzZSBieSBoYXZpbmcgdGhlIGRyaXZlciBo
b2xkIG9uIHRvIGEgcmVxdWVzdA0KPiBzdHJ1Y3QgYW5kIHJldXNlIGl0IGFjcm9zcyB0cmFuc2Zl
cnMsIGdpdmVuIHRoYXQgdGhleSdyZSBhbGwgc2VyaWFsaXplZA0KPiBieSBhIG11dGV4IGFueXdh
eT8NCg0KV2l0aCB0aGUgInplcm8tYWxsb2NhdGlvbiIgY2FzZSB3ZSBzdGlsbCBuZWVkIHNvbWUg
bWVtb3J5IHRvIGNvcHkgdGhlIG5lY2Vzc2FyeQ0KZGF0YSBmcm9tIHRoZSAicmVxdWVzdCBhcmVh
IiAobm93ICJnbG9iYWwiIC0gcGVyLWNvbnRyb2xsZXIpLg0KDQpBZnRlciBtb3JlIGNvbnNpZGVy
YXRpb24sIEkgdGhpbmsgdGhpcyBkb2Vzbid0IGhhdmUgdG8gcmVseSBvbiBjb250cm9sbGVyDQpj
YXBhYmlsaXRpZXMsIHdlIGNhbiBqdXN0IGRlZmluZSBhIG1heCB2YWx1ZSBiYXNlZCBvbiB0aGUg
Y29tbWFuZHMgd2UncmUgdXNpbmcNCmFuZCB1c2UgdGhhdCB3aXRoIHNpbmdsZSBhbGxvYyAod2l0
aCByeCBhbmQgdHggaGF2aW5nIGZpeGVkIHNpemUgYXJyYXlzKS4NCkknbGwgY2hhbmdlIGl0IGlu
IHYyLg0KDQpUaGFuayB5b3UNCi1Jd29uYQ0KPiANCg==
