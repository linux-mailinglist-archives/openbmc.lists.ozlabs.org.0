Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C2FCAD7
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2019 17:38:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DRxZ1QlvzF6cd
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 03:38:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DRwY5QF3zF5Gb
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 03:37:33 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 08:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="235737689"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2019 08:37:29 -0800
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
 IRSMSX109.ger.corp.intel.com (163.33.3.23) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 14 Nov 2019 16:37:28 +0000
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 irsmsx111.ger.corp.intel.com ([169.254.2.205]) with mapi id 14.03.0439.000;
 Thu, 14 Nov 2019 16:37:28 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Paul Vancil <pwvancil@gmail.com>, Justin Thaler
 <thalerj@linux.vnet.ibm.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6KdobVAAgAACRgCAAC2GAIAA2c2ggABxGICAAU1egIAAMBwggAAhUgCABLrokIAACDyAgAv4ngCAABcv8IAAhyOAgArYyYCAAADLAIACyqPw
Date: Thu, 14 Nov 2019 16:37:27 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A3105CF7@IRSMSX101.ger.corp.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
 <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9DFD@IRSMSX101.ger.corp.intel.com>
 <9ECD367E-6573-4DA8-815E-E117AD8DF56C@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30FA694@IRSMSX101.ger.corp.intel.com>
 <C6A744EB-AB05-481F-AC96-09D4DE6ABE57@fuzziesquirrel.com>
 <76cf53a7-9b1f-f724-356a-28ac97c918cc@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A31034F7@IRSMSX101.ger.corp.intel.com>
 <1db5a5bd-6be6-cb93-5865-99416cc31646@linux.vnet.ibm.com>
 <6474a709-fa41-2dd5-538e-e04fb6e25431@linux.vnet.ibm.com>
 <CALaYK6E5eGc5S1B5utVpCgw5xzy6=3ONpZeckTKtkQ0ARHuogw@mail.gmail.com>
In-Reply-To: <CALaYK6E5eGc5S1B5utVpCgw5xzy6=3ONpZeckTKtkQ0ARHuogw@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2MxMDRlMDYtYmI4ZC00NDhhLWE2MDEtOTEyZGIxNDczYzZkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiblhkUjlDOUhCYjkzYm5PUitud1M3VXpxWW15Q0xpOExNZ1h6a1pqQUxnbXZSZldObjhreDlWTHN5aG5ubjY4SiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.182]
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIA0KDQpUaGFuayB5b3UgYWxsIGZvciByZXZpZXdzIGFuZCBjb21tZW50cy4gSXMgdGhlcmUg
YW55dGhpbmcgZWxzZSByZXF1aXJlZCBpbiBvcmRlciB0byBwdXNoIHRoaXMgZGVzaWduIHRvIHRo
ZSBHaXRodWIgcmVwb3NpdG9yeT8NCg0KUmVnYXJkcw0KUGlvdHINCg0KRnJvbTogUGF1bCBWYW5j
aWwgW21haWx0bzpwd3ZhbmNpbEBnbWFpbC5jb21dIA0KU2VudDogVHVlc2RheSwgTm92ZW1iZXIg
MTIsIDIwMTkgMzozOSBQTQ0KVG86IEp1c3RpbiBUaGFsZXIgPHRoYWxlcmpAbGludXgudm5ldC5p
Ym0uY29tPg0KQ2M6IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+OyBK
YW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPjsgTWF0dXN6Y3phaywgUGlv
dHIgPHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tPjsgTWlobSwgSmFtZXMgPGphbWVzLm1paG1A
aW50ZWwuY29tPjsgYXBwYXJhby5wdWxpQGxpbnV4LmludGVsLmNvbTsgbmVsYWRrQG1pY3Jvc29m
dC5jb207IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgdmlzaHdhIDx2aXNod2FAbGludXgudm5l
dC5pYm0uY29tPg0KU3ViamVjdDogUmU6IG11bHRpcGxlIHRlbGVtZXRyeSBkZXNpZ25zDQoNClBh
dWwgaGVyZS7CoA0KSSBhbHNvIGNvbW1lbnRlZCBhbmQgYXBwcm92ZWQgdGhlIGludGVsIGRlc2ln
bi7CoA0KSXQgbG9va3MgZ29vZCB0byBtZS7CoA0KDQoNCk9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0
IDk6MzYgQU0gSnVzdGluIFRoYWxlciA8dGhhbGVyakBsaW51eC52bmV0LmlibS5jb20+IHdyb3Rl
Og0KDQoNCk9uIDExLzUvMTkgMTA6NTggQU0sIHZpc2h3YSB3cm90ZToNCj4gVGhhbmtzLg0KPiAN
Cj4gU28sIGxvb2tzIGxpa2Ugd2UgYXJlIGdldHRpbmcgemVyb2VkIGluIG9uIEludGVsJ3MgcHJv
cG9zYWwgPy4gSSBzZWUgS3VuIA0KPiBhcHByb3ZpbmcgSW50ZWwgdmVyc2lvbi4NCj4gDQo+IFBh
dWw6IERpZCB5b3UgaGF2ZSBhbnl0aGluZyA/DQo+IA0KPiAhISBWaXNod2EgISENCj4gDQo+IE9u
IDExLzUvMTkgMjoyNiBQTSwgTWF0dXN6Y3phaywgUGlvdHIgd3JvdGU6DQo+PiBIaSwNCj4+DQo+
PiBJIGxvb2tlZCBhdCB0aGlzIGRlc2lnbiBicmllZmx5IGFuZCBpdCBzZWVtcyB0byBiZSBmb2N1
c2luZyBvbiBSZWRmaXNoIA0KPj4gVGVsZW1ldHJ5IFNlcnZpY2UgaW1wbGVtZW50YXRpb24sIHdo
aWNoIG91ciBkZXNpZ24gDQo+PiAoaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9j
L29wZW5ibWMvZG9jcy8rLzI0MzU3KSBhbHNvIA0KPj4gY292ZXJzLiBEZWxsJ3MgZGVzaWduIGFz
c3VtZXMgdXNpbmcgY29sbGVjZCBmb3IgZ2F0aGVyaW5nIHNlbnNvciANCj4+IHJlYWRpbmdzLg0K
PiANCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+PiBGcm9tOiB2aXNod2EgW21haWx0
bzp2aXNod2FAbGludXgudm5ldC5pYm0uY29tXQ0KPj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIg
NSwgMjAxOSA4OjMxIEFNDQo+PiBUbzogQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWly
cmVsLmNvbT4NCj4+IENjOiBNaWhtLCBKYW1lcyA8amFtZXMubWlobUBpbnRlbC5jb20+OyBKdXN0
aW4gVGhhbGVyIA0KPj4gPHRoYWxlcmpAbGludXgudm5ldC5pYm0uY29tPjsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnOyANCj4+IG5lbGFka0BtaWNyb3NvZnQuY29tOyBKYW1lcyBGZWlzdCA8amFt
ZXMuZmVpc3RAbGludXguaW50ZWwuY29tPjsgDQo+PiBhcHBhcmFvLnB1bGlAbGludXguaW50ZWwu
Y29tOyBNYXR1c3pjemFrLCBQaW90ciANCj4+IDxwaW90ci5tYXR1c3pjemFrQGludGVsLmNvbT4N
Cj4+IFN1YmplY3Q6IFJlOiBtdWx0aXBsZSB0ZWxlbWV0cnkgZGVzaWducw0KPj4NCj4+IFRoZXJl
IGlzIGFsc28gdGhpcyB2ZXJzaW9uIGZyb20gRGVsbDoNCj4+IGh0dHBzOi8vZ2Vycml0Lm9wZW5i
bWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMvZG9jcy8rLzIzNzU4Ly4gV2FzIHRoaXMgDQo+PiBj
b25zaWRlcmVkIGluIHRoaXMgZGlzY3Vzc2lvbiA/Lg0KPj4NCj4+IEFsc28sIGZyb20gSUJNJ3Mg
c3RhbmRwb2ludCwgSnVzdGluIFRoYWxlciB3YXMgbWVudGlvbmluZyB0aGF0IHdlIA0KPj4gd2Fu
dGVkIGEgInRydWUgc3Vic2NyaXB0aW9uIiBtb2RlbCwgaW4gdGhhdCwgY2xpZW50cyBjYW4gcGlj
ayBhbmQgDQo+PiBjaG9zZSB0aGUgc3BlY2lmaWMgc2Vuc29ycy4NCj4+DQo+PiBKdXN0aW46IENv
dWxkIHlvdSBhZGQgaGVyZSBwbGVhc2UgPw0KU29ycnkgZm9yIHRoZSBzbG93IHJlc3BvbnNlLiBQ
aW90ciB3YXMga2luZCBlbm91Z2ggdG8gd2FsayBtZSB0aHJvdWdoIA0KaG93IHRoZSBwcm9wb3Nh
bCB3b3JrcyBhbmQgaXQgZG9lcyBhbGxvdyBmb3IgYSB0cnVlIHN1YnNjcmlwdGlvbiBtb2RlbC4g
DQpJIHN0aWxsIGhhdmUgYSB0byBkbyB0byBkZXRlcm1pbmUgaG93IG11Y2ggZGF0YSB3ZSB3aWxs
IGJlIHVzaW5nIHdpdGggDQp0aGlzIG1vZGVsIHNvIEkgY2FuIHVuZGVyc3RhbmQgaG93IHdlbGwg
aXQgc2NhbGVzLiBUaGlzIGlzIGEgY29uY2VybiBmb3IgDQp1cyBhcyB3ZSBhcmUgc2hpZnRpbmcg
ZnJvbSByZWNlaXZpbmcgc2Vuc29yIHVwZGF0ZXMgaW4gYW4gIm9uLWNoYW5nZSIgDQptb2RlbCB0
byB1cGRhdGVzIGV2ZXJ5IHNlY29uZCwgcmVnYXJkbGVzcyBvZiBjaGFuZ2UuIFRoZXJlJ3MgYWxz
byANCmNoYW5nZXMgaW4gdGhlIGRhdGEgZm9ybWF0IHRoYXQncyBzZW50LCB3aGljaCB3aWxsIGxp
a2VseSBtYWtlIHRoaXMgbGVzcyANCm9mIGEgY29uY2Vybi4NCg0KVGhhbmtzLA0KSnVzdGluDQoN
Cj4+DQo+PiAhISBWaXNod2EgISENCj4+DQo+PiBPbiAxMC8yOC8xOSAxMDoxMiBQTSwgQnJhZCBC
aXNob3Agd3JvdGU6DQo+Pj4+IE9uIE9jdCAyOCwgMjAxOSwgYXQgMTI6MzUgUE0sIE1hdHVzemN6
YWssIFBpb3RyIA0KPj4+PiA8cGlvdHIubWF0dXN6Y3pha0BpbnRlbC5jb20+IHdyb3RlOg0KPj4+
Pg0KPj4+PiBJIHdvdWxkIGxpa2UgdG8gbWFrZSB0aGUgY29kZSBvcGVuZWQgZnJvbSB0aGUgdmVy
eSBiZWdpbm5pbmcuDQo+Pj4gR2xhZCB0byBoZWFyIGl0IC0gdGhhdCBzb3VuZHMgbGlrZSB0aGUg
YmVzdCB3YXkgdG8gbWUgOi0pDQo+Pj4NCj4+PiBGV0lXLCB3aGVuZXZlciB5b3UgYXJlIHJlYWR5
IHRvIHNoYXJlIGl0LCBJ4oCZZCBzdGlsbCBsaWtlIHRvIHNlZSANCj4+PiB3aGF0ZXZlciBjb2Rl
IEludGVsIGhhcyBmb3IgdGhlIG1vbml0b3Jpbmcgc2VydmljZS7CoCBJdCB3aWxsIGhlbHAgbWUg
DQo+Pj4gdW5kZXJzdGFuZCB5b3VyIGRlc2lnbiBiZXR0ZXIuwqAgSXQgaXMgZmluZSBpZiBpdCBo
YXMgYnVncyBvciBpdCBpc27igJl0IA0KPj4+IHBvbGlzaGVkLsKgIFRoYW5rcyBQaW90ci4NCj4+
Pg0KPj4+IC1icmFkDQo=
