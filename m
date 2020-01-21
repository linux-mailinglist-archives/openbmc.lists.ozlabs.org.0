Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F901438A7
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 09:47:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4822H52dsszDqSy
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 19:47:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=282574ef5=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4822GD2RpWzDqRX
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 19:46:58 +1100 (AEDT)
IronPort-SDR: axAlYLZJJtlkQzLEWzHj/jFwiPZKTaTzESexHzTPluHTcOgJxSxDIy0blyNpLXNIFEsSMo84qq
 GAUdLFD8OPCw==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 21 Jan 2020 16:46:55 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 Jan
 2020 16:46:53 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 21 Jan 2020 16:46:53 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>, "Thomaiyar, Richard
 Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: RE: Verify Privilege For Different Channels in openbmc-test-automation
Thread-Topic: Verify Privilege For Different Channels in
 openbmc-test-automation
Thread-Index: AdXKuxmeAxEUTzgySNaVM+b2wNcnWQBYBjUAADcISED//9Y/gP/7T9bQgAmu0AD//rQyUIACMSQAgAAGMID//0J1UA==
Date: Tue, 21 Jan 2020 08:46:53 +0000
Message-ID: <059fe82ae51c4e3bbf90f5045e8a9371@quantatw.com>
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
 <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
 <d5f1c07fa629476798196f9490574c7c@quantatw.com>
 <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
 <9f63a6b71e8a485bba08a1bedb1b922c@quantatw.com>
 <c7782b54-da11-953e-815c-8f5a3a6610fc@linux.intel.com>
 <CAAMkS13kJGWWroEkUnJB7Eec6DGWxUTZXM+4ajJpZi=ACkXyyA@mail.gmail.com>
In-Reply-To: <CAAMkS13kJGWWroEkUnJB7Eec6DGWxUTZXM+4ajJpZi=ACkXyyA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 8AA781D43DA2A3C1829EBEFD8AB47DF48E5CA78BDCB53E57DCD5C6B45512D8E22000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSdtIHNvcnJ5LCB3ZSBhbHNvIGRvIG5vdCBoYXZlIGR1YWwgY2hhbm5lbCBzeXN0ZW0gY3VycmVu
dGx5Lg0KT25jZSB3ZSBoYXZlLCBpdCB3aWxsIGJlIHRlc3RlZCBhbmQgdXBkYXRlZCBmb3IgdGhl
c2UgdHdvIHRlc3QgY2FzZXMuDQoNCkZyb206IFJhaHVsIE1haGVzaHdhcmkgPHJhaHVsbWFoZXNo
d2FyaTAxQGdtYWlsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIxLCAyMDIwIDE6MjEg
UE0NClRvOiBUaG9tYWl5YXIsIFJpY2hhcmQgTWFyaWFuIDxyaWNoYXJkLm1hcmlhbi50aG9tYWl5
YXJAbGludXguaW50ZWwuY29tPg0KQ2M6IFRvbnkgTGVlICjmnY7mloflr4wpIDxUb255LkxlZUBx
dWFudGF0dy5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBWZXJp
ZnkgUHJpdmlsZWdlIEZvciBEaWZmZXJlbnQgQ2hhbm5lbHMgaW4gb3BlbmJtYy10ZXN0LWF1dG9t
YXRpb24NCg0KVGhhbmtzIFJpY2hhcmQgZm9yIGNvcnJlY3RpbmcuIFllcywgdGhlcmUgaXMgYSBu
ZWVkIHRvIHVwZGF0ZSB0aGlzIHRlc3QgY2FzZS7CoA0KDQpUb255DQpXZSBkb24ndCBydW4gdGhp
cyB0ZXN0IGNhc2Ugb24gb3VyIHN5c3RlbXMgYXMgd2UgZG9udCBoYXZlIGR1YWwgY2hhbm5lbCBz
eXN0ZW0uIENhbiB5b3UgZml4IHRoaXMgdGVzdCBjYXNlPw0KDQpUaGFua3MNClJhaHVsDQoNCk9u
IFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDEwOjI5IEFNIFRob21haXlhciwgUmljaGFyZCBNYXJpYW4g
PG1haWx0bzpyaWNoYXJkLm1hcmlhbi50aG9tYWl5YXJAbGludXguaW50ZWwuY29tPiB3cm90ZToN
CkhpIFRvbnkgLyBSYWh1bCwNCg0KMS4gc2VsIGluZm8gMcKgIChJIGRvbid0IHRoaW5rIHNlbCBp
bmZvIGNhbiBnZXQgY2hhbm5lbCBudW1iZXIsIGFzIHNlbCBpcyANCm5vdCBiYXNlZCBvbiBjaGFu
bmVsIG51bWJlcnMpDQoNCjIuIHVzZXIgbGlzdCBjYW4gYmUgcXVlcmllZCB0aHJvdWdoIGNoYW5u
ZWwgbnVtYmVyIGkuZS4gInVzZXIgbGlzdCAxIiANCndpbGwgcXVlcnkgdXNlciBwcml2aWxlZ2Vz
IGFzIHBlciBjaGFubmVsIG51bWJlciAxIGFuZCAidXNlciBsaXN0IDMiIA0Kd2lsbCBxdWVyeSB1
c2VyIHByaXZpbGVnZXMgYXMgcGVyIGNoYW5uZWwgbnVtYmVyIDMuIEJ1dCBpdCBkb2Vzbid0IA0K
ZGV0ZXJtaW5lIHRoZSBpbmNvbWluZyBjaGFubmVsIG51bWJlci4NCg0KaS5lLiBpZiBhIHN5c3Rl
bSBpcyBoYXZpbmcgMiBMQU4gQ2hhbm5lbHMsIHRoZW4gTEFOIGNoYW5uZWwgcHJpdmlsZWdlIGlz
IA0KYmFzZWQgb24gdGhlIElQIGFkZHJlc3Mgb2YgdGhvc2UgY2hhbm5lbHMNCg0Kc2F5IGNoYW5u
ZWwgMSBpcyBoYXZpbmcgSVAgeC55LnouMSAmIGNoYW5uZWwgMyBpcyBoYXZpbmcgSVAgeC55Lnou
M8KgIGFuZCANCmNoYW5uZWwgMyBpcyB3aXRoIE5vQWNjZXNzDQoNCnRoZW4gZXhlY3V0aW5nIGZv
bGxvd2luZyBjb21tYW5kIHdpbGwgcGFzcw0KDQppcG1pdG9vbCAtSSBsYW5wbHVzIC1IIHgueS56
LjEgLVUgcm9vdCAtUCAwcGVuQm1jIHVzZXIgbGlzdCAxDQoNCmlwbWl0b29sIC1JIGxhbnBsdXMg
LUggeC55LnouMSAtVSByb290IC1QIDBwZW5CbWMgdXNlciBsaXN0IDMNCg0KRm9sbG93aW5nIGNv
bW1hbmQgZXhlY3V0aW9uIHdpbGwgZmFpbA0KDQppcG1pdG9vbCAtSSBsYW5wbHVzIC1IIHgueS56
LjMgLVUgcm9vdCAtUCAwcGVuQm1jIHVzZXIgbGlzdCAxIC0tPiB3aWxsIA0KZmFpbCBpZiBjaGFu
bmVsIDMgaXMgd2l0aCBOb0FjY2VzcyBwcml2aWxlZ2UgZm9yIHVzZXIgcm9vdA0KDQppcG1pdG9v
bCAtSSBsYW5wbHVzIC1IIHgueS56LjMgLVUgcm9vdCAtUCAwcGVuQm1jIHVzZXIgbGlzdCAxIC0t
PiB3aWxsIA0KZmFpbCBpZiBjaGFubmVsIDMgaXMgd2l0aCBOb0FjY2VzcyBwcml2aWxlZ2UgZm9y
IHVzZXIgcm9vdA0KDQpQbGVhc2UgdXBkYXRlIHRoZSB0ZXN0IGNhc2UgYWNjb3JkaW5nbHkuDQoN
ClJlZ2FyZHMsDQoNClJpY2hhcmQNCg0KT24gMS8yMS8yMDIwIDg6MzkgQU0sIFRvbnkgTGVlICjm
nY7mloflr4wpIHdyb3RlOg0KPj4gQXJlIHlvdSBzYXlpbmcgdGhhdCB3aXRoIE5vQWNlc3MgZm9y
IGNoYW5uZWwgeCwgeW91IGFyZSBhYmxlIHRvIGdldCB0aGUgSVBNSQ0KPj4gcmVzcG9uc2UuDQo+
IFllcy4NCj4NCj4+IHBsZWFzZSBub3RlOiAtSCB4LngueC54wqAgZGV0ZXJtaW5lcywgd2hpY2gg
Y2hhbm5lbCB5b3UgYXJlIHRyeWluZyB0bw0KPj4gY29tbXVuaWNhdGUuIFRyeSB0aGUgb3RoZXIg
SVAgYWRkcmVzcyAoYmVjYXVzZSBub3Qgc3VyZSwgd2hpY2ggY2hhbm5lbCBpcw0KPj4gY29uZmln
dXJlZCB0byB3aGF0IElQKS4NCj4gVGhpcyBpcyBhcyBJIGV4cGVjdGVkIQ0KPiBIb3dldmVyLCBw
bGVhc2UgbG9vayBhdCB0aGUgY2FzZXMgIlZlcmlmeSBBZG1pbmlzdHJhdG9yIEFuZCBObyBBY2Nl
c3MgUHJpdmlsZWdlIEZvciBEaWZmZXJlbnQgQ2hhbm5lbHMiDQo+IGFuZCAiVmVyaWZ5IE9wZXJh
dG9yIEFuZCBVc2VyIFByaXZpbGVnZSBGb3IgRGlmZmVyZW50IENoYW5uZWxzIiBpbiB0ZXN0X2lw
bWlfdXNlci5yb2JvdC4NCj4gRm9yIGV4YW1wbGU6IGNhc2UgIlZlcmlmeSBBZG1pbmlzdHJhdG9y
IEFuZCBObyBBY2Nlc3MgUHJpdmlsZWdlIEZvciBEaWZmZXJlbnQgQ2hhbm5lbHMiIGF0IHRoZSBs
YXN0IHR3byAiVmVyaWZ5IiBzdGVwczoNCj4gJycnDQo+ICMgVmVyaWZ5IHRoYXQgdXNlciBpcyBh
YmxlIHRvIHJ1biBhZG1pbmlzdHJhdG9yIGxldmVsIElQTUkgY29tbWFuZCB3aXRoIGNoYW5uZWwg
MS4NCj4gVmVyaWZ5IElQTUkgQ29tbWFuZMKgICR7cmFuZG9tX3VzZXJuYW1lfcKgICR7dmFsaWRf
cGFzc3dvcmR9wqAgQWRtaW5pc3RyYXRvcsKgIDENCj4NCj4gIyBWZXJpZnkgdGhhdCB1c2VyIGlz
IHVuYWJsZSB0byBydW4gSVBNSSBjb21tYW5kIHdpdGggY2hhbm5lbCAyLg0KPiBSdW4gSVBNSSBT
dGFuZGFyZCBDb21tYW5kwqAgc2VsIGluZm8gMsKgIGV4cGVjdGVkX3JjPSR7MX3CoCBVPSR7cmFu
ZG9tX3VzZXJuYW1lfcKgIFA9JHt2YWxpZF9wYXNzd29yZH0NCj4gJycnDQo+DQo+IEluIHRoaXMg
Y2FzZSwgZmlyc3QsIHRoZXJlIGlzIG9ubHkgb25lIElQIGFkZHJlc3MuDQo+IHNlY29uZCwgSSBj
YW4ndCBmaW5kIGEgZGVzY3JpcHRpb24gb3IgU1BFQyBhYm91dCBjb21tYW5kIGxpa2UNCj4gImlw
bWl0b29sIC1JIGxhbnBsdXMgLUMgMyAtcCA2MjMgLVUgWW1SQndEVVMgLVAgMHBlbkJtYzEgLUgg
eC54LngueCAtTCBBZG1pbmlzdHJhdG9yIHNlbCBpbmZvIDEiDQo+IHdoaWNoIG1lYW4gdXNlciBp
cyBhYmxlIHRvIHJ1biBJUE1JIGNvbW1hbmQgd2l0aCBjaGFubmVsIDEuDQo+DQo+IElmIHRoZSBt
ZXRob2QgZm9yIG91dC1vZi1iYW5kIGNvbW11bmljYXRpb24gdXNpbmcgZGlmZmVyZW50IGNoYW5u
ZWxzIGlzIHRoZSBzYW1lIGFzIHlvdSBkZXNjcmliZWQsDQo+IGRvIHdlIG5lZWQgdG8gZml4IHRo
ZXNlIHR3byBjYXNlcz8NCj4NCj4+IFJlZ2FyZHMsDQo+Pg0KPj4gUmljaGFyZA0KPj4NCg==
