Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B71092D5587
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 09:35:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs6gm00QQzDqmb
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 19:35:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=6062a2209=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cs6ft56DwzDqgq
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 19:34:58 +1100 (AEDT)
IronPort-SDR: pmPyDCvQoqZE3iEXLGYNowh/kRA8lCE4x45Y6vdhXHnVM3mGyhE9nulTqzHRfkuQLfETmECC8q
 y7Rv7JBBsdCw==
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 10 Dec 2020 16:34:55 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 16:34:55 +0800
Received: from mailbx09.quanta.corp ([192.168.57.9]) by mailbx09.quanta.corp
 ([192.168.57.9]) with mapi id 15.01.2044.004; Thu, 10 Dec 2020 16:34:55 +0800
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Andrew Geissler <geissonator@gmail.com>, Vernon Mauery
 <vernon.mauery@linux.intel.com>
Subject: RE: ipmi command implementation mismatch with the design document
Thread-Topic: ipmi command implementation mismatch with the design document
Thread-Index: AQHWxz99IowR2axMfUuFqenSHNJyM6nwAANg
Date: Thu, 10 Dec 2020 08:34:54 +0000
Message-ID: <deba1c442929478b81e6e4205ba6eb0f@quantatw.com>
References: <BL0PR01MB515650923510989237151B70FFFC0@BL0PR01MB5156.prod.exchangelabs.com>
 <20201124190606.GA45289@mauery.jf.intel.com>
 <73E4FC5B-45F9-436F-B6A5-D01BEB44A8B7@gmail.com>
In-Reply-To: <73E4FC5B-45F9-436F-B6A5-D01BEB44A8B7@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBPbiBOb3YgMjQsIDIwMjAsIGF0IDE6MDYgUE0sIFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVl
cnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIzLU5vdi0yMDIwIDA2OjM5IEFN
LCBUdW5nIE5ndXllbiBPUyB3cm90ZToNCj4+IA0KPj4gQWx0aG91Z2ggdGhlIGluZGljYXRlX25v
X3NvZnRvZmZfbmVlZGVkKCkgY2FuIHByZXZlbnQgdGhlIGhvc3QgZnJvbSBzb2Z0IG9mZiwgYnV0
IGl0IHNlZW1zIGxpa2UgYSBtaXNtYXRjaCBiL3cgdGhlIGRlc2lnbiBkb2N1bWVudCBhbmQgdGhl
IElQTUkgaW1wbGVtZW50YXRpb24uDQo+PiANCj4+IFNvLCBteSBxdWVzdGlvbjogaXMgaXQgcmVh
c29uYWJsZSBmb3IgSVBNSSBjb21tYW5kID8NCj4gDQo+IFRoaXMgY29kZSBoYXMgYmVlbiBpbiBw
bGFjZSBmb3IgcXVpdGUgc29tZSB0aW1lIG5vdywgc28gSSBhbSBub3Qgc3VyZSBpZiB0aGUgb3Jp
Z2luYWwgYXV0aG9ycyBoYXZlIHRoZSBjb250ZXh0IGF0IHRoaXMgcG9pbnQgaW4gdGltZS4gQnV0
IG5vYm9keSBlbHNlIGhhcyByYWlzZWQgdGhpcyBxdWVzdGlvbi4gZ2l0IGJsYW1lIHNheXMgdGhh
dCBBbmRyZXcgR2Vpc3NsZXIgYWRkZWQgdGhpcyBmZWF0dXJlLCBidXQgd2Ugd291bGQgaGF2ZSB0
byBzZWUgaWYgaGUgc3RpbGwga25vd3Mgd2h5LiANCj4gY29tbWl0IGE2ZTNhMzA4MGQ1MzI1MzZl
MDJlMzA0YzgxOWMxZTE3MjE0ZTAzOGENCj4gQXV0aG9yOiBBbmRyZXcgR2Vpc3NsZXIgPGFuZHJl
d2dAdXMuaWJtLmNvbT4NCj4gRGF0ZTogICBXZWQgTWF5IDMxIDE5OjM0OjAwIDIwMTcgLTA1MDAN
Cj4gDQo+ICAgQ3JlYXRlIGZpbGUgdG8gaW5kaWNhdGUgaG9zdCByZXF1ZXN0ZWQgb2ZmL3JlYm9v
dA0KPiANCj4gICBDcmVhdGUgYSBmaWxlIHRvIGVuc3VyZSB0aGUgc29mdCBwb3dlciBvZmYgc2Vy
dmljZSBpcw0KPiAgIG5vdCBydW4gd2hlbiB0aGUgaG9zdCBpcyByZXF1ZXN0aW5nIGEgcG93ZXIg
b2ZmDQo+ICAgb3IgcmVib290LiAgVGhlcmUncyBubyBuZWVkIHRvIG5vdGlmeSB0aGUgaG9zdCAo
aS5lLg0KPiAgIHNvZnQgcG93ZXIgb2ZmKSB3aGVuIHRoZXkgYXJlIGluaXRpYXRpbmcgaXQuDQo+
IA0KPiAgIENoYW5nZS1JZDogSWM5ZjhlNzExMGQzMGY0NzdjZWFlMzhiYmE5ZDY4NDU1OWQ5NTAz
ZDMNCj4gICBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgR2Vpc3NsZXIgPGFuZHJld2dAdXMuaWJtLmNv
bT4NCj4gDQoNCj4gSeKAmW0gd29uZGVyaW5nIGlmIHRoaXMgdGllcyBpbnRvIHRoZSBkaXNjdXNz
aW9uIGluIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWhvc3QtaXBtaWQvaXNz
dWVzLzE1OD8NCg0KPiBBcmUgeW91IGhhdmluZyB0aGUgc2FtZSBpc3N1ZSBUdW5nPyBNYXkgYmUg
dGltZSB0byBqdXN0IHB1dCB1cCBhIGNvbW1pdCB0aGF0IGRvZXMgdGhpcyBjb3JyZWN0bHkgYW5k
IGRpc2N1c3MgdmlhIGdlcnJpdC4NCg0KSGkgQW5kcmV3LCBJIGhhdmUgdGhlIHNhbWUgcXVlc3Rp
b24gYWJvdXQgaXBtaSBjaGFzc2lzIHBvd2VyIG9mZiwgDQoNCmJlY2F1c2UgYWNjb3JkaW5nIHRv
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0ZXIvZGVzaWducy9zdGF0
ZS1tYW5hZ2VtZW50LWFuZC1leHRlcm5hbC1pbnRlcmZhY2VzLm1kDQoNClNob3VsZCBpdCBiZSBz
ZXQgc3RhdGUgdHJhbnNpdGlvbiB0byAiU3RhdGU6OkNoYXNzaXM6OlRyYW5zaXRpb246Ok9mZiIs
IG5vdCAiU3RhdGU6Okhvc3Q6OlRyYW5zaXRpb246Ok9mZiIgPw0KDQpPciBkbyBJIG1pc3Mgc29t
ZXRoaW5nIEkgZG9uJ3Qga25vdy4NCg0KDQpCZXN0IFJlZ2FyZHMgDQpHZW9yZ2UgSHVuZw0KPiAN
Cj4gLS1WZXJub24NCj4gDQo+PiBSZWZlcmVuY2U6DQo+PiBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2Rlc2lnbnMvc3RhdGUtbWFuYWdlbWVudC0NCj4+IGFuZC1l
eHRlcm5hbC1pbnRlcmZhY2VzLm1kDQo+PiANCj4+IEJlc3QgcmVnYXJkcywNCj4+IFR1bmcNCg0K
