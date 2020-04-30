Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA93D1BF979
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 15:28:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CbmR1TkRzDrGx
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 23:28:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=382ff49ec=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49CblZ4xyQzDq5k
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 23:27:14 +1000 (AEST)
IronPort-SDR: DzTEyBQ+xusqMIPgN51hNe9/eI7+2AtnphnQDRDTTR2gMpabnfxrXCzwEKWyw6Rl0v39Lm2J4J
 K3ckgUtLJ+5w==
Received: from unknown (HELO mailbx11.quanta.corp) ([10.243.91.108])
 by mx01.quantatw.com with ESMTP; 30 Apr 2020 21:27:10 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx11.quanta.corp
 (10.243.91.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Apr
 2020 21:27:08 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.1713.009;
 Thu, 30 Apr 2020 21:27:08 +0800
From: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
To: =?utf-8?B?V2lrdG9yIEdvxYJnb3dza2k=?= <wiktor.golgowski@linux.intel.com>,
 Richard Hanley <rhanley@google.com>, Zhenfei Tai <ztai@google.com>
Subject: RE: mTLS on bmcweb
Thread-Topic: mTLS on bmcweb
Thread-Index: AQHWGVyUvYCOPDqKZ0u5JhB4wHPhqaiGVOGAgAANAoCAABCQgIABiTmAgAm2nrA=
Date: Thu, 30 Apr 2020 13:27:08 +0000
Message-ID: <894c0142737c45d891953801468135d1@quantatw.com>
References: <mailman.1237.1587601186.5884.openbmc@lists.ozlabs.org>
 <1DF7E55B-29E9-43A2-9981-F67521B2B3E2@quantatw.com>
 <c34fc105-657d-1e33-e3fc-90cb5afba75a@linux.ibm.com>
 <CAMXw96NDQ7CrY_pTZH+NugOD_6Z0HiKw1dO4vKkpaiRauFgVyQ@mail.gmail.com>
 <CAH1kD+YFYom+qJLBV4rvX6=j2vZSty0GNYw=MGQNG0P60b8h7Q@mail.gmail.com>
 <1251a083-2d63-aa7e-32f4-cf876dde8e4e@linux.intel.com>
In-Reply-To: <1251a083-2d63-aa7e-32f4-cf876dde8e4e@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 093E9C50312F23DA5E64CC6767DE7640E3F758ED96531B2491E8D3AFEF4519E32000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBmb3VuZCBhIHdheSB0byBmaXggdGhpcyBpc3N1ZSwgYnV0IGl0IG5lZWRzIHRvIGJlIG1vZGlm
aWVkIHRvIHRoZSBzb3VyY2UgY29kZS4gSW4gdHdvIHN0ZXBzOg0KDQpTdGVwIDEuDQpUaGUgc291
cmNlIGNvZGUgImFkYXB0b3Iuc2V0X3ZlcmlmeV9tb2RlKGJvb3N0Ojphc2lvOjpzc2w6OnZlcmlm
eV9wZWVyKTsiIGluIGh0dHBfY29ubmVjdGlvbi5oIGlzIHJlcGxhY2VkIHdpdGggDQoiYWRhcHRv
ci5zZXRfdmVyaWZ5X21vZGUoYm9vc3Q6OmFzaW86OnNzbDo6dmVyaWZ5X3BlZXIgfCBib29zdDo6
YXNpbzo6c3NsOjp2ZXJpZnlfZmFpbF9pZl9ub19wZWVyX2NlcnQpOyINCg0KU3RlcCAyLg0KQWNj
b3VudFNlcnZpY2UtPk9lbS0+T3BlbkJNQy0+QXV0aE1ldGhvZHMtPlRMUyBpcyBzZXQuIChmYWxz
ZSBieSBkZWZhdWx0KQ0KDQpJdCB3aWxsIGVuYWJsZSBlbmZvcmNlIG1UTFMgYXV0aGVudGljYXRp
b24uDQoNCkJlc3QsDQpQLksuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogV2lrdG9yIEdvxYJnb3dza2kgPHdpa3Rvci5nb2xnb3dza2lAbGludXguaW50ZWwuY29tPg0K
PiBTZW50OiBTYXR1cmRheSwgQXByaWwgMjUsIDIwMjAgMTowMyBBTQ0KPiBUbzogUmljaGFyZCBI
YW5sZXkgPHJoYW5sZXlAZ29vZ2xlLmNvbT47IFpoZW5mZWkgVGFpIDx6dGFpQGdvb2dsZS5jb20+
DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IFAuIEsuIExlZSAo5p2O5p+P5a+sKSA8
UC5LLkxlZUBxdWFudGF0dy5jb20+Ow0KPiBqcmV5QGxpbnV4LmlibS5jb207IFAuIEsuIExlZSAo
5p2O5p+P5a+sKSA8UC5LLkxlZUBxdWFudGF0dy5jb20+OyBKb3NlcGgNCj4gUmV5bm9sZHMgPGpy
ZXlAbGludXguaWJtLmNvbT4NCj4gU3ViamVjdDogUmU6IG1UTFMgb24gYm1jd2ViDQo+IA0KPiAN
Cj4gDQo+IE9uIDQvMjMvMjAgNzozNSBQTSwgUmljaGFyZCBIYW5sZXkgd3JvdGU6DQo+ID4gTXkg
Z3Vlc3MgaXMgdGhhdCBzb21laG93IHRoZSByb290IGNlcnQgdXNlZCB0byB2YWxpZGF0ZSBjbGll
bnRzIGlzbid0IGluc3RhbGxlZA0KPiBjb3JyZWN0bHksIGFuZCBzbyBpdCdzIGRlZmF1bHRpbmcg
dG8gYmFzaWMgYXV0aC4NCj4gPg0KPiA+IEF0IGxlYXN0IHRoYXQncyBteSByZWFkaW5nIG9mIHRo
aXMgcmV2aWV3DQo+ID4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5i
bWMvYm1jd2ViLysvMjcyNzANCj4gPg0KPiANCj4gSSB0aGluayB0aGlzIHdvdWxkIGJlIHRoZSBj
YXNlLiBJZiB0aGUgY2xpZW50IGNlcnRpZmljYXRlIGlzIG5vdCBwcm92aWRlZCwgVExTDQo+IGNv
bm5lY3Rpb24gaXMgc3RpbGwgZXN0YWJsaXNoZWQsIGp1c3Qgd2l0aG91dCBhdXRoZW50aWNhdGlu
ZyB0aGUgY2xpZW50LiBUaGlzDQo+IGFsbG93cyB1cHBlciBsYXllciB0byBwcm92aWRlIG90aGVy
IGF1dGhlbnRpY2F0aW9uIG1ldGhvZHMgKGUuZy4gQmFzaWMgQXV0aCkuDQo+ID4NCj4gPiBPbiBU
aHUsIEFwciAyMywgMjAyMCBhdCA5OjQ3IEFNIFpoZW5mZWkgVGFpIDx6dGFpQGdvb2dsZS5jb20N
Cj4gPG1haWx0bzp6dGFpQGdvb2dsZS5jb20+PiB3cm90ZToNCj4gPg0KPiA+ICAgICBJIGd1ZXNz
IHBhcnQgb2YgbXkgcXVlc3Rpb24gaXMgaG93IHRvIGNvbmZpZ3VyZSB0aGUgbVRMUyBjZXJ0cyB0
byBtYWtlDQo+IGl0IHdvcmsgcHJvcGVybHkuDQo+ID4NCj4gPiAgICAgU28gZmFyIG9ubHkgaHR0
cHMgd29ya3MgKHNlcnZlciBzaWRlIFRMUykuDQo+ID4NCj4gPiAgICAgVGhhbmtzLA0KPiA+ICAg
ICBaaGVuZmVpDQo+ID4NCj4gPiAgICAgT24gVGh1LCBBcHIgMjMsIDIwMjAgYXQgODo1MCBBTSBK
b3NlcGggUmV5bm9sZHMgPGpyZXlAbGludXguaWJtLmNvbQ0KPiA8bWFpbHRvOmpyZXlAbGludXgu
aWJtLmNvbT4+IHdyb3RlOg0KPiA+DQo+ID4gICAgICAgICBPbiA0LzIzLzIwIDU6NDcgQU0sIFAu
IEsuIExlZSAo5p2O5p+P5a+sKSB3cm90ZToNCj4gPiAgICAgICAgID4gSGksDQo+ID4gICAgICAg
ICA+DQo+ID4gICAgICAgICA+IEkgZW5jb3VudGVyZWQgdGhlIHNhbWUgaXNzdWUgd2hlbiB1c2lu
ZyBSZWRmaXNoIHRvIHJlcGxhY2UgdGhlDQo+IGNlcnRpZmljYXRlLg0KPiA+ICAgICAgICAgPiBS
ZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIHBhcmFtZXRlcnMgaW5jbHVkZSAtLWNlcnQgLS1rZXkN
Cj4gLS1jYWNlcnQgb3Igb25seSAtLWNhY2VydCwgdGhlIGF1dGhlbnRpY2F0aW9uIGNhbiBzdGls
bCBzdWNjZWVkLg0KPiA+ICAgICAgICAgPg0KPiA+ICAgICAgICAgPiBCZXN0LA0KPiA+ICAgICAg
ICAgPiBQLksuDQo+ID4gICAgICAgICA+DQo+ID4gICAgICAgICA+PiBEYXRlOiBXZWQsIDIyIEFw
ciAyMDIwIDE0OjU4OjA2IC0wNzAwDQo+ID4gICAgICAgICA+PiBGcm9tOiBaaGVuZmVpIFRhaSA8
enRhaUBnb29nbGUuY29tDQo+IDxtYWlsdG86enRhaUBnb29nbGUuY29tPj4NCj4gPiAgICAgICAg
ID4+IFRvOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gPG1haWx0bzpvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+DQo+ID4gICAgICAgICA+PiBTdWJqZWN0OiBtVExTIG9uIGJtY3dlYg0KPiA+
ICAgICAgICAgPj4gTWVzc2FnZS1JRDoNCj4gPg0KPiA+PsKgIMKgIMKgIDxDQU1Ydzk2UHA1MTFz
VU89cTFYTHoydUp6aDRTNkQ3dFV3bWt2cGJucV95VS1pSmZpS2dADQo+IG1haWwuZw0KPiA+ICAg
ICAgICAgPj4gbWFpbC5jb20gPGh0dHA6Ly9tYWlsLmNvbT4+DQo+ID4gICAgICAgICA+PiBDb250
ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9InV0Zi04Ig0KPiA+ICAgICAgICAgPj4NCj4g
PiAgICAgICAgID4+IEhpLA0KPiA+ICAgICAgICAgPj4NCj4gPiAgICAgICAgID4+IEknbSB0cnlp
bmcgb3V0IGJtY3dlYiBtVExTIHdoaWNoIHNob3VsZCBiZSBlbmFibGVkIGJ5DQo+IGRlZmF1bHQg
YnkNCj4gPiAgICAgICAgID4+DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2JtY3dlYi9i
bG9iL21hc3Rlci9DTWFrZUxpc3RzLnR4dCNMODkNCj4gPiAgICAgICAgID4+DQo+ID4gICAgICAg
ICA+PiBJbiBteSB0ZXN0LCBJIGNyZWF0ZWQgYSBzZWxmIHNpZ25lZCBrZXkgYW5kIGNlcnRpZmlj
YXRlIHBhaXIsDQo+IHN0YWNrZWQgdGhlbQ0KPiA+ICAgICAgICAgPj4gdXAgaW50byBzZXJ2ZXIu
cGVtIGluIC9ldGMvc3NsL2NlcnRzL2h0dHBzIHRoYXQgYm1jd2ViIHVzZXMuDQo+ID4gICAgICAg
ICA+Pg0KPiA+ICAgICAgICAgPj4gSG93ZXZlciB3aGVuIEkgdHJpZWQgdG8gY3VybCBibWN3ZWIg
c2VydmljZSwgSSB3YXMgYWJsZSB0byBnZXQNCj4gcmVzcG9uc2UgYnkNCj4gPiAgICAgICAgID4+
IG9ubHkgc3VwcGx5aW5nIHRoZSBjZXJ0Lg0KPiA+ICAgICAgICAgPj4NCj4gPiAgICAgICAgID4+
IGN1cmwgLS1jYWNlcnQgY2VydC5wZW3CoCBodHRwczovLyR7Ym1jfS9yZWRmaXNoL3YxDQo+ID4g
ICAgICAgICA+Pg0KPiA+ICAgICAgICAgPj4gV2l0aCB0aGUgbVRMUyBlbmFibGVkLCBJIGV4cGVj
dGVkIGl0IHNob3VsZCBlcnJvciBvdXQgc2luY2Ugbm8NCj4gY2xpZW50DQo+ID4gICAgICAgICA+
PiBjZXJ0aWZpY2F0ZSBpcyBwcm92aWRlZC4NCj4gPiAgICAgICAgID4+DQo+IA0KPiBBcyBtZW50
aW9uZWQsIGlmIHlvdSBkaWQgbm90IHByb3ZpZGUgYSBjbGllbnQgY2VydGlmaWNhdGUsIGNvbm5l
Y3Rpb24gd2FzDQo+IGVzdGFibGlzaGVkIHRvIGFsbG93IGZvciBCYXNpYyBBdXRoLiBBbmQgYXMg
dGhlIFNlcnZpY2UgUm9vdCByZXF1aXJlcyBubw0KPiBhdXRoZW50aWNhdGlvbiwgeW91IGdvdCBh
IHJlc3BvbnNlLg0KPiANCj4gLSBXaWt0b3INCj4gDQo+ID4gICAgICAgICA+PiBDb3VsZCBzb21l
b25lIHdpdGggcmVsZXZhbnQga25vd2xlZGdlIGhlbHAgd2l0aCBteQ0KPiBxdWVzdGlvbj8NCj4g
Pg0KPiA+ICAgICAgICAgSSdtIG5vdCBzdXJlIHdoYXQgeW91IGFyZSBhc2tpbmcuwqAgQXJlIHlv
dSBhc2tpbmcgaG93IHRvIGluc3RhbGwNCj4gbVRMUw0KPiA+ICAgICAgICAgY2VydHMgaW50byB0
aGUgQk1DIGFuZCB0aGVuIHVzZSB0aGVtIHRvIGNvbm5lY3Q/wqAgSSBhbSBzdGlsbA0KPiB3YWl0
aW5nIGZvcg0KPiA+ICAgICAgICAgZG9jdW1lbnRhdGlvbiB0aGF0IGRlc2NyaWJlcyBob3cgdG8g
Y29uZmlndXJlIGFuZCB1c2UgdGhlIG1UTFMNCj4gZmVhdHVyZS4NCj4gPg0KPiA+ICAgICAgICAg
SSd2ZSBhZGRlZCBhbiBlbnRyeSB0byB0aGUgc2VjdXJpdHkgd29ya2luZyBncm91cCBhcyBhIHJl
bWluZGVyIHRvDQo+IGRvDQo+ID4gICAgICAgICB0aGlzLsKgIChJIGRvbid0IGhhdmUgdGhlIHNr
aWxsIHRvIGRvY3VtZW50IHRoaXMgZmVhdHVyZS4pDQo+ID4NCj4gPiAgICAgICAgIC0gSm9zZXBo
DQo+ID4NCj4gPiAgICAgICAgID4+DQo+ID4gICAgICAgICA+PiBUaGFua3MsDQo+ID4gICAgICAg
ICA+PiBaaGVuZmVpDQo+ID4NCg==
