Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABFB364047
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 13:16:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP4503JHcz2xfT
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 21:16:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=AULY0NKO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.129.138;
 helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=bruce_lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=AULY0NKO; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290138.outbound.protection.outlook.com [40.107.129.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP44k0GHWz2xMw
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 21:16:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoXUZAA6CWc0uCW17g29buAIi3KD+lmvkbq4KohKNHaqwX946EqQK3yP1YCXVbBda3xI5M6nDz/fw93kV812L/YcwBZalWqghdUNDk8tsQTbJSbtbuonEGHyM8lLPl0Wz4eRzhscLT/X5kVUuncNMRXakvZN2aV65C7iSvseIFhrrd3nUm71cq4fJw/Y7TJwFzU5doC+aaToOTdEebXr8op51DHsgNza6rIm/iEy6MWYpAMtRdobBlbeyF4QBM2LoqzSov6LAi7s5jfHzPnB8tQTsdLz8WyVaQTfmOyN5QcpzW4Hhd2QHMeh0KlFTpJmhdiJdtwazI49M0DClUu6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1v6bThngmJ94BctBwk2E210yv+i1EFSVX0nD5c6dLs=;
 b=fsuj9BRjhE10FSCAoVYoRhCmLQKgEkJBdHN+N3ayHIurOvZ8BpCFmYK7lwauitcv//MBvIlgwvDm5onmJFoIa0Ciw222n79red6drvinvjAmYesogVs7OHE/y3pPdUpPPN0S2hsNqLK4p/MtyhjzDQiGqhc8+a2b1UoYCpWPvVXzNWD+aox0Fwp1QdX504ONQ2T1oKOsoGf+HUy92Ut9NO3tOLmTqL5Rzk384bCFlSDqVONgMHob1JHGdNeySbbLf1iDjv0GFDLV0jWwdL2JGyZXOkoAGVHkiWm5J08cnxbkFcBu5iuyMO/WZIRlPpZ2IQtCvHi0N/D2erxODaD2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1v6bThngmJ94BctBwk2E210yv+i1EFSVX0nD5c6dLs=;
 b=AULY0NKOlQgrE1dmefDPHumWvYwIIRm0QXOsQxyJqoXQJ14Ehw9+TJr9VNqDcIxTtY7UQ0rS+YwkZx7KlNd1UemmzPbeTg14LcLozfdqdjp6FKSA5mjnQ5M23IsRnncUg9gDXfMV4NznlGHDJ+gHJYVAnT33tokuWT5YXhQXJRc=
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com (2603:1096:301:30::14)
 by PS2PR04MB3815.apcprd04.prod.outlook.com (2603:1096:300:62::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 11:15:50 +0000
Received: from PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::4d14:874d:f2cd:e2ba]) by PSAPR04MB4231.apcprd04.prod.outlook.com
 ([fe80::4d14:874d:f2cd:e2ba%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 11:15:50 +0000
From: =?utf-8?B?QnJ1Y2UgTGVlICjmnY7mmIDls7sp?= <Bruce_Lee@quantatw.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: How to get the return value using the command busctl set-property?
Thread-Topic: How to get the return value using the command busctl
 set-property?
Thread-Index: Adcye2UidslBHmPwRmChkR5xby3BjQAVYE6AAI8StWA=
Date: Mon, 19 Apr 2021 11:15:49 +0000
Message-ID: <PSAPR04MB42317DD4A47FB714DB65197BF8499@PSAPR04MB4231.apcprd04.prod.outlook.com>
References: <PSAPR04MB42315F65948C859527E5D8E2F84C9@PSAPR04MB4231.apcprd04.prod.outlook.com>
 <YHml+7IYIVEXYo6M@heinlein>
In-Reply-To: <YHml+7IYIVEXYo6M@heinlein>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9bc67ea-4dd3-43cd-47c9-08d903247d03
x-ms-traffictypediagnostic: PS2PR04MB3815:
x-microsoft-antispam-prvs: <PS2PR04MB3815511A6516C243D041FB99F8499@PS2PR04MB3815.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BUYUm4uKvgnhc1DcKYuif3SQBdCYer4T/YVcT0eIG/Vz27lnNjc570eP9urhkMUA4a3td0yLEQ7hxa/0NsLCGqie8QoE7WEbo1rsYKMDtZdyJmeFQGkOnKUWbWCfM79ziOnLLRg2K6XnRPCYLIvYwiWE8awG9syWWof/JwAIXnr5OasZpOvITckOJ3HF3pCYGxTz916HkUBTHFY6idPAd1hYwmJN5R/2Ilk4PHfq4gYDiqjdzwe4M8DrZCsQ0VlNdhJHF2QdAEKY+Xr0qdeenUADVRjIEIvKW9PB+LGWArfBnQ/LRFn5ihLHBuBK2zwA0N7nkIVm+3vPY4FIsr/zDVHePJepZi+SMqfZc/LFN3zz64nbujuGZnxhhRxqrEaeR9PbYzVVwrXRKCJwQQcQh761CjT9ixcLK+XnwJ+YhH61VkbMiBvFOTaI5hTrtz4PUZ6slCO7P2fmxrh+dWa8VX4CnbHu9Ykzpqi3raUV4No/RqKRXlAVabJzHPS2hE277EUdik/aOiL+jauloyPQQ5M8Uylabl6VSZuSJpfsMPzZdi1YUpQJ9lbcs69KpPY1NUPLe7S1DtiDhPeB8ewCCASOZDzhZ7je6+WSZ2Aafh6jViTeQTaGMmObh/Vf2322lec6svwmacyfBvAMfLWDUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR04MB4231.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(54906003)(122000001)(8676002)(76116006)(8936002)(6506007)(38100700002)(55016002)(66556008)(7696005)(66446008)(66476007)(33656002)(64756008)(66946007)(316002)(186003)(26005)(85182001)(52536014)(83380400001)(5660300002)(86362001)(9686003)(71200400001)(6916009)(53546011)(2906002)(478600001)(4326008)(15583001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bE9QTExUc2UzdXlQakpyYnFlVWdJU2RwZWFDRFFhZ3UzQUJpd0lwaUxFUWFY?=
 =?utf-8?B?VHo4N3YxMzkxZ1ZSN2hQcmsrWlByVVpqdlJLb0xKMyt6VXczNklOeEJPTDc5?=
 =?utf-8?B?dFdsckNVeHV2a1VEQ3dCM1FlMk1YMyt5NFdZR0txM1ZLa3h6SyswbTFYVDhv?=
 =?utf-8?B?UXdwbWFtUHlCUnFta00zem5aWGUyeTl1dzJHVlNqcVBuR0RIQVRJK3JKaDR4?=
 =?utf-8?B?bXFEN2duNGhmMC8yeVhFOW1DY2ptc2duRkw2YTQxcE9VSEtlME9lcXJBM0ZP?=
 =?utf-8?B?RU1HMjZYWm1xRU4reDNwWjNZMEErT1NYZXpBYkozcFBia2NsZCtYcm1rTlJj?=
 =?utf-8?B?a3RNc1QrWmxZeEZvTEo0SjRQNDI1VXNzNFRCdU5zQzBrVkQ5VjNkRWYzdHV4?=
 =?utf-8?B?UjVGcHhZVGxjZlBMNUVDNWJqcnZVQUZ5RndEY2tEMnBiM3VLdkZBdUs0VEVH?=
 =?utf-8?B?ekJwTmtpaGhKNGJZakRjMzQyWG43NVEzN2tKekNob3hENHlLTlRabmpwR1l5?=
 =?utf-8?B?WjBxTDdKek5BS1dtaG9mOTJJcnFkZWpoc0tIaEZlUmUvM0w4ek5nSzlJcXNz?=
 =?utf-8?B?Q0ttc2F5MzE2Zy9NN29QRGlZV1U1TWs4NmNIc3VhWUVoSkY1NVdRT0YrbnMy?=
 =?utf-8?B?VHl1M1VLWVpZd09zVnl6bFNqN0U3RURxWUdUNEtPNTZaak5rVDhKK21vaEdk?=
 =?utf-8?B?RjlwZjl1Wk52d0NHRzhtSXp3bW1rNnRUTXNvNTdHa0NwcW5OQlBkeFUyNU9Q?=
 =?utf-8?B?Uy9Na2wvam45MEJBRDVZcHdIMjB5SEtCWTNTMWdqU3ovTFVtb3J6aC9IUFV3?=
 =?utf-8?B?SFA0WWRKRTBMZDdjdktrZnIzTWZPN3lLUkVrNFMxV3lkakVnak9CM001ZGh4?=
 =?utf-8?B?cFk1SDcra2Rha1J2QzVPNDdIVTZ1NjdibjFMQ09FaXZhWnZvWk5weWRrbzgr?=
 =?utf-8?B?VXl6Nm53c0VSeGJYTkVUZ3JwcmEwaGlubGNjRmVXRHlwaEdTMnBYQmxLejhJ?=
 =?utf-8?B?cUZOWCtpQmMrWjZHRVNnaGJWclFQYmNadGp0UkwrNk1QZStNVDd2REdBL0cy?=
 =?utf-8?B?bTR5ODdNTXRVYUhBVmtzRzBkdlpGNjRKSWhHN2laZzU0QjY3eWVQYWhicVN5?=
 =?utf-8?B?T2FhWldiem14ZzM1K3U5bTgvSEE4aTJXSFdkK2RwWjR5NWloYktVY3lRanlL?=
 =?utf-8?B?ZkZVWXZEdXZmYWVDYktwL0YyZUpQcGhocjJqaW4xNEVoSldMZklkOGYzWWpw?=
 =?utf-8?B?ZTFSUHpkbmtjaVFWYUVKV0VheU9KTEFNQThscjh0WXRwTHhzN0ZOUEM5bTFm?=
 =?utf-8?B?ZDVhOUFodWtkUzZxMFdybWZ3RndKV3hva05RRGpvK0w3eURtY0ttSEVsVGNU?=
 =?utf-8?B?QkxneTFQajF2UW1Oa2UzYS9GR2J0WW1tMCtJRWJoNEJVcnFtVVpFN2pRVmhG?=
 =?utf-8?B?aXZRTFlzTUFCS1hvdk80cmpoR1FncjI1elYzSGhrUm9qcXZ6amdQL0o2bTBS?=
 =?utf-8?B?OGxkcTNRbkFCM2JDSFMrYm5YY0RmbVpJWDZPdFgwUWdLOVFBWHdaamxDL3B1?=
 =?utf-8?B?MmFWMWF5ZXF5Um1kaGFhbWVVZHJ5YTFLWS80azBFSVU4SHJXR1lQcnQwdXZt?=
 =?utf-8?B?dzhYMjFTb3dTN1NWVWVZc3V5aHptaUthY28va2hCeGN6bHQ2dFpORkdIUExV?=
 =?utf-8?B?SGgzWDFSOVRJbEZDNFFvZWtlVE90eEQzR0lKYW1KSkFpVzVuTXBQYWdUNkFY?=
 =?utf-8?Q?7jGGW9alFObMF7sYUI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4231.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bc67ea-4dd3-43cd-47c9-08d903247d03
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 11:15:49.8817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QFoqM1Sm3bks8L+z6TCZruc2dHH39CEK6RE/zP+WoGO1BCNXkIoDJr8xMoKquonYmRmF1hSAL8H+buWOP5KRKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3815
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "edtanous@google.com" <edtanous@google.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBhdHJpY2sgV2lsbGlhbXMg
PHBhdHJpY2tAc3R3Y3gueHl6Pg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDE2LCAyMDIxIDEwOjU4
IFBNDQo+IFRvOiBCcnVjZSBMZWUgKOadjuaYgOWzuykgPEJydWNlX0xlZUBxdWFudGF0dy5jb20+
DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGVkdGFub3VzQGdvb2dsZS5jb207IE5h
biBaaG91DQo+IDxuYW56aG91QGdvb2dsZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBIb3cgdG8gZ2V0
IHRoZSByZXR1cm4gdmFsdWUgdXNpbmcgdGhlIGNvbW1hbmQgYnVzY3RsIHNldC1wcm9wZXJ0eT8N
Cj4gDQo+IE9uIEZyaSwgQXByIDE2LCAyMDIxIGF0IDA0OjQ2OjAwQU0gKzAwMDAsIEJydWNlIExl
ZSAo5p2O5piA5bO7KSB3cm90ZToNCj4gPiBEb2VzIGJ1c2N0bCBzZXQtcHJvcGVydHkgY2FuIGdl
dCBpdHMgcmV0dXJuIHZhbHVlPw0KPiAuLi4NCj4gPiBJZiBjYW4gZ2V0IGl0cyByZXR1cm4gdmFs
dWUgZnJvbSBzZXQtcHJvcGVydHksIGhvdyB0byBkbyBpdD8NCj4gDQo+IFRoZXJlIGlzbid0IHJl
YWxseSBhIHJldHVybiB2YWx1ZSBmcm9tIGEgc2V0LXByb3BlcnR5IGNhbGw7IHRoZXJlIGlzIG9u
bHkgYSBwb3NzaWJsaXR5DQo+IG9mIGVycm9yLg0KPiANCj4gSWYgeW91IGxvb2sgYXQgJ21hbiBT
RF9CVVNfUFJPUEVSVFknIHlvdSdsbCBzZWUgdGhlIGZ1bmN0aW9uIHR5cGUgZm9yIGENCj4gcHJv
cGVydHkgc2V0IGlzOg0KPiANCj4gICAgICAgIHR5cGVkZWYgaW50ICgqc2RfYnVzX3Byb3BlcnR5
X3NldF90KShzZF9idXMgKmJ1cywgY29uc3QgY2hhciAqcGF0aCwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICppbnRlcmZhY2UsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJv
cGVydHksDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Rf
YnVzX21lc3NhZ2UgKnZhbHVlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZvaWQgKnVzZXJkYXRhLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHNkX2J1c19lcnJvciAqcmV0X2Vycm9yKTsNCj4gDQo+IFRoaXMgaXMg
d2hlcmUgdGhlICdpbnQnIHJldHVybiB5b3UncmUgc2VlaW5nIGZyb20gdGhlc2Ugc2V0LXByb3Bl
cnR5IGhhbmRsZXJzDQo+IGNvbWluZyBmcm9tLiAgVGhlIHdheSBzeXN0ZW1kIGhhbmRsZXMgdGhl
IHJldHVybiBjb2RlIGlzIHRoYXQgYW55IG5lZ2F0aXZlDQo+IG51bWJlciBiZWNvbWVzIGEgbmVn
YXRpdmUgZXJybm8gc3R5bGUgdmFsdWUgdGhhdCBzeXN0ZW1kIHR1cm5zIGludG8gYW4NCj4gYXBw
cm9wcmlhdGUgZXJyb3IgbWVzc2FnZSBiYWNrIGFjcm9zcyB0aGUgZGJ1cy4gIFRoZXJlIGlzIGEg
cGFyYWdyYXBoIGluIHRoZQ0KPiBtYW5wYWdlIHdpdGggbW9yZSBkZXRhaWxzOg0KPiANCj4gICAg
ICAgIElmIGEgY2FsbGJhY2sgd2FzIGludm9rZWQgdG8gaGFuZGxlIGEgcmVxdWVzdCB0aGF0IGV4
cGVjdHMgYSByZXBseSBhbmQNCj4gICAgICAgIHRoZSBjYWxsYmFjayByZXR1cm5zIGEgbmVnYXRp
dmUgdmFsdWUsIHRoZSB2YWx1ZSBpcyBpbnRlcnByZXRlZCBhcyBhDQo+ICAgICAgICBuZWdhdGl2
ZSBlcnJuby1zdHlsZSBlcnJvciBjb2RlIGFuZCBzZW50IGJhY2sgdG8gdGhlIGNhbGxlciBhcyBh
IEQtQnVzDQo+ICAgICAgICBlcnJvciBhcyBpZiBzZF9idXNfcmVwbHlfbWV0aG9kX2Vycm5vKDMp
IHdhcyBjYWxsZWQuIEFkZGl0aW9uYWxseSwgYWxsDQo+ICAgICAgICBjYWxsYmFja3MgdGFrZSBh
IHNkX2J1c19lcnJvciBvdXRwdXQgcGFyYW1ldGVyIHRoYXQgY2FuIGJlIHVzZWQgdG8NCj4gICAg
ICAgIHByb3ZpZGUgbW9yZSBkZXRhaWxlZCBlcnJvciBpbmZvcm1hdGlvbi4gSWYgcmV0X2Vycm9y
IGlzIHNldCB3aGVuIHRoZQ0KPiAgICAgICAgY2FsbGJhY2sgZmluaXNoZXMsIHRoZSBjb3JyZXNw
b25kaW5nIEQtQnVzIGVycm9yIGlzIHNlbnQgYmFjayB0byB0aGUNCj4gICAgICAgIGNhbGxlciBh
cyBpZiBzZF9idXNfcmVwbHlfbWV0aG9kX2Vycm9yKDMpIHdhcyBjYWxsZWQuIEFueSBlcnJvciBz
dG9yZWQNCj4gICAgICAgIGluIHJldF9lcnJvciB0YWtlcyBwcmlvcml0eSBvdmVyIGFueSBuZWdh
dGl2ZSB2YWx1ZXMgcmV0dXJuZWQgYnkgdGhlDQo+ICAgICAgICBzYW1lIGNhbGxiYWNrIHdoZW4g
ZGV0ZXJtaW5pbmcgd2hpY2ggZXJyb3IgdG8gc2VuZCBiYWNrIHRvIHRoZSBjYWxsZXIuDQo+IA0K
PiBUaGUgKmJlc3QqIHdheSBmb3IgYSBzZXQtcHJvcGVydHkgaGFuZGxlciB0byByZXR1cm4gYW4g
ZXJyb3IgaXMgdG8gdXNlIHRoZQ0KPiBzZF9idXNfcmVwbHlfbWV0aG9kX2Vycm9yIG9yIGZpbGwg
b3V0IHRoZSByZXRfZXJyb3Igd2l0aCBzZF9idXNfZXJyb3Jfc2V0Lg0KPiBCb3RoIHRoZSBBU0lP
IG9iamVjdF9zZXJ2ZXIuaHBwIGFuZCB0aGUNCj4gc2RidXMrKy1nZW5lcmF0ZWQgc2VydmVyIGJp
bmRpbmdzIGNhdGNoIGV4Y3BldGlvbnMgdGhyb3duIG91dCBvZiB0aGUNCj4gc2V0LXByb3BlcnR5
IGhhbmRsZXJzIGFuZCB0dXJuIHRoZW0gaW50byBzZF9idXNfZXJyb3Jfc2V0IGNhbGxzLg0KPiAN
Cg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBpdCdzIHZlcnkgdXNlZnVsIHRvIG1lLg0KDQo+IE90
aGVyIHRoYW4gdGhlIG5lZ2F0aXZlIHZhbHVlIGluZGljYXRpbmcgYSBlcnJubywgdGhlIHBvc2l0
aXZlIHZhbHVlIGhhcyBubw0KPiBtZWFuaW5nIGFuZCBkb2VzIG5vdCBkbyBhbnl0aGluZyBhdCBh
IGRidXMgbGV2ZWwuDQo+IA0KPiAtLQ0KPiBQYXRyaWNrIFdpbGxpYW1zDQo=
