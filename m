Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE11D1DC3
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 20:45:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MkBd6fphzDqSh
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 04:45:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=MRikYR9R; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=MRikYR9R; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mk9r33dHzDqDQ
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 04:44:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1589395484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5EWec/KbYnnHY7ZWnMdpJzixoxR8a2CuYg8E5hlnPg=;
 b=MRikYR9RstbK2k1QpusuFqk83UV7zoG/lgSl03SsOnH4yLZgXmLZ5TgckqdEoKsbvpe03Z
 sHcVDsZyn1WqlYlT56XZVL5yjjahEu7zitDPjBNI2Ysx0no3bmjYn5A9seGdtYKd3i9Nbc
 ndyIOVRe8GK+AKFUvYn29lnAMSXUq1A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1589395484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5EWec/KbYnnHY7ZWnMdpJzixoxR8a2CuYg8E5hlnPg=;
 b=MRikYR9RstbK2k1QpusuFqk83UV7zoG/lgSl03SsOnH4yLZgXmLZ5TgckqdEoKsbvpe03Z
 sHcVDsZyn1WqlYlT56XZVL5yjjahEu7zitDPjBNI2Ysx0no3bmjYn5A9seGdtYKd3i9Nbc
 ndyIOVRe8GK+AKFUvYn29lnAMSXUq1A=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-J0WPveJWMY2ZQH0b5F80Zg-1; Wed, 13 May 2020 14:43:31 -0400
X-MC-Unique: J0WPveJWMY2ZQH0b5F80Zg-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 13 May 2020 11:43:28 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 13 May 2020 11:43:28 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, 
 Manojkiran Eda <manojeda@in.ibm.com>
Subject: RE: Security workgroup meeting times
Thread-Topic: Security workgroup meeting times
Thread-Index: AQHV1TkuiI2dSVrIgU2C5g2th6mzBqindFOA//+N+2A=
Date: Wed, 13 May 2020 18:43:27 +0000
Message-ID: <3a5d85c078c64a0e9bd57a31b9096207@SCL-EXCHMB-13.phoenix.com>
References: <66647c93-56c8-f64f-4e13-abe1c703f8f7@linux.ibm.com>
 <27d0f3fb-98b9-0a5b-f682-40f95142748c@linux.ibm.com>
In-Reply-To: <27d0f3fb-98b9-0a5b-f682-40f95142748c@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
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
IG9wdGlvbnMuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJt
YyBbbWFpbHRvOm9wZW5ibWMtDQo+IGJvdW5jZXMrYnJ1Y2VfbWl0Y2hlbGw9cGhvZW5peC5jb21A
bGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mDQo+IEpvc2VwaCBSZXlub2xkcw0KPiBTZW50
OiBXZWRuZXNkYXksIE1heSAxMywgMjAyMCAxMTozMQ0KPiBUbzogb3BlbmJtYzsgTWFub2praXJh
biBFZGENCj4gU3ViamVjdDogU2VjdXJpdHkgd29ya2dyb3VwIG1lZXRpbmcgdGltZXMNCj4gDQo+
IFJlLXNlbmRpbmcgdGhpcyBlbWFpbCB0byByZWZyZXNoIHRoaXMgdG9waWMuDQo+IA0KPiBMb29r
aW5nIGZvciBhIHNwZWNpZmljIHRpbWUgYW5kIGlkZWFsbHkgc29tZW9uZSB0byBydW4gdGhlIG1l
ZXRpbmcuDQo+IFNlZSB0aGUgcmVwbGllcyBpbiB0aGUgYXJjaGl2ZSBoZXJlOg0KPiBodHRwczov
L2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5ibWMvMjAyMC1KYW51YXJ5DQo+IA0KPiAt
IEpvc2VwaA0KPiANCj4gLS0tLS0tLS0gRm9yd2FyZGVkIE1lc3NhZ2UgLS0tLS0tLS0NCj4gU3Vi
amVjdDogCVNlY3VyaXR5IHdvcmtncm91cCBtZWV0aW5nIHRpbWVzDQo+IERhdGU6IAlNb24sIDI3
IEphbiAyMDIwIDExOjQyOjA0IC0wNjAwDQo+IEZyb206IAlKb3NlcGggUmV5bm9sZHMgPGpyZXlA
bGludXguaWJtLmNvbT4NCj4gVG86IAlvcGVuYm1jIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+
DQo+IA0KPiANCj4gDQo+IFRlYW0sDQo+IA0KPiBMZXQncyB0cnkgYWdhaW4gdG8gZXN0YWJsaXNo
IGFub3RoZXIgT3BlbkJNQyBTZWN1cml0eSBXb3JrZ3JvdXANCj4gbWVldGluZw0KPiB0aW1lLsKg
IFRoZSBjdXJyZW50IG1lZXRpbmcgdGltZSAoZXZlcnkgb3RoZXIgd2VlayAxMGFtIFBhY2lmaWMg
RGF5bGlnaHQNCj4gVGltZSkgaXMgd29ya2luZyBmb3Igc29tZSwgYnV0IG5vdCBmb3Igb3RoZXJz
LiBUbyBiZSBjbGVhciwgd2Ugd291bGQgdXNlDQo+IHRoZSBzYW1lIHdvcmtncm91cCwganVzdCBo
YXZlIGFsdGVybmF0ZSBtZWV0aW5nIHRpbWVzLg0KPiANCj4gRmlyc3QsIGxldCdzIGZpbmQgYSB0
aW1lIHRoYXQgd29ya3MgZm9yIEF1c3RyYWxpYSwgQXNpYSwgYW5kIEV1cm9wZS4NCj4gSSd2ZSBz
ZWVuIHBhcnRpY2lwYXRpb24gYW5kIGNvbnRpbnVlZCBpbnRlcmVzdCBmcm9tIGZvbGtzIGluIHRo
b3NlIHRpbWUNCj4gem9uZXMuIEJlY2F1c2UgdGhlIGN1cnJlbnQgbWVldGluZyB0aW1lIGlzIGJh
ZCBmb3IgdGhlbSwgbGV0J3MgZXN0YWJsaXNoDQo+IGFsdGVybmF0ZSB0aW1lcy4NCj4gDQo+IFNl
Y29uZCwgSSBhbSB0aGlua2luZyB3ZSBjb3VsZCBlc3RhYmxpc2ggYWx0ZXJuYXRpbmcgbWVldGlu
ZyB0aW1lcy4gV2UNCj4gd2lsbCBub3QgZmluZCBhIHRpbWUgdGhhdCB3b3JrcyBmb3IgZXZlcnlv
bmUuwqAgSSB0cnkgdG8gYWNjb21tb2RhdGUNCj4gZm9sa3Mgd2hvIGNhbm5vdCBhdHRlbmQgYnkg
d3JpdGluZyBhIHN1bW1hcnkgb2YgdGhlIHRvcGljcyBhbmQNCj4gY29uY2x1c2lvbnMsIGFuZCBi
eSBwdXNoaW5nIHRoZSB3b3JrIGJhY2sgb3V0IGludG8gdGhpcyBlbWFpbCBsaXN0LsKgIEJ1dA0K
PiB0aGF0IGlzIG5vdCB0aGUgc2FtZSBhcyBhdHRlbmRpbmcgYSBtZWV0aW5nLsKgIEkgZmVlbCB0
aGF0IHRoZSBtZWV0aW5ncw0KPiBmb3N0ZXIgYmV0dGVyIHJlc3BvbnNlcyBhbmQgbW9yZSBwYXJ0
aWNpcGF0aW9uIHRoYW4gdXNpbmcgdGhlIGVtYWlsIGxpc3QNCj4gYWxvbmUuwqAgRm9yIHRoYXQg
cmVhc29uLCBJIHdhbnQgdG8gY29udGludWUgdG8gbWVldC7CoCBIZW5jZSwgSSBhbQ0KPiBwcm9w
b3NpbmcgYWx0ZXJuYXRpbmcgbWVldGluZyB0aW1lcy4NCj4gDQo+IFRoaXJkLCBJIGhhdmUgYmVl
biBydW5uaW5nIHRoZSBtZWV0aW5ncy7CoCBJIHBsYW4gdG8gY29udGludWUgdG8gaGFuZGxlDQo+
IHRoZSBTZWN1cml0eSB3b3JrZ3JvdXAgbWVldGluZyBhZ2VuZGEsIGFuZCBjYW4gaGVscCBzZXQg
dXAgdGhlIGluaXRpYWwNCj4gd29ya2dyb3VwIG1lZXRpbmdzIGF0IGFsdGVybmF0ZSB0aW1lcywg
SSB3b3VsZCBub3QgcGxhbiB0byBydW4gdGhlbS7CoCBJDQo+IGhvcGUgeW91IHdpbGwgc29sdmUg
YWxsIHRoZSBzZWN1cml0eSBwcm9ibGVtcyB3aGlsZSBJIGFtIHNsZWVwaW5nLg0KPiBGb3J0dW5h
dGVseSwgcnVubmluZyBtZWV0aW5ncyBpcyBlYXN5OiBqdXN0IGdvIHRocm91Z2ggdGhlIGFnZW5k
YSwNCj4gaW50cm9kdWNlIGVhY2ggaXRlbSwgd2FpdCBmb3IgcGVvcGxlIHRvIHRhbGssIGFuZCBz
dW1tYXJpemUgdGhlDQo+IG91dGNvbWUuwqAgV2UgbmVlZCBhIHZvbHVudGVlciBsZWFkZXIgZm9y
IHRoYXQuDQo+IA0KPiBTZW5kIG1lIHlvdXIgaWRlYXMsDQo+IC0gSm9zZXBoDQo+IA0KPiAuLi5z
bmlwLi4uDQoNCg==

