Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6251F058C
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 09:08:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f9bn6CKtzDqyc
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 17:08:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=4199204d0=fran.hsu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49f9Zr3MsjzDqyY
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jun 2020 17:07:59 +1000 (AEST)
IronPort-SDR: JWGCYjFf1dmxRUEDX1dw3op43Dl9Gabj2VLCvf54dc8EQtVzB/yfBNI1Ml4krraHnWzSYGLkFG
 pZNCu34HC1kA==
Received: from unknown (HELO mailbx10.quanta.corp) ([10.243.91.107])
 by mx02.quantatw.com with ESMTP; 06 Jun 2020 15:07:55 +0800
Received: from mailbx10.quanta.corp (10.243.91.107) by mailbx10.quanta.corp
 (10.243.91.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 6 Jun 2020
 15:07:52 +0800
Received: from mailbx10.quanta.corp ([192.168.57.10]) by mailbx10.quanta.corp
 ([192.168.57.10]) with mapi id 15.01.1713.009;
 Sat, 6 Jun 2020 15:07:52 +0800
From: =?utf-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: kcsbridge cannot work with the latest sdbusplus package.
Thread-Topic: kcsbridge cannot work with the latest sdbusplus package.
Thread-Index: AdY7ONkP8PPI8i4LSqengBYq7BmgN///pXqA//51gRA=
Date: Sat, 6 Jun 2020 07:07:52 +0000
Message-ID: <3a70d7a9284e4eebb87f30461e4f5f82@quantatw.com>
References: <25e5caa0753f41f1b6524c351ee87011@quantatw.com>
 <20200605153321.GM17541@heinlein>
In-Reply-To: <20200605153321.GM17541@heinlein>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 4DE774AAAF48EB053DB49A6CBE6F128A792F1966E1E5B57C6BE50AE667D8F9D82000:8
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGF0cmljaywNCglUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiwgSSBwdXNoIGEgZml4IHRv
IEdlcnJpdCBmb3IgcmV2aWV3aW5nLg0KDQpUaGFua3MgDQpGcmFuIEhzdQ0KRS1NYWlsIDogRnJh
bi5Ic3VAUXVhbnRhVFcuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdjeC54eXo+DQo+IFNlbnQ6IEZyaWRheSwg
SnVuZSA1LCAyMDIwIDExOjMzIFBNDQo+IFRvOiBGcmFuIEhzdSAo5b6Q6KqM6KyZKSA8RnJhbi5I
c3VAcXVhbnRhdHcuY29tPg0KPiBDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBWZXJub24g
TWF1ZXJ5DQo+IDx2ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6
IGtjc2JyaWRnZSBjYW5ub3Qgd29yayB3aXRoIHRoZSBsYXRlc3Qgc2RidXNwbHVzIHBhY2thZ2Uu
DQo+IA0KPiBPbiBGcmksIEp1biAwNSwgMjAyMCBhdCAxMjo1NzozNVBNICswMDAwLCBGcmFuIEhz
dSAo5b6Q6KqM6KyZKSB3cm90ZToNCj4gPiBIaSBBbGwsDQo+ID4gCUkgYnVpbHQgdGhlIEJNQyBG
VyBmcm9tIHRoZSBsYXRlc3QgT3BlbkJNQyBicmFuY2guIEFuZCBJIGZvdW5kIHRoZSBrc2MNCj4g
Y2hhbm5lbCBpcyBub3Qgd29ya2luZy4NCj4gPiBJIGdvdCB0aGUgZm9sbG93aW5nIGVycm9yIG1l
c3NhZ2U6DQo+ID4gCWtjc2JyaWRnZWQgLWMgaXBtaS1rY3MxDQo+ID4gCXRlcm1pbmF0ZSBjYWxs
ZWQgYWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YNCj4gJ3NkYnVzcGx1czo6ZXhjZXB0aW9u
OjpTZEJ1c0Vycm9yJw0KPiA+ICAgCXdoYXQoKTogIEludmFsaWQgcGF0aCBvciBpbnRlcmZhY2U6
DQo+IG9yZy5mcmVlZGVza3RvcC5EQnVzLkVycm9yLkludmFsaWRBcmdzOiBJbnZhbGlkIGFyZ3Vt
ZW50DQo+ID4gCUFib3J0ZWQgKGNvcmUgZHVtcGVkKQ0KPiA+ICBTbyBJIGRpZCBhIGNoZWNrIG9m
IHRoZSByZWNlbnQgcGFja2FnZSBjaGFuZ2VzLg0KPiA+IFRoZSBsYXRlc3Qgc2RidXNwbHVzIGFk
ZCB0aGUgInZhbGlkYXRlIGludGVyZmFjZSBhbmQgcGF0aCBwYXNzZWQgdG8gREJ1cyIsDQo+IGJ1
dCB0aGVyZSBpcyBhIHByb2JsZW0gd2hlbiBrY3NicmlkZ2UgY2FsbCB0aGUgImFkZF9pbnRlcmZh
Y2UiIEFQSSwgdGhlIHBhcnQgb2YNCj4gdGhlIHJlZ2V4IGNoZWNraW5nIGZ1bmN0aW9uLg0KPiA+
DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3NkYnVzcGx1cy9ibG9iLzdmNjY0MjU0YTQz
NjU2MTJiODJkYjJmZDhmYjgNCj4gPiAyNzk4Njg2ZTc3N2IvaW5jbHVkZS9zZGJ1c3BsdXMvYXNp
by9vYmplY3Rfc2VydmVyLmhwcCNMODExDQo+ID4ga2NzYnJpZGdlIHRha2VzIHRoZSBvbmUgcGFy
YW1ldGVyIG9mIHRoZSAvZGV2L2lwbWkta2NzKi4gQnV0IHJlZ2V4IGZ1bmN0aW9uDQo+IGRpZG4n
dCBhbGxvdyB0aGUgY2hhcmFjdGVyICctJywgc28gSSBnb3QgdGhlIGV4Y2VwdGlvbiBtZXNzYWdl
Lg0KPiA+IERvZXMgaXQgbmVlZCB0byBhZGQgdGhlIHJlZ2V4IGNoZWNraW5nIHRvIHRoZSAiYWRk
X2ludGVyZmFjZSIgQVBJPyBPciBhZGQNCj4gdGhlIGNoYXJhY3RlciAnLScgdG8gdGhlIHJlZ2V4
IGNoZWNraW5nIHBhdHRlcm4/DQo+ID4NCj4gPiBUaGFua3MNCj4gPiBGcmFuIEhzdQ0KPiA+IEUt
TWFpbCA6IEZyYW4uSHN1QFF1YW50YVRXLmNvbQ0KPiA+DQo+IA0KPiBIaSBGcmFuLA0KPiANCj4g
a2NzYnJpZGdlZCBuZWVkcyBhbiB1cGRhdGUgdG8gbm90IHVzZSBhIC0uICBUaGlzIHdhcyBhZGRl
ZCBiZWNhdXNlOg0KPiANCj4gICAgIC0gVGhlIGRidXMgc3BlYyBpcyB2ZXJ5IGNsZWFyIGFib3V0
IHZhbGlkIG5hbWVzIGZvciBJbnRlcmZhY2VzLA0KPiAgICAgICBPYmplY3QgUGF0aHMsIGFuZCBT
ZXJ2aWNlcyBbMV0uDQo+IA0KPiAgICAgLSBJbiBzb21lIGNhc2VzLCBzZGJ1cyBpdHNlbGYgYW5k
L29yIHRoZSBkYnVzIGRhZW1vbiBhY3RpdmVseSBjaGVjaw0KPiAgICAgICBmb3IgdmFsaWQgbmFt
ZXMgYW5kIGdpdmUgYW4gZXJyb3IsIGJ1dCBpbiBhIGZldyBjYXNlcyB0aGUgZXJyb3INCj4gICAg
ICAgd2FzIGJlaW5nIGlnbm9yZWQgYnkgYXBwbGljYXRpb25zLg0KPiANCj4gICAgIC0gRm9yIG5h
bWVzIHRoYXQgc2RidXMgd2FzIG5vdCB2ZXJpZnlpbmcsIGl0IGlzIHBvc3NpYmxlIHRoZXkgYWRk
DQo+ICAgICAgIHZlcmlmaWNhdGlvbiBpbiB0aGUgZnV0dXJlIGFuZCBjYXVzZSBjb2RlIGJyZWFr
YWdlLg0KPiANCj4gSSBrbm93IEkgd2FzIGhlbHBpbmcgb25lIGRldmVsb3BlciByZWNlbnRseSB3
aG8gd2FzIGFkZGluZyBhIG5ldyBkYnVzDQo+IGVsZW1lbnQgYW5kIHRoZXkgd2VyZSBzdHVtcGVk
IGFzIHRvIHdoeSB0aGVpciBvYmplY3Qgd2FzIG5vdCBzaG93aW5nIHVwIGFzDQo+IHRoZXkgZXhw
ZWN0ZWQuICBJdCB3YXMgZHVlIHRvIGFuIGludmFsaWQgbmFtZSB0aGF0IHNkYnVzIHdhcyBkcm9w
cGluZy4NCj4gUmF0aGVyIHRoYW4gYSBzaWxlbnQgZXJyb3IgZnJvbSBzZGJ1cyB3ZSBtYWRlIHRo
aXMgYSBoYXJkLCBvYnZpb3VzIGVycm9yLCBieQ0KPiB0aHJvd2luZyBhbiBleGNlcHRpb24uDQo+
IA0KPiBUaGFua3MgZm9yIHJlcG9ydGluZyB0aGUgaXNzdWUuICBBcmUgeW91IGludGVyZXN0ZWQg
aW4gd29ya2luZyB1cCBhIGZpeCwNCj4gb3RoZXJ3aXNlIFZlcm5vbiBpcyB0aGUgb25seSBsaXN0
ZWQgbWFpbnRhaW5lciBwcmVzZW50bHk/DQo+IA0KPiBbMV0NCj4gaHR0cHM6Ly9kYnVzLmZyZWVk
ZXNrdG9wLm9yZy9kb2MvZGJ1cy1zcGVjaWZpY2F0aW9uLmh0bWwjbWVzc2FnZS1wcm90b2NvbC1u
YQ0KPiBtZXMNCj4gDQo+IC0tDQo+IFBhdHJpY2sgV2lsbGlhbXMNCg==
