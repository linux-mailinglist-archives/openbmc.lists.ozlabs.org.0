Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F52599DA
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:44:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgtG72jyYzDqHX
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:44:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=Ju/Akd9k; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Ju/Akd9k; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgsvW1HZLzDqLh
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:28:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22DunoyrYx1F/VZGepR/HlkvpFyK0EZiSw40Bl9gq+k=;
 b=Ju/Akd9kKYwFlWZ9yWCvuTK5roXgH80QRWjCzErRksW36V0MDiIlr8NuYeRT/tKm2vZoC6
 zEsGIPBRuk/NGyRqRhCi3eBoz/HGBHieEjciSm6hvdLs1uVz1WKETNkQ4i9ZxjhL4AI1a7
 ikwNzCfXZw35OXbA/Y3O2bkmiPPhtTY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1598977715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22DunoyrYx1F/VZGepR/HlkvpFyK0EZiSw40Bl9gq+k=;
 b=Ju/Akd9kKYwFlWZ9yWCvuTK5roXgH80QRWjCzErRksW36V0MDiIlr8NuYeRT/tKm2vZoC6
 zEsGIPBRuk/NGyRqRhCi3eBoz/HGBHieEjciSm6hvdLs1uVz1WKETNkQ4i9ZxjhL4AI1a7
 ikwNzCfXZw35OXbA/Y3O2bkmiPPhtTY=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-W9g0hsfyOlGqq-gY-dCq5g-1; Tue, 01 Sep 2020 12:28:33 -0400
X-MC-Unique: W9g0hsfyOlGqq-gY-dCq5g-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 1 Sep 2020 09:28:30 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 1 Sep 2020 09:28:30 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQBfNdqAAAffPIAADg+0EA==
Date: Tue, 1 Sep 2020 16:28:29 +0000
Message-ID: <3cec63809dc740e882236a70b9fb3cf5@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
In-Reply-To: <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.131]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0.001
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91IEVkISAgWW91ciBzdWdnZXN0IG9mIHdoYXQgWW9jdG8gcmVjb21tZW5kcyBpcyBn
b29kIGFuZCB3ZSB3aWxsIGludmVzdGlnYXRlIGZ1cnRoZXIuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogRWQgVGFub3VzIFttYWlsdG86ZWRAdGFub3VzLm5ldF0NCj4g
U2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEsIDIwMjAgMDk6MTANCj4gVG86IFBhdHJpY2sgV2ls
bGlhbXMNCj4gQ2M6IEJydWNlIE1pdGNoZWxsOyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4g
U3ViamVjdDogUmU6IFdoZW4gYnVpbGRpbmcgT3BlbkJNQyAuIC4gLiA/DQo+IA0KPiBPbiBUdWUs
IFNlcCAxLCAyMDIwIGF0IDU6MjYgQU0gUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdjeC54
eXo+DQo+IHdyb3RlOg0KPiA+DQo+ID4gT24gU3VuLCBBdWcgMzAsIDIwMjAgYXQgMTA6MDI6NDFQ
TSArMDAwMCwgQnJ1Y2UgTWl0Y2hlbGwgd3JvdGU6DQo+ID4gPiBXaGVuIHNlbGVjdGluZyBUYXJn
ZXQgaGFyZHdhcmUNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYyMzLXRhcmdl
dC15b3VyLWhhcmR3YXJlDQo+ID4gPiB0byBidWlsZCBmb3IgdGhlIGlzIGEgdGlvZ2FwYXNzLCBu
b3cgaWYgSSBhZGQgYSBtZXRhLXBob2VuaXgvbWV0YS0NCj4gdGlvZ2FwYXNzL2NvbmYgIGhvdyBk
b2VzDQo+ID4gPiAgICAgICBzb3VyY2Ugc2V0dXAgdGlvZ2FwYXNzIGJ1aWxkDQo+ID4gPiBrbm93
IHdoaWNoIHRpb2dhcGFzcyB0byBidWlsZD8NCj4gPg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL29wZW5ibWMvYmxvYi9tYXN0ZXIvc2V0dXAjTDM0DQo+ID4NCj4gPiBUaGUgc2V0dXAg
c2NyaXB0IGp1c3QgZG9lcyBhIHdpbGRjYXJkLCB3aGljaCBtZWFucyB5b3UnbGwgZ2V0IHRoZQ0K
PiA+IGFscGhhYmV0aWNhbGx5IG9yZGVyZWQgbWFjaGluZS4gIEluIHRoaXMgY2FzZSwgeW91IHNo
b3VsZCBnZXQgdGhlDQo+ID4gbWV0YS1mYWNlYm9vayBvbmUgc2VsZWN0ZWQgYmVmb3JlIHRoZSBt
ZXRhLXBob2VuaXggKHN1cHBvc2luZyB0aGV5DQo+IGJvdGgNCj4gPiBleGlzdCkuDQo+ID4NCj4g
PiA+IE9yIGFtIEkgbm90IHN1cHBvc2VkIHRvIGNob29zZSBhIG5hbWUgKGkuZS4gdGlvZ2FwYXNz
IGluIHRoaXMgZXhhbXBsZSkNCj4gdGhhdCBpcyBhbHJlYWR5IGluIHRoZSBsaXN0DQo+ID4gPiB3
aGVuIEkgbmVlZCB0byBjcmVhdGUgYSBuZXcgbWV0YS1waG9lbml4L21ldGEtPG1hY2hpbmU+L2Nv
bmY/DQo+ID4NCj4gPiBUaGUgb3ZlcndoZWxtaW5nIHByZWZlcmVuY2Ugc2VlbXMgdG8gYmUgdG8g
bm90IG1ha2UgYW5vdGhlcg0KPiA+IGNvbmZpZ3VyYXRpb24gd2l0aCB0aGUgc2FtZSBtYWNoaW5l
LCBhbmQgYXMgb25lIG9mIHRoZSBtYWludGFpbmVycyBvZg0KPiA+IG1ldGEtZmFjZWJvb2ssIEkg
YWdyZWUgaW4gdGhpcyBjYXNlLiAgQnV0LCB0aGlzIGFuc3dlciBkb2Vzbid0IHNvbHZlDQo+ID4g
eW91ciB1bmRlcmx5aW5nIHF1ZXN0aW9uLg0KPiA+DQo+ID4gSSBzdXNwZWN0IHlvdSdyZSBnb2lu
ZyB0byBtYWtlIHR3byBraW5kcyBvZiBjaGFuZ2VzOg0KPiA+ICAgMS4gRmVhdHVyZXMgeW91IHdh
bnQgdG8gZW5hYmxlIG9uIFRpb2dhcGFzcyB0aGF0IEZhY2Vib29rIGlzbid0DQo+ID4gICAgICBp
bnRlcmVzdGVkIGluLiAgKEkgd291bGQgY292ZXIgYm1jd2ViICdicmFuZGluZycgY2hhbmdlcyBo
ZXJlDQo+ID4gICAgICBhbHNvKS4NCj4gDQo+IGJtY3dlYiBicmFuZGluZyBpcyBhIG1hY2hpbmUg
aW5kZXBlbmRlbnQgZmVhdHVyZS4gIEF0IHNvbWUgcG9pbnQgd2UNCj4gbWlnaHQgaGF2ZSB0aGUg
d2VidWkgZmVhdHVyZSBlbmFibGUvZGlzYWJsZSB0aGluZ3MgYWdhaW4sIGFuZCB3aG8NCj4ga25v
d3MsIG1heWJlIHdlIG5lZWQgbWFjaGluZSBzcGVjaWZpYyBicmFuZGluZywgYnV0IEkgd2FudCB0
byBhdm9pZCBpdA0KPiB3aGVyZXZlciBwb3NzaWJsZS4NCj4gDQo+ID4gICAyLiBGaXhlcyBhbmQg
Y29uZmlndXJhdGlvbiBkdWUgdG8gZmVhdHVyZXMgd2UgaGF2ZW4ndCBlbmFibGVkIHlldCBvcg0K
PiA+ICAgICAgZnVsbHkgdmV0dGVkLg0KPiA+DQo+ID4gIzIgc2hvdWxkIGdvIGludG8gZWl0aGVy
IG1ldGEtZmFjZWJvb2sgKG9yIHRoZSB1bmRlcmx5aW5nIGNvZGUNCj4gPiByZXBvc2l0b3J5IHdo
ZXJlIHRoZSBmaXggaXMgbmVlZGVkKS4gIFRoZXNlIHdpbGwgYmUgY29tbW9uIGZvciBhbnkNCj4g
DQo+ICsxDQo+IA0KPiBDb3VsZCB3ZSBhbHNvIG1ha2UgdGhlIHN0YXRlbWVudCB0aGF0IGFzIGEg
cHJvamVjdCwgd2Ugd2lsbCBlbmFibGUNCj4gZXZlcnkgcGxhdGZvcm0gZmVhdHVyZSB3ZSBhcmUg
YWJsZSB0byBmb3IgZXZlcnkgcGxhdGZvcm0gYnkgZGVmYXVsdCwNCj4gYW5kIGlmIGEgY29tcGFu
eSB3YW50cyB0byBzcGVjaWZpY2FsbHkgZGlzYWJsZSBzb21lIGZlYXR1cmVzIGZvciB0aGVpcg0K
PiB1c2UgYmVjYXVzZSB0aGV5IGhhdmVuJ3QgdmV0dGVkIHRoZW0sIHRoZXkgc2hvdWxkIGRvIHRo
YXQgaW4gYQ0KPiBzcGVjaWZpYyBkaXN0cm8/ICBTYWlkIGFub3RoZXIgd2F5LCB0aGUgImRlZmF1
bHQiIGZvciBldmVyeSBtYWNoaW5lDQo+IHNob3VsZCBiZSBldmVyeSBmZWF0dXJlIGVuYWJsZWQs
IGFzIHRoYXQncyB3aGF0IGhlbHBzIHVzZXJzIGFuZA0KPiBkZXZlbG9wZXJzIHRoZSBtb3N0Lg0K
PiANCj4gPg0KPiA+ICMxIHNob3VsZCBnbyBpbnRvIG1ldGEtcGhvZW5peC4gIFlvdSdyZSBsaWtl
bHkgdGhlIGZpcnN0IG9uZSBkb2luZyB0aGlzLA0KPiA+IHNvIHdlIG1heSBuZWVkIHNvbWUgZXhw
ZXJpbWVudGF0aW9uIG9uIHRoZSBiZXN0IG9wdGlvbi4gIEkgaGF2ZSB0d28NCj4gPiBpZGVhcyAo
dGhlcmUgYXJlIHByb2JhYmx5IG90aGVycyk6DQo+ID4NCj4gPiAgICogTWFrZSBhbiBhbHRlcm5h
dGl2ZSB0aW9nYXBhc3MgdmFyaWFudCwgbGlrZSB0aW9nYXBhc3MtcGhvZW5peCwgd2hpY2gNCj4g
PiAgICAgZW5kcyB1cCBpbmNsdWRpbmcgYWxsIHRoZSBjb21tb24gdGlvZ2FwYXNzIGNvZGUgZnJv
bSBtZXRhLQ0KPiBmYWNlYm9vay4NCj4gPg0KPiA+ICAgKiBDcmVhdGUgYSBuZXcgZGlzdHJvIHR5
cGUgZm9yIHBob2VuaXgsIHdoaWNoIGVuaGFuY2VzIHRoZQ0KPiB1bmRlcmx5aW5nDQo+ID4gICAg
IG9wZW5ibWMgZGlzdHJpYnV0aW9uIHdpdGggeW91ciBvd24gYnJhbmRpbmcgdHdlYWtzLiAgWW91
J2Qgc3RpbGwNCj4gPiAgICAgYnVpbGQgbWV0YS1mYWNlYm9vay90aW9nYXBhc3MgYnV0IHdpdGgg
YSBkaWZmZXJlbnQgZGlzdHJvIGZsYXZvci4NCj4gDQo+IFRoaXMgb25lIHdvdWxkIGJlIG15IHZv
dGUgYmV0d2VlbiB0aGUgdHdvLCBhbmQgSSB0aGluayB0aGVyZSdzDQo+IHByZWNlZGVudCB3aXRo
IG90aGVyIGNvbXBhbmllcyBkb2luZyBzaW1pbGFyIHRoaW5ncy4gIElzbid0IHRoaXMgdGhlDQo+
IHdheSB5b2N0byByZWNvbW1lbmRzPw0KPiANCj4gPg0KPiA+IEkgYmVsaWV2ZSBJQk0gaGFzIGV4
cGVyaWVtZW50ZWQgd2l0aCBib3RoIG9mIHRoZXNlIGFwcHJvYWNoZXMgZm9yDQo+ID4gd2l0aGVy
c3Bvb24gKHNlZSB3aXRoZXJzcG9vbi10YWNvbWEgYW5kDQo+ID4gbWV0YS1pYm0vY29uZi9kaXN0
cm8vb3BlbmJtYy13aXRoZXJzcG9vbi5jb25mKSBhbmQgbWlnaHQgaGF2ZQ0KPiBzb21lDQo+ID4g
aW5zaWdodCBpbnRvIHdoYXQgaGFzIHdvcmtlZCB3ZWxsIGZvciB0aGVtLg0KPiA+DQo+ID4gSSdt
IG1vcmUgdGhhbiB3aWxsaW5nIHRvIHdvcmsgd2l0aCB5b3UgYW5kIHlvdXIgdGVhbSB0byBoZWxw
IHJlZmFjdG9yDQo+ID4gbWV0YS1mYWNlYm9vay90aW9nYXBhc3MgaW4gYSB3YXkgdGhhdCBtYWtl
cyBpdCBtb3JlIGNvbmR1c2l2ZSB0bw0KPiB3aGF0DQo+ID4geW91ciB0ZWFtIGlzIGludGVyZXN0
ZWQgaW4gZG9pbmcuICBJIHN1c3BlY3Qgd2UnbGwgbmVlZCB0byBjcmVhdGUgc29tZQ0KPiA+IGFk
ZGl0aW9uYWwgYml0YmFrZSAnLmluYycgZmlsZXMgYW5kIG1vdmUgc29tZSBvZiB0aGUgY29udGVu
dCB3ZSBoYXZlIGluDQo+ID4gJy5jb25mJyB0byAnLmluYycuICBDYXRjaCBtZSBoZXJlIG9yIG9u
IElSQyBhcyBuZWVkZWQuDQo+ID4NCj4gPiAtLQ0KPiA+IFBhdHJpY2sgV2lsbGlhbXMNCg0K

