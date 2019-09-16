Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC41B3437
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 06:47:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WtyK1czTzF42F
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 14:47:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=155eeae03=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Wtxh75gQzF18l
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 14:46:44 +1000 (AEST)
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 16 Sep 2019 10:07:27 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 16 Sep
 2019 10:07:27 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%3]) with mapi id
 15.01.1713.004; Mon, 16 Sep 2019 10:07:27 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: RE: Package dbus-sensors build fail
Thread-Topic: Package dbus-sensors build fail
Thread-Index: AdVnu60zQYlxEWnWSTGQxlLcEDNbzv//4b+A//7HlsCABGUUAP/6KczQ
Date: Mon, 16 Sep 2019 02:07:27 +0000
Message-ID: <b55444b2e0e640c79bdb21415fb76590@quantatw.com>
References: <76010efa07d040d6abcc5a0b51740cc2@quantatw.com>
 <c8624ef8-6d81-7b8e-9f2a-060a92264add@linux.intel.com>
 <5c90ce87e4fc4cac991dcd6ddeaf7c51@quantatw.com>
 <95803393-67a5-120e-a519-3eecc98fe7b7@linux.intel.com>
In-Reply-To: <95803393-67a5-120e-a519-3eecc98fe7b7@linux.intel.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFtZXMgRmVpc3QgW21h
aWx0bzpqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb21dDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVt
YmVyIDEzLCAyMDE5IDEyOjIwIEFNDQo+IFRvOiBEdWtlIER1ICin+bK7ucUpIDxEdWtlLkR1QHF1
YW50YXR3LmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBS
ZTogUGFja2FnZSBkYnVzLXNlbnNvcnMgYnVpbGQgZmFpbA0KPiANCj4gT24gOS8xMC8xOSA3OjUz
IFBNLCBEdWtlIER1ICin+bK7ucUpIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFtZXMgRmVpc3QgW21haWx0bzpqYW1lcy5mZWlz
dEBsaW51eC5pbnRlbC5jb21dDQo+ID4+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxMCwgMjAx
OSAxMTo1MSBQTQ0KPiA+PiBUbzogRHVrZSBEdSAop/myu7nFKSA8RHVrZS5EdUBxdWFudGF0dy5j
b20+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFBhY2th
Z2UgZGJ1cy1zZW5zb3JzIGJ1aWxkIGZhaWwNCj4gPj4NCj4gPj4gT24gOS8xMC8xOSAyOjQxIEFN
LCBEdWtlIER1ICin+bK7ucUpIHdyb3RlOg0KPiA+Pj4gSGkgQWxsLA0KPiA+Pj4gICAgIEkgYml0
YmFrZSBwYWNrYWdlIGRidXMtc2Vuc29ycyBpbiBvcGVuYm1jIHJlcG8gZmQ0Zjc1MyBpcyBPSw0K
PiA+Pj4gWzFdLCBidXQNCj4gPj4gaW4gb3BlbmJtYyByZXBvIGM2ODM4OGYgaXMgZmFpbCBbMl0u
IEFuZCBJIGdvdCBzb21lIGVycm9ycyBzdWNoIGFzDQo+ID4+IGNvbXBpbGUgZXJyb3JzLCBmb3Ig
ZXhhbXBsZSwNCj4gPj4NCj4gdG1wL3dvcmsvYXJtdjdhLW9wZW5ibWMtbGludXgtZ251ZWFiaS9k
YnVzLXNlbnNvcnMvMC4xK2dpdEFVVE9JTkMrMzUNCj4gPj4gNDZhZGI5MmItcjAvcmVjaXBlLXN5
c3Jvb3QvdXNyL2luY2x1ZGUvYysrLzkuMi4wL2NvbXBsZXg6MTk1NTo4OiBlcnJvcjoNCj4gPj4g
ZXhwZWN0ZWQgdW5xdWFsaWZpZWQtaWQgYmVmb3JlICduYW1lc3BhY2UnDQo+ID4+PiB8ICAxOTU1
IHwgaW5saW5lIG5hbWVzcGFjZSBsaXRlcmFscyB7DQo+ID4+PiB8ICAgICAgIHwgICAgICAgIF5+
fn5+fn5+fg0KPiA+Pj4gfCBuaW5qYTogYnVpbGQgc3RvcHBlZDogc3ViY29tbWFuZCBmYWlsZWQu
DQo+ID4+Pg0KPiA+Pj4gICAgIERvIEkgbG9zZSBzb21lIHNldHRpbmdzIGZvciBkYnVzLXNlbnNv
cnMgcGFja2FnZSwgY291bGQgeW91IGdpdmUNCj4gPj4+IG1lDQo+ID4+IHNvbWUgc3VnZ2VzdGlv
bnMsIHRoYW5rcy4NCj4gPj4+DQo+ID4+PiBbMV0NCj4gPj4+DQo+ID4+DQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvY29tbWl0L2ZkNGY3NTM3ZWJlZWU0OTRkNGRkOTFiDQo+
ID4+IDc0MzhlDQo+ID4+PiBkOTUxMmVlZGEzMDMNCj4gPj4+DQo+ID4+PiBbMl0NCj4gPj4+DQo+
ID4+DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvY29tbWl0L2M2ODM4OGZj
Y2I4YzBiNWJmNGQ2YjhlZmYNCj4gPj4gZjkxDQo+ID4+PiAyMDM3OTZiZTk4YjINCj4gPj4NCj4g
Pj4gQ2FuIHlvdSBwcm92ZSB0aGUgY29tbWl0cyBvZiBkYnVzLXNlbnNvcnMgeW91IGFyZSB1c2lu
Zz8gVGhpcyBpc3N1ZQ0KPiA+PiB3YXMgZml4ZWQgcXVpdGUgc29tZSB0aW1lIGFnbyBJIGJlbGll
dmUuIEkgd291bGQgc3VnZ2VzdCB0cnlpbmcgdGhlDQo+ID4+IGxhdGVzdCB2ZXJzaW9uIG9mIGRi
dXMtc2Vuc29ycy4NCj4gPg0KPiA+IEhpIEphbWVzLA0KPiA+ICAgIFRoYW5rcyBmb3IgeW91ciBz
dWdnZXN0aW9uLCBJIHVzZSB0aGUgbGF0ZXN0IGNvbW1pdCA3ZmExN2M0OCBvZg0KPiBkYnVzLXNl
bnNvcnMsIGJ1dCBzdGlsbCBnZXQgdGhlIHNhbWUgZXJyb3IgYXMgZm9sbG93cyA6DQo+ID4NCj4g
dG1wL3dvcmsvYXJtdjdhLW9wZW5ibWMtbGludXgtZ251ZWFiaS9kYnVzLXNlbnNvcnMvMC4xK2dp
dEFVVE9JTkMrN2ZhDQo+IDE3YzQ4ODAtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1ZGUvYysr
LzkuMi4wL2NvbXBsZXg6MTk1NTo4OiBlcnJvcjoNCj4gZXhwZWN0ZWQgdW5xdWFsaWZpZWQtaWQg
YmVmb3JlICduYW1lc3BhY2UnDQo+ID4gICAxOTU1IHwgaW5saW5lIG5hbWVzcGFjZSBsaXRlcmFs
cyB7DQo+ID4gICAgICAgIHwgICAgICAgIF5+fn5+fn5+fg0KPiA+IG5pbmphOiBidWlsZCBzdG9w
cGVkOiBzdWJjb21tYW5kIGZhaWxlZC4NCj4gPiBXQVJOSU5HOiBleGl0IGNvZGUgMSBmcm9tIGEg
c2hlbGwgY29tbWFuZC4NCj4gPg0KPiA+IEVSUk9SOiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVk
IGluOg0KPiA+DQo+IHRtcC93b3JrL2FybXY3YS1vcGVuYm1jLWxpbnV4LWdudWVhYmkvZGJ1cy1z
ZW5zb3JzLzAuMStnaXRBVVRPSU5DKzdmYQ0KPiAxDQo+ID4gN2M0ODgwLXIwL3RlbXAvbG9nLmRv
X2NvbXBpbGUuNjkwMA0KPiA+DQo+ID4gRVJST1I6IFRhc2sNCj4gKG9wZW5ibWMvbWV0YS1waG9z
cGhvci9yZWNpcGVzLXBob3NwaG9yL3NlbnNvcnMvZGJ1cy1zZW5zb3JzX2dpdC5iYjpkbw0KPiBf
Y29tcGlsZSkgZmFpbGVkIHdpdGggZXhpdCBjb2RlICcxJw0KPiANCj4gSSdtIGJhc2VkIG9mZiBv
Zg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2NvbW1pdC85ZDIyNzA1MmJm
NTYyYWZkNGQ1NDdmYmMNCj4gMTdhY2UzMjAyYzVjZjgwYw0KPiBhbmQgaXQgYnVpbGRzIGZvciBt
ZS4gSXMgdGhlIHRhcmdldCB5b3UncmUgYnVpbGRpbmcgZm9yIHVwc3RyZWFtPyBDb3VsZCBiZQ0K
PiBzb21lIGNvbXBpbGVyIGRpZmZlcmVuY2UuIA0KDQpIaSBKYW1lcywNCiAgU29ycnkgZm9yIHRo
ZSBkZWxheSBpbiByZXNwb25kaW5nIHRvIHlvdXIgbWFpbC4gSSBoYXZlIHVwZ3JhZGVkIHRoaXMg
YmFzZWQgb2YgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9jb21taXQvOWQyMjcw
NTJiZjU2MmFmZDRkNTQ3ZmJjMTdhY2UzMjAyYzVjZjgwYyB0byBidWlsZCBzdWNjZXNzZnVsbHku
IFRoYW5rcyBmb3IgeW91ciByZXBseSwgc2luY2VyZWx5Lg0KDQo+IA0KPiANCj4gDQo+IA0KPiA+
DQo+ID4+Pg0KPiA+Pj4gVGhhbmtzLg0KPiA+Pj4gRHVrZSwgRHUNCj4gPj4+DQo=
