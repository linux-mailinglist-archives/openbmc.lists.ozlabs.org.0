Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C4195F2
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 02:09:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450VvT0ch8zDqSP
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 10:09:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=02683847c=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 450Vtf3lqwzDqRh
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 10:08:53 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 10 May 2019 08:08:50 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 10 May
 2019 08:08:49 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Fri, 10 May 2019 08:08:48 +0800
From: =?utf-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>
To: James Feist <james.feist@linux.intel.com>, Patrick Venture
 <venture@google.com>
Subject: RE: about phosphor pid control package
Thread-Topic: about phosphor pid control package
Thread-Index: AdUFo9RcAeugSeF6TkK3RbzjlTMQif//qpQA//6jn2CAAs8MAIAANJ2A//8SP1A=
Date: Fri, 10 May 2019 00:08:48 +0000
Message-ID: <e427cf4e06a04496906ac7933d871db2@quantatw.com>
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
 <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
 <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
 <CAO=notzHKYjCd++=A+rEzV8bdLc782caeDA=aHg2bC4-6JTp=g@mail.gmail.com>
 <0a0149bc-5120-78ee-1fc3-877f510b66a4@linux.intel.com>
In-Reply-To: <0a0149bc-5120-78ee-1fc3-877f510b66a4@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24602.004
x-tm-as-result: No--14.027300-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-700075-110462-1
 39006-106660-703378-702169-105250-700752-704341-704421-701914-700173-708797
 -188019-709185-701019-701499-700038-701163-703529-700560-700312-707410-7021
 43-701604-700472-709584-106420-701005-705753-707027-780022-700383-712058-70
 5388-705861-700949-148004-148133-20043-42000-42003-63-190014
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

DQo+IE9uIDUvOS8xOSA3OjQzIEFNLCBQYXRyaWNrIFZlbnR1cmUgd3JvdGU6DQo+ID4gT24gV2Vk
LCBNYXkgOCwgMjAxOSBhdCAxMTozMyBQTSBXaWxsIExpYW5nICjmooHmsLjpiYkpDQo+ID4gPFdp
bGwuTGlhbmdAcXVhbnRhdHcuY29tPiB3cm90ZToNCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogUGF0cmljayBWZW50dXJl
IFttYWlsdG86dmVudHVyZUBnb29nbGUuY29tXQ0KPiA+Pj4gU2VudDogVGh1cnNkYXksIE1heSA5
LCAyMDE5IDEyOjM2IEFNDQo+ID4+PiBUbzogV2lsbCBMaWFuZyAo5qKB5rC46YmJKSA8V2lsbC5M
aWFuZ0BxdWFudGF0dy5jb20+DQo+ID4+PiBDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPg0KPiA+Pj4gU3ViamVjdDogUmU6IGFib3V0IHBob3NwaG9yIHBpZCBj
b250cm9sIHBhY2thZ2UNCj4gPj4+DQo+ID4+PiBPbiBXZWQsIE1heSA4LCAyMDE5IGF0IDY6NDYg
QU0gV2lsbCBMaWFuZyAo5qKB5rC46YmJKQ0KPiA+Pj4gPFdpbGwuTGlhbmdAcXVhbnRhdHcuY29t
PiB3cm90ZToNCj4gPj4+Pg0KPiA+Pj4+IEhpLA0KPiA+Pj4+DQo+ID4+Pj4gSSBoYXZlIGEgcXVl
c3Rpb24gYWJvdXQgZ2V0RmFpbFNhZmVNb2RlKCkuDQo+ID4+Pj4NCj4gPj4+PiBDdXJyZW50bHks
IG9ubHkgc2Vuc29ycyB0aGF0IGFyZSBkZWZpbmVkIGFzICJ0ZW1wIiB0eXBlcyBjYW4gYmUNCj4g
Pj4+PiBjaGVja2VkIGZvcg0KPiA+Pj4gZmFpbHVyZS4NCj4gPj4+PiBJIGRpZCBub3QgZmluZCBh
bnkgImZhbiIgdHlwZSBzZW5zb3JzIHRvIGNoZWNrIGlmIHRoZSBmYW4gaGFzIGZhaWxlZC4NCj4g
Pj4+PiBPdXIgcHJvamVjdCBuZWVkIHRvIGNoZWNrIHRoZSBmYW4gZmFpbCBzbyAgSSB3YW50IHRv
IGFkZCBhbm90aGVyDQo+ID4+Pj4gImZhbiIgc2Vuc29yDQo+ID4+PiB0eXBlIHRvIGNoZWNrLg0K
PiA+Pj4NCj4gPj4+DQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj4gQ2FuIEkgYWRkIG9uZSBtb3JlICJm
b3IgbG9vcCIgdG8gY2hlY2sgdGhlIGZhbiBzZW5zb3IgaW4NCj4gPj4+PiB1cGRhdGVTZW5zb3Jz
KCkNCj4gPj4+IGZ1bmN0aW9uIGluIHpvbmUuY3BwPz8NCj4gPj4+Pg0KPiA+Pj4+IGZvciAoY29u
c3QgYXV0byYgdCA6IF90aGVybWFsSW5wdXRzKSB7DQo+ID4+Pj4gICAgICAuLi4uLi4uLg0KPiA+
Pj4+IH0NCj4gPj4+PiBmb3IgKGNvbnN0IGF1dG8mIHQgOiBfZmFuSW5wdXRzKQ0KPiA+Pj4+IHsN
Cj4gPj4+PiAgICAgIC4uLi4uLi4uDQo+ID4+Pj4gfQ0KPiA+Pj4NCj4gPj4+IHVwZGF0ZVNlbnNv
cnMgaXMgZGVsaWJlcmF0ZWx5IG5vdCB0YWxraW5nIHRvIHRoZSBmYW5zIGJlY2F1c2UNCj4gPj4+
IHRoZXkncmUgbm90IGNvbnNpZGVyZWQgaW5wdXRzIGludG8gdGhlIHRoZXJtYWwgY29uZmlnLCB0
aGV5J3JlDQo+ID4+PiBjb250cm9sbGVkIG91dHB1dHMgLS0gdGhlIHF1ZXN0aW9uIEkgaGF2ZSBp
cywgd2hhdCB3b3VsZCB5b3UgbGlrZSB0byBkbyBpZiBhDQo+IGZhbiBpc24ndCByZXNwb25kaW5n
Pw0KPiA+Pj4gZmFpbHNhZmVtb2RlIGRyaXZlcyB0aGUgZmFucyB0byBhIHNwZWNpZmljIHByZS1k
ZWZpbmVkIHNwZWVkIHRvIGtlZXANCj4gPj4+IGl0IGZyb20gdGhlcm1hbCBpc3N1ZXMuICBJZiBh
IGZhbiBpcyBmYWlsaW5nIHRvIHJlc3BvbmQsIG9uZSBjYW4ndA0KPiA+Pj4gZHJpdmUgaXQgLS0g
cGVyaGFwcyBvbmUgY2FuIGRyaXZlIHRoZSBvdGhlcnMgdG8gc29tZSBmYWlsc2FmZT8NCj4gPj4N
Cj4gPj4gSWYgYSBmYW4gZmFpbHMsIHdlIG5lZWQgdG8gZW50ZXIgdGhlIGZhaWwgc2FmZSBtb2Rl
IHRvIGluY3JlYXNlIHRoZSBvdGhlciBmYW4NCj4gZHV0eS4NCj4gPj4NCj4gPj4+IElmIHNvLCBv
bmUgbmVlZHMgdG8gdXBkYXRlIHRoZSBmYWlsc2FmZSBmb3IgYSB6b25lIG91dHNpZGUgb2YgdGhl
DQo+ID4+PiB0aGVybWFsIHNlbnNvcnMsIGJ1dCByYXRoZXIgd2hlcmUgdGhlIGZhbnMgYXJlIGNo
ZWNrZWQgKHZvaWQNCj4gPj4+IFBJRFpvbmU6OnVwZGF0ZUZhblRlbGVtZXRyeSh2b2lkKSkNCj4g
Pj4NCj4gPj4gSSBhZGQgZm9sbG93aW5nIGNvZGUgaW50byB0aGUgUElEWm9uZTo6dXBkYXRlRmFu
VGVsZW1ldHJ5KHZvaWQpIGZ1bmN0aW9uDQo+IHRvIGNoZWNrIHRoZSBmYW4gZmFpbC4NCj4gPj4g
SWYgdGhlIGZhbiBmYWlscywgaXQgd2lsbCBlbnRlciBmYWlsIHNhZmUgbW9kZS4NCj4gPj4gICAg
aWYgKHNlbnNvci0+Z2V0RmFpbGVkKCkpDQo+ID4+ICAgIHsNCj4gPj4gICAgICAgICAgZmFpbFNh
ZmVTZW5zb3JzLmluc2VydChmKTsNCj4gPj4gICAgfQ0KPiA+PiAgICBlbHNlDQo+ID4+ICAgIHsN
Cj4gPj4gICAgICAgICAgLy8gQ2hlY2sgaWYgaXQncyBpbiB0aGVyZTogcmVtb3ZlIGl0Lg0KPiA+
PiAgICAgIGF1dG8ga3QgPSBfZmFpbFNhZmVTZW5zb3JzLmZpbmQoZik7DQo+ID4+ICAgICAgaWYg
KGt0ICE9IF9mYWlsU2FmZVNlbnNvcnMuZW5kKCkpDQo+ID4+ICAgIHsNCj4gPj4gICAgICAgICAg
ZmFpbFNhZmVTZW5zb3JzLmVyYXNlKGt0KTsNCj4gPj4gICAgfQ0KPiA+Pg0KPiA+PiBCdXQgb25l
IG1vcmUgcXVlc3Rpb24gSSBoYXZlIGlzIHRoYXQgdGhlIGFib3ZlIGNvZGUgY2FuIG9ubHkgY2hl
Y2sgaWYgYQ0KPiBzaW5nbGUgZmFuIGhhcyBmYWlsZWQuDQo+ID4NCj4gPj4gT3VyIHByb2plY3Qg
bmVlZHMgdG8gY2hlY2sgZm9yIGR1YWwtZmFuIGZhaWx1cmVzLiBEbyB5b3UgaGF2ZSBhbnkNCj4g
c3VnZ2VzdGlvbnMgZm9yIGNoZWNraW5nIHRoZSBmYWlsdXJlIG9mIHRoZSBkdWFsLWZhbj8NCj4g
Pg0KPiA+IEknbSBub3QgZW50aXJlbHkgY2VydGFpbiB3aGF0IHlvdSBtZWFuLiAgWW91J3JlIHNh
eWluZyBhIGR1YWwtZmFuIGlzIGENCj4gPiBmYW4gdGhhdCBoYXMgdHdvIG91dHB1dHMgYnV0IG9u
ZSBpbnB1dD8NCj4gDQo+IElmIHRoaXMgaXMgd2hhdCB5b3UgbWVhbiwgb24gb3VyIHN5c3RlbXMg
d2Ugc2ltcGx5IGhhdmUgYSB0YWNoIHNlbnNvciBwZXIgdGFjaA0KPiBpbiB0aGUgZmFuLCBpLmUu
IGZhbjFhIGFuZCBmYW4xYi4gSSB0aGluayB0aGUgYWJvdmUgbG9naWMgd291bGQgd29yayBmb3Ig
dGhpcw0KPiBpc3N1ZS4NCg0KSSdtIHNvIHNvcnJ5IHRvIG1ha2UgeW91IG1pc3VuZGVyc3RhbmQg
YmVjYXVzZSBvZiBteSB1bmNsZWFyIGV4cHJlc3Npb24uDQpUaGUgImR1YWwtZmFuIiBtZWFucyAi
RHVhbCByb3RvciBmYW4iICwgdHdvIHRhY2hvbWV0ZXIgb3V0cHV0IG9uZSBQV00gaW5wdXQuDQoN
Cg0KPiA+DQo+ID4+DQo+ID4+IFdpbGwNCj4gPj4+Pg0KPiA+Pj4+IEJScywNCj4gPj4+PiBXaWxs
DQo=
