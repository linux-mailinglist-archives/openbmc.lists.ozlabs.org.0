Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BAA9BBD
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 09:26:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PC1W2MlrzDr2l
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 17:26:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=144bab7d6=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46PBzl0rQSzDr1Q
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 17:25:18 +1000 (AEST)
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 05 Sep 2019 15:25:15 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Sep 2019
 15:25:15 +0800
Received: from mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81]) by
 mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81%6]) with mapi id
 15.01.1713.004; Thu, 5 Sep 2019 15:25:15 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHVV/XbtwEoqXVk+kGbiKtv2uj0UqcFJGgAgAE9VwCAC0qVsIAAQT+AgAYx+NeABJmE/A==
Date: Thu, 5 Sep 2019 07:25:15 +0000
Message-ID: <dbd75be40e2f4d41a5b621a5dc3b3df7@quantatw.com>
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>,
 <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>,
 <02128993d3064b53ac289500746666ab@quantatw.com>
In-Reply-To: <02128993d3064b53ac289500746666ab@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_dbd75be40e2f4d41a5b621a5dc3b3df7quantatwcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_dbd75be40e2f4d41a5b621a5dc3b3df7quantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgUGF0cmljaywNCg0KDQpTb3JyeSBmb3Igbm90IGNsZWFybHkgc3RhdGluZyBvdXIgcHJvYmxl
bS4gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIGlzc3VlOg0KDQoNCnRlbXAgc2Vuc29yIGdldHMgMzEo
QykgLT4gMzEgLyAwLjI1NSA9IDEyMS41NyAtPiBwaWQgdXNlcyAxMjcuNTcgYXMgaW5wdXQgZm9y
IHRlbXAgc2Vuc29yIC0+DQoNCnN0ZXB3aXNlIGZhbiB0YWJsZSBvdXRwdXQgMTAwIGR1dHkgLT4g
ZnVsbCBzcGVlZCBmYW4NCg0KDQpBcyBhIHJlc3VsdCwgZmFuIHdpbGwgYmUgYXQgZnVsbCBzcGVl
ZCB3aGlsZSB0ZW1wIGlzIGxvdy4gQmVmb3JlIHRoZSBjb21taXQgZmMyZTgwMyBbMV0sIHRoaXMg
d29uJ3QgaGFwcGVuLiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0LCBiZWZvcmUgZmMyZTgwMywgcGlk
IHdpbGwgdXNlIGNvbmZpZyBtaW4vbWF4LCB3aGljaCBpcyAwIGluIG91ciBjYXNlLiBUaGlzIHdv
dWxkIG5vdCB0cmlnZ2VyIHNjYWxpbmcgZnVuY3Rpb24sIG5hbWVseSBzY2FsZVNlbnNvclJlYWRp
bmcsIGluIHV0aWwuY3BwLiBIb3dldmVyLCBhZnRlciBzdWNoIGNvbW1pdCwgbWluL21heCB3b3Vs
ZCBiZSBub24temVybyAoLTEyOC8xMjcgZnJvbSBEQnVzKS4gVGhpcyB3aWxsIHRyaWdnZXIgc2Nh
bGluZyBmdW5jdGlvbi4NCg0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bo
b3ItcGlkLWNvbnRyb2wvY29tbWl0L2ZjMmU4MDNmNWQ5MjU2OTQ0ZTE4YzdjODc4YTQ0MTYwNmIx
ZjEyMWMNCg0KDQpIYW5rDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9t
OiBIYW5rIExpb3UgKLxCrsq/qykNClNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDIsIDIwMTkgNDo1
MiBQTQ0KVG86IFBhdHJpY2sgVmVudHVyZQ0KQ2M6IEphbWVzIEZlaXN0OyBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBbcGhvc3Bob3ItcGlkLWNvbnRyb2xdIHNjYWxpbmcg
aXNzdWUNCg0KDQpIaSBQYXRyaWNrLA0KDQoNClNpbmNlIHdlIHVzZSBwaG9zcGhvci1zZWwtbG9n
Z2VyIFsxXSBhdCB0aGUgc2FtZSB0aW1lLCB3ZSBkbyBhc3NpZ24gbWluIGFuZCBtYXggb2YgdGVt
cCBzZW5zb3JzIHRvIERidXMgKG1heDogMTI3LCBtaW46IC0xMjgpLiBTbyBpbiB0aGUgcHJlc2Vu
dCBjYXNlLCBvdXIgdGVtcCB2YWx1ZSB3aWxsIGJlIGRpdmlkZWQgYnkgMC4yNTUgKGFsc28gZHVl
IHRvIGV4cG9uZW50IGlzIC0zIGhlcmUpLiBUaGlzIHdpbGwgY2F1c2UgcmUtc2NhbGluZyBwcm9i
bGVtLiBUaGVyZWZvcmUgdGhlcmUgc2hvdWxkIGJlIGFuIHN0YXRlbWVudCB0byBkaXN0aW5ndWlz
aCBzZW5zb3IgdHlwZXMuIElmIGl0IGlzICJ0ZW1wIiwgdGhlbiBvbmUgYXNzaWducyAwIHRvIHRo
ZSBtaW4gYW5kIG1heCBmcm9tIERidXMuDQoNCg0KWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
Ym1jL3Bob3NwaG9yLXNlbC1sb2dnZXIvYmxvYi8zZDMwMGZjYTI0YjMwODY0YjNlOWE0ZjU3Njhj
ZmU1ZTc2OTQ1OGFlL2luY2x1ZGUvc2Vuc29ydXRpbHMuaHBwI0w1OTxodHRwczovL2c+DQoNCg0K
SGFuaw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBQYXRyaWNr
IFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT4NClNlbnQ6IEZyaWRheSwgQXVndXN0IDMwLCAy
MDE5IDE6NDcgQU0NClRvOiBIYW5rIExpb3UgKLxCrsq/qykNCkNjOiBKYW1lcyBGZWlzdDsgb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogW3Bob3NwaG9yLXBpZC1jb250cm9s
XSBzY2FsaW5nIGlzc3VlDQoNClBUQUwgLSBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3Qu
eHl6LzI0ODI3IC0gdGhpcyBpcyBtZXJnZWQsIGFuZA0KdGhlIHNyY3JldiBidW1wIHNob3VsZCBw
cm9wYWdhdGUgaW50byBvcGVuYm1jL29wZW5ibWMgaW4gYSBkYXkgb3IgdHdvLg0KDQpPbiBXZWQs
IEF1ZyAyOCwgMjAxOSBhdCAxMTowMCBQTSBIYW5rIExpb3UgKLxCrsq/qykgPEhhbmsuTGlvdUBx
dWFudGF0dy5jb20+IHdyb3RlOg0KPg0KPiBIaSBQYXRyaWNrLA0KPg0KPiBJIHRoaW5rIGl0J3Mg
T0sgdG8gcGFyc2UgdGhlIGNvbmZpZyBtaW4mbWF4IGZvciB0ZW1wIHNlbnNvcnMuDQo+DQo+IEFu
eSBzdWdnZXN0aW9uPw0KPg0KPiBUaGFua3MsDQo+IEhhbmsNCj4NCj4gPi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID5Gcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy0NCj4gPmJvdW5j
ZXMraGFuay5saW91PXF1YW50YXR3LmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2Yg
SGFuayBMaW91DQo+ID4ovEKuyr+rKQ0KPiA+U2VudDogRnJpZGF5LCBBdWd1c3QgMjMsIDIwMTkg
NDozMSBQTQ0KPiA+VG86IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPjsgSmFt
ZXMgRmVpc3QNCj4gPjxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQo+ID5DYzogb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnDQo+ID5TdWJqZWN0OiBSRTogW3Bob3NwaG9yLXBpZC1jb250cm9s
XSBzY2FsaW5nIGlzc3VlDQo+ID4NCj4gPkhpIFBhdHJpY2ssDQo+ID4NCj4gPj4tLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PkZyb206IFBhdHJpY2sgVmVudHVyZSBbbWFpbHRvOnZlbnR1
cmVAZ29vZ2xlLmNvbV0NCj4gPj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyMSwgMjAxOSAxMDoz
MiBQTQ0KPiA+PlRvOiBIYW5rIExpb3UgKLxCrsq/qykgPEhhbmsuTGlvdUBxdWFudGF0dy5jb20+
OyBKYW1lcyBGZWlzdA0KPiA+PjxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4+Q2M6
IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiA+PlN1YmplY3Q6IFJlOiBbcGhvc3Bob3ItcGlk
LWNvbnRyb2xdIHNjYWxpbmcgaXNzdWUNCj4gPj4NCj4gPj5PbiBXZWQsIEF1ZyAyMSwgMjAxOSBh
dCAxOjExIEFNIEhhbmsgTGlvdSAovEKuyr+rKQ0KPiA+PjxIYW5rLkxpb3VAcXVhbnRhdHcuY29t
PiB3cm90ZToNCj4gPj4+DQo+ID4+PiBIaSBBbGwsDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IEFmdGVy
IGNvbW1pdCBbMV0sIEkgZm91bmQgbXkgdGVtcCBzZW5zb3IgcmVhZGluZyB3b3VsZCBiZSByZS1z
Y2FsZWQNCj4gPj4+IGJ5DQo+ID4+bXVsdGlwbHlpbmcgMSBvdmVyIDI1NSwgbWFraW5nIHRlbXBl
cmF0dXJlIGludG8gdW5mYW1pbGlhciB1bml0LiBBbHNvDQo+ID4+dGhlIGZhbiBycG0gcmVhZGlu
ZyB3b3VsZCBsaWUgaW4gWzAsMV0gaW50ZXJ2YWwsIGxldHRpbmcgdGhlIGZhbiBpbnB1dA0KPiA+
PnRvIGJlIDAgKHNpbmNlIHRoZSBpbnB1dCB2YWx1ZSBvZiBmYW4gaXMgZnJvbSBhbiBpbnRlZ2Vy
IGFycmF5IFsyXSkuIEFyZSB0aGVzZQ0KPiA+bm9ybWFsIGJlaGF2aW9ycz8NCj4gPj5PciBkbyBJ
IG1pc3Mgc29tZXRoaW5nPw0KPiA+Pg0KPiA+PkFyZSB5b3UgdXNpbmcgZGJ1cyBjb25maWd1cmF0
aW9uIG9yIGpzb24/ICBJZiBqc29uLCBjYW4geW91IGF0dGFjaCB5b3VyIGNvbmZpZy4NCj4gPj5T
aW5jZSB5b3UncmUgc2F5aW5nIGl0IHdhcyB3b3JraW5nIGFuZCBub3cgaXNuJ3QsIEknbSBhc3N1
bWluZyB0aGVyZSdzDQo+ID4+c29tZXRoaW5nIGFib3V0IHRoZSBjb25maWcgYmVpbmcgdHJlYXRl
ZCBkaWZmZXJlbnRseSB3aXRoIHRoZSBjb2RlDQo+ID4+Y2hhbmdlcyBpbiBhbiB1bmV4cGVjdGVk
IHdheS4NCj4gPg0KPiA+SSBmb3VuZCBwaWQgY29udHJvbCB3aWxsIGZpcnN0IHJlYWQgbWluIGFu
ZCBtYXggZnJvbSBkYnVzIGFuZCB0aGVuIChiZWZvcmUNCj4gPmNvbW1pdCBbMV0pIHJldmlzZSB0
aGVtIGlmDQo+ID4NCj4gPmluZm8tPm1pbiAhPSBjb25mOjppbmhlcml0VmFsdWVGcm9tRGJ1cyAo
aW4gZGJ1cy9kYnVzcGFzc2l2ZS5jcHApDQo+ID4NCj4gPkFmdGVyIHZhbHVlIGluaXRpYWxpemF0
aW9uLCB0aGUgbWluIGFuZCBtYXggd291bGQgYmUgdGhlIG9uZXMgaW4ganNvbiBmaWxlIChKc29u
DQo+ID5maWxlIFszXSkuIEhvd2V2ZXIsIGFmdGVyIGNvbW1pdCBbMV0gdGhlIG1pbiBhbmQgbWF4
IHZhbHVlcyBvZiBjb25maWcgd291bGQNCj4gPm5vdCBiZSBmZWQgaW50byB0aGUgZmFuIGNvbnRy
b2wgcHJvY2Vzcy4gVGhlIHNjYWxpbmcgaXNzdWUgaXMgb3JpZ2luYXRlZCBmcm9tDQo+ID5jb21t
aXQgWzRdIHdpdGggdGhlIGFpbSB0byB0cmVhdCBmYW4gcnBtIGFzIHBlcmNlbnRhZ2UuIEl0IHNl
ZW1zIHRoYXQgY29tbWl0DQo+ID5bMV0gdW5leHBlY3RlZGx5IGFmZmVjdHMgdGVtcCBzZW5zb3Jz
IGluIHRoZSBzZW5zZSB0aGF0IHRoZSB0ZW1wIGlzIHRoZQ0KPiA+aW50ZWdlciByZWFkaW5nIG5v
dCBwZXJjZW50YWdlLiBCZWZvcmUgY29tbWl0IFsxXSwgaXQgd291bGQgbm90IHJlLXNjYWxlIHRo
ZQ0KPiA+dGVtcCByZWFkaW5nIHNpbmNlIG15IG1pbiBhbmQgbWF4IGFyZSAwIFs2XS4NCj4gPg0K
PiA+DQo+ID4NCj4gPlRoZXJlIGlzIGFub3RoZXIgaXNzdWUgd2l0aCBjb21taXQgWzFdLiBOb3cg
dGhlIGZhbiBycG0gd291bGQgYmUgc29tZXRoaW5nDQo+ID5saWtlDQo+ID4NCj4gPjE1MDAgLyAy
MDAwMCA9IDAuMDc1DQo+ID4NCj4gPndoZXJlIHJwbSBtYXggMjAwMDAgaXMgZnJvbSBkYnVzLiBI
b3dldmVyIHRoZSBmYW4gaW5wdXQgZnVuY3Rpb24gd291bGQNCj4gPnRyYW5zZmVyIGRvdWJsZSBp
bnRvIGludCwgd2hpY2ggaXMgMCBmb3IgMC4wNzUgKHNlZSBbNV0pLiBIZW5jZSB0aGUgZmFuIGlu
cHV0IGlzIDANCj4gPm5vdCBwZXJjZW50YWdlLiBJcyB0aGVyZSBzb21ldGhpbmcgd3Jvbmc/DQo+
ID4NCj4gPlsxXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1waWQtDQo+ID5j
b250cm9sL2NvbW1pdC9mYzJlODAzZjVkOTI1Njk0NGUxOGM3Yzg3OGE0NDE2MDZiMWYxMjFjDQo+
ID5bMl0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLQ0KPiA+Y29udHJv
bC9ibG9iL2E3ZWM4MzUwZDE3YjcwMTUzY2ViZTY2NmQzZmJlODhiZGRkMDJhMWEvcGlkL2ZhbmNv
bnRyb2xsZQ0KPiA+ci5jcHAjTDg2DQo+ID5bM10NCj4gPiAgICAgICB7DQo+ID4gICAgICAgICAg
ICAibmFtZSI6ICJmYW4xIiwNCj4gPiAgICAgICAgICAgICJ0eXBlIjogImZhbiIsDQo+ID4gICAg
ICAgICAgICAicmVhZFBhdGgiOiAiL3N5cy9jbGFzcy9od21vbi9od21vbjEvZmFuMV9pbnB1dCIs
DQo+ID4gICAgICAgICAgICAid3JpdGVQYXRoIjogIi9zeXMvY2xhc3MvaHdtb24vaHdtb24xL3B3
bTEiLA0KPiA+ICAgICAgICAgICAgIm1pbiI6IDAsDQo+ID4gICAgICAgICAgICAibWF4IjogMjU1
DQo+ID4gICAgICAgIH0sDQo+ID4gICAgICAgIHsNCj4gPiAgICAgICAgICAgICJuYW1lIjogInRl
bXAxIiwNCj4gPiAgICAgICAgICAgICJ0eXBlIjogInRlbXAiLA0KPiA+ICAgICAgICAgICAgInJl
YWRQYXRoIjogIi94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvdGVtcDEi
LA0KPiA+ICAgICAgICAgICAgIndyaXRlUGF0aCI6ICIiLA0KPiA+ICAgICAgICAgICAgIm1pbiI6
IDAsDQo+ID4gICAgICAgICAgICAibWF4IjogMA0KPiA+ICAgICAgICB9DQo+ID5bNF0gaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLQ0KPiA+Y29udHJvbC9jb21taXQvNzVl
Yjc2OWQzNTE0MzQ1NDc4OTkxODZmNzNmZjcwYWUwMGQ3OTM0YQ0KPiA+WzVdIGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj4gPmNvbnRyb2wvYmxvYi9hN2VjODM1MGQx
N2I3MDE1M2NlYmU2NjZkM2ZiZTg4YmRkZDAyYTFhL3BpZC9mYW5jb250cm9sbGUNCj4gPnIuY3Bw
I0w2NA0KPiA+WzZdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj4g
PmNvbnRyb2wvYmxvYi9hN2VjODM1MGQxN2I3MDE1M2NlYmU2NjZkM2ZiZTg4YmRkZDAyYTFhL2Ri
dXMvZGJ1c3Bhc3NpDQo+ID52ZS5jcHAjTDE1OA0KPiA+DQo+ID4+DQo+ID4+Pg0KPiA+Pj4NCj4g
Pj4+IFsxXQ0KPiA+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLQ0K
PiA+PmNvbnRyb2wvY29tbWl0L2ZjMmU4MDNmNWQ5MjU2OQ0KPiA+Pj4gNDRlMThjN2M4NzhhNDQx
NjA2YjFmMTIxYw0KPiA+Pj4NCj4gPj4+IFsyXQ0KPiA+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3ItcGlkLQ0KPiA+PmNvbnRyb2wvYmxvYi9hN2VjODM1MGQxN2I3MDE1Mw0K
PiA+Pj4gY2ViZTY2NmQzZmJlODhiZGRkMDJhMWEvcGlkL2ZhbmNvbnRyb2xsZXIuY3BwI0w4Ng0K
PiA+Pj4NCj4gPj4+DQo+ID4+PiBUaGFua3MsDQo+ID4+Pg0KPiA+Pj4NCj4gPj4+IEhhbmsgTGlv
dQ0KPiA+Pj4NCj4gPj4+IFF1YW50YSBDb21wdXRlciBJbmMuDQo+ID4+Pg0KPiA+Pj4NCj4gPg0K
PiA+U2luY2VyZWx5LA0KPiA+SGFuaw0K

--_000_dbd75be40e2f4d41a5b621a5dc3b3df7quantatwcom_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p>Hi Patrick,</p>
<p><br>
</p>
<p>Sorry for not clearly&nbsp;stating our problem.&nbsp;<span style=3D"font=
-size: 12pt;">We have the following issue:</span></p>
<p><br>
</p>
<p>temp sensor gets&nbsp;31(C) -&gt; 31 / 0.255 =3D 121.57 -&gt; pid uses 1=
27.57 as input for&nbsp;temp sensor -&gt;</p>
<p>stepwise fan table output 100 duty -&gt; full speed fan</p>
<p><br>
</p>
<p>As a result, fan will be at full speed while temp is low. Before the com=
mit <span>
fc2e803 [1], this won't happen. The root cause is that, before&nbsp;fc2e803=
, pid will use config min/max, which is 0 in our case. This would not trigg=
er scaling function, namely&nbsp;<span>scaleSensorReading,</span> in util.c=
pp. However, after such commit, min/max would
 be non-zero (-128/127 from DBus). This will trigger scaling function.</spa=
n></p>
<p><br>
</p>
<p>[1]&nbsp;<a href=3D"https://github.com/openbmc/phosphor-pid-control/comm=
it/fc2e803f5d9256944e18c7c878a441606b1f121c" class=3D"OWAAutoLink" id=3D"LP=
lnk609236" previewremoved=3D"true">https://github.com/openbmc/phosphor-pid-=
control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c</a></p>
<p><br>
</p>
<p>Hank</p>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Hank Liou (=BCB=AE=CA=
=BF=AB)<br>
<b>Sent:</b> Monday, September 2, 2019 4:52 PM<br>
<b>To:</b> Patrick Venture<br>
<b>Cc:</b> James Feist; openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: [phosphor-pid-control] scaling issue</font>
<div>&nbsp;</div>
</div>
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p>Hi Patrick,</p>
<p><br>
</p>
<p>Since we use phosphor-sel-logger [1]&nbsp;at the same time, we do assign=
 min and&nbsp;max of temp sensors to Dbus&nbsp;(max: 127, min: -128). So i<=
span style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe U=
I Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:16px">n
 the present case, our temp value will be divided by 0.255 (also due to&nbs=
p;</span><span style=3D"font-family:Calibri,Helvetica,sans-serif,EmojiFont,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&qu=
ot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; font-size:=
16px">exponent
 is -3 here</span><span style=3D"font-family:Calibri,Helvetica,sans-serif,E=
mojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColor=
Emoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols; f=
ont-size:16px">).&nbsp;</span>This will cause re-scaling problem.&nbsp;<spa=
n style=3D"font-size:12pt">Therefore
</span><span style=3D"font-size:12pt">there should be an </span><span style=
=3D"font-size:12pt">statement to distinguish sensor types. If it is &quot;t=
emp&quot;, then one&nbsp;assigns 0 to the min and max from Dbus.</span></p>
<p><br>
</p>
<p>[1]&nbsp;<a href=3D"https://github.com/openbmc/phosphor-sel-logger/blob/=
3d300fca24b30864b3e9a4f5768cfe5e769458ae/include/sensorutils.hpp#L59" class=
=3D"OWAAutoLink" id=3D"LPlnk606462" previewremoved=3D"true">https://github.=
com/openbmc/phosphor-sel-logger/blob/3d300fca24b30864b3e9a4f5768cfe5e769458=
ae/include/sensorutils.hpp#L59</a><a href=3D"https://g" class=3D"OWAAutoLin=
k" id=3D"LPlnk929597" previewremoved=3D"true"></a></p>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<br>
</div>
<p>Hank</p>
<p><br>
</p>
<div style=3D"color:rgb(0,0,0)">
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Patrick Venture &lt=
;venture@google.com&gt;<br>
<b>Sent:</b> Friday, August 30, 2019 1:47 AM<br>
<b>To:</b> Hank Liou (=BCB=AE=CA=BF=AB)<br>
<b>Cc:</b> James Feist; openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Re: [phosphor-pid-control] scaling issue</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">PTAL - <a href=3D"https://gerrit.openbmc-project.x=
yz/24827" id=3D"LPlnk833890" previewremoved=3D"true">
https://gerrit.openbmc-project.xyz/24827</a> - this is merged, and<br>
the srcrev bump should propagate into openbmc/openbmc in a day or two.<br>
<br>
On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=BCB=AE=CA=BF=AB) &lt;Hank.Liou=
@quantatw.com&gt; wrote:<br>
&gt;<br>
&gt; Hi Patrick,<br>
&gt;<br>
&gt; I think it's OK to parse the config min&amp;max for temp sensors.<br>
&gt;<br>
&gt; Any suggestion?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Hank<br>
&gt;<br>
&gt; &gt;-----Original Message-----<br>
&gt; &gt;From: openbmc [<a href=3D""></a>mailto:openbmc-<br>
&gt; &gt;bounces&#43;hank.liou=3Dquantatw.com@lists.ozlabs.org] On Behalf O=
f Hank Liou<br>
&gt; &gt;(=BCB=AE=CA=BF=AB)<br>
&gt; &gt;Sent: Friday, August 23, 2019 4:31 PM<br>
&gt; &gt;To: Patrick Venture &lt;venture@google.com&gt;; James Feist<br>
&gt; &gt;&lt;james.feist@linux.intel.com&gt;<br>
&gt; &gt;Cc: openbmc@lists.ozlabs.org<br>
&gt; &gt;Subject: RE: [phosphor-pid-control] scaling issue<br>
&gt; &gt;<br>
&gt; &gt;Hi Patrick,<br>
&gt; &gt;<br>
&gt; &gt;&gt;-----Original Message-----<br>
&gt; &gt;&gt;From: Patrick Venture [<a href=3D"mailto:venture@google.com">m=
ailto:venture@google.com</a>]<br>
&gt; &gt;&gt;Sent: Wednesday, August 21, 2019 10:32 PM<br>
&gt; &gt;&gt;To: Hank Liou (=BCB=AE=CA=BF=AB) &lt;Hank.Liou@quantatw.com&gt=
;; James Feist<br>
&gt; &gt;&gt;&lt;james.feist@linux.intel.com&gt;<br>
&gt; &gt;&gt;Cc: openbmc@lists.ozlabs.org<br>
&gt; &gt;&gt;Subject: Re: [phosphor-pid-control] scaling issue<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=BCB=AE=CA=BF=AB)<b=
r>
&gt; &gt;&gt;&lt;Hank.Liou@quantatw.com&gt; wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Hi All,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; After commit [1], I found my temp sensor reading would be=
 re-scaled<br>
&gt; &gt;&gt;&gt; by<br>
&gt; &gt;&gt;multiplying 1 over 255, making temperature into unfamiliar uni=
t. Also<br>
&gt; &gt;&gt;the fan rpm reading would lie in [0,1] interval, letting the f=
an input<br>
&gt; &gt;&gt;to be 0 (since the input value of fan is from an integer array=
 [2]). Are these<br>
&gt; &gt;normal behaviors?<br>
&gt; &gt;&gt;Or do I miss something?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Are you using dbus configuration or json?&nbsp; If json, can y=
ou attach your config.<br>
&gt; &gt;&gt;Since you're saying it was working and now isn't, I'm assuming=
 there's<br>
&gt; &gt;&gt;something about the config being treated differently with the =
code<br>
&gt; &gt;&gt;changes in an unexpected way.<br>
&gt; &gt;<br>
&gt; &gt;I found pid control will first read min and max from dbus and then=
 (before<br>
&gt; &gt;commit [1]) revise them if<br>
&gt; &gt;<br>
&gt; &gt;info-&gt;min !=3D conf::inheritValueFromDbus (in dbus/dbuspassive.=
cpp)<br>
&gt; &gt;<br>
&gt; &gt;After value initialization, the min and max would be the ones in j=
son file (Json<br>
&gt; &gt;file [3]). However, after commit [1] the min and max values of con=
fig would<br>
&gt; &gt;not be fed into the fan control process. The scaling issue is orig=
inated from<br>
&gt; &gt;commit [4] with the aim to treat fan rpm as percentage. It seems t=
hat commit<br>
&gt; &gt;[1] unexpectedly affects temp sensors in the sense that the temp i=
s the<br>
&gt; &gt;integer reading not percentage. Before commit [1], it would not re=
-scale the<br>
&gt; &gt;temp reading since my min and max are 0 [6].<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;There is another issue with commit [1]. Now the fan rpm would be s=
omething<br>
&gt; &gt;like<br>
&gt; &gt;<br>
&gt; &gt;1500 / 20000 =3D 0.075<br>
&gt; &gt;<br>
&gt; &gt;where rpm max 20000 is from dbus. However the fan input function w=
ould<br>
&gt; &gt;transfer double into int, which is 0 for 0.075 (see [5]). Hence th=
e fan input is 0<br>
&gt; &gt;not percentage. Is there something wrong?<br>
&gt; &gt;<br>
&gt; &gt;[1] <a href=3D"https://github.com/openbmc/phosphor-pid-">https://g=
ithub.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c<br>
&gt; &gt;[2] <a href=3D"https://github.com/openbmc/phosphor-pid-">https://g=
ithub.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontr=
olle<br>
&gt; &gt;r.cpp#L86<br>
&gt; &gt;[3]<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;name&quot;: &quot;fan1&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;type&quot;: &quot;fan&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;readPath&quot;: &quot;/sys/class/hwmon/hwmon1/fan1_input&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;writePath&quot;: &quot;/sys/class/hwmon/hwmon1/pwm1&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;min&quot;: 0,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;max&quot;: 255<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;name&quot;: &quot;temp1&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;type&quot;: &quot;temp&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;readPath&quot;: &quot;/xyz/openbmc_project/sensors/temperature/temp1=
&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;writePath&quot;: &quot;&quot;,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;min&quot;: 0,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 &quot;max&quot;: 0<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;[4] <a href=3D"https://github.com/openbmc/phosphor-pid-">https://g=
ithub.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;control/commit/75eb769d351434547899186f73ff70ae00d7934a<br>
&gt; &gt;[5] <a href=3D"https://github.com/openbmc/phosphor-pid-">https://g=
ithub.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontr=
olle<br>
&gt; &gt;r.cpp#L64<br>
&gt; &gt;[6] <a href=3D"https://github.com/openbmc/phosphor-pid-">https://g=
ithub.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspas=
si<br>
&gt; &gt;ve.cpp#L158<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; [1]<br>
&gt; &gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-pid-">http=
s://github.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;&gt;control/commit/fc2e803f5d92569<br>
&gt; &gt;&gt;&gt; 44e18c7c878a441606b1f121c<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; [2]<br>
&gt; &gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-pid-">http=
s://github.com/openbmc/phosphor-pid-</a><br>
&gt; &gt;&gt;control/blob/a7ec8350d17b70153<br>
&gt; &gt;&gt;&gt; cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Thanks,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Hank Liou<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Quanta Computer Inc.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;Sincerely,<br>
&gt; &gt;Hank<br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_dbd75be40e2f4d41a5b621a5dc3b3df7quantatwcom_--
