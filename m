Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14D14AD5B
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:51:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4867NX3kdDzDqGP
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:51:40 +1100 (AEDT)
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
 header.s=mimecast20170203 header.b=Kn+dJksP; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4867Mn2wzwzDqDs
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:50:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1580172653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIQ5+bTVDbYUxr73TenEb/ewY9VZP2hivdZQt2wfzWU=;
 b=Kn+dJksPZtrACjsqfKM0rWWgm9CXOEptyVcPomPvwnaJ1rdkkRuoAVBXChBbUU1+vafR/d
 5oei7yFaY1z3ADk2Jjbslvbte5ZEN7d+3DN8gCG7XDPSfuVpb30k5FgSlwgPdEmK817U2p
 vuqUh137Ta1LSDLtq5QC4R478Hg02Go=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-EyHJdq0rPcaphnKVFjvUzQ-1; Mon, 27 Jan 2020 19:50:52 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Mon, 27 Jan 2020 16:50:38 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Mon, 27 Jan 2020 16:50:38 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joseph Reynolds <jrey@linux.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: RE: Security workgroup meeting times
Thread-Topic: Security workgroup meeting times
Thread-Index: AQHV1TkuiI2dSVrIgU2C5g2th6mzBqf/v5YA//9/3VA=
Date: Tue, 28 Jan 2020 00:50:38 +0000
Message-ID: <806158e0db024567b08c97a5b00a37e2@SCL-EXCHMB-13.phoenix.com>
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
 <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
 <12e5a999-971b-4edd-b04d-aac018936a77@www.fastmail.com>
In-Reply-To: <12e5a999-971b-4edd-b04d-aac018936a77@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: EyHJdq0rPcaphnKVFjvUzQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
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

SWYgeW91IHdhbnQgdG8gaW5jbHVkZSBTaWxpY29uIFZhbGxleSBpdCBzZWVtIGxpa2UgMjI6MDAs
IDIzOjAwLCAwMDowMCwgMDE6MDAsIGFuZCAwMjowMCBVVEMvR01UIGFyZSB0aGUgb25seSByZWFs
IG9wdGlvbnMuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIFtt
YWlsdG86b3BlbmJtYy1ib3VuY2VzK2JydWNlX21pdGNoZWxsPXBob2VuaXguY29tQGxpc3RzLm96
bGFicy5vcmddIE9uIEJlaGFsZiBPZiBBbmRyZXcgSmVmZmVyeQ0KU2VudDogTW9uZGF5LCBKYW51
YXJ5IDI3LCAyMDIwIDE2OjI5DQpUbzogSm9zZXBoIFJleW5vbGRzOyBvcGVuYm1jDQpTdWJqZWN0
OiBSZTogU2VjdXJpdHkgd29ya2dyb3VwIG1lZXRpbmcgdGltZXMNCg0KDQoNCk9uIFR1ZSwgMjgg
SmFuIDIwMjAsIGF0IDA0OjEyLCBKb3NlcGggUmV5bm9sZHMgd3JvdGU6DQo+IFRlYW0sDQo+IA0K
PiBMZXQncyB0cnkgYWdhaW4gdG8gZXN0YWJsaXNoIGFub3RoZXIgT3BlbkJNQyBTZWN1cml0eSBX
b3JrZ3JvdXAgbWVldGluZyANCj4gdGltZS7CoCBUaGUgY3VycmVudCBtZWV0aW5nIHRpbWUgKGV2
ZXJ5IG90aGVyIHdlZWsgMTBhbSBQYWNpZmljIERheWxpZ2h0IA0KPiBUaW1lKSBpcyB3b3JraW5n
IGZvciBzb21lLCBidXQgbm90IGZvciBvdGhlcnMuwqAgVG8gYmUgY2xlYXIsIHdlIHdvdWxkIA0K
PiB1c2UgdGhlIHNhbWUgd29ya2dyb3VwLCBqdXN0IGhhdmUgYWx0ZXJuYXRlIG1lZXRpbmcgdGlt
ZXMuDQo+IA0KPiBGaXJzdCwgbGV0J3MgZmluZCBhIHRpbWUgdGhhdCB3b3JrcyBmb3IgQXVzdHJh
bGlhLCBBc2lhLCBhbmQgRXVyb3BlLsKgIA0KPiBJJ3ZlIHNlZW4gcGFydGljaXBhdGlvbiBhbmQg
Y29udGludWVkIGludGVyZXN0IGZyb20gZm9sa3MgaW4gdGhvc2UgdGltZSANCj4gem9uZXMuIEJl
Y2F1c2UgdGhlIGN1cnJlbnQgbWVldGluZyB0aW1lIGlzIGJhZCBmb3IgdGhlbSwgbGV0J3MgZXN0
YWJsaXNoIA0KPiBhbHRlcm5hdGUgdGltZXMuDQo+IA0KPiBTZWNvbmQsIEkgYW0gdGhpbmtpbmcg
d2UgY291bGQgZXN0YWJsaXNoIGFsdGVybmF0aW5nIG1lZXRpbmcgdGltZXMuIFdlIA0KPiB3aWxs
IG5vdCBmaW5kIGEgdGltZSB0aGF0IHdvcmtzIGZvciBldmVyeW9uZS7CoCBJIHRyeSB0byBhY2Nv
bW1vZGF0ZSANCj4gZm9sa3Mgd2hvIGNhbm5vdCBhdHRlbmQgYnkgd3JpdGluZyBhIHN1bW1hcnkg
b2YgdGhlIHRvcGljcyBhbmQgDQo+IGNvbmNsdXNpb25zLCBhbmQgYnkgcHVzaGluZyB0aGUgd29y
ayBiYWNrIG91dCBpbnRvIHRoaXMgZW1haWwgbGlzdC7CoCBCdXQgDQo+IHRoYXQgaXMgbm90IHRo
ZSBzYW1lIGFzIGF0dGVuZGluZyBhIG1lZXRpbmcuwqAgSSBmZWVsIHRoYXQgdGhlIG1lZXRpbmdz
IA0KPiBmb3N0ZXIgYmV0dGVyIHJlc3BvbnNlcyBhbmQgbW9yZSBwYXJ0aWNpcGF0aW9uIHRoYW4g
dXNpbmcgdGhlIGVtYWlsIGxpc3QgDQo+IGFsb25lLsKgIEZvciB0aGF0IHJlYXNvbiwgSSB3YW50
IHRvIGNvbnRpbnVlIHRvIG1lZXQuwqAgSGVuY2UsIEkgYW0gDQo+IHByb3Bvc2luZyBhbHRlcm5h
dGluZyBtZWV0aW5nIHRpbWVzLg0KDQpXaGF0IHRpbWVzIHNwZWNpZmljYWxseT8gSSdtIGludGVy
ZXN0ZWQsIGFuZCBJJ20gaW4gQUNEVCAoVVRDKzEwOjMwKS4gVW5sZXNzDQp3ZSBoYXZlIHBlb3Bs
ZSBpbiBOWiwgSSBzdXNwZWN0IHRoZSBiZXN0IHRpbWUgaXMgc29tZXRpbWUgaW4gbXkgYWZ0ZXJu
b29uDQpmb3IgQXNpYSBhbmQgRXVyb3BlLiBUaHVyc2RheSBvciBGcmlkYXkgYWZ0ZXIgMTQzMGgg
QUNEVCB3b3VsZCB3b3JrIGJlc3QNCmZvciBtZS4NCg0KQW5kcmV3DQoNCg==

