Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0418572
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:33:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4503TG1cBlzDqLD
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:33:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=025fd6d60=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4503SV4mvwzDqJ1
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 16:33:09 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 09 May 2019 14:33:07 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 9 May 2019
 14:33:05 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 9 May 2019 14:33:05 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: Patrick Venture <venture@google.com>
Subject: RE: about phosphor pid control package
Thread-Topic: about phosphor pid control package
Thread-Index: AdUFo9RcAeugSeF6TkK3RbzjlTMQif//qpQA//6jn2A=
Date: Thu, 9 May 2019 06:33:05 +0000
Message-ID: <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
 <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
In-Reply-To: <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24596.006
x-tm-as-result: No--12.897300-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-139006-106660-7
 00075-110462-703378-702169-105250-700752-704341-704421-701914-700173-708797
 -188019-709185-701019-701499-700038-701163-703529-700560-700312-707410-7021
 43-701604-700472-709584-106420-701005-705753-707027-148004-148133-20043-420
 00-42003-63-190014
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF0cmljayBWZW50
dXJlIFttYWlsdG86dmVudHVyZUBnb29nbGUuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDks
IDIwMTkgMTI6MzYgQU0NCj4gVG86IFdpbGwgTGlhbmcgKOaigeawuOmJiSkgPFdpbGwuTGlhbmdA
cXVhbnRhdHcuY29tPg0KPiBDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPg0KPiBTdWJqZWN0OiBSZTogYWJvdXQgcGhvc3Bob3IgcGlkIGNvbnRyb2wgcGFja2Fn
ZQ0KPiANCj4gT24gV2VkLCBNYXkgOCwgMjAxOSBhdCA2OjQ2IEFNIFdpbGwgTGlhbmcgKOaigeaw
uOmJiSkNCj4gPFdpbGwuTGlhbmdAcXVhbnRhdHcuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpLA0K
PiA+DQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgZ2V0RmFpbFNhZmVNb2RlKCkuDQo+ID4N
Cj4gPiBDdXJyZW50bHksIG9ubHkgc2Vuc29ycyB0aGF0IGFyZSBkZWZpbmVkIGFzICJ0ZW1wIiB0
eXBlcyBjYW4gYmUgY2hlY2tlZCBmb3INCj4gZmFpbHVyZS4NCj4gPiBJIGRpZCBub3QgZmluZCBh
bnkgImZhbiIgdHlwZSBzZW5zb3JzIHRvIGNoZWNrIGlmIHRoZSBmYW4gaGFzIGZhaWxlZC4NCj4g
PiBPdXIgcHJvamVjdCBuZWVkIHRvIGNoZWNrIHRoZSBmYW4gZmFpbCBzbyAgSSB3YW50IHRvIGFk
ZCBhbm90aGVyICJmYW4iIHNlbnNvcg0KPiB0eXBlIHRvIGNoZWNrLg0KPiANCj4gDQo+IA0KPiA+
DQo+ID4gQ2FuIEkgYWRkIG9uZSBtb3JlICJmb3IgbG9vcCIgdG8gY2hlY2sgdGhlIGZhbiBzZW5z
b3IgaW4gdXBkYXRlU2Vuc29ycygpDQo+IGZ1bmN0aW9uIGluIHpvbmUuY3BwPz8NCj4gPg0KPiA+
IGZvciAoY29uc3QgYXV0byYgdCA6IF90aGVybWFsSW5wdXRzKQ0KPiA+IHsNCj4gPiAgICAgLi4u
Li4uLi4NCj4gPiB9DQo+ID4gZm9yIChjb25zdCBhdXRvJiB0IDogX2ZhbklucHV0cykNCj4gPiB7
DQo+ID4gICAgIC4uLi4uLi4uDQo+ID4gfQ0KPiANCj4gdXBkYXRlU2Vuc29ycyBpcyBkZWxpYmVy
YXRlbHkgbm90IHRhbGtpbmcgdG8gdGhlIGZhbnMgYmVjYXVzZSB0aGV5J3JlIG5vdA0KPiBjb25z
aWRlcmVkIGlucHV0cyBpbnRvIHRoZSB0aGVybWFsIGNvbmZpZywgdGhleSdyZSBjb250cm9sbGVk
IG91dHB1dHMgLS0gdGhlDQo+IHF1ZXN0aW9uIEkgaGF2ZSBpcywgd2hhdCB3b3VsZCB5b3UgbGlr
ZSB0byBkbyBpZiBhIGZhbiBpc24ndCByZXNwb25kaW5nPw0KPiBmYWlsc2FmZW1vZGUgZHJpdmVz
IHRoZSBmYW5zIHRvIGEgc3BlY2lmaWMgcHJlLWRlZmluZWQgc3BlZWQgdG8ga2VlcCBpdCBmcm9t
DQo+IHRoZXJtYWwgaXNzdWVzLiAgSWYgYSBmYW4gaXMgZmFpbGluZyB0byByZXNwb25kLCBvbmUg
Y2FuJ3QgZHJpdmUgaXQgLS0gcGVyaGFwcyBvbmUNCj4gY2FuIGRyaXZlIHRoZSBvdGhlcnMgdG8g
c29tZSBmYWlsc2FmZT8NCg0KSWYgYSBmYW4gZmFpbHMsIHdlIG5lZWQgdG8gZW50ZXIgdGhlIGZh
aWwgc2FmZSBtb2RlIHRvIGluY3JlYXNlIHRoZSBvdGhlciBmYW4gZHV0eS4NCg0KPiBJZiBzbywg
b25lIG5lZWRzIHRvIHVwZGF0ZSB0aGUgZmFpbHNhZmUgZm9yIGEgem9uZSBvdXRzaWRlIG9mIHRo
ZSB0aGVybWFsIHNlbnNvcnMsDQo+IGJ1dCByYXRoZXIgd2hlcmUgdGhlIGZhbnMgYXJlIGNoZWNr
ZWQgKHZvaWQNCj4gUElEWm9uZTo6dXBkYXRlRmFuVGVsZW1ldHJ5KHZvaWQpKQ0KDQpJIGFkZCBm
b2xsb3dpbmcgY29kZSBpbnRvIHRoZSBQSURab25lOjp1cGRhdGVGYW5UZWxlbWV0cnkodm9pZCkg
ZnVuY3Rpb24gdG8gY2hlY2sgdGhlIGZhbiBmYWlsLiANCklmIHRoZSBmYW4gZmFpbHMsIGl0IHdp
bGwgZW50ZXIgZmFpbCBzYWZlIG1vZGUuDQogIGlmIChzZW5zb3ItPmdldEZhaWxlZCgpKQ0KICB7
DQogIAlmYWlsU2FmZVNlbnNvcnMuaW5zZXJ0KGYpOw0KICB9DQogIGVsc2UNCiAgew0KICAJLy8g
Q2hlY2sgaWYgaXQncyBpbiB0aGVyZTogcmVtb3ZlIGl0Lg0KICAgIGF1dG8ga3QgPSBfZmFpbFNh
ZmVTZW5zb3JzLmZpbmQoZik7DQogICAgaWYgKGt0ICE9IF9mYWlsU2FmZVNlbnNvcnMuZW5kKCkp
DQogIHsNCiAgCWZhaWxTYWZlU2Vuc29ycy5lcmFzZShrdCk7DQogIH0NCiAgIA0KQnV0IG9uZSBt
b3JlIHF1ZXN0aW9uIEkgaGF2ZSBpcyB0aGF0IHRoZSBhYm92ZSBjb2RlIGNhbiBvbmx5IGNoZWNr
IGlmIGEgc2luZ2xlIGZhbiBoYXMgZmFpbGVkLg0KT3VyIHByb2plY3QgbmVlZHMgdG8gY2hlY2sg
Zm9yIGR1YWwtZmFuIGZhaWx1cmVzLiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIGNo
ZWNraW5nIHRoZSBmYWlsdXJlIG9mIHRoZSBkdWFsLWZhbj8NCg0KV2lsbA0KPiA+DQo+ID4gQlJz
LA0KPiA+IFdpbGwNCg==
