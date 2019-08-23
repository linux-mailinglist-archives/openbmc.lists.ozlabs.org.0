Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D073D9AA67
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 10:32:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FF5M10bfzDrL6
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 18:32:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=131ce2f92=hank.liou@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Fri, 23 Aug 2019 18:31:48 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46FF4N66pfzDrgw
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 18:31:47 +1000 (AEST)
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx02.quantatw.com with ESMTP; 23 Aug 2019 16:30:33 +0800
Received: from mailbx09.quanta.corp (10.243.91.106) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 23 Aug
 2019 16:30:32 +0800
Received: from mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81]) by
 mailbx09.quanta.corp ([fe80::c501:1c2b:62fc:dd81%6]) with mapi id
 15.01.1713.004; Fri, 23 Aug 2019 16:30:32 +0800
From: =?big5?B?SGFuayBMaW91ICi8Qq7Kv6sp?= <Hank.Liou@quantatw.com>
To: Patrick Venture <venture@google.com>, James Feist
 <james.feist@linux.intel.com>
Subject: RE: [phosphor-pid-control] scaling issue
Thread-Topic: [phosphor-pid-control] scaling issue
Thread-Index: AQHVV/XbtwEoqXVk+kGbiKtv2uj0UqcFJGgAgAE9VwA=
Date: Fri, 23 Aug 2019 08:30:32 +0000
Message-ID: <369926533c3e448c9d1a0d28391fd688@quantatw.com>
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
In-Reply-To: <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
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

SGkgUGF0cmljaywNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUGF0cmlj
ayBWZW50dXJlIFttYWlsdG86dmVudHVyZUBnb29nbGUuY29tXQ0KPlNlbnQ6IFdlZG5lc2RheSwg
QXVndXN0IDIxLCAyMDE5IDEwOjMyIFBNDQo+VG86IEhhbmsgTGlvdSAovEKuyr+rKSA8SGFuay5M
aW91QHF1YW50YXR3LmNvbT47IEphbWVzIEZlaXN0DQo+PGphbWVzLmZlaXN0QGxpbnV4LmludGVs
LmNvbT4NCj5DYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+U3ViamVjdDogUmU6IFtwaG9z
cGhvci1waWQtY29udHJvbF0gc2NhbGluZyBpc3N1ZQ0KPg0KPk9uIFdlZCwgQXVnIDIxLCAyMDE5
IGF0IDE6MTEgQU0gSGFuayBMaW91ICi8Qq7Kv6spDQo+PEhhbmsuTGlvdUBxdWFudGF0dy5jb20+
IHdyb3RlOg0KPj4NCj4+IEhpIEFsbCwNCj4+DQo+Pg0KPj4gQWZ0ZXIgY29tbWl0IFsxXSwgSSBm
b3VuZCBteSB0ZW1wIHNlbnNvciByZWFkaW5nIHdvdWxkIGJlIHJlLXNjYWxlZCBieQ0KPm11bHRp
cGx5aW5nIDEgb3ZlciAyNTUsIG1ha2luZyB0ZW1wZXJhdHVyZSBpbnRvIHVuZmFtaWxpYXIgdW5p
dC4gQWxzbyB0aGUgZmFuDQo+cnBtIHJlYWRpbmcgd291bGQgbGllIGluIFswLDFdIGludGVydmFs
LCBsZXR0aW5nIHRoZSBmYW4gaW5wdXQgdG8gYmUgMCAoc2luY2UgdGhlDQo+aW5wdXQgdmFsdWUg
b2YgZmFuIGlzIGZyb20gYW4gaW50ZWdlciBhcnJheSBbMl0pLiBBcmUgdGhlc2Ugbm9ybWFsIGJl
aGF2aW9ycz8NCj5PciBkbyBJIG1pc3Mgc29tZXRoaW5nPw0KPg0KPkFyZSB5b3UgdXNpbmcgZGJ1
cyBjb25maWd1cmF0aW9uIG9yIGpzb24/ICBJZiBqc29uLCBjYW4geW91IGF0dGFjaCB5b3VyIGNv
bmZpZy4NCj5TaW5jZSB5b3UncmUgc2F5aW5nIGl0IHdhcyB3b3JraW5nIGFuZCBub3cgaXNuJ3Qs
IEknbSBhc3N1bWluZyB0aGVyZSdzDQo+c29tZXRoaW5nIGFib3V0IHRoZSBjb25maWcgYmVpbmcg
dHJlYXRlZCBkaWZmZXJlbnRseSB3aXRoIHRoZSBjb2RlIGNoYW5nZXMgaW4NCj5hbiB1bmV4cGVj
dGVkIHdheS4NCg0KSSBmb3VuZCBwaWQgY29udHJvbCB3aWxsIGZpcnN0IHJlYWQgbWluIGFuZCBt
YXggZnJvbSBkYnVzIGFuZCB0aGVuIChiZWZvcmUgY29tbWl0IFsxXSkgcmV2aXNlIHRoZW0gaWYg
DQoNCmluZm8tPm1pbiAhPSBjb25mOjppbmhlcml0VmFsdWVGcm9tRGJ1cyAoaW4gZGJ1cy9kYnVz
cGFzc2l2ZS5jcHApDQoNCkFmdGVyIHZhbHVlIGluaXRpYWxpemF0aW9uLCB0aGUgbWluIGFuZCBt
YXggd291bGQgYmUgdGhlIG9uZXMgaW4ganNvbiBmaWxlIChKc29uIGZpbGUgWzNdKS4gSG93ZXZl
ciwgYWZ0ZXIgY29tbWl0IFsxXSB0aGUgbWluIGFuZCBtYXggdmFsdWVzIG9mIGNvbmZpZyB3b3Vs
ZCBub3QgYmUgZmVkIGludG8gdGhlIGZhbiBjb250cm9sIHByb2Nlc3MuIFRoZSBzY2FsaW5nIGlz
c3VlIGlzIG9yaWdpbmF0ZWQgZnJvbSBjb21taXQgWzRdIHdpdGggdGhlIGFpbSB0byB0cmVhdCBm
YW4gcnBtIGFzIHBlcmNlbnRhZ2UuIEl0IHNlZW1zIHRoYXQgY29tbWl0IFsxXSB1bmV4cGVjdGVk
bHkgYWZmZWN0cyB0ZW1wIHNlbnNvcnMgaW4gdGhlIHNlbnNlIHRoYXQgdGhlIHRlbXAgaXMgdGhl
IGludGVnZXIgcmVhZGluZyBub3QgcGVyY2VudGFnZS4gQmVmb3JlIGNvbW1pdCBbMV0sIGl0IHdv
dWxkIG5vdCByZS1zY2FsZSB0aGUgdGVtcCByZWFkaW5nIHNpbmNlIG15IG1pbiBhbmQgbWF4IGFy
ZSAwIFs2XS4NCg0KDQoNClRoZXJlIGlzIGFub3RoZXIgaXNzdWUgd2l0aCBjb21taXQgWzFdLiBO
b3cgdGhlIGZhbiBycG0gd291bGQgYmUgc29tZXRoaW5nIGxpa2UNCg0KMTUwMCAvIDIwMDAwID0g
MC4wNzUNCg0Kd2hlcmUgcnBtIG1heCAyMDAwMCBpcyBmcm9tIGRidXMuIEhvd2V2ZXIgdGhlIGZh
biBpbnB1dCBmdW5jdGlvbiB3b3VsZCB0cmFuc2ZlciBkb3VibGUgaW50byBpbnQsIHdoaWNoIGlz
IDAgZm9yIDAuMDc1IChzZWUgWzVdKS4gSGVuY2UgdGhlIGZhbiBpbnB1dCBpcyAwIG5vdCBwZXJj
ZW50YWdlLiBJcyB0aGVyZSBzb21ldGhpbmcgd3Jvbmc/DQoNClsxXSBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy9waG9zcGhvci1waWQtY29udHJvbC9jb21taXQvZmMyZTgwM2Y1ZDkyNTY5NDRl
MThjN2M4NzhhNDQxNjA2YjFmMTIxYw0KWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bo
b3NwaG9yLXBpZC1jb250cm9sL2Jsb2IvYTdlYzgzNTBkMTdiNzAxNTNjZWJlNjY2ZDNmYmU4OGJk
ZGQwMmExYS9waWQvZmFuY29udHJvbGxlci5jcHAjTDg2DQpbM10NCiAgICAgICB7DQogICAgICAg
ICAgICAibmFtZSI6ICJmYW4xIiwNCiAgICAgICAgICAgICJ0eXBlIjogImZhbiIsDQogICAgICAg
ICAgICAicmVhZFBhdGgiOiAiL3N5cy9jbGFzcy9od21vbi9od21vbjEvZmFuMV9pbnB1dCIsDQog
ICAgICAgICAgICAid3JpdGVQYXRoIjogIi9zeXMvY2xhc3MvaHdtb24vaHdtb24xL3B3bTEiLA0K
ICAgICAgICAgICAgIm1pbiI6IDAsDQogICAgICAgICAgICAibWF4IjogMjU1DQogICAgICAgIH0s
DQogICAgICAgIHsNCiAgICAgICAgICAgICJuYW1lIjogInRlbXAxIiwNCiAgICAgICAgICAgICJ0
eXBlIjogInRlbXAiLA0KICAgICAgICAgICAgInJlYWRQYXRoIjogIi94eXovb3BlbmJtY19wcm9q
ZWN0L3NlbnNvcnMvdGVtcGVyYXR1cmUvdGVtcDEiLA0KICAgICAgICAgICAgIndyaXRlUGF0aCI6
ICIiLA0KICAgICAgICAgICAgIm1pbiI6IDAsDQogICAgICAgICAgICAibWF4IjogMA0KICAgICAg
ICB9DQpbNF0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItcGlkLWNvbnRyb2wv
Y29tbWl0Lzc1ZWI3NjlkMzUxNDM0NTQ3ODk5MTg2ZjczZmY3MGFlMDBkNzkzNGENCls1XSBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1waWQtY29udHJvbC9ibG9iL2E3ZWM4MzUw
ZDE3YjcwMTUzY2ViZTY2NmQzZmJlODhiZGRkMDJhMWEvcGlkL2ZhbmNvbnRyb2xsZXIuY3BwI0w2
NA0KWzZdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLXBpZC1jb250cm9sL2Js
b2IvYTdlYzgzNTBkMTdiNzAxNTNjZWJlNjY2ZDNmYmU4OGJkZGQwMmExYS9kYnVzL2RidXNwYXNz
aXZlLmNwcCNMMTU4DQoNCj4NCj4+DQo+Pg0KPj4gWzFdDQo+PiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9waG9zcGhvci1waWQtDQo+Y29udHJvbC9jb21taXQvZmMyZTgwM2Y1ZDkyNTY5DQo+
PiA0NGUxOGM3Yzg3OGE0NDE2MDZiMWYxMjFjDQo+Pg0KPj4gWzJdDQo+PiBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9waG9zcGhvci1waWQtDQo+Y29udHJvbC9ibG9iL2E3ZWM4MzUwZDE3Yjcw
MTUzDQo+PiBjZWJlNjY2ZDNmYmU4OGJkZGQwMmExYS9waWQvZmFuY29udHJvbGxlci5jcHAjTDg2
DQo+Pg0KPj4NCj4+IFRoYW5rcywNCj4+DQo+Pg0KPj4gSGFuayBMaW91DQo+Pg0KPj4gUXVhbnRh
IENvbXB1dGVyIEluYy4NCj4+DQo+Pg0KDQpTaW5jZXJlbHksDQpIYW5rDQo=
