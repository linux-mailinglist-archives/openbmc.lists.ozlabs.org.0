Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 771762780C0
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 08:32:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByMY23YCBzDqkb
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 16:32:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=5305813e6=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4ByMXF72QrzDqkV
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 16:32:06 +1000 (AEST)
IronPort-SDR: lnUGukS71PiecQPVI98UsbYCO5Mt8XOkFp6OFvwvLYria8KUQvVKhk9UCEnyFlowXD9FOibnd3
 BoH5K3goDiFw==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx02.quantatw.com with ESMTP; 25 Sep 2020 14:32:03 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 25 Sep
 2020 14:32:03 +0800
Received: from mailbx09.quanta.corp ([192.168.57.9]) by mailbx09.quanta.corp
 ([192.168.57.9]) with mapi id 15.01.2044.004; Fri, 25 Sep 2020 14:32:03 +0800
From: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
To: Benjamin Fair <benjaminfair@google.com>, Patrick Williams
 <patrick@stwcx.xyz>
Subject: RE: Quanta requests to create a repo in OpenBMC github
Thread-Topic: Quanta requests to create a repo in OpenBMC github
Thread-Index: AQHWjUtxemWaLQi7SUSFKwebwcQp1al475jw
Date: Fri, 25 Sep 2020 06:32:02 +0000
Message-ID: <293f2e530be54ebe8c9aaacb3e2944e7@quantatw.com>
References: <a3919f2a61844f9f89f8e1f8dc0d5972@quantatw.com>
 <CADKL2t5YWsjREnFZ36ZA0ZR4ObOqY-noazEc-+wwVePF9bo8vA@mail.gmail.com>
 <CANPkJS_p9iTJJCue_cSePsgsJ71ztv06XEvEpqe1Y294ne5UYQ@mail.gmail.com>
 <20200917152912.GG6152@heinlein>
 <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
In-Reply-To: <CADKL2t5npwwBs6ecKAqscJ8=BoakpwDNMjuSiZOSXTkCNcLryA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
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
Cc: Josh Lehan <krellan@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?utf-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwgUGF0cmljaywNCg0KTWF5IHdlIGhhdmUgcXVhbnRhLW1pc2MgcmVwb3NpdG9yeSBm
aXJzdCA/IHdlIHN0aWxsIGhhdmUgb3RoZXIgcGFja2FnZXMgY291bGQgYmUgcHVzaGVkLg0KDQpB
cyBmb3IgdGhlIHJlYWQtbWFyZ2luLXRlbXAsIHdlIGNhbiBkaXNjdXNzIGZ1cnRoZXIuDQoNClRo
YW5rcy4NCg0KT24gVGh1LCAxNyBTZXAgMjAyMCBhdCAwODoyOSwgUGF0cmljayBXaWxsaWFtcyA8
cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0KPg0KPiBXb3VsZCBzb21lb25lIG1pbmQgZ2l2aW5n
IGEgMS0yIHNlbnRlbmNlIGV4cGxhaW5hdGlvbiBvZiB3aGF0ICJzZW5zb3IgDQo+IG1hcmdpbiB2
YWx1ZXMiIGFyZT8gIEknbSBjZXJ0YWlubHkgbm90IGEgdGhlcm1hbCBjb250cm9sIGV4cGVydC4N
Cg0KVGhpcyBkYWVtb24gaXMgaW50ZW5kZWQgdG8gYmUgdXNlZCBpbiBjb21iaW5hdGlvbiB3aXRo
IHBob3NwaG9yLXBpZC1jb250cm9sLiBZb3UgZGVmaW5lIGEgY29uZmlndXJhdGlvbiBmaWxlIHdp
dGggdHdvDQpzZWN0aW9uczogc2Vuc29ycyBhbmQgem9uZXMuDQoNClNlbnNvcnMgaGF2ZSBhIEQt
QnVzIHBhdGggdG8gcmVhZCBmcm9tIGFsb25nIHdpdGggYSB0YXJnZXQgdGVtcGVyYXR1cmUgYW5k
IHNvbWUgb3RoZXIgcGFyYW1ldGVycy4gVGhlIGRhZW1vbiBzdWJ0cmFja3MgdGhlIGN1cnJlbnQg
dGVtcGVyYXR1cmUgZnJvbSB0aGUgdGFyZ2V0IHRlbXBlcmF0dXJlIHRvIGdldCB0aGUgIm1hcmdp
biIuIEEgc21hbGxlciBtYXJnaW4gbWVhbnMgdGhlIHRlbXBlcmF0dXJlIGlzIGNsb3NlciB0byB0
aGUgbGltaXQuDQoNClpvbmVzIGdyb3VwIHNlbnNvcnMgdG9nZXRoZXIgYW5kIGxvb2sgZm9yIHRo
ZSB3b3JzdCAobG93ZXN0KSBtYXJnaW4gdmFsdWUgd2l0aGluIHRoYXQgZ3JvdXAuIFRoaXMgdmFs
dWUgaXMgdGhlbiBleHBvcnRlZCBmb3IgdXNlIGluIHBob3NwaG9yLXBpZC1jb250cm9sLg0KDQo+
DQo+IEkgZG9uJ3QgY2FyZSBpZiB0aGVyZSBhcmUgbXVsdGlwbGUgaW1wbGVtZW50YXRpb25zIG9m
IHNpbWlsYXIgDQo+IGZ1bmN0aW9uYWxpdHksIGJ1dCB0aGVyZSBpcyBhbHNvIHdvcmsgZ29pbmcg
b24gZm9yIGEgcmVwb3NpdG9yeSBjYWxsZWQgDQo+ICdwaG9zcGhvci12aXJ0dWFsLXNlbnNvcnMn
LiAgV2hhdCBsaXR0bGUgSSBjb3VsZCB1bmRlcnN0YW5kIG9mIA0KPiByZWFkLW1hcmdpbi10ZW1w
J3Mgcm9sZSBzZWVtcyB0byBzb21ld2hhdCBvdmVybGFwIHdpdGggdGhhdCBlZmZvcnQuDQoNCkl0
IG1heSBiZSBwb3NzaWJsZSB0byBpbXBsZW1lbnQgdGhpcyB1c2luZyB0aGUgZnVuY3Rpb25hbGl0
eSBwcm92aWRlZCBieSBwaG9zcGhvci12aXJ0dWFsLXNlbnNvcnMsIGJ1dCB0aGUgcmVzdWx0aW5n
IGNvbmZpZ3VyYXRpb24gd291bGQgbGlrZWx5IGJlIGNvbXBsaWNhdGVkIGFuZCBkaWZmaWN1bHQg
dG8gbWFpbnRhaW4uIE1hcmdpbiBjYWxjdWxhdGlvbiBpcyBhIGNvbW1vbiBlbm91Z2ggdXNlIGNh
c2UgdGhhdCBJIHRoaW5rIGl0J3Mgd29ydGggaGF2aW5nIGEgZGVkaWNhdGVkIHNlcnZpY2UuDQoN
Cj4NCj4gT24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMTA6Mzc6MTRQTSAtMDcwMCwgSm9zaCBMZWhh
biB3cm90ZToNCj4gPiBZYXksIHRoaXMgaXMgZ3JlYXQgdG8gc2VlLiBJIGhhdmUgc29tZSBidWcg
Zml4ZXMgdG8gcmVhZC1tYXJnaW4tdGVtcCANCj4gPiBhbmQgd2FzIGp1c3Qgd29uZGVyaW5nIGhv
dyB0byBjb250cmlidXRlIHRoZW0uIEknbSByZWFsbHkgaG9waW5nIA0KPiA+IHRoaXMgbWFrZXMg
aXQgaW50byBPcGVuQk1DLiBJdCdzIHRoZSBwZXJmZWN0IHByZXByb2Nlc3NvciBmb3IgDQo+ID4g
cGhvc3Bob3ItcGlkLWNvbnRyb2wsIEkgaGF2ZSBmb3VuZC4NCj4gPg0KPiA+IEpvc2gNCj4gPg0K
PiA+IEpvc2ggTGVoYW4gfCBTb2Z0d2FyZSBFbmdpbmVlciB8IGtyZWxsYW5AZ29vZ2xlLmNvbSB8
ICsxIA0KPiA+IDY1MC03MzMtODk0MQ0KPiA+DQo+ID4NCj4gPg0KPiA+IE9uIFdlZCwgU2VwIDE2
LCAyMDIwIGF0IDc6MTUgUE0gQmVuamFtaW4gRmFpciANCj4gPiA8YmVuamFtaW5mYWlyQGdvb2ds
ZS5jb20+DQo+ID4gd3JvdGU6DQo+ID4NCj4gPiA+IE9uIFdlZCwgMTYgU2VwIDIwMjAgYXQgMDY6
MzEsIEZyYW4gSHN1ICjlvpDoqozorJkpIA0KPiA+ID4gPEZyYW4uSHN1QHF1YW50YXR3LmNvbT4N
Cj4gPiA+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBIaSBCcmFkLA0KPiA+ID4gPiAgICAgICAg
IFRoaXMgaXMgRnJhbiBmcm9tIFF1YW50YSBDb21wdXRlci4NCj4gPiA+ID4gUXVhbnRhIE9wZW5C
TUMgdGVhbSB3b3VsZCBsaWtlIHRvIHNoYXJlIHNvbWUgdXNlZnVsIHRvb2xzIHRvIHRoZSANCj4g
PiA+ID4gT3BlbkJNQw0KPiA+ID4gY29tbXVuaXR5Lg0KPiA+ID4gPiBTdWNoIGFzIHRoZSByZWFk
LW1hcmdpbi10ZW1wIGRhZW1vbiAoDQo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vcXVhbnRhLWJt
Yy9yZWFkLW1hcmdpbi10ZW1wKSwgd2UgYXJlIHVzaW5nIHRoaXMgDQo+ID4gPiBkYWVtb24gdG8g
ZmlsbCBzZW5zb3IgbWFyZ2luIHZhbHVlIHRvIFBJRCB0byBkbyBmYW4gY29udHJvbC4NCj4gPiA+
DQo+ID4gPiByZWFkLW1hcmdpbi10ZW1wIHNlZW1zIHVzZWZ1bCBhbmQgd2lkZWx5IGFwcGxpY2Fi
bGUgZW5vdWdoIHRoYXQgSSANCj4gPiA+IHRoaW5rIGl0J3Mgd29ydGggaGF2aW5nIGEgZGVkaWNh
dGVkIHJlcG8gZm9yIGl0Lg0KPiA+ID4NCj4gPiA+IFRoZSBxdWFudGEtbWlzYyByZXBvIGNvdWxk
IHBvc3NpYmx5IGJlIHVzZWQgZm9yIHNtYWxsZXIsIG1vcmUgDQo+ID4gPiBRdWFudGEtc3BlY2lm
aWMgdGhpbmdzLg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gV2Ugd291bGQgbGlrZSB0byBoYXZl
IGEgcmVwbyBuYW1lZCAicXVhbnRhLW1pc2MiIHVuZGVyIHRoZSANCj4gPiA+ID4gT3BlbkJNQw0K
PiA+ID4gZ2l0aHViLg0KPiA+ID4gPg0KPiA+ID4gPiBIZXJlIGlzIHRoZSBtYWludGFpbmVyIGxp
c3Q6DQo+ID4gPiA+IE06ICBCZW5qYW1pbiBGYWlyIDxiZW5qYW1pbmZhaXJAZ29vZ2xlLmNvbT4g
PGJlbmphbWluZmFpciE+DQo+ID4gPiA+IE06ICBCcmFuZG9uIEtpbSA8YnJhbmRvbmtpbUBnb29n
bGUuY29tPiA8YnJhbmRvbmshPg0KPiA+ID4gPiBNOiAgRnJhbiBIc3UgPGZyYW4uaHN1QHF1YW50
YXR3LmNvbT4gPGZyYW5oc3UhPg0KPiA+ID4gPiBNOiAgR2VvcmdlIEh1bmcgPGdlb3JnZS5odW5n
QHF1YW50YXR3LmNvbT4gPGdodW5nIT4NCj4gPiA+ID4gTTogIEJ1ZGR5IEh1YW5nIDxidWRkeS5o
dWFuZ0BxdWFudGF0dy5jb20+IDxidWRkeWh1bmFnIT4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmsg
eW91Lg0KPiA+ID4gPiBGcmFuIEhzdQ0KPiA+ID4gPiBFLU1haWwgOiBGcmFuLkhzdUBRdWFudGFU
Vy5jb20NCj4gPiA+ID4gVGVsOiArODg2LTMtMzI3LTIzNDUgRXh0OiAxNjkzNSA8Kzg4NiUyMDMl
MjAzMjclMjAyMzQ1Pg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4NCj4NCj4gLS0NCj4gUGF0cmlj
ayBXaWxsaWFtcw0K
