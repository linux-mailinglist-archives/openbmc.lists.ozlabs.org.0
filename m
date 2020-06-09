Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 746951F37E9
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 12:20:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h5jx4YJXzDqcN
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 20:20:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=42269728b=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49h5hw30z9zDqbq
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 20:19:55 +1000 (AEST)
IronPort-SDR: mZTp2wNUS9jFZkoQddE3Ewvngph1X9OaNhjORlqf9nZIqUtgV9InvXwtF4RGjvUSheOjwWeU9/
 cEP04AQnn8Pg==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 09 Jun 2020 18:19:52 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 9 Jun 2020
 18:19:50 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Tue, 9 Jun 2020 18:19:50 +0800
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: George Keishing <gkeishin@in.ibm.com>
Subject: RE:  bmc code update with automation/redfish
Thread-Topic: bmc code update with automation/redfish
Thread-Index: AdY6R4EZk1n8pcQvT7+icYI5vE1vvgA3mhSAAMJtltA=
Date: Tue, 9 Jun 2020 10:19:50 +0000
Message-ID: <8b32f9589c3647b1a0e04c55dd6c7376@quantatw.com>
References: <77541f88b7b5412597769fe344682576@quantatw.com>
 <OF4A4EE882.AAF85866-ON0025857E.006581B1-6525857E.0066B3CB@notes.na.collabserv.com>
In-Reply-To: <OF4A4EE882.AAF85866-ON0025857E.006581B1-6525857E.0066B3CB@notes.na.collabserv.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 8A7AF50E1796A75E86DD7EFA74E86FB369E4D63EFA465F7DABA9C0912DA102AA2000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "asmithakarun@gmail.com" <asmithakarun@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgR2VvcmdlLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXBseSwNCg0KPiANCj4gCSMoVVRDKSAy
MDIwLzA1LzE0IDA3OjI1OjUyLjI1OTQ3NSAtIDAuODM1ODc0IC0gRXhlY3V0aW5nOg0KPiBwYXRj
aCgnL3JlZGZpc2gvdjEvVXBkYXRlU2VydmljZScsIGJvZHk9InsnSHR0cFB1c2hVcmlPcHRpb25z
JyA6DQo+IHsnSHR0cFB1c2hVcmlBcHBseVRpbWUnIDogeydBcHBseVQuLi4NCj4gCSMoVVRDKSAy
MDIwLzA1LzE0IDA3OjI1OjUyLjMxNTExOCAtIDAuMDU1NjQ0IC0gRXhlY3V0aW5nOg0KPiBnZXQo
Jy9yZWRmaXNoL3YxL1VwZGF0ZVNlcnZpY2UnKQ0KPiAJYXBwbHlfdGltZTogTm9uZQ0KPiAJIyhV
VEMpIDIwMjAvMDUvMTQgMDc6MjY6MTMuNjQzNDUwIC0gMjEuMzI4MzMxIC0gSXNzdWluZzogY2QN
Cj4gL3RtcC9pbWFnZXMvOyBzdGF0IC1jICclWSAlbicgKiB8IHNvcnQgLWsxLDFuciB8IGhlYWQg
LW4gMQ0KDQpJIHN0dWNrIGluIGhlcmUsIHJvYm90IGNhbid0IGZpbmQgYW55dGhpbmcgaW4gL3Rt
cC9pbWFnZXMuDQoNCkkndmUgdHJhY2tlZCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBzdGVw
cyBvZiBSZXN0IGFuZCBSZWRmaXNoLg0KUmVzdCB1cGxvYWQgdGhlIGltYWdlIGFuZCB3YWl0IGZv
ciBhbm90aGVyIHNpZ25hbCB0byBhY3RpdmUgaXQsDQp3aGlsZSBSZWRmaXNoIHVwbG9hZCB0aGUg
aW1hZ2UgYW5kIGFjdGl2ZSBpdCBhdCB0aGUgc2FtZSB0aW1lLg0KSG93ZXZlciByb2JvdCBpcyB1
c2luZyByZWRmaXNoIGNtZC4NClNlZToNCiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2Nz
L2Jsb2IvbWFzdGVyL2NvZGUtdXBkYXRlL2NvZGUtdXBkYXRlLm1kIChzdGVwIDImNCkNCiBodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2Rlc2lnbnMvZmlybXdhcmUt
dXBkYXRlLW92ZXItcmVkZmlzaC5tZCN1cGRhdGUtYW4taW1hZ2UgIA0KDQpTdGVwICJhY3RpdmUg
aW1hZ2UiIHdpbGwgY29weSA0IGltYWdlIGZpbGVzIHRvIC9ydW4vaW5pdHJhbWZzIGFuZCBkZWxl
dGUgdGhlIGltYWdlIGZvbGRlciAvdG1wL2ltYWdlcy9jNzhlNjc0YSBiZWZvcmUgcmV0dXJuaW5n
IGh0dHAgcmVzcG9uc2UuIA0KQW5kIHJvYm90IHdpbGwgY2hlY2sgaW1hZ2UncyBJRCByaWdodCBh
ZnRlciBnZXR0aW5nIGh0dHAgcmVzcG9uc2UuIEJ1dCB0aGVyZSdzIG5vdGhpbmcgaW4gL3RtcC9p
bWFnZXMgYW55bW9yZSwgc28gaXQgZmFpbC4NClRoZSB0aW1lIHNlcXVlbmNlIGlzIGFzIGZvbGxv
d3M6DQoxLnJvYm90IHVwbG9hZCB0YXIgZmlsZSBieSByZWRmaXNoIGNvbW1hbmQgYW5kIEJNQyB1
bnRhciBpdCBpbiAvdG1wL2ltYWdlcy9jNzhlNjc0YS4NCjIuYm1jd2ViIGFjdGl2ZSB0aGUgaW1h
Z2U6IEJNQyBjb3B5IDQgaW1hZ2UgZmlsZXMgdG8gL3J1bi9pbml0cmFtZnMgYW5kIGRlbGV0ZSAv
dG1wL2ltYWdlcy9jNzhlNjc0YS4NCjMucm9ib3QgdHJ5IHRvIGNoZWNrIGltYWdlJ3MgaWQgaW4g
L3RtcC9pbWFnZXMvYzc4ZTY3NGEgYnV0IGl0IG5vIGxvbmdlciBleGlzdHMuDQo0LnJvYm90IGZh
aWwuDQoNCkJhc2VkIG9uIHRoZSBhYm92ZSwgdGhlIHJvYm90IHNlZW1zIHRvIGZhaWwgd2l0aG91
dCBhIGRvdWJ0Lg0KSG93ZXZlciB0aGUgcm9ib3Qgd29ya3MgZm9yIHlvdS4NCldoYXQgbWFrZXMg
dGhpcyBkaWZmZXJlbnQ/IERvIEkgbWlzcyBzb21ldGhpbmc/DQpEb2VzIGFueW9uZSBoYXZlIGFu
eSBpZGVhcz8NCkFueSBhZHZpY2UgaXMgd2VsY29tZS4NClRoYW5rcy4NCg0KPiAJIyhVVEMpIDIw
MjAvMDUvMTQgMDc6MjY6MTguODA2MjA5IC0gMC4xNzM0MDQgLSBJc3N1aW5nOiBscyAtbA0KPiAv
dG1wL2ltYWdlcy9kMmRlYTQ2ZC9NQU5JRkVTVA0KPiAJaW1hZ2VfaWQ6IGQyZGVhNDZkDQo+IAkj
KFVUQykgMjAyMC8wNS8xNCAwNzoyNjoxOS40NDczMTEgLSAwLjExMjAwMSAtIElzc3Vpbmc6IGNh
dA0KPiAvdG1wL2ltYWdlcy9kMmRlYTQ2ZC9NQU5JRkVTVA0KPiAJbWFuaWZlc3Q6DQo+IHB1cnBv
c2U9eHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5WZXJzaW9uLlZlcnNpb25QdXJwb3NlLkJN
Qw0KPiAJdmVyc2lvbj0yLjguMC1kZXYtMTgyMy1nY2E2NGQyOTEwDQo+IAlLZXlUeXBlPU9wZW5C
TUMNCj4gCUhhc2hUeXBlPVJTQS1TSEEyNTYNCj4gCU1hY2hpbmVOYW1lPXdpdGhlcnNwb29uDQo+
IAkjKFVUQykgMjAyMC8wNS8xNCAwNzoyNjoxOS43NzgwMzMgLSAwLjAxNzE3NiAtIEV4ZWN1dGlu
ZzoNCj4gZ2V0KCcvcmVkZmlzaC92MS9VcGRhdGVTZXJ2aWNlL0Zpcm13YXJlSW52ZW50b3J5L2Qy
ZGVhNDZkJykNCj4gCXN0YXR1czoNCj4gCVtIZWFsdGhdOiBPSw0KPiAJW0hlYWx0aFJvbGx1cF06
IE9LDQo+IAlbU3RhdGVdOiBVcGRhdGluZw0KPiANCg0KQmVzdCByZWdhcmRzLA0KRGF2aWQNCg==
