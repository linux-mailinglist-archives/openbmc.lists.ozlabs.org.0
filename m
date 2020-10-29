Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D5029F8E3
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 00:10:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMh4V0xc1zDqgP
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 10:10:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=jp9Kli34; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=jp9Kli34; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMgs40015zDqk5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 10:00:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604012434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ftzctYX8j+8xv6V7BvOY1ucFEGHfjEDvFiBDASfHvw=;
 b=jp9Kli34sLyHqe6jmM0oNb9NYiwRZ4Laf/vSoGy3ivxZtn+nnhCHQ3MktS3xYU4Smz24kv
 boxUaHrXVjUPd1yvQr7fEYPCTALQNby/+gD3RHgtnu3QJNwfMGX9oCYxq1SkGkhb6KeIYc
 1/YvJz9fXgXZGiLschlJKoNVSN1JfN4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1604012434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ftzctYX8j+8xv6V7BvOY1ucFEGHfjEDvFiBDASfHvw=;
 b=jp9Kli34sLyHqe6jmM0oNb9NYiwRZ4Laf/vSoGy3ivxZtn+nnhCHQ3MktS3xYU4Smz24kv
 boxUaHrXVjUPd1yvQr7fEYPCTALQNby/+gD3RHgtnu3QJNwfMGX9oCYxq1SkGkhb6KeIYc
 1/YvJz9fXgXZGiLschlJKoNVSN1JfN4=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-VuTtiKWTPmWdGFbFKXBILQ-1; Thu, 29 Oct 2020 19:00:32 -0400
X-MC-Unique: VuTtiKWTPmWdGFbFKXBILQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 29 Oct 2020 16:00:30 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 29 Oct 2020 16:00:30 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: RE: Using local git repo for recipe development
Thread-Topic: Using local git repo for recipe development
Thread-Index: AdauFs6ToZT99Bk/To2jUGwd1837nv//sAwA//9nhrCAAMYGgP//ih3AgAFrKACAAHM0wA==
Date: Thu, 29 Oct 2020 23:00:29 +0000
Message-ID: <fb16365eb7de4a63b71fbc72685e1d95@SCL-EXCHMB-13.phoenix.com>
References: <0bf9e810dbce40bf90d96a4d39e55d68@SCL-EXCHMB-13.phoenix.com>
 <42E14EF0-5851-4223-A3A5-07DC8837EF29@fb.com>
 <20cf0460e28a4950b0b3429d77da276c@SCL-EXCHMB-13.phoenix.com>
 <FA7A7193-3946-44AC-BF2E-6A5071D35690@fb.com>
 <0c4bf44913a04a0fb667fbdf82ea07be@SCL-EXCHMB-13.phoenix.com>
 <970b0009-2b37-6c46-b324-b74bd44bf539@gmail.com>
In-Reply-To: <970b0009-2b37-6c46-b324-b74bd44bf539@gmail.com>
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
Cc: Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SG0uICBJIHdhc24ndCBzZXR0aW5nIHRoZSBTIHZhcmlhYmxlIGluIG15IC5iYi4gIEFwcGFyZW50
bHksIHRoYXQncyB3aGF0IHdhcyBtaXNzaW5nLiAgSSBkaWRuJ3Qgc2VlIHRoYXQgYXMgcmVxdWly
ZWQgd2hlbiByZWFkaW5nIHRoZSBZb2N0byBkb2NzLg0KDQpUaGFua3MgZm9yIHRoZSBhc3Npc3Rh
bmNlIQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJyYW5kb24gV3lt
YW4gW21haWx0bzpiand5bWFuQGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIg
MjksIDIwMjAgMzo0OCBQTQ0KPiBUbzogUGF0cmljayBWb2Vsa2VyDQo+IFN1YmplY3Q6IFJlOiBV
c2luZyBsb2NhbCBnaXQgcmVwbyBmb3IgcmVjaXBlIGRldmVsb3BtZW50DQo+IA0KPiANCj4gT24g
MjAyMC0xMC0yOSAxNzoxMiwgUGF0cmljayBWb2Vsa2VyIHdyb3RlOg0KPiA+IE15IHVuZGVyc3Rh
bmRpbmcgaXMgdGhhdCBpZiBkZXZ0b29sIGNhbid0IGZpbmQgdGhlIHNvdXJjZSB0aGVuIGJpdGJh
a2Ugd29uJ3QNCj4gYmUgYWJsZSB0byBidWlsZCBpdCBlaXRoZXIuDQo+ID4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogVmlqYXkgS2hlbWthIFttYWlsdG86dmlq
YXlraGVta2FAZmIuY29tXQ0KPiA+PiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyOSwgMjAyMCAz
OjEwIFBNDQo+ID4+IFRvOiBQYXRyaWNrIFZvZWxrZXI7IE9wZW5CTUMgKG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZykNCj4gPj4gU3ViamVjdDogUmU6IFVzaW5nIGxvY2FsIGdpdCByZXBvIGZvciBy
ZWNpcGUgZGV2ZWxvcG1lbnQNCj4gPj4NCj4gPj4gV2hhdCBhcmUgeW91IHRyeWluZyB0byBhY2hp
ZXZlIGhlcmUsIGRldnRvb2wgaXMgZm9yIGxvY2FsIHNvdXJjZSBhbmQgeW91DQo+ID4+IGFscmVh
ZHkgaGF2ZSBsb2NhbCBzb3VyY2UsIGp1c3QgYnVpbGQgaXQgZnJvbSB0aGVyZS4NCj4gPj4NCj4g
Pj4g77u/T24gMTAvMjkvMjAsIDI6MzMgUE0sICJQYXRyaWNrIFZvZWxrZXIiIDxQYXRyaWNrX1Zv
ZWxrZXJAcGhvZW5peC5jb20+DQo+ID4+IHdyb3RlOg0KPiA+Pg0KPiA+PiAgICAgIFZpamF5LCB0
aGF0IGRpZG4ndCBtYWtlIGFueSBkaWZmZXJlbmNlLiAgSSBnZXQgdGhlIHNhbWUgcmVzdWx0Lg0K
PiA+Pg0KPiA+PiAgICAgID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gICAgICA+
IEZyb206IFZpamF5IEtoZW1rYSBbbWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbV0NCj4gPj4gICAg
ICA+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI5LCAyMDIwIDEyOjI3IFBNDQo+ID4+ICAgICAg
PiBUbzogUGF0cmljayBWb2Vsa2VyOyBPcGVuQk1DIChvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcp
DQo+ID4+ICAgICAgPiBTdWJqZWN0OiBSZTogVXNpbmcgbG9jYWwgZ2l0IHJlcG8gZm9yIHJlY2lw
ZSBkZXZlbG9wbWVudA0KPiA+PiAgICAgID4NCj4gPj4gICAgICA+DQo+ID4+ICAgICAgPg0KPiA+
PiAgICAgID4gT24gMTAvMjkvMjAsIDEwOjE3IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgUGF0
cmljayBWb2Vsa2VyIg0KPiA+PiA8b3BlbmJtYy0NCj4gPj4gICAgICA+IGJvdW5jZXMrdmlqYXlr
aGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mDQo+ID4+ICAgICAgPiBQ
YXRyaWNrX1ZvZWxrZXJAcGhvZW5peC5jb20+IHdyb3RlOg0KPiA+PiAgICAgID4NCj4gPj4gICAg
ICA+ICAgICBJJ20gY3JlYXRpbmcgYSBuZXcgcmVjaXBlIGZvciBsb2NhbCBkZXZlbG9wbWVudCBi
dXQgd2hlbiBJIGRvIGENCj4gPj4gJ2RldnRvb2wNCj4gPj4gICAgICA+IG1vZGlmeSA8cmVjaXBl
PicgaXQgYWx3YXlzIHNlZW1zIHRvIG1ha2UgYW4gZW1wdHkgZGlyZWN0b3J5ICh0aGF0DQo+ID4+
IGNvbnRhaW5zDQo+ID4+ICAgICAgPiBvbmx5IC5naXQuKQ0KPiA+PiAgICAgID4NCj4gPj4gICAg
ICA+ICAgICBIZXJlJ3MgdGhlIHJlbGV2YW50IGxpbmVzIGZyb20gbXkgLmJiIGZpbGU6DQo+ID4+
ICAgICAgPiAgICAgU1JDX1VSSSA9ICJnaXQ6Ly8vaG9tZS9wdm9lbGtlci9ibWMvZGV2L29lbTtw
cm90b2NvbD1maWxlIg0KPiA+PiAgICAgID4NCj4gPj4gICAgICA+IEkgYW0gbm90IHRvbyBzdXJl
IGJ1dCB0aGlzIHNob3VsZCBiZSBmaWxlOi8vLCBZb3UgbWF5IGhhdmUgdG8gZml4IGFib3ZlDQo+
IGxpbmUuDQo+ID4+ICAgICAgPg0KPiA+PiAgICAgID4gICAgIFNSQ1JFViA9ICI0ZGIxN2Y0ODJi
MGJkY2RjZjU2NThjN2QzMjNjYzU2M2ViNzg1NTZhIg0KPiA+PiAgICAgID4gICAgIGluaGVyaXQg
YXV0b3Rvb2xzDQo+ID4+ICAgICAgPg0KPiA+PiAgICAgID4gICAgIEhlcmUncyB0aGUgd2Fybmlu
ZyBmcm9tICdkZXZ0b29sIG1vZGlmeSc6DQo+ID4+ICAgICAgPiAgICAgV0FSTklORzogTm8gc291
cmNlIHVucGFja2VkIHRvIFMgLSBlaXRoZXIgdGhlIHBob2VuaXgtb2VtDQo+IHJlY2lwZQ0KPiA+
PiAgICAgID4gZG9lc24ndCB1c2UgYW55IHNvdXJjZSBvciB0aGUgY29ycmVjdCBzb3VyY2UgZGly
ZWN0b3J5IGNvdWxkIG5vdCBiZQ0KPiA+PiAgICAgID4gZGV0ZXJtaW5lZA0KPiANCj4gSSBhbSBu
b3Qgc3VyZSBpZiB5b3UgYXJlIGhpdHRpbmcgdGhhdCBTIGlzc3VlIEkgbm90ZWQgZm9yIGEgYnVp
bGQsIGJ1dA0KPiBtYXliZSB0aGlzIGlzIGluZm9ybWF0aXZlIGZvciB0aGF0IHBhcnRpY3VsYXIg
ZXJyb3I6DQo+IA0KPiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJt
Yy9tZXRhLXBob3NwaG9yLysvMzc3MDQNCj4gDQo+IG1ldGEtcGhvc3Bob3I6IGZpeCBTIHdpdGgg
dHJhaWxpbmcgc2xhc2gNCj4gDQo+IFVwc3RyZWFtIE9FIGFkZGVkIGEgd2FybmluZyB3aGVuIFMg
aGFzIGEgdHJhaWxpbmcgc2xhc2guwqAgUmVtb3ZlIHRoZQ0KPiB0cmFpbGluZyBTIGZyb20gdGhl
IGZsYWdnZWQgcmVjaXBlcyB0byBhdm9pZCB0aGUgd2FybmluZy4NCj4gDQo+IENoYW5nZS1JZDog
STQ1N2U3ZWUwMjFiNDBiMjA2YmQzY2QyNWQ0Y2FmZTQ5ODU0NjgyYTQNCj4gU2lnbmVkLW9mZi1i
eTogQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4NCj4gDQo+ID4+ICAg
ICAgPg0KPiA+PiAgICAgID4gICAgIElmIEkgY2hhbmdlIGVpdGhlciB0aGUgU1JDX1VSSSBvciB0
aGUgU1JDUkVWIHRvIGJlIGludmFsaWQsIEkgZ2V0IGFuDQo+ID4+IGVycm9yDQo+ID4+ICAgICAg
PiBpbnN0ZWFkIG9mIGEgd2FybmluZyBzbyBpdCdzIGRlZmluaXRlbHkgZmluZGluZyB0aGUgbG9j
YWwgcmVwby4NCj4gPj4gICAgICA+DQo+ID4+ICAgICAgPiAgICAgSSBjYW4ndCBmaWd1cmUgb3V0
IHdoeSBub25lIG9mIHRoZSBmaWxlcyBpbiBteSBjb21taXQgYXJlIG1ha2luZyBpdA0KPiBpbnRv
DQo+ID4+IHRoZQ0KPiA+PiAgICAgID4gdW5wYWNrIGRpcmVjdG9yeS4gIEFueSBpZGVhcyBvciB0
aXBzIG9uIGRlYnVnZ2luZz8gIEkgYWxzbyB0cmllZCB1c2luZw0KPiA+PiBhIC50YXIuZ3oNCj4g
Pj4gICAgICA+IGZpbGUgaW5zdGVhZCBvZiBhIGxvY2FsIGdpdCByZXBvIGFuZCBoYWQgdGhlIHNh
bWUgcmVzdWx0Lg0KPiA+PiAgICAgID4NCj4gPj4NCg0K

