Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC4F1E5A75
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 10:12:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XgQz4Cg4zDqXJ
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 18:12:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=4103d62bc=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49XgP970GnzDqXM
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 18:10:35 +1000 (AEST)
IronPort-SDR: 80f6emkAQsVHuH7UNi2HQDexWaKw+R2dUUHVGCbeYfde1geVXesd9cKkRs8loxwEMk7psMmj6j
 KyOdgcpkWiuw==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx01.quantatw.com with ESMTP; 28 May 2020 16:09:07 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 28 May
 2020 16:09:04 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 28 May 2020 16:09:04 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Subject: RE: Question of ipmi command "Set User Access" in phosphor-host-ipmid
Thread-Topic: Question of ipmi command "Set User Access" in phosphor-host-ipmid
Thread-Index: AdYyYr9zUCZXjmdTQfedJ4FkegeSTQAC7EaAAJWdLNA=
Date: Thu, 28 May 2020 08:09:04 +0000
Message-ID: <420a769b740b4ec58c5f4702c5bb2fc2@quantatw.com>
References: <e46d19fbea37479ca10df26e35d474b2@quantatw.com>
 <e4c12ff6-3387-3dc6-eafa-42e5ac830079@linux.intel.com>
In-Reply-To: <e4c12ff6-3387-3dc6-eafa-42e5ac830079@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 3D20E257817D523969864E76D840C47CB241C039E7C3826DCFD62978A8E4D5C32000:8
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

SGkgUmljaGFyZCwNCg0KU28sIGl0IG5lZWQgdG8gY2hlY2sgdGhlIHJlcXVlc3QgY2hhbm5lbCBu
dW1iZXIgYmVmb3JlIHNldHRpbmcgdGhlIGRidXMgDQpiZWNhdXNlIGl0IGhhcyB0byBiZSBpbiBz
eW5jIHdpdGggc3lzdGVtIHVzZXIgcHJpdmlsZWdlIGxldmVsLg0KDQpTaW5jZSBteSBMQU4xIGFu
ZCB0aGUgcmVxdWVzdCBjaGFubmVsIG51bWJlciBhcmUgYm90aCAyLiANCk9uY2Ugd2UgY2FuIGdl
dCBMQU4xIGNoYW5uZWwgbnVtYmVyIGR5bmFtaWNhbGx5DQpodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9waG9zcGhvci1ob3N0LWlwbWlkL2Jsb2IvbWFzdGVyL3VzZXJfY2hhbm5lbC91c2VyX21n
bXQuY3BwI0w1MTINCg0KVGhpcyBpc3N1ZSB3aWxsIGJlIHNvbHZlZCByaWdodD8NCg0KPiBGcm9t
OiBUaG9tYWl5YXIsIFJpY2hhcmQgTWFyaWFuIDxyaWNoYXJkLm1hcmlhbi50aG9tYWl5YXJAbGlu
dXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMjYsIDIwMjAgMTI6MjggQU0NCj4g
VG86IFRvbnkgTGVlICin9aTltEkpIDxUb255LkxlZUBxdWFudGF0dy5jb20+DQo+IENjOiBvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFF1ZXN0aW9uIG9mIGlwbWkgY29t
bWFuZCAiU2V0IFVzZXIgQWNjZXNzIiBpbg0KPiBwaG9zcGhvci1ob3N0LWlwbWlkDQo+IA0KPiBI
aSBUb255LA0KPiANCj4gT25seSBJUE1JIG9mZmVycyBjaGFubmVsIGJhc2VkIHVzZXIgbGV2ZWwg
cHJpdmlsZWdlIGFzIG9mIG5vdywgUmVkZmlzaCB1c2VzDQo+IHNpbmdsZSBwcml2aWxlZ2UgYWNy
b3NzIGFsbCBjaGFubmVscy4gT3BlbkJNQyB1c2VyIG1hbmFnZW1lbnQgaXMgZGVzaWduZWQgdG8N
Cj4gaGF2ZSBzaW5nbGUgdXNlciBsZXZlbCBwcml2aWxlZ2UuIElQTUkgaXMgZGVzaWduZWQgdG8g
YmluZCBvbmUgb2YgdGhlIGNoYW5uZWwNCj4gcHJpdmlsZWdlIHVzZXIgdG8gdGhlIHVzZXIgbWFu
YWdlbWVudCwgYW5kIHJlc3QgbWFpbnRhaW4gaW4gaXQncyBvd24gZGF0YWJhc2UuDQo+IExBTiAx
IGlzIHVzZWQgZm9yIHRoYXQgc3luYy4NCj4gDQo+IE5vdGU6IERpc2N1c3Npb24gc3RhcnRlZCBp
biBSZWRmaXNoIGZvcnVtIHRvIGhhdmUgYSBjaGFubmVsIGJhc2VkIHJlc3RyaWN0aW9uLA0KPiBi
dXQgaXQncyBub3QgeWV0IG1hdGVyaWFsaXplZCBhbmQgcmVxdWlyZXMgbW9yZSB0YWtlcnMuDQo+
IA0KPiBSZWdhcmRzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gT24gNS8yNS8yMDIwIDEyOjU4IFBN
LCBUb255IExlZSAop/Wk5bRJKSB3cm90ZToNCj4gPiBJbiB0aGUgcHJvY2VzcyBvZiBjcmVhdGlu
ZyBhbiB1c2VyLA0KPiA+IEkgdXNlZCB0aGUgaXBtaSBjb21tYW5kICJpcG1pdG9vbCBwcml2IDx1
c2VyIGlkPiA8cHJpdmlsZWdlIGxldmVsPg0KPiBbPGNoYW5uZWwgbnVtYmVyPl0iLg0KPiA+IFRo
ZSAiVXNlclByaXZpbGVnZSIgb2YgdGhlIHVzZXIgSSBjcmVhdGVkIGluIGRidXMgaXMgZW1wdHku
IEJlY2F1c2UgbXkgTEFODQo+IGNoYW5uZWwgbnVtYmVyIGlzIG5vdCAxLg0KPiA+DQo+ID4NCj4g
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItaG9zdC1pcG1pZC9ibG9iL21hc3Rl
ci91c2VyX2NoYW5uDQo+IGUNCj4gPiBsL3VzZXJfbWdtdC5jcHAjTDg3OA0KPiA+DQo+ID4gV2h5
IGRpZCBpdCBuZWVkIHRvIGNoZWNrIHRoZSByZXF1ZXN0IGNoYW5uZWwgbnVtYmVyIGJlZm9yZSBz
ZXR0aW5nIHRoZQ0KPiBkYnVzPw0KPiA+IEkgY2FuJ3QgZmluZCB0aGUgcmVsYXRlZCByZXN0cmlj
dGlvbiBvZiBpdCBpbiAiU2V0IFVzZXIgQWNjZXNzIENvbW1hbmQiIGluIElQTUkNCj4gU1BFQy4N
Cj4gPg0KPiA+IFRoYW5rcw0KPiA+IEJlc3QgUmVnYXJkcywNCj4gPiBUb255DQo=
