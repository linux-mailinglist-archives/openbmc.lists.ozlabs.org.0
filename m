Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D722EF7A0
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 09:57:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476k7r2QBqzF4CP
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 19:57:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476k7811DbzF3Gk
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 19:56:50 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 00:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="232396611"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by fmsmga002.fm.intel.com with ESMTP; 05 Nov 2019 00:56:46 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.170]) with mapi id 14.03.0439.000;
 Tue, 5 Nov 2019 08:56:45 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: vishwa <vishwa@linux.vnet.ibm.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6KdobVAAgAACRgCAAC2GAIAA2c2ggABxGICAAU1egIAAMBwggAAhUgCABLrokIAACDyAgAv4ngCAABcv8A==
Date: Tue, 5 Nov 2019 08:56:44 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A31034F7@IRSMSX101.ger.corp.intel.com>
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
In-Reply-To: <76cf53a7-9b1f-f724-356a-28ac97c918cc@linux.vnet.ibm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTY3OTkzNGYtZmZkMi00M2RmLTkwZGUtZDQwZTJjZDM4ZGQzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYU1aTnpOejlLMDR5c1ZLYk9ydTZYdUl6RmZnU25XMlZ5amRBQkM3RlNcL2RpcEdkUkNYOW1zUGxYUTU3Wk9xTkcifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.180]
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
 Justin Thaler <thalerj@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNCkkgbG9va2VkIGF0IHRoaXMgZGVzaWduIGJyaWVmbHkgYW5kIGl0IHNlZW1zIHRvIGJl
IGZvY3VzaW5nIG9uIFJlZGZpc2ggVGVsZW1ldHJ5IFNlcnZpY2UgaW1wbGVtZW50YXRpb24sIHdo
aWNoIG91ciBkZXNpZ24gKGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL2RvY3MvKy8yNDM1NykgYWxzbyBjb3ZlcnMuIERlbGwncyBkZXNpZ24gYXNzdW1lcyB1c2lu
ZyBjb2xsZWNkIGZvciBnYXRoZXJpbmcgc2Vuc29yIHJlYWRpbmdzLg0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogdmlzaHdhIFttYWlsdG86dmlzaHdhQGxpbnV4LnZuZXQuaWJt
LmNvbV0NClNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDUsIDIwMTkgODozMSBBTQ0KVG86IEJyYWQg
QmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQpDYzogTWlobSwgSmFtZXMgPGph
bWVzLm1paG1AaW50ZWwuY29tPjsgSnVzdGluIFRoYWxlciA8dGhhbGVyakBsaW51eC52bmV0Lmli
bS5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IG5lbGFka0BtaWNyb3NvZnQuY29tOyBK
YW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPjsgYXBwYXJhby5wdWxpQGxp
bnV4LmludGVsLmNvbTsgTWF0dXN6Y3phaywgUGlvdHIgPHBpb3RyLm1hdHVzemN6YWtAaW50ZWwu
Y29tPg0KU3ViamVjdDogUmU6IG11bHRpcGxlIHRlbGVtZXRyeSBkZXNpZ25zDQoNClRoZXJlIGlz
IGFsc28gdGhpcyB2ZXJzaW9uIGZyb20gRGVsbDoNCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovIy9jL29wZW5ibWMvZG9jcy8rLzIzNzU4Ly4gV2FzIHRoaXMgY29uc2lkZXJlZCBp
biB0aGlzIGRpc2N1c3Npb24gPy4NCg0KQWxzbywgZnJvbSBJQk0ncyBzdGFuZHBvaW50LCBKdXN0
aW4gVGhhbGVyIHdhcyBtZW50aW9uaW5nIHRoYXQgd2Ugd2FudGVkIGEgInRydWUgc3Vic2NyaXB0
aW9uIiBtb2RlbCwgaW4gdGhhdCwgY2xpZW50cyBjYW4gcGljayBhbmQgY2hvc2UgdGhlIHNwZWNp
ZmljIHNlbnNvcnMuDQoNCkp1c3RpbjogQ291bGQgeW91IGFkZCBoZXJlIHBsZWFzZSA/DQoNCiEh
IFZpc2h3YSAhIQ0KDQpPbiAxMC8yOC8xOSAxMDoxMiBQTSwgQnJhZCBCaXNob3Agd3JvdGU6DQo+
PiBPbiBPY3QgMjgsIDIwMTksIGF0IDEyOjM1IFBNLCBNYXR1c3pjemFrLCBQaW90ciA8cGlvdHIu
bWF0dXN6Y3pha0BpbnRlbC5jb20+IHdyb3RlOg0KPj4NCj4+IEkgd291bGQgbGlrZSB0byBtYWtl
IHRoZSBjb2RlIG9wZW5lZCBmcm9tIHRoZSB2ZXJ5IGJlZ2lubmluZy4NCj4gR2xhZCB0byBoZWFy
IGl0IC0gdGhhdCBzb3VuZHMgbGlrZSB0aGUgYmVzdCB3YXkgdG8gbWUgOi0pDQo+DQo+IEZXSVcs
IHdoZW5ldmVyIHlvdSBhcmUgcmVhZHkgdG8gc2hhcmUgaXQsIEnigJlkIHN0aWxsIGxpa2UgdG8g
c2VlIHdoYXRldmVyIGNvZGUgSW50ZWwgaGFzIGZvciB0aGUgbW9uaXRvcmluZyBzZXJ2aWNlLiAg
SXQgd2lsbCBoZWxwIG1lIHVuZGVyc3RhbmQgeW91ciBkZXNpZ24gYmV0dGVyLiAgSXQgaXMgZmlu
ZSBpZiBpdCBoYXMgYnVncyBvciBpdCBpc27igJl0IHBvbGlzaGVkLiAgVGhhbmtzIFBpb3RyLg0K
Pg0KPiAtYnJhZA0KDQo=
