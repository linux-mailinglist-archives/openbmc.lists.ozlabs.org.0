Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 136DF25B41A
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 20:52:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhY340mmvzDr1g
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 04:52:32 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=eMWhA660; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=eMWhA660; 
 dkim-atps=neutral
X-Greylist: delayed 69 seconds by postgrey-1.36 at bilbo;
 Thu, 03 Sep 2020 04:51:37 AEST
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhY2205T6zDr0Q
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 04:51:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599072695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U80B7Dle62SzqXfv0kHeu6HI5pFvIJk69Aq2Z1wckFM=;
 b=eMWhA660eek4fAul3Y3pZJ6rIRaJV73B2NfKFhpzoZqd2AoAtXkSCDv1ChU4RjJ5Mp1vAM
 +FMxn2LFL/vK91+3muKNX51ySF9mzCtqz/VD1Ky6xhctCUVojHWGtDj6CuNsOMKLCvRD7O
 NZCBW1ovZRvPqAY9A7c75HbVYbwIJ5U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1599072695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U80B7Dle62SzqXfv0kHeu6HI5pFvIJk69Aq2Z1wckFM=;
 b=eMWhA660eek4fAul3Y3pZJ6rIRaJV73B2NfKFhpzoZqd2AoAtXkSCDv1ChU4RjJ5Mp1vAM
 +FMxn2LFL/vK91+3muKNX51ySF9mzCtqz/VD1Ky6xhctCUVojHWGtDj6CuNsOMKLCvRD7O
 NZCBW1ovZRvPqAY9A7c75HbVYbwIJ5U=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-PbM4lE_ZN6SrUnhI-VONDQ-1; Wed, 02 Sep 2020 14:50:04 -0400
X-MC-Unique: PbM4lE_ZN6SrUnhI-VONDQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 2 Sep 2020 11:50:02 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 2 Sep 2020 11:50:02 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
Subject: RE: When building OpenBMC . . . ?
Thread-Topic: When building OpenBMC . . . ?
Thread-Index: AdZ/GJ+lFWuwSqbeSoqGTbguwoelIQBfNdqAAAffPIAAKQSfMA==
Date: Wed, 2 Sep 2020 18:50:01 +0000
Message-ID: <2249bb47512947dab406345cfee1206d@SCL-EXCHMB-13.phoenix.com>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
 <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
In-Reply-To: <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [50.39.166.255]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=patrick_voelker@phoenix.com
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSdtIGdpdmluZyB0aGUgZmlyc3Qgb3B0aW9uIGJlbG93IGEgdHJ5LiAgSSd2ZSBkZWZpbmVkIGFu
IGFsdGVybmF0aXZlIHZhcmlhbnQgYW5kIGhhdmUgaW5jbHVkZWQgdGhlIG1ldGEtZmFjZWJvb2sv
bWV0YS10aW9nYXBhc3MgbGF5ZXIgaW4gbXkgYnVpbGQuDQoNCk9uZSBwcm9ibGVtIEknbSBydW5u
aW5nIGludG8gaXMgdGhhdCBtZXRhLXRpb2dhcGFzcyBpbmNsdWRlcyBhIHJzeXNsb2cqLmJiYXBw
ZW5kIGFuZCBvbmUgb2YgdGhlIG90aGVyIGxheWVycyBJJ20gdXNpbmcgYWxzbyBoYXMgYSBzaW1p
bGFyIHJzeXNsb2cqLmJiYXBwZW5kLg0KDQpFYWNoIGRvIGFuIGFwcGVuZCB0byBkb19pbnN0YWxs
KCkgYW5kIGVhY2ggb25lIHRyaWVzIHRvIHJlbW92ZSAke0R9JHtzeXNjb25mZGlyfS9yc3lzbG9n
LmQvaW1qb3VybmFsLmNvbmYuICBPZiBjb3Vyc2UgdGhhdCBmaWxlIGNhbiBvbmx5IGJlIHJlbW92
ZWQgb25jZSBzbyB0aGUgYnVpbGQgZmFpbHMuDQoNCk15IHF1ZXN0aW9uIG5vdywgaXMgd2hhdCdz
IHRoZSBiZXN0IHdheSB0byB3b3JrIGFyb3VuZCB0aGlzPyAgSSBkb24ndCBuZWVkIHJzeXNsb2cg
ZnJvbSBtZXRhLXRpb2dhcGFzcywganVzdCB0aGUgbWFjaGluZSBzcGVjaWZpY3MuDQoNCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJt
Yy0NCj4gYm91bmNlcytwYXRyaWNrX3ZvZWxrZXI9cGhvZW5peC5jb21AbGlzdHMub3psYWJzLm9y
Z10gT24gQmVoYWxmIE9mIEVkDQo+IFRhbm91cw0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIg
MSwgMjAyMCA5OjEwIEFNDQo+IFRvOiBQYXRyaWNrIFdpbGxpYW1zDQo+IENjOiBCcnVjZSBNaXRj
aGVsbDsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBXaGVuIGJ1aWxk
aW5nIE9wZW5CTUMgLiAuIC4gPw0KPiANCjxzbmlwPg0KPiA+ICMxIHNob3VsZCBnbyBpbnRvIG1l
dGEtcGhvZW5peC4gIFlvdSdyZSBsaWtlbHkgdGhlIGZpcnN0IG9uZSBkb2luZyB0aGlzLA0KPiA+
IHNvIHdlIG1heSBuZWVkIHNvbWUgZXhwZXJpbWVudGF0aW9uIG9uIHRoZSBiZXN0IG9wdGlvbi4g
IEkgaGF2ZSB0d28NCj4gPiBpZGVhcyAodGhlcmUgYXJlIHByb2JhYmx5IG90aGVycyk6DQo+ID4N
Cj4gPiAgICogTWFrZSBhbiBhbHRlcm5hdGl2ZSB0aW9nYXBhc3MgdmFyaWFudCwgbGlrZSB0aW9n
YXBhc3MtcGhvZW5peCwgd2hpY2gNCj4gPiAgICAgZW5kcyB1cCBpbmNsdWRpbmcgYWxsIHRoZSBj
b21tb24gdGlvZ2FwYXNzIGNvZGUgZnJvbSBtZXRhLWZhY2Vib29rLg0KPiA+DQo+ID4gICAqIENy
ZWF0ZSBhIG5ldyBkaXN0cm8gdHlwZSBmb3IgcGhvZW5peCwgd2hpY2ggZW5oYW5jZXMgdGhlIHVu
ZGVybHlpbmcNCj4gPiAgICAgb3BlbmJtYyBkaXN0cmlidXRpb24gd2l0aCB5b3VyIG93biBicmFu
ZGluZyB0d2Vha3MuICBZb3UnZCBzdGlsbA0KPiA+ICAgICBidWlsZCBtZXRhLWZhY2Vib29rL3Rp
b2dhcGFzcyBidXQgd2l0aCBhIGRpZmZlcmVudCBkaXN0cm8gZmxhdm9yLg0KPiANCj4gVGhpcyBv
bmUgd291bGQgYmUgbXkgdm90ZSBiZXR3ZWVuIHRoZSB0d28sIGFuZCBJIHRoaW5rIHRoZXJlJ3MN
Cj4gcHJlY2VkZW50IHdpdGggb3RoZXIgY29tcGFuaWVzIGRvaW5nIHNpbWlsYXIgdGhpbmdzLiAg
SXNuJ3QgdGhpcyB0aGUNCj4gd2F5IHlvY3RvIHJlY29tbWVuZHM/DQo=

