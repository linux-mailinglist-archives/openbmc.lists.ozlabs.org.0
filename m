Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5655F401986
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 12:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H340x20yBz2xYQ
	for <lists+openbmc@lfdr.de>; Mon,  6 Sep 2021 20:10:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=YE+OYOrK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.138;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=YE+OYOrK; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300138.outbound.protection.outlook.com [40.107.130.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H340P05lmz2xfP;
 Mon,  6 Sep 2021 20:10:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KiCgzdm7MPeESUqVbmQmHVqXelNSjIzBzakkNtK7n6aDm3lQ5i4i8tYno0oUJ15yuwaouZsDpYUREBFGEng+vGOLUd9MufK7ZMmGFBrwEJDQuQ5EPwAn/c5tbW5BEPR4rc6jKYqf3pPk5d1uGXlkY3RL8+deet0urC0qtJib4t0T0RQlZ4Hp03frI7VH4flt1udOKS8M3hjyajcuxvIWVL9Psm0tq8PHRhj1DAPummUDKBE7T1PIQqsant+zFNDzUiBRXKB/yvmCnE+ZdRIvN5Gqj6C+aJ+1eJJGnZ/XD56AH46XjGwl1I746dcEBfrhcCzzMnzFodmCh5d2iNY3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8+IBMy8YO+bBw5tLNwEdiui2Ek7bRLL5ZIMDSRdi9xY=;
 b=UT19XHzpJDjSV5V8tRQmk2ShQLZS9FBG9aIwnBRfgdvss07MrQJKDNAiU7O3zYcWpiAENooobkl6ob6ooQoKeFz3tyr3PFvm+jhR0vHzQ7cZSzupHtmiIo6QFi+MixK5Z5pridMJ5vM71suo1RcRFXxqxkylhO/JKUudaObz5dJko3NvqbFpB5H61cxQYjVhn74DZyfvXMF5WL9w7s+qKYVQAD5ftft74fgQPwleZ4DmMqCpPjZ/psM2fmLxm3GimnT0FgM6HMI2F9lIkX8UeabLzE8WBrijBF92XHBdSBTi3kwCPzD3mdSNFaWjKznZAjpOKvMvCg3IN0iozxS2KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+IBMy8YO+bBw5tLNwEdiui2Ek7bRLL5ZIMDSRdi9xY=;
 b=YE+OYOrK0RkdqdS/VFyP4iPyZU26X2jOe17CUULqtcczf/T/pR/nX0aNQ4plA17TrXJ0cCnNTQXxazTyuV4M3CZV1ky9qFo+bihAt76kMFnxuhILq2sFzYp8sQU2XnLA6aGpMXUtyhfHaNxXfT+WDtdWeGO4YL4GJU6enmkOrPog/KY1k8fOCWNjKjrsAGoaphOjBQeX6o1gPZ5hyeUDofpEiYUikT4XGwrOb8M5sAGoO+NBFtYiyqAgd6i4B97HPiarxb5uMuOs1Gq3OkZ7kFfCK4RPfGArCH4vapzNXS4D4DgvvCCncRIc4u38fBF0NT0y+6m9fDNQy1Zh0TdrAg==
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com (2603:1096:203:82::18)
 by HK0PR06MB2339.apcprd06.prod.outlook.com (2603:1096:203:4c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 10:10:10 +0000
Received: from HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::df9:c3a4:7589:e812]) by HK0PR06MB3380.apcprd06.prod.outlook.com
 ([fe80::df9:c3a4:7589:e812%3]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 10:10:10 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Eddie James <eajames@linux.ibm.com>, Zev Weiss <zev@bewilderbeest.net>
Subject: RE: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
Thread-Topic: [PATCH v3] media: aspeed-video: ignore interrupts that aren't
 enabled
Thread-Index: AQHXY8SBAvwOoxspLEuYJEQdXCIVq6uPvpoAgAeIgeA=
Date: Mon, 6 Sep 2021 10:10:10 +0000
Message-ID: <HK0PR06MB338081E134AA6F43ECBCBA4DF2D29@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210617220229.7352-1-zev@bewilderbeest.net>
 <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
In-Reply-To: <46edf81d60a38747f7d2511f840253a1c6867652.camel@linux.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 650eec36-8a5b-4d87-13b8-08d9711e8298
x-ms-traffictypediagnostic: HK0PR06MB2339:
x-microsoft-antispam-prvs: <HK0PR06MB233993B445CC66299137EACEF2D29@HK0PR06MB2339.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:313;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i1bpud7i8Rx2l3R+IyliUnFA2JDVlKoXAPDXpwmDxqVgQgzm7mJxc+oRm1MIgh5TBCLOJcwLDk7/cvKPNzDhefWWD0Cm1I6dXQcFUE6CprCeVJcO94yxF9lgmHYmcPCh66KQsT5x/00E+Ttz/Hc+eFcctjxtS8nVGWmzWTX0m3eOBgIoLo8tui3jFdkiIl+LL5MifCwSe53hgVTmQ8D5LU2W8OMQjNU8oNTmyVUQTp3s0Wy6fhm1aZnEMFzFcYrQ1oAaNlsQcfvS32bGyYMwwTZN/IKRAv7uH6yt2toGT0ffpJ7k5lGc5ZXoczbhSjvY7HZd5Q2l/RJ2kumdla5wBpvfxwL5lnmcbYaaAPLEST77OEnZPQMr2G2vvv9XtNisioPuRk8z70tBJFItFIY9tVUOd0ea3R34mD1HQuiEPg3vGpPdJGjYdNSiL9Vcml3W9lszgKoUmIIHm5UVJtDS9PCSpvGAmVil+kDJA0/3SoP3nkd9Lg1S69dpHHHx1uAuAuWOpXLisRU/SjR73lddOGbeo9iEVUhJbZox6/Yyz/JBhqr0TSxuSoNoFwk+SeGhLqxFFpg47mlNh3RoQJAvVFuI8PE5UyJJ400K9Rkq2iz09Dec41NlmHH6qDc7X/dyxDhXIW1lyeoE9PBcjyk/4wZ4VZeKEkHJMfDzWIP1M299J9CS7x0kbdMoKe3onInhslspMw/uMo550vXndkA6L7sTMtaaZTSs94Xu6T7fRmdiCGErvyZoIvGVrVjl6px3+jaro492PiWaRrPBUCVBOGfrmbJSzibcdh+KsM37epY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3380.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(39840400004)(366004)(122000001)(86362001)(38100700002)(4326008)(76116006)(5660300002)(71200400001)(316002)(66556008)(66476007)(66446008)(64756008)(478600001)(66946007)(2906002)(55016002)(9686003)(966005)(110136005)(54906003)(53546011)(6506007)(33656002)(7696005)(38070700005)(186003)(8936002)(26005)(7416002)(8676002)(83380400001)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckQwc1FZUXdHRkZXNzYrTDFiR2JYL0o4N2dEM09QY0l6cjZNZGNjaVkvOFQ3?=
 =?utf-8?B?ZjVWNE9LcEQ0NE1kL0dFVnNYTXoyWEU3SUsybUJjekdmSmV0dHZhYlUrZVl1?=
 =?utf-8?B?WW9XOG45TzNqazdJSHYrY2tBbDNaS3FTdEllblJOWHlGYkxLWElwdkc5YmVZ?=
 =?utf-8?B?MmpxYnFocEw0Yk9DTEJqbmNLcXlqb2d3MnFVa0ZhUTFzcW16eXIzcW9xQWp3?=
 =?utf-8?B?OWh1THJhaWp4VDZDUGFENlNYTnhiMTg0Rlo2OWRLM1V3dDFVblh0UThVcjFT?=
 =?utf-8?B?Qm1CUjJrQjdrbzM5dHhQc1g0Q3pNUmNRZTh5dHR1emFaSTNtSUllUll6Ukhn?=
 =?utf-8?B?MkRUSStRRlYvL3NQOVZjZk1NN1g3QThCM2Q0d052amJMclZ5YWFKM01QYXNF?=
 =?utf-8?B?VXBqU0MycHFHUzVGRW5yYnNOcEZ5VVZSV0pwMjJXQ0lTUVZEazJRYW0rTlhU?=
 =?utf-8?B?UU9JdHNyMjVRRmNnTnlTMTRMS1RWMVY1U3R5N0g4eC8yUDlhOGxQNk9JTVR2?=
 =?utf-8?B?TGsxdFduaE1FQzdXYmkrWDFMTk5OTlY5Y3A3b0VsYWhkNmxoTzFJcC9UM1pu?=
 =?utf-8?B?MjZ0aWhGYnhWWlQzMG1NQURQYnpYMXY3UDQwcjZKRE5TRGJjYUNHdWhybk5q?=
 =?utf-8?B?ckYxWTg0RS9qS1NWemM5VFpZb21IQlFKenlITFk1UHV6cXgrWWVnRXFvU0tN?=
 =?utf-8?B?aUlETXZSTnN1bFZjNmxFNjVMdXEzei9OWGtXVmszanNwRDRhclZyeVpNKzh0?=
 =?utf-8?B?ZEZncm01Rk1LVmtvdXVvSTBZa3lCdXNhK3MyMkdWNGZHTEhFR3dWOWFITjBV?=
 =?utf-8?B?MnNIWWV0Z1JKbEpVaG9YenRUS0ZhT2N4MXozbGNzcTc5UTBENmVrb29QcElk?=
 =?utf-8?B?akJ4dGJXaUxNc1ZLZXc2Zkw4YVJtZHhaa0FrM0NtQWRBK0tCTlZLNU1xc1A5?=
 =?utf-8?B?RmZvWW04Zm5lZFFGSTQvbmRsODJZZjczb1ljTG4weHJ1bWg3Z0lKUnorbnBI?=
 =?utf-8?B?bjhKVGFXRkR4MC9STERIVlFJSTcveElCRlhtc2JhdjVvR1BlRjV6TVFlQU9V?=
 =?utf-8?B?NWRpb21pNEdJaUFSWWN1bjh6Wkl0OUgvc1JpdExvTklpbXBKRndEYmh5WVZo?=
 =?utf-8?B?dHprVkZpK1hIWmhsTHY0KzFtcExPYXpnTGltRlZsaCtQaVVxSEpieHRNeGpK?=
 =?utf-8?B?akFUUDlJc3VVTSs0THVhNVRnODJzR2dKSzA4NXJlQThWSGtJemxmQzhqektz?=
 =?utf-8?B?V2wwWUtLcDVkeDV1Y0M1dUFLdCtSQjNJQWYzd3BTbUJYbDQ5TmsyTzcwRnJQ?=
 =?utf-8?B?Z1h5ZEpxUUJYRmdCekR4YU95V1ZRZ1NqTmJXWmhmMHZTVDhDbFZLeVRJT3hP?=
 =?utf-8?B?MnBLVGJOUHN6ckkwNGJzWURaUjlSblZNY25ZLzZ2bXNJaFF5RnhoQW1OZ1VI?=
 =?utf-8?B?TnFrK0pvRXFPVWx3eUpTNnNNbDVOaXc4NGJtcUhLUzhJbExwcTg0aFVvSzJL?=
 =?utf-8?B?SWI3dXRQQ3l2K0UzZzZsMC9kQ0VNM0ZtT2lGRUJ0eStDaC8zaWFoNVF2WVhR?=
 =?utf-8?B?TG1uaWMzMGJzSWh0aHJCM2tGYzBFZjgzbjZVTW9tTERyQ2hyeUNJMXlndmtG?=
 =?utf-8?B?MDZTVVNsRi9xOU5sTFF3OVVBUWVSeW5rNkUzQVlOKzVpTmpFY2JPRGlFcENi?=
 =?utf-8?B?bXYzYU9IekNBczV1cU5sdHg3MitCQ3NPbW1xRlJQRlNCRnYxcjRDdWxtdGl0?=
 =?utf-8?Q?8+sVit5FFdsB5BOuff6xECGvUgBXpFmd9LoqSm+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3380.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650eec36-8a5b-4d87-13b8-08d9711e8298
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 10:10:10.1789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AAvWm6ctjdx25TLhQczlAhSacNlh18ugCuPkmTsLoA2Rjiikb658nt4FhlSP5xeQ3Y1a/C2e8VOYl67APIcMBS0og+9freQD/btgRAqyNhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2339
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFZGRpZSBKYW1lcyA8ZWFqYW1l
c0BsaW51eC5pYm0uY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxLCAyMDIxIDEx
OjA3IFBNDQo+IFRvOiBaZXYgV2Vpc3MgPHpldkBiZXdpbGRlcmJlZXN0Lm5ldD4NCj4gQ2M6IEph
ZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT47IFJ5YW4gQ2hlbg0KPiA8
cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPjsgbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7
IEFuZHJldyBKZWZmZXJ5DQo+IDxhbmRyZXdAYWouaWQuYXU+OyBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IE1hdXJvIENhcnZhbGhvIENo
ZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2M10gbWVkaWE6IGFzcGVlZC12aWRlbzogaWdub3JlIGludGVycnVwdHMgdGhhdCBhcmVu
J3QNCj4gZW5hYmxlZA0KPiANCj4gT24gVGh1LCAyMDIxLTA2LTE3IGF0IDE3OjAyIC0wNTAwLCBa
ZXYgV2Vpc3Mgd3JvdGU6DQo+ID4gQXMgcGFydGlhbGx5IGFkZHJlc3NlZCBpbiBjb21taXQgNjVk
MjcwYWNiMmQ2ICgibWVkaWE6IGFzcGVlZDogY2xlYXINCj4gPiBnYXJiYWdlIGludGVycnVwdHMi
KSwgdGhlIEFTcGVlZCB2aWRlbyBlbmdpbmUgc29tZXRpbWVzIGFzc2VydHMNCj4gPiBpbnRlcnJ1
cHRzIHRoYXQgdGhlIGRyaXZlciBoYXNuJ3QgZW5hYmxlZC4gIEluIGFkZGl0aW9uIHRvIHRoZQ0K
PiA+IENBUFRVUkVfQ09NUExFVEUgYW5kIEZSQU1FX0NPTVBMRVRFIGludGVycnVwdHMgZGVhbHQg
d2l0aCBpbiB0aGF0DQo+ID4gcGF0Y2gsIENPTVBfUkVBRFkgaGFzIGFsc28gYmVlbiBvYnNlcnZl
ZC4gIEluc3RlYWQgb2YgcGxheWluZw0KPiA+IHdoYWNrLWEtbW9sZSB3aXRoIGVhY2ggb25lIGlu
ZGl2aWR1YWxseSwgd2UgY2FuIGluc3RlYWQganVzdCBibGFua2V0DQo+ID4gaWdub3JlIGV2ZXJ5
dGhpbmcgd2UgaGF2ZW4ndCBleHBsaWNpdGx5IGVuYWJsZWQuDQo+IA0KPiBTdXNwZWN0IHRoaXMg
d2lsbCBmaXggYW4gaW50ZXJtaXR0ZW50IHByb2JsZW0gb24gQVNUMjUwMCB3aXRoIHNjcmVlbnNh
dmVyLg0KPiBDaGFuZ2UgbG9va3MgZ29vZCwgdGhhbmtzIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEVk
ZGllIEphbWVzIDxlYWphbWVzQGxpbnV4LmlibS5jb20+DQo+IA0KUmV2aWV3ZWQtYnk6IFJ5YW4g
Q2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
WmV2IFdlaXNzIDx6ZXZAYmV3aWxkZXJiZWVzdC5uZXQ+DQo+ID4gLS0tDQo+ID4NCj4gPiBDaGFu
Z2VzIHNpbmNlIHYyIFsxXToNCj4gPiAgLSBtaW5vciBjb21taXQgbWVzc2FnZSBpbXByb3ZlbWVu
dHMNCj4gPg0KPiA+IENoYW5nZXMgc2luY2UgdjEgWzBdOg0KPiA+ICAtIGRyb3BwZWQgZXJyb3Ig
bWVzc2FnZQ0KPiA+ICAtIHN3aXRjaGVkIHRvIGEgYmxhbmtldC1pZ25vcmUgYXBwcm9hY2ggYXMg
c3VnZ2VzdGVkIGJ5IFJ5YW4NCj4gPg0KPiA+IFswXQ0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWFybS1rZXJuZWwvMjAyMDEyMTUwMjQ1NDIuMTg4ODgtMS16ZXZAYmUNCj4gPiB3
aWxkZXJiZWVzdC5uZXQvDQo+ID4gWzFdDQo+ID4NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
b3BlbmJtYy8yMDIxMDUwNjIzNDA0OC4zMjE0LTEtemV2QGJld2lsZGVyYmVlcw0KPiA+IHQubmV0
Lw0KPiA+DQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZpZGVvLmMgfCAxNiAr
KysrKystLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vYXNwZWVkLXZpZGVvLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZp
ZGVvLmMNCj4gPiBpbmRleCA3YmI2YmFiZGNhZGUuLjc3NjExYzI5NmEyNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC12aWRlby5jDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQtdmlkZW8uYw0KPiA+IEBAIC01NjMsNiArNTYzLDEy
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBhc3BlZWRfdmlkZW9faXJxKGludCBpcnEsIHZvaWQNCj4g
PiAqYXJnKQ0KPiA+ICAJc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8gPSBhcmc7DQo+ID4gIAl1
MzIgc3RzID0gYXNwZWVkX3ZpZGVvX3JlYWQodmlkZW8sIFZFX0lOVEVSUlVQVF9TVEFUVVMpOw0K
PiA+DQo+ID4gKwkvKg0KPiA+ICsJICogSGFyZHdhcmUgc29tZXRpbWVzIGFzc2VydHMgaW50ZXJy
dXB0cyB0aGF0IHdlIGhhdmVuJ3QNCj4gPiBhY3R1YWxseQ0KPiA+ICsJICogZW5hYmxlZDsgaWdu
b3JlIHRoZW0gaWYgc28uDQo+ID4gKwkgKi8NCj4gPiArCXN0cyAmPSBhc3BlZWRfdmlkZW9fcmVh
ZCh2aWRlbywgVkVfSU5URVJSVVBUX0NUUkwpOw0KPiA+ICsNCj4gPiAgCS8qDQo+ID4gIAkgKiBS
ZXNvbHV0aW9uIGNoYW5nZWQgb3Igc2lnbmFsIHdhcyBsb3N0OyByZXNldCB0aGUgZW5naW5lIGFu
ZA0KPiA+ICAJICogcmUtaW5pdGlhbGl6ZQ0KPiA+IEBAIC02MjksMTYgKzYzNSw2IEBAIHN0YXRp
YyBpcnFyZXR1cm5fdCBhc3BlZWRfdmlkZW9faXJxKGludCBpcnEsIHZvaWQNCj4gPiAqYXJnKQ0K
PiA+ICAJCQlhc3BlZWRfdmlkZW9fc3RhcnRfZnJhbWUodmlkZW8pOw0KPiA+ICAJfQ0KPiA+DQo+
ID4gLQkvKg0KPiA+IC0JICogQ0FQVFVSRV9DT01QTEVURSBhbmQgRlJBTUVfQ09NUExFVEUgaW50
ZXJydXB0cyBjb21lIGV2ZW4NCj4gPiB3aGVuIHRoZXNlDQo+ID4gLQkgKiBhcmUgZGlzYWJsZWQg
aW4gdGhlIFZFX0lOVEVSUlVQVF9DVFJMIHJlZ2lzdGVyIHNvIGNsZWFyIHRoZW0NCj4gPiB0bw0K
PiA+IC0JICogcHJldmVudCB1bm5lY2Vzc2FyeSBpbnRlcnJ1cHQgY2FsbHMuDQo+ID4gLQkgKi8N
Cj4gPiAtCWlmIChzdHMgJiBWRV9JTlRFUlJVUFRfQ0FQVFVSRV9DT01QTEVURSkNCj4gPiAtCQlz
dHMgJj0gflZFX0lOVEVSUlVQVF9DQVBUVVJFX0NPTVBMRVRFOw0KPiA+IC0JaWYgKHN0cyAmIFZF
X0lOVEVSUlVQVF9GUkFNRV9DT01QTEVURSkNCj4gPiAtCQlzdHMgJj0gflZFX0lOVEVSUlVQVF9G
UkFNRV9DT01QTEVURTsNCj4gPiAtDQo+ID4gIAlyZXR1cm4gc3RzID8gSVJRX05PTkUgOiBJUlFf
SEFORExFRDsgIH0NCj4gPg0KDQo=
