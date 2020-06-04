Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 099551EDFAB
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 10:19:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49czGT2ZCZzDqlJ
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 18:19:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=4177ded0a=davidwang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49czFj3J15zDq77
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 18:18:57 +1000 (AEST)
IronPort-SDR: ZeMMz3v9/iK4d8G0HmRDpzxGO4adnIR8OJ1swlVYY6CKF1XU14Hkt3/yO2rjLcZ5j7bwxEXa2N
 GoP/eMm4OVhg==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 04 Jun 2020 16:18:53 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 4 Jun 2020
 16:18:48 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 4 Jun 2020 16:18:48 +0800
From: =?big5?B?RGF2aWQgV2FuZyAopP2utqZ0KQ==?= <DavidWang@quantatw.com>
To: George Keishing <gkeishin@in.ibm.com>
Subject: bmc code update with automation/redfish
Thread-Topic: bmc code update with automation/redfish
Thread-Index: AdY6R4EZk1n8pcQvT7+icYI5vE1vvg==
Date: Thu, 4 Jun 2020 08:18:48 +0000
Message-ID: <77541f88b7b5412597769fe344682576@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 61963A9F4F06DD80A78362FEE8B147A9B917FB320E0716C044827E8588DD077A2000:8
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

SGkgR2VvcmdlLA0KDQpJoaZtIHRlc3RpbmcgQk1DIGJ5IGF1dG9tYXRpb24gd2l0aCB0ZXN0X3Jl
ZGZpc2hfYm1jX2NvZGVfdXBkYXRlLnJvYm90Lg0KSXQgZmFpbGVkLiBIb3dldmVyIEkgY2FuIHN1
Y2Nlc3NmdWxseSB1cGRhdGUgYm1jIG1hbnVhbGx5IHNvIEkgdHJ5IHRvIGZpbmQgdGhlIHJlYXNv
biBvZiBmYWlsdXJlLg0KDQpXaGVuIEkgdXBsb2FkIGltYWdlIGJ5IFJFU1Q6DQoxLiAtWCBQT1NU
IC1UIDx0YXJfZmlsZT4gaHR0cHM6Ly8ke2JtY30vdXBsb2FkL2ltYWdlDQoNCjIuIGxzIC1sIC90
bXAvaW1hZ2VzDQogICBkcnd4LS0tLS0tICAgCTIgcm9vdCAgICAgcm9vdCAgICAgICAgICAgMjgw
IEp1biAgNCAwNjo0NSBjNzhlNjc0YQ0KDQozLiAtWCBQVVQgLWQgJ3siZGF0YSI6ICJ4eXoub3Bl
bmJtY19wcm9qZWN0LlNvZnR3YXJlLkFjdGl2YXRpb24uUmVxdWVzdGVkQWN0aXZhdGlvbnMuQWN0
aXZlIn0nIFwNCiAgIGh0dHBzOi8vJHtibWN9L3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUv
Yzc4ZTY3NGEvYXR0ci9SZXF1ZXN0ZWRBY3RpdmF0aW9uDQqhQKFADQo0LiBUaGVuIGJtYyB1bnRh
ciB0aGUgdGFyIGZpbGUgdG8gL3J1bi9pbml0cmFtZnMvIGFuZCByZW1vdmUgdGhlIHRhciBmaWxl
DQoJbHMgLWwgL3J1bi9pbml0cmFtZnMNCgktcnctci0tci0tICAgIDEgcm9vdCAgICAgcm9vdCAg
ICAgICA0MjI5ODQ0IEp1biAgNCAwNjo0NiBpbWFnZS1rZXJuZWwNCgktcnctci0tci0tICAgIDEg
cm9vdCAgICAgcm9vdCAgICAgIDIzNzAzNTUyIEp1biAgNCAwNjo0NiBpbWFnZS1yb2ZzDQoJLXJ3
LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgIDg1MDMwNCBKdW4gIDQgMDY6NDYgaW1h
Z2Utcndmcw0KCS1ydy1yLS1yLS0gICAgMSByb290ICAgICByb290ICAgICAgICA0MzM3MTIgSnVu
ICA0IDA2OjQ2IGltYWdlLXUtYm9vdA0KDQpXaGVuIEkgdXBsb2FkIGltYWdlIGJ5IFJlZGZpc2gg
KG9yIGF1dG9tYXRpb24pOiANCjEuIC1YIFBPU1QgLVQgPHRhcl9maWxlPiBodHRwczovLyR7Ym1j
fS9yZWRmaXNoL3YxL1VwZGF0ZVNlcnZpY2UNCg0KMi4gQk1DIGltbWVkaWF0ZWx5IGNvbXBsZXRl
cyBzdGVwcyAyIHRvIDQgYWJvdmUuIFNvIHRoZXJloaZzIG5vIGZvbGRlciBuYW1lZCChp2M3OGU2
NzRhoaggaW4gL3RtcC9pbWFnZXMuIA0KCWxzIC1sIC9ydW4vaW5pdHJhbWZzDQqhQKFALXJ3LXIt
LXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgNDIyOTg0NCBKdW4gIDQgMDY6NTMgaW1hZ2Ut
a2VybmVsDQqhQKFALXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAyMzcwMzU1MiBK
dW4gIDQgMDY6NTMgaW1hZ2Utcm9mcw0KoUChQC1ydy1yLS1yLS0gICAgMSByb290ICAgICByb290
ICAgICAgICA4NTAzMDQgSnVuICA0IDA2OjUzIGltYWdlLXJ3ZnMNCqFAoUAtcnctci0tci0tICAg
IDEgcm9vdCAgICAgcm9vdCAgICAgICAgNDMzNzEyIEp1biAgNCAwNjo1MyBpbWFnZS11LWJvb3QN
CgkNCjMuIFRoZW4gcm9ib3QgdHJ5IHRvIKGnR2V0IExhdGVzdCBJbWFnZSBJRKGoIGJ5IGNvbW1h
bmQNCqFAoUBjZCAvdG1wL2ltYWdlcy87IHN0YXQgLWMgJyVZICVuJyAqIHwgc29ydCAtazEsMW5y
IHwgaGVhZCAtbiAxDQqhQKFAQnV0IHRoZSBmb2xkZXIgaGFzIGJlZW4gcmVtb3ZlZCwgc28gdGhl
IHJvYm90IGZpbmRzIG5vdGhpbmcsIGFuZCB0aGVuIGZhaWxzLg0KCQ0KSGVyZaGmcyB0aGUgcXVl
c3Rpb246DQpJdCBzZWVtcyB0aGF0IHRoZSByb2JvdCBleHBlY3RzIHRoZSBmb2xkZXIgImM3OGU2
NzRhIiB0byBleGlzdC4gDQpIb3dldmVyLCB3aGVuIHVwbG9hZGluZyBhbiBpbWFnZSB0aHJvdWdo
IFJlZGZpc2ggY29tbWFuZCwgb25jZSB0aGUgdGFyIGZpbGUgaXMgdXBsb2FkZWQsIGJtYyB1bnRh
ciBhbmQgcmVtb3ZlIGl0Lg0KSG93IGNhbiBJIGZpeCBpdD8gRG8geW91IGhhdmUgYW55IHN1Z2dl
c3Rpb24/DQpQbGVhc2UgbGVhdmUgYW55IGNvbW1lbnRzLCB0aGFuayB5b3UuDQoNClJlZ2FyZHMs
DQpEYXZpZA0KDQo=
