Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 780DDB9BB4
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 02:36:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zs8q6kzqzF4M4
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 10:36:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zs826ccbzF1fH
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 10:36:01 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x8L0IwO0044229;
 Sat, 21 Sep 2019 08:18:58 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Sat, 21 Sep
 2019 08:34:13 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Sat, 21 Sep 2019 08:34:12 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: James Feist <james.feist@linux.intel.com>, Milton Miller II
 <miltonm@us.ibm.com>
Subject: RE: phosphor-isolation
Thread-Topic: phosphor-isolation
Thread-Index: AQHVbxBlbv6RMAwo/kWP8E+fHz4LJaczaAMAgADLXgCAAAbyAIAAIIYAgADt9vA=
Date: Sat, 21 Sep 2019 00:34:11 +0000
Message-ID: <09a8b629e6dc4ee1a0056d345ad39d5a@TWMBX02.aspeed.com>
References: <4ae96d16-addd-2ee9-0f96-867116fba5c6@linux.intel.com>
 <c558c87c-7929-b9d2-8970-531f39979f38@linux.intel.com>
 <1bbdbc81-69a5-484e-9ee8-ba62a710e8fe@www.fastmail.com>
 <OFB4439398.C2024144-ON0025847B.0059AC2A-0025847B.0059BE4A@notes.na.collabserv.com>
 <dd3f64aa-e053-6c33-bf3e-fa6031eafb57@linux.intel.com>
In-Reply-To: <dd3f64aa-e053-6c33-bf3e-fa6031eafb57@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x8L0IwO0044229
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gSmFtZXMsDQoJVGhpcyBwYXRjaCBpcyBqdXN0IGVuYWJsZSBMUEMgZGVjb2RlIGZvciAw
eDJlLzB4NGUuIGFsc28gbm90IGVmZmVjdCBLQ1MuIA0KCUNvdWxkIHlvdSBjaGVjayB0aGUgU0NV
MGNbOF0gZGlzYWJsZSBvciBub3Q/DQpSeWFuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBKYW1lcyBGZWlzdCBbbWFpbHRvOmphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbV0g
DQpTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDIxLCAyMDE5IDI6MTcgQU0NClRvOiBNaWx0b24g
TWlsbGVyIElJIDxtaWx0b25tQHVzLmlibS5jb20+DQpDYzogQW5kcmV3IEplZmZlcnkgPGFuZHJl
d0Bhai5pZC5hdT47IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47
IFJ5YW4gQ2hlbiA8cnlhbl9jaGVuQGFzcGVlZHRlY2guY29tPg0KU3ViamVjdDogUmU6IHBob3Nw
aG9yLWlzb2xhdGlvbg0KDQpPbiA5LzIwLzE5IDk6MjAgQU0sIE1pbHRvbiBNaWxsZXIgSUkgd3Jv
dGU6DQo+IE9uIFNlcHRlbWJlciAyMCwgMjAxOSwgYXJvdW5kIDEwOjU2QU0gaW4gc29tZSB0aW1l
em9uZSwgSmFtZXMgRmVpc3Qgd3JvdGU6DQo+PiBPbiA5LzE5LzE5IDg6NDcgUE0sIEFuZHJldyBK
ZWZmZXJ5IHdyb3RlOg0KPj4+IE9uIEZyaSwgMjAgU2VwIDIwMTksIGF0IDAzOjAzLCBKYW1lcyBG
ZWlzdCB3cm90ZToNCj4+Pj4gSSBlbmFibGVkIHBob3NwaG9yLWlzb2xhdGlvbiBvbiBteSBzeXN0
ZW0gYW5kIG5vdGljZWQgdGhhdCBrY3Mgbm8gDQo+Pj4+IGxvbmdlciB3b3JrZWQgYWZ0ZXJ3YXJk
cy4gQ29tbWVudGluZyBvdXQgdGhpcyBzZWN0aW9uOg0KPj4+Pg0KPj4+Pg0KPiANCj4+Pj4NCj4+
Pj4gKwkvKiBpTFBDMkFIQiAqLw0KPj4+PiArCXZhbCA9IHJlYWRsKEFTVF9TQ1VfQkFTRSArIEFT
VF9TQ1VfSFdfU1RSQVAxKTsNCj4+Pj4gKwl2YWwgfD0gU0NVX0hXX1NUUkFQX0xQQ19ERUNfU1VQ
RVJfSU87DQo+Pj4+ICsJd3JpdGVsKHZhbCwgQVNUX1NDVV9CQVNFICsgQVNUX1NDVV9IV19TVFJB
UDEpOw0KPj4+Pg0KPj4+Pg0KPj4+PiBTZWVtcyB0byBtYWtlIEtDUyB3b3JrIGFnYWluLg0KPiAN
Cj4gVGhhdCBjb25maWd1cmF0aW9uIGlzIGRpc2FibGluZyBzdXBlcmlvIGRlY29kaW5nLCB3aGlj
aCBtZWFucyB0aGUgaG9zdCANCj4gd2lsbCBubyBsb25nZXIgYmUgYWJsZSB0byBjb25maWd1cmUg
dGhlIHN1cGVyaW8gaGFyZHdhcmUgb24gdGhlIExQQyBidXMuDQo+IA0KPj4+DQo+Pj4gVGhhdCBp
cyBhbiB1bmV4cGVjdGVkIHJlc3VsdC4gSGF2ZSB5b3UgYXNrZWQgQVNQRUVEIGFib3V0IGl0PyBJ
J3ZlIA0KPj4+IGFkZGVkIFJ5YW4gdG8gQ2MuIEkgbXVzdCBhZG1pdCBJIGRpZG4ndCB0ZXN0IHRo
ZSBwYXRjaCB3aXRoIHN5c3RlbXMgDQo+Pj4gdGhhdCB1c2UgS0NTIGJlY2F1c2UgT3BlblBPV0VS
IGV4Y2x1c2l2ZWx5IHVzZXMgQlQgZm9yIElQTUkgKHRob3VnaCANCj4+PiB3ZSdyZSBzdGFydGlu
ZyB0byBleHBsb2l0IHRoZSBLQ1MgaW50ZXJmYWNlcyBmb3IgYW4gTFBDIE1DVFAgDQo+Pj4gYmlu
ZGluZykuDQo+Pj4NCj4+PiBIYXZpbmcgc2FpZCB0aGF0LCB0aGUgc3lzdGVtcyB0aGF0IHdlJ3Jl
IHRlc3Rpbmcgb3VyIExQQyBNQ1RQIA0KPj4+IGJpbmRpbmcgb24gd291bGQgaGF2ZSB0aGlzIHBh
dGNoIGFwcGxpZWQsIHNvIHByZXN1bWFibHkgd2UncmUgbm90IA0KPj4+IHNlZWluZyB0aGUgc2Ft
ZSBlZmZlY3QgdGhlcmUuIFRoZXkncmUgMjUwMC1iYXNlZCBzeXN0ZW1zLCBpcyB0aGF0IA0KPj4+
IHdoYXQgeW91J3JlIHRlc3Rpbmcgd2l0aD8NCj4+DQo+PiBZZXMgSSBhbS4NCj4+DQo+IA0KPiBB
cyBhbiBvdXRzaWRlIG9ic2VydmVyIHdpdGhvdXQgaGFyZHdhcmUsIGNhbiB5b3UgY2hlY2s6DQo+
IA0KPiAoMSkgRGlkIHlvdSBjaGVjayBmcm9tIHRoZSBPUyBvciBqdXN0IGZyb20gYSBCSU9TIGlu
dmVudG9yeT8NCg0KQXR0ZW1wdGluZyB0byBzZW5kIGlwbWkgY29tbWFuZHMgZnJvbSB1ZWZpL2xp
bnV4IHN0b3BwZWQgd29ya2luZy4gTGludXggZHJpdmVyIG9uIGhvc3QgcmVwb3J0ZWQgaXNzdWVz
IGNvbW11bmljYXRpbmcgdG8gYm1jLg0KDQo+IA0KPiAoMikgSXMgdGhlcmUgY29kZSB0byBlbmFi
bGUgdGhlIEtDUyBwZXJpcGhlcmFsIGZyb20gdGhlIGJtYw0KDQpUaGVyZSBpcyBhIGRyaXZlciBh
bmQga2NzYnJpZGdlZC4NCj4gDQo+ICgzKSBXaWxsIHRoZSBob3N0IHRyeSB0byB1c2UgdGhlIEtD
UyBldmVuIHRob3VnaCBpdCBjYW4NCj4gICAgICBub3QgZmluZCB0aGUgc3VwZXJpbyB0byBjaG9v
c2UgdGhlIHBvcnQgYW5kIGludGVycnVwdD8NCg0KWWVzLg0KDQo+IA0KPiANCj4gDQo+IA0KPiAN
Cj4+Pj4NCj4+Pj4gRG8gd2UgbmVlZCB0aGlzIHBhcnQgc2V0PyBJZiBzbywgc2hvdWxkIHdlIGNy
ZWF0ZSBhIA0KPj4+PiBwaG9zcGhvci1pc29sYXRpb24ta2NzIGFuZCBwaG9zcGhvci1pc29sYXRp
b24tYnQ/DQo+Pj4NCj4+PiBJIGhvcGUgbm90LCBnaXZlbiB0aGF0IGxlYXZpbmcgdGhlIFN1cGVy
SU8gZGVjb2RpbmcgZW5hYmxlIGFsbG93cw0KPj4gdGhlDQo+Pj4gaG9zdCB0byAoc2xvd2x5KSBz
Y3JhcGUgQk1DIG1lbW9yeSAob3IgaWYgaUxQQzJBSEIgd3JpdGVzIGFyZSANCj4+PiBhbGxvd2Vk
LCBvcGVuIGZhc3RlciBiYWNrZG9vcnMpLiBXZSBzaG91bGQgcm9vdC1jYXVzZSB0aGUgaXNzdWUg
DQo+Pj4gYmVmb3JlIGV4cGxvcmluZyB0aGlzIHBhdGguDQo+Pj4NCj4+PiBBbmRyZXcNCj4gDQo=
