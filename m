Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94462EEBB8
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 04:11:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBp5j6T7gzDqym
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 14:11:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febe::72d;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBp4W4DSjzDqHJ;
 Fri,  8 Jan 2021 14:10:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acSWBhDWTMCs69nNdMCEiQEg2L/3f7IiEuvyMJNIWx8Ovsd6OIgzJ7ARs3oxblci28bhFTaw2+rfWkUASDbvUGvLmO0TypOWOls3c/CbWLzQSXOxB0PgoWlGr42JzmpYP/5ujwQZxBA81JL8qlwL96B0VBnopXB0v5O8nNQkzr1Itm4TZJNV1mmWZsw7iyJezl+7h6S/s4YbeKDM3ZdRo+J5wPPgPhnmT4ZJ2WjqSgGrGIErnNTNIafv1b3biIuNeAAkCeE60gyUJ2QU40funwYYwOUvbhufBG/2BLJ1NXIQ7xHVWzJvqoZ9Xwqp8q5KkpxekpJdxxdCBpR0mWK6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC+g1bYci61JGoZRWR/JfMHXoffaLuyFKlB4y2aD4D8=;
 b=IHmRBg5VHlZfOFq6gLrRqOOOGmWCUVr5cnyiyJdattJcn1PDg/YM8RuTgPe3DJwhtT8bKp8eKKax8Jz5tSux3Phoz3PXY2bukMs4SmUiRflANyHOVZC3OlCMB9n3pz53g4Y1kDb0awyFP2LxNM1KEzvhhifrkernK58Egmju60OIQp5cSCMjN7D2ZlQaj0OjHdXT6T+41XQBu8khoCPj9LHjVjGZeXeIXZDtptAkCrokXzfwp3leFm3YEs7N5Q8Q2nRVdabB7ugSnOCF8xYgvjxLX5o+kKr8NwDL2mz7RDgRU/VWLr6goBJ7dKvXDtLadxY7I98mU+7XDzZ5tas/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK2PR06MB3316.apcprd06.prod.outlook.com (2603:1096:202:35::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 03:09:41 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::116:1437:5d9a:16e9]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::116:1437:5d9a:16e9%6]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 03:09:40 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, ChiaWei Wang <chiawei_wang@aspeedtech.com>, 
 Jeremy Kerr <jk@codeconstruct.com.au>
Subject: RE: [PATCH 5/6] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH 5/6] soc: aspeed: Add eSPI driver
Thread-Index: AQHW4/EGo2juxEGsxECEBhTTs+UwgqoaukYAgAC5fYCAAZjpAIAAAiZw
Date: Fri, 8 Jan 2021 03:09:40 +0000
Message-ID: <HK0PR06MB3380BD8A5BB1B1E7CB466C9BF2AE0@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-6-chiawei_wang@aspeedtech.com>
 <20210106153202.GA2258036@robh.at.kernel.org>
 <HK0PR06MB377987E19F57E53CC4F32FF991AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <CACPK8XfCpUDXi-e1Sh1t+wm_-vXNihRchkmQby7fUXi0mCdMwA@mail.gmail.com>
In-Reply-To: <CACPK8XfCpUDXi-e1Sh1t+wm_-vXNihRchkmQby7fUXi0mCdMwA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bf9564c-645f-48db-887d-08d8b382d70d
x-ms-traffictypediagnostic: HK2PR06MB3316:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB3316AB505A233E33403FDADFF2AE0@HK2PR06MB3316.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lfTOqR8kE8RBAu/slFWHstr77DuuKrWCRsvmdf8APwEdEXNtd8sQTxgXknJt61FYZmnTrl8UxQ7/WS6LO/ayGDDSZTqU88uKQuRVIYSpYiBDwCnyhL03xhBi6HIETHgDlabRywwBW0j7hgAZwMBrUoY//9dZreYkQ/Of63q+WCzuiQDXqNxi5q7rruRhwaic6Z8wINQsGoI32A+tr1sZaN4F+P966xYurbtJfht3sXJr4UAo5sbSQGaGjgZEAiqGokly0vRGIPlycKlRxcM9HK2/jl9ItjYjFZ/QxmDZXHTcQTaRrf7FNXGljkZuf5yUEReSA5soZy6uMf1Th1H3imoZpRZVLCDXboZehyIfivSzUDeJg6EfHhigZmL1yM8T5sNVDLDuJudsvIPqL+pGpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(376002)(136003)(39840400004)(316002)(7696005)(54906003)(52536014)(110136005)(66446008)(83380400001)(478600001)(5660300002)(66476007)(64756008)(33656002)(66946007)(66556008)(8936002)(76116006)(86362001)(2906002)(26005)(55016002)(55236004)(107886003)(71200400001)(4326008)(53546011)(6506007)(8676002)(9686003)(7416002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?a0ZqUGhoSjE5TkU0ZDU4TWVDNjUxRmdmdlFJR2VTc2RubzNwMmk5Q3c3Z3NF?=
 =?utf-8?B?WUh2UmQvdm8vbkZxekJvQlMrOFJZWXB6ejBvR3JnRktvSUJHUnBvMnFCOVBz?=
 =?utf-8?B?VUVqcE5JS2h4ZkFkblZVQU1mbmVEa3ZySDdvYk9Td1hEUlJLMnQ0bU9KazEy?=
 =?utf-8?B?YWJYR1BGeVN1M3o3ODZNSTF1VVBBdzBQQnMrNHRWOHVOekk0VkVuVWtPQURV?=
 =?utf-8?B?clp5YTN6TmxETklmUnZmSU1jT3BzTzRhSUQ2MkQ0QmtCaFJaYWdkdFFjbEZn?=
 =?utf-8?B?OEVUTVRWQklQNUhqM1dRQjBuSDZodmx1TERVQVRSRGhCRktTQW82MmdxaVcy?=
 =?utf-8?B?azA3dmc4ckkvcEVlTWtpVFVPSE81RVdCcXhXZmx0RHllR0M4ZnJVR2IxTmE5?=
 =?utf-8?B?dytKWmZJdTF2ZnJvcEFmaWtlTWlWYldqTTBDVzlvbFE5cGhVK05JaGNWSEFz?=
 =?utf-8?B?UE9VZ1lDa2hHMlB0SExlUW5hN0wrenZQVzYrMmlhNTR4bWpZNlJLV0xuakNF?=
 =?utf-8?B?MVNkYndSZVhBS1dnN2ZLTXZHTURSU2tDbkJtMWlUT3U0ZEREUFFMMDEvdzZG?=
 =?utf-8?B?VW8xSGUyWTlJSy9PeGcyR1VGN0JMeTZrUXdTMWJJZEpMbTBNMzVlZUNmV0Fw?=
 =?utf-8?B?Tm5lTFhhOS9aREdCYVlFZUlWd2k3bkNXUTZ5VUp6cXQzR0pVRjdMa3p2dThp?=
 =?utf-8?B?eE1yRjVYcWlPTG5QNmNkYUtyVCtGUXR2dDN0WUs3U0ZwSWFWd3NJMlJMMUZy?=
 =?utf-8?B?a0w2VlJBcVhXeU1nbWhpK2svNERWQUJUVmNUTWRjb0V4bWhrTFpiYlNYaE9w?=
 =?utf-8?B?QXM4Q3lPMFg2d0UrVWIwZ0FRNWFXNThqQjQ2aE9RTVpqVzVyRm1FTTBEZm81?=
 =?utf-8?B?MVErVXczdmk3ZHRFRUhEMjc2aGFJV2p3ak82SVQ3RWI2M2JNWG1OVmNBTk1u?=
 =?utf-8?B?cU1zY2ZxcE5jN09IRVNtZWtuL1ltZVJGWjc0SWZ1TCtpVkNzYmc1Zkh4bjcw?=
 =?utf-8?B?MmJsbHhPOUsxYkU0SEFyaEdLWXBIa1g1U3V4cGpreGdtSHU3eDUrNEhaNHR0?=
 =?utf-8?B?Vk1iMGNBOHNlaUYrSFlnUE5PSkd6MWhyN3IvV1JlenFVRVlZRThZc1FtTTZT?=
 =?utf-8?B?REdVQXNFR1V1dlgyTm9KT0wzRENXb1dKWUdpNjZBV0k0bEt6Nk5NalMzblRn?=
 =?utf-8?B?aDJUcmdLNHBkZllLUG5VMEx1aWM5TzdXMFc5RnE5VU9jcWRkeCtGbWg3c2h5?=
 =?utf-8?B?R05YNmdYczFIQ0tvcEJnTjFESloxYTUzTWUwKzVpalpGVjA1eWdTR1hZZ2ZQ?=
 =?utf-8?Q?zykcE2dpGLXp0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf9564c-645f-48db-887d-08d8b382d70d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 03:09:40.7304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoWLovnHeet+iaKpSYu8aHj+wmG93PWGZ5S/OLPvm5fg21ohEh0Yxb8UlgxIlQ0VxSeiKEF4/aJ9sxSqVXGMRkxE8MAZEJ84Y6CGUHzvoBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3316
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
Cc: Rob Herring <robh@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "maz@kernel.org" <maz@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 BMC-SW <BMC-SW@aspeedtech.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1Pg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgOCwgMjAyMSAxMDo1OSBBTQ0KPiBU
bzogQ2hpYVdlaSBXYW5nIDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+OyBKZXJlbXkgS2Vy
cg0KPiA8amtAY29kZWNvbnN0cnVjdC5jb20uYXU+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPjsgYW5kcmV3QGFqLmlkLmF1OyB0Z2x4QGxpbnV0cm9uaXguZGU7DQo+IG1hekBr
ZXJuZWwub3JnOyBwLnphYmVsQHBlbmd1dHJvbml4LmRlOyBsaW51eC1hc3BlZWRAbGlzdHMub3ps
YWJzLm9yZzsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBCTUMtU1cNCj4gPEJNQy1TV0Bhc3BlZWR0ZWNoLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCA1LzZdIHNvYzogYXNwZWVkOiBBZGQgZVNQSSBkcml2ZXIN
Cj4gDQo+IE9uIFRodSwgNyBKYW4gMjAyMSBhdCAwMjozOSwgQ2hpYVdlaSBXYW5nDQo+IDxjaGlh
d2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgUm9iLA0KPiA+DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSA2LCAyMDIx
IDExOjMyIFBNDQo+ID4gPiBUbzogQ2hpYVdlaSBXYW5nIDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVj
aC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDUvNl0gc29jOiBhc3BlZWQ6IEFkZCBl
U1BJIGRyaXZlcg0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgSmFuIDA2LCAyMDIxIGF0IDAxOjU5OjM4
UE0gKzA4MDAsIENoaWEtV2VpLCBXYW5nIHdyb3RlOg0KPiA+ID4gPiBUaGUgQXNwZWVkIGVTUEkg
Y29udHJvbGxlciBpcyBzbGF2ZSBkZXZpY2UgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUNCj4gPiA+
ID4gbWFzdGVyIHRocm91Z2ggdGhlIEVuaGFuY2VkIFNlcmlhbCBQZXJpcGhlcmFsIEludGVyZmFj
ZSAoZVNQSSkuDQo+ID4gPiA+IEFsbCBvZiB0aGUgZm91ciBlU1BJIGNoYW5uZWxzLCBuYW1lbHkg
cGVyaXBoZXJhbCwgdmlydHVhbCB3aXJlLA0KPiA+ID4gPiBvdXQtb2YtYmFuZCwgYW5kIGZsYXNo
IGFyZSBzdXBwb3J0ZWQuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENoaWEtV2Vp
LCBXYW5nIDxjaGlhd2VpX3dhbmdAYXNwZWVkdGVjaC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4g
PiAgZHJpdmVycy9zb2MvYXNwZWVkL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICA0OSArKw0K
PiA+ID4gPiAgZHJpdmVycy9zb2MvYXNwZWVkL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAg
NSArDQo+ID4gPiA+ICBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWVzcGktY3RybC5jICAgICAg
IHwgMTk3ICsrKysrKw0KPiA+ID4gPiAgZHJpdmVycy9zb2MvYXNwZWVkL2FzcGVlZC1lc3BpLWZs
YXNoLmMgICAgICB8IDQ5MCArKysrKysrKysrKysrKw0KPiA+ID4gPiAgZHJpdmVycy9zb2MvYXNw
ZWVkL2FzcGVlZC1lc3BpLW9vYi5jICAgICAgICB8IDcwNg0KPiA+ID4gKysrKysrKysrKysrKysr
KysrKysNCj4gPiA+ID4gIGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtZXNwaS1wZXJpcGhlcmFs
LmMgfCA2MTMNCj4gKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIGRyaXZlcnMvc29jL2FzcGVl
ZC9hc3BlZWQtZXNwaS12dy5jICAgICAgICAgfCAyMTEgKysrKysrDQo+ID4gPiA+ICBpbmNsdWRl
L3VhcGkvbGludXgvYXNwZWVkLWVzcGkuaCAgICAgICAgICAgIHwgMTYwICsrKysrDQo+ID4gPiA+
ICA4IGZpbGVzIGNoYW5nZWQsIDI0MzEgaW5zZXJ0aW9ucygrKSAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4gPiA+IGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtZXNwaS1jdHJsLmMNCj4gPiA+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWVzcGktZmxhc2gu
Yw0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQt
ZXNwaS1vb2IuYw0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL2FzcGVl
ZC9hc3BlZWQtZXNwaS1wZXJpcGhlcmFsLmMNCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWVzcGktdncuYw0KPiA+ID4NCj4gPiA+IGRyaXZlcnMv
c3BpLyBpcyB0aGUgY29ycmVjdCBsb2NhdGlvbiBmb3IgYSBTUEkgY29udHJvbGxlci4NCj4gPiA+
DQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2FzcGVlZC1l
c3BpLmgNCj4gPiA+DQo+ID4gPiBUaGlzIHVzZXJzcGFjZSBpbnRlcmZhY2UgaXMgbm90IGdvaW5n
IHRvIGJlIGFjY2VwdGVkIHVwc3RyZWFtLg0KPiA+ID4NCj4gPiA+IEknZCBzdWdnZXN0IHlvdSBs
b29rIGF0IHNpbWlsYXIgU1BJIGZsYXNoIGNhcGFibGUgU1BJIGNvbnRyb2xsZXINCj4gPiA+IGRy
aXZlcnMgdXBzdHJlYW0gYW5kIG1vZGVsIHlvdXIgZHJpdmVyIGFmdGVyIHRoZW0uIFRoaXMgbG9v
a3MgbGlrZSBpdCBuZWVkcw0KPiBtYWpvciByZXdvcmtpbmcuDQo+ID4gPg0KPiA+IGVTUEkgcmVz
dWVzIHRoZSB0aW1pbmcgYW5kIGVsZWN0cmljYWwgc3BlY2lmaWNhdGlvbiBvZiBTUEkgYnV0IHJ1
bnMgY29tcGxldGVseQ0KPiBkaWZmZXJlbnQgcHJvdG9jb2wuDQo+ID4gT25seSB0aGUgZmxhc2gg
Y2hhbm5lbCBpcyByZWxhdGVkIHRvIFNQSSBhbmQgdGhlIG90aGVyIDMgY2hhbm5lbHMgYXJlIGZv
cg0KPiBFQy9CTUMvU0lPLg0KPiA+IFRoZXJlZm9yZSwgYW4gZVNQSSBkcml2ZXIgbWlnaHQgbm90
IGZpdCBpbnRvIHRoZSBTUEkgbW9kZWwuDQo+IA0KPiBJIGFncmVlLCB0aGUgbmFtaW5nIGlzIGNv
bmZ1c2luZyBidXQgZVNQSSBkb2Vzbid0IGJlbG9uZyBpbiBkcml2ZXJzL3NwaS4NCj4gDQo+IEFz
IGl0IGlzIGEgYnVzIHRoYXQgaXMgY29tbW9uIHRvIG1vcmUgdGhhbiBqdXN0IHRoZSBBc3BlZWQg
Qk1DLCB3ZSBtYXkgd2FudA0KPiB0byBpbXBsZW1lbnQgaXQgYXMgYSBuZXcgYnVzIHR5cGUgdGhh
dCBoYXMgZGV2aWNlcyBoYW5naW5nIG9mZiBpdCwgc2ltaWxhciB0bw0KPiBGU0kuDQo+IA0KVGhl
IEFTUEVFRCBlU1BJIGNvbnRyb2xsZXIgZHJpdmVyIGlzIHNsYXZlIHNpZGUgZGV2aWNlLCBub3Qg
bWFzdGVyIHNpZGUuIEkgdGhpbmsgaXQgd2lsbCBiZSBzdGF5IHNvYy9hc3BlZWQgZmlyc3QuIA0K
QmVjYXVzZSBpcyBtb3N0IFNvQyBDaGlwIHJlbGF0ZWQuIA0KDQpDaGVlcnMsDQoNClJ5YW4NCg==
