Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441DAF48C
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 04:53:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Smgg5jtczF1r1
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 12:53:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=1509d2f40=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46Smg71WVRzF1nW
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 12:53:18 +1000 (AEST)
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 11 Sep 2019 10:53:15 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 11 Sep
 2019 10:53:15 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%3]) with mapi id
 15.01.1713.004; Wed, 11 Sep 2019 10:53:15 +0800
From: =?big5?B?RHVrZSBEdSAop/myu7nFKQ==?= <Duke.Du@quantatw.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: RE: Package dbus-sensors build fail
Thread-Topic: Package dbus-sensors build fail
Thread-Index: AdVnu60zQYlxEWnWSTGQxlLcEDNbzv//4b+A//7HlsA=
Date: Wed, 11 Sep 2019 02:53:15 +0000
Message-ID: <5c90ce87e4fc4cac991dcd6ddeaf7c51@quantatw.com>
References: <76010efa07d040d6abcc5a0b51740cc2@quantatw.com>
 <c8624ef8-6d81-7b8e-9f2a-060a92264add@linux.intel.com>
In-Reply-To: <c8624ef8-6d81-7b8e-9f2a-060a92264add@linux.intel.com>
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
aWx0bzpqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb21dDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRl
bWJlciAxMCwgMjAxOSAxMTo1MSBQTQ0KPiBUbzogRHVrZSBEdSAop/myu7nFKSA8RHVrZS5EdUBx
dWFudGF0dy5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFBh
Y2thZ2UgZGJ1cy1zZW5zb3JzIGJ1aWxkIGZhaWwNCj4gDQo+IE9uIDkvMTAvMTkgMjo0MSBBTSwg
RHVrZSBEdSAop/myu7nFKSB3cm90ZToNCj4gPiBIaSBBbGwsDQo+ID4gICAgSSBiaXRiYWtlIHBh
Y2thZ2UgZGJ1cy1zZW5zb3JzIGluIG9wZW5ibWMgcmVwbyBmZDRmNzUzIGlzIE9LIFsxXSwgYnV0
DQo+IGluIG9wZW5ibWMgcmVwbyBjNjgzODhmIGlzIGZhaWwgWzJdLiBBbmQgSSBnb3Qgc29tZSBl
cnJvcnMgc3VjaCBhcyBjb21waWxlDQo+IGVycm9ycywgZm9yIGV4YW1wbGUsDQo+IHRtcC93b3Jr
L2FybXY3YS1vcGVuYm1jLWxpbnV4LWdudWVhYmkvZGJ1cy1zZW5zb3JzLzAuMStnaXRBVVRPSU5D
KzM1DQo+IDQ2YWRiOTJiLXIwL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy85LjIuMC9j
b21wbGV4OjE5NTU6ODogZXJyb3I6DQo+IGV4cGVjdGVkIHVucXVhbGlmaWVkLWlkIGJlZm9yZSAn
bmFtZXNwYWNlJw0KPiA+IHwgIDE5NTUgfCBpbmxpbmUgbmFtZXNwYWNlIGxpdGVyYWxzIHsNCj4g
PiB8ICAgICAgIHwgICAgICAgIF5+fn5+fn5+fg0KPiA+IHwgbmluamE6IGJ1aWxkIHN0b3BwZWQ6
IHN1YmNvbW1hbmQgZmFpbGVkLg0KPiA+DQo+ID4gICAgRG8gSSBsb3NlIHNvbWUgc2V0dGluZ3Mg
Zm9yIGRidXMtc2Vuc29ycyBwYWNrYWdlLCBjb3VsZCB5b3UgZ2l2ZSBtZQ0KPiBzb21lIHN1Z2dl
c3Rpb25zLCB0aGFua3MuDQo+ID4NCj4gPiBbMV0NCj4gPg0KPiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9vcGVuYm1jL2NvbW1pdC9mZDRmNzUzN2ViZWVlNDk0ZDRkZDkxYg0KPiA3NDM4ZQ0K
PiA+IGQ5NTEyZWVkYTMwMw0KPiA+DQo+ID4gWzJdDQo+ID4NCj4gaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvb3BlbmJtYy9jb21taXQvYzY4Mzg4ZmNjYjhjMGI1YmY0ZDZiOGVmZg0KPiBmOTEN
Cj4gPiAyMDM3OTZiZTk4YjINCj4gDQo+IENhbiB5b3UgcHJvdmUgdGhlIGNvbW1pdHMgb2YgZGJ1
cy1zZW5zb3JzIHlvdSBhcmUgdXNpbmc/IFRoaXMgaXNzdWUgd2FzDQo+IGZpeGVkIHF1aXRlIHNv
bWUgdGltZSBhZ28gSSBiZWxpZXZlLiBJIHdvdWxkIHN1Z2dlc3QgdHJ5aW5nIHRoZSBsYXRlc3Qg
dmVyc2lvbg0KPiBvZiBkYnVzLXNlbnNvcnMuDQoNCkhpIEphbWVzLA0KICBUaGFua3MgZm9yIHlv
dXIgc3VnZ2VzdGlvbiwgSSB1c2UgdGhlIGxhdGVzdCBjb21taXQgN2ZhMTdjNDggb2YgZGJ1cy1z
ZW5zb3JzLCBidXQgc3RpbGwgZ2V0IHRoZSBzYW1lIGVycm9yIGFzIGZvbGxvd3MgOiANCiAgICAg
ICB0bXAvd29yay9hcm12N2Etb3BlbmJtYy1saW51eC1nbnVlYWJpL2RidXMtc2Vuc29ycy8wLjEr
Z2l0QVVUT0lOQys3ZmExN2M0ODgwLXIwL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRlL2MrKy85
LjIuMC9jb21wbGV4OjE5NTU6ODogZXJyb3I6IGV4cGVjdGVkIHVucXVhbGlmaWVkLWlkIGJlZm9y
ZSAnbmFtZXNwYWNlJw0KIDE5NTUgfCBpbmxpbmUgbmFtZXNwYWNlIGxpdGVyYWxzIHsNCiAgICAg
IHwgICAgICAgIF5+fn5+fn5+fg0KbmluamE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFp
bGVkLg0KV0FSTklORzogZXhpdCBjb2RlIDEgZnJvbSBhIHNoZWxsIGNvbW1hbmQuDQoNCkVSUk9S
OiBMb2dmaWxlIG9mIGZhaWx1cmUgc3RvcmVkIGluOiB0bXAvd29yay9hcm12N2Etb3BlbmJtYy1s
aW51eC1nbnVlYWJpL2RidXMtc2Vuc29ycy8wLjErZ2l0QVVUT0lOQys3ZmExN2M0ODgwLXIwL3Rl
bXAvbG9nLmRvX2NvbXBpbGUuNjkwMA0KDQpFUlJPUjogVGFzayAob3BlbmJtYy9tZXRhLXBob3Nw
aG9yL3JlY2lwZXMtcGhvc3Bob3Ivc2Vuc29ycy9kYnVzLXNlbnNvcnNfZ2l0LmJiOmRvX2NvbXBp
bGUpIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScNCg0KPiA+DQo+ID4gVGhhbmtzLg0KPiA+IER1
a2UsIER1DQo+ID4NCg==
