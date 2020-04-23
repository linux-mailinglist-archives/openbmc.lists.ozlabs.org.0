Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954C1B644D
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 21:11:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Rk073x9zDr4N
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 05:11:36 +1000 (AEST)
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
 header.s=mimecast20170203 header.b=eyIgIHuU; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=eyIgIHuU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497RdG3VLTzDr4D
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 05:07:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1587668841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/QjpyKM7wrqj0+QWz811j+VPIYp5y5GJUxCPSOuXywY=;
 b=eyIgIHuUb0k5ktQZXBSntiNSMAL4slfeLHqYm+7xz4kZUimL5xfjONv/7+6TkStI2lETpg
 b5CNLMRjHFxLqZXPoad/+pcnPLJmxhbSCRJmWF6+c1/lDN+GoVrr77DO6Ec1b0Kuzs3as8
 m7NBuGwoFf15AAJvhrSqH1PKBLEmmkY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1587668841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/QjpyKM7wrqj0+QWz811j+VPIYp5y5GJUxCPSOuXywY=;
 b=eyIgIHuUb0k5ktQZXBSntiNSMAL4slfeLHqYm+7xz4kZUimL5xfjONv/7+6TkStI2lETpg
 b5CNLMRjHFxLqZXPoad/+pcnPLJmxhbSCRJmWF6+c1/lDN+GoVrr77DO6Ec1b0Kuzs3as8
 m7NBuGwoFf15AAJvhrSqH1PKBLEmmkY=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-ydsWlmRTOReBaKb1hxlc-w-1; Thu, 23 Apr 2020 15:07:18 -0400
X-MC-Unique: ydsWlmRTOReBaKb1hxlc-w-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Thu, 23 Apr 2020 12:07:16 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Thu, 23 Apr 2020 12:07:16 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Remove default private image signing key from openbmc [was: Security
 Working Group meeting - Wednesday April 15 - results]
Thread-Topic: Remove default private image signing key from openbmc [was:
 Security Working Group meeting - Wednesday April 15 - results]
Thread-Index: AdYZomZk0bzi8hwbSdWvDaWJ5cuKAg==
Date: Thu, 23 Apr 2020 19:07:15 +0000
Message-ID: <3238f1802a0646cfab824a7a83fd7759@SCL-EXCHMB-13.phoenix.com>
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

SG93IGRvZXMgT3BlbkJNQyBrZWVwIHRoZSBwdWJsaWNrZXksIHRoYXQgaXMgZ2VuZXJhdGVkIGZy
b20gdGhlIHByaXZhdGUgaW1hZ2Ugc2lnbmluZyBrZXkgKGkuZS4gT3BlbkJNQy5wcml2KSwgIGlu
IHRoZSBTUEkgaW1hZ2UgYW5kIGluIHRoZSB1cGdyYWRlIGZpbGVzPw0KQWxzbyBob3cgZG9lcyBP
cGVuQk1DIHZlcmlmeSB0aGF0IHVwZ3JhZGUgaW1hZ2VzIGFyZSBwcm9wZXJseSBzaWduZWQ/DQpJ
cyB0aGVyZSBhIGRvY3VtZW50IGRlc2NyaWJpbmcgaG93IGFsbCBvZiB0aGlzIHdvcmtzIHRoYXQg
SSBoYXZlIHlldCB0byBmaW5kPw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IG9wZW5ibWMgW21haWx0bzpvcGVuYm1jLQ0KPiBib3VuY2VzK2JydWNlX21pdGNoZWxsPXBo
b2VuaXguY29tQGxpc3RzLm96bGFicy5vcmddIE9uIEJlaGFsZiBPZg0KPiBKb3NlcGggUmV5bm9s
ZHMNCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAxNSwgMjAyMCAxMTo0OQ0KPiBUbzogb3BlbmJt
Yw0KPiBTdWJqZWN0OiBSZTogU2VjdXJpdHkgV29ya2luZyBHcm91cCBtZWV0aW5nIC0gV2VkbmVz
ZGF5IEFwcmlsIDE1IC0NCj4gcmVzdWx0cw0KPiANCj4gT24gNC8xNC8yMCA0OjU3IFBNLCBKb3Nl
cGggUmV5bm9sZHMgd3JvdGU6DQo+ID4gVGhpcyBpcyBhIHJlbWluZGVyIG9mIHRoZSBPcGVuQk1D
IFNlY3VyaXR5IFdvcmtpbmcgR3JvdXAgbWVldGluZw0KPiA+IHNjaGVkdWxlZCBmb3IgdGhpcyBX
ZWRuZXNkYXkgQXByaWwgMTUgYXQgMTA6MDBhbSBQRFQuDQo+IA0KPiBUaGUgbWVldGluZyB3YXMg
aGVsZCwgYW5kIG1pbnV0ZXMgYXJlIGxpbmtlZCBvZmYgdGhlIHdpa2kgcGFnZS4NCj4gQSBmb3Vy
dGggYWdlbmRhIGl0ZW0gd2FzIGFkZGVkLsKgIEEgc3VtbWFyeSBpcyBiZWxvdy4NCj4gDQo+IC0g
Sm9zZXBoDQo+IA0KPiA+DQo+ID4gV2UnbGwgZGlzY3VzcyBjdXJyZW50IGRldmVsb3BtZW50IGl0
ZW1zLCBhbmQgYW55dGhpbmcgZWxzZSB0aGF0IGNvbWVzDQo+IHVwLg0KPiA+DQo+ID4gVGhlIGN1
cnJlbnQgdG9waWNzOg0KPiA+DQo+ID4gMS4gUmVtb3ZlIGRlZmF1bHQgcHJpdmF0ZSBpbWFnZSBz
aWduaW5nIGtleSBmcm9tIG9wZW5ibWMNCj4gDQo+IFRoZSBsZWFkaW5nIGlkZWEgaXMgdG8gZGlz
YWJsZSB0aGUgcmVjaXBlIHRoYXQgc2lnbnMgdGhlIGltYWdlLCBidXQNCj4gbGVhdmUgdGhlIHBy
aXZhdGUgc2lnbmluZyBrZXkgaW4gdGhlIHNvdXJjZSB0cmVlLsKgIFRoZW4gc29tZW9uZSB3aG8N
Cj4gYnVpbGRzIHdpbGwgZ2V0IGFuIHVuc2lnbmVkIGltYWdlLsKgIElmIHRoZXkgZW5hYmxlIHRo
ZSBpbWFnZSBzaWduaW5nDQo+IHJlY2lwZSBvciB1c2UgaXQgYXMgYW4gZXhhbXBsZSwgdGhleSB3
aWxsIGhvcGVmdWxseSBzZWUgdGhlIGluc3RydWN0aW9ucw0KPiB0aGF0IHNheSB0byB1c2UgdGhl
aXIgb3duIGtleSBwYWlyLg0KPiANCj4gTm90ZSB0aGF0IGFuIHVuc2lnbmVkIGltYWdlIGlzIGEg
Z29vZCBzdGFydGluZyBwb2ludCBmb3IgYnVpbGQgcHJvY2Vzc2VzDQo+IHRoYXQgdXNlIGEgc2Vw
YXJhdGUgaW1hZ2Ugc2lnbmluZyBzdGVwLCBzdWNoIGFzIHdoZW4gdGhlIGltYWdlIGlzIHNpZ25l
ZA0KPiBieSBhIGhhcmR3YXJlIHNlY3VyaXR5IG1vZHVsZSAoSFNNKS7CoCBPbmUgZGlmZmljdWx0
eSB3aXRoIHRoaXMgYXBwcm9hY2gNCj4gaXMgdGhhdCB0aGUgcHVibGljIGtleSBuZWVkcyB0byBi
ZSBwdXQgaW50byB0aGUgQk1DJ3Mgcm9vdCBmaWxlIHN5c3RlbS4NCj4gDQo+IEZvbGxvd3VwIGlu
IHRoZSBlbWFpbCBsaXN0IG9yDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMv
aXNzdWVzLzM2MTUNCj4gDQo+ID4NCj4gPiAyLiBEaXNjdXNzIGlzc3VlcyBmcm9tIHRoZSDigJxp
cG1pIHBhc3N3b3JkIHN0b3JhZ2XigJ0gZW1haWwgdGhyZWFkLg0KPiANCj4gV2UgcHJldHR5IG11
Y2ggcmUtaGFzaGVkIHRoZSBpZGVhcyBmcm9tIHRoZSBlbWFpbCB0aHJlYWQgd2l0aCBubw0KPiBj
b25jbHVzaW9ucy4NCj4gT25lIG1vcmUgaWRlYSB3YXMgYWRkZWQsIHRoYXQgd2UgY2FuIHRoZSBC
TUMncyBUUE0gdG8gaG9sZCB0aGUgUk1DUCsNCj4ga2V5cy4NCj4gDQo+ID4NCj4gPiAzLiBXaGlj
aCBhbGdvcml0aG0gc2hvdWxkIHNpZ24gT3BlbkJNQyBpbWFnZXM/DQo+IA0KPiBUaGUgYW5zd2Vy
IHdpbGwgdmFyeSBiZXR3ZWVuIHByb2plY3RzIHRoYXQgYXJlIGRvd25zdHJlYW0gZnJvbQ0KPiBP
cGVuQk1DLg0KPiBXZSdsbCBrZWVwIHRoZSBkZWZhdWx0IGFzIFJTQS1TSEEyNTYuwqAgR29pbmcg
Zm9yd2FyZCwgdGhlIHBsYW4gaXM6IHRoZQ0KPiBPcGVuQk1DIHJlbGVhc2UgcHJvY2VzcyB3aWxs
IGdpdmUgdmlzaWJpbGl0eSB0byB0aGlzIGFuZCBvdGhlciBjaXBoZXJzIHBlcjoNCj4gaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL1NlY3VyaXR5LXdvcmtpbmctDQo+IGdy
b3VwI3NlY3VyaXR5LWVuZC1vZi1yZWxlYXNlLWNoZWNrbGlzdA0KPiANCj4gDQo+IDQuIFVzZSB0
aGUgWW9jdG8gY3ZlY2hlY2sgdnVsbmVyYWJpbGl0eSBzY2FuIGZvciBPcGVuQk1DIHJlcG9zIE5v
IENWRQ0KPiBjaGVja2luZyBpcyBkb25lIGF0IHRoZSBwcm9qZWN0LWxldmVsLCBidXQgc2ltaWxh
ciBjaGVjayBhcmUgYmVpbmcgZG9uZQ0KPiBpbiBwcm9qZWN0cyB0aGF0IGFyZSBkb3duc3RyZWFt
IGZyb20gT3BlbkJNQy4gVGhlIGlkZWEgaXMgYSBuaWdodGx5DQo+IEplbmtpbnMgam9iIHRvIGdl
bmVyYXRlIGEgcmVwb3J0IG9mIGFsbCB0aGUgdW5maXhlZCB2dWxuZXJhYmlsaXRpZXMsDQo+IHNv
bWV0aGluZyBsaWtlOiBiaXRiYWtlIC1jIGN2ZWNoZWNrIG9ibWMtcGhvc3Bob3ItaW1hZ2UuDQo+
ID4NCj4gPiBBY2Nlc3MsIGFnZW5kYSwgYW5kIG5vdGVzIGFyZSBpbiB0aGUgd2lraToNCj4gPg0K
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9TZWN1cml0eS13b3Jr
aW5nLWdyb3VwDQo+ID4NCj4gPiAtIEpvc2VwaA0KDQo=

