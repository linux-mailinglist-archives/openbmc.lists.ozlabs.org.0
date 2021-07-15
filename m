Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2833CA37D
	for <lists+openbmc@lfdr.de>; Thu, 15 Jul 2021 19:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQgbq5H1vz307J
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 03:00:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=BZRN7mlT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=BZRN7mlT; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQgbT2TFxz2yP1;
 Fri, 16 Jul 2021 02:59:59 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210401536"
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="210401536"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 09:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,242,1620716400"; d="scan'208";a="460457559"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2021 09:58:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 09:58:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 15 Jul 2021 09:58:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 15 Jul 2021 09:58:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZL2lfEG6QItecrESW9Bvi2r0e+YDQF4KmlEYdO5sBqLKZxR+M0w5n3ZC0bG5ZS7MzejQ3YubifOeJIMGbVbfocO3G2R7EBewjBASnvzs7ck8zjuzScQNT1FARRsyNI6LRlp2IiQpSVMrYgVLlXofWhiOf8HSAr3OJaSFJxlYqNbq2q4oDo42LSvzjZMj6l7eaqz31Tx+5+WLSSDxCju0ZpblLUoPuypLJpw44zbldcuhM+mYib6TXaxYaIsQH6kMnPNEai7SER+A2kqpUP1KGHdxVQ6sabVKTQP6KkuhUbOmvIDe4h2PYRza2/97PeLg3SxiO/kWepW92ZmGiQJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3/XMPjfqMoFid4z2M3tF0WdXnGGr84Rr3VGinRkB9s=;
 b=XMujxUUD0qtcCbh+0aSP5rZngD572qCS1LxDZLnvBo5MEp50zRbSb7msRWhyM5e2vA3x7+RsDy4j9tIkQ9c3Tz7629zNMDP0XEEI9EV8KrrP9w2WudQBP4aRiakYnavHtPXVu5FN8xeM/mp6YIIVqRcmeLAOsZkYEBX7F1NHLhJYCtgeihWv1ZesSHHE7wma9aifhYk4dJ2DorPMaki7S50sdSOJk0uTlh9oecXGYaAHxTuLV3mWQDHbIoPy2NcxTnwVC9yXDBL6iBI8hiav6zFIoy5xOuqiztyFp3fnLcyKoRRZSDjQRpHpk6ETz5UBzt0t5Z3tczKBBGcgXggFcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3/XMPjfqMoFid4z2M3tF0WdXnGGr84Rr3VGinRkB9s=;
 b=BZRN7mlTfl01u6TGoghqvACZZn8BIrrCSneV0UePQsoqA6fAuGvSGbKv6YiCUUNRZkFKKJ0bPZ11iKI+9K7LezK/SZ+CuQOzXY4X8X54xTAcbMLymo3PcP6vc5cvcfiShHXpupVkdyJwLtdwnVhhf8p+9jwI1074OBEhUJ2jDUo=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SN6PR11MB3231.namprd11.prod.outlook.com (2603:10b6:805:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Thu, 15 Jul
 2021 16:58:28 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::357a:ba5:ee4f:d5f1%7]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 16:58:28 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 02/14] x86/cpu: Extract cpuid helpers to arch-independent
Thread-Topic: [PATCH 02/14] x86/cpu: Extract cpuid helpers to arch-independent
Thread-Index: AQHXd2pfXYHCbXXnwEGKQF1SxfrEOKtCtB2AgAGQZYCAAAHrgA==
Date: Thu, 15 Jul 2021 16:58:28 +0000
Message-ID: <ae9654202758925d72f98e6ec14b106af39e5f3e.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-3-iwona.winiarska@intel.com>
 <c81be21327124c2269baa13741cacbd304120e7f.camel@intel.com>
 <87be3ed7be9949f6e929c2b185dc7d623d525f8e.camel@intel.com>
In-Reply-To: <87be3ed7be9949f6e929c2b185dc7d623d525f8e.camel@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0615636e-6c4f-49e4-258c-08d947b1c4dd
x-ms-traffictypediagnostic: SN6PR11MB3231:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB32317927EC123BBA995EC80CEC129@SN6PR11MB3231.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8DYamXTPOLGPk+lfa/U8J6Na6zEzHfh0okTAoGNu/BlMmwESQALH4HKQaw6KJ2mF1Cy9UKHoXQfWF+q78csHXSfIninvxrYJz+Q/5tyJthpdq6P4Sim0jqDlO1sNoHaKkboNerYQEqhxdlEmUgCsDzCAIbd/hFbapdk3raLyuN5qzaxOhPToMpcsmzAF33B6TbcBKA8qPlT8onFW1V+W5EEh1PHY3TrbLDjBz70SIvPMK2q0KBhYW99I/VKkSEArEjl0pXS8uTsWRfrALSix0uS/A/cqAvxx1/Yd8W16HYYNrHeIZDWkFSaVF4PrOSuQOHQ9eTjaV/S0v2pGlRwY5x/lHxGGCiSQuFxkaVoSEiG+Vgapuv+x9RLVAjE6IY3XHS/Q4oU2+Pjj9Gqfqxs2GGQRpj+TTnOHA6jOeFlANpRTqI8Fpg4g+s3R5pn0jzVI3//yNMYx60PVGwP/zJ8A8hi6Iu+Ie25CHEEF7fX9Tt1ieWYbUQeQfKTnEZsYe7GIH9UlGiLsyVpyHb1x1gjR57UxVTxZKy0+L5gxQOazWj1/0FkzAP8IeyHPbx+1QXuIVZJ8E9gsktpbMOATq/H5A6yLaIKGxSMQqjZxAU0tKuEXFMTNFW3MRSKmqzxbfCEFDRtvJO8ILi6jNojTa0vJ7Cwwg6UJFewnunacx41NTzz/zD2I8UlEB4fk0ZGhVlzj2sR6EerBaWz2f/a5b/ITIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(36756003)(6506007)(66556008)(91956017)(76116006)(66946007)(66476007)(64756008)(66446008)(122000001)(8936002)(4326008)(2906002)(38100700002)(8676002)(2616005)(478600001)(316002)(6512007)(54906003)(86362001)(71200400001)(6486002)(110136005)(26005)(5660300002)(186003)(83380400001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3pLeUVWQk1UOEUyVXZZSE5KR3g2ZFdPQ0had1pXdUFrZWd3dFg4cVVhNFhK?=
 =?utf-8?B?am1YaVQ3ZzQwZUtJYWg1blZUZTVPS3B6bWZwNXpwM1dCdXZKSmRkTmdYbU9J?=
 =?utf-8?B?ZXdOcnM0Q3QxODFvM2trU0FFR1gyNVVhQVpRWlllMDhvZ2xvMkppYkpGeG9X?=
 =?utf-8?B?YU83aEFkTmN5aFk1blh5dHZOVnUybHEwOFgvZndDY0JFOHF0cC9zeG1OQU1k?=
 =?utf-8?B?VDRDNzVrRlkySUltM1J5Y2dKUVlHeGE0YTc0bHpWWkRvWjEzWFQrRHFBd2dS?=
 =?utf-8?B?RWRoWDBLeWhRb3pIVERXRjJHa1dYa1dhdFcwTkdISHpWVDdiTVYyOXpLOStu?=
 =?utf-8?B?V2RZYjkwQnVETjAyQ29ycUVIVDV4V2VCNWlXNDhSZ01vT0prUHJFVms0R0xa?=
 =?utf-8?B?d0JMV1BOaXNxVzhQQXVkRUZIb0h5RDBQc1A3RkZtdUVXZU9SRFZCa0V2MW5k?=
 =?utf-8?B?YUhxV3BrN3VvS1FGNHBwM3VZRjFxYlhhcG9Xb0Z6MC9KU1B5eWdOQnRuejA3?=
 =?utf-8?B?dFpPM3l5V2NibVpuM3hGVUkwNktJYzl5dDZBdEwxdGhJbUFSQXNEWjM3emkx?=
 =?utf-8?B?YXZLQWYxclVqWm1HSXROdUJxeDk0WUxjbEtoMXQ4SmhNbWwxVDlISWV1SG9N?=
 =?utf-8?B?Wng4YzNnWER1bGRhZFVIOXp3YUFSNHhrcXl6U0JsQ2F4THZ4Vld5T1lwRytK?=
 =?utf-8?B?NEJHRkRpeU5xK1ZNcGFEbkNVMmVkUGpDL0JHWiszc0V1VGhwUHVCUG9UMjJ2?=
 =?utf-8?B?RlBZZnVqNENEUE9KWjB2NnRpRWhKOC9ST2xzSlE5TVhLeVJFMlVURWZycDNy?=
 =?utf-8?B?cHgvcTFWNE16ZEFVeE5kUFlhTUo4bHpuVmdnMVo0RGJOWkdKWmJJSytiUVBy?=
 =?utf-8?B?eVhJbTJMYmxzSU1HSGRpdUpKS0QwWWMyQXdSUGgrWldIQnU2OWJQOEZRY2c2?=
 =?utf-8?B?WG8zMXhLYWVhTDByMnZwMmwxYVpHSkoxekZZQmkxN0hJY1NPcW1JUlFQTTIv?=
 =?utf-8?B?RmYxb0JldHhSZjJ6SnUzNldsQSt0Q1JYbCtScFJ0dlphY2VrZVJGUWRqMkxD?=
 =?utf-8?B?d2Nab00yRW5sNkx3ZWh3Q2tzVVh0WE1RYUhPUnl2Q1hiamE0SGljT2lYWXJx?=
 =?utf-8?B?NytJdngwZTdaNDFKVENFTzBUNW0yS2RUbys2Qm51NlU2SjBnRGhISDRld3Zm?=
 =?utf-8?B?NHZHM081YXJDMTl6L0llTERKM3R6YXZITkVVRDRWN2pLTXVHQ0JLZCticU1i?=
 =?utf-8?B?U0FsN25GcmRLMlN2d3lQclViVHg1UUVhNE9CN0xKUEJiVVNyN2FaN1JMb1J3?=
 =?utf-8?B?TUgxcHV2VUZ4Zm5yVERVaS9EL2ExczllQlFtdzhyd2JLQitjR1d2dlkzTGNW?=
 =?utf-8?B?WlNlcXFXMU5KMzJNUk9xL2ExY3NGSVl2TWJZY3ZqaWRxWGt4bmh0Qk1YbzU0?=
 =?utf-8?B?bUFvN0p5MmlWU1k2dXZKZkhZQTBYUWtkNkhvbmZ1K2JzRDFIS1ZFVHY4bGc5?=
 =?utf-8?B?UHhRZURkdURHekhKOVdpSUVkUkpoRGJLdTNJSk16Ly9VWGdYejY5eHpZU2s5?=
 =?utf-8?B?VmJWdVBiQUhhZHBhSmhKblBlVWNBODVUVHY4c2ZLNTY5QUFFV0NRYytHZE1C?=
 =?utf-8?B?VlFDUnpCaXJUSDRVSWdETUFoSGx6bXBmNURuUWtvSVFtR2pJcVpZZ0c4OU1z?=
 =?utf-8?B?UkhCaDlhZ0xhTjRWZ0NTd2NsWW5jOHU5YnVLYm1HSkVnV3JNcm9MelZyL3Zt?=
 =?utf-8?B?UXdUV3RsSkpKL21sdnovbnVBMzlmdzNzUm9xUkRZcU5uVmhpTlc0Q25Bd1Fn?=
 =?utf-8?B?WDN1ZlQwSHU0RjVSSzRmdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04AACC00BE0E2140A963B254627420DA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0615636e-6c4f-49e4-258c-08d947b1c4dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 16:58:28.5407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwY2OifFNL3MtGY39sOQ5rObfgr3ZKzvZZQGX8yypENG+uUSSqjq16snCECBftl3NFzSY73Vld0sVX9j68/ljf3iS3xEepj7zt/eumCBlxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3231
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>, "Luck,
 Tony" <tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gVGh1LCAyMDIxLTA3LTE1IGF0IDE2OjUxICswMDAwLCBXaW5pYXJza2EsIEl3b25hIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjEtMDctMTQgYXQgMTY6NTggKzAwMDAsIFdpbGxpYW1zLCBEYW4gSiB3
cm90ZToNCj4gPiBPbiBUdWUsIDIwMjEtMDctMTMgYXQgMDA6MDQgKzAyMDAsIEl3b25hIFdpbmlh
cnNrYSB3cm90ZToNCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUu
aA0KPiA+ID4gYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9jcHUuaA0KPiA+ID4gaW5kZXggMzNkNDFl
MzUwYzc5Li4yYTY2M2EwNWE3OTUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9jcHUuaA0KPiA+ID4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vY3B1LmgNCj4gPiA+
IEBAIC0zNyw5ICszNyw2IEBAIGV4dGVybiBpbnQgX2RlYnVnX2hvdHBsdWdfY3B1KGludCBjcHUs
IGludA0KPiA+ID4gYWN0aW9uKTsNCj4gPiA+IMKgDQo+ID4gPiDCoGludCBtd2FpdF91c2FibGUo
Y29uc3Qgc3RydWN0IGNwdWluZm9feDg2ICopOw0KPiA+ID4gwqANCj4gPiA+IC11bnNpZ25lZCBp
bnQgeDg2X2ZhbWlseSh1bnNpZ25lZCBpbnQgc2lnKTsNCj4gPiA+IC11bnNpZ25lZCBpbnQgeDg2
X21vZGVsKHVuc2lnbmVkIGludCBzaWcpOw0KPiA+ID4gLXVuc2lnbmVkIGludCB4ODZfc3RlcHBp
bmcodW5zaWduZWQgaW50IHNpZyk7DQo+ID4gPiDCoCNpZmRlZiBDT05GSUdfQ1BVX1NVUF9JTlRF
TA0KPiA+ID4gwqBleHRlcm4gdm9pZCBfX2luaXQgc2xkX3NldHVwKHN0cnVjdCBjcHVpbmZvX3g4
NiAqYyk7DQo+ID4gPiDCoGV4dGVybiB2b2lkIHN3aXRjaF90b19zbGQodW5zaWduZWQgbG9uZyB0
aWZuKTsNCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9taWNyb2NvZGUu
aA0KPiA+ID4gYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9taWNyb2NvZGUuaA0KPiA+ID4gaW5kZXgg
YWI0NWEyMjBmYWM0Li40YjBlYWJmNjNiOTggMTAwNjQ0DQo+ID4gPiAtLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS9taWNyb2NvZGUuaA0KPiA+ID4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20v
bWljcm9jb2RlLmgNCj4gPiA+IEBAIC0yLDkgKzIsOSBAQA0KPiA+ID4gwqAjaWZuZGVmIF9BU01f
WDg2X01JQ1JPQ09ERV9IDQo+ID4gPiDCoCNkZWZpbmUgX0FTTV9YODZfTUlDUk9DT0RFX0gNCj4g
PiA+IMKgDQo+ID4gPiAtI2luY2x1ZGUgPGFzbS9jcHUuaD4NCj4gPiA+IMKgI2luY2x1ZGUgPGxp
bnV4L2Vhcmx5Y3Bpby5oPg0KPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvaW5pdHJkLmg+DQo+ID4g
PiArI2luY2x1ZGUgPGxpbnV4L3g4Ni9jcHUuaD4NCj4gPiANCj4gPiBIYXMgdGhpcyBwYXRjaCBz
ZXQgcmVjZWl2ZWQgYSBidWlsZCBzdWNjZXNzIG5vdGlmaWNhdGlvbiBmcm9tIHRoZQ0KPiA+IGti
dWlsZCByb2JvdD8gSS5lLiBhcmUgeW91IHN1cmUgdGhhdCB0aGlzIGluY2x1ZGUgd2FzIG9ubHkg
aGVyZSBmb3INCj4gPiB0aGUNCj4gPiANCj4gPiB1bnNpZ25lZCBpbnQgeDg2X2ZhbWlseSh1bnNp
Z25lZCBpbnQgc2lnKTsNCj4gPiB1bnNpZ25lZCBpbnQgeDg2X21vZGVsKHVuc2lnbmVkIGludCBz
aWcpOw0KPiA+IHVuc2lnbmVkIGludCB4ODZfc3RlcHBpbmcodW5zaWduZWQgaW50IHNpZyk7DQo+
ID4gDQo+ID4gLi4uaGVscGVycy4gQWxsIHRoZSBvdGhlciByZXBsYWNlbWVudHMgbG9vayB0cml2
aWFsbHkgdmVyaWZpYWJsZSBhcw0KPiA+IG9ubHkgbmVlZGluZyB0aGVzZSAzIGhlbHBlcnMuDQoN
Ck1pc3NlZCB0aGUgcmVzdCBvZiB5b3VyIGVtYWlsIGluIG15IHByZXZpb3VzIHBvc3QgLSBzb3Jy
eS4NClllcyAtIGFuZCBiZWZvcmUgdGhhdCBJIHJhbiB0aGlzIHRocm91Z2ggYWxseWVzY29uZmln
IG9uIHg4Ni4NCg0KPiA+IA0KPiA+ID4gwqANCj4gPiA+IMKgc3RydWN0IHVjb2RlX3BhdGNoIHsN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGlzdF9oZWFkIHBsaXN0Ow0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9jcHVpZC5oIGIvYXJjaC94ODYva3ZtL2NwdWlkLmgNCj4g
PiA+IGluZGV4IGM5OWVkZmZmN2Y4Mi4uYmYwNzBkMmEyMTc1IDEwMDY0NA0KPiA+ID4gLS0tIGEv
YXJjaC94ODYva3ZtL2NwdWlkLmgNCj4gPiA+ICsrKyBiL2FyY2gveDg2L2t2bS9jcHVpZC5oDQo+
ID4gPiBAQCAtNCwxMCArNCwxMSBAQA0KPiA+ID4gwqANCj4gPiA+IMKgI2luY2x1ZGUgIng4Ni5o
Ig0KPiA+ID4gwqAjaW5jbHVkZSAicmV2ZXJzZV9jcHVpZC5oIg0KPiA+ID4gLSNpbmNsdWRlIDxh
c20vY3B1Lmg+DQo+ID4gPiDCoCNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+DQo+ID4gPiDCoCNp
bmNsdWRlIDx1YXBpL2FzbS9rdm1fcGFyYS5oPg0KPiA+ID4gwqANCj4gPiA+ICsjaW5jbHVkZSA8
bGludXgveDg2L2NwdS5oPg0KPiA+ID4gKw0KPiA+ID4gwqBleHRlcm4gdTMyIGt2bV9jcHVfY2Fw
c1tOUl9LVk1fQ1BVX0NBUFNdIF9fcmVhZF9tb3N0bHk7DQo+ID4gPiDCoHZvaWQga3ZtX3NldF9j
cHVfY2Fwcyh2b2lkKTsNCj4gPiA+IMKgDQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbGli
L01ha2VmaWxlIGIvYXJjaC94ODYvbGliL01ha2VmaWxlDQo+ID4gPiBpbmRleCBiYWQ0ZGVlNGYw
ZTQuLmZkNzNjMWI3MmMzZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gveDg2L2xpYi9NYWtlZmls
ZQ0KPiA+ID4gKysrIGIvYXJjaC94ODYvbGliL01ha2VmaWxlDQo+ID4gPiBAQCAtNDEsNyArNDEs
NyBAQCBjbGVhbi1maWxlcyA6PSBpbmF0LXRhYmxlcy5jDQo+ID4gPiDCoA0KPiA+ID4gwqBvYmot
JChDT05GSUdfU01QKSArPSBtc3Itc21wLm8gY2FjaGUtc21wLm8NCj4gPiA+IMKgDQo+ID4gPiAt
bGliLXkgOj0gZGVsYXkubyBtaXNjLm8gY21kbGluZS5vIGNwdS5vDQo+ID4gPiArbGliLXkgOj0g
ZGVsYXkubyBtaXNjLm8gY21kbGluZS5vDQo+ID4gPiDCoGxpYi15ICs9IHVzZXJjb3B5XyQoQklU
UykubyB1c2VyY29weS5vIGdldHVzZXIubyBwdXR1c2VyLm8NCj4gPiA+IMKgbGliLXkgKz0gbWVt
Y3B5XyQoQklUUykubw0KPiA+ID4gwqBsaWItJChDT05GSUdfQVJDSF9IQVNfQ09QWV9NQykgKz0g
Y29weV9tYy5vIGNvcHlfbWNfNjQubw0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZWRhYy9t
Y2VfYW1kLmMgYi9kcml2ZXJzL2VkYWMvbWNlX2FtZC5jDQo+ID4gPiBpbmRleCAyN2Q1NjkyMGI0
NjkuLmY1NDVmNWZhZDAyYyAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZWRhYy9tY2VfYW1k
LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZWRhYy9tY2VfYW1kLmMNCj4gPiA+IEBAIC0xLDggKzEs
NyBAQA0KPiA+ID4gwqAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+
ID4gPiDCoCNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4
L3NsYWIuaD4NCj4gPiA+IC0NCj4gPiA+IC0jaW5jbHVkZSA8YXNtL2NwdS5oPg0KPiA+ID4gKyNp
bmNsdWRlIDxsaW51eC94ODYvY3B1Lmg+DQo+ID4gPiDCoA0KPiA+ID4gwqAjaW5jbHVkZSAibWNl
X2FtZC5oIg0KPiA+ID4gwqANCj4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3g4Ni9j
cHUuaCBiL2luY2x1ZGUvbGludXgveDg2L2NwdS5oDQo+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZjM4M2Q0Nzg4NmQNCj4gPiA+IC0tLSAvZGV2
L251bGwNCj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgveDg2L2NwdS5oDQo+ID4gPiBAQCAtMCww
ICsxLDkgQEANCj4gPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
ICovDQo+ID4gPiArI2lmbmRlZiBfTElOVVhfWDg2X0NQVV9IDQo+ID4gPiArI2RlZmluZSBfTElO
VVhfWDg2X0NQVV9IDQo+ID4gPiArDQo+ID4gPiArdW5zaWduZWQgaW50IHg4Nl9mYW1pbHkodW5z
aWduZWQgaW50IHNpZyk7DQo+ID4gPiArdW5zaWduZWQgaW50IHg4Nl9tb2RlbCh1bnNpZ25lZCBp
bnQgc2lnKTsNCj4gPiA+ICt1bnNpZ25lZCBpbnQgeDg2X3N0ZXBwaW5nKHVuc2lnbmVkIGludCBz
aWcpOw0KPiA+ID4gKw0KPiA+ID4gKyNlbmRpZiAvKiBfTElOVVhfWDg2X0NQVV9IICovDQo+ID4g
PiBkaWZmIC0tZ2l0IGEvbGliL0tjb25maWcgYi9saWIvS2NvbmZpZw0KPiA+ID4gaW5kZXggZDI0
MWZlNDc2ZmRhLi5jYzI4YmMxZjJkODQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9saWIvS2NvbmZpZw0K
PiA+ID4gKysrIGIvbGliL0tjb25maWcNCj4gPiA+IEBAIC03MTgsMyArNzE4LDggQEAgY29uZmln
IFBMRE1GVw0KPiA+ID4gwqANCj4gPiA+IMKgY29uZmlnIEFTTjFfRU5DT0RFUg0KPiA+ID4gwqDC
oMKgwqDCoMKgwqAgdHJpc3RhdGUNCj4gPiA+ICsNCj4gPiA+ICtjb25maWcgR0VORVJJQ19MSUJf
WDg2DQo+ID4gPiArwqDCoMKgwqDCoMKgwqBib29sDQo+ID4gPiArwqDCoMKgwqDCoMKgwqBkZXBl
bmRzIG9uIFg4Ng0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgZGVmYXVsdCBuDQo+ID4gDQo+ID4gTm8g
bmVlZCBmb3IgYSAiZGVmYXVsdCBuIiBsaW5lLiBPbWl0dGluZyBhIGRlZmF1bHQgaXMgdGhlIHNh
bWUgYXMNCj4gPiAiZGVmYXVsdCBuIi4NCg0KU3VyZSAtIEknbGwgZml4IHRoaXMgaW4gdjIuDQoN
ClRoYW5rcw0KLUl3b25hDQoNCj4gPiANCj4gDQoNCg==
