Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FD929CCEC
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 02:35:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWN40TbvzDqNp
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 12:35:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.132;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=billy_tsai@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300132.outbound.protection.outlook.com [40.107.130.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKKHW6pW1zDqNH;
 Mon, 26 Oct 2020 13:56:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQHYYHi1/zVzvP5E5sO+ZvdhCLr5zevkDnwLfJ/TE4swIWdF9gRtuHXxO+qo5YQTnyNhy4nL9RZqpBGZ+AeMhLr9jjTFhS3/lzYB2MvZBMuMFXR/JmwCfmnqoacdUfdV1de5Rg/SIs+VsBI8Yzop9DW7L/+6PVjWmREEMjQciopKL8gxfsMgFyNN1RV6XvDFVDG6Mz6IuSGeGwgMvoRi9RrvFWfBD42mg6aCNx2PWeeq8R05SkhBihf3qnwZHquk3Nzmz+bQ19MLuUDtLeYL+ySg1kHCxor/7hgyFmG56P/wKqcrDEFpROZWr3exaMfS0RbOECSkA+46TidPZeDvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFAFe4L+Na3ECXQ9MXxhJ9iMQUKDlz9NO6Tbe/n0Fm8=;
 b=nGAFFrDR1nWjwK7UGVBgy6ay/PKyt4ZIfS4913hWPaqS9iX1ked+jhjnMD8e2lkoZCuc8Z2LR9j5tS/7QzxLlQ4XhOGTkPJTw1WhiQ569q+lb+cNVJ3piSKaxzDh/KPvrkdFhGkZn/TNPtL56b9nDAA4xlexGEm5pa9j/zPwfFgR4NDqDxxPmrH9MRlL51W8LPmvnjM+7xqlMScj0mm8oee2xidQ5J3aprSUXInJbv5lb0JqzwdkxuxlDtqxDMLSg4dQndUPPO9+IDzimwC1z5twn165S8HI2f+V1jrjuDvX6jsCNkfS5Igm2+MK0RJ/9ItvLyjfd3S73cLk5nIdIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from PU1PR06MB2167.apcprd06.prod.outlook.com (2603:1096:803:39::19)
 by PU1PR06MB2294.apcprd06.prod.outlook.com (2603:1096:803:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 02:56:44 +0000
Received: from PU1PR06MB2167.apcprd06.prod.outlook.com
 ([fe80::8956:6160:b5b8:a5dc]) by PU1PR06MB2167.apcprd06.prod.outlook.com
 ([fe80::8956:6160:b5b8:a5dc%3]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 02:56:43 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
Thread-Topic: [PATCH 3/3] pinctrl: aspeed-g6: Add sgpiom2 pinctrl setting
Thread-Index: AQHWoEhCUTHp0rj6MUiaDCllZEIrrqmpLaKAgACQWID//36xAIAAkCWA
Date: Mon, 26 Oct 2020 02:56:43 +0000
Message-ID: <148B6B46-D747-4B9C-A5C9-518C1AD16578@aspeedtech.com>
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-4-billy_tsai@aspeedtech.com>
 <ce3dce98-1daa-47bb-a688-0d5a743e45b2@www.fastmail.com>
 <82A00921-93ED-42A8-9B93-8F1E8025BA89@aspeedtech.com>
 <3fa4fda9-1ba9-4cb6-bd7f-0200bca06f52@www.fastmail.com>
In-Reply-To: <3fa4fda9-1ba9-4cb6-bd7f-0200bca06f52@www.fastmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b4ff976-ce4a-4972-883d-08d8795ac571
x-ms-traffictypediagnostic: PU1PR06MB2294:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1PR06MB22949314E88175B95E61314B8B190@PU1PR06MB2294.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MIlMi9D1zVsryux+kz8ec09VauXxL98fXyaqmG4NXkDOhGqnNz6ZDInNu7WrKmqyeGi2QenP8GOk73URKOgQtNHu8x5hVbGJlk41JJtd+8wrXU+2TuI2dr9zSAbcrekN81WHmspmEi8R1tboCT6xrBjHxqYLOXjk9a4Fr9j54vg18r8An0cwlYJiwPrH82pFaFIEv5lp06NMoQm//JjXPPJg7K2cx4uuRsphhx22JpowqQfguPHuOektAVYDziCO8dwbyr42jIMtYoDnpsrJf5wINDeEUhjEio3UR9QMsIWJuQtNlRI9p0HiBUJ1fEPtJ+03igNG0vxhBr8ugfDy3Ard55qA4SYHibUE/t54Ppw8UqeOEX2ph02qul3veRLZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PU1PR06MB2167.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(366004)(396003)(136003)(91956017)(76116006)(86362001)(107886003)(110136005)(5660300002)(66446008)(316002)(478600001)(6486002)(4326008)(186003)(83380400001)(53546011)(66476007)(66556008)(64756008)(2616005)(6512007)(66946007)(26005)(8936002)(7416002)(2906002)(33656002)(8676002)(71200400001)(6506007)(36756003)(55236004)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: yBDpQB5tpVYvUNwS03gvNgxu/L93PV8Dc2oQWzXSdMStZUE/cNP38iYAu3tBwc8TAKx8YynVaUAfu2YoM7jHY3SxqXfBtqo5ebvy6FyMJldfKq8Kmumq5tz0ycfA+IUgGm+V6htEVe/Xe9Ub/qmuRbL8XEEnZanFkCNzeHKRbxMtLdLH2ycbhJSFQAjfjoAqZenh/IJw21cPb56arCta7dBnT3nQIMg/iHsbPns7juqP5nK5qDxjhFWnzysUue2HTRjoVVMNB9faOlxOWi/W6cY5xJR4B+Z+AkfPDIhyoOR42D/y3oNLeO3IQEUs1Mparh8zZ9ZAJ6V+73SDO5HcoGnCooaZtI8TnjNW2jsyCOYbrpM8wZrJLdBi/dW5HyPiCAJLw0qzl+1SGJUNY5Hk5joTEXyeB1YJvABHsZJ1mkLdI1QqYm5I2LmcunuxbUrU5imSqsxAlQtX/fi8YQUYhkENaV4mhTfia9yXBcRrnqBeK8/p3IllY8w72NcwqxcbEjhl+uIAj9mQRtxLTalHLv3HU3ZrSBqt7iw1c4QIZ32xgONEgP0LLW+oIzqKZlOHHBGiTfLBZj4BsKsKXNruGgbUEnulahVDFFLsQMHAqdZqzu8Z9jYL8jevMJ+g1Sx9eQ5/UpoGHB4NnFBbBNQEog==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D251C53B6A3BD04C9DB470429D162652@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR06MB2167.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4ff976-ce4a-4972-883d-08d8795ac571
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 02:56:43.8075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqSrcovUlEOGL2tQ/w4cS8j0CqFoQqbTkNKfCSgZxozG6WateAux6TXUMG1E4sDc2gSUqjEw3uov9uFBlnGN9M7qiTezh23vFpudGndnNt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2294
X-Mailman-Approved-At: Wed, 28 Oct 2020 12:30:19 +1100
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQpPbiAyMDIwLzEwLzI2LCAxMDoyMSBBTSwgQW5kcmV3IEplZmZlcnkgd3JvdGU6DQoNCiAgICAN
CiAgICANCiAgICBPbiBNb24sIDI2IE9jdCAyMDIwLCBhdCAxMjozMywgQmlsbHkgVHNhaSB3cm90
ZToNCiAgICA+IA0KICAgID4gT24gMjAyMC8xMC8yNiwgOToyNyBBTSwgQW5kcmV3IEplZmZlcnkg
d3JvdGU6DQogICAgPiAgICAgDQogICAgPiAgICAgT24gTW9uLCAxMiBPY3QgMjAyMCwgYXQgMTQ6
MDEsIEJpbGx5IFRzYWkgd3JvdGU6DQogICAgPiAgICAgPiA+IEF0IGFzdDI2MDBhMSB3ZSBjaGFu
Z2UgZmVhdHVyZSBvZiBtYXN0ZXIgc2dwaW8gdG8gMiBzZXRzLg0KICAgID4gICAgID4gPiBTbyB0
aGlzIHBhdGNoIGlzIHVzZWQgdG8gYWRkIHRoZSBwaW5jdHJsIHNldHRpbmcgb2YgdGhlIG5ldyAN
CiAgICA+IHNncGlvLg0KICAgID4gICAgID4gPiANCiAgICA+ICAgICA+ID4gU2lnbmVkLW9mZi1i
eTogQmlsbHkgVHNhaSA8YmlsbHlfdHNhaUBhc3BlZWR0ZWNoLmNvbT4NCiAgICA+ICAgICA+ID4g
LS0tDQogICAgPiAgICAgPiA+ICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYtcGluY3RybC5k
dHNpICAgfCAgNSArKysrDQogICAgPiAgICAgPiA+ICBkcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3Bp
bmN0cmwtYXNwZWVkLWc2LmMgfCAzMCANCiAgICA+ICsrKysrKysrKysrKysrKysrKystLS0NCiAg
ICA+ICAgICA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCiAgICA+ICAgICA+ID4gDQogICAgPiAgICAgPiA+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtZzYtcGluY3RybC5kdHNpIA0KICAgID4gICAgID4gPiBiL2FyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi1waW5jdHJsLmR0c2kNCiAgICA+ICAgICA+ID4gaW5kZXgg
NzAyOGUyMWJkZDk4Li5hMTZlY2YwOGUzMDcgMTAwNjQ0DQogICAgPiAgICAgPiA+IC0tLSBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNi1waW5jdHJsLmR0c2kNCiAgICA+ICAgICA+ID4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LXBpbmN0cmwuZHRzaQ0KICAgID4gICAgID4g
PiBAQCAtODYyLDYgKzg2MiwxMSBAQA0KICAgID4gICAgID4gPiAgCQlncm91cHMgPSAiU0dQTTEi
Ow0KICAgID4gICAgID4gPiAgCX07DQogICAgPiAgICAgPiA+ICANCiAgICA+ICAgICA+ID4gKwlw
aW5jdHJsX3NncG0yX2RlZmF1bHQ6IHNncG0yX2RlZmF1bHQgew0KICAgID4gICAgID4gPiArCQlm
dW5jdGlvbiA9ICJTR1BNMiI7DQogICAgPiAgICAgPiA+ICsJCWdyb3VwcyA9ICJTR1BNMiI7DQog
ICAgPiAgICAgPiA+ICsJfTsNCiAgICA+ICAgICA+ID4gKw0KICAgID4gICAgID4gPiAgCXBpbmN0
cmxfc2dwczFfZGVmYXVsdDogc2dwczFfZGVmYXVsdCB7DQogICAgPiAgICAgPiA+ICAJCWZ1bmN0
aW9uID0gIlNHUFMxIjsNCiAgICA+ICAgICA+ID4gIAkJZ3JvdXBzID0gIlNHUFMxIjsNCiAgICA+
ICAgICA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybC1hc3Bl
ZWQtZzYuYyANCiAgICA+ICAgICA+ID4gYi9kcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmwt
YXNwZWVkLWc2LmMNCiAgICA+ICAgICA+ID4gaW5kZXggMzQ4MDNhNmM3NjY0Li5iNjczYTQ0ZmZh
M2IgMTAwNjQ0DQogICAgPiAgICAgPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGlu
Y3RybC1hc3BlZWQtZzYuYw0KICAgID4gICAgID4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvYXNw
ZWVkL3BpbmN0cmwtYXNwZWVkLWc2LmMNCiAgICA+ICAgICA+ID4gQEAgLTQ2LDggKzQ2LDEwIEBA
DQogICAgPiAgICAgPiA+ICAjZGVmaW5lIFNDVTYyMAkJMHg2MjAgLyogRGlzYWJsZSBHUElPIElu
dGVybmFsIFB1bGwtRG93biAjNCAqLw0KICAgID4gICAgID4gPiAgI2RlZmluZSBTQ1U2MzQJCTB4
NjM0IC8qIERpc2FibGUgR1BJTyBJbnRlcm5hbCBQdWxsLURvd24gIzUgKi8NCiAgICA+ICAgICA+
ID4gICNkZWZpbmUgU0NVNjM4CQkweDYzOCAvKiBEaXNhYmxlIEdQSU8gSW50ZXJuYWwgUHVsbC1E
b3duICM2ICovDQogICAgPiAgICAgPiA+ICsjZGVmaW5lIFNDVTY5MAkJMHg2OTAgLyogTXVsdGkt
ZnVuY3Rpb24gUGluIENvbnRyb2wgIzI0ICovDQogICAgPiAgICAgPiA+ICAjZGVmaW5lIFNDVTY5
NAkJMHg2OTQgLyogTXVsdGktZnVuY3Rpb24gUGluIENvbnRyb2wgIzI1ICovDQogICAgPiAgICAg
PiA+ICAjZGVmaW5lIFNDVTY5QwkJMHg2OUMgLyogTXVsdGktZnVuY3Rpb24gUGluIENvbnRyb2wg
IzI3ICovDQogICAgPiAgICAgPiA+ICsjZGVmaW5lIFNDVTZEMAkJMHg2RDAgLyogTXVsdGktZnVu
Y3Rpb24gUGluIENvbnRyb2wgIzI4ICovDQogICAgPiAgICAgPiA+ICAjZGVmaW5lIFNDVUMyMAkJ
MHhDMjAgLyogUENJRSBjb25maWd1cmF0aW9uIFNldHRpbmcgQ29udHJvbCAqLw0KICAgID4gICAg
ID4gPiAgDQogICAgPiAgICAgPiA+ICAjZGVmaW5lIEFTUEVFRF9HNl9OUl9QSU5TIDI1Ng0KICAg
ID4gICAgID4gPiBAQCAtODEsMTMgKzgzLDIxIEBAIEZVTkNfR1JPVVBfREVDTChJMkMxMiwgTDI2
LCBLMjQpOw0KICAgID4gICAgID4gPiAgI2RlZmluZSBLMjYgNA0KICAgID4gICAgID4gPiAgU0lH
X0VYUFJfTElTVF9ERUNMX1NFU0coSzI2LCBNQUNMSU5LMSwgTUFDTElOSzEsIA0KICAgID4gU0lH
X0RFU0NfU0VUKFNDVTQxMCwgNCkpOw0KICAgID4gICAgID4gPiAgU0lHX0VYUFJfTElTVF9ERUNM
X1NFU0coSzI2LCBTQ0wxMywgSTJDMTMsIA0KICAgID4gU0lHX0RFU0NfU0VUKFNDVTRCMCwgNCkp
Ow0KICAgID4gICAgID4gPiAtUElOX0RFQ0xfMihLMjYsIEdQSU9BNCwgTUFDTElOSzEsIFNDTDEz
KTsNCiAgICA+ICAgICA+ID4gKy8qU0dQTTIgaXMgQTEgT25seSAqLw0KICAgID4gICAgID4gPiAr
U0lHX0VYUFJfTElTVF9ERUNMX1NFU0coSzI2LCBTR1BNMkNMSywgU0dQTTIsIA0KICAgID4gU0lH
X0RFU0NfU0VUKFNDVTZEMCwgNCksDQogICAgPiAgICAgPiA+ICsJCQkgIFNJR19ERVNDX0NMRUFS
KFNDVTQxMCwgNCksIFNJR19ERVNDX0NMRUFSKFNDVTRCMCwgNCksDQogICAgPiAgICAgPiA+ICsJ
CQkgIFNJR19ERVNDX0NMRUFSKFNDVTY5MCwgNCkpOw0KICAgID4gICAgID4gPiArUElOX0RFQ0xf
MyhLMjYsIEdQSU9BNCwgU0dQTTJDTEssIE1BQ0xJTksxLCBTQ0wxMyk7DQogICAgPiAgICAgPiA+
ICBGVU5DX0dST1VQX0RFQ0woTUFDTElOSzEsIEsyNik7DQogICAgPiAgICAgPiA+ICANCiAgICA+
ICAgICA+ID4gICNkZWZpbmUgTDI0IDUNCiAgICA+ICAgICA+ID4gIFNJR19FWFBSX0xJU1RfREVD
TF9TRVNHKEwyNCwgTUFDTElOSzIsIE1BQ0xJTksyLCANCiAgICA+IFNJR19ERVNDX1NFVChTQ1U0
MTAsIDUpKTsNCiAgICA+ICAgICA+ID4gIFNJR19FWFBSX0xJU1RfREVDTF9TRVNHKEwyNCwgU0RB
MTMsIEkyQzEzLCANCiAgICA+IFNJR19ERVNDX1NFVChTQ1U0QjAsIDUpKTsNCiAgICA+ICAgICA+
ID4gLVBJTl9ERUNMXzIoTDI0LCBHUElPQTUsIE1BQ0xJTksyLCBTREExMyk7DQogICAgPiAgICAg
PiA+ICsvKlNHUE0yIGlzIEExIE9ubHkgKi8NCiAgICA+ICAgICA+ID4gK1NJR19FWFBSX0xJU1Rf
REVDTF9TRVNHKEwyNCwgU0dQTTJMRCwgU0dQTTIsIA0KICAgID4gU0lHX0RFU0NfU0VUKFNDVTZE
MCwgNSksDQogICAgPiAgICAgPiA+ICsJCQkgIFNJR19ERVNDX0NMRUFSKFNDVTQxMCwgNSksIFNJ
R19ERVNDX0NMRUFSKFNDVTRCMCwgNSksDQogICAgPiAgICAgPiA+ICsJCQkgIFNJR19ERVNDX0NM
RUFSKFNDVTY5MCwgNSkpOw0KICAgID4gICAgID4gDQogICAgPiAgICAgPiBBIGZldyB0aGluZ3M6
DQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IDEuIEl0IGxvb2tzIGxpa2UgdGhlIE11bHRpLWZ1
bmN0aW9uIFBpbnMgTWFwcGluZyBhbmQgQ29udHJvbCANCiAgICA+IHRhYmxlIGluIHNlY3Rpb24g
NS4xIG9mIHRoZSBkYXRhc2hlZXQgb25seSB0ZWxscyBwYXJ0IG9mIHRoZSBzdG9yeS4gSXQgDQog
ICAgPiBsaXN0cyBTR1BTMiBvbiB0aGUgcGlucyB5b3UndmUgbW9kaWZpZWQgaW4gdGhpcyBwYXRj
aCBidXQgbm90IFNHUE0yLiANCiAgICA+IEhvd2V2ZXIsIHRoZSB0YWJsZSBpbiBzZWN0aW9uIDIu
MSAoUGluIERlc2NyaXB0aW9uKSBkb2VzIG91dGxpbmUgU0dQTTIgDQogICAgPiBhbmQgU0dQUzIg
YXJlIHJvdXRlZCB2aWEgdGhlIHNhbWUgcGlucywgdGhvdWdoIHRoaXMgZG9lcyBub3QgbGlzdGVk
IHRoZSANCiAgICA+IGFzc29jaWF0ZWQgcmVnaXN0ZXJzIGFuZCBiaXQgZmllbGRzLiBDYW4gd2Ug
Zml4IHRoZSB0YWJsZSBpbiA1LjEgc28gDQogICAgPiBpdCdzIGVhc2llciB0byByZXZpZXcgdGhp
cyBwYXRjaD8NCiAgICANCiAgICA+IFlvdSBjYW4gc2VlIHNlY3Rpb24gNS4yIHRvIGZpbmQgU0dQ
SU8gbWFzdGVyIGludGVyZmFjZSB0YWJsZS4gSXQgbGlzdHMgDQogICAgPiBiYWxscyBhbmQgcmVn
aXN0ZXIgc2V0dGluZyBpbmZvcm1hdGlvbiBvZiB0aGUgU0dQSU9NMSBhbmQgU0dQSU9NMi4NCiAg
ICANCiAgICBZZXAsIHRob3VnaCB0eXBpY2FsbHkgSSB1c2UgdGhlIHRhYmxlIGluIDUuMSB0byBm
aWd1cmUgb3V0IHRoZSBwaW5jdHJsIGRldGFpbHMuIA0KICAgIEl0IGFwcGVhcnMgeW91J2QgbmVl
ZCB0byBhZGQgYW5vdGhlciB0d28gY29sdW1ucyB0byB0aGUgdGFibGUgdG8gY2FwdHVyZSB0aGUg
DQogICAgaW5mbyAtIGlzIEFzcGVlZCBwbGFubmluZyB0byBkbyB0aGF0IGluIGEgZnV0dXJlIHJl
bGVhc2Ugb2YgdGhlIGRhdGFzaGVldD8NClllcywgd2Ugd2lsbCB1cGRhdGUgdGhlIGRhdGFzaGVl
dCB0byBhZGQgYW5vdGhlciB0d28gY29sdW1ucy4gICAgDQogICAgPiAgICAgPiANCiAgICA+ICAg
ICA+IDIuIFdlIGRvbid0IG5lZWQgdG8gc3BlY2lmeSB0aGUgX0NMRUFSKCkgYmVoYXZpb3VyIGhl
cmUgYXMgdGhpcyANCiAgICA+IGlzIGltcGxpZWQgYnkgdGhlIHByb2Nlc3MgdG8gZGlzYWJsZSB0
aGUgaGlnaGVyIHByaW9yaXR5IG11eCANCiAgICA+IGNvbmZpZ3VyYXRpb25zLiBJdCBzaG91bGQg
YmUgZW5vdWdoIHRvIGRvOg0KICAgID4gICAgID4gDQogICAgPiAgICAgPiBTSUdfRVhQUl9MSVNU
X0RFQ0xfU0VTRyhMMjQsIFNHUE0yTEQsIFNHUE0yLCBTSUdfREVTQ19TRVQoU0NVNkQwLCANCiAg
ICA+IDUpKTsNCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gSG93ZXZlciwgdGhpcyByZXF1aXJl
cyB0aGF0IHdlIGFsc28gZGVmaW5lIHRoZSBwcmlvcml0aWVzIA0KICAgID4gY29ycmVjdGx5LCBz
bzoNCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gMy4gQ2FuIHdlIGFkZCBib3RoIHRoZSBTR1BT
MiBhbmQgU0dQTTIgY29uZmlndXJhdGlvbnMgc28gd2UgaGF2ZSANCiAgICA+IGEgY29tcGxldGUg
ZGVmaW5pdGlvbiBmb3IgdGhlIHBpbnM/DQogICAgPiAgICAgPiANCiAgICA+IFRoYW5rIHlvdSBm
b3IgeW91ciBhZHZpY2UuIEkgd2lsbCBjb21wbGV0ZSB0aGUgZnVsbCBjb25maWd1cmF0aW9ucyBh
bmQgDQogICAgPiBzZW5kIHRoZSBWMiBwYXRjaC4NCiAgICANCiAgICBUaGFua3MhDQogICAgDQog
ICAgQW5kcmV3DQogICAgDQoNCg==
