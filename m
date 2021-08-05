Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0FF3E1E11
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 23:43:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gghv01H09z3cX9
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 07:43:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=aSp73x8F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=aSp73x8F; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GghtY091Fz3cPk;
 Fri,  6 Aug 2021 07:43:11 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="201444436"
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="201444436"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 14:42:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; d="scan'208";a="522995123"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2021 14:42:07 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 5 Aug 2021 14:42:07 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 5 Aug 2021 14:42:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 5 Aug 2021 14:42:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 5 Aug 2021 14:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SW4iG76/lqW0AQlgEyEeyDJ0iq/CBizgugViS+aZFhLECEqBwkdlJfmBsdoULjzj+YF/7026fHat6+pJ/2VuRsNYxqWP2jUGHMbzlVxfQhqREHoz08DyGrcI6NdlLrtdDPE5siWd0QkkEbCZUHdPen4mxIl0Jjni1mwVche4v4OHdLh+s9N+DTP/3qAM+qqPFko5LOBAfRQHv+Jn+fFhkavr3quzzOGIMsmJePgLcxDmx9eOma21SVg1OscUimx6ytc7rUhZbrXiHNqLXCYQWXyFbnBjnqgIGTJ6ev0fRB3uza09nzoyzZiVUbIESdreZ7GIeo2jw8GMNzckCA6vDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj6Daywm9tkeUdl7Abu5zSB1ga+B+suPzX9LZbQFd4M=;
 b=L+v1rzuwU4As92Gda1PX/UN6cLibMT9R80v6agtyDJgB3HLkUP5xiPGGGuQYjh7AVKC5L6HvrlUtJ0W0zOXphZaGcWtOhkUUNPhsCQzOjr43E2vcEoXDVXEOK5oe2Uf9ckdVRiRQr9obZqNRaMO3F3Pb/IdeoEjRQiOp+mUwibd9NORto6d9zHdtQMJObWIRiOCm6Lyoey5oCEG8PjlqPMnMNxtk91QoPC+pqNE1ZMpq+BPqlkx/HaFIXBVMqx+Jn6qvzsvgxyb7TksPajSs9JQ62MyKCkxXXzM7p2jXnDSd3YMkxk4wNzIrf7AL2jyCak91ecqx8uzKZm0ZWifmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jj6Daywm9tkeUdl7Abu5zSB1ga+B+suPzX9LZbQFd4M=;
 b=aSp73x8FuaRgYaI6wRolemHKBl3lC6qwdMblkGgivR9KZFCZlaf0stwTt568Y4zv/R9Ftx264EbJL008sYY8ERhOQ7ahPSvGZcuWWi8eJh6vm9pkGnlDQ/mHSHSeQUnZrF6zAHmsRJ/kuqfv2BJXMY9x+azfwBi1C8JC4x2TlH4=
Received: from SN6PR11MB2589.namprd11.prod.outlook.com (2603:10b6:805:53::12)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 21:42:04 +0000
Received: from SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35]) by SN6PR11MB2589.namprd11.prod.outlook.com
 ([fe80::6e:364a:dc09:3d35%5]) with mapi id 15.20.4394.018; Thu, 5 Aug 2021
 21:42:04 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "linux@roeck-us.net" <linux@roeck-us.net>, "zweiss@equinix.com"
 <zweiss@equinix.com>
Subject: Re: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Topic: [PATCH 13/14] docs: hwmon: Document PECI drivers
Thread-Index: AQHXd2r9gaflsnB05ke+TXWeCzETMKtXhuUAgAiv0ACAA41TAIAAA9YAgAHOwIA=
Date: Thu, 5 Aug 2021 21:42:04 +0000
Message-ID: <6891496eabcc6f9cacec4fea505fb757ea9c11fc.camel@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-14-iwona.winiarska@intel.com>
 <20210727225808.GU8018@packtop>
 <ea5621698508a800cea59b5533f8845b9f0befc6.camel@intel.com>
 <20210804175203.GY8018@packtop>
 <4e840768-0315-6241-e988-9a3165a31a86@roeck-us.net>
In-Reply-To: <4e840768-0315-6241-e988-9a3165a31a86@roeck-us.net>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.3 (3.40.3-1.fc34) 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c359df0c-c24e-4a12-ed55-08d95859ddc5
x-ms-traffictypediagnostic: SA0PR11MB4528:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4528588371D51EE60F3021A9ECF29@SA0PR11MB4528.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ciIrNJB+LaJYvGF60XTvcRfMc+I+K8g5mPkh+jS86hIelgeDaEtOlB8Ifaca+WiOby2UdJdrG2bh6yv1kumIP1zqOrZHEzHRW4odvuYrcdw1GWZdGp9FfUsP18cIovT1f1IvKNyrAS2Ul+5Whoj2HXMA03ddrtwkPUjeoXz2HBYqFGOVOFujxY4yEO7YZer84ZbcoKJIyrTq/knj77mZnFVckxQYMQn/XkxoGEfjux/xUnHIawy7kVV0d/xuJne9xXgZcxaH5hBF5kdAhZ64TgJZw0nIt9wMkJRRN1CLmGMHCVv/SYwQDQo2Ch5f/iPeuvuAFuobCBnwCqJtMJCCOtLJZW56uxNbb6NRdPa8WsPDlgusl6j9iIRQoDfJdOi5snMX4tC1YrAO+N0/0t81MgkrYPjAFVfIZQM3mqPsLRWZo/DRfLorN87aSJLXQDnXCXzzvFUGxLjeGTYCuNoYPht5zxFQEGHiq5U7KNLvXG2HUlNMUW8l79o3wG6f/H06T+NmhXpB06Kwu0LA4dyRxCdd0gLOlQ8Iyr1111J7mNWI1XVykBvslLJxLXlGgs5uB32krbekKqGfkXwqunNnYS6kNTIZ6cGUwzdNeS5z/49gFY8m+c9kWYr6NYVrSIeug5+FjZrYv9ETpbPjh0wQPniLRYZXYNPqns++vCJDeF4A49lqgSOpjLLE31A3O99OkuP4HKWdzsjywXkdaiFiVUK4thQ66BpWpEqnV9fTW5zu2o+bUVKT3ypogjzHdFfWLBFKkdnjC15XpEwrjs8mZbLa6uJ5wWmOkpa8pgVnuLmAaHE6y8e/jcRYlcsBM22rIsIjiCGLcyZcqP76RDH/YjMEXvi8YY9hmKWJ/QzVOPMG9afT5U/FGRaXrJmFcfNj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(6486002)(86362001)(8936002)(36756003)(8676002)(4326008)(7416002)(478600001)(966005)(83380400001)(71200400001)(54906003)(5660300002)(2616005)(6512007)(110136005)(19273905006)(316002)(122000001)(2906002)(38100700002)(38070700005)(53546011)(6506007)(66946007)(186003)(66556008)(66446008)(64756008)(66476007)(76116006)(26005)(91956017)(562404015)(563064011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWtkd090cklaVm5VaHRhYXFhV1EyV1FPdjFqcitWWjhxcCtMMGpYUUUrQmVK?=
 =?utf-8?B?cllHbWVyTTNYakNFc2xpeUFpcXRLWXdTTmRacGs3RTZTY2dxUVg0a3kzUHRE?=
 =?utf-8?B?Zm9wOTBjSGhSdU5WL0M5WlpScHk0MG5DNnhYVVI3MmJUUFFCbTY2eHhxTFR5?=
 =?utf-8?B?YTdVdzhFclMwVE00R0VFbGJYa2ZFc3QzZlhRY252NTM1NFhiRGF5TndWZEJs?=
 =?utf-8?B?UDB2WHo3VllSam5MK2F0UDFxdWhDQnU1ZG9MaG9oTXdSS1lpKzB1clZWSGJy?=
 =?utf-8?B?TW5FOGlmRTJ0elNsZ0lIbVdrL1hKdUlkZnRVVlV5MVlFOTBlN3RyR0NtdjFC?=
 =?utf-8?B?eVlkbmtlZFZ3a3pTeDhlVzVSSnNmbFZldVFtUlNQY0RKbWFPMVJUVjZ5NDZo?=
 =?utf-8?B?RjJLOXdJQXZtQmdxZUsrbnluZE84UW5iZjBKODFUajc2ODZUS25PVnFNaDgv?=
 =?utf-8?B?N09WejVMMGZTVVNoeU9jV21vU2ZsUkk5Z1NaTmREWDM1SVY1TWNuZDFOdHg5?=
 =?utf-8?B?dTFWZTdxOUVpS0tEQjg2QU1SWHVoczQ0dk5TbW1Mb0ZtOVg0eDJjM2pzK2Jl?=
 =?utf-8?B?blMxM09kMzRMSUtsRFhSQ2JZSlRTWTVYTUptTU1yMjJzeEFMaUpUSnhuRUk5?=
 =?utf-8?B?eDhjbzBybnplcGNmaHNPYy9QTFZ2YlNkSFRxL2JHOFNTbHh3dEN6QUVucUYv?=
 =?utf-8?B?UldmNGxET21XN0tnYnpSZHUvK0pRd2FzbU5GZlJQMjhrTjdMcm9JM2phcDY2?=
 =?utf-8?B?QU9lZkRYLzBqM29BU0lrWkJuTWJ5Q2RIN283eEZvVWFGWXRLdzFFNzV3dCtG?=
 =?utf-8?B?dzB6d3FKY2c0bnZqVUYvejBQZzhGSDNMdDM1T25sTUxCTjY1QnQwbk5sclNt?=
 =?utf-8?B?elZ3M3gwenRBMEI2cjZOMlROWnpZd2F5aEd6a093QUV4ZlJvb0JYN3c3RUpS?=
 =?utf-8?B?VUliUERCMlYwcXh0cEt6eU5LNk9vRmJsOU1tcXZBRlV0WWNUMGMvNkRwaDRu?=
 =?utf-8?B?Z3FqSFYxQ0w3NWdFZ25SSVhmckg4dW92Tzc0REVXSC9sbDFqc0krcmFYNEVy?=
 =?utf-8?B?V1NWUmNTNkpEUG1ad1h4ZEIrWm4reFRzbzc0WGRrRklEV0JienRoczZZMFFL?=
 =?utf-8?B?OEdtY0wxR1poWWw2UkUzRzJ1NmIwOXdPWVpkSzV0ZnNjQUt3QndXZlBaMm4r?=
 =?utf-8?B?YlVpRkxMUDFqOVhERUI2REZDaHBxR3hGbVduT2xzbXltdzI0ZzBmbVVxZ081?=
 =?utf-8?B?L2NqdHprczhQV2ptclVvVkRqUEEzdjZETm90VDI2QVUxQzdYUU80Y3ZqYlBF?=
 =?utf-8?B?RXhLeU00SDBlL2liZDlNdHZFNklDQWlpekpabWxwNzNVL2lTYUJTc2NYOTN3?=
 =?utf-8?B?SjR2NFdVVXZGZWtCdGtWYjdmRUdiQi81bERyaElLN2dlejNIOTREWS9vLzdi?=
 =?utf-8?B?dnhnS0p0UHZJZkk5cHMxaHVxVE85Rm1qWnJsNnFtTGlDV2dUa0o5RTcvMXNX?=
 =?utf-8?B?TnlzZ3F3VkNEZ3hyT05reWhUc2JSK3RpZytaOEpXdndVRTdjRnFrWEFEV3Fk?=
 =?utf-8?B?YThCSjlaeHd4RDVFLzNhaU1BK2VqT0VxMVoyNDU3c3Y0MFcva2gwZFhMQkEv?=
 =?utf-8?B?b2QzcVpuczhQTHBGejgrSld2MG9Sc0tGdEd5cUdaYWtnRVdxbjRsNUpTRTlS?=
 =?utf-8?B?OVRzZzZGejl3b2NzUkZkNTZmbStndFFjTzJjdkduc09sR1hRMjluTmpxZVhx?=
 =?utf-8?Q?VGU0e1l0rbsaZHPcob/pcGo5OeZDg4eNi7+8ib1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29BC7A1082024A4D93656F98E2262406@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c359df0c-c24e-4a12-ed55-08d95859ddc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 21:42:04.3796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+XlS4w2FLI0alY44n5MeXnBAmR332kw/U/Lx4k29L4Gt0omU9H4cFE5mFyhWL5fnVzPKHqqiubfsX6lHtWH3sCsBoy5qghyIwIkOzQrcs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

T24gV2VkLCAyMDIxLTA4LTA0IGF0IDExOjA1IC0wNzAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiA4LzQvMjEgMTA6NTIgQU0sIFpldiBXZWlzcyB3cm90ZToNCj4gPiBPbiBNb24sIEF1ZyAw
MiwgMjAyMSBhdCAwNjozNzozMEFNIENEVCwgV2luaWFyc2thLCBJd29uYSB3cm90ZToNCj4gPiA+
IE9uIFR1ZSwgMjAyMS0wNy0yNyBhdCAyMjo1OCArMDAwMCwgWmV2IFdlaXNzIHdyb3RlOg0KPiA+
ID4gPiBPbiBNb24sIEp1bCAxMiwgMjAyMSBhdCAwNTowNDo0NlBNIENEVCwgSXdvbmEgV2luaWFy
c2thIHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxp
bnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBZGQgZG9jdW1lbnRhdGlvbiBm
b3IgcGVjaS1jcHV0ZW1wIGRyaXZlciB0aGF0IHByb3ZpZGVzIERUUyB0aGVybWFsDQo+ID4gPiA+
ID4gcmVhZGluZ3MgZm9yIENQVSBwYWNrYWdlcyBhbmQgQ1BVIGNvcmVzIGFuZCBwZWNpLWRpbW10
ZW1wIGRyaXZlciB0aGF0DQo+ID4gPiA+ID4gcHJvdmlkZXMgRFRTIHRoZXJtYWwgcmVhZGluZ3Mg
Zm9yIERJTU1zLg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVu
IFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiBDby1kZXZlbG9w
ZWQtYnk6IEl3b25hIFdpbmlhcnNrYSA8aXdvbmEud2luaWFyc2thQGludGVsLmNvbT4NCj4gPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBJd29uYSBXaW5pYXJza2EgPGl3b25hLndpbmlhcnNrYUBpbnRl
bC5jb20+DQo+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0DQo+ID4g
PiA+ID4gPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiBEb2N1bWVudGF0aW9uL2h3bW9uL2luZGV4LnJzdMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDIgKw0KPiA+ID4gPiA+IERvY3VtZW50YXRpb24vaHdtb24vcGVjaS1jcHV0ZW1wLnJz
dMKgIHwgOTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gRG9jdW1lbnRh
dGlvbi9od21vbi9wZWNpLWRpbW10ZW1wLnJzdCB8IDU4ICsrKysrKysrKysrKysrKysrDQo+ID4g
PiA+ID4gTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICsNCj4gPiA+ID4gPiA0IGZpbGVzIGNoYW5nZWQsIDE1NSBpbnNl
cnRpb25zKCspDQo+ID4gPiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vaHdt
b24vcGVjaS1jcHV0ZW1wLnJzdA0KPiA+ID4gPiA+IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2h3bW9uL3BlY2ktZGltbXRlbXAucnN0DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vaHdtb24vaW5kZXgucnN0DQo+ID4gPiA+ID4gYi9Eb2N1
bWVudGF0aW9uL2h3bW9uL2luZGV4LnJzdA0KPiA+ID4gPiA+IGluZGV4IGJjMDE2MDFlYTgxYS4u
Y2M3NmI1YjNmNzkxIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vaHdtb24v
aW5kZXgucnN0DQo+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9od21vbi9pbmRleC5yc3QN
Cj4gPiA+ID4gPiBAQCAtMTU0LDYgKzE1NCw4IEBAIEhhcmR3YXJlIE1vbml0b3JpbmcgS2VybmVs
IERyaXZlcnMNCj4gPiA+ID4gPiDCoMKgwqAgcGNmODU5MQ0KPiA+ID4gPiA+IMKgwqDCoCBwaW00
MzI4DQo+ID4gPiA+ID4gwqDCoMKgIHBtNjc2NHRyDQo+ID4gPiA+ID4gK8KgwqAgcGVjaS1jcHV0
ZW1wDQo+ID4gPiA+ID4gK8KgwqAgcGVjaS1kaW1tdGVtcA0KPiA+ID4gPiA+IMKgwqDCoCBwbWJ1
cw0KPiA+ID4gPiA+IMKgwqDCoCBwb3dyMTIyMA0KPiA+ID4gPiA+IMKgwqDCoCBweGUxNjEwDQo+
ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vaHdtb24vcGVjaS1jcHV0ZW1wLnJz
dA0KPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9od21vbi9wZWNpLWNwdXRlbXAucnN0DQo+ID4g
PiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmQzYTIxOGJhODEwYQ0KPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2h3bW9uL3BlY2ktY3B1dGVtcC5yc3QNCj4gPiA+ID4gPiBAQCAtMCwwICsx
LDkzIEBADQo+ID4gPiA+ID4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK0tlcm5lbCBkcml2ZXIgcGVjaS1jcHV0ZW1wDQo+
ID4gPiA+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ICtTdXBwb3J0ZWQgY2hpcHM6DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgT25lIG9mIElu
dGVsIHNlcnZlciBDUFVzIGxpc3RlZCBiZWxvdyB3aGljaCBpcyBjb25uZWN0ZWQgdG8gYQ0KPiA+
ID4gPiA+IFBFQ0kNCj4gPiA+ID4gPiBidXMuDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCogSW50ZWwgWGVvbiBFNS9FNyB2MyBzZXJ2ZXIgcHJvY2Vzc29ycw0KPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50
ZWwgWGVvbiBFNS0xNHh4IHYzIGZhbWlseQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBFNS0yNHh4IHYzIGZhbWlseQ0K
PiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
SW50ZWwgWGVvbiBFNS0xNnh4IHYzIGZhbWlseQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBFNS0yNnh4IHYzIGZhbWls
eQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgSW50ZWwgWGVvbiBFNS00Nnh4IHYzIGZhbWlseQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBFNy00OHh4IHYzIGZh
bWlseQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgSW50ZWwgWGVvbiBFNy04OHh4IHYzIGZhbWlseQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAqIEludGVsIFhlb24gRTUvRTcgdjQgc2VydmVyIHByb2Nlc3Nv
cnMNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoEludGVsIFhlb24gRTUtMTZ4eCB2NCBmYW1pbHkNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEludGVsIFhlb24gRTUtMjZ4eCB2NCBm
YW1pbHkNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoEludGVsIFhlb24gRTUtNDZ4eCB2NCBmYW1pbHkNCj4gPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEludGVsIFhlb24gRTctNDh4eCB2
NCBmYW1pbHkNCj4gPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoEludGVsIFhlb24gRTctODh4eCB2NCBmYW1pbHkNCj4gPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKiBJbnRlbCBYZW9uIFNjYWxhYmxlIHNlcnZlciBwcm9j
ZXNzb3JzDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBJbnRlbCBYZW9uIEQgZmFtaWx5DQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJbnRlbCBYZW9uIEJyb256ZSBmYW1pbHkNCj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoElu
dGVsIFhlb24gU2lsdmVyIGZhbWlseQ0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVvbiBHb2xkIGZhbWlseQ0KPiA+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgSW50ZWwgWGVv
biBQbGF0aW51bSBmYW1pbHkNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKg
RGF0YXNoZWV0OiBBdmFpbGFibGUgZnJvbQ0KPiA+ID4gPiA+IGh0dHA6Ly93d3cuaW50ZWwuY29t
L2Rlc2lnbi9saXRlcmF0dXJlLmh0bQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArQXV0aG9yOiBK
YWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ICtEZXNjcmlwdGlvbg0KPiA+ID4gPiA+ICstLS0tLS0tLS0tLQ0KPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiArVGhpcyBkcml2ZXIgaW1wbGVtZW50cyBhIGdlbmVyaWMgUEVDSSBod21v
biBmZWF0dXJlIHdoaWNoIHByb3ZpZGVzDQo+ID4gPiA+ID4gRGlnaXRhbA0KPiA+ID4gPiA+ICtU
aGVybWFsIFNlbnNvciAoRFRTKSB0aGVybWFsIHJlYWRpbmdzIG9mIHRoZSBDUFUgcGFja2FnZSBh
bmQgQ1BVDQo+ID4gPiA+ID4gY29yZXMgdGhhdA0KPiA+ID4gPiA+IGFyZQ0KPiA+ID4gPiA+ICth
Y2Nlc3NpYmxlIHZpYSB0aGUgcHJvY2Vzc29yIFBFQ0kgaW50ZXJmYWNlLg0KPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiArQWxsIHRlbXBlcmF0dXJlIHZhbHVlcyBhcmUgZ2l2ZW4gaW4gbWlsbGlkZWdy
ZWUgQ2Vsc2l1cyBhbmQgd2lsbCBiZQ0KPiA+ID4gPiA+IG1lYXN1cmFibGUNCj4gPiA+ID4gPiAr
b25seSB3aGVuIHRoZSB0YXJnZXQgQ1BVIGlzIHBvd2VyZWQgb24uDQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICtTeXNmcyBpbnRlcmZhY2UNCj4gPiA+ID4gPiArLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiA+ID4g
PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQo+ID4gPiA+ID4gK3RlbXAxX2xhYmVswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIkRpZSINCj4g
PiA+ID4gPiArdGVtcDFfaW5wdXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQcm92aWRlcyBjdXJy
ZW50IGRpZSB0ZW1wZXJhdHVyZSBvZiB0aGUgQ1BVDQo+ID4gPiA+ID4gcGFja2FnZS4NCj4gPiA+
ID4gPiArdGVtcDFfbWF4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFByb3ZpZGVzIHRoZXJt
YWwgY29udHJvbCB0ZW1wZXJhdHVyZSBvZiB0aGUNCj4gPiA+ID4gPiBDUFUNCj4gPiA+ID4gPiBw
YWNrYWdlDQo+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB3aGljaCBpcyBhbHNvIGtub3duIGFzIFRjb250cm9sLg0KPiA+ID4gPiA+ICt0ZW1w
MV9jcml0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBQcm92aWRlcyBzaHV0ZG93biB0ZW1wZXJh
dHVyZSBvZiB0aGUgQ1BVDQo+ID4gPiA+ID4gcGFja2FnZQ0KPiA+ID4gPiA+IHdoaWNoDQo+ID4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpcyBh
bHNvIGtub3duIGFzIHRoZSBtYXhpbXVtIHByb2Nlc3Nvcg0KPiA+ID4gPiA+IGp1bmN0aW9uDQo+
ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0
ZW1wZXJhdHVyZSwgVGptYXggb3IgVHByb2Nob3QuDQo+ID4gPiA+ID4gK3RlbXAxX2NyaXRfaHlz
dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUHJvdmlkZXMgdGhlIGh5c3RlcmVzaXMg
dmFsdWUgZnJvbQ0KPiA+ID4gPiA+IFRjb250cm9sDQo+ID4gPiA+ID4gdG8gVGptYXggb2YNCj4g
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRo
ZSBDUFUgcGFja2FnZS4NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gK3RlbXAyX2xhYmVswqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIkRUUyINCj4gPiA+ID4gPiArdGVtcDJfaW5wdXTCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBQcm92aWRlcyBjdXJyZW50IERUUyB0ZW1wZXJhdHVyZSBvZiB0aGUgQ1BV
DQo+ID4gPiA+ID4gcGFja2FnZS4NCj4gPiA+ID4gDQo+ID4gPiA+IFdvdWxkIHRoaXMgYmUgYSBn
b29kIHBsYWNlIHRvIG5vdGUgdGhlIHNsaWdodGx5IGNvdW50ZXItaW50dWl0aXZlIG5hdHVyZQ0K
PiA+ID4gPiBvZiBEVFMgcmVhZGluZ3M/wqAgaS5lLiBhZGQgc29tZXRoaW5nIGFsb25nIHRoZSBs
aW5lcyBvZiAiVGhlIERUUyBzZW5zb3INCj4gPiA+ID4gcHJvZHVjZXMgYSBkZWx0YSByZWxhdGl2
ZSB0byBUam1heCwgc28gbmVnYXRpdmUgdmFsdWVzIGFyZSBub3JtYWwgYW5kDQo+ID4gPiA+IHZh
bHVlcyBhcHByb2FjaGluZyB6ZXJvIGFyZSBob3QuIsKgIChJbiBteSBleHBlcmllbmNlIHBlb3Bs
ZSB3aG8gYXJlbid0DQo+ID4gPiA+IGFscmVhZHkgZmFtaWxpYXIgd2l0aCBpdCB0ZW5kIHRvIHRo
aW5rIHNvbWV0aGluZydzIHdyb25nIHdoZW4gYSBDUFUNCj4gPiA+ID4gdGVtcGVyYXR1cmUgcmVh
ZGluZyBzaG93cyAtNTBDLikNCj4gPiA+IA0KPiA+ID4gSSBiZWxpZXZlIHRoYXQgd2hhdCB5b3Un
cmUgcmVmZXJyaW5nIHRvIGlzIGEgcmVzdWx0IG9mICJHZXRUZW1wIiwgYW5kDQo+ID4gPiB3ZSdy
ZQ0KPiA+ID4gdXNpbmcgaXQgdG8gY2FsY3VsYXRlICJEaWUiIHNlbnNvciB2YWx1ZXMgKHRlbXAx
KS4NCj4gPiA+IFRoZSBzZW5zb3IgdmFsdWUgaXMgYWJzb2x1dGUgLSB3ZSBkb24ndCBleHBvc2Ug
InJhdyIgdGhlcm1hbCBzZW5zb3IgdmFsdWUNCj4gPiA+IChkZWx0YSkgYW55d2hlcmUuDQo+ID4g
PiANCj4gPiA+IERUUyBzZW5zb3IgaXMgZXhwb3NpbmcgdGVtcGVyYXR1cmUgdmFsdWUgc2NhbGVk
IHRvIGZpdCBEVFMgMi4wIHRoZXJtYWwNCj4gPiA+IHByb2ZpbGU6DQo+ID4gPiBodHRwczovL3d3
dy5pbnRlbC5jb20vY29udGVudC93d3cvdXMvZW4vcHJvY2Vzc29ycy94ZW9uL3NjYWxhYmxlL3hl
b24tc2NhbGFibGUtdGhlcm1hbC1ndWlkZS5odG1sDQo+ID4gPiAoc2VjdGlvbiA1LjIuMy4yKQ0K
PiA+ID4gDQo+ID4gPiBTaW1pbGFyIHRvICJEaWUiIHNlbnNvciAtIGl0J3MgYWxzbyBleHBvc2Vk
IGluIGFic29sdXRlIGZvcm0uDQo+ID4gPiANCj4gPiA+IEknbGwgdHJ5IHRvIGNoYW5nZSBkZXNj
cmlwdGlvbiB0byBhdm9pZCBjb25mdXNpb24uDQo+ID4gPiANCj4gPiANCj4gPiBXaGVuIEkgdGVz
dGVkIHRoZSBwYXRjaCBzZXJpZXMgYnkgYXBwbHlpbmcgaXQgdG8gbXkgT3BlbkJNQyBrZXJuZWws
IHRoZQ0KPiA+IHRlbXAyX2lucHV0IHN5c2ZzIGZpbGUgcHJvZHVjZWQgbmVnYXRpdmUgbnVtYmVy
cyAoYXMgaGFzIGJlZW4gdGhlIGNhc2UNCj4gPiB3aXRoIHByZXZpb3VzIGl0ZXJhdGlvbnMgb2Yg
dGhlIFBFQ0kgcGF0Y2hzZXQpLsKgIElzIHRoYXQgZXhwZWN0ZWQ/wqAgRnJvbQ0KPiA+IHdoYXQg
R3VlbnRlciBoYXMgc2FpZCBpdCBzb3VuZHMgbGlrZSB0aGF0J3MgZ29pbmcgdG8gbmVlZCB0byBj
aGFuZ2Ugc28NCj4gPiB0aGF0IHRoZSB0ZW1wZXJhdHVyZSByZWFkaW5ncyBhcmUgYWxsIGluICJu
b3JtYWwiIG1pbGxpZGVncmVlcyBDDQo+ID4gKHRoYXQgaXMsIHJlbGF0aXZlIHRvIHRoZSBmcmVl
emluZyBwb2ludCBvZiB3YXRlcikuDQo+ID4gDQo+IA0KPiBDb3JyZWN0LCB0aGUgdGVtcGVyYXR1
cmUgaXMgZXhwZWN0ZWQgdG8gYmUgcmVwb3J0ZWQgaW4gbWlsbGlkZWdyZWVzIEMNCj4gcGVyIGh3
bW9uIEFCSS4gRXZlcnl0aGluZyBlbHNlIGlzIHVuYWNjZXB0YWJsZS4gVGhhdCBtYWtlcyBtZSB3
b25kZXIgd2hhdA0KPiAicmF3IiBhbmQgImFic29sdXRlIiBtZWFucy4gTmVnYXRpdmUgbnVtYmVy
cyBzdWdnZXN0IHRoYXQsIHdoYXRldmVyIGlzDQo+IHJlcG9ydGVkIHRvZGF5LCBpdCBpcyBub3Qg
bWlsbGlkZWdyZWVzIEMuDQoNCkxldCdzIHNheSB3ZSBoYXZlIHR3byB2YWx1ZXM6ICJiYXNlIiBh
bmQgImRlbHRhIi4gQm90aCBhcmUgaW4gbWlsaWRlZ3JlZXMgQy4NCiJhYnNvbHV0ZSIgbWVhbnMg
dGhhdCB0aGUgc2Vuc29yIHZhbHVlIGV4cG9zZWQgdG8gdXNlcnNwYWNlIGlzIGNhbGN1bGF0ZWQg
YXM6DQpiYXNlIC0gZGVsdGEgKG9yIGJhc2UgKyBkZWx0YSwgZGVwZW5kaW5nIG9uIHNlbnNvciku
DQoicmVsYXRpdmUiIHdvdWxkIG1lYW4gdGhhdCB3ZSBleHBvc2UgImRlbHRhIiB0byB1c2Vyc3Bh
Y2UgYXMgc2Vuc29yIHZhbHVlLg0KDQpGb3IgcGVjaS1jcHV0ZW1wIChhbmQgZGltbXRlbXApIHdl
J3JlIGV4cG9zaW5nIHNlbnNvcnMgaW4gImFic29sdXRlIiBmb3JtLg0KDQpJIGNvbnRhY3RlZCBa
ZXYgYW5kIHdlIGZvdW5kIHRoYXQgdGhlIHBsYXRmb3JtIGhlIHVzZXMgaGFzIGEgZGlmZmVyZW50
IGZvcm1hdA0KZm9yIHRoZSAicmF3IiB2YWx1ZSAoImRlbHRhIiBpbiB0aGUgZXhhbXBsZSBhYm92
ZSkgb2YgdGhpcyBwYXJ0aWN1bGFyIHNlbnNvcg0KKFM4LjggaW5zdGVhZCBvZiBTMTAuNiksIHdo
aWNoIG1lYW5zIHRoYXQgd2UncmUgc3VidHJhY3Rpbmcgc2lnbmlmaWNhbnRseSBsYXJnZXINCm51
bWJlciB0aGFuIHdlIHNob3VsZCwgcmVzdWx0aW5nIGluIHNlbnNvciBnb2luZyBpbnRvIG5lZ2F0
aXZlLg0KDQpPbiB0aGUgcGxhdGZvcm0gSSdtIHVzaW5nIGZvciBkZXZlbG9wbWVudCBwdXJwb3Nl
LCBzYW1wbGluZyBEaWUgYW5kIERUUyB2YWx1ZXMNCnJldHVybmVkOg0KRGllIDI2MzQ0DQpEVFMg
MjYzMjkNCg0KVGhlIHBsYXRmb3JtIHRoYXQgWmV2IHVzZWQgaXMgY3VycmVudGx5IG5vdCBzdXBw
b3J0ZWQgYnkgcGVjaS1jcHUsIGhvd2V2ZXIsIEkNCndlbnQgdGhyb3VnaCB0aGUgc3BlY3MsIGFu
ZCBpdCBsb29rcyBsaWtlIHNvbWUgb2YgdGhlIG9sZGVyIHN1cHBvcnRlZCBwbGF0Zm9ybXMNCmFy
ZSBhbHNvIHVzaW5nIFM4LjguDQpJJ2xsIGZpeCB0aGlzIGluIHYzLg0KDQpUaGFua3MNCi1Jd29u
YQ0KDQo+IA0KPiBHdWVudGVyDQoNCg==
