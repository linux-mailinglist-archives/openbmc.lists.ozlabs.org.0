Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD4A114E
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 08:01:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JsRg45rZzDqMB
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 16:01:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=137e156a3=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 46JsQt3lk1zDqHk
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 16:00:17 +1000 (AEST)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 29 Aug 2019 14:00:13 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 29 Aug
 2019 14:00:12 +0800
Received: from mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81]) by
 mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81%6]) with mapi id
 15.01.1713.004; Thu, 29 Aug 2019 14:00:12 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: Patrick Venture <venture@google.com>, James Feist
 <james.feist@linux.intel.com>
Subject: RE: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHVV/XbtwEoqXVk+kGbiKtv2uj0UqcFJGgAgAE9VwCAC0qVsA==
Date: Thu, 29 Aug 2019 06:00:12 +0000
Message-ID: <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
In-Reply-To: <369926533c3e448c9d1a0d28391fd688@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: text/plain; charset="big5"
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

SGkgUGF0cmljaywNCg0KSSB0aGluayBpdCdzIE9LIHRvIHBhcnNlIHRoZSBjb25maWcgbWluJm1h
eCBmb3IgdGVtcCBzZW5zb3JzLg0KDQpBbnkgc3VnZ2VzdGlvbj8NCg0KVGhhbmtzLA0KSGFuaw0K
DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBvcGVuYm1jIFttYWlsdG86b3Bl
bmJtYy0NCj5ib3VuY2VzK2hhbmsubGlvdT1xdWFudGF0dy5jb21AbGlzdHMub3psYWJzLm9yZ10g
T24gQmVoYWxmIE9mIEhhbmsgTGlvdQ0KPii8Qq7Kv6spDQo+U2VudDogRnJpZGF5LCBBdWd1c3Qg
MjMsIDIwMTkgNDozMSBQTQ0KPlRvOiBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNv
bT47IEphbWVzIEZlaXN0DQo+PGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4NCj5DYzogb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnDQo+U3ViamVjdDogUkU6IFtwaG9zcGhvci1waWQtY29udHJv
bF0gc2NhbGluZyBpc3N1ZQ0KPg0KPkhpIFBhdHJpY2ssDQo+DQo+Pi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+PkZyb206IFBhdHJpY2sgVmVudHVyZSBbbWFpbHRvOnZlbnR1cmVAZ29vZ2xl
LmNvbV0NCj4+U2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjEsIDIwMTkgMTA6MzIgUE0NCj4+VG86
IEhhbmsgTGlvdSAovEKuyr+rKSA8SGFuay5MaW91QHF1YW50YXR3LmNvbT47IEphbWVzIEZlaXN0
DQo+PjxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQo+PkNjOiBvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmcNCj4+U3ViamVjdDogUmU6IFtwaG9zcGhvci1waWQtY29udHJvbF0gc2NhbGluZyBp
c3N1ZQ0KPj4NCj4+T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMToxMSBBTSBIYW5rIExpb3UgKLxC
rsq/qykNCj4+PEhhbmsuTGlvdUBxdWFudGF0dy5jb20+IHdyb3RlOg0KPj4+DQo+Pj4gSGkgQWxs
LA0KPj4+DQo+Pj4NCj4+PiBBZnRlciBjb21taXQgWzFdLCBJIGZvdW5kIG15IHRlbXAgc2Vuc29y
IHJlYWRpbmcgd291bGQgYmUgcmUtc2NhbGVkDQo+Pj4gYnkNCj4+bXVsdGlwbHlpbmcgMSBvdmVy
IDI1NSwgbWFraW5nIHRlbXBlcmF0dXJlIGludG8gdW5mYW1pbGlhciB1bml0LiBBbHNvDQo+PnRo
ZSBmYW4gcnBtIHJlYWRpbmcgd291bGQgbGllIGluIFswLDFdIGludGVydmFsLCBsZXR0aW5nIHRo
ZSBmYW4gaW5wdXQNCj4+dG8gYmUgMCAoc2luY2UgdGhlIGlucHV0IHZhbHVlIG9mIGZhbiBpcyBm
cm9tIGFuIGludGVnZXIgYXJyYXkgWzJdKS4gQXJlIHRoZXNlDQo+bm9ybWFsIGJlaGF2aW9ycz8N
Cj4+T3IgZG8gSSBtaXNzIHNvbWV0aGluZz8NCj4+DQo+PkFyZSB5b3UgdXNpbmcgZGJ1cyBjb25m
aWd1cmF0aW9uIG9yIGpzb24/ICBJZiBqc29uLCBjYW4geW91IGF0dGFjaCB5b3VyIGNvbmZpZy4N
Cj4+U2luY2UgeW91J3JlIHNheWluZyBpdCB3YXMgd29ya2luZyBhbmQgbm93IGlzbid0LCBJJ20g
YXNzdW1pbmcgdGhlcmUncw0KPj5zb21ldGhpbmcgYWJvdXQgdGhlIGNvbmZpZyBiZWluZyB0cmVh
dGVkIGRpZmZlcmVudGx5IHdpdGggdGhlIGNvZGUNCj4+Y2hhbmdlcyBpbiBhbiB1bmV4cGVjdGVk
IHdheS4NCj4NCj5JIGZvdW5kIHBpZCBjb250cm9sIHdpbGwgZmlyc3QgcmVhZCBtaW4gYW5kIG1h
eCBmcm9tIGRidXMgYW5kIHRoZW4gKGJlZm9yZQ0KPmNvbW1pdCBbMV0pIHJldmlzZSB0aGVtIGlm
DQo+DQo+aW5mby0+bWluICE9IGNvbmY6OmluaGVyaXRWYWx1ZUZyb21EYnVzIChpbiBkYnVzL2Ri
dXNwYXNzaXZlLmNwcCkNCj4NCj5BZnRlciB2YWx1ZSBpbml0aWFsaXphdGlvbiwgdGhlIG1pbiBh
bmQgbWF4IHdvdWxkIGJlIHRoZSBvbmVzIGluIGpzb24gZmlsZSAoSnNvbg0KPmZpbGUgWzNdKS4g
SG93ZXZlciwgYWZ0ZXIgY29tbWl0IFsxXSB0aGUgbWluIGFuZCBtYXggdmFsdWVzIG9mIGNvbmZp
ZyB3b3VsZA0KPm5vdCBiZSBmZWQgaW50byB0aGUgZmFuIGNvbnRyb2wgcHJvY2Vzcy4gVGhlIHNj
YWxpbmcgaXNzdWUgaXMgb3JpZ2luYXRlZCBmcm9tDQo+Y29tbWl0IFs0XSB3aXRoIHRoZSBhaW0g
dG8gdHJlYXQgZmFuIHJwbSBhcyBwZXJjZW50YWdlLiBJdCBzZWVtcyB0aGF0IGNvbW1pdA0KPlsx
XSB1bmV4cGVjdGVkbHkgYWZmZWN0cyB0ZW1wIHNlbnNvcnMgaW4gdGhlIHNlbnNlIHRoYXQgdGhl
IHRlbXAgaXMgdGhlDQo+aW50ZWdlciByZWFkaW5nIG5vdCBwZXJjZW50YWdlLiBCZWZvcmUgY29t
bWl0IFsxXSwgaXQgd291bGQgbm90IHJlLXNjYWxlIHRoZQ0KPnRlbXAgcmVhZGluZyBzaW5jZSBt
eSBtaW4gYW5kIG1heCBhcmUgMCBbNl0uDQo+DQo+DQo+DQo+VGhlcmUgaXMgYW5vdGhlciBpc3N1
ZSB3aXRoIGNvbW1pdCBbMV0uIE5vdyB0aGUgZmFuIHJwbSB3b3VsZCBiZSBzb21ldGhpbmcNCj5s
aWtlDQo+DQo+MTUwMCAvIDIwMDAwID0gMC4wNzUNCj4NCj53aGVyZSBycG0gbWF4IDIwMDAwIGlz
IGZyb20gZGJ1cy4gSG93ZXZlciB0aGUgZmFuIGlucHV0IGZ1bmN0aW9uIHdvdWxkDQo+dHJhbnNm
ZXIgZG91YmxlIGludG8gaW50LCB3aGljaCBpcyAwIGZvciAwLjA3NSAoc2VlIFs1XSkuIEhlbmNl
IHRoZSBmYW4gaW5wdXQgaXMgMA0KPm5vdCBwZXJjZW50YWdlLiBJcyB0aGVyZSBzb21ldGhpbmcg
d3Jvbmc/DQo+DQo+WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0N
Cj5jb250cm9sL2NvbW1pdC9mYzJlODAzZjVkOTI1Njk0NGUxOGM3Yzg3OGE0NDE2MDZiMWYxMjFj
DQo+WzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj5jb250cm9s
L2Jsb2IvYTdlYzgzNTBkMTdiNzAxNTNjZWJlNjY2ZDNmYmU4OGJkZGQwMmExYS9waWQvZmFuY29u
dHJvbGxlDQo+ci5jcHAjTDg2DQo+WzNdDQo+ICAgICAgIHsNCj4gICAgICAgICAgICAibmFtZSI6
ICJmYW4xIiwNCj4gICAgICAgICAgICAidHlwZSI6ICJmYW4iLA0KPiAgICAgICAgICAgICJyZWFk
UGF0aCI6ICIvc3lzL2NsYXNzL2h3bW9uL2h3bW9uMS9mYW4xX2lucHV0IiwNCj4gICAgICAgICAg
ICAid3JpdGVQYXRoIjogIi9zeXMvY2xhc3MvaHdtb24vaHdtb24xL3B3bTEiLA0KPiAgICAgICAg
ICAgICJtaW4iOiAwLA0KPiAgICAgICAgICAgICJtYXgiOiAyNTUNCj4gICAgICAgIH0sDQo+ICAg
ICAgICB7DQo+ICAgICAgICAgICAgIm5hbWUiOiAidGVtcDEiLA0KPiAgICAgICAgICAgICJ0eXBl
IjogInRlbXAiLA0KPiAgICAgICAgICAgICJyZWFkUGF0aCI6ICIveHl6L29wZW5ibWNfcHJvamVj
dC9zZW5zb3JzL3RlbXBlcmF0dXJlL3RlbXAxIiwNCj4gICAgICAgICAgICAid3JpdGVQYXRoIjog
IiIsDQo+ICAgICAgICAgICAgIm1pbiI6IDAsDQo+ICAgICAgICAgICAgIm1heCI6IDANCj4gICAg
ICAgIH0NCj5bNF0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLQ0KPmNv
bnRyb2wvY29tbWl0Lzc1ZWI3NjlkMzUxNDM0NTQ3ODk5MTg2ZjczZmY3MGFlMDBkNzkzNGENCj5b
NV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLQ0KPmNvbnRyb2wvYmxv
Yi9hN2VjODM1MGQxN2I3MDE1M2NlYmU2NjZkM2ZiZTg4YmRkZDAyYTFhL3BpZC9mYW5jb250cm9s
bGUNCj5yLmNwcCNMNjQNCj5bNl0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3It
cGlkLQ0KPmNvbnRyb2wvYmxvYi9hN2VjODM1MGQxN2I3MDE1M2NlYmU2NjZkM2ZiZTg4YmRkZDAy
YTFhL2RidXMvZGJ1c3Bhc3NpDQo+dmUuY3BwI0wxNTgNCj4NCj4+DQo+Pj4NCj4+Pg0KPj4+IFsx
XQ0KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj4+Y29udHJv
bC9jb21taXQvZmMyZTgwM2Y1ZDkyNTY5DQo+Pj4gNDRlMThjN2M4NzhhNDQxNjA2YjFmMTIxYw0K
Pj4+DQo+Pj4gWzJdDQo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlk
LQ0KPj5jb250cm9sL2Jsb2IvYTdlYzgzNTBkMTdiNzAxNTMNCj4+PiBjZWJlNjY2ZDNmYmU4OGJk
ZGQwMmExYS9waWQvZmFuY29udHJvbGxlci5jcHAjTDg2DQo+Pj4NCj4+Pg0KPj4+IFRoYW5rcywN
Cj4+Pg0KPj4+DQo+Pj4gSGFuayBMaW91DQo+Pj4NCj4+PiBRdWFudGEgQ29tcHV0ZXIgSW5jLg0K
Pj4+DQo+Pj4NCj4NCj5TaW5jZXJlbHksDQo+SGFuaw0K
