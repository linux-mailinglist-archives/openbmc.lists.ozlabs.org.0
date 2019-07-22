Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E330C6FCC3
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 11:49:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45scK15lFJzDqTM
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 19:49:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=0991e83b1=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45scJT18T2zDqN1
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 19:49:08 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 22 Jul 2019 17:49:04 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 22 Jul
 2019 17:49:03 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Mon, 22 Jul 2019 17:49:03 +0800
From: =?utf-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: Re: Could phosphor-hwmon support peci-sensors
Thread-Topic: Could phosphor-hwmon support peci-sensors
Thread-Index: AdVAcrEeJhGDbsKEQ6GlW/GsUn/vgw==
Date: Mon, 22 Jul 2019 09:49:03 +0000
Message-ID: <7297d188594b4d83a1f32f87b54db2dc@quantatw.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24784.005
x-tm-as-result: No--19.209100-0.000000-31
x-tm-as-matchedid: 140026-150567-700225-703140-701090-703503-704381-704225-7
 05161-701173-705097-702203-705220-701632-704714-702082-704966-704241-703173
 -704706-139010-139006-188199-702601-702754-702481-106660-705249-703032-7026
 00-704585-705244-701029-106230-704720-701480-700244-704224-704074-703381-70
 0379-139705-703957-701478-186035-702617-704634-703812-701590-148004-148133-
 20025-20043-42000-42003-63
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmFtZXMsDQogICBJIGhhdmUgc29tZSBwcm9ibGVtcyB3aXRoIGNwdXNlbnNvciBpbiBwYWNr
YWdlIGRidXMtc2Vuc29ycy4gV2hlbiBJIHNldCB0ZW1wZXJhdHVyZXMgb2YgY3JpdGljYWwgYW5k
IHdhcm5pbmcgaGlnaCBmb3IgRElNTSBpcyB3b3JrLCBidXQgQ29yZSBpcyBub3QuIENvdWxkIEkg
c2V0IHRlbXBlcmF0dXJlcyBvZiBjcml0aWNhbCBhbmQgd2FybmluZyBoaWdoIGZvciBDb3JlIGJ5
IGpzb24gZmlsZSBpbiBlbnRpdHktbWFuYWdlciA/IA0KKFRoZXJlIGlzIG15IGpvc24gZmlsZSBm
b3IgY3B1IGluIHBhY2thZ2UgZW50aXR5LW1hbmFnZXIpDQoNCiAgICAgICAgICAgICJUaHJlc2hv
bGRzIjogWw0KICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgIkRpcmVjdGlv
biI6ICJncmVhdGVyIHRoYW4iLA0KICAgICAgICAgICAgICAgICAgICAiTGFiZWwiOiAiQ29yZSIs
DQogICAgICAgICAgICAgICAgICAgICJOYW1lIjogInVwcGVyIGNyaXRpY2FsIiwNCiAgICAgICAg
ICAgICAgICAgICAgIlNldmVyaXR5IjogMSwNCiAgICAgICAgICAgICAgICAgICAgIlZhbHVlIjog
NzUNCiAgICAgICAgICAgICAgICB9LA0KICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAg
ICAgICAgIkRpcmVjdGlvbiI6ICJncmVhdGVyIHRoYW4iLA0KICAgICAgICAgICAgICAgICAgICAi
TGFiZWwiOiAiQ29yZSIsDQogICAgICAgICAgICAgICAgICAgICJOYW1lIjogInVwcGVyIG5vbiBj
cml0aWNhbCIsDQogICAgICAgICAgICAgICAgICAgICJTZXZlcml0eSI6IDAsDQogICAgICAgICAg
ICAgICAgICAgICJWYWx1ZSI6IDcwDQogICAgICAgICAgICAgICAgfSwNCiAgICAgICAgICAgICAg
ICB7DQogICAgICAgICAgICAgICAgICAgICJEaXJlY3Rpb24iOiAiZ3JlYXRlciB0aGFuIiwNCiAg
ICAgICAgICAgICAgICAgICAgIkxhYmVsIjogIkRJTU0iLA0KICAgICAgICAgICAgICAgICAgICAi
TmFtZSI6ICJ1cHBlciBjcml0aWNhbCIsDQogICAgICAgICAgICAgICAgICAgICJTZXZlcml0eSI6
IDEsDQogICAgICAgICAgICAgICAgICAgICJWYWx1ZSI6IDg1DQogICAgICAgICAgICAgICAgfSwN
CiAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAgICJEaXJlY3Rpb24iOiAiZ3Jl
YXRlciB0aGFuIiwNCiAgICAgICAgICAgICAgICAgICAgIkxhYmVsIjogIkRJTU0iLA0KICAgICAg
ICAgICAgICAgICAgICAiTmFtZSI6ICJ1cHBlciBub24gY3JpdGljYWwiLA0KICAgICAgICAgICAg
ICAgICAgICAiU2V2ZXJpdHkiOiAwLA0KICAgICAgICAgICAgICAgICAgICAiVmFsdWUiOiA4MA0K
ICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIF0sDQoNClRoYW5rcy4NCkR1a2UsIER1DQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYw0KPiBbbWFpbHRv
Om9wZW5ibWMtYm91bmNlcyt3aWxsLmxpYW5nPXF1YW50YXR3LmNvbUBsaXN0cy5vemxhYnMub3Jn
XSBPbg0KPiBCZWhhbGYgT2YgVmlqYXkgS2hlbWthDQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAx
MCwgMjAxOSA0OjIwIEFNDQo+IFRvOiBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50
ZWwuY29tPjsgQnJhZCBCaXNob3ANCj4gPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT47IER1
a2UgRHUgKOadnOelpeWYiSkNCj4gPER1a2UuRHVAcXVhbnRhdHcuY29tPg0KPiBDYzogb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnOyBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRl
bC5jb20+DQo+IFN1YmplY3Q6IFJlOiBDb3VsZCBwaG9zcGhvci1od21vbiBzdXBwb3J0IHBlY2kt
c2Vuc29ycw0KPiANCj4gDQo+IA0KPiDvu79PbiA3LzgvMTksIDExOjI5IEFNLCAib3BlbmJtYyBv
biBiZWhhbGYgb2YgSmFtZXMgRmVpc3QiDQo+IDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9
ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mDQo+IGphbWVzLmZlaXN0QGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiAgICAgT24gNy84LzE5IDEwOjUyIEFNLCBCcmFkIEJp
c2hvcCB3cm90ZToNCj4gICAgID4gT24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMTI6MzM6MjFQTSAr
MDAwMCwgRHVrZSBEdSAo5p2c56Wl5ZiJKSB3cm90ZToNCj4gICAgID4+IEhpIEFsbCwNCj4gICAg
ID4+ICBJIGhhdmUgc29tZSBwcm9ibGVtcyB3aXRoIHBob3NwaG9yLWh3bW9uLg0KPiAgICAgPj4g
Q291bGQgcGFja2FnZSBwaG9zcGhvci1od21vbiBzdXBwb3J0cyBwZWNpIHNlbnNvcnMgc3VjaCBh
cyBjcHUNCj4gYW5kDQo+ICAgICA+PiBkaW1tIHRlbXBhdHVyZXMgPw0KPiAgICAgPj4gSWYgeWVz
LCBjb3VsZCB5b3UgZ2l2ZSBtZSBzb21lIGhpbnRzIHRoYXQgaG93IGRvIEkgd3JpdGUgY29uZmln
dXJhdGlvbg0KPiAgICAgPj4gZm9yIHBlY2kgc2Vuc29ycywgcGxlYXNlIDopLg0KPiAgICAgPj4N
Cj4gICAgID4+IFRoYW5rcy4NCj4gICAgID4+IER1a2UsIER1DQo+ICAgICA+DQo+ICAgICA+IHBo
b3NwaG9yLWh3bW9uIHNob3VsZCB3b3JrIHdpdGggYW55dGhpbmcgdGhhdCBpbXBsZW1lbnRzIHRo
ZQ0KPiBod21vbiBBQkkuDQo+ICAgICA+IFNvIEkgdGhpbmsgdG8gbWFrZSBQRUNJIHNlbnNvcnMg
d29yayB3aXRoIHBob3NwaG9yLWh3bW9uLCB5b3UgbmVlZA0KPiBod21vbg0KPiAgICAgPiBkcml2
ZXJzIGZvciBQRUNJIHNlbnNvcnMuICBJIGRvbid0IGtub3cgaWYgYW55b25lIGlzIHdvcmtpbmcg
b24gdGhhdC4NCj4gICAgID4NCj4gICAgID4gSSBzdXNwZWN0IHRoZSBvdGhlciBzZW5zb3IgYXBw
bGljYXRpb24gLSBkYnVzLXNlbnNvcnMgc3VwcG9ydHMgUEVDSSBqdXN0DQo+ICAgICA+IGZpbmUu
ICBCdXQgSSBkb24ndCBrbm93IGhvdyBpdCB3b3JrcywgaWYgaXQgY2FuIGJlIHVzZWQgd2l0aG91
dCBlbnRpdHkNCj4gICAgID4gbWFuYWdlciwgIGFuZC9vciBpZiBpdCBjYW4gYmUgcnVuIGluIHBh
cmFsbGVsIHdpdGggcGhvc3Bob3ItaHdtb24uDQo+IA0KPiAgICAgKyBKYWUsIENQVSBTZW5zb3Ig
QXV0aG9yDQo+IA0KPiANCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZGJ1cy1zZW5zb3Jz
L2Jsb2IvbWFzdGVyL3NyYy9DUFVTZW5zb3JNYWluLg0KPiBjcHANCj4gDQo+ICAgICBDUFUgc2Vu
c29yIGN1cnJlbnRseSBzdXBwb3J0cyBQRUNJIHNlbnNvcnMNCj4gDQo+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL2RidXMtc2Vuc29ycy9ibG9iL21hc3Rlci9zcmMvQ1BVU2Vuc29yLmNwcA0K
PiANCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2VudGl0eS1tYW5hZ2VyL2Jsb2Iv
Zjg2MWRhODllZDAzZjllYzU1NmM1ZQ0KPiBkNmFjODE5OTg4YzBjMWY0OTgvY29uZmlndXJhdGlv
bnMvV0ZUJTIwQmFzZWJvYXJkLmpzb24jTDIxODENCj4gDQo+ICAgICBJdCBkb2VzIHJlcXVpcmUg
ZW50aXR5LW1hbmFnZXIgY3VycmVudGx5LCBidXQgaXQgY291bGQgYmUgcnVuIGluDQo+ICAgICBw
YXJhbGxlbCB3aXRoIHBob3NwaG9yLWh3bW9uLg0KPiANCj4gVGhlcmUgaXMgcGVjaSBkcml2ZXIg
YWxvbmcgd2l0aCBod21vbiBwZWNpIGRyaXZlciBhdmFpbGFibGUgaW4gb3BlbmJtYyBsaW51eA0K
PiBrZXJuZWwgNS4zIHdoaWNoIHdpbGwgdGFrZSBjYXJlIG9mIGh3bW9uIGludGVyZmFjZS4gQW5k
IHRoZXJlIGFyZSBhbHNvDQo+IHBlY2ktZGltbSBhbmQgcGVjaS1jcHUgZHJpdmVyIHRvIHJlYWQg
Y3B1IGFuZCBkaW1tIHNlbnNvcnMuIE9uY2UgdGhlc2UNCj4gZHJpdmVycyBlbmFibGVkLCBpdCBz
b3VsZCB3b3JrIHdpdGggcGhvc3Bob3ItaHdtb24gd2l0aG91dCBlbnRpdHkgbWFuYWdlcg0KPiBh
bmQgZGJ1cy1zZW5zb3JzLg0KPiANCj4gUmVnYXJkcw0KPiAtVmlqYXkNCj4gDQo+ICAgICAtSmFt
ZXMNCj4gDQoNCg==
