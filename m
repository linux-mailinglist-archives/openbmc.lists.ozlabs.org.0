Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 031F026AA6B
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 19:21:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrVQW6KgDzDqKf
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 03:21:55 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=C/408L3J; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=sLtbpT33; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrVMr1CCxzDqVP
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 03:19:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600190369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ztCfReBc1RScEyu2Yypxs1Ff+nobModmOwiNEBVT4s=;
 b=C/408L3J1nPU9eRLcqZJbB4FOK8BSFqcDFlfWcd7tBCW60zz9wsY6G2CTGRyp2pIMPEnM3
 Q9Pgigbf90xLXYCXP/wP3qdI0X1hupaIzoQVLKnjDodQr1Tia9hQL6wHvYIWtJw/xgA5z3
 /MS0X95JB3PRFR213G8ttrC30ioMAbc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600190370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ztCfReBc1RScEyu2Yypxs1Ff+nobModmOwiNEBVT4s=;
 b=sLtbpT33l2zRcxaDiQ9J9tN8S+QFFv/eRp/p0/1ZspCSrlHl2Fqbj0xxbNFhT26TQCzIlY
 IyJa2uIc7R8gWz0qPdH1dKNkZFK+8JsHqVQ8PLZfZtKvRb7+HhbcQBlAm7Um28RBWgqknu
 cAoPNaQGA8Rt7zYQIe1ni31R0Bbo/gc=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Ksw5VVu9NFOdMfW3_nnSQw-1; Tue, 15 Sep 2020 13:19:27 -0400
X-MC-Unique: Ksw5VVu9NFOdMfW3_nnSQw-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 15 Sep 2020 10:19:26 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 15 Sep 2020 10:19:26 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Patrick Voelker <Patrick_Voelker@phoenix.com>, Vijay Khemka
 <vijaykhemka@fb.com>, Neil Bradley <Neil_Bradley@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Tioga Pass OpenBMC 2.8
Thread-Topic: Tioga Pass OpenBMC 2.8
Thread-Index: AdZ4G9/pZ44Ttxs7TiCWRTJU7JTTHQCA72kAAA7UvEAAALC0EP//pIUA//+ESKCAAIvbAP/+FToQgASWKQD//4oO4AAPAmyA//83aBD//mTOgP/mwW7Q/8yCMAD/mIeqQP8wEaiA/mAhSYD8uz7p0Pl07x2Q
Date: Tue, 15 Sep 2020 17:19:25 +0000
Message-ID: <c918ddbd1e23412086ba8da789616838@SCL-EXCHMB-13.phoenix.com>
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
In-Reply-To: <b7acd0b0fff646f4b6804fb0d6d020d0@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
X-Mimecast-Spam-Score: 0.002
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

VGhlIG1haW4gaXNzdWUgSSdtIGhhdmluZyBpcyB1bmRlcnN0YW5kaW5nIHRoZSBiYXJlIG1pbmlt
dW0gcmVxdWlyZW1lbnRzIGZvciBCTUMgaW52b2x2ZW1lbnQgaW4gVGlvZ2EgUGFzcyBwb3dlciBv
bi4gIEkndmUgZm91bmQgdGhlIHJlY2lwZSBmYi1wb3dlcmN0cmwgd2hpY2ggc2V0cyBhIGNvdXBs
ZSBvZiBHUElPcyBidXQgYmV5b25kIHRoYXQgSSBjYW4ndCBmaWd1cmUgb3V0IGhvdyB0aGUgQk1D
IGlzIGVuYWJsaW5nIHBvd2VyIG9uLiAgSSdtIG1pc3Npbmcgc29tZXRoaW5nLg0KDQpJcyB0aGlz
IHNvbWV0aGluZyB5b3UgY2FuIGhlbHAgd2l0aD8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy0NCj4gYm91bmNlcytwYXRyaWNr
X3ZvZWxrZXI9cGhvZW5peC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mDQo+IFBh
dHJpY2sgVm9lbGtlcg0KPiBTZW50OiBNb25kYXksIFNlcHRlbWJlciAxNCwgMjAyMCAxMDozMCBB
TQ0KPiBTdWJqZWN0OiBSRTogVGlvZ2EgUGFzcyBPcGVuQk1DIDIuOA0KPiANCj4gV2hhdCB3b3Vs
ZCBhbiBhcHBsaWNhdGlvbiBuZWVkIHRvIGRvIHRvIGNvbnRyb2wgcG93ZXIgZm9yIHRoZSBob3N0
PyAgUG93ZXINCj4gY29udHJvbCB3aGlsZSBpbiB1LWJvb3QgX3Nob3VsZF8gYmUgYXMgc2ltcGxl
IGFzIGVuYWJsaW5nIHRoZSBwb3dlciBidXR0b24NCj4gcGFzc3Rocm91Z2guDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogVmlqYXkgS2hlbWthIFttYWlsdG86
dmlqYXlraGVta2FAZmIuY29tXQ0KPiA+IFN1YmplY3Q6IFJlOiBUaW9nYSBQYXNzIE9wZW5CTUMg
Mi44DQo+ID4NCj4gPiBTbyBpZiBCTUMgaXMgbm90IHJ1bm5pbmcgdGhlbiB5b3UgY2FuIGNvbnRy
b2wgcG93ZXIgbWFudWFsbHkgYnkgcG93ZXINCj4gPiBidXR0b24gb3IgcmVzZXQgYnV0dG9uLiBB
cyBmYXIgYXMgSSBrbm93IFRoZXJlIGlzIG5vIGFwcGxpY2F0aW9uIGluIHVib290DQo+ID4gd2hp
Y2ggY2FuIGNvbnRyb2wgcG93ZXIgZm9yIGhvc3QsIEl0IGlzIGRvbmUgdGhyb3VnaCBCTUMgd2hl
biBpdCBpcyBib290ZWQNCj4gPiB0byBsaW51eCBhbmQgcG93ZXIgY29udHJvbCBpcyBydW5uaW5n
Lg0KPiA+DQo+ID4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgYW0gbWlzc2luZyBhbnl0aGluZyBo
ZXJlLg0KPiA+DQo+ID4gUmVnYXJkcw0KPiA+IC1WaWpheQ0K

