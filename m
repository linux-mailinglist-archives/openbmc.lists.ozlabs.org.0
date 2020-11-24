Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F095F2C1EF4
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 08:37:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgG7N3pt2zDqVK
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 18:37:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=b5/DWL97; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=nRmHZvbu; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgG6K0Dx5zDqV3
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 18:36:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1606203361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVDlZnAFJZbY8qDbCIZAsKQcSgogTgRSv/vwGiWpBLc=;
 b=b5/DWL97oNbl6yfHzgqha1vigG5DbPqMcMCAjwZr+qqi5F5cQx6wJVeCQ1zNReSE00+zNa
 Wzqbto6ItbU6azsxh6SRTi0Opg3dNAwRcSsLItGIu4bQlemZdhjZ69ivwa7haGjzFoWjre
 B+9A99r5DeJ+zLQjN3HNu8mwwHIeTHE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1606203362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVDlZnAFJZbY8qDbCIZAsKQcSgogTgRSv/vwGiWpBLc=;
 b=nRmHZvbuXap+GkG8jFCL5scCHjDipa/WpYuzEvnUqagUqGxfiqhe048LtnJOCZy1zNcBEy
 neiU0HpGi+k1vdxGm+VNETVoXATDYl1ixUfvrY52yAXGur1WHARRy+i7PHaPMY1ewWdfDJ
 /ibBjeDQsRvpmE1fbjs5X0BK8TQRLcA=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-wtmFgjkNPtOI0cP_plcm7g-1; Tue, 24 Nov 2020 02:35:59 -0500
X-MC-Unique: wtmFgjkNPtOI0cP_plcm7g-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 23 Nov 2020 23:35:57 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 23 Nov 2020 23:35:57 -0800
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "OpenBMC
 (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: RE: Unresponsive BMC after booting into Ubuntu
Thread-Topic: Unresponsive BMC after booting into Ubuntu
Thread-Index: AdbB6IVyteZuFHQ2RRKT4gj4Gu4WPwAe7UuAAAv3iCA=
Date: Tue, 24 Nov 2020 07:35:55 +0000
Message-ID: <eaec79dfa2bc4d65acd2fdb8c93b02f9@SCL-EXCHMB-13.phoenix.com>
References: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
 <6cc50da92b76ff7fbda5f43651bb32f6ff7b0c9e.camel@yadro.com>
In-Reply-To: <6cc50da92b76ff7fbda5f43651bb32f6ff7b0c9e.camel@yadro.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.164.179]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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

SG0uICBTb3VuZHMgbGlrZSBhIGRpZmZlcmVudCBpc3N1ZS4gSSBkb24ndCB0aGluayB0aGlzIHNv
bHV0aW9uIHdpbGwgaGVscCBtZSBzaW5jZSBJIGNhbid0IGFjY2VzcyB0aGUgc2VyaWFsIGNvbnNv
bGUuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmVpIEthcnRh
c2hldiBbbWFpbHRvOmEua2FydGFzaGV2QHlhZHJvLmNvbV0NCj4gU2VudDogTW9uZGF5LCBOb3Zl
bWJlciAyMywgMjAyMCA5OjE4IFBNDQo+IFRvOiBQYXRyaWNrIFZvZWxrZXI7IE9wZW5CTUMgKG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZykNCj4gU3ViamVjdDogUmU6IFVucmVzcG9uc2l2ZSBCTUMg
YWZ0ZXIgYm9vdGluZyBpbnRvIFVidW50dQ0KPiANCj4gSGksDQo+IEkgaGFkIHNpbWlsYXIgaXNz
dWUsIGJ1dCBpdCB3YXMganVzdCAibm90IGxvYWRpbmcgc29tZSBwYWdlcyBpbiB3ZWJ1aQ0KPiBh
bmQgZG9lc24ndCByZXNwb25zZSBvbiBpcG1pIGNvbW1hbmRzIiwgc3NoIGFuZCBzZXJpYWwgY29u
c29sZSB1c2VkIHRvDQo+IHdvcmsuIEFuZCB5ZXMsIGl0IGFwcGVhcnMgYWZ0ZXIgTGludXggYm9v
dHMgb24gdGhlIGhvc3QsIGJ1dCBub3Qgd2l0aA0KPiBXaW5kb3dzLg0KPiBUaGUgcm9vdCBwcm9i
bGVtIGluIG15IGNhc2Ugd2FzIGluIFBFQ0kgZHJpdmVyIGFuZCBwb3dlciBzYXZpbmcgQ1BVDQo+
IG1vZGVzLg0KPiBIZXJlIHdhcyB0aGUgcGF0Y2ggd2hpY2ggc29sdmVzIHRoZSBwcm9ibGVtIGZv
ciBtZToNCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L29wZW5ibWMvcGF0
Y2gvZTZmNGFiMjk4NTRhYzU4YTg3DQo+IDgxODljMWVkZWNlNGU4ZWVkMmU3ZmQuY2FtZWxAeWFk
cm8uY29tLw0KPiANCj4gSSdtIG5vdCBzdXJlIGlmIGl0IGlzIHlvdXIgcHJvYmxlbSBhbHNvLCBp
ZiB5b3UgdXNlIGRidXMtc2Vuc29ycyB5b3UNCj4gY2FuIGNoZWNrIGJ5IHN0b3BwaW5nIENQVXNl
bnNvcjoNCj4gCXN5c3RlbWN0bCBzdG9wIHh5ei5vcGVuYm1jX3Byb2plY3QuY3B1c2Vuc29yLnNl
cnZpY2UNCj4gSWYgdGhlIHByb2JsZW0gZ29uZSBhZnRlciB0aGlzLCB5b3UgZ290IGl0ID0pDQo+
IA0KPiANCj4gT24gTW9uLCAyMDIwLTExLTIzIGF0IDIyOjQ5ICswMDAwLCBQYXRyaWNrIFZvZWxr
ZXIgd3JvdGU6DQo+ID4gSSBoYXZlIGEgc2l0dWF0aW9uIHdoZXJlLCB3aGlsZSBib290aW5nIHRo
ZSBob3N0IGludG8gVWJ1bnR1IGRlc2t0b3ANCj4gPiAxOC4wNCwgbXkgT3BlbkJNQyBhc3QyNTAw
IEJNQyBzdG9wcyByZXNwb25kaW5nIG9uIGFsbCBpbnRlcmZhY2VzDQo+ID4gaW5jbHVkaW5nIGl0
cyBkZWJ1ZyBzZXJpYWwgY29uc29sZS4gIEl0IGRvZXNuJ3QgZG8gdGhpcyB3aGVuIHRoZSBob3N0
DQo+ID4gYm9vdHMgaW50byBXaW5kb3dzLg0KPiA+DQo+ID4gTm90aGluZyBjYW1lIHVwIHdoZW4g
SSBkaWQgYW4gaW5pdGlhbCBnb29nbGUgc2VhcmNoLiAgQWxzbywgbm90aGluZw0KPiA+IHVudXN1
YWwganVtcHMgb3V0IGF0IG1lIGlmIEkgd2F0Y2ggdGhlIEJNQydzICdqb3VybmFsIC1mJyBwcmlv
ciB0bw0KPiA+IHRoZSBpc3N1ZS4gIE5vIGtlcm5lbCBwYW5pYyBvciBhbnl0aGluZyBsaWtlIHRo
YXQuDQo+ID4NCj4gPiBBcmUgdGhlcmUgYW55IGtub3duIGlzc3VlcyBsaWtlIHRoaXM/ICBJZiBu
b3QsIGFyZSB0aGVyZSBzb21lDQo+ID4gcG9pbnRlcnMgdG8gcmVsZXZhbnQgZGVidWcgc3RyYXRl
Z2llcyBmb3Igd2hlbiBCTUMgaXMgbm90DQo+ID4gYXZhaWxhYmxlPyAgSSdkIGxpa2UgdG8gYXZv
aWQgSlRBRyBkZWJ1Z2dpbmcgdGhlIGtlcm5lbCBpZg0KPiA+IHBvc3NpYmxlLiAgOi0pDQo+ID4N
Cj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBBbmRyZWkgS2FydGFzaGV2DQo+IA0KDQo=

