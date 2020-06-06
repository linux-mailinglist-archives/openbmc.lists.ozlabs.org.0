Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7573B1F05BD
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 10:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fCGx4q5DzDqyB
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 18:24:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=4199204d0=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 66 seconds by postgrey-1.36 at bilbo;
 Sat, 06 Jun 2020 18:23:46 AEST
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49fCGB67BQzDqyB
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jun 2020 18:23:44 +1000 (AEST)
IronPort-SDR: damHsvnsugFa8+M/854dNb2CRx+7zadpxH8i4KtXm2ceWX2zsbGA+qpRw/0rERXdNNKYia691X
 B8XrDsjqCqIw==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx01.quantatw.com with ESMTP; 06 Jun 2020 16:22:34 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 6 Jun 2020
 16:22:32 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.1713.009;
 Sat, 6 Jun 2020 16:22:32 +0800
From: =?utf-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>, Patrick Williams
 <patrick@stwcx.xyz>
Subject: RE: kcsbridge cannot work with the latest sdbusplus package.
Thread-Topic: kcsbridge cannot work with the latest sdbusplus package.
Thread-Index: AdY7ONkP8PPI8i4LSqengBYq7BmgNwAPR4dLABkflLA=
Date: Sat, 6 Jun 2020 08:22:32 +0000
Message-ID: <a97d2b1e54c6495c9b31988a2ccc7b9f@quantatw.com>
References: <25e5caa0753f41f1b6524c351ee87011@quantatw.com>
 <20200605153321.GM17541@heinlein> <20200605201438.GD7478@mauery.jf.intel.com>
In-Reply-To: <20200605201438.GD7478@mauery.jf.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: E4F94A2B0AE4FA9487EF990AA4D2A5E3A9CA678B2700751AA2AF8692D4F06EAC2000:8
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

SGkgVmVybm9uLA0KCVRoYW5rcywgYnV0IHNvcnJ5IEkgZGlkbid0IGNoZWNrIHRoaXMgbWFpbCBm
aXJzdCwgc28gSSBwdXNoZWQgYSBmaXggdG8gR2Vycml0IGZvciByZXZpZXcuDQpVc2luZyB0aGUg
YWxpYXMgbmFtZSBpcyBlYXNpZXIgdGhhbiBtb2RpZnlpbmcgdGhlIHNvdXJjZSBjb2RlLg0KSSB3
aWxsIGFiYW5kb24gdGhlIGNvZGUgcmV2aWV3Lg0KDQpUaGFua3MsDQpGcmFuIEhzdQ0KRS1NYWls
IDogRnJhbi5Ic3VAUXVhbnRhVFcuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogVmVybm9uIE1hdWVyeSA8dmVybm9uLm1hdWVyeUBsaW51eC5pbnRlbC5jb20+DQo+
IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDYsIDIwMjAgNDoxNSBBTQ0KPiBUbzogUGF0cmljayBXaWxs
aWFtcyA8cGF0cmlja0BzdHdjeC54eXo+DQo+IENjOiBGcmFuIEhzdSAo5b6Q6KqM6KyZKSA8RnJh
bi5Ic3VAcXVhbnRhdHcuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6
IFJlOiBrY3NicmlkZ2UgY2Fubm90IHdvcmsgd2l0aCB0aGUgbGF0ZXN0IHNkYnVzcGx1cyBwYWNr
YWdlLg0KPiANCj4gT24gMDUtSnVuLTIwMjAgMTA6MzMgQU0sIFBhdHJpY2sgV2lsbGlhbXMgd3Jv
dGU6DQo+ID5PbiBGcmksIEp1biAwNSwgMjAyMCBhdCAxMjo1NzozNVBNICswMDAwLCBGcmFuIEhz
dSAo5b6Q6KqM6KyZKSB3cm90ZToNCj4gPj4gSGkgQWxsLA0KPiA+PiAJSSBidWlsdCB0aGUgQk1D
IEZXIGZyb20gdGhlIGxhdGVzdCBPcGVuQk1DIGJyYW5jaC4gQW5kIEkgZm91bmQgdGhlIGtzYw0K
PiBjaGFubmVsIGlzIG5vdCB3b3JraW5nLg0KPiA+PiBJIGdvdCB0aGUgZm9sbG93aW5nIGVycm9y
IG1lc3NhZ2U6DQo+ID4+IAlrY3NicmlkZ2VkIC1jIGlwbWkta2NzMQ0KPiA+PiAJdGVybWluYXRl
IGNhbGxlZCBhZnRlciB0aHJvd2luZyBhbiBpbnN0YW5jZSBvZg0KPiAnc2RidXNwbHVzOjpleGNl
cHRpb246OlNkQnVzRXJyb3InDQo+ID4+ICAgCXdoYXQoKTogIEludmFsaWQgcGF0aCBvciBpbnRl
cmZhY2U6DQo+IG9yZy5mcmVlZGVza3RvcC5EQnVzLkVycm9yLkludmFsaWRBcmdzOiBJbnZhbGlk
IGFyZ3VtZW50DQo+ID4+IAlBYm9ydGVkIChjb3JlIGR1bXBlZCkNCj4gPj4gIFNvIEkgZGlkIGEg
Y2hlY2sgb2YgdGhlIHJlY2VudCBwYWNrYWdlIGNoYW5nZXMuDQo+ID4+IFRoZSBsYXRlc3Qgc2Ri
dXNwbHVzIGFkZCB0aGUgInZhbGlkYXRlIGludGVyZmFjZSBhbmQgcGF0aCBwYXNzZWQgdG8gREJ1
cyIsDQo+IGJ1dCB0aGVyZSBpcyBhIHByb2JsZW0gd2hlbiBrY3NicmlkZ2UgY2FsbCB0aGUgImFk
ZF9pbnRlcmZhY2UiIEFQSSwgdGhlIHBhcnQgb2YNCj4gdGhlIHJlZ2V4IGNoZWNraW5nIGZ1bmN0
aW9uLg0KPiA+Pg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9zZGJ1c3BsdXMvYmxvYi83
ZjY2NDI1NGE0MzY1NjEyYjgyZGIyZmQ4ZmINCj4gPj4gODI3OTg2ODZlNzc3Yi9pbmNsdWRlL3Nk
YnVzcGx1cy9hc2lvL29iamVjdF9zZXJ2ZXIuaHBwI0w4MTENCj4gPj4ga2NzYnJpZGdlIHRha2Vz
IHRoZSBvbmUgcGFyYW1ldGVyIG9mIHRoZSAvZGV2L2lwbWkta2NzKi4gQnV0IHJlZ2V4DQo+IGZ1
bmN0aW9uIGRpZG4ndCBhbGxvdyB0aGUgY2hhcmFjdGVyICctJywgc28gSSBnb3QgdGhlIGV4Y2Vw
dGlvbiBtZXNzYWdlLg0KPiA+PiBEb2VzIGl0IG5lZWQgdG8gYWRkIHRoZSByZWdleCBjaGVja2lu
ZyB0byB0aGUgImFkZF9pbnRlcmZhY2UiIEFQST8gT3IgYWRkDQo+IHRoZSBjaGFyYWN0ZXIgJy0n
IHRvIHRoZSByZWdleCBjaGVja2luZyBwYXR0ZXJuPw0KPiA+Pg0KPiA+PiBUaGFua3MNCj4gPj4g
RnJhbiBIc3UNCj4gPj4gRS1NYWlsIDogRnJhbi5Ic3VAUXVhbnRhVFcuY29tDQo+ID4+DQo+ID4N
Cj4gPkhpIEZyYW4sDQo+ID4NCj4gPmtjc2JyaWRnZWQgbmVlZHMgYW4gdXBkYXRlIHRvIG5vdCB1
c2UgYSAtLiAgVGhpcyB3YXMgYWRkZWQgYmVjYXVzZToNCj4gPg0KPiA+ICAgIC0gVGhlIGRidXMg
c3BlYyBpcyB2ZXJ5IGNsZWFyIGFib3V0IHZhbGlkIG5hbWVzIGZvciBJbnRlcmZhY2VzLA0KPiA+
ICAgICAgT2JqZWN0IFBhdGhzLCBhbmQgU2VydmljZXMgWzFdLg0KPiA+DQo+ID4gICAgLSBJbiBz
b21lIGNhc2VzLCBzZGJ1cyBpdHNlbGYgYW5kL29yIHRoZSBkYnVzIGRhZW1vbiBhY3RpdmVseSBj
aGVjaw0KPiA+ICAgICAgZm9yIHZhbGlkIG5hbWVzIGFuZCBnaXZlIGFuIGVycm9yLCBidXQgaW4g
YSBmZXcgY2FzZXMgdGhlIGVycm9yDQo+ID4gICAgICB3YXMgYmVpbmcgaWdub3JlZCBieSBhcHBs
aWNhdGlvbnMuDQo+ID4NCj4gPiAgICAtIEZvciBuYW1lcyB0aGF0IHNkYnVzIHdhcyBub3QgdmVy
aWZ5aW5nLCBpdCBpcyBwb3NzaWJsZSB0aGV5IGFkZA0KPiA+ICAgICAgdmVyaWZpY2F0aW9uIGlu
IHRoZSBmdXR1cmUgYW5kIGNhdXNlIGNvZGUgYnJlYWthZ2UuDQo+ID4NCj4gPkkga25vdyBJIHdh
cyBoZWxwaW5nIG9uZSBkZXZlbG9wZXIgcmVjZW50bHkgd2hvIHdhcyBhZGRpbmcgYSBuZXcgZGJ1
cw0KPiA+ZWxlbWVudCBhbmQgdGhleSB3ZXJlIHN0dW1wZWQgYXMgdG8gd2h5IHRoZWlyIG9iamVj
dCB3YXMgbm90IHNob3dpbmcgdXANCj4gPmFzIHRoZXkgZXhwZWN0ZWQuICBJdCB3YXMgZHVlIHRv
IGFuIGludmFsaWQgbmFtZSB0aGF0IHNkYnVzIHdhcw0KPiA+ZHJvcHBpbmcuICBSYXRoZXIgdGhh
biBhIHNpbGVudCBlcnJvciBmcm9tIHNkYnVzIHdlIG1hZGUgdGhpcyBhIGhhcmQsDQo+ID5vYnZp
b3VzIGVycm9yLCBieSB0aHJvd2luZyBhbiBleGNlcHRpb24uDQo+ID4NCj4gPlRoYW5rcyBmb3Ig
cmVwb3J0aW5nIHRoZSBpc3N1ZS4gIEFyZSB5b3UgaW50ZXJlc3RlZCBpbiB3b3JraW5nIHVwIGEN
Cj4gPmZpeCwgb3RoZXJ3aXNlIFZlcm5vbiBpcyB0aGUgb25seSBsaXN0ZWQgbWFpbnRhaW5lciBw
cmVzZW50bHk/DQo+IA0KPiBDdXJyZW50bHksIHdlIGFyZSBkZWFsaW5nIHdpdGggdGhpcyBpc3N1
ZSB1c2luZyBhIHN5bWxpbmsgdG8gYWxpYXMgdGhlIGtjcyBkZXZpY2UuDQo+IA0KPiByb290QGlu
dGVsLW9ibWM6L3RtcCMgY2F0IC9saWIvdWRldi9ydWxlcy5kLzk5LWlwbWkta2NzLnJ1bGVzDQo+
IEtFUk5FTD09ImlwbWkta2NzMyIsIFNZTUxJTksrPSJpcG1pX2tjczMiDQo+IEtFUk5FTD09Imlw
bWkta2NzNCIsIFNZTUxJTksrPSJpcG1pX2tjczQiDQo+IA0KPiBUaGVuIHdlIGFkZCB0aGUgaW5z
dGFuY2Ugb2YgdGhlIGtjc2JyaWRnZSB3aXRoIHRoZSBpcG1pX2tjczMgbmFtZS4gS2VlcCBpbg0K
PiBtaW5kIHRoYXQgd2hhdGV2ZXIgbmFtZSB5b3UgdXNlLCBpdCBzaG91bGQgbWF0Y2ggdGhlIG5h
bWUgaW4gdGhlDQo+IC91c3Ivc2hhcmUvaXBtaWQtcHJvdmlkZXJzL2NoYW5uZWxfY29uZmlnLmpz
b24gZmlsZS4NCj4gDQo+IC0tVmVybm9uDQoNCg==
