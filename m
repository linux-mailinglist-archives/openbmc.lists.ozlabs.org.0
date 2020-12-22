Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DA82E0449
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 03:14:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0KfV01T6zDqQQ
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 13:14:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.103;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320103.outbound.protection.outlook.com [40.107.132.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0KdT0lzpzDqNx;
 Tue, 22 Dec 2020 13:13:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBQWojkdS5nN+KIXxZU8vuUoTAn5r4aE3uwGXeyVWoGOqzIwUnF1T1uivWWfDYr2Xd/X8x6YBQ5DeBWGcEd/JJ9qvPz2PtP9sFBr+pfMt6XALn3Rpf3dvC60Cf7v5kIk3DWlnbokJdsMo5PzGyc9gN7U1GOwxJrHq9IzoTL6gvXMca9u+kLLAeqG1C6rpd7hWUp7yChQ2I5EUlvHA6najrOUozFM9i+AkHax11tQPnFOsfoW3iUOq6kVOJd8RSDQ4IHUfqx3wXsRUKF7A7L381D//HODbiKNidUj5RaGyL0GOWkp+9iseg8Z29sc73JwxInNFEcswF99t8IJTGZT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTgyLH4Hn3X6A47LfyZs1s1XSbo9G9ov4g6pyRCRZR0=;
 b=PGzOxXMNDsCcx7YSIStQ4kpSD6ICVOABjnNwtfcDBOKnDvD0zNrj2WRq1DTvheu/V3sY9VZTUYpv1sopeHdKfDvQuDKUFkkCnTJIChXmoAK3PKRF9PASya3w8VNLds/uR6woDBJMT0QRfNDhCDJf4ewzo5FgBIKgf22waMrFVq3dUR9gmjav/TJv6bwNiYOCVPu8nvrbVsQn12jUoj9RIzPublv6Kbaz60Q2Up/t25SQkZKpUmByVPW78S3NJQ1PKpdVhBM8ZAM24/poB5hlXOj+y50KV3s35qg1NUtRZ1TF2+nO9yCzn9dUpvhYsYKYs+a06Qq7y9FDBEs4oogKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK2PR0601MB1826.apcprd06.prod.outlook.com (2603:1096:202:3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 02:13:34 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::7061:73d9:50ae:b35e%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 02:13:34 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Haiyue Wang <haiyue.wang@linux.intel.com>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "minyard@acm.org"
 <minyard@acm.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH v3 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Thread-Topic: [PATCH v3 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Thread-Index: AQHW1139eR/HqizOtEWmq0E7yl/s8aoBLhMAgAABeoCAATFGwA==
Date: Tue, 22 Dec 2020 02:13:33 +0000
Message-ID: <HK0PR06MB377929E6EA4A1EECEB86E6AD91DF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201221055623.31463-1-chiawei_wang@aspeedtech.com>
 <20201221055623.31463-4-chiawei_wang@aspeedtech.com>
 <12d347b6-168b-11d2-b906-18164afb1724@linux.intel.com>
 <c1b6e2fe-5b22-ac67-f0eb-159499e06d2b@linux.intel.com>
In-Reply-To: <c1b6e2fe-5b22-ac67-f0eb-159499e06d2b@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18505617-1b78-4637-d281-08d8a61f2f48
x-ms-traffictypediagnostic: HK2PR0601MB1826:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB18269AADF82220E7DC1BB33691DF0@HK2PR0601MB1826.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GfRgwGtZ3H+SrjwOAeyeqDyhhcUp+/aX3B8mnDdIAhDpR/B8AVoVlswxE03ScGQVtZg60K3Y21nA2AKr3ftb4cUrsUh0ApSHiQHYbawRr6GfWlrHktDgVGoguhW9FXEoHWoqkQb9VgvAB8M/d2S0xZ34d6wFyeFx4qyhhlapxgegR2PLp3cssgo4oTvumwRDnS3HPQEVkURu1J3Zc6sMHhzWY+ecjJ6Rwe6zHfp9bsJVLgLx6AZXYulvj8bRxzS0QN9S564+n+lbp5KtrfPNGgx6osdLFT5oez9TvHn0oRjNktYUlar218InIySCqIPpcnvqAoG53neWgQfu4442a4J056mnR2/oxaTxZW326dMckqK0oMilR2Q3/ndSIUpCXdZGOsNeqWfq8OUnmRFXHMufMYpamjJF8/Cp1HF6av6IQbXUZW06rRACyFsfbi0i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(376002)(136003)(39840400004)(346002)(71200400001)(4326008)(83380400001)(8676002)(7416002)(55016002)(921005)(2906002)(6506007)(9686003)(26005)(8936002)(186003)(5660300002)(478600001)(54906003)(64756008)(66946007)(66446008)(110136005)(7696005)(66556008)(33656002)(55236004)(53546011)(86362001)(66476007)(52536014)(76116006)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QmdJMGQyTW9QbWZ2VlZBNC9xVGs1Vm5lZ3d6YUNXUzdTOWdYb1krQk4zZmJl?=
 =?utf-8?B?TXpzMXVQbjZwTWd4eFVwa09HbE55ektWYlY0Sk5mQ0lObmxLaUdrdURWcXht?=
 =?utf-8?B?bGNSNE9vR1ROVGFPSk9rM1dlY2tOcmZIa1VIT0c2eDBTMGdoN3Y0TDhqQ3FV?=
 =?utf-8?B?NzlMenAycUJjWEROeWVqWTF2WllIT1FUdEpsRFhqMkFiWUZUNEZZZmd3eHFu?=
 =?utf-8?B?Z3hrbjJ4VDNpMVlQZDhZY0prOUNNNXBOeERkNUlBZFkySHR3NXhmVlJnZURI?=
 =?utf-8?B?SmkwN09Dd3B3eW5YdFh3RW1yN2F2S1A4U0V3b1lvOGMyYU1YSXN6czFwaXVq?=
 =?utf-8?B?WG9DdW9PL0gwZGNnN2xZQmRCQjhweTBvNzVsN2ZVNm1rYXlNZjZKYWJUVWMr?=
 =?utf-8?B?ODF3TnBJdnp4SU9XM2JPZHBWOGFUQWYyd1lGdWFkZmQxS3R3VGRsRGEzdUtt?=
 =?utf-8?B?QzBMaWNtTHpoeDZ6NVJuZ0dNRmxZSDZDN1NGOUhPcVVyRE9kL1dzYXp1VWkv?=
 =?utf-8?B?bWRSSGFYQzZFYTFQNE5kWGxpKytiNHVTNjdYbVJtR3BwYkdQcXludDJPcWRJ?=
 =?utf-8?B?MzZ1UGNvQ2dMV0loTTBtTHFvclM5LytnRjBQYjMxYVJBVnMxY0tNUThyU1BI?=
 =?utf-8?B?WEV1M2M0c2R5YjlCTGFDUmRxWjMxWWdibE1iRUNBV3QxcFNJYVFzOHIybWc5?=
 =?utf-8?B?RmxFQTRuamhVL21HbU05NHNHRm10UURhMHJEL09ZM1RQbVJ4clhBYXdKeWJl?=
 =?utf-8?B?YzR6RjFQRjBYOS94YUJWakZIc1JJanJjbTdySXhramRNaTZvNXhoK29pUnQv?=
 =?utf-8?B?cXo0bVFJNHROck9QYjRRbFZKcEJOejJpZWtqNGVORUtIS3ZwUkFWMnVmNjRU?=
 =?utf-8?B?QWU5R1o2MThuUVNhWitKbk1CZ0tycW1wdHlPQ3Q3R2llV1JhcFNjVWlkUEhx?=
 =?utf-8?B?eEJyck41MTRWOVZHODZuemVreEdnYlI3L1dMWjNqNXFwQmt3TlN0VlJDUEll?=
 =?utf-8?B?aklNY2ZkWG5CL2FDbUthckhDRnlaZkQ2YlRvZ0pzY20vWm5MU2RQdURYWGZ6?=
 =?utf-8?B?U0xLQjNCcVpGU1lyVElBbFV6MFhDdWlva3pzMG1Cb2lhVTBySzZ5a3JFTitk?=
 =?utf-8?B?WFdWeHRIZVBqeVdOaG05YmdxSE82U1RXVFRrZnNtR1pDRmRlWTVubk92cDRG?=
 =?utf-8?B?RTkzbHZBbk5BWGpybXZyRXRxcHNUbTQxbGpJUGVCREUzNG02ZG9UeWRrU2xt?=
 =?utf-8?B?UUpXMFZxNVV4TFVrS3ppMEtVK3FSTzhnbDNlL3NUSXlDMHpzblhZaVFkWXNH?=
 =?utf-8?Q?W2nPq3ZTolJUk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18505617-1b78-4637-d281-08d8a61f2f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 02:13:33.9744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1E/ybMwH+83MRuXHzwt6We12/FXt7nd4TsgGk9Eg/i+1bHMfZGZp2/R8+o1AsPvacEwqTDxQiOvuS/XF3wuX5HzWqLF7MG99tEr2fYD4F+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1826
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "cyrilbur@gmail.com" <cyrilbur@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSGFpeXVlLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhaXl1
ZSBXYW5nIDxoYWl5dWUud2FuZ0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgRGVj
ZW1iZXIgMjEsIDIwMjAgMzo1OSBQTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvNV0gaXBt
aToga2NzOiBhc3BlZWQ6IEFkYXB0IHRvIG5ldyBMUEMgRFRTIGxheW91dA0KPiANCj4gDQo+IE9u
IDEyLzIxLzIwMjAgMTU6NTMsIEhhaXl1ZSBXYW5nIHdyb3RlOg0KPiA+IE9uIDEyLzIxLzIwMjAg
MTM6NTYsIENoaWEtV2VpLCBXYW5nIHdyb3RlOg0KPiA+PiBBZGQgY2hlY2sgYWdhaW5zdCBMUEMg
ZGV2aWNlIHYyIGNvbXBhdGlibGUgc3RyaW5nIHRvIGVuc3VyZSB0aGF0IHRoZQ0KPiA+PiBmaXhl
ZCBkZXZpY2UgdHJlZSBsYXlvdXQgaXMgYWRvcHRlZC4NCj4gPj4gVGhlIExQQyByZWdpc3RlciBv
ZmZzZXRzIGFyZSBhbHNvIGZpeGVkIGFjY29yZGluZ2x5Lg0KPiA+Pg0KPiA+PiBTaWduZWQtb2Zm
LWJ5OiBDaGlhLVdlaSwgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+PiAt
LS0NCj4gPj4gwqAgZHJpdmVycy9jaGFyL2lwbWkva2NzX2JtY19hc3BlZWQuYyB8IDM1DQo+ID4+
ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiA+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2NoYXIvaXBtaS9rY3NfYm1jX2FzcGVlZC5jDQo+ID4+IGIvZHJpdmVycy9jaGFy
L2lwbWkva2NzX2JtY19hc3BlZWQuYw0KPiA+PiBpbmRleCBhMTQwMjAzYzA3OWIuLjYyODNiZmVm
NGVhNyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9jaGFyL2lwbWkva2NzX2JtY19hc3BlZWQu
Yw0KPiA+PiArKysgYi9kcml2ZXJzL2NoYXIvaXBtaS9rY3NfYm1jX2FzcGVlZC5jDQo+ID4+IEBA
IC0yNyw3ICsyNyw2IEBADQo+ID4+IMKgIMKgICNkZWZpbmUgS0NTX0NIQU5ORUxfTUFYwqDCoMKg
wqAgNA0KPiA+PiDCoCAtLyogbWFwcGVkIHRvIGxwYy1ibWNAMCBJTyBzcGFjZSAqLw0KPiA+PiDC
oCAjZGVmaW5lIExQQ19ISUNSMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwMDANCj4gPj4gwqAg
I2RlZmluZcKgwqDCoMKgIExQQ19ISUNSMF9MUEMzRcKgwqDCoMKgwqDCoMKgwqDCoCBCSVQoNykN
Cj4gPj4gwqAgI2RlZmluZcKgwqDCoMKgIExQQ19ISUNSMF9MUEMyRcKgwqDCoMKgwqDCoMKgwqDC
oCBCSVQoNikgQEAgLTUyLDE1DQo+ICs1MSwxMyBAQA0KPiA+PiDCoCAjZGVmaW5lIExQQ19TVFIx
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MDNDDQo+ID4+IMKgICNkZWZpbmUgTFBDX1NUUjLC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwNDANCj4gPj4gwqAgI2RlZmluZSBMUENfU1RSM8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDA0NA0KPiA+PiAtDQo+ID4+IC0vKiBtYXBwZWQgdG8g
bHBjLWhvc3RAODAgSU8gc3BhY2UgKi8gLSNkZWZpbmUNCj4gTFBDX0hJQ1JCDQo+ID4+IDB4MDgw
DQo+ID4+ICsjZGVmaW5lIExQQ19ISUNSQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgxMDANCj4g
Pj4gwqAgI2RlZmluZcKgwqDCoMKgIExQQ19ISUNSQl9JQkZJRjTCoMKgwqDCoMKgwqDCoMKgIEJJ
VCgxKQ0KPiA+PiDCoCAjZGVmaW5lwqDCoMKgwqAgTFBDX0hJQ1JCX0xQQzRFwqDCoMKgwqDCoMKg
wqDCoMKgIEJJVCgwKSAtI2RlZmluZQ0KPiBMUENfTEFEUjQNCj4gPj4gMHgwOTAgLSNkZWZpbmUg
TFBDX0lEUjTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHgwOTQgLSNkZWZpbmUNCj4gTFBDX09E
UjQNCj4gPj4gMHgwOTggLSNkZWZpbmUgTFBDX1NUUjTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MHgwOUMNCj4gPj4gKyNkZWZpbmUgTFBDX0xBRFI0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDEx
MA0KPiA+PiArI2RlZmluZSBMUENfSURSNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDExNA0K
PiA+PiArI2RlZmluZSBMUENfT0RSNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDExOA0KPiA+
PiArI2RlZmluZSBMUENfU1RSNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDExQw0KPiA+PiDC
oCDCoCBzdHJ1Y3QgYXNwZWVkX2tjc19ibWMgew0KPiA+PiDCoMKgwqDCoMKgIHN0cnVjdCByZWdt
YXAgKm1hcDsNCj4gPj4gQEAgLTM0NSwxNSArMzQyLDI1IEBAIHN0YXRpYyBpbnQgYXNwZWVkX2tj
c19wcm9iZShzdHJ1Y3QNCj4gPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+PiDCoCB7DQo+
ID4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPj4gwqDC
oMKgwqDCoCBzdHJ1Y3Qga2NzX2JtYyAqa2NzX2JtYzsNCj4gPj4gLcKgwqDCoCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wOw0KPiA+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqa2NzX25wOw0K
PiA+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbHBjX25wOw0KPiA+PiDCoMKgwqDCoMKg
IGludCByYzsNCj4gPg0KPiA+IEkgdGhpbmsgeW91IGNhbiBqdXN0IHVzZSAnbnAnIHRvIGRvIExQ
QyBjb21wYXRpYmxlIGNoZWNraW5nOg0KPiA+DQo+ID4gbnAgPSBwZGV2LT5kZXYub2Zfbm9kZS0+
cGFyZW50Ow0KPiA+DQo+ID4gaWYgKCFvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShscGNfbnAsICJh
c3BlZWQsYXN0MjQwMC1scGMtdjIiKSAmJg0KPiA+IMKgwqDCoCAhb2ZfZGV2aWNlX2lzX2NvbXBh
dGlibGUobHBjX25wLCAiYXNwZWVkLGFzdDI1MDAtbHBjLXYyIikgJiYNCj4gPiDCoMKgwqAgIW9m
X2RldmljZV9pc19jb21wYXRpYmxlKGxwY19ucCwgImFzcGVlZCxhc3QyNjAwLWxwYy12MiIpKSB7
DQo+ID4gwqDCoMKgwqBkZXZfZXJyKGRldiwgInVuc3VwcG9ydGVkIExQQyBkZXZpY2UgYmluZGlu
Z1xuIik7DQo+ID4gwqDCoMKgwqByZXR1cm4gLUVOT0RFVjsNCj4gPiB9DQo+ID4NCj4gVHlwbzoN
Cj4gDQo+IGlmICghb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJhc3BlZWQsYXN0MjQwMC1s
cGMtdjIiKSAmJg0KPiAgwqDCoMKgICFvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgImFzcGVl
ZCxhc3QyNTAwLWxwYy12MiIpICYmDQo+ICDCoMKgwqAgIW9mX2RldmljZV9pc19jb21wYXRpYmxl
KG5wLCAiYXNwZWVkLGFzdDI2MDAtbHBjLXYyIikpIHsNCj4gIMKgwqDCoMKgZGV2X2VycihkZXYs
ICJ1bnN1cHBvcnRlZCBMUEMgZGV2aWNlIGJpbmRpbmdcbiIpOw0KPiAgwqDCoMKgwqByZXR1cm4g
LUVOT0RFVjsNCj4gfQ0KVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gV2lsbCByZXZpc2UgdGhl
IGNvZGUgYWZ0ZXIgY29sbGVjdGluZyByZXZpZXdlcnMnIGZlZWRiYWNrLg0KDQo+IA0KPiANCj4g
Pg0KPiA+IGJlZm9yZToNCj4gPg0KPiA+IG5wID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ID4gaWYg
KG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAiYXNwZWVkLGFzdDI0MDAta2NzLWJtYyIpIHx8
DQo+ID4gwqDCoMKgIG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAiYXNwZWVkLGFzdDI1MDAt
a2NzLWJtYyIpKQ0KPiA+DQo+ID4gVGhlbiB0aGUgcGF0Y2ggaXMgY2xlYXIuIDstKQ0KPiA+DQo+
ID4+IC3CoMKgwqAgbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gPj4gLcKgwqDCoCBpZiAob2Zf
ZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJhc3BlZWQsYXN0MjQwMC1rY3MtYm1jIikgfHwNCj4g
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsDQo+
ICJhc3BlZWQsYXN0MjUwMC1rY3MtYm1jIikpDQo+ID4+ICvCoMKgwqAga2NzX25wID0gZGV2LT5v
Zl9ub2RlOw0KPiA+PiArwqDCoMKgIGxwY19ucCA9IGtjc19ucC0+cGFyZW50Ow0KPiA+PiArDQo+
ID4+ICvCoMKgwqAgaWYgKCFvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShscGNfbnAsICJhc3BlZWQs
YXN0MjQwMC1scGMtdjIiKSAmJg0KPiA+PiArwqDCoMKgwqDCoMKgwqAgIW9mX2RldmljZV9pc19j
b21wYXRpYmxlKGxwY19ucCwgImFzcGVlZCxhc3QyNTAwLWxwYy12MiIpDQo+ICYmDQo+ID4+ICvC
oMKgwqDCoMKgwqDCoCAhb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobHBjX25wLCAiYXNwZWVkLGFz
dDI2MDAtbHBjLXYyIikpIHsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAidW5z
dXBwb3J0ZWQgTFBDIGRldmljZSBiaW5kaW5nXG4iKTsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRU5PREVWOw0KPiA+PiArwqDCoMKgIH0NCj4gPj4gKw0KPiA+PiArwqDCoMKgIGlmIChv
Zl9kZXZpY2VfaXNfY29tcGF0aWJsZShrY3NfbnAsICJhc3BlZWQsYXN0MjQwMC1rY3MtYm1jIikg
fHwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUo
a2NzX25wLA0KPiA+PiArImFzcGVlZCxhc3QyNTAwLWtjcy1ibWMiKSkNCj4gPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGtjc19ibWMgPSBhc3BlZWRfa2NzX3Byb2JlX29mX3YxKHBkZXYpOw0KPiA+PiAt
wqDCoMKgIGVsc2UgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLA0KPiA+PiAiYXNwZWVk
LGFzdDI0MDAta2NzLWJtYy12MiIpIHx8DQo+ID4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9m
X2RldmljZV9pc19jb21wYXRpYmxlKG5wLA0KPiA+PiAiYXNwZWVkLGFzdDI1MDAta2NzLWJtYy12
MiIpKQ0KPiA+PiArwqDCoMKgIGVsc2UgaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKGtjc19u
cCwNCj4gPj4gImFzcGVlZCxhc3QyNDAwLWtjcy1ibWMtdjIiKSB8fA0KPiA+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShrY3NfbnAsDQo+ID4+ICJhc3Bl
ZWQsYXN0MjUwMC1rY3MtYm1jLXYyIikpDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrY3NfYm1j
ID0gYXNwZWVkX2tjc19wcm9iZV9vZl92MihwZGV2KTsNCj4gPj4gwqDCoMKgwqDCoCBlbHNlDQo+
ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCg==
