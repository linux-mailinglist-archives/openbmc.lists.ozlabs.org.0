Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6928FFEC
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 10:24:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCK27727YzDqcg
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 19:24:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=551482c04=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CCK1F1hsjzDqbW
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 19:23:40 +1100 (AEDT)
IronPort-SDR: wu2Wj5vHqGX9OgnaUTT6T4hKz/3B3VU6wm+5pIJojm+++2RpLcf1TSixcQb5DAgzAtsO7jiM6L
 Gt4OAEB+M8gg==
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 16 Oct 2020 16:23:22 +0800
Received: from mailbx11.quanta.corp (10.243.91.108) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 16 Oct
 2020 16:23:21 +0800
Received: from mailbx11.quanta.corp ([192.168.57.11]) by mailbx11.quanta.corp
 ([192.168.57.11]) with mapi id 15.01.2044.004;
 Fri, 16 Oct 2020 16:23:21 +0800
From: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>
To: Artem Senichev <artemsen@gmail.com>
Subject: RE: Modify Timestamp of phosphor-hostlogger
Thread-Topic: Modify Timestamp of phosphor-hostlogger
Thread-Index: AdaiFYMxC9eQT4jmT3KA6ZOgpczIEwAZkLEAAEZW5fA=
Date: Fri, 16 Oct 2020 08:23:21 +0000
Message-ID: <8dbe075ae1054c2fbf2c41ffc5e854ee@quantatw.com>
References: <4b1c3d6cd2fb42a9b4ca166ac90f9ae9@quantatw.com>
 <CAHsrh9LOmMvT2Sgo2niSHbJ74b3yf_9UTiaqJxm9MhcXkpv8EA@mail.gmail.com>
In-Reply-To: <CAHsrh9LOmMvT2Sgo2niSHbJ74b3yf_9UTiaqJxm9MhcXkpv8EA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQXJ0ZW0sDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkuIEkgaGFkIGFscmVhZHkgcHVzaGVkIHRo
ZSBjaGFuZ2UgdG8gZ2Vycml0Lg0KUGxlYXNlIHRha2UgYSBsb29rLCB0aGFuayB5b3UuDQoNClNp
bmNlcmVseSwNClNwZW5jZXIgS3UNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEFydGVtIFNlbmljaGV2IDxhcnRlbXNlbkBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNkYXksIE9j
dG9iZXIgMTUsIDIwMjAgMjo0NiBQTQ0KVG86IFNwZW5jZXIgS3UgKOWPpOS4lueRnCkgPFNwZW5j
ZXIuS3VAcXVhbnRhdHcuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBNb2RpZnkgVGltZXN0YW1wIG9mIHBob3NwaG9yLWhv
c3Rsb2dnZXINCg0KSGkgU3BlbmNlciwNCg0KSSB0aGluayBpdCBpcyBhIGdvb2QgaWRlYS4NCldl
IGRpZG4ndCBoYXZlIGEgc2VydmljZSB0byBoYW5kbGUgdGhlc2UgbG9ncywgc28gdGhlIHNob3J0
IGZvcm1hdCB3YXMgZHVlIHRvIHRoZSBjb21wYWN0IGRpc3BsYXkgb3V0cHV0Lg0KDQotLQ0KQmVz
dCByZWdhcmRzLA0KQXJ0ZW0gU2VuaWNoZXYNCg0KT24gV2VkLCBPY3QgMTQsIDIwMjAgYXQgMToz
NiBQTSBTcGVuY2VyIEt1ICjlj6TkuJbnkZwpDQo8U3BlbmNlci5LdUBxdWFudGF0dy5jb20+IHdy
b3RlOg0KPg0KPiBIaSBBbGwsDQo+DQo+IFdlIGhhdmUgd29ya2VkIG9uIGEgcmVkZmlzaCBVUkkg
dGhhdCBwcm92aWRlcyBob3N0IGxvZyBpbmZvcm1hdGlvbiwgd2hpY2ggaXMgYmFzZWQgb24gb2Jt
Yy1jb25zb2xlIGFuZCBwaG9zcGhvci1ob3N0bG9nZ2VyLiBOb3cgd2UgY2FuIGdldCBob3N0IGxv
ZyBhbmQgZmlsbCBpbmZvcm1hdGlvbiBpbnRvIGhvc3QgbG9nIGVudHJ5LCBidXQgaGVyZSB3ZSBo
YXZlIGEgcHJvYmxlbSBhYm91dCB0aW1lc3RhbXAuDQo+DQo+DQo+DQo+IE9uZSBvZiB0aGUgbG9n
IGVudHJ5IGxldmVsIOKAnGNyZWF0ZWQgdGltZeKAnSwgbmVlZCB0byBmb2xsb3cgdGhlIHRpbWUg
Zm9ybWF0IGxpa2UgUkZDMzMzOSwgYW5kIGZvciBub3csIHRoZSBob3N0IGxvZyBvbmx5IHByb3Zp
ZGVzIGhvdXIsIG1pbnV0ZSwgYW5kIHNlY29uZCB0aW1lIGluZm8uIFdlIHdhbnQgdG8gbW9kaWZ5
IHRoZSB0aW1lc3RhbXAgdG8gUkZDMzMzOSBmb3JtYXQgdG8gZml0IHRoZSBsb2cgZW50cnkgdGlt
ZSBmb3JtYXQuDQo+DQo+DQo+DQo+IEhlcmUgaXMgYSBzYW1wbGUgaG9zdCBsb2cgd2l0aCB0aW1l
c3RhbXAgcHJvdmlkaW5nIGJ5IHBob3NwaG9yLWhvc3Rsb2dnZXI6DQo+DQo+IFsgMDA6MDA6MzEg
XSA+Pj4gTG9nIGNvbGxlY3Rpb24gc3RhcnRlZCBhdCAxOTcwLTAxLTAxIDAwOjAwOjMxDQo+DQo+
DQo+DQo+IEFmdGVyIG1vZGlmaWVkLCB0aGUgbWVzc2FnZSB3aWxsIGJlIGxpa2VkOg0KPg0KPiBb
IDE5NzAtMDEtMDFUMDA6MDA6MzErMDA6MDAgXSA+Pj4gTG9nIGNvbGxlY3Rpb24gc3RhcnRlZCBh
dCAxOTcwLTAxLTAxIA0KPiAwMDowMDozMQ0KPg0KPg0KPg0KPiBpZiB0aGUgY2hhbmdlcyBtYWtl
IHNlbnNlLCB3ZSB3aWxsIHB1c2ggdGhlIGNoYW5nZXMgdG8gdXBzdHJlYW0uDQo+DQo+IFBsZWFz
ZSBsZXQgdXMga25vdyBpZiB0aGVyZSdzIGFueSBpc3N1ZSwgdGhhbmsgeW91Lg0KPg0KPg0KPg0K
PiBTaW5jZXJlbHksDQo+DQo+IFNwZW5jZXINCg==
