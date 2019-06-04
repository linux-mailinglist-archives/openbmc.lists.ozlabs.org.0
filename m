Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E23416D
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 10:15:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J4VL6jCrzDqQd
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 18:15:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=051e9ab8e=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45J4TY3732zDqKw
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 18:14:35 +1000 (AEST)
Received: from unknown (HELO mailbx06.quanta.corp) ([10.243.91.101])
 by mx01.quantatw.com with ESMTP; 04 Jun 2019 16:14:32 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx06.quanta.corp
 (10.243.91.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 4 Jun 2019
 16:14:15 +0800
Received: from mailbx05.quanta.corp ([192.168.0.5]) by mailbx05.quanta.corp
 ([192.168.0.5]) with mapi id 15.01.1713.004; Tue, 4 Jun 2019 16:14:15 +0800
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>, George Hung <ghung.quanta@gmail.com>
Subject: RE: [PATCH dev-5.1 v1 2/2] dt-binding: edac: add NPCM ECC
 documentation
Thread-Topic: [PATCH dev-5.1 v1 2/2] dt-binding: edac: add NPCM ECC
 documentation
Thread-Index: AQHVGpey2Shj+NQ76kCdqKQcL4QOuaaLIRhQ
Date: Tue, 4 Jun 2019 08:14:15 +0000
Message-ID: <fac45d9d10634620b2bff4f67eb315b9@quantatw.com>
References: <20190523105448.26300-1-ghung.quanta@gmail.com>
 <20190523105448.26300-2-ghung.quanta@gmail.com>
 <CACPK8Xcw6=kACAfCsE7qsHQ82g9s5T5wbp+FpVFQXxXtH3NhDw@mail.gmail.com>
In-Reply-To: <CACPK8Xcw6=kACAfCsE7qsHQ82g9s5T5wbp+FpVFQXxXtH3NhDw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24654.001
x-tm-as-result: No--15.111600-0.000000-31
x-tm-as-matchedid: 140026-150567-700225-703140-701090-703503-139010-139006-1
 88199-704466-702605-830459-701745-106660-703408-700069-701429-863519-705249
 -110462-701342-704841-705271-701784-704010-701919-139703-704543-702754-7026
 17-101339-188019-703017-702395-703213-701478-704585-701337-703958-703880-70
 4720-701275-702719-702203-701432-703115-700786-704542-148004-148133-20016-2
 0043-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "William A. Kennington III" <wak@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>, Avi
 Fishman <Avi.Fishman@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1j
DQo+IFttYWlsdG86b3BlbmJtYy1ib3VuY2VzK2dlb3JnZS5odW5nPXF1YW50YXR3LmNvbUBsaXN0
cy5vemxhYnMub3JnXSBPbg0KPiBCZWhhbGYgT2YgSm9lbCBTdGFubGV5DQo+IFNlbnQ6IFR1ZXNk
YXksIEp1bmUgMDQsIDIwMTkgMTozOCBQTQ0KPiBUbzogR2VvcmdlIEh1bmcNCj4gQ2M6IE9wZW5C
TUMgTWFpbGxpc3Q7IFRvbWVyIE1haW1vbjsgQmVuamFtaW4gRmFpcjsgQXZpIEZpc2htYW47IFdp
bGxpYW0gQS4NCj4gS2VubmluZ3RvbiBJSUkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBkZXYtNS4x
IHYxIDIvMl0gZHQtYmluZGluZzogZWRhYzogYWRkIE5QQ00gRUNDDQo+IGRvY3VtZW50YXRpb24N
Cj4gDQo+IEhpIEdlb3JnZSwNCj4gDQo+IE9uIFRodSwgMjMgTWF5IDIwMTkgYXQgMTE6MDAsIEdl
b3JnZSBIdW5nIDxnaHVuZy5xdWFudGFAZ21haWwuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEZy
b206IEdlb3JnZSBIdW5nIDxnZW9yZ2UuaHVuZ0BxdWFudGF0dy5jb20+DQo+ID4NCj4gPiBBZGQg
ZGV2aWNlIHRyZWUgZG9jdW1lbnRhdGlvbiBmb3IgTnV2b3RvbiBCTUMgRUNDDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2UgSHVuZyA8Z2VvcmdlLmh1bmdAcXVhbnRhdHcuY29tPg0KPiAN
Cj4gQ2FuIHlvdSBjb252aW5jZSBvbmUgb2YgeW91ciBmZWxsb3cgTnV2b3RvbiBjb250cmlidXRv
cnMgdG8gcmV2aWV3IHRoaXMNCj4gcGF0Y2g/DQoNClllcywgSSBoYXZlIGFscmVhZHkgZm91bmQg
dGhlIE51dm90b24gY29udHJpYnV0b3JzIHRvIHJldmlldyBteSBwYXRjaC4NCg0KaHR0cHM6Ly9s
aXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9vcGVuYm1jLzIwMTktTWF5LzAxNjQyOC5odG1sDQoN
Cj4gDQo+IEhhdmUgeW91IHN1Ym1pdHRlZCB0aGlzIHBhdGNoIGZvciBtYWlubGluZSBpbmNsdXNp
b24/DQoNClllcywgSSBoYXZlIHN1Ym1pdHRlZCB0aGlzIHBhdGNoIHRvIG1haW5saW5lIGluY2x1
c2lvbiAobGludXgtZWRhYyBhbmQgbGludXgta2VybmVsKQ0KDQpodHRwczovL21hcmMuaW5mby8/
bD1saW51eC1lZGFjJm09MTU1OTMwMDg1MTE5MzQzJnc9Mg0KaHR0cHM6Ly9tYXJjLmluZm8vP2w9
bGludXgta2VybmVsJm09MTU1OTMwMDg1MDE5MzQwJnc9Mg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAu
Li4vYmluZGluZ3MvZWRhYy9ucGNtN3h4LXNkcmFtLWVkYWMudHh0ICAgICAgICB8IDE3DQo+ICsr
KysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9lZGFjL25wY203eHgtc2RyYW0tZWRhYy50eHQNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZGFjL25wY203eHgtc2RyYW0t
ZWRhYy50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZGFjL25w
Y203eHgtc2RyYW0tZWRhYy50eHQNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZGQ0ZGFjNTlhNWJkDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9lZGFjL25wY203eHgtc2RyYW0tZWRh
Yy50eHQNCj4gPiBAQCAtMCwwICsxLDE3IEBADQo+ID4gK051dm90b24gTlBDTTd4eCBTb0MgRURB
QyBkZXZpY2UgZHJpdmVyDQo+ID4gKw0KPiA+ICtUaGUgTnV2b3RvbiBOUENNN3h4IFNvQyBzdXBw
b3J0cyBERFI0IG1lbW9yeSB3aXRoL3dpdGhvdXQgRUNDIGFuZA0KPiB0aGUNCj4gPiArZHJpdmVy
IHVzZXMgdGhlIEVEQUMgZnJhbWV3b3JrIHRvIGltcGxlbWVudCB0aGUgRUNDIGRldGVjdGlvbiBh
bmQNCj4gY29ycnRlY3Rpb24uDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+
ICstIGNvbXBhdGlibGU6ICBzaG91bGQgYmUgIm51dm90b24sbnBjbTd4eC1zZHJhbS1lZGFjIg0K
PiA+ICstIHJlZzogICAgICAgICBNZW1vcnkgY29udHJvbGxlciByZWdpc3RlciBzZXQgc2hvdWxk
IGJlIDwweGYwODI0MDAwDQo+IDB4MTAwMD4NCj4gPiArLSBpbnRlcnJ1cHRzOiAgc2hvdWxkIGJl
IE1DIGludGVycnVwdCAjMjUNCj4gPiArDQo+ID4gK0V4YW1wbGU6DQo+ID4gKw0KPiA+ICsgICAg
ICAgbWM6IG1lbW9yeS1jb250cm9sbGVyQGYwODI0MDAwIHsNCj4gPiArICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJudXZvdG9uLG5wY203eHgtc2RyYW0tZWRhYyI7DQo+ID4gKyAgICAgICAg
ICAgICAgIHJlZyA9IDwweGYwODI0MDAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgICAgICAgIGlu
dGVycnVwdHMgPSA8MCAyNSA0PjsNCj4gDQo+IEkgdGhpbmsgd2UgY2FuIHVzZSB0aGUgZGVmaW5l
cyBmb3IgMCBhbmQgND8gR0lDX1NQSSBhbmQNCj4gSVJRX1RZUEVfTEVWRUxfSElHSC4NCg0KQmVj
YXVzZSBJIHNhdyBvdGhlciBkb2N1bWVudGF0aW9uIGRvZXNuJ3QgdXNlIHRoZSBkZWZpbmVzIG5l
Y2Vzc2FyaWx5Lg0KSWYgaXQncyBuZWVkZWQsIEkgY2FuIGNoYW5nZSB0byB1c2UgdGhlbSBhbmQg
cmUtc3VibWl0IHRoZSBwYXRjaC4NCg0KPiANCj4gPiArICAgICAgIH07DQo+ID4gLS0NCj4gPiAy
LjIxLjANCj4gPg0K
