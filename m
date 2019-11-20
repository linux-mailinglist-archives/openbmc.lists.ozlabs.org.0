Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F41040D1
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 17:30:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J7TB3TD7zDqtn
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 03:30:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.112;
 helo=mail1.bemta23.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J7SM0NwgzDqpv
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 03:29:22 +1100 (AEDT)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-d.us-east-1.aws.symcld.net id F4/75-24328-FD965DD5;
 Wed, 20 Nov 2019 16:29:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRWlGSWpSXmKPExsWSLveKXfde5tV
 Ygw3bTSxeTFnEaHF4agOTxamWFywOzB4TFh1g9Jh3MtDj/IyFjAHMUayZeUn5FQmsGQuOnmIu
 OK5VsfbnHdYGxgatLkYuDiGBBiaJPSfms0E4rxkl7s/bxwrh7GOUaF70A8jh5GATUJJoebWCH
 SQhItDLKHG0ZyZjFyMHh7CAi8SXJYIgNSICrhKTTh9mhrD9JJoaprGAlLAIqEqceBwMEuYVsJ
 S41reDHWo+k8Td2Y/B6hkFZCWeLHjGBGIzC4hLnLvYyg5iSwgISCzZc54ZwhaVePn4HyuErSD
 RvOc12HxmAU2J9bv0IVoVJaZ0P2SH2CUocXLmE5YJjMKzkEydhdAxC0nHLCQdCxhZVjGaJhVl
 pmeU5CZm5ugaGhjoGhoaAWldM73EKt0UvdJi3dTE4hJdQ73E8mK94src5JwUvbzUkk2MwPhJK
 eBi28H48+tbvUOMkhxMSqK8MwKvxgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4JVIBcoJFqWmp1
 akZeYAYxkmLcHBoyTCK5cBlOYtLkjMLc5Mh0idYrTkmPBy7iJmjoNH5wHJI3OXLmIWYsnLz0u
 VEudtBGkQAGnIKM2DGwdLN5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO6AJOXEE9mXgnc
 1ldABzEBHbRx7SWQg0oSEVJSDUwTeZ+aFdwr9pg4/4BBiv7VkFvz3fN0a9a1dPXcXdqmvHzLk
 e9nrWXs9cRVd+nVhckfDI8SVKp/8q59dsv1n8dmPjRR7oi9LfprJzd7KVOW1uMkNduT02wdvM
 J4Sp1EEn4/j9Y0sGlyvFSsdWcbx3GeF2rvjL/tPzG/8tTTJXcba6ZLmHdmGMvvV/jCW6V+8/P
 sBTeqpsw6dfTf8T5/w1OXAl8J8l2Y4sX8Wn8j+5K7T5w05jTbs0tp+XQpSJp0bs78GuDE/fWV
 zoZ9ao1Hy+vPJ3460Hf91UTut0d062ec889+43XVJf9lUv2WmcpXfKPevHyyI1bfcN6BgF+ZY
 boC9+dy2b3/MUnz7T5GI04lluKMREMt5qLiRAD2eAGxsgMAAA==
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-16.tower-426.messagelabs.com!1574267356!138086!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13995 invoked from network); 20 Nov 2019 16:29:18 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-16.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Nov 2019 16:29:18 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id E1C0AD91C65546E9E5D2;
 Thu, 21 Nov 2019 00:29:15 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Thu, 21 Nov 2019 00:28:57 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Thu, 21 Nov 2019 00:28:57 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: James Feist <james.feist@linux.intel.com>, Matt Spinler
 <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External] Power-on monitor for phosphor-hwmon question
Thread-Topic: [External] Power-on monitor for phosphor-hwmon question
Thread-Index: AQHViNvz9OdLXZ460kajgXlfSVMf8KdmSTSAgBeGTaCAAI9UAIABEBNggBSlMJA=
Date: Wed, 20 Nov 2019 16:28:57 +0000
Message-ID: <ad84afd6c4d042b79e8f4ab7050489c5@lenovo.com>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
 <97ba4063-0066-4ba5-bd98-03f1b6aa63dd@linux.intel.com>
 <25d62ba90109494e97119222fd015d84@lenovo.com>
 <78e0d80f-7e7b-51f2-e2cc-f2cf6a819062@linux.intel.com> 
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJdmFuIExpMTENCj4gU2VudDog
VGh1cnNkYXksIE5vdmVtYmVyIDcsIDIwMTkgNDozNSBQTQ0KPiBUbzogJ0phbWVzIEZlaXN0JyA8
amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPjsgTWF0dCBTcGlubGVyDQo+IDxtc3BpbmxlckBs
aW51eC5pYm0uY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJFOiBb
RXh0ZXJuYWxdIFBvd2VyLW9uIG1vbml0b3IgZm9yIHBob3NwaG9yLWh3bW9uIHF1ZXN0aW9uDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSmFtZXMgRmVpc3Qg
PGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4NCj4gPiBTZW50OiBUaHVyc2RheSwgTm92ZW1i
ZXIgNywgMjAxOSA3OjM5IEFNDQo+ID4gVG86IEl2YW4gTGkxMSA8cmxpMTFAbGVub3ZvLmNvbT47
IE1hdHQgU3Bpbmxlcg0KPiA+IDxtc3BpbmxlckBsaW51eC5pYm0uY29tPjsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQo+ID4gU3ViamVjdDogUmU6IFtFeHRlcm5hbF0gUG93ZXItb24gbW9uaXRv
ciBmb3IgcGhvc3Bob3ItaHdtb24gcXVlc3Rpb24NCj4gPg0KPiA+IE9uIDExLzUvMTkgMTE6MjUg
UE0sIEl2YW4gTGkxMSB3cm90ZToNCj4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+ID4+IEZyb206IEphbWVzIEZlaXN0IDxqYW1lcy5mZWlzdEBsaW51eC5pbnRlbC5jb20+DQo+
ID4gPj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAyMiwgMjAxOSAxMTo1MSBQTQ0KPiA+ID4+IFRv
OiBNYXR0IFNwaW5sZXIgPG1zcGlubGVyQGxpbnV4LmlibS5jb20+OyBJdmFuIExpMTENCj4gPiA+
PiA8cmxpMTFAbGVub3ZvLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiA+ID4+IFN1
YmplY3Q6IFJlOiBbRXh0ZXJuYWxdIFBvd2VyLW9uIG1vbml0b3IgZm9yIHBob3NwaG9yLWh3bW9u
DQo+ID4gPj4gcXVlc3Rpb24NCj4gPiA+Pg0KPiA+ID4+IE9uIDEwLzIyLzE5IDY6MjMgQU0sIE1h
dHQgU3BpbmxlciB3cm90ZToNCj4gPiA+Pj4NCj4gPiA+Pj4NCj4gPiA+Pj4gT24gMTAvMjEvMjAx
OSA2OjAyIEFNLCBJdmFuIExpMTEgd3JvdGU6DQo+ID4gPj4+Pg0KPiA+ID4+Pj4gSGkgVGVhbSwN
Cj4gPiA+Pj4+DQo+ID4gPj4+PiBEb2VzIGFueW9uZSBoYXZlIHN1Z2dlc3Rpb24gZm9yIHRoaXMg
Pw0KPiA+ID4+Pj4NCj4gPiA+Pj4gSGksIHlvdSdyZSByaWdodCwgaXQgZG9lc24ndCBzdXBwb3J0
IHRoYXQgeWV0LsKgIFdlJ3ZlIGhhZCBhIGZldw0KPiA+ID4+PiBpbnRlcm5hbCBkaXNjdXNzaW9u
cyBhYm91dCBob3cgdG8gaGFuZGxlIHRoYXQgZ3JhY2VmdWxseSwgdGhvdWdoDQo+ID4gPj4+IG91
ciBwbGF0Zm9ybXMgZG9uJ3QgdXNlIHNlbC1sb2dnZXIsIGJ1dCBub3RoaW5nIHNvbGlkIGNhbWUg
b3V0IG9mDQo+ID4gPj4+IHRoZW0gYW5kIHdlIGRvbid0IGhhdmUgYW55dGhpbmcgc2NoZWR1bGVk
IHlldC4NCj4gPiA+Pj4NCj4gPiA+Pj4gSXQgd291bGQgYmUgZWFzeSBlbm91Z2ggdG8gaGF2ZSBh
IHdhdGNoIG9uIHRoZSBQR09PRCBwcm9wZXJ0eSwgYW5kDQo+ID4gPj4+IHRoZW4gZG8geW91IHdo
YXQgeW91IHdhbnQsIGxpa2UgbWF5YmUgdHVybmluZyBvZmYgdGhlIHRocmVzaG9sZHMuDQo+ID4g
Pj4+DQo+ID4gPj4+IEkgaGVhcmQgdGhhdCB0aGUgZC1idXMgc2Vuc29ycyByZXBvc2l0b3J5IGhh
cyBzb21lIHNvcnQgb2Ygc3VwcG9ydA0KPiA+ID4+PiBmb3IgdGhpcywgYnV0IHNpbmNlIHdlIGRv
bid0IHVzZSBpdCBJJ20gbm90IHN1cmUgd2hhdCBhbGwgdGhhdA0KPiA+ID4+PiBlbnRhaWxzLiBJ
IHRoaW5rIGl0IG1heSBhbHNvIGZvcmNlIHlvdSB0byByZXBsYWNlDQo+ID4gPj4+IHBob3NwaG9y
LWludmVudG9yLW1hbmFnZXIgd2l0aCBlbnRpdHktbWFuYWdlci4NCj4gPiA+Pg0KPiA+ID4+IEl0
IHNob3VsZCBmb3JjZSB5b3UgdG8gc3dpdGNoIDEwMCUsIGJ1dCB5b3Ugd291bGQgYXQgbGVhc3Qg
aGF2ZSB0byBydW4NCj4gYm90aC4NCj4gPiA+Pg0KPiA+ID4+IEhlcmUncyB3aGF0IGRidXMtc2Vu
c29ycyBkb2VzOg0KPiA+ID4+DQo+ID4gPj4NCj4gPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9kYnVzLXNlbnNvcnMvYmxvYi80MzJkMWVkZjdhYzg2ZjY5NTU4MjczMzANCj4gPiA+PiA3DQo+
ID4gPj4gYTU5ZTRiMWNmODZiOGE2L3NyYy9VdGlscy5jcHAjTDE0MQ0KPiA+ID4+DQo+ID4gPj4g
QmFzaWNhbGx5IGp1c3QgYSBkYnVzLW1hdGNoIHRoYXQgc2V0cyBhICJwb3dlclN0YXR1c09uIiBi
b29sIHRoYXQNCj4gPiA+PiBjYW4gYmUgcXVlcmllZC4gRGVwZW5kaW5nIG9uIHRoZSBzZW5zb3Ig
dHlwZSB0aHJlc2hvbGRzIGRvbid0IGdldA0KPiA+ID4+IGNyb3NzZWQgaWYgdGhhdCBib29sIGlz
IHNldC4gV2UgYWxzbyBoYXZlIGEgc2ltaWxhciBib29sIGZvciBiaW9zDQo+ID4gPj4gcG9zdCwg
YXMgc29tZSBzZW5zb3JzIGNvbWUgdXAgbGF0ZXIgYWZ0ZXIgcG93ZXIgb24uDQo+ID4gPj4NCj4g
PiA+DQo+ID4gPiBJIHRyeSB0byB1c2UgZGJ1cy1zZW5zb3JzIGFuZCBzZXQgInBvd2VyU3RhdHVz
T24iIGJvb2wsIGJ1dCBzdGlsbA0KPiA+ID4gaGF2ZQ0KPiA+IGluY29ycmVjdCB0aHJlc2hvbGQg
bG9ncyBkdXJpbmcgcG93ZXIgb24oUzApIHRvIHBvd2VyIG9mZihTNSkgc3RhdGUuDQo+ID4gPiBD
b3VsZCB5b3UgaGVscCB0byBjb21tZW50IG9uIGl0ID8NCj4gPiA+DQo+ID4NCj4gPiBUaGlzIGhh
cyBvbmx5IGJlZW4gdGVzdGVkIHdpdGggeDg2LXBvd2VyLWNvbnRyb2wsIGFyZSB5b3UgdXNpbmcg
dGhhdA0KPiA+IHByb2plY3QgZm9yIHBvd2VyIGNvbnRyb2wgb3Igc29tZXRoaW5nIGVsc2U/DQo+
ID4NCj4gDQo+IEdvdCBpdC4gSSBjdXJyZW50bHkgdXNlIHBob3NwaG9yLXN0YXRlLW1hbmFnZXIg
Zm9yIHBvd2VyIGNvbnRyb2wuDQoNCkhpIEphbWVzLA0KSXQgc2VlbXMgdGhhdCB4ODYtcG93ZXIt
Y29udHJvbCBuZWVkIFBPV0VSX0JVVFRPTiBhbmQgUE9XRVJfT1VUIHRvIGJlIGNvbm5lY3RlZCB0
byBHUElPRTAvRTEgb3IgR1BJT0UyL0UzIGZvciBwYXNzdGhyb3VnaC4NCklmIG91ciBIVyBkZXNp
Z24gZG9lc24ndCBmb2xsb3cgaXQsIHg4Ni1wb3dlci1jb250cm9sIHdpbGwgbm90IHdvcmssIHJp
Z2h0ID8gDQoNCj4gDQo+ID4gPj4+DQo+ID4gPj4+PiBUaGFua3MgeW91ciBncmVhdCBzdXBwb3J0
IGluIGFkdmFuY2UuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gKkZyb206Km9wZW5ibWMNCj4gPiA8b3Bl
bmJtYy1ib3VuY2VzK3JsaTExPWxlbm92by5jb21AbGlzdHMub3psYWJzLm9yZz4NCj4gPiA+PiAq
T24NCj4gPiA+Pj4+IEJlaGFsZiBPZiAqSXZhbiBMaTExDQo+ID4gPj4+PiAqU2VudDoqIEZyaWRh
eSwgT2N0b2JlciAxOCwgMjAxOSA1OjU5IFBNDQo+ID4gPj4+PiAqVG86KiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCj4gPiA+Pj4+ICpTdWJqZWN0OiogW0V4dGVybmFsXSBQb3dlci1vbiBtb25p
dG9yIGZvciBwaG9zcGhvci1od21vbg0KPiA+ID4+Pj4gcXVlc3Rpb24NCj4gPiA+Pj4+DQo+ID4g
Pj4+PiBIaSBUZWFtLA0KPiA+ID4+Pj4NCj4gPiA+Pj4+IFdlIGZvdW5kIHRoYXQgdGhlcmUncyBu
byBwb3dlci1vbiBtb25pdG9yIG1lY2hhbmlzbSBpbg0KPiA+ID4+IHBob3NwaG9yLWh3bW9uLg0K
PiA+ID4+Pj4NCj4gPiA+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWh3
bW9uDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gQW5kIGl0IHdpbGwgY2F1c2UgaW5jb3JyZWN0IHRocmVz
aG9sZCBsb2dzIHRvIGJlIGFkZGVkIHRvIGpvdXJuYWwNCj4gPiA+Pj4+IGxvZyBieSAnc2VsLWxv
Z2dlcicgd2hlbiBzeXN0ZW0gaXMgaW4gcG93ZXIgb2ZmKFM1KSBzdGF0ZS4NCj4gPiA+Pj4+DQo+
ID4gPj4+PiBJcyB0aGVyZSBhbnkgcGxhbiB0byBpbXBsZW1lbnQgaXQ/IE9yIG90aGVyIHJlcG9z
aXRvcnkgd2UgY2FuIHJlZmVyIHRvID8NCj4gPiA+Pj4+DQo+ID4gPj4+PiBUaGFua3MsDQo+ID4g
Pj4+Pg0KPiA+ID4+Pj4gSXZhbg0KPiA+ID4+Pj4NCj4gPiA+Pj4NCg==
