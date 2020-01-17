Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB181403A2
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 06:40:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zVJb0YRLzDqpH
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 16:40:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=27848eddf=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 47zVHn5lw2zDqd9
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 16:39:28 +1100 (AEDT)
IronPort-SDR: A80SMfZlPYQ8OuZZq9Vr0cRxQbpKOwcMrPu1EAv+m1qoKPVzdKy+Uvrt1urUp2DWtMJMUkFmq3
 Xvb7Tkd0iYqA==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 17 Jan 2020 13:39:24 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 17 Jan
 2020 13:39:21 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Fri, 17 Jan 2020 13:39:21 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Subject: RE: Verify Privilege For Different Channels in openbmc-test-automation
Thread-Topic: Verify Privilege For Different Channels in
 openbmc-test-automation
Thread-Index: AdXKuxmeAxEUTzgySNaVM+b2wNcnWQBYBjUAADcISEA=
Date: Fri, 17 Jan 2020 05:39:21 +0000
Message-ID: <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
In-Reply-To: <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: C5556053ABEFC99471F79AC024322C86D4F34F84059A7AE527EA66F557427C9A2000:8
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

R290IGl0LiBBbm90aGVyIHF1ZXN0aW9uLCBhdCB0aGUgbGFzdCB0d28gIlZlcmlmeSIgc3RlcHMu
IA0KQ2FuIHRoZSB1c2VyIHJ1biBvdXQtb2YtYmFuZCBJUE1JIGNvbW1hbmRzIHdpdGggdGhlIHNw
ZWNpZmllZCBjaGFubmVsPw0KKGUuZyBpcG1pdG9vbCAtSSBsYW5wbHVzIC1DIDMgLXAgNjIzIC1V
IFltUkJ3RFVTIC1QIDBwZW5CbWMxIC1IIHgueC54LnggLUwgQWRtaW5pc3RyYXRvciBzZWwgaW5m
byAxKQ0KDQpJcyB0aGVyZSBhIGRlc2NyaXB0aW9uIG9yIFNQRUMgYWJvdXQgaXQ/IEl0IGRvZXNu
J3Qgd29yayBvbiBteSBzeXN0ZW0uDQpGb3IgZXhhbXBsZToNCkkgY3JlYXRlZCBhIHVzZXIgbmFt
ZSBERCBhbmQgZ2F2ZSBpdCBkaWZmZXJlbnQgcHJpdmlsZWdlIGZvciBkaWZmZXJlbnQgY2hhbm5l
bHMuDQoNCmlwbWl0b29sIHVzZXIgbGlzdCAxDQpJRCAgTmFtZQkgICAgIENhbGxpbiAgTGluayBB
dXRoCUlQTUkgTXNnICAgQ2hhbm5lbCBQcml2IExpbWl0DQoxICAgcm9vdCAgICAgICAgICAgICBm
YWxzZSAgIHRydWUgICAgICAgdHJ1ZSAgICAgICBBRE1JTklTVFJBVE9SDQouLi4NCi4uLg0KNiAg
IEREICAgICAgICAgICAgICAgdHJ1ZSAgICBmYWxzZSAgICAgIGZhbHNlICAgICAgTk8gQUNDRVNT
DQoNCmlwbWl0b29sIHVzZXIgbGlzdCAyDQpJRCAgTmFtZQkgICAgIENhbGxpbiAgTGluayBBdXRo
CUlQTUkgTXNnICAgQ2hhbm5lbCBQcml2IExpbWl0DQoxICAgcm9vdCAgICAgICAgICAgICBmYWxz
ZSAgIHRydWUgICAgICAgdHJ1ZSAgICAgICBBRE1JTklTVFJBVE9SDQouLi4NCi4uLg0KNiAgIERE
ICAgICAgICAgICAgICAgdHJ1ZSAgICBmYWxzZSAgICAgIHRydWUgICAgICAgQURNSU5JU1RSQVRP
Ug0KDQpBcyBleHBlY3RlZCwgaXQgc2hvdWxkIG5vdCB3b3JrIGlmIHVzZXIgcnVuIG91dC1vZi1i
YW5kIElQTUkgY29tbWFuZHMgd2l0aCB0aGUgY2hhbm5lbCAxLg0KSG93ZXJ2ZXIgaXQgc3RpbGwg
d29yay4NCiRpcG1pdG9vbCAtSSBsYW5wbHVzIC1DIDMgLXAgNjIzIC1VIEREIC1QIDBwZW5CbWMx
IC1IIHgueC54Lnggc2VsIGluZm8gMQ0KDQpTRUwgSW5mb3JtYXRpb24NClZlcnNpb24gICAgICAg
ICAgOiAxLjUgKHYxLjUsIHYyIGNvbXBsaWFudCkNCkVudHJpZXMgICAgICAgICAgOiA2DQpGcmVl
IFNwYWNlICAgICAgIDogMCBieXRlcyANClBlcmNlbnQgVXNlZCAgICAgOiAxMDAlDQpMYXN0IEFk
ZCBUaW1lICAgIDogMDEvMDYvMTk3MCAwMDoxMzoxOA0KTGFzdCBEZWwgVGltZSAgICA6IE5vdCBB
dmFpbGFibGUNCk92ZXJmbG93ICAgICAgICAgOiBmYWxzZQ0KU3VwcG9ydGVkIENtZHMgICA6ICdS
ZXNlcnZlJw0KDQpUaGFua3MNCkJlc3QgUmVnYXJkcywNClRvbnkNCg0KRnJvbTogUmFodWwgTWFo
ZXNod2FyaSA8cmFodWxtYWhlc2h3YXJpMDFAZ21haWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBK
YW51YXJ5IDE2LCAyMDIwIDc6MTUgUE0NClRvOiBUb255IExlZSAo5p2O5paH5a+MKSA8VG9ueS5M
ZWVAcXVhbnRhdHcuY29tPg0KU3ViamVjdDogUmU6IFZlcmlmeSBQcml2aWxlZ2UgRm9yIERpZmZl
cmVudCBDaGFubmVscyBpbiBvcGVuYm1jLXRlc3QtYXV0b21hdGlvbg0KDQpIaSBUb255DQpUaGVz
ZcKgdGVzdCBjYXNlcyBhcmUgZXhwZWN0ZWQgdG8gZmFpbCBpZiB5b3VyIHN5c3RlbSdzIEJNQyBo
YXMgb25seSBvbmUgTEFOIGNoYW5uZWwgc3VwcG9ydC4gSW4gY2FzZSBvZiB5b3VyIEJNQyBoYXMg
MiBMQU4gY2hhbm5lbCBzdXBwb3J0LCB0aGVuIHRoZXNlIHRlc3RzIHNob3VsZCBwYXNzLg0KDQpU
aGFua3MNClJhaHVsDQoNCk9uIFR1ZSwgSmFuIDE0LCAyMDIwIGF0IDI6NTIgUE0gVG9ueSBMZWUg
KOadjuaWh+WvjCkgPG1haWx0bzpUb255LkxlZUBxdWFudGF0dy5jb20+IHdyb3RlOg0KSGkgUmFo
dWwsDQoNCkkgbWVldCB3aXRoIGRpZmZpY3VsdGllcyBmb3IgdGhlIGNhc2VzICJWZXJpZnkgQWRt
aW5pc3RyYXRvciBBbmQgTm8gQWNjZXNzIFByaXZpbGVnZSBGb3IgRGlmZmVyZW50IENoYW5uZWxz
IiBhbmQNCiJWZXJpZnkgT3BlcmF0b3IgQW5kIFVzZXIgUHJpdmlsZWdlIEZvciBEaWZmZXJlbnQg
Q2hhbm5lbHMiIGluIHRlc3RfaXBtaV91c2VyLnJvYm90Lg0KDQpSZWZlciB0byBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi9pc3N1ZXMvMTUyMw0KQWNj
b3JkaW5nIHRvIFJpY2hhcmQncyBjb21tZW50OiAiQ2hhbm5lbCBjb21tYW5kIHByaXZpbGVnZSBh
cmUgd29ya2luZyBhcyBwZXIgdGhlIGNoYW5uZWwgKGJ1dCBhdCB0aGlzIHBvaW50IG9mIHRpbWUg
dGhpcyBkaWZmZXJlbnRpYXRpb24gY2FuJ3QgYmUgbWFkZSBkdWUgdG8gYXJjaGl0ZWN0dXJlIGxp
bWl0YXRpb25zLCBidXQgb2sgdG8gd3JpdGUgdGVzdCBjYXNlIGFuZCBtYXJrIGl0IGFzIGZhaWxl
ZCwgcmF0aGVyIHRoYW4gc2tpcHBpbmcgdGhlIHNhbWUpIg0KDQpBcmUgdGhlc2UgdHdvIGNhc2Vz
IGJlIGV4cGVjdGVkIHRvIGZhaWw/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0K
