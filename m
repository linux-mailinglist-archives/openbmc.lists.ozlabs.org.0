Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A733CA335
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 18:48:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQgLT6ZV4z308B
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 02:48:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=ncSzOozw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=ncSzOozw; dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQgL323tzz2yZC;
 Fri, 16 Jul 2021 02:48:26 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="207563833"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="207563833"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 09:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="495557507"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2021 09:47:23 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 09:47:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 15 Jul 2021 09:47:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 15 Jul 2021 09:47:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UaaSkLV/x7aIA/bmMmxIm6rzqR1J8ch/ttp72IgDsoWHqKA2l/z+Txz0tIVJ+gNbFQMwhzhvubP5gNoHsdo7RopGz8e63C+wNJ7rCYjKl4E1mJ3W8C53xxQI7mXGVAylwAcVQrz4EA12TUwTMVpTR0oFS50dSK0IkDT/bzPX2Bvv5gCZG8YWMlPzKyCFeGOLYy16geaWT9UTLcM6ybVqlLv59SxQm5xo0nVl96Fg3SihnwgilX+X22z/viCvBEjUGsqAKx95pjw40JAFCqPJe2Ii1aEgjtcb0wS9w5mI+418qBKB4n9H1uW//E90MHezFp8DVpeqDCchPcUEm8/jTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diBOJBvSEVMmwJ0KEy5puPXGjbEjvhBwCY/GRTRELGQ=;
 b=P9MdgaFpflj3BENfQQQ+lB09Cb3UaBLQueAFLMM20FBOjc9BltTBxJU2VYyOtYi/hOZSIwRLTbHt61r5XO/pqzrB8soTVXJvhAcc/vgvrgiJIAJZs0i04vruuljIgspg+/Dn7AYXGkrBeDBGn3eVWTepZAO4n78hFI1c6ahM0Y4quBI84C7KyR3C4eKKLXZb7rZXl8wY3ZqXs+VFnP0KQRI0726wyDvpLEsj+y0FOHLJhi8Qn4apZCnbEs1t6LTPmcZfjkfNSQPJhJZQ89w/UyuN7NtA+bx55qyLmt+n9j2CDvSa7cJMfBC3OBhxW+qR0mWNNacEHTctJnOXYRYmrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diBOJBvSEVMmwJ0KEy5puPXGjbEjvhBwCY/GRTRELGQ=;
 b=ncSzOozw/Og0EVtqgFE6uY/vhSPa+yj1j5IuNYSbz2lLi/1nFsBnL65kO7K3XqUygwfe+PRSNvx04QZ8p/mKChvoI6yw+ZCBY366mEtzFDqmZVP366IZjt14safdQf0OGB+kX9zG6plWuKAawrY+xqG8WQxLbgeWdsu8uGF9MSs=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 16:47:17 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1%7]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 16:47:17 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXd2pgGKGV7ci+FEWC/Qa+IdSlWqtCsxKAgAGQOoA=
Date: Thu, 15 Jul 2021 16:47:16 +0000
Message-ID: <218ef97a68491e88d8012799385ee244544a157a.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-2-iwona.winiarska@intel.com>
 <32c71687f11fb418dafa45ecf15f7c6b50dd0397.camel@intel.com>
In-Reply-To: <32c71687f11fb418dafa45ecf15f7c6b50dd0397.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ed5578f-a210-4a68-ea0c-08d947b03487
x-ms-traffictypediagnostic: SN6PR11MB2670:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2670194F5F82F4B952902112EC129@SN6PR11MB2670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FfLfmoOxIM2oMXJXjEFM357Q+USwkAbAsrbpJ0QhMleHunYGw5SlwjsrnGJlZw+TGTppVvn4X0hLMDf5NyAKSxo3wmbdWGhRX1Fuzageiv7y8JmiUVTRbf47acU9ZuBIYSlM4yCuNGbGLm0H/SAFJ2LBrNtfNPL+YBvI4QJef4IKhVCR+O9JOvlNRm6KNxemCvVOSWcbs0qmwKRfapA4UId3Ku/THtGlcraTpy2VN/v4OfZBB5ZJ/KCPz3RcgbuwGa/gUb6m+H8kn/86mQ4OhrM+KDV90f1aVi9he+XmnT69cj8ca9DRNebzp+3hifGMO0bLRfNiG53TTMkfcLxRFaRlDkzdGeaOEwd4hT8QpujbnCCVXI+Yt6mIXSH2Ga1j+zlv2+4Yul5KKz8tEQNqv99Lzl+MpYHp/yLUfUqBOUIAphvrYTq9G7wE3rmRVfLjpdPW5IQGXWJtCeaRv5Ez+2VGDoW76/p9rclJpgpDWX2OUktmtsYsuDxZK3Ps4EhWLDlfAJQ27TfdA5BG9cfLuFBm7J+y5a1K1oM4USGk1kgoZRCIR0Y0vvHIRg0lP/zaZ+5OXnLCBGGQ7eSwHv7qFTJ5Io9tvxA9GbbG8DgApjjwuQoiNiS+fg1zfdLqelDxCoRvus6PuvO47sTx5cxCN09qJ+yzzCdJYLSCyB5GNZCfiA7XyHUCXith5h6BA8mChWnzsMiyrp4yyPADI1o3/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(66946007)(76116006)(71200400001)(110136005)(64756008)(66446008)(91956017)(478600001)(2616005)(66476007)(66556008)(86362001)(54906003)(26005)(4326008)(186003)(316002)(2906002)(8676002)(36756003)(38100700002)(6506007)(83380400001)(8936002)(6512007)(5660300002)(6486002)(7416002)(122000001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk1JcEcySlJtcnhXSHZGLzFMNlFaQkFsOWJjeXRrTWRxTjByR1FHTHdMZGZZ?=
 =?utf-8?B?My94cTc3SENkd3hvaVpkNjE4NEY3SnF4am5vK2NMRVhrSXZSSWttaHhRTWNE?=
 =?utf-8?B?aXo3bHpkOTBXeFRXaCtHMTBpb1YxZEw2MFE2SjhBTFMwd1NrQ1lTN29laEg4?=
 =?utf-8?B?aWQvRlROa2h5eFk5UnlyM09TakdnV1pqNy9xcVJMZVYvYTdaVGI3U3FxeDQ1?=
 =?utf-8?B?a2E4b3lJenFGVE1zU2lIa1lOcG5RdmRzZ0k4WWExYkR5STRKSnZRL3dDbXBH?=
 =?utf-8?B?T0FhREF4ZGo0bUs0UlNGaGlQVVhndTlrODRadHI0amxJK3BxV2dvRjgyallt?=
 =?utf-8?B?U2lLb0JaUDg3aG5QWEFHMUZiOUdTaGlLY3dVVTZhS0l1MTY4d2I4dU8zVktU?=
 =?utf-8?B?VmRFbHIrbFkzOGZORGZDZm5NblQ2QVdueGV2aEtkZjNJNVZOZFpqVWtxOTNm?=
 =?utf-8?B?ZE9FZmJLUEUwRDZRbmdkbGpJbm9BVWlQenhMamppRk5IZnJ4bkRjYkpGbms0?=
 =?utf-8?B?eUVFZ3lNS3dwL3dVUEY5LzNXdmwzY0d2c080QkNPYVlEdW1odzdqbXVmOU5j?=
 =?utf-8?B?UkYrd0llckVYT1NVSVVKdUJqbDhEVFgxSTU4SEg0RTZUc1pQdzlBTDNsUkIz?=
 =?utf-8?B?aVR6NVh3TlhNL0gzUU9qMDRXcjF1MnFvYTMweHlmbjNGcTZubStRZk84bkRQ?=
 =?utf-8?B?SnhYSHhBOW8rbzJiVjBuUW9BNXJsdWcreitXMUpzbmhkWnV4Sy9VQURZRUJa?=
 =?utf-8?B?UWdieW1KQ1I5dHJkV2ZWanRQeldiSjlSZWJ2TTBNdjNxUFkwbjJBbUxQODVF?=
 =?utf-8?B?c0Q2SDltak9QWkgydEpkTFVCaEVCN3pLZXpFbldLbTVseWhtMHZoK2V4dW1F?=
 =?utf-8?B?WjBWQUF4M1JmODZHcUJtWWdRN3FzNTVIQWZOQ0ZrbkpiVTBKQjBrajdkaVhL?=
 =?utf-8?B?RGVndmdwS0l1eWFqdytValFYV0lVbDVXZDZWZlRuWjQ2ajdST1Z6YXMrdXJH?=
 =?utf-8?B?d1FoMXFVRWdoRUV5RUtMMERlSmkyWXNCQmVpaU9zU1hML3R6NmdpRTIrL3pY?=
 =?utf-8?B?YjJEcHdlVXVmYVZTSnRZMU0raFYrZFYxRmg5M3pJdHl1YTBZZkgwcHVnbnpy?=
 =?utf-8?B?UWZCZjlUU3JJZWxhdWxvdVdWMjV6L1RJbEkya2NEU2dFR3FnNEtQdXd2WCs5?=
 =?utf-8?B?Sk9pSG8vU2orcUV0RUxzUVpTY0N4V0x5dTFnL1ZralJGQzVsSWpaVDZkTlZm?=
 =?utf-8?B?SG9oTWhOd29qWTgxd3RCQVhRZUN3V3dWV2xHcnkzckROMXVza0t0K2tyRjh0?=
 =?utf-8?B?eXFLWW9WZFFCU2tRUXdmUndLcW43MHR3cVlCYnRIUVZxWlFRem1UeVFuQUgz?=
 =?utf-8?B?RFZBWitNUnRzQ0tYbWo0bDByc0FjWktvUkt1UUFZaGxiT1JxaTEyYXU5NEor?=
 =?utf-8?B?V3lwL2xMZkFYYVE5M3BacDRicVZaK3QxWEUwdFArOXZLMzZTNTZUZUZiMnY2?=
 =?utf-8?B?d0kraFBxU3h5elh6bTU1b29NNUtrNVFGVHhUQStKQ0Y4Q2Nnc09zdTFZMzhN?=
 =?utf-8?B?R2RIOWtOSzhMd21QRDkvSDhtcndpRGVwRE9Xc0dxaWVoejAwWW5PdlU4OUxq?=
 =?utf-8?B?VU1NWGtFZi9KMUtXbnhPSXNhOEFsOHB6ZXJDZWFzUlA0M003cFpWSnlvSDRG?=
 =?utf-8?B?ZityTFR2VFRBcitua0FzZWNMOWtBYXAwNXhEM0lZaDBSM1NBWWdrdzNDMVNI?=
 =?utf-8?B?OWhjWEo4dWZaaEx5NDdqeWRWdVBseW1hY1lUQWdYRTZIb1Y2N1lXOWNQZGtC?=
 =?utf-8?B?SzZxYzJKMWtheFFlRlNzdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <516506D8F1522849B99E78F46AA9FF1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed5578f-a210-4a68-ea0c-08d947b03487
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 16:47:16.9295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DNiQmyT6M0UWDA3Zj1wPe3/lA5RE005WmuhL7XfVO1m+0Yx1YHnjaDO//E9CJNuwR+WZrPbloekT6zdyTRUwzN+Ae7WpP24XM8mto4sAnbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2670
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
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDE2OjU0ICswMDAwLCBXaWxsaWFtcywgRGFuIEogd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyMS0wNy0xMyBhdCAwMDowNCArMDIwMCwgSXdvbmEgV2luaWFyc2thIHdy
b3RlOg0KPiA+IEJhc2Vib2FyZCBtYW5hZ2VtZW50IGNvbnRyb2xsZXJzIChCTUMpIG9mdGVuIHJ1
biBMaW51eCBidXQgYXJlDQo+ID4gdXN1YWxseQ0KPiA+IGltcGxlbWVudGVkIHdpdGggbm9uLVg4
NiBwcm9jZXNzb3JzLiBUaGV5IGNhbiB1c2UgUEVDSSB0byBhY2Nlc3MNCj4gPiBwYWNrYWdlDQo+
ID4gY29uZmlnIHNwYWNlIChQQ1MpIHJlZ2lzdGVycyBvbiB0aGUgaG9zdCBDUFUgYW5kIHNpbmNl
IHNvbWUNCj4gPiBpbmZvcm1hdGlvbiwNCj4gPiBlLmcuIGZpZ3VyaW5nIG91dCB0aGUgY29yZSBj
b3VudCwgY2FuIGJlIG9idGFpbmVkIHVzaW5nIGRpZmZlcmVudA0KPiA+IHJlZ2lzdGVycyBvbiBk
aWZmZXJlbnQgQ1BVIGdlbmVyYXRpb25zLCB0aGV5IG5lZWQgdG8gZGVjb2RlIHRoZQ0KPiA+IGZh
bWlseQ0KPiA+IGFuZCBtb2RlbC4NCj4gPiANCj4gPiBNb3ZlIHRoZSBkYXRhIGZyb20gYXJjaC94
ODYvaW5jbHVkZS9hc20vaW50ZWwtZmFtaWx5LmggaW50byBhIG5ldw0KPiA+IGZpbGUNCj4gPiBp
bmNsdWRlL2xpbnV4L3g4Ni9pbnRlbC1mYW1pbHkuaCBzbyB0aGF0IGl0IGNhbiBiZSB1c2VkIGJ5
IG90aGVyDQo+ID4gYXJjaGl0ZWN0dXJlcy4NCj4gDQo+IEF0IGxlYXN0IGl0IHdvdWxkIG1ha2Ug
dGhlIGRpZmZzdGF0IHNtYWxsZXIgdG8gYWxsb3cgZm9yIHJlbmFtZQ0KPiBkZXRlY3Rpb24gd2hl
biB0aGUgb2xkIGZpbGUgaXMgZGVsZXRlZCBpbiB0aGUgc2FtZSBwYXRjaDoNCj4gDQo+IMKgTUFJ
TlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArDQo+IMKg
e2FyY2gveDg2L2luY2x1ZGUvYXNtID0+IGluY2x1ZGUvbGludXgveDg2fS9pbnRlbC1mYW1pbHku
aCB8IDYgKysrLS0tDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+IA0KPiAuLi5vbmUgdGhpbmcgcGVvcGxlIGhhdmUgZG9uZSBpbiB0aGUgcGFz
dCBpcyBpbmNsdWRlIGEgY29udmVyc2lvbg0KPiBzY3JpcHQgaW4gdGhlIGNoYW5nZWxvZyB0aGF0
IHByb2R1Y2VkIHRoZSBkaWZmLiBUaGF0IHdheSBpZiBhDQo+IG1haW50YWluZXIgd2FudHMgdG8g
YmUgc3VyZSB0byBjYXRjaCBhbnkgbmV3IHVzYWdlIG9mIHRoZSBoZWFkZXIgYXQNCj4gdGhlIG9s
ZCBsb2NhdGlvbiB0aGV5IGp1c3QgcnVuIHRoZSBzY3JpcHQuDQoNCllvdSBtZWFuIGxpa2UgYSBz
aW1wbGUgcyNhc20vaW50ZWwtZmFtaWx5LmgjbGludXgveDg2L2ludGVsLWZhbWlseS5oI2cNCj8N
Ck9wZXJhdGluZyBvbiBrZXJuZWwgdHJlZT8gT3IgaW5kaXZpZHVhbCBwYXRjaGVzPw0KDQpJcyBp
bmNsdWRpbmcgIm9sZCIgaGVhZGVyIGluIG5ldyBjb2RlIHRoYXQgYmlnIG9mIGEgZGVhbD8gSSBn
dWVzcyBpdA0KY291bGQgYnJlYWsgZ3JlcGFiaWxpdHkgKGxvb2tpbmcgZm9yIHVzZXJzIG9mIHRo
ZSBoZWFkZXIsIG5vdyB0aGF0IGl0DQpjYW4gYmUgcHVsbGVkIGZyb20gdHdvIGRpZmZlcmVudCBw
bGFjZXMpLg0KSXQgd291bGQgYmUgd29yc2UgaWYgc29tZW9uZSBkZWNpZGVkIHRvIGFkZCBuZXcg
Y29udGVudCB0byBvbGQgaGVhZGVyLA0KYnV0IHRoaXMgc2hvdWxkIGJlIGVhc2llciB0byBjYXRj
aCBkdXJpbmcgcmV2aWV3Lg0KDQo+IA0KPiBJIGFtIG5vdCBhd2FyZSBvZiB4ODYgbWFpbnRhaW5l
ciBwcmVmZXJlbmNlIGhlcmUuIEVpdGhlciB3YXkgeW91IGRlY2lkZQ0KPiB0byBnbyB5b3UgY2Fu
IGFkZDoNCj4gDQo+IFJldmlld2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT4NCj4gDQoNClRoYW5rIHlvdQ0KLUl3b25hDQo=
