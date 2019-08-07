Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D4384B07
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 13:49:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463VCY3SJHzDqKX
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 21:49:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.1; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463V9c0ST9zDr6v
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 21:47:30 +1000 (AEST)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.us-west-2.aws.symcld.net id 75/13-23407-F4ABA4D5;
 Wed, 07 Aug 2019 11:47:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKKsWRWlGSWpSXmKPExsWS8eIhr67/Lq9
 YgzlHGC1Otbxgsdh7YCOLA5PHgk2lHudnLGQMYIpizcxLyq9IYM14dWU5a0GLdkXz+4+MDYx7
 tLoYOTmEBP4zSrzYHNDFyAVkv2CUuLV7ChtEYjejxIbfVSA2m4CWxML/e5i6GDk4RAQ0JP6/y
 wQJMwtYSmz+eIkdpFdYoINRov3BC3aQhIhArETjqkVMEHaYxKuPf8B6WQRUJL5/AAvzAvVuO/
 6HGWLvdGaJN51PwRKcAoEShz+eYgGxGQVkJaY9us8EsUxcYu60WawgtoSAgMSSPeeZIWxRiZe
 P/0HFFSSu3lsCtotZQFNi/S59iFZFiSndD9kh9gpKnJz5hGUCo+gsJFNnIXTMQtIxC0nHAkaW
 VYzmSUWZ6RkluYmZObqGBga6hoZGuobGQNpCL7FKN1GvtFi3PLW4RNdIL7G8WK+4Mjc5J0UvL
 7VkEyMwtlIKmoR2ME6c9UbvEKMkB5OSKK/ZC89YIb6k/JTKjMTijPii0pzU4kOMMhwcShK8Dj
 u9YoUEi1LTUyvSMnOAcQ6TluDgURLhjdoBlOYtLkjMLc5Mh0idYgzkmPBy7iJmjrfL5wHJtq0
 g8uBREPm9eSGQPNa0BEgembt0EbMQS15+XqqUOO8ykEECIIMySvPg1sBS1yVGWSlhXkYGBgYh
 noLUotzMElT5V4ziHIxKwrwpINfyZOaVwF3zCuhQJqBDi955ghxakoiQkmpgmupbP+v6qzfCH
 atlb/6bsdtTbH3Koi1XzgfcDVlmFRSrM+u++lcNLolbf5mzOyszNGa+OjHFKVVfKWWf4oqGpQ
 0mBwy/vVj7PGiZ9tq640s2WD/TNphwVst6J5vDjW2JlSsep2gWpd/WmeJwwaqiJLrNs/UBx+9
 LD1ZPbfUN8ve7sePtROmgdfcWsnksWCgl2Ou/5vQ67V1WP5Y8u8zDqCIR0311U7SgjGLVHF4b
 Y/cpe27eOtU2hX16BVvXpvPRsQ88MlrOSuq89tnByDHhlzrf/GtBT5o2iv2eYCdScv5Z4Vdmh
 /2bZPnMTbZtP8qrLR0TEdBSmTpBTGTNxLo9nS5cqR+TJ6eURDFvmVHdqsRSnJFoqMVcVJwIAN
 MPdtHYAwAA
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-12.tower-326.messagelabs.com!1565178446!109174!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17883 invoked from network); 7 Aug 2019 11:47:26 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-12.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Aug 2019 11:47:26 -0000
Received: from pekwpmail03.lenovo.com (unknown [10.96.93.81])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 33141DE274276F945D1B;
 Wed,  7 Aug 2019 07:47:24 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail03.lenovo.com
 (10.96.93.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 7 Aug
 2019 19:47:22 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Wed, 7 Aug 2019 19:47:22 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: Patrick Venture <venture@google.com>
Subject: =?utf-8?B?562U5aSNOiBbRXh0ZXJuYWxdICBSZTogQ2xhcmlmeSBzb21lIHF1ZXN0aW9u?=
 =?utf-8?Q?s_about_BIOS_update_(phosphor-ipmi-flash)?=
Thread-Topic: [External]  Re: Clarify some questions about BIOS update
 (phosphor-ipmi-flash)
Thread-Index: AdVLg2vX/wUFPXlKRwewZJrmgI2ZEv//xZKAgAAEMgCAAAH7gIAAENoAgAAyKgD//O82IA==
Date: Wed, 7 Aug 2019 11:47:22 +0000
Message-ID: <c2042ca491d34de99777995068b603af@lenovo.com>
References: <95784a9aed5d4f269fdf95684500d48e@lenovo.com>
 <CAO=notyC=6U8Afq8yOPxW0e933kXq3ubTVR5mc3WVGBhd4F08g@mail.gmail.com>
 <CAO=notwQv43Nbe9nUfzFDM1GYDqc6u6Oro83BGdcZ1rjePu-hg@mail.gmail.com>
 <CAO=notyQpRiwYMsGY83DyvaM-a_c+fCpguFyFW4dqQz3_yWWjA@mail.gmail.com>
 <CAO=notzWsPKqV_+rgm=Hzv27YfoRQtz8OPwVDOmGuvRS20BDwA@mail.gmail.com>
 <CAO=notwQ52OeLrFNisQyfj__3LuEE2u_48FhdcApUDyOGYOovQ@mail.gmail.com>
In-Reply-To: <CAO=notwQ52OeLrFNisQyfj__3LuEE2u_48FhdcApUDyOGYOovQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.252]
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

SGkgUGF0cmljaywNCg0KVGhlIHRyaWdnZXJlZCAicGhvc3Bob3ItaXBtaS1mbGFzaC1iaW9zLXVw
ZGF0ZS50YXJnZXQiIHNlZW1zIHRvIGJlZW4gc29sdmVkLCBidXQgdGhlIEJJT1MgdXBkYXRlIHN0
YXR1cyBoYXMgbm90IHlldCBiZWVuIGZpeGVkLg0KQ291bGQgd2UgYWRkIGNoZWNraW5nIHRoZSBj
b250ZW50cyBvZiB0aGUgZmlsZSBpbiBTeXN0ZW1kVXBkYXRlTWVjaGFuaXNtOjpzdGF0dXMoKSBm
dW5jdGlvbiBvZiB1cGRhdGVfc3lzdGVtZC5jcHAgc3VjaCBhcyB2ZXJpZmljYXRpb24gbWVjaGFu
aXNtIFN5c3RlbWRXaXRoU3RhdHVzRmlsZTo6c3RhdHVzKCkgb2YgZ2VuZXJhbF9zeXN0ZW1kLmNw
cD8NCg0KUmVnYXJkcywNCkFuZHJldw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bk
uro6IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPiANCuWPkemAgeaXtumXtDog
MjAxOeW5tDjmnIg25pelIDQ6MzkNCuaUtuS7tuS6ujogQW5kcmV3IE1TMSBQZW5nIDxwZW5nbXMx
QGxlbm92by5jb20+DQrmioTpgIE6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgRHVrZSBLSCBE
dSA8ZHVraEBsZW5vdm8uY29tPjsgWW9uZ2h1aSBZSDIxIExpdSA8bGl1eWgyMUBsZW5vdm8uY29t
PjsgTGlzYSBZSjE5IExpdSA8bGl1eWoxOUBsZW5vdm8uY29tPg0K5Li76aKYOiBbRXh0ZXJuYWxd
IFJlOiBDbGFyaWZ5IHNvbWUgcXVlc3Rpb25zIGFib3V0IEJJT1MgdXBkYXRlIChwaG9zcGhvci1p
cG1pLWZsYXNoKQ0KDQpPbiBNb24sIEF1ZyA1LCAyMDE5IGF0IDEwOjM5IEFNIFBhdHJpY2sgVmVu
dHVyZSA8dmVudHVyZUBnb29nbGUuY29tPiB3cm90ZToNCj4NCj4gT24gTW9uLCBBdWcgNSwgMjAx
OSBhdCA5OjM5IEFNIFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPiB3cm90ZToN
Cj4gPg0KPiA+IE9uIE1vbiwgQXVnIDUsIDIwMTkgYXQgOTozMiBBTSBQYXRyaWNrIFZlbnR1cmUg
PHZlbnR1cmVAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gT24gTW9uLCBBdWcgNSwg
MjAxOSBhdCA5OjE3IEFNIFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPiB3cm90
ZToNCj4gPiA+ID4NCj4gPiA+ID4gT24gTW9uLCBBdWcgNSwgMjAxOSBhdCA0OjU2IEFNIEFuZHJl
dyBNUzEgUGVuZyA8cGVuZ21zMUBsZW5vdm8uY29tPiB3cm90ZToNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IEhpIFBhdHJpY2ssDQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gSSBoYXZlIHNvbWUgcXVlc3Rpb25zIGFib3V0IEJJT1MgdXBkYXRlIHZpYSBwaG9zcGhvci1p
cG1pLWZsYXNoIHdpdGggTDJBLCBwbGVhc2UgaGVscCB0byBjbGFyaWZ5LiBUaGFua3MuDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rcyBmb3Ig
Z2l2aW5nIGl0IGEgc2hvdCEgIEkgZG9uJ3QgaGF2ZSBhbnkgc3lzdGVtcyB1c2luZyANCj4gPiA+
ID4gdGhpcyBmb3IgQklPUyB1cGRhdGUsIHNvIEknbSBjdXJpb3VzIHdoZXJlIHRoZXJlIG1heSBi
ZSBpc3N1ZXMgDQo+ID4gPiA+IGx1cmtpbmcgOikNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
PiAxLiBIb3cgY2FuIEkgdXBkYXRlIHRoZSBzdGF0dXMgKHN1Y2Nlc3Mgb3IgZmFpbHVyZSkgYWZ0
ZXIgdXBncmFkZSBCSU9TIGZpcm13YXJlPyBDdXJyZW50bHksIHRoZSB1cGRhdGUgc3RhdHVzIG9u
bHkgYXBwZWFyICJydW5uaW5nIi4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIHNlZSwg
dGhlIHVwZGF0ZSBtZWNoYW5pc20gZG9lc24ndCBoYXZlIGEgdmVyaWZpY2F0aW9uIG9wdGlvbi4g
IA0KPiA+ID4gPiBBIGJpdCBvZiBhbiBvdmVyc2lnaHQuICBJJ2xsIGhhdmUgc29tZXRoaW5nIHVw
IGZvciByZXZpZXcgbGF0ZXIgDQo+ID4gPiA+IHRvZGF5LiAgVGhlbiBpdCdsbCBiZSBzb21ldGhp
bmcgeW91IGNvbmZpZ3VyZSBzaW1pbGFybHkgdG8gdGhlIA0KPiA+ID4gPiB2ZXJpZnlTeXN0ZW1k
IGpzb24gZW50cnkuDQo+ID4gPiA+DQo+ID4gPiA+ID4gMi4gSXQgd2FzIGZhaWxlZCB3aGVuIHRy
aWdnZXJlZCAicGhvc3Bob3ItaXBtaS1mbGFzaC1iaW9zLXVwZGF0ZS50YXJnZXQiIHNpbmNlIHRo
ZSBqb2ItbW9kZSBpcyBudWxsIHN0cmluZy4gSXQgY2FuIHdvcmsgd2VsbCB3aGVuIEkgYWRkIHN0
cmluZyAicmVwbGFjZSIgdG8gam9iLW1vZGUuIEhvdyBjYW4gSSBjb25maWcgKGpzb24gZmlsZSBv
ciBjb25maWd1cmUgcGFyYW1ldGVyKSB0byBzdXBwb3J0IGl0Pw0KPg0KPiBUaGlzIHBhdGNoIHdp
bGwgZW5hYmxlIHlvdSB0byBzcGVjaWZ5ICJtb2RlIiBpbiB0aGUganNvbi4gKioqIG5vdGU6IGkg
DQo+IHdpbGwgc2V0IHNvbWUgdGltZSBhc2lkZSBzaG9ydGx5IHRvIGRvY3VtZW50IHdyaXRpbmcg
anNvbiANCj4gY29uZmlndXJhdGlvbnMuDQo+DQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovYy9vcGVuYm1jL3Bob3NwaG9yLWlwbWktZmxhc2gvKy8yNDENCj4gNjcNCj4NCj4g
PiA+ID4NCj4gPiA+ID4gSSdsbCB0YWtlIGEgbG9vayEgIFRoZSBwYXJhbWV0ZXIgZm9yIGpvYi1t
b2RlLCBJIHRob3VnaHQsIHdhcyANCj4gPiA+ID4gb3B0aW9uYWw/ICBTaW5jZSB3ZSBkb24ndCBz
cGVjaWZ5IGl0IGZvciBvdGhlciBqb2JzIA0KPiA+ID4gPiAodmVyaWZpY2F0aW9uLCBldGMpLiAg
VGhlIHN0cmluZyBzaG91bGQgYmUgZW1wdHkgYnkgZGVmYXVsdCBhbmQgDQo+ID4gPiA+IHRoZW4g
bm90IGFkZGVkIGFzIGENCj4gPiA+ID4gbnVsbC1zdHJpbmc6DQo+ID4gPiA+DQo+ID4gPiA+IGh0
dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWlwbWktZmxhc2gvYmxvYi9mMGM3MWRm
MjUxNDkNCj4gPiA+ID4gMjdlOTMzZjZmYzMzZDk2NjlhYjA2NjNhMDcwNi9ibWMvdXBkYXRlX3N5
c3RlbWQuY3BwI0w0OQ0KPiA+ID4NCj4gPiA+IEkgc2VlIGl0IGlzIHJlcXVpcmVkISAgU2luY2Ug
SSBhbHdheXMgY29uZmlndXJlIHdpdGggcmVib290LCBJIA0KPiA+ID4gbmV2ZXIgc2F3IHRoaXMg
ZmFpbHVyZS4gSSdsbCBkZWZhdWx0IGl0IHRvICJyZXBsYWNlIg0KPiA+DQo+ID4gRmlyc3QgcGF0
Y2ggaW4gdGhlIHNlcmllcyBnZW5lcmF0ZWQgZnJvbSB5b3VyIGVtYWlsOg0KPiA+DQo+ID4gaHR0
cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvcGhvc3Bob3ItaXBtaS1m
bGFzaC8rLzINCj4gPiA0MTY1DQo+ID4NCj4gPiBOZXh0OiBqc29uIGNvbmZpZ3VyYXRpb24gb3B0
aW9uIHRvIGNvbnRyb2wgdGhlIGpvYi1tb2RlLg0KPiA+IFRoZW4gbWVyZ2UgdmVyaWZpY2F0aW9u
IGFuZCB1cGRhdGUgb2JqZWN0cywgcy50LiB5b3UgY2FuIHNwZWNpZnkgdGhlIA0KPiA+IHN0YXR1
cyBwYXRoLg0KDQpUaGlzIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3IgYSBuZXcgdXBkYXRlIGNv
bmZpZ3VyYXRpb24gdGhhdCBsZXRzIHlvdSByZWFkIHRoZSBzdGF0dXMgZnJvbSBhIGZpbGUuDQoN
Cmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovMjQxNzENCg0KPiA+DQo+ID4gKioq
IEEgbGF0ZXIgcGF0Y2hzZXQgY2FuIGhhdmUgdGhlIHN0YXR1cyBiZSBub3QgYSBwYXRoLCBidXQg
YSBkYnVzIA0KPiA+IHByb3BlcnR5IG9yIGRidXMgcGF0aCAtLSBpZiBzb21lb25lIHdhbnRzIHRv
IGltcGxlbWVudCBhIG5ldyBvYmplY3QgDQo+ID4gZm9yIHRoaXMsIGl0J3Mgc29tZXdoYXQgdHJp
dmlhbC4NCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSSBkb24ndCB0aGluayBJIGhhdmUg
YSB1bml0LXRlc3QgdGhhdCB2ZXJpZmllcyB0aGUgcGFyYW1ldGVycyANCj4gPiA+ID4gYXJlIHNl
bnQgZG93biBwcm9wZXJseSwgc28gSSdsbCBhbHNvIGFkZCB0aGF0IHRvZGF5IEFORCBJJ2xsIGFk
ZCANCj4gPiA+ID4gYW4gb3B0aW9uYWwgbW9kZSBwYXJhbWV0ZXIgdG8gdGhlIGpzb24uDQo+ID4g
PiA+DQo+ID4gPiA+IFNlbmRpbmcgZm9yIHJldmlldyB0b2RheS4NCj4gPiA+ID4NCj4gPiA+ID4g
Li4uDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
UmVnYXJkcywNCj4gPiA+ID4gPiBBbmRyZXcNCg==
