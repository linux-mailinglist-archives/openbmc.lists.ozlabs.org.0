Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC91435D7
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 04:10:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481tnd2FnbzDqVW
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 14:10:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=282574ef5=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 481tmm2fxWzDqPM
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 14:09:22 +1100 (AEDT)
IronPort-SDR: JONnjTGDUISBwZAyoTxdoM/qu/Wb343klr/rHkK1uZsNXHYJhCXeTXqb9O+o02IQF9oXB4IQr4
 5H09+RHYdh9w==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 21 Jan 2020 11:09:17 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 Jan
 2020 11:09:16 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 21 Jan 2020 11:09:16 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Verify Privilege For Different Channels in openbmc-test-automation
Thread-Topic: Verify Privilege For Different Channels in
 openbmc-test-automation
Thread-Index: AdXKuxmeAxEUTzgySNaVM+b2wNcnWQBYBjUAADcISED//9Y/gP/7T9bQgAmu0AD//rQyUA==
Date: Tue, 21 Jan 2020 03:09:16 +0000
Message-ID: <9f63a6b71e8a485bba08a1bedb1b922c@quantatw.com>
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
 <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
 <d5f1c07fa629476798196f9490574c7c@quantatw.com>
 <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
In-Reply-To: <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 5605F693E2D90500BA47D8C1A06F60C5763AC254AD2FE7D008157E42819DD7752000:8
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

PiBBcmUgeW91IHNheWluZyB0aGF0IHdpdGggTm9BY2VzcyBmb3IgY2hhbm5lbCB4LCB5b3UgYXJl
IGFibGUgdG8gZ2V0IHRoZSBJUE1JDQo+IHJlc3BvbnNlLg0KWWVzLg0KDQo+IHBsZWFzZSBub3Rl
OiAtSCB4LngueC54wqAgZGV0ZXJtaW5lcywgd2hpY2ggY2hhbm5lbCB5b3UgYXJlIHRyeWluZyB0
bw0KPiBjb21tdW5pY2F0ZS4gVHJ5IHRoZSBvdGhlciBJUCBhZGRyZXNzIChiZWNhdXNlIG5vdCBz
dXJlLCB3aGljaCBjaGFubmVsIGlzDQo+IGNvbmZpZ3VyZWQgdG8gd2hhdCBJUCkuDQpUaGlzIGlz
IGFzIEkgZXhwZWN0ZWQhDQpIb3dldmVyLCBwbGVhc2UgbG9vayBhdCB0aGUgY2FzZXMgIlZlcmlm
eSBBZG1pbmlzdHJhdG9yIEFuZCBObyBBY2Nlc3MgUHJpdmlsZWdlIEZvciBEaWZmZXJlbnQgQ2hh
bm5lbHMiDQphbmQgIlZlcmlmeSBPcGVyYXRvciBBbmQgVXNlciBQcml2aWxlZ2UgRm9yIERpZmZl
cmVudCBDaGFubmVscyIgaW4gdGVzdF9pcG1pX3VzZXIucm9ib3QuDQpGb3IgZXhhbXBsZTogY2Fz
ZSAiVmVyaWZ5IEFkbWluaXN0cmF0b3IgQW5kIE5vIEFjY2VzcyBQcml2aWxlZ2UgRm9yIERpZmZl
cmVudCBDaGFubmVscyIgYXQgdGhlIGxhc3QgdHdvICJWZXJpZnkiIHN0ZXBzOg0KJycnDQojIFZl
cmlmeSB0aGF0IHVzZXIgaXMgYWJsZSB0byBydW4gYWRtaW5pc3RyYXRvciBsZXZlbCBJUE1JIGNv
bW1hbmQgd2l0aCBjaGFubmVsIDEuDQpWZXJpZnkgSVBNSSBDb21tYW5kICAke3JhbmRvbV91c2Vy
bmFtZX0gICR7dmFsaWRfcGFzc3dvcmR9ICBBZG1pbmlzdHJhdG9yICAxDQoNCiMgVmVyaWZ5IHRo
YXQgdXNlciBpcyB1bmFibGUgdG8gcnVuIElQTUkgY29tbWFuZCB3aXRoIGNoYW5uZWwgMi4NClJ1
biBJUE1JIFN0YW5kYXJkIENvbW1hbmQgIHNlbCBpbmZvIDIgIGV4cGVjdGVkX3JjPSR7MX0gIFU9
JHtyYW5kb21fdXNlcm5hbWV9ICBQPSR7dmFsaWRfcGFzc3dvcmR9DQonJycNCg0KSW4gdGhpcyBj
YXNlLCBmaXJzdCwgdGhlcmUgaXMgb25seSBvbmUgSVAgYWRkcmVzcy4NCnNlY29uZCwgSSBjYW4n
dCBmaW5kIGEgZGVzY3JpcHRpb24gb3IgU1BFQyBhYm91dCBjb21tYW5kIGxpa2UgDQoiaXBtaXRv
b2wgLUkgbGFucGx1cyAtQyAzIC1wIDYyMyAtVSBZbVJCd0RVUyAtUCAwcGVuQm1jMSAtSCB4Lngu
eC54IC1MIEFkbWluaXN0cmF0b3Igc2VsIGluZm8gMSINCndoaWNoIG1lYW4gdXNlciBpcyBhYmxl
IHRvIHJ1biBJUE1JIGNvbW1hbmQgd2l0aCBjaGFubmVsIDEuDQoNCklmIHRoZSBtZXRob2QgZm9y
IG91dC1vZi1iYW5kIGNvbW11bmljYXRpb24gdXNpbmcgZGlmZmVyZW50IGNoYW5uZWxzIGlzIHRo
ZSBzYW1lIGFzIHlvdSBkZXNjcmliZWQsDQpkbyB3ZSBuZWVkIHRvIGZpeCB0aGVzZSB0d28gY2Fz
ZXM/DQoNCj4gUmVnYXJkcywNCj4gDQo+IFJpY2hhcmQNCj4gDQo=
