Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B8634F9
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 13:34:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jgFR4BXXzDqW1
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 21:34:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=0862d44c2=duke.du@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 45jgDr2jXfzDqQq
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 21:33:26 +1000 (AEST)
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 09 Jul 2019 19:33:24 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 9 Jul 2019
 19:33:22 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Tue, 9 Jul 2019 19:33:22 +0800
From: =?utf-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Subject: RE: Could phosphor-hwmon support peci-sensors
Thread-Topic: Could phosphor-hwmon support peci-sensors
Thread-Index: AdU1iSUCJhGDbsKEQ6GlW/GsUn/vg///03mAgAAJ7QCAAIKsAP//ebqA
Date: Tue, 9 Jul 2019 11:33:22 +0000
Message-ID: <07706945fce045eb97eb045edb5cdbf2@quantatw.com>
References: <79563bbd625f412ab4695049df92a0bd@quantatw.com>
 <20190708175241.nem73wmy27itc72p@thinkpad.dyn.fuzziesquirrel.com>
 <b6bc00d5-e093-c9c1-0456-1e3f02ce6059@linux.intel.com>
 <CAGaXSwZLrsg6WfKdfdWd4FFu4oLe=dj1rZM+jWmBiwf6+niPeA@mail.gmail.com>
In-Reply-To: <CAGaXSwZLrsg6WfKdfdWd4FFu4oLe=dj1rZM+jWmBiwf6+niPeA@mail.gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24746.005
x-tm-as-result: No--4.188700-0.000000-31
x-tm-as-matchedid: 140026-150567-700225-703140-701090-703503-704706-705271-7
 04708-704381-704585-704225-705244-701029-106230-705220-704720-701480-700244
 -704224-701632-704074-703381-702754-702481-700379-139703-703957-148004-1481
 33-20016-42000-42003-63
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

SGkgQnJhZCAmIEphbWVzLA0KICBUaGFua3MgZm9yIHlvdXIgcmVwbHksIHRoYXQncyByZWFsbHkg
aGVscGZ1bC4gDQoNClRoYW5rcy4gDQpEdWtlLCBEdQ0KLS0tLS0tLS0tLQ0K5a+E5Lu26ICF77ya
IER1a2UgRHUgKOadnOelpeWYiSkgPG1haWx0bzpEdWtlLkR1QHF1YW50YXR3LmNvbT4NCkRhdGU6
IDIwMTnlubQ35pyIOOaXpSDpgLHkuIAg5LiL5Y2IODozNA0KVG86IG1haWx0bzpvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcgPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQoNCg0KSGkg
QWxsLA0KwqAgSSBoYXZlIHNvbWUgcHJvYmxlbXMgd2l0aCBwaG9zcGhvci1od21vbi4gDQpDb3Vs
ZCBwYWNrYWdlIHBob3NwaG9yLWh3bW9uIHN1cHBvcnRzIHBlY2kgc2Vuc29ycyBzdWNoIGFzIGNw
dSBhbmQgZGltbSB0ZW1wYXR1cmVzID8gDQpJZiB5ZXMsIGNvdWxkIHlvdSBnaXZlIG1lIHNvbWUg
aGludHMgdGhhdCBob3cgZG8gSSB3cml0ZSBjb25maWd1cmF0aW9uIGZvciBwZWNpIHNlbnNvcnMs
IHBsZWFzZSA6KS4gDQoNClRoYW5rcy4gDQpEdWtlLCBEdQ0KDQotLS0tLS0tLS0tDQrlr4Tku7bo
gIXvvJogQnJhZCBCaXNob3AgPG1haWx0bzpicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQpE
YXRlOiAyMDE55bm0N+aciDnml6Ug6YCx5LqMIOS4iuWNiDE6NTQNClRvOiBEdWtlIER1ICjmnZzn
paXlmIkpIDxtYWlsdG86RHVrZS5EdUBxdWFudGF0dy5jb20+DQpDYzogbWFpbHRvOm9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZyA8bWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCg0KDQpw
aG9zcGhvci1od21vbiBzaG91bGQgd29yayB3aXRoIGFueXRoaW5nIHRoYXQgaW1wbGVtZW50cyB0
aGUgaHdtb24gQUJJLsKgIA0KU28gSSB0aGluayB0byBtYWtlIFBFQ0kgc2Vuc29ycyB3b3JrIHdp
dGggcGhvc3Bob3ItaHdtb24sIHlvdSBuZWVkIGh3bW9uIA0KZHJpdmVycyBmb3IgUEVDSSBzZW5z
b3JzLsKgIEkgZG9uJ3Qga25vdyBpZiBhbnlvbmUgaXMgd29ya2luZyBvbiB0aGF0Lg0KDQpJIHN1
c3BlY3QgdGhlIG90aGVyIHNlbnNvciBhcHBsaWNhdGlvbiAtIGRidXMtc2Vuc29ycyBzdXBwb3J0
cyBQRUNJIA0KanVzdCBmaW5lLsKgIEJ1dCBJIGRvbid0IGtub3cgaG93IGl0IHdvcmtzLCBpZiBp
dCBjYW4gYmUgdXNlZCB3aXRob3V0IA0KZW50aXR5IG1hbmFnZXIswqAgYW5kL29yIGlmIGl0IGNh
biBiZSBydW4gaW4gcGFyYWxsZWwgd2l0aCANCnBob3NwaG9yLWh3bW9uLg0KDQotLS0tLS0tLS0t
DQrlr4Tku7bogIXvvJogSmFtZXMgRmVpc3QgPG1haWx0bzpqYW1lcy5mZWlzdEBsaW51eC5pbnRl
bC5jb20+DQpEYXRlOiAyMDE55bm0N+aciDnml6Ug6YCx5LqMIOS4iuWNiDI6MjgNClRvOiBCcmFk
IEJpc2hvcCA8bWFpbHRvOmJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4sIER1a2UgRHUgKOad
nOelpeWYiSkgPG1haWx0bzpEdWtlLkR1QHF1YW50YXR3LmNvbT4NCkNjOiBtYWlsdG86b3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnIDxtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPiwgSmFl
IEh5dW4gWW9vIDxtYWlsdG86amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCg0KDQorIEph
ZSwgQ1BVIFNlbnNvciBBdXRob3INCg0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZGJ1cy1z
ZW5zb3JzL2Jsb2IvbWFzdGVyL3NyYy9DUFVTZW5zb3JNYWluLmNwcA0KDQpDUFUgc2Vuc29yIGN1
cnJlbnRseSBzdXBwb3J0cyBQRUNJIHNlbnNvcnMgDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9kYnVzLXNlbnNvcnMvYmxvYi9tYXN0ZXIvc3JjL0NQVVNlbnNvci5jcHANCg0KaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvZW50aXR5LW1hbmFnZXIvYmxvYi9mODYxZGE4OWVkMDNmOWVjNTU2
YzVlZDZhYzgxOTk4OGMwYzFmNDk4L2NvbmZpZ3VyYXRpb25zL1dGVCUyMEJhc2Vib2FyZC5qc29u
I0wyMTgxDQoNCkl0IGRvZXMgcmVxdWlyZSBlbnRpdHktbWFuYWdlciBjdXJyZW50bHksIGJ1dCBp
dCBjb3VsZCBiZSBydW4gaW4gDQpwYXJhbGxlbCB3aXRoIHBob3NwaG9yLWh3bW9uLg0KDQotSmFt
ZXMNCg0K
