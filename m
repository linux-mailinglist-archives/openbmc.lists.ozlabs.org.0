Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30EF2940
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 09:36:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xZF68F2zF631
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 19:36:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.118;
 helo=mail1.bemta23.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477xYN0FN2zF69J
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 19:35:19 +1100 (AEDT)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-7.bemta.az-c.us-east-1.aws.symcld.net id FA/58-19962-347D3CD5;
 Thu, 07 Nov 2019 08:35:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRWlGSWpSXmKPExsWS8eIhj67z9cO
 xBpemylm8mLKI0eLw1AYmi1MtL1gcmD0mLDrA6DHvZKDH+RkLGQOYo1gz85LyKxJYM5q22Bc0
 K1dsPZffwHhCqYuRi0NIoIFJ4vSfyywQzitGiRv/trFDOHsZJV51tDJ1MXJysAkoSbS8WgGWE
 BHoZZQ42jOTsYuRg0NYwEXiyxJBkBoRAVeJSacPM4OERQTcJJ4tLwEJswioSGx+94EdxOYVsJ
 SYt/QlI9R8Jokr3adZQRKcAs4S0/tXM4LYjAKyEk8WPAPbyywgLnHuYitYs4SAgMSSPeeZIWx
 RiZeP/7FC2AoSzXtes4DsZRbQlFi/Sx+iVVFiSvdDqL2CEidnPmGZwCgyC8nUWQgds5B0zELS
 sYCRZRWjaVJRZnpGSW5iZo6uoYGBrqGhka6ZrpGhXmKVbrJeabFuamJxiS6QW16sV1yZm5yTo
 peXWrKJERhTKQVsojsYOz681TvEKMnBpCTKa3zoUKwQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd
 4HVw7HCgkWpaanVqRl5gDjGyYtwcGjJMLbdxUozVtckJhbnJkOkTrFaMkx4eXcRcwcB4/OA5J
 H5i5dxCzEkpeflyolzvsLZJ4ASENGaR7cOFgKusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJ
 mPc0yFqezLwSuK3AZAL0iwivwY1DIAeVJCKkpBqY0mtdtrlyllUnusz6pO6wc/XtDYuV7/08/
 Pz2tfXfX3CnSa/ZJRdndLzvlWDfz31GPAU6An82dMh7N02bx9kWqDK53/3vnHXiemEhLw83Tl
 Y69mCXbfDvpDO+jqZ1j8vnp/7uFEmJqWPW/DHT5t/ktQ89g5qUlF6pbTspy3Z7zvH0pDnrd2/
 9Oo+n6uJBwQ/lAhXzPNduv5lfaCzxW7rqgZNeVgZDUf0CPyvL180pJVFhF7nretnF181g/1/p
 9qZPtT8zubuH9cUbfoOywrSsj/yrOsvZzjoce/EoJdIwfmHqr2fsldbFNm82yL1lD0nZY6H9Z
 6GhyuU6s3iNVbe5U7vl5SJ0F0WbV11kPaXEUpyRaKjFXFScCACs05NLvAMAAA==
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-20.tower-406.messagelabs.com!1573115715!91253!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22689 invoked from network); 7 Nov 2019 08:35:15 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-20.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Nov 2019 08:35:15 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 7CB4188FE8CDC706E0EE;
 Thu,  7 Nov 2019 03:35:14 -0500 (EST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Thu, 7 Nov 2019 16:35:12 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Thu, 7 Nov 2019 16:34:50 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: James Feist <james.feist@linux.intel.com>, Matt Spinler
 <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External] Power-on monitor for phosphor-hwmon question
Thread-Topic: [External] Power-on monitor for phosphor-hwmon question
Thread-Index: AQHViNvz9OdLXZ460kajgXlfSVMf8KdmSTSAgBeGTaCAAI9UAIABEBNg
Date: Thu, 7 Nov 2019 08:34:50 +0000
Message-ID: <34d4cce7efad469e8def00335523a12b@lenovo.com>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
 <97ba4063-0066-4ba5-bd98-03f1b6aa63dd@linux.intel.com>
 <25d62ba90109494e97119222fd015d84@lenovo.com>
 <78e0d80f-7e7b-51f2-e2cc-f2cf6a819062@linux.intel.com>
In-Reply-To: <78e0d80f-7e7b-51f2-e2cc-f2cf6a819062@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW1lcyBGZWlzdCA8amFtZXMu
ZmVpc3RAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgNywgMjAx
OSA3OjM5IEFNDQo+IFRvOiBJdmFuIExpMTEgPHJsaTExQGxlbm92by5jb20+OyBNYXR0IFNwaW5s
ZXIgPG1zcGlubGVyQGxpbnV4LmlibS5jb20+Ow0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcN
Cj4gU3ViamVjdDogUmU6IFtFeHRlcm5hbF0gUG93ZXItb24gbW9uaXRvciBmb3IgcGhvc3Bob3It
aHdtb24gcXVlc3Rpb24NCj4gDQo+IE9uIDExLzUvMTkgMTE6MjUgUE0sIEl2YW4gTGkxMSB3cm90
ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFtZXMgRmVp
c3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgT2N0
b2JlciAyMiwgMjAxOSAxMTo1MSBQTQ0KPiA+PiBUbzogTWF0dCBTcGlubGVyIDxtc3BpbmxlckBs
aW51eC5pYm0uY29tPjsgSXZhbiBMaTExDQo+ID4+IDxybGkxMUBsZW5vdm8uY29tPjsgb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbRXh0ZXJuYWxdIFBvd2VyLW9u
IG1vbml0b3IgZm9yIHBob3NwaG9yLWh3bW9uIHF1ZXN0aW9uDQo+ID4+DQo+ID4+IE9uIDEwLzIy
LzE5IDY6MjMgQU0sIE1hdHQgU3BpbmxlciB3cm90ZToNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gT24g
MTAvMjEvMjAxOSA2OjAyIEFNLCBJdmFuIExpMTEgd3JvdGU6DQo+ID4+Pj4NCj4gPj4+PiBIaSBU
ZWFtLA0KPiA+Pj4+DQo+ID4+Pj4gRG9lcyBhbnlvbmUgaGF2ZSBzdWdnZXN0aW9uIGZvciB0aGlz
ID8NCj4gPj4+Pg0KPiA+Pj4gSGksIHlvdSdyZSByaWdodCwgaXQgZG9lc24ndCBzdXBwb3J0IHRo
YXQgeWV0LsKgIFdlJ3ZlIGhhZCBhIGZldw0KPiA+Pj4gaW50ZXJuYWwgZGlzY3Vzc2lvbnMgYWJv
dXQgaG93IHRvIGhhbmRsZSB0aGF0IGdyYWNlZnVsbHksIHRob3VnaCBvdXINCj4gPj4+IHBsYXRm
b3JtcyBkb24ndCB1c2Ugc2VsLWxvZ2dlciwgYnV0IG5vdGhpbmcgc29saWQgY2FtZSBvdXQgb2Yg
dGhlbQ0KPiA+Pj4gYW5kIHdlIGRvbid0IGhhdmUgYW55dGhpbmcgc2NoZWR1bGVkIHlldC4NCj4g
Pj4+DQo+ID4+PiBJdCB3b3VsZCBiZSBlYXN5IGVub3VnaCB0byBoYXZlIGEgd2F0Y2ggb24gdGhl
IFBHT09EIHByb3BlcnR5LCBhbmQNCj4gPj4+IHRoZW4gZG8geW91IHdoYXQgeW91IHdhbnQsIGxp
a2UgbWF5YmUgdHVybmluZyBvZmYgdGhlIHRocmVzaG9sZHMuDQo+ID4+Pg0KPiA+Pj4gSSBoZWFy
ZCB0aGF0IHRoZSBkLWJ1cyBzZW5zb3JzIHJlcG9zaXRvcnkgaGFzIHNvbWUgc29ydCBvZiBzdXBw
b3J0DQo+ID4+PiBmb3IgdGhpcywgYnV0IHNpbmNlIHdlIGRvbid0IHVzZSBpdCBJJ20gbm90IHN1
cmUgd2hhdCBhbGwgdGhhdA0KPiA+Pj4gZW50YWlscy4gSSB0aGluayBpdCBtYXkgYWxzbyBmb3Jj
ZSB5b3UgdG8gcmVwbGFjZQ0KPiA+Pj4gcGhvc3Bob3ItaW52ZW50b3ItbWFuYWdlciB3aXRoIGVu
dGl0eS1tYW5hZ2VyLg0KPiA+Pg0KPiA+PiBJdCBzaG91bGQgZm9yY2UgeW91IHRvIHN3aXRjaCAx
MDAlLCBidXQgeW91IHdvdWxkIGF0IGxlYXN0IGhhdmUgdG8gcnVuIGJvdGguDQo+ID4+DQo+ID4+
IEhlcmUncyB3aGF0IGRidXMtc2Vuc29ycyBkb2VzOg0KPiA+Pg0KPiA+Pg0KPiBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9kYnVzLXNlbnNvcnMvYmxvYi80MzJkMWVkZjdhYzg2ZjY5NTU4Mjcz
MzANCj4gPj4gNw0KPiA+PiBhNTllNGIxY2Y4NmI4YTYvc3JjL1V0aWxzLmNwcCNMMTQxDQo+ID4+
DQo+ID4+IEJhc2ljYWxseSBqdXN0IGEgZGJ1cy1tYXRjaCB0aGF0IHNldHMgYSAicG93ZXJTdGF0
dXNPbiIgYm9vbCB0aGF0IGNhbg0KPiA+PiBiZSBxdWVyaWVkLiBEZXBlbmRpbmcgb24gdGhlIHNl
bnNvciB0eXBlIHRocmVzaG9sZHMgZG9uJ3QgZ2V0IGNyb3NzZWQNCj4gPj4gaWYgdGhhdCBib29s
IGlzIHNldC4gV2UgYWxzbyBoYXZlIGEgc2ltaWxhciBib29sIGZvciBiaW9zIHBvc3QsIGFzDQo+
ID4+IHNvbWUgc2Vuc29ycyBjb21lIHVwIGxhdGVyIGFmdGVyIHBvd2VyIG9uLg0KPiA+Pg0KPiA+
DQo+ID4gSSB0cnkgdG8gdXNlIGRidXMtc2Vuc29ycyBhbmQgc2V0ICJwb3dlclN0YXR1c09uIiBi
b29sLCBidXQgc3RpbGwgaGF2ZQ0KPiBpbmNvcnJlY3QgdGhyZXNob2xkIGxvZ3MgZHVyaW5nIHBv
d2VyIG9uKFMwKSB0byBwb3dlciBvZmYoUzUpIHN0YXRlLg0KPiA+IENvdWxkIHlvdSBoZWxwIHRv
IGNvbW1lbnQgb24gaXQgPw0KPiA+DQo+IA0KPiBUaGlzIGhhcyBvbmx5IGJlZW4gdGVzdGVkIHdp
dGggeDg2LXBvd2VyLWNvbnRyb2wsIGFyZSB5b3UgdXNpbmcgdGhhdCBwcm9qZWN0DQo+IGZvciBw
b3dlciBjb250cm9sIG9yIHNvbWV0aGluZyBlbHNlPw0KPiANCg0KR290IGl0LiBJIGN1cnJlbnRs
eSB1c2UgcGhvc3Bob3Itc3RhdGUtbWFuYWdlciBmb3IgcG93ZXIgY29udHJvbC4NCg0KPiA+Pj4N
Cj4gPj4+PiBUaGFua3MgeW91ciBncmVhdCBzdXBwb3J0IGluIGFkdmFuY2UuDQo+ID4+Pj4NCj4g
Pj4+PiAqRnJvbToqb3BlbmJtYw0KPiA8b3BlbmJtYy1ib3VuY2VzK3JsaTExPWxlbm92by5jb21A
bGlzdHMub3psYWJzLm9yZz4NCj4gPj4gKk9uDQo+ID4+Pj4gQmVoYWxmIE9mICpJdmFuIExpMTEN
Cj4gPj4+PiAqU2VudDoqIEZyaWRheSwgT2N0b2JlciAxOCwgMjAxOSA1OjU5IFBNDQo+ID4+Pj4g
KlRvOiogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+ID4+Pj4gKlN1YmplY3Q6KiBbRXh0ZXJu
YWxdIFBvd2VyLW9uIG1vbml0b3IgZm9yIHBob3NwaG9yLWh3bW9uIHF1ZXN0aW9uDQo+ID4+Pj4N
Cj4gPj4+PiBIaSBUZWFtLA0KPiA+Pj4+DQo+ID4+Pj4gV2UgZm91bmQgdGhhdCB0aGVyZSdzIG5v
IHBvd2VyLW9uIG1vbml0b3IgbWVjaGFuaXNtIGluDQo+ID4+IHBob3NwaG9yLWh3bW9uLg0KPiA+
Pj4+DQo+ID4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItaHdtb24NCj4g
Pj4+Pg0KPiA+Pj4+IEFuZCBpdCB3aWxsIGNhdXNlIGluY29ycmVjdCB0aHJlc2hvbGQgbG9ncyB0
byBiZSBhZGRlZCB0byBqb3VybmFsDQo+ID4+Pj4gbG9nIGJ5ICdzZWwtbG9nZ2VyJyB3aGVuIHN5
c3RlbSBpcyBpbiBwb3dlciBvZmYoUzUpIHN0YXRlLg0KPiA+Pj4+DQo+ID4+Pj4gSXMgdGhlcmUg
YW55IHBsYW4gdG8gaW1wbGVtZW50IGl0PyBPciBvdGhlciByZXBvc2l0b3J5IHdlIGNhbiByZWZl
ciB0byA/DQo+ID4+Pj4NCj4gPj4+PiBUaGFua3MsDQo+ID4+Pj4NCj4gPj4+PiBJdmFuDQo+ID4+
Pj4NCj4gPj4+DQo=
