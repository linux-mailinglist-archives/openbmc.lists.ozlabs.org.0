Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981A3F9319
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 05:49:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwm1T6lzHz2yfm
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 13:49:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=u5uq8t5W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.115;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=u5uq8t5W; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320115.outbound.protection.outlook.com [40.107.132.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwm0v4TJqz2yJf;
 Fri, 27 Aug 2021 13:49:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8chx4TpcpvisCLOF7Ps+D0RPdIAR7ysZ3i87DsgCDtPhrVPDvdMUsDW2Fov/CabRURWmjkY8DM4tE8fHMdd3+zQ5Tqcr6aJ9rtS6leXKkzrBSA0+jEyRIXaOgAf3vuNfXigpYgvq66ipK9gj6DVUW24unQq8xgItSnEyjoTNWkM3YOf9nzSL1o6GhjXR9+zwjHRwKbS9SnNiocgsAdDBkevcTklFs79xW/QEn2Um4GAn+sURz3x0lMK7cnS6ahYcc0ScTUic6HBQEBfiwoP8R8Ew9T0D6mADF1mOFEKReO1sgpxDqdthlK+bsJclnbCq+saIPQjZy5GtqmdVEq2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKLV775LV4W6HrsQc9w/mt6+3mFQpmEmf6b4EckBG98=;
 b=YSD7MaaxB1FADkwCiQ1pVWp8MFYw4kbK9RSyO2aKOR+XJtoTXQruTii8+5VIsG0l0zVjudGpw7L98TikTW7r4ClkSGPo1QBSPkZ/gMnWUXQIFnOswgKcdnIN379GEPx6FWhmAco8BRH6CCpU8Vx7byfLfuRXqijALXmQDXyUYiPJ6Nbw9y/pFmyT9qOpYBkpp6BFRVUl0mBzCkbiAnqSkdoh6HUQw/HlOD1wzLpp8riV6APP9bHRmb+EXTv4SgYW2oI2hOvgJ/LQJ9x7uvEXzlD0nyYa7ly6PM7lrJ1KWx5qB7Vm/9AikndRk4pm1yR/JyKhVH7AY8uL5ScKvGO+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKLV775LV4W6HrsQc9w/mt6+3mFQpmEmf6b4EckBG98=;
 b=u5uq8t5W7gnneuCYE6Q8203kgEvpumfMFO9YhyCn3SkKkrgNExNyljZW7We5hd1U83i+BEZ3ItMt+WYp9WXktxiPvLICWtUu/oEpD2huA+ZQ18/oDhr4iaULSItH5dBXP9c2iaJLgSlop7ANLq5Ylg+VJcsxf/aG56tnWRelY0D5DCd+5+01+BmHEMGchG6tozvz23G3wIwrUGe4tQgJDN2e5lhOdHUFPzCAm7zX4FkM0JIk5BIxX9TQ+0/3yRVKZHfealkitUBrR1TPNpwKyECYihjAx1YyqwocdrFltRgX2TIONxEt1jlRdWP5nmetOefnF51JVWOdGF7ST1yFXQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1828.apcprd06.prod.outlook.com (2603:1096:202:e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Fri, 27 Aug
 2021 03:48:39 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4436.025; Fri, 27 Aug 2021
 03:48:39 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "joel@jms.id.au" <joel@jms.id.au>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
Thread-Topic: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
Thread-Index: AQHXmkI+4Lhg3IxgrEO2OY2fsCr5kauGsFeAgAAAMrA=
Date: Fri, 27 Aug 2021 03:48:39 +0000
Message-ID: <HK0PR06MB377997422D9508894936E39691C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
 <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
 <7e7378c49ecfb21fef6a0640f92c1b3a7a5878d0.camel@codeconstruct.com.au>
In-Reply-To: <7e7378c49ecfb21fef6a0640f92c1b3a7a5878d0.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0643c318-c35f-4dc8-aa38-08d9690d8e54
x-ms-traffictypediagnostic: HK2PR0601MB1828:
x-microsoft-antispam-prvs: <HK2PR0601MB18285DAB6D3C75703E26B61E91C89@HK2PR0601MB1828.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vH+IblFn/HQSMV+aJ+BQXzKNJNTF18ydkWR5tX1PCPR71Elf6S/Yffwujj02Z1kMKkJtgWSh1tXRSiY3AR0vRnzaE1ZKrikZuGo/4mOQMl+RZXHDv7cKU+m3ompYYx/sjUXlQ8Tv3U0NoLtJccJieaAzAx8c/+A7suvY2CI+6isaVBzKj1nPKaH27wrEhcWoaQ5dsYG7LvuvALmmBZ4fi/cS7/IE6Fszpq7+o492ruI0TU/wUrwNLF3f646pkyeTh9iCynzDnRYSygwcoql02KqVBsDYmlqZ0bZmdK/ijiCCAFIcJ9r1sVrNFAOviTHyZlAhnHJTbu98hqaGR3ieZ8GDHribYy4n7WwZW/gDeeJhnjCXZP2/BsHeIx160wTvhzQ70ghVxFBM30pu5gKWPgMrA6TMvyVQPXq0gtFeZPMgvo7WmL4ZpGthdYGnGu9Lp9exl5VHOLKHYBqAI62wseSzjIXqk717118tnd4mHdzGvO77eave03bxnDfvJWa6LG/1W5BM3mQ6vvIjed9Q7J/gHW2eByMllWuE6sKFuDVSTQZxQnlfj9Q+93OiuG6QJ4AbBRFgCvD07R1U29rbIFlu4b29geQ9f/wFQuvttxMnObXGdHVT+lhALIdyByyUcLYjKdaBZ2xKJvaH5How6D4jKtAu35L5/N85LDLz9rCaMBN6ELrU0Hu7Dzp4mrXFIinOb8Xm7biZHq3sD+Chmw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(39840400004)(136003)(5660300002)(110136005)(26005)(8676002)(86362001)(66556008)(83380400001)(66476007)(55016002)(76116006)(33656002)(52536014)(316002)(478600001)(64756008)(8936002)(66446008)(186003)(66946007)(9686003)(71200400001)(38100700002)(122000001)(2906002)(6506007)(38070700005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWhzWlNySzArUC9zSUI1clBSWFp6V1FpVEJOdW1FZXBHdFBRdmYzUTgxMmtx?=
 =?utf-8?B?REZCeXpTUk9lQm1CM1RuekxadS9ZN09sUlJ5S2xJRkRITjdab2ZxSzlLL0tt?=
 =?utf-8?B?blh3c25zcGhLQXVRVkttNVlLRFZmZnlUdlV4cHhaOGtkdGxqSDh3RytOeTVq?=
 =?utf-8?B?ckFOd3pnQzdxMi9rNEhieGdmaFFEZFViWXB6UjQzbFI0cE05UFRBMVZVYU5X?=
 =?utf-8?B?MWw1YldYSnk5VVduSHNYWDNHV01wMVduQ3hJR2h5YlY1MVZXKzRITXJGcW1Q?=
 =?utf-8?B?cHZiaEVyTlpINnR5T043UWtvRmJXamkzTi8rOW5TOUdpWkMxQzgxcDhHSnYw?=
 =?utf-8?B?eFhOSXJmNnpIT1d5Zlh0K21GaDd1SjhiR1QwT0VxclRrbEFsMzNuSmYzL0dp?=
 =?utf-8?B?clRQVXBXN0g1SVlkanI3blkvcWs3ZzhPRlp5MzVCaHdUOUl3Umc0K2s2NDI4?=
 =?utf-8?B?M2EvK0NiVFRFdXFuL21pQWZySlA5aHhWRWxhQ0ZrbThVeVBJd1FhYWlPU20r?=
 =?utf-8?B?VWk4RU9xanMzL3oxc1lxbkZTYzV6cG0rUE1PNHE3aXNnYkRqL053em0ra2wv?=
 =?utf-8?B?Q215VndrZVU4ODFDNE50RHdiRVFMSHlRM3JNV3c3Uk9DWWFDaXNEc0xnMzd2?=
 =?utf-8?B?K3JPRTd6VFlNMTFkWWpOVUhZWTZSakljZjgra1dHdEZyWHVpdTdBdyt5MUQy?=
 =?utf-8?B?d0t2TlFpTk9Vd1hTWG9YV204ZFJlbUg3QUtQUEdvdU1BSFF1NGVuaGxkekpk?=
 =?utf-8?B?OHc1aUFaeEJnTmR6bWFJa1RIaklLaE9tMURqVnJQOGZOdzlOWmx2NTlJRGdw?=
 =?utf-8?B?QjE2eXRrN2tTYUJDZE1lWHVYNHcxSjBVUjJRbmNhbyttZnlWZFdkcFQyVUdF?=
 =?utf-8?B?OXF5eU10WUErMHlYTGpBNGxNZ0o4UEUzSTJ5WTUxS3U3VjA4WGYyM2dDSTFD?=
 =?utf-8?B?Zk95VWd3TVd0Vy9QdXYrbVlIcGZvbmZpSDZLUmYzS2x1cTRxQWQvazJnSmdm?=
 =?utf-8?B?MWtWdXg5WkcxZzRZMUd1RkFPYVBiSWJOVXZKUjR3a1JPSzJ4WGlvN3VKSG5U?=
 =?utf-8?B?eU82cUVlNkpVa0NTTjdBN1AxVVVyVFNNN3IyQk9sOGR6am9HVDhDWnR2d2VD?=
 =?utf-8?B?NnE4cnBxMHFJeW5IUk1sOWYzenlsdVUvSmp5WlRjaW5pMEpjQjdSYUhkaTRj?=
 =?utf-8?B?azROY3ZoZFVYUGlMVU45MzN6MzIrajhVQ2NTSTFtdGdZL3BhUjFERDFadDll?=
 =?utf-8?B?UVl0NGtEa3VIbitUWE9UYlhPR0Y0eG5ha29COGN4VnIzdjluNll1VEw5eUZD?=
 =?utf-8?B?b0xrd1lQUUs5MTlUTnVublVuODE4NEpza0FvaHlLR2ROK2hDVTQrVjFRMzRs?=
 =?utf-8?B?dDNQcU8yb0JhUEFySjRrc3RtLzcvZTFRS2VGc1FmVUx4RlZrcmhQSDU5a1Bo?=
 =?utf-8?B?a25kY1VodVp0UzhZVDFrY1NRRFRlS29tQUsxaVdFTEFTRVQrTWlNV0NjZHIx?=
 =?utf-8?B?YTBjK1EycDBnc1QzaXBxSXo5dTYvcXNPL2JkZDlqaXRNMnlMMFhpRkVuT3JB?=
 =?utf-8?B?aiszT1JYNFRMZG5jdVFnUWJxQnp4OVFVTFdiTjUzd25zS3JycThlYUwwNzlY?=
 =?utf-8?B?aHJVcnhCY0JOc2gxZXpwekhxWWFaODA1VEovNm05VXlrcG80SGxSbGFJVk8w?=
 =?utf-8?B?eE5NOVFUK2hxNUtqc08wWFc1Zm10aGZpSlprS1VtdUZNZHJabUVmMmVVL05F?=
 =?utf-8?Q?0Zuyq53GXg8bORWNUYfCQKIjz2Bt6cgF7yBVzsW?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0643c318-c35f-4dc8-aa38-08d9690d8e54
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 03:48:39.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l+YgwMHwkREnuZbapCoeDorGAhHHPFX/zdGIlwSYygGnbniQg0HRDEkR5SIk9I6nExjfzOX8y9Xub6U/bDvt+qxzrLFtWRDU/3W5uzkdj0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1828
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

SGkgSmVyZW15LA0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgcGF0Y2guDQoNCj4gRnJvbTog
SmVyZW15IEtlcnIgPGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1Pg0KPiBTZW50OiBGcmlkYXksIEF1
Z3VzdCAyNywgMjAyMSAxMToyMCBBTQ0KPiANCj4gSGkgQ2hpYS1XZWksDQo+IA0KPiBbYXBvbG9n
aWVzIGZvciB0aGUgcmUtc2VuZCwgZHJvcHBpbmcgSFRNTCBwYXJ0Li4uXQ0KPiANCj4gPiBUaGUg
QXNwZWVkIGVTUEkgY29udHJvbGxlciBpcyBzbGF2ZSBkZXZpY2UgdG8gY29tbXVuaWNhdGUgd2l0
aCB0aGUNCj4gPiBtYXN0ZXIgdGhyb3VnaCB0aGUgRW5oYW5jZWQgU2VyaWFsIFBlcmlwaGVyYWwg
SW50ZXJmYWNlIChlU1BJKS4NCj4gPiBBbGwgb2YgdGhlIGZvdXIgZVNQSSBjaGFubmVscywgbmFt
ZWx5IHBlcmlwaGVyYWwsIHZpcnR1YWwgd2lyZSwNCj4gPiBvdXQtb2YtYmFuZCwgYW5kIGZsYXNo
IGFyZSBzdXBwb3J0ZWQuDQo+IA0KPiBHcmVhdCB0byBoYXZlIHRoaXMgYWRkZWQgc3VibWl0dGVk
IHVwc3RyZWFtISBBIGZldyBjb21tZW50cyB0aG91Z2g6DQo+IA0KPiA+IC0tLQ0KPiA+IMKgZHJp
dmVycy9zb2MvYXNwZWVkL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDExICsN
Cj4gPiDCoGRyaXZlcnMvc29jL2FzcGVlZC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgMSArDQo+ID4gwqBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWVzcGktY3RybC5jwqAg
fCAyMDUgKysrKysrKysrDQo+ID4gwqBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLWVzcGktY3Ry
bC5owqAgfCAzMDQgKysrKysrKysrKysrDQo+ID4gwqBkcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVk
LWVzcGktZmxhc2guaCB8IDM4MCArKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZlcnMvc29jL2Fz
cGVlZC9hc3BlZWQtZXNwaS1pb2MuaMKgwqAgfCAxNTMgKysrKysrKw0KPiA+IMKgZHJpdmVycy9z
b2MvYXNwZWVkL2FzcGVlZC1lc3BpLW9vYi5owqDCoCB8IDYxMQ0KPiA+ICsrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gPiDCoGRyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtZXNwaS1wZXJpZi5o
IHwgNTM5ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoGRyaXZlcnMvc29jL2FzcGVlZC9h
c3BlZWQtZXNwaS12dy5owqDCoMKgIHwgMTQyICsrKysrKw0KPiANCj4gVGhpcyBzdHJ1Y3R1cmUg
aXMgYSBiaXQgb2RkIC0geW91IGhhdmUgdGhlIG9uZSAtY3J0bC5jIGZpbGUsIHdoaWNoIGRlZmlu
ZXMgdGhlDQo+IGFjdHVhbCBkcml2ZXIsIGJ1dCB0aGVuIGEgYnVuY2ggb2YgaGVhZGVycyB0aGF0
IGNvbnRhaW4gbW9yZSBjb2RlIHRoYW4NCj4gaGVhZGVyLXR5cGUgZGVmaW5pdGlvbnMuDQo+IA0K
PiBJcyB0aGVyZSBhbnkgcmVhc29uIHRoYXQgLWZsYXNoLCAtaW9jLCAtb29iLCAtcGVyaWYgYW5k
IC12dyBjb21wb25lbnRzIGNhbid0IGJlDQo+IHN0YW5kYXJkIC5jIGZpbGVzPw0KDQpUaGUgZVNQ
SSBzbGF2ZSBkZXZpY2UgY29tcHJpc2VzIGZvdXIgY2hhbm5lbHMsIHdoZXJlIGVhY2ggb2YgdGhl
bSBoYXMgaW5kaXZpZHVhbCBmdW5jdGlvbmFsaXR5Lg0KUHV0dGluZyB0aGUgZm91ciBjaGFubmVs
cyBkcml2ZXIgY29kZSBpbnRvIGEgc2luZ2xlIGZpbGUgbWFrZXMgaXQgaGFyZCB0byBtYWludGFp
biBhbmQgdHJhY2UuDQoNCldlIGRpZCBjb25zaWRlciB0byBtYWtlIHRoZW0gc3RhbmRhcmQgLmMg
ZmlsZXMuDQpCdXQgaXQgcmVxdWlyZXMgdG8gZXhwb3J0IGNoYW5uZWwgZnVuY3Rpb25zIGludG8g
a2VybmVsIHNwYWNlIGFsdGhvdWdoIHRoZXkgYXJlIGRlZGljYXRlZCBvbmx5IHRvIHRoaXMgZVNQ
SSBkcml2ZXIuDQpBcyBlc3BpLWN0cmwgbmVlZHMgdG8gaW52b2tlIGNvcnJlc3BvbmRpbmcgY2hh
bm5lbCBmdW5jdGlvbnMgd2hlbiBpdCBpcyBpbnRlcnJ1cHRlZCBieSBlU1BJIGV2ZW50cy4NCg0K
VG8gYXZvaWQgcG9sbHV0aW5nIGtlcm5lbCBzcGFjZSwgd2UgZGVjaWRlZCB0byBwdXQgZHJpdmVy
IGNvZGUgaW4gaGVhZGVyIGZpbGVzIGFuZCBtYWtlIHRoZSBjaGFubmVsIGZ1bmN0aW9ucyAnc3Rh
dGljJy4NCg0KQlRXLCBJIG9uY2UgZW5jb3VudGVyZWQgLmMgZmlsZSBpbmNsdXNpb24gaW4gb3Ro
ZXIgcHJvamVjdHMuIElzIGl0IHByb3BlciBmb3IgTGludXggZHJpdmVyIGRldmVsb3BtZW50Pw0K
DQo+IA0KPiBUaGVuLCBmb3IgdGhlIHVzZXJzcGFjZSBBQkk6IGl0IGxvb2tzIGxpa2UgeW91J3Jl
IGV4cG9zaW5nIGV2ZXJ5dGhpbmcgdGhyb3VnaA0KPiBuZXcgZGV2aWNlLXNwZWNpZmljIGlvY3Rs
cy4gV291bGQgaXQgbm90IG1ha2UgbW9yZSBzZW5zZSB0byB1c2UgZXhpc3RpbmcNCj4gaW50ZXJm
YWNlcz8gRm9yIGV4YW1wbGUsIHRoZSB2aXJ0dWFsIHdpcmUgYml0cyBjb3VsZCBiZSByZWd1bGFy
IEdQSU9zOyB0aGUgZmxhc2gNCj4gaW50ZXJmYWNlIGNvdWxkIGJlIGEgbXRkIG9yIGJsb2NrIGRl
dmljZS4NCj4gDQo+IEkgdW5kZXJzdGFuZCB0aGF0IHdlJ2xsIGxpa2VseSBzdGlsbCBuZWVkIHNv
bWUgbGV2ZWwgb2YgY3VzdG9tIGRldmljZSBjb250cm9sLCBidXQNCj4gdGhlIG1vcmUgd2UgY2Fu
IHVzZSBnZW5lcmljIGludGVyZmFjZXMgZm9yLCB0aGUgbGVzcyBjdXN0b20gY29kZSAoYW5kDQo+
IGludGVyZmFjZXMpIHdlJ2xsIG5lZWQgb24gdGhlIHVzZXJzcGFjZSBzaWRlLg0KPiANCg0KZVNQ
SSBjb21tdW5pY2F0aW9uIGlzIGJhc2VkIG9uIHRoZSBpdHMgY3ljbGUgcGFja2V0IGZvcm1hdC4N
CldlIGludGVuZGVkIHRvIGxldCB1c2Vyc3BhY2UgZGVjaWRlZCBob3cgdG8gaW50ZXJwcmV0IGFu
ZCBjb21wb3NlIFRYL1JYIHBhY2tldHMgaW5jbHVkaW5nIGhlYWRlciwgdGFnLCBsZW5ndGggKGVu
Y29kZWQpLCBhbmQgZGF0YS4NCklPQ1RMIGNvbWVzIHRvIG91ciBmaXJzdCBtaW5kIGFzIGl0IGFs
c28gd29ya3MgaW4gdGhlICdwYWNrZXQnIGxpa2UgcGFyYWRpZ20uDQoNCkNoaWF3ZWkNCg==
