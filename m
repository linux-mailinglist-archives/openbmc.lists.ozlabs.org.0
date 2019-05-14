Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA61C908
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 14:52:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Hdz3KXYzDqLg
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 22:52:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=03047ea12=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 453HcF41yKzDqL5
 for <openbmc@lists.ozlabs.org>; Tue, 14 May 2019 22:51:04 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 14 May 2019 20:51:00 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 14 May
 2019 20:50:59 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Tue, 14 May 2019 20:50:59 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: James Feist <james.feist@linux.intel.com>, Patrick Venture
 <venture@google.com>
Subject: RE: about phosphor pid control package
Thread-Topic: about phosphor pid control package
Thread-Index: AdUFo9RcAeugSeF6TkK3RbzjlTMQif//qpQA//6jn2CAAs8MAIAANJ2A//8SP1D/9wrAcA==
Date: Tue, 14 May 2019 12:50:59 +0000
Message-ID: <06213e65eb3c48ce8eaa3699265bf8ae@quantatw.com>
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
 <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
 <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
 <CAO=notzHKYjCd++=A+rEzV8bdLc782caeDA=aHg2bC4-6JTp=g@mail.gmail.com>
 <0a0149bc-5120-78ee-1fc3-877f510b66a4@linux.intel.com> 
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24610.003
x-tm-as-result: No--9.363500-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-139006-700648-1
 06660-110462-700075-703378-702169-105250-700752-704341-704421-701914-700173
 -708797-188019-709185-701019-701499-700038-701163-703529-700560-700312-7074
 10-702143-701604-700472-709584-106420-701005-705753-707027-780022-700383-71
 2058-705388-705861-700949-704102-700586-148004-148133-42000-42003-63-190014
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2lsbCBMaWFuZyAo5qKB
5rC46YmJKQ0KPiBTZW50OiBGcmlkYXksIE1heSAxMCwgMjAxOSA4OjA2IEFNDQo+IFRvOiAnSmFt
ZXMgRmVpc3QnIDxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+OyBQYXRyaWNrIFZlbnR1cmUN
Cj4gPHZlbnR1cmVAZ29vZ2xlLmNvbT4NCj4gQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVjdDogUkU6IGFib3V0IHBob3NwaG9yIHBpZCBjb250
cm9sIHBhY2thZ2UNCj4gDQo+IA0KPiA+IE9uIDUvOS8xOSA3OjQzIEFNLCBQYXRyaWNrIFZlbnR1
cmUgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1heSA4LCAyMDE5IGF0IDExOjMzIFBNIFdpbGwgTGlh
bmcgKOaigeawuOmJiSkNCj4gPiA+IDxXaWxsLkxpYW5nQHF1YW50YXR3LmNvbT4gd3JvdGU6DQo+
ID4gPj4NCj4gPiA+PiBIaSwNCj4gPiA+Pg0KPiA+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4+PiBGcm9tOiBQYXRyaWNrIFZlbnR1cmUgW21haWx0bzp2ZW50dXJlQGdvb2ds
ZS5jb21dDQo+ID4gPj4+IFNlbnQ6IFRodXJzZGF5LCBNYXkgOSwgMjAxOSAxMjozNiBBTQ0KPiA+
ID4+PiBUbzogV2lsbCBMaWFuZyAo5qKB5rC46YmJKSA8V2lsbC5MaWFuZ0BxdWFudGF0dy5jb20+
DQo+ID4gPj4+IENjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+
DQo+ID4gPj4+IFN1YmplY3Q6IFJlOiBhYm91dCBwaG9zcGhvciBwaWQgY29udHJvbCBwYWNrYWdl
DQo+ID4gPj4+DQo+ID4gPj4+IE9uIFdlZCwgTWF5IDgsIDIwMTkgYXQgNjo0NiBBTSBXaWxsIExp
YW5nICjmooHmsLjpiYkpDQo+ID4gPj4+IDxXaWxsLkxpYW5nQHF1YW50YXR3LmNvbT4gd3JvdGU6
DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSGksDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSSBoYXZlIGEgcXVl
c3Rpb24gYWJvdXQgZ2V0RmFpbFNhZmVNb2RlKCkuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gQ3VycmVu
dGx5LCBvbmx5IHNlbnNvcnMgdGhhdCBhcmUgZGVmaW5lZCBhcyAidGVtcCIgdHlwZXMgY2FuIGJl
DQo+ID4gPj4+PiBjaGVja2VkIGZvcg0KPiA+ID4+PiBmYWlsdXJlLg0KPiA+ID4+Pj4gSSBkaWQg
bm90IGZpbmQgYW55ICJmYW4iIHR5cGUgc2Vuc29ycyB0byBjaGVjayBpZiB0aGUgZmFuIGhhcyBm
YWlsZWQuDQo+ID4gPj4+PiBPdXIgcHJvamVjdCBuZWVkIHRvIGNoZWNrIHRoZSBmYW4gZmFpbCBz
byAgSSB3YW50IHRvIGFkZCBhbm90aGVyDQo+ID4gPj4+PiAiZmFuIiBzZW5zb3INCj4gPiA+Pj4g
dHlwZSB0byBjaGVjay4NCj4gPiA+Pj4NCj4gPiA+Pj4NCj4gPiA+Pj4NCj4gPiA+Pj4+DQo+ID4g
Pj4+PiBDYW4gSSBhZGQgb25lIG1vcmUgImZvciBsb29wIiB0byBjaGVjayB0aGUgZmFuIHNlbnNv
ciBpbg0KPiA+ID4+Pj4gdXBkYXRlU2Vuc29ycygpDQo+ID4gPj4+IGZ1bmN0aW9uIGluIHpvbmUu
Y3BwPz8NCj4gPiA+Pj4+DQo+ID4gPj4+PiBmb3IgKGNvbnN0IGF1dG8mIHQgOiBfdGhlcm1hbElu
cHV0cykgew0KPiA+ID4+Pj4gICAgICAuLi4uLi4uLg0KPiA+ID4+Pj4gfQ0KPiA+ID4+Pj4gZm9y
IChjb25zdCBhdXRvJiB0IDogX2ZhbklucHV0cykNCj4gPiA+Pj4+IHsNCj4gPiA+Pj4+ICAgICAg
Li4uLi4uLi4NCj4gPiA+Pj4+IH0NCj4gPiA+Pj4NCj4gPiA+Pj4gdXBkYXRlU2Vuc29ycyBpcyBk
ZWxpYmVyYXRlbHkgbm90IHRhbGtpbmcgdG8gdGhlIGZhbnMgYmVjYXVzZQ0KPiA+ID4+PiB0aGV5
J3JlIG5vdCBjb25zaWRlcmVkIGlucHV0cyBpbnRvIHRoZSB0aGVybWFsIGNvbmZpZywgdGhleSdy
ZQ0KPiA+ID4+PiBjb250cm9sbGVkIG91dHB1dHMgLS0gdGhlIHF1ZXN0aW9uIEkgaGF2ZSBpcywg
d2hhdCB3b3VsZCB5b3UgbGlrZQ0KPiA+ID4+PiB0byBkbyBpZiBhDQo+ID4gZmFuIGlzbid0IHJl
c3BvbmRpbmc/DQo+ID4gPj4+IGZhaWxzYWZlbW9kZSBkcml2ZXMgdGhlIGZhbnMgdG8gYSBzcGVj
aWZpYyBwcmUtZGVmaW5lZCBzcGVlZCB0bw0KPiA+ID4+PiBrZWVwIGl0IGZyb20gdGhlcm1hbCBp
c3N1ZXMuICBJZiBhIGZhbiBpcyBmYWlsaW5nIHRvIHJlc3BvbmQsIG9uZQ0KPiA+ID4+PiBjYW4n
dCBkcml2ZSBpdCAtLSBwZXJoYXBzIG9uZSBjYW4gZHJpdmUgdGhlIG90aGVycyB0byBzb21lIGZh
aWxzYWZlPw0KPiA+ID4+DQo+ID4gPj4gSWYgYSBmYW4gZmFpbHMsIHdlIG5lZWQgdG8gZW50ZXIg
dGhlIGZhaWwgc2FmZSBtb2RlIHRvIGluY3JlYXNlIHRoZQ0KPiA+ID4+IG90aGVyIGZhbg0KPiA+
IGR1dHkuDQo+ID4gPj4NCj4gPiA+Pj4gSWYgc28sIG9uZSBuZWVkcyB0byB1cGRhdGUgdGhlIGZh
aWxzYWZlIGZvciBhIHpvbmUgb3V0c2lkZSBvZiB0aGUNCj4gPiA+Pj4gdGhlcm1hbCBzZW5zb3Jz
LCBidXQgcmF0aGVyIHdoZXJlIHRoZSBmYW5zIGFyZSBjaGVja2VkICh2b2lkDQo+ID4gPj4+IFBJ
RFpvbmU6OnVwZGF0ZUZhblRlbGVtZXRyeSh2b2lkKSkNCj4gPiA+Pg0KPiA+ID4+IEkgYWRkIGZv
bGxvd2luZyBjb2RlIGludG8gdGhlIFBJRFpvbmU6OnVwZGF0ZUZhblRlbGVtZXRyeSh2b2lkKQ0K
PiA+ID4+IGZ1bmN0aW9uDQo+ID4gdG8gY2hlY2sgdGhlIGZhbiBmYWlsLg0KPiA+ID4+IElmIHRo
ZSBmYW4gZmFpbHMsIGl0IHdpbGwgZW50ZXIgZmFpbCBzYWZlIG1vZGUuDQo+ID4gPj4gICAgaWYg
KHNlbnNvci0+Z2V0RmFpbGVkKCkpDQo+ID4gPj4gICAgew0KPiA+ID4+ICAgICAgICAgIGZhaWxT
YWZlU2Vuc29ycy5pbnNlcnQoZik7DQo+ID4gPj4gICAgfQ0KPiA+ID4+ICAgIGVsc2UNCj4gPiA+
PiAgICB7DQo+ID4gPj4gICAgICAgICAgLy8gQ2hlY2sgaWYgaXQncyBpbiB0aGVyZTogcmVtb3Zl
IGl0Lg0KPiA+ID4+ICAgICAgYXV0byBrdCA9IF9mYWlsU2FmZVNlbnNvcnMuZmluZChmKTsNCj4g
PiA+PiAgICAgIGlmIChrdCAhPSBfZmFpbFNhZmVTZW5zb3JzLmVuZCgpKQ0KPiA+ID4+ICAgIHsN
Cj4gPiA+PiAgICAgICAgICBmYWlsU2FmZVNlbnNvcnMuZXJhc2Uoa3QpOw0KPiA+ID4+ICAgIH0N
Cj4gPiA+Pg0KPiA+ID4+IEJ1dCBvbmUgbW9yZSBxdWVzdGlvbiBJIGhhdmUgaXMgdGhhdCB0aGUg
YWJvdmUgY29kZSBjYW4gb25seSBjaGVjaw0KPiA+ID4+IGlmIGENCj4gPiBzaW5nbGUgZmFuIGhh
cyBmYWlsZWQuDQo+ID4gPg0KPiA+ID4+IE91ciBwcm9qZWN0IG5lZWRzIHRvIGNoZWNrIGZvciBk
dWFsLWZhbiBmYWlsdXJlcy4gRG8geW91IGhhdmUgYW55DQo+ID4gc3VnZ2VzdGlvbnMgZm9yIGNo
ZWNraW5nIHRoZSBmYWlsdXJlIG9mIHRoZSBkdWFsLWZhbj8NCj4gPiA+DQo+ID4gPiBJJ20gbm90
IGVudGlyZWx5IGNlcnRhaW4gd2hhdCB5b3UgbWVhbi4gIFlvdSdyZSBzYXlpbmcgYSBkdWFsLWZh
biBpcw0KPiA+ID4gYSBmYW4gdGhhdCBoYXMgdHdvIG91dHB1dHMgYnV0IG9uZSBpbnB1dD8NCj4g
Pg0KPiA+IElmIHRoaXMgaXMgd2hhdCB5b3UgbWVhbiwgb24gb3VyIHN5c3RlbXMgd2Ugc2ltcGx5
IGhhdmUgYSB0YWNoIHNlbnNvcg0KPiA+IHBlciB0YWNoIGluIHRoZSBmYW4sIGkuZS4gZmFuMWEg
YW5kIGZhbjFiLiBJIHRoaW5rIHRoZSBhYm92ZSBsb2dpYw0KPiA+IHdvdWxkIHdvcmsgZm9yIHRo
aXMgaXNzdWUuDQpJIHRoaW5rIHNvbWVvbmUgbWF5IGFsc28gbmVlZCB0byBjaGVjayBmb3Igb25l
IHJvdG9yIGZhbiBmYWlsLCBJIHdpbGwgcHVzaCB0aGUgYWJvdmUgY29kZSBpbnRvIGdlcnJpdA0K
DQo+IEknbSBzbyBzb3JyeSB0byBtYWtlIHlvdSBtaXN1bmRlcnN0YW5kIGJlY2F1c2Ugb2YgbXkg
dW5jbGVhciBleHByZXNzaW9uLg0KPiBUaGUgImR1YWwtZmFuIiBtZWFucyAiRHVhbCByb3RvciBm
YW4iICwgdHdvIHRhY2hvbWV0ZXIgb3V0cHV0IG9uZSBQV00NCj4gaW5wdXQuDQpPdXIgYXJjaGl0
ZWN0dXJlIGlzIHRoYXQgYm90aCBmYW4xYSBhbmQgZmFuMWIgZmFpbCAoZHVhbCByb3RvciBmYW4g
ZmFpbHVyZSkgYW5kIHRoZW4gdGhpcyBzaXR1YXRpb24gaXMgaWRlbnRpZmllZCBhcyBvbmUgZmFu
IGZhaWwuDQoNCldvdWxkIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIG9yIGlkZWE/DQoNCj4NCj4g
PiA+DQo+ID4gPj4NCj4gPiA+PiBXaWxsDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gQlJzLA0KPiA+ID4+
Pj4gV2lsbA0K
