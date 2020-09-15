Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11A26ADD5
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:43:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrYYX5r3CzDqSB
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:43:12 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=Vw7byfdH; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Vw7byfdH; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrYXn4XvRzDq7d
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:42:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600198947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7qb9eAinSdb7LKv293vrvWnjthEhSe8MA4o01P+9mI=;
 b=Vw7byfdH5P8BZ2BaV45AyPMI6i/V1Op3jWf8EhdcNxBSUV3uV+AXqBDhOxYHx481Cj74Fn
 MZWkRa56Bmxu4629OFGm7k722n2PkERdrayXkeZhpzR/ufXheKotofuHecGn2XvkYB59F9
 97SbbNpxFIzXPrAzJ5aWmC/udUZ9y3o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600198947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7qb9eAinSdb7LKv293vrvWnjthEhSe8MA4o01P+9mI=;
 b=Vw7byfdH5P8BZ2BaV45AyPMI6i/V1Op3jWf8EhdcNxBSUV3uV+AXqBDhOxYHx481Cj74Fn
 MZWkRa56Bmxu4629OFGm7k722n2PkERdrayXkeZhpzR/ufXheKotofuHecGn2XvkYB59F9
 97SbbNpxFIzXPrAzJ5aWmC/udUZ9y3o=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-B_AJmojAPk2U5QysP9e-Tg-1; Tue, 15 Sep 2020 15:42:25 -0400
X-MC-Unique: B_AJmojAPk2U5QysP9e-Tg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 15 Sep 2020 12:42:21 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 15 Sep 2020 12:42:21 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Neil Bradley
 <Neil_Bradley@phoenix.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP/+FToQgASWKQD//4oO4AAPAmyA//83aBD//mTOgP/mwW7Q/8yCMAD/mIeqQP8wEaiA/mAhSYD8uz7p0Pl1RXGA8uoMiMA=
Date: Tue, 15 Sep 2020 19:42:19 +0000
Message-ID: <28158f0fdc7c49a3a8804f303e9a3420@SCL-EXCHMB-13.phoenix.com>
References: <c27c916296c14b7a973ce10ce462a574@SCL-EXCHMB-13.phoenix.com>
 <5F804DFD-B91D-4293-A410-62ED737423A7@fb.com>
 <6bc3d9da57d44f55ad66179e74a51bd1@SCL-EXCHMB-13.phoenix.com>
 <a5e34d90e0c34849a672189f8adf9cd7@SCL-EXCHMB-13.phoenix.com>
 <AA3AD0B7-CC74-4B6C-927D-101A3E721004@fb.com>
 <b62681c4a4c148b58cdd9ff1e614d400@SCL-EXCHMB-13.phoenix.com>
 <22D145E2-1328-428F-9AAF-54E138797994@fb.com>
 <ba0c0f989f1045f98a5186a57917c4b6@SCL-EXCHMB-13.phoenix.com>
 <E2ECF617-0F2B-4526-A2F9-20F343F317A3@fb.com>
 <b6891a4662b04509ae5ed0f8c54777ce@SCL-EXCHMB-13.phoenix.com>
 <868F639F-7878-4B90-8CAE-7C95EB57B26E@fb.com>
 <9b4d083d50ad4feba14f5c8848540ade@SCL-EXCHMB-13.phoenix.com>
 <37DC42F0-56AD-477E-A5E0-29F8FB466D63@fb.com>
 <0e51a98472f34f5d8626a54dd2107479@SCL-EXCHMB-13.phoenix.com>
 <F30B4C21-5AF7-4E59-8353-944BD1C9F39B@fb.com>
 <e7456a8f3f004855829dfa746cd70780@SCL-EXCHMB-13.phoenix.com>
 <DDCDB096-458F-4AC6-BFE8-C1670ADC12C8@fb.com>
 <22A8A752-CE83-4E7E-9C0A-24828D6FDBFA@fb.com>
 <b7acd0b0fff646f4b6804fb0d6d020d0@SCL-EXCHMB-13.phoenix.com>
 <DC9E73F0-163B-4518-BAD2-AC16B87DBFAD@fb.com>
In-Reply-To: <DC9E73F0-163B-4518-BAD2-AC16B87DBFAD@fb.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Language: en-US
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
Cc: Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

WWVzLCB3aGVuIGluIHUtYm9vdCwgaGF2aW5nIHByZXZlbnRlZCB0aGUgYm9vdCB0byBMaW51eCBv
ciBoYXZpbmcgYSBjb3JydXB0IExpbnV4IGltYWdlLCBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIHBy
ZXNzIHRoZSBwb3dlciBidXR0b24gYW5kIGJvb3QgdGhlIGhvc3QuDQoNCkknbSBwcmVwYXJlZCB0
byBtb2RpZnkgdS1ib290IGNvZGUgdG8gbWFrZSB0aGUgbmVjZXNzYXJ5IGFkanVzdG1lbnRzIGlm
IEdQSU8gc2V0dGluZ3MgYXJlIGFsbCB0aGF0IGlzIHJlcXVpcmVkLiAgSWYgaXQgcmVxdWlyZXMg
bW9yZSB0aGFuIEdQSU8gc2V0dGluZ3MsIEknZCBsb3ZlIHRvIGtub3cgd2hhdCB0aGUgYmFzaWMg
cmVxdWlyZW1lbnRzIGFyZS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBWaWpheSBLaGVta2EgW21haWx0bzp2aWpheWtoZW1rYUBmYi5jb21dDQo+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciAxNSwgMjAyMCAxMjowNyBQTQ0KPiBUbzogUGF0cmljayBWb2Vsa2VyOyBO
ZWlsIEJyYWRsZXk7IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBDYzogQW1pdGhhc2ggUHJh
c2FkDQo+IFN1YmplY3Q6IFJlOiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44DQo+IA0KPiBIb25lc3Rs
eSwgSSBhbSBub3QgdW5kZXJzdGFuZGluZyBob3cgeW91IHdhbnQgdG8gY29udHJvbCBob3N0IHBv
d2VyIHdoZW4NCj4gYm1jIGJvb3RlZCB0byB1LWJvb3Qgb25seS4NCj4gUGxlYXNlIGV4cGxhaW4g
d2hhdCBpcyB5b3VyIHJlcXVpcmVtZW50LCBkbyB5b3Ugd2FudCB0byBjaGFuZ2UgdS1ib290IGNv
ZGU/DQo+IA0KPiBSZWdhcmRzDQo+IC1WaWpheQ0KPiANCj4g77u/T24gOS8xNC8yMCwgMTA6MzAg
QU0sICJQYXRyaWNrIFZvZWxrZXIiIDxQYXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20+DQo+IHdy
b3RlOg0KPiANCj4gICAgIFdoYXQgd291bGQgYW4gYXBwbGljYXRpb24gbmVlZCB0byBkbyB0byBj
b250cm9sIHBvd2VyIGZvciB0aGUgaG9zdD8NCj4gUG93ZXIgY29udHJvbCB3aGlsZSBpbiB1LWJv
b3QgX3Nob3VsZF8gYmUgYXMgc2ltcGxlIGFzIGVuYWJsaW5nIHRoZSBwb3dlcg0KPiBidXR0b24g
cGFzc3Rocm91Z2guDQo+IA0KPiAgICAgPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiAg
ICAgPiBGcm9tOiBWaWpheSBLaGVta2EgW21haWx0bzp2aWpheWtoZW1rYUBmYi5jb21dDQo+ICAg
ICA+IFN1YmplY3Q6IFJlOiBUaW9nYSBQYXNzIE9wZW5CTUMgMi44DQo+ICAgICA+DQo+ICAgICA+
IFNvIGlmIEJNQyBpcyBub3QgcnVubmluZyB0aGVuIHlvdSBjYW4gY29udHJvbCBwb3dlciBtYW51
YWxseSBieSBwb3dlcg0KPiAgICAgPiBidXR0b24gb3IgcmVzZXQgYnV0dG9uLiBBcyBmYXIgYXMg
SSBrbm93IFRoZXJlIGlzIG5vIGFwcGxpY2F0aW9uIGluIHVib290DQo+ICAgICA+IHdoaWNoIGNh
biBjb250cm9sIHBvd2VyIGZvciBob3N0LCBJdCBpcyBkb25lIHRocm91Z2ggQk1DIHdoZW4gaXQg
aXMNCj4gYm9vdGVkDQo+ICAgICA+IHRvIGxpbnV4IGFuZCBwb3dlciBjb250cm9sIGlzIHJ1bm5p
bmcuDQo+ICAgICA+DQo+ICAgICA+IFBsZWFzZSBsZXQgbWUga25vdyBpZiBJIGFtIG1pc3Npbmcg
YW55dGhpbmcgaGVyZS4NCj4gICAgID4NCj4gICAgID4gUmVnYXJkcw0KPiAgICAgPiAtVmlqYXkN
Cg0K

