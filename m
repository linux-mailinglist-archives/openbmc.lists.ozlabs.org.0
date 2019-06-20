Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 932CE4CA61
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 11:13:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tx1Q3bK6zDr7q
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 19:12:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=yuan.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tx0b41QxzDr7q
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 19:12:13 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 02:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,396,1557212400"; 
 d="scan'208,217";a="186746366"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2019 02:12:11 -0700
Received: from yli41-MOBL1 (yli41-mobl1.ccr.corp.intel.com [10.255.31.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3F95658050C;
 Thu, 20 Jun 2019 02:12:10 -0700 (PDT)
Date: Thu, 20 Jun 2019 17:12:09 +0800
From: "yuan.li@linux.intel.com" <yuan.li@linux.intel.com>
To: "Lei YU" <mine260309@gmail.com>, 
	openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Re: [Design][v2] PSU firmware update
References: <CAARXrtkyUkoFvu_LMFJshPH6W1=ZaW6ABgQPmnnSPdX8um1_9A@mail.gmail.com>, 
 <CAARXrtn7UrSrYveV12FCedmkVydbu0ZpgPk5uaf8Sh=e-JEn4g@mail.gmail.com>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.9.156[cn]
Mime-Version: 1.0
Message-ID: <201906201712079957931@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart376565420363_=----"
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

This is a multi-part message in MIME format.

------=_001_NextPart376565420363_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

VGhpcyBpcyBjb29sIGRyYWZ0IGZvciBvbmUgb2YgdGhlIHNhdGVsbGl0ZSBmaXJtd2FyZSB1cGRh
dGUuIFRoYW5rcyBmb3IgdGhlIGdvb2Qgc3RhcnQuIA0KSGF2ZSBzb21lIGNvbW1lbnRzIGFuZCBt
b3JlIGNvbnNpZGVyYXRpb25zLCBhbHJlYWR5IGluIHRoZSBnZXJyaXQgZGVzaWduIHJldmlldy4g
V2UgY2FuIHRhbGsgbW9yZSBhYm91dCB0aGVtLg0KDQoNCg0KDQp5dWFuLmxpQGxpbnV4LmludGVs
LmNvbQ0KIA0KRnJvbTogTGVpIFlVDQpEYXRlOiAyMDE5LTA2LTIwIDEwOjUzDQpUbzogT3BlbkJN
QyBNYWlsbGlzdA0KU3ViamVjdDogUmU6IFtEZXNpZ25dW3YyXSBQU1UgZmlybXdhcmUgdXBkYXRl
DQpUaGlzIGRvYyBpcyBzdWJtaXR0ZWQgdG8NCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVj
dC54eXovYy9vcGVuYm1jL2RvY3MvKy8yMjgyMQ0KUGxlYXNlIHJldmlldyB0aGUgZG9jIGluIGdl
cnJpdC4NClRoYW5rcyENCiANCiANCk9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDM6MzYgUE0gTGVp
IFlVIDxtaW5lMjYwMzA5QGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IEhpIEFsbCwNCj4NCj4gVGhp
cyBpcyB0aGUgdjItdXBkYXRlZCBkZXNpZ24gZG9jIG9mIFBTVSBmaXJtd2FyZSB1cGRhdGUuDQo+
IEl0IHdpbGwgYmUgcG9zdGVkIHRvIGdlcnJpdCBmb3IgcmV2aWV3IGFmdGVyIHdlIGhhdmUgcmVz
b2x2ZWQgY29tbWVudHMNCj4gaW4gdGhlIG1haWxpbmcgbGlzdC4NCj4NCj4gIyBQU1UgZmlybXdh
cmUgdXBkYXRlDQo+DQo+IEF1dGhvcjoNCj4gICAgTGVpIFlVIDxtaW5lMjYwMzA5QGdtYWlsLmNv
bT4gPExlaVlVPg0KPiBQcmltYXJ5IGFzc2lnbmVlOg0KPiAgICBOb25lDQo+IE90aGVyIGNvbnRy
aWJ1dG9yczoNCj4gICAgU3UgWGlhbyA8c3V4aWFvQGluc3B1ci5jb20+DQo+ICAgIERlcmVrIEhv
d2FyZCA8ZGVyZWtoQHVzLmlibS5jb20+DQo+IENyZWF0ZWQ6DQo+ICAgIDIwMTktMDYtMDMNCj4N
Cj4NCj4gIyMgUHJvYmxlbSBEZXNjcmlwdGlvbg0KPg0KPiBUaGVyZSBpcyBubyBzdXBwb3J0IGlu
IE9wZW5CTUMgdG8gdXBkYXRlIHRoZSBmaXJtd2FyZSBmb3IgUFNVcy4NCj4NCj4NCj4gIyMgQmFj
a2dyb3VuZCBhbmQgUmVmZXJlbmNlcw0KPg0KPiBJbiBPcGVuQk1DLCB0aGVyZSBpcyBhbiBleGlz
dGluZyBpbnRlcmZhY2UgZm9yIFtzb2Z0d2FyZSB1cGRhdGVdWzFdLg0KPg0KPiBUaGUgdXBkYXRl
IHByb2Nlc3MgY29uc2lzdHMgb2Y6DQo+IDEuIFVwbG9hZGluZyBhbiBpbWFnZSB0byBCTUM7DQo+
IDIuIFByb2Nlc3NpbmcgdGhlIGltYWdlIHRvIGNoZWNrIHRoZSB2ZXJzaW9uIGFuZCBwdXJwb3Nl
IG9mIHRoZSBpbWFnZTsNCj4gMy4gVmVyaWZ5aW5nIGFuZCBhY3RpdmF0aW5nIHRoZSBpbWFnZS4N
Cj4NCj4gQ3VycmVudGx5LCBCTUMgYW5kIFBOT1IgZmlybXdhcmUgdXBkYXRlIGFyZSBzdXBwb3J0
ZWQ6DQo+ICogW3Bob3NwaG9yLWJtYy1jb2RlLW1nbXRdWzJdIGltcGxlbWVudHMgQk1DIGNvZGUg
dXBkYXRlLCBhbmQgaXQgc3VwcG9ydHMgYWxsDQo+ICAgdGhlIGFib3ZlIDMgcHJvY2Vzc2VzLg0K
PiAqIFtvcGVucG93ZXItcG5vci1jb2RlLW1nbXRdWzNdIGltcGxlbWVudHMgUE5PUiBjb2RlIHVw
ZGF0ZSwgYW5kIGl0IG9ubHkNCj4gICBpbXBsZW1lbnRzICJ2ZXJpZnlpbmcgYW5kIGFjdGl2YXRp
bmciIHRoZSBpbWFnZS4gSXQgc2hhcmVzIHRoZSBmdW5jdGlvbiBvZg0KPiAgIHRoZSBhYm92ZSAx
ICYgMiBwcm9jZXNzZXMuDQo+DQo+IEZvciBQU1UgZmlybXdhcmUgY29kZSB1cGRhdGUsIGl0IGlz
IHByZWZlcnJlZCB0byByZS11c2UgdGhlIHNhbWUgZnVuY3Rpb24gZm9yDQo+IHRoZSBhYm92ZSAx
ICYgMi4NCj4NCj4NCj4gIyMgUmVxdWlyZW1lbnRzDQo+DQo+IFRoZSBQU1UgZmlybXdhcmUgc2hh
bGwgYmUgdXBkYXRlZCBpbiB0aGUgYmVsb3cgY2FzZXM6DQo+IDEuIFRoZSB1c2VyIG1hbnVhbGx5
IGludm9rZSB0aGUgQVBJcyB0byBkbyB0aGUgdXBkYXRlOw0KPiAyLiBBZnRlciBCTUMgY29kZSB1
cGRhdGUgYW5kIGlmIHRoZXJlIGlzIGEgbmV3ZXIgUFNVIGltYWdlIGluIEJNQydzIGZpbGVzeXN0
ZW0sDQo+ICAgIEJNQyBzaGFsbCB1cGRhdGUgdGhlIFBTVSBmaXJtd2FyZTsNCj4gMy4gV2hlbiBh
IFBTVSBpcyByZXBsYWNlZCBhbmQgdGhlIHZlcnNpb24gaXMgb2xkZXIgdGhhbiB0aGUgb25lIGlu
IEJNQydzDQo+ICAgIGZpbGVzeXN0ZW0sIEJNQyBzaGFsbCB1cGRhdGUgdGhlIFBTVSBmaXJtd2Fy
ZS4NCj4gNC4gVGhlcmUgYXJlIGNhc2VzIHRoYXQgYSBzeXN0ZW0gY291bGQgdXNlIGRpZmZlcmVu
dCBtb2RlbHMgb2YgUFNVcywgYW5kIHRodXMNCj4gICAgZGlmZmVyZW50IFBTVSBmaXJtd2FyZSBp
bWFnZXMgbmVlZCB0byBiZSBzdXBwb3J0ZWQuDQo+DQo+IEZvciBzb21lIFBTVXMsIGl0IGlzIHJp
c2t5IHRvIGRvIFBTVSBjb2RlIHVwZGF0ZSB3aGlsZSB0aGUgaG9zdCBpcyBydW5uaW5nIHRvDQo+
IGF2b2lkIHBvd2VyIGxvc3MuIFRoaXMgc2hhbGwgYmUgaGFuZGxlZCBieSB2ZW5kb3Itc3BlY2lm
aWMgdG9vbHMsIGJ1dCBub3QgaW4NCj4gdGhlIGdlbmVyaWMgZnJhbWV3b3JrLg0KPg0KPiBTbyB0
aGUgYmVsb3cgY2hlY2tzIGFyZSBvcHRpb25hbCBhbmQgZXhwZWN0ZWQgdG8gYmUgaGFuZGxlZCBi
eSB2ZW5kb3Itc3BlY2lmaWMNCj4gdG9vbDoNCj4gMS4gSWYgdGhlIGhvc3QgaXMgcG93ZXJlZCBv
ZmY7DQo+IDIuIElmIHRoZSByZWR1bmRhbnQgUFNVcyBhcmUgYWxsIGNvbm5lY3RlZDsNCj4gMy4g
SWYgdGhlIEFDIGlucHV0IGFuZCBEQyBzdGFuZGJ5IG91dHB1dCBpcyBPSyBvbiBhbGwgdGhlIFBT
VXM7DQo+DQo+DQo+ICMjIFByb3Bvc2VkIERlc2lnbg0KPg0KPiBBcyBkZXNjcmliZWQgaW4gdGhl
IGFib3ZlIHJlcXVpcmVtZW50cywgdGhlcmUgYXJlIGRpZmZlcmVudCBjYXNlcyBQU1UgZmlybXdh
cmUNCj4gaXMgdXBkYXRlZDoNCj4gKiBXaGVuIHRoZSBBUElzIGFyZSBpbnZva2VkOw0KPiAqIFdo
ZW4gYSBuZXcgdmVyc2lvbiBpcyB1cGRhdGVkIHRvZ2V0aGVyIHdpdGggQk1DIGNvZGUgdXBkYXRl
Ow0KPiAqIFdoZW4gYSBQU1UgaXMgcmVwbGFjZWQgd2l0aCBhbiBvbGQgdmVyc2lvbiBvZiB0aGUg
ZmlybXdhcmUuDQo+DQo+ICMjIyBVcGRhdGUgYnkgQVBJDQo+DQo+IFRoaXMgbWV0aG9kIGlzIHVz
dWFsbHkgdXNlZCBieSB1c2VycyB3aG8gbWFudWFsbHkgdXBkYXRlIFBTVSBmaXJtd2FyZS4NCj4N
Cj4gSXQgd2lsbCByZS11c2UgdGhlIGN1cnJlbnQgaW50ZXJmYWNlcyB0byB1cGxvYWQsIHZlcmlm
eSwgYW5kIGFjdGl2YXRlIHRoZQ0KPiBpbWFnZS4NCj4NCj4gMS4gVGhlICJWZXJzaW9uIiBpbnRl
cmZhY2UgbmVlZHMgdG8gYmUgZXh0ZW5kZWQ6DQo+ICAgICogQWRkIGEgbmV3IFtWZXJzaW9uUHVy
cG9zZV1bNF0gZm9yIFBTVTsNCj4gICAgKiBSZS11c2UgdGhlIGV4aXN0aW5nIEV4dGVuZGVkVmVy
c2lvbiBhcyBhbiBhZGRpdGlvbmFsIHN0cmluZyBmb3INCj4gICAgICB2ZW5kb3Itc3BlY2lmaWMg
cHVycG9zZSwgZS5nLiB0byBpbmRpY2F0ZSB0aGUgUFNVIG1vZGVsLg0KPiAyLiBSZS11c2UgdGhl
IGV4aXN0aW5nIGZ1bmN0aW9ucyBpbXBsZW1lbnRlZCBieSBbcGhvc3Bob3ItYm1jLWNvZGUtbWdt
dF1bMl0gZm9yDQo+ICAgIHVwbG9hZGluZyBhbmQgcHJvY2Vzc2luZyB0aGUgaW1hZ2UuDQo+ICAg
ICogVGhlIFBTVSB1cGRhdGUgaW1hZ2Ugc2hhbGwgYmUgYSB0YXJiYWxsIGNvbnNpc3RzIG9mIGEg
TUFOSUZFU1QsIGltYWdlcywNCj4gICAgICBhbmQgc2lnbmF0dXJlcw0KPiAzLiBUaGVyZSB3aWxs
IGJlIGEgbmV3IHNlcnZpY2UgdGhhdCBpbXBsZW1lbnRzIHRoZSBbQWN0aXZhdGlvbl1bNV0gaW50
ZXJmYWNlIHRvDQo+ICAgIHVwZGF0ZSB0aGUgUFNVIGZpcm13YXJlLg0KPiAgICAqIFRoZSBzZXJ2
aWNlIHdpbGwgYmUgc3RhcnRlZCBieSBkZWZhdWx0IHdoZW4gQk1DIHN0YXJ0czsNCj4gICAgKiBP
biBzdGFydCwgdGhlIHNlcnZpY2Ugd2lsbCBjaGVjayB0aGUgUFNVJ3MgZXhpc3RpbmcgZmlybXdh
cmUgYW5kIGNyZWF0ZQ0KPiAgICAgIHRoZSBWZXJzaW9uIGFuZCBBY3RpdmF0aW9uIGludGVyZmFj
ZXM7DQo+ICAgICogVGhlIHNlcnZpY2Ugd2lsbCB2ZXJpZnkgdGhlIHNpZ25hdHVyZSBvZiB0aGUg
aW1hZ2U7DQo+ICAgICogVGhlIHNlcnZpY2Ugc2hhbGwgY2hlY2sgdGhlIEV4dGVuZGVkVmVyc2lv
biB0byBtYWtlIHN1cmUgdGhlIGltYWdlIG1hdGNoZXMNCj4gICAgICB0aGUgUFNVIG1vZGVsLg0K
PiAgICAqIFRoZSBzZXJ2aWNlIHdpbGwgaGF2ZSBhIGNvbmZpZ3VyZSBmaWxlIHRvIGRlc2NyaWJl
IHRoZSBQU1UgbW9kZWwgYW5kIGl0cw0KPiAgICAgIHJlbGF0ZWQgdmVuZG9yLXNwZWNpZmljIHRv
b2xzLg0KPiAgICAqIFRoZSBzZXJ2aWNlIHdpbGwgZmluZCB0aGUgbWF0Y2hlZCB2ZW5kb3Itc3Bl
Y2lmaWMgdG9vbCB0byBwZXJmb3JtIHRoZSBjb2RlDQo+ICAgICAgdXBkYXRlLg0KPiAgICAqIFdo
ZW4gdGhlIFBTVSBjb2RlIHVwZGF0ZSBpcyBjb21wbGV0ZWQsIGFuIGluZm9ybWF0aW9uYWwgZXZl
bnQgbG9nIHNoYWxsIGJlDQo+ICAgICAgY3JlYXRlZC4NCj4gICAgKiBXaGVuIHRoZSBQU1UgY29k
ZSB1cGRhdGUgaXMgY29tcGxldGVkLCB0aGUgaW1hZ2UsIE1BTklGRVNULCBhbmQgb3B0aW9uYWxs
eQ0KPiAgICAgIHRoZSBzaWduYXR1cmUgd2lsbCBiZSBzYXZlZCB0byBhIHByZS1kZWZpbmVkIGRp
cmVjdG9yeSBpbiByZWFkLXdyaXRlDQo+ICAgICAgZmlsZXN5c3RlbSBmb3IgZnV0dXJlIHVzZSwg
aW4gY2FzZSBhIG5ldyBQU1Ugd2l0aCBvbGQgZmlybXdhcmUgaXMgcGx1Z2dlZC4NCj4gNC4gVGhl
IHZlbmRvci1zcGVjaWZpYyB0b29sIHNoYWxsIHJ1biBhbGwgdGhlIGNoZWNrcyBpdCBuZWVkcyB0
byBiZSBydW4sIGJlZm9yZQ0KPiAgICBhbmQgYWZ0ZXIgdGhlIFBTVSB1cGRhdGUsIGFuZCByZXR1
cm4gYSBzdGF0dXMgdG8gdGhlIGFib3ZlIHNlcnZpY2UgdG8NCj4gICAgaW5kaWNhdGUgdGhlIHJl
c3VsdC4NCj4gNS4gV2hlbiB0aGUgdmVuZG9yLXNwZWNpZmljIHRvb2wgcmV0dXJucyBlcnJvcnMs
IHRoZSBQU1UgdXBkYXRlIHdpbGwgYmUgYWJvcnRlZA0KPiAgICBhbmQgYW4gZXJyb3IgZXZlbnQg
bG9nIHNoYWxsIGJlIGNyZWF0ZWQuDQo+IDYuIER1cmluZyB0aGUgdXBkYXRlLCB0aGUgdmVuZG9y
LXNwZWNpZmljIHRvb2wgc2hhbGwgc2V0IHRoZSByZWxhdGVkIHNlbnNvcnMgdG8NCj4gICAgbm9u
LWZ1bmN0aW9uYWwsIGFuZCB3aGVuIHRoZSB1cGRhdGUgaXMgZG9uZSwgaXQgc2hhbGwgc2V0IHRo
ZSByZWxhdGVkDQo+ICAgIHNlbnNvcnMgYmFjayB0byBmdW5jdGlvbmFsLg0KPg0KPiAjIyMgVXBk
YXRlIGJ5IG5ldyBCTUMgaW1hZ2UNCj4NCj4gV2hlbiBCTUMgaXMgdXBkYXRlZCBhbmQgYSBuZXcg
dmVyc2lvbiBvZiBQU1UgZmlybXdhcmUgaXMgaW5jbHVkZWQsIGl0IHNoYWxsIGJlDQo+IHVwZGF0
ZWQgdG8gdGhlIFBTVS4NCj4gVGhpcyB3aWxsIGJlIGRvbmUgYnkgdGhlIHNhbWUgc2VydmljZSBk
ZXNjcmliZWQgYWJvdmUuDQo+DQo+IDEuIE9uIHN0YXJ0LCB0aGUgc2VydmljZSB3aWxsIGNoZWNr
IHRoZSBQU1UgaW1hZ2UsIG1vZGVsIGFuZCB2ZXJzaW9uIGluIGl0cw0KPiAgICBmaWxlc3lzdGVt
LCBjb21wYXJlIHdpdGggdGhlIG9uZXMgaW4gUFNVIGhhcmR3YXJlIGFuZCBkZWNpZGUgaWYgUFNV
IGZpcm13YXJlDQo+ICAgIHVwZGF0ZSBzaGFsbCBiZSBwZXJmb3JtZWQuDQo+IDIuIFRoZXJlIGNv
dWxkIGJlIHR3byBwbGFjZXMgY29udGFpbmluZyB0aGUgUFNVIGltYWdlczoNCj4gICAgKiBUaGUg
cHJlLWRlZmluZWQgZGlyZWN0b3J5IGluIHJlYWQtb25seSBmaWxlc3lzdGVtLCB3aGljaCBpcyBw
YXJ0IG9mIEJNQw0KPiAgICAgIGltYWdlLg0KPiAgICAqIFRoZSBvdGhlciBwcmUtZGVmaW5lZCBk
aXJlY3RvcnkgaW4gcmVhZC13cml0ZSBmaWxlc3lzdGVtLCB3aGljaCBpcyB0aGUNCj4gICAgICBs
b2NhdGlvbiBmb3IgdGhlIHNhdmVkIFBTVSBpbWFnZXMgYnkgQVBJIHVwZGF0ZS4NCj4gICAgQm90
aCBwbGFjZXMgc2hhbGwgYmUgY2hlY2tlZCBhbmQgYSBuZXdlciB2ZXJzaW9uIHdpbGwgYmUgc2Vs
ZWN0ZWQgdG8gY29tcGFyZQ0KPiAgICB3aXRoIHRoZSBQU1UgaGFyZHdhcmUuDQo+IDMuIElmIFBT
VSB1cGRhdGUgaXMgbmVlZGVkLCB0aGUgc2VydmljZSB3aWxsIGZpbmQgdGhlIG1hdGNoZWQgdmVu
ZG9yLXNwZWNpZmljDQo+ICAgIHRvb2wgdG8gcGVyZm9ybSB0aGUgY29kZSB1cGRhdGUuDQo+IDQu
IFRoZSBmb2xsb3dpbmcgcHJvY2VzcyB3aWxsIGJlIHRoZSBzYW1lIGFzIFtVcGRhdGUgYnkgQVBJ
XS4NCj4NCj4gIyMjIFVwZGF0ZSBvbiByZXBsYWNlZCBQU1UNCj4NCj4gV2hlbiBhIFBTVSBpcyBy
ZXBsYWNlZCwgYW5kIHRoZSBmaXJtd2FyZSB2ZXJzaW9uIGlzIG9sZGVyIHRoYW4gdGhlIG9uZSBp
biBCTUMNCj4gZmlsZXN5c3RlbSwgaXQgc2hhbGwgYmUgdXBkYXRlZC4NCj4gVGhpcyB3aWxsIGJl
IGRvbmUgYnkgdGhlIHNhbWUgc2VydmljZSBkZXNjcmliZWQgYWJvdmUuDQo+DQo+IDEuIE9uIHN0
YXJ0LCB0aGUgc2VydmljZSB3aWxsIHN1YnNjcmliZSB0byB0aGUgUHJvcGVydGllc0NoYW5nZWQg
c2lnbmFsIHRvDQo+ICAgIHRoZSBQU1Ugb2JqZWN0IHBhdGggdG8gbW9uaXRvciB0aGUgUFNVIHBy
ZXNlbmNlIHN0YXR1cy4NCj4gICAgKE9yIG1heWJlIHN1YnNjcmliZSB0aGUgSW50ZXJmYWNlc0Fk
ZWQvUmVtb3ZlZCBzaWduYWw/KQ0KPiAyLiBXaGVuIGEgUFNVJ3MgcHJlc2VuY2Ugc3RhdHVzIGlz
IGNoYW5nZWQgZnJvbSBmYWxzZSB0byB0cnVlIChvciB0aGUNCj4gICAgSW50ZXJmYWNlc0FkZGVk
IGV2ZW50IG9jY3VycyksIHRoZSBzZXJ2aWNlIHdpbGwgY2hlY2sgdGhlIG5ldyBQU1UncyBtb2Rl
bCwNCj4gICAgZmlybXdhcmUgdmVyc2lvbiB0byBkZWNpZGUgaWYgdGhlIGZpcm13YXJlIG5lZWRz
IHRvIGJlIHVwZGF0ZWQuDQo+IDMuIElmIHllcywgdGhlIHNlcnZpY2Ugd2lsbCBmaW5kIHRoZSBt
YXRjaGVkIHZlbmRvci1zcGVjaWZpYyB0b29sIHRvIHBlcmZvcm0NCj4gICAgdGhlIGNvZGUgdXBk
YXRlLg0KPiA0LiBUaGUgZm9sbG93aW5nIHByb2Nlc3Mgd2lsbCBiZSB0aGUgc2FtZSBhcyBbVXBk
YXRlIGJ5IEFQSV0uDQo+DQo+ICMjIEFsdGVybmF0aXZlcyBDb25zaWRlcmVkDQo+DQo+ICMjIyBH
ZW5lcmFsIGltcGxlbWVudGF0aW9uDQo+DQo+IFRoZSBQU1UgZmlybXdhcmUgdXBkYXRlIGNvdWxk
IGJlIGltcGxlbWVudGVkIGJ5IHNlcGFyYXRlZCByZWNpcGVzIHRoYXQgb25seQ0KPiBjYWxsIHZl
bmRvci1zcGVjaWZpYyB0b29scy4NCj4gSXQgd2lsbCBiZSBhIGJpdCBzaW1wbGVyIGJ1dCBsb3Nl
cyB0aGUgdW5pZmllZCBpbnRlcmZhY2UgcHJvdmlkZWQgYnkgT3BlbkJNQydzDQo+IGV4aXN0aW5n
IFtzb2Z0d2FyZSB1cGRhdGUgaW50ZXJmYWNlXVsxXSwgYW5kIHRodXMgaXQgd2lsbCBiZWNvbWUg
ZGlmZmljdWx0IHRvDQo+IHVzZSBhIHN0YW5kYXJkIEFQSSB0byB0aGUgUFNVIGZpcm13YXJlIHVw
ZGF0ZS4NCj4NCj4gIyMjIFZlcnNpb25QdXJwb3NlDQo+IEl0IGlzIHBvc3NpYmxlIHRvIHJlLXVz
ZSB0aGUgVmVyc2lvblB1cnBvc2UuT3RoZXIgdG8gcmVwcmVzZW50IHRoZSBQU1UgaW1hZ2Uncw0K
PiB2ZXJzaW9uIHB1cnBvc2UuDQo+IEJ1dCB0aGF0IHJlcXVpcmVzIGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24gYWJvdXQgdGhlIGltYWdlLCBvdGhlcndpc2UsIHRoZXJlIGlzDQo+IG5vIHdheSB0byB0
ZWxsIGlmIHRoZSBpbWFnZSBpcyBmb3IgUFNVLCBvciBDUExELCBvciBvdGhlciBwZXJpcGhlcmFs
cy4NCj4gQSBuZXcgVmVyc2lvblB1cnBvc2UuUFNVIGlzIG1vcmUgc3BlY2lmaWMgYW5kIG1ha2Vz
IGl0IGVhc2llciB0byBpbXBsZW1lbnQgYW5kDQo+IGZyaWVuZGx5IGZvciB0aGUgdXNlci4NCj4N
Cj4gIyMjIEFkZGl0aW9uYWwgc3RyaW5nDQo+IFRoZSBkZXNpZ24gcHJvcG9zYWwgdXNlcyBFeHRl
bmRlZFZlcnNpb24gYXMgdGhlIGFkZGl0aW9uYWwgc3RyaW5nIGZvcg0KPiB2ZW5kb3Itc3BlY2lm
aWMgcHVycG9zZSwgZS5nLiB0byBpbmRpY2F0ZSB0aGUgUFNVIG1vZGVsLCBzbyB0aGUgaW1wbGVt
ZW50YXRpb24NCj4gY291bGQgY2hlY2sgYW5kIGNvbXBhcmUgaWYgdGhlIGltYWdlIG1hdGNoZXMg
dGhlIFBTVSBtb2RlbC4NCj4gSXQgaXMgcG9zc2libGUgdG8gbWFrZSBpdCBvcHRpb25hbCBvciBy
ZW1vdmUgdGhpcyBhZGRpdGlvbmFsIHN0cmluZywgdGhlbiB0aGUNCj4gaW1wbGVtZW50YXRpb24g
d2lsbCBub3QgdmVyaWZ5IGlmIHRoZSBpbWFnZSBtYXRjaGVzIHRoZSBQU1UuIEl0IGNvdWxkIGJl
IE9LIGlmDQo+IHdlIHRydXN0IHRoZSB1c2VyIHdobyBpcyB1cGxvYWRpbmcgdGhlIGNvcnJlY3Qg
aW1hZ2UsIGVzcGVjaWFsbHkgdGhlIGltYWdlDQo+IHNoYWxsIGJlIHNpZ25lZC4NCj4gQnV0IGl0
IGlzIGFsd2F5cyByaXNreSBpbiBjYXNlIHRoZSBpbWFnZSBkb2VzIG5vdCBtYXRjaCB0aGUgUFNV
LCBhbmQgY2F1c2UNCj4gdW5pbnRlbmRlZCBkYW1hZ2UgaWYgdGhlIGluY29ycmVjdCBQU1UgZmly
bXdhcmUgaXMgdXBkYXRlZC4NCj4NCj4NCj4gIyMgSW1wYWN0cw0KPg0KPiBUaGlzIGRlc2lnbiBv
bmx5IGludHJvZHVjZXMgYSBuZXcgVmVyc2lvblB1cnBvc2UgZW51bSBpbnRvIHRoZSBkYnVzIGlu
dGVyZmFjZXMuDQo+IFRoZSBuZXdseSBpbnRyb2R1Y2VkIFBTVSBmaXJtd2FyZSB1cGRhdGUgc2Vy
dmljZSB3aWxsIGJlIGEgbmV3IHNlcnZpY2UgdGhhdA0KPiBpbXBsZW1lbnRzIGV4aXN0aW5nIFtB
Y3RpdmF0aW9uXVs1XSBpbnRlcmZhY2UuDQo+IFNvIHRoZSBpbXBhY3RzIGFyZSBtaW5pbWFsIHRv
IGV4aXN0aW5nIHN5c3RlbXMuDQo+DQo+DQo+ICMjIFRlc3RpbmcNCj4NCj4gSXQgcmVxdWlyZXMg
dGhlIG1hbnVhbCB0ZXN0cyB0byB2ZXJpZnkgdGhlIFBTVSBjb2RlIHVwZGF0ZSBwcm9jZXNzLg0K
PiAqIFZlcmlmeSB0aGUgUFNVIGNvZGUgdXBkYXRlIGlzIGRvbmUgb24gYWxsIFBTVXMgc3VjY2Vz
c2Z1bGx5Ow0KPiAqIFZlcmlmeSB0aGUgUFNVIGNvZGUgdXBkYXRlIHdpbGwgZmFpbCBpZiB0aGUg
dmVuZG9yLXNwZWNpZmljIHRvb2wgZmFpbHMgb24NCj4gICBwcmUtY29uZGl0aW9uIGNoZWNrLCBv
ZiBmYWlscyBvbiB1cGRhdGluZyBQU1UuDQo+ICogVmVyaWZ5IHRoZSBQU1UgY29kZSB1cGRhdGUg
aXMgcGVyZm9ybWVkIGFmdGVyIGEgbmV3IEJNQyBpbWFnZSBpcyB1cGRhdGVkDQo+ICAgY29udGFp
bmluZyBhIG5ldyB2ZXJzaW9uIG9mIFBTVSBmaXJtd2FyZS4NCj4gKiBWZXJpZnkgdGhlIFBTVSBj
b2RlIHVwZGF0ZSBpcyBwZXJmb3JtZWQgYWZ0ZXIgYSBQU1Ugd2l0aCBvbGQgZmlybXdhcmUgaXMN
Cj4gICBwbHVnZ2VkIGluLg0KPg0KPg0KPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1j
L3Bob3NwaG9yLWRidXMtaW50ZXJmYWNlcy90cmVlL21hc3Rlci94eXovb3BlbmJtY19wcm9qZWN0
L1NvZnR3YXJlDQo+IFsyXTogaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItYm1j
LWNvZGUtbWdtdC8NCj4gWzNdOiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVucG93ZXIt
cG5vci1jb2RlLW1nbXQvDQo+IFs0XTogaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bo
b3ItZGJ1cy1pbnRlcmZhY2VzL2Jsb2IvNTdiODc4ZDA0OGY5Mjk2NDMyNzZmMWJmN2ZkZjc1MGFi
YzRiZGU4Yi94eXovb3BlbmJtY19wcm9qZWN0L1NvZnR3YXJlL1ZlcnNpb24uaW50ZXJmYWNlLnlh
bWwjTDE0DQo+IFs1XTogaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItZGJ1cy1p
bnRlcmZhY2VzL2Jsb2IvbWFzdGVyL3h5ei9vcGVuYm1jX3Byb2plY3QvU29mdHdhcmUvQWN0aXZh
dGlvbi5pbnRlcmZhY2UueWFtbA0K

------=_001_NextPart376565420363_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 10.5pt; font-fa=
mily: 'Segoe UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style></head><=
body>=0A<div><span></span>T<span style=3D"color: rgb(33, 33, 33); font-fam=
ily: Roboto, -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Ari=
al, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; =
font-size: 13px; orphans: 2; white-space: pre-wrap; widows: 2; line-height=
: 1.5; background-color: transparent;">his is cool draft for one of the sa=
tellite firmware update. Thanks for the good start.&nbsp;</span></div><div=
><span style=3D"color: rgb(33, 33, 33); font-family: Roboto, -apple-system=
, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Col=
or Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 13px; orphans: =
2; white-space: pre-wrap; widows: 2; line-height: 1.5; background-color: t=
ransparent;">Have some comments and more considerations, already in the ge=
rrit design review. We can talk more about them.</span></div><div><span st=
yle=3D"color: rgb(33, 33, 33); font-family: Roboto, -apple-system, BlinkMa=
cSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif, 'Apple Color Emoji'=
, 'Segoe UI Emoji', 'Segoe UI Symbol'; font-size: 13px; orphans: 2; white-=
space: pre-wrap; widows: 2; line-height: 1.5; background-color: transparen=
t;"><br></span></div>=0A<div><br></div><hr style=3D"width: 210px; height: =
1px;" color=3D"#b5c4df" size=3D"1" align=3D"left">=0A<div><span><div style=
=3D"MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><div>yuan.li@linu=
x.intel.com</div></div></span></div>=0A<blockquote style=3D"margin-Top: 0p=
x; margin-Bottom: 0px; margin-Left: 0.5em"><div>&nbsp;</div><div style=3D"=
border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div=
 style=3D"PADDING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMI=
LY:tahoma;COLOR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING=
-TOP: 8px"><div><b>From:</b>&nbsp;<a href=3D"mailto:mine260309@gmail.com">=
Lei YU</a></div><div><b>Date:</b>&nbsp;2019-06-20&nbsp;10:53</div><div><b>=
To:</b>&nbsp;<a href=3D"mailto:openbmc@lists.ozlabs.org">OpenBMC Maillist<=
/a></div><div><b>Subject:</b>&nbsp;Re: [Design][v2] PSU firmware update</d=
iv></div></div><div><div>This doc is submitted to</div>=0A<div>https://ger=
rit.openbmc-project.xyz/c/openbmc/docs/+/22821</div>=0A<div>Please review =
the doc in gerrit.</div>=0A<div>Thanks!</div>=0A<div>&nbsp;</div>=0A<div>&=
nbsp;</div>=0A<div>On Mon, Jun 17, 2019 at 3:36 PM Lei YU &lt;mine260309@g=
mail.com&gt; wrote:</div>=0A<div>&gt;</div>=0A<div>&gt; Hi All,</div>=0A<d=
iv>&gt;</div>=0A<div>&gt; This is the v2-updated design doc of PSU firmwar=
e update.</div>=0A<div>&gt; It will be posted to gerrit for review after w=
e have resolved comments</div>=0A<div>&gt; in the mailing list.</div>=0A<d=
iv>&gt;</div>=0A<div>&gt; # PSU firmware update</div>=0A<div>&gt;</div>=0A=
<div>&gt; Author:</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; Lei YU &lt;mine26030=
9@gmail.com&gt; &lt;LeiYU&gt;</div>=0A<div>&gt; Primary assignee:</div>=0A=
<div>&gt;&nbsp;&nbsp;&nbsp; None</div>=0A<div>&gt; Other contributors:</di=
v>=0A<div>&gt;&nbsp;&nbsp;&nbsp; Su Xiao &lt;suxiao@inspur.com&gt;</div>=
=0A<div>&gt;&nbsp;&nbsp;&nbsp; Derek Howard &lt;derekh@us.ibm.com&gt;</div=
>=0A<div>&gt; Created:</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; 2019-06-03</div=
>=0A<div>&gt;</div>=0A<div>&gt;</div>=0A<div>&gt; ## Problem Description</=
div>=0A<div>&gt;</div>=0A<div>&gt; There is no support in OpenBMC to updat=
e the firmware for PSUs.</div>=0A<div>&gt;</div>=0A<div>&gt;</div>=0A<div>=
&gt; ## Background and References</div>=0A<div>&gt;</div>=0A<div>&gt; In O=
penBMC, there is an existing interface for [software update][1].</div>=0A<=
div>&gt;</div>=0A<div>&gt; The update process consists of:</div>=0A<div>&g=
t; 1. Uploading an image to BMC;</div>=0A<div>&gt; 2. Processing the image=
 to check the version and purpose of the image;</div>=0A<div>&gt; 3. Verif=
ying and activating the image.</div>=0A<div>&gt;</div>=0A<div>&gt; Current=
ly, BMC and PNOR firmware update are supported:</div>=0A<div>&gt; * [phosp=
hor-bmc-code-mgmt][2] implements BMC code update, and it supports all</div=
>=0A<div>&gt;&nbsp;&nbsp; the above 3 processes.</div>=0A<div>&gt; * [open=
power-pnor-code-mgmt][3] implements PNOR code update, and it only</div>=0A=
<div>&gt;&nbsp;&nbsp; implements "verifying and activating" the image. It =
shares the function of</div>=0A<div>&gt;&nbsp;&nbsp; the above 1 &amp; 2 p=
rocesses.</div>=0A<div>&gt;</div>=0A<div>&gt; For PSU firmware code update=
, it is preferred to re-use the same function for</div>=0A<div>&gt; the ab=
ove 1 &amp; 2.</div>=0A<div>&gt;</div>=0A<div>&gt;</div>=0A<div>&gt; ## Re=
quirements</div>=0A<div>&gt;</div>=0A<div>&gt; The PSU firmware shall be u=
pdated in the below cases:</div>=0A<div>&gt; 1. The user manually invoke t=
he APIs to do the update;</div>=0A<div>&gt; 2. After BMC code update and i=
f there is a newer PSU image in BMC's filesystem,</div>=0A<div>&gt;&nbsp;&=
nbsp;&nbsp; BMC shall update the PSU firmware;</div>=0A<div>&gt; 3. When a=
 PSU is replaced and the version is older than the one in BMC's</div>=0A<d=
iv>&gt;&nbsp;&nbsp;&nbsp; filesystem, BMC shall update the PSU firmware.</=
div>=0A<div>&gt; 4. There are cases that a system could use different mode=
ls of PSUs, and thus</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; different PSU fir=
mware images need to be supported.</div>=0A<div>&gt;</div>=0A<div>&gt; For=
 some PSUs, it is risky to do PSU code update while the host is running to=
</div>=0A<div>&gt; avoid power loss. This shall be handled by vendor-speci=
fic tools, but not in</div>=0A<div>&gt; the generic framework.</div>=0A<di=
v>&gt;</div>=0A<div>&gt; So the below checks are optional and expected to =
be handled by vendor-specific</div>=0A<div>&gt; tool:</div>=0A<div>&gt; 1.=
 If the host is powered off;</div>=0A<div>&gt; 2. If the redundant PSUs ar=
e all connected;</div>=0A<div>&gt; 3. If the AC input and DC standby outpu=
t is OK on all the PSUs;</div>=0A<div>&gt;</div>=0A<div>&gt;</div>=0A<div>=
&gt; ## Proposed Design</div>=0A<div>&gt;</div>=0A<div>&gt; As described i=
n the above requirements, there are different cases PSU firmware</div>=0A<=
div>&gt; is updated:</div>=0A<div>&gt; * When the APIs are invoked;</div>=
=0A<div>&gt; * When a new version is updated together with BMC code update=
;</div>=0A<div>&gt; * When a PSU is replaced with an old version of the fi=
rmware.</div>=0A<div>&gt;</div>=0A<div>&gt; ### Update by API</div>=0A<div=
>&gt;</div>=0A<div>&gt; This method is usually used by users who manually =
update PSU firmware.</div>=0A<div>&gt;</div>=0A<div>&gt; It will re-use th=
e current interfaces to upload, verify, and activate the</div>=0A<div>&gt;=
 image.</div>=0A<div>&gt;</div>=0A<div>&gt; 1. The "Version" interface nee=
ds to be extended:</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * Add a new [Versio=
nPurpose][4] for PSU;</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * Re-use the exi=
sting ExtendedVersion as an additional string for</div>=0A<div>&gt;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vendor-specific purpose, e.g. to indicate the PSU =
model.</div>=0A<div>&gt; 2. Re-use the existing functions implemented by [=
phosphor-bmc-code-mgmt][2] for</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; uploadi=
ng and processing the image.</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * The PSU=
 update image shall be a tarball consists of a MANIFEST, images,</div>=0A<=
div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and signatures</div>=0A<div>&gt; 3.=
 There will be a new service that implements the [Activation][5] interface=
 to</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; update the PSU firmware.</div>=0A<=
div>&gt;&nbsp;&nbsp;&nbsp; * The service will be started by default when B=
MC starts;</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * On start, the service wil=
l check the PSU's existing firmware and create</div>=0A<div>&gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; the Version and Activation interfaces;</div>=0A<div>&=
gt;&nbsp;&nbsp;&nbsp; * The service will verify the signature of the image=
;</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * The service shall check the Extend=
edVersion to make sure the image matches</div>=0A<div>&gt;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; the PSU model.</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * The se=
rvice will have a configure file to describe the PSU model and its</div>=
=0A<div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; related vendor-specific tools.<=
/div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * The service will find the matched ve=
ndor-specific tool to perform the code</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; update.</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; * When the PSU co=
de update is completed, an informational event log shall be</div>=0A<div>&=
gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; created.</div>=0A<div>&gt;&nbsp;&nbsp;&n=
bsp; * When the PSU code update is completed, the image, MANIFEST, and opt=
ionally</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; the signature will=
 be saved to a pre-defined directory in read-write</div>=0A<div>&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; filesystem for future use, in case a new PSU with=
 old firmware is plugged.</div>=0A<div>&gt; 4. The vendor-specific tool sh=
all run all the checks it needs to be run, before</div>=0A<div>&gt;&nbsp;&=
nbsp;&nbsp; and after the PSU update, and return a status to the above ser=
vice to</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; indicate the result.</div>=0A<=
div>&gt; 5. When the vendor-specific tool returns errors, the PSU update w=
ill be aborted</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; and an error event log =
shall be created.</div>=0A<div>&gt; 6. During the update, the vendor-speci=
fic tool shall set the related sensors to</div>=0A<div>&gt;&nbsp;&nbsp;&nb=
sp; non-functional, and when the update is done, it shall set the related<=
/div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; sensors back to functional.</div>=0A<d=
iv>&gt;</div>=0A<div>&gt; ### Update by new BMC image</div>=0A<div>&gt;</d=
iv>=0A<div>&gt; When BMC is updated and a new version of PSU firmware is i=
ncluded, it shall be</div>=0A<div>&gt; updated to the PSU.</div>=0A<div>&g=
t; This will be done by the same service described above.</div>=0A<div>&gt=
;</div>=0A<div>&gt; 1. On start, the service will check the PSU image, mod=
el and version in its</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; filesystem, comp=
are with the ones in PSU hardware and decide if PSU firmware</div>=0A<div>=
&gt;&nbsp;&nbsp;&nbsp; update shall be performed.</div>=0A<div>&gt; 2. The=
re could be two places containing the PSU images:</div>=0A<div>&gt;&nbsp;&=
nbsp;&nbsp; * The pre-defined directory in read-only filesystem, which is =
part of BMC</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image.</div>=
=0A<div>&gt;&nbsp;&nbsp;&nbsp; * The other pre-defined directory in read-w=
rite filesystem, which is the</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; location for the saved PSU images by API update.</div>=0A<div>&gt;&nbs=
p;&nbsp;&nbsp; Both places shall be checked and a newer version will be se=
lected to compare</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; with the PSU hardwar=
e.</div>=0A<div>&gt; 3. If PSU update is needed, the service will find the=
 matched vendor-specific</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; tool to perfo=
rm the code update.</div>=0A<div>&gt; 4. The following process will be the=
 same as [Update by API].</div>=0A<div>&gt;</div>=0A<div>&gt; ### Update o=
n replaced PSU</div>=0A<div>&gt;</div>=0A<div>&gt; When a PSU is replaced,=
 and the firmware version is older than the one in BMC</div>=0A<div>&gt; f=
ilesystem, it shall be updated.</div>=0A<div>&gt; This will be done by the=
 same service described above.</div>=0A<div>&gt;</div>=0A<div>&gt; 1. On s=
tart, the service will subscribe to the PropertiesChanged signal to</div>=
=0A<div>&gt;&nbsp;&nbsp;&nbsp; the PSU object path to monitor the PSU pres=
ence status.</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; (Or maybe subscribe the I=
nterfacesAded/Removed signal?)</div>=0A<div>&gt; 2. When a PSU's presence =
status is changed from false to true (or the</div>=0A<div>&gt;&nbsp;&nbsp;=
&nbsp; InterfacesAdded event occurs), the service will check the new PSU's=
 model,</div>=0A<div>&gt;&nbsp;&nbsp;&nbsp; firmware version to decide if =
the firmware needs to be updated.</div>=0A<div>&gt; 3. If yes, the service=
 will find the matched vendor-specific tool to perform</div>=0A<div>&gt;&n=
bsp;&nbsp;&nbsp; the code update.</div>=0A<div>&gt; 4. The following proce=
ss will be the same as [Update by API].</div>=0A<div>&gt;</div>=0A<div>&gt=
; ## Alternatives Considered</div>=0A<div>&gt;</div>=0A<div>&gt; ### Gener=
al implementation</div>=0A<div>&gt;</div>=0A<div>&gt; The PSU firmware upd=
ate could be implemented by separated recipes that only</div>=0A<div>&gt; =
call vendor-specific tools.</div>=0A<div>&gt; It will be a bit simpler but=
 loses the unified interface provided by OpenBMC's</div>=0A<div>&gt; exist=
ing [software update interface][1], and thus it will become difficult to</=
div>=0A<div>&gt; use a standard API to the PSU firmware update.</div>=0A<d=
iv>&gt;</div>=0A<div>&gt; ### VersionPurpose</div>=0A<div>&gt; It is possi=
ble to re-use the VersionPurpose.Other to represent the PSU image's</div>=
=0A<div>&gt; version purpose.</div>=0A<div>&gt; But that requires addition=
al information about the image, otherwise, there is</div>=0A<div>&gt; no w=
ay to tell if the image is for PSU, or CPLD, or other peripherals.</div>=
=0A<div>&gt; A new VersionPurpose.PSU is more specific and makes it easier=
 to implement and</div>=0A<div>&gt; friendly for the user.</div>=0A<div>&g=
t;</div>=0A<div>&gt; ### Additional string</div>=0A<div>&gt; The design pr=
oposal uses ExtendedVersion as the additional string for</div>=0A<div>&gt;=
 vendor-specific purpose, e.g. to indicate the PSU model, so the implement=
ation</div>=0A<div>&gt; could check and compare if the image matches the P=
SU model.</div>=0A<div>&gt; It is possible to make it optional or remove t=
his additional string, then the</div>=0A<div>&gt; implementation will not =
verify if the image matches the PSU. It could be OK if</div>=0A<div>&gt; w=
e trust the user who is uploading the correct image, especially the image<=
/div>=0A<div>&gt; shall be signed.</div>=0A<div>&gt; But it is always risk=
y in case the image does not match the PSU, and cause</div>=0A<div>&gt; un=
intended damage if the incorrect PSU firmware is updated.</div>=0A<div>&gt=
;</div>=0A<div>&gt;</div>=0A<div>&gt; ## Impacts</div>=0A<div>&gt;</div>=
=0A<div>&gt; This design only introduces a new VersionPurpose enum into th=
e dbus interfaces.</div>=0A<div>&gt; The newly introduced PSU firmware upd=
ate service will be a new service that</div>=0A<div>&gt; implements existi=
ng [Activation][5] interface.</div>=0A<div>&gt; So the impacts are minimal=
 to existing systems.</div>=0A<div>&gt;</div>=0A<div>&gt;</div>=0A<div>&gt=
; ## Testing</div>=0A<div>&gt;</div>=0A<div>&gt; It requires the manual te=
sts to verify the PSU code update process.</div>=0A<div>&gt; * Verify the =
PSU code update is done on all PSUs successfully;</div>=0A<div>&gt; * Veri=
fy the PSU code update will fail if the vendor-specific tool fails on</div=
>=0A<div>&gt;&nbsp;&nbsp; pre-condition check, of fails on updating PSU.</=
div>=0A<div>&gt; * Verify the PSU code update is performed after a new BMC=
 image is updated</div>=0A<div>&gt;&nbsp;&nbsp; containing a new version o=
f PSU firmware.</div>=0A<div>&gt; * Verify the PSU code update is performe=
d after a PSU with old firmware is</div>=0A<div>&gt;&nbsp;&nbsp; plugged i=
n.</div>=0A<div>&gt;</div>=0A<div>&gt;</div>=0A<div>&gt; [1]: https://gith=
ub.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/So=
ftware</div>=0A<div>&gt; [2]: https://github.com/openbmc/phosphor-bmc-code=
-mgmt/</div>=0A<div>&gt; [3]: https://github.com/openbmc/openpower-pnor-co=
de-mgmt/</div>=0A<div>&gt; [4]: https://github.com/openbmc/phosphor-dbus-i=
nterfaces/blob/57b878d048f929643276f1bf7fdf750abc4bde8b/xyz/openbmc_projec=
t/Software/Version.interface.yaml#L14</div>=0A<div>&gt; [5]: https://githu=
b.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Sof=
tware/Activation.interface.yaml</div>=0A</div></blockquote>=0A</body></htm=
l>
------=_001_NextPart376565420363_=------

