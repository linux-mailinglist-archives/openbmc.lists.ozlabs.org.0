Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A599C1290D8
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 03:14:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47h2x72qB9zDqG1
	for <lists+openbmc@lfdr.de>; Mon, 23 Dec 2019 13:14:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=253d693be=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 47h2wL0KrVzDqFm
 for <openbmc@lists.ozlabs.org>; Mon, 23 Dec 2019 13:14:04 +1100 (AEDT)
IronPort-SDR: av+2ODemKVhQpQa3Mj3Uwddh7EcNkyjEoG3Kr72k321VKBsbcnglhs9IgaBAujt0XLUElj6RwX
 B78fc3eMhTWg==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 23 Dec 2019 10:14:01 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 23 Dec
 2019 10:13:50 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 23 Dec 2019 10:13:50 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Michael Walsh <micwalsh@us.ibm.com>
Subject: RE:  JSON file boot_table in openbmc-test-automation
Thread-Topic: JSON file boot_table in openbmc-test-automation
Thread-Index: AdW25PDauD9IZkN7TnyNdIL4fSiWJAARQCeAAIMdThA=
Date: Mon, 23 Dec 2019 02:13:50 +0000
Message-ID: <2686e933220b4311bb38f215454e5269@quantatw.com>
References: <891637d68b4d48459658e139921a5b25@quantatw.com>
 <OF1495226C.AC844C2F-ON002584D6.006B4FB7-862584D6.006BD520@notes.na.collabserv.com>
In-Reply-To: <OF1495226C.AC844C2F-ON002584D6.006B4FB7-862584D6.006BD520@notes.na.collabserv.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25120.003
x-tm-as-result: No-10--7.379800-8.000000
x-tmase-matchedrid: 1GZI+iG+Mtfuo96mfIBuopzEHTUOuMX33dCmvEa6IiGoLZarzrrPma2S
 wIjG5UkRx91bb4/YjfEWmYBpOni9XxQ3/xoDO/Ilx64UvlSkg3HhwsEcDDUFFmkdgYWZtIXpjQb
 0ZijHcXBQz2YdWcOdHlbH93kcGmO/OO37vtaAjDWejeo11iW0NyQ+SLVh+H0im2kQ5yB7R6j2Tq
 4vVkH7QaPxKyivBIjaJ11hrXOV47DCFdW8OB9PN2fd6M+N3X1xV447DNvw38ZEBwXMKINh6BgM2
 jZHFKlFeZcaLLThH63jUdNV82Vjn/R3YoE94O3mMDYSOHyMogJ6Ab+GNk7xs5cFdomgH0lngxsf
 zkNRlfLdB/CxWTRRu4Gh9SYKzkjuhG2qikEpQGVgbjdflrPI5ty+J4jMbUSMX7rcOgIz9Q7owKN
 HDJ6o6kd3fIgm/YMZ
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--7.379800-8.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25120.003
x-tm-snts-smtp: 53A2E20909172AE5D4C45072C6AAF6F298F10AF0E99BB24E6BB47D9DFB67B6722000:B
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 George Keishing <gkeishin@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBzZWUuIFRoYW5rcyBmb3IgeW91ciByZXBseS4NCg0KRnJvbTogTWljaGFlbCBXYWxzaCA8bWlj
d2Fsc2hAdXMuaWJtLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgRGVjZW1iZXIgMjEsIDIwMTkgMzoz
OCBBTQ0KVG86IFRvbnkgTGVlICjmnY7mloflr4wpIDxUb255LkxlZUBxdWFudGF0dy5jb20+DQpD
Yzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBHZW9yZ2UgS2Vpc2hpbmcgPGdrZWlzaGluQGlu
LmlibS5jb20+DQpTdWJqZWN0OiBSZTogSlNPTiBmaWxlIGJvb3RfdGFibGUgaW4gb3BlbmJtYy10
ZXN0LWF1dG9tYXRpb24NCg0KVGhlcmUgYXJlIHNldmVyYWwgJ1Bvd2VyIG9uJyBib290IHR5cGVz
IHJlcHJlc2VudGVkIGluIGRhdGEvYm9vdF90YWJsZS5qc29uLiDCoExldCdzIHRha2UgdGhlICdS
RVNUIFBvd2VyIE9uJyBhcyBhbiBleGFtcGxlOg0KDQrCoCDCoCAiUkVTVCBQb3dlciBPbiI6IHsN
CsKgIMKgIMKgIMKgICJzdGFydCI6IHsNCsKgIMKgIMKgIMKgIMKgIMKgICJyZXN0IjogIl4xJCIs
DQrCoCDCoCDCoCDCoCDCoCDCoCAiY2hhc3NpcyI6ICJeT2ZmJCIsDQrCoCDCoCDCoCDCoCDCoCDC
oCAiYm9vdF9wcm9ncmVzcyI6ICJeT2ZmfFVuc3BlY2lmaWVkJCIsDQrCoCDCoCDCoCDCoCDCoCDC
oCAib3BlcmF0aW5nX3N5c3RlbSI6ICJeSW5hY3RpdmUkIiwNCsKgIMKgIMKgIMKgIMKgIMKgICJo
b3N0IjogIl5PZmYkIg0KwqAgwqAgwqAgwqAgfSwNCsKgIMKgIMKgIMKgICJlbmQiOiB7DQrCoCDC
oCDCoCDCoCDCoCDCoCAicmVzdCI6ICJeMSQiLA0KwqAgwqAgwqAgwqAgwqAgwqAgImNoYXNzaXMi
OiAiXk9uJCIsDQrCoCDCoCDCoCDCoCDCoCDCoCAiYm9vdF9wcm9ncmVzcyI6ICJeRlcgUHJvZ3Jl
c3MsIFN0YXJ0aW5nIE9TfE9TU3RhcnQkIiwNCsKgIMKgIMKgIMKgIMKgIMKgICJvcGVyYXRpbmdf
c3lzdGVtIjogIl5Cb290Q29tcGxldGUkIiwNCsKgIMKgIMKgIMKgIMKgIMKgICJob3N0IjogIl5S
dW5uaW5nJCIsDQrCoCDCoCDCoCDCoCDCoCDCoCAib3NfcGluZyI6ICJeMSQiLA0KwqAgwqAgwqAg
wqAgwqAgwqAgIm9zX2xvZ2luIjogIl4xJCIsDQrCoCDCoCDCoCDCoCDCoCDCoCAib3NfcnVuX2Nt
ZCI6ICJeMSQiDQrCoCDCoCDCoCDCoCB9LA0KwqAgwqAgwqAgwqAgImJtY19yZWJvb3QiOiAwLA0K
wqAgwqAgwqAgwqAgIm1ldGhvZF90eXBlIjogImtleXdvcmQiLA0KwqAgwqAgwqAgwqAgIm1ldGhv
ZCI6ICJJbml0aWF0ZSBIb3N0IEJvb3QgwqB3YWl0PSR7MH0iLA0KwqAgwqAgwqAgwqAgImxpYl9m
aWxlX3BhdGgiOiAic3RhdGVfbWFuYWdlci5yb2JvdCINCsKgIMKgIH0sDQoNClRoZSBlbmQgcmVx
dWlyZW1lbnRzIGluZGljYXRlIHRoYXQgdGhlIG9wZXJhdGluZ19zeXN0ZW0gdmFsdWUgbXVzdCBi
ZSBCb290Q29tcGxldGUuIMKgSSd2ZSBuZXZlciBzZWVuIHRoaXMgZmFpbCBiZWNhdXNlIHRoZSBv
cGVyYXRpbmdfc3lzdGVtIHN0YXRlIHdhcyAiU3RhbmRieSIuIMKgVW5sZXNzIHlvdSBmb3Jlc2Vl
IGEgY2hhbmdlIGNvbWluZyB0aGF0IG5lY2Vzc2l0YXRlIHRoaXMsIEknZCBiZSBpbmNsaW5lZCB0
byBsZWF2ZSBpdCBhcyBpcy4gwqBBcyB0aGUgc2F5aW5nIGdvZXMgIklmIGl0IGFpbid0IGJyb2tl
LCBkb24ndCBmaXggaXQiLg0KDQoNCk1pY2hhZWwgV2Fsc2gNCklCTSBEZXB0IDNBTA0KUm9jaGVz
dGVyLCBNTg0KbWFpbHRvOm1pY3dhbHNoQHVzLmlibS5jb20NCg0KDQoNCg0KRnJvbTogwqAgwqAg
wqAgwqAiVG9ueSBMZWUgKOadjuaWh+WvjCkiIDxtYWlsdG86VG9ueS5MZWVAcXVhbnRhdHcuY29t
Pg0KVG86IMKgIMKgIMKgIMKgIm1haWx0bzptaWN3YWxzaEB1cy5pYm0uY29tIiA8bWFpbHRvOm1p
Y3dhbHNoQHVzLmlibS5jb20+DQpDYzogwqAgwqAgwqAgwqAibWFpbHRvOm9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZyIgPG1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpEYXRlOiDCoCDC
oCDCoCDCoDEyLzE5LzIwMTkgMDk6MjQgUE0NClN1YmplY3Q6IMKgIMKgIMKgIMKgW0VYVEVSTkFM
XSBKU09OIGZpbGUgYm9vdF90YWJsZSBpbiBvcGVuYm1jLXRlc3QtYXV0b21hdGlvbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KDQoNCg0KSGkgTWljaGFlbCwNCg0K
UmVmZXIgdG8gdGhlIG1ldGhvZCByZWFkSG9zdFN0YXRlKCkgaW4gcmVwbyBwaG9zcGhvci1sb2dn
aW5nLiBUaGUgZGVzY3JpcHRpb24gDQoiRm9yIGhvc3Qgb24sIGxvb2tzIGZvciB0aGUgdmFsdWVz
IG9mICdCb290Q29tcGxldGUnIG9yICdTdGFuZGJ5Jw0KaW4gdGhlIE9wZXJhdGluZ1N5c3RlbVN0
YXRlIHByb3BlcnR5IC4uLiINClNvLCBJJ20gd29uZGVyIHRoYXQgaWYgdGhlIHZhbHVlIG9mIHRo
ZSBrZXkgIm9wZXJhdGluZ19zeXN0ZW0iIGNhbiBiZQ0KIl5Cb290Q29tcGxldGV8U3RhbmRieSQi
IGZvciBhY3Rpb24gIlBvd2VyIE9uIiBpbiB0aGUgYm9vdF90YWJsZS5qc29uPw0KDQpUaGFua3MN
CkJlc3QgUmVnYXJkcywNClRvbnkNCg0KDQoNCg==
