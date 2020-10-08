Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88B287246
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 12:11:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6Rmd52k5zDqV6
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 21:10:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mic.com.tw (client-ip=220.130.36.7; helo=micmsefe02.mic.com.tw;
 envelope-from=john.chung@mic.com.tw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=mic.com.tw
Received: from MICMSEFE02.mic.com.tw (mail22.mic.com.tw [220.130.36.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6RlW023FzDqBH
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 21:09:57 +1100 (AEDT)
Received: from MICEXCH01.mitacad.com (micexch01.mitacad.com [10.88.25.249])
 by MICMSEFE02.mic.com.tw with ESMTP id 098A9iSO029061;
 Thu, 8 Oct 2020 18:09:44 +0800 (GMT-8)
 (envelope-from john.chung@mic.com.tw)
Received: from MICEXCH01.mitacad.com (10.88.25.249) by MICEXCH01.mitacad.com
 (10.88.25.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 8 Oct 2020
 18:09:46 +0800
Received: from MICEXCH01.mitacad.com ([fe80::7512:93eb:1586:1977]) by
 MICEXCH01.mitacad.com ([fe80::7512:93eb:1586:1977%3]) with mapi id
 15.01.1913.007; Thu, 8 Oct 2020 18:09:46 +0800
From: <john.chung@mic.com.tw>
To: <a.kartashev@yadro.com>, <openbmc@lists.ozlabs.org>
Subject: RE: Get inventory FRU from inventory system path
Thread-Topic: Get inventory FRU from inventory system path
Thread-Index: AdadT8UT5a4aOJlKQ2qFUrwNl4Orxf//jWUA//95cRA=
Date: Thu, 8 Oct 2020 10:09:46 +0000
Message-ID: <51d45e4a6b29485397e4cb60a7aea907@mic.com.tw>
References: <270220206437441ba7ba4eb39336f9e4@mic.com.tw>
 <28750e605f477d8901ae61da8b0753aba8b78b46.camel@yadro.com>
In-Reply-To: <28750e605f477d8901ae61da8b0753aba8b78b46.camel@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.88.25.29]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: MICMSEFE02.mic.com.tw 098A9iSO029061
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


SGkgQW5kcmVpLA0KDQo+IFdoYXQgYXJlIHlvdSB0cnlpbmcgdG8gYWNoaWV2ZT8NCkkgYW0gdHJ5
aW5nIHRvIGRpc3BsYXkgdGhlIHN5c3RlbSBpbmZvcm1hdGlvbiBzZWN0aW9uIGluIHBob3NwaG9y
LXdlYnVpLg0KVGhpcyBzZWN0aW9uIHdvdWxkIGNhbGwgdGhlICdnZXRTZXJ2ZXJJbmZvJyBmdW5j
dGlvbi4gDQpUaGUgZnVuY3Rpb24gd291bGQgbmVlZCB0byB1c2luZyB0aGUgIi94eXovb3BlbmJt
Y19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0iIHBhdGguDQoNCj4gVGhlIFJFU1QgQVBJIGRvIGp1
c3QgYSB0cmFuc2xhdGlvbiB0byBkYnVzLCBzbyB5b3UgZXhwZWN0IHRvIGdldCBleGFjdGx5IHdo
YXQgRW50aXR5TWFuYWdlciAob3Igb3RoZXIgaW52ZW50b3J5LXJlbGF0ZWQgZGFlbW9uKSBleHBv
c2UuDQo+IEFuZCBFTSBleHBvc2Ugbm90aGluZyB0byAveHl6L29wZW5ibWNfcHJvamVjdC9pbnZl
bnRvcnkvc3lzdGVtDQpZZXMsIEkgd2FudCB0byBnZXQgZXhhY3RseSB3aGF0IEVudGl0eU1hbmFn
ZXIgKG9yIG90aGVyIGludmVudG9yeS1yZWxhdGVkIGRhZW1vbikgZXhwb3NlLg0KQnV0IGl0J3Mg
bnVsbCBmb3IgdGhpcyBkYnVzIHBhdGggbm93Lg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBBbmRyZWkgS2FydGFzaGV2IFttYWlsdG86YS5rYXJ0YXNoZXZAeWFkcm8uY29t
XSANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDgsIDIwMjAgNTo1OCBQTQ0KVG86IGpvaG4uY2h1
bmcgKOmNvuS9s+iIqiAtIE1DVCkgPGpvaG4uY2h1bmdAbWljLmNvbS50dz47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IEdldCBpbnZlbnRvcnkgRlJVIGZyb20gaW52ZW50
b3J5IHN5c3RlbSBwYXRoDQoNCkhpIEpvaG4sDQoNCldoYXQgYXJlIHlvdSB0cnlpbmcgdG8gYWNo
aWV2ZT8NClRoZSBSRVNUIEFQSSBkbyBqdXN0IGEgdHJhbnNsYXRpb24gdG8gZGJ1cywgc28geW91
IGV4cGVjdCB0byBnZXQgZXhhY3RseSB3aGF0IEVudGl0eU1hbmFnZXIgKG9yIG90aGVyIGludmVu
dG9yeS1yZWxhdGVkIGRhZW1vbikgZXhwb3NlLg0KQW5kIEVNIGV4cG9zZSBub3RoaW5nIHRvIC94
eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0NCg0KT24gVGh1LCAyMDIwLTEwLTA4
IGF0IDA4OjUzICswMDAwLCBqb2huLmNodW5nQG1pYy5jb20udHcgd3JvdGU6DQo+IEhpLA0KPiAg
DQo+IEkgYW0gdHJ5aW5nIHRvIGdldCB0aGUgZGF0YSBmcm9tIHRoaXMgcGF0aCDigJwgDQo+IGh0
dHBzOi8vPGJtY2lwPi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW3igJ0uDQo+
IEJ1dCBvbmx5IGdldCB0aGUgZm9sbG93aW5nIGRhdGEgZnJvbSB0aGlzIHBhdGguDQo+ICANCj4g
Ii94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0iOiB7DQo+ICJBc3NldFRhZyI6
ICIiDQo+IH0sDQo+ICANCj4gSGVyZSBpcyBhbiBleGFtcGxlIGZvciB0aGlzIHBhdGggd2hpY2gg
SSBleHBlY3RlZCB0byBnZXQuDQo+ICANCj4gICAgICIveHl6L29wZW5ibWNfcHJvamVjdC9pbnZl
bnRvcnkvc3lzdGVtIjogew0KPiAgICAgICAgICJCdWlsZERhdGUiOiAiIiwNCj4gICAgICAgICAi
Q2FjaGVkIjogMCwNCj4gICAgICAgICAiRmllbGRSZXBsYWNlYWJsZSI6IDAsDQo+ICAgICAgICAg
Ik1hbnVmYWN0dXJlciI6ICIiLA0KPiAgICAgICAgICJNb2RlbCI6ICIyIiwNCj4gICAgICAgICAi
UGFydE51bWJlciI6ICIwMDAwMDAwMDAwMDAwMDAwIiwNCj4gICAgICAgICAiUHJlc2VudCI6IDEs
DQo+ICAgICAgICAgIlByZXR0eU5hbWUiOiAiIiwNCj4gICAgICAgICAiU2VyaWFsTnVtYmVyIjog
IjAwMDAwMDAwMDAwMDAwMDAiDQo+ICAgICB9LA0KPiAgDQo+ICANCj4gIA0KPiBPbmx5IHVzaW5n
IGVudGl0eS1tYW5hZ2VyIGluIG15IHByb2plY3QgZm9yIGludmVudG9yeSBGUlUuDQo+IEkgY291
bGQgZ2V0IHRoZSBGUlUgZGF0YSBmcm9tIHRoaXMgcGF0aCDigJwgDQo+IGh0dHBzOi8vPGJtY2lw
Pi94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vYm9hcmQvPG5hbWU+4oCdDQo+
IEJ1dCB0aGUgaW52ZW50b3J5IHN5c3RlbSBwYXRoIGlzIG51bGwuDQo+ICANCj4gQW55IHNldHRp
bmcgSSBzaG91bGQgc2V0IGZvciBnZXR0aW5nIEZSVSBmcm9tIHRoaXMgcGF0aD8NCj4gIA0KPiBS
ZWdhcmRzLA0KPiBKb2huIENodW5nDQo+ICANCj4gVGhpcyBlbWFpbCBtZXNzYWdlIGFuZCBhbGwg
YXR0YWNobWVudHMgdHJhbnNtaXR0ZWQgd2l0aCBpdCBhcmUgDQo+IGludGVuZGVkIHNvbGVseSBm
b3IgdGhlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGFuZCBtYXkgDQo+IGNvbnRh
aW4gbGVnYWxseSBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24uIElmIHlv
dSBhcmUgDQo+IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZW1haWwsIHlvdSBh
cmUgaGVyZWJ5IG5vdGlmaWVkIHRoYXQgDQo+IGFueSBkaXNjbG9zdXJlLCBkaXNzZW1pbmF0aW9u
LCBkaXN0cmlidXRpb24sIGNvcHlpbmcsIG9yIG90aGVyIHVzZSBvZiANCj4gdGhpcyBtZXNzYWdl
LCBpdHMgYXR0YWNobWVudHMgb3IgYW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCB0aGVyZWluIGlz
IA0KPiBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWls
IGluIGVycm9yLCBwbGVhc2UgDQo+IGNvbnRhY3QgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQg
cGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IA0KPiBhdHRhY2htZW50cyBmcm9tIHlvdXIgc3lzdGVt
LiBDb21wdXRlciB2aXJ1c2VzIGNhbiBiZSB0cmFuc21pdHRlZCB2aWEgDQo+IGVtYWlsLiBUaGUg
c2VuZGVyIGFjY2VwdHMgbm8gbGlhYmlsaXR5IGZvciBhbnkgZGFtYWdlIGNhdXNlZCBieSBhbnkg
DQo+IHZpcnVzIHRyYW5zbWl0dGVkIGJ5IHRoaXMgZW1haWwuIFRoYW5rIHlvdS4NCi0tDQpCZXN0
IHJlZ2FyZHMsDQpBbmRyZWkgS2FydGFzaGV2DQoNCg0KDQoNCj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0N
ClRoaXMgZW1haWwgbWVzc2FnZSBhbmQgYWxsIGF0dGFjaG1lbnRzIHRyYW5zbWl0dGVkIHdpdGgg
aXQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBp
ZW50KHMpIGFuZCBtYXkgY29udGFpbiBsZWdhbGx5IHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlh
bCBpbmZvcm1hdGlvbi4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0
aGlzIGVtYWlsLCB5b3UgYXJlIGhlcmVieSBub3RpZmllZCB0aGF0IGFueSBkaXNjbG9zdXJlLCBk
aXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24sIGNvcHlpbmcsIG9yIG90aGVyIHVzZSBvZiB0aGlz
IG1lc3NhZ2UsIGl0cyBhdHRhY2htZW50cyBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVkIHRo
ZXJlaW4gaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBl
bWFpbCBpbiBlcnJvciwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQg
cGxlYXNlIGRlbGV0ZSBpdCBhbmQgYW55IGF0dGFjaG1lbnRzIGZyb20geW91ciBzeXN0ZW0uIENv
bXB1dGVyIHZpcnVzZXMgY2FuIGJlIHRyYW5zbWl0dGVkIHZpYSBlbWFpbC4gVGhlIHNlbmRlciBh
Y2NlcHRzIG5vIGxpYWJpbGl0eSBmb3IgYW55IGRhbWFnZSBjYXVzZWQgYnkgYW55IHZpcnVzIHRy
YW5zbWl0dGVkIGJ5IHRoaXMgZW1haWwuIFRoYW5rIHlvdS4NCg==

