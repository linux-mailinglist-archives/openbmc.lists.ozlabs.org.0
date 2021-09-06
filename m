Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E86401281
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 03:20:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2rDj0sJPz2yM7
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 11:20:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=D21hoP7y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.101;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=D21hoP7y; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320101.outbound.protection.outlook.com [40.107.132.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2rD44Lh9z2xlD;
 Mon,  6 Sep 2021 11:19:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BH78cB230lr9bjjV/9KOSiWFj/ZlAzA0ZJgA2WRs/jf1AMP9uoHeu1HHIAnrXNVBdrR0KZwWTznwS7R/aDhLUgtINT5bxlpx9evDG685O96Zc/O9ANZrbuUml9KULCLkLsBiBPRGzEEPOoXe5kYwoAdOiVkWPMJqbDFoZbn73DinbX8CDzpSL7fMwG4PHqD1j0ZpJlXKW6kgjNpUm5JvvfJ/1+/WbQbFLnDfN3scTOkbyp6sYbAUSOZbdHowEDywtY8qYJ4999ZqoQsQu+Al9XIaP5gamVdVjp4vVgMgxnGl+PejCe4xRljAW8onn+3NkyAPMc3+yHOKYwe+p+laCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=XhMASkSMWqCt+7VmaL1m4SDMWxE04ncAgXfF/oQoR9g=;
 b=KVLEkjsLUtFXz6Nj8TN2k5xsd4yax5yoBZEMP53EFd7NETWPlbO1ssdxD57PzBQzvuEWgAVxV2eelt02fXX9FKjNWkhjPj6DVg+Wuigh/xDtkOf753UoUHZDvCw5D2NtGTOmpukqGSHO08Z5X8XKbD+HC0hTnZ3o7WpV3NCfmV15NhZznPLQWPs38VBf2BNxJR781vHj+uvEHmS03Lovaa073TSSZ8QWAAfeV9FO+fCT2zFpgStcWlTG5Ix3uygRlXe/VCNsgzp0nB0ndiSakCe0vsGXi4uLoomYdBlQjJXRwvTV702k5YbO+sIPv7C5/Ez0YNIGW3jtylWAiKBoRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhMASkSMWqCt+7VmaL1m4SDMWxE04ncAgXfF/oQoR9g=;
 b=D21hoP7ypnxtddMTng4dzJkduqgYuqyGBGNRXBVZV14kCv6iYXkW30uWY4Wq8UV7IFfPdsf37o43NK2Wu2Lq0TcR4kSl8thMUbBnMRgkl0fBIt/mCLOlB4e5KHvRo4LMIp2fTvDJCxwPAcW7YHP/ZfnDR1IfeBu/VJvPr7+f9/47eMTnPsyBArSoaq3gMJUSjgtTG48mvhyi1UAx2mkjHIwfcVqmgtR1YBUwDdbB2ZsP5wklv5GVawAVywPuD8ZS9GaMqqFCkoQ6aRMgg3gnB/wCqq/mnIoZiMTVElSJkbzMLWvlPyV99XEicoKJ5cVtyRjwByRCzHyHJtvixzMB6w==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1906.apcprd06.prod.outlook.com (2603:1096:202:c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 01:19:21 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4457.026; Mon, 6 Sep 2021
 01:19:21 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXnuHnLi9FHqbUxUOpf9SHGgAkS6uQF7yAgAAhRlCAABrbgIAF1b0A
Date: Mon, 6 Sep 2021 01:19:21 +0000
Message-ID: <HK0PR06MB37799C48533B084CF864E49D91D29@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
 <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
 <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <513cb05f8d83d08a5c1e491dc0a9b6784195e7dd.camel@codeconstruct.com.au>
In-Reply-To: <513cb05f8d83d08a5c1e491dc0a9b6784195e7dd.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c26ecf9-66a9-43bf-bde7-08d970d45b25
x-ms-traffictypediagnostic: HK2PR0601MB1906:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB190649E254C532E144B756D091D29@HK2PR0601MB1906.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wivzecjkARJ87LSVegmMh41XRfAADK4djaUGvYwX7khMTd+c6RkvvHS+DzO2OwEFcd4kjVJJdFs2PABO81QeU8tA5eCt+pY4td1wo7pjfOCNe7Cj37oY0wtoLXhCluSPz5HiIeZk6GOeB6bAIDlGv8Z7z/0EzGLU7cvA2ldjdw9jH1Kqc3mQnZFy123FdKRA7ox0iUf5aCw6ZzEnZKYlPlb08xEiljUp0QGGO2bx0HjWo7jl6KWUrEXAq5kxDAjGKIdZo7m1gG6wc53KPFjPOV/ofkKSORby20bTbVODcnck6F5VP5BtW9FSD6m0OnQQqZ2np4+qmmf1G+EPkUYQY1HsP60GFEMeB1258CVxYMXGZodRrrFu1qh7dWZbmAQ3pIFR65/LlFw7EWkeQ/8CqkoT+IpdtQ5eATDvTs/RvyLth6jze6sgD5eA4ACbVXO2IcMxPeWRReAxI8aXFBs1K3hBa6yk0BB4Fdq+kNaGHvVyK6Nyf2uIqlHFANn023+jd5F62pu5rbU8CJNAvpoGNq2SWHxKQbR8n52aDZJ5hT04kOjfsupxzpb26l64kBtr6887V2d6n6Zpn9K+rAn6Y68SQwIDUNlpnRgdlEjPFhOIHdIXxTC1uwvA+ezwV/+ferPCOmjnMZK+5G7ATbmBwCczavcKa1q8ZzL9r7WDJvIM/67My6ZSu0YYsdBsLtW+7fZicldKlDB6Zeideg6OBg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39830400003)(346002)(376002)(396003)(136003)(186003)(122000001)(38100700002)(26005)(38070700005)(316002)(66446008)(508600001)(86362001)(8936002)(83380400001)(66556008)(66476007)(66946007)(64756008)(76116006)(107886003)(2906002)(71200400001)(7696005)(33656002)(9686003)(4326008)(6506007)(52536014)(8676002)(55016002)(110136005)(54906003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0F4eGN4elhqSWVocFRUZUJoQnpPUVQwUFhqaVZyZWJFQm9CN2RZV2pMaEJV?=
 =?utf-8?B?eHJTN0kwU20wZTNNRXBMd0pTWkVjUUl0aTYxR2hxdEFVN3d0RzYrOGNMMlJY?=
 =?utf-8?B?WCtRUjF1UER5KzZNUFVlNHVhMzlMNHJWVFA5ZjltajBZVkpsT0IvZUg0dTYw?=
 =?utf-8?B?aWZkcStVMXlMTkJYa3UwdXhlcnAvelZ1Ym81ck9JdjdhUFZwT3lWQndBRFRo?=
 =?utf-8?B?Zng0dWFyb3VHaEJNaklzWHBPbXdDOGt1OWlGUm5CYXQ2WU1VN3NSMWx2bk83?=
 =?utf-8?B?Zy9OZm1nTjhNRHk4dVU3NFhOSkJudG9LRk9ZTUo0TXRDTGRWYWhQNWpOZ0NY?=
 =?utf-8?B?WFAybEJHVXZEWUY3R1Q4OUpWVGZMV2FncjNvaTdYSEFadWJaVzRpeklIVzR6?=
 =?utf-8?B?MGN0M3lKa29SWjlKYTBLdkM5dWpETWt5cWlDU3VQTElYMUYvcjhQbzA4V1hC?=
 =?utf-8?B?QmhhOFNkUGl0a0tyanUwVmcyMUJua2F6ZlJUS3ZpRzg0Z1J2by9ta0hWbzhL?=
 =?utf-8?B?eSt3alU0Yy93cUwxTExndFRTcUQ1LzFMTE5TWnlaQmN5MUxhcXh6cGFWN29p?=
 =?utf-8?B?ZXEwU1c3NDJYZ3ZsS2ZDdGc2Yi90RGY5bXI4NU1QNVJSQktpSjhERVNXT2Ex?=
 =?utf-8?B?Znp4Q2JGMm1XQWJoanJNUVhnTVdXR2drNWt3WnFEUzhoMlBEL1FGdjV3eTNL?=
 =?utf-8?B?bGxMaUtGNDVrQmc3WmhDMG14UUQ4VjZHMGFXeStTSFdEUDQvVWxZUEhiaW1Z?=
 =?utf-8?B?dWwvN2FKTGtFSnMwNGdDUlJiZ1VPZFYrbE9kRnRlUnNIMXJxRTB3WTRYenp3?=
 =?utf-8?B?ci96NldUSTFmY2J1RjVmQk01dTVJRnZibWJtVWV0Wm02YlQ4Zi9Uc0N4MnVh?=
 =?utf-8?B?MGdpMzVTZEhCYjU0bHorcEdRMXBHOE5DRDYzcWk3bHVvTE5mN1RmKzgxc0pC?=
 =?utf-8?B?VkFqQUJpdXhveDhLQm1oWlVBS2U3WUU0WWNYbWl4TllwK0tNMDZ5TVd1TDlR?=
 =?utf-8?B?TExsUUJ1Zk5kb1oxYS9QUzdjSDFOTDh4VU95aUhwRnJ0QnRiUm1lVG9DdG5S?=
 =?utf-8?B?NnYxa3daZ0NlY2VJUnhsRUY5QmtVRkVsN1lqR09VL1RqRkh2azBQYnJQSkFJ?=
 =?utf-8?B?eVJacW5CR2JMdlozcDh2eHRLVHdxdWNpcm8wRkhCTk0xemltSU9CNlBKSzM1?=
 =?utf-8?B?TTFLYVpGZUFXdm0wMU93d3RxQllSTEoxUys3VFhMZmpnd2xwZzFRemJ2MElw?=
 =?utf-8?B?bm9GNSsySXFmNFF2akwwOXZnR29hUjJxQW9hY3dlazRqVmtxVnNTcXZ0TkxU?=
 =?utf-8?B?amVVUDlkYWlOc1dtdXV6bUphU2RPbWVIdnE3UWllZHA3SzRYYnZJaS9lNFM1?=
 =?utf-8?B?NXNQM0N2d1AyWFVBdkNqaXR1Qk9EZkEwWDd2SkVUUkR3QW1vSWZnM20rNGox?=
 =?utf-8?B?OHJOeTRzckxadGVkZmFtb0RVWmpaK2U1ejNINElFb05jdmt3S0tYSU1HQ3Rm?=
 =?utf-8?B?WGpsbTdXbEJIdmozakRWSnNoWE5OY1ZHUVpDT1lUTHJIdmJDSldHWWkyNmxF?=
 =?utf-8?B?RWlyaWo1NTgwK3RuU0QwZXJoc2RKQkg1aEJmVVNNV05mdFdCaERNSmp3S1Fj?=
 =?utf-8?B?VnpoMmVESUFUTGsvdFJ5T1lGL09wT1cyWTZyMWQyU1dtK3VGR0VjZE5WUmo5?=
 =?utf-8?B?YTYyYmZ3MzJDdnZFS2RzNzdkNUZZVWpuYlhkN2lNNUJvb0I3eVZOZE5qUnFu?=
 =?utf-8?Q?e/kyAkoW+ajufaj7m9MuZayNoNo6KuyUnEjh3Ym?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c26ecf9-66a9-43bf-bde7-08d970d45b25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 01:19:21.2094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GjkhupEC4otFWMXQyGXnUaC+4xsKbsrolBrCZTvLWSTL0QAogsBpwN8TpzIzlj9qv70+sk7PIWroKav1gLUescil0TS3DRmTwoRVi5qLaZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1906
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmVyZW15LA0KDQo+IEZyb206IEplcmVteSBLZXJyIDxqa0Bjb2RlY29uc3RydWN0LmNvbS5h
dT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyLCAyMDIxIDM6MDUgUE0NCj4gDQo+IEhp
IENoaWF3ZWksDQo+IA0KPiA+IFRoZSBlU1BJIG9uIEJNQyBzaWRlIGlzIGEgc2xhdmUgZGV2aWNl
LiBNb3N0IG9mIHRpbWUgaXQgbGlzdGVuIHRvIHRoZQ0KPiA+IEhvc3QgcmVxdWVzdHMgYW5kIHRo
ZW4gcmVhY3QuDQo+ID4gVGhpcyBtYWtlcyBpdCBub3QgcXVpdGUgZml0IHRvIGludGVyZmFjZXMg
dGhhdCBhY3QgYXMgYSBtYXN0ZXIgcm9sZS4NCj4gDQo+IFRoYXQncyBhIGdvb2QgcG9pbnQsIGJ1
dCBJIGRvbid0IHRoaW5rIGl0IHByZWNsdWRlcyB1c2luZyBleGlzdGluZyBpbnRlcmZhY2VzLg0K
DQpBZ3JlZS4NCg0KPiANCj4gPiA+IDEpIFRoZSBWVyBjaGFubmVsIGlzIGVzc2VudGlhbGx5IGEg
R1BJTyBpbnRlcmZhY2UsIGFuZCB3ZSBoYXZlIGENCj4gPiA+IGtlcm5lbCDCoMKgIHN1YnN5c3Rl
bSB0byBleHBvc2UgR1BJT3MuIFdlIG1pZ2h0IHdhbnQgdG8gYWRkIGFkZGl0aW9uYWwNCj4gPiA+
IHN1cHBvcnQgwqDCoCBmb3IgaW4ta2VybmVsIHN5c3RlbSBldmVudCBoYW5kbGVycywgYnV0IHRo
YXQncyBhIG1pbm9yDQo+ID4gPiBhZGRpdGlvbiB0aGF0IMKgwqAgY2FuIGJlIGRvbmUgc2VwYXJh
dGVseSBpZiB3ZSBkb24ndCB3YW50IHRoYXQNCj4gPiA+IGhhbmRsZWQgYnkgYSBncGlvIMKgwqAg
Y29uc3VtZXIgaW4gdXNlcnNwYWNlLg0KPiA+DQo+ID4gZVNQSSBWVyBjaGFubmVsIGNhbiBiZSB1
c2VkIHRvIGZvcndhcmQgYSBieXRlIHZhbHVlIHRvL2Zyb20gR1BJTy4NCj4gPiBIb3dldmVyLCB0
aGUgdGFyZ2V0ZWQgR1BJTyBncm91cCBhbmQgaXRzIGRpcmVjdGlvbiBhcmUgZGV0ZXJtaW5lZCBi
eSB0aGUgSG9zdC4NCj4gPiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tIHVzdWFsIEdQSU8gZGV2aWNl
cyBhcyBpdCBzdXBwb3J0cyB2ZXJ5IGxpbWl0ZWQgb3BlcmF0aW9ucy4NCj4gDQo+IEknbSBub3Qg
cmVmZXJyaW5nIHRvIHRoZSBoYXJkd2FyZSBHUElPcyB0aGF0IGNhbiBiZSBjb25uZWN0ZWQgaGVy
ZSwgcmF0aGVyIHRoZQ0KPiBsb2dpYyB2YWx1ZXMgcmVwcmVzZW50ZWQgb3ZlciB0aGUgVlcgY2hh
bm5lbC4gVGhlIGVTUEkgbWFzdGVyIGlzIHRyYW5zZmVycmluZw0KPiBJTyBzdGF0ZXMgb3ZlciB0
aGUgY2hhbm5lbCwgYW5kIHdlIGNvdWxkIHJlcHJlc250IHRob3NlIG9uIHRoZSBCTUMgc2lkZSBh
cw0KPiAidmlydHVhbCIgR1BJT3MuDQo+IA0KPiBJZiB0aGF0IG1vZGVsIGRvZXNuJ3QgZml0IHRo
b3VnaCwgdGhhdCdzIE9LLCBidXQgSSB0aGluayB3ZSBuZWVkIHNvbWUgcmF0aW9uYWxlDQo+IHRo
ZXJlLg0KDQpBZnRlciBhbiBpbnRlcm5hbCBkaXNjdXNzaW9uLCB3ZSBmb3VuZCB0aGF0IG91ciBl
U1BJIFZXIGRldmljZSBtYXkgbm90IGZpdCBpbnRvIGV4aXN0aW5nIEdQSU8gbW9kZWwuDQoNClRo
ZSByZWFzb24gaXMgdGhhdCBHUElPIGRpcmVjdGlvbiBjaGFuZ2VzIHRocm91Z2ggVlcgY2hhbm5l
bCBoYXMgbm8gaW50ZXJydXB0cyB0cmlnZ2VyZWQuDQpBbmQgdGhlIGRpcmVjdGlvbiBpcyBjb250
cm9sbGVkIGJ5IHRoZSBIb3N0IGFzIGFmb3JlbWVudGlvbmVkLg0KVGh1cyBhIGJ1c3kgcG9sbGlu
ZyBvbiBHUElPIGRpcmVjdGlvbiByZWdpc3RlciBpcyBpbmV2aXRhYmxlIHRvIHJlZmxlY3QgdGhl
IHN0YXRlIHRpbWVseS4NCkV2ZW4gdGhvdWdoLCB0aGVyZSBpcyBzdGlsbCBhIGNoYW5jZSB0aGF0
IEJNQyB3aWxsIG1pc3MgR1BJTyBkaXJlY3Rpb24gY2hhbmdlcyBpbiB0aGUgdGltZSBzcGFuIG9m
IHR3byBwb2xsaW5nIHJlYWQuDQoNClJlZ2FyZGluZyB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biwgSSBzaG91bGQgYWRkIGFuIGFkZGl0aW9uYWwgSU9DVEwgY29kZSB0byByZWFkIHRoZSBjdXJy
ZW50IEdQSU8gZGlyZWN0aW9uLg0KDQo+IA0KPiA+ID4NCj4gPiA+IDIpIFRoZSBvdXQtb2YtYmFu
ZCAoT09CKSBjaGFubmVsIHByb3ZpZGVzIGEgd2F5IHRvIGlzc3VlIFNNQnVzDQo+ID4gPiDCoMKg
IHRyYW5zYWN0aW9ucywgc28gY291bGQgd2VsbCBwcm92aWRlIGFuIGkyYyBjb250cm9sbGVyIGlu
dGVyZmFjZS4NCj4gPiA+IMKgwqAgQWRkaXRpb25hbGx5LCB0aGUgZVNQSSBzcGVjcyBpbXBseSB0
aGF0IHRoaXMgaXMgaW50ZW5kZWQgdG8NCj4gPiA+IHN1cHBvcnQNCj4gPiA+IMKgwqAgTUNUUCAt
IGluIHdoaWNoIGNhc2UsIHlvdSdsbCAqbmVlZCogYSBrZXJuZWwgaTJjIGNvbnRyb2xsZXINCj4g
PiA+IGRldmljZSB0bw0KPiA+ID4gwqDCoCBiZSBhYmxlIHRvIHVzZSB0aGUgbmV3IGtlcm5lbCBN
Q1RQIHN0YWNrLg0KPiA+DQo+ID4gQ291bGQgeW91IHNoYXJlIHVzIG1vcmUgaW5mb3JtYXRpb24g
YWJvdXQgdGhlIGkyYyBuZWVkIG9mIGtlcm5lbCBNQ1RQIGtlcm5lbCBzdGFjaz8NCj4gPiBUbyBv
dXIgdW5kZXJzdGFuZGluZywgdGhlIE1DVFAgaXMgYSBidXMgYWdub3N0aWMgcHJvdG9jb2wuDQo+
ID4gQSBnZW5lcmljIHJhdyBwYWNrZXQgaW50ZXJmYWNlIG1ha2VzIGl0IG1vcmUgZmxleGlibGUg
dG8gYWRhcHQgdG8gZGlmZmVyZW50IGludGVyZmFjZXMuDQo+IA0KPiBUaGUgY3VycmVudGx5IHBy
b3Bvc2VkIG1jdHAtaTJjIGludGVyZmFjZSBkcml2ZXIgYmluZHMgdG8gYSBrZXJuZWwgaTJjIGRl
dmljZS4NCj4gSWYgeW91IGV4cG9zZSBhIGtlcm5lbCBpMmMgZGV2aWNlIGhlcmUsIHdlIGNhbiBj
b25uZWN0IHRoYXQgYXMgYW4gTUNUUA0KPiBpbnRlcmZhY2UuDQo+IA0KPiBXaXRoIHRoZSBwYWNr
ZXQgaW50ZXJmYWNlIHByb3Bvc2VkIGhlcmUsIHdlIGNhbid0IGRvIHRoYXQsIGFuZCB3b3VsZCBu
ZWVkIGENCj4gd2hvbGUgbmV3IGRyaXZlciBmb3IgdGhpcywgaW1wbGVtZW50ZWQgaW4gdXNlcnNw
YWNlLiBUaGUgc2FtZSB3b3VsZCBhcHBseSB0bw0KPiBhbnkgb3RoZXIgdXNhZ2Ugb2YgdGhlIGky
YyBidXMgKEVFUFJPTSBhY2Nlc3MsIGV0YykuDQoNClRoYW5rcyBmb3Igc2hhcmluZyB0aGUgaW5m
b3JtYXRpb24uDQpIb3dldmVyLCBhcyBtZW50aW9uZWQgYWJvdmUsIE1DVFAgaXMgYnVzIGFnb25p
c3RpYy4NCkEgcmF3IHBhY2tldCwgcHJpbWl0aXZlIGludGVyZmFjZSBzaG91bGQgaGF2ZSBiZXR0
ZXIgZmxleGliaWxpdHkgdG8gbWFuYWdlIE1DVFAgcGFja2V0cyBvdmVyIHRoZSBPT0IgY2hhbm5l
bC4NCg0KSWYgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uIGlzIHJlaW52ZW50aW5nIHRoZSB3aGVl
bCwgd2UgY291bGQgY29uc2lkZXIgdG8gcmVmZXIgdG8gdGhlIElQTUkgS0NTIEJNQyBkcml2ZXIg
b2YgT3BlbkJNQyBMaW51eC4NClRoZSBkcml2ZXIgaGFzIGJvdGggdGhlIFJBVyBhbmQgSVBNSSBp
bnRlcmZhY2VzIHN1cHBvcnRlZC4NCg0KQnV0IHdlIHRoaW5rIHRoaXMgc2hvdWxkIGJlIHRoZSBu
ZXh0IHN0ZXAuDQoNCj4gDQo+ID4gPiAzKSBUaGUgZmxhc2ggY2hhbm5lbCBleHBvc2VzIHJlYWQv
d3JpdGUvZXJhc2Ugb3BlcmF0aW9ucywgd2hpY2gNCj4gPiA+IHdvdWxkIGJlDQo+ID4gPiDCoMKg
IG11Y2ggbW9yZSB1c2VmdWwgYXMgYW4gYWN0dWFsIGZsYXNoLXR5cGUgZGV2aWNlLCBwZXJoYXBz
IHVzaW5nDQo+ID4gPiB0aGUNCj4gPiA+IMKgwqAgZXhpc3RpbmcgbXRkIGludGVyZmFjZT8gT3Ig
aXMgdGhlcmUgYWRkaXRpb25hbCBmdW5jdGlvbmFsaXR5DQo+ID4gPiDCoMKgIGV4cGVjdGVkIGZv
ciB0aGlzPw0KPiA+DQo+ID4gVGhlIGZsYXNoIGNoYW5uZWwgd29ya3MgaW4gZWl0aGVyIHRoZSBN
YXN0ZXIgQXR0YWNoZWQgRmxhc2ggU2hhcmluZw0KPiA+IChNQUZTKSBvciBTbGF2ZSBBdHRhY2hl
ZCBGbGFzaCBTaGFyaW5nIChTQUZTKSBtb2RlLg0KPiA+DQo+ID4gRm9yIE1BRlMsIEJNQyBpc3N1
ZXMgZVNQSSBmbGFzaCBSL1cvRSBwYWNrZXRzIHRvIHRoZSBIb3N0Lg0KPiA+IEluIHRoaXMgY2Fz
ZSwgaXQgbWF5IGZpdCBpbnRvIHRoZSBNVEQgaW50ZXJmYWNlLg0KPiA+DQo+ID4gRm9yIFNBRlMg
KG1vc3RseSB1c2VkKSwgQk1DIG5lZWRzIHRvIGxpc3RlbiwgcGFyc2UgYW5kIGZpbHRlciBlU1BJ
DQo+ID4gZmxhc2ggUi9XL0UgcGFja2V0cyBmcm9tIHRoZSBIb3N0Lg0KPiA+IEFuZCB0aGVuIHNl
bmQgcmVwbGllcyBpbiB0aGUgZVNQSSBzdWNjZXNzL3Vuc3VjY2VzcyBjb21wbGV0aW9uIHBhY2tl
dA0KPiA+IGZvcm1hdC4NCj4gPiBUaGlzIGJlaGF2ZXMgZGlmZmVyZW50bHkgZnJvbSBNVEQuDQo+
ID4NCj4gPiBUbyBzdXBwb3J0IGJvdGggdGhlIHR3byBzY2VuYXJpbywgdGhlIE1URCBpbnRlcmZh
Y2UgbWlnaHQgbm90IGJlDQo+ID4gc3VpdGFibGUuDQo+IA0KPiBPSywgdGhhdCBtYWtlcyBzZW5z
ZS4gSW4gdGhpcyBjYXNlIHRoZSBCTUMgaXMgYWN0aW5nIGFzIHRoZSB2aXJ0dWFsIGZsYXNoIGRl
dmljZSwNCj4gcmlnaHQ/DQo+IA0KPiA+ID4gNCkgVGhlIHBlcmlwaGVyYWwgY2hhbm5lbCBpcyB0
aGUgb25seSBvbmUgdGhhdCB3b3VsZCBzZWVtIHRvIHJlcXVpcmUNCj4gPiA+IGFyYml0cmFyeSBj
eWNsZSBhY2Nlc3MsIGJ1dCB3ZSdsbCBzdGlsbCBuZWVkIGEgcHJvcGVyIHVhcGkNCj4gPiA+IGRl
ZmluaXRpb24gdG8gc3VwcG9ydCB0aGF0LiBBdCB0aGUgbWluaW11bSwgeW91ciBpb2N0bCBkZWZp
bml0aW9ucw0KPiA+ID4gc2hvdWxkIGdvIHVuZGVyIGluY2x1ZGUvdWFwaS8gLSB5b3Ugc2hvdWxk
bid0IG5lZWQgdG8gZHVwbGljYXRlIHRoZQ0KPiA+ID4gaGVhZGVyIGludG8gZWFjaCB1c2Vyc3Bh
Y2UgcmVwbywgYXMgeW91J3ZlIGRvbmUgZm9yIHRoZSB0ZXN0DQo+ID4gPiBleGFtcGxlcy4NCj4g
Pg0KPiA+IEluIHRoZSBmaXJzdCBzdWJtaXNzaW9uLCBJIHdhcyB0b2xkIHRoYXQgdGhlIGluY2x1
ZGUvdWFwaSBwYXRjaCBpcyBub3QNCj4gPiBnb2luZyB0byBiZSBhY2NlcHRlZC4NCj4gDQo+IFRo
aXMgaXMgd2hhdCB5b3Ugd2VyZSB0b2xkIGluIHRoZSB2MSBzdWJtaXNzaW9uOg0KPiANCj4gPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2FzcGVlZC1lc3BpLmgNCj4g
Pg0KPiA+IFRoaXMgdXNlcnNwYWNlIGludGVyZmFjZSBpcyBub3QgZ29pbmcgdG8gYmUgYWNjZXB0
ZWQgdXBzdHJlYW0uDQo+IA0KPiBJdCBzZWVzIGxpa2UgdGhhdCB3YXMgYSBjb21tZW50IGFib3V0
IHRoZSBBUEkgaXRzZWxmLCBub3QgdGhlIGxvY2F0aW9uIG9mIHRoZQ0KPiBoZWFkZXIgKFJvYiwg
Y29ycmVjdCBtZSBpZiBJJ20gd3JvbmcpLiBTaW1wbHkgbW92aW5nIHRoZSBoZWFkZXIgb3V0IG9m
IHRoZQ0KPiB1YXBpIGRpcmVjdG9yeSwgd2hpbGUgcmV0YWluaW5nIHRoZSBzYW1lIEFQSSwgaXMg
bm90IGEgc29sdXRpb24gdG8gdGhpcy4NCj4gDQo+ID4gSW4gc3VtbWFyeSwgY29uc2lkZXJpbmcg
dGhlIHZhcmlvdXMgYXBwbGljYXRpb25zIHRoYXQgbWlnaHQgYmUNCj4gPiBjb25zdHJ1Y3RlZCB1
cG9uIGVTUEkgdHJhbnNhY3Rpb24sIHdlIHRob3VnaHQgdGhhdCB0aGUgcmF3IHBhY2tldA0KPiA+
IHBhcmFkaWdtIG1pZ2h0IGJlIHRoZSBmaXJzdCBzdGVwIHRvIHN0YXJ0IHdpdGguDQo+IA0KPiBL
ZWVwIGluIG1pbmQgdGhhdCB5b3UncmUgY3JlYXRpbmcgYSBrZXJuZWwgQUJJIGhlcmUsIHdoaWNo
IGhhcyB0byBzdGF5IGluIHBsYWNlDQo+IGZvcmV2ZXIgLSBldmVuIGlmIGl0J3MgdGhlIGZpcnN0
IHN0ZXAgdG8gc29tZXRoaW5nIGVsc2UsIHdlIGNhbm5vdCBicmVhayBmdXR1cmUNCj4gY29tcGF0
aWJpbGl0eS4NCg0KVW5kZXJzdG9vZC4NClRoYW5rcyBmb3IgZ2l2aW5nIHVzIHRoZXNlIGZlZWRi
YWNrIGFuZCBzdWdnZXN0aW9ucy4NCg0KUmVnYXJkcywNCkNoaWF3ZWkNCg==
