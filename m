Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6424C8E8
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 10:04:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TvVv2hBdzDrCv
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 18:04:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 1802 seconds by postgrey-1.36 at bilbo;
 Thu, 20 Jun 2019 18:00:31 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TvPq4zb6zDr9v
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 18:00:31 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id x5K7Kmma014242
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 15:20:48 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x5K7KDXr014182;
 Thu, 20 Jun 2019 15:20:14 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 20 Jun
 2019 15:29:55 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Thu, 20 Jun
 2019 15:29:55 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Thu, 20 Jun 2019 15:29:53 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>
Subject: RE: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Topic: [PATCH 1/2] i2c: aspeed: allow to customize base clock divisor
Thread-Index: AQHVJuImmMOIiyHRlUqwfYHYZy+Y4aai9yiAgAASyACAARtXMA==
Date: Thu, 20 Jun 2019 07:29:53 +0000
Message-ID: <c610ecede7494c189a92a9a3f6d0fd16@TWMBX02.aspeed.com>
References: <20190619205009.4176588-1-taoren@fb.com>
 <CAFd5g45TMtXcuqONdkpN_K+c0O+wUw8wkGzcQfV+sO8p5Krc9w@mail.gmail.com>
 <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
In-Reply-To: <18565fcf-3dc1-b671-f826-e4417e4ad284@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x5K7KDXr014182
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gVGFvLA0KCU91ciByZWNvbW1lbmQgYWJvdXQgY2xrIGRpdmlkZXIgc2V0dGluZyBpcyBm
b2xsb3cgdGhlIGRhdGFzaGVldCBjbG9jayBzZXR0aW5nIHRhYmxlIGZvciBjbG9jayBkaXZpc29y
LiANCg0KUnlhbiAgDQogDQoJDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBM
aW51eC1hc3BlZWQgW21haWx0bzpsaW51eC1hc3BlZWQtYm91bmNlcytyeWFuX2NoZW49YXNwZWVk
dGVjaC5jb21AbGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mIFRhbyBSZW4NClNlbnQ6IFRo
dXJzZGF5LCBKdW5lIDIwLCAyMDE5IDY6MzMgQU0NClRvOiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5k
YW5oaWdnaW5zQGdvb2dsZS5jb20+DQpDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT47IGRldmljZXRyZWUgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgbGludXgtYXNw
ZWVkQGxpc3RzLm96bGFicy5vcmc7IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTGludXggQVJNIDxs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBsaW51eC1pMmNAdmdlci5rZXJu
ZWwub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gaTJjOiBhc3BlZWQ6IGFsbG93IHRvIGN1
c3RvbWl6ZSBiYXNlIGNsb2NrIGRpdmlzb3INCg0KT24gNi8xOS8xOSAyOjI1IFBNLCBCcmVuZGFu
IEhpZ2dpbnMgd3JvdGU6DQo+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDI6MDAgUE0gVGFvIFJl
biA8dGFvcmVuQGZiLmNvbT4gd3JvdGU6DQo+Pg0KPj4gU29tZSBpbnRlcm1pdHRlbnQgSTJDIHRy
YW5zYWN0aW9uIGZhaWx1cmVzIGFyZSBvYnNlcnZlZCBvbiBGYWNlYm9vayANCj4+IENNTSBhbmQg
TWluaXBhY2sgKGFzdDI1MDApIEJNQyBwbGF0Zm9ybXMsIGJlY2F1c2Ugc2xhdmUgZGV2aWNlcyAo
c3VjaCANCj4+IGFzIENQTEQsIEJJQyBhbmQgZXRjLikgTkFDSyB0aGUgYWRkcmVzcyBieXRlIHNv
bWV0aW1lcy4gVGhlIGlzc3VlIGNhbiANCj4+IGJlIHJlc29sdmVkIGJ5IGluY3JlYXNpbmcgYmFz
ZSBjbG9jayBkaXZpc29yIHdoaWNoIGFmZmVjdHMgQVNQRUVEIEkyQyANCj4+IENvbnRyb2xsZXIn
cyBiYXNlIGNsb2NrIGFuZCBvdGhlciBBQyB0aW1pbmcgcGFyYW1ldGVycy4NCj4+DQo+PiBUaGlz
IHBhdGNoIGFsbG93cyB0byBjdXN0b21pemUgQVNQRUVEIEkyQyBDb250cm9sbGVyJ3MgYmFzZSBj
bG9jayANCj4+IGRpdmlzb3IgaW4gZGV2aWNlIHRyZWUuDQo+IA0KPiBGaXJzdCBvZmYsIGFyZSB5
b3Ugc3VyZSB5b3UgYWN0dWFsbHkgbmVlZCB0aGlzPw0KPiANCj4gWW91IHNob3VsZCBiZSBhYmxl
IHRvIGFjaGlldmUgYW4gZWZmZWN0aXZlbHkgZXF1aXZhbGVudCByZXN1bHQgYnkganVzdCANCj4g
bG93ZXJpbmcgdGhlIGBidXMtZnJlcXVlbmN5YCBwcm9wZXJ0eSBzcGVjaWZpZWQgaW4gdGhlIERU
LiBUaGUgDQo+IGBidXMtZnJlcXVlbmN5YCBwcm9wZXJ0eSB1bHRpbWF0ZWx5IGRldGVybWluZXMg
YWxsIHRoZSByZWdpc3RlciANCj4gdmFsdWVzLCBhbmQgeW91IHNob3VsZCBiZSBhYmxlIHRvIHNl
dCBpdCB0byB3aGF0ZXZlciB5b3Ugd2FudCBieSANCj4gcmVmZXJpbmcgdG8gdGhlIEFzcGVlZCBk
b2N1bWVudGF0aW9uLg0KPiANCj4gTmV2ZXJ0aGVsZXNzLCB0aGUgY29kZSB0aGF0IGRldGVybWlu
ZXMgdGhlIGNvcnJlY3QgZGl2aWRlcnMgZnJvbSB0aGUgDQo+IGZyZXF1ZW5jeSBpcyBiYXNlZCBv
biB0aGUgdGFibGVzIGluIHRoZSBBc3BlZWQgZG9jdW1lbnRhdGlvbi4gSSBkb24ndCANCj4gdGhp
bmsgdGhlIGVxdWF0aW9uIG1ha2VzIHNlbnNlIHdoZW4gdGhlIGJhc2VfY2xrX2Rpdmlzb3IgaXMg
Zml4ZWQ7IEkgDQo+IG1lYW4gaXQgd2lsbCBwcm9iYWJseSBqdXN0IHNldCB0aGUgb3RoZXIgZGl2
aXNvciB0byBtYXggb3IgbWluIA0KPiBkZXBlbmRpbmcgb24gdGhlIHZhbHVlcyBjaG9zZW4uIEkg
dGhpbmsgaWYgc29tZW9uZSByZWFsbHkgd2FudHMgdG8gDQo+IHByb2dyYW0gdGhpcyBwYXJhbWV0
ZXIgbWFudWFsbHksIHRoZXkgcHJvYmFibHkgd2FudCB0byBzZXQgdGhlIG90aGVyIA0KPiBwYXJh
bWV0ZXJzIG1hbnVhbGx5IHRvby4NClRoYW5rIHlvdSBmb3IgdGhlIHF1aWNrIHJlc3BvbnNlLCBC
cmVuZGFuLg0KDQpBc3BlZWQgSTJDIGJ1cyBmcmVxdWVuY3kgaXMgZGVmaW5lZCBieSAzIHBhcmFt
ZXRlcnMgKGJhc2VfY2xrX2Rpdmlzb3IsIGNsa19oaWdoX3dpZHRoLCBjbGtfbG93X3dpZHRoKSwg
YW5kIEkgY2hvb3NlIGJhc2VfY2xrX2Rpdmlzb3IgYmVjYXVzZSBpdCBjb250cm9scyBhbGwgdGhl
IEFzcGVlZCBJMkMgdGltaW5ncyAoc3VjaCBhcyBzZXR1cCB0aW1lIGFuZCBob2xkIHRpbWUpLiBP
bmNlIGJhc2VfY2xrX2Rpdmlzb3IgaXMgZGVjaWRlZCAoZWl0aGVyIGJ5IHRoZSBjdXJyZW50IGxv
Z2ljIGluIGkyYy1hc3BlZWQgZHJpdmVyIG9yIG1hbnVhbGx5IHNldCBpbiBkZXZpY2UgdHJlZSks
IGNsa19oaWdoX3dpZHRoIGFuZCBjbGtfbG93X3dpZHRoIHdpbGwgYmUgY2FsY3VsYXRlZCBieSBp
MmMtYXNwZWVkIGRyaXZlciB0byBtZWV0IHRoZSBzcGVjaWZpZWQgSTJDIGJ1cyBzcGVlZC4NCg0K
Rm9yIGV4YW1wbGUsIGJ5IHNldHRpbmcgSTJDIGJ1cyBmcmVxdWVuY3kgdG8gMTAwS0h6IG9uIEFT
VDI1MDAgcGxhdGZvcm0sIChiYXNlX2Nsb2NrX2Rpdmlzb3IsIGNsa19oaWdoX3dpZHRoLCBjbGtf
bG93X3dpZHRoKSBpcyBzZXQgdG8gKDMsIDE1LCAxNCkgYnkgb3VyIGRyaXZlci4gQnV0IHNvbWUg
c2xhdmUgZGV2aWNlcyAob24gQ01NIGkyYy04IGFuZCBNaW5pcGFjayBpMmMtMCkgTkFDSyBieXRl
IHRyYW5zYWN0aW9ucyB3aXRoIHRoZSBkZWZhdWx0IHRpbWluZyBzZXR0aW5nOiB0aGUgaXNzdWUg
Y2FuIGJlIHJlc29sdmVkIGJ5IHNldHRpbmcgYmFzZV9jbGtfZGl2aXNvciB0byA0LCBhbmQgKGNs
a19oaWdoX3dpZHRoLCBjbGtfbG93X3dpZHRoKSB3aWxsIGJlIHNldCB0byAoNywgNykgYnkgb3Vy
IGkyYy1hc3BlZWQgZHJpdmVyIHRvIGFjaGlldmUgc2ltaWxhciBJMkMgYnVzIHNwZWVkLg0KDQpO
b3Qgc3VyZSBpZiBteSBhbnN3ZXIgaGVscHMgdG8gYWRkcmVzcyB5b3VyIGNvbmNlcm5zLCBidXQg
a2luZGx5IGxldCBtZSBrbm93IGlmIHlvdSBoYXZlIGZ1cnRoZXIgcXVlc3Rpb25zL3N1Z2dlc3Rp
b25zLg0KDQoNClRoYW5rcywNCg0KVGFvDQo=
