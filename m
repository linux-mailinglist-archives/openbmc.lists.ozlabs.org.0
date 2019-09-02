Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A810AA5236
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:53:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MP4s41KczDqgD
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 18:53:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=141476095=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 46MP4B2RX2zDqBd
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 18:52:49 +1000 (AEST)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 02 Sep 2019 16:52:46 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Sep 2019
 16:52:45 +0800
Received: from mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81]) by
 mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81%6]) with mapi id
 15.01.1713.004; Mon, 2 Sep 2019 16:52:45 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHVV/XbtwEoqXVk+kGbiKtv2uj0UqcFJGgAgAE9VwCAC0qVsIAAQT+AgAYx+Nc=
Date: Mon, 2 Sep 2019 08:52:45 +0000
Message-ID: <02128993d3064b53ac289500746666ab@quantatw.com>
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>,
 <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>
In-Reply-To: <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
Content-Type: multipart/alternative;
 boundary="_000_02128993d3064b53ac289500746666abquantatwcom_"
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

--_000_02128993d3064b53ac289500746666abquantatwcom_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgUGF0cmljaywNCg0KDQpTaW5jZSB3ZSB1c2UgcGhvc3Bob3Itc2VsLWxvZ2dlciBbMV0gYXQg
dGhlIHNhbWUgdGltZSwgd2UgZG8gYXNzaWduIG1pbiBhbmQgbWF4IG9mIHRlbXAgc2Vuc29ycyB0
byBEYnVzIChtYXg6IDEyNywgbWluOiAtMTI4KS4gU28gaW4gdGhlIHByZXNlbnQgY2FzZSwgb3Vy
IHRlbXAgdmFsdWUgd2lsbCBiZSBkaXZpZGVkIGJ5IDAuMjU1IChhbHNvIGR1ZSB0byBleHBvbmVu
dCBpcyAtMyBoZXJlKS4gVGhpcyB3aWxsIGNhdXNlIHJlLXNjYWxpbmcgcHJvYmxlbS4gVGhlcmVm
b3JlIHRoZXJlIHNob3VsZCBiZSBhbiBzdGF0ZW1lbnQgdG8gZGlzdGluZ3Vpc2ggc2Vuc29yIHR5
cGVzLiBJZiBpdCBpcyAidGVtcCIsIHRoZW4gb25lIGFzc2lnbnMgMCB0byB0aGUgbWluIGFuZCBt
YXggZnJvbSBEYnVzLg0KDQoNClsxXSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhv
ci1zZWwtbG9nZ2VyL2Jsb2IvM2QzMDBmY2EyNGIzMDg2NGIzZTlhNGY1NzY4Y2ZlNWU3Njk0NThh
ZS9pbmNsdWRlL3NlbnNvcnV0aWxzLmhwcCNMNTk8aHR0cHM6Ly9nPg0KDQoNCkhhbmsNCg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogUGF0cmljayBWZW50dXJlIDx2
ZW50dXJlQGdvb2dsZS5jb20+DQpTZW50OiBGcmlkYXksIEF1Z3VzdCAzMCwgMjAxOSAxOjQ3IEFN
DQpUbzogSGFuayBMaW91ICi8Qq7Kv6spDQpDYzogSmFtZXMgRmVpc3Q7IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFtwaG9zcGhvci1waWQtY29udHJvbF0gc2NhbGluZyBp
c3N1ZQ0KDQpQVEFMIC0gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8yNDgyNyAt
IHRoaXMgaXMgbWVyZ2VkLCBhbmQNCnRoZSBzcmNyZXYgYnVtcCBzaG91bGQgcHJvcGFnYXRlIGlu
dG8gb3BlbmJtYy9vcGVuYm1jIGluIGEgZGF5IG9yIHR3by4NCg0KT24gV2VkLCBBdWcgMjgsIDIw
MTkgYXQgMTE6MDAgUE0gSGFuayBMaW91ICi8Qq7Kv6spIDxIYW5rLkxpb3VAcXVhbnRhdHcuY29t
PiB3cm90ZToNCj4NCj4gSGkgUGF0cmljaywNCj4NCj4gSSB0aGluayBpdCdzIE9LIHRvIHBhcnNl
IHRoZSBjb25maWcgbWluJm1heCBmb3IgdGVtcCBzZW5zb3JzLg0KPg0KPiBBbnkgc3VnZ2VzdGlv
bj8NCj4NCj4gVGhhbmtzLA0KPiBIYW5rDQo+DQo+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+RnJvbTogb3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtDQo+ID5ib3VuY2VzK2hhbmsubGlv
dT1xdWFudGF0dy5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mIEhhbmsgTGlvdQ0K
PiA+KLxCrsq/qykNCj4gPlNlbnQ6IEZyaWRheSwgQXVndXN0IDIzLCAyMDE5IDQ6MzEgUE0NCj4g
PlRvOiBQYXRyaWNrIFZlbnR1cmUgPHZlbnR1cmVAZ29vZ2xlLmNvbT47IEphbWVzIEZlaXN0DQo+
ID48amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPg0KPiA+Q2M6IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZw0KPiA+U3ViamVjdDogUkU6IFtwaG9zcGhvci1waWQtY29udHJvbF0gc2NhbGluZyBp
c3N1ZQ0KPiA+DQo+ID5IaSBQYXRyaWNrLA0KPiA+DQo+ID4+LS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj5Gcm9tOiBQYXRyaWNrIFZlbnR1cmUgW21haWx0bzp2ZW50dXJlQGdvb2dsZS5j
b21dDQo+ID4+U2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjEsIDIwMTkgMTA6MzIgUE0NCj4gPj5U
bzogSGFuayBMaW91ICi8Qq7Kv6spIDxIYW5rLkxpb3VAcXVhbnRhdHcuY29tPjsgSmFtZXMgRmVp
c3QNCj4gPj48amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPg0KPiA+PkNjOiBvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcNCj4gPj5TdWJqZWN0OiBSZTogW3Bob3NwaG9yLXBpZC1jb250cm9sXSBz
Y2FsaW5nIGlzc3VlDQo+ID4+DQo+ID4+T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMToxMSBBTSBI
YW5rIExpb3UgKLxCrsq/qykNCj4gPj48SGFuay5MaW91QHF1YW50YXR3LmNvbT4gd3JvdGU6DQo+
ID4+Pg0KPiA+Pj4gSGkgQWxsLA0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBBZnRlciBjb21taXQgWzFd
LCBJIGZvdW5kIG15IHRlbXAgc2Vuc29yIHJlYWRpbmcgd291bGQgYmUgcmUtc2NhbGVkDQo+ID4+
PiBieQ0KPiA+Pm11bHRpcGx5aW5nIDEgb3ZlciAyNTUsIG1ha2luZyB0ZW1wZXJhdHVyZSBpbnRv
IHVuZmFtaWxpYXIgdW5pdC4gQWxzbw0KPiA+PnRoZSBmYW4gcnBtIHJlYWRpbmcgd291bGQgbGll
IGluIFswLDFdIGludGVydmFsLCBsZXR0aW5nIHRoZSBmYW4gaW5wdXQNCj4gPj50byBiZSAwIChz
aW5jZSB0aGUgaW5wdXQgdmFsdWUgb2YgZmFuIGlzIGZyb20gYW4gaW50ZWdlciBhcnJheSBbMl0p
LiBBcmUgdGhlc2UNCj4gPm5vcm1hbCBiZWhhdmlvcnM/DQo+ID4+T3IgZG8gSSBtaXNzIHNvbWV0
aGluZz8NCj4gPj4NCj4gPj5BcmUgeW91IHVzaW5nIGRidXMgY29uZmlndXJhdGlvbiBvciBqc29u
PyAgSWYganNvbiwgY2FuIHlvdSBhdHRhY2ggeW91ciBjb25maWcuDQo+ID4+U2luY2UgeW91J3Jl
IHNheWluZyBpdCB3YXMgd29ya2luZyBhbmQgbm93IGlzbid0LCBJJ20gYXNzdW1pbmcgdGhlcmUn
cw0KPiA+PnNvbWV0aGluZyBhYm91dCB0aGUgY29uZmlnIGJlaW5nIHRyZWF0ZWQgZGlmZmVyZW50
bHkgd2l0aCB0aGUgY29kZQ0KPiA+PmNoYW5nZXMgaW4gYW4gdW5leHBlY3RlZCB3YXkuDQo+ID4N
Cj4gPkkgZm91bmQgcGlkIGNvbnRyb2wgd2lsbCBmaXJzdCByZWFkIG1pbiBhbmQgbWF4IGZyb20g
ZGJ1cyBhbmQgdGhlbiAoYmVmb3JlDQo+ID5jb21taXQgWzFdKSByZXZpc2UgdGhlbSBpZg0KPiA+
DQo+ID5pbmZvLT5taW4gIT0gY29uZjo6aW5oZXJpdFZhbHVlRnJvbURidXMgKGluIGRidXMvZGJ1
c3Bhc3NpdmUuY3BwKQ0KPiA+DQo+ID5BZnRlciB2YWx1ZSBpbml0aWFsaXphdGlvbiwgdGhlIG1p
biBhbmQgbWF4IHdvdWxkIGJlIHRoZSBvbmVzIGluIGpzb24gZmlsZSAoSnNvbg0KPiA+ZmlsZSBb
M10pLiBIb3dldmVyLCBhZnRlciBjb21taXQgWzFdIHRoZSBtaW4gYW5kIG1heCB2YWx1ZXMgb2Yg
Y29uZmlnIHdvdWxkDQo+ID5ub3QgYmUgZmVkIGludG8gdGhlIGZhbiBjb250cm9sIHByb2Nlc3Mu
IFRoZSBzY2FsaW5nIGlzc3VlIGlzIG9yaWdpbmF0ZWQgZnJvbQ0KPiA+Y29tbWl0IFs0XSB3aXRo
IHRoZSBhaW0gdG8gdHJlYXQgZmFuIHJwbSBhcyBwZXJjZW50YWdlLiBJdCBzZWVtcyB0aGF0IGNv
bW1pdA0KPiA+WzFdIHVuZXhwZWN0ZWRseSBhZmZlY3RzIHRlbXAgc2Vuc29ycyBpbiB0aGUgc2Vu
c2UgdGhhdCB0aGUgdGVtcCBpcyB0aGUNCj4gPmludGVnZXIgcmVhZGluZyBub3QgcGVyY2VudGFn
ZS4gQmVmb3JlIGNvbW1pdCBbMV0sIGl0IHdvdWxkIG5vdCByZS1zY2FsZSB0aGUNCj4gPnRlbXAg
cmVhZGluZyBzaW5jZSBteSBtaW4gYW5kIG1heCBhcmUgMCBbNl0uDQo+ID4NCj4gPg0KPiA+DQo+
ID5UaGVyZSBpcyBhbm90aGVyIGlzc3VlIHdpdGggY29tbWl0IFsxXS4gTm93IHRoZSBmYW4gcnBt
IHdvdWxkIGJlIHNvbWV0aGluZw0KPiA+bGlrZQ0KPiA+DQo+ID4xNTAwIC8gMjAwMDAgPSAwLjA3
NQ0KPiA+DQo+ID53aGVyZSBycG0gbWF4IDIwMDAwIGlzIGZyb20gZGJ1cy4gSG93ZXZlciB0aGUg
ZmFuIGlucHV0IGZ1bmN0aW9uIHdvdWxkDQo+ID50cmFuc2ZlciBkb3VibGUgaW50byBpbnQsIHdo
aWNoIGlzIDAgZm9yIDAuMDc1IChzZWUgWzVdKS4gSGVuY2UgdGhlIGZhbiBpbnB1dCBpcyAwDQo+
ID5ub3QgcGVyY2VudGFnZS4gSXMgdGhlcmUgc29tZXRoaW5nIHdyb25nPw0KPiA+DQo+ID5bMV0g
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLQ0KPiA+Y29udHJvbC9jb21t
aXQvZmMyZTgwM2Y1ZDkyNTY5NDRlMThjN2M4NzhhNDQxNjA2YjFmMTIxYw0KPiA+WzJdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj4gPmNvbnRyb2wvYmxvYi9hN2Vj
ODM1MGQxN2I3MDE1M2NlYmU2NjZkM2ZiZTg4YmRkZDAyYTFhL3BpZC9mYW5jb250cm9sbGUNCj4g
PnIuY3BwI0w4Ng0KPiA+WzNdDQo+ID4gICAgICAgew0KPiA+ICAgICAgICAgICAgIm5hbWUiOiAi
ZmFuMSIsDQo+ID4gICAgICAgICAgICAidHlwZSI6ICJmYW4iLA0KPiA+ICAgICAgICAgICAgInJl
YWRQYXRoIjogIi9zeXMvY2xhc3MvaHdtb24vaHdtb24xL2ZhbjFfaW5wdXQiLA0KPiA+ICAgICAg
ICAgICAgIndyaXRlUGF0aCI6ICIvc3lzL2NsYXNzL2h3bW9uL2h3bW9uMS9wd20xIiwNCj4gPiAg
ICAgICAgICAgICJtaW4iOiAwLA0KPiA+ICAgICAgICAgICAgIm1heCI6IDI1NQ0KPiA+ICAgICAg
ICB9LA0KPiA+ICAgICAgICB7DQo+ID4gICAgICAgICAgICAibmFtZSI6ICJ0ZW1wMSIsDQo+ID4g
ICAgICAgICAgICAidHlwZSI6ICJ0ZW1wIiwNCj4gPiAgICAgICAgICAgICJyZWFkUGF0aCI6ICIv
eHl6L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL3RlbXBlcmF0dXJlL3RlbXAxIiwNCj4gPiAgICAg
ICAgICAgICJ3cml0ZVBhdGgiOiAiIiwNCj4gPiAgICAgICAgICAgICJtaW4iOiAwLA0KPiA+ICAg
ICAgICAgICAgIm1heCI6IDANCj4gPiAgICAgICAgfQ0KPiA+WzRdIGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj4gPmNvbnRyb2wvY29tbWl0Lzc1ZWI3NjlkMzUxNDM0
NTQ3ODk5MTg2ZjczZmY3MGFlMDBkNzkzNGENCj4gPls1XSBodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9waG9zcGhvci1waWQtDQo+ID5jb250cm9sL2Jsb2IvYTdlYzgzNTBkMTdiNzAxNTNjZWJl
NjY2ZDNmYmU4OGJkZGQwMmExYS9waWQvZmFuY29udHJvbGxlDQo+ID5yLmNwcCNMNjQNCj4gPls2
XSBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1waWQtDQo+ID5jb250cm9sL2Js
b2IvYTdlYzgzNTBkMTdiNzAxNTNjZWJlNjY2ZDNmYmU4OGJkZGQwMmExYS9kYnVzL2RidXNwYXNz
aQ0KPiA+dmUuY3BwI0wxNTgNCj4gPg0KPiA+Pg0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBbMV0NCj4g
Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC0NCj4gPj5jb250cm9s
L2NvbW1pdC9mYzJlODAzZjVkOTI1NjkNCj4gPj4+IDQ0ZTE4YzdjODc4YTQ0MTYwNmIxZjEyMWMN
Cj4gPj4+DQo+ID4+PiBbMl0NCj4gPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3Nw
aG9yLXBpZC0NCj4gPj5jb250cm9sL2Jsb2IvYTdlYzgzNTBkMTdiNzAxNTMNCj4gPj4+IGNlYmU2
NjZkM2ZiZTg4YmRkZDAyYTFhL3BpZC9mYW5jb250cm9sbGVyLmNwcCNMODYNCj4gPj4+DQo+ID4+
Pg0KPiA+Pj4gVGhhbmtzLA0KPiA+Pj4NCj4gPj4+DQo+ID4+PiBIYW5rIExpb3UNCj4gPj4+DQo+
ID4+PiBRdWFudGEgQ29tcHV0ZXIgSW5jLg0KPiA+Pj4NCj4gPj4+DQo+ID4NCj4gPlNpbmNlcmVs
eSwNCj4gPkhhbmsNCg==

--_000_02128993d3064b53ac289500746666abquantatwcom_
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
<p>Since we use phosphor-sel-logger [1]&nbsp;at the same time, we do assign=
 min and&nbsp;max of temp sensors to Dbus&nbsp;(max: 127, min: -128). So i<=
span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot=
;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot=
;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size:=
 16px;">n
 the present case, our temp value will be divided by 0.255 (also due to&nbs=
p;</span><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiF=
ont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEm=
oji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; =
font-size: 16px;">exponent
 is -3 here</span><span style=3D"font-family: Calibri, Helvetica, sans-seri=
f, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, No=
toColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, Emoji=
Symbols; font-size: 16px;">).&nbsp;</span>This will cause re-scaling proble=
m.&nbsp;<span style=3D"font-size: 12pt;">Therefore
</span><span style=3D"font-size: 12pt;">there should be an </span><span sty=
le=3D"font-size: 12pt;">statement to distinguish sensor types. If it is &qu=
ot;temp&quot;, then one&nbsp;assigns 0 to the min and max from Dbus.</span>=
</p>
<p><br>
</p>
<p>[1]&nbsp;<a href=3D"https://github.com/openbmc/phosphor-sel-logger/blob/=
3d300fca24b30864b3e9a4f5768cfe5e769458ae/include/sensorutils.hpp#L59" class=
=3D"OWAAutoLink" id=3D"LPlnk606462" previewremoved=3D"true">https://github.=
com/openbmc/phosphor-sel-logger/blob/3d300fca24b30864b3e9a4f5768cfe5e769458=
ae/include/sensorutils.hpp#L59</a><a href=3D"https://g" class=3D"OWAAutoLin=
k" id=3D"LPlnk929597" previewremoved=3D"true"></a></p>
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<br>
</div>
<p>Hank</p>
<p><br>
</p>
<div style=3D"color: rgb(0, 0, 0);">
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
<font size=3D"2"><span style=3D"font-size:10pt;">
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
</body>
</html>

--_000_02128993d3064b53ac289500746666abquantatwcom_--
