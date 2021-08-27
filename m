Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C93F96CD
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 11:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwvRr52lpz2ypC
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 19:24:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ic6MfGDH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.112;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=ic6MfGDH; 
 dkim-atps=neutral
X-Greylist: delayed 1156 seconds by postgrey-1.36 at boromir;
 Fri, 27 Aug 2021 19:23:29 AEST
Received: from APC01-HK2-obe.outbound.protection.outlook.com (unknown
 [40.107.130.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwvQn21qJz2ypB;
 Fri, 27 Aug 2021 19:23:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcapMYapQnkhlSgSfNSCwvqGH1Xk23cCXpLn5qzCtjb97MChZYZeASQyO2jLAY79R5Sme223LloOAkidsc1i/fiaZybur8qD5+lmR4uR0XAinf5Y9UUBdKoGS9BQeyTKgNpH0vbAUOkdHi4etiI4rfUO4+X1qefgjE0pUQh/qFNDVcZ5z4RuqVswJqrP5E4jn4iypIUvoFYgSs58Yxwg0OhzHlScdNeGRlGgvE8pSXLQWraOZW4mrxaJShKDWlkb2uEeDCWbY2+6BcI31y6EHfAnFU5zCrXa+m1hCvAkn8gtxCyC09ccSV0jUITgmn8XUDc4tynXVeneLRWg/X6AAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPIgT6wbdVASTTCXbXX8lnJsc8pJcABsnZsSuTuRCyY=;
 b=PbnHxZfet5jeutAzFFMQZ2rK4WD14ITHuekcAJbRmIgc8bD6MVkKbLkW2QKLUuxgpBBpbzdvzXTOyoAsic0IhBGwDlmwgLG/uSTal+1/u1ARtR0Sko/x6aioxRUFgQY7w9rJ6lDX3ZjSH+1arH3s7aquSvLbBzFtU9kP1ptLwI3D//KA7EzhClJBaP2VU0jNTO/8S4OdkwsVpRyuJ5n0iw10aggMjnQgW4A/sPp+19jyji/rcON++XBYyCTjSX6zqeRtWXrRwpW2g7FkY8Rj8tXIBAiz4zcZfQLLny9NCxvkygDKC5J/fQCceBkpkn92hczFgXDpfkPJtSseMzYThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPIgT6wbdVASTTCXbXX8lnJsc8pJcABsnZsSuTuRCyY=;
 b=ic6MfGDHTgLWYOsnKn6eqWM53bIXw99YC/pliI93tzLrkEW7h/zV0J7wddaMNnQq/Aiq2PmyH0D16bcFQRduciMZ8gc86oqADjX6CZvaS5jlxWzxDxr4uJJvIjMz/77bIi4JFS/vKLb1inwmurlPXl8a3ljmZWVCzNMxV1SjcTYXNo3GsnYLsjZnUGR3BNd/QnUjurdLJK9s/SzgaQ4InfroOzKchSz06DfBEBkF/JZuZEOqSh15PAkuKuuoj7Ck+eIGSshFHIWiaS+EcDM9YwIPLmhsovHFcWPjNFolq0duoe03BNeS8l8QKZ1X/NZRy96A3P8v2goIUq9DuFQpAQ==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR06MB3458.apcprd06.prod.outlook.com (2603:1096:202:38::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 08:49:13 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::4c26:6668:f551:3a62%3]) with mapi id 15.20.4436.025; Fri, 27 Aug 2021
 08:49:13 +0000
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
Thread-Index: AQHXmkI+4Lhg3IxgrEO2OY2fsCr5kauGsFeAgAAAMrCAABUwgIAAN5MA
Date: Fri, 27 Aug 2021 08:49:13 +0000
Message-ID: <HK0PR06MB3779859F4193D2F34759AFEC91C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
 <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
 <7e7378c49ecfb21fef6a0640f92c1b3a7a5878d0.camel@codeconstruct.com.au>
 <HK0PR06MB377997422D9508894936E39691C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <3f2feea6c2fb21c2fdcb419cdc7ceddf3ade06ee.camel@codeconstruct.com.au>
In-Reply-To: <3f2feea6c2fb21c2fdcb419cdc7ceddf3ade06ee.camel@codeconstruct.com.au>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeconstruct.com.au; dkim=none (message not signed)
 header.d=none;codeconstruct.com.au; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3edf045-e72f-4107-81a6-08d969378baa
x-ms-traffictypediagnostic: HK2PR06MB3458:
x-microsoft-antispam-prvs: <HK2PR06MB34580436900DC8DBD7CE2FE191C89@HK2PR06MB3458.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XrzgAbSjOYNjnLPyR2DxN6mOHigONpSsOotU4xXuz+xiMSkIDUbQfwLhRMcjMHYdzQBFv3bfV6HZd8WGRzgNWJBOt/id4LStmblvwO2Zbdt4As2/4L4BB/ck37DOzbaOa75Ib7T5eahXgz9pxDCw0CgnG3Uy5J8WVfo05tEb6ZauwfAZI24+mnspaSUfX+WoDlbIP69m7nHoL4CCynuPjrGSC718GeBvWvflz0KsRUGKyieKsmzU9Cz6Yiqzw0FsxSli+KhgyL5AxQSE/eOXNockrPNflcR6woSaKRLZGUr3sfeCmwR6JUcC8f9hK+UeRYFiWIYxn5B2lDW++pwJSUYWRFXnowWQmm1uK8Cfp3QCGCmyWJL1GEVh6/bxn9SZZObJvaSgvGMVG6BF6z06BhhUW5BkfyiD+MUVFYmueOxhP7YxvwEeHTM2FK6+anoc/GHLYnsftN2yQQ8N1K5FmPmLytp5AQyeZHtqGjBPmhPgEihVbDxLm4rt4LoIzoMe1curss+nC6fDhn3vJIEQa4gwOJ/mkJpId00J1jmByp8/N87zLT2WbX8EBHjbLTYhuW1SP9bMuqtA+uIOfw509W5d0OrFwdMdTR4/tsh2mCyURFWuroMmjstcczRc8xrSMNczfZaLgeX08KhWG+ssANyjmQ9m2iyHf5fz8cNtjPlz0jYYiKnmNDl7PCCCpB8kksa9Yj7GctTF8HrbGb0Ggg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(396003)(366004)(39840400004)(76116006)(83380400001)(64756008)(66556008)(66476007)(9686003)(2906002)(316002)(86362001)(110136005)(66946007)(66446008)(38070700005)(5660300002)(52536014)(71200400001)(26005)(8936002)(33656002)(122000001)(8676002)(7696005)(6506007)(186003)(38100700002)(478600001)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UE4yWGVRYlZLRWIvS0NIT3Z5elBLTXhkNVFPKzFPYkhCbzh2RjFIOEsyZTN2?=
 =?utf-8?B?SDZLd0dFYk5hOFcxdkdORDRMTWtOOG1IN2lHNVpoUFJ3Nkdhd3gyaWtmQVpD?=
 =?utf-8?B?d0EwaGh4eWZmQTFZRlhzM2d0SlFkbjN4aXVOTk5qZHBBU1JjbEdpRTVZemFW?=
 =?utf-8?B?VFZVK2ZyY2F6emQ0aTg0UFhIbUhQSTZHT1RYUFc0OFRuNGplTWlMWmhSbnJW?=
 =?utf-8?B?WU93Z3ViZU8xaE1BY1dQZjFNaUdNMTFWK1JRTWluYkFycU45Y3luZ1lKTjNj?=
 =?utf-8?B?cERQT3E0UG4wcnhZM08yV0RUUmw0UHZ1VXNDTWpqNnljUzYzVzBySGpzWFN6?=
 =?utf-8?B?alhjdVphb1lTMklkcGpJUCtwcXdPaGZKMHk2aVZLUE5RRnl2Q0Q0YlFoMXNn?=
 =?utf-8?B?bGxocXpkbG1UTndZa2kzUmRWODk4RkpVRkh4ZWcrbnErWjVZYWc4elBzODFs?=
 =?utf-8?B?aWVTd3RnVFJidmVxb3NmWld4UloxbEpyenZ5VFlyVGxsV3cwOVZDbEZBaSts?=
 =?utf-8?B?bGZrSzFtQkN4YnBoUmZsWDR6aTlmc0R6aWhCRnl4ZmJpMU92Mkd5SUpzTy9K?=
 =?utf-8?B?YlRiZmk0cVdkVmZKc0RSYmdHVzQ0NkIrRkVMSTF5NXhkTjk3K3hXaE51amRE?=
 =?utf-8?B?OCtYd0ZZOGs4STByd3o2alUvclF3bVIycG9KVnRvZlFYODlkWEVTZ21kVTVy?=
 =?utf-8?B?QXQwVkhseURyYzBlR242TlBXSU0vbnczVys1c2pieTlrTStWWXB2Ky83N21E?=
 =?utf-8?B?UlowYk9lYUxESVRXVFFmSFhWaGVDekREbTRjUEI3cGdEcmgwcUhMUXNmcVU1?=
 =?utf-8?B?a2Vjci9aQ0R2ZEE5bXQ4R3FqcVV4TG9iTnhBemlnQkloSmo1Rk9mb2VwN2Ir?=
 =?utf-8?B?WDE5NWdrY1dzaWtPVGhDZ2NiTytRdFRQNW1vK1hXSHc3dVVTR0hXcjByVTFx?=
 =?utf-8?B?WWh5OERLWUNLY3dtR3JzeVJ4Wk01QUpRYlIwOC9wSWZWTWlPOSsxYzRtL0pI?=
 =?utf-8?B?VU1sQ3ZUNFkwSnBxQmZocDBtdWc4UmhqeHlhYk9NT3dVS3dYK2J2QjVabEE4?=
 =?utf-8?B?eTQ5a2VNR3FNTWczai9jaTFOU0FuSDZjVzVQZzZESUgyWGF3YzZrMWR1Qk9U?=
 =?utf-8?B?Tm45MzAyODI1TDNFTmVmU2JJazhkbmhhUGwzU1pQRnRzRVd4aTdmdjNBSUZ1?=
 =?utf-8?B?MnRKRG5hcmQxbVp6Zm4vckw5MDRlcE9pSjREMXdaUi9yNFR2UnAzUDJpQnQv?=
 =?utf-8?B?WUhpQlRkL1djalhNS1Jja2pQeEp0RlBMbDBFVWMxUnJlTWVMMGpxNmgvR0FN?=
 =?utf-8?B?ZGZXMWNoaW1YU0d6Wm95SlR6ZHpMQ3VXV1VYM0JTOVdGVjZqZUVkZVMvQTlB?=
 =?utf-8?B?M000SDZKc2xxeWlHMVVNQmxRT2hhczVHcnJDT2J0dmpldE9tOUJ3Y2VuTU12?=
 =?utf-8?B?aHBvQ1VzMCtRbEUvUkNJa244aUVQUjVjclJBenpYYW9rMW5GWndUSDRCUkE1?=
 =?utf-8?B?enAvNjNJQW5TTWpaM2hON0hNbWpjYWhMUkNobTdiRW1oU3hvOG5JazVKWFJE?=
 =?utf-8?B?TU9aMFFON1RCSm5rOWlGNzh1UlFaRDVPbHUrM05MM21ucndDcUxzV2tjeWY2?=
 =?utf-8?B?YTAyZEVpcWh1QnRMY1lyVkszVmZpRWFxZll5RkkxSnhMKzlUN1F5V2Z1RHls?=
 =?utf-8?B?cjBXWmVSTTVibUFJWEFmTFlCM0pMbndKUmgra0x5K21NVCsxMlUzY0NPNUZZ?=
 =?utf-8?Q?6l34AhdZwTTS7BFf9QEddO9oN+Re5yuv+8AyNwf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3edf045-e72f-4107-81a6-08d969378baa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 08:49:13.4912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aj3i+VZFtPJQfGkoEN7NdbZ5A/FfZzh9EeogdVLXocu/zj9n90tA1C+F0yBe7+hwMvxrY+COUD8ADeNCGJ2rJU3UPZnc7D+3WMEFImJYMTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3458
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

SGkgSmVyZW15DQoNCj4gRnJvbTogSmVyZW15IEtlcnIgPGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1
Pg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyNywgMjAyMSAxMjozNyBQTQ0KPiANCj4gSGkgQ2hp
YXdlaSwNCj4gDQo+ID4gVGhlIGVTUEkgc2xhdmUgZGV2aWNlIGNvbXByaXNlcyBmb3VyIGNoYW5u
ZWxzLCB3aGVyZSBlYWNoIG9mIHRoZW0gaGFzDQo+ID4gaW5kaXZpZHVhbCBmdW5jdGlvbmFsaXR5
LiAgUHV0dGluZyB0aGUgZm91ciBjaGFubmVscyBkcml2ZXIgY29kZSBpbnRvDQo+ID4gYSBzaW5n
bGUgZmlsZSBtYWtlcyBpdCBoYXJkIHRvIG1haW50YWluIGFuZCB0cmFjZS4NCj4gDQo+IFllcCwg
dW5kZXJzdG9vZC4NCj4gDQo+ID4gV2UgZGlkIGNvbnNpZGVyIHRvIG1ha2UgdGhlbSBzdGFuZGFy
ZCAuYyBmaWxlcy4NCj4gPiBCdXQgaXQgcmVxdWlyZXMgdG8gZXhwb3J0IGNoYW5uZWwgZnVuY3Rp
b25zIGludG8ga2VybmVsIHNwYWNlIGFsdGhvdWdoDQo+ID4gdGhleSBhcmUgZGVkaWNhdGVkIG9u
bHkgdG8gdGhpcyBlU1BJIGRyaXZlci4NCj4gDQo+IFdoYXQgZG8geW91IG1lYW4gYnkgImV4cG9y
dCBpbnRvIGtlcm5lbCBzcGFjZSIgaGVyZT8gVGhlIGZ1bmN0aW9uIHByb3RvdHlwZXMNCg0KVGhl
IGNoYW5uZWwgZnVuY3Rpb25zIHdpbGwgYmUgdmlzaWJsZSB0byBhbGwga2VybmVsIGRyaXZlciBm
aWxlcy4NCg0KPiBuZWVkIHRvIGJlIGF2YWlsYWJsZSB0byB5b3VyIG1haW4gKC1jdHJsLmMpIGZp
bGUsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB5b3UncmUNCj4gcHV0dGluZyB0aGUgZW50aXJlIGZ1
bmN0aW9ucyBpbiBhIGhlYWRlciBmaWxlLCBvciBqdXN0IHRoZSBwcm90b3R5cGUuIFRoZXJlJ3MN
Cj4gZG9lc24ndCBuZWVkIHRvIGJlIGFueSBkaWZmZXJlbmNlIGluIHZpc2liaWxpdHkgb3V0c2lk
ZSBvZiB5b3VyIG93biBtb2R1bGUgaWYNCj4geW91IHdlcmUgdG8gZG8gdGhpcyB0aGUgdXN1YWwg
d2F5Lg0KDQpNYXliZSBJIHdhcyB0cnlpbmcgdG8gbWFrZSBjaGFubmVscyBmdW5jdGlvbiB2aXNp
YmxlIG9ubHkgdG8gZXNwaS1jdHJsLmMgdG9vIGZhci4NCkkgd2lsbCByZXZpc2UgdGhlIGRyaXZl
ciB0byBwcmVzZW50IGluIHRoZSB1c3VhbCAuYyB3YXkuDQoNCj4gDQo+ID4gQXMgZXNwaS1jdHJs
IG5lZWRzIHRvIGludm9rZSBjb3JyZXNwb25kaW5nIGNoYW5uZWwgZnVuY3Rpb25zIHdoZW4gaXQN
Cj4gPiBpcyBpbnRlcnJ1cHRlZCBieSBlU1BJIGV2ZW50cy4NCj4gPg0KPiA+IFRvIGF2b2lkIHBv
bGx1dGluZyBrZXJuZWwgc3BhY2UsIHdlIGRlY2lkZWQgdG8gcHV0IGRyaXZlciBjb2RlIGluDQo+
ID4gaGVhZGVyIGZpbGVzIGFuZCBtYWtlIHRoZSBjaGFubmVsIGZ1bmN0aW9ucyAnc3RhdGljJy4N
Cj4gPg0KPiA+IEJUVywgSSBvbmNlIGVuY291bnRlcmVkIC5jIGZpbGUgaW5jbHVzaW9uIGluIG90
aGVyIHByb2plY3RzLiBJcyBpdA0KPiA+IHByb3BlciBmb3IgTGludXggZHJpdmVyIGRldmVsb3Bt
ZW50Pw0KPiANCj4gSXQgY2FuIGJlLCBqdXN0IHRoYXQgaW4gdGhpcyBjYXNlIGl0J3MgYSBiaXQg
dW51c3VhbCwgYW5kIEkgY2FuJ3Qgc2VlIGEgZ29vZCByZWFzb24NCj4gZm9yIGRvaW5nIHNvLiBU
aGlzIGNvdWxkIGp1c3QgYmUgYSBzdGFuZGFyZCBtdWx0aXBsZS1zb3VyY2UtZmlsZSBtb2R1bGUu
DQo+IA0KPiA+IGVTUEkgY29tbXVuaWNhdGlvbiBpcyBiYXNlZCBvbiB0aGUgaXRzIGN5Y2xlIHBh
Y2tldCBmb3JtYXQuDQo+ID4gV2UgaW50ZW5kZWQgdG8gbGV0IHVzZXJzcGFjZSBkZWNpZGVkIGhv
dyB0byBpbnRlcnByZXQgYW5kIGNvbXBvc2UNCj4gPiBUWC9SWCBwYWNrZXRzIGluY2x1ZGluZyBo
ZWFkZXIsIHRhZywgbGVuZ3RoIChlbmNvZGVkKSwgYW5kIGRhdGEuDQo+ID4gSU9DVEwgY29tZXMg
dG8gb3VyIGZpcnN0IG1pbmQgYXMgaXQgYWxzbyB3b3JrcyBpbiB0aGUgJ3BhY2tldCcgbGlrZQ0K
PiA+IHBhcmFkaWdtLg0KPiANCj4gQnV0IHlvdSdyZSBub3QgYWx3YXlzIGV4cG9zaW5nIGEgcGFj
a2V0LWxpa2UgaW50ZXJmYWNlIGZvciB0aGlzLiBGb3IgZXhhbXBsZSwNCj4geW91ciB2aXJ0dWFs
LXdpcmUgaW50ZXJmYWNlIGp1c3QgaGFzIGEgZ2V0L3NldCBpbnRlcmZhY2UgZm9yIGJpdHMgaW4g
YSByZWdpc3Rlcg0KPiAocGx1cyBzb21lIFBDSCBldmVudCBoYW5kbGluZywgd2hpY2ggbWF5IG5v
dCBiZSBhcHBsaWNhYmxlIHRvIGFsbA0KPiBwbGF0Zm9ybXMuLi4pLg0KPiANCj4gVGhlIG90aGVy
IGNoYW5uZWxzIGRvIGxvb2sgbGlrZSBtb3JlIG9mIGEgcGFja2V0IGludGVyZmFjZSB0aG91Z2gs
IGJ1dCBpbiB0aGF0DQo+IGNhc2UgSSdtIG5vdCBjb252aW5jZWQgdGhhdCBhbiBpb2N0bCBpbnRl
cmZhY2UgaXMgdGhlIGJlc3Qgd2F5IHRvIGdvIGZvciB0aGF0Lg0KPiBZb3UncmUgZXNzZW50aWFs
bHkgc2VuZGluZyBhIChsZW5ndGgsIHBvaW50ZXIpIHBhaXIgb3ZlciB0aGUgaW9jdGxzIHRoZXJl
LCB3aGljaA0KPiBzb3VuZHMgbW9yZSBsaWtlIGEgd3JpdGUoKSB0aGFuIGFuIGlvY3RsKCkuDQoN
CkluIG1vc3QgY2FzZXMsIHllcy4gDQpDdXJyZW50bHkgb25seSB0aGUgcGVyaXBoZXJhbCBjaGFu
bmVsIGhhcyBtb3JlIHRoYW4gdGhlIDIgKHB1dCB0eC9nZXQgcngpIElPQ1RMIGNvZGUuDQpXZSB0
aGluayBpdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBtYWtlIHRoZSB1c2VyIGludGVyZmFjZXMg
b2YgYWxsIGNoYW5uZWxzIGNvbnNpc3RlbnQgdXNpbmcgSU9DVEwuDQoNCj4gDQo+IFJlZ2FyZGxl
c3Mgb2YgdGhlIGNob2ljZSBvZiBpbnRlcmZhY2UgdGhvdWdoLCB0aGlzIHdpbGwgZGVmaW5pdGVs
eSBuZWVkIHNvbWUNCj4gZG9jdW1lbnRhdGlvbiBvciBkZXNjcmlwdGlvbiBvZiB0aGUgQVBJLCBh
bmQgdGhlIGlvYyBoZWFkZXIgdG8gYmUgc29tZXdoZXJlDQo+IHVzZWZ1bCBmb3IgdXNlcnNwYWNl
IHRvIGNvbnN1bWUuDQo+IA0KPiBXaXRoIHRoYXQgZG9jdW1lbnRlZCwgd2UnZCBoYXZlIGEgYmV0
dGVyIGlkZWEgb2YgaG93IHRoZSBuZXcgQUJJIGlzDQo+IHN1cHBvc2VkIHRvIHdvcmsuDQoNClN1
cmUuIG1vcmUgY29tbWVudHMgd2lsbCBiZSBhZGRlZCBpbiBhc3BlZWQtZXNwaS1pb2MuaCB0byBk
ZXNjcmliZSB0aGUgdXNhZ2UgYW5kIHRoZSBwdXJwb3NlLg0KDQpUaGFua3MgZm9yIHlvdXIgZmVl
ZGJhY2suDQoNCkNoaWF3ZWkNCg0K
