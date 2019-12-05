Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BBA1140D7
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 13:32:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TFVG6M3dzDqbD
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 23:32:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=235f777a0=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 47TFT13jkdzDqYn
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 23:31:31 +1100 (AEDT)
IronPort-SDR: rpDrm4GuSEVDWMnvinMn1TUgFsHt9SVaixVZ6npzHEDi4LGPdb5yzWdfFWbccC2Ht8pGKDd2qx
 z1SJUb6/MjKg==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx02.quantatw.com with ESMTP; 05 Dec 2019 20:31:29 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 20:31:26 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 5 Dec 2019 20:31:26 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Test Case "Verify IPMI Root User Password Change" in
 openbmc-test-automation
Thread-Topic: Test Case "Verify IPMI Root User Password Change" in
 openbmc-test-automation
Thread-Index: AdWrFEY2F63AP+A9TAS205f6FzSyRv//8yaA//9MWrA=
Date: Thu, 5 Dec 2019 12:31:26 +0000
Message-ID: <293a022b44784f86bee3a83fbdafd03b@quantatw.com>
References: <d668c41428ad4e6db20a5221f4a2306b@quantatw.com>
 <CAAMkS11DHQvaX+XHBGXDv-3j9__ZS66B1UPhpieUsnfWu+vVgQ@mail.gmail.com>
In-Reply-To: <CAAMkS11DHQvaX+XHBGXDv-3j9__ZS66B1UPhpieUsnfWu+vVgQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25084.007
x-tm-as-result: No-10--15.624300-8.000000
x-tmase-matchedrid: 0dFPYP4mu5TwXJbBoN29PhvgzEPRJaDEWw/S0HB7eoMTiSW9r3PknBkX
 +si55c+xUnh1omhhVaTj2iOyGc7mHhA2kxuARasNNVRz+HwqL4J99ekRHlOQkWyR761ySQGijzr
 oMRry5yIjZVYfvy3cQqwvTQpsPBALXywERWyRD+5cod85S7fEgBA5wxKjT3bqvGAx/1ATZ5ulmv
 EmZi6ZZsV+WCC7CP0HcZGRi+WZCaUde4OwI1O5iL+Kd/geEyt7Z5nL01I3HiqRoQLwUmtov9SE+
 ooSMqbW7Xch1djoz3hG/fMs72PmHDQdOVb9/jgPlVHM/F6YkvRVre9WjqqQw2z3xnx8b/qR8QWf
 RmYVXCcNnUFJfK51wpYlxuk1ogQA0VtwrmuY87XQeUylZ/mLlzCNjbQPaq5iWkvncDztoltpIb9
 sYgtps5jly8/sisJyMvCSeJk7w5+jxYyRBa/qJUl4W8WVUOR/9xS3mVzWUuA152LecOHHI1VoEX
 K0hBS3
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--15.624300-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25084.007
x-tm-snts-smtp: CB75480375F2792DD5397882F9DBB98094CB5CBA65381C4ABD45D865DCFA03342000:B
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

SGkgUmFodWwsDQoNCkdvdCBpdCwgaXQgc2VlbXMgSSBjYW4gb25seSBza2lwIGl0IGZpcnN0Lg0K
VGhlcmUgaXMgYW5vdGhlciBxdWVzdGlvbiBhYm91dCB0ZXN0X2lwbWlfdXNlci5yb2JvdC4NCkNh
c2VzIHdoaWNoIGNyZWF0aW5nIGEgbmV3IHVzZXIgc3VjY2VzcywgYW5kIHRoZW4gZXhlY3V0ZSBh
IGV4dGVybmFsIGlwbWkgY29tbWFuZCB3aXRoDQp0aGlzIG5ldyB1c2VyIGFjY291bnQgd2lsbCBm
YWlsIG9uIG91ciBzeXN0ZW0uIEZvciBleGFtcGxlLCB0ZXN0IGNhc2UgIlZlcmlmeSBTZXR0aW5n
IFZhbGlkIFBhc3N3b3JkIEZvciBJUE1JIFVzZXIiLg0KVGhlIGtleSBpcyB0aGF0IHRoZSBkZWZh
dWx0IGNoYW5uZWwgaW4gdGhlIEtleXdvcmQgIlNldCBDaGFubmVsIEFjY2VzcyIgaXMgMS4NCiJl
dGgwIiBjb3JyZXNwb25kaW5nIHRvIGNoYW5uZWwgMSBpcyB1c2VkIGZvciBkZWJ1ZyBwdXJwb3Nl
cywgYW5kDQoiZXRoMSIgY29ycmVzcG9uZGluZyB0byBjaGFubmVsIDIgaXMgdXNlZCBmb3IgaXBt
aSByZW1vdGUgYWNjZXNzIGluIG91ciBzeXN0ZW0uDQpTbyBvbmNlIEkgc2V0IHRoZSBkZWZhdWx0
IGNoYW5uZWwgdG8gMiBpbiB0aGUgS2V5d29yZCAiU2V0IENoYW5uZWwgQWNjZXNzIiwgdGhvc2Ug
Y2FzZXMgc3VjY2VlZC4NCg0KSSBoYXZlIGEgc29sdXRpb246IGFkZCB2YXJpYWJsZSAke0NIQU5O
RUx9IGRlZmF1bHQgaXMgMSBpbiBsaWIvcmVzb3VyY2Uucm9ib3QuDQpUaGVuLCBsZXQgJHtjaGFu
bmVsfT0ke0NIQU5ORUx9IGluIEtleXdvcmQgIlNldCBDaGFubmVsIEFjY2VzcyIuDQpMZXQgdXNl
ciB0byBzcGVjaWZ5IGNoYW5uZWwgd2hpbGUgcnVubmluZywgaWYgbm90LCB0aGUgZGVmYXVsdCBp
cyAxLg0KDQpFeGFtcGxlOiByb2JvdCAtdiBPUEVOQk1DX0hPU1Q6eC54LngueCAtdiBDSEFOTkVM
OjIgaXBtaS90ZXN0X2lwbWlfdXNlci5yb2JvdA0KDQpJcyB0aGlzIGFwcHJvYWNoIHNvdW5kcyBm
aW5lIHRvIHlvdSBvciB0aGVyZSBhcmUgb3RoZXIgc3VnZ2VzdGlvbnM/DQoNClRoYW5rcw0KVG9u
eQ0KDQpGcm9tOiBSYWh1bCBNYWhlc2h3YXJpIDxyYWh1bG1haGVzaHdhcmkwMUBnbWFpbC5jb20+
IA0KU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDUsIDIwMTkgNTo0NyBQTQ0KVG86IFRvbnkgTGVl
ICjmnY7mloflr4wpIDxUb255LkxlZUBxdWFudGF0dy5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSZTogVGVzdCBDYXNlICJWZXJpZnkgSVBNSSBSb290IFVzZXIg
UGFzc3dvcmQgQ2hhbmdlIiBpbiBvcGVuYm1jLXRlc3QtYXV0b21hdGlvbg0KDQpIaSBUb255LA0K
V2UgaGF2ZSBhbHNvIGZhY2VkIHRoZSBzYW1lIHByb2JsZW0uIFNvIHRvIGF2b2lkIHN1Y2ggcHJv
YmxlbXMsIHdlIGRlY2lkZWQgdG8gc2V0IEJNQyBwYXNzd29yZCB0byA4IGNoYXJhY3RlcnMgbGVu
Z3RoIGJlZm9yZSBydW5uaW5nIG91ciBidWNrZXQuIEFzIGZhciBhcyBza2lwcGluZyBzdWNoIHRl
c3QgY2FzZSwgd2UgY2FuIGRvIHRoYXQgYnkgdXNpbmcgYC1lwqBWZXJpZnlfSVBNSV9Sb290X1Vz
ZXJfUGFzc3dvcmRfQ2hhbmdlYCB3aGlsZSBydW5uaW5nLg0KDQpFeGFtcGxlOg0Kcm9ib3QgLXYg
T1BFTkJNQ19IT1NUOngueC54LnggLWXCoFZlcmlmeV9JUE1JX1Jvb3RfVXNlcl9QYXNzd29yZF9D
aGFuZ2UgaXBtaS90ZXN0X2lwbWlfdXNlci5yb2JvdA0KDQpUaGFua3MNClJhaHVsDQoNCk9uIFRo
dSwgRGVjIDUsIDIwMTkgYXQgODowNSBBTSBUb255IExlZSAo5p2O5paH5a+MKSA8bWFpbHRvOlRv
bnkuTGVlQHF1YW50YXR3LmNvbT4gd3JvdGU6DQpIaSBSYWh1bCwNCg0KUmVmZXJlbmNlIHRvIGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtdGVzdC1hdXRvbWF0aW9uL2lzc3Vlcy8x
OTIwLg0KDQpDYXNlICJWZXJpZnkgSVBNSSBSb290IFVzZXIgUGFzc3dvcmQgQ2hhbmdlIiB3aWxs
IGNoYW5nZSByb290IHVzZXIgcGFzc3dvcmQgYW5kDQp1bmFibGUgdG8gcmVzZXQgZGVmYXVsdCBw
YXNzd29yZCBkdWUgdG8gdGhlIGxlbmd0aCBpcyBsaW1pdGVkIHRvIDguDQpBcyBhIHJlc3VsdCwg
Y2FzZXMgd2lsbCBhbHNvIGZhaWwgYWZ0ZXIgdGhpcyBiZWNhdXNlIHRoZSBwYXNzd29yZCBoYXMg
YmVlbiBjaGFuZ2VkIHRvIDBwZW5CbWMxLg0KU2hvdWxkIHdlIHJlbW92ZSB0aGlzIHRlc3QgY2Fz
ZT8gVGhlcmUgc2VlbXMgdG8gYmUgbm8gb3RoZXIgd2F5IHRvIGZpeCBpdC4NCg0KVGhhbmtzDQpC
ZXN0IFJlZ2FyZHMsDQpUb255DQoNCg==
